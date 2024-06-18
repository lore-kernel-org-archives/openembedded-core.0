Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756F9C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 15:38:44 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.79])
 by mx.groups.io with SMTP id smtpd.web10.89835.1718725119339077185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 08:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Q7Jr9lUi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Q7Jr9lUi;
 spf=pass (domain: arm.com, ip: 40.107.241.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ofrqranL5cf6+cG1dXgVATdsg6C9plCMfwcWgJ7N+oeDRI9yMoLH+lJZ2p5h5pVSM1A2sooUoPUs5DPGSWdl9gUhoN9RnZmvdk0+gf10XmiND6MQ0zRXsK5MGSAqy3OfahioJ25eWQ8KsKT1AqXcCy03iBsuf3UNjnL6wTSUMul4V8MkU4lg2m/cBR/I4xsDok/og2N2+0QqaqQhbdR24Ry8hHl8P0fxcju6v7uMsKkqJkzGwy4ntI6R7sTR3bfNAM1yrSrcyP6LXy+YtOxQFG3OCyMGwfg1pE8d1Kp6SYH2IG7qVWMlIbJm47cfbYggTyrvq9ghKRS1LyrXVAQXBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/zwHHr5ZG7jw0JhwK+ctc6lkUVcP2ody4aws9oNkbg=;
 b=kUR9o/AEAwC4+aT8Bz5TfnuVVZiG0TC2HPmxnXjTi7dizN7OBDI0M9fpOjiEoUkE8hppQapStVmBQjShgngSRgnKNbXBIzTs8GdHyq2t27txG2E1JKDFfPGiGvjv3RcWNucLJHmYuJ2gBdDBiiTWoZoneVRd89IvVmGTKgoAq4PitiL8OwOhv/LAuACjTxt7gG787astPuawO7SdmqYMNn0UbMMYDzF3SWEXmcqjAkU+Z6keMu87p2gjfsoFKzgiy6QtKz5BZz9eoRgbZUlcdrJPiteAWHcvJi/hBi9vQx9EdEkd/yTa8Cqj/iOP8K5FJlJdY0CVv74zr/zn3I1h8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/zwHHr5ZG7jw0JhwK+ctc6lkUVcP2ody4aws9oNkbg=;
 b=Q7Jr9lUi/0gSduXA7YptrIyikE4rJyyoZMsbfQnsXiJb0SBDNaxvP6ZZn2chVEA8yGStxwB2Fe82Nme5rB/eAsJ8Ffij3jvcOYabdDKDWmnWZ9AyfgQvvpAK6nHCbUumD2i84A/LHGCtriKVlM+LNxE0fPhsAPJUaTOljLL3cv4=
Received: from DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) by DU0PR08MB8421.eurprd08.prod.outlook.com
 (2603:10a6:10:407::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 15:38:34 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::95) by DUZPR01CA0074.outlook.office365.com
 (2603:10a6:10:3c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 15:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15 via
 Frontend Transport; Tue, 18 Jun 2024 15:38:34 +0000
Received: ("Tessian outbound 43598937069a:v339"); Tue, 18 Jun 2024 15:38:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13df198aa9ad465a
X-CR-MTA-TID: 64aa7808
Received: from a9ce5f0af9f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 61D90179-61B6-4C3E-BE44-D435541B635F.1;
	Tue, 18 Jun 2024 15:38:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a9ce5f0af9f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Jun 2024 15:38:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ7FPO5wvqJ939yMqapYwnUBei55iZtWXOFyFoxF4B5eKOTj6n8F6XvYU497jgnr3/+12unNWKPdp/+nr9SENkejrTxJ6c7rqB4Meso562xr1cHEXvOd8hDj7FeMuDqD3QH5xF5IPp4PYqfAkITwRysY8ZV8OE2iAcY4naYEWhcxdBUEJdTRkUMmqfziaBkTmq1hpIQYK9GUV1iZLObxoNfsglgf06UoDTQKEcbHXp5xiJVCW29NMmpSAKCJf+MwultHX3U440fPNzTqtLXksF7Zj1uyG1mngEq7WFGDR/5xb/rWyKqvH1qqC+q7OcEkIj4haPJHMabvjoWlrL0nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/zwHHr5ZG7jw0JhwK+ctc6lkUVcP2ody4aws9oNkbg=;
 b=OcA489UPkpVdVK0Yh9jeLmFJDp/l8pmvtYFXEeBGHfuokhroKIJkVd9IqcC0jvZZ6WtTXD7VvB09DCSH8grfnIWxbcMMouakE1rkH4EW47ihYseFy/4n9AkbaNepZtTxX4wTob/N8m6dKnlDRSCppw3hMndmrB1xP1Q7cg8SQLMNhDCd02LQs3GchYUXqrZMGUYIxKwJCBK91AdN+JIkYDNtwD3MD/O3vTGfNRydxjLE4C5HpD+dkd8X7B19Nv/wX753F2GHZIbbtFsK03LWRhZcpCjeeNfmX7ydYAMMVVURi+ENYNDrhaopWRlGUE4iyqYawPKBDf/d3ewLUS8NYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/zwHHr5ZG7jw0JhwK+ctc6lkUVcP2ody4aws9oNkbg=;
 b=Q7Jr9lUi/0gSduXA7YptrIyikE4rJyyoZMsbfQnsXiJb0SBDNaxvP6ZZn2chVEA8yGStxwB2Fe82Nme5rB/eAsJ8Ffij3jvcOYabdDKDWmnWZ9AyfgQvvpAK6nHCbUumD2i84A/LHGCtriKVlM+LNxE0fPhsAPJUaTOljLL3cv4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9104.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 15:38:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 15:38:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
CC: Marta Rybczynska <rybczynska@gmail.com>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>
Subject: Re: [yocto-security] The future of
 meta/conf/distro/include/cve-extra-exclusions.inc
Thread-Topic: [yocto-security] The future of
 meta/conf/distro/include/cve-extra-exclusions.inc
Thread-Index: AQHawYc5qzdk8xdUuE+W6vQ5UUaCXrHNkpMAgAAVbgA=
Date: Tue, 18 Jun 2024 15:38:24 +0000
Message-ID: <C300A8A7-4686-4608-A8ED-9D4D79A90447@arm.com>
References: 
 <CAApg2=Se=zVM47pFHWfMsNpKJ++L9tAbihFNkER-wS3ZadxfZg@mail.gmail.com>
 <CALqELGxucTijw35nd1-WTHdvOQkgpiTLJ6+U_ndTfmwAZnEziw@mail.gmail.com>
In-Reply-To: 
 <CALqELGxucTijw35nd1-WTHdvOQkgpiTLJ6+U_ndTfmwAZnEziw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9104:EE_|DU2PEPF0001E9C1:EE_|DU0PR08MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: a17d7657-99c0-4b3e-4d13-08dc8facb6b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cjgxZGZ4WGJQWm9VNXV1ZnZvTU1aN1FOTCs2UGFVbEl2QjZwTlZaU3dPbU0z?=
 =?utf-8?B?SVQ5SHpRMGxkVDQ4VTR5UjZrVXpRRDM0SERiN0l6Z1BRVlhickVzU2VuVE9W?=
 =?utf-8?B?YUVUOUhjdW9tSlhkVHcyL0ZwTmc0V1JTbjE3TlhkNEpHbFVsZjNFMjI3bW8z?=
 =?utf-8?B?YWRMbEwxWmVlRWxZa1VMSEdVMVc0b2tyQTlRdjNKRjFTU3pqQnhWOEY2d1J3?=
 =?utf-8?B?cEcvUStTZCtXdFZFNGc5TzdEUTlvV2l3YXVzWCtBWXJyMldTdVp3QTZRazli?=
 =?utf-8?B?UGxUWW1VYWpxYkdHZE5EZ01idDdmd0tvVHdIaU5ZNHBIdWRXTWdOQVl0NlJV?=
 =?utf-8?B?TkJUd00yd2pqbXlrU2k0bi9RRFg1TndsZWJrTzBVdTZ6WWlwdnl4SXRIaHFP?=
 =?utf-8?B?c2RxeS83V3RuYlNYV1hQcitESFFxSWRXcFl6UEJrczhFSTJHRjlPaHRuY2ZH?=
 =?utf-8?B?Sk1NUlZHazMvb3hWMCtnLzRBY2paeHAyN2VuRG9lcW9McTJnT3oySitYODdi?=
 =?utf-8?B?ZGFwUUUybEQ2NkdMSzR0NDRTRFFydUdSMGt3Qm1QVmdvUU5KSGswVGVnUWtH?=
 =?utf-8?B?KzU5RXB3YnpSeTBIT1BEQ2l3TmM0cXFkWElOUU51OCs3NERrU2VzVDd5d2hI?=
 =?utf-8?B?ejZhbGYvYVVkN2RGNERmalFWdS9YYW9TbStDQ0ViUjhnQXJSYzBTbUl2dUpv?=
 =?utf-8?B?WldXUnYyYXpvYU5JQ2t2dWdaWUxPSWtLdU8vM1d2QnlTdElhZlg1eTdUTStD?=
 =?utf-8?B?UG4rSUFsQmxoTjl5Sm9SbTZWZWUrd3lEY0M2UU1qNDVzc0xCdTBUL2MrbDhk?=
 =?utf-8?B?Ujl6L1lUWVRJOFNRYjJ4dXcwMEZWQkozelJTdTI2U1ZLc2YyNFdvcGJHNzRW?=
 =?utf-8?B?MGluVEJHQ1B3M1dhTjRucTRad2VQUHlSSGNPWmJUZzBwSXZaYTh3VGJBa3Rr?=
 =?utf-8?B?ZnZ1ZzF3aFZrSTRXcnJpVDVtWldzRE9mZFh2TDA2dXBlNk1zN3VJVFYyY09Z?=
 =?utf-8?B?U2xuQ1FjaVJidStDdUZzWVRpMFpwUVFiZEI3eDduc3NYUHZhMzJ5aU95d2pN?=
 =?utf-8?B?QmFub2tZTEZiVVBTSUJsQmlDdDZOYXV1d3liMDBZSWpPWmdaUFJreERZRklo?=
 =?utf-8?B?Q2hCb3NxSFcvQVB5ZGN0YUMrY1c4cW13bi95emdQOUJGc25Ram9FL1RvdURy?=
 =?utf-8?B?cUgycWIvby80MHV2ckhVdUNXMDU4ZEFiTTVBNUlLa3Fhb3U3ZkJvM2Q2Nm9U?=
 =?utf-8?B?NlpWZWtmaktwZkoxTHIwRTVaaDBOZzQyOUx4VnhlZDVaR2NJbjJsNXZZMWxL?=
 =?utf-8?B?K3p2dnJsQnFtRkhYcS9jaWV1MXhWZ21vVUkwdXdIMEVOQ1ZmRnBhRHVON0JR?=
 =?utf-8?B?bHUvalAySGd6bjdIVGF6cktkSnZBalI5NGk4ZnlwUXRCcjVTbUJCUm9MU0hl?=
 =?utf-8?B?eXV2VlhZc3E1d0Z1ZHVHNDFkVldOQWZOZEVXWE5BanVRaHd5RGYvR0hPOEp4?=
 =?utf-8?B?eEpaVHhWZmVacFlBc2k3RVdnbVFPYzcxS21EUlFRelZnckp2Ym1JV0MzbC9s?=
 =?utf-8?B?ci9SSDdoSW14aWw5UG5VME5JUVJJbTZZSDE0L0hYNTQybXNMS21WKzdjSVJr?=
 =?utf-8?B?U1Z0d3lVT0tQYjlDajVibCtPZm0yUFAyN3o2bURtZDlQZzQwbnI2VFdEeUtD?=
 =?utf-8?B?bCtNdXZPdk9HOTBvY0lSZ1FtT01YS3NEbWtsaTRqMXZqeEZZY1pzTTdoa3hZ?=
 =?utf-8?B?cE5SYmJvRjh5US82a1R6SmZ6eldTSlowTG9xYVIxTG5FdlZVcitJa2Y5THdk?=
 =?utf-8?Q?rCMoHxTEK0qXBFZb9w45xna+LA0RoAaGDqsfE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B1207755C87DA48B7C6585224A5BC2D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9104
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	80e91f7a-eeef-43be-6d91-08dc8facb110
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|34020700013|1800799021|36860700010|82310400023|35042699019|376011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MzNUVWJvVG5RcFlZd2FBY2l4TlpQMjRUUGFkRHc2bkl3OVI1R3JPWjRwOGFM?=
 =?utf-8?B?SmJ3VE5MNjlheW5LZUR5WlNPeUFlditlRTRGdmdQUWxYQXBIZC81NnR3WFI3?=
 =?utf-8?B?TmRLeGFNRVJLbWRBZ0ZST0hxaGN0cU5uUE9UejBhWFRVRmlZL2dQVWhYbnkr?=
 =?utf-8?B?YU5nbjk2Z3ZDQlgxSGZFeEEvT3N3bHd2dVhpbi9Pb2FSSG9MMjBOY1dka2pJ?=
 =?utf-8?B?cW5xYmtvVzEvNEw5c3dzcE1ZZ2pCeDdnL0dWNWZTMnRCRnQ1RGVJYks3aFRY?=
 =?utf-8?B?YlpjS3NKb1NMV1hWeHNVMzNvMWc1NUJsZ0dnWHM1SXVHaTd1L1QvTDhxQVBG?=
 =?utf-8?B?dnlSUElGRzdObDhSdHJsNjFwOEFuMDg1NUYwS2J3ZjJpY0wvVlNMS0poVEdM?=
 =?utf-8?B?MGFqaWR1ZkhtVXFVRWJ0bVhkRktmeXlPSGJDWWtMeFFJMUdmOTRGaDY2MzZp?=
 =?utf-8?B?clJsOTFoYTNUQzBIT0srd3JqRC9PakZjYWhYNHVmdCtoVXhIRlp3S25hNjFo?=
 =?utf-8?B?N01zcldqTkFVS09OKytKOGlsQ2hPdWh0MXBsRVdndGYyQk11M2I2UXBHU3dD?=
 =?utf-8?B?ME42Z0taTXFYY3hBdmJhekwxSENuS1g1OUFGT3dlUFdwNkFqUU5vcG10RnB6?=
 =?utf-8?B?MDNhbHFNM0NzME5zWE1PTkw1RE0wcmpzZXF6aUw2Sjd5WmtOUC8wZ0NzUXFn?=
 =?utf-8?B?aHEzakFuS3dIczJuSEM3aUdWYjA0eC9YVjl5RnhmUXk0dWhKVWZ0K1M0RFVr?=
 =?utf-8?B?RmxianBpMkswenVObGVVUm54Q2ZpTURKNU9GMlZtUEJCOHU5RGdwSnRqU3FF?=
 =?utf-8?B?ckhrODVnVWtsN3VpcDhmYjJESURMVU45OUJMZkI5SGtKOEhjOUFZVWVSdXh4?=
 =?utf-8?B?dWlHYzhXNEFGTm1mdmd0N01MRWNLQ0dYeWZJK1BHdFJ0T0xFVFV1MUZUaGZ4?=
 =?utf-8?B?QWdLR3RWUmtDcld6T0xkNlB6QUY5NzA5UHJsMXpoKzRna2c5ZEJzYWZVOG40?=
 =?utf-8?B?Njd0cDFsSysxei9wY2grUEZlWXhtcDNZalArSlJ6S0VvV0NBMEk2bVlrMFFZ?=
 =?utf-8?B?Z1ZYQis5ejlLOFg1enRqcnRTcHcxb2tFeFg3UHhXTGM4dkJsdFExYmxFK0ZB?=
 =?utf-8?B?SHB1VFVNVGZqakpBcno4ZDVQYjdodlVuNC9ycGw3djVpcGh4Yk1pcy9zczZ5?=
 =?utf-8?B?ZWtqVUpBazlodGp2dTN3dWlHQVRqTEhqUytodmJVbys4Z0NkN0wrOHVHWXFC?=
 =?utf-8?B?eURZaEg0VTlJbnM5dUQvZ2orYk9EWThjZldEelFOSUhRRHl6RjdQM09sVEFL?=
 =?utf-8?B?NDJjQTM2VDJjNEZXSXV6L3R3OENzbURaZUFsYm5OZ2JQTkNCZUcwM0p0WEFD?=
 =?utf-8?B?bTlNZXkxbWo4c1gzQUd5TzFJNWtCaFlnSHVPNTdjNmo1aFhQcUNxMkxCcG5D?=
 =?utf-8?B?M0czK3RyNVBiU3EyVEp5MWdvcDBoRDIrMnczNCtWT21yVnBDdnJQaDFXWHdq?=
 =?utf-8?B?RU5oVGxyTXpRbDRPTm9zU2kweUR1Q0kranVRd1cxOFhTaTN0VlpiTXVXU3Nt?=
 =?utf-8?B?end1RFFsZUlzLzIvT3hkdVc0aS9LSUxrQmVVck9CUW0vejZ4UEw4QzVmWW5Y?=
 =?utf-8?B?YXZ2Y3BZUXlxLzh0V2xnUmZjQ2hibHhVam9nZ0xTMy85ZFpsSkxDelVnM2Ft?=
 =?utf-8?B?RERPak9USHh1ZDRkanVsSW1ySzFGL0JDL29RZ2J4YVJmNHIzdWd0WVVUTDBn?=
 =?utf-8?B?YUhReTJXM3lXZEdmdWxrQ3E4OVBBOFJkRWJvYUtVNFM2eEN6L0xIZ1htc00z?=
 =?utf-8?B?RlBYaHZGODB3ZjVmSVhiYWFZdVA3b3dzZVFFTXhwRVBHSjBrSzlGS2JXN2dy?=
 =?utf-8?B?YytpL0cvTDFkUGpQY3g0eHlNZVVzTjk5bkI0WElHdzUrNkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(34020700013)(1800799021)(36860700010)(82310400023)(35042699019)(376011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 15:38:34.2002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17d7657-99c0-4b3e-4d13-08dc8facb6b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8421
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 15:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200877

T24gMTggSnVuIDIwMjQsIGF0IDE1OjIxLCBBbmRyZXcgTXVycmF5IDxhbXVycmF5QHRoZWdvb2Rw
ZW5ndWluLmNvLnVrPiB3cm90ZToNCj4gSSBpbnRlcnByZXQgdGhpcyBhczogd2UndmUgZGVjaWRl
ZCB0byBpZ25vcmUgc29tZSBDVkVzIGJlY2F1c2UgdGhleQ0KPiBkb24ndCBzZWVtIHBvc3NpYmxl
IHRvIHBhdGNoIGFuZCBhcmVuJ3QgcmVsZXZhbnQsIGJ1dCB3ZSByZWNvbW1lbmQNCj4gdGhhdCBv
dXIgdXNlcnMgcmV2aWV3IHRoaXMgYmVjYXVzZSB0aGVzZSBtYXkgYmUgY29udGVudGlvdXMuDQo+
IA0KPiBJIHRoaW5rIHdlIHNob3VsZCBtb3ZlIGFueSBub24tY29udGVudGlvdXMgQ1ZFcyBpZ25v
cmVzIHRvIHRoZQ0KPiByZWxldmFudCBwYWNrYWdlcywgZm9yZ2V0IGFib3V0IHRoZSByZW1haW5k
ZXIgb2YgdGhlIENWRXMgaW4gdGhlIGZpbGUsDQo+IGFuZCB0aGVuIHJldGlyZSB1c2Ugb2YgdGhl
IGZpbGUuDQoNClRoYXTigJlzIHRoZSBjb3JyZWN0IGludGVycHJldGF0aW9uLCBhbmQgSSBhZ3Jl
ZSB3aXRoIHRoYXQgcHJvcG9zYWwgdG9vLiAgTHVja2lseSB0aGVyZeKAmXMgbm90IG1hbnkgQ1ZF
cyBpbiB0aGF0IGZpbGUgbm93Lg0KDQpSb3Nz

