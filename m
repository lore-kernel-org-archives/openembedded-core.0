Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4758C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 10:53:31 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.40])
 by mx.groups.io with SMTP id smtpd.web10.15678.1713869605446752534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 03:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FkLnUHY4;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FkLnUHY4;
 spf=pass (domain: arm.com, ip: 40.107.105.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BngWh+LLLb+ZfU9su86RT/1f1fuvHBKTN0e7FrVeVhA4T79ftbKyfSv9fJC0P/CkPAEAxCYy4OZWe/N1mmC50sRap3pUJUNxiHufGsi9rvQMHyswaPIFoIVpaKA+J+Y7hpElvSHyrYilyrT4XwxM2Y6mFTaYvXLiosiYSvZCHOLiShEdRN94ia+HxJHy43GMfqAqYbmSXhGFJmandjZVzUAWDM+2hW7x8mhMiqKMjCdE//n+NrLI/zeN+xMBsJyK3n7cj9ld+d+7jfCq3s4d3jhM/awZWJDSyUT8Zpdqt9ZZx17YOZ0DQjT6MiPLyaevBIwtQ7rhp9B8ZTMUGkjiDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFVyNb/Du+R1rqj9WVQNSROQzvoZN1BIcG9chq8JXiQ=;
 b=cZyyU82yjOZhN6ZY5KwcagkKJ3RWlkAkzqxXz4ZfklGnJiixuECU2XrmSI8G10tlJAwuibl2JG0J4IsB/Wf5+WsdMm8QlpWTxV2m25KDgas3C2xrf3/q/6V0mDulCPOa0xDRdGpKBH/y8iQPReYlzdODabfzxmP4dq5srygvRTJUJpMFdNKNxKhvoLEBPYtSHvWTW3K0Crrj0oEaebgx2uYe+t0wSDpOjbKFFGQrzDgVw62zIz7b4+XfEVly16eNJEAxNrsr7iCjIZyRtdcwBTUkB5ulXRL0Pfo3H/CbsZaw96eS6DtQjxlkjtNJQcCpmB/ATedExdmFaeBNniS2eg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFVyNb/Du+R1rqj9WVQNSROQzvoZN1BIcG9chq8JXiQ=;
 b=FkLnUHY4xns8E14Pxc86fvoWerFZxlyHAFhDf9u2yX39LMeXOndyKNG80GwszEUkOzBUmUjjaPJ9jHkEWAIX/RArtCxxEQe2ZeONZFWR3OFNdGV6CQuDhSNQBYnu0Z0MKhFuPM1QgOgYMM6czcH9HJb/6kpJ+7eJ9xDbGplxuEw=
Received: from AS4P192CA0006.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::7)
 by AS8PR08MB6678.eurprd08.prod.outlook.com (2603:10a6:20b:398::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 10:53:20 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::e5) by AS4P192CA0006.outlook.office365.com
 (2603:10a6:20b:5da::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Tue, 23 Apr 2024 10:53:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Tue, 23 Apr 2024 10:53:19 +0000
Received: ("Tessian outbound e14047529286:v313"); Tue, 23 Apr 2024 10:53:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9e9adde820ec0d52
X-CR-MTA-TID: 64aa7808
Received: from 01b28634d335.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 969C43C7-369A-420B-A3B4-28C45E9810CD.1;
	Tue, 23 Apr 2024 10:53:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01b28634d335.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Apr 2024 10:53:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBPQsvIGEbrS94BbcWKTaLtG6cg0begMDPkawbdmvzZHo/1kftrKRkliBPOY0Z2jXe+9JX8wPmULkw/8jNBO9Hjgn9B6UBXJoYLh6Uwkyazogk9rbZXo5x6PTPwlKRH8thKcchIqmBe8WCTWsUzZbWoX9FJEywik8O/d4UbtufcutObZsUuWKcJy1zLKSxqO/luqHjEi389QewD3NMRj5pWBHeny6+B8TwzJAsPOv6dHOuu5hiucOHmCbbURyW9gUb+4WVh8yyoO8eBG6bdbY2rnEa4dUCNHT/tg9j+keWtg6HVSQ0+M+uZvSawMCGOd1/v1Mp/8WO1aHIAl639ffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFVyNb/Du+R1rqj9WVQNSROQzvoZN1BIcG9chq8JXiQ=;
 b=GtOjJ76WacoerlgNYmQoH7Bai5+5B5Rrr7j2R4wR+Dg94WDxetK8g96jFVS121D9i5SNXcGrwyYH7Kh8n40XWJRmZlX46NDfTZWhnsK8j3RDwm46plEckbug1jTbySAFht01O/ncKl42KaaX5pAw+Zu6ZyPdMHfkAxHoIaPH0M7lM82LB5mDpCwmfRJOlZbl21lJtkvfe2ReeyZyYs6tMfe/IeWHb15gVcpBC+80SWeWEDvxTGbvbZAAqn9FVfSsUTKzerQgkoF/fhZFuMrONIHgwUd0oDG13KYWSIImebGAQCCOkJL2XaKZLhuvEv4nFH4dQ58dVZrcSQAa6x2DXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFVyNb/Du+R1rqj9WVQNSROQzvoZN1BIcG9chq8JXiQ=;
 b=FkLnUHY4xns8E14Pxc86fvoWerFZxlyHAFhDf9u2yX39LMeXOndyKNG80GwszEUkOzBUmUjjaPJ9jHkEWAIX/RArtCxxEQe2ZeONZFWR3OFNdGV6CQuDhSNQBYnu0Z0MKhFuPM1QgOgYMM6czcH9HJb/6kpJ+7eJ9xDbGplxuEw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8319.eurprd08.prod.outlook.com (2603:10a6:150:b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 10:53:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 10:53:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "danismostlikely@gmail.com" <danismostlikely@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Daniel McGregor
	<daniel.mcgregor@vecima.com>
Subject: Re: [OE-core] [PATCH v2] shadow: install manpages
Thread-Topic: [OE-core] [PATCH v2] shadow: install manpages
Thread-Index: AQHajGDE8vyfCeaJv0+ykCtK/RHev7F1wA2A
Date: Tue, 23 Apr 2024 10:53:09 +0000
Message-ID: <554C234A-4BCE-4A10-9A11-75493362EFDB@arm.com>
References: <20240411223613.2051618-1-daniel.mcgregor@vecima.com>
In-Reply-To: <20240411223613.2051618-1-daniel.mcgregor@vecima.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8319:EE_|AM2PEPF0001C70C:EE_|AS8PR08MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe9af03-53ca-4472-eccd-08dc6383969d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?YAyJOkcncnBE8pd2DQtLpaPyJgu7UlyhjB676potDsqk5PhtE4/uuk8Vasvj?=
 =?us-ascii?Q?yznOx11km2+swsgW8+BuuehxrmWC2IObsdSeBci9+/lSeGtIBSsHOmzFTbgu?=
 =?us-ascii?Q?KgDPkr1ZWWgzOOOQCD1U9XE6iCUUxnN8d78WI1AfeETNcYxw4fjeGbx/ugOG?=
 =?us-ascii?Q?l5zYVXBobKW/k2pOoprYr+af/RMpaF81a027TNzr8Ti7MIdowHQdch9KNDgV?=
 =?us-ascii?Q?pmfxkhvwKvU13zHvcDNOjo530ts8MMxSMPkx866KF6YJFiH9E0MA8QqFoCiA?=
 =?us-ascii?Q?KiaGGLDGiDpXl6xUmgBvfIjF6YW0iedqKBNlsoCtRngsp/IdiDXATLswwELU?=
 =?us-ascii?Q?GRKI+AaxdVMcuNGs8rI497eYOHIjw5s4oHPFX7tNaYflyeDsy7e9a4rTv2RC?=
 =?us-ascii?Q?Z/RpDzmtpLzRM2xdMJoKuicK2ZgnfLt1369oBf4Wek9K/C+7PNmB/EOWaRAr?=
 =?us-ascii?Q?HLL2FcBIzcjZWhl4aulAVoX6+cxPuOUZe6+VIUlye2NwzyNjw8q6JiQr8NHU?=
 =?us-ascii?Q?CR4TfPY/ppZjGHcGZ9s6SLSt2b0XFpQQqDFBcUAUlUuYsmZicBYxz1Dt2OUG?=
 =?us-ascii?Q?zSYW+LA9tj+LR6y1MTeXHld0Fr/ddP3GAZDTGRP2rfgZyRo9CJ1+Nw8Q7eAo?=
 =?us-ascii?Q?TVpCY7NbmW4VGBb9h5qh6so3Im52annMRtY4r65CfHmOS9Ct2Y/2jQ7XKsRD?=
 =?us-ascii?Q?B+r6aigGExEirvpxIP7jxC8Di+842jQ/CKXltqCUl4qVdogvtpQm87kbynfe?=
 =?us-ascii?Q?E8XnM/8CUVdu1Nz0wfuRX74CPgING7j+lfKxNTtcfW5QE7gNMi3Ma/T8uq1P?=
 =?us-ascii?Q?w+KMFZVsBhp+nHHHoDGibM0zLE+WYNcwT9bJosepwExDNLRxDc0mCSWxRWy5?=
 =?us-ascii?Q?tI4nOcYQhBOfEqs8Hil6ma8cEP5/JtctsKeo17fhS3e7cUpmu/rYxzWj3MTo?=
 =?us-ascii?Q?AiXmBAk2sT89lwHkQLFRnBfFyVCR7VmqrUz95HNiiHJQCHF35PkV5ODkgsOv?=
 =?us-ascii?Q?O1cPmLoofPAkj00uNJOLEsb54JJNUSsaIgeksf4GtqzAVc6OffEwjL7nMOUJ?=
 =?us-ascii?Q?macGpsm/Sa1E44Knr133YPk/kj4UjMQGXvGOaLg+jVREUgMHRzgomBLVxG+l?=
 =?us-ascii?Q?8iO1m/z5UiRK4eSd/kwsMFheoe1MFc6Pffvf8peNQns0mgOdQXwgijo0Oe9U?=
 =?us-ascii?Q?uBbFDAB79MDLLD1UhydG8s6li3CkIWOQUp6+/r2joL7PX9WaqAb7c/ck5WFb?=
 =?us-ascii?Q?Mv/wVBSxuOJoSatbxN8Nwe2HajaqZ3D0Ghdf4phGCHqnMjQEPwo8TuJVBump?=
 =?us-ascii?Q?D0VRywGVQht5uy64GIBUU+HPVAwrFBP2dh0CtPKENBfhgw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <873C5AD921C87F469F79174B8A11398B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8319
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	55b49056-f29d-497c-64f2-08dc638390b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fVdV/UwRO8fKFdjA/xnHJXvurhvJ3AeoC6l8+mqTsus6vXJLN8lplWB2SEH5?=
 =?us-ascii?Q?R6PuvkkZ3bhYQiOCpvLsB0WvZTGcTYOuR3WBLc04ZKeyKu7aFyGDfARzcHhM?=
 =?us-ascii?Q?lVB3KzAkK8OhM3n3M5w+sMsjwyiIgf38nDXJo6r95b66FE9YZUKTyjjNol6y?=
 =?us-ascii?Q?Uw4Nd/vuoNgqD8kSS7rWpk3mthUCacUNpNLg1P4IVFsErBvvXtu2fsp/UIca?=
 =?us-ascii?Q?HgHtOJywhz/2VHajwqmYDNq3GbpB+/u/0YCIv3ASvBA/oTSlfa3uKxr86r9d?=
 =?us-ascii?Q?dW2b37fo/Ruj9pMG3KOdxGO9sHYqiHYfvCiHRQukfyd2IkSQtoDlVCbjgxDU?=
 =?us-ascii?Q?hQelrofd111k9mM5U8ZO9W4RxSiiyMMD4Z88nHHYnF2/oWPvvOvTyHyGYv/l?=
 =?us-ascii?Q?pgdEmtU9tMolp2iCHBzc0mqriHveSl00L6/fsfkCdXOE0XZf1YGdSFs1lZY9?=
 =?us-ascii?Q?atZB2KOiup0kzgo7cUai07Yzf4kKz/SRxBtCsydoBeuVctVGxUQkRceWLFB6?=
 =?us-ascii?Q?UosPLdjMw1SgxLaW7W/UUGJjS0jLkLXYNG4O9h0txHzwJ9RitFVNjwr6wg3+?=
 =?us-ascii?Q?52nlNSshVs4SY6CX402fHQFYL/LheiZuA2QBxg1niiSqMG2/mPhvEmowXbZp?=
 =?us-ascii?Q?2XOPH0r4GRWzwMFLYFAyvSJQZwxS0NkbH2Y/8WinlDzN91+XP4/E+J5aeQxQ?=
 =?us-ascii?Q?QujRK/LHgg2QUAfP1qqP5Wou2Ksbg5owcdrr1uVW61uRBcamlRGHGvWJ9POe?=
 =?us-ascii?Q?7YLal3FBAGM69VgQs4c9Fzc+ZFAacb2biaAPkLs18T1Au9SpFOWrJB67JVY8?=
 =?us-ascii?Q?0pcqCjdy6q0ej+lHP+eNFCoVn6Lu3YMLM5F8IkIp5tJ0mDAuQT5NclIghfb/?=
 =?us-ascii?Q?8rNnIh3YgDBvfRmEVrwuWPkXqJajDAoCqObQCTvwltcHv8ZtOqo/5xboCVOp?=
 =?us-ascii?Q?rdYMMF/Ujj5F1+u4ukMi9ZYzpUWJwSc9/YQayFEpSv4s/W+wF55ZZzbdL9MM?=
 =?us-ascii?Q?R0XLSu24drOLwtTSqYw/BbFMgc2KSbgYQiF7Dx6hku+DNiiV9ybUiKbn2ruF?=
 =?us-ascii?Q?Gqr1bIduw5FpCQoqA1EnXoE0s6WYtYzyAW5Z/XDldpAhRIGnHGGanSvEXloj?=
 =?us-ascii?Q?8LlTKglDYzC7ycWzF26ZcivnqMuETFWU8PACBzZvaQUe0qKJK92kpLgsTMog?=
 =?us-ascii?Q?cfY9mMLJs3xXNcItxVAPMofX8FLIUoojZuVKoZ6hHKJi8XO0J5m/uPfk+rzA?=
 =?us-ascii?Q?SvuQXAEvsA/9kSXERBLj3ww5YVz16+MUtxzmm+ZZ4AmB1McEtwUMBrsJE9G/?=
 =?us-ascii?Q?LYP4p8rB96i6l51oWaufvJl+16PKzTiOngQUGCwpxfcldpdGymaxluP8CaTy?=
 =?us-ascii?Q?RRb0p/8atpCD0B7vPeB78Fi8aAUU?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 10:53:19.8096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe9af03-53ca-4472-eccd-08dc6383969d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6678
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 10:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198612

On 11 Apr 2024, at 23:36, Dan McGregor via lists.openembedded.org <danismos=
tlikely=3Dgmail.com@lists.openembedded.org> wrote:
> +do_install:append:class-nativesdk() {
> + oe_runmake -C ${B}/man DESTDIR=3D"${D}" sbindir=3D"${base_sbindir}" usb=
indir=3D"${sbindir}" install-man
> +}
> +
> +do_install:append:class-target() {
> + oe_runmake -C ${B}/man DESTDIR=3D"${D}" sbindir=3D"${base_sbindir}" usb=
indir=3D"${sbindir}" install-man
> +}

As ${mandir} is explicitly removed from the sysroot for native builds, you =
could probably just do this in do_install and let the system throw away the=
 man pages in the native case.

Ross


