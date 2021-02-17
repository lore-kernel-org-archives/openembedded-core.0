Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cPeH3A60ZgyTHMx1i0TOrY6pY/NEOG4L8f8rtLpL7gRXKCvmJqNOojKkyox4k9ssd4mC5b6Rj6
 0cHbiAaJJ69Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247111"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247111"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:32 -0800
IronPort-SDR: bEyY3NjAn3uxiiq0CaY1arzoGIapTBthxbhdRaFzNeIqk+A+lGdTmW6aajH/7QjDaQtB3aGmhz
 30DXjsH0DIvw==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825428"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/27] sysklogd: upgrade 2.1.2 -> 2.2.1
Date: Wed, 17 Feb 2021 13:51:56 +0800
Message-Id: <20210217055210.22019-13-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge inc and bb files too.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-Makefile.am-fixup-issue-17.patch     | 43 -------------------
 meta/recipes-extended/sysklogd/sysklogd.inc   |  4 +-
 .../sysklogd/sysklogd_2.1.2.bb                |  3 --
 3 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-extended/sysklogd/files/0001-Makefile.am-fixup-issue-17.patch
 delete mode 100644 meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb

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
index 162260f000..aa3f126fbc 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -12,8 +12,10 @@ inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://sysklogd \
-           file://0001-Makefile.am-fixup-issue-17.patch \
            "
+
+SRCREV = "b115c7ec4e6d9f3587ac8d212bfc454bfbfe7023"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --without-logger"
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb
deleted file mode 100644
index 2917c2aae0..0000000000
--- a/meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require sysklogd.inc
-
-SRCREV = "6d6010add698370fc7d9828f0aaa18613dd2397f"
-- 
2.29.2

