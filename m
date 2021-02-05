Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.74])
 by mx.groups.io with SMTP id smtpd.web11.7693.1612530104926443473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 05:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Bu0282IK;
 spf=pass (domain: kpit.com, ip: 40.107.139.74, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2qvP4tGTes/DGKyITl+dU5q5Xe8rdcYuGNxOsImS7LAky9oF0x6cjr1epzHPe63fzGC0SOSkBvFZ9Uite3JgTkXR0wbJL/MQrehvl7Ao5q76VgYu7+Z5Od49SwcYkqsU87gh6ehOv+UUEaA79IzzijUTw0yXwU+my2R2mXiug5y+mQ/DDx3bxw1cM0zm1TOk9QE+3lL13+dxQdxWeE2VhuEThiZ/3S2A8Hce9Q/dj4AIegHOlGObESsf8oHNroRH0BoKnqqrVprrNjG+jiiawzYLii2v2CxdxQGttud3yT1t/jcD2CLfNpcfN3PScJoEjzvCdKz4RVoh4OLzJ1mnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaC4T5LY0vpTNVxQhi8KzrwuVOk/0zjkvq75nYDBOBQ=;
 b=FHv9Vc5XoSjvefe/I5LbyrBM4RJ2+ZCh/AAt+XPZrSd9lL7x0xW9inP9Iwr0MQsNge3k0CcuZ/G1n4f2dLFAnLBVEjytahdSw6LN1yJtGRatTqN1EbaaAoHHeCLfeN3uzuue7DH34U7B5KJgOniqCLq4asg8w7WLWVoW/k1MoH9C58m0jEmB0gNAUv5KBb6LGiaS+hyqBQH3x7skeYgsgZJ9RQhNgU8usgmZh8kncUGDXTk4233jQDpgxvwMiDJ4UPdNK00pfsoZooAfjDR69oMLVDYZ+odh1xLMzJP2n8OnmY1IF8F/ZlWDg4uFr3Aw4/0b/mAvsZobH5mdBaxSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaC4T5LY0vpTNVxQhi8KzrwuVOk/0zjkvq75nYDBOBQ=;
 b=Bu0282IKFdYOGxIqmUgCOqKj1pbu9K9FQ+opoHhPtGMh0SLW5YK9sBDwjeU9LsrsuSCbBGiEsD7qP9/ou3idPdLdgq/Z70h+nXm5jbQNeK9khz6AaOPZACK3Lpz9cDKOcXgaIAhQB1cQ9DQsSAimtHoJ40ECD3oulrg/+0MbQ9A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB2513.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:42::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21; Fri, 5 Feb
 2021 13:01:38 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 13:01:38 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com
Subject: [poky][dunfell][PATCH] libcroco: Added CVE-2020-12825
Date: Fri,  5 Feb 2021 18:31:27 +0530
Message-Id: <1612530087-24752-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2e10:1952:e87b:d65:9b3f:2ae2]
X-ClientProxiedBy: BMXPR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::35) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2e10:1952:e87b:d65:9b3f:2ae2) by BMXPR01CA0071.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 13:01:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d356682-5a9e-4afb-a914-08d8c9d62c57
X-MS-TrafficTypeDiagnostic: BM1PR01MB2513:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB2513B923B0407E4EEE5C854387B29@BM1PR01MB2513.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BM4jVErT4BAP3YePwF4DYRr6uZIcAqmuAh4hdBxoMZsN8eXM/hTAdCHLEE3nVUvzT22mnFIFqOD9PJtIyXlKxKIeT+EP0pyC9bh3TPEYYFQI3/vHzn1nS9grHRMsHJDJsebtKhH/kJ0UsXHTl93G+7rt57y+NQ+OQLPPUoZUYqBKP1/BvA9EIvsXOrrzonBzhxC1msKlgxZp2VWsUsLZVeOSymbyjEcFnwqVT+SznYaKZFs6rnfUFjHet1gYsf6WejKbHGUzlx4JaApgXtVGB4mN1DstF8BoezHL5CRe+HxZtTLsy4rx6nxfed229oOxd37k2dAJKqkIw4KCsFbNLeHfXWXm4ujRLecZrJBtIx6m0AMWfyNmtbiUqdudzMzTI+4mUNcd93ps7CeOZrvlar5GUVLwFyJlUHzn2YQ2UukGtTVOebEbRq7TA4Rgssf0Y+OXCYJ9ucPxTlwmCSgSXb5JlblGKJoh9ocoerzfuG3Ow2fCrZYqIdh0IDLSy1QPgbAW++SZrVwD7Dpt+x1WI9YnXd6h8y6tfg1G6TCMN+IuzguD6JcPbyJWufa7H47mqt2TXDaLMa/aNpct6JjHAY+PYQ/e2Uvors4tSL+IQqQKz9Rfu+gNWs1fX3NKRUNWvdzfYtoRewKFZSrbOyQ+5p+/SPwPmlqfrURQtaoACkw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(376002)(366004)(136003)(346002)(66556008)(66476007)(107886003)(66946007)(6506007)(478600001)(6486002)(6666004)(4326008)(2616005)(2906002)(5660300002)(86362001)(6512007)(186003)(36756003)(66574015)(8676002)(16526019)(83380400001)(8936002)(52116002)(69590400011)(316002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?HpMSM7/xJtQBkgPoIscDCLGKnPsa1bCQ6UJPiw2UzZgpYsYw/FYjn3oDZQgF?=
 =?us-ascii?Q?ZwiAo7gu6LdycoE3ZT9Q75O4LvKO88sjB0EVHAluSpoIOEER839zbrCtlae4?=
 =?us-ascii?Q?Jtenn06INtvAImr6vggbqwFwSHXJxMQzHnODANeDiK4X+fUTGKjBobTpdKC2?=
 =?us-ascii?Q?W5FCLkW43scxBdU4Lx/E63QG9RLe35724z+N7iE+Mjay9+0ZeJf3B3BGWDDI?=
 =?us-ascii?Q?yt2l8qWh5w5l8g13hFySSi+1El+gBKTkDTutLCW5C7BVjo4B+GJT0bl4L5rl?=
 =?us-ascii?Q?kWVNGSefAt4RsRx5cirZHM8bJAhhsyoerPFynydVEJr+bXwGUA31xKUyqoQa?=
 =?us-ascii?Q?eiWnMUXTkI44E+kQH2RnwifCCCLZ+e8FUfqcQIE9a81QwZvxtPzHOTRNv7s/?=
 =?us-ascii?Q?5MJKwPn071LmzGK7+Ra9YOmvRx0xX0cAttYD+bgvyrJrou8GLnkHpLu7BbEA?=
 =?us-ascii?Q?yoMf5UvYdPBQoNlq13MvyTyH9DBnU0PbJVK9XTW5DIDBVaTyD0kVNQzBkprq?=
 =?us-ascii?Q?hlG0mre+M4mCymXQ5UOAr4D2yLyoLKyuqV4deLnKLOkyQ2DluN5kLoxkFq0C?=
 =?us-ascii?Q?cT+ozW8RVdO1n4KwAkzpq7az2iZXWeq4NSFtnpulP46On2HyYW1a5D/PbKt3?=
 =?us-ascii?Q?UHxLZLPKJrg2PYuKmQwyF9MYz5GxsFBOIdDWfrrPaMWbxLBNDVqZkmuOVTXP?=
 =?us-ascii?Q?O6tK2exwk08m/OvVs7STTSnY6nrjaRs2jZYV4kATkW8WCsodbw3LsB7BCl27?=
 =?us-ascii?Q?qbvARRWiba37DDiiR97OlMw+57irIzH7VcnmHW2B6nVkMp2n2GHSqbiRtkgI?=
 =?us-ascii?Q?cok04Yd7ZzAncVBKjuR788SJvYK05OCsMdKrxvK0ArNnswJKTg6OOLe6yCff?=
 =?us-ascii?Q?WwfEqpez//KEGJ9jEam9z2dg1tTiwh3zYEtuX9CyAZzrsX5jbVJ9b1dUmLyy?=
 =?us-ascii?Q?G1K0TblqfrJcJQzOReDfOkUUcUmosT4QXBWhmGkDtlTAqhRayj395PP3UIgb?=
 =?us-ascii?Q?LpVz3Zs0/HCqu+FmA3OkhPYCtUMUIJFNOWhZHLr2Y+Ypa31zVgKAmxJ8LLMa?=
 =?us-ascii?Q?wuuWljVGx6t/UAYOIL3ZIVnWehyaWk2RF/lM0H4TpTRihveRbyonSy+q/7pL?=
 =?us-ascii?Q?8qSbdRybtPkUnNebXaJboYV8Zktk9KS4bmPJdBdfWOiyCIxVK/K0HwtlZU4E?=
 =?us-ascii?Q?PMcRF0RVsiaTpRc2ZgbhMmrFmaDuve8cRlxZxhvgncT9G1jKCZunKgG1PuRM?=
 =?us-ascii?Q?Q75qR3xBPi1HzHy+I8JvI7CJ1DNt1Qw/nwWJpHP6KaPD0ir/LAPOwQaneFCY?=
 =?us-ascii?Q?ewkb1XpDiSj0csYAtC88r9C/wAFAmQgrT/YBdZPpb8hECI1+8Y/WqY5JfZfG?=
 =?us-ascii?Q?wtRygJqoI56XRu+K/NJkZ75thBFz?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d356682-5a9e-4afb-a914-08d8c9d62c57
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 13:01:38.1059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZ2tXf2MNrwK5+dmsNpks+IzOBZHVc+LM8IX6zAMrPl2I/7jj5/pjnupTGPsUtheKW91l0kON4Be4RgPOcFgUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2513
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added below CVE:
CVE-2020-12825
Link: CVE-2020-12825 [https://gitlab.gnome.org/Archive/libcroco/-/commit/6e=
b257e5c731c691eb137fca94e916ca73941a5a]
Link: https://gitlab.gnome.org/Archive/libcroco/-/issues/8

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../libcroco/files/CVE-2020-12825.patch            | 193 +++++++++++++++++=
++++
 meta/recipes-support/libcroco/libcroco_0.6.13.bb   |   3 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/files/CVE-2020-12825.patc=
h

diff --git a/meta/recipes-support/libcroco/files/CVE-2020-12825.patch b/met=
a/recipes-support/libcroco/files/CVE-2020-12825.patch
new file mode 100644
index 0000000..966b812
--- /dev/null
+++ b/meta/recipes-support/libcroco/files/CVE-2020-12825.patch
@@ -0,0 +1,193 @@
+From 6eb257e5c731c691eb137fca94e916ca73941a5a Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@gnome.org>
+Date: Fri, 31 Jul 2020 15:21:53 -0500
+Subject: [PATCH] libcroco: Limit recursion in block and any productions
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
+Upstream-Status: Backport [https://gitlab.gnome.org/Archive/libcroco/-/com=
mit/6eb257e5c731c691eb137fca94e916ca73941a5a]
+Comment: No changes done.
+Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
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
+@@ -344,9 +346,11 @@ static enum CRStatus cr_parser_parse_selector_core (C=
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
+@@ -784,7 +788,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+         cr_parser_try_to_skip_spaces_and_comments (a_this);
+
+         do {
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+         } while (status =3D=3D CR_OK);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
+@@ -795,7 +799,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                       token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status,
+                                       FALSE);
+                 goto done;
+@@ -930,11 +934,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
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
+@@ -956,10 +960,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
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
+@@ -967,6 +973,9 @@ cr_parser_parse_block_core (CRParser * a_this)
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
+@@ -996,13 +1005,13 @@ cr_parser_parse_block_core (CRParser * a_this)
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
+@@ -1109,7 +1118,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 ref++;
+                 goto continue_parsing;
+@@ -1123,7 +1132,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+                 if (status =3D=3D CR_OK) {
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
+         CRToken *token1 =3D NULL,
+                 *token2 =3D NULL;
+@@ -1174,6 +1185,9 @@ cr_parser_parse_any_core (CRParser * a_this)
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
+@@ -1212,7 +1226,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                  *We consider parameter as being an "any*" production.
+                  */
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+@@ -1237,7 +1251,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+@@ -1265,7 +1279,7 @@ cr_parser_parse_any_core (CRParser * a_this)
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
+
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipe=
s-support/libcroco/libcroco_0.6.13.bb
index 9171a9d..a443ff2 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -18,3 +18,6 @@ inherit gnomebase gtk-doc binconfig-disabled

 SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
 SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e063f=
92db585759b422570621d4"
+
+SRC_URI +=3D"file://CVE-2020-12825.patch \
+"
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
