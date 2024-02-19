Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6780C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 13:55:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.119])
 by mx.groups.io with SMTP id smtpd.web11.41770.1708350892413533519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 05:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=hprL8blQ;
 spf=pass (domain: witekio.com, ip: 40.107.7.119, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfxU7BvzPORtAU8wIybbc77Q5Fa4fDwcck6Cx+tQ9YGuzZbmud/zYgLIYxIpE+uBtxPvNyKLbKt+ALKQjlteC2/aBmbdxOK1NrB1AwKLdZER4XwOpgtWsl3fu2ktvKRIpgswj6TprS24kozxX9h4K6dcxy/QfQMBX6is4BQJvn5JLLjVDday0K+6+4Hm19nvmpgyeoSFj5Eih96dlE1cKDpfctvk3al5Qp143ZgrIjfMY7LQbnUIvCX0VZ+MxVmSNhLO9ZgIG0QY1eXNM7fMYPxElNEZ8d0nCwmwEnhiN13ZFxbk/Dvqj6/nGBSzmNLivxKIdsyL3UkB/ywFPigiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rqc6sB+HVx0XYRJkJ/KrKF0YpfJQ3R8TJUfzOC5bLA=;
 b=LJMOp6ryqKLv2DxChe7uORntNKLgb1PdMvXVXs4cQ/ANDYPOCeeNp3h3HCN7wlmq7T/aM+WaEmhAuLDhHojTsvXGs5+KhnIk7a7QdpDGUZ5ycbjvloTdRpwmbY35aR100RKiUbYmHa25+SRV05R5ez9tmiKLX29SFYXsNIOj1PulCQgZ4t/6iE7czdCWPRDDsBfiwhfQQJuZY5BMRdegXptqrg5sxGH0m0AzAQX05/C+04ouv7gDU5L64XQji+lvRW8AbszwMrmncabw4pPbS3TzzMCMhvGVanPgjLLxzIUTnt9A3uSMG7u4hzxMqgrfFlsPhCi9j+WZzwO5MBM5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rqc6sB+HVx0XYRJkJ/KrKF0YpfJQ3R8TJUfzOC5bLA=;
 b=hprL8blQxbeyr9mOKAF8mg2c0NS0W8+vzhXRQ7B9UFr0CMNn+UaXXkhPfEOPJ8+qSnutTG4B1D9l7T43rDK/3ADOPR1INbvTghl46EZc6Aybtlg9L4Xhvvwh7Wa7HkFMfBIVpaatsi7C/ytZK4/OewFByx2PhsEAyoWLFf5EVcSYxNuxNDicJQbUWC28Tq3aMamqKlNOOft1DrDQn40OFud3v/kytC52nZxNd3XcZzmtutgqEZPNXdcO6bwhcO2XsmCc7P4JymmAbxXKU4O6pMK+4q1SxUHE4pad1swcqOPyLeYUnFi7Vt7czpXJZT2WqhkX/KmpCjYtEi035iIeZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by DB9P192MB1778.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:396::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 13:54:47 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0ac:ede:a6e1:17e8]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0ac:ede:a6e1:17e8%4]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 13:54:47 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [OE-core][kirkstone][PATCH v3] libuv: fix CVE-2024-24806
