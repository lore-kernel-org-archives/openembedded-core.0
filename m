Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3A2CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 17:37:29 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.33])
 by mx.groups.io with SMTP id smtpd.web10.1398.1757439439694206559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 10:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dXnYeldF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dXnYeldF;
 spf=pass (domain: arm.com, ip: 52.101.69.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hv0tR3Lnf3tJgHm4y7htms8y+A/Cvto68bcrE3Mm+BR3G5A/mjfCUHd8CQ5uOFnWxphaxpK9/Vca9VVGJU9U9UAF1+eExEaIpq9Jxf1Ti7GnfQk0GSt1BYJVVLhCgdl0HuvRl+H2l1zwVwGBESFctGqrXGR9bTQJLEquLbwgOwf3AB3nC7S5cxUY+EirM22dU2y0AL5MQ6wwiCboxyT/ydrXZzOGzst05HH6sun01rJVIHVTxlotTbi9MDiIebpoKVRh/hWCJWNCagYdYdDKTU+B0U3E8fNsWkLoGMZcmcE9eA3QNkugsFXWVyomkVRcy+Va7zyd6OKCV+TSQcGilw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHYujl1LjoFldXns3fAm+YgwsyIVSx525P+VbbI45Bs=;
 b=aJxPotfSnYiqiQzPNspBY344Myl+SPkh7egUV6BRAHjxA8XcH8PIwZQoeomgrU7yD7aShDdD8/4Ji9i4oMCh8WIacCQcZgHu3Y1GjHHpDQMp4/1Y7yuWWowMzhd8VlkCiShWSv8SvqmctKuPye88T32+bMKoqDhLh6f57uXLmhn1xK7it87zfCRYTsTXAT+rBMdSwQsafkU7iuSUECf9Wnyid9zK/rTsMoGI12FRix2TdZhvvAFvaFVn3Bc1alwaOmDOwSZ9wHMhsaejEJCbWEKtcB+YQfMrRrIj8wfQviZU9QtZM1UX0SnxW+VVPg6zw2rgQiYvY3Od53vWT8uYEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHYujl1LjoFldXns3fAm+YgwsyIVSx525P+VbbI45Bs=;
 b=dXnYeldFRaCKrSJ8bBkTJMgNk6uWLW2rHu5yyQFg94Vybui0hbIfmnZYpfc/1iPpccbYGl58YMojkzkPmY8wwbFUv0c5DllNzRm0+0gQG+Qoe+fqg6c+neUuUyjEGGtiOP/06ELFpEtzE9o0z46WifiRSuYdJkpfW8QsfilrNEE=
Received: from DUZP191CA0033.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::29)
 by PR3PR08MB5708.eurprd08.prod.outlook.com (2603:10a6:102:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 17:37:10 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::f) by DUZP191CA0033.outlook.office365.com
 (2603:10a6:10:4f8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Tue,
 9 Sep 2025 17:37:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Tue, 9 Sep 2025 17:37:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJC4ZvzA6agUPmMn8XERZD2valPIa/NeIoTRFmWYA0cXmifKpqX7p7lnjqU92VT4vRbbyu0VE/lBt9vAUsGS0okW4Igj/F07cMNp2zM7O5gVEeSDnlka4gkqiWtXTiku/jjEmAQhvwZcl9g4EMeGeVq2ImPcGZk+8MWaovi4QfWm+EPOlJM9Y38b/TCAxkKv8XERKm1pN5VnBr9b6QKh8O8YlJGeUWCmdXulnK/KEkqpmgQVjX0MujKbtRKOO1ve3KYqJjHsRFYjhBDqNShiGTiSzS7dUsKaNXcmmm4mDLyPKNoS+GGEC3QnOIhmQ+n5G5c9X9B8cnyMqB+SYB6AbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHYujl1LjoFldXns3fAm+YgwsyIVSx525P+VbbI45Bs=;
 b=HAoaq07nF7hhWHR7RPYFwws+kNqnqDzMlqEMPT8mEOfMM4wfEkfwIOGEsOTJKCZ2DHfTjRcNoqGMoS+hPFV77Dw2kQquUC3xR3U4vqXXN2ULOS5Vxj7yc3rLG4Xa7JGEofUgUCPsJXKDsoBlbT0YlwLKuV+qGw0FOtMZwH+mkcH7D3N+j2fHaJJ+RZkj+uRmjDmj3MymWISA06gek+8qrI4XN86W97uS+tvSfq5JUbnGhVpDRe3wTT76NHV55CvNsicKYMmKskMuQUATfo2g9hlo9yaNuvHls43qmlgHegh1UsDx9U0lV6NCxje1LvBxvLNbOSMWzfiO2i8wf4uWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHYujl1LjoFldXns3fAm+YgwsyIVSx525P+VbbI45Bs=;
 b=dXnYeldFRaCKrSJ8bBkTJMgNk6uWLW2rHu5yyQFg94Vybui0hbIfmnZYpfc/1iPpccbYGl58YMojkzkPmY8wwbFUv0c5DllNzRm0+0gQG+Qoe+fqg6c+neUuUyjEGGtiOP/06ELFpEtzE9o0z46WifiRSuYdJkpfW8QsfilrNEE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB9160.eurprd08.prod.outlook.com (2603:10a6:150:e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.33; Tue, 9 Sep
 2025 17:36:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 17:36:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v3 0/2] automake: 1.17 -> 1.18.1
Thread-Topic: [OE-core] [PATCH v3 0/2] automake: 1.17 -> 1.18.1
Thread-Index: AQHcHU2uZfJwQr6atkefC5I+2ZXuvbSLJeMA
Date: Tue, 9 Sep 2025 17:36:28 +0000
Message-ID: <3957CEBF-0FAA-4C28-B447-E783B23D9B1C@arm.com>
References: <cover.1756957117.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1756957117.git.liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB9160:EE_|DB3PEPF0000885D:EE_|PR3PR08MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de9232b-745a-48c1-5de4-08ddefc78056
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QjVsSUtuUXBYeHBBc1FNR2tVb2lEczBOZVljSS9UMGFDUDZJVkRJT3ZYWXVW?=
 =?utf-8?B?Ym1rSjFCK0pjNE1LU3l2WU0rN0lkdDl3ZEdjMVlNektDUkd6M2ptcVBGa1dK?=
 =?utf-8?B?VUczcGNiS2NSZ2p1L3pQSTNCNy9CM1d1aUhXTjVNY1FTMzNMVmtYYzNFM3BC?=
 =?utf-8?B?YkVSanI2WTl5SkxHM0ZBbFlYeCtyaTJucVBJY21FRVpnYTNEdjE2TUxpS2Fi?=
 =?utf-8?B?U1NOcFNob1Bqd2daZGRFRDVBZ1gzN252UUFISTlhcURndklzZm1mcGxYY0k1?=
 =?utf-8?B?ZzV1d2xZTFNFREc4T3ZVSWdGM0tZLzllTlZjbjBqejNaeWZXK3lSU3oySmdG?=
 =?utf-8?B?UmpkVVJRemVmS0tMdDUxSzgyZ2crVlhiYSt6WHcyamJsczRRVzFYV2J2dGVX?=
 =?utf-8?B?eUduSlhPeldrQ0lTYStSd2RiYU1zYkhGZTRUalhZZVRYWDVoUXFZL0ZudStm?=
 =?utf-8?B?d3hCdDN1d1BpNks3SDJrS0taTWYvUkhueEFSZTRUdVhLUU4wZUNmTjlWdU1Z?=
 =?utf-8?B?WDIzZFdhK1FXcGxhcTJXVVlPc1U0b0JSaCtqV3BkV0h4M1FrMjBSWWluVWJr?=
 =?utf-8?B?ZWhrekVSZmhQcnBKdXBFU3RMYWVVaVhWVStocitpc0VyODlIVXlZMlZwZ3pQ?=
 =?utf-8?B?UXU0K0wweXJsMmdjdGEyN2Ixb3F0UWJuK3Q4M3RLcGhDcW9xbGRKKzhGUk5q?=
 =?utf-8?B?dFpoWVZUTElNeU9IT29UZW5Gcm9BVURLUUVlV0UxUXhaSmNxUm9NT3QyNEJY?=
 =?utf-8?B?MTg4bUQyR2dkMTAvNmtsSjB0Y01HQ0RuWEFSczZxRGNjTWJwUWdqRVNHSWxw?=
 =?utf-8?B?dHBNeDhPVllsSGVnZFk2QWtiOXVRTVBTR2pjMzNjSGFVZk40a3Jjd09handz?=
 =?utf-8?B?UmxaNldsamVQNFZ0OW9kZnZuTkdmSmxwb0ZSQnk3OVREdjc4ZzNJd25MUFMx?=
 =?utf-8?B?TjE5UGg2OWluZ2tXNkJOcHZncEJWajBkd09OOXluMFpGTzE1VHgxRUNiRU1V?=
 =?utf-8?B?RThRbUp1enFKVVRUb3lqRlZoY2ZGbmNRbDR2MjBLYXBlOUxpbExaakZ1SG05?=
 =?utf-8?B?Y0RwMnFkOE5Idkx0VVNLaDYvRkg4elRDamoxU2NodndaYkRPYjNkSzNicStR?=
 =?utf-8?B?amJ0OFpFM3ZGaGRPd0NJZEhvRmxFeFc0Z005QzhIcTJIeEp2NlMrT0QzVUxt?=
 =?utf-8?B?RXFaeHZrZXIvY0w2b3ZEN25nbnVITm1abjYrOW4wVU5RU3B5T3NEd3djQllq?=
 =?utf-8?B?UElrcHZtRTlZeDZ1WHQrNXVVUFo3N3VEQ1lUUzNObEpOVk14ek1ic1hPNG9a?=
 =?utf-8?B?OTJLVldsclFIUEZVeVdJS0dyR2dWMWRIVnVmL1htMlgyejdST3VteUswUUJ2?=
 =?utf-8?B?NE5jS2p0ZTJ1ZmpJKzRpM04zMlVVREMxaWpVY1RHSmVmdWdyUDExSHUzQmZR?=
 =?utf-8?B?SjRuZm5FMHFXa1FTMTVxYk5nV3NrM25HRjB3M0xSYWRBNjVwMUlXZmpiS0ov?=
 =?utf-8?B?UjExZ0ZKcktuTU1DVEFZNjZTTnB2L1c0WmN5V3lNZVY1Y1E0UWMzMmJKaWc0?=
 =?utf-8?B?dWtMcC9TR1RTc291YmIyOVpHb0RhSUxhMHVHTkEraE1WVllEcUU4M3c4OVlK?=
 =?utf-8?B?WjJlOWI1eXdwSUxsZ2V0aVVSc1FiaWJNQTdSVllZcUxQOXJYYlZwZk54Y0Ft?=
 =?utf-8?B?Nzl6TzdrVE5HUzFOMzRGRlM3RHcxSzNFMnBDamk5WXBSb1NpR2pBQjJvVWsr?=
 =?utf-8?B?TEMzbVJ4OGtBazAwQzlpZDVZbnNSSTBmbVR3NEQrczBicXVVdk4vaGJubkc5?=
 =?utf-8?B?SzFKYmhsbGljcjFONUc5SzlEZVo2Z1JzcEk0RnRTcXk2eUxWaERObERTOVNi?=
 =?utf-8?B?ZmZEelBURndJTUoweHRNUVFVbkUwYUFXYVFOUVFtSVI1WmFNQlBvYkFtSnh4?=
 =?utf-8?Q?z3DlV/hGYq1Wv2TymAIoiVrt307C741j?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <387568819C81F24B9982B0ABD71E6AB7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9160
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2705ef62-e3ae-448c-2145-08ddefc76897
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|4022899009|14060799003|35042699022|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHBpTHRRRTE3S0p5L3ppMXVUMEpmSmFvUGtlbzRvc3diQ3daanBhZkxNSGRi?=
 =?utf-8?B?WklwRk5oMENQeWQ0M0NjYjFlNjl2cE9TNkpiZitERGZOYzFqMnpNclZwM3hh?=
 =?utf-8?B?VWVzZTFSU1NPYmE1a2FycWpzVWt3RHEzWmVCbGtHNFJ2MHFFV2xzWWMyZGEx?=
 =?utf-8?B?YnFla1FzTDlZcUVCRDdGUzgxNXd3TjlGOWhGaUVwbDFMVkRMZGttMFhHYUto?=
 =?utf-8?B?WWVSa05UZ2ZVdXpCOEJGWTV3Tk55M2N6VGxFQ0ZpekNzZ0dBd1FrYUdIc0s1?=
 =?utf-8?B?TW9IWmZBOWhFWW43NzE0VG96Zll0QmgyUnRaRS84eHE3aXNuR3pvcVMvcTZ5?=
 =?utf-8?B?bU1yM1l1Y3R1R05vbXFPRHNqV2JuaEVVclhlR2YydENaTllDcHN4WU8rSGlD?=
 =?utf-8?B?VHg1R1NTanFVbDRGa0V6VDArU2wxQ09LbXNZcy9LTTl0dUhSQjhnd285dHd1?=
 =?utf-8?B?eDF0SWhXWWxMVnVlU0RLSzVjUE1oRmtqeWU2SlNGbU9hSnMzdXNpdGVMelI0?=
 =?utf-8?B?OWg4ZmhnR3BtWko3Ung5ZGhFZVI0UmNvNFppM0pGeWsvdCttWVJ1TFRPcUs1?=
 =?utf-8?B?bDUzRmg2VDZ1U3JTRVZGL0dIckJXRkowUDlSTSsyTC9vOGN0SUZreHc3Z1Nk?=
 =?utf-8?B?ZlhDMkJ2SkE1SVg4U1hnVnc1MmtUdDcxamxLU2tCK05hdENybko0d0dOc1V1?=
 =?utf-8?B?RTFJQ01MWldsUU5Vb3FqRnFFbmZ2YXRoVVk5Ky9wU3JJMFg3eVI1MTREdmRa?=
 =?utf-8?B?ZTdzT0NTSHd5SjdHdHpzRGthTXBkcTMyM3NReTFGNXNKenNJbWlwcyt3MUZt?=
 =?utf-8?B?cHNLNEJ3ektjaDFzcFBjUWVBUTk4RVJHa2N6Uk5BeFg4RVBGZGoxbTBzRkRP?=
 =?utf-8?B?TzB6UTRHUkRzZitEb0tmdTVNUWM0cVVFSEhxQitEWUpJMTlybUV2RU5JMG81?=
 =?utf-8?B?Ym5sMkNYQ3I0bFNzdW1HUnZudUY2MlRIMm9qYWhOUjRmeml6emJ0V2JpcVpw?=
 =?utf-8?B?bWE2M2FWRlB4NGZKMnVLRmxkTS9WNlRkZWhmU2pBZ3JCamd1bGJ4bFZZSy9F?=
 =?utf-8?B?dE41bjNlK0ppWVBCU0d4OWRHdW9TSjhQYXhUTzBDVmF0Q2o1MU5iTm9WNmhX?=
 =?utf-8?B?UHI3RGcxOWFOaSt5SzBERisxd29YcHNIMnk0aDdQUmpMZG1GUCtKUmxaOVBs?=
 =?utf-8?B?TGV5Z3lDMkJaTHlXc1lsZlJzMnIwYTRGSm5KNmJHUkozR0R6V2xNTUFSSDZW?=
 =?utf-8?B?MEhCZ3h5eTdqaDZvbE1oTnN2VzlBNG5Cc0VCd1NlVSt4UTQzaElkeEVpS0ZS?=
 =?utf-8?B?c29rNUJJQlk1ZUw0enJReWZBNWJxdEVSK3FoR3BuNHFGczBNaElLVzhZVktF?=
 =?utf-8?B?dEtCSUU1WU5pbVJqTE81SGQwTEdTQzgzWEdJMU1ZT3pwR2JSK281UmsxeE9r?=
 =?utf-8?B?RythV0Fla0NsN200ZkhEVDVzeGpvVlBTd29TZ1JYMTUybnlKa0tVZ21zMFJQ?=
 =?utf-8?B?dGxQUWUxek1lM2I5MU50MFpQV0N3SndnZzFPcjRXVHpNWEkyKzIxUlJUUmwz?=
 =?utf-8?B?eXBYVHpxakJKUGpkazJDTFNtNGF3N3lJVmVOenc4eWFvVGZwKzY0RHVrbHo5?=
 =?utf-8?B?R2JxL2FFZlJYTFBXdTJ2ME56V2NvTDJrVGVxNk15dTNHd0YwS253RUZBOXBm?=
 =?utf-8?B?WVNxUy9qRlJtSENycE53QjUzb2krZXpaOUVWR0hlZXFvQ2xEM1RSaUFxWG8r?=
 =?utf-8?B?TmFEOHBjSFQyRWY3VmFVeWlVT3FxK0l3NEY2K2x6Y2pHQWd6NXBTYUE5RSty?=
 =?utf-8?B?bmNKZm5uaXJRZEtNejVrYzlSODkxTjcwSlN3VnRSaVdnQWQ3dTRhN0tJc29N?=
 =?utf-8?B?ZmdIOWI2V2x6L2pzNkdVcFlsQlcxZHlsWTgyWlNjWENaV05DNVplRlN1OTZa?=
 =?utf-8?B?Tnd3NVBGWFRxRFhNUjZCaFF6eEpWaENzdnB6dmozRnF3eFlqZWVpUGhOeXZp?=
 =?utf-8?Q?s7+Cdj9szDtzAUI8GHmZ/+4EVC0gOE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(4022899009)(14060799003)(35042699022)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 17:37:08.6124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de9232b-745a-48c1-5de4-08ddefc78056
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5708
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 17:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223130

VGhhbmtzIGZvciB0aGlzIFJvYmVydC4gIEkgY2FuIGNvbmZpcm0gdGhhdCB0aGUgYnJlYWthZ2Ug
SSB3YXMgc2VlaW5nIHdpdGggMS4xOC4wIEkgY2FuIG5vIGxvbmdlciByZXBsaWNhdGUsIHNvIEni
gJltIGhhcHB5IHRvIHNlZSB0aGlzIG1lcmdlIGZvciBNMy4NCg0KUm9zcw0KDQo+IE9uIDQgU2Vw
IDIwMjUsIGF0IDA0OjQwLCBSb2JlcnQgWWFuZyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8
bGllemhpLnlhbmc9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gDQo+IEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPg0KPiAN
Cj4gKiBWMw0KPiAgLSBVcGdhcmRlIHRvIDEuMTguMSAodjIgaXMgMS4xOCkNCj4gDQo+ICogVjI6
DQo+ICAtIERyb3AgMDAwMS1jb25maWd1cmUtZG9uLXQtcmVwb3J0LWVycm9yLXdoZW4tdGhlLXBh
dGgtb2YtUGVybC1jLnBhdGNoIGFzIFJvc3MNCj4gICAgc3VnZ2VzdGVkLg0KPiAgLSBUYWtlIGEg
cHVsbCByZXF1ZXN0IGZyb20gZ2l0aHViIHRvIGZpeCBsaWJjaGVjaydzIGJ1aWxkIGVycm9yIHdp
dGggYXV0b21ha2UNCj4gICAgMS4xOC4xLg0KPiANCj4gKiBWMQ0KPiAgLSBJbml0aWFsIHZlcnNp
b24NCj4gDQo+IC8vIFJvYmVydA0KPiANCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCAwYTg0OWRjN2VkZWVjYjZjMTZhOGEwZmUzNDcwMTVkNmQ4NWU5ZGZkOg0KPiANCj4gIHZ0
ZTogdXBncmFkZSAwLjc4LjIgLT4gMC44MC4zICgyMDI1LTA5LTAxIDIzOjA3OjAzICswMTAwKQ0K
PiANCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+IA0KPiAgaHR0
cHM6Ly9naXRodWIuY29tL3JvYmVydGxpbnV4L3lvY3RvIHJidC9wdQ0KPiAgaHR0cHM6Ly9naXRo
dWIuY29tL3JvYmVydGxpbnV4L3lvY3RvL3RyZWUvcmJ0L3B1DQo+IA0KPiBSb2JlcnQgWWFuZyAo
Mik6DQo+ICBhdXRvbWFrZTogMS4xNyAtPiAxLjE4LjENCj4gIGxpYmNoZWNrOiBGaXggZG9faW5z
dGFsbCBlcnJvciB3aXRoIGF1dG9tYWtlIDEuMTguMQ0KPiANCj4gLi4ucmVwb3J0LWVycm9yLXdo
ZW4tdGhlLXBhdGgtb2YtUGVybC1jLnBhdGNoIHwgMzQgLS0tLS0tLS0tLS0NCj4gLi4uL3thdXRv
bWFrZV8xLjE3LmJiID0+IGF1dG9tYWtlXzEuMTguMS5iYn0gIHwgIDMgKy0NCj4gLi4uMDAwMS1G
aXgtdGV4aW5mby1lcnJvcnMtYW5kLXdhcm5pbmdzLnBhdGNoIHwgNjAgKysrKysrKysrKysrKysr
KysrKw0KPiAuLi4vbGliY2hlY2svbGliY2hlY2tfMC4xNS4yLmJiICAgICAgICAgICAgICAgfCAg
NSArLQ0KPiA0IGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygt
KQ0KPiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9tYWtlL2F1
dG9tYWtlLzAwMDEtY29uZmlndXJlLWRvbi10LXJlcG9ydC1lcnJvci13aGVuLXRoZS1wYXRoLW9m
LVBlcmwtYy5wYXRjaA0KPiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9tYWtlL3th
dXRvbWFrZV8xLjE3LmJiID0+IGF1dG9tYWtlXzEuMTguMS5iYn0gKDg1JSkNCj4gY3JlYXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNoZWNrL2xpYmNoZWNrLzAwMDEtRml4
LXRleGluZm8tZXJyb3JzLWFuZC13YXJuaW5ncy5wYXRjaA0KPiANCj4gLS0gDQo+IDIuNDkuMA0K
PiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBh
bGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIy
Mjg5MCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L21lc3NhZ2UvMjIyODkwDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL210LzExNTA1ODU1OS82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRk
ZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9z
cy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

