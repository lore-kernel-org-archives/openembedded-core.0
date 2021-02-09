Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.12468.1612885988361102987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +PWwVR0/1nxL+iPFK/K0Gw9FAZ1WHEaowAOQBBZYkACRe1ZucKMyEQsxfjyb9ENYKyMjr1jDFG
 dhu639PESVMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="266735993"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="266735993"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:09 -0800
IronPort-SDR: +oEqepaEuXKPBuedqHH3gE8ZHILB/zp+4NlLtkrt5aQRJHhRWt6aMObgXpdzOZwZ/gncF5M+Lb
 C/832tZ1tqSg==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215556"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:08 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 22/35] libcroco: Added CVE
Date: Tue,  9 Feb 2021 23:52:07 +0800
Message-Id: <5fbf670ec5606f628758b433fe956134b7261dd7.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: saloni <saloni.jain@kpit.com>

Added below CVE:
CVE-2020-12825
Link: CVE-2020-12825 [https://gitlab.gnome.org/Archive/libcroco/-/commit/6eb257e5c731c691eb137fca94e916ca73941a5a]
Link: https://gitlab.gnome.org/Archive/libcroco/-/issues/8

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8cee7386c556e1c5adb07a0aee385642b7a5568)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libcroco/files/CVE-2020-12825.patch       | 192 ++++++++++++++++++
 .../libcroco/libcroco_0.6.13.bb               |   3 +
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/files/CVE-2020-12825.patch