Date: Mon, 19 Feb 2024 13:11:06 +0100
Message-ID: <20240219121106.6742-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219115859.5389-1-hsimeliere.opensource@witekio.com>
References: <20240219115859.5389-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36e::17) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|DB9P192MB1778:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a802b5f-3bc4-4656-5203-08dc315255cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sz9oY70xVljRZt04McfP/WxqehyXq8yeKua2aTAJVAA1V5iinxbFI/DTzp8sVOj0tcO7m1vhE81yA1p6TkWJHljelt0jBbTworoAECR9g9pObpqrtIS+HLHlNYWO5PaPVwQYoTzzZGevII9owsEaMbc4SokVwODHxr7ZCbzgLJLMgYIyQ3+NikW3y2m3W3JaFCpMmqgrZhsa9mX1jVWGUMctsAdtKqHufpVZTyOjNqauvY75Zu1egcBikmXcYpMyarZhxTlOPih3hRD6ewrnad9V0HUJrwbf1QM1uEaWHpFBKIdH98b+apkFKaSiyozxmJ69W1gxpskZ7uuX6VhBeVSx8ALHBBvJrB6HfOqKyIQE7FWk3qnPKWRIaBsE1YE7IS7x1PP7kLkElcmvZgwIokIOvQIjZEry8cIrG7km4vYVLrtRVxuGKys1tiEdwYgFHPe3wj6Aw9NgyvB31TBsgwmp0T4drqqAhYev786PvIlRlHCK4eXbus9bOW4xic9EKIPihL9vJ7zQPOGuNQXDP5zpQgnHFfmKAWUGb0j3lvFy04V5Gzl9GDnSvI+FLKWwWR/as0vvQj1VbE3Z7LgEs05htqeJjcw/U+cAIUcE5zI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ctb6SpzTXQUicSfAupL7ibO8p74OBJHsmbeBsOQ3e9EiMKdP3NuKDsZL3DjK?=
 =?us-ascii?Q?+4JeIhe2hTyWtu3UY8pEvJBMONabus1h7Uy8mOVZAFCKBhbSGtqtvOwfKtWX?=
 =?us-ascii?Q?nYTHKODLciCmU8jAsIRtCCjCCYZsCVmKxGMZN7VPrU33hw+mAUXO7ASrEfGb?=
 =?us-ascii?Q?GHaYsqDo2YuD0g916VIOUQmVA1jyETvjp0habBjxOPt+86W7Ymdr1JXjg8Qu?=
 =?us-ascii?Q?H2WYIoh+LVTL29SdXhZAEFZ6PUgXJFz64JX4rxjOj1ou0QztFc0YqXi/glr+?=
 =?us-ascii?Q?LCTw9al0EjYdbAKYeeFJC0EpxLRJiXePoG9JvYgZcViAuHH2sSj/JI5KNfDw?=
 =?us-ascii?Q?ainWYjs2qQYOzjfyCAgu6JtD+FBPIeUBXD74M0jAInMpOfaGZEsVUrC06trJ?=
 =?us-ascii?Q?DFW3LXs9eDs9zKyQXzgmfci4CP0X0BKJWiYCPM8I2KaVYVb6XAg1wlFYwxBB?=
 =?us-ascii?Q?ma5oXuHQ4MC4ObWb2eaYX5VCdJTlvXr5O0P6BXhEQZNKmgc4hou+zXYLYOTY?=
 =?us-ascii?Q?u4JJWq5yk4piIj2tVZhIMVZfJSZkDEqyqWnn+ImFdhK1S1L1jwW6avakYWJx?=
 =?us-ascii?Q?JG9N5MFyB9wQNzFJM2M8S0fScS9z62CnbURzzCY5lsyaL9t0YpebDITzq4s1?=
 =?us-ascii?Q?OgAN/ygWCoqTw6RtHBfdA+8LLtjZEw3nsDGJu7gJjA01BYMuS8u2jssAjpHy?=
 =?us-ascii?Q?hj/XOTyc1D4bSSTpVVhG4GWZiiCJAG/gE1aFKDhqxdO1LZthHcOdWqM0jain?=
 =?us-ascii?Q?XtaYKZY3qu7cNtT2lDrGtZgfTFr763/2ZE6oAZ7/ByTs8jP3A3p3PwXoHBdu?=
 =?us-ascii?Q?NfkHZs5JBRXHzPEmsi5GhoBRT2ODHOACjGGotNImXHDDu0tacYUBcGpvBEJU?=
 =?us-ascii?Q?o3ff+jpCi2v2+ETBymMWOvTAr4FRKkLwJhHyYvvS3o4QQAuaOWgzloQhk7Uu?=
 =?us-ascii?Q?r37s6qS3dkXZIhN+zCP1k4qn6H1NWzEce/t+4gSOAHxrDIzvuRnZCi6nYMKP?=
 =?us-ascii?Q?NKD3TavuxPMFHS0bQOovOXanETGKkPuD5+lKP35qN4j/0WwTu+Nn9BxuKmwb?=
 =?us-ascii?Q?Jon6oLVCxGf7q1hV3w5kN+TcPQKWzh/cbnQoK5qfphStw2NtuhDx90Quo2fg?=
 =?us-ascii?Q?kczHFDOt+p5HQ2uJgPcxdilKdRsDWfAsbnyo7ry3Y5C4LkP+1aUemvyo9BOV?=
 =?us-ascii?Q?5l44/NnYR3iOsVfpdpqv+eO7ENJbCU6/v1HMaLrgPQSWe8PFuUw133u1c803?=
 =?us-ascii?Q?5f5J6qys9rL8/cG90YHQiiqLE7p0RDL/zbuzr8x0kZJfCLlECy/9V6Stuhry?=
 =?us-ascii?Q?Um8yUl8F1mNVl06PXHd9m+5AUhF+DRR/8ot6lPknwxo9ybtLNB+soSW1FsnP?=
 =?us-ascii?Q?Xaii+T9aUG9npHMhHSSMpSuFnTjp4DcdrjB1xi4b39JT4XaWsn5aIqguavLL?=
 =?us-ascii?Q?PjFdNh2AKRTN37ZkowLZs3oX9t4DgcKEfocycYJjejjgfG7EbmjHZuLbEMVd?=
 =?us-ascii?Q?RYz4xfSWLK4wvduxXcsDjvgjKs6KrCzvuitGJJxdIGsMdNWJVN9qUsPd5M9S?=
 =?us-ascii?Q?+uz328WssnkBEhxsT59XZHeRNIz/AhW+wh5TQfWI?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a802b5f-3bc4-4656-5203-08dc315255cd
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 13:54:47.8073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3J7htSU65RKE79NbmBJ9mI4Iu0UuhOTjOsZCQS93sxikzhNrU3bxEOI7U7uoSbRSSJAcw/scXlX1mrdNx3/CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1778
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 13:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195875

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport [https://github.com/libuv/libuv/commit/0f2d7e784a=
256b54b2385043438848047bc2a629]
Upstream-Status: Backport [https://github.com/libuv/libuv/commit/3530bcc303=
50d4a6ccf35d2f7b33e23292b9de70]
Upstream-Status: Backport [https://github.com/libuv/libuv/commit/e0327e1d50=
8b8207c9150b6e582f0adf26213c39]

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../libuv/libuv/CVE-2024-24806-1.patch        | 56 +++++++++++++++++++
 .../libuv/libuv/CVE-2024-24806-2.patch        | 44 +++++++++++++++
 .../libuv/libuv/CVE-2024-24806-3.patch        | 31 ++++++++++
 .../libuv/libuv_1.44.2.bb                     |  6 +-
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.=
patch
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.=
patch
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.=
patch

diff --git a/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch b=
/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
new file mode 100644
index 0000000000..d263cced8d
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
@@ -0,0 +1,56 @@
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
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
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
index 0000000000..b0ed5f0ea2
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
@@ -0,0 +1,44 @@
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
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
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
index 0000000000..733660cf05
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.patch
@@ -0,0 +1,31 @@
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
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
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


