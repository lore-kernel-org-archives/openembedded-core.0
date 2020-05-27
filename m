Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.2425.1590570674053154584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 02:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: sNMzX7dDk7VLP2fVP8bhkaW2xQ8dfjUdtt1+5E4Y1X6jQmYZ1ZUn1EFJMHMfw2NCrdzy1RIUpu
 7WXVLFojduBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 02:11:12 -0700
IronPort-SDR: Oi/45Bx+3jd63kLAGI1iLwe3smfuSKVTJ5hNR/SlQdS/ozqT0VUrzaajzZoXRjt5E3hvIb3ruw
 /JvMwr+03EFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; 
   d="scan'208";a="468642774"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga005.fm.intel.com with ESMTP; 27 May 2020 02:11:11 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] re2c: fix CVE-2020-11958
Date: Wed, 27 May 2020 17:11:10 +0800
Message-Id: <1590570671-45046-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../recipes-support/re2c/re2c/CVE-2020-11958.patch | 41 ++++++++++++++++++++++
 meta/recipes-support/re2c/re2c_1.3.bb              |  4 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2020-11958.patch

diff --git a/meta/recipes-support/re2c/re2c/CVE-2020-11958.patch b/meta/recipes-support/re2c/re2c/CVE-2020-11958.patch
new file mode 100644
index 0000000..43462e6
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c/CVE-2020-11958.patch
@@ -0,0 +1,41 @@
+From c4603ba5ce229db83a2a4fb93e6d4b4e3ec3776a Mon Sep 17 00:00:00 2001
+From: Ulya Trofimovich <skvadrik@gmail.com>
+Date: Fri, 17 Apr 2020 22:47:14 +0100
+Subject: [PATCH] Fix crash in lexer refill (reported by Agostino Sarubbo).
+
+The crash happened in a rare case of a very long lexeme that doen't fit
+into the buffer, forcing buffer reallocation.
+
+The crash was caused by an incorrect calculation of the shift offset
+(it was smaller than necessary). As a consequence, the data from buffer
+start and up to the beginning of the current lexeme was not discarded
+(as it should have been), resulting in less free space for new data than
+expected.
+
+Upstream-Status: Backport [https://github.com/skvadrik/re2c/commit/c4603ba5ce229db83a2a4fb93e6d4b4e3ec3776a]
+CVE: CVE-2020-11958
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ src/parse/scanner.cc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/parse/scanner.cc b/src/parse/scanner.cc
+index 1d6e9efa..bd651314 100644
+--- a/src/parse/scanner.cc
++++ b/src/parse/scanner.cc
+@@ -155,13 +155,14 @@ bool Scanner::fill(size_t need)
+         if (!buf) fatal("out of memory");
+ 
+         memmove(buf, tok, copy);
+-        shift_ptrs_and_fpos(buf - bot);
++        shift_ptrs_and_fpos(buf - tok);
+         delete [] bot;
+         bot = buf;
+ 
+         free = BSIZE - copy;
+     }
+ 
++    DASSERT(lim + free <= bot + BSIZE);
+     if (!read(free)) {
+         eof = lim;
+         memset(lim, 0, YYMAXFILL);
diff --git a/meta/recipes-support/re2c/re2c_1.3.bb b/meta/recipes-support/re2c/re2c_1.3.bb
index 0e1d938..e9053ac 100644
--- a/meta/recipes-support/re2c/re2c_1.3.bb
+++ b/meta/recipes-support/re2c/re2c_1.3.bb
@@ -5,7 +5,9 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
-SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://CVE-2020-11958.patch \
+"
 SRC_URI[sha256sum] = "f37f25ff760e90088e7d03d1232002c2c2672646d5844fdf8e0d51a5cd75a503"
 UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
 
-- 
2.7.4

