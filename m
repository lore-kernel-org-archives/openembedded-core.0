Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC6DD3E772
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 21:11:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.66])
 by mx.groups.io with SMTP id smtpd.web10.31412.1730841092400908152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qlqd2gMi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qlqd2gMi;
 spf=pass (domain: arm.com, ip: 40.107.22.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eh5SxHL+zFD3Wv6I5U/P5C24enAnwlBPifuJCJ9yjBF/VFCoHN6/2g929A4fGiqmzmWLqMzBRx8ZTLVZWfN0RfZ8evl8vb+CcytPzohBLonSYadd+33zr6s2/7ZBmxqhBObyG3lxqGaAde7IfmlNQz2oWNTqzsSzRnu0iy4wcowNBEeZ3YelRJV8P2PeYkw5S1j923fynMF+05LKbBQ5Smdvyi8sJ5lnMJ+FuQi3ThRFi10tdCExT7q1KGsXhOaKgEpABZP+IesrkNdrBxiEHCvgTwAHWMIdUJetHnL/GCm9zphMgf38pmBdf0ryiL8ceyI2HOQf8RgJv7uTtXHjsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASbe2N6zvB7UlZpcMIiWxa7rM7AizLVLorFEOIhpyn0=;
 b=oYaWaqitvO8EWm7GbX6G/FoSXD4euY/rC+TOdtIh3GScUWF9sD/hQ4f02DoaliF8jzXMsroZx7c3AwmT+flSZi4/MPFfw1TGncnOK2Cjc5q1VemA17iNKTtkVnJTEKEUwkOUnQ7ehvBRfLJ4z7vapgeectPLwUxCtpgFGeNkWF0t4cla/gtoI8V7MbJBnUKSwLCUXAMzwcrrdqogcYdHfqundGO4Ruw6jaIt0Rp5xw6gNlgKWgS3nEDC8G9KGskWutXK0/TFKpsu1vnKGi16am2eP2IoISB+XuKg2Kb/9Bm2oEgXSi2NPNVS50lvHpdNz8wO84GKt713b8Y1hW+ZwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASbe2N6zvB7UlZpcMIiWxa7rM7AizLVLorFEOIhpyn0=;
 b=Qlqd2gMiDmGhdpD8gWyGsv8WRjUGIjzig5fu90M9FtwDia39QMW2pPxvedbuMwDmawCVg/ML2NpyZi1o36A3leogLjMXdwMrGslhhMR8nNH5oti0CVmo/vXy108wbk5OsmEvanKhRDzs7fqu/cN7sTQHTFruVzSRH4dXXXf87fw=
Received: from AM9P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::6)
 by PAXPR08MB6655.eurprd08.prod.outlook.com (2603:10a6:102:15d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 21:11:28 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:21d:cafe::e9) by AM9P192CA0001.outlook.office365.com
 (2603:10a6:20b:21d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31 via Frontend
 Transport; Tue, 5 Nov 2024 21:11:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Tue, 5 Nov 2024 21:11:27 +0000
Received: ("Tessian outbound 72f4d55e3d4f:v490"); Tue, 05 Nov 2024 21:11:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c177c5f8aec03493
X-TessianGatewayMetadata: P/Y5sP5Hxxk1AWJttvvJ76oMwQQAGZzX5Q/u3WjIVT2w9KCN/TTsVe3qsNepSEDLp983ajaCTpA0/15B+BRLfh97qDRirD8GF+QUiM9U7qOZo/BM8mYl4HK6381wDVGiwxM6YppTNEk4Aoe8+bSYRChffFMcWOMDWuHA+l6tsZc=
X-CR-MTA-TID: 64aa7808
Received: from Le0b7bd61f79c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C0A22517-0DB6-4B37-AF94-034F8B532C8A.1;
	Tue, 05 Nov 2024 21:11:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le0b7bd61f79c.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 05 Nov 2024 21:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwfIwDOcQk3qhA2u26YF9F/6QeRxkqBH34OvyqzaOBetwOvLKRTQxBU5Z3NJ/x60kD/yCN83Gou/kJY8vRSjkEyO0kEnM+MWjL4/L0sVVT0ov9k3bWENdynQ1SDH4AFLaj3VqKQeRdsNP2eolvPlTtMFaiuxItc3AWwfBGg1KiVQXEs8HuP49XXkirlh8x/uJJVWh0KRIFVj1lA5+kQKhkHYmWpIRsn9NuKWdB8R36SEO4mCaoF9p1WTrfFX45HqW6nKitDMc810qalsPrvDmKLFEmT+vucukq+Tnzeb3aHIvLmrc1tUKlSJFN84j4TgeeXSG7dqc3irvXAudcN2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASbe2N6zvB7UlZpcMIiWxa7rM7AizLVLorFEOIhpyn0=;
 b=FxUK+ae2204p85QXEPTZGBYRuppkPJFUCCjREwQ3oaTrc8Yf5q0+SpVpiUqlVLGjxIQwwmYVBLeE6HrZH4eiNudaDF0JHiPhSBgCOLWZbMT+LjqLz0a8rnTOBv/+UKoDQeoqg8jSY4G1yM88aTYyta36pVrEh0bT5x5wbIJzgjsgLTgLNqV2vRj8HTuNDux4v0Bl0GoJxQaxse1UZi8czGXubgopTas/pBGqXU/GHZiB9xL5IqEg1GfRS7cZ5e2SiWRvLZhsUVKJ7bUeMYlb6x0GHDobFUS742X6LX3JFLM7DMbypPtFBa/DBuuv66e9d0OQ8cjq9la8D1JfVge98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASbe2N6zvB7UlZpcMIiWxa7rM7AizLVLorFEOIhpyn0=;
 b=Qlqd2gMiDmGhdpD8gWyGsv8WRjUGIjzig5fu90M9FtwDia39QMW2pPxvedbuMwDmawCVg/ML2NpyZi1o36A3leogLjMXdwMrGslhhMR8nNH5oti0CVmo/vXy108wbk5OsmEvanKhRDzs7fqu/cN7sTQHTFruVzSRH4dXXXf87fw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6725.eurprd08.prod.outlook.com (2603:10a6:20b:394::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 21:11:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 21:11:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] local.conf.sample: use explicit
 IMAGE_FEATURES instead of debug-tweaks
Thread-Topic: [OE-core] [PATCH 4/4] local.conf.sample: use explicit
 IMAGE_FEATURES instead of debug-tweaks
Thread-Index: AQHbL7vjXxiQ6T0IF0SL+yhvM2RSArKpHU6AgAARsQA=
Date: Tue, 5 Nov 2024 21:11:18 +0000
Message-ID: <E9E8D11D-3607-4DB4-A8BE-E24043716550@arm.com>
References: <20241105194857.3351281-1-ross.burton@arm.com>
 <20241105194857.3351281-4-ross.burton@arm.com>
 <CANNYZj8sK8_i0wSMaiHMWL_qEvvDgEqVfTEcsRGrJ8Yh3nPrtQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8sK8_i0wSMaiHMWL_qEvvDgEqVfTEcsRGrJ8Yh3nPrtQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6725:EE_|AMS0EPF0000019D:EE_|PAXPR08MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f78b8c3-34ce-4ae3-0e78-08dcfdde69b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VTZjbkxkd0trUFRBbXQ3U1dQRjJ2YlNkS1F5dUdOcml1QzJUc0NGL055aGc4?=
 =?utf-8?B?c1BEejNHSmtFdjVTSFptdk0zSDMvMUgzL09EVGYyQkFQTDBKYmM4WFpPUno0?=
 =?utf-8?B?a3l2R3R3MG14RjdLNVZHY1VqQ2JZK29kcERxOHc5Rk5hK0hQNzFkTDk1NFZ0?=
 =?utf-8?B?UERsdjcyZkdyVVBINGFRMSs0WlVHbGhOT3F1djQ1dDV6S0xYK0RQTGUyRFF5?=
 =?utf-8?B?dHp1VHhGYW9tSDlxN3F5L3IvRDJ0dTlUUHdWdTZLNzUxS2RXRHBOZ0FMSzNo?=
 =?utf-8?B?T0tsdWg0bFdrZXNsRHBFSGI1VVFmWXhIb2hBbnZNLzdJZGVDVG1CbHJPcHVu?=
 =?utf-8?B?VjBEOG9odDRIb2RjaUtBem9hNHVUU0pwd1E2ZzhBdldhUTRuTHBaMjhMRnBm?=
 =?utf-8?B?M3JDMUpsWDlSZGxUU1dhK2tlSk5OS2FsV2tlRVBISUw1bDQ3dWJLSmhGQnBD?=
 =?utf-8?B?am5mRVVyUDJ1Kzc4V0RPWUwwSnQrSExoSjlVQnp4Rk50SmlneVBQdW1RM1F1?=
 =?utf-8?B?V2FxaW5Tb01hSlFyNExrTDduY0Y4UWhRWk9QZzJrNS9laUYzUWtVRkxTM3B2?=
 =?utf-8?B?L2JENERPdXNaWGgwUmUzQkdvTWZFSXVpT0hmbUFaVStMdERaWTB5aGI3b3hi?=
 =?utf-8?B?VmJzaDJad01RRXZmNjlvNTFNWWkxMFNNbE5sMXZnOE9mVkFPeWZNTjRSNDh1?=
 =?utf-8?B?emhpb3hUNkRCTHllL3RXbEE3VGdiNjM3d2xvcVZBYnR0TFdvQzRmKzJabDMy?=
 =?utf-8?B?NmVIczhOOS9nY3E2Z1p6ZjMzR1RSZ0FvTVlUQ0EzeXVRSDAxUmZBaTFQdG5a?=
 =?utf-8?B?V3gyaGp4dDFRVjJlMjByOXFDVFBqSG54N3NENmtGRGo1THFrbTltMExxQ0Jo?=
 =?utf-8?B?eXZFcGp6V283TTY4akN1ekVVcW5oWXJ6M0ZySlZtZkFwTHpKWVRrbmpBVnhq?=
 =?utf-8?B?NUVxMFhUbDJoUEFscnI0WlB0NHgrMUFNbStONkUrbDN5NWdsQjRpUGtOVGFD?=
 =?utf-8?B?N08vaS9KdEhUY3BRU1hZUGgyYzFVVzFmZGxUd21aZy9ORCtpdnpyVUxaTEd2?=
 =?utf-8?B?NHZkMnNEeFlqTVQxTDZtQ0NiOFNZMmhWZkhHWm5xbHU1eGUxKzVraE9Ud0lU?=
 =?utf-8?B?Q1FWeUxlNGJuM2lqSDBLQjBacE8rQzNyMWlTSDZhcUdUaTRmRE5ZMUNGVkFB?=
 =?utf-8?B?aVRrZlZlSGZjcSs3WE9PMm5BamZaSmZxMmYzcUFBSU5KQ1owZTFDV2VISExC?=
 =?utf-8?B?bjhPbnpkeU5sR0ZEZmdCaFg5VSt6M3RQQlVwUlkrNUhCSlV6TkV0NTh5N2ow?=
 =?utf-8?B?VWdKOEpPRXd2azFUYXZ1UWFVVkNPM25rc3BoRmFscjRQR2I3ZWFQK1pXM3BU?=
 =?utf-8?B?L1paRHdGbEg2dFl1WEJCL1ltN3lmNnlsMGtOeHBsUmF6RmRldjNVczhXeStM?=
 =?utf-8?B?eWpQTUFlT21OTmZ5cGRzS2pNdXhhSzVkN2Qxek0rNU40Q1NXWEZQT2xkejdC?=
 =?utf-8?B?VW9TRCtSOERYZ1hheHowSlRVVzNkY3c1RUlBeFhhQVhMTTY4RGRkYWkvQVZ4?=
 =?utf-8?B?S3NUbFArSGRIV2thamFIOTNUWGJNeStmUTc1cHYzMW1XOFozOUg1WTAwV2p3?=
 =?utf-8?B?UVp1dHl0V1J3TWJidFRzVzJwdVpVcno4VXBTSjJFWVRWbWp3U25PVTAyc0lH?=
 =?utf-8?B?Z2hRTFhia0owemxiODlyL1ZnV2lHRmxCM0lNanZhVzBlWUJZVS85Z0tDUXA3?=
 =?utf-8?B?dURXdTdlcXhHa1g5S0g2WWdId2F4azVkb29QVkY1L0k5Um94eTZ0UzlTSm9K?=
 =?utf-8?Q?3XIaAUgLPerY6HIWB1/UKcpN1sXemdQZ77JHI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <436906250DF9254EBD4523E72AD80682@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6725
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ecb94ff7-7afa-411b-a8bc-08dcfdde644e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ckgrd1cwWjRtZnd1MWttQWJOS3VRVHJ0bU5Kb3NncnBBWFlTM1E4TGtCMGlN?=
 =?utf-8?B?Z3BUNmZyL2h5Y1dmSFhtUHluZ3p2dGJKSzk2VlFGV2NiU1NjRmdVbjdVMnJU?=
 =?utf-8?B?N3hqTXR0bk9sUHhzMHFPejk5N1g3SlBRaEVxRzRoeTFZekdxV3NhdlhvZU9R?=
 =?utf-8?B?Y2c2Uis0M08rZXFXZUgrSGFob3RsaDF2SmN5Y0dVUE9Jb0R2czBUMzkxNWdU?=
 =?utf-8?B?UlBldTVTc1l6L2ZheXRkckN1L1JkWlJ0eXFtTW9HUGludXBFdVFWdUFPMDlr?=
 =?utf-8?B?a1ZQdm9hbFd2TFZMZTBIcSt0T2NEQVVubTYxNnlsZ3ZFSFlleFVaZTdvS0Ji?=
 =?utf-8?B?cWQ3N0EvUVpRcDhSaVJTd1Y3UUQzdXBVZ3JONkFCekxVdzZ3TnNrNHdBVDdL?=
 =?utf-8?B?MXNzRHJWLzhyVVlRSkRITkpRcjkyenpjbnV6SlN4QWlLYjRvV1RqVHZWZUFi?=
 =?utf-8?B?bHRZS2U1ZDA1TmNhc21Ybys4bzJrbVRMWHltN0tmQzRwVWtUVklnL0UwcDhQ?=
 =?utf-8?B?SURIcHVDNmFLbUpwUzFIVCszMzljRHk0bGNQcUoyQWFpNGF0L1lXTGVGMkRW?=
 =?utf-8?B?dUk3NVdBeXFzU0dIaEtKQ2k3ZEpxdWNMYUdQUVoxcEtJb1VUUjFWOHpYcmhn?=
 =?utf-8?B?SUloNEg0aUFya1k5ZFgvZitNclNBTzNNZUxHaEErTmZVaVJ1QjhiVG1oem80?=
 =?utf-8?B?cUJVU0J5c0ttTTRFMlp2L3FtTlNLV2FLdVhCTGR3RWs4MnN1RDdLaFFNMC9X?=
 =?utf-8?B?ZUVDd2ozY25NK3BZd2NDY1lmOHNVT2MxTVp2MFN5SG9adHkvUHVBay9kSnd5?=
 =?utf-8?B?d212ZWc2WHM2Q1o4c3JyMG0zSmFNQlhlZEpPQlVvb2lVbnpvK0xYVHNpb1pn?=
 =?utf-8?B?MC9PdmI3V0krZitocWlVMkUxdk9QYVpqRHFzeDJUanJqRVkxbTkwK2dFMDRl?=
 =?utf-8?B?a2hXQ1VVU3EzdGlkSm5OVk9pQzJmRzlUcXJLWGZsNWMzV2NhMTVuVFV3MW8z?=
 =?utf-8?B?ek9jdWk5YVhwUEVwTm56TDVFMTZVMk9SQkdUZ1ZTMUFrK3ZvTzhURU1PMkVD?=
 =?utf-8?B?TkZTOWpzUFYrYWE4UEs4bHdWSnZkdWpNZTB4eVI5MTNRenRDUTBCUXhnc1lC?=
 =?utf-8?B?bk03UG1rU1hsTE1BaG1oNjQ5MHB0T2ZxVlVqWTlxbWk5OHJJK1B3N3VTRWsy?=
 =?utf-8?B?QWhENG1MaU11eVVTV3FQZkx2RXM1c3BmZDJPRHBHRVRtaFd4Q1F0bGp2U0M2?=
 =?utf-8?B?dUJJKzNZU1ROTysranhlbkJKNTZTdmE3bjFud29sMUd2K0tvT1drZ2J4eWx6?=
 =?utf-8?B?Um1xZkE2eWcvbDYvZlFYQWpWN0Q2cE1CUFkrUVhleldabXJZcU9rSGlha2FZ?=
 =?utf-8?B?VWxEeFVvaFJkc050Rk9SNlJFRlF3ek8xK2FxeXlWWERYRUNXZmRLbVF2QUV0?=
 =?utf-8?B?NWQxSVFLNTZCY2JGNEJjK05tZHVJSXcxZWR4SEhRZGVnOU5wQ0FLenRSbkpW?=
 =?utf-8?B?VWtqQm5RUTJMZC9FajVrd1RVUUdWV0t1RTFtajB3YmVXZ0E4SVM1Ry85YjBR?=
 =?utf-8?B?cm9rTkViSUo0dnEzeHd2ajNNc245UDVYNlNCQWlQVTZyK3BKdk50dC9LSFlL?=
 =?utf-8?B?aURJU3VFNmlPVG9TTU1xU2p1Ukk1KzRRUFVjRGVBQzIrOTNDbGk0MVRDcHcx?=
 =?utf-8?B?V2RSRlJzNGQ1K2trTWUvYnZJQjF5TW1YZ2RXdmxsM2lJeEUzdGpENXlnNSsz?=
 =?utf-8?B?clZvMnRpY2NnRzJkZmFVRTNxdk9nRlcyUTlsWmlBQlhCSVBIbHdUbW9RNFdP?=
 =?utf-8?B?QWpmc1U5akNCTkhhbmdaWndxWDZqek5yUVljcVM0T3UvZ1FLQ0IrV3hmZDls?=
 =?utf-8?B?S2Q3VUhwaEk5TzhpNWxNa0Jrc2wxcENuSEdqNG5wYnUwR0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 21:11:27.7011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f78b8c3-34ce-4ae3-0e78-08dcfdde69b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6655
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 21:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206755

T24gNSBOb3YgMjAyNCwgYXQgMjA6MDcsIEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IFdoaWxlIHdl4oCZcmUgYXQgaXQsIHNob3VsZCB3ZSBh
bHNvIHJlbW92ZSB0aGUgZGFuZ2Vyb3VzIGl0ZW1zIGZyb20gZGVidWctdHdlYWtzIGFuZCByZXF1
aXJlIHRoZW0gdG8gYmUgZW5hYmxlZCBleHBsaWNpdGx5Pw0KDQpZb3XigJlyZSBhcHBhcmVudGx5
IHVuZGVyIHRoZSBtaXNhcHByZWhlbnNpb24gdGhhdCBkZWJ1Zy10d2Vha3MgaXMgZ29pbmcgdG8g
c3Vydml2ZSB0aGUgd2Vla+KApiA6KQ0KDQpSb3Nz

