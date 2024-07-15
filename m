Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA9FC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 15:17:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web11.40644.1721056666011417846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 08:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ddcEVLWP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ddcEVLWP;
 spf=pass (domain: arm.com, ip: 40.107.22.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GRQ3m9AJrQPPxiKJY2mxyolpI6JE+IhvleUTXa1q28yvEwSkRqInCh5zt7HhSAyy/QJBwX/uTdDBOkRO2320f6GCUKJtqu0WYF865JuyMIzf610XIDgFq5/8ga9LU+QOjXb0ugX2JEOFw8XQ0bnJmdboxuO1SM19pZ7qGkpTZyEoGVFN7td/hibUCsAtT8qE1uJQWkBnpo+YtqojQOdAN4JXcPa3k31kIHCbXlBKfbs8Tnle/GKDVqpfTVmWbIVkaAkPRIoTDYFBT9iuVIqbao8GAOjGh1OntaUXBzf5uoN1E5tvXOBnsy563qboXTfGvsOjqvKtzrN3IJN5BqhnrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6DQZjOjfsfAjzP0xDVlvSftPjSOhEkZIh943ObR5+M=;
 b=TtXGq8sOkm7N50b3v3LQkkAwHevVlxRF4YlXbjIslAJrkHk5wc2myV2u/sWTfk1ZASsnOzZ8fvnz5gV/GWAaafWhEEBFYnTSwP4zNB075nlfLIl93PA04sQq9VrOFVKMFSsy18G5FsecZwBh4J1eDGwszmBFLJweKDekdytDbTPx9emQQuKrRtD5d7rBVV03z/azd40Kzez/T/YBjCmchMzErns1aDHgRdLX3Iv2toNkO6qZNqNzuQYgxROW06/qzHDVIVYmIwN1FyLm4FaGoulkGLQwLiHCy/M18BmPVX+mx9P0+JMw9yFYGjXmrO3ir9inoFEG6EBSutOJTMHAQw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6DQZjOjfsfAjzP0xDVlvSftPjSOhEkZIh943ObR5+M=;
 b=ddcEVLWPpq9VtbrdJwcyQr9Gsx6IuLHWVuFuit58rsbH1brWfNNZNF4n/Afqh7eQ71VBchoNjKxmHRjqBjc2icVXoVh9X6fsud424NvXo2exHevWV7LjnJoBt1PodFR3DyU20NWuffYJnGGDENEi0dYLc4/mTc4pLBeNFENamA8=
Received: from DU7P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::24)
 by PA4PR08MB5968.eurprd08.prod.outlook.com (2603:10a6:102:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 15:17:42 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::b4) by DU7P190CA0017.outlook.office365.com
 (2603:10a6:10:550::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Mon, 15 Jul 2024 15:17:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11 via
 Frontend Transport; Mon, 15 Jul 2024 15:17:41 +0000
Received: ("Tessian outbound cee0d4ec1c72:v359"); Mon, 15 Jul 2024 15:17:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee7a477f0b17520c
X-CR-MTA-TID: 64aa7808
Received: from c54e9fee0611.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3DF88D2F-4057-40FF-9CCB-5FF059115C2D.1;
	Mon, 15 Jul 2024 15:17:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c54e9fee0611.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jul 2024 15:17:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bA030BmBwCKSbwXFUB55LQxeUPefpoXcA+ma+1t1QTy7OLNvnURATE9YymP+6PHTWgy1lMUg9kN5YbTBGNIcaMO8AMkL2OD+grNVAE78gO3E73O8e9nyt8LbvZFLF7p60u0DEYs9PKSRi3Ld3/3Y+TOUC+nz/eQLmmG6i3UzoSUtIJ3Mmq1bjAp0PVhGi9FFHLhNBofvZ3mOUH6m1OWraYSx1UaWbDJzaiCtoSuKV0lWp1OssXmW6X+jwt9WEJdiCg2TCG9MWW0qFH9Jquw2blBtjxkCvrQFjAYxAlUsTV2g83TA2H+i9SFyss7MoOhinreAuPYF3iwCIjxYGDbiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6DQZjOjfsfAjzP0xDVlvSftPjSOhEkZIh943ObR5+M=;
 b=uLNb5P5F1vpm1ZB2rSFl7maK1YdWGYAzsruJNCOfw1Py/BaHGynIX1tBs6ncSonvgwlGdRU5Bndbf/QsIByoLAmyMLuPj4pTih9qMHHcWwtjLAVFj2FFrwDj7eXqgNnwLKaCsuQYMW9t6u3O6tZ8WHF1EdvLE8B612SoVpXvjTaKzgVYKYsh+kB7YjPCQWli8VqA04M4ZZVEe1xZ41d1MMc19e+ZjrwC19zybK/FgudOn3FJ6LNHO5oJYuN7wQNqDtJbHs0jPie6x79pjIWNZjM1JnInGt96KJa/UlgQ+TfIy0hmxw+2/itGDI+3UHgb8W7xn9NJB7e3g6qxrT/dmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6DQZjOjfsfAjzP0xDVlvSftPjSOhEkZIh943ObR5+M=;
 b=ddcEVLWPpq9VtbrdJwcyQr9Gsx6IuLHWVuFuit58rsbH1brWfNNZNF4n/Afqh7eQ71VBchoNjKxmHRjqBjc2icVXoVh9X6fsud424NvXo2exHevWV7LjnJoBt1PodFR3DyU20NWuffYJnGGDENEi0dYLc4/mTc4pLBeNFENamA8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9755.eurprd08.prod.outlook.com (2603:10a6:10:460::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 15:17:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 15:17:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] bluez5: upgrade 5.72 -> 5.77
Thread-Topic: [OE-core] [PATCH v2] bluez5: upgrade 5.72 -> 5.77
Thread-Index: AQHa08aBFzr+RDbGo0aKlCfE+EWpwrH37KKA
Date: Mon, 15 Jul 2024 15:17:33 +0000
Message-ID: <E61FAFA2-917A-49C8-A3E4-9D063B918B90@arm.com>
References: <20240711191253.3247-1-gudni.m.g@gmail.com>
In-Reply-To: <20240711191253.3247-1-gudni.m.g@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9755:EE_|DU2PEPF0001E9C1:EE_|PA4PR08MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f17a41-3732-4302-fb70-08dca4e14572
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZWdPNm13c2czY3lhZTlPR2Jtc09EeDRBNnhxd3MxSkxFZGd2Wi81K2RZSERl?=
 =?utf-8?B?WjN2eXBFdW1EUVZiVWcvKy82Y2VvbUZnZVpVNVl5ZktDVGoybkdyNlJnRFBI?=
 =?utf-8?B?VEJXeW91Nm1GQWRETFluTWI2ckE1TGZkWURJTXJvVU9wWHEyRyswcUJib3JB?=
 =?utf-8?B?dlY0L3FSOUxCdVVkekJ3MEVxODJvNFA4Z3hXeXdwM1JoZ3ZQYjRBVzRGVDcv?=
 =?utf-8?B?Qm1qS24rdkNKZmFiQVkxNGhnTlViNUtMOFJhWkhmYUwwcDd0U2NNRHhRbmpM?=
 =?utf-8?B?VFZVcGJqVGc4SUZhbE16TkdzZE94OTU2VWJuMXVIV3B4bTdXL2g0dmxmUTZi?=
 =?utf-8?B?Z3J0VXFtc0UzT1IxNGJWZ2RQTytSdmNsdHZSbE83ZFNBV2w4M1ByRTRNa1Zu?=
 =?utf-8?B?OE9aOW1YSUVFMHBQa1ZsQ0hJaDhXQWJBVGhBa1k5d1lGbVJ1SGg2NC8vYWhr?=
 =?utf-8?B?a0FadkVQMDdadTZmZ3JOQjNoRzduTHMwWDY1ZzBIbytaZm1BMXc3czVFRDF1?=
 =?utf-8?B?UVVidmEzbnd0TTJ5TmJVdG1Yc2hkR2hxQ3llKy9LaUV6aThrQUN3TnlIeDVq?=
 =?utf-8?B?WWZhWTBGK1ZDMU1kUlI2NUgzQkpOSm5uOHkrTTQyQXB4OVY2cFdVQkVYWm9R?=
 =?utf-8?B?ZXFGZmlNUld5T3ZORFBWN29pODZ1QWlsbHMvV2hIUEVoNXhBRENXVnBYbGhr?=
 =?utf-8?B?bXhhTWttc0p1OS9wc2RaWmlyaG9VM0V3c1RuVlhGY2VNMTNUK3dQcHdQckJ2?=
 =?utf-8?B?aktRR0V4Sm5aei81bmc4K3FkeDgwK2YrV2huUzN0czI3eTdxK2hmUG40YWxq?=
 =?utf-8?B?M0ZLOVd2bXFBbXBDanVjNHZrSHlEMmtvVnMreFkrVXREc1EwVlVId2YrMzh3?=
 =?utf-8?B?Q1AyMVVBT0lUdHV6WTU1c3JFa0JuK3M3NllWT2diS3NQK05xaEVHNU93MDUx?=
 =?utf-8?B?KzNpMDFJYzBGQlVZK0lPSmxMaGZuZW00SDdkNHJNTDE2cXZibDBvNk1TWmRx?=
 =?utf-8?B?SHdEdkh6MjhjOU5BdkJDMmJyMUhjSXVDb3BaQkc5eEp2cUFSaGlRZnZTcDFF?=
 =?utf-8?B?c2RUaUxud0IrbmpTRU5GVFlXUlE2cWlydVZHbTd6bzh5bmtMcGM0U0hrenow?=
 =?utf-8?B?Z05qVWtENmRqTWl2SDlzZmRLUnErRkJCaVVEQjhPZlN1L0FpZ2Q5dE40eGl4?=
 =?utf-8?B?WnNQZVVWd1RzLzdBZ2x5TXRMRVdTU3Y5S0F2cFg3dFZCWC9BbFlsc0xQbmxF?=
 =?utf-8?B?ajROaTJxY3p2OXZQcFBnWHF2TUduWmdQbDluU0NZekhkOVNIOUszZXZRWHQ4?=
 =?utf-8?B?WVhYMzhtMkN3T1dOUFJ2ZjRHVkJwK0FTWEdaV0daSnl2TzkzN09IaXBIeDND?=
 =?utf-8?B?MWlPYU1HcDlUeHJZd3hwbW13TG1tRVVUUjkvSm44NHh2Q2N6SGNNUzI1dGxo?=
 =?utf-8?B?cms3VkNBUGJNZmVSVGhBOUtVOXdWQjlwTERCVEtqK3hJUG01UVd2b0p0NnBu?=
 =?utf-8?B?b1FMeXZPc0R6RWxjL296ZmRWOStjZEtNWFlpcjRFeU1LRWI4MU9DcFErWTMr?=
 =?utf-8?B?dGFvTlNCUGQrSkh3YUhTRnZ0S3c1dmJWY2VUREt2cDNFWHZodk8yaVJWRGZY?=
 =?utf-8?B?N01pQXRwU0g0a0RjQ1JPcEwxNGtkcWFqYnFwR1JNUytIbWtxMjU0ejVhalEv?=
 =?utf-8?B?SDM0Q2ZtYlZ0WEd2aE1zV2ZROWpwVnZlYk5UYURLektsUHFBRkZuU01UWS9Z?=
 =?utf-8?B?K2lkM3lsMGpEV3RoYk11NlRPMjVWU3BKR0lWMEQyalZRK1F4MDZoMDRDdlNq?=
 =?utf-8?B?NzM0Z2orSWkxTGU1V2d3cnRZYVJTd0kzT0xNMmtQVFNWU2x4SzlTenR0STNO?=
 =?utf-8?B?ZDV5eE43YldlSVZwd0RQOGdTcVp4NGNibDY5cnhuajdCNFE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2812E6462BCC7429952C5FABA480434@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9755
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	949884c9-d50e-429e-388b-08dca4e1408a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TlhPMGFPM3NhRmFKSlNtZERYWml1dEJRMUxuMDFzV2I4L0JxQlFGTW4rejJN?=
 =?utf-8?B?YkFBQjg3dWVrVVE5TjdPdzZHZXY5YXp4SEdlSzBoS2FEbnVTcStTc2R2RWtE?=
 =?utf-8?B?NUhINFI3bUo0aDFYbDRwWUh2aHZsTmlqVGtmbncyK285L05TY1A3K0syWVd3?=
 =?utf-8?B?QzNqOXNUNFdQbkczb0t3cHJ0OWJjN3pIb1M1V0dJWTJRK2orWG5ZUi9QL0d2?=
 =?utf-8?B?ckZQY1lFWUNLZG5Pd3MzMi9TRXhoWDJQTFViYk16WU80VGhJYWFMaFd0YTRm?=
 =?utf-8?B?djhVcE5Wc1cycDAyRG5WSmUzQ2pHdUhONjYyRDhScldSTmhOZGI0Mk9wUlJn?=
 =?utf-8?B?ZCt1eG9PenZjK1lPNnFuM2cvWTl0ZWlhd0J3U0UrdGlnbzc1WlBtQmZmYWNY?=
 =?utf-8?B?SW1BNHdJbHRmdGdxbGJZSTJ6UDUzZ2ZsVGRKYjdlalBIaGpBbkJCQTRyWm1O?=
 =?utf-8?B?WWJJRTlLdm5iSGMzSGNPZVB0SHlWQmYyWEZhMFR4Zmpjc0txUzFHVEd0cFUx?=
 =?utf-8?B?SG03dVJNTzhBcEVIemRrQ2NueWJMS1lDSS92NXRRdE9VNHdNNU5yd2Y4c2dq?=
 =?utf-8?B?MkNSU2laWERJSDZnUDJPS1Z1c252MDBDd3N5dUhSSVYwVmdxNnRWejZ4M1Bz?=
 =?utf-8?B?bkdEZFFTcnhvY2l2ekdMNHBnaUh2V1ZOdWNYOUp2b2VNYlZLRnB3VzNJd0di?=
 =?utf-8?B?a2FoejhuZkJJd3FNb0Jpd04zNFIzbUNWYVMyWUlNekJYbUJWMUU1eHgyaFVT?=
 =?utf-8?B?c1JxUk5SUXYvbEsweWd1N09oOHhheThSN1ZBTGVwdFNRaldOeUNaSzc3MDZD?=
 =?utf-8?B?eVpFRXVscDA4WS9FMWM2c2Q1d25LVGJpaHBVeXgvUkNTcURLTk1ZNG4rOGtw?=
 =?utf-8?B?RSt0aEthVXZzM2p6VkpKNUh0UXpTVEl0dUNxbm9EWmNBenhVMEhlRTMwcXVu?=
 =?utf-8?B?NHBXNE5mcGQrN0Fld1BjTExEZ0NtSWdRazZERzVOdmlCYU8xMjRuYkhYeVUr?=
 =?utf-8?B?bHZsbmdyeVJjZ2xXaElOVTRkRmZMc0dPSlMyNS9XVzNtYzE5M2c5a2w1QThW?=
 =?utf-8?B?RjE1cUc3emZtaWkvL2tLSmR5d29saU9HTU5QQVZjQXg2TmJuY1ovMGVwa1Nx?=
 =?utf-8?B?SHVLa015WElaWjlMRTFTM1JXMnVIdmEwZEt0RVJLdWgwb3daZ0Z2U3gyR2hU?=
 =?utf-8?B?Rjcvakx5cUh1czVzVWo5aGNWaXBna3l2WGN3TkpSbWcvZWF6TW1ZYWxaaml4?=
 =?utf-8?B?d2t2SHZMVEk4TWR4WW03bTFWMDREbWltbHY1RzNYRmQ0Sm00UWxDVkcrb3Fh?=
 =?utf-8?B?UEI4NFVoZGdTTCt0aVJRS3BoM2RKdTQyRUxyS09Oc3R6Q0lrcnpKSi9UZUxs?=
 =?utf-8?B?a1E5ZXlyNktkSE1kSHRweUc5bU9Bd0RaNWJnc3d4c3R6MU5CTDdyMEhaNFhy?=
 =?utf-8?B?RUpWVHp5SWJkenRIbXJ1UDhSRE5DM3hVbkp3OU5TNXE5UnY5RmJwRmlmRldD?=
 =?utf-8?B?TGRiMU0raHo4RURsSzZubUl4eHVpSlRQeDE1UlJ5RWtQYTJyTmZqYlV1ZjdX?=
 =?utf-8?B?akZVbXZlcjVOSk9BQzdDVWdvWmFuRGRqbHowVzdWVERlR29JN1VYdUYvVFhT?=
 =?utf-8?B?RVcwNXBtb25ibWpHOSsxRExKbWJyMzUzSUFHazdaRHRVb3A0WUNQVEhwTDQr?=
 =?utf-8?B?d0s2N3VlS3ltaUJkMnl2Z1dWWHg5UGhPb3VSRnh6OTQyc0dDc3lSRGo3Zk55?=
 =?utf-8?B?SVdBTFBSMXFENnJOODZEMHdHa1RhYnRudEg3ZTcrMkZ6RWttbnZ0dUp0Tk5V?=
 =?utf-8?B?UXRSWXhjdGFKSzZEYlBlUFhFSWgzU25ReDRybzE4dDA1N3NaRm5CSkpRQXlM?=
 =?utf-8?B?TTg5cnlhUUtidVA1RnJ4MGh1TUpUdExJZlpueWtXbSt3Ymdjd1NQV0k0YVk1?=
 =?utf-8?Q?wL9LZozpJzLrl8n5xziSsyRhL8DCpoR/?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 15:17:41.9528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f17a41-3732-4302-fb70-08dca4e14572
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 15:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201935

DQo+IE9uIDExIEp1bCAyMDI0LCBhdCAyMDoxMiwgR3XDsG5pIE3DoXIgR2lsYmVydCB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8Z3VkbmkubS5nPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gKyAjIEZpeCB0aGUgL2V0Yy9ibHVldG9vdGggZGlyZWN0b3J5IHBl
cm1pc3Npb25zIHdoZW4gc3lzdGVtZCBpcyBkaXNhYmxlZA0KPiArIGlmICR7QGJiLnV0aWxzLmNv
bnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ3N5c3RlbWQnLCAnZmFsc2UnLCAndHJ1ZScsIGQpfTsg
dGhlbg0KPiArIGNobW9kIDA3NTUgJHtEfSR7c3lzY29uZmRpcn0vYmx1ZXRvb3RoDQo+ICsgZmkN
Cg0KVGhpcyBmZWVscyB0b28gZnJhZ2lsZSBmb3IgbXkgbGlraW5nLiAgQ2FuIHdlIGp1c3QgZml4
IHRoZSBwZXJtaXNzaW9ucyBhbHdheXMgKHdpdGggYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5KSBp
bnN0ZWFkIG9mIGxvb2tpbmcgZm9yIHN5c3RlbWQ/ICBJZiB1cHN0cmVhbSBjaGFuZ2UgdGhlaXIg
YmVoYXZpb3VyIHRoZW4gaXTigJlzIHBvc3NpYmxlIHdlIHJlZ3Jlc3MuDQoNCkNoZWVycywNClJv
c3M=

