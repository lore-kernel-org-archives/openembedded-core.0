Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C147CCCF9E7
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 16:10:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.40])
 by mx.groups.io with SMTP id smtpd.web11.20465.1727280643510854622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 09:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EpONp3Wj;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EpONp3Wj;
 spf=pass (domain: arm.com, ip: 40.107.20.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bbfotbdTDQ4cWaxesyPMtvAvdidqEoHMC9qWSZAYr6JtEvRx0q9Rjq+B9QveTHGzKVmQuFZObfVi2WkLGVIAF0mkGniFiEjy+TqLtBtBTIv/fD4DGTLRhtiU+/D+A0PJNB3R/XCQ2zkstRpiB2KN6NZ1afEG4V34wf7DPjpXhbvxV+2DCuCcMYipVOwVUhXGNdlXXxfVtWG9KYXFeNSbZF7ZIU1wHrs27v6keDTrkLe66zSQoF7++f8zymajeLtVJOl06CHaSUf/by7XGEwx+mgi2Z6fryH/DI1U+w1F70yHw/yzcZ3TW2hzf5biK9dvf5z7GQgeCIPUvOIjVhD7Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnXQZAXF98yPunUbxEcaBSUSpUkl0QPmNI80pRfCnW4=;
 b=AaOK9I0nRoi6iCfIkrOuFTHrOj0hd7lxOMiL5Plp4Svo3oGmcKYD6dp7wlVxBUH2n4Cu/U2+In9wGAcm/KpOL2T9HI4kOLXuual7rGUfKEifzwz9q2giFpWKTJFVyIze2AOcMUrdPrA1q+xHQC+eTaW55RZAuRkASsD3IOmJ1MGCL87CfkR196pmZInwm3W8E8Dlge5xKWU3qlkA6Uv16XWyLc+OCS8OuGlWxaaJ1nRSUQ7oPcuADFebUnxQDkpfsh5gDYf8y5CygEkm09HAbDQV4TafhyrX1xTI4wqmRwfRIkXwrf3bNYnaWbW3Tblp39s8r4nXoNXmd+RYsxG8hQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnXQZAXF98yPunUbxEcaBSUSpUkl0QPmNI80pRfCnW4=;
 b=EpONp3Wjx+x0T0NhEgo6rfFEuOtvCTtUdq/BgoDlcnF8sHPtR2P/266eAU+sf8+YK6bJxJ6eJ1RvVbMJl3oJFC4R9/l6ae4gj+nSnVCH5ox9phE81C1Shtd7q4aCsVlBtMfl3xmPdu8lhfDm9dQW1F/LFg96RtlsO/SFgRnwjKw=
Received: from AM0PR10CA0063.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::16)
 by AS4PR08MB8095.eurprd08.prod.outlook.com (2603:10a6:20b:58a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.11; Wed, 25 Sep
 2024 16:10:32 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:208:15:cafe::f4) by AM0PR10CA0063.outlook.office365.com
 (2603:10a6:208:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Wed, 25 Sep 2024 16:10:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Wed, 25 Sep 2024 16:10:31 +0000
Received: ("Tessian outbound 690adfc84afa:v465"); Wed, 25 Sep 2024 16:10:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f2b07f95fb91565
X-TessianGatewayMetadata: +TVvIFd8dOvaCjMGt0eAtQSnEhr60/SF2fict0Md0ovNZptFlsN2BbjlNC4OIvDHZKxJSwN2PGMzaoYoYmL48HqAUV/AIPWzBheaZQl4t7b+9yDyKu/DENI2Da0UL9zlb0WotswPDbnrrFHmcruz61hAC2pVb9IrpCW8vEkVgUw=
X-CR-MTA-TID: 64aa7808
Received: from Lcac7b6b80bc7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 497EE504-18B3-4C2F-B717-5225C5A5454B.1;
	Wed, 25 Sep 2024 16:10:24 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lcac7b6b80bc7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 Sep 2024 16:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtwPklqHX4fkjJuZZfGS8MJ/TiuKzNAY4ihlbPSPXCDnIYGZS0FWbh+wk1U3rkA8twzPkoLR9RZITC9PhYGTGvPzS5jZEemTOUt8RlWZ3jcy7wyqQvoCrP3niSbGLb9KHMmn5TawMmAVjZdrd0t7XDK31uOuM8dcq3iCt9FA9y4xsCRqXMdw/ytNDmptH4ploMhoJoXjg3RiKuGC0JHrYzA5X2tvp1x2kEDZj08uts6GsC5E6AXn/o/1fPZMXpMU+ISGv//qRUUYesKD6jg79+glpfYT/YNHZvR4MTuiZGEbtC3YMQY+34ld0RLnC1lqFdsg51+7w+dwBe6V+yMGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnXQZAXF98yPunUbxEcaBSUSpUkl0QPmNI80pRfCnW4=;
 b=LlkCqr4r9N78BzOt3RaP673UxFQEjEh/R/8CI12Cxer/310xTgM2t6ysbgcLw0h8WBFitL/+aGe4+Ww34L0EjA1ULBOkE8qGi+fE7V9ZkG8NSenpNKNe5S0HR4FBuVn5ld9hmSA6DISAFvTQagUl2qPKo3cVJ2w9j2WJjxcb+O9s10opWBLynxJJFWvtasm4dIUacW+6/lLh3NYEVedMug1opwxZk2Cnbkz4XbaeTn9qiI6MlN7yLG6/MmdK6KKBQT45QXsvgsnNo/0WlZoEvKvgXmNU7BrT8A/zaoahMBmrt4RvolIZGhdusDtDfHw7eA5IXlaOAg+BzOxmHKpjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnXQZAXF98yPunUbxEcaBSUSpUkl0QPmNI80pRfCnW4=;
 b=EpONp3Wjx+x0T0NhEgo6rfFEuOtvCTtUdq/BgoDlcnF8sHPtR2P/266eAU+sf8+YK6bJxJ6eJ1RvVbMJl3oJFC4R9/l6ae4gj+nSnVCH5ox9phE81C1Shtd7q4aCsVlBtMfl3xmPdu8lhfDm9dQW1F/LFg96RtlsO/SFgRnwjKw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7717.eurprd08.prod.outlook.com (2603:10a6:20b:525::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.12; Wed, 25 Sep
 2024 16:10:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Wed, 25 Sep 2024
 16:10:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/5] linux-yocto-dev: bump to v6.11
Thread-Topic: [OE-core] [PATCH 1/5] linux-yocto-dev: bump to v6.11
Thread-Index: AQHa7BkQXlNYvbgPJECHQbTTwRJ2ZbJnK64AgAATbwCAAYjFAIAAKrMA
Date: Wed, 25 Sep 2024 16:10:18 +0000
Message-ID: <38584724-1556-4914-B3D0-5361E08D9F79@arm.com>
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
 <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
 <4a44e457-b17b-41c6-8e10-18d9fbea4a88@cherry.de>
 <CADkTA4NqO5uGBJu7Oe79vurUss8cPBUW7wqVF+wRcj25WEf4vQ@mail.gmail.com>
 <bd0c9228-ac33-4334-ba40-5d739951b14d@cherry.de>
In-Reply-To: <bd0c9228-ac33-4334-ba40-5d739951b14d@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7717:EE_|AM3PEPF0000A795:EE_|AS4PR08MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 403abafd-ca67-4057-a220-08dcdd7c9454
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bEhyWkV3Wk9ab21pdjlBYlJrMm1sTGNFZmJvWWFjRVYvTWlCSVZOb05QWmND?=
 =?utf-8?B?VXI3VXN2OXlXZC9kMDZJY05MSmcrSHk5U2E5YVR2ZGp0dW9sRWlENVRFY3Fa?=
 =?utf-8?B?cWtJZm5CSXpYL0R5Nm9Za2FnbW9IS3pPaVFZR244cnVGK21JWEs0Nndtc2dK?=
 =?utf-8?B?dE5xT25EU2xDSDNzOFF2N01ucTdLVjFXYUF6SUpLWlJlMGZOWHd6ZWs4cmgz?=
 =?utf-8?B?ejZZMDJuY250M1FvN1RLR3RFeG1TQ3BROUxwaUxVV1g2cEFQNURuaXdVc2hz?=
 =?utf-8?B?QUZlZE1DZHRLYzd2RW5FSVc5MENzc1FzNkdveG1JWGhCUWpqd0YwVHVaYnly?=
 =?utf-8?B?UGw0WUdQTFJQRmhYbGljZ3cxNGZzUit2NWVyMEZBRHRTREVYZXdaMFlKRzQx?=
 =?utf-8?B?cXphbENmb3UrWVM2NW1IVllzZlhEMVhRZDhIei9XcVRBTm9TUU1MdmxTVEhQ?=
 =?utf-8?B?bEpOMWdXNytmNjZnWFd1WXl6RHF2bmtESndlc2hWa25VbkQwQ1htL3NObUF6?=
 =?utf-8?B?ZHcrRVBLdWJsVVBJVWlQK3BFampHaVhuaGxiY0lMdXBCS1ZCQk1YNmF6R2Vl?=
 =?utf-8?B?Tm40aHArUS8zcTlrUmF6dkU5dUhNWkw4dEorSW4wcDIxOFU1ZGd6SUNDSWd4?=
 =?utf-8?B?bUxRWnI1WFpWc0ExckZ6Q3hqYWZnUUF1ZzhiY3hjSHRzWDhjekV1RGh4cU9S?=
 =?utf-8?B?QnUyUmtlYlkwcEtpL3E0UVRSSTcwQzBjbDJyQlhQSkNjRWtVQWQwMnRIZUdr?=
 =?utf-8?B?UjkzTkxmYlNhaTlUVjl2MCtpU09jajIvNnBUUDZkYk95clAwL1poV1EzenlP?=
 =?utf-8?B?MEVBQ21Sc0FjVEh2Vk5ROW5uWExGNUhsYVliS1BDaVV6K0JpYzRwTWhWWHBv?=
 =?utf-8?B?aWU4K1JEUzgwbnhnaEFPSzc2RFVTK1pJa1BkeUZMRXkxNkNBSDZCcTlPVGJT?=
 =?utf-8?B?aFpoWmx1MUJIWGF6ckxBakNJL0xod1M0azNzNFlVWVFGR054aitsSlpkUzB2?=
 =?utf-8?B?SGd3VCtwbGZuZGtlWUNVOTJtSHBkTjlYbkdqeXVWSmhNbGpBZUxJQ2hGNStW?=
 =?utf-8?B?NHo2YnVDTHJseThVQTc0TlVJNStqRTF5NTRyQXFVY0h3K004dmsyK3JhZTB3?=
 =?utf-8?B?Um1Fa0N4QVhlWWxuQnBZRk4zTW9od1NRaWlpWm1ZT2I4bVpqN20zM1pEUk5t?=
 =?utf-8?B?Y2MwMXJnMWMwSStqdm9XQzl6ZGVyUjBOT29oU0NxZ2VJME1DRURsQTBsM21y?=
 =?utf-8?B?Yk1wd3gwVmFIcVR5YVFyRE1lLzV4eWh3M0hrcUxSZzFSQ1VCL1I0L2tRMTV1?=
 =?utf-8?B?WUVLSWVJUGlEbUkxWGdYYVVka1YyM253NjB1T0dXMHU4cUJrVFFhUzUzc3do?=
 =?utf-8?B?dm05aEdqS3FuandYZmxDRkdLOWNIdTlQOTlyTDhkeEFnVy9TU0Jjb0NzUllP?=
 =?utf-8?B?T3c0MGN2a2R0Um03S2VaaGRaWWlIbzlSVEg5L0pIWmlyNTVDd241NzRDa1o2?=
 =?utf-8?B?Zm83NHpLYlQ5cEh3VWRIWit6a0ViNWdvV3JUZ3Rhc1FOSkI3ekpUMEZqd0pZ?=
 =?utf-8?B?S1VvMGxMK1AvaGpGd0g3SWR0UVpDc0dDb0lCSWhmNHZzT3pUUHM1UHNXZllV?=
 =?utf-8?B?QXp2Tmo0Z1k0b2JWSVlCaWcybCtsOWJGNXRiOTlISm5nOEsvNDRPWXZyMmZ6?=
 =?utf-8?B?ck5FalFQaXYxcWxyckN0WUtSc3JOSVdMaEdaT3MxemRaWHRXTGp3MndzbDVM?=
 =?utf-8?B?UEpRTlpUQWRhempHWUJLZXZuSHdLT0JmSE8xTENVRm5sQWlTU0puVDcxaHU4?=
 =?utf-8?B?Z1hSQ24wdG9RM0pOcTErUT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2B2E1C59C036A45B820FB25466C8D2F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7717
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5a33e6c4-68cf-4a75-4362-08dcdd7c8c8b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OExob3QxQ1ZYWUg0UUNIQmRkU3ZzUm02OWY2bElvMGZrcU9kSHFQaGZNQ05O?=
 =?utf-8?B?VmZtcHRLL0hXVVg2c2FNYXRXemdvYXVKOHM2MVBFZ3dQcXlFbnE2b2RKVi82?=
 =?utf-8?B?VXd1TDVFS084bkVncy84R0xFd3dBWnBkQ2kweFA4U1k0N0V3Qyt0QnozMity?=
 =?utf-8?B?OHRMZE5ROEpsYWtjNzJmUzd3U3dpdHlQTEhoRnZnZU9UbHN1bGUzeW0rMVlB?=
 =?utf-8?B?MnNzS1pIVHVONHhxbFc3enpET0IvWHVpVDY4Q04renl3b1VGS21mbHRXUC9t?=
 =?utf-8?B?V3dlTGdveDVNalV1VGI1U3IwNGRiN0tJMGc1SVJxZkM3T3lIZ0tjY1lCam05?=
 =?utf-8?B?ZnJEcXdZbXN2d2ZMcm5VRk5ObWVzUWwzWTVGRlI5dW9oVm1rY0Y3MHlyaUFk?=
 =?utf-8?B?SFRhc0YwclRQelUvTjkzT3RhVEN3c1JIc0owZ1ZLUzluUkplVGlORFMvYlEr?=
 =?utf-8?B?UVRTTERnRUFjaHkyMXV1eHR0dFlWeDUxczVJZHhnMCtjOUExWkdWOU1tMTZn?=
 =?utf-8?B?YnN2M2dxNy9RRVJHemE2azJGWDFEL1FUQmpPQ2RibzdDS3B2NXpnOEJJUnhz?=
 =?utf-8?B?Y1R4eHV4ZkNvZk5ncWJIT0U5Q2gycWRMK3hRNWdjWTB3V1A1RWdiNWpsQWhw?=
 =?utf-8?B?cEowWXcwR013SEZneWpZdWlwZU5TQmw1RVNGMERrMDUrVU4xMThjSForQjJM?=
 =?utf-8?B?STRYekk0UWszWVFmc0QrdythMU0rMXJ0U05jdmRxYjY2RDdMc3hqWEU5cnZP?=
 =?utf-8?B?VDlkQnZXUW5yTitzR0NlcVpFZkVHSG9oTVRDWlUwdHgrblRYQzNlakV1M3d0?=
 =?utf-8?B?VVFWS3BoVWV1VXdlV0JaV3JpSUtsNkp5Z1dLOW41b1hjMWhCUk5sNFJZQXRm?=
 =?utf-8?B?MnFyRzFQVGpRT0IwRGpuY0MvZ1pLekhKbmdrU0VjSG9tdmlzYnMxN05Rck1p?=
 =?utf-8?B?cStlclFlaCt0ZDg4QjZkUzNDR2hWVTZXN3cxM2ZsNWlidmFzUjMxMktaQzlp?=
 =?utf-8?B?Y0JtbVJoaktsMm1GYjR2QmtQL2NMdjVYUDNPZzc5MmhPWGxtUGJUS3UzRXhu?=
 =?utf-8?B?dndUQmgzVnBHMEJnQWdzUUNVMkJNaitaT2JFSEpkbGw5bjN4bzRoMjBzeFJY?=
 =?utf-8?B?VXVwTWkrUXpBMmpGZTZWazZEVCtwZERTeGFaSlU5a0R6dkhsUXhTeGl2eWlC?=
 =?utf-8?B?TTJRTEw2ek9VSEQ4RitPUm9DWm5oNVM4ZVBIN3FMSnQvZ0lxWG8yWW8rVzZ2?=
 =?utf-8?B?QUJIMXlyQ09GYVJkRG5yRnl3WEtKWEdzNEdiTW5taEZJYlVwTzZNOHUrdVYv?=
 =?utf-8?B?ZWNqMDZPSEtBRHcxZUQ2NEFuOUV5MWJDcVh6bzdETEJKa2tteVc3b01rNm42?=
 =?utf-8?B?MlAwNmQ1RytDM29xVFdlZERJZXlXQnZRckNBazlXbEFWZ29ZeTNrUU4rNllu?=
 =?utf-8?B?WjRHMkhienNmSGUyaEMvd1NaZG9KNW4rbWl5bUlIZ3RSZmRjMVN2VERqTHdr?=
 =?utf-8?B?MUZDUnQvM1RLaXJDQ2FrM2Vtb2VGZlZMTWlpZEE0L0hMdnBSZFMxZkRCUC9D?=
 =?utf-8?B?WkEvUy9Tc1ZFWFdNM1NodDVPWVhmYnRUMXlXZE9zUThTd1U2RjROK05xTE5w?=
 =?utf-8?B?SEJtaXlGN2MxZTRxeEtPYXNpMTZHZnlzVU5jOGpncGFNbWdORnVkMmNMVlRJ?=
 =?utf-8?B?MzdyMStCTG4rY3B5UFBqcW1iaDlOSHlmK09zaVFNQmQvR0hZdXF3NHV4U0NT?=
 =?utf-8?B?MU82Q3NTMERvTTB6aURUZ2VDN2NoTm1PL3BoKzdRMWZjQXZxUTlIeWw1MkFu?=
 =?utf-8?B?dXBXV0lMb0QrZVJCV1QrYVJpRFlrUElOaWUxVTZ3aDFKSVZwZzVnYlFiVTVE?=
 =?utf-8?B?M3h3SURsclZ6ZlBmZ3J3TFMrbW5OSy9mM1pQME82QTk4ZGRmSTBOZjMvUjlq?=
 =?utf-8?Q?2plyxGBjYHNOJHOYJNf61lQ6GyTy8yMZ?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:10:31.3556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 403abafd-ca67-4057-a220-08dcdd7c9454
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 16:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204964

T24gMjUgU2VwIDIwMjQsIGF0IDE0OjM3LCBRdWVudGluIFNjaHVseiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cXVlbnRpbi5zY2h1bHo9Y2hlcnJ5LmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gdHJ1bmNhdGUgaXNuJ3QgaW4gSE9TVFRPT0xTIGluIGFueSByZWxl
YXNlIHlldCwganVzdCBtYXN0ZXIuDQo+IA0KPiBjLmYuIGh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRl
ZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0Lz9pZD01MjIwMDBjZTVjNGYwMjAxY2JlNDJk
NzgyNmI2YTg0ODllZDEwMTE3DQo+IA0KPiBUaGlzIG1lYW5zIHBlb3BsZSB3b24ndCBiZSBhYmxl
IHRvIGJ1aWxkIDYuMTEgYW5kIGxhdGVyIHdpdGggQ09ORklHX0tBTExTWU1TIGVuYWJsZWQgaW4g
U2NhcnRoZ2FwIGFuZCBlYXJsaWVyIHJlbGVhc2VzLi4uDQo+IA0KPiAuLi4gdW5sZXNzIHdlIGJh
Y2twb3J0IHRoaXMgcGF0Y2ggdG8gc3RpbGwgc3VwcG9ydGVkIHJlbGVhc2VzPw0KDQpJIHRoaW5r
IGl04oCZcyByZWFzb25hYmxlIHRvIGJhY2twb3J0IHRoYXQgY2hhbmdlLCBldmVyeW9uZSBoYXMg
dHJ1bmNhdGUgYWxyZWFkeSBvbiB0aGVpciBob3N0Lg0KDQpSb3Nz

