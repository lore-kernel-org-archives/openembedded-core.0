Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.15724.1592826240028382023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 04:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GynjzSA5;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id y13so9409523lfe.9
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rMurh3TUHEQDmJh0NMjYVK2Y0RFyMu+fFsJcynB7OWE=;
        b=GynjzSA5ifc5FSzSqU3s0VqDtNTgujtYdXZrEW4xaSI+aLr6r1fO1Wd3A3ZIGQknXq
         wfx9eRhiYoRqgz5aemKghN+VtRY4/zTuoh+uAbL2Pu3OWZPw3uJ/xKPfpl+9H6cb7YwF
         3rBVvXWIqMJcEhXpK85OaV/8CuA0paen4xVntTEAVkmW3mauS8NHS3UnzSnUalHI43OR
         tyrzEXMg6EREuDhmwlYHKrfv4TzrafRtZ9fYsfDUlYvbLzLJfGwCKcNCo8oSKr67m9jH
         VoFEngXcMGcf08hco9HKY8EyS/ALEv2pq6Qe+DPS+SVMSTilWRX18Yd6ovyiE91aBpdd
         Vw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rMurh3TUHEQDmJh0NMjYVK2Y0RFyMu+fFsJcynB7OWE=;
        b=gGqOq/JC9pW7hOwVq+3R+PjvQLGTkXN73ZH1JdctykM2BeROi6GVtfvdEvuvlnDEa+
         12KqkQVr/8QCTFhIujma+Gt39tDdI1tUo0EOD6kjKCoxZ49QOkZtIw8CsmS4G4v4Q1pT
         mimn5PHJJsu4Mo+6KFlqDffEIDfWNamKo605jYJHLScIIQIXnfL3otHvQuHdx2DuQCuE
         S6gOGbtCIgh4jXj9Ez8GBtZ2318RyvVhGQO8eDPx9N/YVk0ZOpzhknxetIahTIsoXneU
         ykBT4itG0ylAfBC1o0Kvz5LysyLO4y2I5ERvKHNn97UoVZIof/iTKYDFkayFiMISHvCZ
         IJog==
X-Gm-Message-State: AOAM533mwQD3tHk5aA8yC+bXHjExLgWo6g+ErG7QbKKbBReiauoto2i5
	ULLCtJkqlpHBlzXNTZd0lWMS87hC
X-Google-Smtp-Source: ABdhPJxL6/k8LxUksgUWvdZq+g7HT0Sx6eZIrexy2l+k/8a1LRWVzInAgBqjUCzwPSlXSOoVXHMMFw==
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr9558977lfn.30.1592826237551;
        Mon, 22 Jun 2020 04:43:57 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id s62sm2338932lja.100.2020.06.22.04.43.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 04:43:56 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] grub: Remove native version of grub-efi
Date: Mon, 22 Jun 2020 13:43:43 +0200
Message-Id: <20200622114343.481513-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The native version of grub-efi only installs the tools

  /usr/bin/grub-editenv
  /usr/bin/grub-mkimage

to sysroots-components/, but equivalent tools are already provided by
grub-native, the difference on x86_64 being 4 hardwired paths in grub-mkimage
(values taken from grub-native):

  LOCALEDIR       = $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/share/locale
  GRUB_DATADIR    = $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/share
  GRUB_LIBDIR     = $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/lib
  GRUB_SYSCONFDIR = $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/etc

If grub-native and grub-efi-native are built with the following patch

--- grub-2.04.orig/configure.ac
+++ grub-2.04/configure.ac
@@ -1980,10 +1980,10 @@ grub_libdir="$(eval echo "$libdir")"
 grub_localedir="$(eval echo "$localedir")"
 grub_datadir="$(eval echo "$datadir")"
 grub_sysconfdir="$(eval echo "$sysconfdir")"
-AC_DEFINE_UNQUOTED(LOCALEDIR, "$grub_localedir", [Locale dir])
-AC_DEFINE_UNQUOTED(GRUB_LIBDIR, "$grub_libdir", [Library dir])
-AC_DEFINE_UNQUOTED(GRUB_DATADIR, "$grub_datadir", [Data dir])
-AC_DEFINE_UNQUOTED(GRUB_SYSCONFDIR, "$grub_sysconfdir", [Configuration dir])
+AC_DEFINE_UNQUOTED(LOCALEDIR, "/non-existent", [Locale dir])
+AC_DEFINE_UNQUOTED(GRUB_LIBDIR, "/non-existent", [Library dir])
+AC_DEFINE_UNQUOTED(GRUB_DATADIR, "/non-existent", [Data dir])
+AC_DEFINE_UNQUOTED(GRUB_SYSCONFDIR, "/non-existent", [Configuration dir])

