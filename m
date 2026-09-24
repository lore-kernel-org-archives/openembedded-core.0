Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ADDC98317
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 11:44:24 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5896.1790250254628119017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 04:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XCXC66Ov;
 spf=pass (domain: est.tech, ip: 52.101.83.27, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjqjPuud2CJXCSQBjFIgFSA2YyWQI17bSjqXKbd+p0mX3uqVuzlCUyedCB+c0KpGpqQ/PEvxX77KxsbcM2ipvp8G6GfYPSK57xCtnI9DugKPd6AR0Bg/VdZYTnffAUWXar6TDaY8X+sp48x53wAZYktcc4JYeZq10aHG41MkXiuFaq2tGNIgYU72KdXDe3FD9VOtKRCZuSGrHxE3p84YBY1eEmr8N300M8JFfrlzkTE3bMp87VSvCAqJh291NfZLvoCcW9jA2642yLHiT3EG13QQqtUjnixVi3CIi63JWK4iu6W1ql6P7nZzXyInh01RaQXB0AQu4InqyMtAgaow1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOBvwgMfq2eOMkyo+u9Bna36QNTlpaUnpLWbWrBNh/Q=;
 b=WmuLWihmYbbM9Ty5tfiGNd6xn6GD+O3UpFTqF4BU1APNz3K3kVxzXfBmOM+lVtNMvzGo916hfHJIaw87zYRKIptQ7zj2jQJUYoTznWag5Llt6hl/EHT1zAKiOrDlu/I0EubbPfEYHo1yQsGt5zGiNBStgo4maT751VWjXH+cuDxh3dLMI55y5WURGhM6IQPtv+LL8BnI3xf4TYziyTC9ZJnf6Y4r2iwuyPQSzyeRy9D1Y/2CjDYy3j/YbxkJjJDxZFTJ2Snlt12PzkUfar332uM3ASyLzuVMwPYTdBkBxnpPJd8VdPQYHknFQrl3FsjzL45zVKJ/Dxu8FLPxrQ17uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOBvwgMfq2eOMkyo+u9Bna36QNTlpaUnpLWbWrBNh/Q=;
 b=XCXC66OvsxPR75pAabsK5nw6rAh97qB4SzLbHtzBmgmQxulQ3Ctizqk8JVodlNtWHfne0yECgyXyP0LNMkSOiTk12mK+8U6APVQgxWJICDxeVHqVJQMyPnDdb1SjS+p0CWANDf7GhBJ4LVIU7dpTDZdlFAQ8LqFuGUbjtVE0urMxbKxVTHyli7o1cUU+eW5Dvu9F/Z4tCzHWaaUjcpD+Voh9XNtgb4NqKLgqo35e9h63VBWq+R2yebJdqPj4nTGovER7xbfV2i0ISDELdbGRx2P7ij9j1qU6lEx86GnSb51HnlcWYaPta2CvxZm8FzuqFIgiy5QGv1kYIM4XDDl1Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU0P189MB3355.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:59b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 11:44:10 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0428.014; Thu, 24 Sep 2026
 11:44:10 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] python3: ptest: skip flaky test_staggered_race_with_eager_tasks
