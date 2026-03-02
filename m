Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96039D58E6C
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:55:22 +0000 (UTC)
Received: from mx-relay03-hz12-if1.hornetsecurity.com (mx-relay03-hz12-if1.hornetsecurity.com [94.100.139.203])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154761.1772434512490512851
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=JzcV1mIH;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.203, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate03-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.88, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=bdiMHHMIIXFvsPmCWYSPvkbDag/pb2NxlmTHruykxUY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1772434509;
 b=F5APTYRiDA4jJvkmdMaDq8Wl9a2CzOB+HuAL2jr4FDAF51Dh6qK0ZCtf0s5YbTDCsKnquzOq
 yuNdBC4StnKd4bLobDbh0Gswzaq5U46pJC6YGe07btjtlgHV10o7/I1OF/eS/Dj69HcDdCZ/J6B
 JSI8sP2HCQOIKyh6H/W9wiT6wxXtiUc4q3qmQ6oUcxiYKeOHtOw6a2rk3TUDnX4FTDJQ4vBAucC
 sW9Fqe0T4PGxvnB7SXC4K1L/bPQWK5qPYU2PgCoFWIga5fdSXfB1T2FVQJVG605uVxlFZdxxXzs
 1QhHTDODNN+OmgQJXP+xOqzPXIaJyaoNdnVi1zAFbJ5Yw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1772434509;
 b=s4m50n6si6kKhTbhTMPKlJu61BSnZkF9FvCVsI9+SWnHtu/Cp3anKRPRtkN8hmRqxCjbqDHQ
 xaxB15QRCxKduUgVsht1DHoPxqpuUpavjkdCY14QdjFJKiyPpuYCuZAg+3qki1nlnVZY+A1Ne06
 vNOaomWnra73TrSkyLgAt6FkGvcIt5UC1QT/t5QFRNHz7gnHwfFNGVbG7K3ms8o3CVECHBWvXx1
 DkDg8Ho5QfD8+3XWx5yzsl5kd1Oxy8hjM3ja4jH0XyyTqOkcQ9UhzxZa5emCajxK/cWhK8dOwIY
 fYkH22Y5Zka5S7+ebV7FoDJHAjJAuxzJ6gJKaSOddwG0A==
Received: from mail-norwayeastazon11023088.outbound.protection.outlook.com ([40.107.159.88]) by mx-relay03-hz12.hornetsecurity.com;
 Mon, 02 Mar 2026 07:55:09 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmGFyJFS5TiqLQKAEDSwjP2uq71bypKcbXdqqCvtSX4wqiKDsYjdDDMpFjmTi2i+5SB/LzMoP9QXhxTkqn5KUgwS2XLVs6yl6/Hm7uNRSehMLnH9FXtNSCG6RV7tlQTY+z2zwjFZC+8OrsvTiyTnE6cUSGvVflupE+Chm0lE05Jfjqv8YGM4pZbkeGdZg24gdyyHJAJfKNw20iJeOPkbygdx3ivgzD5hIn/qDSHvsYFfVINtLTwwPDaHCTNZBDy1erKXuUp6ODzuSEdyxJExF9gIGnqqfGmx++dyg0icmakgBCJSjiah1sYsYFkO558IgYWizabJxQegcqLTMIC3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdiMHHMIIXFvsPmCWYSPvkbDag/pb2NxlmTHruykxUY=;
 b=nr7wHKrODgKYw6Yiy7cwVAFOZja5bixeiiUJQgRJuYGoS5tTmm1aBs/7EJJbvOjTY7J/mcEDHH0YkhxT1T8Qr6eSVlAe8Ul9W2CK409E4yJwRwtPBnipttAB1Qs5kygx+RmKl4zWKmZqf/pIOxr2m7ZSyrrXC1mFCUOwe7mJFV5aJLw3O6tlykTxnP3UTq5syupTV1AuIxH+QrWiR/VJDi4iTOGnOCbXrszRElzo+c4maq0hwpXUXd9o3s6Sap7Q7tsx5wXnsPsBLhMMG3MUAh+O2smrYAWZ7kGNAXa/TWMziYD8e4+4eNpJaWLK4o/Nt82oVn1rRJTjT9n18Dtf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdiMHHMIIXFvsPmCWYSPvkbDag/pb2NxlmTHruykxUY=;
 b=JzcV1mIHJbNVCj5TFs75iWqaoP02VleqBTOLuOpaqKzYpDlGEsoun9ZO1dxCFJ5dsi+Z94xUHs7nYrSgAKrmkACwWC7Y8r857DhuAmHnapMFHvjpQIWeiJgzoRxdJJJjk1FnIvNjbJj5LYVB/3zrGL4Nkea/MF8n/V5Le7G0Uif6e1wm+FtCyTyVj5XBOYOugTyGQduLIlyUqMu6MqTyUAnRQ1hUlOYNM0bnIrI1QjyQ5nkpLV1Mx5J5KaYcgUNEAWGusr/bXZLvb8ZdYqweB6c8nMOTqMzkWYdaqhuYDqS4lpWPs24wFfJ5PxmJ4zb66ZZF+VD0JILLRgm5EqNtFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 GVXP192MB2404.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:1f9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.18; Mon, 2 Mar 2026 06:55:00 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 06:55:00 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH v2] zlib: Fix CVE-2026-27171