the produced grub-editenv/grub-mkimage binaries become binary equivalent,
assuming reproducible builds is active. Since the unpatched values of
LOCALEDIR/GRUB_DATADIR/GRUB_LIBDIR/GRUB_SYSCONFDIR point to directories that
are not expected to exist at runtime, they can be ignored.

Therefore:
 * remove grub-efi-native and instead rely on the same tools from
   grub-native
 * replace references to grub-efi-native with grub-native
 * remove unused grub-efi-native security flags overrides

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/conf/distro/include/security_flags.inc |  4 ---
 meta/recipes-bsp/grub/grub-efi_2.04.bb      | 28 +++++----------------
 meta/recipes-bsp/grub/grub2.inc             |  4 ---
 meta/recipes-bsp/grub/grub_2.04.bb          |  5 ++++
 meta/recipes-core/meta/wic-tools.bb         |  2 +-
 5 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index a9e5b311af..4e64eb99f9 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -40,10 +40,6 @@ SECURITY_CFLAGS_pn-glibc-testsuite = ""
 SECURITY_CFLAGS_pn-gcc-runtime = ""
 SECURITY_CFLAGS_pn-grub = ""
 SECURITY_CFLAGS_pn-grub-efi = ""
-SECURITY_CFLAGS_pn-grub-efi-native = ""
-SECURITY_CFLAGS_pn-grub-efi-x86-native = ""
-SECURITY_CFLAGS_pn-grub-efi-i586-native = ""
-SECURITY_CFLAGS_pn-grub-efi-x86-64-native = ""
 SECURITY_CFLAGS_pn-mkelfimage_x86 = ""
 
 SECURITY_CFLAGS_pn-valgrind = "${SECURITY_NOPIE_CFLAGS}"
diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index b9d6225d27..30d95f95e0 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -4,8 +4,8 @@ require conf/image-uefi.conf
 
 GRUBPLATFORM = "efi"
 
-DEPENDS_append_class-target = " grub-efi-native"
-RDEPENDS_${PN}_class-target = "grub-common virtual/grub-bootconf"
+DEPENDS_append = " grub-native"
+RDEPENDS_${PN} = "grub-common virtual/grub-bootconf"
 
 SRC_URI += " \
            file://cfg \
@@ -51,22 +51,7 @@ do_mkimage() {
 
 addtask mkimage before do_install after do_compile
 
-do_mkimage_class-native() {
-	:
-}
-
-do_install_append_class-target() {
-	install -d ${D}${EFI_FILES_PATH}
-	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${GRUB_IMAGE}
-}
-
-do_install_class-native() {
-	install -d ${D}${bindir}
-	install -m 755 grub-mkimage ${D}${bindir}
-	install -m 755 grub-editenv ${D}${bindir}
-}
-
-do_install_class-target() {
+do_install() {
     oe_runmake 'DESTDIR=${D}' -C grub-core install
 
     # Remove build host references...
@@ -76,6 +61,9 @@ do_install_class-target() {
         -e 's|${DEBUG_PREFIX_MAP}||g' \
         -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
         {} +
+
+    install -d ${D}${EFI_FILES_PATH}
+    install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${GRUB_IMAGE}
 }
 
 do_install_append_aarch64() {
@@ -89,10 +77,6 @@ do_deploy() {
 	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
-do_deploy_class-native() {
-	:
-}
-
 addtask deploy after do_install before do_build
 
 FILES_${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b3291cb4b8..2024e13782 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -64,7 +64,3 @@ do_configure_prepend() {
 	FROM_BOOTSTRAP=1 ${S}/autogen.sh
 	cd ${B}
 }
-
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-bsp/grub/grub_2.04.bb b/meta/recipes-bsp/grub/grub_2.04.bb
index 9232ea8120..df607cae14 100644
--- a/meta/recipes-bsp/grub/grub_2.04.bb
+++ b/meta/recipes-bsp/grub/grub_2.04.bb
@@ -2,9 +2,12 @@ require grub2.inc
 
 RDEPENDS_${PN}-common += "${PN}-editenv"
 RDEPENDS_${PN} += "${PN}-common"
+RDEPENDS_${PN}_class-native = ""
 
 RPROVIDES_${PN}-editenv += "${PN}-efi-editenv"
 
+PROVIDES_append_class-native = " grub-efi-native"
+
 PACKAGES =+ "${PN}-editenv ${PN}-common"
 FILES_${PN}-editenv = "${bindir}/grub-editenv"
 FILES_${PN}-common = " \
@@ -31,3 +34,5 @@ do_install_append () {
 
 INSANE_SKIP_${PN} = "arch"
 INSANE_SKIP_${PN}-dbg = "arch"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 8aeb942ed2..3e7d0ed48d 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 
 DEPENDS = "\
            parted-native syslinux-native gptfdisk-native dosfstools-native \
-           mtools-native bmap-tools-native grub-efi-native cdrtools-native \
+           mtools-native bmap-tools-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
            e2fsprogs-native util-linux-native tar-native\
            "
