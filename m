Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.57])
 by mx.groups.io with SMTP id smtpd.web10.22515.1617029515094355820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 07:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=SgoYEwY/;
 spf=pass (domain: kpit.com, ip: 40.107.139.57, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IN3Xdzen0DDpq7fTX8T+QHF0CoU8/TrvtnSw5NuVP3maQf0CPhcavzeAbACVJtAdZrcJXGeV3L0ki9b+nmyDbyedh57IMzFTYR3zqEIEzwsS2FoDS8usnxJxNMJV42D/TVh/i2a7IVqWY2guViSw6U0O/krb0cO/S6AkTmGpW3HD+c7IyHQ/Q/asaty8mhwCddnF002SJTEgIe9SzfNSTsmFcuJOrGHlhFdBGEKc1B58XUaSw4UyPvxr1+yaz/ECEbarmv8/WpDCDI/11s36x2AiHYWdNoucMNRsealPvMK5PmOjxTv25fuMIc/jdkNlyLNV9A1MSVrdc5rYSWB3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxqdQ7T/YJVuY7ooJYelegLembJijrqnnFx0W5AEP3I=;
 b=UrVnfvFyoL4ZBdQVCHUZ6E77vQDELto8w+Wr3A9Dcwgvq5w1k8FfmyLDSKYB/c8vwzSiJO6Z6Vrj5UxX8DvSzi1TZd0pCmhOtIjCpGEaGAXSonMaQQKkq9HID703T9v4fsEmdY/nMGJR/n+EWOduxuVskw5N3+6+Iq4kecAcO+6ZJWqWqVg+GE+F9WI+BcaGgS6+QkO+TxvjHdCdXuQYjpwu98mt8rRXjK+nu26W36E8wpQSaokJu4804HcF486SgaJhqiO37Z5rGwiuGo4nVVL8dcyYLDtC3PTBmV+dwM4EqIpE+A0tDI8ZhVTNHnyIpunUcrLl0QPBXmxvsEeV7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxqdQ7T/YJVuY7ooJYelegLembJijrqnnFx0W5AEP3I=;
 b=SgoYEwY/XB4641ZcI5tPaM+/bIiPMMfhlqZeXKRBFO2ffSroL+qtdWH3uXVvvkYVNKkxy9BmcXqJPdTLe/zw3J2XAc7uFwgwvDqlW3SvpZoAXTglBF0x3v+a1JgqEjqJWD6RB70uYP11gJSGG4zM0TXUAkjwvBPDiN9H2IzkWZw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BMXPR01MB3782.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:5e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 14:51:49 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 14:51:49 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-oe][gatesgarth][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Mon, 29 Mar 2021 20:21:40 +0530
Message-Id: <1617029500-16290-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4053:2e83:3ab9:7daf:a153:a495:7080]
X-ClientProxiedBy: PN1PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::33) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4053:2e83:3ab9:7daf:a153:a495:7080) by PN1PR01CA0093.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 14:51:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 66accbcc-4f55-4ead-4ae1-08d8f2c22e97
X-MS-TrafficTypeDiagnostic: BMXPR01MB3782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB37821E7A5DAD2E82CD705CBE9F7E9@BMXPR01MB3782.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CRBOqyIYPTr7ZvrPT6/4l5tUajwIxanNwo+HYbOjuvkIlV2I5a7hrXLM0pyCjvL9tOBzIX1ZYOQBlzQRrdRYvNU8hp6DCmFvhWEZx58OZ3zVpfhTiUFTuBA+1fZCtIn2Eop5ru1UZGoTxRKcD8qiYJ1bNdqLZM2Wvtr55e24HS7DZeO4YwsuIBAFSUR2pFhcRqQi77NInfMSj+vNGS2veqNeeo0FfcB/ZlBH2VB1LPE60aYkFD/qy5ZUSTuHoEyexPuE2MKuQwFZX3nkEikiRJz/nn9m4R08l6dQt4zTlFZqZEzyPI8axLsYQeDrm47hmXXKE1sVJgLxhyWRq+LW1tUN8JqY7PAjSCdpPW2Ev33BONZw/lsXj/N5hDGLgtaPEs0V78g8T026P3x4XzE0514jkRLloqxNth7ePCymArjNTjKp0HhwbJbWJsj31++o1kCJLVso/6S4pKg6cuTlq7md4SB+b1+twuhSA9Pq+vkMnIOAOY65MOSkF7ptpAFbRH/BffIF1c9V1UMYG4eCreT6rvlxh/7g6rHoxnRppyZNXZGamQtAELyaYITib2rQ+u9R6J85/ARzFDXqKuWAw6RZT+1Bcf165ZzNmdjUBUfAKyHGIvjIs1XD+bMIUV+exCZUQlRJgInDPLZivFr5y1xj8zFXY6ol5Wx25p06dqqs9bGnObO6dC6assuDlIT2Y/peuP26qUcWRo/FLHszzv7mBjdGdYSDeE+evcJOlLxhdftH/3wpTw3mYE6Z2rFtYiQKvQVtf0flzxz12TjiBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39840400004)(366004)(376002)(346002)(4326008)(36756003)(8676002)(2616005)(69590400012)(2906002)(8936002)(83380400001)(316002)(52116002)(6506007)(16526019)(186003)(66574015)(86362001)(5660300002)(38100700001)(966005)(66476007)(66556008)(6512007)(6486002)(6666004)(478600001)(66946007)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?cG+8pu9y0vAdikyAKrGehEbZ5l2GLlXqyyhLCNg00OxrCBmW5BOmohDkT7zF?=
 =?us-ascii?Q?/5W3z5Nw+frwSi3bNeiV64kV5C/+JP1lqLKeQdTEXc/0N2vIjH79bvqwXkwn?=
 =?us-ascii?Q?Af+cqXQenv5qFRluO3b2z82g/zPmrmSJZ/g5FhLNKYUgJMofLYaMRx4jkXKw?=
 =?us-ascii?Q?6/ZwaD+c0qbWspEWUbXNM9pfYFzR0UHHc7ZMxHFq7GaUVVd+twxslyWSKcND?=
 =?us-ascii?Q?PtjLGOuv2g+MSDZGOPFTqMmwaJ0mR+XZAB8RqCCNGgRdVoDQe+BG6UxjGGhP?=
 =?us-ascii?Q?nIeptNhbn/PxMNc0ITzftQhqhR6OXeQX2kusAkqw11GbHWebWBCFm75P1QfG?=
 =?us-ascii?Q?Ymxk5OE6B7XnsmjtGx1hVJxb25QcsaCJmI2Y/rea2hY3sT7+XzzJxUQU4trG?=
 =?us-ascii?Q?qcqIuwh5gkogBYAgF9EjBvOzpgAlVQDgG0W1OnxLPgLhXxUqRULlFC2bGOqq?=
 =?us-ascii?Q?K8rhiKNPeAurqM5eRqPVdJwe8CX2tLqRLjiirSuj1lDEsiDseYFDVJB6G8oS?=
 =?us-ascii?Q?TZnT35F2tRCPLo6a8zlbB/pRVtro3ai6V0nJBhkFuA7HfH77m7Zc1QaUEYaY?=
 =?us-ascii?Q?EEW6kWvBkGxKOkfdqgTypb5oC6woUR9StHmW+I5NyE4i2rx8WAYSY7aATpWJ?=
 =?us-ascii?Q?uVF5qEIjgKeWgGU0fgRrcPMTLIZYp0UjLX5EuS0TG5XpjyMv/DqZIEC9G1SM?=
 =?us-ascii?Q?AqOkrxhgdY9oxKyoTgmjfywkUgqu1U2ny0jUKT28rC6TvSA1HK4s44Lv9LH5?=
 =?us-ascii?Q?7Ye0scI0qKibMqMFs+T0i7SAlbyy4MW0+VSjVoT7WgsVRpvgj44+SGw4jCAB?=
 =?us-ascii?Q?qT/5DAYLPwKNUe2op/a92slXKq4kip6jd2tiBBoHjhvqeboQho908G+9bKjC?=
 =?us-ascii?Q?qtqkq59/YSN88CXHJDQWpi7jDiAaI5oLNBeW97QETBKZSXdG0u5tBv/n7VBx?=
 =?us-ascii?Q?vWOHdZnUjRnhNM2DDVtT3XZv9uSXdRD84MCpPg5GaKxCtI5tNh2E4nSVg4hQ?=
 =?us-ascii?Q?lhMv1BD7SgtPjPKKJB1oOFYkjnMyEz2rPUjabK1peNPKsZ47DYeBsPWI4nZy?=
 =?us-ascii?Q?TPG/hkjeyFMWfHm5Q3f7jR4Fr6FT/44btJSACUkpVXejBqVKj5JdBrniqveh?=
 =?us-ascii?Q?2ofg8mXaQxPV0cL6OX0p5aMfe2wIgCt7J31kCVEL4AaWF/rp/ERa131JubHu?=
 =?us-ascii?Q?IqNWnWYY3PN9XN5b0d/qSpOqoDzZRsQ51Q45lLrdZnxuev8RJRjJrVxRw3Tt?=
 =?us-ascii?Q?so6gvzrF8uhjl6FLuFfI6nvm5PtJmKR1GYWAQv5wFvixZQtAbj7RUkwrJu3H?=
 =?us-ascii?Q?rDXNkXyKHcyha2zD6y2QZFH07mNRXd0dZpqtzFhLORWzAyc6c7AdYE3NuhBR?=
 =?us-ascii?Q?acLH60iDKdEfFNRslHYWdQ0KGRoZ?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66accbcc-4f55-4ead-4ae1-08d8f2c22e97
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 14:51:49.6207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jpYCAx2XsGLK460nQ6iUTJU79vBNPmQc1GFSzcWGiLSjW63wzHT0IvxglO86cbnRko6H+7yfyMVSMZxifw7iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3782
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Neetika Singh <Neetika.Singh@kpit.com>

