Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19365C52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 11:07:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web11.57413.1723115222067758221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 04:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Q+prSfyq;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Q+prSfyq;
 spf=pass (domain: arm.com, ip: 40.107.22.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yvFsnJ+NCFj1BecklahpnI2nesr7LbDahTZa2f+ofoSxYDbZfqOFj6pB6Zrg4BGMSMenGrP6j+YI4zDSKVRGr3Z4NArvKFm2jdNnLma2ZXoQ9cnWd4f+gZm9oq3B39Rr7635QdTsBQHfH9SumYHrHIQQE5IYPxr2BCza34hyUSN3DapPwPluHC9xjKSnOqxxOvdHpG8Bv/RzbS5jBqvM6K1JgZu1yKaOC4rRPJMZuhna6KflbiiaIMn2r5W70S6Urc4DUEu/D9cPLitYFDSYTXIWw6QoG6BZPQZspP84xGw8knTP6m7UEhyNE8SXsrssB8OmlFy/RyUfWxCNhj+rTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDQ533FgP2LZQ1T4JACrODZknaeihzPdYX7VpEFioFw=;
 b=BRM55NWTxWbYeaKQ4wliSzgsvl2i376jFFKoHi4L1WdlDBIBcwHqcL7igogJKDrHZrTPjvyQA92YJGmL5/uHBPVf4DBcbjFZ+miNzF9pt96HLW3NTCyHNm7eHSEdTRTcjuibWxfDAWKDomdegdJLUmgbfiF9en0ZJsbv31olwcHhXmA4ThnYnlTLoP5W1A6cjUx+6txiUFV3d1feALWTal+C7qxhCtVD0iNxFFxs0X7EmGQbIOnNkZtJamHIQS8n6p+Ha+u8bSFZm8X6Fy3KSLhhmDKbYoJSSA/w6UN69IUolifhtkMuUif+M/tEkpSRxQK4qPpFKuO1856xmgxjWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDQ533FgP2LZQ1T4JACrODZknaeihzPdYX7VpEFioFw=;
 b=Q+prSfyql/rkwo2zd1eJQz9pVP5ej789rBizz58ybZR/py7368KC/ZXxrbzdJdYZQe3jHNiDgI4SZTrUZOgrtP5ezk2VFZZ31JWBD0tb+FpwIZkVqRjJVa1wvqO81SLkZgIdahKgaraVqxGHEsh+N2QfNJBG0aOESclcs+SHw8Q=
Received: from AS9PR06CA0361.eurprd06.prod.outlook.com (2603:10a6:20b:460::13)
 by DBBPR08MB6187.eurprd08.prod.outlook.com (2603:10a6:10:209::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 11:06:54 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:460:cafe::7b) by AS9PR06CA0361.outlook.office365.com
 (2603:10a6:20b:460::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14 via Frontend
 Transport; Thu, 8 Aug 2024 11:06:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8
 via Frontend Transport; Thu, 8 Aug 2024 11:06:53 +0000
Received: ("Tessian outbound e51bb20c2cc2:v365"); Thu, 08 Aug 2024 11:06:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 204a73de9081fb90
X-CR-MTA-TID: 64aa7808
Received: from L55c7ec396c45.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3A527139-9B45-4841-9922-2A6F53227426.1;
	Thu, 08 Aug 2024 11:06:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L55c7ec396c45.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 08 Aug 2024 11:06:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm5YiA1Y2c1AErKP/OnbyCfwLrnSiPwNcvc8DR88MHi+FqBxbORWEiQlJBR2R5tfd14w/jtCVMa8fUx6RDdEwjUBuKLSw55d593Cft//INQl+pk5YYzN8+XLo0vpLnUjbnNCiJvgAbgcir37YS34R3wrDIzFwG7Lmoj1peWCQmg72+HLe/jpCP3pISJNC3DibO0yOjZT4RaF33WDH+9c9dmpLJqx42zC4afW1GwQrNOU04PKyFPZyebZ6qcb9Xb0XvE9Fo2P0ygKzi19mQA3GPAOTvBIkpQ1USUi+hngFF5FmaMde7mWVfQlu9EYkdzZnRqidugg7HZrgnBC6NkWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDQ533FgP2LZQ1T4JACrODZknaeihzPdYX7VpEFioFw=;
 b=F0hE4UzDfZ8bCobxYbhJvrfzJ3Cd7tHaP/8o7HN7hCmQzQipeIUEtsPPOLHdk+uXUqfZvLGHCZ3ig/geGU3TdX9PfN1PSesDfpjNIhhxs8Wmnp1R5mrD0SBP3hHkROfLDLVxR50GKtuxGOJUVQFw+R/Wa51arAlHmKzjFXIiB8C1us65hR69lJhDCzXs5KfjmedoKwr8IL4CKddy01NlA0UyW9hNjFOafsDtw2wNLw564tyoj5tIyolhulr9facwQUSFI5k/Pf4iBSc/xdK11VNC8qJyhw5/fSBf6j6K5NnPouS4/EiS2BoJXyNTmcZt+WuWMIjX1fAk/kREKof1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDQ533FgP2LZQ1T4JACrODZknaeihzPdYX7VpEFioFw=;
 b=Q+prSfyql/rkwo2zd1eJQz9pVP5ej789rBizz58ybZR/py7368KC/ZXxrbzdJdYZQe3jHNiDgI4SZTrUZOgrtP5ezk2VFZZ31JWBD0tb+FpwIZkVqRjJVa1wvqO81SLkZgIdahKgaraVqxGHEsh+N2QfNJBG0aOESclcs+SHw8Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6017.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 11:06:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 11:06:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "hetpat@cisco.com" <hetpat@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] zlib: add vendor to CVE_PRODUCT to exclude
 false positives
Thread-Topic: [OE-core] [PATCH] zlib: add vendor to CVE_PRODUCT to exclude
 false positives
Thread-Index: AQHa6VuT9FZgIjstQE+B7u8jbsCQFLIc5v4AgABMVwA=
Date: Thu, 8 Aug 2024 11:06:42 +0000
Message-ID: <A6AE0F74-DBA9-4A78-A640-C23FB87D1742@arm.com>
References: <20240808062340.1511175-1-hetpat@cisco.com>
 <AS1PR10MB5697413E57F79E0C2E7B5BA4FDB92@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697413E57F79E0C2E7B5BA4FDB92@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6017:EE_|AMS1EPF00000047:EE_|DBBPR08MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f785cf9-d29a-4b96-b9df-08dcb79a358c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VGFiaEpRbXh1U2VIQnJHSm1wR3hBaTlLYzltcHVLd000V0VrYmVqYVcrdlVK?=
 =?utf-8?B?QndaK0MrVmJXSUNLbUI3VFpwcTBXMWZ6eUY0WGxmOHJpNHhMSWhISG1yb3lw?=
 =?utf-8?B?MTB4MkpVSkt0Z3dna2VnTnVWSDVsYWU1Mnl2a2FycEY4VHM3bE1ZZjNacS9Z?=
 =?utf-8?B?a2RQeG81U1ZwK1o4ZHRHaXdUYVplNGU5S1RzYldiZUtPNUc5VEJsd1lVaUg2?=
 =?utf-8?B?ek5qL2dUVWxIU2RpNGhqeGNTUEQ5OFJDc243cW5UWlJPZzRBaUY5MEtESjhV?=
 =?utf-8?B?Nkc3TUdDcWRZWUJGQVJicHgyZW12VlhraVlvdFF2T1RySm9sbWZyYTIvTXZX?=
 =?utf-8?B?S3NUODdER0JoZHFGUUUxSmcxbGJNVm5jRmhVSFFLQjl1K05hcWI0TjZDNUVM?=
 =?utf-8?B?V0hSZnJYb3ZQOVNUSk9Od1llU1ZPWXNlZCt4KzhhcHowNVhEN21iNkJYb3pw?=
 =?utf-8?B?QXhudWFBVEdHOGcyV1JHRjZjSnVVS2hMd1RRU2VSbGIyTFozeWR1Rzh3R0di?=
 =?utf-8?B?Y0x0cGhVZGtpZ1dwOXk4OVVKUm82emt6WlFSaFRCWUFNTGNMc2JGdzdpWHRv?=
 =?utf-8?B?ZCt2SXF6emdRTEpuWXlobnVrQWJIYWdQaHcyZWY1SE1PQ0FjN3E1akJwUUpI?=
 =?utf-8?B?ZVhNNWdRaG9nMFpjTW9oZDVzV25OektkeGtMWjB4LzRkK0s1emVzdkxLWWJy?=
 =?utf-8?B?cDJDZmtvUDBVTXBNalkwU05ZTkN4STc0aEM2eHRBc1p2emg3WkhQR0Q4TkY3?=
 =?utf-8?B?aDloSUc5aHJnWVkra3B4QkdremNZYy81NkdnTW5weE4zVTFBQ1F5YTRqNWdx?=
 =?utf-8?B?cGcwU3R6d05vRWpPQTJFTzVUMXVYdFhCS3NDdnZwNTNrVXlvem9JVmR0MXYv?=
 =?utf-8?B?U3NBbjJxeldvZ1hMZ3hyMjBPN2srbGtyUjNnK2gxN0xST1dldlZycjRha1Zi?=
 =?utf-8?B?UHJJVEIrc0RpeW9TbjJuM2JGckxTZ0N6VjVRQXpiZjN5WDZLcWNnNlBQYy9O?=
 =?utf-8?B?aWJ0cGxTenpMdFZlaGI0ZkowcXdrNzJNZjltM2VZeE85bjlSbkFGcStyczF4?=
 =?utf-8?B?ZkgrUFBTMEljS3pTUEtnUDkxRkZlNk53Q1dSaDNWWXhUZWlzMzAra3ozNzhB?=
 =?utf-8?B?ZVhKaHE3U3M5WHJGZmRCMDdWWnYwVHdXU1EvV3JxdWN1S2NaVk44emVubkU3?=
 =?utf-8?B?a045aWZ6TUVtUnZPNldQM0hramZvcXQrWVVpOXNWeHJ6YXlTNWRybmFzR3cx?=
 =?utf-8?B?UFdQVUJiZXBSK2FGQkdSTGZhMlNTbGRIS0xsRFZFRGtDUXZ5eklIV1lwUDF2?=
 =?utf-8?B?aC9zNGs2QW9xM3ZpZVNDYU5hZUh5cStHaDVETzh5cC93dTE2bTJqNXgzaVZB?=
 =?utf-8?B?UHdoT0h4UldJYWpsN2VNRFkvb2dyNndVTm42TFcybHM4VEpPamhNcERhcTg0?=
 =?utf-8?B?d1BOa082amZZenE3aTh0QVR3QUNSV25jeUFSVkdLbGNXbDVwZ1VwUTdqajND?=
 =?utf-8?B?UXRHZXRIMFdiMEJqY2pyVU1BWW1qNEpLNWhOSGVTZFBRbU1jelJpMjNicmdn?=
 =?utf-8?B?Nk4xenc3WTdnS2FrUlNFZGVjVWx1V2o4b01uWUlPbEk5TlhMSzg0UmZZN3lH?=
 =?utf-8?B?N1lCQlY5Y0pTZUhRRkdpMDZoUW5OR2RZUHMvN01NeHRFUzZCNi9XTTNNdDNj?=
 =?utf-8?B?akYzc0Y1ZHpnTTFCVXpQaGZVVGhoZmJHSDRDc05LTk0vMmhwc2ZkYk96bTE0?=
 =?utf-8?B?WFZOQTN5ejRObDJrODdSL0NWQVFES0FWTE0yZDVPMGhGNTB0QW4vK04rbUlq?=
 =?utf-8?B?LzVwK1VhaHNZVTFQUmxaRUF6NE96YnhUaEhrcFJ3TWhqaVdDTWVhTlR4TlB6?=
 =?utf-8?B?OXB2WThxQjIvODJjZmlFVlcwTGVQY3ZTOTJLUFJDOWJwUEE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C51F42CCB8EB14C81FAC3869D096D73@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6017
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	beca5d10-ceae-4bf7-2d6f-08dcb79a2f64
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VXZ1YlpkckxoTysvb2lGVzVGQ1YvZks0SFM2YkkybnIxNUFwSFRKREgyTXFu?=
 =?utf-8?B?T2Z4bFpzYkZiWkRweG1BZm9uMElsbUp5b014Rk9aNmF2cWZFdk01OXpFRWN3?=
 =?utf-8?B?V3d6TlJ1Zjk2U0o5enVWemg0QldqRVlGamsyc2hDaHBiakJLUDgwV1dVK2ha?=
 =?utf-8?B?dGdSWlo1NzRId3JYNHpDRk82aWFNdWs4V2VRclRzZGU2ZDBJYnNrOWg3QXRY?=
 =?utf-8?B?TXVra2x4Rkg0UGNsMHBvRWlNMlJ4M2RJUHF1eENBRUhqZjVMN3d5ZkpoQXN5?=
 =?utf-8?B?MzlUMDhodGlkMHdTZ3U2WkdkRFNQdGFVUnRPNmhBTk9yVE01YzdXYTJCcVhi?=
 =?utf-8?B?ZU1YOVUvVktwOWh1bjBmcVJIMW1yN3loWlk3UU1ZWGtQRzdEbTJhZUQrY2Nk?=
 =?utf-8?B?L3F2TTBNd2w1eHlGOTA2bUs0ZHZFbzVoTWZJYW0ySEgyY2F3V0xBcHlVam9k?=
 =?utf-8?B?RDFzRERBdmRKd1FWd2tJTm0zTFlLdmRuZHdka2dESzJFT1dzRlZHaEdEOXVV?=
 =?utf-8?B?QTRhVVlodllvOENyVGVHYmdPOU1zU3Z6bUl2NFBPb1lXelBhOVJpY0hvaExx?=
 =?utf-8?B?YTd6eUJWaGZ5am9YbEFqR0ZsUU9wbDdvMDJDZjBLYXVFR1ltOXlxNmFOWUVr?=
 =?utf-8?B?NzllSnJxTWpnZ2VkNnFmalp3eHcvTFplUjNVdFJUT1N5eVlXYmJxOXgvL1c1?=
 =?utf-8?B?QzBtbjZrV1lZV3EwRmNZdG05bThKMm1LUWR6YjFYRzB0eEdQS1F2OEREYkhR?=
 =?utf-8?B?R2tJSjBIVkUrOTFFNlltaGI1ZmU4czFidlVpZUNGbmRWTWRVeFlERi93WUt3?=
 =?utf-8?B?MllLUWIrZ3pZVExoUmRrcTZseExoU1QzRnVuUldFakdLT2pLTE90S1Z3Q3py?=
 =?utf-8?B?Ky8yZlFBbE9JQ3REQzZMbEgzeWhUejNlbkU1TDNCOTZBVHVlTzBPa05iKzFs?=
 =?utf-8?B?WW5zQlN1V09aSmtpd2gxTE5OdVI4Ty9tRjQzQ1BJVHJjMllwRzMxQThENTcv?=
 =?utf-8?B?cWRybk9QTlU5aUpQdXpEMXBsMWloQ2xiUnQwWDJtakZiVnJadERXOW5JS3Fa?=
 =?utf-8?B?NW95MTRyQnhoYU1RQzdjYW5iREdSdERtK3g5V3ZUQW45SFF2emFuNU93Z21v?=
 =?utf-8?B?Rm9iRDYrb1ZTbzFHNVFqeG9LNENIUjA0UWowSVZFb1IzRkZxdEY1MEpsdFA4?=
 =?utf-8?B?N0Y3NEFyd0JMRTduZXZ4QW5jOGF5U3kwb2swZ0ZldW9qdk51MnBOMXEzckFC?=
 =?utf-8?B?OE9pd1JpT0hPM0VWTGNxQnRpazJSY2VOSURhMzYyRmcyN010L0pERzljRE9S?=
 =?utf-8?B?KzMxaEtiMzQ3L2tzN3FNR2Vta0FyckJMaTQrcldyMnZUSXd0SzBZQjFjb21P?=
 =?utf-8?B?UWJDUk02YTRyMDg0Sm84cmMydE9QLzFmYVpQMjFyczgxbGFaclRaNkhPVXQ4?=
 =?utf-8?B?UXB1MUtUdWpVeWZmQWdQaTNIL1dOTjhMbXd4ZHgwS0w4emxSL1Z0a2VZMUF0?=
 =?utf-8?B?OVJoWTB4ZXBHU2Iva2lTdlE4VXdFYThzVzZJTmdzMFR2dDJ1VE5ucVI2Q1Zr?=
 =?utf-8?B?dmIwcDVwSU4yRHg4ZVQ1WnArK3RzQ2c0Y0dkc2x3MDNyU0pyTkdkR1AyQ3hw?=
 =?utf-8?B?VElGdDIvVzMybmNKNXE1VTIyZ3pvYTR2L0Rmc1czLzJzK0xLMXRtbFdwa2p1?=
 =?utf-8?B?MnlBeFpvVmxJWUlWRHI2QUorRmhESzVqK3NKQ0FzL2x4VmJRRSswVkR3ZG9z?=
 =?utf-8?B?dGJ6ZTJSTDdQUFRTd1JCTFlaWTRXNitEM01TVEd4SE0zUHdYczBqRkJSdlJN?=
 =?utf-8?B?RzdiUmQ5M2Z3V3FGY3hDcmFhVjdMdTY4Ty9lc2dnb3JLSmM1OVNuekdFc09D?=
 =?utf-8?B?MVQwN3pqS2dNSFg0QTEwR0lwYkpwVHlPcXA5RlRuam5UTGdtWnY3SzFyOU5n?=
 =?utf-8?Q?CjAn72nTFD1BERqO8NLY/ZR7lD+dEk2I?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 11:06:53.0560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f785cf9-d29a-4b96-b9df-08dcb79a358c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 11:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203135

T24gOCBBdWcgMjAyNCwgYXQgMDc6MzMsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+IFRoZXJlIGlzIGFsc28gZ251OnpsaWIgaW4gQ1ZFIHJlcG9ydHMgZm9yIHps
aWIuLi4NCj4gDQo+IHNxbGl0ZTMgbnZkY3ZlXzItMS5kYg0KPiBzcWxpdGU+IHNlbGVjdCB2ZW5k
b3IsIGNvdW50KCopIGZyb20gcHJvZHVjdHMgd2hlcmUgcHJvZHVjdD0nemxpYicgZ3JvdXAgYnkg
dmVuZG9yOw0KPiBjbG91ZGZsYXJlfDENCj4gZ251fDENCj4gemxpYnwxMw0KPiBzcWxpdGU+IHNl
bGVjdCAqIGZyb20gcHJvZHVjdHMgd2hlcmUgcHJvZHVjdD0nemxpYicgYW5kIHZlbmRvciA9ICdn
bnUnOw0KPiBDVkUtMjAxNi05ODQyfGdudXx6bGlifDEuMi4zLjR8Pj18MS4yLjl8PA0KDQpXaGlj
aCBpcyBvYnZpb3VzbHkgd3JvbmcsIGFzIHRoZXJlIGlzbuKAmXQgYSBHTlUgemxpYi4gIFRoZSBy
ZWZlcmVuY2VzIHBvaW50IHRvIHRoZSBzYW1lIGdpdCB0cmVlLCBzbyB0aGlzIGlzIGEgbWlzdGFr
ZSBpbiB0aGUgQ1BFIGRhdGEuIFRoZSBDUEUgZGF0YWJhc2UgYWNrbm93bGVkZ2VzIHRoaXMgYnkg
ZGVwcmVjYXRpbmcgdGhlIGdudTp6bGliIG5hbWUgYW5kIHBvaW50aW5nIGF0IHpsaWI6emxpYjoN
Cg0KICA8Y3BlLWl0ZW0gbmFtZT0iY3BlOi9hOmdudTp6bGliOi0iIGRlcHJlY2F0ZWQ9InRydWUi
IGRlcHJlY2F0aW9uX2RhdGU9IjIwMjItMDYtMjJUMTY6NDA6NDQuNDQwWiI+DQogICAgPHRpdGxl
IHhtbDpsYW5nPSJlbi1VUyI+R05VIHpsaWI8L3RpdGxlPg0KICAgIDxjcGUtMjM6Y3BlMjMtaXRl
bSBuYW1lPSJjcGU6Mi4zOmE6Z251OnpsaWI6LToqOio6KjoqOio6KjoqIj4NCiAgICAgIDxjcGUt
MjM6ZGVwcmVjYXRpb24gZGF0ZT0iMjAyMi0wNi0yMlQxMjo0MDo0NC40NDAtMDQ6MDAiPg0KICAg
ICAgICA8Y3BlLTIzOmRlcHJlY2F0ZWQtYnkgbmFtZT0iY3BlOjIuMzphOnpsaWI6emxpYjotOio6
KjoqOio6KjoqOioiIHR5cGU9Ik5BTUVfQ09SUkVDVElPTiIvPg0KICAgICAgPC9jcGUtMjM6ZGVw
cmVjYXRpb24+DQogICAgPC9jcGUtMjM6Y3BlMjMtaXRlbT4NCiAgPC9jcGUtaXRlbT4NCg0KV2Ug
X2NvdWxkXyBjYW5vbmljYWxpc2UgdGhlIENQRXMgd2hlbiB3ZSBsb2FkIHRoZSBDVkVzIGJ1dCB0
aGF04oCZcyBhbm90aGVyIDUwME1CIGZpbGUgdG8gZmV0Y2gsIHNvIEnigJltIHVuY29udmluY2Vk
IHRoYXTigJlzIHdvcnRod2hpbGUuDQoNCkkgd2FzIGFjdHVhbGx5IGdvaW5nIHRvIG1haWwgTklT
VCBhYm91dCBhbnkgYXR0ZW1wdCBhdCByYXRpb25hbGlzaW5nIHRoZSBDUEUgZGF0YSBmb3IgaGlz
dG9yaWNhbCBDVkVzLCBJ4oCZbGwgdXNlIHRoaXMgYXMgYSB0ZXN0IGNhc2UgdG8gc2VlIGlmIHRo
ZXnigJlyZSB3aWxsaW5nIHRvIHJldHJvYWN0aXZlbHkgZml4IHRoZSBuYW1lIGluIGhpc3Rvcmlj
YWwgQ1ZFcy4NCg0KUm9zcw==

