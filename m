Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C452DC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 10:52:35 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4856.1788432754503029755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 03:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UxVVV8OJ;
 spf=pass (domain: est.tech, ip: 52.101.70.37, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJcQw7aTynmzFZvtYUu8Fn/Kohat+KMbVxVKr5C973nt85wBaL48vhlAo5H9F8ahDuHLV6S48X/KZFkTDafPggUeh0F9obui0I/Uz7NghWxsnTDnMyb8OsYFdW6j9pXNr0kese0LExz6PvYrWQQW3THROGgIkREKQIB3/h3K4DJTX6aj4+mhc2tKJX9KJwqbylLZRZJRq++24Oi3U17vo/WobPHp48WTKYhhGHUlDhyNcUfMEFDI5b89nswH+LafUjK2Xgm9QWhlfP8KrrbUEyZTGwgs+Mvt7w2W5nrZCA7I9YOo7hAQBVc5s6idujAfzuVy4DCxTnDYi6p/JMy+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/3Pq2QVb8wyUZIGurFdHSPvZEtjwONTIKEVAA5y/9Y=;
 b=djfJf3cflNU8Hm5iGINcACY88b1QvQRBqNVTLEt0kaHOXLkTabwoEl3zk6X/PGb53SqnrmXrkVJp+LTA5IW8NQoOzM5RpFqZJOHI3nIlD1gWVMIsBTfZGk/5w8q+oM6s8FTFrMHpBag+SD9G73+6v/Yy5P4Bl2hfXobXynxq5WSgATeBBKGeZbSTcg/j8Sl/YXqo2dIooioJAcV3MmW7x3RnN2C0VvpMaK37hF8NE/RxfqyWxu55tSkd3iXtkBBl5SugBEYaXwUdI7zVXyQvg2psYsVrOcaoiGz47ic55+hmWQIVxcdQgqfTR+JHwBqyu+vNrm5DKz+8hiARo39Gyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/3Pq2QVb8wyUZIGurFdHSPvZEtjwONTIKEVAA5y/9Y=;
 b=UxVVV8OJk/1VlSb8Futs2VHduuv+Yv926TPCIes14ug2/YDjZsDFfrmmhg5z/7hr0T+uuPDS9MPsfJHIjoWabpt+mtgMzobyW211vPnBgMWk6YTMpvh1HixKonpVJfImRx0alreZpDwDc9Xcn50xMn0ZElPbyQa6a/4gBmeDXNoi/aoFOVla5iMx78Wcc/QKr2oAxYOiR8wMbbFRzWaKD8MxhdSDteCwn0eJjhQoxec13KKt11RW3BJE5kf5CtTsWzeQdD+8ctQo/gpVYHIdRn4MgSL+N5mXr/eoPRXnRSNYa1vuoTGcSZ62qLuJP0dl2G/WRpZR+5JKO57+YHMBBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by VI1P18901MB0813.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:52:29 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 10:52:29 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] python3: ptest: skip flaky test_attach_to_process_without_colors