Date: Mon,  2 Mar 2026 07:54:46 +0100
Message-ID: <20260302065446.26826-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::25) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|GVXP192MB2404:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f7582a-b13e-4c94-cb39-08de78289f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	gTkYcM/3OeGbQsYnLxnu5zPL1E8X/MqHqHNhuOot1EOWkASBfHzW3mNIOH1jKJLg5koYwdtCvmT7C53VDqhSr77aJoTEvdCY9gy6aAOtX9nytROcadN6MrGL4MN54SHucXoIG+2TfMXtIn5O0Z0o8nflqA8jtnTzfMWd+0YjLhu0hJHTci/8aPBeEfXMIazGlRxU/jOqfeAF7bncJtUokZ2HgVYMvo/XVkuBxntrJnt1JS1OaotvGbGEjmFdyvU2qvpaBeBXl3/bX05Y/zuMTJOeeEgd6YWp9P89Lq41ZcjutaGB1KyZWMAn3kN+L2xgJK1+bKe0RID5uPEZIFTtYqzoNrDaLhrEaSIoerBpLJm1+4WGCth0Wpb+XS2GUecAIhIISPiIEjTIGefZAHTK4MWzBiMu8u27H+jDo2pPdedCNylC8sLpM3g8cx7XH6RlvHm2zJyB0wJyC0l2hVx0ALv8QLwn6lxUjik03a3F0r3Zl/uXzZxaG70At+b62H9jqfseOJuthXFz2A8zIQi5seng0MS2EPvnviYWw/LkTesrHuatTIfipOkMOujBXpepeJt05EvrDDigy+1hZHzkXczxNIgUiFcHjAIf1SSgnYdyfnWyPSVXxPiec4V6Tg0KybXcq2H1Oh2LsxMDnNnpysmGQNTDxTG6UMVXANFufZV3EQWZIzuHFWvLRLxekIpP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I4nf2YnCLw0OOa3kZ7WpyoVQNkjecEPC3ZdxlNHKrD7yxEEVKaj4y+E2m44a?=
 =?us-ascii?Q?jyYFmkD13Oug5+6pa9+i/pg11955SmOM3Rtkzv0lW9UwaiW+Pt1gPgVXMl8e?=
 =?us-ascii?Q?1SbEP+69Did9RB2kM4vXOcsS5EPHgFIZfFlqa0wMEYVOu4IAXqj10N+qKaXV?=
 =?us-ascii?Q?LVZbG8msASMESXn+STafKTyIy83iy+lJCRYEkTDde+AyjjHB4iOiwJl1Gpnd?=
 =?us-ascii?Q?26TelqRKfocu+GMc4/l18y/fB5yZ1yQ60IPlIuR1CIL4SHYmP1rlB8V31Txi?=
 =?us-ascii?Q?re4OSpIiYEg1QvINFc7+nQGSXNr/Ss2MzHc3/1VcGX5wZtT68SyckaLOpdRX?=
 =?us-ascii?Q?Jg9ZEL6AsdDDFoZqWfqsnUY2Fst94jgYSHDTqvEvaSS29i3CRqHHVMSeI1QR?=
 =?us-ascii?Q?jKYRYR8Y5CyFacOSUsr112wZ2vO6Tvt5HRyfdJaU4lCmZl8me/WlHhdEKp/1?=
 =?us-ascii?Q?Fkhm5YBrn+SKR8u58g1/qfheHQpG1v3phpIlamOW4LN6v6F4uUDzEmFDTIdB?=
 =?us-ascii?Q?FMgfeNS6N/wuyzPgCN66DO3VU4Og301zNvJMD88DZQamRLpp0vuOZdXK1f5X?=
 =?us-ascii?Q?6kWi1ZjiiHjtEVp2VujakrW5lM2TbzmhWM2VU7wQ6+Gy3soEgZJ2nVe++u2F?=
 =?us-ascii?Q?S08kwdGqeHFenkDIG8DHFnU2p18mVUWpUgpls5ZKR1/i2ttjSodVpHw/T8TF?=
 =?us-ascii?Q?46lTeu2cJOi6YPTQ3d1HZIAEs0njHNa4SeFFX1GU+lkLHkw7detGWxnImv0K?=
 =?us-ascii?Q?3tR0TCmQTkqamuUNHxLG7ZA2Kzg/jMM/aZoB+5nl30sUJFWssOL9vf5jazu5?=
 =?us-ascii?Q?6rqpr9z/45MaKGJLZtDB0VIz0w83G7ocyZfm21LKcb+U02pBlXvB3NJXqa/P?=
 =?us-ascii?Q?0BjhcIPgz5cyY28LPm4+utGH3GAqK4Q6aUPDyqUOuwKnsN1SmbjH02Nivq/5?=
 =?us-ascii?Q?qZEs3u1MghSkaUQr2rLJANXiZ2TDj5f38pjH0572gKwdP/gowpDXHEznB0NI?=
 =?us-ascii?Q?WNeB7+KZZOczYChhTxV0n8yhTcbm4jjP6CNc4v6runffQ5aexgOh+o35/F8c?=
 =?us-ascii?Q?qEBH032Ts5L48Auy5hcdJoKIpzazI3aDbuYx06sSjZEhrK6o5f+X20JmClx0?=
 =?us-ascii?Q?PFN8qFW1r4fknIzIe/eUI+lUjXUfgDt21ir0HcmaZq7d61z1LJLacuHU/90T?=
 =?us-ascii?Q?Q8EaNlbbd9GYnIXqujza+FYGZTFZQ1OiKyiM+PS2IfjUWNlLrmQSwTNCj6Bi?=
 =?us-ascii?Q?Ey6QwhkQgI7/PxzleWqIQX5EFGfVqQF4gVVwvoxMTBZvOH/pKawVjMQ1lfBF?=
 =?us-ascii?Q?i0jDOXKcmByfqgacputQeZHHs6dPdypeKX9DYNq6iqkDuRk8kmddegfcPyM6?=
 =?us-ascii?Q?tuYXn1vcPYusApIrHhYG640K0zcWWaFjJxTe16HqqO2L2joTCGMTlK2YXlya?=
 =?us-ascii?Q?CT/iOetYqEJYQDLGNEqKOpa5x5njPqItJuH0JaOW2YV3TauCSOZ12bBZO4yG?=
 =?us-ascii?Q?mruNucXZKeDqkecG0xEk5Dun8wAAiIUAJ7OsraO71fU/ITE9TIJZzVmlxmCB?=
 =?us-ascii?Q?b0wAR9PIgquzH+W/bBdEyKuFhmgrhMdxM/LmsTxzNyEASsCveW93oc5Rd+u5?=
 =?us-ascii?Q?ZlKgP51ntwEfjtbDem6x+WOqzvO119lod1GE0+8U5R6ekJ7Ro1l6ska6w9kg?=
 =?us-ascii?Q?WLVfJRrNwQsUIwUUFb+rnuEq+dCW1qLWTxbv4TWC64e4tAAmWCb0jHcZxdsQ?=
 =?us-ascii?Q?BHr4fu96xJfzWES1hbEZVP/IxK9ocjuwmUkk4fCY4NmiYQyPgU1AwcQGrfC8?=
