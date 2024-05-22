Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED50C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 10:30:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web10.6812.1716373801313539240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 03:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HSps3j+x;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HSps3j+x;
 spf=pass (domain: arm.com, ip: 40.107.20.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gyQJKgQKydXsMeZ766OP4AX1CTUqVp96GKeK4KpyRzK7Wpfio+qdgOgPBfLpjaaBJQ19ud3Y4pdhNy/SXEcA//LOw/E9k/KAkwibVKNHdxfuN4hzCdE30CWFOLp3YYodLPNk4mdOY4PQ52NqWC0J2JKIyrxL9LLrq7rUXFKSlL5l01pYBNx9/aScCzQ8I5uO+ESLVzwD9z4OQ8SLRht3yvFLWlPCu9oOMlrlVbwhjA42yqX0MHA6JLPGreJF+boUx9Hxemib6W+q0dSKgy39l9lRv3NrTk/FgqXpI+xwPS0FztTXUKr8xGFzPygOu7ODvu6jYSUFae8QaHNWfXpPSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpJsYSHpRJ8tiS4KbYtq9cDWnvqxA9jteL9yevmrncc=;
 b=Ti+qCA/o5e3/STgGCJZ0/Hk3yXjEdPH1FVpFSnzQzVRPqJ6yg2wNqfIabfhG0KD4s6fIjdqLJm96/YdF2/ZoiOGhBgtqSdnWrzMZx22if4LACSYkfebmAnWaccVM6IRS1qJV9Sge0ofZ5rLXV/eskYYHy8eVQ82lT3miFuei3r0n7uAHx6M+DDkuvHwWQTq0bUwjrhISNBR6Uy693GqwXBvZSfzvA4yEYvClMUeKkwq80Gt7QrcCQ3hMLvgzHNJ5aq50YT5ewy/xlarbwhOgTZZ6pjnaAvSizsh2FFTq84oIvpqj+jzyT9Dj6zq79A97j8zMJ2vnW/iscfGmA4j45A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpJsYSHpRJ8tiS4KbYtq9cDWnvqxA9jteL9yevmrncc=;
 b=HSps3j+x51jXD629HrNttQ10wezkqBC8B4vUR9dJ4NI4PCSVnf15QmprSCSGMKr0lWktX+ofrQ1BBAyi7X8Lc/43Tn/+g3y/Gsr7MlI1bdvzywu5fXttxWUJDsPyKBQ/ZC5VSEqsW7humHQG5fzHyCiVLWZOrlqs/w+DSJtm1pw=
Received: from AS8PR04CA0171.eurprd04.prod.outlook.com (2603:10a6:20b:331::26)
 by DB9PR08MB8676.eurprd08.prod.outlook.com (2603:10a6:10:3d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 10:29:54 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:331:cafe::f7) by AS8PR04CA0171.outlook.office365.com
 (2603:10a6:20b:331::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 10:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14
 via Frontend Transport; Wed, 22 May 2024 10:29:53 +0000
Received: ("Tessian outbound fffbb209f6c2:v327"); Wed, 22 May 2024 10:29:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbc9f2c3eec97a0c
X-CR-MTA-TID: 64aa7808
Received: from f3c746f83e96.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F899D547-5597-4FA5-ACC9-9F713B30C058.1;
	Wed, 22 May 2024 10:29:46 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3c746f83e96.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 22 May 2024 10:29:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7Q1uVb42i+BEkRLjNI0A3OPJ0ZNb05hUib8ckCAH01/StYbQ9e0qjXPyj/ekup5rN/Vs0aZuisVntarQn3d0eV/DB6JdBju8Ow2XUoxmM3Bl9/CA6QCVv/PigEAynjArajN/vsOlyjPv+gy0hblhKKZWo5QqTV3sqBZsDDXS72LiWSBxewJimAaY1itPTxOCWmSh67lkCy/Xdt5UtvS7UgCtgEBG6zmw+zYFdoSAxYoDHVU6TqE/anU7mTGBjzxa9fXOlSvZp9ja4y6R94liexV/qMSByOfDvBuv34Fuk8U3RSqaeeLjZU8B8gHD1Nm3U4u7I6uuWu4EVmU4A76Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpJsYSHpRJ8tiS4KbYtq9cDWnvqxA9jteL9yevmrncc=;
 b=merR5Wiq8aA10aW1pxDp0hYuYqpxsGXteEp8bJ5ehyIVF0u+9uncXp05R36gYBLW1usmj7ZpA4RsEe/FMTTGzN737B+H6ptyWUvhgM+EN0yXRufZN339RmalD628FPzPecBcA7BSSIP6oFJMvpFOtLJHe+5FnXMZUXrWvg2gVspZj6Fo4nuAZsXkcLjgsgWuUHb079BbRHBTubD5G8139pyoL9o9HMvJWYmxjgNeyrMe6npyFEjGDcBpx0Q7beUSwZyrWJIQe9EAKIc1GvO6b0ZKMOIHqdRRG/HjhXvW3+9IHtEkfQCuDCA/anDSB026I98W7j7iZ2Zb7KbqUPAu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpJsYSHpRJ8tiS4KbYtq9cDWnvqxA9jteL9yevmrncc=;
 b=HSps3j+x51jXD629HrNttQ10wezkqBC8B4vUR9dJ4NI4PCSVnf15QmprSCSGMKr0lWktX+ofrQ1BBAyi7X8Lc/43Tn/+g3y/Gsr7MlI1bdvzywu5fXttxWUJDsPyKBQ/ZC5VSEqsW7humHQG5fzHyCiVLWZOrlqs/w+DSJtm1pw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9014.eurprd08.prod.outlook.com (2603:10a6:102:326::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 10:29:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 10:29:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Thread-Topic: [OE-core] [PATCH 4/4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Thread-Index: AQHaqbA9p+a+bUCI/0it+cZT1Q6XLrGhk1SAgAB6OwCAAQTvgA==
Date: Wed, 22 May 2024 10:29:44 +0000
Message-ID: <AEDD581A-9F6F-4A5A-B46A-42343F0E2DE1@arm.com>
References: <20240519055050.2331637-1-alejandro@enedino.org>
 <20240519055050.2331637-4-alejandro@enedino.org>
 <C23A42BD-03CC-45C7-9221-196D21A31787@arm.com>
 <CAHMutrYhV8u0xD40C52HXmnRjNv82QzCmYqLmWT=PXj9MjeKzg@mail.gmail.com>
In-Reply-To: 
 <CAHMutrYhV8u0xD40C52HXmnRjNv82QzCmYqLmWT=PXj9MjeKzg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9014:EE_|AMS0EPF00000197:EE_|DB9PR08MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: 76396a2c-2b11-40bf-81f7-08dc7a4a1e58
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MmFmbmp3dnFaOXUxN0NBcGpTdUlqZGRGRHV6N0VxMlFaVWg5d3M1OFh6U1o0?=
 =?utf-8?B?eXR5S0R3NDkrNlFwYW5kVHJLWDlYQ0pNUjA4RzFPMWlCOHo5eU5rbmMxRGhF?=
 =?utf-8?B?VkVDTktnNzBxbnRLYXhlK3Rla2tvM1dBbnlpTHhGL2trcEo2bkxjUTg3dkZW?=
 =?utf-8?B?QmhCZmJLaTh2dXRjRDBlNllrSVovZkdneHhqeDVVa3Q1Z1AyTWRyM1RBNXRH?=
 =?utf-8?B?NnJWTUpoTW5sS255QUVYc2ZOM2N6WTllUTZCamlZQ044L2pmNjZqRDFHc3do?=
 =?utf-8?B?RUJZekZvbVdKVjF0S2xGUXdsRWJiZXlNOU5xQmR6ZFF0M2V5M2NhNEQ0TDRa?=
 =?utf-8?B?Mml0QVB1YW5pSjZUbWJzSW1KVWY4VHdXTHNBaTZZZTdkR3pNNUtXUW8zbFZv?=
 =?utf-8?B?U21kTmVIVTgvaVdSTHZJSFQ4alNJZHNIb1VFeWVVVCtNbmRmYWN5Z3Z3anVR?=
 =?utf-8?B?YnVGdk5KRXhtZUtVUmhORVVtcXFuL2VGemxxd3BlaTUrQlRTM0xHZDJzZDNN?=
 =?utf-8?B?YUc5V1AyYkNVU0ZOTVdMRVVKQXN5M1A3anNLRDNsYkp4ZnM2Z1ZCZ3dIK0F5?=
 =?utf-8?B?REZhM0pRRVNUeHB3ckF0VHB6SHdyam01Q3luTWp2ZUtGN3drRjYyWFd4SHVC?=
 =?utf-8?B?VlgrU3FuK3ZhQVk2azJ0ekEzcHpsUFR2MTFVbWVXbVlzWHNyK0pWU0RzWlg1?=
 =?utf-8?B?Z2pGV05ISitQa2pXNVBoVU0zVHlKcHhpVWxIblgzZm8yWXc1WXFYOHFaVmxa?=
 =?utf-8?B?K3BHOWJYZ3ZIdkg0WmtCbER0RzdsUUdRWW1JSWhHVVVtYW1TaXhia1doZXNM?=
 =?utf-8?B?TnhIUkE4UVlJWEZhSFQvWHVaa3h5eFBodk41VFRZYy8vWFlnQTkzYzVGV0Jo?=
 =?utf-8?B?NXYvbnZZZC85VnRud0NXdHN4STgxeXlPN3R2UUhTZERpMjgwY3l3NlErVkZ1?=
 =?utf-8?B?VGFIbWdhQndLVzFYTWJQb29lM2pISnBXZ2k1SmVIY05BVFlTVXg2bDVoWjlk?=
 =?utf-8?B?WXBKdE9HVlh3NVkxYXpEeEpsRGxJWW5qdmRlNFREeHB3ZGVEWWhsOUozQkZh?=
 =?utf-8?B?RG16K3pEWmlDSWlNS0xmNHh1eUZsMXVsZ2R2eTNmRHhONm1nZDVLODJ6Qzly?=
 =?utf-8?B?bHl4TFdDQ3N3b0pZbncxSHF5R001WlBTeFdsUlBqZWlKSjlLcGtHdzF4ZnpY?=
 =?utf-8?B?M2E4VzVOT0tlRExBYzBoSnErR2oxWUMvQ2RpSjZsMitQY20vVWtzNFRPY0tJ?=
 =?utf-8?B?YklHc1E2QkM3cGlwTk1McGJXUzdQUDJPQUVXWm80LzcycEd2YzNqUVJqSThw?=
 =?utf-8?B?NHhUcFEzR0RBMlJjK0Z3NGlvRUF3MUFVeEY3NGtyd1hpdGN4SGRZTko0RG9I?=
 =?utf-8?B?bm5tcDc4QWZGaXVOdXM5VENKWXRkR1R0Z2RQM3A0THF3blpSQ011NjNPZk5H?=
 =?utf-8?B?ZE8ydk1NbUM0aFZZbFpXYWJIUHRXQjJEYVI2bVZPL1JzV0ZzNDQrSVM2enFn?=
 =?utf-8?B?RXlqVFpIbnUyczRsVTBNV3RHR0RJZktnS3N5K0IvcDkxSGgvNnNBV2cwL1li?=
 =?utf-8?B?bnBIdWV6d3U4Nks4QjZsWnBNWk02Vi9ILzFDMVpOTkVqaUdyNjFFZEdYblNG?=
 =?utf-8?B?citlbkZta2FyWUVrdmhpZWJCazR4QUxSQWMrMFptc3ZPK091VjliSlhvbE9R?=
 =?utf-8?B?ckJKRW1wdk5ZSHgvSEJrVVRiU2ZYS3FYQ2JrZTdGQ215NjI4RkN0VzkxUmhk?=
 =?utf-8?B?SjQzYUUrWEdxU3M2cHU0UzU5S0FaODNEVCtkQjhNV3lBVDZ6dHJkTXVaNXAy?=
 =?utf-8?B?YUJhbDBZaTV5ek1xaVd6dz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF9F241213AE364F94EBB706A922F303@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9014
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b13bcd1b-5e23-4932-081d-08dc7a4a18c7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|35042699013|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UVVFNlNQQWZkdHhXdzdZeEI4RnI0bVVPdTJnVm05OGRrSmdhaTVBZWlqRHN4?=
 =?utf-8?B?UmFpYU9lVkRWeHdydmJSSU9TKzZBNkx0a0xyTnZEY3ZvOG9DQ0MyRjJtOTRx?=
 =?utf-8?B?eDBCUEowb1pVRHFYU2RlSlhqZlhtbjZDZ2lzMUdvZktybVFVUXZMTDltVTFN?=
 =?utf-8?B?Vzd5NXVCMG9hTlptMlNNU2xWendSVWtLUlo0RVVBSHZFTW1ablJvd1drbFUz?=
 =?utf-8?B?UWgvb2w0TG5vZGpIQXlZWk5xcUwySGxoeU55dDBkRXY3d3JZR3dZM1N6YkNM?=
 =?utf-8?B?SW84VU9LWGlSR21mMlJLVlBEbWpLcGxYdDRPOTNlWFpud1lCOTQwcFJ4dU9l?=
 =?utf-8?B?N1pDYXZ5ay9lRmNLQndjM2pEOHNSR3ZUM1FlemlIUThvTitOUldVQ0hvR3Zt?=
 =?utf-8?B?MlMrZGhFdFBhTkpiQTljUXFnOVpaZmhvdDNQODVMWlIxdEdxRGFYZUxDSGIz?=
 =?utf-8?B?SzZaeDdCbmVTUk13REZaOXhiZG9xa3N2NlY3RUFyNkRZcnBhUDM1N1htaGxz?=
 =?utf-8?B?cU9JaHlUWEIrdWNMMHA3bG50MHhzdXZpVDhlTENUR3JHUm5nb00rVVU1K2FU?=
 =?utf-8?B?ejJERjQxRFAxaEZtUS85clhhbExrajErcEFqdmpmTlhTN0MzektHVXFGVzE2?=
 =?utf-8?B?MmpKbHJqZU5uQ2wvNkJZVGMxTjB5cnVaY1RKOVpTNXVVRk04Q1FsdG4wRVBI?=
 =?utf-8?B?U1pRRFRzanlwV0ZCRUx6RlhqNDVwZDVDWDlFOW0zbnhZeUYxVG15bkQ2RTky?=
 =?utf-8?B?b3NjZWZ4LzBEa0tselJlazJCTWtCQ1lZaFV3T2JsaERLNzJaUlZuUXgzR1E4?=
 =?utf-8?B?UWxqOTgrUFhvOXBHdGJld201TWcyV1NmS2V5N255Tk5HQm9oS0p0Q3FuR1Bp?=
 =?utf-8?B?NU5Dd2dZVWt6Y0dKdnVrZlNLVHExQXVRcTd4eWROVXEvWUxmbDlRRHA0eERF?=
 =?utf-8?B?S2owejFEdmxUSTUrZ3N2ckZHakxKWWt2OVkyMy9vdGRpS2xyY1A3WDB4RHJ5?=
 =?utf-8?B?WVFZVUpNcDFPWnV1MStCd0VmNmpNc3hNa2NtTDE3VEtHYzduOFpZUzlraEdu?=
 =?utf-8?B?aFZkNnlUSjVEODZyWDB5QTVZK2VtZ2dvL1pMTUNCUE1rQS9BNUROZ21pWGVO?=
 =?utf-8?B?V3FHYWlpNnFlT0VoU3QwZnZDajJZMWNYS29UUWJRcjAyNWZNMWRyRzlWaU9w?=
 =?utf-8?B?VmJQOUFCTXRHM3pxMm5qVVU5UExPTkNiaCtIVzFla3lFcTZlRWVrWkdqRWJ6?=
 =?utf-8?B?TjNiYUxWWmRvNnluOERxRlA0ME1WbU00WlN2eUNtL1J2OXhVTGc3Z3J4cExw?=
 =?utf-8?B?NnFEMnlJQVdxUi9tUkt1OXRCM3ZFZHNhc3d4aGszb0JEWFI2VmZ3WkZ2RWln?=
 =?utf-8?B?ekhKTXZEQ0c5eVZBQlkrVytZYWFLMFJBWlk0Q1dJV2svRVNOa0Yvd1lISEtW?=
 =?utf-8?B?SXBoZVhJOFE2NjhDbUFjZFVhYS92SllvUjgwbXQyYWhVY2kvZEZXeHR4UVUv?=
 =?utf-8?B?UitQZ3N2aEtISVBML1B3Q28rRWQ0S3l3SWMydis3cmd3dTVjUXJ3bXdJUUVD?=
 =?utf-8?B?dm4vY0hLbjhUaUFzN0xiQ3AyT3VDUGVKdy9YU3gwZGpVenloZHdtWnl1Yjhy?=
 =?utf-8?B?SWdGdFJWbmpsL3BzeUhDNER4aUhSRmFBVTlyNktMYTVBODhuWW5zQUx3WjZX?=
 =?utf-8?B?VWowQ1hLWS9pOUI0cGMxNy94ZjRlSXNBcW96MXFIczhnZEtMNFk1NHRranRR?=
 =?utf-8?B?ckhuS0xSV1ZqZzM2bHpMUkkwTW1aWFlmZWZNdisyazZZcmFqbzVVZUhYc1NE?=
 =?utf-8?Q?xJBmJTJ7K+dVjzQXbxRInpKv9daheOEVnK/BI=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(35042699013)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 10:29:53.4428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76396a2c-2b11-40bf-81f7-08dc7a4a1e58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8676
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 10:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199745

T24gMjEgTWF5IDIwMjQsIGF0IDE5OjU1LCBBbGVqYW5kcm8gRW5lZGlubyBIZXJuYW5kZXogU2Ft
YW5pZWdvIDxhbGVqYW5kcm9AZW5lZGluby5vcmc+IHdyb3RlOg0KPiBJIGRpZCBzZWUgdGhhdCBj
b21tZW50IHdoZW4gSSB3YXMgdHJ5aW5nIHRvIGRlYnVnIHRoZSBpc3N1ZSB3aXRoIHRoZSBlYXJs
eSBjb21waWxlciB0ZXN0cywgaG93ZXZlciwgSSBjb3VsZG4ndCBmaW5kIGFuIGVhc3kgd2F5IHRv
IGluamVjdCBza2lwX3Nhbml0eV9jaGVjaz10cnVlIGludG8gdGhlIFtwcm9wZXJ0aWVzXSBmaWVs
ZCBpbiBtZXNvbi5jcm9zcyBhbmQgc2luY2UgZXhlX3dyYXBwZXIgd2FzIHN0aWxsIHRoZXJlIEkg
dGhvdWdodCBJJ2QganVzdCBvdmVycmlkZSBpdC4NCj4gDQo+IERvIHlvdSB0aGluayBpdCdkIGJl
IGJldHRlciB0byBtb2RpZnkgdGhlIG1lc29uIGNsYXNzLCBhZGQgYSBNRVNPTl9TQU5JVFlfQ0hF
Q0sgPz0gIiIgdGhhdHMgaXMgd3JpdHRlbiB0byB0aGUgY3Jvc3MgZmlsZSBhbGwgdGhlIHRpbWU/
LCB0aGF0IHdheSBJIGNhbiBqdXN0IG92ZXJyaWRlIGl0IG9uIHRoZSByZWNpcGUgd2l0aCBNRVNP
Tl9TQU5JVFlfQ0hFQ0s9InNraXBfc2FuaXR5X2NoZWNrPXRydWUiIG9yIHNvbWV0aGluZyBzaW1p
bGFyPw0KDQpJIGJlbGlldmUgeW91IGNhbiBwdXQgZWcgbm8tY2hlY2tzLmNyb3NzIGluIFNSQ19V
UkkgdGhhdCBjb250YWlucyBqdXN0Og0KDQpbcHJvcGVydGllc10NCnNraXBfc2FuaXR5X2NoZWNr
PXRydWUNCg0KYW5kIHBhc3MgdGhhdCB3aXRoIOKAlGNyb3NzLWZpbGU9bm8tY2hlY2tzLmNyb3Nz
Lg0KDQpSb3Nz

