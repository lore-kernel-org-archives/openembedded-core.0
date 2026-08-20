Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA2AC5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 13:22:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7005.1787232125538970453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 06:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=O9HlJ2NV;
 spf=pass (domain: est.tech, ip: 40.107.130.42, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruZ9gCPhz1+lfDD2N2VPqZYoGh2bEtiTmT2a6tsEF+5WspGiSZaYgJbWjnkybtZreYsArtW/PefKZ6zru9e3RGj0X9ERQ4XiIUX8CqDTAKGZRvodbAiRi0SqNLTQCPKvjfMQljeHl1QHvdB8iIghgD/3zZKcWTObA1X93ElLXKowO+piOguiLZIhWFlH1HMUYPYQFwQpdC56SyeMPxBeE9V4PGDk44yl+StjSrFz0389XZrMndvqym+Y84+5BvyFCzEvMHaUr7phCm8CqZQ7oj/UUQsNmaY7ETHN8S5aCjMiB9cv9Qe0CUycM9H6VkawAAdDGd4Ib7GkiAMBzRTn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45Aqo2WjYi9zPUyMG2mqGlfJv6gED2hF1I26oNIbYYM=;
 b=lBD29+S7hErgaNd/UEuxX0tC/Xi+nA4lFroTxkEBMW7uLsXGMTVGEGTgW1GgzVM5itO2zsJltFA2bSG/F/qLLc9JpjR0i4HUbvv7BCTR2QR8wTK9fAFCxCg3DJYOSdtwgFkHEN0Tt+fQcy7ft4ZvTY+Wm3Vu4WdCZfKh7//knINrm9GyBF7Ge1pmya3Dl3v741qoL/nwFBx/gS+FipH43O6iSxjX0+ZXbiXN6jYVjeVn2DAYWWWa+aN/UX7P2hPdHqHMNQcmrHulU8ys5wsFtcPGiyjDSFM2hOD37PIyPoXuhmCvlR1+IZCeCt2AAFsyD1e/8388nX4SisYfDMZBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45Aqo2WjYi9zPUyMG2mqGlfJv6gED2hF1I26oNIbYYM=;
 b=O9HlJ2NVVNoV94f8XPFw9S2xz5rsqVd6Twuyy6/3arXKMFwmy7SfYyRfxrcTJOthz6SRXklWq5cTklNUz6HJ7GjvS1kPObNWhk91ix6NWtZKhgCpxlfu/jegfk9NEyEx0h7kOqir9RnCsNKboTA24MNshAnEfJKj2ERgxJCpDz9Smzx2rk4k/9D8FLgXJsubYGuWjSoojHH0lMl3oFO4mZqWVcu9G9g3ZyR/Z4j8glfo5PZ3X4adYCJheAqmlovVqR2lb9sWoFWyaJhGMS3C8CSj48d/lB6raKw4YJzo4v/8VpKeGlqtfLfGTwBv40VM71uR5EY8rBumCauVQ1DRKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB8P189MB1078.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:167::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 13:22:00 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 13:22:00 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] python3: ptest: skip flaky test_interrupt on musl
