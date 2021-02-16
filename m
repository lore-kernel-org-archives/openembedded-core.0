Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.5110.1613463848635394653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 84B4138C1288
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:11 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.2.1 SUCCEEDED
Message-ID: <MADEUP.16642CD31A543EDE.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148132
Content-Type: multipart/mixed; boundary="===============5413575711680745348=="

--===============5413575711680745348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.1.2-2.2.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============5413575711680745348==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.1.2-2.2.1.patch"

From 4fad21fa17f295034174d541474230031262eed2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 23:42:41 +0000
Subject: [PATCH] sysklogd: upgrade 2.1.2 -> 2.2.1

---
 .../0001-Makefile.am-fixup-issue-17.patch     | 43 -------------------
 meta/recipes-extended/sysklogd/sysklogd.inc   |  1 -
 .../{sysklogd_2.1.2.bb => sysklogd_2.2.1.bb}  |  2 +-
 3 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-extended/sysklogd/files/0001-Makefile.am-fixup-issue-17.patch
 rename meta/recipes-extended/sysklogd/{sysklogd_2.1.2.bb => sysklogd_2.2.1.bb} (29%)

diff --git a/meta/recipes-extended/sysklogd/files/0001-Makefile.am-fixup-issue-17.patch b/meta/recipes-extended/sysklogd/files/0001-Makefile.am-fixup-issue-17.patch
deleted file mode 100644
index 96365648d7..0000000000
--- a/meta/recipes-extended/sysklogd/files/0001-Makefile.am-fixup-issue-17.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a4a472c19eaaf03cc0e70797b2d24b540d6424e1 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 3 Jun 2020 13:39:18 +0800
-Subject: [PATCH] Makefile.am: fixup issue #17
-
-only make $(LIBOBJS) depend on $(LTLIBOBJS) still have race condition,
-library like pidfile.o may be changed when compile or link for
-libsyslog_la_LIBADD, which will cause problem like below:
-
-ERROR: dwarfsrcfiles failed with exit code 1 (cmd was ['dwarfsrcfiles', /tmp/work/ppc7400-oe-linux/sysklogd/2.1.2-r0/package/usr/lib/libsyslog.a']):
-dwarfsrcfiles: tmp/work/ppc7400-oe-linux/sysklogd/2.1.2-r0/package/usr/lib/libsyslog.a: not a valid ELF file
-
-arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc  -march=armv7ve -mthumb -mfpu=neon -mfloat-abi=hard --sysroot=TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot -shared  -fPIC -DPIC  .libs/libsyslog_la-syslog.o ../lib/.libs/pidfile.o ../lib/.libs/strlcpy.o ../lib/.libs/strlcat.o    -march=armv7ve -mthumb -mfpu=neon -mfloat-abi=hard --sysroot=TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot -O2 -g -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,libsyslog.so.0 -o .libs/libsyslog.so.0.0.0
-arm-oe-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libsyslog.so.0" && ln -s "libsyslog.so.0.0.0" "libsyslog.so.0")
-arm-oe-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libsyslog.so" && ln -s "libsyslog.so.0.0.0" "libsyslog.so")
-arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc-ar cru .libs/libsyslog.a  libsyslog_la-syslog.o ../lib/pidfile.o ../lib/strlcpy.o ../lib/strlcat.o
-TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/10.1.0/ar: `u' modifier ignored since `D' is the default (see `U')
-TOPDIR/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/sysklogd/2.1.2-r0/recipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/10.1.0/ar: ../lib/strlcat.o: No such file or directory
-
-Upstream-Status: Submitted [https://github.com/troglobit/sysklogd/pull/23/commits/e684939559341cb1c6373dfc6469b59e580d80af]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/Makefile.am | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index f8a6820..f45c773 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -66,6 +66,7 @@ libsyslog_la_LIBADD   = $(LTLIBOBJS)
- #  ld: syslogd-syslogd.o: in function `main': syslogd.c:417: undefined
- #      reference to `__pidfile'
- #
--# Work around the problem by building one .o from lib at a time, this
--# can be achieved by making LIBOBJS depend on LTLIBOBJS.
--$(LIBOBJS): $(LTLIBOBJS)
-+# Work around the problem by make LIBOBJS depend on libsyslog.la,
-+# so that LIBOBJS/syslogd/logger will start compile after libsyslog.la
-+# is completed
-+$(LIBOBJS): $(lib_LTLIBRARIES)
--- 
-2.17.1
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 162260f000..2e3d9831b1 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -12,7 +12,6 @@ inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://sysklogd \
-           file://0001-Makefile.am-fixup-issue-17.patch \
            "
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.2.1.bb
similarity index 29%
rename from meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.2.1.bb
index 2917c2aae0..4f24918566 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.2.1.bb
@@ -1,3 +1,3 @@
 require sysklogd.inc
 
-SRCREV = "6d6010add698370fc7d9828f0aaa18613dd2397f"
+SRCREV = "b115c7ec4e6d9f3587ac8d212bfc454bfbfe7023"
-- 
2.17.1


--===============5413575711680745348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.1.2 [default] to 2.2.1 [default]
packages/core2-32-poky-linux/sysklogd: SRC_URI changed from "git://github.com/troglobit/sysklogd.git;nobranch=1 file://sysklogd file://0001-Makefile.am-fixup-issue-17.patch" to "git://github.com/troglobit/sysklogd.git;nobranch=1 file://sysklogd"
packages/core2-32-poky-linux/sysklogd: PV changed from "2.1.2" to "2.2.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.1.2 [default] to 2.2.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 133556 to 138944 (+4%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.1.2" to "2.2.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.1.2 [default] to 2.2.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.1.2" to "2.2.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.1.2 [default] to 2.2.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 75895 to 77670 (+2%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.1.2" to "2.2.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.1.2 [default] to 2.2.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.1.2" to "2.2.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.1.2 [default] to 2.2.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 130185 to 131985 (+1%)
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.1.2" to "2.2.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.1.2 [default] to 2.2.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.1.2" to "2.2.1"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.1.2 [default] to 2.2.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 83070 to 83102 (+0%)
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.1.2" to "2.2.1"

--===============5413575711680745348==--
