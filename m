Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965ACC3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 11:12:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web10.5554.1722856329236959231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 04:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UEcYoN/W;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UEcYoN/W;
 spf=pass (domain: arm.com, ip: 40.107.21.76, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JJzx9P5HZr6+7KGS0XBbG76v8s6QDlZgC0XFVHFj7qaDRH1IMVHpVNyDH5GPHlU2p2QAZ4hti6oDl6t89RFJ2s6g40sBKKNdKKH35lwwpiZPEBasV9/cOaw3v1Era5K4xSqiiWqwhm4wB0PbXUUfae1KRWJSpyat+75GPTC+Th7ZLur3V90+6ePhNXTMtx2/2dzD63DiOzQd2Y5SRwlntwIW/X5kk41VurzoWBeh9DqLbl+yku74JI4QxW8RpEHzSFs9sXRAqY5QsCgkhVFS+UUsXlDV0HvuQcaT0AVlLq3cYMmGAtprwN3hGEXU6odD+C4LGnXwb+r5cRyekbjftw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZFMl/EOE4ObjrC//0FsvAkgoZxhtjg/zi292CIOyf8=;
 b=fP3iDmsytfz/xLEwWRXTB7fPhfmF6OOxWi9SIme4QtTZVbwKHOocZ+0AvZF9rdY0O4maHYRpFZ/QHC93pbnXJ0JGoJfPR0TPtC3g+6qU8uQTsiODOlGEegjLbWudY/APxY6bhTOoJPunF7OSMfW7navjXzzPvqlsgzIpce65Ehjwt2ocGV2aWZhzvUUX4cfKODxZEj21xeFran9eCkVV7PqviOMnxY7nf34Mz4AjQiH57pUaG3JZhhDodiQo8TRblsgVACRHgpzAF/2GNWnWtgwsvF+WdQUawskZ/4u88ozAjELVvE7Pz3Vc5obDwrL+gU9L89Vc5mz7d3AS9awlFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZFMl/EOE4ObjrC//0FsvAkgoZxhtjg/zi292CIOyf8=;
 b=UEcYoN/W6x5eoGYLf4kbZ0o1Kl4XCNikCwycETCC0JQQ3hW7LOSNlNklW+TcdYkoHI6zglTPjivrokISBPNmAbTvQmPIar3xFowLiRjTPgnbtzE0r0PCqiHm+CqYPnBOD4u67hxXMhxL7jCHJdkwkzm18H01kf+VX8dUboCxBv0=
Received: from DU7P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::9) by
 DB3PR08MB9898.eurprd08.prod.outlook.com (2603:10a6:10:434::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.25; Mon, 5 Aug 2024 11:12:00 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::11) by DU7P189CA0003.outlook.office365.com
 (2603:10a6:10:552::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Mon, 5 Aug 2024 11:12:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19
 via Frontend Transport; Mon, 5 Aug 2024 11:12:00 +0000
Received: ("Tessian outbound 5d408e9476c7:v365"); Mon, 05 Aug 2024 11:12:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00033448801859ed
X-CR-MTA-TID: 64aa7808
Received: from L43d903421367.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 49D6F99C-3117-4A29-9EFC-88FC988348B5.1;
	Mon, 05 Aug 2024 11:11:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L43d903421367.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Aug 2024 11:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5vkTtBNI6jVfAx9PnFahzp7XhB+IwXUns7YtBZwOVW+U3Pu3QybCuKwUR7yanlSGhRaujQLUIk4s3t/tcRVi/mklpiFH02f5XbVsBSuScsZFHpVP3tJJSEMzd1XQMJqxCmtgwKEltBj9Au8huutLDra57aEPBI9kfRot9BDDX/KaQqgZZXe0dU8tx0N4ihxV/xYjDn6XOYL4bIKga9PtIATvbcC8cBxgI/pn+42HPfDeUs4lyvKDW3aEiIHfXPWH0U0GZSsVOWAdVx0ggCxQRGgD2YBShuMShGJH+9EHrnXl9uh3zVDi9ftlTyMZNsi+6IyjlBoFbGiv7P3y1tWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZFMl/EOE4ObjrC//0FsvAkgoZxhtjg/zi292CIOyf8=;
 b=k4LfRhdLqc2bkQklnmXNB8Aib1SsnY9F0Eij827sKVUS570BUfuaI9dJzaLYX4MyS44hNg2u+G0ayMIXcIiAbkFJ7Ly/TSXpG+r5jhOrMAx1MpIz3gnbRIGyMrTUokKvSIcO6ZqhIW5+wltyA16D6Xa7Gu66TlQbZzA3rl2dGISGPRI12nAyBjki60e5QfOt0BLWDkRdEN9LuqOOlCTwMKZRT+B8OOQ4rBePZc7WOVEke5QG6NnWnUEjCDEUz8OZXFkGk169yUI6vq2zRCuvofA44dtl7DoH3k9KZy+WVw083GBG8xKNjxvyWxNt/bQE1TJIqhcmKxnl2fEEimiTvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZFMl/EOE4ObjrC//0FsvAkgoZxhtjg/zi292CIOyf8=;
 b=UEcYoN/W6x5eoGYLf4kbZ0o1Kl4XCNikCwycETCC0JQQ3hW7LOSNlNklW+TcdYkoHI6zglTPjivrokISBPNmAbTvQmPIar3xFowLiRjTPgnbtzE0r0PCqiHm+CqYPnBOD4u67hxXMhxL7jCHJdkwkzm18H01kf+VX8dUboCxBv0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7843.eurprd08.prod.outlook.com (2603:10a6:10:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 11:11:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 11:11:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "robert.joslyn@redrectangle.org" <robert.joslyn@redrectangle.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] curl: Update to 8.9.1
Thread-Topic: [OE-core] [PATCH] curl: Update to 8.9.1
Thread-Index: AQHa5hABwr/gGo7yQkygOrBh7FnjJrIYhFsA
Date: Mon, 5 Aug 2024 11:11:49 +0000
Message-ID: <26DDACCB-5F5D-4BD5-ADC3-C8622AD8F7CC@arm.com>
References: <20240804014447.2463258-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20240804014447.2463258-1-robert.joslyn@redrectangle.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7843:EE_|DU2PEPF00028D11:EE_|DB3PR08MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e2d198-5dc9-4c5b-8148-08dcb53f6d66
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZEZodmZIT0RtRlNxUGFscGNEREw4NHR6SGtXWmRsYWw1Q0lWczVSYlhnMEJW?=
 =?utf-8?B?bVNiT2VVeFRIUWRGeURvd0lCa1IyUlVyQ09MdGdtWUtEN21qd2E0dlBiOWs1?=
 =?utf-8?B?VnIvSmRNOEx5bCtPOUdJSU1TQ24zZC9rR2RvWG53WGM1Tll2Ui9IMGV4WktN?=
 =?utf-8?B?RFpmTVpJSzNraUE4ZGlNVzlMNkdwdVNQSzJ6TUZtRTJTRmJjNktIQTBIQkda?=
 =?utf-8?B?SmVnQWI2M2M1Z3ByY1dVandXUXpnTUZISVVVclFMeGFReVNOMGNNNnIwSW5C?=
 =?utf-8?B?Um8vY0ZBZXBKYjBqWnVuSlBsSmV2UXlVT2JKZHYyZXRQUWE0L1dTZWdhRCtH?=
 =?utf-8?B?V1plb1FsREh4WngydWh0V25XazdBMWpRVmZsZjhaaXI4TVZOK2xhN05vMzl0?=
 =?utf-8?B?eTB2dEhQeUhMY3ZKd3ZYcXV6SmVSSXV3THlOMkw2MUxNYjh3QnBMYnJpUTJU?=
 =?utf-8?B?djRXRTVHaTFqdzE2eXlTQU9HWXVOYmpsVzVVZFA3QjY4WlNMYzNsclpkRjdL?=
 =?utf-8?B?MmwwMUpJQVQ0c0R2OHZJOGt4OFdlVnh1SkNxZForWW5keElFS1pFL0t6L3Vn?=
 =?utf-8?B?MFVTRTdDb3B0MWduTWVVZmFDanYzR20yV3hIMlNJSUNmMjZBaXpwQUNLNHFT?=
 =?utf-8?B?QmhKYXJPYmFrRlcyWG5WMCtaYWw0cXdJQmZsSnhlNENuMWlQSUx3R0d3TVlw?=
 =?utf-8?B?NUdrT2JPZ3R5blcrVnd6QjA0OTkzVDJIblozT2hRRkZNSmdISlB1YVduYmRn?=
 =?utf-8?B?MGt0S2FpNVhrU1NyWVJod3NHNFliSnNtNVpVMzNCZndLRWxiTW9MN0pRT3NN?=
 =?utf-8?B?WEloUldmRlRpWHYxQU90cXBGUVYvNWNiQnliZWFBTzFORFp2Nkhab0s0VXFL?=
 =?utf-8?B?RjFpaVJSVkhRSXFYVzV5anA3UEtZQ3VmS1BsRlQ2TzVPc2M2MGk4YmNwZXhZ?=
 =?utf-8?B?QXBqall1bC90ZXVTMG9lMFQ1d21BRXBNYmJUdndETUxSTVQ0MXorK3FYOTdE?=
 =?utf-8?B?TzdURnZUVVZ6Q1dxYi9jVEluWGgxSUE4TndkQ2lKdjQ5M1V5aTRuRlJyYWRY?=
 =?utf-8?B?NnhmUnc3MTlzd2RJVzVGZVF1SnRlR2MxbzBqckgxbmlRcDNxQmt1aVpqRllu?=
 =?utf-8?B?T2lNSFcwMXQ1dmErc3FqYXpsUTczM3JHOUtMaWtNWnViWDg3cDJmWnp5NVhG?=
 =?utf-8?B?bUIrV1ZJMGt1ZmQ0UlpmWEJJUCt3TWxsaUxxQkh6eUlDZHhVK2VORjhtR0NI?=
 =?utf-8?B?MFhYUFIzWkxKREJxd1pCLzZ2elNsUllhaHErYmNQMUdGSlRGZEphM2ZHcm9U?=
 =?utf-8?B?eGxrR2lGaml4Q3ExV3NySGtVNW0xRTU2RGRXNlZvVjJHR3BtbkNML2l1Y0pV?=
 =?utf-8?B?QjIrRzIrV1FXTHAvMzBkQkttNHJEUmQzQmdzSEhMZjRoYVFuc0t4ZG1OUEJD?=
 =?utf-8?B?OTlNbjdYTlQyTE40NVBjZTVJcUMza2h6YjVBS2FsRHg4SzYrc3NKbTMyWmZv?=
 =?utf-8?B?ckNxeXpid2U3QVBUcVp4NUVVU3F0ejJBdDg2ZGZDeHhsOURXTkVKcTd5TDRw?=
 =?utf-8?B?UktzaDNDVk1STTdRMkE4cEhyK3daQUU4enpaVzd1YUZyeVozeFdyb0lDbEcr?=
 =?utf-8?B?a2xITTZTWHBPbDVtM05INUp6QVR2NW1lL0VnNlBVZmppKzYvKzJGdTh0eHBT?=
 =?utf-8?B?a1lYODFGaGpiRmQycUNWNU9IT3UwNjJEbUZTT2JXSDB4YUpOcnkwV1d2QXBj?=
 =?utf-8?B?YVJxZUUvTm9lNEYvSVRkc3A3VlhqRmRLRzlOSDBiSmlHdGdPWENzQXdWUVFO?=
 =?utf-8?Q?GB8YkLPDTCBW8iTyJyry3cHl6vubaceByLBPU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1705FF7FE117E4E973724D75236FBB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7843
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f37bafa8-64dc-43bb-8548-08dcb53f66c9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|82310400026|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZDE4YkFRaVZmQ3pLYjZOUWlGaTBPdGhFZFFkSG9ZdFVHR2t0OUkzVmFrSlBP?=
 =?utf-8?B?ZDJPTTFyNnl4WGRPQ0VuRjVMNjFGeGFMRWtxUVB6ZkRTYkk5VzVVbnd6NTRD?=
 =?utf-8?B?dXI1a25oV1ZEYWF0Q2RmbW0zaVI2SDRoYUd6OVlMOFRZWGVtWnlkWUhRQytn?=
 =?utf-8?B?Zit3dmQrd3VNT0dRVjFONVVGOVB4NFIxVUt5K0FPOE1sSXpabWpCTVppT0NY?=
 =?utf-8?B?MWx5d1JadVJhWjRmWHYxUFBNQUJOK1hwbXQ1N2pEc0ppMjlHQ0tBakdUeHdz?=
 =?utf-8?B?dHJhZmFZQVhMQy9BNjh6RS9YOTJwMElwT1RuOWJRNXZFWCtpLzZmRkd1aEFk?=
 =?utf-8?B?L0FVdC9YK2RKck1aeGNMUXhZRS8zanhrODhRMDc4a0RwY1BiWkxsaW1yMzdQ?=
 =?utf-8?B?NTd0c1YvUnE0bGJjNWhwVVVYSjJyQ2pRSlZTNVYyNmJ6cmxZRHNKUTd5MDZ3?=
 =?utf-8?B?d1JPVktycVFmMVNoTyttb3p0QUpwUzVyU2lScEhCYUd4cUM1cERnWUpYbktI?=
 =?utf-8?B?RkxtaDVaOTcyWlphZVdnYWpsUnZ0cTBVRDZsQzhoU1N1SDJ2SnJsL1NjbEJl?=
 =?utf-8?B?YzV3bzhTclMrUEZaMng3U0MvZTRZVlhTSWpCaUI4amk3eXB6RHRaUTRnZ1lr?=
 =?utf-8?B?L3VVKzg4R0JkUkVEMEswS0QyM2ZENG9HcUZUYkQ2WjljNU9JWmNaSDFNb1Vz?=
 =?utf-8?B?REFHcmJ4Q0s1NWFtdnZoVlJ0SHg5bTdhcTBpZ1ZTUklRV0FwQ3pPa1lsUjJo?=
 =?utf-8?B?K1ZHQS84RkN4QkdHTVhHWTJtdUlReGtkSHZOaDVzQ05udExMVDY3b0hjQUlV?=
 =?utf-8?B?eGNNUTlZdUprc1V4WU9WQlBIQU5HWVVwZDZHVVZMRGZTL1ZSV2l1eFZ4WHNa?=
 =?utf-8?B?RVQxck1QL1Y4V1ZsdURzTnlUUElkSm11aHkremRRNkRkNGoxek5qSHMwRmRh?=
 =?utf-8?B?WGhFcWE1dkNqNEZpWnJ6MnpTblJMT0Foa3VrNHk4emZWN1RHeVk2UGw0S3hR?=
 =?utf-8?B?Zm8rckp0REVKTmdpM0Q1SnZBRWQvejJLdE1HMjdKR2VZUThlc3kvRytsOTZn?=
 =?utf-8?B?cWxZTDdudVdoSkNjTzh0bjh0Q2RQYWcrTGxrVVA4K2I5Z3BiZzNCdmNvZEpz?=
 =?utf-8?B?aTR4amNsTGFzSjhaMHh6RkxmcWo2NVNNcUgrV2JhYTRIZ3pmcHZ6Qit2aHBa?=
 =?utf-8?B?ZzYxTVpCQkZvS09jRlB0SnJjYmREdWZOSHZyY0dYWE81c3lTY081NGgweThY?=
 =?utf-8?B?UnUySDl6bk1sTktTRmtCd254NnBzclF4SW13T3pKNHNVaEwxbGZoUWJ2aVRz?=
 =?utf-8?B?Z1JnUkZtSEs1bnl2RnFPWFc4MlZSbGlkNjVPcEJaN2NTdG5ST0RrZFpRMlpL?=
 =?utf-8?B?Vk1IWW9WUEVrd3RNTEtLV3FoNHg0VlpSY1A3dHVSUXpMTzFRckFpZWtHRTFw?=
 =?utf-8?B?Z21sS1F5dWtxMXEwaDdFK2YydG5TZ1RkdlNBRENzWXJGN1BFd3ZNdzJ0ZU9P?=
 =?utf-8?B?bmRWb0htSVRzZWorZjN3NVRMdDlHa2dNYmZoanFoN0o4SHV1OVpvT3RZUFpn?=
 =?utf-8?B?aE9MZjlZYzFYU2JyZlpCazV1ZTBWVm5BUjBBR2UzNXlpTEVVS0RVMWh5WFNO?=
 =?utf-8?B?SHFra2hYU1pGVlhxYnBHSTkxeTdhMTlmR2RYZW96YmlmOThDZU9vWVVFdDdS?=
 =?utf-8?B?OG8xM24ycjl1RnZHdmVpMTNnVUduc3NUZnpGTmZrRnVtTlh0aEpTTnRjZlhJ?=
 =?utf-8?B?a1BMYW9pWDFvdndqYkJFRWhXd0tJcEdaL2dlUkpkK1J2eEhEendSdVZ2S3pS?=
 =?utf-8?B?WkNwRzA1aERGNEVXWHpPMEcyTEVoL0dXNXovdU9EbFlPbC8vKy8rSWhlU0F3?=
 =?utf-8?B?c0l1V3FyaTVhUHFDck1kbk4vZGt2eXlTeUFPYVdUQ3BrTGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(4022899009)(376014)(82310400026)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 11:12:00.2612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e2d198-5dc9-4c5b-8148-08dcb53f6d66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9898
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 11:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202990

VGhlcmXigJlzIGEga25vd24gcmVncmVzc2lvbiBpbiB0aGlzIHJlbGVhc2UsIGNhbiB5b3UgYWxz
byBiYWNrcG9ydCB0aGlzIGNvbW1pdDoNCg0KaHR0cHM6Ly9naXRodWIuY29tL2N1cmwvY3VybC9j
b21taXQvM2VlYzVhZmJkMGI2Mzc3ZWNhODkzYzM5MjU2OWIyZmFmMDk0ZDk3MA0KDQooYXMgcGVy
IGh0dHBzOi8vY3VybC5zZS9tYWlsL2Rpc3Ryb3MtMjAyNC0wOC8wMDAyLmh0bWwpDQoNClJvc3MN
Cg0KPiBPbiA0IEF1ZyAyMDI0LCBhdCAwMjo0NCwgUm9iZXJ0IEpvc2x5biB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cm9iZXJ0Lmpvc2x5bj1yZWRyZWN0YW5nbGUub3JnQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogUm9iZXJ0IEpvc2x5biA8cm9iZXJ0Lmpv
c2x5bkByZWRyZWN0YW5nbGUub3JnPg0KPiANCj4gVGhpcyB1cGRhdGUgY29udGFpbnMgbWlub3Ig
ZmVhdHVyZXMsIGJ1Z2ZpeGVzLCBhbmQgYWRkcmVzc2VzIHNldmVyYWwgQ1ZFczoNCj4gKiBodHRw
czovL2N1cmwuc2UvZG9jcy9DVkUtMjAyNC02MTk3Lmh0bWwNCj4gKiBodHRwczovL2N1cmwuc2Uv
ZG9jcy9DVkUtMjAyNC02ODc0Lmh0bWwNCj4gKiBodHRwczovL2N1cmwuc2UvZG9jcy9DVkUtMjAy
NC03MjY0Lmh0bWwNCj4gDQo+IEZ1bGwgcmVsZXNlIG5vdGVzIGF2YWlsYWJsZSBhdCBodHRwczov
L2N1cmwuc2UvY2gvOC45LjEuaHRtbA0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEpvc2x5
biA8cm9iZXJ0Lmpvc2x5bkByZWRyZWN0YW5nbGUub3JnPg0KPiAtLS0NCj4gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvY3VybC97Y3VybF84LjguMC5iYiA9PiBjdXJsXzguOS4xLmJifSB8IDIgKy0NCj4g
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL3tjdXJsXzguOC4wLmJiID0+IGN1cmxfOC45LjEuYmJ9
ICg5OCUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
XzguOC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguOS4xLmJiDQo+IHNp
bWlsYXJpdHkgaW5kZXggOTglDQo+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1
cmwvY3VybF84LjguMC5iYg0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9j
dXJsXzguOS4xLmJiDQo+IGluZGV4IDJiMDU4ZTRlODIuLjNhYmUxNTk2YTAgMTAwNjQ0DQo+IC0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjguMC5iYg0KPiArKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC45LjEuYmINCj4gQEAgLTE1LDcgKzE1LDcgQEAg
U1JDX1VSSSA9ICIgXA0KPiAgICAgZmlsZTovL2Rpc2FibGUtdGVzdHMgXA0KPiAgICAgZmlsZTov
L25vLXRlc3QtdGltZW91dC5wYXRjaCBcDQo+ICINCj4gLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIw
ZjU4YmI5NWZjMzMwYzhhNDZlZWIzZGY1NzAxYjBkOTBjOWQ5YmZjYzQyYmQxY2QwODc5MWQxMjU1
MWQ0NDAwIg0KPiArU1JDX1VSSVtzaGEyNTZzdW1dID0gImYyOTJmNmNjMDUxZDViYmFiZjcyNWVm
ODVkNDMyZGZlYWNjODcxMWRkNzE3ZWE5NzYxMmFlNTkwNjQzODAxZTUiDQo+IA0KPiAjIEN1cmwg
aGFzIHVzZWQgbWFueSBuYW1lcyBvdmVyIHRoZSB5ZWFycy4uLg0KPiBDVkVfUFJPRFVDVCA9ICJo
YXh4OmN1cmwgaGF4eDpsaWJjdXJsIGN1cmw6Y3VybCBjdXJsOmxpYmN1cmwgbGliY3VybDpsaWJj
dXJsIGRhbmllbF9zdGVuYmVyZzpjdXJsIg0KPiAtLSANCj4gMi40NC4yDQo+IA0KPiANCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMjAyOTQwKTogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMDI5
NDANCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
MTA3NzEwNTYwLzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVy
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0u
Y29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