Added refreshed patch for CVE issue CVE-2020-12825
Link: https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863dd=
a61593003b4c31f25

Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
---
 .../libcroco/libcroco/CVE-2020-12825.patch         | 192 +++++++++++++++++=
++++
 meta/recipes-support/libcroco/libcroco_0.6.13.bb   |  22 +++
 2 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.p=
atch
 create mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch b/=
meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
new file mode 100644
index 0000000..f813ded
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
@@ -0,0 +1,192 @@
+From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@gnome.org>
+Date: Thu, 13 Aug 2020 20:03:05 -0500
+Subject: [PATCH] libcroco parser: limit recursion in block and any product=
ions
+
+If we don't have any limits, we can recurse forever and overflow the
+stack.
+
+This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_core
+in cr-parser.c.
+
+Bug: https://gitlab.gnome.org/Archive/libcroco/-/issues/8
+Patch from https://gitlab.gnome.org/Archive/libcroco/-/merge_requests/5
+
+CVE: CVE-2020-12825
+Upstream Status: Backport [https://gitlab.com/inkscape/inkscape/-/commit/2=
03d62efefe6f79080863dda61593003b4c31f25.patch]
+
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ src/cr-parser.c | 44 ++++++++++++++++++++-----------
+ 1 file changed, 29 insertions(+), 15 deletions(-)
+
+diff --git a/src/cr-parser.c b/src/cr-parser.c
+index d85e71f0fc..cd7b6ebd4a 100644
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
+@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_core (C=
RParser * a_this);
+
+ static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_this)=
;
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
+@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+         cr_parser_try_to_skip_spaces_and_comments (a_this);
+
+         do {
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+         } while (status =3D=3D CR_OK);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
+@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                       token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status,
+                                       FALSE);
+                 goto done;
+@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
+
+         RECORD_INITIAL_POS (a_this, &init_pos);
+
+-        status =3D cr_parser_parse_any_core (a_this);
++        status =3D cr_parser_parse_any_core (a_this, 0);
+         CHECK_PARSING_STATUS (status, FALSE);
+
+         do {
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+
+         } while (status =3D=3D CR_OK);
+
+@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
+  *in chapter 4.1 of the css2 spec.
+  *block ::=3D '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
+  *@param a_this the current instance of #CRParser.
++ *@param n_calls used to limit recursion depth
+  *FIXME: code this function.
+  */
+ static enum CRStatus
+-cr_parser_parse_block_core (CRParser * a_this)
++cr_parser_parse_block_core (CRParser * a_this,
++                            guint      n_calls)
+ {
+         CRToken *token =3D NULL;
+         CRInputPos init_pos;
+@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)
+
+         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_ER=
ROR);
+
++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
++                return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &tok=
en);
+@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)
+         } else if (token->type =3D=3D CBO_TK) {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, n_calls + =
1);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         } else {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, n_calls + 1)=
;
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         }
+@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 ref++;
+                 goto continue_parsing;
+@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+                 if (status =3D=3D CR_OK) {
+                         ref++;
+                         goto continue_parsing;
+@@ -1162,10 +1162,12 @@
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
+         CRToken *token1 =3D NULL,
+                 *token2 =3D NULL;
+@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)
+
+         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
+
++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
++                return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &tok=
en1);
+@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                  *We consider parameter as being an "any*" production.
+                  */
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+--
+GitLab
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipe=
s-support/libcroco/libcroco_0.6.13.bb
new file mode 100644
index 0000000..fd5927e
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Cascading Style Sheet (CSS) parsing and manipulation toolkit"
+HOMEPAGE =3D "http://www.gnome.org/"
+BUGTRACKER =3D "https://bugzilla.gnome.org/"
+
+LICENSE =3D "LGPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc60=
5 \
+                    file://src/cr-rgb.c;endline=3D22;md5=3D31d5f0944d556c8=
589d04ea6055fcc66 \
+                    file://tests/cr-test-utils.c;endline=3D21;md5=3D2382c2=
7934cae1d3792fcb17a6142c4e"
+
+SECTION =3D "x11/utils"
+DEPENDS =3D "glib-2.0 libxml2 zlib"
+BBCLASSEXTEND =3D "native nativesdk"
+EXTRA_OECONF +=3D "--enable-Bsymbolic=3Dauto"
+
+BINCONFIG =3D "${bindir}/croco-0.6-config"
+
+inherit gnomebase gtk-doc binconfig-disabled
+
+SRC_URI +=3D "file://CVE-2020-12825.patch"
+
+SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
+SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e063f=
92db585759b422570621d4"
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
