Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF54C369D6
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 12:12:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.71])
 by mx.groups.io with SMTP id smtpd.web10.14382.1727266340821066190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 05:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Km7vFCX6;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Km7vFCX6;
 spf=pass (domain: arm.com, ip: 40.107.22.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FQ1E8mvqlSm2uuhJzMaaGDJsILXznPi3Ntuoq++HBkfYWpD2f9QR25k3UXB4FXcpPMwHu9tfsnilakVmPMsVrUR5I8aliz9aBUhmFVk95m/VDDu+jJpX9d6Imo7qMFCjIHoIvhoD+g0W+zGeOyThxRtjC+5aHasH+37ZGOSgELSW+tlk4owmlGeL7XsnNPpKibS6Wwvip3fHf5PIXYPwkKVWfWSGTEwqwpG5sY3TCcHwJpY3otmMshEa2AzN4iPThMihLhKynFiMlUgvrr9lXSJlShe8Mf2XxGXC5DIXv9aUQrJllbfbcww2TcPJcH3XIHmtRga2N1miKas+Gu/V5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg3R6+oDUJDtaQQZ/nA/Rs1557e+SPi6lolLXtQK2Zs=;
 b=OkNxp6EYObVK32m0RgpZb6/JhDdTAPb5qXrlyJtG1WAGqcGKK9PbID7GfZxHHkDUshY66m874jL3HJGq7Omx63EVDrlQpxpoSAIbgrfN566XD4dPsP+acKI+n4mXU/0chzW8pWQPtRa+DXa8S11u0i1qI9gdnAaSMZ1Vxva344jqYKNo1ALdzQ6nNWWok5EilyCcBO9SEAqdQJfS92afVTOcGvLbtOGFk0L+sLwY9G8BWEe1dtmVAvcGAie2t9qGmcC5EDUKvLqHgnxKdP1yeGm9CQ1+f6RpMzEqy6SF/M7ZjmZovdU/rhw35e3O3+jqIwc7C/mtv59W278tggRwVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg3R6+oDUJDtaQQZ/nA/Rs1557e+SPi6lolLXtQK2Zs=;
 b=Km7vFCX6szetvstgY19SjtRGmh2fZhPMiJUkqEM/BCvwgY7yeWUq6YZqNk+smntq5tNdv0noScYLeckIXdLxgcG6O6El8oTafYiuFogtofJ7fXpanZmAVzbLtb7SSOpsoH3LVCrInCmiDKqU74u5J4qhshpXGubpFPX3OwBmdt4=
Received: from AM6P193CA0096.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::37)
 by AM7PR08MB5495.eurprd08.prod.outlook.com (2603:10a6:20b:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Wed, 25 Sep
 2024 12:12:11 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:209:88:cafe::b5) by AM6P193CA0096.outlook.office365.com
 (2603:10a6:209:88::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Wed, 25 Sep 2024 12:12:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 25 Sep 2024 12:12:10 +0000
Received: ("Tessian outbound f9d5b330f2e0:v465"); Wed, 25 Sep 2024 12:12:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de89dc090deb5778
X-TessianGatewayMetadata: Mlh41wkv9hom8G6HsU0FnanINqbCHYdYVJpw3GFI9pvTJ0BAxFPpRkQLL9lsSO/ADFgiBlZkQ3Xy9UfmXR3qOVeQOF17ZLOefJEPPP8Yly1jAiR2Hk8f2mVpICp5u5gwGYecDN5PW/8PdZZlhgY9LJSLBOR4cT+wlkRG90qaXN8=
X-CR-MTA-TID: 64aa7808
Received: from Lde2ab0cdb8cd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 178F8BC8-5047-416F-AE6C-9B764DA318D5.1;
	Wed, 25 Sep 2024 12:12:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lde2ab0cdb8cd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 Sep 2024 12:12:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmwnpLEoPq6SW1YopNHQh7u4Tp2TtMOsoF0cc5Rf7ASHA7AKIjzwIXSy73kS6QAQvbEOKbY8BZAd33IOAmioEiGrFtS3841ntbI1ifRDZLNkULt+UDwO5k5o78CuydYogpltLsAaEaBv5W9PYrUcp6pLaDXxYQk/VNDO3zhCaQJgC+0TOjd99ZmgKd5ffM0pt29o8zr8p8xDcPdHVpNQl9tGqnkK7yL/J9XXP3FYxG2DOYXsM12KCzRMYcm2CtrzVSjhkKHCsbsZrk3EQU6/ZxO6JBRKGEBf8FYrkyrvxHyvk1u+lKlpmGB2UK+T+4nBUy0LxqWWVcNrVzFVgXoOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg3R6+oDUJDtaQQZ/nA/Rs1557e+SPi6lolLXtQK2Zs=;
 b=L/BdpCYvSlEdF8dXzogYmQ9+0rBuMI/EScOU3ZBKQ17D8hrUBB1S7/wCaD4o4eXIEimzHmxap1rb6DRM+wvCkxDctCH4VtWmJEPJAXoTvoREPNL64JCAUG74YjIgWW/9P2UsBmYgeqRP4FdNQL7LiqGAVZSKlRpFQJ/5PfG54BZmQgSrjSb7AkO0Eod5QTjbnSHUbMzW5eoi+aVTYp5uukXkp60CM4PcNQ9c2Wq+j9rDL+OztAHmPjMWHWXzdyjl7ykSzTqxfs5qjOwbsvDqaQ/XXZlARljBKq/i7A88pMPfoZ1Xg4I6LMRmgMks6/d8zLu/9WKUoh44HUwr8r6Y7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg3R6+oDUJDtaQQZ/nA/Rs1557e+SPi6lolLXtQK2Zs=;
 b=Km7vFCX6szetvstgY19SjtRGmh2fZhPMiJUkqEM/BCvwgY7yeWUq6YZqNk+smntq5tNdv0noScYLeckIXdLxgcG6O6El8oTafYiuFogtofJ7fXpanZmAVzbLtb7SSOpsoH3LVCrInCmiDKqU74u5J4qhshpXGubpFPX3OwBmdt4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7722.eurprd08.prod.outlook.com (2603:10a6:10:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Wed, 25 Sep
 2024 12:11:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Wed, 25 Sep 2024
 12:11:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] gnutls: upgrading to 3.8.7.1 FAILED
Thread-Topic: [OE-core] [AUH] gnutls: upgrading to 3.8.7.1 FAILED
Thread-Index: AQHbB35vTsSlShsACEaDyOojllo5eLJnLPLjgAAy+gCAARlEgA==
Date: Wed, 25 Sep 2024 12:11:56 +0000
Message-ID: <117BCAC6-1046-4704-A0E4-774E9D34E25F@arm.com>
References: 
 <01010191f61ade2d-97c5199c-2106-43da-9e43-90c50a8a408f-000000@us-west-2.amazonses.com>
 <17F5D6D545773F97.13829@lists.openembedded.org>
 <8e16c978721bd5b62ccd385e918e3675e6e4418e.camel@posteo.net>
 <12E0CBB5-4092-4940-AAD7-CF40C776F364@arm.com>
In-Reply-To: <12E0CBB5-4092-4940-AAD7-CF40C776F364@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7722:EE_|AM2PEPF0001C70E:EE_|AM7PR08MB5495:EE_
X-MS-Office365-Filtering-Correlation-Id: 843b49ce-d2c1-41a9-7fcc-08dcdd5b483d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZW1hOEhJWS85dHNGYW1TdGRTcGlYNXRXa0taVFVwYVRXdWdlUnI0YzZuVU1v?=
 =?utf-8?B?NFBuaFhycVhDMTluTDNoOHRFb1dZTnJ3K0xoNU9DdU9YRUp4YUxYYUc1dXJq?=
 =?utf-8?B?QXc2UjB5TzFVMlVLZFRVdWZHb0xvc3hOZUFpbG1YSThzZEN4V1lLbVdzbGNP?=
 =?utf-8?B?ei84bktGNGdkaE9lZHo3VTRMdnllOFdjYTNIYzcyaGJnVHRtM3ZZRERVWHJQ?=
 =?utf-8?B?U21DNm04OVppRUxDUFJHVXFXZ2tzdXFyQkxrWUkwUE1MOXNxWVRjZTZPZkF3?=
 =?utf-8?B?T3p4ejdMUVZOYktMSlBLZ1J6T3h4d0hEcklNRWl4dWdvb0t2Tjc4NERBY0hF?=
 =?utf-8?B?bENBb1dHOVJKOWVSQXpEblptNExkVTBOQlNSYWwxTnhDTDJuWWdNK3pPVE5z?=
 =?utf-8?B?amhiMUlHdTllaUVMc3VlTzhTRVJvL1JiVy9Za3RvMFdxZTZmZ0lobE9IYThl?=
 =?utf-8?B?a0VhQ0RzRG0zSStJZEYxRE5OVVZBQWpLRTZNUEFzdUJhaFJ5OFVzc245akZl?=
 =?utf-8?B?bEFGQ2RkOWJaZi9meXJ0eVQyak51RVZzbHgvVFhFT0JFZU5Jd0xSYlN4RWJs?=
 =?utf-8?B?UEs1c3FFS0xoV0tkeGpkWG5CNGtrVzR5UGpZc0gwajl3OGVZRE1wTWhXL3Qy?=
 =?utf-8?B?UGNjVXJkK1NLTkxYUFpKc0RtUU9xcTRMWm9nYjVHcTJCMTNPZkVNL0F4RjYz?=
 =?utf-8?B?cjdXYWdSRi9UL2JDM0pJRjI2UnAwM2tUVjkxRU9YQmlFV3JseUhsZWtLL2NO?=
 =?utf-8?B?U3ZhbXRScnd0VDV0dzh2VUZYMTBJWW52NHg5RW1PMks0VnJ6RGNIRzZ1cXFr?=
 =?utf-8?B?dGNiQjlyVno3OU5HeWV3MzVncnJSc1hoSHVrUldpZTdDSWtKenZvbkZFN2cw?=
 =?utf-8?B?a1pyNmNSNDEveHo3NGQrOUs4b2daRnJZVElzWGdMWmhrQTZNY0NZeE5La0Jm?=
 =?utf-8?B?NDA4R3h0aXJrbWdaemNUajYvZ3dnOW9YeDJwdlMrQ2kxODVuNVlraWVlZUhk?=
 =?utf-8?B?WDNmMFpVNWgrVXVIa2poKzNVV3NxQTV4TjJFUzZoLzJXNWZkaHBzbXo4SDFO?=
 =?utf-8?B?RjlGcFQ5ZkxEc1ROUVZQbEZvY1BXV1NQWk4vWGVxYSs3ejF1K0pEVHRUODZU?=
 =?utf-8?B?elN3NGxwQ2M0OUl6VDNocjg1SWxBVktidVF0K2djMHhIdFQrK01OU1RHRnVp?=
 =?utf-8?B?aFJqNHA0b1lKZHpPUUpIU3NkZThGdE5VTDhLTDVwSHlkTVRDMWs3WjBSNmY4?=
 =?utf-8?B?UkNRK1ZyVm1NZmdNVHF5c1ExbXlrN040dDlBQlI4bGE3M3dKNlVhL1Q0YTVo?=
 =?utf-8?B?Ym1MeXY3eklSdmVRajlwUldRb05xTmNVcmZaYlNWR3poOEttM0k1WUVEelZY?=
 =?utf-8?B?ZHUyV1VaT0pXK0NxWE0ydERTcFBpVHprcVZIbGh0cUpXNGtUK3NWZm4xdStu?=
 =?utf-8?B?ZXArdXZKZkoxbDMyWDhCSHFOSTFhL0RuTldOUWgwZGIwbzBpeTJNakdWbzYx?=
 =?utf-8?B?TklDdmJ5MkYram03L2EyOGNwQWdjY3VybEN6Nm1QOEJXTlJsL2Z6ZmNPK3Bl?=
 =?utf-8?B?amloOG5sS1p2T0VxVnhXTjdESjUxTEJDcUcyZzViQVpGOCs5dGxOamVNWFVn?=
 =?utf-8?B?eFdSUFhWUU16MHcyUDd6MzNJdjdhR0NYZlNEQXp5RXdSdXMybDRwQkozSHlI?=
 =?utf-8?B?MFNYY2VZc2NVcXM2VXozL1c4Mk1waGt5WWFjVTYvcDBReHcvRTEyNzUxSy9J?=
 =?utf-8?B?UW5tZ1ZlSisxNFBGNXRzKzZsT01XK0JZSU9tcGdYcjh3V09ZbXhCaVh6T2J2?=
 =?utf-8?Q?0b1eaB3obbgLcYZdmxnPFrx0M31arnmuohheM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4AB45E9B858AC4BB131830F0F0ED0E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7722
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a30051fd-32ad-4c60-6d58-08dcdd5b3fe4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WnJLU3E4d0Y0RFM3QjErcWFLVVJZS2hMQWhOQmYwdVlTbnlTeGdud2xuUVc1?=
 =?utf-8?B?RzFLRFNKNFl6SlovQ2E5cjdJMitBZXY5ekpNOGNJOUZYNFRtVVhZYUdRc3py?=
 =?utf-8?B?Rk9DWkRIcmRlRWZOVUpjemxteTNYWUUvZWwzVlp0RE1OTUhmWUxjclp2b1Y2?=
 =?utf-8?B?NjAraTZSS0ZFT1kvM0dMTDF1c0plL1JMUy8zZ3V3dXZIRlNkdlRQRmtBMWhE?=
 =?utf-8?B?YXpSQzFKN0pLTlpSSzZ4cHo4NWwwaFFwWGVLWmpyRFpSTFc2ZGt1RkxaUDhj?=
 =?utf-8?B?WHlibm0veXVsNGNrZlZIeHJuYW1IS2ZKZ2JPU05GVXNYQmIxc2VxcnBRbll2?=
 =?utf-8?B?TDBRRmNFUGFyYUZOZS9rUHFSTStnV0lVMmZNendVeWwvUXRvNGVrcVUrWmRG?=
 =?utf-8?B?cVRJOU1BWllqTFp3UkEyVFNvMmZsV1lqSkpvd1I3MFFiZmpUWmhsVnNHZHo1?=
 =?utf-8?B?TjdITU5Cc0VaalltMUlWTFlSRE1nMENjcHVncFY5eTVTTEg1SDVzL3I1UG85?=
 =?utf-8?B?UHg5cEpVRFU2M0V6U0l4N0p0Y0VBSThFcUNjWTRhVVlIWUV3ck9hYUJOaU1s?=
 =?utf-8?B?VU8ybjBGQmhYdTh5QlJjeExGRGxnci9Ub2JFdC92Vy96TzhOT1FWcU1pSk1L?=
 =?utf-8?B?U2s4a3A0RW15K3oweEdmU0VMQlZCRzFDb0NXRFJLd2E3TWc5MG1kMlhQSExS?=
 =?utf-8?B?bkRiNU03cysxZ09ieElwK1BGSzhDN1ZkN0tkd0ZaVTNHNkVyMGZlYURoK1Ns?=
 =?utf-8?B?ZGMvWkdDbEpaano0ZVJQNG81Z3VwZ1JFeFhuVUlFcy9zaDFhdzJ0ZjVwR2hN?=
 =?utf-8?B?SVZoRG9LRXFaWnJZSzh1RTYvVnhDUWFUeVBNU1hlTFZZWldoY2pRdnZieVE3?=
 =?utf-8?B?WVlmREt2M0JPdkRjVnZxaG1aS2M1VytJZXdVdGdYY09pZ2ZzS3VuVUp4MHNG?=
 =?utf-8?B?YlZIMkFNWTBvdUFNMG5odXJnQ3dlUWROZTFKWXRzNUZkdGlndThQYVRkbXV1?=
 =?utf-8?B?enJzMmpVRDBiK2VQVUQyc1ZxY1k0YTB1QmZZcStvbmRVT1I4Z2ZONEFIUWhp?=
 =?utf-8?B?ZDY4TEV2bWV3UTBsOXo5cmdjNGhZaDcvK0d4K0RSUWd6UGRhRU1zSU8xNnNp?=
 =?utf-8?B?RVNqSldBcGtNUGVkN1hTZk9NbkhINTM2SVRUcjZGb0txNnA3Nzc5OGZiZTYy?=
 =?utf-8?B?Ymo3aERVMFVhUDlPeWdWcmJBQkFjSTgvWGYwdFlkVmsxNlFkRVhBK2hDdGUv?=
 =?utf-8?B?a2tER2RtSkcyaEFjVVRUdmhxcmpSYkE3a3J2Vjc2MFpBaURNdi9iUFpmdjBJ?=
 =?utf-8?B?b091N1dJMjBEa3NrbTltTEU3cXY0MGhVT2E3MzVmeHFMeHhZQlVWaVFVL3E1?=
 =?utf-8?B?Y1JJK2hUY0FLVWt3NlBYb2pldThtY0N2LzFLbWExM0dLaGRKS0s5NkpSRHVO?=
 =?utf-8?B?aUl0TGZFOU1RTDczREg4Y2gxZEtkejBJRS9ud2JNTnB2cFRMTEFiVHppZk5C?=
 =?utf-8?B?YUpRQXhsV1VYQWZmN1NCYXJoN0FjWW5aampsYW9CY09vazdlVnEwMzBObHBF?=
 =?utf-8?B?QkRGbllRTW1yUFFScWNqcC9ybUlYNlpMRTlBbWtPaWtGUXBGZ2h0cDJnblZs?=
 =?utf-8?B?dWwyQWR3NGRQRm45UDJkaXB6SkQxY2hlS2NMVmZYVWNZMEJBSU1wNjZrWFlt?=
 =?utf-8?B?cTVWYWZJTjJoRFFiL2RxUU43RUJ4eUd0YmllU0pJU0hLTkFOZHJxdTNWRHpk?=
 =?utf-8?B?TStKeHE3SUtjbHRpTzhSbSt4QmdWWlhlWXBnNEFyMzRrMDNtMGpXK2xwREJ2?=
 =?utf-8?B?OVRsSWVjRDd0MU1SSVBldz09?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 12:12:10.2895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 843b49ce-d2c1-41a9-7fcc-08dcdd5b483d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 12:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204950

T24gMjQgU2VwIDIwMjQsIGF0IDIwOjI1LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4+IEkgd2FzIGFibGUgdG8gYnVpbGQgZ251dGxzIGFnYWluIGJ5IGFkZGluZyBhIHJlY2lw
ZSBmb3IgZGx3cmFwLiBCdXQgdGhhdA0KPj4gaW4gdHVybiBkZXBlbmRlZCBvbiBhIGFkZGluZyBj
bGFuZy4gU2VlIGFsc28gaGVyZQ0KPj4gaHR0cHM6Ly9naXRodWIuY29tL3Vlbm8vZGx3cmFwL2Js
b2IvbWFpbi8uZ2l0aHViL3dvcmtmbG93cy9ydXN0LnltbCNMMzBDMTUtTDMwQzg0DQo+PiANCj4+
IEFueSBzdWdnZXN0aW9ucyBvciB1c3VhbCBhcHByb2FjaGVzIGluIHN1Y2ggYSBjYXNlPw0KPiAN
Cj4gPHJ1YnMgZXllcywgbWFzc2FnZXMgdGVtcGxlcywgc2lnaHM+DQo+IA0KPiBXZWxsIHRoYXTi
gJlzIGdvaW5nIHRvIGJlIGFubm95aW5nLiAgSSBkbyBlbmpveSB0aGF0IHRoaXMgaXNu4oCZdCBt
ZW50aW9uZWQgaW4gdGhlIE5FV1MgZWl0aGVyLCBmb3Igc3VjaCBhIGRlZXAgYW5kIGludmFzaXZl
IGNoYW5nZSB0byB0aGUgYnVpbGQgYW5kIGV4ZWN1dGlvbi4NCg0KSSBmaWxlZCBhIGJ1ZyBhZ2Fp
bnN0IGdudXRscyBsYXN0IG5pZ2h0IChodHRwczovL2dpdGxhYi5jb20vZ251dGxzL2dudXRscy8t
L2lzc3Vlcy8xNTgxKSBhbmQgcG9rZWQgYXQgdGhlIHVwZ3JhZGUgbXlzZWxmIHRoaXMgbW9ybmlu
Zy4NCg0KVGhlIGNvZGUgZ2VuZXJhdGVkIGJ5IGRsd3JhcCBpcyBjb21taXR0ZWQgaW50byB0aGUg
Z2l0IHJlcG8sIHNvIHdlIGRvbuKAmXQgbmVlZCBkbHdyYXAgdW5sZXNzIHdlIHdhbnQgdG8gcmVn
ZW5lcmF0ZSB0aGF0IGNvZGUuDQoNClRoZSBidWlsZCBkaWQgZmFpbCBmb3IgbWUgd2hlbiB0cnlp
bmcgdG8gbGluayB0byBicm90bGksIGJ1dCB0aGF0IHdhcyBzb2x2ZWQgYnkgYXBwbHlpbmcgaHR0
cHM6Ly9naXRsYWIuY29tL2dudXRscy9nbnV0bHMvLS9jb21taXQvMjkyZjk2ZjI2ZDdjZTgwZTRh
MTY1YzkwM2M0ZmQ1NjliODVjMWMxZi4NCg0KSW50ZXJlc3RpbmdseSB0aGUgY29uZmlndXJlIHNj
cmlwdCB1c2VzIEFDX1RSWV9SVU4gdG8gZGV0ZXJtaW5lIGlmIGRsb3BlbiB3b3Jrcywgc28gd2Ug
ZG9u4oCZdCBnZXQgdG8gdXNlIHRoZSBuZXcgZnVuY3Rpb25hbGl0eSBhbnl3YXkgKGZpbGVkIGh0
dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0vaXNzdWVzLzE1ODMpLg0KDQpJ4oCZbGwg
cG9zdCB3aGF0IEkgaGF2ZS4NCg0KQ2hlZXJzLA0KUm9zcw==

