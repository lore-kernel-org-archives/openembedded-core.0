Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BFFD1CDD4
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 10:27:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web10.15296.1729592828997338108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 03:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=j3FfJ5Z7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=j3FfJ5Z7;
 spf=pass (domain: arm.com, ip: 40.107.22.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nsUGHlOfSuAjnbOkbo8AO0WYv6duFt6Q+TGUHKWXwbs7LCgW3FRhonjpy77OsK/42oZwPWROKmNjFIsckn+9VWQleL1A3sXQOJNX0MxaHMue29pGflOOYdUDuAVUi4/iYBkgGwz9yu4Nk6cyWZ4/lv/QxyMKIRsMAXcY2PtvmQIjSwLtMRYUk0brfpvnFgG0umbTiV+ieANuzRVpnXMQ4pmZC+MH/cIVV+ReBZpuXdT9wQv30vJwUsbf5NIbfHTnmeDLhBhYYjrhCpgcALDl+RAzJwl6D9nOOQVNCpM8ELHGvhdzz4m+zNj76xzEsxAwXqFMu9f4VpujeqkwDjhrJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmXhaExspprbX5m1V4OKmJYXwxIeS+EVrBCZG06vWCU=;
 b=ep92iihZZIdEGaBIPRV5jbrVXGm1LVtjqoD2h1wjfrnG4YOe5/gsjcjT16fweEw+NlNyw2SS3AdmVV/OkzwBq2uAD90W52hrNnZzRJec9+ki5xTGytMWXXk/muGWxwyTOJN2kQaIKfg/asi6n2EfmAXYT2KqS6s1y2WRY61dr2MMOL6UWcqNCS5OpdgH3hkk78dzK196VxzQ4Jm4DqBH+opiU/7QIYj8IfUVhXh4/g4E5Rt8kbb3Gj/ZbuDh86NGFq7tD4h1nE1z0OHyBAe6FtcrmcaHSCdWd0WTnwAsxxZQUzSn2Bt7/LMxeQ3Wrcjit5IHdeGnnQ0AByp3+261UQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmXhaExspprbX5m1V4OKmJYXwxIeS+EVrBCZG06vWCU=;
 b=j3FfJ5Z7YLi7Sk9NycTD89RRIu1b7iV6H3aHT9riFZIAnJIFw9MuKna/4FzXlVmgclMBiu+hw7DqrMGZJ4ybNCj1B+CaQdsoBNilbqRiPX6jjXaQ966jW1sjeWug80xEMfgAADp6j8KN2Fao2BrLmp/rQV12DIev0czSOnoPmi0=
Received: from AM6PR10CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::39)
 by AS8PR08MB10246.eurprd08.prod.outlook.com (2603:10a6:20b:63c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Tue, 22 Oct
 2024 10:27:03 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::89) by AM6PR10CA0062.outlook.office365.com
 (2603:10a6:209:80::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Tue, 22 Oct 2024 10:27:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Tue, 22 Oct 2024 10:27:02 +0000
Received: ("Tessian outbound 40ef283ec771:v473"); Tue, 22 Oct 2024 10:27:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 67840b1ac3b2ec6f
X-TessianGatewayMetadata: DdZfKdIzcZ0dVrEiwWpY9004mCF0X+nVNFFu1lTa7MchK5GoJ3TNtqOdFbr6fq9lybed1N0moyTQJp+beBvVUp+a7/hFftcR25bbRBdMF9XCY4j7InFcyiG8PASVv7ftM+yf6WGRt5i8893Fc7CHj1ZY7jWhdOFuX24laXsTavI=
X-CR-MTA-TID: 64aa7808
Received: from Leae2cbfb20ce.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3E1E9244-8B88-45C3-B20E-B8A2D7F71374.1;
	Tue, 22 Oct 2024 10:26:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Leae2cbfb20ce.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Oct 2024 10:26:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/QMg8k0HjQIUjn8CfdSVuVpmjB4SCdUYEGRyuDl6VhnFrEmpPrCZU8watsbBOyNyHdzpGUVnpFrZcmHp5vAhAzFbtEKjQYz8+RsLB+0SnwrKBOQTgJq1Tp2KIa9ntg0qyKbDIhT6GVQvA1Fh/ivbvLLZ0b53BREL3ufLyIIIsxeP+0CmgFUUCHhNuoFiZdQbPA5PIvl95CMwdbOzlXdh6wqLxzJZ5vEXEI+FR4/pjpk9LhsqviFV/NBh+IoDKQXIvbzanOuqbI4Chj8a0/1vd0rjUHJCY9X/R+rmWOeOYI2UGAl8ohqFOgea9UvAOKlFoXSEE0lAbqw0tcnoEzTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmXhaExspprbX5m1V4OKmJYXwxIeS+EVrBCZG06vWCU=;
 b=DrEKNmF6LgeNa+VK/vWPMUsZ2NRq610moMe7CKWqotJAHg75JzniZMofvnwGwWk2xKWjWwZAh5nHnOq+t5kUxYyJBpi9gq47ZmWSG1dCwqbb8gDhkCPxtYFXgd8fuvKIDjDLzG9kYUEffqZB/OKMUih5URGFWEexiaRY/gyysU7ONJQ546xQYvrAf0a9tD+KV6JVojml1fsmh8yEoBZHZo3fCwNDHFVyh0wPow5KXBpa0rG2Fhlx0NZCeyyIPCAQaSRCZ5r/fOgdCpCfeuEO/iUr4A3XtzVbN4oErWCoLWM8oyHHQMr44YMRg4wyaITUSeSI4BGfTvE6DDl/EL66Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmXhaExspprbX5m1V4OKmJYXwxIeS+EVrBCZG06vWCU=;
 b=j3FfJ5Z7YLi7Sk9NycTD89RRIu1b7iV6H3aHT9riFZIAnJIFw9MuKna/4FzXlVmgclMBiu+hw7DqrMGZJ4ybNCj1B+CaQdsoBNilbqRiPX6jjXaQ966jW1sjeWug80xEMfgAADp6j8KN2Fao2BrLmp/rQV12DIev0czSOnoPmi0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6686.eurprd08.prod.outlook.com (2603:10a6:102:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 10:26:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 10:26:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v9 00/11] systemd uki support
Thread-Topic: [OE-core] [PATCH v9 00/11] systemd uki support
Thread-Index: AQHbIHEKEzstgELp30eU4TC7wah+RbKSmOMA
Date: Tue, 22 Oct 2024 10:26:52 +0000
Message-ID: <BAB907B5-CB67-4320-BDBC-37098336FBFC@arm.com>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241017084552.182136-1-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6686:EE_|AMS0EPF00000191:EE_|AS8PR08MB10246:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de5eaa1-c497-4802-c1cc-08dcf284119a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eUJyZkNMK1JsdmNaNmVjbmdFc2hNYTMwVWxBU3U2dlFiM0dXRUJQU0Y4ZjVM?=
 =?utf-8?B?UHRMVUMvdk5ONlVVKzM4Z2pVM3VvdUV2NFdDc3Y3TUEvQ2NSTUFVbDlQdnpB?=
 =?utf-8?B?eko0MW5YNjYwME92VVpXNThRTXBQSVNYSnE4ak9DZU1vRWZpL3dsM1pFVVN0?=
 =?utf-8?B?ZWlOa00xWTNvQ21IZk9XZjYvWHFLc0xxeEVVUnhPQVV6Q0xPVHdoUW1rUmtO?=
 =?utf-8?B?eHNkVGk1WEFiMkVMOEc0YUpmb2x2SnFLSUJnbnNhZUNKMU5PbnlmSWxzYU1h?=
 =?utf-8?B?bjluU0JJUDE1RFpMMVFwNFZ0WG95TXFCdkJLODl0bWJENDZqazc4VitURzg0?=
 =?utf-8?B?ZWk1aHdzMkZBbmM5RnFZNTM2R3pDeHlmR3ZnYUVsTEZWTGgwbW5TbzVjR25w?=
 =?utf-8?B?YjlPMVg0NENydWlCTlFjSFpuMUlBUkRtVllqN0tzVEpLWXgyZ25uWi9neng4?=
 =?utf-8?B?Z1AwZlFFejVac2dyYjRuNFM1am9ZOWtoUE1MOG13Q2hwTzZMdGdVdVFIMGpn?=
 =?utf-8?B?MUczNFQ4Yzh0Z3JRQlFETzlGWWRJbUdxa2RwQittWVZwMEIzNEVlcld4OEJ5?=
 =?utf-8?B?cU1aRlBUMlRtb2dGRnpBblJWRDZFRE5rVjJOaTA0WVdrNFc0VmpXcElpTCtn?=
 =?utf-8?B?NExENFdNdWp0eHJ4YkI2QTM1a2pEblVZSVltaHplRDYvT2lWdTBBV3pKNUxF?=
 =?utf-8?B?WFdGZ3UyZHdNdWRpbFh1K3NPRlBXZFdJakJUVXB2VTE4WTI3VERJWWFFTG5x?=
 =?utf-8?B?Vm1IZGdMYlMyVlI1L0ZVRXRtRngxL2xJQWRGb3NvZ0RTakM1dmZCSFAzZFBO?=
 =?utf-8?B?bTJWR09UZVlsYlY1QzJhOGRrZ3RCRCtZZWllMjIrdzdRMUl2YXorM09qaTdB?=
 =?utf-8?B?Nlh5S2w0TFNMRUxrZ2c4c2k4dC9LOGVROEZlbDA5c3FYd0pKbm9WdlRYMHRH?=
 =?utf-8?B?K3I5WWU3UDNPTGxVTmUxclhNM2ZJb0kzR0RZTHVQajh0T3JnazEyL1lPdjJt?=
 =?utf-8?B?aWtoZE53SFVUL3hpK3lkaU1MSmxBVUk2U0F4UEdySkc2OEtCbnlGTTIvakU2?=
 =?utf-8?B?d1liTG5yS3ZYamcxN0p6dHVnV1VFQ0QybFd3YmFGZ3ZPVFhlMTJ4N2xxOUUr?=
 =?utf-8?B?R3V6M29jNzl1Qi9IbFpEcllrM0NPMkNiV3FncmE4cnVKazBnZUdxd21XNGRR?=
 =?utf-8?B?MExMWVVUMEZkSTgrVTh4R0d6YUFTUm4wNVNsWVc3R05lZE1sS3NMVy9XNVo0?=
 =?utf-8?B?NlJ0SVZQanhpVTlaWVpzclIybHlpYmN2dDEwdHE2ckRrYS9keWZpZ1J3YXdM?=
 =?utf-8?B?U1UzMTFvOUt5UDlUV214QVphL3FuS09PSjQ1OCsxd1FjbmhDeFViTVM4OHVT?=
 =?utf-8?B?ZlBPMjBWM1ppdDVFTm9PbllxNy9hQVhrYUFiZUNQWlZDZ3BsRXVhRTlTYjZI?=
 =?utf-8?B?N1NkYmtJcFZoajVoTUUxR2VHdWkvcHlacHZIbi9QWkRXSktBcWJHVzNMQkVJ?=
 =?utf-8?B?dWVKMGdwRTVOaWlVOHJjM2RVNUU2RWYycVQyWDh1T1ZPSWwwNHF6S0VvWmtG?=
 =?utf-8?B?RUUzZFd2c0JldXdza2RXbFJrWkt3aDNtamxCL2NmSE9LbzNic2VaV21yazJY?=
 =?utf-8?B?ZVNnSkR1MTBVT0o3NUxSVDlvc3crTTBkU0RZamI4ZWk4MkxScmJqWDkzRnZn?=
 =?utf-8?B?Z0xoS2NkRmNqVFJnQXdMbnhnbmM3TG8yVDVqRnoxZ3YrVlJPa3AwRjhEY3do?=
 =?utf-8?B?WkZ1T01ldUZSTUFsTnpqKzc0Q1VwK1hycndMZlFGcWRxTDBDY0ttMlhnR09F?=
 =?utf-8?Q?dNDIL5hvHqzu0OTckQnBJWpdEi2BcWIOh1gFI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D331D4280A0384B966AAF06D2D12489@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6686
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd018d85-acbe-492c-7746-08dcf2840bda
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekFyNjBjQ2RHUzFKWEpHUjQ1MmNiZ1B1bHVvSzIwZXo4cGxGb2g5OTQ4dzNn?=
 =?utf-8?B?blhON3lQdXpQcFVJVmJYSTRDTVdoQVFYQVZoeWZ3YjZPa3R4bGRuTUxlVkp3?=
 =?utf-8?B?VGZGek9NNkpiWmJBTmFQZVZGZ3FtSDZCKytFNGMzczZKR2ZRVDJrbXBKdE9h?=
 =?utf-8?B?MFhGencrWWZNY3lpSm9JcE0ya1JmQXk2MDZmYlJyaHNVSEFKRktId1dJKzNO?=
 =?utf-8?B?bTNWWFhRdkVsTWk1bUo5UXlzSjcwb3NPNm56b0p6Z0gwT2xXbEpKOVVTQ3Jn?=
 =?utf-8?B?L0RPb3grelhsZmVpVkNGSXpUS3I1R3N4czE4akJxQmZaV05CRWw3MTFXODMv?=
 =?utf-8?B?VFVEd25STm1abGhVMU1LTmExLzFWK0JQS2VLMWYxMlB4ZUZmMks2bFFHVDNz?=
 =?utf-8?B?QkJNOVI1L0ZMSFo0S0U3NEl5ZWpBUWNZMUpOcytDbGRZTVZLKzBQN1UxVWhn?=
 =?utf-8?B?R1UzTHlCMlZuN0Z4YkNBdGtoMTQvbFJDejVRRm1oWHkwaEp4dmMwZTR1U1Jr?=
 =?utf-8?B?TDNUYnNqUm02bUZFVTNMbUpOQVliNHNQRTB3N2lUSXlzWHBvVStIeE1rYmFR?=
 =?utf-8?B?OERHYVRLYmhXYkV6aDNrVzVrMFAvUnlnbUFDUm9xOEVpNjVRNW8wRmJIMnNR?=
 =?utf-8?B?ZHBKdUxDcEo2R1lvNXZLOCtoQm1Ca3BQZCszRHhKN0E1S1prNkhsUk9IK0xz?=
 =?utf-8?B?Tzl5a1F3bmtYVjVDOVR6V05JNEVjRVB4a1BUNzZydFJVbDR3NzVGNUF2L0dS?=
 =?utf-8?B?cWJBclB0b0tnM09WbGFWK0U1S0dNQnNSR0hGa0tkZ3ovTU0vL01HZEpnZ2I4?=
 =?utf-8?B?THdqRUZTOEJIS3pWaVdlTlJSYlJsb25HL0RhUm5xYytFc2wra1FGZnNVQmZw?=
 =?utf-8?B?MTNkUjB1cDBMbXNUMTFleFFLVVcrUzJpSWNrbUN4c2lKdUlYU3FEb0RuWG5G?=
 =?utf-8?B?VHlsZ2g0OVJhVmpPME04aHQ4WWpNWE41UnVKd3VPK016dWU1TXh4cGV1Tjdj?=
 =?utf-8?B?VkNMWE9sWEZ3cTgxRk9BRDlZbDkvWGNqQUMrRFkxK1owNnlsRnJIeEFRemFT?=
 =?utf-8?B?TEEvbDh5anp2WTVZNHhJQVM5WVBkNFRpbVB6Mzk4RENPMStoT2o3eFE5UFJa?=
 =?utf-8?B?S3VIcUcwRFk0dysxSzlRdVNhYXJDUzJZTThiVkVXMEZiRVdISUU5OTN2Y1Rn?=
 =?utf-8?B?N0s3Q1VnclVJdExSRmtIN2FibmV0clIyL092VkdWZG1CMjhwRVJiRmFXV1J4?=
 =?utf-8?B?K0JtUU1hajBhYk81QytHY05PMlRQYkJJYTJsL09RRm5xdStJL2psVkpmOGxT?=
 =?utf-8?B?QVRoSTAyMGJwZnRDd3dJTmRpY3MvWGdRN2xHUkF5alg5K3dNQlYvYldnaEo5?=
 =?utf-8?B?bXhubzFGT3M3c3I5ZjV2VmFMa0FWL2VNNm05bDY2M3MrZG1PN2kweDlpTkNW?=
 =?utf-8?B?SGJCWDdObXlMMDl2bkkyck42Qlorczl5bGpiY0VMRUJEM2RLYWROcjdvdURy?=
 =?utf-8?B?QnUrRGMzVXdGOEFmdEtpb0tzLzJWUXJZSmQyamR6R25OeGZTSXpOWG5qS0Vk?=
 =?utf-8?B?T0dVNFFhZDBKMmVXZm82eGp4NG9KWXZTTGFHaWloZml0MThFT1p0Qy9yWWxT?=
 =?utf-8?B?OXFWK1lpYzd5U3ZZeTlzbHVBYlhUSlVsVEg0UStycmcxZTdnL0c0blJCdldu?=
 =?utf-8?B?NXg2NG5IRjJkRjF0RWlIWmxvOUZmVmZuUkFiU01XcE1yN3R4ZUtJYVpFOWR4?=
 =?utf-8?B?L0hWVmd6TDRDZitVTHRIWXpLTzlvVUFBTU5XTW5QN3FLYjRpcyt5VktISzdj?=
 =?utf-8?B?eXJtalBIbCsxTStHbS9HbmQrZDlOdnN6ODQrSHZDSEZ2SXRyanRzU3Z6OTFK?=
 =?utf-8?B?RzZ0Y1VlZlMrN2srbHNxSTgzNCtDbEIyNlE4Qk96Mkp4RVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 10:27:02.3477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de5eaa1-c497-4802-c1cc-08dcf284119a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 10:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206147

T24gMTcgT2N0IDIwMjQsIGF0IDA5OjQ1LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiB2OTogRml4ZWQgdW5yZWxhdGVkIGV4dDQgcmF3Y29weSB3aWMgdGVzdCBvbiBn
ZW5lcmljYXJtNjQuIEVuYWJsZWQgbmV3IGFhcmNoNjQgdGFyZ2V0DQo+ICAgIHdpYyB0ZXN0IG9u
IHg4Nl82NCBidWlsZCBob3N0IG9ubHkgc2luY2UgYm9vdCB3aXRoIHFlbXUgaXMgY3VycmVudGx5
DQo+ICAgIGZhaWxpbmcgb24gYWFyY2g2NCBidWlsZCBob3N0Lg0KDQpTb3JyeSwgYnV0IEkgZG9u
4oCZdCB0aGluayBkaXNhYmxpbmcgdGVzdHMgYmFzZWQgb24gdGhlIGJ1aWxkIG1hY2hpbmUgaXMg
dGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGhlcmUuDQoNCk15IGd1dCByZWFjdGlvbiBpcyB0aGF0IHRo
ZXJlIGlzIGFub3RoZXIgdGVzdCB0aGF0IGlzIHJ1bm5pbmcgd2l0aCBrdm0gZW5hYmxlZCwgdGh1
cyBicmVha2luZyB1Ym9vdC4gIEnigJlsbCBkbyBhIGJ1aWxkIG9uIG15IG93biBtYWNoaW5lIHNo
b3J0bHkgYW5kIHNlZSBpZiBJIGNhbiByZXBsaWNhdGUuDQoNClJvc3M=

