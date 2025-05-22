Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A5DC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:36:49 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web10.22707.1747917406151395532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jv/IFRUJ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jv/IFRUJ;
 spf=pass (domain: arm.com, ip: 40.107.21.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FCpgtl/8glUuFBRjob7ZGzJCAVaVn7lfnIJAidjhg9djAXlJjaQ4rtP0Y0OU2xixD+yxqZt1/SjvWZ6nbDGQOkgKY7pT2BypGC6Q9iZZQdjfTRcEIgLQ8A53hF/fmbcod9x0JP5BV8h0RD5C4TiFnOGRs8qBC28iYIpz8p8DAnN9piLoS5fLPKX+2bR1mlKJT1lTklLHuAans7OuEkAPbeupHtRCaIsHV4dwpjrR5goNeIWX3uDvO7Lv/GYqVxf8ROB4aTW+9s2g8OpUS1AaR6cqALO+ixhWgttTb48kbbL7MFu4BNm4Y9IDFiBeCHBGaF8dGWxRPIyb1JwCuilVqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sD+N4MnKKhuLO2B0p65R7yAWfUAb0PjOS4cWmpP1IOc=;
 b=Qvaa835ACaV4Hf4kzBkMb++3EZnb4LWKcwIP/lRlDZRkWK5FG8cxkYMMbHYpF3toQDh/4KTZSrVnH3VVmFlzvp3iyYJ5mmmJZVS91lxkGjoloOeb6tzKw2KG+oAhOZK/XGxscjHQOGHCBgXyKOfMffEdZ/P2zmGV/6EU1oPV3gl4AXo1HhW43FwTlfqTlSI7kb9J+ltHdZwf/cVC6LOB295aOCq4e5GVcPT33J4HSOW/aIutkUpZmyN/HvlzNOVg/94+6JfYXUBlm2VTD2mtRrpvqJ6txQEhR8280NNs1BbvXQsNS5upaYRswLNaCOd/LdaIC8HBr3lylpuz5JFNoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD+N4MnKKhuLO2B0p65R7yAWfUAb0PjOS4cWmpP1IOc=;
 b=jv/IFRUJQhnECOYCtYh7pd6QTPuXfcOI4OiskzfhgrFqHd4VyqQjNqW5wwMKrkjDMOaRQTfGkUQsQFDwTTGFgqG4LkWPC6qEtqf8FaLKWQbcQzt8XDB7D/ohs2RU2WwFE3gu9phWP9xDupITCf2WPIuz4NUaG+s65g8yO9AMZvQ=
Received: from AM9P192CA0013.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::18)
 by AS2PR08MB9451.eurprd08.prod.outlook.com (2603:10a6:20b:5e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:36:42 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::e9) by AM9P192CA0013.outlook.office365.com
 (2603:10a6:20b:21d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Thu,
 22 May 2025 12:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 12:36:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igb4siv4bpC371VijgtLmaRHpUhN47Mbc39RzKClP+FlH26YZ01CvOzR1xOHRh+neQ5VkKWQqxWcd+JI02Jl4UyKC3rVWeW7RcpU5EWOUakyqn9iNIJOHMDJ6tZ4SuSuBFDEiuJ2KcuUotUOwztpC+f5OcdhriBYU+9qExpE5JugfTPyAL8bArJOcRENyfhID/njANZpXrLZEYSdtI6MF/oDND+LbaeN2QImSIQs4b8vX8/EKo1H+r9yvEOv2dBhOe5YLq3zuXExZAV6fWdZAPz53P3hMFKZ0ZeYQ52FPDiwPNJGiNv/WKYiq9negzAwaLKvwyn7ucLWP9EF0sLoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sD+N4MnKKhuLO2B0p65R7yAWfUAb0PjOS4cWmpP1IOc=;
 b=O5cZ4R/2E8LmfMHYkdPfJKnkr170dhNb6lDNVBB0ggV/MRPT7gVkFeonkzOhRhsQppMzls0r6LC0qpE/KAE+eaC8UJ2Uvbja7FEb9b7ZIU/MO6e0UJ2PFkkyTjAmyNzui/UmigLlKXKVdAi5D9XCIqp6xDDPhYuTT8V7o5Cyv1wWaWozbYZhotkeWS19nLR59gMfE+NWqmB+UKTCJWDA5lJjjHNYF4tJSLO4T7VwhtD4pKtPOpfp9waX3GS6FyvRtAusjs4eWCSsjM495EJwLGGqSePDWo6Ts16X6/z1kE/g+wyk64N4yIhhgmgokFHsBIChTNFvVl20wOh+A0YcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD+N4MnKKhuLO2B0p65R7yAWfUAb0PjOS4cWmpP1IOc=;
 b=jv/IFRUJQhnECOYCtYh7pd6QTPuXfcOI4OiskzfhgrFqHd4VyqQjNqW5wwMKrkjDMOaRQTfGkUQsQFDwTTGFgqG4LkWPC6qEtqf8FaLKWQbcQzt8XDB7D/ohs2RU2WwFE3gu9phWP9xDupITCf2WPIuz4NUaG+s65g8yO9AMZvQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5767.eurprd08.prod.outlook.com (2603:10a6:10:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:36:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 12:36:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] buildtools: Add a replacement for file
 command
Thread-Topic: [OE-core] [PATCH 1/1] buildtools: Add a replacement for file
 command
Thread-Index: AQHbytjKLhIaxA1TPUCpYShGvUhb+7PelnCA
Date: Thu, 22 May 2025 12:36:07 +0000
Message-ID: <BAA25366-9801-4043-BC16-A8C2BF807543@arm.com>
References: <20250522051651.3711352-1-changqing.li@windriver.com>
 <20250522051651.3711352-2-changqing.li@windriver.com>
In-Reply-To: <20250522051651.3711352-2-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5767:EE_|AM3PEPF00009B9F:EE_|AS2PR08MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 433dc7a1-c901-4d2c-3c8d-08dd992d4d1c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?akVZSGZXbE9wU0pEUVYvWG8wQkN4TmVuS1dDS2R1V2QxRmpKL21xRHUxbTkx?=
 =?utf-8?B?Qkc1TzFpZzdpVkgwUkxMb1gvQ2l1UUhWcUcyVnA5SnlOVmZqMUZpTVc4d0Jw?=
 =?utf-8?B?aUpHbGVoUHNLQkV5dkFlTE16R0p3ZFVSREhTSk9ycWtBK0xFaE8zbEg2bjJV?=
 =?utf-8?B?RE1DbUQ0NHBDSUJMT3NLQTRCNCtHaFVnUWhJVzJaMEMzbnRma3crQ1hkak5j?=
 =?utf-8?B?b3RFV0ZYTE1JdG1pb1Q0QUNDeGdJTnBhWlA2dXQ2b1hMTHk2SjB6TGFSRkh5?=
 =?utf-8?B?TUFwRlVqZjZPNlpjeHhrc0VMSkwzNlgxTEFZMjFmeEZlQ2JWMmxsVjRzQmdS?=
 =?utf-8?B?b2U0V0hGak1tYWE0Y1NOK3R1L0xmUzZKcndBSEtvUUlyRDF1cE9uS2tvajc4?=
 =?utf-8?B?ZXgzdFJwOS9BdlVwU2V6ZDVwMzBJa0dtNXBOa09xRU9sakxJY1VrYzJCOXJB?=
 =?utf-8?B?b1l6TWx3Y1AvQjlMVXRFR1g5cFJ6enVkSnZ0RVlpN29HUzZ4dklHWWJCdTE3?=
 =?utf-8?B?VFdrTzVaeVc3cmxoWWptOW0weTIrT1NaMVZTMXczWlRRY3F4cTFhNEFZbis0?=
 =?utf-8?B?dWZOVjVBS2JJSEEwVE5KdTgvQkxIbUlUUVlCUDRjR2piZityenAxSVdtMmtB?=
 =?utf-8?B?bVR3Z2t3N1J0cGJHTkRKdTJ2NmIxMG11aUtUUEtldTdlSi82OFVrcjJxQlZV?=
 =?utf-8?B?SVliYzV6cU9VdXFDejNhNUxadkl5Z2liS0lPcGVXaktTcWI3bXRYWkdjRU1Z?=
 =?utf-8?B?QkYvQXl2RldrL2JoRTlUajljNC9rczgxS2xEMnVzVFhNcHp1NkRNcFJ0a0Vy?=
 =?utf-8?B?bVVCTmMrelNuZDV2cUJGNklxRHpGTE0zbXhhNHZTeDNjUTYrb1ZGQ3dpamI5?=
 =?utf-8?B?L3hJRFBCUFc0RFdrTnp5RllrTTBUQkgyVTVSZHRUNTdXd3h5bDdKY0o0TG1B?=
 =?utf-8?B?Q3psdjBGakpUMVlWZ1ZnY0xaQmVHRzI2a0tpZE9qK2lWNzlHL3lNNXNMelhv?=
 =?utf-8?B?eVBQU2tBa1EwaExreWpQUDd1WXlnOG9NVTdWRG05T1VteHQ5Z1M4SkJzRTlm?=
 =?utf-8?B?aExURFNrcHhoZk5Fb2kvcS9yL1F4NEY3clg5eHpMZXNza0Z3eEx4V2N5Ykw5?=
 =?utf-8?B?VVFhUFM0NWk0T2dhRU80RHBCaEYrV00yZ2FWdTNCYjRtYUYzeGV6cGFTSG1y?=
 =?utf-8?B?bk16aDlsSGxEUjlwNTFWV2Q5UWpaa0ZhZzVjRjRNdjhGU1UyaFFTeWh3ZFll?=
 =?utf-8?B?SkRHWUs2SmNsSGRtWDZBK2hwcG5GVG9BcGExMGwzZis3SHZsYUJmOXhodi9M?=
 =?utf-8?B?Z09lS2NYeVViT01KWkpaTEdNVDdlRU5hVzdtVnF2MzA2RXNqL0dpYTJmalI1?=
 =?utf-8?B?ck1wc1VwajZQQVI1TlRxcUpZY2daOWQ1VW40NXpjcVdRMS9TUDJzVnFuZjRi?=
 =?utf-8?B?ZkJPSFpEVG42TUNEQytFczlwS2YyTnFmOUw4TUZzeDkwaTJLb0FIU0JScTRj?=
 =?utf-8?B?QWFDSmZhMEFqTUJwQ2ZQYVRCZTFmRmwvdzhoNWtlZTVQUXFNeUNWajNHbmZF?=
 =?utf-8?B?akZVcTl1Rk5ZS0o1NHJHQS9vcUxKR1J6aitaaXhiSjdqN0pXU0wxMGdmMTVX?=
 =?utf-8?B?R3pGaEtzVVBveTZCOTFydGw3QmVKcktEZWRPcHJ5YndwMkJQVE5GNGh1Z1JS?=
 =?utf-8?B?Skp1cmdMV1R3VTJLU3p4V0hzNm1BUlN0UGFtcGFxNkxJeXdxNjZOYTVJZDNI?=
 =?utf-8?B?OHo1dm94N3NXZnpXUExzOFd2MTFJbEZyYjVrUTdqMGtqRTBEa3FYdmE4TlVj?=
 =?utf-8?B?dDlveW1nb3htNHVNVzMvSGRRUWU4cXpuQkV2OXJnSzJmeFUzYTkyL0dRa3Jq?=
 =?utf-8?B?aDRpUVZiME1Ccy9QZTlrTFMrTnA1c2pKekN2VGtUbko3a3R1R2R2N1Z5NFd5?=
 =?utf-8?B?clJNQzk0VloyUTFjVG4yTHJJMy9UWFdzZXo3bFdaR3NNQy9YWENvVmF4S2ZD?=
 =?utf-8?B?dDVQMGNYei9BPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2170B53C77F43F48AAAC4D510D71AADC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5767
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	49f72e09-5e44-4691-6d31-08dd992d39bb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UnhsZVdVaUhHam5ZVERDRkVwR1hJNUt0ZWJhcG1pWFRjV3ppd2dmeFVmVmJU?=
 =?utf-8?B?akVRcThxY1BMV1FqQzN1Ri9rOGx4SnVOdnVEdkNFTG4vRUVaSUpUbGduNndJ?=
 =?utf-8?B?U204TFhSOGZzL0g3UUljY2ZKTmRjVllSWkVHOFlwakxrQmJBc283RE96VXhT?=
 =?utf-8?B?em0yY3RCRHpNMXM3a0JNNDdtZjVXbXFPWTFyamZIcThHalVsa2JWMVZIb0Jy?=
 =?utf-8?B?K2FzWnhINFdVbzR6K1V3N2pnYzYzTUVPUXYyTmFRTlFQQ3ZBeUY0U1ZmU3VU?=
 =?utf-8?B?R01PVytmekJESFI1d01zOFF1ODdDUVlKamxiQ1VFZW8rTGE5Uk9uSzY2THB4?=
 =?utf-8?B?NlhpUi9zUXBFV3RQV3hZanh1S2cvRjhYQVVPSm9RNEVqbHlXanp0MlVMdW1o?=
 =?utf-8?B?NHZjUlhnSEdXV1Y1SDVZcWI1djNuVnZDYWgrQ3Vwa3ZCRmg1Q1lvRnZyV3Nk?=
 =?utf-8?B?ZGR1Q2JqL2xGb0xObElrQ1R2VzRDQTJaYm9RTllmczVCTW8yL2c0OUxzQUFp?=
 =?utf-8?B?NXRHYzBUeU43NTdjNmdDSXRGK1pCNldsYytmbDlZa3FpYmprUCtqV0x6cURE?=
 =?utf-8?B?VkVGMmEzT2dkb0RleUQzb21yZ2lSZnlaaUltWVByZnY4YXJpNDhCZk5uYW1T?=
 =?utf-8?B?cWdyM1FBd29HalBrbTdwUGtWZkNhNGFkZTNkT0xzTW5QOVZLa0MxT0RPZzRY?=
 =?utf-8?B?U3NnbUdOdkhxZ012YWxjQU5nQndqTFYrSWVYTmx2S256VXJ2S2hEaWNJTDJC?=
 =?utf-8?B?NnFIbDBXMUhYdWdJTUFNUWxWamZnNVV6ZElacnpBRWFuOUtBTkx3RWUvY2xJ?=
 =?utf-8?B?VW1rMG1UNG0yaUpVSUtuYTVTZ3ZLMHQ0YWxlcU53bkEzVkw5NmFRd0NyMllH?=
 =?utf-8?B?K2NEUmVSdHpVMTZVanJDd3hscTlxNkYxODdNRk5KZUJtN05zMVNMbmZ6V2tZ?=
 =?utf-8?B?TEdFb3VseStiaFU4bVdWN2p2SGxXbjN1UVRXWDJJZFRsaEU5cmhjVk5jVUxY?=
 =?utf-8?B?eXR1ZUdtNG40M2RlZlFFYjBxZzlQdUVvYVJXSy8wOVZnaTE1M1dsVmdSNDZr?=
 =?utf-8?B?RGozMW1iTEpSSUFjQ2xpR0wzNkJuNHB2SW4xQkpaeC9TVHhWU0V4NlUzcFN4?=
 =?utf-8?B?NHFRMHVOUVkyVElZSHAxK3FXZGlzUXdrNTF3SkRrTmFVVVVuYkxPRXVJbFJF?=
 =?utf-8?B?T3hVRGpwWWhBSXVQTXNnd1Nrb01qTzJ6clhrOVJBVWN3VWFHSXpuWThYNjJ3?=
 =?utf-8?B?clozUWQ2VzFuUlRsYU1YbU85R1laWU9aSzA4S0VscTdsdFFFSVlOYkNja1dE?=
 =?utf-8?B?MEtnekUxek5VSks3N2lLQ1QvTWxDbUVuTlYyNjlWcWRTdGtoRnp6N2xDZm1l?=
 =?utf-8?B?S0YvSzdaYkxGaW9YY3MvUDZZbWdLWUVQQ2QwQ1p3UWxxSlIwUUlKU3grNlY1?=
 =?utf-8?B?UDRNU3M4RU16Vkc1Y2JzVlg5WC9Hd2hvSVR4VklVNWZKWmU1aEN3Q2dMVGxH?=
 =?utf-8?B?elNJaTZ2RVRGNS92S2V3cmFYUWVTbFowMisrNE5WZUVFdnZ1bGovUGpBczJD?=
 =?utf-8?B?S1VEVXMyL2NIT244a3BUR1k1MWpHaTlFV0phSjFmQmkySkFCZkh5Z3FqWGtP?=
 =?utf-8?B?Y1BWa1U2VnZOblhFWTUwVTFLOHl5Z3FCbTJYclhFdzVrQVE5UjVCY2I0aERP?=
 =?utf-8?B?U1lTVWhMQVJDd21oT2o1RTlQRmxIQUs0diswSFBtL2lqbCtWZTQ4elZoOUxH?=
 =?utf-8?B?amNtbG1sRlRzaktVUDZvcTBKaktINC9abUNlQ0ZLS0xoWUM1K25xSW1KbVNK?=
 =?utf-8?B?NU1sSzFya0hxNm80cHBIcHBhZ3dNdmVMRTYvMDBaMG5XNGVTb1h0MDNVTFhh?=
 =?utf-8?B?RTJIb2U5RmQ1Nmk1TlJPNmRmNVorcThTLzkzY3h2d2hhNmVpYmZNallyLzho?=
 =?utf-8?B?NWFWdWVWUUpkL0lhdW81MzIybm9rWTBJbnRyR05vL2RsRy9IQnRXVGdtUGlP?=
 =?utf-8?B?Yzl0VlcwbHhmaXpEbytvczRlTzZEdWoydDU3TDVyZURPYk5keUNaWkVJRDNX?=
 =?utf-8?Q?M60i28?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:36:40.2368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 433dc7a1-c901-4d2c-3c8d-08dd992d4d1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9451
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217098

T24gMjIgTWF5IDIwMjUsIGF0IDA2OjE2LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJp
dmVyLmNvbT4NCj4gDQo+IEZlZG9yYSA0MiBoYXMgZmlsZSA1LjQ2IGluc3RhbGxlZCwgYnV0IHRo
aXMgdmVyc2lvbiBoYXMgYW4gaXNzdWUsIHNldHVwDQo+IHdpbGwgZmFpbGVkIHdpdGggZXJyb3Ig
IlNldHRpbmcgaXQgdXAuLi4qKiogYnVmZmVyIG92ZXJmbG93IGRldGVjdGVkDQo+ICoqKjogdGVy
bWluYXRlZCIsIHJlZmVyIFsxXSwgaGFzIGZpeGVkIGluIFsyXSwgYnV0IG5vdCBpbiBhbnkgcmVs
ZWFzZSwNCj4gYWxzbyBub3QgY2hlcnJ5IHBpY2tlZCBieSBmZWRvcmEsIHJlZmVyIFszXS4NCg0K
VGhlcmUgaXMgbm93IHRyYWN0aW9uIG9uIHRoZSBGZWRvcmEgYnVnLCBzbyBJIGhvcGUgdGhpcyB3
aWxsIGJlIGZpeGVkIGluIEZlZG9yYSBzaG9ydGx5IGFuZCB3ZSBkb27igJl0IG5lZWQgdGhpcyB3
b3JrYXJvdW5kLg0KDQpSb3Nz

