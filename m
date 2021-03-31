Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.55])
 by mx.groups.io with SMTP id smtpd.web11.6573.1617197622157853080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 06:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=bVYBwCdU;
 spf=pass (domain: kpit.com, ip: 40.107.138.55, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvbtk5yNj/+cAFyOdcu6VFZo5dF8/8pAclK8JqAXlQZC1BdLZJCBriQlW4xN6XZwCjNFJv/bZJG8emH1rFbUskH1SiwJ3yCVDIIS5ik1rT3nTnnIOw0GB2hxN3zOY+Ij1jDlw6u+p+SPE1oNs7QV79z76zIvbFEcrUoRhg3mZY2q9pbGUQ3BBwQ5RqCktDkGJ+GHPNbMwr6AMi2kMJdR+1NbCO9QYaC4v8tMRLq4E/DdkbMypaOstriwU5FpQaVZ4UiPHu8vSONietzoQA2nTNPbDm0ptyzO38RnvFaVCSe4fawTv2mZtV6kPffxwoj176pXg/JJbPotXMA/z8uAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alwLpN/28f+KSJSPhaoXa8CeC8pzRytLTAFGgpaNago=;
 b=Ao5jksf7iaLdg3f7dRM5jIxIC3iUPcoXa8yb7I2hXNYHvsVVTj98U0xklcNi69eZvWmCIzJV9R7s3/RO0YFRh5qH9uebF3OWXxc0F77jozFquZ6N/h30HfX2Q4te0WD1wU4atiKyPAbODAWXyOiNJg+uLf1VtTsEU/btQmC5Nus75ipxz1mFFw2/ntXVnOAw2lQC6ZFuUdQaqJ2WDrWOgOMa9IBCtw0S0X0mhHpSOc1YFeVcDRfHnYfeiDSenPf9Pl24c1v3kl3s0XXVWfRKEskvN6q/5oVQSjA9GDd6ln7vm8PqriCFToHvXHw1qNIkh7nCJ7oAhSFbmFoI0xr4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alwLpN/28f+KSJSPhaoXa8CeC8pzRytLTAFGgpaNago=;
 b=bVYBwCdU52HSCcMTt6kC8KeIPGnzCJrJQv3IqhzgcWWxO0+imWT6ferbYOOLVKCwNpmUOkwsUqSC1SfdJLK9k2UGhPsQBhY6tjp0AjlEYhHsNN1bC+UMJthicwgeHewtV2v+1oqgArbD6QkTGg3/ZbClCgOYitwnBGNTux1OQpM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR0101MB1828.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:23::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 13:33:36 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7%5]) with mapi id 15.20.3999.027; Wed, 31 Mar 2021
 13:33:35 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Neetika Singh <Neetika.Singh@kpit.com>