Date: Thu, 24 Sep 2026 13:43:58 +0200
Message-ID: <20260924114358.24945-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0235.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::30) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DU0P189MB3355:EE_
X-MS-Office365-Filtering-Correlation-Id: f947cd31-f6d2-4f9c-c839-08df1a3125c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pxu/PWCnGoINej80eE7vB57j+xZPelbuFk/1jLEqu9/Xvs+fKzLebqe7iqpqiIBeoQjx2MAFievSwJckOWOAgO8NrOGWeSKULvOTqu7Gpcu8ZGSMPIEOmUUUSgIS24bIKAa1ntcvFqvmE/L02SxDTeCPnsmmilueFyM+maAmWvH5/XJgTOdwNVap8YD3EhQAqgWPlnZkPTqgX5/5KifkW44SBnMMI3mxT5AfewV7EEpxs+iRHwazEI5uYoWiqUSvRFSBH7COYV/bFxejQOVRIffO5dUdt8Ncw1NpcK+Tk/Gj3iYr3dikEBjAeiQN1VpxA6Jo6WnNe6KFkBT2ePvIMmZI2OubrxhEDKt/MLMrzwTcbSfM35PxVyd2CVrdlTV135OKrIDeL2eg+hi9bxj+q2CdK9eiqMw5JMaTL7zYqVh//V3EDuh6WRO5lgmCxdogKCrZ7ay95+rjZb4FkeE1quNwCoE/L2FuKfZATRRcMkyCKFTQSNALN5BC0QBxKwJ1AUYFs6sf1JTyo+ai5UfV0PypKIHZpujy00MdPWDj11OmudKnTu61RSz5RcHFmk7wExbz4v233evlqGIudgkps4X3s997JcJDTLBiqOCkOxoUaGcdqQiUUutzszpSQXbuK07wgOWUDNnjUHzK7oWLz2NPojANhMGHA7ZdwcnXG6A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T3+Jdf/WbxXfAOPdyN1Abyh/jE36jrnX6afXbaAJ3gWx7gXBI2Ylym+5QQU5?=
 =?us-ascii?Q?E3mQ8lUbYBMmDZzfdHKPI7qm6zpJhmVsV9wiPImOFCPjgdSuz9INU/DA9JQ4?=
 =?us-ascii?Q?B7+D2QtWglD3wyerRzdhTlq4xOUOaeWd0iV4zESXkIhflJL0YDc/wHrZ0fCZ?=
 =?us-ascii?Q?ZFPmbEoGFax3lMOYKM0+hRaJaW3RrLtFRFdQPVih5rG/RLfYqScWbXtPbQvk?=
 =?us-ascii?Q?WdGg7IWVRmvw3kNmCfsp0Zahbsn/o9TbAtgtlh3N9OTko78Wujhz+0oIbszC?=
 =?us-ascii?Q?99YlqEPod8Klhz255D1XgvmvKF96pHgX0+qyW9/paKq1Fy2ofdwlkmR3tOqX?=
 =?us-ascii?Q?CY6SWvPwFHxUk5uI4+n4FN0Ii8bFmsSW52nZPZrXg1YDrKnUlMEZ1QtHVkpn?=
 =?us-ascii?Q?5TbMGZ5K34t4c8BNI54K4Fu4azWnWSL3Xtmu2qgeZlGG1Mx66Iler9gAXZtn?=
 =?us-ascii?Q?1zdM8SU/i0y6FeR32WEAn/ZGY2mcnec3w00NBXSldJtqQuWo9unWKdp8GD9p?=
 =?us-ascii?Q?irW6hDeo4ovm2KSxlCZ3oPTbXALbLFnrz/VcOrFOgA3SIdEtdrTANhrenL0H?=
 =?us-ascii?Q?wWNyLXym5CPgglsaK9Q7ieod5G1bIIZ7sIUSez3GJH7dLkb21WHbMK/6Hoxg?=
 =?us-ascii?Q?fm6S4GzdvGrz/PMLRfqvL3I9NPi5to3x+z5dSGL/3Dw0hjNCaCxKwG4xXZNa?=
 =?us-ascii?Q?Q+Dyu6s6bzVz6qRlYeTzgPSPo17zJQVJCnqnmo/t5aaUSW29G29/DyuKaM6a?=
 =?us-ascii?Q?vHGgiLlODkLNMlte48V72V4RcsYe/jQNFOi8IeSjntgHClFKFmAxVv3upBXA?=
 =?us-ascii?Q?T3LRKms4XeAHmeoq0JKxK/GBG2z2wHfb3naG+MwYUqnXI4iJvnmCIG1bQuPd?=
 =?us-ascii?Q?DMNhdLyb4/B30ICTYvaCdBax8RymsNOx9NgubeO1bBPZ1bhrrJuZR6Vi/6Tv?=
 =?us-ascii?Q?eeAkVMf4y2IM17MhGqyG3hCq8TgWo7BjeL1m3+6kKSe/Z8hBhSvLwNsqMiXG?=
 =?us-ascii?Q?sTpwGL8dvbAldeSuZYmq7cnVH4yrGWq53ezI3t8yxniiJscdj3NbW7geT1er?=
 =?us-ascii?Q?/QebpRHbrexZU8KeCIDbSrwomvPvdyTaI/UnvP82nnZ5JixrP9chEv6ELuUd?=
 =?us-ascii?Q?IphBJi+XXjMOMFxeioPI7anQVQU4sB0id5Cy9KxVqiqUvNc81v8G/HSfCEOW?=
 =?us-ascii?Q?jsxJmaHDokyeTCu6h+ijDz04K5GEE1Z0qlw0qopFhmdMu5a9Lh/Bw9clRiui?=
 =?us-ascii?Q?zRxVsV2tFVPtSxPf6pHiF2P6fbDgjEu410C7nv+GHtKanNfiPVVYB8g+aCiq?=
 =?us-ascii?Q?Gnao5aowg1WHiAAiHA7DZRyK0J4uQv0gqJ1hf48p8ruh71d5kntxMW4yeUx2?=
 =?us-ascii?Q?UcoBQ68BVfkEL6ZDgMjOXtRaSqwx7yOyawhuOWUXmQCgC5Aj/TUVot0Sjm8t?=
 =?us-ascii?Q?AHPYBC7pYXKyBfC7mCbwl1jgv3uIfJu3LCEWSaOtGGpWRl560H62fDqk7ams?=
 =?us-ascii?Q?tqZl8v0sglzgadu8aeaHlPL7IJ5uT+O82viCY4mUkcJTsJaOHEUHvEcgfNKo?=
 =?us-ascii?Q?GmelT4x/JYuLqDeVgeZItj3kIWDOmSLTRgpT/wLMyt8kXXW4hcPmzaqFmw7j?=
 =?us-ascii?Q?GadNTzxukvcXCmiL4vafYKDrmCE6dht1q6Efe+FnTfGJDZicPUOjOoGfg4Ta?=
 =?us-ascii?Q?slRByaEjs8htqVoYcnkNvdfPQJIFxTmEwR6wvBKyAGP6urv1dhEOlB2UblS5?=
 =?us-ascii?Q?BQZ9caNwyg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f947cd31-f6d2-4f9c-c839-08df1a3125c8
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 11:44:10.0462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksTStgLomnJT786NpEuJk16A6ueUUu0e6NgefFQ4cHd1EuilOkrhl8E0hUGPPCH5nG1U1PHnkPoIEh2i1n2cPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3355
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 11:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246583

