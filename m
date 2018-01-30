Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9591E6093D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 08:58:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36319144"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jan 2018 16:58:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4DBB649F19C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 16:58:44 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 30 Jan 2018 16:58:40 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Jan 2018 16:58:38 +0800
Message-ID: <1517302719-838-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 4DBB649F19C1.A75A0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ruby: 2.4.2 -> 2.5.0
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
X-List-Received-Date: Tue, 30 Jan 2018 08:58:44 -0000
Content-Type: text/plain

1.Upgrade ruby form 2.4.2 to 2.5.0.
2.Update the checksum of LIC_FILES_CHKSUM.
3.Delete ruby-CVE-2017-9224.patch, ruby-CVE-2017-9227.patch, ruby-CVE-2017-9229.patch, since it is integrated upstream.
4.Modify ruby-CVE-2017-9226.patch, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/ruby/ruby.inc                |  4 +-
 meta/recipes-devtools/ruby/ruby/extmk.patch        | 16 +++---
 .../ruby/ruby/ruby-CVE-2017-9224.patch             | 41 ---------------
 .../ruby/ruby/ruby-CVE-2017-9226.patch             | 15 ++----
 .../ruby/ruby/ruby-CVE-2017-9227.patch             | 32 ------------
 .../ruby/ruby/ruby-CVE-2017-9229.patch             | 59 ----------------------
 .../ruby/{ruby_2.4.2.bb => ruby_2.5.0.bb}          |  7 +--
 7 files changed, 16 insertions(+), 158 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch
 rename meta/recipes-devtools/ruby/{ruby_2.4.2.bb => ruby_2.5.0.bb} (83%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 9a52a69..fd3911b 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -8,10 +8,10 @@ HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
 LICENSE = "Ruby | BSD | GPLv2"
 LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=8a960b08d972f43f91ae84a6f00dcbfb \
+    file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
     file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=daf349ad59dd19bd8c919171bff3c5d6 \
+    file://LEGAL;md5=8f871f3f03732c018a5fa9b185958231 \
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline"
diff --git a/meta/recipes-devtools/ruby/ruby/extmk.patch b/meta/recipes-devtools/ruby/ruby/extmk.patch
index a5b2184..404b9af 100644
--- a/meta/recipes-devtools/ruby/ruby/extmk.patch
+++ b/meta/recipes-devtools/ruby/ruby/extmk.patch
@@ -2,13 +2,15 @@ Upstream-Status: Pending
 diff -ru ruby-1.8.7-p248.orig/ext/extmk.rb ruby-1.8.7-p248/ext/extmk.rb
 --- ruby-1.8.7-p248.orig/ext/extmk.rb	2009-12-24 03:01:58.000000000 -0600
 +++ ruby-1.8.7-p248/ext/extmk.rb	2010-02-12 15:55:27.370061558 -0600
-@@ -354,8 +354,8 @@
-   $ruby = '$(topdir)/miniruby' + EXEEXT
+@@ -413,8 +413,8 @@ def $mflags.defined?(var)
  end
- $ruby << " -I'$(topdir)'"
-+$ruby << " -I'$(top_srcdir)/lib'"
+ $ruby = [$ruby]
+ $ruby << "-I'$(topdir)'"
++$ruby << "-I'$(top_srcdir)/lib'"
  unless CROSS_COMPILING
--  $ruby << " -I'$(top_srcdir)/lib'"
-   $ruby << " -I'$(extout)/$(arch)' -I'$(extout)/common'" if $extout
-   $ruby << " -I./- -I'$(top_srcdir)/ext' -rpurelib.rb"
+-  $ruby << "-I'$(top_srcdir)/lib'"
+   $ruby << "-I'$(extout)/$(arch)'" << "-I'$(extout)/common'" if $extout
    ENV["RUBYLIB"] = "-"
+ end
+-- 
+
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch
deleted file mode 100644
index 848139b..0000000
--- a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 690313a061f7a4fa614ec5cc8368b4f2284e059b Mon Sep 17 00:00:00 2001
-From: "K.Kosako" <kosako@sofnec.co.jp>
-Date: Tue, 23 May 2017 10:28:58 +0900
-Subject: [PATCH] fix #57 : DATA_ENSURE() check must be before data access
-
----
- regexec.c |    5 -----
- 1 file changed, 5 deletions(-)
-
---- end of original header
-
-CVE: CVE-2017-9224
-
-Context modified so that patch applies for version 2.4.1.
-
-Upstream-Status: Pending
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
-diff --git a/regexec.c b/regexec.c
-index 35fef11..d4e577d 100644
---- a/regexec.c
-+++ b/regexec.c
-@@ -1473,14 +1473,9 @@ match_at(regex_t* reg, const UChar* str, const UChar* end,
-       NEXT;
-
-     CASE(OP_EXACT1)  MOP_IN(OP_EXACT1);
--#if 0
-       DATA_ENSURE(1);
-       if (*p != *s) goto fail;
-       p++; s++;
--#endif
--      if (*p != *s++) goto fail;
--      DATA_ENSURE(0);
--      p++;
-       MOP_OUT;
-       break;
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
index 0f2a430..89437bb 100644
--- a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
@@ -20,22 +20,13 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
 --- ruby-2.4.1.orig/regparse.c
 +++ ruby-2.4.1/regparse.c
-@@ -3644,7 +3644,7 @@ fetch_token(OnigToken* tok, UChar** src,
-       if (IS_SYNTAX_OP(syn, ONIG_SYN_OP_ESC_OCTAL3)) {
- 	prev = p;
- 	num = scan_unsigned_octal_number(&p, end, (c == '0' ? 2:3), enc);
--	if (num < 0) return ONIGERR_TOO_BIG_NUMBER;
-+	if (num < 0 || 0xff < num) return ONIGERR_TOO_BIG_NUMBER;
- 	if (p == prev) {  /* can't read nothing. */
- 	  num = 0; /* but, it's not error */
- 	}
 @@ -4450,6 +4450,9 @@ next_state_val(CClassNode* cc, CClassNod
    switch (*state) {
    case CCS_VALUE:
      if (*type == CCV_SB) {
-+      if (*vs > 0xff)
++      if (*from > 0xff)
 +          return ONIGERR_INVALID_CODE_POINT_VALUE;
 +
-       BITSET_SET_BIT_CHKDUP(cc->bs, (int )(*vs));
+       BITSET_SET_BIT_CHKDUP(cc->bs, (int )(*from));
        if (IS_NOT_NULL(asc_cc))
- 	BITSET_SET_BIT(asc_cc->bs, (int )(*vs));
+ 	BITSET_SET_BIT(asc_cc->bs, (int )(*from));
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
deleted file mode 100644
index 85e7ccb..0000000
--- a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9690d3ab1f9bcd2db8cbe1fe3ee4a5da606b8814 Mon Sep 17 00:00:00 2001
-From: "K.Kosako" <kosako@sofnec.co.jp>
-Date: Tue, 23 May 2017 16:15:35 +0900
-Subject: [PATCH] fix #58 : access to invalid address by reg->dmin value
-
----
- regexec.c |    2 ++
- 1 file changed, 2 insertions(+)
-
---- end of original header
-
-CVE: CVE-2017-9227
-
-Upstream-Status: Inappropriate [not author]
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-diff --git a/regexec.c b/regexec.c
-index d4e577d..2fa0f3d 100644
---- a/regexec.c
-+++ b/regexec.c
-@@ -3154,6 +3154,8 @@ forward_search_range(regex_t* reg, const UChar* str, const UChar* end, UChar* s,
-     }
-     else {
-       UChar *q = p + reg->dmin;
-+
-+      if (q >= end) return 0; /* fail */
-       while (p < q) p += enclen(reg->enc, p, end);
-     }
-   }
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch
deleted file mode 100644
index 6e765bf..0000000
--- a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From b690371bbf97794b4a1d3f295d4fb9a8b05d402d Mon Sep 17 00:00:00 2001
-From: "K.Kosako" <kosako@sofnec.co.jp>
-Date: Wed, 24 May 2017 10:27:04 +0900
-Subject: [PATCH] fix #59 : access to invalid address by reg->dmax value
-
----
- regexec.c |   27 +++++++++++++++++----------
- 1 file changed, 17 insertions(+), 10 deletions(-)
-
---- end of original header
-
-CVE: CVE-2017-9229
-
-Upstream-Status: Inappropriate [not author]
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-diff --git a/regexec.c b/regexec.c
-index 49bcc50..c0626ef 100644
---- a/regexec.c
-+++ b/regexec.c
-@@ -3756,18 +3756,25 @@ forward_search_range(regex_t* reg, const
-     }
-     else {
-       if (reg->dmax != ONIG_INFINITE_DISTANCE) {
--	*low = p - reg->dmax;
--	if (*low > s) {
--	  *low = onigenc_get_right_adjust_char_head_with_prev(reg->enc, s,
--							      *low, end, (const UChar** )low_prev);
--	  if (low_prev && IS_NULL(*low_prev))
--	    *low_prev = onigenc_get_prev_char_head(reg->enc,
--						   (pprev ? pprev : s), *low, end);
-+        if (p - str < reg->dmax) {
-+          *low = (UChar* )str;
-+          if (low_prev)
-+            *low_prev = onigenc_get_prev_char_head(reg->enc, str, *low, end);
- 	}
- 	else {
--	  if (low_prev)
--	    *low_prev = onigenc_get_prev_char_head(reg->enc,
--					       (pprev ? pprev : str), *low, end);
-+          *low = p - reg->dmax;
-+          if (*low > s) {
-+            *low = onigenc_get_right_adjust_char_head_with_prev(reg->enc, s,
-+                                                 *low, end, (const UChar** )low_prev);
-+            if (low_prev && IS_NULL(*low_prev))
-+              *low_prev = onigenc_get_prev_char_head(reg->enc,
-+                                                     (pprev ? pprev : s), *low, end);
-+          }
-+          else {
-+            if (low_prev)
-+              *low_prev = onigenc_get_prev_char_head(reg->enc,
-+                                                     (pprev ? pprev : str), *low, end);
-+          }
- 	}
-       }
-     }
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/ruby/ruby_2.4.2.bb b/meta/recipes-devtools/ruby/ruby_2.5.0.bb
similarity index 83%
rename from meta/recipes-devtools/ruby/ruby_2.4.2.bb
rename to meta/recipes-devtools/ruby/ruby_2.5.0.bb
index 239d775..1ac7f2a 100644
--- a/meta/recipes-devtools/ruby/ruby_2.4.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.0.bb
@@ -1,15 +1,12 @@
 require ruby.inc
 
 SRC_URI += " \
-           file://ruby-CVE-2017-9224.patch \
            file://ruby-CVE-2017-9226.patch \
-           file://ruby-CVE-2017-9227.patch \
            file://ruby-CVE-2017-9228.patch \
-           file://ruby-CVE-2017-9229.patch \
            "
 
-SRC_URI[md5sum] = "fe106eed9738c4e03813ab904f8d891c"
-SRC_URI[sha256sum] = "93b9e75e00b262bc4def6b26b7ae8717efc252c47154abb7392e54357e6c8c9c"
+SRC_URI[md5sum] = "f4711f856fe14de222b9da3d3b8efa89"
+SRC_URI[sha256sum] = "46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
-- 
2.7.4




