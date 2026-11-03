Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2707.1793747773172374529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 15:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 4 Nov 2026 08:16:10 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.127 with ESMTP; 4 Nov 2026 08:16:10 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	"mark.yang" <mark.yang@lge.com>
Subject: [PATCH 5/6] musl: make ldd work with multilib
Date: Wed,  4 Nov 2026 08:16:06 +0900
Message-ID: <20261103231607.4021851-6-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103231607.4021851-1-mark.yang@lge.com>
References: <20261103231607.4021851-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 23:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249306
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Replace the /usr/bin/ldd link to libc.so with a script, and ship it in
its own ldd package.

The script and its packaging follow glibc:

- RTLDLIST holds the loader of every variant, built with
  oe.utils.all_multilib_tune_values() as in glibc-ld.inc. do_install
  substitutes it into the script, so both variants ship the same file.
- ldd uses the first installed loader in RTLDLIST with the same ELF
  class as the file.
- The package is named ldd, as in glibc-package.inc. RDEPENDS on ldd
  need no RPROVIDES. The oeqa runtime ldd test checks for this package
  name, so it now runs on musl.

glibc's ldd finds that loader by running each one with --verify. In
open_verify(), the loader compares e_ident[EI_CLASS] of the file with
its own class and exits with 1 when they differ.

The musl loader has no --verify. Without a check in the script, the
user has to run the loader that matches each program by hand:

  /lib/ld-musl-aarch64.so.1 --list app64
  /lib/ld-musl-armhf.so.1 --list app32

In a mixed image, /usr/bin holds programs of both classes, and the
file name does not show which.

The script therefore makes the same comparison as glibc. It reads
byte 4 (EI_CLASS) of the file and of each loader with dd:

  dd if=app64 bs=1 skip=4 count=1                      -> 2 (ELFCLASS64)
  dd if=app32 bs=1 skip=4 count=1                      -> 1 (ELFCLASS32)
  dd if=/lib/ld-musl-aarch64.so.1 bs=1 skip=4 count=1  -> 2 (ELFCLASS64)
  dd if=/lib/ld-musl-armhf.so.1 bs=1 skip=4 count=1    -> 1 (ELFCLASS32)

ldd then picks the aarch64 loader for app64 and the armhf loader for
app32. This gives the two commands above.

A loader's own header holds the class it was built for. glibc uses the
same value as the constant ELFW(CLASS).

The command follows Alpine. Its musl APKBUILD writes ldd as
'exec /lib/$LDSO --list "$@"'.

musl upstream also recommends this form over the argv[0] link.
Reference: https://www.openwall.com/lists/musl/2023/04/17/6

When no loader matches, as for a non-ELF file, the first installed
loader in RTLDLIST reports the error.

musl no longer provides ldd. As with glibc, an image gets it only
when something installs or depends on it.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-core/musl/musl/ldd    | 18 ++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb | 12 ++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/musl/musl/ldd

diff --git a/meta/recipes-core/musl/musl/ldd b/meta/recipes-core/musl/musl/ldd
new file mode 100644
index 0000000000..c24533cc95
--- /dev/null
+++ b/meta/recipes-core/musl/musl/ldd
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+RTLDLIST="@RTLDLIST@"
+
+elfclass() {
+	dd if="$1" bs=1 skip=4 count=1 2>/dev/null
+}
+
+class=$(elfclass "$1")
+first=
+for rtld in $RTLDLIST; do
+	[ -x "$rtld" ] || continue
+	[ -n "$first" ] || first=$rtld
+	if [ "$(elfclass "$rtld")" = "$class" ]; then
+		exec "$rtld" --list "$@"
+	fi
+done
+exec "$first" --list "$@"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b8fef8990e..80c9bd9292 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch \
            file://0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch \
+           file://ldd \
           "
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
@@ -28,6 +29,9 @@ DEPENDS = "virtual/cross-binutils \
           "
 GLIBC_LDSO = "${@get_glibc_loader(d)}"
 MUSL_LDSO_ARCH = "${@get_musl_loader_arch(d)}"
+MUSL_GETLOADER = "${@get_musl_loader(d)}"
+RTLDLIST = "${@oe.utils.all_multilib_tune_values(d, 'MUSL_GETLOADER')}"
+RTLDLIST[vardepvalue] = "${RTLDLIST}"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
@@ -68,7 +72,8 @@ do_install() {
         echo "${base_libdir}" > ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
         echo "${libdir}" >> ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
 	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
-	ln -rs ${D}${libdir}/libc.so ${D}${bindir}/ldd
+	install -m 0755 ${UNPACKDIR}/ldd ${D}${bindir}/ldd
+	sed -i -e 's#@RTLDLIST@#${RTLDLIST}#' ${D}${bindir}/ldd
 	musl_multilib_bits
 }
 
@@ -78,6 +83,9 @@ musl_multilib_bits () {
 	done
 }
 
+PACKAGES =+ "ldd"
+
+FILES:ldd = "${bindir}/ldd"
 FILES:${PN} += "${nonarch_base_libdir}/ld-musl-${MUSL_LDSO_ARCH}.so.1 ${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path"
 FILES:${PN}-staticdev = "${libdir}/libc.a"
 FILES:${PN}-dev =+ "${libdir}/libcrypt.a ${libdir}/libdl.a ${libdir}/libm.a \
@@ -87,7 +95,7 @@ FILES:${PN}-dev =+ "${libdir}/libcrypt.a ${libdir}/libdl.a ${libdir}/libm.a \
 
 RDEPENDS:${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
 RPROVIDES:${PN}-dev += "libc-dev virtual-libc-dev"
-RPROVIDES:${PN} += "ldd rtld(GNU_HASH)"
+RPROVIDES:${PN} += "rtld(GNU_HASH)"
 
 LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
