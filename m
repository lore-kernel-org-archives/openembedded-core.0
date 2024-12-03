Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CF2E64A89
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 12:42:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web10.18093.1733229747452056331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 04:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dSjyQr8o;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dSjyQr8o;
 spf=pass (domain: arm.com, ip: 40.107.22.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DN8r6kAritBVRaMmLcKJ7GoflKkU3Jfk729sunisbXz6uy70Xd2hsgVW1iiux++zmnjzXf5NBnvKb8Qe4ICJr+fBkUyhl9Vsh752XyQcVwzOaHB7Z4jOkoJC8ZAInDPiR8C39KzbmHZSVTAbnhoXnR6CDF4zwb0B0IUdQ9PU1X+2rLtuLbKJAVxRTxQDOkxxNnKbswVMgZ9DOhs5sV16Adre2fARkld4pVxx+dqGiKjqbv8tTJBt2OYAYQF+OezCmkwpDzqHXLZyFMFtMmj1K4aPkKl1GVJOSNcJTGFVuCmbS7umnH8N0SwLthmYcAJgFN3RsZ6I8Y6LpEf9e6sl2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5snA2JCR67Ix7MRedyWIQa3aKMLiLbe4y779L5h1OA=;
 b=X4arQOR2YXrQPofWf7pS6+SB0fa9sNKPLYbm6bmooPUEIFwFNEzs+Lv7AB/CcPDNy6fviXTS2m3yGNizjoWdzzmxG6Tu7/wircvhYkSFU+NS+HcOAocWTosh8Z2ORs1zb+uXop0LkFukiQEjTF/wwspzITCqLWZ7PJezr/cmpSGNNxFy91zrzbuuPRPOZ5V6sNFQhWnVmX8SaBg5rgKpvWXFCxfvVwOfYIMA4ku0RD0QLy9Poof2B6BqCiJjLUUOtiRsDSqRz93WpvCFP9ljiVFjnHqqlX6kIdYEH6ZchRY65ihw0dwShYd9yWljz7syNgl5B4GJMb3qECsNX+J5gQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5snA2JCR67Ix7MRedyWIQa3aKMLiLbe4y779L5h1OA=;
 b=dSjyQr8oepL2dY9AfMV2qlqMkFnANTNWqHgbapV9kBoYArau5OYd17iGKCHpfgdB4NUjKJprWumRezDpJYQhdDTcl9XyiY3nXebqtyk+gcGZkQEjJtiEOp3+0aWyTRJ7i210MMq6EJjsdvWnTGC3V1lzH9j48wNKiPrzUKAZX1s=
Received: from AS8P189CA0053.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::19)
 by PAWPR08MB9995.eurprd08.prod.outlook.com (2603:10a6:102:35d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 12:42:22 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:458:cafe::ab) by AS8P189CA0053.outlook.office365.com
 (2603:10a6:20b:458::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Tue,
 3 Dec 2024 12:42:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 12:42:21 +0000
Received: ("Tessian outbound 033f0ff3ba29:v514"); Tue, 03 Dec 2024 12:42:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b17bd20ffeb0311b
X-TessianGatewayMetadata: IWWY9tK4O1dj+OT2fuqvaKGKrFTXZFRMh6KgbxbhnY0ToT2B25s9jhvC2HQXOBquGLIzy8NyJZtdPl0XlAU00dyMqv8byuLpf7tae6vb9dvFlzfCPrXCQSZ5QvTzUF2zG4YHCZ0Qq/LNIyq46NCrudO4f1dDzhJ402VNl7LaZgk=
X-CR-MTA-TID: 64aa7808
Received: from L2bf5870923f7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BDA04E76-60D9-4A82-B352-45C5E1A37D25.1;
	Tue, 03 Dec 2024 12:42:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2bf5870923f7.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 03 Dec 2024 12:42:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K00zz0fTH7vkq92OWjM3n1ohIU7oUC4phZatTon+O/xoOSMQisYDCJ7LAgu0RsjdF9u16ry0U/6kvvLtqpnDeNPbRFnafdmdOJS9vNDXZVx0K/z73A5+mCZqHMBw5ytvKGfBIt7rtiWOVCIdlpkL5MZseUHpuuaA6iQJog8FiWc7p5sxfFh9Dr2o4HqnNY3tP3d9C18sDteH7pQRfqnjR16tS2gDv/XdAgbFWi5e72tgHUCJBMq7HjsvBIUZoICs5qG527m8fOG7Ywtf137DtPo8GL4MgPP7ZxNeTWe97EKXAWxjnRKyS3vz8y0Cd9schaTK5DirygQxxmJ1Qn4DeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5snA2JCR67Ix7MRedyWIQa3aKMLiLbe4y779L5h1OA=;
 b=GcPvmT8tuJasMGJe6JY4nkJiLV2P0ErbMVTDLh3H0NSOHzeoKw59fdNM5ZTkD+vYKfKrLarOvgTTyN7YeHzxvp1ekG3+E/jdjLRHGzl1LlyQcF5+7EA5UNW4XH+sMCuk+5x2uRid4c+iG4KBvOJbw2svrPueAJXWnyvH3+zjucBNo0z8Id9yNLDVlpTYUhJh/IMxAJGx7DOeMfF8PNG40AbGzgkawjdCo0M54EQPDSJwfQ44h5UwtzQux/0R+GC3L1DNr8G39J9xFHtf0OKJFFKTeh+tI5cgkTI74+9gwogy21ymozBGKNQkyyQbH1W1qyW46u6egqv1iOlPz5IYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5snA2JCR67Ix7MRedyWIQa3aKMLiLbe4y779L5h1OA=;
 b=dSjyQr8oepL2dY9AfMV2qlqMkFnANTNWqHgbapV9kBoYArau5OYd17iGKCHpfgdB4NUjKJprWumRezDpJYQhdDTcl9XyiY3nXebqtyk+gcGZkQEjJtiEOp3+0aWyTRJ7i210MMq6EJjsdvWnTGC3V1lzH9j48wNKiPrzUKAZX1s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5838.eurprd08.prod.outlook.com (2603:10a6:800:1a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 12:42:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 12:42:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe-ore][PATCHv4] libsecret: add pam support depending
 on DISTRO_FEATURES
Thread-Topic: [OE-core] [oe-ore][PATCHv4] libsecret: add pam support depending
 on DISTRO_FEATURES
Thread-Index: AQHbQwVHqNLsHiZgJ0iaS/8tZxpsGbLUe3KA
Date: Tue, 3 Dec 2024 12:42:10 +0000
Message-ID: <827A4F56-2328-4ED9-9E3E-6096EAC35E46@arm.com>
References: <20241130085222.17448-1-f_l_k@t-online.de>
In-Reply-To: <20241130085222.17448-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5838:EE_|AMS1EPF0000004D:EE_|PAWPR08MB9995:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c63c993-1945-4794-50d6-08dd1397ee6e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dEtlUmhzTC96bWY4T3lwWUU3WndaMWg4MFVkYTZIUmZWaTBmTTNEL0lFMDY5?=
 =?utf-8?B?TURGUGRFSVVHaTV6empmYnZ4blhZcmVNZ1NvaVJEc2hhbjZCL1E0Nmt1Nkkv?=
 =?utf-8?B?cDJ5OWtwbjdSVWx6ZWYra0ZSNlp3dE9sbjRnUXFBeXYxdFIzQnVEM1Vvclpj?=
 =?utf-8?B?bGtnWTNGS0VLUDJWSEZUbkVicit6R0JvOWFPaVJNNG9MM0xpd0IzMFA5cXVn?=
 =?utf-8?B?RUJqbXRCZWNvNFE3ZEpkemh3bUhtM2dhdEYybERKL0FlcjZid1J3djM1UVVz?=
 =?utf-8?B?QTVPa1k5V2pwdXF1TXg1dit5eVZRaEtEWDdnWjlpZ2FpYlpRbm56aTIvNEVB?=
 =?utf-8?B?WGRRUXJVZFJ2aC9RdXYyWGwxTk9MKzJJUEsybUU2dXg5cXl2UDJCM2xUazRY?=
 =?utf-8?B?cTN0VFVxbU01TnFBMDFZc3lDemo5dUFWR2Y5UVg1YTJrM21wZnZPSDhQVEp3?=
 =?utf-8?B?UGZOVXdWNDFodTRucFN0cVF5amU3eWxwelU3OUR0SElUOHpnTHZPRm4vWlF3?=
 =?utf-8?B?bk5Gc0EzeG8raFhMNDBCOWd5c0o0SW9UQmFOcHdYQ2JPRkRvUWRQc3pvQmtw?=
 =?utf-8?B?L0JlWHRsNnNxaDZRV1FDNWFteG1WWndwYlNBMCtpWU10eUQ1YWdnUHZTYzdp?=
 =?utf-8?B?YVJDanlZM2V6a09YQkdvT3A3THNiYkFqUG04cGoyZFJTY1lodHI4bitxZGJN?=
 =?utf-8?B?elMxcU5pb3hOdzltTmJjeTVFd2FDTDJYTEhFeVM3cmpQYjFJTmVjSy9FVU0z?=
 =?utf-8?B?bVU4TXFzRWgzY3Zzb1JYblFzc3JyeDJjQ1RyNU5JaTMweXFtZEtJWUVhNW8r?=
 =?utf-8?B?VXlsZXNHL3hQRWVXaVR2akh4cXE1ZW5TcDV1TmdwcUV4dUV6Z1dSUktaMStT?=
 =?utf-8?B?c1lzalMxRFc1bGRtVENxRkxYUnp3ZjJ5bGlYcXBYS3I2enNoRnNvVWZma0ZJ?=
 =?utf-8?B?dWxaM1BsamFCRzdPaHF2UTJYcmRjTmEzT1IzQnE2WS9hNHQvWmd1QlVjTi9n?=
 =?utf-8?B?VzNsQVloWkF2MDFjQTRRWlo0Y1UyakxxcHJpaXNhMXlwQXUyK1pxczd2UnBB?=
 =?utf-8?B?UjVxcEZLZ2FFeURqdmx2emlFUlJ0OFYwQWxFSG1xQUUyMGV4VU5GQmlhWjdD?=
 =?utf-8?B?N3FQbWFwOTFScEl2dnQ1enJKR3FvL1owZHY0V0hWaHBKaitqNkZoS01Rek9K?=
 =?utf-8?B?WjZvUEQ4czM3Vm9ndUlTendaTzJxSFFYUU51OTRYSU1Jc05tUHJ5NzJKNGo5?=
 =?utf-8?B?dVZXRDNTWUhZMXhLVjNQRkhsck1LdGtKWXpHNHNCOWlVYUFrMXhrUDhDMmtM?=
 =?utf-8?B?a2lLVFVrOGh5UFdMVnhNR3d0T3B0S2ZHeFNNeHpzT3BPK0JpZ2h2cGpUV2Mz?=
 =?utf-8?B?eG5sWVE0d05jOGxNYkdiWlhHSmRYWnpveURoRzE4NVFqNHQrelRRY2hQN05y?=
 =?utf-8?B?cnpaYTdsU2xaUXc5ZldlaVc5bWlpRFYveEFDQUg1ZW5EckwyWnl6NmluZ2Ro?=
 =?utf-8?B?UmZGVUM0SkUxbjRpVXAydUlIRFFwWTduZS9waUxJMk5ENTZ5ZEhVY0FZcUx5?=
 =?utf-8?B?VXRxWUJRMklNOVhNRWl2QzJUa1p3QTU5U1N1V0xTcFdHK2NUbS9YQzZXbnlQ?=
 =?utf-8?B?Tzd3ZjV1SDhsbUVLL1BYQWZ5UVhHUkE5VEtzWUtxK3NROUNrVkE1U0lBYVd3?=
 =?utf-8?B?aWxxRDJuZVYvU3YvSHVKb05NeGdDSmhZWE94Z3Q1b2JRa29zVlVyVnlDMzZr?=
 =?utf-8?B?eW1BdDhLM0FDQ1lNT1k5OUhHZkR2SjZ6NDFQZjNSMndScCttcHl5aVJYc09p?=
 =?utf-8?B?QlQrdHpLc3BGWUUwKzVIdU1KcVAzNXRMTWcyNTdOSTZGVlc2MzhiaUhFRzMw?=
 =?utf-8?B?WEdIUFhEWFFibnJTR1dwQlA4d0tuSFN2QnBqL3RtT3IyTldSMGtybm9nbGdC?=
 =?utf-8?Q?0DSYmKcRl+A=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <84F5AF5B307BD44CABDB4475126C4C42@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5838
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a998c322-2457-4ec0-a7a1-08dd1397e7c8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|14060799003|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cjNxVlpOUWx6VXI4WHRWeWR0Z3dETjE4Rko1SEFybTAyd2VSV2wrb2JGMzZy?=
 =?utf-8?B?UW5odVgwSERNSzR1N1czWkFkMGQxVmJmNTRWdlQyakFkRDgweE9yQTk5M3l3?=
 =?utf-8?B?TlAxa0VKaFZSMW52cm1YVjRtNU1uOFNkczhYL2VkSURlSitpa2FBTkRjeFFV?=
 =?utf-8?B?T3pnekFsV0hicjBQdHJlOXdYNWNqOWloanFPSi8vMXYyS1JCZlJIMHZzd0xO?=
 =?utf-8?B?T0NxQ2FOZUszNzMxVlhhQWtNNDFGNmM5M3ZvK09YZlJmckFxK3NoeFhCdnZZ?=
 =?utf-8?B?Q2t4Z0plUm56WDcwUTYrcER3Y1VUKzAvbi85N2tjYUx5WGFjNVg1Rm82Qkhu?=
 =?utf-8?B?T1RSbVlKSVpGVFgxWDVUMFB5eWx4bGJ5ejZpRWNTS0FpeFV3R0xUd0ZOTUZO?=
 =?utf-8?B?aFRDV3JkWkVocERZM1BoUEZZSHFTdFN0bTFpaDEvVFRicjFFS3pBUkRVdTVl?=
 =?utf-8?B?Tm54alEzT3BHMktxalZuZ05YVk5IbFpndXZMOTBTVHMrTE5FbFBkRjkzNGpO?=
 =?utf-8?B?dGdaNW5GZ3lnNUdoTkgrOXlXRWVpN1pDb2ZuQksrTkhzUXpHeTFOMXZrZ0hF?=
 =?utf-8?B?cmg3MnFTN2xDUWtGVWUyMjQ5WXI4bWdRcll1bGlGUzkybkFhSDdKaGk5ZndG?=
 =?utf-8?B?WXF4QmgrV2tiU2JmUW9hM2dQZzk3ZDlicWR5WDNFQ25hdjV4TC9tTnlxbFUw?=
 =?utf-8?B?ZjlwckRTUFM3VU5nNFgxajFLMEtQOG96eGNhR2N1MnhoVE9Wbm80d2RRV2F4?=
 =?utf-8?B?UVBsWUxkVy9ydnArd0J5QnNaMXVBVG12QXRxNjMwU0NWWGRqampKUnJ0MjR0?=
 =?utf-8?B?T05OejNZTjE3Q3BtaXBZOHROaWJOYVdQZ1VPM1RsWllqbFVTQWFiZXdhOHlp?=
 =?utf-8?B?Q1RlNkRtdVg3N3lzQ2hHN0I1MkN3NXNHd2wxbUoxMlZQb1A4U3gwNnd2SmJp?=
 =?utf-8?B?NGNNRE1GcUFSODFpQzBFY3hOZkV4Rmk2VmNmQ2lGbHpIZjdvVVkvUlZNTDhh?=
 =?utf-8?B?T0E0VTR3ZTVZaWc5SytPQnpYd29vcWEreGF6azhTSmp2elRIMTcwbVVZUUpH?=
 =?utf-8?B?cElSVTAzSmMxNXhyTmUzdHM0bTM3cVE4N2JpMk5va2hIS052djZybzN1ckVS?=
 =?utf-8?B?dkc3NWJDZ0pXSWdRTFo3dEN3QXNBZ3h2TXRLV0pteEtld0kzaHpMaUxUY0Fx?=
 =?utf-8?B?QmpuNUtqSUs5cWZqNDd6cTd4VVQ4RGJXNzQ2anYrOGJaQWZkT1dhN2Z3UU14?=
 =?utf-8?B?dUNrYzcyTys2WlJieTREZXlDVSswSHY0akV6dGVhTmZ1NUJrNGUrWDRNbGlr?=
 =?utf-8?B?S3JCbTl3WjcxbU9GM3VFS2JKRWN2NlliS2Y2TmNHeVBhbytnMFJna0ZmS0hZ?=
 =?utf-8?B?SzN3S1pmWEZaM084cnVPWWIxT3V3SGU2dXU1bU5DaWtVWmVqSEVmZWVJVFRq?=
 =?utf-8?B?Qk1LdmdnUzJPdWZWdkVkN2dZSEU3cXpVbnZaMVhjRzR2ZXYxRTFJcG9USFBF?=
 =?utf-8?B?eXNsS05FK0szZWxiVzZiSERpQWR6T1VBTkV3R1lUQ1JMUFk3RDdqc2twS2ZU?=
 =?utf-8?B?VEgvYStKMnFyZk5pTEpGQjVxeTk4aXZTbFZqanEzRnFlMWJWZ205U1hQTysv?=
 =?utf-8?B?WHkvZU5jeURJSjRHUUZGNzJQS2NWNXo3cncyZGgzbGUvWWxSczFjZTNRRGZj?=
 =?utf-8?B?a1BId0RSbFRZWDFId0dudXVoWTFlMWhqemo4a2hML0NjOHF0b3FRaGFtdUIr?=
 =?utf-8?B?SDRHb3haVFFUcmgvTm9SL3dpeTV5ZUYzZHhMUWVZa09iMFA0VWJJR0tlWDhn?=
 =?utf-8?B?WDEwbVdzczJMTXNpc2dVcnlWelRQbnZiZ3lacWNpeDZkS0NCV2R1SzMyS3FB?=
 =?utf-8?B?Smh1MXdSYXlkS1B5V0JmbGNQL3BFUGVZRE9BN3llcHFzNWJVaHhNSGUrdlgw?=
 =?utf-8?B?YWZMc2YxbzNVTjFtSUloZkpNdGhXbG95NEhITXFVN3NkMitIUXRqai96VlAy?=
 =?utf-8?B?VmdsUVB0QmhRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 12:42:21.7206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c63c993-1945-4794-50d6-08dd1397ee6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9995
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 12:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208187

T24gMzAgTm92IDIwMjQsIGF0IDA4OjUyLCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IEFkZCBhIHJlY2lwZSBmb3IgcGFtX3dyYXBwZXIsIG5lZWRlZCB0byBidWlsZCB0aGUgdGVz
dHMNCj4gDQo+IFtodHRwczovL2dpdGxhYi5jb20vY3dyYXAvcGFtX3dyYXBwZXJdDQo+IA0KPiBJ
bXBvcnQgY21vY2thIHJlY2lwZSBmcm9tIG1ldGEtb2UNCj4gW2h0dHBzOi8vZ2l0Lm9wZW5lbWJl
ZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQvdHJlZS9tZXRhLW9lL3JlY2lwZXMtdGVzdC9jbW9j
a2EvY21vY2thXzEuMS43LmJiXQ0KDQpBZGRpbmcgdHdvIG5ldyByZWNpcGVzIGZvciB0ZXN0cyB0
aGF0IHdlIGRvbuKAmXQgZXZlbiBidWlsZCB5ZXQgYWxvbmUgaW5zdGFsbCBvciBydW4gZG9lc27i
gJl0IHNlZW0gbGlrZSBhIGdvb2QgaWRlYS4NCg0KSSBzdGlsbCB0aGluayBteSBvcmlnaW5hbCBj
b21tZW50IGhvbGRzIHVwOiBhIHBhdGNoIHRvIGFkZCBhIOKAmHRlc3Rz4oCZIG9wdGlvbiB0byBt
ZXNvbiB3aGljaCB3cmFwcyBhbGwgb2YgdGhlIHRlc3QgY2FzZXMgKGFuZCB0aGVpciBkZXBlbmRl
bmNpZXMpIHNvIHdlIGNhbiBkaXNhYmxlIHRoZSB0ZXN0cyBlbnRpcmVseSBzaG91bGQgYmUgdXBz
dHJlYW1hYmxlIGFuZCBtZWFuIHdlIGRvbuKAmXQgbmVlZCBkZXBlbmRlbmNpZXMgZm9yIHRlc3Rz
IHdlIG5ldmVyIGJ1aWxkLg0KDQpDaGVlcnMsDQpSb3Nz