Date: Thu, 20 Aug 2026 15:21:54 +0200
Message-ID: <20260820132154.29658-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::7) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB8P189MB1078:EE_
X-MS-Office365-Filtering-Correlation-Id: dd13f4bf-a1c7-4a12-f738-08defebe0465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	l2ZzG95MykD5AzRufTB4i1Tj90RexU3mRVODScmqtwRyLvhrmKldT0h6KCHX8I9K9GWkvutH0HEvp+8UjYJYqvdha6V9cbVACZq3ymJrqNP3xaiqEOApZogx4R6sucbg4YHhlS7nrZW6cAnl0jRe53qP372Rt69SB2jEiyxNFTI4PeFTE2pUmfU1WOKn+fyju3PWmqNNSfVnLKtfM/te0/wD+Iypfz5lLzoqpOKU8aRu2ggWFX2dsBcPtRLFDBJsRhz5s9DSU91Rm+pCz//q3s/rF8oKKRsroVPtPZx31ucaazDPh0GO6vuMFWw2tGDS9bD69V/4UIyzei4HxrKjiFndJy6WdRwsyaMYabscE503GGzUcKDDWlCFH1d/uqsFfv/VR2pJ2GLjJe0umGkCwYgpz9OCoa9DmDqAEKDG8ISBEMflPBiPb3k5irr2kUlkmQX9hVXHh+Rtaf4vVXEmMCzGNHRvk8u712LmYlsVRWeC0o/vbjwwUryumM47B7zWlek1kYdB6A2XkeOwBlTY4gKRO6Givro5GuHgoyx07hdcHsWHqOHfPJs+vRm/mW7HiKL3Z3SaHDblRPF7cekH6WkZBoZTGkyM11Zujl3OH/Kec33jyxJyo1DD51sUJj/XbQ/2Qxpuyz2rrohF+00KfmZDA9NmEy7ROu1BOIItOMA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uJxN3eaxvnbYnCLilEDUOmhpVbUDxREOyZvnd+uCFqyJrE/ztDt7CxJT7Dft?=
 =?us-ascii?Q?6gN9rpGfvubsr7MjJuOwJ+A/aIMhWY6dSUj1t0p33PR0OCZcJkBXCEE4TwIo?=
 =?us-ascii?Q?pp19b3Sa+5Wk/d3QYsnBstOnYKc1eAj6QzZ6y1FhQxF5dLIhuGyummaIMKol?=
 =?us-ascii?Q?nkBf6rZ37uqRq9H5G92PhhNoSKJRCGwFnNEt2GWT4E55/uz1Z4K0706061aH?=
 =?us-ascii?Q?gD7nV2TmZ1hFPk2DViMXGuxoaMMA2cWt/nMDIgSAYva2GN26PMEyBXa8umjQ?=
 =?us-ascii?Q?FrzU7IJGoMiorS5b0+VnoWxeMs5FKShfIbYOPBS0Q5n47EZKmEEGlh/sPpIG?=
 =?us-ascii?Q?SykG4QrJodK8wuLAayZAagXHhTOOv+MkSMXb4Gn2Ot3O9kpeGjNg7LpOJMZl?=
 =?us-ascii?Q?4JQYKhCqfhKBWC3pb4pwU2fCQLU7DXE6K5CW4AWMt8hPSTb2GVecQXEcNmU2?=
 =?us-ascii?Q?CYd8zE2L8uMoWO/gNbmf3H9OD3MRWX9yDwgyppCRsdlIiAhAL8GPHpzwwOvY?=
 =?us-ascii?Q?5WnMz43U1w3d1ZsJZ4k0SsFsc5Z+fQWtkfJmXbtHyIjet1mu+GW3b1zK9sSq?=
 =?us-ascii?Q?fhXWAYWChuIdXlppeOqYWjOkIS8SQPdILcw9rr93irCuKlj9K9WB/VF5K17B?=
 =?us-ascii?Q?LcibDcJrNYi3qcGE/HCTEbtM1NYIk+xyT6Ey8qoIRnw4Iqju9nfnZfBrlHlK?=
 =?us-ascii?Q?F3vRNJqF8HXZLwdf8zHVl5vlzAuVXsXA9Sw0p8Q4bK1tFxuv4pj1DPcS4G2J?=
 =?us-ascii?Q?oSXSxtYIPwjeCG+e9fzum0LvHLTrivwadoQuhqghdpfruEGQlfw6htMRmqWe?=
 =?us-ascii?Q?YE+dfdZXjWISE0o0pP6GRR1mNXga/nrcObh/LEL53xcrfrWtc8rh9okNg689?=
 =?us-ascii?Q?FfbPZHx/b/K9OSU96o/v6QxcsgcuiSI2Q9nutHXP9/eNbsMUAl0Ny1TO4PTb?=
 =?us-ascii?Q?3ktcjxQZ6uniItNWFIahpFevwMLOqA5t7RkEkMBMf4U4zvkG1VhGWG+Cn8VW?=
 =?us-ascii?Q?fxIpDrpgVGqQMEoWnoGKIM1knYkZCnOdOArA8hrOIDk2d2Y9JxBAps9DkXWY?=
 =?us-ascii?Q?GMUPYpPOJ5mk8xToYo/tnwx9c57YJxoqZOzDVqf4teF3ve+oMntwVb1S3MIV?=
 =?us-ascii?Q?ER/KOIsdryhWfXRGiGOxBNqwyqzgUFM6NhIN28VuaHhUnzYk0c7RdAXkn7yv?=
 =?us-ascii?Q?NYME6GwA7PttSEpmYzL1+svLy8i9cN2VJy9+v46cvDvT9DfDQIsV4LF+Vn+S?=
 =?us-ascii?Q?pUmtlIsoty/fc9ZNVSMu6yfhoBkwonCPlnZARhmmhWKYdEK/Ve/DjZ7HrvB7?=
 =?us-ascii?Q?qbXfB3hbh++EHJMxhyROtwM4u6NFRrpogTkqj/MZ+JNS/mZ+aAL3etghQ4Yc?=
 =?us-ascii?Q?93BA9440zXe4YHVHEuf2f09mVCtBxJSb18f0ziZgFY0OEpMJA7gzwT9QXv6+?=
 =?us-ascii?Q?4FyDSnT9dDIbk6Yc9tljLU3DFt/RcaTlQbPdp0sWbx//32y4gOjfFcyUYFrM?=
 =?us-ascii?Q?phRFJ0UHZnSXY3fTXHP4EgyB2QKx+QVXzlGA2biXwuoDWNCpmZv1mRAmZ7MU?=
 =?us-ascii?Q?mH8ARSh4KP5TbwdxkqVxBupzq+9MgBbWF5TatbyU6i3E8Tj7Y1DTM03QHEpt?=
 =?us-ascii?Q?k5jY+R6wKjYHc6C/354PZ5HrVLj2E5KxKYNS0HZtOsnbaNaU8/AM+rrEjdhP?=
 =?us-ascii?Q?PCrUhL1CfEORnZzk2y4rW8Wo7zhrVAgI1G5wwOkm7hSUUPcSESMi8HDzHjWl?=
 =?us-ascii?Q?/sExlgahBA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dd13f4bf-a1c7-4a12-f738-08defebe0465
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:22:00.5232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/htdDPrk+SxjcxfZeZoJJaS/bPSe27CRJr7OLMzDXevfO7Hlmsx/9/tYy5NYKeIAA1FzEJbxtVzRgUn5zTvLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 13:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243859

The test_interrupt test in test_multiprocessing_fork intermittently fails
on musl-based systems under load. The test sends an interrupt signal to a
child process and expects it to join within a timeout, but on loaded
autobuilder hosts the join times out with 'join took too long'.

This has been observed consistently on qemux86-64-musl-ptest across
multiple autobuilder runs. The same test class is tracked upstream at
https://github.com/python/cpython/issues/133651 and is part of the
broader timing-sensitive tests issue at
https://github.com/python/cpython/issues/130363

[YOCTO #16348]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
index 53a9ca59b5..568e632278 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -335,6 +335,7 @@ SKIPPED_TESTS:append:libc-musl =3D " \
     -x test_threading \
     --ignore test.test_strptime.StrptimeTests.test_date_locale2 \
     --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym \
+    --ignore test.test_multiprocessing_fork.test_processes.WithProcessesTe=
stProcess.test_interrupt \
 "
=20
=20
--=20
2.43.0


