Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3149FC98325
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 15:57:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1731.1790265454512144601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 08:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Qk77VxOL;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68B931E4D
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:57:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C0083F86F
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265453; bh=XfQi1MbTOwCJZq+4iV4tYEmkFKAyHa2jWQWuNnsgHG0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qk77VxOLkKxeqOL8W/Gdt9GTrGVJMZmV7luUfhwZ9Pkki44O6kQf+7rfYfXXEUQzU
	 O+Kck3UFtg5nYPE6TzIliVaeIjOs5dVDKS8DwqOyaCmIWN9BwlYgVGdXRfRK4a/uBr
	 GWSgTEupC+h1kv2wOQ7cIbzELgCNbC4XRr8prHLA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] classes/package: use eu-srcfiles instead of dwarfsrcfiles
Date: Thu, 24 Sep 2026 16:57:27 +0100
Message-ID: <20260924155728.295458-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924155728.295458-1-ross.burton@arm.com>
References: <20260924155728.295458-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 15:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246592

elfutils gained a srcfiles command in 0.190[1], which is essentially the
same as our dwarfsrcfiles.  This obsoletes our dwarfsrcfiles, so change
the packaging class to use it instead of dwarfsrcfiles.

Apart from removing code we need to maintain, eu-srcfiles also has better
output and results in some more source files being identified. Across
a core-image-sato, the following changes occur from more source files
being added to the -src packages:

  curl-src: PKGSIZE changed from 6198005 to 8919864 (+44%)
  flac-src: PKGSIZE changed from 2282162 to 2526447 (+11%)
  libjpeg-turbo-src: PKGSIZE changed from 2673297 to 2977880 (+11%)
  libseccomp-src: PKGSIZE changed from 716039 to 1048204 (+46%)
  sbc-src: PKGSIZE changed from 110274 to 176011 (+60%)

[1] elfutils cb4f0e0f ("PR 30000: debuginfod-find should have a source-li=
st verb")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/package.bbclass |  4 ++--
 meta/lib/oe/package.py              | 28 +++-------------------------
 2 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pa=
ckage.bbclass
index e21350a06f4..b54f4c0063a 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -57,8 +57,8 @@ LOCALE_SECTION ?=3D ''
 ALL_MULTILIB_PACKAGE_ARCHS =3D "${@oe.utils.all_multilib_tune_values(d, =
'PACKAGE_ARCHS')}"
=20
 # rpm is used for the per-file dependency identification
-# dwarfsrcfiles is used to determine the list of debug source files
-PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
+# elfutils is used to determine the list of debug source files (eu-srcfi=
les)
+PACKAGE_DEPENDS +=3D "rpm-native elfutils-native"
=20
 # If your postinstall can execute at rootfs creation time rather than on
 # target but depends on a native/cross tool in order to execute, you nee=
d to
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 777bf99331c..5d4966be295 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -746,15 +746,6 @@ def package_debug_vars(d):
     return debug_vars
=20
=20
-def parse_debugsources_from_dwarfsrcfiles_output(dwarfsrcfiles_output):
-    debugfiles =3D {}
-
-    for line in dwarfsrcfiles_output.splitlines():
-        if line.startswith("\t"):
-            debugfiles[os.path.normpath(line.split()[0])] =3D ""
-
-    return debugfiles.keys()
-
 def source_info(file, d):
     # Skip static libraries when using Clang toolchain with LTO enabled.
     # In this case, .a files contain LLVM bitcode instead of ELF objects=
,
@@ -764,22 +755,9 @@ def source_info(file, d):
             bb.debug(1, "Skipping dwarfsrcfiles for Clang LTO archive: %=
s" % file)
             return []
=20
-    cmd =3D ["dwarfsrcfiles", file]
-    try:
-        output =3D subprocess.check_output(cmd, universal_newlines=3DTru=
e, stderr=3Dsubprocess.STDOUT)
-        retval =3D 0
-    except subprocess.CalledProcessError as exc:
-        output =3D exc.output
-        retval =3D exc.returncode
-
-    # 255 means a specific file wasn't fully parsed to get the debug fil=
e list, which is not a fatal failure
-    if retval !=3D 0 and retval !=3D 255:
-        msg =3D "dwarfsrcfiles failed with exit code %s (cmd was %s)%s" =
% (retval, cmd, ":\n%s" % output if output else "")
-        bb.fatal(msg)
-
-    debugsources =3D parse_debugsources_from_dwarfsrcfiles_output(output=
)
-
-    return list(debugsources)
+    cmd =3D ["eu-srcfiles", "--null", "--debuginfo-path=3D/not/exist", "=
--executable", file]
+    output =3D subprocess.check_output(cmd, text=3DTrue, stderr=3Dsubpro=
cess.STDOUT)
+    return output.split("\0")
=20
 def splitdebuginfo(file, dvar, dv, d):
     # Function to split a single file into two components, one is the st=
ripped
--=20
2.43.0


