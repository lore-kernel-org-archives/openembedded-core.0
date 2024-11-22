Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D339D75E59
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 14:22:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25534.1732285324374443463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 06:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E04FB1477
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 06:22:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8319E3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 06:22:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] xserver-xorg: rewrite ABI dependency generation
Date: Fri, 22 Nov 2024 14:21:58 +0000
Message-Id: <20241122142158.2256406-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122142158.2256406-1-ross.burton@arm.com>
References: <20241122142158.2256406-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 14:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207620

This was motivated by remembering that both xserver-xorg and xorgxrdp
need to ignore the xorg-driver-abi test in do_package_qa because the
logic to generate the required dependencies is contained in
xorg-driver-common.inc, so can't be reused easily by the xserver (which
ships the modesetting driver) or xorgxrdp (which ships drivers and more).

Merge both the RPROVIDES (xserver) and RDEPENDS (driver) functions into a
single xserver-abi.inc to ensure that their logic remains in sync.

Generalise the names: instead of hardcoding 'input' and 'video' extract
the ABI names from the pkg-config file directly. This means 'input' is
now 'xinput' and 'video' is now 'videodrv', also 'ansic' and 'extension'
are new ABIs exposed.

Rewrite the RDEPENDS generation so that it is more flexible, and can be
used from inside the xserver-xorg recipe to generate RDEPENDS for the
modesetting driver. This means that recipe can remove the INSANE_SKIP.

There's an argument that this new .inc file could be a bbclass, I'm
undecided on this myself right now and this patch is essentially a
rationalisation of the existing code.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xorg-driver/xorg-driver-common.inc        | 18 +------
 .../xorg-driver/xorg-driver-input.inc         |  2 +-
 .../xorg-driver/xorg-driver-video.inc         |  2 +-
 .../xorg-xserver/xserver-abi.inc              | 48 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg.inc             | 32 +++----------
 5 files changed, 58 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-abi.inc

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/m=
eta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 38848676f41..dd964d466d0 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -20,20 +20,6 @@ inherit_defer ${XORGBUILDCLASS}
 # depends on virtual/xserver
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-# Function to add the relevant ABI dependency to drivers, which should b=
e called
-# from a PACKAGEFUNC.
-def _add_xorg_abi_depends(d, name):
-    # Map of ABI names exposed in the dependencies to pkg-config variabl=
es
-    abis =3D {
-      "video": "abi_videodrv",
-      "input": "abi_xinput"
-    }
-
-    output =3D os.popen("pkg-config xorg-server --variable=3D%s" % abis[=
name]).read()
-    mlprefix =3D d.getVar('MLPREFIX') or ''
-    abi =3D "%sxorg-abi-%s-%s" % (mlprefix, name, output.split(".")[0])
-
-    pn =3D d.getVar("PN")
-    d.appendVar('RDEPENDS:' + pn, ' ' + abi)
-
 SECURITY_LDFLAGS =3D "${SECURITY_X_LDFLAGS}"
+
+require recipes-graphics/xorg-xserver/xserver-abi.inc
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc b/me=
ta/recipes-graphics/xorg-driver/xorg-driver-input.inc
index 4efb90278c5..269a78931e3 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
@@ -1,7 +1,7 @@
 require xorg-driver-common.inc
=20
 python add_xorg_abi_depends() {
-    _add_xorg_abi_depends(d, "input")
+    _add_xorg_abi_depends(d, "xinput")
 }
 PACKAGEFUNCS =3D+ "add_xorg_abi_depends"
=20
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc b/me=
ta/recipes-graphics/xorg-driver/xorg-driver-video.inc
index c9365d8954a..18441210c2e 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
@@ -1,6 +1,6 @@
 require xorg-driver-common.inc
=20
 python add_xorg_abi_depends() {
-    _add_xorg_abi_depends(d, "video")
+    _add_xorg_abi_depends(d, "videodrv")
 }
 PACKAGEFUNCS =3D+ "add_xorg_abi_depends"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-abi.inc b/meta/re=
