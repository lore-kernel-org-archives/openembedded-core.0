Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C7EC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 18:34:25 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.50])
 by mx.groups.io with SMTP id smtpd.web11.3384.1746642854204824876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 11:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Q8PCFXn3;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Q8PCFXn3;
 spf=pass (domain: arm.com, ip: 40.107.247.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bZ+HbCXNAGgdNYStokeyz9v/4xtoQ+KY2oyuMc1Bkba7dQ2Tw/YTDsa0HgpEQ0arC1PiV03f3deRDWsI3OepUacoOF4Se8nT++KhKe5xf1I2VNf9i89CqrDNynFZJRxal5L0blaAcGmnQm4AdKlkjA12PwGFMb0n/876u8WPhYO+rtfXkFWdeGWDGX8wFpJ4svQZP44A6R1f6b9fN4nA+DCACqp+4LFlc+JFGpz8/gd5DvVbvHV638nO3nQaRttowQ0vEUoDFnQE+MpOQUDYWONOQhA7+vKtTPU5Y37pb/dktuzH4s5M8RlWAwQlTTnjaWmhR0GzzvLquUd39aPB0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYfNsTcpkFuw+/z+3joiMYY7sJimpDn7e5UnGZ/VnIo=;
 b=Nx/3AO1mBjlQ0ETdOolXq/kwgudMzYUjNdBqcQ1VAFFnwh016PdaugZYTTVgQwgGBmlPHJxxasrXtD3/B3HPXzgFBj70qYNaEdGfTdHjagrVKINev3fILFFoZ0u4yu42j85d+mGCTAoQih7wHPrmkRdM6yx8oBXZnfpW+fN12mqqzzIOBg2bw9h1u5p7gT/OYgv6wOclpNYuV4qQDDWKVUUgrd4nLMXqIy/+YlrLzwnFOxWhPlWcYFY+5v2rB+Fe3uOEKpIum8j06OI1rwSIQ8c3IPnoT3S6QLInUOGIdqrbWu7RZJbu1Cv3t3P+pUUdbYXmFzwnDNLVee+TTjQaqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYfNsTcpkFuw+/z+3joiMYY7sJimpDn7e5UnGZ/VnIo=;
 b=Q8PCFXn3joY2DxDuoGmo8gGgKvLwGk56omtfLKAhTyA5UhmviS4DtExgv+NJ4NgfH7mXjpj6iycWeNdLJ8Ue+q0zAT+pZjWaT1au3Mq3p/hSQbM5HZ5lvU/mHJkOHE/QqY4P7qOH7eFLrkykf0BGqtVLoW98pr1C8KqSOv7NjUM=
Received: from DU7P189CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::26)
 by AS2PR08MB8430.eurprd08.prod.outlook.com (2603:10a6:20b:559::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 18:34:10 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::23) by DU7P189CA0018.outlook.office365.com
 (2603:10a6:10:552::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 18:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 7 May 2025 18:34:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtuPVeTZEhByu4UogJxNu70tksDHhyYVmGsV3P8+/Eh15+qtormO+zeMVvYI1dOF1/SjQNi9rW6NAdBNth55IB92CvlMkFGGioZmw3xs6xo1tr4z1UGV9OLq1KztXAWOHxgpiyFMdZL9uG4ubds6HoOz1403N1Sg+qtPU1CMg4LcPwxgpiXudyhwCchAZcbBZe0OR/jRcTlI4Wefo3kCVu19y6viJWKjcjI2B+r6PaywidKVr6yAV8+mJcg+pCVzebpGXKVIZRuzkZSvc5VlMUckxQYWUTNsqRqRKbUQ0JpGo4QcJfxiA8i3eC/JrsPfXm/pyugsxsZPDWJzuWrcHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYfNsTcpkFuw+/z+3joiMYY7sJimpDn7e5UnGZ/VnIo=;
 b=pC/gwrhlAr4XLQOPuERJJWvSLPCj0s8EjBE8gSFvia/xAp8r8obixWQ1GaCCFbvA+Z7bTIQM+IO7IqZEQWPcE+/aj0LUWoxhFiEIgbGaZwUDpoS0EVu4hi7s+jvDsi7tApDaHsZaWqAcBCshlzsCrFf482oQzlqsJy9kJwq7LyTsvGKoqqNjqdqPJcR2NLqBME3Ia45wpJZy+W3DXi0O+rBDscE/sWCZA26lI9X04reg0Uh0DyM6XwSEL8WhxuBmoVuvtYeN40tFwFz1v6WBZkt2aXBNsNs8eoPDCnLbO7nQvunItiWEiaSkbkXj2dXpwq7tAF+Ge9PQe6cz64a/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYfNsTcpkFuw+/z+3joiMYY7sJimpDn7e5UnGZ/VnIo=;
 b=Q8PCFXn3joY2DxDuoGmo8gGgKvLwGk56omtfLKAhTyA5UhmviS4DtExgv+NJ4NgfH7mXjpj6iycWeNdLJ8Ue+q0zAT+pZjWaT1au3Mq3p/hSQbM5HZ5lvU/mHJkOHE/QqY4P7qOH7eFLrkykf0BGqtVLoW98pr1C8KqSOv7NjUM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8162.eurprd08.prod.outlook.com (2603:10a6:10:3ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 18:33:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 18:33:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "twoerner@gmail.com" <twoerner@gmail.com>
CC: Mikko Rapeli <mikko.rapeli@linaro.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs
 required
Thread-Topic: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Thread-Index: 
 AQHbvbNkRKnONZb/z0mamzEiNNt8CrPEHWAAgABJkwCAARR1gIAAGoSAgAAEI4CAAJ94gIAAdr+AgAACxwCAAIiDeoAARPMAgAABIAA=
Date: Wed, 7 May 2025 18:33:36 +0000
Message-ID: <B699294E-FA19-495C-9DFF-68AB3502240E@arm.com>
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org>
 <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org> <aBtspIFmf7KoIZ_7@nuoska>
 <20250507182924.GA700@localhost>
In-Reply-To: <20250507182924.GA700@localhost>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8162:EE_|DB3PEPF00008860:EE_|AS2PR08MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 195a7137-4013-4dda-8051-08dd8d95c1db
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WUR1dnJDRmFNR0U2TWtSZkZiRDR3UGVYT3RWZHZQYUp5WFM3VGxhNS9yYWVK?=
 =?utf-8?B?djJKWHNEWlJyVmpSMysrQkIybEZnYitLejJ2WGRsVXRtR2tCa1gyVDlFOFlO?=
 =?utf-8?B?dGtiYkR0Vnp2WlJ6eGdpQ3drR0hNWVE3SG4zb2NPa3NNS0xrN2pFV1lSZXVh?=
 =?utf-8?B?R1FJcXorMHRBUW1TQ1d1MGN1WTJyVTlTbEFES0xXNUVOV1dqZEU2d01vUkFV?=
 =?utf-8?B?N3VOb1NEZHZYLytZZzhRRitNYlc5NkR4V0NJc1BXZ3Z6bWlQbjVaZjZINHVv?=
 =?utf-8?B?STJYSEUyN1BJYk9oMXkzWUViYVkycHhnVnA5bDdRYS9MeFh4Q3FQZlVGOE5u?=
 =?utf-8?B?RTVrcmtXdytFQ2Q5YmVsUUtreGNGeG1wd3hpL3hVcXgrQmlmanBSZWQ4VWRS?=
 =?utf-8?B?YzgxYllaK2xkVnhkYVZ1SlZVWkhhV0tDMElHZjJsWmQ0MEhDUzJGYmlhS2Zw?=
 =?utf-8?B?SitQZDREV3BkRVpLM3Q5N2Q4YnAwb2lTajJwUmN1MWppSnpuY21YajdzdUZ6?=
 =?utf-8?B?ZkZCb0hTSmh4RmZFdnpKdXhkeFZlbDB3UXU0cElVTlNyRk54Tkp0NFBGejVN?=
 =?utf-8?B?THZXNlh3TlJFdnNjUHQxZ25vK0dBVXllUVgyb210ZDZBelZHRUdabklSSldO?=
 =?utf-8?B?Yzc3Z1RrS2NEbFhrRkl2cXhlRDBGUFV0OXdkQXFSaFlEWjdVcXNZYnVYRTMx?=
 =?utf-8?B?ZWptMDJpMXBDdnVuZStHajZ3UDdBb2l4cC9DdWRXeENkb3VmVTU5N0dmaGpn?=
 =?utf-8?B?cXJ2VlFjRW9nWmIwcGE4U3UyTm5CdG5HOVA1TFROL0lwdE1MbkdIUWV0RVpK?=
 =?utf-8?B?ZS9mbXEyRjFQMHhDQzczN244T0cycXJTV2d0aFNIczFkTURWWXhOenQ0enNy?=
 =?utf-8?B?ZHhzZmpsWlBBR25zVjduL0ExZzVSVis4NUJIMVB1dkxTSDhhU1lKWStKa1Qr?=
 =?utf-8?B?bkFDb25oYktqWlRKM2dMZ2F6d2ZFZzhtZUNNT3JJdFhCYVpWZmp4bXd3N01x?=
 =?utf-8?B?Z0dMNCtUR0prNjBRekxwZk9qVk1INnhRTDRiMVhmS2NGREJaVGJlSVg2S25H?=
 =?utf-8?B?UDdPMTZVdVdDcjZKY1ZKQ0IyNmRLV1djdERtcStwaW42emVDSkVkOHBxaGRV?=
 =?utf-8?B?UGw3R2s3elVKbTd6MUdWa1c2ZWY1Wm9nUFhjTkdjR2ptV0pkRXhpYjFkVExY?=
 =?utf-8?B?blBobTVVN1YwVHlCSFE5VEc3cjVjeE5SWTFkaHpMdEk2Z1NRY2JidE9hZTlj?=
 =?utf-8?B?K1BhcEtVSVNjd3VJcnZFRHgwVG1WRGxrZWl6WkhOdWJaMDFKZEtLcE52M2xZ?=
 =?utf-8?B?MndhWWlBME53c2NJcGpGRXdtQW1RRXlqRmxOWmpiYWp2ZWpTUnFPQngyMm5n?=
 =?utf-8?B?dExhbXZKbGZ5VHdWbXc5OFpqcG5kb1dEbnBQY1Zya0JwcXpzYUxaVjFheUtl?=
 =?utf-8?B?OFBQR2Z6VTRPWVJhT0x6OWRDcWFkUGN4VGFHTjdqNnVXUkFIdy8waVRPZU9Q?=
 =?utf-8?B?ajF3ZXBIV1RPdGZJRm1mMG53dUNEZTFDbksyWk1TTlMwUjlYOFhHQ24rN2Jw?=
 =?utf-8?B?cFRVY1ExS3p6Q0dMUXhIc0pTMEMvcS9GSjZ6dGdjV1BnK25WbzlPemp0UHRj?=
 =?utf-8?B?c1hYdWtvVHlzdU4zQ0RxSy9HZkJwOWxra1Y5ZW9xT0t5bmpuV25HNnk3cVRG?=
 =?utf-8?B?RWw5Y1JpLytOSGw1MFhhSXZ3K1ZCK2FNT3psdHdCL1p4Z3ZCcHczVWpiV3RN?=
 =?utf-8?B?UjQyUXRBRlhRdGxqRXJwR3BWdVRrakFvS1F2YUlQQnRidlBzTzdSVzZ0bVkz?=
 =?utf-8?B?ODJNNEtSMDd3aEIxdTU0QlhpU01odFRwOTR3dDdnbHdUZG9DVyt3NjZTOUJq?=
 =?utf-8?B?d2pyZDhHTUhKdS9NMzdqZTQydG5mNGJ2ZUNnM0hNUFZZMlRPOHhweVdMNXNN?=
 =?utf-8?B?ejF2M2Z0Ullqa1c5ME1LRExwUXFrMzhERWNTMHVXTUZSRU9ManVkckFGdTJK?=
 =?utf-8?B?MVZ3ZkY0UGJRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <19F70B54A892D74DAF8B039F650339A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8162
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f00bc4c2-2777-44a0-1d60-08dd8d95adf1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M3ViR1M1U1gwYnhWOUpnWkw4RmtuWVJTQ3c0L0dIZjREZVJYcVhINHgvYzVU?=
 =?utf-8?B?aW4rSERjTk1YaWJFRGw3VGVycTRLY0tCcmN4RlVLdUdUL0NOTjhmVHlwYVgz?=
 =?utf-8?B?RC8rQ1g1dFp0OUVWKy9vMnNPd0FnZzkyc29oQU9rT3p1OUYxNjQ4WTFhcHBQ?=
 =?utf-8?B?ZUlJOFZqWnBER3cybTNBNmRjVWZ2TU9Jb2hhM08zY0VsSHZSclhvZzVOZEhu?=
 =?utf-8?B?STBpYXZtQ3RrVm9sUDVFcDNvUnZGNTBVdDAxUVppR1hqNmRrRXcvVkE0TGRy?=
 =?utf-8?B?a0V5eHNuY0RRZjUzbGdwUUxUVmZWRkxjV3JWeEl4N3hWWVBqMm1BVzdDa1A4?=
 =?utf-8?B?ZUxHZTlTd25lOERCRk12Z2hvdUdEenE5djd5NHN0Y3hYcmJCS1pWajlRYllF?=
 =?utf-8?B?dEpkZ3J4VjhlUXA5SERQY2V6UU9TRTh1b1lJRW9YeWRUUXB0Q2tiZXNkaFdr?=
 =?utf-8?B?QlRjaDVreUJGbUorYjNjM3VNZFdjWVQyOGFvNVNhZkJ6TWFUWWd3cmhVZ2o0?=
 =?utf-8?B?b1h3eEdoVVE3Vkg4WXJHRTVzaCtNdU1xK0VzenJCYTJBVm10Y20wVHMwWWZX?=
 =?utf-8?B?bTEyc3I2NHV4eExWdUFBSmovdktwU3FScmNvazhjcVByc3JPd05yQWhOSXov?=
 =?utf-8?B?VFJ4YVEyeEEvb1d1OVFySXdTZHFCb1EzMHhpQ1dYeklReVU0ZXAwdlVDd090?=
 =?utf-8?B?YndLTzE5U3RIejd6c1lwaURMdnhuM3FEOTh5UTgvSldhSVdwUWNWamhkdVRw?=
 =?utf-8?B?eHlHK3d3YWJGNitud0JBMmVjV28xWGtDbVV0WW9jVWlLSjBmdXRkTzAvKzJx?=
 =?utf-8?B?T2NySk1aN0ZDTmdtaHJTbEdXMmJiem15eHBzb3EvRDFhSXBtWVM5Y0N4K1Jo?=
 =?utf-8?B?OXp3TmlOQWdKc2R0ekRHblFCNU5BNVFneDJBRkk1RFYxQUZSckZvVWhOeTh3?=
 =?utf-8?B?dW5ocXpwaGRYVXpjelBmbTg5aU9ya1dTbjFPVW5mclM5NjczWEswL2RSeGZn?=
 =?utf-8?B?ajZTQVRIRXNtTjBCak1yV3dUeEJ6WUc0UnE1TkkzTVpNNG9kSUNCTUQzSWcx?=
 =?utf-8?B?WUtyWldUZTFQTUZwNmFiY2t2NnlsVU1KOHpHZTgzNXhibms3THNVb3JCbTA0?=
 =?utf-8?B?djdwWVV4S29sTjZ4dURlQ3R1MmVIZGNwK1dwRmh5OVFoeCtqbTZNT3Y1YnFz?=
 =?utf-8?B?SFMybFdIN1NLcDBRNExhSm0yT3ZhUjN5aVBpVEhjRXJ2VkpkbUJSbWpBNTFh?=
 =?utf-8?B?aXEzcWEvVU5PQVBkMGhOVWFySTBkYW1YZTVxcHRmY003RlBqcHoxcE5NZmlG?=
 =?utf-8?B?aHZZZE9UcEVvaEhleTNpWURCUFI2VFNLa1VaVDRYQXErZzExTVcyUmx0S1Uw?=
 =?utf-8?B?Mm1NK0pxQlFXcjhLN0gvZlNzMWNTZmZKRkduN0NRZTB5c2NnbnF1anFxZVQ4?=
 =?utf-8?B?ajJXVTdnMUhQL1h6TFhOT1JoZTVpR1pLM2xSRElmQ3AxdWw2Qno3N0VGdjNK?=
 =?utf-8?B?QU11OWNKQ0kyaWRXVGF2dUo3RFZ6c0ppenYrYVVyU2xFbzlyL2o0c2tZVUI1?=
 =?utf-8?B?c1dMWUxjWGFQeXBHejFNNW9kd0d1THE5akllUS9PN3JyNHY1cXl6dDcraEx1?=
 =?utf-8?B?Vk1HVXNrZkdPTzk3VjR6U1hTcFRid25qVWJ6Qm9vOThOcUxDOGp5ZHdicGha?=
 =?utf-8?B?Z1lESkJSUEo5eTN0RjlaQzFLaFZJdTlLbHMxWUZSZ242djBxNEJUVDJIc3Rj?=
 =?utf-8?B?WjBhdWxKYnFUWkRzdkxZbVB1M0IwS2hBWEJyVXMreVo4T0lkQzgwVXFFSll5?=
 =?utf-8?B?M2pndzRYclo5a0tCSGZJa2RCRkZNeXZOTWZrMUQrUWVrZmlNVVlzK0FsNXlz?=
 =?utf-8?B?MXpoR1FYVG1DYnBaempaUHdxakluZ0dkeWtqSnZobXlLZVdYRkhNNkcyUzJl?=
 =?utf-8?B?TDA4ZWZMWVVoUGJ5YlhEcXkrY1VNYXBLWERBNFhjcmQyZ3FtWm8yMmZnRW1K?=
 =?utf-8?B?K3RoVlA4ZFd3K2VWeVRmSzdGQWJacC9NdFh6MU1vZHBJdEJacjZVVDBzVnJx?=
 =?utf-8?Q?mxgG9V?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 18:34:09.7512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 195a7137-4013-4dda-8051-08dd8d95c1db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 18:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216126

T24gNyBNYXkgMjAyNSwgYXQgMTk6MjksIFRyZXZvciBXb2VybmVyIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDx0d29lcm5lcj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiBJIHN0dW1ibGVkIGFjcm9zcyB0aGlzIGJ1aWxkIGlzc3VlIHZpYSBhIGNvbXBs
ZXRlbHkgZGlmZmVyZW50IHJvdXRlIHRoYW4gbW9zdA0KPiBvdGhlcnMsIGl0IHNlZW1zLCBhbmQg
Y2VydGFpbmx5IGRpZmZlcmVudCB0aGFuIHdoYXQgeW91IGhhdmUgZGVzY3JpYmVkLiBJJ20NCj4g
bm90IHVzaW5nIG1ldGEtc2VjdXJpdHkgYW5kIEknbSBub3QgdXNpbmcgdHBtMi4gVGhlcmVmb3Jl
IHlvdXIgcGF0Y2ggd2lsbCBkbw0KPiBsaXR0bGUgdG8gc29sdmUgbXkgYnVpbGQsIGFuZCBvdGhl
cnMgd2lsbCBsaWtlbHkgc3R1bWJsZSBhY3Jvc3MgdGhpcyBpc3N1ZSBieQ0KPiBvdGhlciByb3V0
ZXMgYXMgd2VsbC4NCg0KRm9yIHdoYXQgaXTigJlzIHdvcnRoLCB3ZeKAmXJlIHNlZWluZyB0aGlz
IHdpdGhvdXQgbWV0YS1zZWN1cml0eSB0b28uICBUaGlzIG5lZWRzIHRvIGJlIHdvcmtlZCBhcm91
bmQgaW4gY29yZSAocGVyc29uYWxseSwgSeKAmWQgcmVtb3ZlIOKAlGZhdGFsLXdhcm5pbmdzIGZy
b20gc3lzdGVtZCB1bnRpbCBvcGVuc3NsIGluY2x1ZGVzIHRoZSBHQ1MgaGludHMpLg0KDQpSb3Nz

