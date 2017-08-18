Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32947783FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 17:43:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7IHhj4w024060
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 10:43:45 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 10:43:44 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Aug 2017 10:43:44 -0700
Message-ID: <20170818174344.251791-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] ruby: fix CVE-2017-922{6-9}
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
X-List-Received-Date: Fri, 18 Aug 2017 17:43:45 -0000
Content-Type: text/plain

CVE-2017-9226 : check too big code point value for single byte
CVE-2017-9227 : access to invalid address by reg->dmin value
CVE-2017-9228 : invalid state(CCS_VALUE) in parse_char_class()
CVE-2017-9229 : access to invalid address by reg->dmax value

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ruby/ruby/ruby-CVE-2017-9226.patch             | 41 +++++++++++++++
 .../ruby/ruby/ruby-CVE-2017-9227.patch             | 32 ++++++++++++
 .../ruby/ruby/ruby-CVE-2017-9228.patch             | 34 +++++++++++++
 .../ruby/ruby/ruby-CVE-2017-9229.patch             | 59 ++++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.4.1.bb           |  4 ++
 5 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch

diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
new file mode 100644
index 0000000..0f2a430
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
@@ -0,0 +1,41 @@
+From b4bf968ad52afe14e60a2dc8a95d3555c543353a Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Thu, 18 May 2017 17:05:27 +0900
+Subject: [PATCH] fix #55 : check too big code point value for single byte
+ value in next_state_val()
+
+---
+ regparse.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+--- end of original header
+
+CVE: CVE-2017-9226
+
+Add check for octal number bigger than 255.
+
+Upstream-Status: Pending
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- ruby-2.4.1.orig/regparse.c
++++ ruby-2.4.1/regparse.c
+@@ -3644,7 +3644,7 @@ fetch_token(OnigToken* tok, UChar** src,
+       if (IS_SYNTAX_OP(syn, ONIG_SYN_OP_ESC_OCTAL3)) {
+ 	prev = p;
+ 	num = scan_unsigned_octal_number(&p, end, (c == '0' ? 2:3), enc);
+-	if (num < 0) return ONIGERR_TOO_BIG_NUMBER;
++	if (num < 0 || 0xff < num) return ONIGERR_TOO_BIG_NUMBER;
+ 	if (p == prev) {  /* can't read nothing. */
+ 	  num = 0; /* but, it's not error */
+ 	}
+@@ -4450,6 +4450,9 @@ next_state_val(CClassNode* cc, CClassNod
+   switch (*state) {
+   case CCS_VALUE:
+     if (*type == CCV_SB) {
++      if (*vs > 0xff)
++          return ONIGERR_INVALID_CODE_POINT_VALUE;
++
+       BITSET_SET_BIT_CHKDUP(cc->bs, (int )(*vs));
+       if (IS_NOT_NULL(asc_cc))
+ 	BITSET_SET_BIT(asc_cc->bs, (int )(*vs));
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
new file mode 100644
index 0000000..85e7ccb
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
@@ -0,0 +1,32 @@
+From 9690d3ab1f9bcd2db8cbe1fe3ee4a5da606b8814 Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Tue, 23 May 2017 16:15:35 +0900
+Subject: [PATCH] fix #58 : access to invalid address by reg->dmin value
+
+---
+ regexec.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+--- end of original header
+
+CVE: CVE-2017-9227
+
+Upstream-Status: Inappropriate [not author]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/regexec.c b/regexec.c
+index d4e577d..2fa0f3d 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3154,6 +3154,8 @@ forward_search_range(regex_t* reg, const UChar* str, const UChar* end, UChar* s,
+     }
+     else {
+       UChar *q = p + reg->dmin;
++
++      if (q >= end) return 0; /* fail */
+       while (p < q) p += enclen(reg->enc, p, end);
+     }
+   }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch
new file mode 100644
index 0000000..d8bfba4
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch
@@ -0,0 +1,34 @@
+From 3b63d12038c8d8fc278e81c942fa9bec7c704c8b Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Wed, 24 May 2017 13:43:25 +0900
+Subject: [PATCH] fix #60 : invalid state(CCS_VALUE) in parse_char_class()
+
+---
+ regparse.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- end of original header
+
+CVE: CVE-2017-9228
+
+Upstream-Status: Inappropriate [not author]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/regparse.c b/regparse.c
+index 69875fa..1988747 100644
+--- a/regparse.c
++++ b/regparse.c
+@@ -4081,7 +4081,9 @@ next_state_class(CClassNode* cc, OnigCodePoint* vs, enum CCVALTYPE* type,
+     }
+   }
+ 
+-  *state = CCS_VALUE;
++  if (*state != CCS_START)
++    *state = CCS_VALUE;
++
+   *type  = CCV_CLASS;
+   return 0;
+ }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch
new file mode 100644
index 0000000..6e765bf
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch
@@ -0,0 +1,59 @@
+From b690371bbf97794b4a1d3f295d4fb9a8b05d402d Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Wed, 24 May 2017 10:27:04 +0900
+Subject: [PATCH] fix #59 : access to invalid address by reg->dmax value
+
+---
+ regexec.c |   27 +++++++++++++++++----------
+ 1 file changed, 17 insertions(+), 10 deletions(-)
+
+--- end of original header
+
+CVE: CVE-2017-9229
+
+Upstream-Status: Inappropriate [not author]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/regexec.c b/regexec.c
+index 49bcc50..c0626ef 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3756,18 +3756,25 @@ forward_search_range(regex_t* reg, const
+     }
+     else {
+       if (reg->dmax != ONIG_INFINITE_DISTANCE) {
+-	*low = p - reg->dmax;
+-	if (*low > s) {
+-	  *low = onigenc_get_right_adjust_char_head_with_prev(reg->enc, s,
+-							      *low, end, (const UChar** )low_prev);
+-	  if (low_prev && IS_NULL(*low_prev))
+-	    *low_prev = onigenc_get_prev_char_head(reg->enc,
+-						   (pprev ? pprev : s), *low, end);
++        if (p - str < reg->dmax) {
++          *low = (UChar* )str;
++          if (low_prev)
++            *low_prev = onigenc_get_prev_char_head(reg->enc, str, *low, end);
+ 	}
+ 	else {
+-	  if (low_prev)
+-	    *low_prev = onigenc_get_prev_char_head(reg->enc,
+-					       (pprev ? pprev : str), *low, end);
++          *low = p - reg->dmax;
++          if (*low > s) {
++            *low = onigenc_get_right_adjust_char_head_with_prev(reg->enc, s,
++                                                 *low, end, (const UChar** )low_prev);
++            if (low_prev && IS_NULL(*low_prev))
++              *low_prev = onigenc_get_prev_char_head(reg->enc,
++                                                     (pprev ? pprev : s), *low, end);
++          }
++          else {
++            if (low_prev)
++              *low_prev = onigenc_get_prev_char_head(reg->enc,
++                                                     (pprev ? pprev : str), *low, end);
++          }
+ 	}
+       }
+     }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/ruby/ruby_2.4.1.bb b/meta/recipes-devtools/ruby/ruby_2.4.1.bb
index 77e17f1..4443146 100644
--- a/meta/recipes-devtools/ruby/ruby_2.4.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.4.1.bb
@@ -2,6 +2,10 @@ require ruby.inc
 
 SRC_URI += " \
            file://ruby-CVE-2017-9224.patch \
+           file://ruby-CVE-2017-9226.patch \
+           file://ruby-CVE-2017-9227.patch \
+           file://ruby-CVE-2017-9228.patch \
+           file://ruby-CVE-2017-9229.patch \
            "
 
 SRC_URI[md5sum] = "782bca562e474dd25956dd0017d92677"
-- 
2.7.4


