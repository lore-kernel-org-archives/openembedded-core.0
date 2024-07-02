Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6097C3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 15:08:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web10.26900.1719932931445318844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 08:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=o+zGPJJd;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=o+zGPJJd;
 spf=pass (domain: arm.com, ip: 40.107.20.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XmURbX5RXOtWwxpuKVmiGL0GQEBQ31zn0fZ3WyCnE9EHWNzE3bxSNv/XMx52qQEreaOZ6l3HH9/0jjbyYvqdY3/StZnixKpd/Ue/L3A3dCCmcTZuJJUCjzkZRkoS0eaQRTWBQdBCowoLRBuYVDnFpTkU08RFz8jhY1jk8KdPsL+Z9N+9DWygxBzPr0nNBNPjfnBewTqkrqOJ8Qsl1AmQ4ACx/lQ5hvPSPYgXdPvG+a4UyfTLz4pVaKR8h9BCDbyuV+3QHb2Wa87VZdOXyPbez/kW5lZ7nDa3LGTeGnhgHF3HvMnhXk6JSractK5RWtx4N7S4vXr/GPD9zmFxBW2J5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41BO+oXRH890MG3hxAa2v0ZC6B307oJyPZ0il3yVrrI=;
 b=TRN1DX8LFzmkUwk4PCEt7y4T2fPiEuc2N9vH0SWyuOE0l99V40CNusvIFz6YY42Rbwspz//Jr/XfM6da+qawD8L5U8MCIpPXgRRBbA9OmKE9CVDtOl+9tHctuKaqoBX1WevuS93N5CtuZmCvxOIhf+Z0Nbd3A/x1W85gMcpbDK3BcNnlzZWQR1Qy4HjF+G/MOl2mZWFdIxNS0vTiw5o+OSNyRjIhLtLXd1E+RZaqi9XqvmOP/69YYSjUXHHqzaCqqzfGR/BdVPVAj245TMXc1zxdmi0qoeIYExn+kjDwvX7Cbs/VG0mzrvBW4RTeHmdQzmdDiztFSYH28yhqSTYyTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41BO+oXRH890MG3hxAa2v0ZC6B307oJyPZ0il3yVrrI=;
 b=o+zGPJJdu/LpdgS1wX/HXJlPdGR19bmgDIC+/YobXr8fHfeVhcVLELMagaYoEOhdHPdjLFnT6ob22t9W4mpkMTNStEqoVyPjge7zTe9hekjcuqes2+zHfMmkTP8SQVrIZTGCGaZoy0Sgjq4xZUgZ1kBGvaO/uBsB0jOaEuuuM+c=
Received: from AS8PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:20b:127::24)
 by AS2PR08MB8747.eurprd08.prod.outlook.com (2603:10a6:20b:55f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 15:08:48 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:127:cafe::a3) by AS8PR04CA0139.outlook.office365.com
 (2603:10a6:20b:127::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34 via Frontend
 Transport; Tue, 2 Jul 2024 15:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7741.18
 via Frontend Transport; Tue, 2 Jul 2024 15:08:48 +0000
Received: ("Tessian outbound 9a020aaf7a58:v359"); Tue, 02 Jul 2024 15:08:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc307860c65c98a2
X-CR-MTA-TID: 64aa7808
Received: from 2d762466fdd5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C5D74F59-5764-42D1-B285-57300473E4C8.1;
	Tue, 02 Jul 2024 15:08:41 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d762466fdd5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 02 Jul 2024 15:08:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6z1EYaSo8iKk+YKnSEN6rWuLDGUudE2QqbVxebwUCuAIbatCc5rQ5NPLlrdu/saSHLBxlcuRag8hsLgnK0Wh/ouQ3XjDFa0bkBVvLEFMo5S4rsoX91JdCe4zce2lIPhb8jDo2WkxzdEYhlyorM4hBM8C/Gd83kN5EZkY2cBQzC9Xbt1+NxY8D3eqcM9BMx2jwWhRpeCae6fhtB83xUCBpzQQrTWWuejPs5wnQ0UjPMWKGOd67FJj3h9d9iVGIF/D7fUrkXYkl0a53DM/wucyeNP0J8nHhb2Wk8JOqsMGNqXL63i8+W4kEgfo6Eyi/KukL/3bkJA92ukdHd7Lo3ZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41BO+oXRH890MG3hxAa2v0ZC6B307oJyPZ0il3yVrrI=;
 b=Y0KR8Ec/3j5sMb+mvo6/8Vd7SbppDqEQVgq/zgVEo3t5Yp2IR7FRT2QGMVuZzMPT66VDIoSMoOMbPzXCybNl1sWI/XXXZilGYpiEgAAsVumH5FChQYCUPPDOi+xpGKDJk38pFYE3SL6LhTGhsLVnjzKA+5QSvkW2l2w8/cyJiNlzai03PynWmi9igZzbjxp2WNI78HD/YZd8MsUgpvaa/gTO0i6uviEXBsSzAtr0M/KizzwBLsDSZoEpDx6MyNoyrkRXnLn4eKfLa26p5YouIE+WqsHVDVp+CfmfhnQU66w1E6UdZIT5OEYM37rzv5w6ndCZXmYd3uDC3VcKwq8+6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41BO+oXRH890MG3hxAa2v0ZC6B307oJyPZ0il3yVrrI=;
 b=o+zGPJJdu/LpdgS1wX/HXJlPdGR19bmgDIC+/YobXr8fHfeVhcVLELMagaYoEOhdHPdjLFnT6ob22t9W4mpkMTNStEqoVyPjge7zTe9hekjcuqes2+zHfMmkTP8SQVrIZTGCGaZoy0Sgjq4xZUgZ1kBGvaO/uBsB0jOaEuuuM+c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10948.eurprd08.prod.outlook.com (2603:10a6:102:46a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 15:08:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.038; Tue, 2 Jul 2024
 15:08:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"sundeep.kokkonda@windriver.com" <sundeep.kokkonda@windriver.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
Thread-Topic: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
Thread-Index: AQHay5krYSY9OeoE90mR7mooEmQQw7HjJU6igAA8mYCAABqZgIAAD6+A
Date: Tue, 2 Jul 2024 15:08:37 +0000
Message-ID: <089531C6-530F-49CA-B977-1663251F7A94@arm.com>
References: 
 <9f5ad0498ee04abc2cdcbfdde1e4db867f741096.camel@linuxfoundation.org>
 <13008.1719923827197429081@lists.openembedded.org>
 <5abd4f206842f282995eace0355f5a60d9b5defb.camel@linuxfoundation.org>
In-Reply-To: 
 <5abd4f206842f282995eace0355f5a60d9b5defb.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10948:EE_|AMS0EPF00000198:EE_|AS2PR08MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6544a5-a302-451b-13a1-08dc9aa8dffc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a2c0UFExRitwNEhlNmE0T0ZPRTB0aTZrQTl5OVRUMUI2ZnF2RlZVNmFibGdl?=
 =?utf-8?B?WUtwY3ZzdTNUNGRYMTdFZFUwZ1NJVVpYOTNMOGNybUNIdzJBTjVDbWNEaWps?=
 =?utf-8?B?ZWNEMUY3aEVRTnVCM21Ob1g2TDFSNjBCd1F6N1JvYlMxR3QyekNyVENIaTVk?=
 =?utf-8?B?Y2lpRld4SFdRMWF2eUlNVGZpQ0xnR3lwNnh6ZDN3UWp1bEVnT0hKMkxGTEZW?=
 =?utf-8?B?UTZCWXg1QmFycEMwRXg2Q1pnT2VvaVpwUU9CbXlQWVZWQlJtR29Jd0VGR1Qv?=
 =?utf-8?B?V2xLdXBVRTlwQko3TVF1R2Y4THRNU0RRaFpCaTFSQlh5UU5tV0tDSGZKUE5y?=
 =?utf-8?B?T0wwdncwenV1OEIzRkJBa3hpVFBrbURlMUVwV25tYmlhaFNwaElkWDdaY0lZ?=
 =?utf-8?B?eXhtQjRzOUNrcXBVQ2hXb3VzU05YaTA2dUhSOHJGbTlhanVlTVpVemJxZHhw?=
 =?utf-8?B?aEdySUFrV3o1NHAySlRHbEFNdU5LUkdXNDJLQ3dKRWgrY3JOcklxMEtNbDhm?=
 =?utf-8?B?V0UrVzBBdjkyUnlaZ05TdkVuMlNsUmc1clBIN29JTWFYUjZCV1lzN0NKNGpw?=
 =?utf-8?B?RkFZU2RRVktvc2VjNm9XNEtxWjZGNlFXNldwaDNzMXBUaE1iTEVrZDhtNm5I?=
 =?utf-8?B?eUNYOGlzbFg1c21DeVpBMFJEcGNnU0xra2lXKy9wMCtLRzR4UEpZWEQyV3dO?=
 =?utf-8?B?L1VvOGtsd3lZTnB2U0xYaTJPVWU1MTdKdlZ0c0xwbUIxR3lmcUtEWVoyQzNz?=
 =?utf-8?B?SXljeWxTRjlPbFBZSlNmZHJORmNJczJvMFJGYndJbXY3cFNVUHE3SVdtbExh?=
 =?utf-8?B?RU5ieklBODZ6aVlBNmFLRUJaT0Z6OEtEemdGeGZOZ3VVSlhWV28vQjJNZnZL?=
 =?utf-8?B?UDZibnY4RkNJQmFkYWZYV2xYTXg5eGxnRnU2YWVPSE1kZE0wd2p0cGJ3NVps?=
 =?utf-8?B?RDk4ZTZTbENrdjVxSVY0MGhQbXZBS1ZFUmxFQXIzaHpQOGNyZ2Eya0V5RUIv?=
 =?utf-8?B?eEZkSUlZQWoydDFVV1MwUmxrSzRnOEZnRXBnc0p2VkE1REE0S1BKTzhaMEx5?=
 =?utf-8?B?RzVmODN4aDdZcXBGK0o3T0tGUDVwMk1jQ0pweDlhQ0Rxc1JiWFI1YnF3aU5W?=
 =?utf-8?B?NS8xN083VXJ5TjNramV3NFh2V3pDbnlPSTZGZzd5Z3lFUENnNHNRK203em9j?=
 =?utf-8?B?WXhEYXlHWTBPSlR5VmFycjJsTG9KbkRYK29ZRHRXYnN6OU90VUR3RnZTSnNI?=
 =?utf-8?B?SVpJekdhVXc4K0ZLdiszbUxxcnZPcnY5RlhpYzI0M2ZMT1RIb2pkOE1Ybyto?=
 =?utf-8?B?T1V0ZVpsbmVwcEJwcFhzWFIvY0o2ZlVHNGlMYlNxcE9wZnFmMDlGeWFXRGRU?=
 =?utf-8?B?TXE1NXJTVS9lVWdzcGpJYVd5RjJublFpOTNUMkkxSUZGNFlvSWZ6T3NMcldZ?=
 =?utf-8?B?K2VaVXduTEsvTWlFd2JCUnU0TTM0OHpIM0pjVjVjRExSSzV5bkkrMnk5ekFG?=
 =?utf-8?B?MUFNU1d0U25OV3o3bmRISVkvYmlUWks3dlVBeUdma1FPdnVxRkUrd0dxT3pp?=
 =?utf-8?B?S0Qvd3BMWHJhd1MvaTN5VFk1clZiNjJ4Rk9UUDM1V0ZBTFd4TFhycThFOGt1?=
 =?utf-8?B?elBteXNPYnN1dlJDVHJ2Vkgwd0Q1Kzczd3F0aGlrWlpKZExnS2pFQ0cxQXNN?=
 =?utf-8?B?RHI5ZmpiUG5uWUtYUVdJMS9EMXNaaUx0Z3hDUWNpY2lpMFV5d2dlcGJPQ1hP?=
 =?utf-8?B?d0prVWlQYmlKa0JmNU00aVdjalpHcitFMk9LRDRoTzg3aUVMbGh0K0dML3Ja?=
 =?utf-8?B?bDhJTzFub21YSGQzWEtBWmNOUVJKSDdoeWpDUkMxLzZYWks3VGtsU0dkeWtq?=
 =?utf-8?B?dm1HeWlwYytTRVh2NHV5dXRsVit5YUhEeW43VlBDZG16WEE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F71C5481A78C4146AAAF2EFA655CF528@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10948
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	67572377-90ff-4e5d-48e4-08dc9aa8d9a9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MFBCWi9lek1neU9tUmNsQXlubXZRdGRmUkRvUkdmU2hhOE03Q3ljQXJMbkI1?=
 =?utf-8?B?SkprYVZibnBibittcVg3d1hKc25tdDJKZ1VhcEFlWEoyVFAxUThnaWVMa1l2?=
 =?utf-8?B?TUpnb1c5OHNqcG1kYjhKTEUvZ3JUaDFla1Q5NWx5Nms3Z1Q2dmJMS0RhUnIy?=
 =?utf-8?B?YytFdnhTMFo3V25NYkVERkVMZkczZ2pDL1ZYblhRdmF2M1BYcGtNMTY1V1VP?=
 =?utf-8?B?SDhTd3Zja0hvRjdRMkZWTitZc3Nsak5Sd3UxYXFuNlliVy92ajBrK1R5S0JH?=
 =?utf-8?B?R0JaZW83YThsMWo3clpKaklpZEtsc2gwQ3R0UjlxcDJ1YWRFZjdKM1NqUkVL?=
 =?utf-8?B?UzgyTHlaZnFleGZ6MzAxdzZZaUJOTVk5ZTFnNS9za050ZFZDMGlnaFdBUGJP?=
 =?utf-8?B?U2hEeWFIOGNPREwzQ2JDdU1MY1JaZmJEb2I0VFMwdmo0VEFOTERIWDNZYWpy?=
 =?utf-8?B?SVE4RVhLNWRFY2dZOXg0WC83NnkyNEtBcTBmVXlvZTBoN1RkSWhZaU5TV3Er?=
 =?utf-8?B?cXE5dXZUU2tYbHA3TTVHMFJHYmxqTTkrMG5GNEQ1QkxnMC9QTHZDQStId2Js?=
 =?utf-8?B?UGNSYmZ1Y2ZtcGhSRkRIRUFkWGloVlJMYm5WdzE3azdPTldqaWFQVUpjZ3hV?=
 =?utf-8?B?bTVBVndFN1JsQ3RqTHBGSFJ6V3lhZnJDV2VQSnY5L0Y2dG84NWRNalM1Mk1z?=
 =?utf-8?B?N2N4czQxOGxUTnpmSWMrbHE3RHlGdEF6NkdoN2xPQk1jUSsyNDhzc3A5T24w?=
 =?utf-8?B?c2M3bGVYZmJTcjBlM0RxQ3doVm9nYXVqUWZIM201U0ZJbXlndGpucE5mbTZn?=
 =?utf-8?B?VFZBNXpHNGZXVUhrcW13dmNzZ0dWZnJyS3JtWVM2WHJSaVFON09VMFRpT0tF?=
 =?utf-8?B?MTYvWHlLb29CUlgzZk9Nb2JzdjZXTVZsMTl2Z3YyZHM3bnNjMDk5VTZKZWtI?=
 =?utf-8?B?QWV0N2I3bFFWYjhkRHpUbkw2YlVidDcvV3ltQm13L29UNFgrQ0JqL3ZvZTRh?=
 =?utf-8?B?bHQwNGJ2TGRBRnkycVN3UnorRDNIbC9Ub01UM2NSQmk1LzZwbFFzS09XWkZ6?=
 =?utf-8?B?WmlURU05UE9rNHUwdVdxUExjN2MvQ0tMUzREODFRWEQ4c3JmUXdZRHZObUx1?=
 =?utf-8?B?Q3QrMlpHdTJYNW1mZE9tRDdBSnl6cUhTbExqQTdydGdYVVJXc0M4S082ZDVW?=
 =?utf-8?B?aHVlWnhEaTlvTkYvVEt4dFk2cFltaVdMZVptNU1CcUo4ZkZMU0JJcDhCNTdN?=
 =?utf-8?B?RkZleERpQ3h2OTJOQkduQnMrTWhYMUg5bFBxSkR1ck9wWTNBSGE2Z2dMNi9G?=
 =?utf-8?B?L3QvcGN4ek5WdFQ2Z1dPczBMV1JxZllENk1MSUh6Wlo1NitxbVNjZ1lQTzg0?=
 =?utf-8?B?VnF1TitRcWs2Z09JVUIycnpZSnNnQzcrb0s4dm5KSE9JUlJYSlM2bUFBQ1Jq?=
 =?utf-8?B?S2s3ZTlhRlJaTFRTa3NDTjNMZVZYclRHRzdSMy9UczVKMjN3TEJNV003ZW9J?=
 =?utf-8?B?eGN6MzRhQ21URTJ0WTBORXhVWDdvZzVMT1ZvNUVqekVqbnBQQmwxMkhrdi8y?=
 =?utf-8?B?MXVSNFIyT1hYemhub1h5RWc1dWMxUGlVVVBNelNtZDBwcmNMUFZ2S3VKbkd5?=
 =?utf-8?B?REVvZ3V6eWJNM0VsQ1ZDOGJBT1kweVBKTE9pSjZ1ZVBBTXJFRTBsK3hhMVlq?=
 =?utf-8?B?eVRQMTI0bE9hYXBxdlliM08vVXJDYStmdE1VWG9nT0ZxenFZWVB0RlI5WUJt?=
 =?utf-8?B?Q001eVNxQkpERElQUWErd09oOURpbWlEbWwwamJieUs1UWFzZkpEbURaQkZQ?=
 =?utf-8?B?WFJPYjBCU1FPam14djN2Vk9EdGhMVEdzTUxJVlgvTnJvNjdlOGJxcERwWjAw?=
 =?utf-8?B?SEZUZkM5eHo5eGJ5WXdaTW1sYldVMWYrd1lybXJOYlRoN3FlTVdxN3MvTk1s?=
 =?utf-8?Q?egKZ7reDRFQV9jIkOL9s9hvIdtJZZOq6?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 15:08:48.2321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6544a5-a302-451b-13a1-08dc9aa8dffc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 15:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201432

T24gMiBKdWwgMjAyNCwgYXQgMTU6MTIsIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxyaWNoYXJkLnB1cmRpZT1saW51eGZvdW5kYXRpb24ub3JnQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAyMDI0LTA3LTAyIGF0IDA1OjM3IC0w
NzAwLCBTdW5kZWVwIEtPS0tPTkRBIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3Rl
Og0KPj4gSGVsbG8gUmljaGFyZCwNCj4+IA0KPj4gVGhhbmtzIGZvciB0ZXN0IHJlc3VsdHMuIFdl
IHdpbGwgbG9vayBpbnRvIHRoZSBmYWlsdXJlcyByZXBvcnRlZC4NCj4+IFRoZXNlIGZhaWx1cmVz
IGFyZSBvbmx5IGluIDEuNzggKElzIHRoZSB0ZXN0aW5nIGRvbmUgb24gMS43NiAmIDEuNzcpPw0K
PiANCj4gSSBvbmx5IHRlc3RlZCB3aXRoIGFsbCBwYXRjaGVzIGFwcGxpZWQgc28gMS43OC4NCj4g
DQo+IEkgZ3Vlc3MgMS43Ni8xLjc3IHJlc3VsdHMgd291bGQgYmUgdXNlZnVsIHRvIGtub3cgd2hl
cmUgdGhlIGlzc3VlcyBhcmUNCj4gaW50cm9kdWNlZCBidXQgdGhlcmUgaXMgb2J2aW91c2x5IG1v
cmUgd29yayBpbnZvbHZlZCBpbiBydW5uaW5nIHRob3NlDQo+IGJ1aWxkcyBhbmQgaXQgdGFrZXMg
dXAgdGltZSBvbiB0aGUgaW5mcmFzdHJ1Y3R1cmUuIERvIHdlIG5lZWQgdGhvc2U/DQoNCk15IGJ1
aWxkZXIgaXMgcnVubmluZyBvZS1zZWxmdGVzdCAtciBydXN0IG9uIHRoZSBpbmNyZW1lbnRhbCB1
cGdyYWRlcyB0byBzZWUgd2hhdCBvZiB0aG9zZSBmYWlsLCBidXQgSeKAmW0gbm90IHJ1bm5pbmcg
cmVwcm9kdWNpYmxlIGJ1aWxkcyB5ZXQuDQoNCjEuNzYgd2FzIHN1Y2Nlc3NmdWwsIDEuNzcgaXMg
YnVpbGRpbmcuDQoNClJvc3M=

