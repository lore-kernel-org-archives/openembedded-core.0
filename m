Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E66C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 11:59:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.124])
 by mx.groups.io with SMTP id smtpd.web10.39550.1708343952193578863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 03:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=DTCdlqGU;
 spf=pass (domain: witekio.com, ip: 40.107.20.124, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rxw0Quwo2CHUUJoAuLlLg7kD8ADszcrDadKt8T3AutMje+9rL6UBn6AqRleubmA8wy3o2skEA/SFdDC1Aafy2DU4DSvfQMHkT2erAPDTeg7zMxJag7+yLv9czEJHaw1aRMUxy5G0RXG6H5bnvW6J3ghxqKXf9rTXBxmE/kGISDpe9fXffxqLcqU1+igATjWmblXs/TyE/U3OoVLT9+D27rUHXF1K/MQQi/Ie8CAJXrzmZ6BipB37FESfco/y1NFBgmGkaTi+UfexWomdGa3+0KRmnEhurFwx4udu0r+ifHB143z8a0yrJXJfBGz+7tzX5K4iNiFcnWWRxjBLZEqlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u7Kl1qgEaVv7ZGQMYL3pr97w5+3uG+IoLEI+Iyf1Wc=;
 b=C4H9HNsRgEbp8Cw+uwtbbmPKWeln9FEymnXkTMCDHtPAfVPFUnD/xkB24JxU4g7dhG3y/b9hHvKPgkDo54zD+5LLOpW7BnFPvOmYmQvM/k11tPzyC7zc0saGNtCQKqpsrw8fjRCUp1iYopIEA5bNt1wX/IJMOBjnyBb4eePRZAzpzI3paA2rXeE94vas5rWuba1hXKk9cRBV0KiTB9ZeCUga+tCi3z1jE0g8UFVBAq64tSFcJx1gOOvQO/JmQaEDGQiluKd8wKCxhw9aVeCFIrvveGvnl/tsb2luvihdu47yNu03QgOul7eZnRqfFKMZd9BoD0Q2giUpsdNayqoR5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u7Kl1qgEaVv7ZGQMYL3pr97w5+3uG+IoLEI+Iyf1Wc=;
 b=DTCdlqGUK3UT5iacTHVlknvuGkFAbxbLvzdVBJUpC3iTjWvBV1hXqQTtQXqEcOk0p8TDni9aAlFA/kdi0Nk8HB28I6rQW5SPFnBaVbVFdsA5RzFm6qXFhj1i1VWg0dohl8lO90UD8+OV7bX7n0o/tu5KaMEu9f57HAp4+ak7fAxP9nzS2Hzg/xE1CvS7IcwKF8Xwt59cmOb4Uzcdlap5SqDMTxJZ/TelJtD+IXjXVbp8DMMcad9ZRsWfuWzpnQAF0388j2VgH/iwYPJYkzu+w0P3F1ZXMq1zFj7N+kK7rF1Pf6FVMKqjAwSje5Zk6eoDwf1dPWfIzwIQtYmoLOYVHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by VE1P192MB0845.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:164::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.37; Mon, 19 Feb
 2024 11:59:07 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0ac:ede:a6e1:17e8]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0ac:ede:a6e1:17e8%4]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 11:59:07 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [OE-core][kirkstone][PATCH] libuv: fix CVE-2024-24806
