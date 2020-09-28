Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.29849.1601270813030903555
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 22:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08S5QVLN005285
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 22:26:41 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 27 Sep 2020 22:26:08 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sysklogd: fix parallel build issue
Date: Mon, 28 Sep 2020 13:25:17 +0800
Message-ID: <20200928052517.33492-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below errors which caused by race condition:
do_package:
ERROR: dwarfsrcfiles failed with exit code 1 (cmd was ['dwarfsrcfiles', 'TOPDIR/tmp-glibc/work/ppc7400-oe-linux/sysklogd/2.1.2-r0/package/usr/lib/libsyslog.a']):
dwarfsrcfiles: TOPDIR/tmp-glibc/work/ppc7400-oe-linux/sysklogd/2.1.2-r0/package/usr/lib/libsyslog.a: not a valid ELF file

do_compile:
arm-oe-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libsyslog.so.0" && ln -s "libsyslog.so.0.0.0" "libsyslog.so.0")
arm-oe-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libsyslog.so" && ln -s "libsyslog.so.0.0.0" "libsyslog.so")
arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc-ar cru .libs/libsyslog.a  libsyslog_la-syslog.o ../lib/pidfile.o ../lib/strlcpy.o ../lib/strlcat.o
TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/10.1.0/ar: `u' modifier ignored since `D' is the default (see `U')
TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/10.1.0/ar: ../lib/strlcat.o: No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-Makefile.am-fixup-issue-17.patch     | 43 +++++++++++++++++++
 meta/recipes-extended/sysklogd/sysklogd.inc   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-Makefile.am-fixup-issue-17.patch

diff --git a/meta/recipes-extended/sysklogd/files/0001-Makefile.am-fixup-issue-17.patch b/meta/recipes-extended/sysklogd/files/0001-Makefile.am-fixup-issue-17.patch
new file mode 100644
index 0000000000..96365648d7
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-Makefile.am-fixup-issue-17.patch
@@ -0,0 +1,43 @@
+From a4a472c19eaaf03cc0e70797b2d24b540d6424e1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 3 Jun 2020 13:39:18 +0800
+Subject: [PATCH] Makefile.am: fixup issue #17
+
+only make $(LIBOBJS) depend on $(LTLIBOBJS) still have race condition,
+library like pidfile.o may be changed when compile or link for
+libsyslog_la_LIBADD, which will cause problem like below:
+
+ERROR: dwarfsrcfiles failed with exit code 1 (cmd was ['dwarfsrcfiles', /tmp/work/ppc7400-oe-linux/sysklogd/2.1.2-r0/package/usr/lib/libsyslog.a']):
+dwarfsrcfiles: tmp/work/ppc7400-oe-linux/sysklogd/2.1.2-r0/package/usr/lib/libsyslog.a: not a valid ELF file
+
+arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc  -march=armv7ve -mthumb -mfpu=neon -mfloat-abi=hard --sysroot=TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot -shared  -fPIC -DPIC  .libs/libsyslog_la-syslog.o ../lib/.libs/pidfile.o ../lib/.libs/strlcpy.o ../lib/.libs/strlcat.o    -march=armv7ve -mthumb -mfpu=neon -mfloat-abi=hard --sysroot=TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot -O2 -g -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,libsyslog.so.0 -o .libs/libsyslog.so.0.0.0
+arm-oe-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libsyslog.so.0" && ln -s "libsyslog.so.0.0.0" "libsyslog.so.0")
+arm-oe-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libsyslog.so" && ln -s "libsyslog.so.0.0.0" "libsyslog.so")
+arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc-ar cru .libs/libsyslog.a  libsyslog_la-syslog.o ../lib/pidfile.o ../lib/strlcpy.o ../lib/strlcat.o
+TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/10.1.0/ar: `u' modifier ignored since `D' is the default (see `U')
+TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/10.1.0/ar: ../lib/strlcat.o: No such file or directory
+
+Upstream-Status: Submitted [https://github.com/troglobit/sysklogd/pull/23/commits/e684939559341cb1c6373dfc6469b59e580d80af]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/Makefile.am | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f8a6820..f45c773 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -66,6 +66,7 @@ libsyslog_la_LIBADD   = $(LTLIBOBJS)
+ #  ld: syslogd-syslogd.o: in function `main': syslogd.c:417: undefined
+ #      reference to `__pidfile'
+ #
+-# Work around the problem by building one .o from lib at a time, this
+-# can be achieved by making LIBOBJS depend on LTLIBOBJS.
+-$(LIBOBJS): $(LTLIBOBJS)
++# Work around the problem by make LIBOBJS depend on libsyslog.la,
++# so that LIBOBJS/syslogd/logger will start compile after libsyslog.la
++# is completed
++$(LIBOBJS): $(lib_LTLIBRARIES)
+-- 
+2.17.1
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 2e3d9831b1..162260f000 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -12,6 +12,7 @@ inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://sysklogd \
+           file://0001-Makefile.am-fixup-issue-17.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.17.1

