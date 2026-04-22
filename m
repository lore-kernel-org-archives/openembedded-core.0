Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29471F9B5EF
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:04:01 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76592.1776848425285286867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 02:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YvmeSr7h;
 spf=pass (domain: est.tech, ip: 52.101.84.47, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wH1YA1anlWQg9oZmA5+ZZmsZ2EeBKBwn1maFptUXZcjRifCZ8cUcGGDvn75lSkLHc2rj9qY6p4vQvjU1CMpdBzklM6eITCRXzxovoVtCt74HW0vzGQqD11lt21329/9kyh+odRh2zWZoSmeBrAiKQL/CxX/9jNcohZHOUdvUX9/k/krAb8E4P+rhGBSniaYal4cxo8XqXmRV5BpsPWQZgKZ48uqGhJOVoe4WpPb9GFCWoUcvUFgkTOYoXC5eiTkgpLwoSbzKEC2iZebcCRP1ntmP+uP2vy2GddI8v0Z2glWeyXKiuOJ7U09BX5Iwnpid3Ec5lUEO2k46e/Ivg42RvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xAvX/LbSQAJYqMgFsBV3NwXR9yLe3J2comNdrk0UJo=;
 b=MgTy9Qh4ODWKQMuxZifikqfvfSshV2As5blchYsx1wKwHG7WTN0u2YlE/qe9jNFpJhuHgkhGArhev7WYBU+N5r0xwHrzNihU8txHMZv4K//nZ1vJywwEyhML84yaVm7MxTXOe/2qDE59O7mGSoYxrKlSkECvqzdlL3W80sVdu/OYRx6ZEoXgAVmnBTdC95Hax4RNr4WZfiAvDilCW6r5RB0ha6O/Hqos4jvAAdbQYSTxHpxWE+MnByXzdCzjSIgeskE8wXwicI1lRda9s/aAoONTvjGXzGDxIi69k2975nZQQ5PjyfJjBWYsChmJcu+pPuTzMJ8bWdYAo/eVEAvK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xAvX/LbSQAJYqMgFsBV3NwXR9yLe3J2comNdrk0UJo=;
 b=YvmeSr7hxsWyKt+djr7wbM4f2O5vZp1cuhh91MqtR0XG5jKNkO8ES08W4wfiuutR0ehQWQTMPcZAYKvchFhZn0P+y201yj8WnOl0P4P/qROczittW7PcgtrbBHLnq9ODJ/mm/BGBxCudq8jpgReXNPIZFdtbikXzDrhHns+xmX9OAzG89bXJsuizBb80e72VlQmRCBCBHpArEk2+PvAS3Rm1jhcyDc6W6rRibfyXggE2PayA7scU4+gwdc5Eue7jTmU0EOIkKH+RmSxZh7L3fZ2iyFHOgm0djSwAcBz+M0xyKtiSPQv0XTiHHdzKQltRFuWRF4gPC7jOj174cdLlFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS8P189MB2152.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:53b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.36; Wed, 22 Apr
 2026 09:00:21 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:00:21 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] expat: mark CVE-2025-66382 as vulnerable-investigating
