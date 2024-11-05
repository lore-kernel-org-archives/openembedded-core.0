Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E71D31763
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 16:17:53 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.71])
 by mx.groups.io with SMTP id smtpd.web11.23961.1730823465349668678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 08:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=f3+/JjK+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=f3+/JjK+;
 spf=pass (domain: arm.com, ip: 40.107.105.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HcQkS68WPVaUbAZBdykoZFYJbW36HC31/4/i26ot0LozUu+Pt5av8BxTO3uyFpKY4Kj3vK6w39xiO5hTm1+HqA4MPo+vsauXhkAwDa3w7Lrc8XXzxx4BWO1f2Fo6RF6RFCded/LYu4foVAAGxf7d6zd+eVXfkVnqzhrxEJdglYf4dQ3SGaP+oz4la3W8BTDtY9EcOFSrsyMWONrw63tQJuqXdLLgk20OLlAMrSLuIByaCMb41sREZtKDi2MtTyuRXPnWXB0uOfNLj8ocuP9Qu3AFl2tsU+Z77mYB0By8NvojHeWNWvKLWfE8a9A2h3Wpr0eaf/ne6xifIZwxJyMn9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ukUJe6ZcZELnKDC2MGjTzKUMrfqKTwsgcXxGl9518U=;
 b=kg+23TyJPlbnBrp+ljSKj1g/ABzwjYOgfRgHM4lKW5RNZpV21rJHkuQq4mYP20vGuiv2WHSDhA7fhtCgvVu5UdyFgQdV+hghYYaAC+H+9n5UHF/mUsk6Kftf8a1bciDsZb7xL9xv9Qks49+j0MHnry0Ty0f1jXWgDQA5Ez0cevkYDOFCl1Clw60nnv24OmLt9lv1ySqRpNcvtilyEQrAZm3LUNEmd93WIcNDz0zDRqNegSjQJO5QZ4tl21xSqrfVu5rPb0AEi0oxGB1uC5aXsedLSpKB7FTzGV3FS/dfauE7VZc7iAtsjLQpD/x0XWjfqjUAYfkoY3n+n+QsoVOk+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ukUJe6ZcZELnKDC2MGjTzKUMrfqKTwsgcXxGl9518U=;
 b=f3+/JjK+NcEdX5nXqWYbP+tHdf1F70LBvyBZf399MAXSHvmJfU9fIxn7Fcz36d7D6mtW6hE+odcsyCCnk7ikm4D3UGnfb6gertIOxOoY1nAF1fdKNB4DQcUBCEo9L3GEjExhWjEnlXl9n8XCHkFic9esmGEjUDwIOEwBSpMJSPg=
Received: from AS9PR06CA0716.eurprd06.prod.outlook.com (2603:10a6:20b:49f::24)
 by AS2PR08MB9428.eurprd08.prod.outlook.com (2603:10a6:20b:5e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Tue, 5 Nov
 2024 16:17:39 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::f8) by AS9PR06CA0716.outlook.office365.com
 (2603:10a6:20b:49f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31 via Frontend
 Transport; Tue, 5 Nov 2024 16:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Tue, 5 Nov 2024 16:17:39 +0000
Received: ("Tessian outbound 373849c2df5a:v490"); Tue, 05 Nov 2024 16:17:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f194f16c9ec1d81a
X-TessianGatewayMetadata: gaLjT34MSn9SCoxenPUYZNwVOg7LtT20wGoJYEizgAJymTeXZM3klXCnzks/LAgnZvx9DS8yOYqHzB8tsJSd4T+VvcxFkzeyMKhcPnbs/6tC6LHrTErThrGfcSnu48ZpazOUaJ9FgQ5XM7wPBnHAB1LqQHvNeJlHtdlIM8EMuaY=
X-CR-MTA-TID: 64aa7808
Received: from L919bddaae66c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8CE921CC-2EED-427C-8CC5-5DE39DE5D58B.1;
	Tue, 05 Nov 2024 16:17:26 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L919bddaae66c.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 05 Nov 2024 16:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aG4K95gt1yPzQrWveMaHKapoELEW0v6Z8AwsrDJyEP/3J6J+A0EP/vgzjqRzkx58oC7SRHk0cN6qib8wFiqdEPPFP1gv0SlPZoS3tYhFhqpKtBoqPkSyqcMNu7N6xWg9vwEVyCnIfjCQ5IYTT6cG5pN7GGrFZSZnL6f1k53gVcYu6LsFW3hD7Jhh3uBKYqImrH4MVmlpxKH1atNxRrT1AzvGjLlA+3YwHfA6HzAs7kGeN8qCo/YXPfN9F0s9uiHwlrtczyiP5O3C3BeqNuZO8s2ZBtvhhkeeiJoqsRulpPDT1OtdbvCX8dt1HrAOryLS9yjFmtPbJKKck/SECP19eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ukUJe6ZcZELnKDC2MGjTzKUMrfqKTwsgcXxGl9518U=;
 b=waG55mPHhydmWn2mtl4UmSjiAbUf3zaWOtKyKpmy+a+sR4HK8lXZu5bA4esBt8Be+1k1I3piCqaSBf6RHp+0NpgvOhkGeZngXwDA+LxR0c3rLVHV6fJO7tlTfRhvAJOnI+g+p91X8JL47wGweef5C/NCtahzEP95+E5bWvgnfUFt48pbitWMTgFpgKta1RS0No7qNjEF0jMVBg7E5pVqkedyyhQfnrt/Vfj06KfOM6GpKzqhUF5Jsf1Zow8Cu1tzBJQeioVuU1ad5nh08sbFa4MIBb1PAXIF0JMWJ7Af2OyHqkBH1WYQ74yxjfNf23/UEyoOiOXAh6lW4bULVxu9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ukUJe6ZcZELnKDC2MGjTzKUMrfqKTwsgcXxGl9518U=;
 b=f3+/JjK+NcEdX5nXqWYbP+tHdf1F70LBvyBZf399MAXSHvmJfU9fIxn7Fcz36d7D6mtW6hE+odcsyCCnk7ikm4D3UGnfb6gertIOxOoY1nAF1fdKNB4DQcUBCEo9L3GEjExhWjEnlXl9n8XCHkFic9esmGEjUDwIOEwBSpMJSPg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5570.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 16:17:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 16:17:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Trevor Gamblin
	<tgamblin@baylibre.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
Thread-Topic: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
Thread-Index: AQHbKjoSdv/YvM45x0CAs4yfwlReRbKfWfkAgALds4CABrA3AA==
Date: Tue, 5 Nov 2024 16:17:23 +0000
Message-ID: <274F54DB-9326-4044-AF8B-42238D8B90AC@arm.com>
References: <20241029193745.2919129-1-tgamblin@baylibre.com>
 <ZyJBQBRRsLFov02a@bootlin-mathieu>
 <CANNYZj9wt-pmRrGYwE-RRSTX3+VtcU7h_Cug6woqs4k_9NSpNQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9wt-pmRrGYwE-RRSTX3+VtcU7h_Cug6woqs4k_9NSpNQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5570:EE_|AMS1EPF00000044:EE_|AS2PR08MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae56349-5476-4640-3f5c-08dcfdb55e9c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MU1nSmlVRkFUNHBJTXJrdEtNRVpxazhGd2dLVlhFRTNxK05JVnhQVGw3ZndZ?=
 =?utf-8?B?RGQ4SWxiVHBLaXVIRHljZ25PUkJObjBIQTNjTzFGUTBNU2VCOTZaSEZOM25y?=
 =?utf-8?B?VURkSkZpcTJMc2hUeDNTMDFNQitVelBzMmpubVM5NVZmTm53WDNxcEE4Vnhv?=
 =?utf-8?B?SHNCSFhkaC9wRVZJUG1wei9UeHZhMitiQ0xvMEJCbU9ZaG40cWdhN3NsZ0ho?=
 =?utf-8?B?U05SOXJ6ZmZjWkxMeUYxd0ZucUd2RitiSUs0eER0NzRBd2tuM0hvbTZKSFFO?=
 =?utf-8?B?QVF3SXhKZHYrMCtVMDhFb2FvcGtNNjZ0aU1zMnFEaVN2UFJOS3ZSKzlqSWhs?=
 =?utf-8?B?dGN2RVVlK05TYnpkWVU1UUFGSXl5bDgxSVBCOUJZWlNjMVJvbmFyaER5L1Rz?=
 =?utf-8?B?dlgwbG4xR0Q3WkUrRjZVUXpWblo3aFZyOVFHeHZ1M1ZOdGtJOFV3ZFkzcDJo?=
 =?utf-8?B?WnlSRXpGM3VBczBSdy9zcnByZTBMdGhuY1pLdmc4L1p3RHJlaGxXc2FZeWJo?=
 =?utf-8?B?VU0vQWhxWVQvS3RQbitFMi82bStnRDREejg1Rk03b0UweUUvWW8vWE9iY0NC?=
 =?utf-8?B?QXRsc3l0SjZjdEtwbnVMLys3VGszdGhpUTkzSnpoZ2U3VmVKU1ovbVl4QjRM?=
 =?utf-8?B?ZVViMVl0Y2FZQWt5TW1JOGUxY2JYTFZ0QWpiaS9OOXdCQlZQNktGVWhkWHRT?=
 =?utf-8?B?OWFwWTErNXVzdkxoekhaMkVDdGtuc296UDBIcTNmaGpPRS8yZXhxWmFWazF6?=
 =?utf-8?B?cFIrTVZhZDNYSitId2d5Q2JhTEQyVWJoU3Y2WDBjaHNXTFd3dWVRY3pPVUo0?=
 =?utf-8?B?Z3FVVjNDbGtTM0VCTHE0cXZzM0hZNWNHb1JRNUJQZEo5YmFwd2dUSldad1ht?=
 =?utf-8?B?c2ZyR0IxWnJtbGhBV0ZjZ2xiWlFjUlBPUzhLNzRRdnBBNlNpRUJMMFJEaXA5?=
 =?utf-8?B?QnNISmkrdFEwTWhZVUppbEZnUjI0RWkySy81bWw1c2djYlpkZ0dtRmU1Vmda?=
 =?utf-8?B?cXNnNDlUdG1rL0xDVm91ak8wRFVYbzlPL3EybVNVTTlwWVpkNmhtTThBZTVa?=
 =?utf-8?B?aGtjV2lyblA2dnNiTWs5azQ0UkJqTHhYS2RwLzdIZzRZMVAzQTNYMHlXREg5?=
 =?utf-8?B?bHpXdFlnWGFRNkRnRy9ZcEpJTUlJWXBwQXlwbEprTkdVUzJMYzFLMmpKdVI1?=
 =?utf-8?B?UkZOMHB0WGUrMjRuMjBrRGVXSVZ0cGd0MnZmbnVDbllWMVY2dzl1MWdoUEZi?=
 =?utf-8?B?Z0xUa0c1M0NmclRuSVJxVDVKSUNrbStqRkhBWVltNWRLR3RVSWhhK29QN3Er?=
 =?utf-8?B?R1ZUUnZEWmpqMUsyWksvZUhCc0dWaHlkWUJkazcxWXgzMWprZTBzZUd0c1pC?=
 =?utf-8?B?MUpWNGVucklyNVFMbUYvaGZFN3N0SzlONEN2c3diUnVGMXdlU2p3YUhONGll?=
 =?utf-8?B?SVZBVjgwRWhzTkZiU0RiaSthS1B2aHlWV2VCam5zbVlOU004N0RIMExkTE9B?=
 =?utf-8?B?KzB6azJLZmdKWXd6Q2RTckhQeC84d3RqRjl3QzBHbFlEZnJIbFd0WlZMM3ZO?=
 =?utf-8?B?TCtTUkRCWlRWTFNCM2VBb2IwZVd2cUlUdFdpWExLTGl3S2dCaVZkR1IzRVp5?=
 =?utf-8?B?bU9MTUlDT3hISFlROXZEWUtiMkwzbnNrUkhmeW1BWWRrTzRWYlg4NUdtM2J6?=
 =?utf-8?B?OGFmRWdBanM2bmVzTU1walpHSWRuUnZmWEF4ZmlZQjcyQkFHZjFVL3FnWEtl?=
 =?utf-8?B?b296SFQwVjJPYXNRdStQKzRFSXI2Vmk4VUdsbzY1SEFJb0xXZWNUeER5TFdS?=
 =?utf-8?Q?Ao+LvfvwFoowH5v6V5b3q7IBPlVOi1GxcrP+0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5766F72FBA2B3942A706C21AB3489AE3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5570
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5d4869cc-abe9-40e6-2bef-08dcfdb554a1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TENWd0JnQzZBYkhTdHZHTFJibHVnMFZYUjVabVN6TGlKYkZHbUpITG5nLytq?=
 =?utf-8?B?SFBrTWZxL1czRjl2b2ljSjVjTzkyZm5TV2RXeUg0TUZVRnl4enRtN1BNK0ZU?=
 =?utf-8?B?SnNzNm04N3JHbis1ZWplRzFPQ1VERDNwWC9MZ2d1a3NveDdxZ0tiRnY5YkJi?=
 =?utf-8?B?YlZ1S3pZZEZacGc2NHdlUGwrQlEvRitZMnk4bFFFa1ZMT3RWWm05cmFQNGxi?=
 =?utf-8?B?MHV4cjNNOHBid01IN2dwKzZsZ3E4THEzYWxUN2pQMGFFWTZFVlpzbWVBWXls?=
 =?utf-8?B?WmJSanpZamVGUjJEdGRhbG5HNDdMUGVMOExWSXlQWjBHTVpnaDhuV2NTLzlL?=
 =?utf-8?B?Q2xXUjdJZ1hWY3ZHcXBmL0xGOUtFSllYQUNzZTRBdWVaeEF3TUpiSlZDd2lY?=
 =?utf-8?B?ZXhkNGF0MkJRUFBWdTEweU5mOHBXZlh0cU8wNnhDMmRnRjAwNUQyY3F0Yytn?=
 =?utf-8?B?REFtOXc4dC9maldxK21BQ0dydVpjb1VjZ3h4cjNJcm50Q1JtNDJwUGI2VnhS?=
 =?utf-8?B?dk9DSWFLaHUrZ0JOV21jYTdjd1BzWkplblc2dk8yYmpZL015aGNaL0VuSmtn?=
 =?utf-8?B?RVdmem9VWHRLRGdidlcyV1BDZ2JKZGFmMnRGUDVHazNBUEh2NEV2Yy9zWlNT?=
 =?utf-8?B?K0VMUTBwOEdVZjRCVlZ0dGJaMFhiMmhTd0M4SmtLTjA0ak1ray9mTmlBQ0Vx?=
 =?utf-8?B?dW1NQ3ptQllRRGdoby9NcVRoR2R0cElJTWt5aHNHZ3hwODduVTc2a3hZSTJs?=
 =?utf-8?B?dUJUQm0xbGhrcTJ2Q0QwaEZjZy9IR1A0dDQxSFh1bzVJbU1FWjhPeU9wbkhB?=
 =?utf-8?B?cjhGaU5uQU9yRXF3MVo4NGZ1cVhlSEN5a1E3RWJLVTdJc3V6TlZsRnhtMUUw?=
 =?utf-8?B?V2ttUm1LeEJQcjh1RW9NcmJQZ21xdy8yQTFNQU5XUnpLaWIwSDZpRVJQN25s?=
 =?utf-8?B?elljQU9iN2p6V2ZuQTYvK0FZRGd2WllXUllFK0NISEhpNUVDY1phbFptSEhr?=
 =?utf-8?B?YmVSYlZvTVZUc2FZNlhJQ0FmRFQzR1ZjRUtMWkp0RFpWaU1oU1ZPMm9KMG1u?=
 =?utf-8?B?cUZPbm91MGw2VnkwNWJnUFN0ODFZNFlpZGxkeU9UQzdBdWNxWEVBcWlhWmgw?=
 =?utf-8?B?SGxFdFhWb2pYL1VrYlAzRnhHUndBaTVNLzRGRktZYmdSZG9HZ2RBekl3L1do?=
 =?utf-8?B?OHA5WkhpZlhrYnpLZGtEUkFkNmxGbzFEOEEyT2xtanZXb0hPd2laNGFkVmYv?=
 =?utf-8?B?bHVmVE5rdUlTbUJQSzEzdDdBMC83SUtIOXFoMW9LUTZMVGxKdUdGVFM4aFV0?=
 =?utf-8?B?NGw2WWRHNHlXeXphWFYvZm5udzMvSTBpYkRWNUJxTHh0UjBwOTVNNzczdG1H?=
 =?utf-8?B?aDhkS3hpNHVNbzdyNFFVVjhiR0ZBaUNzbXJEZWNoQjlOM0laaXgwQnk1eUp4?=
 =?utf-8?B?T2Q5Rlg2bUIwSHhnV1lUMDB6czlteGRWeGdHSHVyV1FIZGkwMUE4ZjZsMDZM?=
 =?utf-8?B?dndLWWNhODVacHhVcDBObzhSRXNiWTFrNm1rQ296QVZTQitlU1Z6anlOSExa?=
 =?utf-8?B?SG5KNHVldVRyQ2JKR3U5VExOdk5rZVZPSkNPUmZSR2tUbnoyc0JGbTRHTGdU?=
 =?utf-8?B?aVF4M0xrNWY2ZGkxQ2I5OWJZYnVxTVh1QkNGdlFrYzJqQktpbVNGVWc2NWdx?=
 =?utf-8?B?MFVDVGh4SDIvVUFNUVNrRU85eklFdEF2cCtoN1M4bjdTL0dJSktPL3JXT2Yv?=
 =?utf-8?B?RzF4ekhlMXlqYy9sTTBycTl0ZzVLSStCaEljU1pQYW0vNkpZOFRuTWU3d3hC?=
 =?utf-8?B?S21oNUZpWDMrY0cwRXFsVWMrTlNQb2Jrc2I3ZWI5Ni9pUVNDc2lETVlybkU1?=
 =?utf-8?B?OHF4UUYyaFgrRG1VeDNzdnJNRDA3dmkrbEZldGZoZTFNNmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 16:17:39.7505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae56349-5476-4640-3f5c-08dcfdb55e9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9428
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 16:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206723

T24gMSBOb3YgMjAyNCwgYXQgMTA6MDgsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiAyLiBUaGUgc2Vjb25kIGlzc3VlIGlzIHNsaWdodGx5IHRyaWNraWVyLiBU
aGVyZSdzIGEgbnVtYmVyIG9mDQo+IGdlbmVyYXRlZCBjIGZpbGVzIHByb2R1Y2VkIGJ5IGN5dGhv
biBhbmQgdGhleSBjb250YWluIGxpbmVzIGxpa2U6DQo+IA0KPiBzdGF0aWMgY29uc3QgY2hhciBf
X3B5eF9rX3Nydl9zdG9yYWdlX2FsZXhfeW9jdG9fYnVpbGRfNjRbXSA9DQo+ICIvc3J2L3N0b3Jh
Z2UvYWxleC95b2N0by9idWlsZC02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3B5dGhv
bjMtbnVtcHkvMi4xLjIvbnVtcHktMi4xLjIvbnVtcHkvcmFuZG9tL2JpdF9nZW5lcmF0b3IucHl4
IjsNCj4gUHlPYmplY3QgKl9fcHl4X2twX3Nfc3J2X3N0b3JhZ2VfYWxleF95b2N0b19idWlsZF82
NDsNCj4gZXRjLg0KPiANCj4gVGhpcyBuZWVkcyB0byBiZSBmaXhlZCBieSB0cmFja2luZyBkb3du
IHdoZXJlIGluIGN5dGhvbiB0aGlzIHN0dWZmIGlzDQo+IGdlbmVyYXRlZCwgYW5kIHJlcGxhY2lu
ZyByZWFsIHBhdGhzIChvciBwYXJ0cyBvZiB0aGVtKSB3aXRoIHNvbWV0aGluZw0KPiByZXByb2R1
Y2libGUsIGxpa2UgJ3JlcHJvZHVjaWJsZV9idWlsZF9wYXRoJyBvciBzaW1pbGFyLiBUaGVuIHRo
aXMNCj4gc2hvdWxkIGJlIHN1Ym1pdHRlZCBvciByYWlzZWQgd2l0aCB1cHN0cmVhbS4NCg0KSeKA
mXZlIGp1c3QgcG9zdGVkIGEgcGF0Y2hzZXQgdGhhdCBmaXhlcyB0aGlzLiBUaGUgcGF0Y2ggaXNu
4oCZdCB5ZXQgdXBzdHJlYW1lZCBidXQgSeKAmW0gd29ya2luZyBvbiB0aGF0LCBhbmQgSSB0aGlu
ayBpbnRlZ3JhdGluZyBpdCB0byB0ZXN0IGl0IHdvdWxkIGJlIHVzZWZ1bCBkYXRhIGZvciB1cHN0
cmVhbS4NCg0KPiAzLiBXZSBzaG91bGQgYWxzbyBkcm9wDQo+ICMgUHl0aG9uIHB5eCAtPiBjIC0+
IHNvIGJ1aWxkIGxlYXZlcyBhYnNvbHV0ZSBidWlsZCBwYXRocyBpbiB0aGUgY29kZQ0KPiBJTlNB
TkVfU0tJUDoke1BOfSArPSAiYnVpbGRwYXRocyINCj4gSU5TQU5FX1NLSVA6JHtQTn0tc3JjICs9
ICJidWlsZHBhdGhzIg0KPiANCj4gZnJvbSBtZXRhL2NsYXNzZXMtcmVjaXBlL3B5dGhvbl9tZXNv
bnB5LmJiY2xhc3Mgd2hlbiBwb2ludCB0d28gaXMgYWRkcmVzc2VkLg0KDQpNeSBwYXRjaHNldCBh
bHNvIGRyb3BzIHRoYXQuDQoNClJvc3M=

