Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1617CC02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 08:54:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web10.83719.1738572845978644289
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 00:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YaOIGefb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YaOIGefb;
 spf=pass (domain: arm.com, ip: 40.107.20.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HNB1UUkhHwW4WZozW7CWDmVVEO80HaqpFO18eg2MrMFncTDVRHCDv2uDEr8r5HCXZpgQvjupbm8SShzB5QFzot4Ts20cz40yN7lIiywqb7WmJ7K08JNROLwcMCIBiEurMHdomsrSg9u++NBkqLBfrqBWmssPFoV3YuX+yfcRoUSRg+Fsriag3QymHp8hN3jkn4Rghv4HSNgJf4Zx7YZswSce4o/PQ9bd6LCSegB1hi47ny1ncFSq4+nYdQxgmaxEQW3RNpPzO+1q9uSrtOTjw3+042LSi2z5yHIz/Ie4eUxHnTiWXpF3RdTZWnjqOMq/J4JCXbp5Y6CJ2qoDP5WnWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jzCRMgVT91ohMifthj3GSSutxI6exQDtzI8+fQSZjA=;
 b=IQ+Cc3XX2FxTH9Ln477MYLt3LWJQriFRCpKSLxeny74Rc44AiqAu5hb9Zx1LlYyY27TygfgvjNgBoOFXm5rfNm4zCINnpHejEXyoYfSZn2lWM7fUBSY365aWsThMdry/InwNnJqWqcKPbRn1YJxtck2riwQPidWfrO4oKA/2bxHpAS6nO2UGG7793GpAPQNcN2qUIfDZbWo8l3Eqr/uiMoV3hV6uw+yA409hY0jijtBGyRELyJ1RgZJzHpcc4fxkU1RbXWhdDLuO9QzUnRb+OCtKLYiQIzEYbU2PO/9kALWnLjhQbTbKIPE+h5k1l2isHgOmJgHvN1Kv2at88Bt32w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jzCRMgVT91ohMifthj3GSSutxI6exQDtzI8+fQSZjA=;
 b=YaOIGefbT53svcKfvqJdblwuLeq0FWbl+MXt0h64/8Xrl9e2yDhAGiYZAgVhu83V8OURHldNq03B0hI7txc5LoJh1DTp5MhjEq+qc5BNg3WgBN8g9wyHV/DQYK0333ZoLoRNdn5EW3oOtbVENOI2kxaL2uhdUoyAq2NP3/oLTiY=
Received: from AM0PR02CA0219.eurprd02.prod.outlook.com (2603:10a6:20b:28f::26)
 by AS4PR08MB7781.eurprd08.prod.outlook.com (2603:10a6:20b:515::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Mon, 3 Feb
 2025 08:53:58 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::5b) by AM0PR02CA0219.outlook.office365.com
 (2603:10a6:20b:28f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Mon,
 3 Feb 2025 08:53:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 3 Feb 2025 08:53:57 +0000
Received: ("Tessian outbound 4d4d74fe3cc9:v560"); Mon, 03 Feb 2025 08:53:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d33d62ab5456e124
X-TessianGatewayMetadata: d4w9/4KHz1hkskLAuBDdMdy7BRdUXEVbW7xwDqhf/0JwFIJoNF5p2DRuARmkJhVoTEF3nqir1/6lQQffOAJIB/GaAe67V0HGNUZaaGENz1idHVfl7g5PgaTr+TdtUNNPy4sRWdIy8mAbeJAYa/oqfCtgtQjt2xkGBHb3H4q+lvc=
X-CR-MTA-TID: 64aa7808
Received: from Ld41302be2012.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B08F660A-5B98-41A9-B937-42CA1CC65A3F.1;
	Mon, 03 Feb 2025 08:53:50 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld41302be2012.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 03 Feb 2025 08:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMUJUPbNiFGiphi0qv1KgA/EYqzlMltZeUsSqOb27fb239BxNDVAyqZqlgS9Hd/qeufEHrQsiWvRlum/0y5HngyuRVkaWA4UoQCAD5CPhVH+1YavenwpYfmsSeQ6KMx8eS46mHhQ3gl6JsSGLcTLJckFx3RrTwZbK/zVL00MKckpb+T2Hu9MXKdQvTW9QtR7ZZ2rJ34kxWyLKGBF+NBp685yCxAWRmv7Gt2r5g0ceFQvkkhGfHTAqwnUjWPHOZUcJFPDjbHGZXFhV6AJ3CLI/MwkPSATfxkcvtqKAIE5KUHuu8oBcu9MOyVg3+M/bNhBSet+WoUwmTUNF8ODAB3OQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jzCRMgVT91ohMifthj3GSSutxI6exQDtzI8+fQSZjA=;
 b=EQZJX1maL6HIHQAz2kaXt1uiUH8ISuY4oFTdR555eAiCx3ThSl4mZxOKE9YvLfC+GEMVOIQLS9G9b6EyfG68MCuJ1XLrdDxGKojWl4kDHEV6g45We9rGseWGZJfSVoKm8xyjfNZS5ldiVGhZmoCuaCefvNBTXgS6FyAulLMb/+toU51ruslBmdMztTwQXI5j6WoQ9lKwjy6AQ7FtVdthlvMC/p7ly9P+/T0qa5ZUnqIAt+vj8Ta7tUMvEi2n9JhYdWmplRvd/maz+1TJzU6hppVaP4DUUDw3z2svAcHtwjqUE0HGpbsjdwEJ7U9TrF21QD1M/8cf856ZNyRONk0jUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jzCRMgVT91ohMifthj3GSSutxI6exQDtzI8+fQSZjA=;
 b=YaOIGefbT53svcKfvqJdblwuLeq0FWbl+MXt0h64/8Xrl9e2yDhAGiYZAgVhu83V8OURHldNq03B0hI7txc5LoJh1DTp5MhjEq+qc5BNg3WgBN8g9wyHV/DQYK0333ZoLoRNdn5EW3oOtbVENOI2kxaL2uhdUoyAq2NP3/oLTiY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8685.eurprd08.prod.outlook.com (2603:10a6:10:403::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 08:53:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 08:53:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "uvv.mail@gmail.com" <uvv.mail@gmail.com>
CC: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] systemd: Build the systemctl executable
Thread-Topic: [OE-core] [PATCH 3/3] systemd: Build the systemctl executable
Thread-Index: AQHbda242zu+5hx67kCZ1zZ5jBztyrM1Rt0A
Date: Mon, 3 Feb 2025 08:53:46 +0000
Message-ID: <A9D2F87B-3A31-4CDA-AF52-F30B926260B5@arm.com>
References: <20250202200319.82231-1-uvv.mail@gmail.com>
 <20250202200319.82231-3-uvv.mail@gmail.com>
In-Reply-To: <20250202200319.82231-3-uvv.mail@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8685:EE_|AMS0EPF000001AA:EE_|AS4PR08MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a51028d-ecc1-4852-b105-08dd44304bce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QjBFVlhmTU83Slh3K0g4K0JSNmh1RXlJWEdoWEVTcVhSaWt2aG9xTDE0UDRj?=
 =?utf-8?B?b3REcmtGTEYwVm12L1ZxTUc2a2FvcmMxQm9Nc1ZrM292UkFHNkhwWkV4Y216?=
 =?utf-8?B?WFNEOFVvR05laUo5NG0wOVJ1amVreGRiWDNLYmNEdHZVQlNYZ0ZyZVlBSklv?=
 =?utf-8?B?alYvK293TS84T01aZkRoWHhTek1yaW1acW9zSUJ5bEkvR094NFpIT3hUOXY4?=
 =?utf-8?B?emtlaTZYck1RYjY5eVM5djFqeTErenNtZ2pNcUJ0d0lGaEpJMnppN0UwOXJQ?=
 =?utf-8?B?K1ZwZXRMR1VUdHdoNCt0ZmhvVjlhS1doNG15TU9lR2g3T2ViejV6TThZelBC?=
 =?utf-8?B?S2srWEs2TCtwR0xIZlZPRk80bFEyV1JtdUtSZWp6TmJqTjJ0VFkvdWVqV0Vq?=
 =?utf-8?B?b2lZQkFXUDl4ZzRZM0xIaFJsOVZvSGtDNFpmVFdSVWI4MFZyU1ZJaTZnL0hx?=
 =?utf-8?B?Y1JHN3hSbjZXQ09Nd3E3NHNOcDRHajYrWDhFeHBpVTRSZzZLb29pMHovSEFH?=
 =?utf-8?B?VlA4MGlDU21FRWYzZ3MxZm5LdUxCdGdMbCtjbmlrTzZzWTJpVDlsOU81NFhJ?=
 =?utf-8?B?ZzFhcmN3S0VEWjdlU1FFM0tjSVFGbkpRSFJVZUw0ekkzc3ZGUEZYd0RUTGhv?=
 =?utf-8?B?WHFINDJtQW1QUS9kaTN0MmhveEhZNnBGZis0UGZubWsxclFObHBuNjREbGhj?=
 =?utf-8?B?WnJqbmRTN1BmSkVlaHlnMlRJbE4yQTRzNXlkT1NwU1NCWFlCQ0ZnV3ZnRWtm?=
 =?utf-8?B?WFY3NVQwVFIyWnFLREhDSGNGdmRqY2dYbENseDA4M0R3TFhvNVcrOUNUK0tP?=
 =?utf-8?B?b2pGMEZ6RjhVeStKWFd3VEVsTkhNMUFZRHRYN21lS0NwRWxueTl2Y0J5bisr?=
 =?utf-8?B?NUlOZHQ1elZUUUdJWnZRM2RaMm44Rnh5MzREMW5YaHJQZmUrQmVOTkZrRXN3?=
 =?utf-8?B?T21lRDI4anRFUityaFRBbWhsTDlpL0ppemxISDF4TFlHaE9MOFNSMElrOWRi?=
 =?utf-8?B?ZnpzQlBNbENQSmsvZWI2WDRlZUlCOFh1ODJRTDNER3JVdllQOVJPMW1oVWE5?=
 =?utf-8?B?cVJCNmx2WmNwRTdyK0FTdkFzMm0vcElBSXd5QlpzMVhheURlU2RCRmdPTXh0?=
 =?utf-8?B?OFlORHV3bnpoRklHbTNrV3E3eG1WOEt1S0xXZHBiVkU2QVNVVDRkT0J3NmJZ?=
 =?utf-8?B?TFo4dUlsekw2ODVvakdyYTNhQTRjcHZQaXBvbis3aWxLV1pONzQrT2xHbDBH?=
 =?utf-8?B?WGkyZmMxcmI5bG1tSm1hemhEQmlKcDMvelJaUHVlbGpTbnFyeXAwbUI0MGVP?=
 =?utf-8?B?SDR1TG82cW1pcjhld1p1MjM3ZWNFYjVIa3lBbkVzbjh5SS82RkZncUdVUTJG?=
 =?utf-8?B?MHBvZmxXU01FYy9DNEdHN1lIdHdzZGhzUTlXbGR3aVFSUSs4ZXBBb2dzN2kx?=
 =?utf-8?B?ME1MYUxvQmx1Z0ZtN0UzWkZ2NDh4dGdGYm5tZnRTdFpjMnh3ZEZwVEl2dEUw?=
 =?utf-8?B?WGdVNkk4M083YnJkVWQyZURxcGZ3OVd0WlJTUFVPZDNxMUFuQWY5aFV2aVZK?=
 =?utf-8?B?TmVBUzk3MlpFNjNxQ012UktpQkxGWk5aT2RMVVZ3YitlcVNON2dGT3dpQWZ1?=
 =?utf-8?B?aTJjaXRDdUQrdVFBeWhSZHFOUjlta3luRnJvR094S3ozaFIwak5JTFVCd3p0?=
 =?utf-8?B?am5TTGYwZmJHeU5ISXVXY0tWRE8rT0NkVEFXLytVUjlQcW1Hd3VJMnNOdGZD?=
 =?utf-8?B?S3lHYllReCtlVEVYMXRrdWV4bHpaUm9YY2FxT0tMb0tFQ04xVUFDR0l1SGVU?=
 =?utf-8?B?TUlQRGpUZFY0RGZQNGhMMzZwNTFXdGZOZ2lGRXMxWWpYSmZMcGM4QVNVVFZy?=
 =?utf-8?B?WlJwUlJ2UUxuN1NBOU9sR0hZRzlPdXdVeUtEUEkrMHZXZDJGZ0t3TG9ZdkJj?=
 =?utf-8?Q?IlxC8LR/HMwVAM/x99bYUXp/79FeqhXA?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DDADEA8ACC05546BA880B267AC71361@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8685
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7c2eb47e-9c69-4ace-c6ad-08dd4430453c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cVhrTVlaVUVOS0M4c2F0TVBlaS9NeDlveXBYY2FRSE9neHN3VkdMRmtaWlF1?=
 =?utf-8?B?NmRZZEpyNFhnNWJFdnN6VmRsVTVaSm5Fa0VFcGc1d0x3N1k1S2EwN0RBY1VP?=
 =?utf-8?B?T0xLajh0OVhRRXN6bWJtekhyWFVydi83RlhSOTZKT0JRVlZ2czlxaXQxUGFu?=
 =?utf-8?B?WXF3QVZUNGtRb0t0ZlhSNE03Y2Zvck16eUpZRHlUV1M1OXJEZC80TUJrNEpx?=
 =?utf-8?B?M3ZPdGRZVEdsV3lsbUlGcFhraUdmalY1Wmk5Z3hoblFIT0hJZm8zSVc5TVRY?=
 =?utf-8?B?b0VaYitOcWR1Q21PRUo3VFJmcWVFaGVNS3M4bmd3clNtV0VGbnFQY3h1Tnd4?=
 =?utf-8?B?SWdxNUo3MWt2K2RpSVJlZkZXbmdyYUN4cmIwYnhjZWM5TmprY2ZQOTY1eHNM?=
 =?utf-8?B?WUY4cm5LQzlHc01XeE9VY3VjTVNTalVaYkxnbCtRbkRMSDBxZTF5eDIxRnlm?=
 =?utf-8?B?MWF4d0hoWUJwUVFCZDhMMVpLb3RDNTAxUC84MEVMdVAxK3FOTjlqTjVhT1BZ?=
 =?utf-8?B?RitNUWQyUGpRY1dCSnZXWmJRUllCZk9TMUJFemhxa2RNbU5zeEUrNnNuZUZo?=
 =?utf-8?B?ZGk4eXBTU05PenNhTjI4TkVJMm5iUHAyeXZnbGNtVE5mOWM3WVZtOWlHVGpU?=
 =?utf-8?B?bDdsTEEwY0M4V0FCMkNxT3JuZG1XLzBEeFRuTytqM1pNc3pBbEkvdWtjUFNV?=
 =?utf-8?B?UWM0Tk1QKytWTGpua1NhZ0kwZ2owWEF1T2FVN1ZPaTYyTWdQRFJEOCtsbWFU?=
 =?utf-8?B?SHZRaExBMmRKQzQ3dEJ1ck16WHB0RHM2UEc1RDhNMkZjU0t4ZEorMkFqa09P?=
 =?utf-8?B?U3ZmbUNVL3VDTmNIR1dFY2l3M0ozZ3MydmZxSWY4VDZhT09COWN1R01DWFh1?=
 =?utf-8?B?Mjh3VGplUGJRMTgrRFlmakpuK05BdVdvZG1aTndzZDZ2V0tFUVhaTmdMeU5v?=
 =?utf-8?B?U0RLV1JhRERxSzVlWjRlOGpUSStGamRyY2k1aDR5WVJsQ08ybXY3dTNWcUNO?=
 =?utf-8?B?bGlQQ3dKeXl1dzNwVWp5RlJQdlZhSFF5NEc1M2haUExjQnZCdHJ4cklQeUlL?=
 =?utf-8?B?WUMwZmFrWCttOHAydWpUZ09YYTZzS2hFbU05RlY4T2pzdTJKSHJpQUxVMkJ4?=
 =?utf-8?B?TDFlbUszU2h3bVJuREJic0JtMFZFUlRCblF0SUZaVlVUMkVUT2l2RHp4QitH?=
 =?utf-8?B?c0w2REFwN3kwYThEcy96RHVUYlBXR0xwTUNuaUNaRzBxUXJEYTZRSjhoR0s0?=
 =?utf-8?B?OW5objFmaXNVZ3ZNVXZ5ZVNLQnZTVTRVdkcxMmZ4MFFNUkNBQ1dkRW1YeXlC?=
 =?utf-8?B?NE9xZ0JBMlRqQ0hGN2RuMUNrTzlsSWJJbndobXlwYm5tSHdhR0tLNmVZNmRI?=
 =?utf-8?B?MmhOL2N1SUltcmRXdkpNOHhaUmlFbkNLZm9YejRuclFIbzFieTFBV2t3QXJD?=
 =?utf-8?B?djM3a2Jna1RuKzhHUzFLa1VWSlcwYnRJVEJCOEJlRFB1RTZpMHExSG1qb0tt?=
 =?utf-8?B?Mmp5MEVETERDWWcyWlV1cFAvL3pobDlMaVd6WmQzbCtJbUk0QUhqQ2k5Vk5s?=
 =?utf-8?B?SlFiQWI0Um5qWDJSb21YRk9XeTY3Wm5ZNWhGRnlZWVc4dHE5c254MzdmQTNu?=
 =?utf-8?B?MUMzb1RaQW0razJoQ2ZBZnN2TDB0NkduN1RMRHNXREZUUUZYVHVFNWZ2V1JG?=
 =?utf-8?B?S2h6dGpBZ3NualdiUnNaYzlDYzRFNU9UUk80L0t4dVl4Z05heGtOZlZxRzEv?=
 =?utf-8?B?am5MdHc3cEFIU3NmRzd5SjlaMStEVjdlSjI4cXNxUWQybDFMMjc0ajBidGdG?=
 =?utf-8?B?MXhPUzBwelBGN3JEcTZiakZzak9sa1UyYXp5WUsyOW9QenNoN3YvZHpueVQr?=
 =?utf-8?B?eTRmWjZPcmhjR1hQbmJiSEtIRDl6cGRXUXUwQ1JWMU9HdE5Ia1FQbFJkcHFo?=
 =?utf-8?B?alhURm0wNmEvaG4rMWduMjgzSURVZDdmcVA5M0lHR2h0Q010bE9qT0JkM1Z0?=
 =?utf-8?B?N1Frem81cXhnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 08:53:57.6965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a51028d-ecc1-4852-b105-08dd44304bce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7781
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210632

T24gMiBGZWIgMjAyNSwgYXQgMjE6MDMsIFZ5YWNoZXNsYXYgWXVya292IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDx1dnYubWFpbD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IEluc3RlYWQgb2YgdGhlIHB5dGhvbiByZS1pbXBsZW1lbnRhdGlvbiBidWlsZCB0
aGUgYWN0dWFsIHN5c3RlbWN0bCBmcm9tDQo+IHRoZSBzeXN0ZW1kIHNvdXJjZSB0cmVlLg0KDQpW
ZXJ5IGdsYWQgdG8gc2VlIHRoaXMgLSBJIHRyaWVkIHNvbWUgdGltZSBhZ28gYnV0IHRoZSBkZXBl
bmRlbmN5IHRyZWUgYXQgdGhlIHRpbWUgd2FzIHF1aXRlIGludmFzaXZlIHRvIHJlbW92ZSBzbyBJ
IGdhdmUgdXAuDQoNCkhhdmUgeW91IHZlcmlmaWVkIHRoYXQgdGhlIGZpbmFsIHJvb3RmcyBpcyBp
ZGVudGljYWwgKG9yIGluIGZhY3QgYmV0dGVyKSB3aXRoIHRob3NlIGNvbXBhcmVkIHRvIG91ciBy
ZWltcGxlbWVudGF0aW9uPw0KDQo+ICtERVBFTkRTID0gImdwZXJmLW5hdGl2ZSBsaWJjYXAtbmF0
aXZlIHV0aWwtbGludXgtbmF0aXZlIHB5dGhvbjMtamluamEyLW5hdGl2ZSINCg0KSeKAmWQgaG9w
ZSB5b3UgY2FuIHJlbW92ZSBzb21lIG1vcmUgb2YgdGhvc2UgZGVwZW5kZW5jaWVzIGFzIHdlIGp1
c3QgbmVlZCBzeXN0ZW1jdGw/DQoNCj4gK1Vwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkDQoNClN1
Ym1pdHRlZCB3aGVyZT8NCg0KVGhhbmtzDQpSb3Nz