X-MS-Exchange-AntiSpam-MessageData-1: +Fa0mCIEwGHltw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tMfd4dyPO3rhFDCbR5XBOAKR8gTn0nezApbfLSpqEjVuqVn7IzGrXE/HlbgIlaYWJOwSPV4FPN5bJfeBFI1KR0eWAlO0CMe6WcZcQkdJS3yaIOCNPSR30g7zTroAGfrFfaXIGA05hMn5ujDhyJOTCG8cZNetNIGyFFUc1o9ppbWWZJmqMQ2NlITPQB71KGplDiaF7y/9H1QhjlsKZrRJc4FQ9XIv1ryay0aqYWvNZAHYlxtr5aUM8X5Bt0457/VFVY3Aq9pB3ufVbfb1IzgXfL5vz3YhycTjalqhIz3eSMRXqUP43JF3JUoQOwPoVq6081KDIFsQ8+uOsj5XjXh9MoDt6bwJKnqY0bdL/lPfVI8e43ntY5Bk3+FFojOPNpWnfrM5/UPFU+U+yh0d+IvcsP6WnV1KFtfLvQboTg/rUyZ4Ht6eE7IJU1j9fIH9Vy9FpEBHD3WkvisV2deMyTMMYyQSNO/UjRO+aA8iXIo+/1LASxshEWPsrWDhrx+xGobSRhz19RtNb3f6rnXHx5wl7zo1eVxUdi6bzgadRLqt1gpLM96pikwzBTwtl3kWzpmpdoDpKa3Sj6Td0N1vWZ3oWtTMW5S0PMed0+cxucN0Z94/jec1VK9Y4GcDR9X5I+Ab
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f7582a-b13e-4c94-cb39-08de78289f5b
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:55:00.2090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krHLjqvyvp6c3VhU8TAcYXm5+a4Ly/ZrSBsbIi5mVTNifXOYEXKOMr043cdVbA+uUUtpEmjkhkgACyUH4n5sog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB2404
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz12.hornetsecurity.com with 4fPV6x0cZVz20l2J
X-cloud-security-connect: mail-norwayeastazon11023088.outbound.protection.outlook.com[40.107.159.88], TLS=1, IP=40.107.159.88
X-cloud-security-Digest: 07279d2305772b84a1745b98596a9d21
X-cloud-security: scantime:1.334
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232179

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/madler/zlib/issues/904
[2] https://security-tracker.debian.org/tracker/CVE-2026-27171

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../zlib/zlib/CVE-2026-27171.patch            | 63 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
new file mode 100644
index 0000000000..e6a8a3eac5
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
@@ -0,0 +1,63 @@
+From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Sun, 21 Dec 2025 18:17:56 -0800
+Subject: [PATCH] Check for negative lengths in crc32_combine functions.
+
+Though zlib.h says that len2 must be non-negative, this avoids the
+possibility of an accidental infinite loop.
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77]
+CVE: CVE-2026-27171
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ crc32.c | 4 ++++
+ zlib.h  | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/crc32.c b/crc32.c
+index 6c38f5c..33d8c79 100644
+--- a/crc32.c
++++ b/crc32.c
+@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, const unsigned char FAR *buf,
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2) {
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+diff --git a/zlib.h b/zlib.h
+index 8d4b932..8c7f8ac 100644
+--- a/zlib.h
++++ b/zlib.h
+@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2);
+    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
+    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC-32
+    check value of seq1 and seq2 concatenated, requiring only crc1, crc2, and
+-   len2. len2 must be non-negative.
++   len2. len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ /*
+ ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
+ 
+      Return the operator corresponding to length len2, to be used with
+-   crc32_combine_op(). len2 must be non-negative.
++   crc32_combine_op(). len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index 4992f83463..e42578fd7e 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
+           file://CVE-2026-27171.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.43.0