Date: Mon, 19 Feb 2024 12:58:59 +0100
Message-ID: <20240219115859.5389-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0278.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::16) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|VE1P192MB0845:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1d4b61-965c-4ab8-faae-08dc31422cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nruyo6nhQ6ov5el1e0WUndy2tU5IxD7+x9t7jWX+Al1OEBv9thkV9981iJZ9AWCy3gsioa+kwO3twK1+/m0rnbOFjnFQQEWTFyxeJhmbP4+DFfMzSJ+8/30u2LEcOMUxry7zew+1iFA9AMrhG/vtx1hmh3URy1JLqTv9sf2UyOjVutI8HTJdh+p89A769pY6AbEqRH7K7UXjLxZGi3t9+lYSIRA5nOq7ZewQT7kcA4JK13z7bPU2QToXiGD9tNNjsSrC9+eX7JrFpPco3MSusklwK4x9CnY7McGovNlzyXRznDW6UiUoEnwJPuj4U1aG0I2AO8AxI3vO/6JXZMAaqsTWzo0kGP6MSF+5YMccB7C5ETOgSNNPxpUk0IrzlM6wZiaZlm7koY6WgwC0ItFT7zwlu8E+ZdHtz//9rJcj+UbainP0ZNLGH+mVNlS9B1drd3VE+A264OJrVrP4dIjHaNnjDj/y+EdTNfCAUu/gu3MhlLj6smzP2IvhdB07c4SHAqL15c0X71v3rLHQrnF9sivkwkSiLxmBoeEV0uLcByokBLypIzx4UNFSxo0AlPQj+J2JiygEMh6zv/D15eMiGwdoB3vyaSUNbW46aiqwE3k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4707cQMnQnn9qElGXfhnZtYnsFjcGLvlVQZ2BJ+9F2L0jM3du5rUQJxYfugq?=
 =?us-ascii?Q?o0eHnYMhG7ZycKeR82zbygr//Nojoe4HGbsDWYjW02+7kfXtWpbCr5TmZe8l?=
 =?us-ascii?Q?bjdp1qbLDwbCP3KKjzC75yhw18dMCJ92k31uUKZhkcghZ85JscsHO7H1xqid?=
 =?us-ascii?Q?Nd6N0xO//OKbCCPdF+ibo2Xp/AtkawHQY5CibuBP3qc6V8yJYn5kJJQ2hG7c?=
 =?us-ascii?Q?CoN0vyXctv/0GXE2pGFlyh1I0Av98x6sV03J9ZKDx935RwB6cIEdfmATdN9B?=
 =?us-ascii?Q?5Y6nd8Dc/VAj9cSlILD6P/GSPrNv1TK1CZ5f6ohpwy+V4Ti1FRAc0fuIZtfP?=
 =?us-ascii?Q?tcuQ5GkcFsQIHMAYS2FNygprIBXu0cT00UFE/PnJN3ODRftP2aiU5cl6ksBG?=
 =?us-ascii?Q?k2JImY08kjgBweBGaKLGtz2rYt+yCDx6tpw/Rjw3rtt/xc4tWeFYqTg/eqtS?=
 =?us-ascii?Q?r7TJ+DiQ+NVTTTUwMGjYedDbTGEVIvmk8CzzezwsNV9NZm0LawvQP+xzIbsg?=
 =?us-ascii?Q?VkdT159ok6EvwvYi67+eg/GqMRwedd3PYnGRE73MLXewa27whh3qaSdJMr/b?=
 =?us-ascii?Q?l54SXycJyf3TV1qF0uZj1fuIt1o8XGR100DMmsk7qoonT7Dpx9YA+xqJn+2Z?=
 =?us-ascii?Q?PLqCw0xQIWeliB1qFTy2z1H1+I3iOtnLcQQ9BshXnUh3MTU58lzEU8sEU7HI?=
 =?us-ascii?Q?O1ZYY76Mjji/xZttoqjdMCUxJqNv4Cx0zrLiV+Mvqee5xihZnupTZFxFYFO6?=
 =?us-ascii?Q?9tSOHI3GJAtTLqRNqwszIV327WJPwAxj7rj7H48Hhtlu+fJQsX1cr5txxiLn?=
 =?us-ascii?Q?Bvxse0EQ9az8oB56ngJr2QG1wymxQjY1Xpmtszx1tw7fUn7y2/sCr4/h4dcc?=
 =?us-ascii?Q?eaA/PZZgwRB5xEwLGIt8HtNviUW2xSFxv+czqDb/sLG6jL0dpxt6Vw/DM+K+?=
 =?us-ascii?Q?97MtNhm677/C7kHgslBdvJkj5h2345NzXUMuYM+NkG9+i9Kh2F2LeiwCAOzU?=
 =?us-ascii?Q?du0r3NxoozK2BI6I8cCaMSwRTH4B/Kb3XWfu2/JsK7uSHIl/1EbMOYTJ7OF1?=
 =?us-ascii?Q?RLpOD4RRWQaku6fjklTpNfWTrEXzBN6xxX/c3zSXhmENkogO42Q0sQ27BI7k?=
 =?us-ascii?Q?Yku9cVj3gDviSLsXlpK+INXvnFQRtH9SJR0U6bB0sHFkeBiC0Q+dzCw44JUR?=
 =?us-ascii?Q?Vt6Tngy9hk6nDGU1DlGmn9xCI/TpZLhygj8ZRw7cJLKdrJNo/q7UvOaC/2CE?=
 =?us-ascii?Q?NjT2S/C0zQJIpTfdK52gfd9Jde//LeSMk7oeeAnvoG4SxZi0QsA4qUBuUgBT?=
 =?us-ascii?Q?IbK36DrT4VAyFMVvypot3yM+AyewFVrOn8m4DWRYKRQZsTyHuXxQojVtQ3pn?=
 =?us-ascii?Q?DbE9aopbPDTMKfm4V0P93Pi1nxCYL+ax5l3a6oV1yThDzmNs6f7y0LzV/6hF?=
 =?us-ascii?Q?83+nbeSZaFKyZKgGxb5dlwbO8Fo998POdj0uKGkwoV1EGWYTyXAggtY8rMDh?=
 =?us-ascii?Q?PX06bdrSjQb1uL9sDSF2HJqo0+SL86g5sbwh9dmfcnrdL1/7tbIhUGEfCYWc?=
 =?us-ascii?Q?1rLJVWgExaoq59QIjYdRIChIxWPyuAyZWVXv+9by?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1d4b61-965c-4ab8-faae-08dc31422cbf
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 11:59:06.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gn8uqnTCiq3soTTQ/A4rWuO8ttQGfVpNlhK5yuvIZD91SPB72mT+G4K1QOQLP9uXVzUySikghUYeZ+FZTLCRzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0845
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 11:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195869

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport [https://github.com/libuv/libuv/commit/0f2d7e784a=
256b54b2385043438848047bc2a629]
Upstream-Status: Backport [https://github.com/libuv/libuv/commit/3530bcc303=
50d4a6ccf35d2f7b33e23292b9de70]
Upstream-Status: Backport [https://github.com/libuv/libuv/commit/e0327e1d50=
8b8207c9150b6e582f0adf26213c39]

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../libuv/libuv/CVE-2024-24806-1.patch        | 55 +++++++++++++++++++
 .../libuv/libuv/CVE-2024-24806-2.patch        | 43 +++++++++++++++
 .../libuv/libuv/CVE-2024-24806-3.patch        | 30 ++++++++++
 .../libuv/libuv_1.44.2.bb                     |  6 +-
 4 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.=
