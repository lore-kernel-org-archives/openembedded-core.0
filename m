Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9DECF9C6F
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:33:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.89])
 by mx.groups.io with SMTP id smtpd.web10.11570.1727177576059697116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hhpgtFVe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hhpgtFVe;
 spf=pass (domain: arm.com, ip: 40.107.22.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CXUJ+bE8TquwItgG0GjMf8TLlCxziy6AevLiL7DKwKGgA98JioDgsQ/FaxWtoFllXrX0HVBif+3e2o1LLLU0m2yoKoFZgBaS9qBOu6kAB99fz+HQp8T/5n1U1qOafOlvJQHf/0vangH//199X7cWjI8NoSgd7RNzC/w2Y75liYYKLD8K5PC+pjyUxEWKwMcZef8Bw8jp7RjCsWKDF5QhqHEZO5eGpdy17pZZ1uTp9WH5lGdhlNL8BOqwGWTSWEGPQJYIOp7Iraz8iCGplQTfNNugMmkxXQD2hqdDjC0vGRd8y37UN3iek+VrXithTJ19Sj819dzx1PLLFH1ASuRWew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVIbtdUqcMc5rNjLbG3scF0i0/1UONsUE175L2HXxPY=;
 b=HbRHlChVyiWlkTE5WnI6dflJ+/72zRegxWTDBDrMQw6/OFDgfFO94UrG7qbObzfGzR9ywkQ8De5wGoizoCuQiZx60FaIwIw2dH+rrvRGOm1rJY9JATsowsd8rRvdqygQjFaH3bGqXLr9jXZZ28cPqUW73XbWIazD5uK5pziCDf8slhuJsm04UZDsUHYx7Tzn11TE0jGwF0v9cLhnBAnGvBvvfbSlY5K0Lhv1uYa02e2GZTL9g+qFNkDKmUSNiBWwAEeMPYa/Sm54SlAb3U4N4yJam+ww97i+elxU9fIgJyhjiccS8+conSX7W7V0zQ99BBHTEtJm9ui1nK+lYIDUTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVIbtdUqcMc5rNjLbG3scF0i0/1UONsUE175L2HXxPY=;
 b=hhpgtFVeWWbuJtzMJkxckkFOuiDSL9ThtUTup8ziMl+iZSG05SNtlUUjts2zH0QDtCiHNFkj4NAQdphaMKPcc9nYhckebWSPt2qtWwdaRMIMVxblibYcHoTU62ip6DhSTWfyEsYatHQqVU73wpf1RhSkOZzCLHv/sxic2JTL5tk=
Received: from AM6PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:20b:f0::45)
 by DU4PR08MB11150.eurprd08.prod.outlook.com (2603:10a6:10:577::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 11:32:46 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:f0:cafe::11) by AM6PR04CA0068.outlook.office365.com
 (2603:10a6:20b:f0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Tue, 24 Sep 2024 11:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 24 Sep 2024 11:32:45 +0000
Received: ("Tessian outbound 690adfc84afa:v465"); Tue, 24 Sep 2024 11:32:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59c7ee1f20574a13
X-TessianGatewayMetadata: Rql1rQ8xjB5P9G/M6labB0Po59rhHYhPf23oISq6l3H4zr8JUEq0sNwUs6MXzrul6XI+onsFYtAZbwqZCyf4SdFvFi2TQO1CbGJWG6DtRrD1VgZqthjN5wdzk4uwNzqZuvecgkgCj4pfchOfGAPeitqaSVyg541SpJAcfdZ5btc=
X-CR-MTA-TID: 64aa7808
Received: from L45ca0ff160ef.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A56F42A7-26DF-43DB-A814-52E98236CDC0.1;
	Tue, 24 Sep 2024 11:32:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L45ca0ff160ef.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Sep 2024 11:32:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGvcF+/eS6g55v56cdxGpDQrNTTBlRweBAQSB62K0pwLWrdJXe4bekmD5nVQg6R17+jozam0wNRYs8FRxAAgTsFUQAd4wYcBAjWKZxD3OOE14gz23an+SnoX6ZfttUp4TdZSIur1q7VR+c4wkdBG/QvcvNzHuIEb+CsYtLJjx9WnCJ4Y8e06EiWgTBNvBUzj9H2NbPvaxs8Ge+mxXXHmEVxyTGzGaww6bsLc7rm1sN4Z1zh0srUTIm03F712d0E2hZJJ0nxE1o1g/QRBWWuTjfK120yI9NN05+Ocuc+pQPYxn8AfbfgWlxMQE2RwLEZxn1CWujpSaNK/TCjot3tw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVIbtdUqcMc5rNjLbG3scF0i0/1UONsUE175L2HXxPY=;
 b=jHrup58pbUy7zMWfEfcLsLuMk2VJnK1pyCEEDl2RiMl+Q+tid6tIS45Yyr+yH0SUCejQrQ76SFZkAa15LWQbI4aeBzL1IDpmm3Bjm4Cz349nFZk5iMCkT1byBbOOx5uKVJFzvl6PwSv16u7B+IK7djbZGQJ+D5YkyJKqIQJWWZHm+c1h3sn+fOlcQKWGke6DHDNbtqkDEmq1G/+OSOX1vUqmqAlx/SVK/vFixKYFnC4uPYuSaaoIVr5EQKhw6n1PgiwoTudARQ3QDOeJP1ihYchuj7rn9HtW4TQozZFse3fZ1yz7hxVybJAM61TI4/psG4LKLXk9PXw27VNvxseJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVIbtdUqcMc5rNjLbG3scF0i0/1UONsUE175L2HXxPY=;
 b=hhpgtFVeWWbuJtzMJkxckkFOuiDSL9ThtUTup8ziMl+iZSG05SNtlUUjts2zH0QDtCiHNFkj4NAQdphaMKPcc9nYhckebWSPt2qtWwdaRMIMVxblibYcHoTU62ip6DhSTWfyEsYatHQqVU73wpf1RhSkOZzCLHv/sxic2JTL5tk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9781.eurprd08.prod.outlook.com (2603:10a6:102:2e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.9; Tue, 24 Sep
 2024 11:32:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 11:32:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Mikko Rapeli
	<mikko.rapeli@linaro.org>
Subject: Re: [OE-core] [PATCH] systemd-boot: Enable on all arches except x32
Thread-Topic: [OE-core] [PATCH] systemd-boot: Enable on all arches except x32
Thread-Index: AQHbDhe3VYObgm/oJUygqX+sc4DRTbJmzqgA
Date: Tue, 24 Sep 2024 11:32:32 +0000
Message-ID: <572CADAB-0455-487A-B8B3-66375FE05F37@arm.com>
References: <20240924002124.93673-1-raj.khem@gmail.com>
In-Reply-To: <20240924002124.93673-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9781:EE_|AMS0EPF000001AA:EE_|DU4PR08MB11150:EE_
X-MS-Office365-Filtering-Correlation-Id: 381dfc12-3815-48fa-03b2-08dcdc8c9c57
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UmdINGN1VnNLb0xoT1lYcTRWeThNQnlLSHd6dHRveVlnYXlmSVE2c2dMd1NL?=
 =?utf-8?B?QWx1UHBLUThFM3FNVWpwSXlnL3FsbU5pZitxekcwR3ArbnVqd1gyVWNsbGhU?=
 =?utf-8?B?SzlwbGtKRXJ6Um1HTGtJcDdnalNlYjhuMmE3SzAydXBSUXduZjFvU0RQL1A5?=
 =?utf-8?B?L1Fva0ZFUXk0ZUt0a3M2bXhsZU1lM3d5SFhjclRISUZPQjBtYSt1enZMQ21J?=
 =?utf-8?B?M0FCdk9ZSE1LTVU4cTFrUlFjZkpTN083NkdyakpKM1JmZERLWVVWTVNLd3Fw?=
 =?utf-8?B?Uy9UcGcrSmgrdHlCaVhCVTZIcEJpa2d1YUpsL2trd1JkR0pjamZrQXExeGpB?=
 =?utf-8?B?VSt6RURJT3NNbzljU1ZqYzJTcnVyOWJDSm1MMzdkSjFoNkFldnZJdi9TbVBJ?=
 =?utf-8?B?bFdKVHZ0d0hkNGtOOVg2Wld6bUhTWU5qcXg4OUlDcUhrNGJDTFBtMVhJUVhv?=
 =?utf-8?B?ZENvNUpMK0h4THdVZEFmT0tqeWFTK2hsT1hHdVAvOVZ1ZnhjQTB1VGhzSy9w?=
 =?utf-8?B?WFdtYzhmWGpCSWFqVkRRRVQ0ZDVlYW8rV21qZTFhRjVzNW9lLzhJcmFoVG1t?=
 =?utf-8?B?NDJ1blA2UVdUb2dybWhtUVdZUThGVXc0dkpJckozdjNkM0N5bFZJWjg3TGhp?=
 =?utf-8?B?cU5rWk5jUXBLemVQNFZGY0NPNWVxQ1ZuOTF5bXJvQ04yTTF3bHFmSHZKS01w?=
 =?utf-8?B?YXNPWXE5OWtWc2drZkhUaXlOTC9qa2Nhc1owTGQxUVVkcG1kTjVncHZ1Nk0x?=
 =?utf-8?B?ZUUwQTlmN1FBalRzRE9kaC9odHlwcEpraHBLSThWajg5TlcxQmZTNDAvOGRD?=
 =?utf-8?B?WWZPZU54aDIxSGJHWTVJczAvVW5FM1pnVytrTlZ4WUZMOGNZTlVMY2pYOVZP?=
 =?utf-8?B?SlNVY294ZkxwWVBPc0ZDZG9FT1dPTXg3U0traGdTQjFCZ040T0lsYmh3WE1K?=
 =?utf-8?B?S0Y2b0VSdFduU01VbU9lZVRMbzVpQ2JmWXhuOTMwOG9CNkF5bUNRTElqNU9w?=
 =?utf-8?B?S3g1SHdSTWZ4REpHWngyTXNqS1U4QWppM1NMeDBtSW1kc1NhR2wvT2xvUXdJ?=
 =?utf-8?B?cURJYzdSdDd6WmF0K2d2ZTQzQkprQzdsTUlIRmhkbHNheFRhdVZOUEp2VHpK?=
 =?utf-8?B?a3VoYWVpeU0rTW5lNko2ajI0M2lFNUhlZG1CTHVRN25jejhZRWdDTUNrTUR4?=
 =?utf-8?B?TmhReVlUM2ZaMUhGck5qR3Rsa2FSajZFam4xY0JMTk9pYWdBcDBCV1h1ZXFI?=
 =?utf-8?B?bDZpVUhIbGU5ZjR1WEorL3Y2dUdZOXlnNVhlcGM3L1VmQU5PSWkyeUE0MGYy?=
 =?utf-8?B?TjZjcmZ3YlE3UEtQYUpKMXVlekk2aFZ0ZFZuNU4rdWZtd1NSdEoyV1dtK2Nk?=
 =?utf-8?B?bm1IWlRlaUk3dGlBR2QyeURwVEg2SUIwdUN6eVRuUzZ4VURCTC9yQUxRRUdn?=
 =?utf-8?B?M1ovSG1Qdzh1MElvUkxlZmdyS0lGTTQwRDRNcVdqQ3VXUGVWQ2dtQWRkcHZM?=
 =?utf-8?B?TDlDdkJzVEkzNzNOVnJuZkUxT0dDeTIxUnBCSU9QLzBCUmtwbmFFQy95bnM5?=
 =?utf-8?B?Q3pJK3IwQkRHWjVJNG8xdUpuUGJJK2YwclFTN1VQYWFGbm12ajl0YzZqckh4?=
 =?utf-8?B?L3I0ZDR3cGU0STl3aHBqVFBLbWh2WWRycTY1RXh4SFFCSVpYYkROQW9tRDZR?=
 =?utf-8?B?bHM4WmRZZjQvZ2JoRjlpbkMxaTV2bFJ2bWZxMmlhQ09wLzJVM0x5ODNLUXpn?=
 =?utf-8?B?TEhyVDRsSkJDeUVzR3d5RzgxTlM5RUVVUk9MekJoVmlhWkJySXpyQjI5VlM1?=
 =?utf-8?B?c1UyQjVHcVRSNVBvTDY1Zz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <777B150B78FBED4BB33F03BA6EBEDC25@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9781
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	61e65997-527b-4363-17b0-08dcdc8c9495
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZGVxVmpsdnNJcmhHSGFYN0ZvQkNxTGpDanl0a1czRm92d3JJcUZNU1M3MVMz?=
 =?utf-8?B?clFSMzQ3cnN3TjBVOUd1dCtHVVVsZDlUaUJubnk3SzhKRjNNY1VPMkNpa0FY?=
 =?utf-8?B?aTBCVkI3R0xPMWtRRWlPV0RDb3dYRytNNXZheDBHQVpmaTZoOExkeDFNa3F0?=
 =?utf-8?B?ZGEyaWNRTUFUbEJUOU1hbW80a3E5WGxBdUozVzNVT3FGT3lKVHZGRzFscGs4?=
 =?utf-8?B?NFMvYlQrektieCtsRGNsdmNBbTMySUdHS3JWdEZ4aGs4cFJPTHZhZ1BIeHlJ?=
 =?utf-8?B?Qmt6NEdNQjUyT0h3RXpmRE9YZVNqakVRcVQrenZyVjhMOUR1UUFlYWFOQ1Ay?=
 =?utf-8?B?SkNLekNoaXp3MWxjT09JeXA1enFuSm1ka2ZNWSsyZzY3amtHUEEwbDBYcWJX?=
 =?utf-8?B?SVlGenRLclVONmlmYWVTRXh3MG1OQ2xrd01zdlQ3YUxrVnQ4KzgzMU1DV2t4?=
 =?utf-8?B?UTJGVzJYNUxiWHkyV0NHM2dNazQwKzlKa1lMZlRIRDdwTzdTQmg5ejRkcEFy?=
 =?utf-8?B?Q0dTSXFRMzMra0xTQ0JnUXVpRlBwWHI2aldtZFNtVTFIdUtZaFlabTVyTW5h?=
 =?utf-8?B?YjNvWDJESDc0UGlqR0J5WlV6YTlGNG5XSHBPdHF1ZWR2aW9YTnBHSDM1UStn?=
 =?utf-8?B?VkNWeXpHWEM5YUwrTmhucU1mbmc4OXdaZzR3OFJKM2xhZDJrNVdQRnBYa3RQ?=
 =?utf-8?B?QjNzT3RTcllLWFBraWlXWVh1dGh3SzVJUGhBQ1Q4bTdKRk1aRHVhN0VBYUIr?=
 =?utf-8?B?eTlxbjQzKzRlYlBBaWlkSm9sOHR1S0R4ZE4zYzhSMUoreXRReHdVZEUvTTl5?=
 =?utf-8?B?WWdVVWlXZThlYmdOYm1zRDNuNmFkR3JVVDVIU3o4Kys4bHdrbnd1VmNscm1p?=
 =?utf-8?B?dVhaQnVZQWt4d0hCMVFiSXF2T3l5VUdQMDBKeXlvV1Z6TnFaUUk2aFpMNm9C?=
 =?utf-8?B?Y2I1WDNKTEI0eUpySmsyYUEwNzdNUVJHVDdpeGhBblppbGFtQk5uT0E5L1ZP?=
 =?utf-8?B?bG5Iczk5RFpyeUJOWmQxaXltUjRmUERSVHplMHJ2MmdFd3d3K0tQQlpnWXA5?=
 =?utf-8?B?T3B5TnprcUJzSTRTRHZCck5iZWZEaG9hK0xNY3VwRFJ6a2oxeTlFMFR3Qitj?=
 =?utf-8?B?U0hoQ3VMNy9iUUhBektjdlJ2eXRzYVByZ0QxdTl4TTcyNlg1cU5VQ1A3WUtz?=
 =?utf-8?B?T0g5RmhiZkQ4TjJpK0FPN2dNVURkL1VUcnI1NTBleWhOVGF1eU5DUkpQNXcz?=
 =?utf-8?B?WlBTQXE1VWVxeUUyeE1ibmN4NzRrVE5Ua21wOE9xUUo1YnQ1NUhEUjJGWlZl?=
 =?utf-8?B?L2lTV3NDSU1xVkhuTE5tdWJEb2owU0JDMGZIclhTWWtLNjg2Q3BCMVBxby80?=
 =?utf-8?B?aGMrc2dnMWRSWGVPQ0tjMUgwdmJCV3MxYzc4d0FGK1ZHS1czU2NnQ203YTFV?=
 =?utf-8?B?TXJsK0FJbTNZVE9aVTdsRHJXZFpvcnZqbEpUMlNXVzRseTc1V1ZWMGVHZGhp?=
 =?utf-8?B?RDd2Q1JjOTY2T3ZLdDcrbnRGaG1WNVBlWkJ5ZUdJZUg0TE1yVEJqcXBGV2xU?=
 =?utf-8?B?L3lwMVUwL1crSEVYc0toN2NERVFIcHVTeE9pMkhpc2hMeStiTjRnTnZ3TGpY?=
 =?utf-8?B?eTBSRnREVmN0bndhT21kTTlYRkRmUEFESXNMa05SQlgzZmVucTZUNWNiUm4v?=
 =?utf-8?B?TS9GTmNFVnpJMktmMWJhMC9xbGpPa0VHVytNS0RCK3dZTWtjYVJybGJnVHho?=
 =?utf-8?B?Snpvc0N6Q29JQ3BXazBSSXAyNS8rakJQeGZwenFsYTQrL1VKelI5dFY2NWJO?=
 =?utf-8?B?WjkrNGFoTFVQOHdRcmxHVDMwOFZXZ2JoMXNKaE8zQ25wbk1SaWxPQ1Q1YTM3?=
 =?utf-8?B?M0F1NnhEN1JvT2FjWUR0VStZc2hTdVhicXpDWitVWm80UjRkUkFYOWJvdWxK?=
 =?utf-8?Q?IHtG4FnJG0JrU81xdJgielyJJXYe8WJL?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 11:32:45.5623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 381dfc12-3815-48fa-03b2-08dcdc8c9c57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204847

T24gMjQgU2VwIDIwMjQsIGF0IDAxOjIxLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gQWRkIG90aGVyIGFyY2hpdGVjdHVyZXMgYXMgYW5kIHdoZW4gZm91bmQgbm90IHdvcmtp
bmcNCg0KSGF2ZSB5b3UgdGVzdGVkIHRoaXMgb24gYW4gYXJjaGl0ZWN0dXJlIHdoaWNoIHdhc27i
gJl0IGluIHRoZSBjb21wYXRpYmxlIGhvc3QgbGlzdD8gIEJlaW5nIGEgYm9vdGxvYWRlciwgaXTi
gJlzIG5vdCBsaWtlIGl0IHdpbGwganVzdCB3b3JrIGV2ZXJ5d2hlcmUuDQoNClJvc3M=

