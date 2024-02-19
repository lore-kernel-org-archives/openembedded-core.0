Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9525C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 13:53:01 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.138])
 by mx.groups.io with SMTP id smtpd.web11.41720.1708350772766561163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 05:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=XwrK8zFH;
 spf=pass (domain: witekio.com, ip: 40.107.15.138, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Itm1FsJxVH/sedzPLMPXK3855RpTo34l4Q0APRaO176dP9HpWvmdomDAVjS6XxMi6Bsel1A5wRnzMVpaNJl4SiTGrWSbZQ+Ka7AId38WQA1wA69YbNt1TPdQElsMtVb1vpnavEvGq9naQ4mEowwAy+bnBcg4WKG1VptUhWVkUUl6qBjJAFLVR9qrufkpgCaFPkLKC6dRtehwvrqYLJ7zer5atsX0a8va+dNzssGTEBE6fIPvNnCc2DoL2yrDiPEYOrsXN3OOprMBTpSJWf7YsY0Ux0aAs3bk1V5WmaOceUud7YTyJVyRoORVEucG5gjUYqVmJA47djG0TnZaq2MICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u7Kl1qgEaVv7ZGQMYL3pr97w5+3uG+IoLEI+Iyf1Wc=;
 b=U254LViTH0ei4RMlcyrCN6TE+dJX9mq7Mm8ZQFL6r32AIQpIGEGytRb0DPM8tx7pRdDZSD4/DUnBo0b04fskXsqfpPZAMUUk/azuZes18K8WD11ljNuIL+rIcHWTEDGQfQfaz233lw3LJDW2Mlbfa+Bjtu3L335mHXvxN0qQ8VoQgGcoQNt7rj4E8ndGnkL1kqwMvvJO2iXnOa2+JT1c7J4Pi/CbLeVw1hsNf3iaHaIbOx6SL02N9Vvla+4kDdarOpKefUpVcR9mF/COqyaN1nAtKmRGRVvWNx8VL06SEZkWBr16O0Yo1uOHZADz2XliZnBAakjjUD4WzK5f2gHhKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u7Kl1qgEaVv7ZGQMYL3pr97w5+3uG+IoLEI+Iyf1Wc=;
 b=XwrK8zFHKdCioI0Vm1YwrY/t7NOxKCuuKuoclVu1yaJeAoq113aPm+uF5WcAc6U3Eb9/trLhJfrRbaULE5haEv4E2Tgk/O/yPJ7kEVtE8LjusXEiExIONa4T93/S+Y3m1NhL59GsdM6amgcrIuDU1Seud8fg3RkOTWhNsdSE7+UEP4aDJ4WRLDeNWjlRdQ4IDLJHn/X4FGnk4GAx6lfJza7wv9KjgwwXocKdSGgBx3bFZxmWVqXnV3M1FtndNiR3YWlfWyiuUXtzu/ZEqjV27tgnsnAPamdI1Fm6uNDTDHhnbqZfpqunSk18qqhYziZB6uT72b870QEj6N0nU8ASYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by PR3P192MB1103.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Mon, 19 Feb
 2024 13:52:48 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0ac:ede:a6e1:17e8]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0ac:ede:a6e1:17e8%4]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 13:52:48 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [OE-core][kirkstone][PATCH v2] libuv: fix CVE-2024-24806
