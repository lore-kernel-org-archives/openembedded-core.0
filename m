Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E31EED623
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 16:59:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.66])
 by mx.groups.io with SMTP id smtpd.web10.53076.1726160373998120171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 09:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=O70ckSMI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=O70ckSMI;
 spf=pass (domain: arm.com, ip: 40.107.20.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qgPvNJ36frI+hNwThrxVgvTTRsQWHDqkxeuLIgMuDhznvoEsxteAW/+B5HOYR3icudWM542ELsqOiaYLk0tfhIMTsyrSLX8udNTIpUrx4EdDD+7uy0IJsf2P0D/BPOSB0fOhaGJlk/f7FRxcCOEvKcZ5IUqDjhwsSwFHKSOHhYjJGyrEZXv1U50l2SNoanhNYjGBs/7abihMnM80ygEJ9vBbtpezHGqrmMa5llr5NhIBHKgzvc4m4xkC6+aTunBIGXsPO7HY258YOlQJ8D6gGLkZWWGvB44K77iFgVMxxA0Kzg+2rp/F71a4RBWRzz7gQMjpKTx5xwTp3EDidJ7o/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B4rLXGRE9FOCmPRvm1ETq0EWzoVrfqbb8qIPtVpSdk=;
 b=NyWQ552p/txvFENHG5ndxZLBH5iXm1h1bBQrp3iVcenbyUBxrQngV5lVO8T4VOinIEz8l2Gkh4FbMq+d5SSpDsYzNLq48UJxE7eBaYB6/4jjJd7CvNHSDM8am8gXdpPzh+0cNcTUmd1n1Hvm5v0TH1gQ7RGcrkDAebQhbKT5OvdUzR0CAUWV5+S2Peoe3mjJ/rxlm8WcTgfIBqF5XuJ1Vi4RyBa0lndqDU18joziEb52QpIG34zbOKGB/oZ0O9KAiMJyRZyFCtuQqbHwiXmLzKZmGrvqFae75/9ETDj4elt0GQE0ML5ZhDCS/EXk46KiwHyyPi46ZvpaOdhm/CJwow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B4rLXGRE9FOCmPRvm1ETq0EWzoVrfqbb8qIPtVpSdk=;
 b=O70ckSMIxn1N7yBevkgAVWIU/ry5fqGoZgD3+dBa4mus6onrrNA3E08Peoc+LrK2hJUGGSZ/PUewnWNm5R+cn/XOyT3XmX3MaMYVm+fN4ZcQHsdxO6f7ZGRgzZA9CGYzJfs1iPe5te6B+j7KplIa3CIjPG8xEMW9hu4AQsFdIoc=
Received: from DU2PR04CA0311.eurprd04.prod.outlook.com (2603:10a6:10:2b5::16)
 by AS8PR08MB9719.eurprd08.prod.outlook.com (2603:10a6:20b:615::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 12 Sep
 2024 16:59:28 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::97) by DU2PR04CA0311.outlook.office365.com
 (2603:10a6:10:2b5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Thu, 12 Sep 2024 16:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 12 Sep 2024 16:59:27 +0000
Received: ("Tessian outbound 7047db86dc93:v441"); Thu, 12 Sep 2024 16:59:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38dec5f870246dca
X-CR-MTA-TID: 64aa7808
Received: from L213cdfa15712.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8BF08D62-E198-4A8A-886A-DACEB7F9E98A.1;
	Thu, 12 Sep 2024 16:59:20 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L213cdfa15712.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Sep 2024 16:59:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8GH9V6GU5Vv8hT2gpXrrsjCEozxWWO2muY2YvwYOwpNMep9rt8iGbgxca/6s3De5gYoR9aVc+0PDLW/64VXwV7oxKkWSYB5iif6KKCEHXS6Sh8sCn1A87LAZXlsRptGEOzpMj1R69uJRu8tkrFdV7f9ZE2k3OcM04/xwT9iJJamz+H2qItUgI4XkXYwgwOXyVzU0d+xJrZferfljcR5iadALLf8VRBa2HFTJeS/nJyKz2Oy7qQkwlUUAsohpOBj4MYIFuDr0NXdw3gE+jPAL5gQEFCwxIzApWgrK52BVzArX4/YpXaZ61Zmbs4D4PCyk91fwr4FmDfoqVbRljO1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B4rLXGRE9FOCmPRvm1ETq0EWzoVrfqbb8qIPtVpSdk=;
 b=lhz4IrfqQMnc5iYMeXD/qv5wFia+w1LMvNyVrxUS980se+EebfvIuUVsrToVlMLBGcD7vfN4l8Pwp53+2JcOYrcHKxdy21ckPJMsQk32WdxGedVn2Iwx/dRGXClTBKHTkkcj+WgoNDD3or5XUjxhtDi8yyBinei0vVBjIzdfJpAsRiVLmq33mQx81rtz41y1Bep++EWvXmlHeHCai+pvNlPCKYT4tgVIMsVAr1S7dVxkwCTS4/6azp+sM94PlAKtj+JFh+PLvQ2sTZPROq9/tVtsPPw58f41Amxg83nCsn8m6mVYGZU1T1VoJkNSuNaaoSAEzf9B6+TQrg3pou5KXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B4rLXGRE9FOCmPRvm1ETq0EWzoVrfqbb8qIPtVpSdk=;
 b=O70ckSMIxn1N7yBevkgAVWIU/ry5fqGoZgD3+dBa4mus6onrrNA3E08Peoc+LrK2hJUGGSZ/PUewnWNm5R+cn/XOyT3XmX3MaMYVm+fN4ZcQHsdxO6f7ZGRgzZA9CGYzJfs1iPe5te6B+j7KplIa3CIjPG8xEMW9hu4AQsFdIoc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8465.eurprd08.prod.outlook.com (2603:10a6:20b:569::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.15; Thu, 12 Sep
 2024 16:59:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7962.014; Thu, 12 Sep 2024
 16:59:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sanity: check for working user namespaces
Thread-Topic: [OE-core] [PATCH] sanity: check for working user namespaces
Thread-Index: AQHbBTTqtFkQSUQE+k+aEcpYynnOFrJUX7yA
Date: Thu, 12 Sep 2024 16:59:15 +0000
Message-ID: <64B7E637-6165-4267-A45E-470A16DE53C1@arm.com>
References: <20240912165736.1531460-1-ross.burton@arm.com>
In-Reply-To: <20240912165736.1531460-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8465:EE_|DB5PEPF00014B91:EE_|AS8PR08MB9719:EE_
X-MS-Office365-Filtering-Correlation-Id: 6487cfbd-5e2d-4b43-6709-08dcd34c434e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UTVVZWJ6MVY5c2NoQllLWklUd3FzV1pRNDUxYmxsZ0JwY0VITkNzcU1XYjBI?=
 =?utf-8?B?RlNMak1UaVAwMU43K3ZzWHhqcUlhendUSWhYWnlZZnZJS0diTXRBSU10YWky?=
 =?utf-8?B?VE52RjZpb3VKcnZpUHdnaTdyMkx2dEcxcEdibmtkc1VtR3pWalVqTXBuOGky?=
 =?utf-8?B?MnNYcE4reVRiMjBaZXc1YVJNUzhhbUp5eDh0anl0WlZXOVpoa0JoZ0hXdURT?=
 =?utf-8?B?SHNRZXJLa3N6SDIzSGJzNi9yQzBEWEpRWkVQWTI0QlhuemhHK0xxaVpvN0FX?=
 =?utf-8?B?T3lhSHJMRTBJVGUzOGkxM09wVWpYYWR2UFhQTTZiT3RpbWNFd1BmcDNJY2Z2?=
 =?utf-8?B?TGdaTEplNnFuZzgvYVphUUJ0VzE1Lzh0L2R1ako5aHErKzhuSnNnU1pyTE5l?=
 =?utf-8?B?ejcwUm1CRW96K1RrZ0d4dkZoMjVCdkI0V3FSSXU1STJQbFJYbXZVR0NuSVRS?=
 =?utf-8?B?dnFEQzV1cVhNN29LOWsyUHRYOTA3Szl5dGpKd3oweTVKYVBkak45SGZrYWNG?=
 =?utf-8?B?OHZ4WXN0U1dUczVjdjJmSTI2czVPd1Bid3JhdklsMzNzT1NPS0xEQXdlZlJI?=
 =?utf-8?B?aWo3MXFkQmxpeU1SK3lMcEJueHFXNndRbU0yWkgzdHcwTVZ2YkJ3L0RmUTF4?=
 =?utf-8?B?bmZETnZweWdXSjdxV3RMK1V1V2FsNFlkNEV1eE9ZZlNzTDRTeUJZODYvUFpD?=
 =?utf-8?B?K3VhTXVxaDQwekhEV25MMTNPRmphU2dOTzJtTXNWbko2UG1oOCtudUk4RytU?=
 =?utf-8?B?S1kzeUVvTjFuMzczQkc5TmIxQk0rbWJ5MG9jbW9xQ2hwS0N4d2c4cE9kYng5?=
 =?utf-8?B?Wmc3N1BVUHFQQUc5cVdabjVKOHZ3cS9RSW9QK3NROVdPZFQydnUwOGdrbDJS?=
 =?utf-8?B?UUpNUXVkR05qQ3VIelJQSmxDTmZQdjI4cVhhc3J6WEhIN2tveUFTa0pPZVJq?=
 =?utf-8?B?UEdKd3RINGVzcXQ1VmRDYncrZ1phVFIzM0NvWVhENTgyVGsxbFpLZE9Ic0dx?=
 =?utf-8?B?VE9hUHFuaUdDSHI0dmJURmZKS1AyWHpDNmZ2SHdDb2VKT0dqdWNiNkNrNnN3?=
 =?utf-8?B?TjREVEV3RUpYeFFwODU3cVhXQjRYWGNqakg0b3U2OS9CMlplRHBrVDhiQm5N?=
 =?utf-8?B?UHNiUFV5UEZDeE5BTy9heVlLZW1Rc3lYTG9VK2NFQmt6Um5FVlJ5d0lJVm44?=
 =?utf-8?B?MDBXd0lYL2JNUERMWmMxb2M1RkpLS2hYTTlBL0h3dFYwMXpsdnE4akdlUFI1?=
 =?utf-8?B?RXVwWk1QSkp6b2dLUHZBeDhnN3ZxMDYxalhxd3VxS21RRzdKWnVmVTZPQTJx?=
 =?utf-8?B?SldvRVlOYTRjVnNsRGpzeHQ0SFVjcyt4Ykc2QjJXYyt0U1pwWEkzSGF3MW8x?=
 =?utf-8?B?YVhsWjNYOFdOOFpOWHduSFNUVC9ZVk0ybE9hVFpsbzV1S3poWFJBNTluRUs5?=
 =?utf-8?B?cXZQVzltNWg1U0E4Vk9pVjhTd09EeVdibWNXelJaRE5FTktybWNYYXU5Und2?=
 =?utf-8?B?TG8rdzR5MTU1SmRBRmJmeUFqVE5iSDh5TUxpUzdCa0JBZlhXSmoyVXZ3Ykt6?=
 =?utf-8?B?RlQ5NGs2RzcrT0ROakNxd3JGeVhOQnIrYUI1VmxsOEppTTd2a2UxZW91SWs0?=
 =?utf-8?B?dDdIcW9YWXFqV0IyK2VERkoxMGp1VnFQVXlEK25oZmNFY0hsajlJYUNmKyti?=
 =?utf-8?B?ZzNwdGhMK3RIZ3F5SmtJemVoN2ZBMHF5TytBQVZjbmVYNkdXSTRXRjU5NFdS?=
 =?utf-8?B?US8xa09ycHQzeDJVRlhZVzI1OWwyOHFHMktZZ2tFWVJYYzZ5WXUrQmtDRGNF?=
 =?utf-8?Q?xfJNhn624rc+1sO9jmrUQl1sMvAdTX6NmB+lc=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAD2703BF1E60048886D0884A3ADF86E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b81f1e3f-0a31-49cf-6b5c-08dcd34c3c22
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|35042699022|82310400026|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aW40QWtidjA4cUVscTJnVXhrdnhKVjVaQmlBY1E1WWJBY3A5TE83UW5TaFN6?=
 =?utf-8?B?aWp0R3VsTjloN3J5Qzh2UkZ1TXdOQ2h6d2kydXJJc3diYnBnWWNkL3Y5ZytP?=
 =?utf-8?B?ZHhwN1lJdFJXTHpDUkZOWGJreTh4ZXBhanlqZEJ4WlYrVzlVN050aXRtT01j?=
 =?utf-8?B?eXY3TzFxd3ZiSlZQb3N0V1RvbGtWYVdWQ0RjZUt0SlBuN1VqUVMzMmV2WTlP?=
 =?utf-8?B?bjcvOXI1bk5YdDQ4T0dRcEVJeFRPQWRJaHNBQmx6ZjRZSHJPQlpyR0pBNUJV?=
 =?utf-8?B?dU02S0srQ0lNc3E2NlQyVFlKaGpjSU9aaU14dkhoZEtGaEtQZEI2M2QwZDY3?=
 =?utf-8?B?WFVxUkNOM0JnbWd1RFZaWGlBM3ZpUGU0cE9GZjU1WlowZGhVcHQzSDc5dDk4?=
 =?utf-8?B?Y01jNHZYV3ZaMVU4Z1JGSDVTL1NPcHRvaXU4WDVRQVNGWG9JZkZzQU9XK2RK?=
 =?utf-8?B?WmhNT3d2STZTeU9KOGV4NUtzYjFYQy85TURnOFpOOG5zbWVZRjcyeGZ4QWgv?=
 =?utf-8?B?UG5Pd3FWYlYvTEkvUGVad0c0dXJ4QnlMdU9BL1Z5VUhPQnVjM2dqVnNKbzF4?=
 =?utf-8?B?NG9jLzI4eGtaV3doam1lMDVvSUtDbndzY0FlTjU2MDZHYkNtM2V1K2RHSkNZ?=
 =?utf-8?B?M0VyWnRzMWozSFBTTlI1aW1oZktzOVBlZmxZREJHZjlrOHBXTExaT0x2Nk9s?=
 =?utf-8?B?c1dsQ1RoMGpvUzRRYkxRb1NpalMzc2xTcEM2VFZnKzh2Q1M4UklHTDZZVytE?=
 =?utf-8?B?NFlxS3VibGN3cFFac3loeFlmRTJyZGtJOFV6bVR4SzdLQmtOMlBFSEU2VXhD?=
 =?utf-8?B?ZWJOa00wTXBjYjc1MVpYUUFEMzZ2a3pFeGlEMlhsb2k3VVNveXBBVjlEMENS?=
 =?utf-8?B?ZWFkaHBvR1ZLNk01ZUpwNmVwakpUblBNRkF5QWN4REtCT3p4L3FYWEwxZmFU?=
 =?utf-8?B?bHYxOUNOUEtUaEdNdjFyaFcweXRxdjliS1lLNGgzbTR0SDl1eFhaUGJlM3Bx?=
 =?utf-8?B?SVZmYlMzYnR2NDE4ME9iNUg2T2IwZnU5NnJockhkK2ZXb2M4YlJ4NjBxUUp6?=
 =?utf-8?B?QlI5UnBKNWpHdi9zZXlCdUpEYWJpQXk1Q1dhbEZSWTZoUUJHQ1BKbXZQdVIw?=
 =?utf-8?B?RGlSOWhzUUNCTFFTSHhKMmQ4KzRRd0hGRlR1ZnJkMGY3NS9pbFQ4b3c3dDJr?=
 =?utf-8?B?TEFxR2s4V3pvcXdNaTU3emFqeVpZbCs2cm9DRExPWW9nUTdHSWJhcEhTcUlH?=
 =?utf-8?B?VGdkbXpsajM0RGtOeHJmZk4wOVJLR0RNRitBMll0VEtUL1ZVQjhBb3dvMGxZ?=
 =?utf-8?B?V01aUnZwdFNrWXBEdWcvOE9yNDFCR0xBdFR0MExvQktjV2ZVYkdqb0RkZitO?=
 =?utf-8?B?SnJFWkhGTXhodkRvTHdxakx5eFNJOGliN2x4Q0ZWbjJ2WlFPREhNamtPeTdI?=
 =?utf-8?B?ZUpTNU9jTnRid0R3QTQyVHkvb1pFcHc1TC9lVzczOGsvZ1l0ZXg4dVQ5TTNr?=
 =?utf-8?B?SmsyMjlwQnZmb3lwRHQ3UXZxTlk1NHN6cHdKcDFidXVtVFNMUlFnRW5RY0x6?=
 =?utf-8?B?RUxvZkRWVHRzOTNhNlQzL1NMK2VyNHhDdFpLWTMxRnFYUUFhSHZXZ0NVMUZC?=
 =?utf-8?B?ZWlIZ2x4aXdHanZ2bXRRakdqdUdCSEk0QVlwTGQxUHhKY045SWtJNVBZMGs3?=
 =?utf-8?B?NTUybTdkbDM2N3g2QWd5UmxXeDY2c3ZaNW9tOUJMeUNDRmFDTzdmdWxwNHA1?=
 =?utf-8?B?ZGE3SFczdFIyN3gxSnpRWUVOMHlxRmVzd3drcE5FT01kL2NPSW12K3ZRMDNx?=
 =?utf-8?B?dUJHVWk5RXZyRFhOTmkrMEtNQUZSMWVXeG5ETE4rb3NYRExQOXIrdkU2TG42?=
 =?utf-8?B?czlGSmtrdUZwcEZobGVFWEJ1aG92aDFIeS9xcHJucUFISVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(35042699022)(82310400026)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 16:59:27.9485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6487cfbd-5e2d-4b43-6709-08dcd34c434e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204450

Tm90ZSB0aGF0IGluIGl0cyBmaW5hbCBmb3JtIHRoaXMgaXNu4oCZdCBoYWQgYW55IHRlc3Rpbmcg
b24gYW4gVWJ1bnR1IG1hY2hpbmUsIHNvIHRlc3Rpbmcgd291bGQgYmUgYXBwcmVjaWF0ZWQgaWYg
YW55b25lIGhhcyBhbiBVYnVudHUgMjQueCBtYWNoaW5lIChub3QgYSBjb250YWluZXIsIG5lZWQg
dGhlaXIga2VybmVsKSB3aXRoIGFwcGFybW9yIGVuYWJsZWQuDQoNClRoYW5rcywNClJvc3MNCg0K
PiBPbiAxMiBTZXAgMjAyNCwgYXQgMTc6NTcsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gSWYgdXNlciBuYW1lc3BhY2VzIGFyZSBub3QgYXZhaWxhYmxlICh0eXBpY2Fs
bHkgYmVjYXVzZSBBcHBBcm1vciBpcw0KPiBibG9ja2luZyB0aGVtKSwgYWxlcnQgdGhlIHVzZXIu
DQo+IA0KPiBXZSBjb25zaWRlciBuZXR3b3JrIGlzb2xhdGlvbiBzdWZmaWNpZW50bHkgaW1wb3J0
YW50IHRoYXQgdGhpcyBpcyBhIGZhdGFsDQo+IGVycm9yLCBhbmQgdGhlIHVzZXIgd2lsbCBuZWVk
IHRvIGNvbmZpZ3VyZSBBcHBBcm1vciB0byBhbGxvdyBiaXRiYWtlIHRvDQo+IGNyZWF0ZSBhIHVz
ZXIgbmFtZXNwYWNlLg0KPiANCj4gWyBZT0NUTyAjMTU1OTIgXQ0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+IC0tLQ0KPiBtZXRhL2NsYXNz
ZXMtZ2xvYmFsL3Nhbml0eS5iYmNsYXNzIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrDQo+
IDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0
YS9jbGFzc2VzLWdsb2JhbC9zYW5pdHkuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvc2Fu
aXR5LmJiY2xhc3MNCj4gaW5kZXggMWQyNDJmMGYwYTAuLjcyZGFiMGZlYTJiIDEwMDY0NA0KPiAt
LS0gYS9tZXRhL2NsYXNzZXMtZ2xvYmFsL3Nhbml0eS5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xh
c3Nlcy1nbG9iYWwvc2FuaXR5LmJiY2xhc3MNCj4gQEAgLTQ3NSw2ICs0NzUsMjkgQEAgZGVmIGNo
ZWNrX3dzbChkKToNCj4gICAgICAgICAgICAgYmIud2FybigiWW91IGFyZSBydW5uaW5nIGJpdGJh
a2UgdW5kZXIgV1NMdjIsIHRoaXMgd29ya3MgcHJvcGVybHkgYnV0IHlvdSBzaG91bGQgb3B0aW1p
emUgeW91ciBWSERYIGZpbGUgZXZlbnR1YWxseSB0byBhdm9pZCBydW5uaW5nIG91dCBvZiBzdG9y
YWdlIHNwYWNlIikNCj4gICAgIHJldHVybiBOb25lDQo+IA0KPiArZGVmIGNoZWNrX3VzZXJucygp
Og0KPiArICAgICIiIg0KPiArICAgIENoZWNrIHRoYXQgdXNlciBuYW1lc3BhY2VzIGFyZSBmdW5j
dGlvbmFsLCBhcyB0aGV5J3JlIHVzZWQgZm9yIG5ldHdvcmsgaXNvbGF0aW9uLg0KPiArICAgICIi
Ig0KPiArDQo+ICsgICAgIyBUaGVyZSBpcyBhIGtub3duIGZhaWx1cmUgY2FzZSB3aXRoIEFwcEFt
cm1vciB3aGVyZSB0aGUgdW5zaGFyZSgpIGNhbGwNCj4gKyAgICAjIHN1Y2NlZWRzIChhdCB3aGlj
aCBwb2ludCB0aGUgdWlkIGlzIG5vYm9keSkgYnV0IHdyaXRpbmcgdG8gdGhlIHVpZF9tYXANCj4g
KyAgICAjIGZhaWxzIChzbyB0aGUgdWlkIGlzbid0IHJlc2V0IGJhY2sgdG8gdGhlIHVzZXIncyB1
aWQpLiBXZSBjYW4gZGV0ZWN0IHRoaXMuDQo+ICsgICAgcGFyZW50dWlkID0gb3MuZ2V0dWlkKCkN
Cj4gKyAgICBwaWQgPSBvcy5mb3JrKCkNCj4gKyAgICBpZiBub3QgcGlkOg0KPiArICAgICAgICB0
cnk6DQo+ICsgICAgICAgICAgICBiYi51dGlscy5kaXNhYmxlX25ldHdvcmsoKQ0KPiArICAgICAg
ICBleGNlcHQ6DQo+ICsgICAgICAgICAgICBwYXNzDQo+ICsgICAgICAgIG9zLl9leGl0KHBhcmVu
dHVpZCAhPSBvcy5nZXR1aWQoKSkNCj4gKw0KPiArICAgIHJldCA9IG9zLndhaXRwaWQocGlkLCAw
KVsxXQ0KPiArICAgIGlmIHJldDoNCj4gKyAgICAgICAgYmIuZmF0YWwoIlVzZXIgbmFtZXNwYWNl
cyBhcmUgbm90IHVzYWJsZSBieSBCaXRCYWtlLCBwb3NzaWJseSBkdWUgdG8gQXBwQXJtb3IuXG4i
DQo+ICsgICAgICAgICAgICAgICAgICJTZWUgaHR0cHM6Ly9kaXNjb3Vyc2UudWJ1bnR1LmNvbS90
L3VidW50dS0yNC0wNC1sdHMtbm9ibGUtbnVtYmF0LXJlbGVhc2Utbm90ZXMvMzk4OTAjdW5wcml2
aWxlZ2VkLXVzZXItbmFtZXNwYWNlLXJlc3RyaWN0aW9ucyBmb3IgbW9yZSBpbmZvcm1hdGlvbi4i
KQ0KPiArDQo+ICsNCj4gIyBSZXF1aXJlIGF0IGxlYXN0IGdjYyB2ZXJzaW9uIDguMA0KPiAjDQo+
ICMgVGhpcyBjYW4gYmUgZml4ZWQgb24gQ2VudE9TLTcgd2l0aCBkZXZ0b29sc2V0LTYrDQo+IEBA
IC02NDEsNiArNjY0LDcgQEAgZGVmIGNoZWNrX3Nhbml0eV92ZXJzaW9uX2NoYW5nZShzdGF0dXMs
IGQpOg0KPiAgICAgc3RhdHVzLmFkZHJlc3VsdChjaGVja19naXRfdmVyc2lvbihkKSkNCj4gICAg
IHN0YXR1cy5hZGRyZXN1bHQoY2hlY2tfcGVybF9tb2R1bGVzKGQpKQ0KPiAgICAgc3RhdHVzLmFk
ZHJlc3VsdChjaGVja193c2woZCkpDQo+ICsgICAgc3RhdHVzLmFkZHJlc3VsdChjaGVja191c2Vy
bnMoKSkNCj4gDQo+ICAgICBtaXNzaW5nID0gIiINCj4gDQo+IC0tIA0KPiAyLjM0LjENCj4gDQo+
IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1l
c3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMDQ0NDkp
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNz
YWdlLzIwNDQ0OQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tdC8xMDg0MTY5NzcvNjg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNv
cmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVy
dG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

