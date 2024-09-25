Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1651CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 20:03:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web10.25983.1727294581294136183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 13:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Oh3+1S4q;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Oh3+1S4q;
 spf=pass (domain: arm.com, ip: 40.107.22.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TI4fl5i6xU2uD9tJPNmDQYHnOblaFB61IVyDCKboaNkZgmi10t+W9L7Ddr1uQoC37doO7jfLtaVURD91704IvVqAYOgEVXB6OaiPb91F3hM964rXfm6ZOUqm6dbKoJDdyQMWyH94B1FyTSJqHPSZVM4Qe2EhpD7J7PzSSJPCjjQEINiizncMiJpz51CjX+hHw/UryeRnUqqexFthqHpP0ZgARuWRpIdDCLQCV+grDXcGRcRcPbJIXgyQqi+hubh+X1rJBMLcfn8YhV0GWAykAPjsI58ihZCqOuIDUdH+M0KzvbVs0mhdU8lmRHv54bhfQyhw+OQ6NPSnE/dQ1aCS6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMDhEOWcq769tSxpxPmxMBJfC+xCMa4+ri4Ro4n4u5E=;
 b=k7hbVymA6tJjoNhOgCMui6zWRpD1d9S16SnghqIWs5nZciVgMtGwA96mXq3O9Tg19Ao/mwYo+cSDIT1Hium+S4aZ5DnDrlTXvGXjJwNb+mEXF2rg20KIDtK1RQAiD0ihyzHH/mLXXZWRqGbr0kLTO7ceE7ie6OiXCPBK6Nu6LipB6EsSivlA9Uohup9OLp3k6dyXOJrBkX2IdyPtKEQNWbG2TeaeJU1jrRfL6a3JRRJAXO3Rm1uT6ZJ2uN89mILPw8LyrqdaXTwDe6LiQKXyUXxqPiD7JM4MV1+KWGeBDc5XtqcDszAnJwJ73rimtXB+x8ayl4QPKTD3gihJN1suMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMDhEOWcq769tSxpxPmxMBJfC+xCMa4+ri4Ro4n4u5E=;
 b=Oh3+1S4q1jEnQfVkTMjaZXCu2LMSu1wVctEenE7ws5l6BbqZ5Vif00uq4VOEx20q+kbhQFEdLNBKIHJmBdZxnsOcyZ5pt8U1cOo5aaJ0upOdGscXvO9+wPYCR+F21+lw7iV+/unhZ0UVAsIwKzeGfw9RoMieblUp8AfhBTnzCoY=
Received: from DUZPR01CA0327.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::17) by DB4PR08MB10343.eurprd08.prod.outlook.com
 (2603:10a6:10:3fd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Wed, 25 Sep
 2024 20:02:52 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::f0) by DUZPR01CA0327.outlook.office365.com
 (2603:10a6:10:4ba::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Wed, 25 Sep 2024 20:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Wed, 25 Sep 2024 20:02:52 +0000
Received: ("Tessian outbound 2e8248bf46c3:v465"); Wed, 25 Sep 2024 20:02:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: db43af2dab919f13
X-TessianGatewayMetadata: QDF0dt0BOE4ZINjUk7bFq5HvCfCpVcJ3klvDOe/c3kMct/vPwOX6ixKsuEfWH2pCbtNMUkx5b9sE0HbVxeQZnX2Bfo7tJPDbXGfdlB3cDihjB2QNpb9De3m7Dqy7SmFMhi/e3WJo51u65TtDW/WHRy8PpA7vAOP1ZqGqfI0bZZY=
X-CR-MTA-TID: 64aa7808
Received: from Ld186e1753306.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3FA1C288-58FD-4CCC-A3B0-25F311CA824B.1;
	Wed, 25 Sep 2024 20:02:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld186e1753306.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 Sep 2024 20:02:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhAfIpXCKgzHacrHvtwmvEuhiB+m5Mi065/KttDstEJzu44GEA9Hg+QztkNbbO2sT4dz2yl7wL3UlX0WmBYYD66fxuoBQpWAQBEbigamXgnFtAOFKWExXs650jfLF+fHhbu3P2nJojtXLUXaWdW683r1dvnBilp6WSUayKEHh5uvQLSTGepJO9mqA0Niz9AZAdhrws3eomWv8gp5xsvpPsu0srrFo8G4D+PfV/A+O8esk5ebTthMFsIwbTNOaFOJOeV5O8BdyE1qZfz5JDroPIFRU994JTFLeVQk3nPag5AIMr1wmI2+/pJaz2SNZKsgmtL8JpV9upY3TuWmW9j6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMDhEOWcq769tSxpxPmxMBJfC+xCMa4+ri4Ro4n4u5E=;
 b=Vn82jkT/ljCkPShsIxfJQecTpiBjdcBKQkPwFcsnmG1Dsk4b/K837qct/K0LoSrbi+dtDpAbPECEzA7krcEGSMvDZfQMU78JXDezLGkwziWPaTsB/HBQoKf/v5oIRhriY3xPCZEOJVb/YYuugUyR/r4i1DmYtE38QmgaDwL7nLwGB8rzBzDCDYqMUJur8c8gqsQE9D4/q2MFM6Pa4jF3cCf9jJdG5uPJyWV3eBurzl6zYHO2tcvHl2yK0aPKJXZSYs4ircVu5wuAlPjljqOCRYmzkBoKUsg32+C1XMmVTZWA4SQo/sP6Fp/InARCIBeKvFCj+I8J/LKiYzglkiwf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMDhEOWcq769tSxpxPmxMBJfC+xCMa4+ri4Ro4n4u5E=;
 b=Oh3+1S4q1jEnQfVkTMjaZXCu2LMSu1wVctEenE7ws5l6BbqZ5Vif00uq4VOEx20q+kbhQFEdLNBKIHJmBdZxnsOcyZ5pt8U1cOo5aaJ0upOdGscXvO9+wPYCR+F21+lw7iV+/unhZ0UVAsIwKzeGfw9RoMieblUp8AfhBTnzCoY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9467.eurprd08.prod.outlook.com (2603:10a6:10:45b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Wed, 25 Sep
 2024 20:02:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Wed, 25 Sep 2024
 20:02:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 32/47] python3-pygobject: upgrade 3.48.2 ->
 3.50.0
Thread-Topic: [OE-core] [PATCH 32/47] python3-pygobject: upgrade 3.48.2 ->
 3.50.0
Thread-Index: AQHbDxfI9gEAfFbIn06VOzgXQPwbrbJo7YIA
Date: Wed, 25 Sep 2024 20:02:39 +0000
Message-ID: <2D88F9C3-D308-4352-A794-2F0BBE0E2ED6@arm.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
 <1727246960-20665-32-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1727246960-20665-32-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9467:EE_|DU6PEPF0000B622:EE_|DB4PR08MB10343:EE_
X-MS-Office365-Filtering-Correlation-Id: a21ec887-b80d-42b7-c00b-08dcdd9d09bc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?T1BsSEVjQk5EajE0QmZaSjIxMnBXaVZLZzlZQUdjS0hkRU85OXE4NG5sc1pu?=
 =?utf-8?B?NSs5Y0pYM2ZMUzJ2SXJrd3dCRG9JUkNxbkNoZGpKZUJiRDY2a3BUWm1sZURi?=
 =?utf-8?B?TVNJc3FpTTdBdUVabW5VM0NKMzZQeGFZeVJ2cXhyQS81bjVtMENtUzlUMitD?=
 =?utf-8?B?UXVXWFA2SFRDRnVBVWZyNUl2Y28xcjJWcEgwRng2TURaMURLUnZwVkZNN29o?=
 =?utf-8?B?NGI1TXVSMy9xQnp5Q2Z4Snh0NTZLVkJKZUZ5bTdxUHN0eVk3NElWdFlaMnQ0?=
 =?utf-8?B?cGxGend6NnhkaSsrM0k0eUZHdGZoWGpUaVMzWVpMRTUySHgvbWFXbWVPNGMv?=
 =?utf-8?B?aE5IeGJIbnUydjZCY0d4NzIwZVgxQUpaWGJ0aEdCODhlSXo3TitLbXE4NTNU?=
 =?utf-8?B?MDE2VFI1QnBBWmtsK3VVUmZsMlIwVkdGdkxTcW9yVFpPUmdRRTdjdjFIZitn?=
 =?utf-8?B?bFFmVjVNNDZkejhHNUJ4WThoRDduVktaN1RxYndRYXJSditWMDEzeStvOVlC?=
 =?utf-8?B?TkQzSjdkVDFEYkdoWGJFK2U1Y0dYWEF4SEU5VzdyeWltVkcvcmhGVkJTOHdO?=
 =?utf-8?B?cHFCNVZTWGl0VUtJaFQ0NzVGQm5DOEduTmcydkJlYUVhemxoc1RnYlFlcEty?=
 =?utf-8?B?V1JaN1JzMjZlNkZUak5qSlVpTEltSjNZNEhGczlQMWpaSGVCaUJYdWhpRGVy?=
 =?utf-8?B?Wm5uc1plRXhSTVBOc1IzL2JEZDNtRTM1L01zNUVkVHZrUnNGamF1US9oZlNs?=
 =?utf-8?B?OFFkZXNWMERyNEdvM3RtZHVNNVZCTFo1dlhYTTJjNUJnZ1Q4aHZOL1dvZ0xv?=
 =?utf-8?B?RDgvUnN5UUpWa3d6WFVyRGFvY2JXMUtIRVh3R3FRRGVpRU9GUWFVQk1iT0VP?=
 =?utf-8?B?QmcrUjhiZzdqNW1FRHI5M2xzVkQ5NXVVZi9uTGZuTHNNcjN5RS9mMEpUT2pW?=
 =?utf-8?B?R20vb1RlRmhiMG9VOVdJak9ZOEZpTjFzZ0pNayt1cFhWRUVFcUxKREtQMzZL?=
 =?utf-8?B?aFVnU2oyN2hRQStNdERacysrMnpSVjRiTVRoYzZqRWdXenppVFJXemk4K1pQ?=
 =?utf-8?B?dDl5S0c4L0ZJSWVEaGhFeStxcWVoaHllNVB1aUdQZmp2dmdmR1dQTnpHOHFM?=
 =?utf-8?B?aExJWjFwMXFYK0tNNGlQNWF1bE5IVHRDKzJHblNyc25hZVkzQ3BkL0FFbG5J?=
 =?utf-8?B?bzB0dE1RS0s3R1plc3EwMXFKTjRlRFF3TDQ0WjUzcnBjd0M3cUo1VTVZTGRl?=
 =?utf-8?B?S012aWJZREZOaHNQcnJFc2RtR0JSTWdsV0g2N3ErWWpkZ0JLVzc5bndVZ3U5?=
 =?utf-8?B?dDlrdThQcTFmVzcwY08wNFpXWG93VDhTTGNtQ283V0o2OGxSTGdJVkxKYnJS?=
 =?utf-8?B?eHZTRWU5TkVMZERtTGM5TjBmRFlhaWNwcTBmeGtnRGhvaW9WZ2s1dVlGdVE5?=
 =?utf-8?B?ZkI2dHduZXk3R1ZqKzVha2dUeGZFaHFKQ2FHVWh1U09NUmY4Nlh2M0RrQWM3?=
 =?utf-8?B?R0MzalVzaGNvQW5uQ0FmS2pkdFpLbDZpOEZGWDd4QU1TZnBDeHJxMVlEL1d2?=
 =?utf-8?B?S1MyYnJibmloK2txQU1VOVdnMXZwdkhtZGgxV0hGd2hFYVQyUk81dVF2Sisy?=
 =?utf-8?B?NVVNamFGOU5jR2ZrcE80ZnNJc0ZzOWpvREpTc0s4Y3FlejVEMUJXK0dEWGsz?=
 =?utf-8?B?RERKS0ZrMllLc1BpNUZhR3RTUEN5Tldnc2M2VDh5Q0E2OERBOWJpLzVvZnpN?=
 =?utf-8?B?cm1UamlXSlJZZml2SndtYmJoRGNwYkdNeFlhK256ckdXTkFjWVFyWlZ6cDQ1?=
 =?utf-8?B?MHFKMkU1dGNwZ3EzSnd1Mkp6bG4zQ2svb3dheUVncTBYSGxmWlgvSThjWS90?=
 =?utf-8?B?aUhqMTIwMS9IcnNTUC9rcHpTbDFtVENGeGt3SDZaaFB1S0E9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC27D0A902A046409052E58A7C38C80B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9467
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b605dc1f-1c4c-4417-e015-08dcdd9d022c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eW8yNkJnUmJNT1VvNWRYMFk5ZDFJVUFQL2NiNktPaDdhSUNJa3FVaStqTVE4?=
 =?utf-8?B?KzFQK1VrbkVPT0lpY0N1Z01lQ3NtTWVhSmozMTlFa2Q4bUQ2d1JTbmdoNWZZ?=
 =?utf-8?B?OXpPNFppUFdaZ1pCMTZMQjNKKzJQdXJCaFZGTXl0L1NOOTZ6YUFJQ25tMVZT?=
 =?utf-8?B?R3NhK011ekRGcGpETDRqaW5xdTBnNmtkV1JWRTZST016QzNqL2VSSUVOT21P?=
 =?utf-8?B?MUhxVDYzaVc5UktkRzFLZHc2dEVSU1YxQ28zTm9RZGprK1RkZVU2dzFGeStO?=
 =?utf-8?B?Ky9JYzczaWY3SlhyN1J5Zm5ueXB4Zi9sL1RNa1p1RUl5RlJHVDdmN1NKa2Jn?=
 =?utf-8?B?Y2ZwemcwUWhMZ2pOWFkxL3drSS92disrUk91Ym1RRGdmcVRndUQraER2ak4r?=
 =?utf-8?B?WXVqUmEyNnBzclV3bWpzcytVOVdZWWVRaGJYYTBaK0MxSXNIaFdyUUxVTnVO?=
 =?utf-8?B?SjlsSmtGaGNIdGVBbGs2Q3pxdzNKb3VMektGUzhyNGFTbkhyYktuM3IzUG5t?=
 =?utf-8?B?djM4ZW5SbjRrQ3hHeXMyZXdpNXg2OFRLdHhlVXplb2s4MW83YmpWZi9nSzFz?=
 =?utf-8?B?SEp4RUUxc09jWjNqeGluVHQwcFYzeTVlL21ndXhlQ0RDbTVLM25QZ3NPSlY3?=
 =?utf-8?B?YzdVaXQ3UkhJWE5FK29CVC9PZEZvMGxyQXdSZUI1ZE5sdmFXWGpFNkI2Zldr?=
 =?utf-8?B?ZmRQUEszUVg3c1lpN0F2Y0xYa2hVVXdIcmUwb2hCNnA1R21tV1pSQ2lZZDNH?=
 =?utf-8?B?R1BCc3B4RTJ3N3MzSmJCUFBiOXZ3S3lScGZvQnNIZ2E4OVV0Vk0vVHpTVGho?=
 =?utf-8?B?NnhLMEJwcThDL0ZoQlM2YkVIdnZjL21UQXAwaFhsMkI5WnVVRHZqYlZ3U2Fq?=
 =?utf-8?B?SStZdXdXdHBqNW1JaHhONUgzZ3FHNnNUaDFtS2grakVrQzdsTkdWNUhlaUI5?=
 =?utf-8?B?OUh2RE8wUFFsVTdnWG5kaEpsMWVpcjRsU25ONTlsN2QzbzZ0TERuMVNsTWFt?=
 =?utf-8?B?ZUo4bmZpOVk0WXBFejFMZ3pQRjhlRzBDVThRS21pQkRZMDZ5K0dQWHl5enFY?=
 =?utf-8?B?TWlnbFpxaTc4MFNXbVIxYituOXJvMnJabnJkOUU2anVNMllMalVldURIQXNw?=
 =?utf-8?B?ZXp3bmU3WElYYWpScml5ZnVNbTB1MWo4OUxHYjYrOWJxL0Vwcm5uM3NFdW5B?=
 =?utf-8?B?SEw1SFRpRXU1cTFxaTQzSXo3TitvMHJrN0cvZU1DcnJKMEd0WUdITXd1emxq?=
 =?utf-8?B?V3pxSTJDajN3QStISmE4NnFObk1zVks4ODlPdzNKMllOY2xHVnRDRHV4MjRl?=
 =?utf-8?B?UzE1aW50TnRiMS8vK252OHNYbVJ3UGxsYzloVkgxN0V4RE5hWndMZmZpSjVx?=
 =?utf-8?B?UHUzVGJnT0hJclMvRHQrbVRtb3BIZzkydHBBRVB2ZGppeExaSzEwMHhMMDdF?=
 =?utf-8?B?UHRVNWI2b2lwWHlUNGs4TW9nN1MrU3E0SXBVdWhsS05Fd2tSWEtMaWlZV293?=
 =?utf-8?B?Z1h6VEpKQklRSUoySXl2SEllRnc0UllQYUZucDdLSjFJZHQwT3p4MklpZ1Np?=
 =?utf-8?B?RXB2MC9mMlJoeDZydmYvSzdTR2JmYzUzTjdDbC84YW1nU0ovNU11U0c2NU9k?=
 =?utf-8?B?Z3NvUzNVNUlRZGYxS09wUFU5dXlTTnRyTXl4NSsyaDVSbklEL1FaU1RnTmlk?=
 =?utf-8?B?bU1nUytoSkEraVZxUWxwaXF5M0t1YjdhVU93WnpjbmFMNUZNTmJaRDNySmRa?=
 =?utf-8?B?YlQxSFU3N1JuM2wyeVpiMDJETTgwSUhUN2FsTkxRYWJRV2FFcHMrY2NMb3dI?=
 =?utf-8?B?bkFYSmszZ1l1a1hTQ1cxVzFIYmRLNTl3eGYvVlJzK1FneXNaNG9CZEVhcjl2?=
 =?utf-8?B?Y0V5MVBpUUxFRjRBRHNnMllXdGtSd3VmQndvUEdWMkUyZlUzVnBSMWNubkh1?=
 =?utf-8?Q?Ay/uN5XrEIg=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 20:02:52.2736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a21ec887-b80d-42b7-c00b-08dcdd9d09bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB10343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 20:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204965

T24gMjUgU2VwIDIwMjQsIGF0IDA3OjQ5LCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4g
KiBhc3luY2lvIGludGVncmF0aW9uIHdpdGggc3VwcG9ydCB0byBhd2FpdCBHaW8gYXN5bmMgZnVu
Y3Rpb25zIDptcjonMTg5Jw0KDQpJ4oCZbSBndWVzc2luZyB0aGF0IGlzIHdoeSB0aGUgdGVzdHMg
ZmFpbDoNCg0KUkVTVUxUUyAtIGdpLkdPYmplY3RJbnRyb3NwZWN0aW9uVGVzdC50ZXN0X3B5dGhv
bjogRkFJTEVEICgwLjUxcykNCg0KQXNzZXJ0aW9uRXJyb3I6IDEgIT0gMCA6IFB5dGhvbiBmYWls
ZWQgKFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToNCkZpbGUgIjxzdHJpbmc+Iiwg
bGluZSAxLCBpbiA8bW9kdWxlPg0KRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMi9zaXRlLXBhY2th
Z2VzL2dpL19faW5pdF9fLnB5IiwgbGluZSA0MCwgaW4gPG1vZHVsZT4NCmZyb20gLiBpbXBvcnQg
X2dpDQpNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ2FzeW5jaW/igJkpDQoN
CkNhbiB5b3UgYWRkIHRoZSBtaXNzaW5nIGRlcGVuZGVuY2llcyBhbmQgcmV0ZXN0Pw0KDQpSb3Nz

