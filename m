Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: DP+sxpyp5PLTUT1Zf90SpS3d9BoPkzT0Xij7IKI/J7h9+feanHhDblrTdEneY5QlmcaYwu+Jz5
 CLY+sE7T8iLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467869"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467869"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:37 -0700
IronPort-SDR: PUuvjYZ5STWNOyKqR4db9LCQz41l+arIKuvf4kIbt1mZdspdkdImDfqIHFsAeZBBLcmMr+Bgym
 PqxRJ6NRM+7A==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809031"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:36 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/18] binutils: backport fix for gold with theads enabled from 2.36.0
Date: Mon, 12 Apr 2021 17:08:10 +0800
Message-Id: <eaf4548a58d1b926b38beab28d75f8710c8b078a.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* building chromium with gold and threads triggers this issue:
  [1/2] SOLINK ./libcbe.so
  FAILED: libcbe.so libcbe.so.TOC
  python "../../git/src/build/toolchain/gcc_solink_wrapper.py" --readelf="readelf" --nm="nm" --sofile="./libcbe.so" --tocfile="./libcbe.so.TOC" --output="./libcbe.so" -- i686-oe-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=chromium/84.0.4147.89-4-r41.1/recipe-sysroot -shared -Wl,-soname="libcbe.so" -fPIC -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -Wl,-z,defs -Wl,--as-needed -fuse-ld=gold -Wl,--threads -Wl,--thread-count=4 -m32 -Wl,-O2 -Wl,--gc-sections -rdynamic --sysroot=../../recipe-sysroot -L../../recipe-sysroot/lib -L../../recipe-sysroot/usr/lib -Lchromium/84.0.4147.89-4-r41.1/recipe-sysroot -o "./libcbe.so" @"./libcbe.so.rsp"
  collect2: fatal error: ld terminated with signal 11 [Segmentation fault]
  compilation terminated.

* removing threads/thread-count is one possible work around, but then
  the use of gold for performance makes even less sense, that's why
  chromium from meta-browser uses LLD by default:
  https://github.com/OSSystems/meta-browser/commit/15228b01903d4ca801916e55c7618fa5a71019b7
  https://lld.llvm.org/#performance
  but lets backport this as other recipes might also reproduce this
  issue

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../binutils/binutils-2.35.1.inc              |  1 +
 ..._counts_lock-is-initialized-before-u.patch | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gold-ensure-file_counts_lock-is-initialized-before-u.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.35.1.inc b/meta/recipes-devtools/binutils/binutils-2.35.1.inc
index 775af2b8f2..6290d5b191 100644
--- a/meta/recipes-devtools/binutils/binutils-2.35.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.35.1.inc
@@ -44,5 +44,6 @@ SRC_URI = "\
      file://0017-gas-improve-reproducibility-for-stabs-debugging-data.patch \
      file://0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch \
      file://CVE-2020-35448.patch \
+     file://0001-gold-ensure-file_counts_lock-is-initialized-before-u.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-gold-ensure-file_counts_lock-is-initialized-before-u.patch b/meta/recipes-devtools/binutils/binutils/0001-gold-ensure-file_counts_lock-is-initialized-before-u.patch
new file mode 100644
index 0000000000..f46415f440
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-gold-ensure-file_counts_lock-is-initialized-before-u.patch
@@ -0,0 +1,41 @@
+From de24fc96bf24fca470a9ca13176ad9ad9cc4d5a9 Mon Sep 17 00:00:00 2001
+From: Nick Gasson <nick.gasson@arm.com>
+Date: Mon, 2 Nov 2020 12:02:05 +0800
+Subject: [PATCH] gold: ensure file_counts_lock is initialized before using
+
+Since upgrading to binutils 2.35 I've been experiencing random memory
+corruption related crashes with ld.gold --threads. It's caused by
+multiple threads concurrently pushing elements onto the shared
+std::vector in File_read::record_file_read(). This vector is supposed to
+be protected by file_counts_lock, but that is initialized lazily and
+might be NULL when File_read::open() is called, in which case
+Hold_optional_lock silently skips locking it.
+
+Fix by calling the initialize() method before attempting to acquire the
+lock, the same as other places that use file_counts_lock.
+
+	PR 26827
+	* fileread.cc (File_read::open): Ensure file_counts_lock is
+	initialized.
+	* testsuite/Makefile.am (check_PROGRAMS): Add a test that passes
+	-Wl,--threads.
+	* testsuite/Makefile.in: Regenerate.
+
+Upstream-Status: Backport [af61e84fd2d from 2.36.0]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ gold/fileread.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gold/fileread.cc b/gold/fileread.cc
+index f5ca719360d..0b5228e2afd 100644
+--- a/gold/fileread.cc
++++ b/gold/fileread.cc
+@@ -212,6 +212,7 @@ File_read::open(const Task* task, const std::string& name)
+       gold_debug(DEBUG_FILES, "Attempt to open %s succeeded",
+ 		 this->name_.c_str());
+       this->token_.add_writer(task);
++      file_counts_initialize_lock.initialize();
+       Hold_optional_lock hl(file_counts_lock);
+       record_file_read(this->name_);
+     }
-- 
2.30.2

