Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE415CF6493
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 13:25:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web11.81679.1727789154296626593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 06:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZYVw7/v1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZYVw7/v1;
 spf=pass (domain: arm.com, ip: 40.107.20.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qVMMfEsW7N+U7k96c/ZfyN67oVGlO8T35nNuiJOvPVcg7syoL7oiy8K11WgdA+j24H3EYFVrLF20CAfn4OhOnWXQFAwVMqCR01VlTDjXWgDLlemM247/B0t2SGgudUuOlRxY8pD6hf0TYOni7tLzUeEUlpm4BUvlvMXASJKqikgubhHIREuHFehv4BYmy1EjEr8MdkY3LEuDveuTpBUcpBTL6FOXpHKQT976sC/dfXclXQjw3SvgJxceqkG9rTlqVLzbPS3u4pjIHNe4gcbEAuMUej2B+UXZXlVeU11L1nM3sUSjaEGDGMQ43b4TVeGbwDNOhD93SeQUdqlDTJQXHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gD4gEz5N0lf1CjdWGOHMH0C1C/JWg7SeBLr3iKdTnWA=;
 b=F9yI5I145oMq6iH/L/oY+Kt8XG7G/p2zoo1qaTRiOzJaJNH1dW/8EynxvmyQZFA0lUw4ZJOxfsyXXmYtuU7wXW7TBVi2PYLnQ8Ik7nNW4+AWQZi3wTU8V3YbbJGGMcL3LF1ClErR3Ncf6tTBLw1JZyC9jTxzATcvXFoe768+Ehra6D/zlaLTeoLyp7B4WxnyOjJ2Smi0gpPOPpzXG8bBzSqbl9qQ5Kws/ZSVZ0hn9UAeRt4FYkgW9X07HxK9aG7XzVGTkLMLeHuHxmmOnz6PuSHsiEkefA0APm9rkQnvnoh69Kw2g10fVV3n7RwzeFZK9b8gSZ1SemFSU2OE39xm3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gD4gEz5N0lf1CjdWGOHMH0C1C/JWg7SeBLr3iKdTnWA=;
 b=ZYVw7/v1SqZUCRW7CBpCvo/w29GfJRtOKwHDyd6+MMChNBBNasX0naJ2yltkYoprAwB9p45VEyVKsSPvhR3vejBvoDNaEqsopwVFWqWH0UYphXyV19Spm/nQFrtUfz54rvnWDNIpUkWhPyedWrJUaFcf+P8S+v0is5/UyAMg//c=
Received: from AS8PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:20b:312::20)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 13:25:50 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:312:cafe::40) by AS8PR04CA0045.outlook.office365.com
 (2603:10a6:20b:312::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26 via Frontend
 Transport; Tue, 1 Oct 2024 13:25:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 1 Oct 2024 13:25:50 +0000
Received: ("Tessian outbound 6c9d48238f96:v473"); Tue, 01 Oct 2024 13:25:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 713f78c6d16c1857
X-TessianGatewayMetadata: 78+m1UnDRJkQfHjerk11/hJYHwj+wAht0k/1w0WrZOP2F2RMX+mcfNXt6h8RNMWdRaSxaEo08RcsoI2Rtqnkz+x4huUzqfpdn1aKP7JpooC4EUkeUZ39bcQRgwLT24WjFX0Jeu04YqhKVxnwBS63HfQqW5Zh/9uO/bwDSF9WRZA=
X-CR-MTA-TID: 64aa7808
Received: from L0c41f9cd3d71.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3F567203-575C-42D6-91E2-9F9057E94862.1;
	Tue, 01 Oct 2024 13:25:43 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0c41f9cd3d71.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 01 Oct 2024 13:25:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLtg6y+LGBoPAIQbCyg8jG4LWyipiEdC5EyItYOADh+qLcZGkbBQvck1LT+BdUDQhmWVN0c6qka08P5Hze/bvXMD/PueUUxWbY+D7ULUHAJXVlu2hV3DQJGc7B6s9ZeribI1QrnaZIMANO0ebtOQaVEP4m/3UDEN5HwwAQkxE3hXKk+yutGO6sAu5/k8/SdcQyYUDblmQhK/eIHvaNw8WCbCNksIc0/d3V+MdR2FHRHIqOcGMdEVgpeNpcQpISANQ94IpgMhN+7g+e/zhjz0CxYe9gSs1aJyT6Rp0H2uuDZCqN7kieuYhqMgnfXpZpxzifskbaC7jCQ1xQfrwLghTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gD4gEz5N0lf1CjdWGOHMH0C1C/JWg7SeBLr3iKdTnWA=;
 b=CNz+VjHey40GY1YWAzr6T/x8VJOnVMuaSALK+KvHPL/Xd5rORxFKz9/70s1PKNXmhMVtkxf6tT6/R9bOboB55et49gxUOUGoa5ok2g76H9Zz9YfosZmICQ2OVHG/g2MsDZdTXKO387434BzQkyAx0tJCiujk9XPBMGuwCo0Asn3OTH8VNZqbOYdSuV67di8fQc1eF8oepm5Wf0KQCDZ7YTa54kRwN6lwFBfDksU987rJ4KUto4mug9Uq3xfhI/J+EtTxcSNMhX0I+eoaJrkTSWVPSe16R0m+ZpWoZTj98lFpysadHo1KVujop3htSzLez6/KilWbovMddkkP6QhKxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gD4gEz5N0lf1CjdWGOHMH0C1C/JWg7SeBLr3iKdTnWA=;
 b=ZYVw7/v1SqZUCRW7CBpCvo/w29GfJRtOKwHDyd6+MMChNBBNasX0naJ2yltkYoprAwB9p45VEyVKsSPvhR3vejBvoDNaEqsopwVFWqWH0UYphXyV19Spm/nQFrtUfz54rvnWDNIpUkWhPyedWrJUaFcf+P8S+v0is5/UyAMg//c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8417.eurprd08.prod.outlook.com (2603:10a6:20b:569::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.13; Tue, 1 Oct
 2024 13:25:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 13:25:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>
CC: Jon Mason <jdmason@kudzu.us>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
Thread-Topic: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
Thread-Index: AQHbC4zEDtlpgzcUO0e4or6oBIYGZbJwH1CAgAHUWoA=
Date: Tue, 1 Oct 2024 13:25:40 +0000
Message-ID: <865C5886-4441-435F-8871-C3573EB10699@arm.com>
References: <20240920184135.789227-1-jdmason@kudzu.us>
 <48ab488a-15f0-4299-9496-c1a44e7756b5@cherry.de>
In-Reply-To: <48ab488a-15f0-4299-9496-c1a44e7756b5@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8417:EE_|AMS0EPF000001A1:EE_|AM7PR08MB5381:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1532ef-b08c-444c-9b7e-08dce21c916b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?T1VhaVNMYWJJMWtBVVYxYm1QTnFrWDNTYWViUTV1RmxLcWp0NnQ4Nk5OTUF1?=
 =?utf-8?B?UVAvenV6MlVFa2RIWC9qMkVYakZqeGJ2UWl0ek81OW5sUzI1UFVTL2NEdkNs?=
 =?utf-8?B?bld3UUt4WmlHYlVpUUNKR3pTL0ZrajFiZFFFMFpWT3ZyUVVaTHBIMm1UcUUy?=
 =?utf-8?B?MVBOMzlCUHJJc2Y2OTJ0MnNHa0g5d293TVRiblpXam4zYUs3ektBT0gyTXM0?=
 =?utf-8?B?YWY3eVdDUmlEUEpOTFE2eWV0ZU42U0NXRXp3eTRSNHJLQTA1TTUxZHZ0dlgz?=
 =?utf-8?B?L0M3WDRkTzBMQlVWL2l0bXFOQ2czcHY3WEpWakdXM3cwZ0hOYUpkVE82ZFBu?=
 =?utf-8?B?R09GSldaaC9LYW9tSkRlM2lHZjkvdlNMVWxIR3prSnZ2U1hZVmtHbllZL09s?=
 =?utf-8?B?clByTXo0TU5WWlVXUGdIYnNMRVR2czBvaExqaVE5UTlRaDRweit4blh3Tm1i?=
 =?utf-8?B?ZVNobGluS25oTG5wL1FEbWtaQmZXY1BoR2ZUQnFJYXhLZHh5QXZqMkVvcHZp?=
 =?utf-8?B?U1pxNEczR2xFS295MExHYjJUeGg1SCs1cjhTVkNXVDk1V2FRTlYzOG1kcTlu?=
 =?utf-8?B?cmNSQ0QzSG9hQ2t4M3hGZ1E0TFFtamNnQ09VQjVXaEZ5MTQwd3ZSTHQ3M3VJ?=
 =?utf-8?B?eWlpM0hzK0xwL3ZrREtTMXk2d0FGUlRtU3dYQ0xzY2I0R2RPeUNIL2pWaVNP?=
 =?utf-8?B?RVBtRXBFaXVkRDlTQjFtSm1VV0IwMDlrck9pa1dIeFl5dzBlVFpCY1krVDhS?=
 =?utf-8?B?M0MxZUpKWHE1VUVSOG8wcUNmN3FoNlI5STZ6L3VvRnFmbHZxeVdxdU5HZitF?=
 =?utf-8?B?OEtZc3BERnh1R2orN1NuRkpDTnlreFNyZlY4VXRoUjVoeCtTcHhCdFhyQ1l5?=
 =?utf-8?B?NW9ycWtiMGZ5SldZWTNsUCtMVEpGZUVwNmtxRWRKT1draW9wRkF5WWk0ZUtq?=
 =?utf-8?B?Y0hpQzNFakcvTE9NVkxLYS9lMTdKSHdQWjRCSlF4Mk5ZTGI2RGpsRmF3L0Fm?=
 =?utf-8?B?Q2V2K09Nc2JuTHpOaCtsbzE2K0duU29XWVM1dE9tUGZyNFJvVWpON1kyOTZn?=
 =?utf-8?B?RFJjcW9zYzJTMTBoRUx5NGZqZy9OV2hZMEFiVFZBUjcxazdRanhwMjRFcWpN?=
 =?utf-8?B?cW04UFlzdHpoRFo2eWRGK01aOEx0WHFDU1k0Z29JeWNyZmVFa1AzRlovcDhC?=
 =?utf-8?B?TGdjSnh2TktUdEgyUmhNd2o5OE9oSmNYNzY3WGxjSitNcWlYNnZ5YVNQbWsz?=
 =?utf-8?B?LzVHVG03cXZOaGNjVFJDallxU3pyVStoa0Zwd1haV0hhTlE2b29sTjQrS1FM?=
 =?utf-8?B?UVprai9vWnBkMG13c0JneEN1a2FtQlhDR2R3eG53d05xaHp2UWs3dDRUaHZJ?=
 =?utf-8?B?bkJBSzFLMkg0TG1YVW1oMjcycHcvaUhPeHM5d3VUR1ZyTkppNXVvYWZ0ekww?=
 =?utf-8?B?MDRYQU91K0JOdktSdXI5UW5lbkZGOSs2czVDQzNFV3Qwa2ZOaTVYQ2NUY1Z6?=
 =?utf-8?B?VjNOUUF0cFRmUWkzM0UwWUdpaHJSa210ZmRqZnUyTlU3bDlPQ0M2NGIxVTZJ?=
 =?utf-8?B?OURhN1RCYWc0RitKbmY2UlRWeEdYWk14elNhU1ZNR0k0SEloT2VEdTFlSHFa?=
 =?utf-8?B?bWVobFlsQUwxa1Q5bHgyY2Z0Mko0MkI5TlZ5RGUwUk1iNDZYcVNGNHJna1Vv?=
 =?utf-8?B?WUQwRXJVMmZIQTVlNzRmZ3BGVWJZVmJDamt5VUxmWFFZeHU3L1I4STEvazJS?=
 =?utf-8?B?NWJWUXZkb0FCc25tc1Z3cExsYXg4QWNESUUxSWlNU2orZlFXUVhxTlkvU1dj?=
 =?utf-8?B?dnFmR0I4a1AwWkZWK01jUT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C4B2F108E81C14DA7EEFF111A29B2D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8417
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d5af90e5-5e4b-4125-e92a-08dce21c8b63
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TkFSeEl6R2xkNkoralNlNHpmZjk0Y09PWUEyd25HU3B6a3FzOTlWU3dFdUZp?=
 =?utf-8?B?VG1aOEZDNmNVem9YeUZOUGZhTTFGVVd3bitsdkYwRC9nZjhSTExkRU5XSmgw?=
 =?utf-8?B?MXlxMGsxRThTbSs1aVNWWlo5VUZVc0o0YXgrZU40N21Ra3p4Zk1QaWEyQTZS?=
 =?utf-8?B?V3RlUkR3T0I3L0tOVm5rVU9NKzVPbFdacmFOQVh5SU03NkxQM3RNU1J5ZzBn?=
 =?utf-8?B?MjVxc0NVek5yRlRIM0NjOVNMeTV2VW1vTGptUXMzbTZWNlo4TDYyUUx1NkRo?=
 =?utf-8?B?aFd0NTZmeUVqZE1ranhhcnlDT3BFUExackhlelFhbHdScUZscVJXcStISG9H?=
 =?utf-8?B?SkY5Z3VDenI3Q3gzWmkvZVN0Y1V1ZkN1cnpWQVlBcHAra1hmUnN5YVkyV1RT?=
 =?utf-8?B?VXNsS0NYYXFRT01yaldIY3V4MmprSUJTRWxIWDVDZURPZXpvZXBGSGZDWlhl?=
 =?utf-8?B?TndSd3h6NmZreDc5SUpQWFdmYTgyejJWTzFFZXhmbXA4VHNpUi9QTXZ5VEJ5?=
 =?utf-8?B?RGtIY3d4Y0ZpVEdyeWVrM0l1QmViMWxXL2ZodkVvR1IzTEdkbjVSODg3NEhl?=
 =?utf-8?B?Nmpod3NteUF3czBHVUFObmpKMUcxc2ZJU0s4WDZranpvbmdmZkV3MXBRWTJF?=
 =?utf-8?B?WmRRYUJHVjBPM3NWOEg4aE1uTG9qeXVnVHVjQUp0bEc0MUJxL25PTGZ2bExh?=
 =?utf-8?B?bmVWZTcrVENuVWpTWXZTUk9xVFRHNU5mYmFSbG5lTmFhSDlFYzFFZ1NuOVVl?=
 =?utf-8?B?V1poL0FiV2grL2pMTnFGOFI1aCtjSXhHelMwa25OZGk1UU1ndC9zSm5oZWFI?=
 =?utf-8?B?ZVBmVWVtbEVlS3k3ZDBzWEZvang5SGtROHUvT0k2OFF3c3FnSVZwSlNER3NC?=
 =?utf-8?B?MG5kNG5uMVdFdDV4WG5VaS9TQlM2VVlpZHcxeHNzaVYwOWhmZE9aNHQ4Q2FP?=
 =?utf-8?B?QjRoM3ZVT04yUVU2bUhHek1Ib09DcnlDMW9RMWhrbDhOMTBELzBNUG56OVk5?=
 =?utf-8?B?eC9qWk5KajFGaWQ1NEFJdHJhR3dVR0FrYVI1THJieHU0c1VuYi9qemJqL1ND?=
 =?utf-8?B?cnlXQkhmazhyMy9NOXNGbzZkQXlPd0xGemtNQnl5am9Jam5xRnlNcVVnMlk3?=
 =?utf-8?B?SG4vRlVIMEhheWhHS2NwNkdOakU2U0htWVh1SnZSZ3VJb1VGTzVDcUtIQWF3?=
 =?utf-8?B?c1doRk50SlRmSXh0SGczajR1VW1xLytFQ0lML1BBclB3bUlGenVCNWszblRy?=
 =?utf-8?B?WkczS2thaWM1RDNxUkUyT1BjdEFITVJEMnA2ME9RM3MwVjU0NWYzU0dDaDN2?=
 =?utf-8?B?N3Z4WURaS0F5OGNGSXNHVnhzWUljd29iZnFXdWJObUFkZloybWNNRGQwS3py?=
 =?utf-8?B?UVdzNWhIbVNXMHV4WFlybGRwL3gvTDNreWlSZThNQklnSmoycmZTSnpXUVpQ?=
 =?utf-8?B?QzUvVy9YMmpQcmZaZm8zQ1gzSWZxRUlqay9CZmJtc08weUZ4OGNpT0c0bHVz?=
 =?utf-8?B?a0dGVmZtQ296MW11REhESksycDdvOUtLTUJ2d1ptQXVjSkVDa0MvZGhHY0Js?=
 =?utf-8?B?NUljakJocHFqT25FYnIwMVhDMThCV0UrTHVSblRBOVVkTm5OUll0TmJwMkx5?=
 =?utf-8?B?WkZuNTZvQXZBbVk1US9sb0VvRDhOU0J0bERjem80cmpiSjladXd4cFhlMFBZ?=
 =?utf-8?B?Y2pxZ0hqYU9TK0QrSENSRURMYVdMVGZnR0w3eGd3QkRxNkdDQjF2a05IOEQ2?=
 =?utf-8?B?bDZrQS94aVpvbXZJaUtvaG5rZEhBbzJpKzlPd2pPZUR2d0xQMVB4enAxVFNR?=
 =?utf-8?B?NWdUT1dqejF0U0p3RjlrUnVRMXljWmZWNWMvWG5ESytBbnE3aTdmTWxSdFJt?=
 =?utf-8?Q?ztq6RRS/dWLIv?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 13:25:50.5696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1532ef-b08c-444c-9b7e-08dce21c916b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 13:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205166

T24gMzAgU2VwIDIwMjQsIGF0IDEwOjI5LCBRdWVudGluIFNjaHVseiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cXVlbnRpbi5zY2h1bHo9Y2hlcnJ5LmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPj4gLUtFUk5FTF9DT05TT0xFID89ICJ0dHlTMCINCj4+ICsjIGlmIFNFUklB
TF9DT05TT0xFUyBpcyBzZXQsIHRha2UgdGhlIGZpcnN0IGRldmljZSBlbnRyeS4gIE90aGVyd2lz
ZSB1c2UgdHR5UzAgYXMgdGhlIGRlZmF1bHQNCj4+ICtLRVJORUxfQ09OU09MRSA/PSAiJHtAJywn
LmpvaW4oZC5nZXRWYXIoJ1NFUklBTF9DT05TT0xFUycpLnNwbGl0KCcgJylbMF0uc3BsaXQoJzsn
KVs6Oi0xXSkgb3IgJ3R0eVMwJ30iDQo+IA0KPiBIZXJlIHdlIHJlbW92ZWQgIiwxMTUyMDAiIGZy
b20gdGhlIGRlZmF1bHQgdmFsdWUgd2UgdXNlZCB0byBoYXZlIGluIHRoZSBib290bG9hZGVyIHNl
Y3Rpb24gb2YgdGhlIG1rZWZpZGlzayBXS1MsIGlzIHRoaXMgZXhwZWN0ZWQ/IEFyZSB0aGVyZSBw
b3NzaWJsZSBzaWRlIGVmZmVjdHMgZnJvbSB0aGF0IGNoYW5nZT8NCg0KSSBqdXN0IGNoZWNrZWQg
dGhlIGtlcm5lbCBkb2N1bWVudGF0aW9uIGFuZCB0aGUgZGVmYXVsdCBpcyA5NjAwLCBzbyBJ4oCZ
ZCBzYXkgeWVzIHRoZXJlIGFyZSBzaWRlIGVmZmVjdHMuDQoNClRoZSBkZWZhdWx0IHNob3VsZCBy
ZW1haW4gdHR5UzAsMTE1MjAwLg0KDQpSb3Nz

