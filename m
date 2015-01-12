Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EACB071637
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 00:06:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0C065WO015399
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jan 2015 16:06:05 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 11 Jan 2015 16:06:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 11 Jan 2015 16:06:03 -0800
Message-ID: <08467c89129431bc4873964cf09e7ff865e74ae2.1421021113.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421021113.git.liezhi.yang@windriver.com>
References: <cover.1421021113.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gnu-efi: upgrade to 3.0.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Jan 2015 00:06:12 -0000
Content-Type: text/plain

* Use the official src rather than debian.
* It doesn't have a general license file, the license is embedded in the
  files, which are GPLv2+ & BSD.
* Supported aarch64 and arm.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb |   41 +++++++++++++++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb  |   33 -----------------------
 2 files changed, 41 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
new file mode 100644
index 0000000..9a9c143
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Libraries for producing EFI binaries"
+HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
+SECTION = "devel"
+LICENSE = "GPLv2+ & BSD"
+LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=9;md5=2240d7bbdf0928294c2f4a68b14d6591 \
+                    file://gnuefi/crt0-efi-aarch64.S;beginline=4;endline=16;md5=e582764a4776e60c95bf9ab617343d36 \
+                    file://inc/efishellintf.h;beginline=13;endline=20;md5=202766b79d708eff3cc70fce15fb80c7 \
+                    file://inc/efishellparm.h;beginline=4;endline=11;md5=468b1231b05bbc84bae3a0d5774e3bb5 \
+                    file://lib/arm/div64.S;beginline=6;endline=12;md5=a96c84f5ad12b4f011f98b5d039242f2 \
+                    file://lib/arm/math.c;beginline=4;endline=10;md5=64dd1987cee1dcf59d11aa572cfa644e \
+                    file://lib/arm/initplat.c;beginline=4;endline=10;md5=64dd1987cee1dcf59d11aa572cfa644e \
+                    file://lib/arm/lib1funcs.S;beginline=9;endline=33;md5=f56d5ebbc87136bc66cfe24db82bcf01 \
+                    file://lib/aarch64/math.c;beginline=9;endline=33;md5=cfade4c560e033a7bb02dab282872c7d \
+                    file://lib/aarch64/initplat.c;beginline=9;endline=33;md5=900cb1ffbe3e1ded344102be921830f1 \
+                   "
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
+           file://parallel-make.patch \
+           file://parallel-make-archives.patch \
+          "
+SRC_URI[md5sum] = "c4099c443b6b0c2b04dedc33e7814ec0"
+SRC_URI[sha256sum] = "e2e8d5940347eebfb00eaaeef107a8ba59e7838e40bc716c74d9a36fff648f1f"
+
+COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
+
+def gnu_efi_arch(d):
+    import re
+    tarch = d.getVar("TARGET_ARCH", True)
+    if re.match("i[3456789]86", tarch):
+        return "ia32"
+    return tarch
+
+EXTRA_OEMAKE = "'ARCH=${@gnu_efi_arch(d)}' 'CC=${CC}' 'AS=${AS}' 'LD=${LD}' 'AR=${AR}' \
+                'RANLIB=${RANLIB}' 'OBJCOPY=${OBJCOPY}' 'PREFIX=${prefix}' 'LIBDIR=${libdir}' \
+                "
+
+do_install() {
+        oe_runmake install INSTALLROOT="${D}"
+}
+
+FILES_${PN} += "${libdir}/*.lds"
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
deleted file mode 100644
index dbf2a07..0000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Libraries for producing EFI binaries"
-HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
-SECTION = "devel"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=5fb358a180f484b285b0d99acdc29666"
-
-SRC_URI = "http://downloads.sourceforge.net/gnu-efi/gnu-efi_3.0u.orig.tar.gz \
-           file://parallel-make.patch \
-           file://parallel-make-archives.patch \
-          "
-SRC_URI[md5sum] = "d15d3c700e79a1e2938544d73edc572d"
-SRC_URI[sha256sum] = "3c0d450d5829204ca05dcb3b2aae772e52c379b7c7e09146759c6315606f934e"
-
-COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
-
-S = "${WORKDIR}/gnu-efi-3.0"
-
-def gnu_efi_arch(d):
-    import re
-    tarch = d.getVar("TARGET_ARCH", True)
-    if re.match("i[3456789]86", tarch):
-        return "ia32"
-    return tarch
-
-EXTRA_OEMAKE = "'ARCH=${@gnu_efi_arch(d)}' 'CC=${CC}' 'AS=${AS}' 'LD=${LD}' 'AR=${AR}' \
-                'RANLIB=${RANLIB}' 'OBJCOPY=${OBJCOPY}' 'PREFIX=${prefix}' 'LIBDIR=${libdir}' \
-                "
-
-do_install() {
-        oe_runmake install INSTALLROOT="${D}"
-}
-
-FILES_${PN} += "${libdir}/*.lds"
-- 
1.7.9.5


