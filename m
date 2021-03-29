Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.80])
 by mx.groups.io with SMTP id smtpd.web12.22879.1617028972643770974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 07:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=nWRbpjg6;
 spf=pass (domain: kpit.com, ip: 40.107.139.80, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkko3rUsM5VKnvfIzmtiqKwa1gPM8nM4h5yB9niAi6zQFmBYbOiTWMMaRNQWORhwdL2rGNCVDjzCQdtYK0Uj52Tkm/wWuhBV6EKhm7qwvof/I0acfGmNiLHIxGs7LNVFPwwqDGrvQ7OlFcc6bco1436ho4DKnbei4mdko/Ewj/196DmCGZ8hL9LZz7KkX6gUVjMLug8YSZSSVbxdli0s6uvCpH+zfs2D1ntG5MAqhIgh6LKGgz6t8aFfaBreBfEP3X2Q7zkPlj9M+1UySWA7+eIeB10u7yrH/KtB0mU3sWIth5IoXbf0v8fJhMAj534+JlcOd9G1LlE7VoDd6BufIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxqdQ7T/YJVuY7ooJYelegLembJijrqnnFx0W5AEP3I=;
 b=C10Yrww6iAW0RTC3jYNDUOe1lHCwl1Ea8/bvrF0B+oxPIcQPAjkQqI7mCPQG0DjZjbU6wqSLqqaQRCyCWstbQoKEXPks1h6duc6lmhHrwSiGEYcqnGBLeylMhOmoTnDVzP+TeZfRxtqNe+HcQg/n9HwoMU8pYVvV2doh99SRnfZdRe96owyiorrXa6tZvht9rxkFr+frdVp1l0JvF32E/SPxS7J3EWf9Hi6Kvus7r4/g97VdQV0cjG2cbaS6GLGpF3ResWMIkysDNvuwqe+Rlng7UFcK5wZ/WMGA7T6l34vQW0w1ul2CvJp4S8DqIXsoQYNlK+1w6W/4q/m5Cbyxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxqdQ7T/YJVuY7ooJYelegLembJijrqnnFx0W5AEP3I=;
 b=nWRbpjg69WEYYmMeUa6LQrCvLUHDISyGONoYUMnwWSy0cU0S3a3UZdx8Oynkaao3cqRu+3x1g++eSP7ewz5JbeBvkhHTVsSqDiZ8cZKruTODBubYFJeKoAnA/wr6NNBttYacozCPc4FEEQWUqxpfYXn2jK/xqloD+HpBXy8prEI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR01MB0932.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 14:42:46 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 14:42:46 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Mon, 29 Mar 2021 20:12:32 +0530
Message-Id: <1617028952-12188-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4053:2e83:3ab9:7daf:a153:a495:7080]
X-ClientProxiedBy: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4053:2e83:3ab9:7daf:a153:a495:7080) by BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 14:42:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 077a98d1-eeaa-49f8-4b75-08d8f2c0eadd
X-MS-TrafficTypeDiagnostic: BM1PR01MB0932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB09325C65CDFE22773B55B8629F7E9@BM1PR01MB0932.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u6gu0A/APFpS8+LXARcF1JeJe8nSFhqLaIJiJFrJKt+ivp6wmscAy0euna8jujVD3EFaOzTeJSkP/kRUQoAaNDEef2lRMT0Fk6ezBp/G/GLUiK0TUu9/2rrtbEwEvNvzae+0cYD3etx5DhJyu4ejra+efSsPvVwbO14C4944BiuPszuUvq/gkk4ldmMrgCJ1ttYEqQF4nCN6HFZUFYtPmg/4RAwyz6Z959rCWAl6V59UuSBcvl6HiVbyr8b3QGynUObtLGqnSYfqqSQaLBWyBgd34RQ5WuMNgHyOlJkEB8WCOBVaSoWIv2uQ2FOddE8A2MBCo4prEE995dGXDq2CM7EhePYDY+vbBa6DejkuB5NdRbUHx5SyBuOjz7ZqdEwXXVqixp4tVEg6iDnMxMXynpLV//0giTfqoo5P2IkHteqdl57sWhWkFnLeAE2pIej2/v14RCVU3VSDqJuNqvVmYT67dFodwWt7HcFDw8iT0hqOQonh2pn5tq0vH6AQQ0M/T0byRHeKf1NxPkkkK8fK2HeoD+nP5m3BcrwahyeIyMwfelYlAKUgM0NiIoOmGq4cZBJSIYYoO9fzlmKMfMzdtTyiA/DTcAJ2jll38oY333z4RBaqA/hcJerjnc2MbZeR39K7vxTY/0krSZSYgSYBaiIoam2C2aFl55+FRK/ZaXoPe7U2DzyjzXwPoBrvvfO1fzSLLdq0uCEMGWFAfVPeWXlMK+WkwaCuoZQ1Ste2VQvA++JE8GMJw8eA+PO5a40XrKIt0QdgGSsWMocnG4qAcg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(346002)(366004)(376002)(396003)(4326008)(36756003)(8676002)(2906002)(107886003)(2616005)(66574015)(5660300002)(52116002)(69590400012)(316002)(186003)(86362001)(16526019)(966005)(66476007)(66556008)(66946007)(6506007)(6666004)(6486002)(83380400001)(8936002)(38100700001)(478600001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZcE9yVXtHfEOt80MkTlIqnMKAkoNNsdGKDrgXsdWnne3upxajGDSaWLqD6uz?=
 =?us-ascii?Q?wffZnduy2HQyAoSWpUyjgOzm9RCN+eaFIg8TO4vCPixUYn2nt1ZxZ/WkezKr?=
 =?us-ascii?Q?CIz5+rZT8yRRbFR5u9JDcp8105QZDxNPSupanU1Sy4l4rtK5BQeiQWU2rNoA?=
 =?us-ascii?Q?qAB/kohsyUXIY/Lja29guaSue8vgpCpDBpQYMVXxsIEkLE+QbyNTKqSgnGZe?=
 =?us-ascii?Q?9ioFdI5TJ/pp+R0yB3kybWZgxgjmzLyBPWP0G4+UHm8/3+pNBAv88Ptco4Vm?=
 =?us-ascii?Q?XVvtwDcRCu3I/VbLuO0HII/foJpNBjd7LuRP8eyzk2lnh+JSCcHJXDMGhinS?=
 =?us-ascii?Q?M1ksTBMalCB1Q6EDDd2qqILEtCdboZ27gRULBo6j9/74byQwqz4ccwBjqk6l?=
 =?us-ascii?Q?cx3dsSQMxKX1U81zyKTZuizEWX7BWZTJlOjeFbDorUhVrtueacTbCvUsE3vy?=
 =?us-ascii?Q?TZstR7J0ybquTHZ691/W+SBSrkFRkXlHxHDZkJ/WYAn04bYVx7PpuaWMySBm?=
 =?us-ascii?Q?XrLH7x//O99hn4h1KkfTiV2awDVZQ4vh1ZMoN5kXCLuRXeMAAHesWZ4nqXd3?=
 =?us-ascii?Q?uiFAypXY5g2ElruMcEkRpoqOG6dQ3ZHp+BZ3tSfN+mvALe7PRoY/Ff2vh8uI?=
 =?us-ascii?Q?Cpj2e8Nuq348O9Ce2y65eW8nyX8Pf+O9ZKmckZIMeEXi9EFmkTWTNRXc3Yyo?=
 =?us-ascii?Q?usnR0KTWdo9vRS2cWnbgRTjZYob85zdrGfIrRSxKlutCz5QQMGJIGqgkU22I?=
 =?us-ascii?Q?LGai9iiPYpMhW6Z89hRVWe6brLbDcXfRaYzR5p7hUvj0D6RKdmohZN99F3o6?=
 =?us-ascii?Q?YkZGMKfK4KaaldDwSUCpT619cmxYCh5qN1sRLo/ImqXH3WcEY3eBs2OjfVaA?=
 =?us-ascii?Q?b9SaYAjPw9/yV8peDEgWj3pkvg0AdT3aqvAwrji+yk+UY/QJMmvb25bQe9EI?=
 =?us-ascii?Q?vtftMpe+AVKPdRRNYAGcpwhdqB/1cyNY444xaB5yojjLKrAYwtnrS4WN4BkC?=
 =?us-ascii?Q?HYyEHPjrIzSmI7BUGn2FhB5up0tjOx4A+vviKD7evdY9Se4+vdUs2gcNO1bo?=
 =?us-ascii?Q?t+7yz+m8Jjpywv4vA0oVu1ledtSj58S+jHDk/e0x5sOC9beCkcf1UxT4mLgA?=
 =?us-ascii?Q?fsIqiIlfX8u9mDkM7AScQu44HhPXeuonqc9YhhxdTBC7kJzI1C+Pwf0U/MzF?=
 =?us-ascii?Q?CS6Kmnye5ttU3pPtbx6wDqKI3u8iCoPnXoUXsqtQ3OACdyiPb75vD5fhmb84?=
 =?us-ascii?Q?jV0ACOviHXqd9Y8StI4Ld5XZpQNIteQ02eAvvUD+dMPnaqc9MapStaOlboLX?=
 =?us-ascii?Q?ND0NPpXLbxX0NMD/ezhOtTsXpz3Tv/DSQGj10v6k/XvKYby5gTHYxdskQkI3?=
 =?us-ascii?Q?o0JWDOU3LKriUy5jWTIf8w0glKuq?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077a98d1-eeaa-49f8-4b75-08d8f2c0eadd
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 14:42:46.4097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxeIwISxMPzgu/FteCr1mH2w2qBRu0dzy1Mmf+horl6/nkH/YcSO4xSJ1ao4a/oWD4efTqh2PPhv/8xWIlZegQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB0932
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
