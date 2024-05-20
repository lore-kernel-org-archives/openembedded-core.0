Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DFEC25B78
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 10:18:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56866.1716200318008119271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 03:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF42BFEC
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:19:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 619413F766
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:18:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] meson: correct the host machine definition in SDKs
Date: Mon, 20 May 2024 10:18:32 +0000
Message-Id: <20240520101833.1798907-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520101833.1798907-1-ross.burton@arm.com>
References: <20240520101833.1798907-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 10:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199567

The SDK_ARCH is not the correct definiton for the host machine definition
inside the SDK, but because a nativesdk recipe doesn't know what the
final target will be these values should be set up at SDK installation
time via the environment script.

Put placeholders in the installed meson.cross file instead, and replace
them at SDK installation time with the correct values.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../meson/meson/meson-setup.py                | 37 +++++++++++++++++++
 meta/recipes-devtools/meson/meson_1.3.1.bb    | 16 ++------
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/reci=
pes-devtools/meson/meson/meson-setup.py
index daaa551de2d..74579ecca6b 100755
--- a/meta/recipes-devtools/meson/meson/meson-setup.py
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py
@@ -1,9 +1,42 @@
 #!/usr/bin/env python3
=20
 import os
+import re
 import string
 import sys
=20
+# Keep these in sync with the logic in meson-routines.bbclass
+def meson_cpu_family():
+    arch =3D os.environ["OECORE_TARGET_ARCH"]
+    if arch =3D=3D 'powerpc':
+        return 'ppc'
+    elif arch =3D=3D 'powerpc64' or arch =3D=3D 'powerpc64le':
+        return 'ppc64'
+    elif arch =3D=3D 'armeb':
+        return 'arm'
+    elif arch =3D=3D 'aarch64_be':
+        return 'aarch64'
+    elif arch =3D=3D 'mipsel':
+        return 'mips'
+    elif arch =3D=3D 'mips64el':
+        return 'mips64'
+    elif re.match(r"i[3-6]86", arch):
+        return "x86"
+    elif arch =3D=3D "microblazeel":
+        return "microblaze"
+    else:
+        return arch
+
+def meson_operating_system():
+    opersys =3D os.environ["OECORE_TARGET_ARCH"]
+    if "mingw" in opersys:
+        return "windows"
+    # avoid e.g 'linux-gnueabi'
+    elif "linux" in opersys:
+        return "linux"
+    else:
+        return opersys
+
 class Template(string.Template):
     delimiter =3D "@"
=20
@@ -30,6 +63,10 @@ cross_file =3D os.path.join(sysroot, 'usr/share/meson/=
%smeson.cross' % os.environ[
 native_template_file =3D os.path.join(sysroot, 'usr/share/meson/meson.na=
tive.template')
 native_file =3D os.path.join(sysroot, 'usr/share/meson/meson.native')
=20
+# Inject transformed values
+os.environ["OECORE_MESON_TARGET_FAMILY"] =3D meson_cpu_family()
+os.environ["OECORE_MESON_TARGET_OS"] =3D meson_operating_system()
+
 with open(template_file) as in_file:
     template =3D in_file.read()
     output =3D Template(template).substitute(Environ())
diff --git a/meta/recipes-devtools/meson/meson_1.3.1.bb b/meta/recipes-de=
vtools/meson/meson_1.3.1.bb
index 5b0d82fe9f5..f8085f369bf 100644
--- a/meta/recipes-devtools/meson/meson_1.3.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.3.1.bb
@@ -117,18 +117,14 @@ needs_exe_wrapper =3D true
 sys_root =3D @OECORE_TARGET_SYSROOT
=20
 [host_machine]
-system =3D '$host_system'
-cpu_family =3D '$host_cpu_family'
-cpu =3D '$host_cpu'
-endian =3D '$host_endian'
+system =3D @OECORE_MESON_TARGET_OS
+cpu_family =3D @OECORE_MESON_TARGET_FAMILY
+cpu =3D @OECORE_TARGET_ARCH
+endian =3D @OECORE_TARGET_ENDIAN
 EOF
 }
=20
 do_install:append:class-nativesdk() {
-    host_system=3D${SDK_OS}
-    host_cpu_family=3D${@meson_cpu_family("SDK_ARCH", d)}
-    host_cpu=3D${SDK_ARCH}
-    host_endian=3D${@meson_endian("SDK", d)}
     install_templates
=20
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
@@ -142,10 +138,6 @@ do_install:append:class-nativesdk() {
 FILES:${PN}:append:class-nativesdk =3D "${datadir}/meson ${SDKPATHNATIVE=
}"
=20
 do_install:append:class-native() {
-    host_system=3D${HOST_OS}
-    host_cpu_family=3D${@meson_cpu_family("HOST_ARCH", d)}
-    host_cpu=3D${HOST_ARCH}
-    host_endian=3D${@meson_endian("HOST", d)}
     install_templates
=20
     install -d ${D}${datadir}/post-relocate-setup.d
--=20
2.34.1