diff --git a/meta/recipes-support/libcroco/files/CVE-2020-12825.patch b/meta/recipes-support/libcroco/files/CVE-2020-12825.patch
new file mode 100644
index 0000000000..42f92e3607
--- /dev/null
+++ b/meta/recipes-support/libcroco/files/CVE-2020-12825.patch
@@ -0,0 +1,192 @@
+From fdf78a4877afa987ba646a8779b513f258e6d04c Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@gnome.org>
+Date: Fri, 31 Jul 2020 15:21:53 -0500
+Subject: [PATCH] libcroco: Limit recursion in block and any productions
+
+ (CVE-2020-12825)
+
+If we don't have any limits, we can recurse forever and overflow the
+stack.
+
+Fixes #8
+This is per https://gitlab.gnome.org/Archive/libcroco/-/issues/8
+
+https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/1404
+
+CVE: CVE-2020-12825
+Upstream-Status: Backport [https://gitlab.gnome.org/Archive/libcroco/-/commit/6eb257e5c731c691eb137fca94e916ca73941a5a]
+Comment: No refreshing changes done.
+Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
+
+---
+ src/cr-parser.c | 44 +++++++++++++++++++++++++++++---------------
+ 1 file changed, 29 insertions(+), 15 deletions(-)
+
+diff --git a/src/cr-parser.c b/src/cr-parser.c
+index 18c9a01..f4a62e3 100644
+--- a/src/cr-parser.c
++++ b/src/cr-parser.c
+@@ -136,6 +136,8 @@ struct _CRParserPriv {
+ 
+ #define CHARS_TAB_SIZE 12
+ 
++#define RECURSIVE_CALLERS_LIMIT 100
++
+ /**
+  * IS_NUM:
+  *@a_char: the char to test.
+@@ -344,9 +346,11 @@ static enum CRStatus cr_parser_parse_selector_core (CRParser * a_this);
+ 
+ static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_this);
+ 
+-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
++                                               guint      n_calls);
+ 
+-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
++                                                 guint      n_calls);
+ 
+ static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
+ 
+@@ -784,7 +788,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+         cr_parser_try_to_skip_spaces_and_comments (a_this);
+ 
+         do {
+-                status = cr_parser_parse_any_core (a_this);
++                status = cr_parser_parse_any_core (a_this, 0);
+         } while (status == CR_OK);
+ 
+         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
+@@ -795,7 +799,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, 
+                                       token);
+                 token = NULL;
+-                status = cr_parser_parse_block_core (a_this);
++                status = cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status,
+                                       FALSE);
+                 goto done;
+@@ -930,11 +934,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
+ 
+         RECORD_INITIAL_POS (a_this, &init_pos);
+ 
+-        status = cr_parser_parse_any_core (a_this);
++        status = cr_parser_parse_any_core (a_this, 0);
+         CHECK_PARSING_STATUS (status, FALSE);
+ 
+         do {
+-                status = cr_parser_parse_any_core (a_this);
++                status = cr_parser_parse_any_core (a_this, 0);
+ 
+         } while (status == CR_OK);
+ 
+@@ -956,10 +960,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
+  *in chapter 4.1 of the css2 spec.
+  *block ::= '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
+  *@param a_this the current instance of #CRParser.
++ *@param n_calls used to limit recursion depth
+  *FIXME: code this function.
+  */
+ static enum CRStatus
+-cr_parser_parse_block_core (CRParser * a_this)
++cr_parser_parse_block_core (CRParser * a_this,
++                            guint      n_calls)
+ {
+         CRToken *token = NULL;
+         CRInputPos init_pos;
+@@ -967,6 +973,9 @@ cr_parser_parse_block_core (CRParser * a_this)
+ 
+         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_ERROR);
+ 
++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
++                return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+ 
+         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &token);
+@@ -996,13 +1005,13 @@ cr_parser_parse_block_core (CRParser * a_this)
+         } else if (token->type == CBO_TK) {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token = NULL;
+-                status = cr_parser_parse_block_core (a_this);
++                status = cr_parser_parse_block_core (a_this, n_calls + 1);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         } else {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token = NULL;
+-                status = cr_parser_parse_any_core (a_this);
++                status = cr_parser_parse_any_core (a_this, n_calls + 1);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         }
+@@ -1109,7 +1118,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status = cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token = NULL;
+-                status = cr_parser_parse_block_core (a_this);
++                status = cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 ref++;
+                 goto continue_parsing;
+@@ -1123,7 +1132,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status = cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token = NULL;
+-                status = cr_parser_parse_any_core (a_this);
++                status = cr_parser_parse_any_core (a_this, 0);
+                 if (status == CR_OK) {
+                         ref++;
+                         goto continue_parsing;
+@@ -1162,10 +1171,12 @@ cr_parser_parse_value_core (CRParser * a_this)
+  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
+  *
+  *@param a_this the current instance of #CRParser.
++ *@param n_calls used to limit recursion depth
+  *@return CR_OK upon successfull completion, an error code otherwise.
+  */
+ static enum CRStatus
+-cr_parser_parse_any_core (CRParser * a_this)
++cr_parser_parse_any_core (CRParser * a_this,
++                          guint      n_calls)
+ {
+         CRToken *token1 = NULL,
+                 *token2 = NULL;
+@@ -1174,6 +1185,9 @@ cr_parser_parse_any_core (CRParser * a_this)
+ 
+         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
+ 
++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
++                return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+ 
+         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &token1);
+@@ -1212,7 +1226,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                  *We consider parameter as being an "any*" production.
+                  */
+                 do {
+-                        status = cr_parser_parse_any_core (a_this);
++                        status = cr_parser_parse_any_core (a_this, n_calls + 1);
+                 } while (status == CR_OK);
+ 
+                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
+@@ -1237,7 +1251,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+ 
+                 do {
+-                        status = cr_parser_parse_any_core (a_this);
++                        status = cr_parser_parse_any_core (a_this, n_calls + 1);
+                 } while (status == CR_OK);
+ 
+                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
+@@ -1265,7 +1279,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+ 
+                 do {
+-                        status = cr_parser_parse_any_core (a_this);
++                        status = cr_parser_parse_any_core (a_this, n_calls + 1);
+                 } while (status == CR_OK);
+ 
+                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
index 9171a9de5c..a443ff23fe 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -18,3 +18,6 @@ inherit gnomebase gtk-doc binconfig-disabled
 
 SRC_URI[archive.md5sum] = "c80c5a8385011a0260dce6bd0da93dce"
 SRC_URI[archive.sha256sum] = "767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4"
+
+SRC_URI +="file://CVE-2020-12825.patch \
+"
-- 
2.29.2

