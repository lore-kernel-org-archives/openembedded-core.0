Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25205C3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 13:06:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.73])
 by mx.groups.io with SMTP id smtpd.web10.37660.1721048812391944984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 06:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UKAe1l0D;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UKAe1l0D;
 spf=pass (domain: arm.com, ip: 40.107.22.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EfLdPfLlFPZahsjqt3jAGVjlhPP+luDNdMpkLGeTsWJ0onY0txCu11ugN6ADdjutgcUks/zERx3Vl1UQSheC82z7GJlsFsurev7Ax4taaiIOEnJFobIrTFbcv8o+z8FCLFimRusu0hLv5KppJAF3Qr8OCWqtgDMTRlfPWcYG3k+VvnQYjba8aeVSkU81KhXtagoe8SymyY6jcG48nt8rzxZ+wi5J5z+2P0pML2C3OTDPikqwtO9EeWvd+4M/MMwS0FnqURKXLvBlIFZyW64ZjT32DVBLxSlFSbSJcWVsxjU/JgKpedJ2PziVuNaA51LSO5pSle1Cwa/HbPEO1aBKSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSzCFLrEYVlCDAU7+geCOGd7sCBwhXg4fi3ToO/Ykww=;
 b=F6oh0mZ+g+L4HkTMta/+iUk/9HJJDpwG9cm7sWY732QwmVPJ5kmiIGaRuUY6Bmw/77zfLw+E/1XgoV5icF67C9UVDY4svQ5QxT3RgPp4S1b7cDBDomaADGafwXJu5w/7ZP9RwQTMaINDvYlH71GFyxeKemZITZt1rS6rgSbaGsT96n2209Dm/l4AFTA+j9xfvQk9q/7cbn+0m61Te/I0rBVOlmGvwJuem8EEUcfJ0Jz6o+FR4MAV1dsnR8fqvLi76x9zFw6ROvxsmpIvt6/yaZflyHAHBI295PFKoM3bYb7nK2fFT1Xnwky6KK13Ov9WvvsAbrkjbiFNUuqpmZB4Og==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSzCFLrEYVlCDAU7+geCOGd7sCBwhXg4fi3ToO/Ykww=;
 b=UKAe1l0D9KZ+dctk8Z3SRDdh0yiA0OSVDjLz/Kr86nNZEVUwDu7XA6MgyqMKh1HzK1vXisc39tpN1EC/5xoASA79vwHams3aiNh1G8z7GuYrieeuFqSZRWvtPGb6eejFhmX/WVlp1GuJkyb2wqpO8SNl4o0L5HSk8hpw6my7gv8=
Received: from AM6P191CA0050.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::27)
 by GV1PR08MB7379.eurprd08.prod.outlook.com (2603:10a6:150:23::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 13:06:48 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:209:7f:cafe::e3) by AM6P191CA0050.outlook.office365.com
 (2603:10a6:209:7f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Mon, 15 Jul 2024 13:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.5
 via Frontend Transport; Mon, 15 Jul 2024 13:06:48 +0000
Received: ("Tessian outbound 04e048b61d6f:v359"); Mon, 15 Jul 2024 13:06:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0cbae010f1c3a173
X-CR-MTA-TID: 64aa7808
Received: from 22e89f262117.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2DF98E73-8FA3-4C61-BBCA-7411E36B3AC8.1;
	Mon, 15 Jul 2024 13:06:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22e89f262117.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jul 2024 13:06:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmBWFiBoyFFm8LNqKtY8KJN38RHMhF1EYDKzz68LgCUemefTuMGlw2ZVdaTZ551oNgFYGPQfi3LgcY9j0POdYAQ0pWp+vsxvjLAkp4yU9sRqfxasVqJBg4aOIJWOUI0hBRinnW77WujdD2gcoIR8RDVOZzne1JRhmOegM3RrZyVBnFHf4bG86/qmFEmIjfi9sxEJ/d4367X+5VlJvdN4nWH68AoIEsVWy7drxg5apz9uwK5DN1Rp4iRDTicDzu8y4fqy4yn25KsbnKR6esZle0KAN58RfAzG7n6r4C93Jia8tCTF5AURwTejz4JnhsGmRRx1dX8LFPgpm+3/T1BQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSzCFLrEYVlCDAU7+geCOGd7sCBwhXg4fi3ToO/Ykww=;
 b=ECnYLZKdF1qJ5vbR0i7d8rTdAgXlgIwZm8mWH7Cn5U9Cv1l/Qjg1goBuV6pNdfN6myaqGtPITdmZicdYcJIwLuJKtnJAVUa4ilMO1dea1rUZ1wTQDLX+Q5ELISLFCEPN5pmQQOCKNI23wIsb6s4pXWR3PzDLb8z6Sa8g2AaC3zJKZyq4e2VZJTOKvaJEIDAwiEPmeYSQTCx+Ks6mWLuEZWCY2lJ8aZ8RvohequS69Mbq4sLIcfCzE1U806S0JzA7DxbPODhvCPihaPE8HsNSx7BwjRiKYe/UDsyfyLIqplHX8OBK1u9iWXP6xssSc00EedZ7xGqiTOzxdui1dsy1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSzCFLrEYVlCDAU7+geCOGd7sCBwhXg4fi3ToO/Ykww=;
 b=UKAe1l0D9KZ+dctk8Z3SRDdh0yiA0OSVDjLz/Kr86nNZEVUwDu7XA6MgyqMKh1HzK1vXisc39tpN1EC/5xoASA79vwHams3aiNh1G8z7GuYrieeuFqSZRWvtPGb6eejFhmX/WVlp1GuJkyb2wqpO8SNl4o0L5HSk8hpw6my7gv8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6383.eurprd08.prod.outlook.com (2603:10a6:102:155::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 13:06:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 13:06:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/sdk: add out-of-tree kernel module
 building test
Thread-Topic: [OE-core] [PATCH] oeqa/sdk: add out-of-tree kernel module
 building test
Thread-Index: AQHa1IuEYGBXaEa+/0WUf7aRULf8VLH3myaAgAANJoCAAATuhIAAGUwA
Date: Mon, 15 Jul 2024 13:06:40 +0000
Message-ID: <70528D64-1714-44D5-8063-89410AA52AEA@arm.com>
References: <20240712184358.3103083-1-ross.burton@arm.com>
 <ZpT6c4hgYV6xIJsf@nuoska> <ADC09946-15C3-478B-A833-DDC3A595820F@arm.com>
 <17E25F9219ACA60A.6120@lists.openembedded.org> <ZpUJi1s0cSJCUBiN@nuoska>
In-Reply-To: <ZpUJi1s0cSJCUBiN@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6383:EE_|AM4PEPF00025F9C:EE_|GV1PR08MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bcc6320-f6a0-4c6c-bcd4-08dca4cefc64
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Q1VxaC9RZ3JFYkpOYVRpK2xuaksycU5ybUpvMGxMeStDaXhQOEM3UktuSnpz?=
 =?utf-8?B?ZTZhYlN6VW1LZ1FRQmFQNE1oZEt3YTBiTEplbnkrQW5nT3QzS0JSM3JMMlJm?=
 =?utf-8?B?QWxXbFFPeEFscnFYc2I0b3B5UHlCZnRFM2pmUnA4RXF3RGl0OVkyMjZGQXhq?=
 =?utf-8?B?MjlnQW9iQmRxQW9zanhEd3RkYXhpdjRuWmNMcmdzZW9BMW5uVUJDTjdDQ2Va?=
 =?utf-8?B?Sm91RXcxNnVNckJrQ21za2JBd3N6c2VFMWJyTm5vd3pHMC9GQkEwMWt3Ym1a?=
 =?utf-8?B?NkxleXBZV3dyMmpRZEtCYkZBTzFwOTM0K3JFQll0T3V4eit4MG9lUC9wTTA4?=
 =?utf-8?B?S25XOXFKZEYwalZYWUV5UHBmZmdPUXI2NEFvUDRDak1qelF0RmdIV0Uvd1R6?=
 =?utf-8?B?cUx0UCs4ZjNoMDAzOWVOYVBNQ1cyVjU4b0xsc0tPUFhnWldORWVzZnk5ek5U?=
 =?utf-8?B?VW02Z3dubTZJUlVOM09RczJZQmZudW1Kcy83c01rcXlLWFF0MG1Ga1dtaEZx?=
 =?utf-8?B?S0tTSmdMcGFqTmZmQXVQbHMvNUR5NFVSbjl3OGN4VVhidWM4WXZodmZPMkkv?=
 =?utf-8?B?QVAvRlB5TDB3TnZsQXhKeVc0TWRHSHhOZUV3RlhGVjY5UWttUjNhcVMxcmR2?=
 =?utf-8?B?SktERjlVSnlkNTRnUFcxTlo5NmlyT3prditKQ1JGclJndlBuMkxvQTVzVEpH?=
 =?utf-8?B?djRsbkJ4YTJjMkpyTXY0ZkRPZnA1T1FDT1hvRWxqTUJsVlF0a3V2aEY2bjRn?=
 =?utf-8?B?ZzV3aHRFODd4SDQ4WHBJd1J5Z3M3U0QwemRYdnVPbTVucTJ3SnRTRk1PY3FZ?=
 =?utf-8?B?ZmFENmIzUjhidStyQmdaTEJXRDNBakVQSVJhbXFOdzY2MU5xcDJaMi9TZXg5?=
 =?utf-8?B?RW5JZTEyc3VIQ3ZVWThZSjZwSWZ4bEhrK3ZNUy9xb1ByL2tSdW4veHB6cTBi?=
 =?utf-8?B?Kzc5bkd2RVA4MWpOclRtbXdGY0xRYUdoMExlTkJGdEl2SU9IeDBPYnNTWXlB?=
 =?utf-8?B?QWhOaHJQVExMUk45dUxETGpwdnBKL1VUR1F6a0t2L0ZYRVNWd1gwa2RhbzNI?=
 =?utf-8?B?bW92bm9MVzk0SW9zNWRYdmNBQmxEWERmSDZKRjZVVXpIYy9NMVBVWmJUc0J4?=
 =?utf-8?B?Q2JHeTFUN3l5YTJWOGdrWlFkSWw5UnljNGthZDFGdmlrbHNrWlU4cS94Zks3?=
 =?utf-8?B?aW4rSndSazRtdlJEVm8rMkdSNDhra3ByVHFVMVVOZHZYbWtXNTU2YWhpZ3li?=
 =?utf-8?B?OG1HWExybG41aVl0b0p1SmxsUXFBU3laOGJOUzJaQjNjRHhpblZJOGNTNy9G?=
 =?utf-8?B?OWhXbGQwdHhaRmdiK1cyUmRNRW9QaXdkWnNxcDV4VHFmVkpmaEVBMEdjQldH?=
 =?utf-8?B?RG5yQng4YlltZVd3T0RGZzhiUlVTb0t5ZHl5dWhoNlc1Q25qNVkwZmcwVE5y?=
 =?utf-8?B?RStBL1NzTFV4YjFWRlB5SytWalVsUE9tdFpQQ1BNb2J6RGZCcU9paFNvcm1Y?=
 =?utf-8?B?Y2w1cXZPK3h6QXFBb3FSMXFheDVqajBUbHAxTXpUSGhhSWYzNDlRTVVxQjNR?=
 =?utf-8?B?K291Rno2djhlNGlybTlnMUttVW5BaWpBUFo5c3pNVVB3Q3JFQVlTdFAwSE1s?=
 =?utf-8?B?d0g2MFM3MzhTUU83ajdGKzBrUGNpcEhLNGRQZWpkKzV0anRCTHp4N2R6eUky?=
 =?utf-8?B?UVFJVmlVbWRoL3p3elJMdzhZbTM2OGRjZk1YTjk0VklVTE5PSjJHWkEvT1VF?=
 =?utf-8?B?Rmk4WmdBK25wOXUveS9XdVlVOVBIaHcrMG9ZazlPZml6QzBrWFM1RHcxRkcr?=
 =?utf-8?Q?sYbyIPYvvWaUyUYVrw+QAZ6rBXObtxMN8/8Ws=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <876E5F414A29674CB96CC26CDECAC460@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6383
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	095096f4-718a-480f-9bc8-08dca4cef78c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WWF0SVdTenh3cEo0YVBLVTdTTlVaamhRalpmQi9ySmdQRkFaaVNGeDFsM1c2?=
 =?utf-8?B?TjFVb3RFUDZ5emNQMys3VC9wVFU4dnMycVdmanJqdDB0YzU5aFVEQmowWUJu?=
 =?utf-8?B?MDBFcmV4MEVUbEJXOENsTUdackF3eGV0ZmV3bVhGbDZTbHduTWZ3ZnZueGVh?=
 =?utf-8?B?cVM2bVdDOG9UQWZPRmQ3UkhJWXoxLy9XM0Q2RmplOU5hck5oNkJncVh3VHA1?=
 =?utf-8?B?aXdlWWg5aGhXYlFPLzcveTNIdFRUS3R4aXdnKzBrRjBCdWRLWHlWNkFYSnRL?=
 =?utf-8?B?Rll1NVBzRkhUWVREUkN3TFZTTFhpZ0FFVGhQOVNWOXhnN3hYTU5Cc1Ria25j?=
 =?utf-8?B?VmVYOE5TU0xaYjY0VnAvbEpSOG5sdUR4MFUvUThyT0hpVzRxMjJXN2ZPRmE0?=
 =?utf-8?B?Z05yU2FGTVptOEtKRHVlRXAwcHI1NVcvMDhORFAzSUlucUlXa1RBSEYwaFd5?=
 =?utf-8?B?Q1NsRVMzN0Nyd3FVeHVjWmhJMzcxUmlPTGIvclVFa1JmTGxxWXp3b3ovYmdu?=
 =?utf-8?B?V0t2THRITWRWUGo0YjhRaFY1aHBYaWZ6d0w4TGJVcURYaVRpQVlIdy90NlY2?=
 =?utf-8?B?UWwwL2tjbUhjb3QwWjJ4ZzI3bExnY0xXYXE5cWl4U3VKdjRMS2tFRUEra1dH?=
 =?utf-8?B?UlJGNjQ4ejJ4WTdPVjIzbC9JNGlqbEhpWXhudURrbTBNbkNRSVlPdWN6NHJy?=
 =?utf-8?B?VTVOdGZWWXlyRmd3Qk9aL2tXOFRNdWlJcE0zd2xXY2RXbWh6Vzl4RW95TEhD?=
 =?utf-8?B?eE9KZU1YeGpWL2xsaCtNeVdvb3pzWExLOTcxSmFPSUtNbGdZK3BFYmJWOVow?=
 =?utf-8?B?U2ZzNEtBSGhTRTdlK0F4KzRERTNySHhRQlp1cHFRMnUzK0tJREhNRm83cFh2?=
 =?utf-8?B?dWhuNmJBc2hCNDRFYzB0Y0lLZnBPS2NhMzRUbUIzb0N0a1p0bXJlOVU3ZVBZ?=
 =?utf-8?B?OXJqU1EzM0lrZW90VUlmeHYyWElTdWlEUDFXQ3E5N041eTU5SGozbUV6eHU0?=
 =?utf-8?B?ekRtSkdtbzlJZHkvM3pQRS93R1lJakVuQmRReWp0dnhzalBEd21KcVNFbmUx?=
 =?utf-8?B?NzJMbkpyTWFwUWFhSld4MWJ2YUVLbGpPNFF1SFA5V0g5RFVRZU9KMkZNaE96?=
 =?utf-8?B?ZGVwZ1VSNlJBdnBMUDA4NjhjVVZZajlzRXU5Y1JJNllXcjMyRlh1U3c1QXgx?=
 =?utf-8?B?Qk16UFFnUVNFYVRKOWhqMzQ3QlZRbyszR3YvaW1ud05wU0NKeGZyTXhtT3I0?=
 =?utf-8?B?b3dDOEF2L2ticW5PMkFVQXFleWhTTEdhWFJwMzBnU0xERGxnK1VTUEo1WU9s?=
 =?utf-8?B?WGZRUXVGLzFPdzF3M3B4OCtOOE5vcllpUlVMWkR1NTlhSFRMeFB3TjhTcCsy?=
 =?utf-8?B?NjJKbGx5eURqSzdSa1oxYWp2Vi9Eb3Rpczk2aFQ4WFJBcDBYL1VKTVJ3enZP?=
 =?utf-8?B?KzRYcytWZ3JEdFpCckxMWXUyL1Nway9GMUFJcTl3MWtKYnF2Z0hENndZM2l5?=
 =?utf-8?B?VEhOMC9Obld6dDVveC8xcHBQY21lMXV6L3c4c0k4NGM4U3RBM3RBdkhBelp3?=
 =?utf-8?B?WVVPSEZXbTJ0YlF2dGM0U01sOU9vMlRibFA1M2dtVFVHWHAzcm94bEkrNmk0?=
 =?utf-8?B?ZmVrZWZnbE5kWVlZSzBZYnVtSzdVeVJHNTc1SkpNUGFFcjNqaTU3V1RUSVBU?=
 =?utf-8?B?VXRhN0ZNT2M0U1hJY2wxZlFCMWRFVzFxSFc4SWtHb0daVWhaNkNYcGEyYWdh?=
 =?utf-8?B?OHRvM1FOWDZMbEtwR01wRzlCaGZDdk02V0RqdFNTRjN5dXhTc3ZiTVBkUGpn?=
 =?utf-8?B?d0FlQUZ4YmRNblFXeTdVMzJucmJpKytpVzVHSmVSeUdwSTZEYnJ3QjRpVWpk?=
 =?utf-8?B?NXBDWDVmek9JWFdlSGE3T2R1U2FLdzdxbHBNanJzSU8yZkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 13:06:48.3821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bcc6320-f6a0-4c6c-bcd4-08dca4cefc64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 13:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201924

DQoNCj4gT24gMTUgSnVsIDIwMjQsIGF0IDEyOjM1LCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVs
aUBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgSnVsIDE1LCAyMDI0IGF0IDAyOjMw
OjUyUE0gKzAzMDAsIE1pa2tvIFJhcGVsaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90
ZToNCj4+IE9uIE1vbiwgSnVsIDE1LCAyMDI0IGF0IDExOjE4OjMwQU0gKzAwMDAsIFJvc3MgQnVy
dG9uIHdyb3RlOg0KPj4+IE9uIDE1IEp1bCAyMDI0LCBhdCAxMTozMSwgTWlra28gUmFwZWxpIDxt
aWtrby5yYXBlbGlAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4+PiArICAgIGRlZiB0ZXN0X2NyeXB0
b2RldihzZWxmKToNCj4+Pj4+ICsgICAgICAgIHdpdGggdGVtcGZpbGUuVGVtcG9yYXJ5RGlyZWN0
b3J5KHByZWZpeD0iY3J5cHRvZGV2IiwgZGlyPXNlbGYudGMuc2RrX2RpcikgYXMgdGVzdGRpcjoN
Cj4+Pj4+ICsgICAgICAgICAgICBnaXRfdXJsID0gImh0dHBzOi8vZ2l0aHViLmNvbS9jcnlwdG9k
ZXYtbGludXgvY3J5cHRvZGV2LWxpbnV4Ig0KPj4+Pj4gKyAgICAgICAgICAgICMgVGhpcyBpcyBh
IGtubm93bi1nb29kIGNvbW1pdCBwb3N0LTEuMTMgdGhhdCBidWlsZHMgd2l0aCBrZXJuZWwgNi43
Kw0KPj4+Pj4gKyAgICAgICAgICAgIGdpdF9zaGEgPSAiYmI4YmM3Y2Y2MGQyYzBiMDk3YzhiM2Iw
ZTgwN2Y4MDViNTc3YTUzZiINCj4+Pj4+ICsNCj4+Pj4+ICsgICAgICAgICAgICBzb3VyY2VkaXIg
PSBvcy5wYXRoLmpvaW4odGVzdGRpciwgImNyeXB0b2Rldi1saW51eCIpDQo+Pj4+PiArICAgICAg
ICAgICAgc3VicHJvY2Vzcy5jaGVja19vdXRwdXQoWyJnaXQiLCAiY2xvbmUiLCBnaXRfdXJsLCBz
b3VyY2VkaXJdLCBzdGRlcnI9c3VicHJvY2Vzcy5TVERPVVQpDQo+Pj4+IA0KPj4+PiBJcyB0aGVy
ZSBhbnkgd2F5IHRvIGNhY2hlIHRoaXMsIGUuZy4geW9jdG8gYnVpbGQgZG93bmxvYWQgY2FjaGU/
DQo+Pj4+IA0KPj4+PiBBZGRpbmcgSW50ZXJuZXQgZG93bmxvYWRzIHRvIHRlc3Qgc3RlcHMgaXMg
YSBiYWQgZGVzaWduIElNTyB3aGljaCBldmVudHVhbGx5DQo+Pj4+IGNhdXNlcyBhIGxvdCBvZiBm
YWlsdXJlcy4NCj4+PiANCj4+PiBZZWFoLCBJIGtub3cuICBDYWxsaW5nIGJhY2sgaW50byB0aGUg
Yml0YmFrZSBmZXRjaGVyIGlzIGFuIG9wdGlvbiBidXQgbm9uLXRyaXZpYWwgdG8gYmUgaG9uZXN0
LiBJIGhvcGUgdGhhdCBjcnlwdG9kZXYgd2lsbCBtYWtlIGEgbmV3IHJlbGVhc2UgYXQgc29tZSBw
b2ludCBhcyB0aGVpciBsYXN0IHJlbGVhc2UgZG9lc27igJl0IGFjdHVhbGx5IHdvcmsgd2l0aCBh
bnl0aGluZyB5b3XigJlkIGNvbnNpZGVyIGEgcmVjZW50IGtlcm5lbC4NCj4+PiANCj4+PiBDaGFu
Z2luZyB0aGUgZG93bmxvYWQgY29kZSBpbiBvZXFhIHRvIGp1c3QgdXNlIHRoZSBmZXRjaGVyIGxv
Z2ljIHdvdWxkIG1ha2Ugc2Vuc2UsIEnigJlsbCBwdXQgaXQgb24gdGhlIGxpc3Qgb2YgdGhpbmdz
IHRvIGRvLg0KPj4gDQo+PiBIb3cgYWJvdXQgY2hhbmdpbmcgY3J5cHRvZGV2LWxpbnV4IHJlY2lw
ZSB0byBwcm92aWNlIGEgcGFja2FnZSB3aXRoIHRoZSBuZWVkZWQgc291cmNlIGNvZGUsDQo+PiBp
bnN0YWxsIHRoYXQgcGFja2FnZSB0byBhbiBpbWFnZSwgYW5kIHRoZW4gZXhwcmVzcyB0aGUgZGVw
ZW5kZW5jeSB0byBwYWNrYWdlIGluDQo+PiB0aGUgb2VxYSB0ZXN0Pw0KPiANCj4gQW5kIGJ5IGlt
YWdlIEkgbWVhbiB0aGUgU0RLIHVuZGVyIHRlc3QuDQoNClRoYXTigJlzIGhvcnJpYmxlLCBhbmQg
d291bGQgbWVhbiB0aGF0IHdl4oCZZCBuZWVkIHRvIGluc3RhbGwgc3BlY2lhbCBwYWNrYWdlcyBp
bnRvIHRoZSBTREsgdG8gZXhlcmNpc2UgdGhpcy4NCg0KUm9zcw==

