Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3762.1611212382401440441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 22:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,363,1602518400"; 
   d="scan'208";a="103689385"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jan 2021 14:59:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 058664CE6018
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 14:59:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 Jan 2021 14:59:29 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libcroco: CVE-2020-12825 Security Advisory
Date: Thu, 21 Jan 2021 14:59:26 +0800
Message-ID: <1611212366-44911-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 058664CE6018.A23DF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12825

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libcroco/libcroco/CVE-2020-12825.patch    | 170 ++++++++++++++++++
 .../libcroco/libcroco_0.6.13.bb               |   2 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
new file mode 100644
index 0000000000..cde0abd676
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
@@ -0,0 +1,170 @@
+Subject: [PATCH] libcroco: Limit recursion in block and any productions
+
+Signed-off-by:Michael Catanzaro @mcatanzaro
+---
+ src/cr-parser.c | 42 +++++++++++++++++++++++++++---------------
+ 1 file changed, 27 insertions(+), 15 deletions(-)
+
+diff --git a/src/cr-parser.c b/src/cr-parser.c
+index 18c9a01..4e5b424 100644
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
++		status = cr_parser_parse_any_core (a_this, 0);
+         } while (status == CR_OK);
+ 
+         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
+@@ -795,7 +799,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, 
+                                       token);
+                 token = NULL;
+-                status = cr_parser_parse_block_core (a_this);
++		status = cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status,
+                                       FALSE);
+                 goto done;
+@@ -930,11 +934,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
+ 
+         RECORD_INITIAL_POS (a_this, &init_pos);
+ 
+-        status = cr_parser_parse_any_core (a_this);
++	status = cr_parser_parse_any_core (a_this, 0);
+         CHECK_PARSING_STATUS (status, FALSE);
+ 
+         do {
+-                status = cr_parser_parse_any_core (a_this);
++		status = cr_parser_parse_any_core (a_this, 0);
+ 
+         } while (status == CR_OK);
+ 
+@@ -959,7 +963,8 @@ cr_parser_parse_selector_core (CRParser * a_this)
+  *FIXME: code this function.
+  */
+ static enum CRStatus
+-cr_parser_parse_block_core (CRParser * a_this)
++cr_parser_parse_block_core (CRParser * a_this,
++                            guint      n_calls)
+ {
+         CRToken *token = NULL;
+         CRInputPos init_pos;
+@@ -967,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)
+ 
+         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_ERROR);
+ 
++	if (n_calls > RECURSIVE_CALLERS_LIMIT)
++                return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+ 
+         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &token);
+@@ -996,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)
+         } else if (token->type == CBO_TK) {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token = NULL;
+-                status = cr_parser_parse_block_core (a_this);
++		status = cr_parser_parse_block_core (a_this, n_calls + 1);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         } else {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token = NULL;
+-                status = cr_parser_parse_any_core (a_this);
++		status = cr_parser_parse_any_core (a_this, n_calls + 1);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         }
+@@ -1109,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status = cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token = NULL;
+-                status = cr_parser_parse_block_core (a_this);
++		status = cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 ref++;
+                 goto continue_parsing;
+@@ -1123,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status = cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token = NULL;
+-                status = cr_parser_parse_any_core (a_this);
++		status = cr_parser_parse_any_core (a_this, 0);
+                 if (status == CR_OK) {
+                         ref++;
+                         goto continue_parsing;
+@@ -1165,7 +1173,8 @@ cr_parser_parse_value_core (CRParser * a_this)
+  *@return CR_OK upon successfull completion, an error code otherwise.
+  */
+ static enum CRStatus
+-cr_parser_parse_any_core (CRParser * a_this)
++cr_parser_parse_any_core (CRParser * a_this,
++                          guint      n_calls)
+ {
+         CRToken *token1 = NULL,
+                 *token2 = NULL;
+@@ -1174,6 +1183,9 @@ cr_parser_parse_any_core (CRParser * a_this)
+ 
+         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
+ 
++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
++        return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+ 
+         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &token1);
+@@ -1212,7 +1224,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                  *We consider parameter as being an "any*" production.
+                  */
+                 do {
+-                        status = cr_parser_parse_any_core (a_this);
++			status = cr_parser_parse_any_core (a_this, n_calls + 1);
+                 } while (status == CR_OK);
+ 
+                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
+@@ -1237,7 +1249,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+ 
+                 do {
+-                        status = cr_parser_parse_any_core (a_this);
++			status = cr_parser_parse_any_core (a_this, n_calls + 1);
+                 } while (status == CR_OK);
+ 
+                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
+@@ -1265,7 +1277,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+ 
+                 do {
+-                        status = cr_parser_parse_any_core (a_this);
++			status = cr_parser_parse_any_core (a_this, n_calls + 1);
+                 } while (status == CR_OK);
+ 
+                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
index 9171a9de5c..dbeec03c0b 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://src/cr-rgb.c;endline=22;md5=31d5f0944d556c8589d04ea6055fcc66 \
                     file://tests/cr-test-utils.c;endline=21;md5=2382c27934cae1d3792fcb17a6142c4e"
 
+SRC_URI += "file://CVE-2020-12825.patch"
+
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1



