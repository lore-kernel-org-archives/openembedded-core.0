Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7931.1794564951269539076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 02:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=7ZxdYhSR;
 spf=pass (domain: geanix.com, ip: 185.70.43.170, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794564947; x=1794824147;
	bh=1j7/8LUrrqCgzEek4VqgbgTIFAxFyzthkHlf8B/NsmA=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=7ZxdYhSRfmdphGc6QdJXZTrIq433yvaFGVl7/vs95q1CrRPcLu3rXFQJKTakaWoTN
	 nfzG6Wignj7TzOjrZ6OEpUjxWx4+XuWuh2Ftb4qr6ba6ki1R+WUe17Tlgm8QCO/pdd
	 WC2S6vj3fU6WnlEV0jgwwcG5nP+goaXjIa7hvB42RoA1uqAbf+Zz/eNJDuSCRrysgL
	 SQQP+B5Lw6q+vpSG8dY1L7MHgcwXM0X4g7U8CAkyjmw7cE8r0gLIp19hv2m7DyE+q0
	 Kz1o1bH1vbfxsEepRnXzWaznSV9MaJezb89VpVEDRDGDxypFWs/KZ7lBMyhgf1qEfp
	 QdvGnmRvBCtTQ==
X-Pm-Submission-Id: 4jQtSL1Yjnz1DF5P
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH 1/2] license_image: don't apply INCOMPATIBLE_LICENSE to SDK host tools
Date: Fri, 13 Nov 2026 11:15:36 +0100
Message-ID: <20261113101537.3586467-1-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 10:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250157
Content-Type: text/plain; charset="utf-8"

Since the SDK host and target sysroots are passed through
write_license_files(), do_populate_sdk checks every nativesdk and
cross-canadian package against the image's INCOMPATIBLE_LICENSE and
fails, e.g. with INCOMPATIBLE_LICENSE =3D "GPL-3.0*":

  Some packages cannot be installed into the image because they have
  incompatible licenses:
        nativesdk-autoconf (GPL-3.0-or-later)

At parse time skip_incompatible_package_licenses() exempts these
recipes, so they are built and packaged, and only the SDK manifest
step rejects them. Move that exemption into
incompatible_license_check_needed() and use it in write_license_files()
too, so host tools in the SDK are treated the same way. Target packages
in the image and in the SDK target sysroot are still checked.

Fixes: f757ae4dadab ("license_image: extend to SDK coverage")
AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Patches for the discussion here:
https://lists.openembedded.org/g/openembedded-core/topic/122226717

I would like for this to go into the wrynose branch, but it doesn't
apply as is.

 meta/classes-recipe/license_image.bbclass | 13 +++++++++---
 meta/lib/oe/license.py                    | 25 ++++++++++++++---------
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-rec=
ipe/license_image.bbclass
index 7d00b1ae53..728db8ae3a 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -128,16 +128,23 @@ def write_license_files(d, license_manifest, pkg_di=
c, rootfs):
=20
             pkg_allow_licenses =3D oe.license.filter_pkg_license_list(pk=
g, allow_licenses)
=20
+            # Host tools in the SDK (nativesdk, cross-canadian) are not
+            # subject to INCOMPATIBLE_LICENSE, same as at parse time.
+            if oe.license.incompatible_license_check_needed(d, pkg_dic[p=
kg]["PN"]):
+                pkg_bad_licenses =3D bad_licenses
+            else:
+                pkg_bad_licenses =3D []
+
             if node:
-                if incompatible_licenses :=3D oe.license.license_allowed=
(node, bad_licenses, pkg_allow_licenses):
+                if incompatible_licenses :=3D oe.license.license_allowed=
(node, pkg_bad_licenses, pkg_allow_licenses):
                     incompatible_packages.append("%s (%s)" % (pkg, ' '.j=
oin(n.to_string() for n in incompatible_licenses)))
-                elif incompatible_licenses :=3D oe.license.license_allow=
ed(node, bad_licenses, []):
+                elif incompatible_licenses :=3D oe.license.license_allow=
ed(node, pkg_bad_licenses, []):
                     oe.qa.handle_error('license-exception', "Including %=
s with incompatible license(s) %s into the image, because it has been all=
owed by exception list." %
                                        (pkg, ' '.join(n.to_string() for =
n in incompatible_licenses)), d)
=20
             (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) =3D \
                 oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"],
-                                             bad_licenses, pkg_allow_lic=
enses)
+                                             pkg_bad_licenses, pkg_allow=
_licenses)
=20
             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
                 # Rootfs manifest
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index e2a2bcc47d..035311d469 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -561,23 +561,28 @@ def filter_pkg_license_list(pkg, lst):
=20
     return pkg_lst
=20
+def incompatible_license_check_needed(d, pn):
+    """
+    Return False for recipes that INCOMPATIBLE_LICENSE does not apply to=
:
+    native, nativesdk, cross and cross-canadian recipes, and gcc-source.
+    """
+    if pn.startswith("nativesdk-") or pn.startswith("gcc-source-"):
+        return False
+    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARG=
ET_ARCH}",
+            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
+            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
+        if pn.endswith(d.expand(t)):
+            return False
+    return True
+
 def skip_incompatible_package_licenses(d, pkgs):
     if not pkgs:
         return {}
=20
     pn =3D d.getVar("PN")
=20
-    check_license =3D False if pn.startswith("nativesdk-") else True
-    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARG=
ET_ARCH}",
-            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
-            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
-        if pn.endswith(d.expand(t)):
-            check_license =3D False
-    if pn.startswith("gcc-source-"):
-        check_license =3D False
-
     bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
-    if not check_license or not bad_licenses:
+    if not incompatible_license_check_needed(d, pn) or not bad_licenses:
         return {}
=20
     bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
--=20
2.56.0