Date: Wed, 22 Apr 2026 11:00:14 +0200
Message-ID: <20260422090017.322293-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU7P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::15) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS8P189MB2152:EE_
X-MS-Office365-Filtering-Correlation-Id: 07737991-a4e7-4bcc-1bc5-08dea04d952b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SlCLhwMZCT9mqmLAEKOBqStUhztND6PlV0h5/4ATTX6RYUcT8g+L9fFLJGA4cn0Bh3Vua/nKSfou1NhT3j/FdTr+caKOfsKYhewhwC3o8hHY1Nfvx7CVyXMRc6ztt18O1tBkZElXa/yl2Exm+5hATMah9qy3qDLF2bjeEYgY9OE2sqeKjyGUd4YMnG0H5+Zp7/niOtX/dUs34HZ0kmTGMwS5XwQwXExzU2FjkdtZ//Sr/zqBapMLigHHOsINoqPGZoZeb5kakhlJpnpt7JTYpsQ9HwwUpSoQmvtHU6LbWuDnfpQKnwqolr3HnAQ+Hdi921wsgGPE3PeXKq4BiD1Vw1/aLgK2IuKRwGC1H9b/Q3Bz1y83Z7j3o5gQQn199GMMKyrFJM/vHgUO9TLsFzhIGw6enHT5YImz97w0n3f5fnbiwzeJPgS54kzdU7UYotKjbV9Y768uuC6SROQKDBv5h4Lj6fGIWsqULOtAd+NxCs81d5EwQNlyNCEFGTfybwHzSPiJB5b/B5nMGnmnmca+K7xnXw/W6y4RLb34RajsTbbUkvuKMQ/xArV5GAoi7ICIdUz/xiGFIi632730NkR9jzwbdnfEnCtV9AOhXBMiwHNT9wd8qINvHvlkwE5wFRlI5x/7ntbza7mv9tQ7g5ZOr6+OoYddNlfuUWsMHoQOPgVoDWM7djxlkNOKFQ2HP3rwe1P4OWTpBaPVDRXDeo9ftVSinimVvPmn7A5OkoHefb0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DiE2LV8g41KLf1fn3Fg2LuT6t/IbZtGS6WGiNR3yaq5y2Ep1gKy/HlKDmBID?=
 =?us-ascii?Q?O60j4klyX+kQXrUSYjkVVMPHd55lsVnn39BeFe/8jyIgo+IBgIuEg8X+oVIB?=
 =?us-ascii?Q?cOrf7jnrBVaEVvBDV3kLopRgxNmouedvqQo5xZJ/Tv2DKLBfCJRNWXtHCZOt?=
 =?us-ascii?Q?/piGTtqW0rOxGV9I84qpEwgmbEpegEefb3Bm7mHAU3neOHl78FxtEAq/yxlD?=
 =?us-ascii?Q?qJuB2oD9hebcdjWYmSzCY0jLpJN6rhftF3+ZZBlM81j5cvNszN8En8y28FuJ?=
 =?us-ascii?Q?M+w9W5K1AKLYPbbVi1SUcIHb7u8xed3+O2Fbg8RENNLiJNLJwwA+wiwwpXJi?=
 =?us-ascii?Q?54QFmkaBwG8Yca7lmn3s8zY5hohPkK4tU/FjPVL/Y39kVHgqtcDjX7JSclWy?=
 =?us-ascii?Q?97JOitvz1z9RLrzsbewvyLcc64gnrF1IVptflveWrpvYodf4Cfy/YhNpGNDD?=
 =?us-ascii?Q?1VVSaCY4L52pjai13RGBW1FTmHNOh65XRuujWenWEDZXBOHfDP7h9yrs+OoB?=
 =?us-ascii?Q?XzpSCAXHzHcMYaLYJkA7Ii/zqo6+/NqsCYf5c2es0dq/gUManBsMeC9wFgEG?=
 =?us-ascii?Q?D9gs7aOAKzsnAmyUpVXgcpLhFY94Zht89rguksz0DTJ/EoZI8ZeDPMm6I9D0?=
 =?us-ascii?Q?OtAQpCKwfqyDk6voowQFw0PqGzfJTs1NbvKPQygR9yp1C01/2bH277L7n1AS?=
 =?us-ascii?Q?H9GR8UPYUnTIsThL35xxv/tWUSVnCyR8M6MyoIg1qmsvoh3XYqEot4FPcfbD?=
 =?us-ascii?Q?e+r79jHgTTUAlqklIo7x02EQqwsn09vR3vxYXhhp8PxdO9EhBMLIiiWhWuLd?=
 =?us-ascii?Q?DID2Ed+ibUj64KQJ2VWpQCxKo/JSg3EulMFvo60jF0sXQhkN5DVXtCER+ZtD?=
 =?us-ascii?Q?DToPoP2jl83idIqMU6Cu229fcoFCR0+6VIj028FQ5ykhIJxzREzpgGOAZgeI?=
 =?us-ascii?Q?GaOHeMrjPGSzCt5e3y67mwRRhSm7uSF/Sv2b/qsQpYODCnKV3czmzR+Ea0Ld?=
 =?us-ascii?Q?Kj2Rzswz5xNu4pkOiKJMUc2kEx3Sbv7IEbd9Se1sr4TX61rmPXwBSoLPvK16?=
 =?us-ascii?Q?Os5T7HVNy213lydoRqObnDcWWiuBh1+6bAAV5YrgiKoKYCmPxmc3uvI75kUc?=
 =?us-ascii?Q?F1SV8duQY2LwKJKvKyiGY/VHjfj0xbcDFQUM4ZgufRlPlGB9vjRPv0ZcTmWt?=
 =?us-ascii?Q?XsFXJ6CXg6GRD7nFGjMoZ5XEvuRaxmxIYdijsSnfenXC+tDhPblfvim91/Lw?=
 =?us-ascii?Q?a0AvA2YEl2t7TgbuwskmhKCsJzRPP3c/fcnJWfvWo5X+pa2Tzs/yDZS59Nxl?=
 =?us-ascii?Q?zkZ2RWw7gYzkQPWc7f7MKg4jkoMrrmcA3gHzLjbBLGG6JaMo/CxMPF+hsdpw?=
 =?us-ascii?Q?yaJgNVCwNRImKO/vpqByT6SOwCSAPZyKnEDm3h+KoNrL6vXjbeODAA97/YFy?=
 =?us-ascii?Q?hPqJsa41wK7omY4nkHipqcP0i6KOpJDkicy7u3s2W1Lkl4QzEYL5TrteyeGY?=
 =?us-ascii?Q?nGCag3HNJv2KZ3kbZHu+d75iL7I/U4aA3xDW7avaAXhPvw4sYY3MIUERBMpS?=
 =?us-ascii?Q?81NpQtkN8G4Tu9frq1UCj1AqiALiMCCHjMsJJDlB5filJAFzLWRAz6pBXfbT?=
 =?us-ascii?Q?Sy+iU3G2bYMeuHeMgsfWbw6qzMBPDXbMtNqLx7Cisxxs2Gb+daZnAskZSiAJ?=
 =?us-ascii?Q?Ex2OoO9+wwkWX21yU8cJjAkkCgFMjpztviB0blxaPRupDI/WQ3h9rVHGBS2c?=
 =?us-ascii?Q?zgqO+5lQCwvyh8fSF3YYKGMcTr1i7ts=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 07737991-a4e7-4bcc-1bc5-08dea04d952b
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 09:00:20.9651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Agsq0n//DAEDo8pIdZcUtu58UXcuY7EB1glOgWy4YWn4TkKvBkXxuo8N5XArJ2rwdsbwd02TRF0ARbjIVXFEjk5eDX2m+fxdjC/1S1vHsYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2152
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235701

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

No fix is available yet for CVE-2025-66382 [1].

CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix available =
yet"

[1] https://www.cve.org/CVERecord?id=3DCVE-2025-66382

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-core/expat/expat_2.6.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/exp=
at/expat_2.6.4.bb
index 048093f010..81dbb6a687 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -67,3 +67,4 @@ do_install_ptest:class-target() {
 BBCLASSEXTEND +=3D "native nativesdk"
=20
 CVE_PRODUCT =3D "expat libexpat"
+CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix available=
 yet"
--=20
2.34.1