Subject: [oe-core][dunfell][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Wed, 31 Mar 2021 19:03:22 +0530
Message-Id: <1617197602-19634-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4063:4d0a:e701:7daf:a153:a495:7080]
X-ClientProxiedBy: PN2PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::19) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4063:4d0a:e701:7daf:a153:a495:7080) by PN2PR01CA0044.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3999.27 via Frontend Transport; Wed, 31 Mar 2021 13:33:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9b2b912-f5fb-456b-a361-08d8f4499429
X-MS-TrafficTypeDiagnostic: BM1PR0101MB1828:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR0101MB18288B43546191772E5A0B189F7C9@BM1PR0101MB1828.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ADiwniEZMpUVuwTa3iTF4bT9fSMgsVvFNl4mIdMjQ0dAKuTmcRCrvyyo7Wacem17TfIcPA3qoFHsyDNGHndxzXvrzVpORNlju8pacTgS7DiwYXYOAcq6oRe6tpjvH7yf7wlqg3E7qqBARaZH8M7/G6Y56VNTflXT5VDmYGFBzFo3sO949+pBcsUXi0EtXOvnBbxqM/QTA6j9wGkvjAqremHQpKChnmC9bwBLcSkUjMmIJXhjsECYr7CL+Ee3tD1cuYF7MX7TvvBM2YVYskwEAZXC/hY5t4Ss4kwSmCf3T0lkbw+hULPyGnH12i85JubMPlohS17FI9NAarhnn8J7VXlvu3vPC170FCdcUIGXiaS/l2Xk9pYnXinht7XXh3GHjwck08m2yqCzkaMPRJQdI9vm0LmJttvk1/MQMLKBpw2hSmgtCkNlJrTOgbfEV/BjqBDR765OhTYzkQRivrYUu1wM5mYXqs9T7eGlUIaEOMQvCibiAfXIL98Zun8U4kGdXiWzXFm/2BMvt2Z0jKckISPTxe3w5nqvQ04i68m6S/Rtn0O/Gt+ylnKMl3lOTdugTtsfPzUFpK6wZskq00h9l1tzHi0Ekn1per9xl4/jixyCk2Me1cryixps2X0QmvrZ1rJr7wRiCdjiXpVGhwn4eSgXmeT1Fjl7UCT1wMPt6vB0ainOmtm9x+tE2PFSe59gPU3y0mYkyqiWdeJQP+h2EDyEZLoYLhrOdFtkfLSTqlE3jxiyCssIRl+yyEIPT4Gne3cxSeA1sYCxDzN7yD3zWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(366004)(136003)(83380400001)(86362001)(66476007)(66556008)(66946007)(6486002)(2616005)(6512007)(2906002)(316002)(38100700001)(36756003)(478600001)(107886003)(6666004)(69590400012)(966005)(8936002)(8676002)(66574015)(52116002)(16526019)(5660300002)(186003)(4326008)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?IZPnn2Op1I2xMyWuTvH3KAd84YevQrQ1ihsz2mm8js3wY80hFsvvBlriWIFI?=
 =?us-ascii?Q?WfPPNTc/GG+DmUYjY7dL5DGsbVqWhZ36K0QZEgGh7NCyMfmvUpmtFrU8Ov+x?=
 =?us-ascii?Q?NfOfCkLl1LLnW4njGmfCzwktth/LYFA6hWrQXwH/65ia77qRd63Q64oAPFwK?=
 =?us-ascii?Q?LtBkv6kFx5689ThinabHps3crs2cwgVHbV5epJ6eVrl93ZK0TSyMuHjz6g1U?=
 =?us-ascii?Q?gnPzo0QL1chKNnGY+pZGg5N8FjkLnfQ689vyfdM2HJ8BKA2y4ss9XfDjbrDa?=
 =?us-ascii?Q?+nowonBQriUOo4KHvozwOGq6cpncM968eH2O2Z5+Rpsldm9m3BF2vSFUaUll?=
 =?us-ascii?Q?iXz2AIpAR082eeHLTFFKHazn3o60ErRXw672zeh+Qc2m/V+vJnIy6OMR/zA1?=
 =?us-ascii?Q?5HkN2k8jwS1dB+1Oa5IZsmUcrqyf4JvttwS/rWwttmh19BGlxFPDdOHD4GO5?=
 =?us-ascii?Q?wQHw+UcFDiPJfBKwScHloDR+Cd5WTkzOloG2M5LdYLQaLKsVtjIWabwaYZ4t?=
 =?us-ascii?Q?CYZWr0s09xM4/hj/2rRDhcgh6adMJE9Y8jwm9nQwdUDDzXTcnEpIQaQ9cM1e?=
 =?us-ascii?Q?XR/u0XboxZgcEt6bK1gQHzYdppYw8IL04mDbnaidFhaQeMsAljcinKB0+RNx?=
 =?us-ascii?Q?wtexkmxWgTEqYPlXlazu4n4Z8Ck6HPGSs7IB2wBXszw51sqhqe8hczouu6Ox?=
 =?us-ascii?Q?ITiqTm/HP5AEiQC4Cb/9l+89AOR+Pnmsq34n7UbzVpz8Ezf5BRwOw/piN1N9?=
 =?us-ascii?Q?wGUiPboERDoRpUFxlF6PHQisj5SQa4QzJPCcJBqYOCB0PPC95blIGnoFVBDY?=
 =?us-ascii?Q?ydQLsirdTa9n2J/QOGh357oLpzX7Hyylutf/gWu60M6njSpeYf9zaL+BF9Aq?=
 =?us-ascii?Q?ot/MjRXoxnP3lChNhE5IK7wTbWNRpspNHPNnZoopbUKLtVKm0icAmz9IgoBr?=
 =?us-ascii?Q?uG5YkGsyM28NcBeyfd2TRsBdzlO7n5O9rPWtVnGW/RTQbCmDOMIsKa3fyZBZ?=
 =?us-ascii?Q?4Yo3OBWkerHw7HrI3kzflO0TX9syRJLLsluG3+RQA+SOGGlrWMmpytc7FsUJ?=
 =?us-ascii?Q?CBs6tIilImGGsriQhfoI9sHR1bMJzYKHBp1JK2Kqw5qm7QKu5JU99S8EnKTG?=
 =?us-ascii?Q?gahzy4mv5VW3GMOuyKYKhIZArR3kZysxaT418DqkD1tF0IM5knlKsajMLx1T?=
 =?us-ascii?Q?ELzfdMKkw9Lg7lBc0WicSkJlk/6drujqHU1so+Jk8m6Xt9FN4zxX+clN6ZEp?=
 =?us-ascii?Q?7z4LyGLNrj2Q0Vb5OsJSHW84Ol+DFCRVuADBJXihWv6bHUr6vCpivAdQO2Vg?=
 =?us-ascii?Q?SZRawdyNzAkeBjSxpoT9EAAzvl8563/O7c/9/a9xALu/v20A/StY0kRJOAK6?=
 =?us-ascii?Q?RU2TiED0wi8a4H5TSKAWeFRMRYfm?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b2b912-f5fb-456b-a361-08d8f4499429
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 13:33:34.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBeZgTdJSSd7Fur0VoJNBYZnhW2Nb82Yi/DtfW/AWLAUWXtmmCKFkbOiv/YfyLtkQzWqJ0gKxLeI2W/7ix95aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1828
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
index 0000000..fea1765
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
+Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
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
