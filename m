Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B75EC27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 10:56:42 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web10.11432.1717671396887737955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 03:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QLrCSYY9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QLrCSYY9;
 spf=pass (domain: arm.com, ip: 40.107.20.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KpBf720oy1VLh0bhLefNzUEMHDedF/FNoHNSdnzmZR+vgR1QXNgXxFQv/isFaHMo/h7DM+9H2SbBjnxIFUFv4u2aIKCljyA8CHTsZUAuabu6HJZ+CHkPeSUbu1hjpZsPhxeU9tq2VSZffM5iODALn+IXhttOJvAzKSQvq+8ZvQEpsiML/pfAsdM5dY92K9VYSodP/aPQWcGJ3rKYOJWTVSJfXdI0hFeGS9E1WM+9W24OCvUM337Xk8N95LtsfqfgzqImo6YCsBr7tV0JTDZVn1QMV+MxxQZgnO87tnKnW/4y0bZPmMb7P5oZAcmVriDOaGe72IFQf0KwXGuELiAwVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnybczZ416aLD/s5XC0w123kWgvXqyClHCtOx24ML9g=;
 b=YirvKbIkGkyuIjdROh8gJOMEPIxsDFHlD6bA4HAnGGmcAlxgdibHYA6UB1Op55D8aJnC26uBrT4dhcCsRhOho31kRi8PPQNMJLy98P08V9r7hV2u8erxlx59BB0gIlD1O1MT15Hh+yKuBVXDcgIIq0rDc1B4RounjDVM1wB3trljm/a8b4WFRqzZYREIxGkwe+8lbHPt3ZZ3JXsbNz1pU6lgjv5nZD/62wr9tsYvIFUwkOo12E4l0De3rgBqqTPgiBguBvfH9cSuByBoONLyXjwvLvVwDh134ETy70dme9J7GVaIetidQ0qNLkVNtagk8s8ui1Pt/e+Kh7GyFkQPng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnybczZ416aLD/s5XC0w123kWgvXqyClHCtOx24ML9g=;
 b=QLrCSYY9GNT8jad32eJMTsdvIISvj3ubR9dnntEkxeY3cvB4WtNB0Y3gRAxhqBHrQdomNHaAYc59zkt1ivEBWrKARK0/xiLyZ7tYcSC2prYm8z+jkMK8/jGyAZp8lg4DAO6bQeJXLtz2vWTC/V6s6WUsd4w6o8sbhNxQooGMNlg=
Received: from DB7PR03CA0106.eurprd03.prod.outlook.com (2603:10a6:10:72::47)
 by GVXPR08MB10497.eurprd08.prod.outlook.com (2603:10a6:150:156::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 10:56:32 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:72:cafe::19) by DB7PR03CA0106.outlook.office365.com
 (2603:10a6:10:72::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Thu, 6 Jun 2024 10:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Thu, 6 Jun 2024 10:56:32 +0000
Received: ("Tessian outbound d79ebeff6a2c:v327"); Thu, 06 Jun 2024 10:56:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6b17444fe345c23
X-CR-MTA-TID: 64aa7808
Received: from 3683a8a030a9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 19579CB7-F500-4722-A81F-F2CDC957F76F.1;
	Thu, 06 Jun 2024 10:56:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3683a8a030a9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Jun 2024 10:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NItnGXcarN8c0OImxVBjtz0cwUlF4ODQVgl1pnzmjyvGkLLTKMaS4zKOKrX9nwGKdj4ufdt4KrWW/Fc2+VVncIIGAl4yUtyALpp8I22qB5Cf2URlMgcPDBCwvOxxHDAM5YMlqmEVPe1tnyXukqyuYnoGre1OuEEyrVttji3U7C/NWjnkdRvIJR618F731pwvmy6UBQ96RgMlYmQhva74npen+PeWPt2DdvI+vQrhXsgqOFbKwvT6Ht1/zso0efw3eBrnwx5EtiFa8jSM3sO+3Bf4d121CCvEumad8IQmcgWpmt970Wceo9CzVnotYMFjCzToruRNt0WECuKOs1Hxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnybczZ416aLD/s5XC0w123kWgvXqyClHCtOx24ML9g=;
 b=Ve9RNoHCUogcWwfC/rihfLpt+HEo2MIdgEcHWHCbuJiBVTQy4pf7iAZaEMatTIFCS1+rVG2kqCyit6a72AJNstBPV35CeyHA82bUt22727oTZkordog5O915gT6pN+pgQ6JffqoqX0Yp/avoDxDguTdV6m7FCURUdgQPoL8drXLqo69brys8mRrLv+YyJ65VYSCjPR1if+i3WNXccyI45I9S2hxhfhPNhRk+0hC+qUDNWAJbX35ei4E3oJr+LL2WUhjYIp1Wh83nb6KTbuKsKNiLgaJ9Jzb1EiNXyaS84eyFSloCbVmxNc26wmY5WCAD9/Y5BzVqouInOgGMxMEaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnybczZ416aLD/s5XC0w123kWgvXqyClHCtOx24ML9g=;
 b=QLrCSYY9GNT8jad32eJMTsdvIISvj3ubR9dnntEkxeY3cvB4WtNB0Y3gRAxhqBHrQdomNHaAYc59zkt1ivEBWrKARK0/xiLyZ7tYcSC2prYm8z+jkMK8/jGyAZp8lg4DAO6bQeJXLtz2vWTC/V6s6WUsd4w6o8sbhNxQooGMNlg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8671.eurprd08.prod.outlook.com (2603:10a6:20b:55e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 6 Jun
 2024 10:56:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 10:56:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jonas.gorski@bisdn.de" <jonas.gorski@bisdn.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linuxloader: add -armhf on arm only for
 TARGET_FPU 'hard'
Thread-Topic: [OE-core] [PATCH] linuxloader: add -armhf on arm only for
 TARGET_FPU 'hard'
Thread-Index: AQHaty4wJdpBArzS1UeFk4Vlf7qxerG6ke8A
Date: Thu, 6 Jun 2024 10:56:24 +0000
Message-ID: <90582C83-7F95-4993-8DF1-3BDE3D3F4DA8@arm.com>
References: <20240605072629.115812-1-jonas.gorski@bisdn.de>
In-Reply-To: <20240605072629.115812-1-jonas.gorski@bisdn.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8671:EE_|DB1PEPF00039233:EE_|GVXPR08MB10497:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8e4171-a27a-48cd-1ea8-08dc8617539b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YlNaZkpEcnNabFkzeE1KV0JhbTRaVE5lVTJZbjNDS2NhUHpzUFdibmFPcjFL?=
 =?utf-8?B?Z0JHaVF5VUo3K2k0bG5qSDd3Wmh4YS9DNXNhNUU4QWIreDVFZlRwU2pQNkZy?=
 =?utf-8?B?VFJYWWc2bGNhZ29JTFlEY1hkTnFJb0lSZmVTVy84alRmRCtlaGRwVFFTK080?=
 =?utf-8?B?bFFVeEpBNm1MUm55M0Z4OHl6aFZQZ3lUNnlnUHlsNXRIYVMzTktmcUFoMGRT?=
 =?utf-8?B?TVJmUjRObllPdGM3YUxYaW5MZWc3YlJXY3E0NHJyLzJZaWVPZ3BxRSthS2VS?=
 =?utf-8?B?VWxvWDdpaW4ycTFiTlZNVGFHa2Vzd3MraVFONWF4bUpXdjM3aWJWanNmMG5t?=
 =?utf-8?B?Rk9lY0dtNGJPUWg2THUvb3JKSEdxNUpZQ25hTFVidEpDU2RhUWhLeTB4Rnhm?=
 =?utf-8?B?Y2YySXRQZFVRRStUTGZxU1dsT0N2RXFGVHJMK2FPQW5TczBHQ1BRaHdJQ3F6?=
 =?utf-8?B?b3Y2WjFudjRkakdBeVFtd3ZsUWZFMmJHRVFIWHkzQXU0WFFiMWNEcWYzWTRH?=
 =?utf-8?B?bVpZWlUvLzFBbWY1KzZTRkdBMUVGM0R5SndiT3ZOaThvT1BhdnJUamxqdTY0?=
 =?utf-8?B?Z2dEMTRteXAxL1hlTnRkbkpkQnI1b21rUEM0UkV1d09ScEJRSnBHKzU0TXBS?=
 =?utf-8?B?KzlJeDI1QlV6RzJvN3JmTjVQRXFDejF5dTVXU0pZdjJPZWIwOTgwZVpCVk9S?=
 =?utf-8?B?UkZ6dzZuR1RLUCt0RmE1d1JYMFhOd3Qzb08xNXUyZ1A1WnF4U2c5V2h0aEps?=
 =?utf-8?B?WTh3TEN4cktpM0FIeFpiMFBQWlJPL0tVdlJ1VWNsNERXb2U1allabWJFMmh0?=
 =?utf-8?B?eGI1dXZyVTFWNlY5SjdlZUNEVXdsdUpzdWZaUDFRODMyTzRYUDVNV1BlZkVS?=
 =?utf-8?B?OWl2dnFuaitJWTJuTTR2VFdmbzlFZE1xcUQ3SitXdGtMUmZXd1lWWXFtSGVj?=
 =?utf-8?B?WTJIUllremUwd3lWa2Q3TWVWMHFYNitnWnA1WjFsaE01OFRVQk4xZEtxQlZM?=
 =?utf-8?B?NUJyZU5zVzJoYmF3SzhrNDlUS2NXeHhaUW50YnVUaTVMN1REdml5cmo4WTdL?=
 =?utf-8?B?UEY3Z3ZJQjhncGRlNUdXVnRHRklXRXU3NjJhSzAydG16Z3VTa2lacTRtS2pG?=
 =?utf-8?B?YzhXUk9sM0FiUVNOWU9qaGZHYmRmbVYwVTRLRm9KTXI4dGFna29HZGRxazVt?=
 =?utf-8?B?VkJMbEVpVUp4Mk1GQ2pKUHhoUi9TeUZ3L0crelFlaTF1b0k2dW9IZnRMMmt0?=
 =?utf-8?B?bXNVUVlIbEJoNWQyQVN5RHBhdU9YTExMa3Fwd1BhZDRpSjBiQVl2WWQwazFk?=
 =?utf-8?B?Z2hUeUtYbms3TzFwWHhaZVozM0NDQnZKNGRvcjV3V1QyZStOeHV0S21KbXBS?=
 =?utf-8?B?dFJmR1JzWnBHMWwxeStiY0FrUUVEUWtGVlY3UUdRNytRVzQySkloOVFmd1Zx?=
 =?utf-8?B?c2JpUkhnTUZVcEk1eWpnblpxSHBsTnJOLzAvMHNETWFuOWVFaEZYbWZqa3NT?=
 =?utf-8?B?M0hqNGRGYnI3N2FIK2t6R3d2ZXhCRlYvMnlrek13YzdDZXV5RGdsRXQ1Wjhs?=
 =?utf-8?B?UWt6Z2ZjTlVUbC9SZ2daQ092TDZmTTVCTnhJRXFQZ0ZIUDRIc3VvN1pjVlFP?=
 =?utf-8?B?b0ttaU5kTFFUanBFZThQREkrRmVnNzNaYmM3UmVMYWpFUmUzRG0xOUEvU1A0?=
 =?utf-8?B?cXlVNlNOZHhQR3FDWGRCSm1sRDIvamI0U1AzcVY3MmRkdElSL0hJamlUNmhZ?=
 =?utf-8?B?OWR4ZndOSmxINGk5ZE5zK0RCVWhSL3lVaXN0VzZwSXZtaHdycEczNXh0enZO?=
 =?utf-8?Q?4gn8WHkO92d4nxzybKewr13Flqs2f0o48Lf0M=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B55E5C693B8C5F49813D2EF259FCAC76@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8671
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	63f27236-25aa-4650-0bc9-08dc86174eda
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|35042699013|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0xaZFFHV0Z0eHNrRTBCbitHMkVCdWpPK1J5VkNUM2pvU1Riako1RW1ONG45?=
 =?utf-8?B?cHRXYStFcjhhaTJnSUl1UGVXdjhKV3dod3BqdzRQT3RqWElRSzM1dTZQcUEr?=
 =?utf-8?B?Vk8zb016Wm9DNnlmNkJBUnJ0N3dOVUFqVXhiSFcvUEg5aUNod1hNK0Y0cXpw?=
 =?utf-8?B?OS9GS0N0MzZCOEp3YmVad0p5R1J0Uk5UT2JQbmlocXFCYWxmcjFSR0pwTDds?=
 =?utf-8?B?bHNvRjZCMnBZRG9MYkhwK29SWGMwOHlaUExuM052UTgzcGhPYU14NFRmMFlO?=
 =?utf-8?B?RDVPdjRpV1kzcTZVc0FyZ0k3cHFiekxtMVlDcUVwM2ozaWJPbDJweDZKYlNh?=
 =?utf-8?B?VUo4WVhnTStDSm43RE5mK0UweEw5NnBwOVNkdWdobWhVd1Y2YWcyZnlFQk1Q?=
 =?utf-8?B?bC9memJoUjM1STlLMU1sdGswWFI1d01QRTJ0N01wUFpDOGlQNytJS2JpRHU3?=
 =?utf-8?B?MU5VNDB6RWQ1T1VvVzRKWDJsK0hIQlpoZnh3NHJTVlYwRE8zdHdRM0J5aUlU?=
 =?utf-8?B?QnpDV2h6MVg1em9qSVdXM09KbWJERUROWENEcGk1aWpiNnMyZm1zdlk1andu?=
 =?utf-8?B?UHZYbmtseEZNWHBNSHBkNkRzaGNDbG5CM0dCT1VtNjJOWVdpdVEvbFdzenhy?=
 =?utf-8?B?OGR3cWF6VXRua0lnYjlmdUFiTGRhQ2t1SFE3NE5zaHA5T2ZocE1nZDJsdUlV?=
 =?utf-8?B?aFNENjJDU0owdzBhSDU4eUFiVTNkTGtmUVpNUmFCUG14L1E5dVRWK0lGRGNH?=
 =?utf-8?B?WG9jTW1qcjhJSlRMNEJBTGVKUnphdE5VMC9DUytOUGE5ejg2K2tUU0piU0R4?=
 =?utf-8?B?dG5hSDA1VmlTdUJPNmM3RHpNc01XVndPM0lhV1ZKRExtQVhnTXJDOEhkRUxL?=
 =?utf-8?B?ZFJieGRMVm8rQ0RsNzI0N3FpQ01GcTg0Y2luUXYvVlNtZWJlMDRNQmFyeTZo?=
 =?utf-8?B?M21CaEFzOXdGUWpOVDdZWUhjZFpheTkyZ3V1bnZSVXRweWVTU3NLdTZDZWpy?=
 =?utf-8?B?VmxDNWNLMW1scTRNZmdXdnFpVFNLazVRdisyTDZlZ1h0SkJJWW5Obmlqd3gy?=
 =?utf-8?B?KzhlUzhsekpRT0YzYjJobVRhejJyUkhBbHpONVdkSDV6dVdtZTF6ODBkMVZH?=
 =?utf-8?B?MWtxQWplOVdXazEzNDl4VHRpVjF0WFpub29VeENZWWx0UnBaZFpYK0w3dVFs?=
 =?utf-8?B?cWIwQ1BzYkc2Y1g0OFh1Qk8vZURaMVdzT0JUeWxLZlZhK2wwRG1DbnQzTHQ5?=
 =?utf-8?B?MzJ3NnA4amx4R0VWbVNhSjl5dzd1YzduZFY5R2dPN2xkTGVkallWNmh5Y2Q2?=
 =?utf-8?B?Qy9jWmhraXFLeHRRNHROa0Erbm5sV0x6aEVGd0FOK2lkUXo1Wnh5c0hpZmdC?=
 =?utf-8?B?U1VEbk1XUG5rMWJEV3dFVk1OVlNrVFM1TlV2Q0ZCMU9DVG0vUG1WYm4rSmlZ?=
 =?utf-8?B?aGx2SUpZd0JOZnJyd0o4L25Xa3luK1psc0pobU1yWGN5K0VGWnhlbTM1bisw?=
 =?utf-8?B?NWRNeEs1SFhMbmN6dmQySGs3M09BcjdQeC9JU0tKNWRKWnNVdXBwUVVsTjdG?=
 =?utf-8?B?VWx0ajQyak5qYWlSTUNFYU1rMDRmcmlBSHBNQnowTDNidFE1UzZ4eWRGMjdt?=
 =?utf-8?B?NG0yK0NkZ0szVWpDbnFucFBOaXpRSEtpcmRZay9FUG5ycHRwVVBkWlpTUExH?=
 =?utf-8?B?cDdtSndwM2VFNlpRNFZ2UWJPL1U4Zkx5aFNRRkdoVnVVOGVadHNNdnNOM21G?=
 =?utf-8?B?bSs1TVc2WEwreDlyWlJNVlVVSmx6aUR1M0ZCTkhhMElZcEdaTnZyMzhjcllL?=
 =?utf-8?B?b1dBZzNnMDZEb0E5SEg3eVN0TkRDdTViSTdOMDQ4bTVvMzZsM21xeFcyaHdC?=
 =?utf-8?B?M0t4QVJScE5yYVd5V2g4SzcyL3Q0ZjMrdUZQcXByQVdmYVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(35042699013)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 10:56:32.4812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8e4171-a27a-48cd-1ea8-08dc8617539b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10497
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 10:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200393

T24gNSBKdW4gMjAyNCwgYXQgMDg6MjYsIEpvbmFzIEdvcnNraSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8am9uYXMuZ29yc2tpPWJpc2RuLmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiAtICAgICAgICBkeW5hbWljX2xvYWRlciA9ICIke2Jhc2VfbGliZGlyfS9sZC1saW51
eCR7QFsnLWFybWhmJywgJyddW2QuZ2V0VmFyKCdUQVJHRVRfRlBVJykgPT0gJ3NvZnQnXX0uc28u
MyINCj4gKyAgICAgICAgZHluYW1pY19sb2FkZXIgPSAiJHtiYXNlX2xpYmRpcn0vbGQtbGludXgk
e0BbJycsICctYXJtaGYnXVtkLmdldFZhcignVEFSR0VUX0ZQVScpID09ICdoYXJkJ119LnNvLjMi
DQoNCklmIHdl4oCZcmUgY2hhbmdpbmcgdGhpcyBsaW5lLCBjYW4gd2Ugc3RvcCB1c2luZyB0aGUg
b2JzY3VyZSDigJxpbXBsaWNpdGx5IHRyZWF0IGEgYm9vbGVhbiBhcyBhbiBpbmRleOKAnSBpZGlv
bSBhbmQganVzdCB1c2UgYSBzdGFuZGFyZCBQeXRob24gdGVybmFyeSBleHByZXNzaW9uPw0KDQpS
b3NzDQoNCg==