patch
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.=
patch
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.=
patch

diff --git a/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch b=
/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
new file mode 100644
index 0000000000..cd74047631
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
@@ -0,0 +1,55 @@
+From b8ee33667d265b936d60ee7f0ba0b22463ccb019 Mon Sep 17 00:00:00 2001
+From: Ben Noordhuis <info@bnoordhuis.nl>
+Date: Thu, 18 Jan 2024 14:51:40 +0100
+Subject: [PATCH] fix: always zero-terminate idna output
+
+Upstream-Status: Backport [https://github.com/libuv/libuv/commit/0f2d7e784=
a256b54b2385043438848047bc2a629]
+CVE: CVE-2024-24806
+
+Fixes: https://github.com/libuv/libuv/security/advisories/GHSA-f74f-cvh7-c=
6q6
+---
+ src/idna.c       | 5 +++--
+ test/test-idna.c | 4 ++++
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/idna.c b/src/idna.c
+index 93d982ca..ce7f2746 100644
+--- a/src/idna.c
++++ b/src/idna.c
+@@ -308,8 +308,9 @@ long uv__idna_toascii(const char* s, const char* se, c=
har* d, char* de) {
+       return rc;
+   }
+=20
+-  if (d < de)
+-    *d++ =3D '\0';
++  if (d >=3D de)
++    return UV_EINVAL;
+=20
++  *d++ =3D '\0';
+   return d - ds;  /* Number of bytes written. */
+ }
+diff --git a/test/test-idna.c b/test/test-idna.c
+index f4fad965..d079be55 100644
+--- a/test/test-idna.c
++++ b/test/test-idna.c
+@@ -99,6 +99,7 @@ TEST_IMPL(utf8_decode1) {
+ TEST_IMPL(utf8_decode1_overrun) {
+   const char* p;
+   char b[1];
++  char c[1];
+=20
+   /* Single byte. */
+   p =3D b;
+@@ -112,6 +113,9 @@ TEST_IMPL(utf8_decode1_overrun) {
+   ASSERT_EQ((unsigned) -1, uv__utf8_decode1(&p, b + 1));
+   ASSERT_EQ(p, b + 1);
+=20
++  b[0] =3D 0x7F;
++  ASSERT_EQ(UV_EINVAL, uv__idna_toascii(b, b + 1, c, c + 1));
++
+   return 0;
+ }
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch b=
/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
new file mode 100644
index 0000000000..c1a33274c5
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
@@ -0,0 +1,43 @@
+From 96f881c8f600da33ec4ecec450ec491990ce613b Mon Sep 17 00:00:00 2001
+From: Ben Noordhuis <info@bnoordhuis.nl>
+Date: Thu, 18 Jan 2024 14:52:38 +0100
+Subject: [PATCH] fix: reject zero-length idna inputs
+
+Upstream-Status: Backport [https://github.com/libuv/libuv/commit/3530bcc30=
350d4a6ccf35d2f7b33e23292b9de70]
+CVE: CVE-2024-24806
+
+Fixes: https://github.com/libuv/libuv/security/advisories/GHSA-f74f-cvh7-c=
6q6
+---
+ src/idna.c       | 3 +++
+ test/test-idna.c | 1 +
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/idna.c b/src/idna.c
+index ce7f2746..858b19d0 100644
+--- a/src/idna.c
++++ b/src/idna.c
+@@ -274,6 +274,9 @@ long uv__idna_toascii(const char* s, const char* se, c=
har* d, char* de) {
+   char* ds;
+   int rc;
+=20
++  if (s =3D=3D se)
++    return UV_EINVAL;
++
+   ds =3D d;
+=20
+   si =3D s;
+diff --git a/test/test-idna.c b/test/test-idna.c
+index d079be55..d59b521e 100644
+--- a/test/test-idna.c
++++ b/test/test-idna.c
+@@ -114,6 +114,7 @@ TEST_IMPL(utf8_decode1_overrun) {
+   ASSERT_EQ(p, b + 1);
+=20
+   b[0] =3D 0x7F;
++  ASSERT_EQ(UV_EINVAL, uv__idna_toascii(b, b + 0, c, c + 1));
+   ASSERT_EQ(UV_EINVAL, uv__idna_toascii(b, b + 1, c, c + 1));
+=20
+   return 0;
+--=20
+2.43.0
+
diff --git a/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.patch b=
/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.patch
new file mode 100644
index 0000000000..56213573f7
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.patch
@@ -0,0 +1,30 @@
+From a7443ee6b3b3c6a12708148aa9bb001b7782905c Mon Sep 17 00:00:00 2001
+From: Santiago Gimeno <santiago.gimeno@gmail.com>
+Date: Wed, 7 Feb 2024 20:27:58 +0100
+Subject: [PATCH] test: empty strings are not valid IDNA
+
+Upstream-Status: Backport [https://github.com/libuv/libuv/commit/e0327e1d5=
08b8207c9150b6e582f0adf26213c39]
+CVE: CVE-2024-24806
+
+Fixes: https://github.com/libuv/libuv/security/advisories/GHSA-f74f-cvh7-c=
6q6
+---
+ test/test-idna.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/test-idna.c b/test/test-idna.c
+index d59b521e..37da38de 100644
+--- a/test/test-idna.c
++++ b/test/test-idna.c
+@@ -150,8 +150,8 @@ TEST_IMPL(idna_toascii) {
+   /* Illegal inputs. */
+   F("\xC0\x80\xC1\x80", UV_EINVAL);  /* Overlong UTF-8 sequence. */
+   F("\xC0\x80\xC1\x80.com", UV_EINVAL);  /* Overlong UTF-8 sequence. */
++  F("", UV_EINVAL);
+   /* No conversion. */
+-  T("", "");
+   T(".", ".");
+   T(".com", ".com");
+   T("example", "example");
+--=20
+2.43.0
+
diff --git a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb b/meta/recipes=
-connectivity/libuv/libuv_1.44.2.bb
index 27e79276b5..e2cd3c3247 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
@@ -6,7 +6,11 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad93ca1fffe931537fcf64f6fcce084=
d"
=20
 SRCREV =3D "0c1fa696aa502eb749c2c4735005f41ba00a27b8"
-SRC_URI =3D "git://github.com/libuv/libuv.git;branch=3Dv1.x;protocol=3Dhtt=
ps"
+SRC_URI =3D "git://github.com/libuv/libuv.git;branch=3Dv1.x;protocol=3Dhtt=
ps \
+           file://CVE-2024-24806-1.patch \
+           file://CVE-2024-24806-2.patch \
+           file://CVE-2024-24806-3.patch \
+          "
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1