Date: Mon, 19 Feb 2024 13:09:02 +0100
Message-ID: <20240219120902.6354-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219115859.5389-1-hsimeliere.opensource@witekio.com>
References: <20240219115859.5389-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0270.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::8) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|PR3P192MB1103:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bf05b3-c2a6-414f-3031-08dc31520eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WlXdLMpIOOCF/G0JJNl9T4FTtfbIocONkgyWu0HBemkPnNJ6YtUhCDyArpk50GMBPvIvLZgaIoquN4BxmvOCUlHYGtY5zqbaCX14eNGbtCv/rtJ8BkG0Shs517rwehzpaPwKCtE9eHeRpiJDiLmI7sRK8iSmUhQe+ch7Z48SbctxOR/aYIb2SxamT4FddsyFzdwQ2MS1gW8Aj8VH/Q1Ns4Miu06cNffaHqkOyFjypbEEIpU/PgRrEnFKRDPx6+c6KXM/5wTCX8UJwmUsOTe+VT3e0+RYsY09VM5RBTtNKC08z2JxkCYdGkstoHCJx9coC7FYkgJdqf+pwHfwpcHW9jyspundBfxaBDoYr8d3Rfj6XNZ/trVl4sLz/wGRUyIY4sipK7lVLIVc4h4GDqTGMsYWjcVlXOJI+8vSYDN9FO1s0YtEOk2NGLhLdb7Wq7rB3ZAVxWSSOOAxyX1X7rRq2iytRkZNufCOaoVIhfb9rtk5pOLQ85y72bq532UW7OFfa6QaA5+MjjmyRU492IQhOj3rq6sKFJynJ/PZR8AWRjyYNcOEhHhJZBBnrMOZB0hy7TvOi08+yLgZWsY3SutpUCyA2PmG01/apFiOrT/Lc0g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bPHPOjpm4TDYa/XaiZuLeVruqNypZAJq0cNyYK4jmCex/oHBZNKlOyYdnE9C?=
 =?us-ascii?Q?kSxQ7cQiRUvfo43N24vANlT5cYxtZV7Z1VlI/XTlhLywA3qTIfsioxHuWd0Y?=
 =?us-ascii?Q?Rpj03/atRTIgtd+K5eLYY/nydUmC0+F9fwcnNWUQ3mujTKti5XU0PKQ63v/w?=
 =?us-ascii?Q?HSn3Iof9KWVAaLD3Uf5DMJnqkif1uMKxyVV2O3Wtx2m5I0euuXHOO4eeVod7?=
 =?us-ascii?Q?ajRME3IItYUJJW1ydyi4SyHR66l/e7Tt6kwsk8KD5kyanplfOUW83EoWsiV3?=
 =?us-ascii?Q?oc10+/UGZieW23ndX6MpYqxJi9+DSwYLqWT3zLyjuodXxr2IFb1LAOSJJx4T?=
 =?us-ascii?Q?KKtKZvhIQ8o33D713tdg4/8Mgws5Va+Nc4d8/Z62mBQVS/FFjCq4BgclRWJN?=
 =?us-ascii?Q?DaqFyxdAt2tkaOhYBmow19v4sf1quOTDxjSSSRGOT1oMNUQNDEbRZWqOjYvT?=
 =?us-ascii?Q?bpz1cVD2ZhJH+p4rLdFGQKplG3herLk75lUhjf2JBLkM25vGeLCKNPJhmlEW?=
 =?us-ascii?Q?VdfduB6EYu68XSNnGMjNjyj2IF9bBznbaw4mJ+lqRIt2gGeoKdL5yEx1Zuqn?=
 =?us-ascii?Q?1F7+OGX/NAXYuIh81Cmbbn8P+lzTx00P25uleRa7hWcyMDkeesqHGlzopZ7T?=
 =?us-ascii?Q?n8+Ic8rppkGNdTbVAifgVEH7fE06fXTkFq9CR2gaUaCrWpqBhKEgeghARUs/?=
 =?us-ascii?Q?UlMcJPLDBRXSULtSK+8iXP8MpdQq8lpmSWp8HNFjj0VW+ar/6SmNmM9I5aMZ?=
 =?us-ascii?Q?ZFM2/uAJwfAV5xsYM78YZyF/iDv2Ml80fblCVi+547sGhgBu61aWogBeJquI?=
 =?us-ascii?Q?tNRyo+PdRKPMEYcYTwmLjHsc0XkkgJCNNwif0OfJX5/plPvsEO6W+bfuDmik?=
 =?us-ascii?Q?KaKclBt3Bbh1KKQfiPtMadV4lQ4BM3JYk5gxTy/QOjxWfO8R3lia2tqU2cRB?=
 =?us-ascii?Q?esyRLth2Bbp3fwvFrUFmcMbxbaxhXE/uXXYyFcAxkHtCzvFTQ6sgWXQ6wjrI?=
 =?us-ascii?Q?QaW1+Vpk6bjd1vjpoRyK5LrogAuZO/cJuu+hTacZRrPTd1r7Mvz3j0EvINV1?=
 =?us-ascii?Q?VVPTewzm2J68jj8/RFDCer1AcD4ySXfRoFzSyT71z1jTqtYML/shuZR1YZN9?=
 =?us-ascii?Q?dJ3Lu1QwObfAvHX8gCZKCJ5y/DGYjCP7IlulI+PQ65NE8Y4U8Ty9ZlBsC8PU?=
 =?us-ascii?Q?W08Ide3s0lelczCM/7tTjZ3Jv38gYiqxgMyhY2IrE51nqCCA/TWMZ0FYdTLC?=
 =?us-ascii?Q?QLva2C246g/ZvHaFwY1GiH/4MlFQp1KQAEter0SN8uK9i+VviMQ1JmCOO2EY?=
 =?us-ascii?Q?z8MadhIrwJhH+ErjjteJtnQlwjRgMkjY7yiauiS15cQ0Rs42rhBSBgYdBtdD?=
 =?us-ascii?Q?VoQ0NYCvv/H9tiwdoKsE/4VBKaNL7HvCvcUAVwlZ9CDAX1w1kCo6ZDcYsF5V?=
 =?us-ascii?Q?URsvNm9OxVUnvWOzjfQJUF8O1nn8ZWAW7ZkVkvKWu0v2oUUx3vBYmCvgoDVZ?=
 =?us-ascii?Q?AiUztI9xCJGNE5W2SuxoxkwokBQ1+BimjyaKCMUVCFgGf5Ip3RhMnezjUneN?=
 =?us-ascii?Q?LDJlNj4ZbDpOZdEt05PRWCecG/xAiMtQb1jFPIKB?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bf05b3-c2a6-414f-3031-08dc31520eb2
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 13:52:48.4640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSLRYuzKX/1eKuDv/08wzQY+A9E9VFVTBXE1YKL6wiFVKsDIacGgpgP4nyGRen2LcrjShDvmRSbzoxpnTbbSxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB1103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 13:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195874

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


