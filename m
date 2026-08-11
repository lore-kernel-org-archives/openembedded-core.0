Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA98C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 12:22:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52880.1786450918122264938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 05:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JMCmA99v;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JMCmA99v;
 spf=pass (domain: arm.com, ip: 52.101.66.0, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZTWZk7EtQG7Si7WMIjOeZZO0peHwk7LdKYPX/Zla0LBH62xqTeXNV0oj2wjljmeUjP4J7rdDq9QlnXbjN3HU3TgxZtWWENlcXPXyxUbvxqLUSXlarSeaXs73bqUpWgQA1T0k6qfQGTMoc95FYvErzunfWpEKKQBOt6RDLHf9HGmCu3SV1NHzucbAfrg8jvPr257D88j4etdki5DCM5gomim2FwxF7n9FL0WVayHWY/0Pf8UrtFohWD7b3kDxQ2NKKsFPLH1RXb+muEZAg0tOtS29We2peelwgrep5Y8bTykMywM2kDqYNv1Xt6dICw7FGtpNq7FctgHI3rDPMZqTUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hB+IrzKn7DpFkhdtXTpr8SHWKwHmXunyJxvuC/7AIk=;
 b=iWzUMX98UwsH5bV8AsyU/PiBx/uOrTZyA7qrnQIXoQ53KAjvHbcgy2Kjj5G1vYB0uaLDVxb4w1v4NeIga4fkrmUVOS1S/oTY4v7fACLKA22Kh1mLL+VnKyeMcXoC4cnJxUrA4bYwPMWB86ibxBo/0m0jeHJrvw/5C1cD9dAbDJuECgTzgfVfKIeI+2gMRtf37e6OQgUeSePBjWx/dwo7dLVciTWERaEX3hXrez0yyougPG6NmhHjF3SG+tg7ORmOaCaCzCntGPa4jr2ckJxbOpw4iuVjYSw0uin8ckZTIRVBBwzAe1m5DG2r4zARo6GP01xnebQnZhnmk9PxLZazPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hB+IrzKn7DpFkhdtXTpr8SHWKwHmXunyJxvuC/7AIk=;
 b=JMCmA99vwjlTHTJ/yXXZah5+pYHCFUIiEdPPIOrsV3ZciyoQXl0GoOWFIwXmEhN78F9pbECpublsnIKrvWn8TtRtoE2GrJzQB3mL5iKMetik2+7xnrDTUBkMnQvutFom9bnuIpRMV8zYitjghJSRECbuxN4V5os5wDjk5N0M0Wg=
Received: from DU6P191CA0069.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::22)
 by AS8PR08MB6694.eurprd08.prod.outlook.com (2603:10a6:20b:39e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 12:21:53 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::27) by DU6P191CA0069.outlook.office365.com
 (2603:10a6:10:53e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 12:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 12:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5G/y21VIGyBoNfphB2WD7yUcQYaoq8aPJQLW4nvvtQltHYaznUaYI0KgxVqlEhUknIPzZWCGw210Otw1pymSFjE2EMZ4z2xmEkd03zr0EF5FHhjCzMmUa4mLmYwU8oNf7HU/8cn4cfpyDuVT93VPWsHMNk1KQ20sFK1rfIF/06gQwneuVn04NY8WKCXmeRjUv0xgAc1Y6qk39qIQ2rJo7gW3RSgU/EbF/fnP7Hl3LYwMSZdEikw1iKLPRXXk4yh1PSZIbEh7E2AH8BvquRToRG7n7GBZ5ofwrj1wI808j9+0ZtGD11BJTyZS5jFE4hKo9ZmJG3N85Yc76hwBxqhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hB+IrzKn7DpFkhdtXTpr8SHWKwHmXunyJxvuC/7AIk=;
 b=E0gx127NcHR5aWMDq0p8BxQZl4cnvNGjmPAG3zaXeRaR1EHkPvfXGWz+voIg+PKt2Pl7hZp0Yp3hqjhtE0CCeyg3Ze91O7noDnJkCUdaOGb1V/idFnZ5ahUUYGYOXUfWtUPUXGZ2ZPEvn3nZMP2T2X+wkAj2pb9uLrRckZk4/7+6yTTNelzUcARe7280sOy73iRoipZ/jCo+tRBDLyAoJcv8wpcIa5s17ulTm25UZbGgktRjMnGjO+uZFtw/ah357EUh6DG7ZbcMFQKGS2NT5y6oXAqsES4KWdCVMCzO556lLtmQaCjapVV9ZhL6k7HPWNRO+7Brlnfzd8iv4YpolQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hB+IrzKn7DpFkhdtXTpr8SHWKwHmXunyJxvuC/7AIk=;
 b=JMCmA99vwjlTHTJ/yXXZah5+pYHCFUIiEdPPIOrsV3ZciyoQXl0GoOWFIwXmEhN78F9pbECpublsnIKrvWn8TtRtoE2GrJzQB3mL5iKMetik2+7xnrDTUBkMnQvutFom9bnuIpRMV8zYitjghJSRECbuxN4V5os5wDjk5N0M0Wg=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB5920.eurprd08.prod.outlook.com (2603:10a6:102:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 12:21:20 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:21:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "Harish.Sadineni@windriver.com" <Harish.Sadineni@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH] u-boot: add support for Clang toolchain
Thread-Topic: [OE-core] [PATCH] u-boot: add support for Clang toolchain
Thread-Index: AQHdKYAm6offvB+2G0aUvpUNR0V1hbaYwoiAgAACP4A=
Date: Tue, 11 Aug 2026 12:21:20 +0000
Message-ID: <58AB193A-9DA4-4BC4-BC53-94FDA2D986D4@arm.com>
References: <20260811105603.3447122-1-Harish.Sadineni@windriver.com>
 <274b9268-b499-44b7-9297-628de8facb23@cherry.de>
In-Reply-To: <274b9268-b499-44b7-9297-628de8facb23@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB5920:EE_|DU2PEPF00028D0E:EE_|AS8PR08MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b4c2cd-60b4-4316-4d20-08def7a3209e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|6133799003|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 GXTuudotUj+BA/cs9e5TyT+jeoINupWIXhzOuEa0rGFQu+bdQfIp1OQs0rOIcJmsSFJ+S/Szds57YA6+W7ExMUvSxkbJ2EzlrRT0SLhWuPCoZpui7hIBDf2mLIeXD3N60sAsgjslQGhQiKm2UDvpPvjnSUo3Z6h4w1X3n99kIAXjiO8/X3/bLtCdCTC6wdvXXg/2ukRMrf+6GiouVuj53fEB0mnEidshlWbMetzi5J4+w9YF77zsOBw3qG9r2XRSmqOqyeqb9iWH6lSSzdRB/QdceiKDVO1IuMnT24GrMvAcSGeYHspwRsyvomXkMsUlPB0raoaDB1+hdpjDx5EnRlwElT0TM00A0ym1RlWz14eTb9ysZ6Icdqp9pj5ARbnKC338kX4x7YH33AAcNIYd2+BWeRYKhSuYBTf6ziSiemSIu8RbFtSkRpyPNTYGNyTOJEmOsTLIqCBxsWT/G47gPqTcPJBu3u1pY7xquwR/X0xUGE0SOoNrQaFH+j3A47f8gUfqZXdaPrMCwUAoOLz2l9V39jnVyzb+rwW36CIJoMwf32GH96qELwVLJw5o5tfc7zSXKJirq9PJUuBu5lVKCEkZN12z34HnkPEVFcrqqLUCLiHE4uqibLWSrTomrVJpRZbYGE2XpGBA8rjEwp9I7f6uyJBkkuOtthnUyqFAkkHK5K+QldEu2vSpoUhDawq26RTMG6h+Svn6Q5edVHU2R8d3jPJhekz+l9I76aQoXtE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <22AF6BBD3AA7AD44824133CB7CC6B2B7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 oKLkvxIVVIMBiLkYLBP70H28mdmrAd6B9Gd5RL7XuFDICe0DpKMtMIhnUOucxTYKI/yeDjXPzc1b5J5HLnyRROYfxa0E6xKsYw+qEG2lDHDv8sk85MlzfriNY8HjpmbdearsqRFkFcFPxA0o61oGNIDnCRjOc7HH1cHlGpeVnKyjxDNKh4fruVVx8kqAy7uzvx0Pjhv0Oer2mXdodxNwkQ35K2n0AXZsqSrCMoCmUbgQZQgyAvYJmbfRkgMfgI71uHtVxDd1zfxdLDE1ZxEmS05wVcBfFv66e7c7zkO0KxBb/ZSla3A7KCLw80sUMtVSdk2Xp6U/lBnN62sC+gtirw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5920
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	066ce457-c035-4a17-7e77-08def7a30d08
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|14060799003|82310400026|35042699022|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1zPrwbRQDqSSWmwpQ0NnpHCmOrzhr/hRghVTx3RbH4gr2uuXSspc2mVWXtCYfT/0OGbeAZzF3yaTTLCaBrg3lkyGGkZ+6vCidmA+teeVkGD6gFYE9pH3hQHLXnS6QwwA4qQMCPXp8PXwXvcDOlUBzWBVrw6z8/OVRhhcuATjuEKNP01TJiNQHFKtTIGCxhXa3N4kLVqdcopaO5de1qac3n0/xLSQ+j9u5xbzEhJMiGosZgRMuu+RKBYZ0IT28Wi1coQ7lyHiVxuaVIU2xHgm6Lj07CFQcRhbVsfQrgNCqXaLevvaJE/3B8oHz8sboLLhnajPkFmCn3Xg0CCdAgtMOBt31kCMBj6eKMdqi5kCLEHBXEIaqgUv6RSfr+m3eoejcLkWvZuw0HTjIFCrlk1ReUCesSwDR3dG0WdrJbjIKNOXWSFOdHAWOMlPBRqWZUAwI/w8WhE3QevGuVCzLVdBFYin71Iu0D6hSXZO9ZSk2ovZuzkz1eHmPL12rgZV7y9nQGvNILRNXGw5e0+Xex7/5W+Kcx+eB4QaL50dfRKw7jpOAxMmhIF1+aXxzDV+AB8PC9wnqVQzP17M0MzcDz7jAc+E5K7TXYTpaVHVbzjSuf28qGCvkuphXYBHe5ACOo3loYscWvyEfYl0ww1443+1+xckpNi9TQOCwhhnlXbX76Tf/d96ajiZNCwqJN39k7Gg2LJMs80UsrTbakgem+g95w==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(14060799003)(82310400026)(35042699022)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9ld7Q42o1Oj3PUVqbxnkiDnd7mDf2AhOvpOT9VN6aIUecv1gZHgSIC2noq21k53QkZySkrrH9ceTtth9GQpCRusYV/Y2JdJA11ka5JiI9VukpuRi5Mz5/cEvnQcTUuZr8oO7XIYaKU/FzZMkDxQqqEocQWYiBhrOaB2Rz+eu931CDitYMeKuBVoltwzv/JNJeoGRpPBCApvosmo5I2hnaRzoybc6n8TKKjUaj/xq0ijX+ZcZ2MsQ/cSH8FGahb7g5sbweHgDbCp4dRszjQV2rDlJ1deW/rdXz3iWDY6OGL9MYT2prXHlHl+0YtSJvn9x+dgyDgPsntsHB9I/vNks+lJKBT1HEZxpLft/qst8Zbt9JZEq62ajveP1fq1jd7WvVkGe9p54WZPRQfBKfASY0OaDy+ZDp3696CWQwrTh8SYgVVhcOisWoAGEOfvYDO1Q
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:21:53.1148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b4c2cd-60b4-4316-4d20-08def7a3209e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6694
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 12:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243196

T24gMTEgQXVnIDIwMjYsIGF0IDEzOjEzLCBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPiB3cm90ZToNCj4gV2h5IG5vdCBzaW1wbHkgJHtUT09MQ0hBSU59Pw0KDQpUaGF0
IHdvdWxkIGJlIGEgYmlnIGFzc3VtcHRpb24gdGhhdCBUT09MQ0hBSU4gaXMgYWxzbyB0aGUgbmFt
ZSBvZiB0aGUgYmluYXJ5LCB3aGljaCBmYWlscyBmb3IgYW55IG5hdGl2ZSBidWlsZHMuDQoNCkJ1
dCBpdCB3b3VsZCBhbHNvIHdvcmsgaGVyZeKApg0KDQo+IEhhdmUgeW91IGNoZWNrZWQgd2UgY2Fu
IGJ1aWxkIHUtYm9vdC10b29scywgdS1ib290LXRvb2xzLW5hdGl2ZSBhbmQgbmF0aXZlc2RrLXUt
Ym9vdC10b29scyB3aXRoIGNsYW5nPw0KDQpGV0lXLCB1cHN0cmVhbSBDSSBleGVyY2lzZXMgdGhl
IGJ1aWxkIHdpdGggY2xhbmcgc28gaXQgc2hvdWxkIHdvcmsuICBPdXIgQ0kgd2lsbCBiZSBkb2lu
ZyBidWlsZCtib290IHRlc3RzIG9mIHNvbWUgY2xhbmcgYnVpbGRzIHdpdGggcWVtdS4NCg0KUm9z
cw==

