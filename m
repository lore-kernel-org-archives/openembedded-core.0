Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3D8C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 16:40:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web10.26170.1713544826294180162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 09:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ael0aAVI;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ael0aAVI;
 spf=pass (domain: arm.com, ip: 40.107.20.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HI8IfKOXmDNLG9UUWXxhSIw+bZAcbtqJrLp0keGGG6u6eZGCconygZlO4FFeJ2RJRFE3vDlXttTfqKTeAu2gw40oLRdGTH1mSt+WiPnf8XKaEML+jRpzbmcb12YVG+3PAIH7AicgeCPElVNqcwmvV5L4SyVx50gscF/7Z/GyURqJUf06WbiuhivGEQwxLIN9XjIWygUMA3ISNA/NZVuf36RRYnZVjr5AlTPXtqh/TKz0HhTSOhj6f5OGKrIFwH/BKKqVnoI9oSVKASx99YxvIEcM2B/qGZuPdJxvxLJ5LuvE0hk5/50HhQIt6CRC8NVWWLiGfFBNxpcznWtVvz7KMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT8u1zG06uV1sIiIFzt6cy35t3TJzVXwNdxyjO9RSYs=;
 b=HjShLVYdMKxQRahjPuPZjRozLMnir+BDrN0iFvardOLOW9NvCLGKllbVE1Y2g95oPX08DdF2s+YMrq/NWuIfI1ICEAPIlCULC55K+HZg8uk9HOBrMDCHWqoF83uNhdNvsJWI+Z7HciyuZLILSoM+beSZUGwbtJfIL4pGrO9Zt5yEp05TdEgYwGpmYcKSkA/LGUMX6/IO8DZneZ9iOHhKEBqRhezQFRUPQGlI797zGJ+HbhE+TaE0t1HJUl0dvuyFnFptS8eSn3Bbgym9aDZBt/adJztY5zzeIWqiIen6lNujNQHAhfpeCw9U+t3QCbvECwG6C5yvAKhZYlRjs3syvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HT8u1zG06uV1sIiIFzt6cy35t3TJzVXwNdxyjO9RSYs=;
 b=Ael0aAVI5I8SsLWd+QFfMtCWqh++xSqHXI33RtJwGAhpkVWemSL+DCfzg5o5HK3FuBniLIXYg8qevhr0XpEKN5Ptgf/5dyVNAibkJYwWNimKXeztcdRoHf24L5Q27K1fiYR+LZr1ytPPrfNxB6reTOrtZlUkl7LggW9jWMxs6As=
Received: from AS4P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::7)
 by PAWPR08MB8981.eurprd08.prod.outlook.com (2603:10a6:102:33e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 16:40:23 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::8e) by AS4P251CA0011.outlook.office365.com
 (2603:10a6:20b:5d2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.28 via Frontend
 Transport; Fri, 19 Apr 2024 16:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Fri, 19 Apr 2024 16:40:22 +0000
Received: ("Tessian outbound 8c03561b2da6:v313"); Fri, 19 Apr 2024 16:40:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab70cad86bbf9e54
X-CR-MTA-TID: 64aa7808
Received: from f5c7257f9451.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CD55FF30-A9EE-4F98-87E3-198898D8B72F.1;
	Fri, 19 Apr 2024 16:40:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5c7257f9451.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 19 Apr 2024 16:40:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEGCCMPRrKW89s+oXlekQga1CyZ2ktNex1DoUS5xkOrprEeExLFChbZ4fL0qs11KOwiRk5DFheTVasl3vaqmBTkr6a5p55GUgOcuLqVfIqU6LqZavVoDFXtu7ZVEcbZ6s4MVSRpXBsihzMq31LUzfi6aWQVYcnW96fvJRtNpew3PcuOWHp67vLQzx3qdk9g6VfI44x2pttgwpOrxHhAlrCJsDPFeXecs7lDz1MFIaiiUSf6UFpR8Ltd6gA6LbJJFnlgkA77x7Vq/5joRh/vUbSI8PPPb4POOrKP/+6guL6hOgSspjRqkb/DN8hOUhDvUY06vAbTvfsFPQt0WnaluAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT8u1zG06uV1sIiIFzt6cy35t3TJzVXwNdxyjO9RSYs=;
 b=lkh/p+AiUFEcyGRYT+JcLmtFTocO+maBwIVUwbAzPcLyY2ap0eD8GaxPp59xe+YfvbPiU6qDoJVKT7V7rMjMfskEdZtkOz7UVudD4O8PsNwnUI0KhPtupm2GwyA4k8YO0HLXre4WEWIJgCffL4kfZG8ptsE8DbXF1iwnkiQYoEVtLA8o5SrL2OdOBW32D7rRqiAWxhct9s/Yiwew+dEN1PzspVP+nF45lQW9r4dSIzHXgUfFhpBo1PvsjIExjKUWCkbnbVbh9lvRIw667vz5BO7SaEH3FdO7YMpZWCFnkqBHvKRh36fksD5YjykmUwyRztBwVxB4g4yg78WmpciSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HT8u1zG06uV1sIiIFzt6cy35t3TJzVXwNdxyjO9RSYs=;
 b=Ael0aAVI5I8SsLWd+QFfMtCWqh++xSqHXI33RtJwGAhpkVWemSL+DCfzg5o5HK3FuBniLIXYg8qevhr0XpEKN5Ptgf/5dyVNAibkJYwWNimKXeztcdRoHf24L5Q27K1fiYR+LZr1ytPPrfNxB6reTOrtZlUkl7LggW9jWMxs6As=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9933.eurprd08.prod.outlook.com (2603:10a6:10:413::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Fri, 19 Apr
 2024 16:40:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 16:40:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 02/19] package_rpm: remove support for DIRFILES
Thread-Topic: [OE-core] [PATCH 02/19] package_rpm: remove support for DIRFILES
Thread-Index: AQHaklP3QLKERCJnD0GeG/hAtvxj7LFvy0oAgAAAgoA=
Date: Fri, 19 Apr 2024 16:40:13 +0000
Message-ID: <357E46F1-D8B3-4F1E-9332-67F5F68F19C2@arm.com>
References: <20240419121945.1920944-1-alex@linutronix.de>
 <20240419121945.1920944-2-alex@linutronix.de>
 <39C19BE2-C704-4D5F-AE00-3F13B2FD04C7@arm.com>
In-Reply-To: <39C19BE2-C704-4D5F-AE00-3F13B2FD04C7@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9933:EE_|AM4PEPF00027A68:EE_|PAWPR08MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: a5cd3102-037a-4221-6c09-08dc608f6856
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MVRkaC9iWTc0TEt6WjErWHhXb0dYRk1GR3l4VU5nUDVNR1k0NWg1VVdmeTUr?=
 =?utf-8?B?b3N6OE84TDJGdlJHWWhYT0RRRS9HcC9vdit2QUlrRnJja2piMTNDM0xnMVNR?=
 =?utf-8?B?T2V5ampwSEhFYkZ2dDkzVXZ4QUVDaXdwSmo2MVJZa1dSRGgvUGtwY2I2QkRS?=
 =?utf-8?B?RXlKMUtiZ0U3NGJKbHpOdVB6ZGRJTldjYzd5VkZFWW5lSldHaEZxQ3ZaaWtk?=
 =?utf-8?B?VlJ3WU5XdkU3MCt2K0NjZEpMdjVmcE1oZmczUTUwNCtHcG9Dc0pOTzRaMmF3?=
 =?utf-8?B?VnAyTkc2MTFBRDVlSmlQTWYxSVZMc1E0RVcySDAvS0xLc0cxUVkzUnltelU2?=
 =?utf-8?B?bWZ6TFR4L1BSQkU0RzZyMDVZc08xSHBad2Y3YStwSUpWaHF5NWhkdFlSUmZh?=
 =?utf-8?B?ZmozQVB3cEtrMWtBYlY1cnlsbUxuMXBEYTRlV2ZyWDZ3MHUvVHVDa1dKZGox?=
 =?utf-8?B?cjNtaTQ3bjZYWDBsQTd4QU1QZTVXSDE2Ty9Ha3ZxMUpma2pkVmR3c0RQWWpm?=
 =?utf-8?B?Mm5tVHNXZ2lyVDJhR0RtVGYzaHBGcXVudjN3Um5lR0RJd1JELzhlU0QvanVD?=
 =?utf-8?B?RGNWZDlZRHJWMHhQa3hjWkJ5dk9ZOU03Q0ZkOW9NS0JlcFFiN1JjekVHZi9V?=
 =?utf-8?B?RE9lYUsvMkxITlptem1wN1djQmhCWTZkd1B3bDVwaVlIczhpZDhGMENsV1dC?=
 =?utf-8?B?YjhjZTA0eTMvK3plc2IxRWw2TXUrWTV6ejBJL3huejB2NGp3U2ZncjZUTnJn?=
 =?utf-8?B?ejFGeCtrcy9SOTYwOU9BR1F1VVU1aVpEWlM1VmlXMytLVjlDQUJ2TUNybDY5?=
 =?utf-8?B?VTY2TGVlYW9BYzV5OTdCRTg4YW5xRzlhM3NObktoNDlmVzlDQi9va0kvNE1h?=
 =?utf-8?B?TmorelJmYTlDNjgxVXBMeWdQRWlWalBJeWFJMzBjR0trK0I5bVNqQStnNWNE?=
 =?utf-8?B?ZkR6L3p1bUpINUxaUWZRNXVxN0g4T2Z3T25Tc29CUVpQNElTdUZ1SElTTTlw?=
 =?utf-8?B?aTV6NG5xcTZmVVMvbkZVN0NLUStiUHFMUlN5TWxQeUNscXFMVlkxUWtEM0V3?=
 =?utf-8?B?ZFFVMmhBb1RLMXlzZFdjMEVOMmlZbVJQbFRqMVc3TzdteEt3MlV2UCtsVDRG?=
 =?utf-8?B?c3hSY2pvVXhaYjVldVg1ZkU1Wkt0L3oySlBHb3VNNXd5TmlrOVZWY3Y0S3N3?=
 =?utf-8?B?Q1kwaTNHYkN3c0oreU1hb2tjZFFkck0rS2xmSnRRRW9WUGNZc0Y2Tngvcklw?=
 =?utf-8?B?SjgzcWdtOTExaG54NUpsNFhzTjBnbzY4VDhHTHoyZ2NNeE9zc2hXbFFZQWZQ?=
 =?utf-8?B?dm5YK2UydlA3TXF5bjZMaDU1OEVlaDZCd2x0cTFkcE43d1FKRjlIdnNTUU9l?=
 =?utf-8?B?blhHYm5oTk9kdGcvM1B3Z3VoZjhDUGZ4WHl1ZjhIZDJHaVYwdU1DMWRXWVoz?=
 =?utf-8?B?VXpvSFFwUHVSc094b1ZxUk1FaSt2NkRsQ2NaNmFTenk4YWs1RlJRVmxyNGlH?=
 =?utf-8?B?UDR2ZDZnUFVva05qN0VtQzZaSWhESktkcERJSnYySllUYndVZ1drcml0TDE0?=
 =?utf-8?B?eU9ZWGdrYzVrU2MrcmNkUFBqWG82OWdjMjdRbkEzazNxV0RvZFZISmpmSm13?=
 =?utf-8?B?LzZ5K3Nnd2pTTTQrTlhHTmRLWW8yZEJRTm1LSE1HTGQ4M2Y1WFFtd3FlNkNn?=
 =?utf-8?B?cVlTSU9KT0RZeFo4S3MyMHBHVm5UUU9ONklmK25iSTV1QU1wd3RnbE5RPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <610686DB11EAA34AA315D14A9722CD36@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9933
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d75f15d5-313a-4af9-184f-08dc608f6309
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UUNRN3VFWXpPVUJOYVUyRDlUbXJ4Z2FGaU9pekVVcDYwc3VNSno2MTB1Qm9a?=
 =?utf-8?B?MG1YMFlTejN2TlByZjhlNzVTMXloS0JhcnVQbkNwTFJNUGJ6cFV5anE1bWNI?=
 =?utf-8?B?cjJkbkxuakdLd0RuTVVNTy8vMDZOS25KQldnQXlCVnFEUHBnSTZqOTE5SHcx?=
 =?utf-8?B?VFpxNFVuaENWSHRmNlEvemp1anFJdUV4UEpsUHZMbnAva2JsS28wNWFucU1j?=
 =?utf-8?B?ckVUREJnU2Z5QUV3dTRoNVJqenZZcjhMUGpuQ0ladUY2TDhodFpLcE51cC9Z?=
 =?utf-8?B?VGZrTkxIemRRL3R4VCtRSjJkSG9oYW90U3FCN3JxSEVzSGdzdHlsNVgyeE5U?=
 =?utf-8?B?ZE5lWU1ReDYxaG1iZjVjbmxiUGNLZmh6aDc5bVBVZzA2cVhicnJWY0xXOVBk?=
 =?utf-8?B?Y1U3SXpNeDFNQTFDTU9UYUNhdFhQZXZiVjlrR1R3a3EyemVnU1RCQjYvNmhh?=
 =?utf-8?B?bnB4c1Z3WTJmbVNUQkM4Y0EyR0dwYytWcVBWdU5lWE5GZlZaNXphNm5yQ3ZB?=
 =?utf-8?B?bzJIVi9hc0VqWERWMzlNVTI1QmNvUU5GYWVJeHl3bUNNMURXNGRCN2REOWhZ?=
 =?utf-8?B?QzcxUzhnQzByNXRKRlR2M2gwWlllVUpoVFo4alA0WEQ2MnZaZVpVS203RHVj?=
 =?utf-8?B?bkV2dzNScjRtdGphTndjK0lOd0RFdWt4NDZRSVArY1dGazh1RUZ4OTFnK0Ry?=
 =?utf-8?B?NjFXTzdrcXhtRTkrYTk5NUloTGh4cVhjWmxlRWJBVGdnb0lHUTdzSmZ3TGda?=
 =?utf-8?B?YkxPSlUzNWlhVm5EKytxbGwzTEtYVy8veS9YdGR5dFlIUDNVQUZwMm9kZmxQ?=
 =?utf-8?B?bXZXc1dqc3hzSndCWWtvZEpyeFlWampnUTk4d3lpKzVvUng5Uysra3AxZjk4?=
 =?utf-8?B?UjltYTFiUmlwbkFQVzZibmNCYUJ0QXdWRnprQ2c1RHNRd1lRR09wRkFQWG14?=
 =?utf-8?B?QmlNMXF4RkRJL3Y4Ukx1cTVIWHF2V2VNVk4rQkZaYjUvM2N3ZG9RUHlobjJB?=
 =?utf-8?B?Vk5BbkQ1ZFZZZlp5RUJ3SzZKdmR4YWY2RnVwRk5oQUhWVzFJQ3I3b3ZHMWlW?=
 =?utf-8?B?dk8rNGVDQzBEZStnbW0zOVZGYTl3MjBIWHplWHNXN0FaRDMwdnR2YzdZdjlz?=
 =?utf-8?B?WjlIWTgwc09wVm9RWEZvWG02bTUxZi94aXlxMCtPVE9KT1VGUnpzYXUrem1T?=
 =?utf-8?B?VjgrbytJQllxbjFQSllPYVFOeXNmQ3VmODhXUktBTWRZc0JVQ2JHUWhGa1NW?=
 =?utf-8?B?UWxGcGxLSWpudzJGUHJtK0RKbjd6TTZ4THRzT1IxbmF1NUpYRHk2UC8rd2Jt?=
 =?utf-8?B?Zk9CSEJibFdTUTNKSXpoVFNUcG9rT2VZOS9xcThmSDloUVVrQ2I3VHRWbGgx?=
 =?utf-8?B?eXFqbXNaNDkrUnN3cW5mRnJ0Y1J0M3QzZG5TVnNPc090dis0TVVQWi9LZ0c0?=
 =?utf-8?B?a25qMithVjJlMzhxTExnYXZpTWlMRGxmRVBFUStyVjdTeG1rUGE3STNMbERE?=
 =?utf-8?B?YmkvTjZlcHZsM2RxWnNSeFFES25YZjlxRU1obFhRcXhHUHJTL09KaFYyd2Yw?=
 =?utf-8?B?ancrSFhQOWt4VC9aYS95dEZLMWhMNHBiMUd3NkNWTno4MzdQNStuQ0RaR2Fw?=
 =?utf-8?B?SjkvYW5QWUxTOWIwK0NaTVRZUTNEcjR0YnJ6S2tpRGw5UytuajJtczhDNWRH?=
 =?utf-8?B?ajRnZzJ2dkJQTTlPbVlnSHFsSDBUV1J5OXZoTk9ocng2U3F0UFhhaTA3Vm9p?=
 =?utf-8?Q?qYbYsnYC+dfljWmU9KiqFmzn0wslonkqmiLGjS8?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 16:40:22.6383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cd3102-037a-4221-6c09-08dc608f6856
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8981
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 16:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198556

DQoNCj4gT24gMTkgQXByIDIwMjQsIGF0IDE3OjM4LCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25A
YXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxOSBBcHIgMjAyNCwgYXQgMTM6MTksIEFsZXhhbmRl
ciBLYW5hdmluIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwu
Y29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4gDQo+PiBUaGlzIHdhcyBhZGRl
ZCBoZXJlOg0KPj4gaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5L2NvbW1pdC8/aWQ9
MmY0MmVmOGQ4ZmIxZmViZjI4MjUyYjk4ODg0Y2ViYWJjOTMxZjcyMA0KPj4gDQo+PiBJdCdzIHVu
ZG9jdW1lbnRlZCwgdW50ZXN0ZWQsIHJwbS1zcGVjaWZpYywgYW5kIGN1cnJlbnRseQ0KPj4gYnJv
a2VuLCBhbmQgdG8gYmVnaW4gd2l0aCBsb29rcyBsaWtlIGEgd29ya2Fyb3VuZCBmb3INCj4+IFRp
emVuL3NtYWNrIHNlY3VyaXR5IGxhYmVsIGNvbmZsaWN0cyBlbHNld2hlcmUuDQo+IA0KDQpIaXQg
c2VudCB0byBlYXJseeKApg0KDQpXZSBzaG91bGQgYWxzbyBzZXQgQkJfUkVOQU1FRF9WQVJJQUJM
RSBzbyB0aGF0IHVzZXJzIG9mIGl0IGdldCB0b2xkIHRvIHN0b3AgdXNpbmcgaXQuDQoNClJvc3M=