cipes-graphics/xorg-xserver/xserver-abi.inc
new file mode 100644
index 00000000000..9731185649a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-abi.inc
@@ -0,0 +1,48 @@
+# Add runtime provides for the ABI versions, so that drivers can depend =
on the
+# relevant version. This should be called from PACKAGEFUNCS.
+python add_xorg_abi_provides() {
+    import subprocess
+
+    pn =3D d.getVar("PN")
+    mlprefix =3D d.getVar("MLPREFIX") or ""
+
+    # Set PKG_CONFIG_PATH so pkg-config looks at the .pc files that are =
going
+    # into the new package, not the staged ones.
+    newenv =3D dict(os.environ)
+    newenv["PKG_CONFIG_PATH"] =3D d.expand("${PKGD}${libdir}/pkgconfig/:=
") + newenv["PKG_CONFIG_PATH"]
+
+    # Get the list of ABIs that the pc file declares
+    cmd =3D ("pkg-config", "--print-variables", "xorg-server")
+    output =3D subprocess.run(cmd, check=3DTrue, capture_output=3DTrue, =
text=3DTrue, env=3Dnewenv).stdout
+    abis =3D [var for var in output.splitlines() if var.startswith("abi_=
")]
+
+    # Set RPROVIDES for those ABIs with the major version
+    for abi in abis:
+        cmd =3D ("pkg-config", "--variable", abi, "xorg-server")
+        version =3D subprocess.run(cmd, check=3DTrue, capture_output=3DT=
rue, text=3DTrue, env=3Dnewenv).stdout
+        major =3D version.split(".")[0]
+
+        provides =3D " %sxorg-%s-%s" % (mlprefix, abi.replace("_", "-"),=
 major)
+        d.appendVar("RPROVIDES:" + pn, provides)
+}
+
+# Add the specified ABI dependency to the specified package.
+# If package is not set then PN is used.
+# This should be called via a shim function in PACKAGEFUNCS.
+def _add_xorg_abi_depends(d, abi, package=3DNone):
+    import subprocess
+
+    if not package:
+        package =3D d.getVar("PN")
+
+    # Set PKG_CONFIG_PATH to cater for the case where xserver is
+    # itself providing drivers.
+    newenv =3D dict(os.environ)
+    newenv["PKG_CONFIG_PATH"] =3D d.expand("${PKGD}${libdir}/pkgconfig/:=
") + newenv["PKG_CONFIG_PATH"]
+
+    mlprefix =3D d.getVar("MLPREFIX") or ""
+    cmd =3D ("pkg-config", "xorg-server", "--variable=3Dabi_%s" % abi)
+    output =3D subprocess.run(cmd, text=3DTrue, capture_output=3DTrue, c=
heck=3DTrue, env=3Dnewenv).stdout
+    abi =3D "%sxorg-abi-%s-%s" % (mlprefix, abi, output.split(".")[0])
+
+    d.appendVar('RDEPENDS:' + package, ' ' + abi)
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
index e2754426cf1..3eb0de7b353 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -79,7 +79,6 @@ PACKAGES =3D+ "${PN}-sdl \
              xf86-video-modesetting"
=20
 SUMMARY:xf86-video-modesetting =3D "X.Org X server -- modesetting displa=
y driver"
-INSANE_SKIP:${MLPREFIX}xf86-video-modesetting =3D "xorg-driver-abi"
=20
 XSERVER_RDEPENDS =3D "xkeyboard-config rgb xserver-xf86-config xkbcomp x=
f86-input-libinput"
 RDEPENDS:${PN} +=3D "${XSERVER_RDEPENDS}"
@@ -149,31 +148,12 @@ do_install:append () {
         sed -i -e 's,${libdir}/xorg/modules,${prefix}/lib*/xorg/modules,=
' ${D}${mandir}/man5/xorg.conf.5
 }
=20
-# Add runtime provides for the ABI versions of the video and input subsy=
stems,
-# so that drivers can depend on the relevant version.
-python populate_packages:prepend() {
-    import subprocess
-
-    # Set PKG_CONFIG_PATH so pkg-config looks at the .pc files that are =
going
-    # into the new package, not the staged ones.
-    newenv =3D dict(os.environ)
-    newenv["PKG_CONFIG_PATH"] =3D d.expand("${PKGD}${libdir}/pkgconfig/"=
)
-
-    def get_abi(name):
-        abis =3D {
-          "video": "abi_videodrv",
-          "input": "abi_xinput"
-        }
-        p =3D subprocess.Popen(args=3D"pkg-config --variable=3D%s xorg-s=
erver" % abis[name],
-                             shell=3DTrue, env=3Dnewenv, stdout=3Dsubpro=
cess.PIPE)
-        stdout, stderr =3D p.communicate()
-        output =3D stdout.decode("utf-8").split(".")[0]
-        mlprefix =3D d.getVar('MLPREFIX') or ''
-        return "%sxorg-abi-%s-%s" % (mlprefix, name, output)
-
-    pn =3D d.getVar("PN")
-    d.appendVar("RPROVIDES:" + pn, " " + get_abi("input"))
-    d.appendVar("RPROVIDES:" + pn, " " + get_abi("video"))
+require xserver-abi.inc
+
+python add_xorg_abi_depends() {
+    _add_xorg_abi_depends(d, "videodrv", d.expand("${MLPREFIX}xf86-video=
-modesetting"))
 }
=20
+PACKAGEFUNCS =3D+ "add_xorg_abi_provides add_xorg_abi_depends"
+
 CVE_STATUS[CVE-2023-5574] =3D "${@bb.utils.contains('PACKAGECONFIG', 'xv=
fb', 'unpatched', 'not-applicable-config: specific to Xvfb', d)}"
--=20
2.34.1