The asyncio test test_staggered_race_with_eager_tasks starts candidate
coroutines 0.25s apart via staggered_race() and expects the third one to
raise ValueError after an "await asyncio.sleep(0)". On loaded autobuilder
hosts under QEMU emulation the winning coroutine finishes and
staggered_race() cancels the losers before the third coroutine resumes to
raise, so its recorded exception is CancelledError instead of ValueError
(AssertionError: CancelledError() is not an instance of <class
'ValueError'>).

The test is timing-sensitive upstream (CPython #124309) and part of the
broader timing-sensitive test class (CPython #130363). Skip both the
pure-Python and C-accelerated eager task factory variants.

[YOCTO #16435]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
index 57fc599151..f917edebd8 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -339,6 +339,20 @@ SKIPPED_TESTS +=3D " \
     --ignore test.test_asyncio.test_taskgroups.TestTaskGroup.test_taskgrou=
p_23 \
 "
=20
+# Intermittent failure under load - this asyncio staggered_race test start=
s
+# candidate coroutines 0.25s apart and expects the third one to raise
+# ValueError after an "await asyncio.sleep(0)". On loaded autobuilder host=
s
+# under QEMU emulation the winning coroutine finishes and staggered_race
+# cancels the losers before the third coroutine resumes to raise, so its
+# recorded exception is CancelledError instead of ValueError. Upstream tes=
t
+# is timing-sensitive (CPython #124309). Skip both the pure-Python and
+# C-accelerated eager task factory variants.
+# Bugzilla YP 16435
+SKIPPED_TESTS +=3D " \
+    --ignore test.test_asyncio.test_eager_task_factory.PyEagerTaskFactoryL=
oopTests.test_staggered_race_with_eager_tasks \
+    --ignore test.test_asyncio.test_eager_task_factory.CEagerTaskFactoryLo=
opTests.test_staggered_race_with_eager_tasks \
+"
+
 SKIPPED_TESTS:append:libc-musl =3D " \
     -x test__locale \
     -x test_c_locale_coercion \
--=20
2.43.0