Date: Thu,  3 Sep 2026 12:52:12 +0200
Message-ID: <20260903105212.19288-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0361.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::6) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|VI1P18901MB0813:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d349ac3-6c44-431f-c07a-08df09a97315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	O0vo0BTt70lXDhkSvFAUi7MOCBWU3YXkC2VmWbJvEUq0phyGkqQEU8RCNZTnN99D9Qdub8efA/Il10GiRK15xM/0XpQsSCeom5a6HaJosyJV1o6UNlkM5aZb119nWxMv6xgJZ0p1R6PndJ5r+p7MnhaYXuC8tmp6tOEHSlUG3GqQ5qV1v7in8bTxIDnKHJVO/wHEglMT9Gqck/8WoVqBDn9CsLkB1JcwMXqUC3KTwSy+rozyvLDc9dXm4dHkFzUTLDHp3UT01sJWmUUKh8ZElhEWPEtjsd9KX0PXSaayd6oGsydK3hN1tTCQYI8yO6rVYl/etkuSoJoJT/6QIfir4K7UhcUNbhipIred3ihinE4XRmpL0Q48/vHUX5I3/FyGtSn06xt7QBHIIN13Ou26F4AwxPrIa7YuubIFSGv47BXgxgygF/U1+EDUgj0aRTKVLf0Czn9w96385WkOq0A0rOebavf69PpNhUfRw71U5sjgVC+TfVsPLetkU8Edp7xTR07x+CSuJ10QhsvbXIu1HZAthGCdGWdnjMtIfQPPXexVbzdx+IlF5bJhMYS/izcqhwXZwWAL2fRAeRLh2Ke3f3oYAqa/kxaozC+c2rDp7QwvnOEnJ+v2eOPQNK6g6+JKV1h7pjYscPn2eiFeqrnTL5uycXM7neoXkUxiBLBTAwM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cFn6+HeJUAxPAv91r2QWHcdU3G8PJquIU2fMbecZ4rsbUEwz/e6VHVlQ6m7Q?=
 =?us-ascii?Q?kyLnbIYdYGiUNOmb4G6MBkUqfcBoFh78rB6zPlirNxMM7lCwlyB8ZYCquCc0?=
 =?us-ascii?Q?zPlha8h3pBL0I5U8LgZ2asBCFf6pwLKjhZ6SNzIgzAAMM+fXsAgCBqhjv9K6?=
 =?us-ascii?Q?iBNsiC7udtbORqf/vi22MPiN1PdbN8tHk8WYZ3n4GDKtHcrzfwA2WAcBfcV/?=
 =?us-ascii?Q?LeDkhJwedX+kuGXmmWKS1afcJxGOHlldQMBG39zd7yYAs6Ykl5U5LvIIltyO?=
 =?us-ascii?Q?8ipVr8lid7lkCmG+NdON28FvkWWkfRgkpo8k4ZPY/qnJWFXnEl4aJzCAgN/2?=
 =?us-ascii?Q?V3LxirS9DPS17bz5qaPpbgwsQktr2krtRvYD9i3i9u5IyoGHDoNuh3SeoTh3?=
 =?us-ascii?Q?JQ2pZ6cY810G05XGPxfSBpCm0j3Os8HX0kWkl1XDURwWqTpGnIznri+yGBHO?=
 =?us-ascii?Q?Z6x0a7WrXCjlh5mNmqigYxVnl8JEA5s/ckkgIOcBT37yBwzxhFTX+iLqmVwg?=
 =?us-ascii?Q?FwXPnzxYnn10Jm0JatssuAuS2uSY8PJxkPthDt3tbleZ+n6qOAArDpoJxuBw?=
 =?us-ascii?Q?E82QEbOaSHyu39JYm/mM4w3Fb3PRerboeGnUVGKgmjqcETH9uHTFLJfpub9C?=
 =?us-ascii?Q?vhCIBVuYyG5UIKYRd8ZXIelcGtmN/sNpxT48yiHmorJ8FfAk8LtqMg7L7vF2?=
 =?us-ascii?Q?+wREKuayis4RjP7U95DKQKopo+DpSpK829+HnA4kyZSM9YtwYJ2fLo07y6p0?=
 =?us-ascii?Q?uQoT45JlKmF6d7z64TTW5FwvjB+s3EAs1P3gOVoH1kgSeySp+by/Reph5U+Q?=
 =?us-ascii?Q?AR57pZT8PzG8lsz4kFVL9I4LFL6up/JeluaEY3pTDXT5R2pm3O6aa3vYvCoZ?=
 =?us-ascii?Q?p5p8XgpFZ6fwbhw+gL7QxO9JZE0dNeoNgbj9c3V/L7zrM+TZALjck/9PfJ+r?=
 =?us-ascii?Q?/epq5AlfR0XorDJaqg/MJyR6vqaBXxeSuMHhy8zNOgfC5ThMAIBeVozgbQE1?=
 =?us-ascii?Q?DlEjTIKllOpTkLnsSSvdvg2S3yNWG5JFLVrBRG1M2WmiR0/OfRa0Y/pSxegK?=
 =?us-ascii?Q?QuVNVTGIp2dCmyTVChjc0tEE/CSymzx+JNupURg29gG7smofu6WHZ9Lfto6r?=
 =?us-ascii?Q?tSbkSwRqh1U9LPTk8bP72MwCbvjk5S5/kSuF7AOz6QuWxNopaEwqCzVm4bG5?=
 =?us-ascii?Q?CCcR/OMUuX14ys+qNTuiClwx0yIyPhzL2qRQtzxtTFHb1TcW4VyDpmB2otZ5?=
 =?us-ascii?Q?juPLboRfIY/WPOeiUdh1G+XvV45JEv9u8Kj83hbMYJKBRrgihM7BYERRR3Qq?=
 =?us-ascii?Q?5pzKJ/XeZjsBlzCD0tHLO5LmXnw7uD4kSGZpRGpxHGEKHjEOXpixhIawh2Vh?=
 =?us-ascii?Q?vIvNqGuQeKae3ZQWTqlf7iB1K8kl8TFBYg+NyqjX6IZDi1oin9Kw+me43i+4?=
 =?us-ascii?Q?mKkXX/4DrljzSqmNP07/FlpbH1C8Ms5CNgckjOGLGPtaQiy3G3UtIQUJk9cN?=
 =?us-ascii?Q?PA/nouHYSQHEPTMdPPGDnKQ4gwOHdzcrrhI348TcCrwVCkgNKQOSyK85BNen?=
 =?us-ascii?Q?bbKOZ0sEex78V6ck2RGohoPaOwURwh/JMMZfXkA9tRqVDHateIkcn2tStEix?=
 =?us-ascii?Q?C5o1yniL/1KMBANFBBOtbfuwHux4UjaPzS0M7O3ZFKWVy4Uxy9JjLJIQbIcB?=
 =?us-ascii?Q?5HE/Hq4sB8sQdX2EV5D24GH4lX/736qEcviMA2Ok3lm+W4GnwDECwrOygAr2?=
 =?us-ascii?Q?JWbJszgvxQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d349ac3-6c44-431f-c07a-08df09a97315
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:52:29.5848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RthFaSh/muyjyx273SUXliF/mlclvJ4WKoi8dQj+GGKqC3DpZ8LxG0wRkezioiVS1I2C5Oic49NlittUM1d6Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0813
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 10:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245026

The test_attach_to_process_without_colors test in test_remote_pdb is
timing sensitive and fails intermittently on loaded autobuilder hosts.
The target process spins in a short bounded loop waiting for the
debugger to inject a new value, and under QEMU emulation with host load
pdb does not attach in time, so the function returns its original value
and the test fails.

This is the same race already handled for the with_colors variant in
the same test case, and part of the broader class of timing-sensitive
CPython tests tracked at
https://github.com/python/cpython/issues/130363

[YOCTO #16412]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
index 18373e5b5e..bbba5a0003 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -324,9 +324,10 @@ SKIPPED_TESTS +=3D " \
=20
 # Intermittent failure under load - the remote pdb attach test is timing
 # sensitive and fails on loaded autobuilder hosts (CPython #130363)
-# Bugzilla YP 16201
+# Bugzilla YP 16201, 16412
 SKIPPED_TESTS +=3D " \
     --ignore test.test_remote_pdb.PdbAttachTestCase.test_attach_to_process=
_with_colors \
+    --ignore test.test_remote_pdb.PdbAttachTestCase.test_attach_to_process=
_without_colors \
 "
=20
 SKIPPED_TESTS:append:libc-musl =3D " \
--=20
2.43.0


