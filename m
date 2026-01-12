Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D14C9EC9D
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:18:34 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36791.1768234705444658318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 08:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PWX6hl+d;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PWX6hl+d;
 spf=pass (domain: arm.com, ip: 52.101.70.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LSF2JJu54Egi1QfTeGnnAjDVE4JGpsnZbVDz+fHMPXuIipE8zrhHpPG3JGriP6usroiH8fKvoHnkj5gjbtMUjvVQIZzUFw1ALKmqqXQovEcDk4GumEA4H3hKRpFAFIhAYzvzYSBZTjeQgeRLumdsmpQ4TZ8B/++btvNBV7J80bIpCg2z3skr+zjT+eIuUmKIGsj0V++8W/NMAEGEPWE6PlSqbVNH9XWccuzX/enyH75ZpK51NhTrByYCPfxFaPNdX0Zw5ycpfx1BJ62hwxXAj30Jqagl32ux32fC2+2eJopASj7wYijBPJrn7c1YaCkxjYqkV5ifxLjFUY1Qayo/pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2CPMi/jSRteVxY9dzxruaTBTfQTOmubQsdj8YXUQLQ=;
 b=ORUd1fWUz1adzw025gHEeCCZTytUH1p/EoGjKQ7PD2Pnb6EJ2L9zh3DyDvl/A58NDCT17BIw8jtgxJO9v7kMKlZX2HQ8TkTxO7/HVRiCipw1v1w8iPrXntWVWg8bsTpcdu5kYMuWH9sYce44qBsUaugdOmQXXeto7Pab+vrjuIuB7JqpepA0bUdfeRp8fSS3TbkTHpsFC4+G32r4eWv2bF5Th2V8FUp2JZ9jP5ehIpEAl9Y2ai7ljD/zpojAs+rZGnzCfJZS5EuPwqJYtFrC+B1Z+7XGUUTZBKB+mP9XwTK/THTNEdnJc1ZJuHYVp0dGzx+szlEHnY86LDQQdY5crQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2CPMi/jSRteVxY9dzxruaTBTfQTOmubQsdj8YXUQLQ=;
 b=PWX6hl+d+Vr6YS4H8YCeVf0KpxoApj8eIen9PFw/IYMb9Zg2sKDQyNYkb7rgN4FtQ7xw6lShcxvHD7bK4bIy0DunfhARHoZgF11h64fba5/31Hn4cD2MYxTUfsDw/PJ8DgRh8/zlFruACOppA6Oq8pVDlmoPpuXOM3x27KIzOUQ=
Received: from AS4P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::18)
 by GV2PR08MB11369.eurprd08.prod.outlook.com (2603:10a6:150:2a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:18:20 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::90) by AS4P189CA0032.outlook.office365.com
 (2603:10a6:20b:5dd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 16:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Mon, 12 Jan 2026 16:18:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHaCKONDsNmH/wTUb8RH8JT5foN0WcHNUDT4lwnnh0bZwH//gMYxdd8I3it7NuK29EgA0wJ/67jsIuOfgqPf/6HgN4Pe51PrK1uGViRxVl5laxVG12xsE5Ih7i6diwzs5RigFUbi4mqDZooT1LbTcvu3gU+OTrsNhOnCZcWEgiusylGKYggJ7FD1l27axBc8pj83C6rg7tn4lyY6eJcCK1BXode/neTNLlWirTCqvlLTMi1luzd4udvic0RCv5ae4U2P0pwLVdhHM7n6roxvkq3ev5Wz8j/JTDw6dfcg+R+1OhARKoIv6bz0vNLeDQJoXfKtv96S8JkDrMdodbdxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2CPMi/jSRteVxY9dzxruaTBTfQTOmubQsdj8YXUQLQ=;
 b=ugfqeUhPp/ChCm0HhZ+JlaSr6KOY6aJL9j/h9uSq1rCgKI+rlUKf0v2MRbXSLMRq08nTwZzuCLrJwK82FWr3R2b16o0vlt3dVSZ+AMKahs1ggYDGL4golkE2mAWdtpwTKoKTcPVugmQsRY8R8To4VIg2tnnucdLIaqmF94isgbyKDaq6+irOJx2NECbpsrAM34tNg2EkL3O6WJ9YCeYHupDKAew/U0kpu9NE9uSdU/bDtUryoHpwoxwdBipz7GK+ZfeUFnMdoD7r+eLESuzZHYAFxP+uaIkeeE0sSZ63rbXpN6TPmBli+njpt3MmFebx4QOxOUb2aJZ2ut2yrKla1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2CPMi/jSRteVxY9dzxruaTBTfQTOmubQsdj8YXUQLQ=;
 b=PWX6hl+d+Vr6YS4H8YCeVf0KpxoApj8eIen9PFw/IYMb9Zg2sKDQyNYkb7rgN4FtQ7xw6lShcxvHD7bK4bIy0DunfhARHoZgF11h64fba5/31Hn4cD2MYxTUfsDw/PJ8DgRh8/zlFruACOppA6Oq8pVDlmoPpuXOM3x27KIzOUQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB10368.eurprd08.prod.outlook.com (2603:10a6:10:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:17:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:17:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] toolchain/classes: Add lld-native dependency
 when using lld as system linker
Thread-Topic: [OE-core] [PATCH] toolchain/classes: Add lld-native dependency
 when using lld as system linker
Thread-Index: AQHceVhZ8+YxgW4fLEydUBVcWFn3JbVOyxQA
Date: Mon, 12 Jan 2026 16:17:16 +0000
Message-ID: <03D1C411-B650-46E3-9644-7FDB94DF8CBC@arm.com>
References: <20251230064832.2257911-1-raj.khem@gmail.com>
In-Reply-To: <20251230064832.2257911-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB10368:EE_|AM1PEPF000252E0:EE_|GV2PR08MB11369:EE_
X-MS-Office365-Filtering-Correlation-Id: 4059b632-d699-4e39-accf-08de51f63381
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aEVpZG5qUklNTXkrWGxUb0FWUW9ENElDb2Vvb3RQTWxhVmpTUlpKSWlnYTNv?=
 =?utf-8?B?UzYxZzdYanRmdnZuRHp4QlBsT0xEem1uUWYwRktxN1NZbE1xQS9aSVJHMFUy?=
 =?utf-8?B?eXd5RnlvTW5nZGVmSnpQK1ZDRVIyZ3NPcUNFcUJtUzdRajdqcXA4dEJ6TzM3?=
 =?utf-8?B?WHk2dzVkbDRWMTlJOUxhVFd3ZDhwUGpTTFU2VXV2RFN6OVJzTHVGb09MOFBz?=
 =?utf-8?B?TktuK2JUMks0Vm84TTBZc2NFSTdCN1V4VndCeUVyQUxTeTA1UVU1UDliY2JI?=
 =?utf-8?B?ZkJKdWNpRWNzb1ovbXJjN25vUEwwWmgyM1ZZN0VDU0lTNzkvV2VaMGpEbklW?=
 =?utf-8?B?QzdOcmE4RVBmR2M4WXFXam1uS28yOXRQWWxkWXVUaytxS3ZZcE9CMSthSldR?=
 =?utf-8?B?YlVReUdORTUvQy9uc29zV1FaRmZrY0lhSmw5RUtUMVN6Mm1KeUtMY0xNOXNN?=
 =?utf-8?B?SDRsL2RyZ3pSMG5TSVJqZTZDKzMzK0FtTVFQYUtUbEJMQk9qa1ppVEdORU9X?=
 =?utf-8?B?WnhNT3hlQ0VtWkV3ckh0eGhUUGJTYklSVEJUT2JPdUcrL092NlNoVnZETFBp?=
 =?utf-8?B?Z3NaeVU0aWlWWUFWaEpUQklBQUhkeUViU3JHZ1h6c3JoZDU1dzdSbW1INDFS?=
 =?utf-8?B?VXl5cEI1K2NnZ21XMGRIWlVkTEVtVUNBVGU5SllOVmRFNkY0dmpSaE1RckdU?=
 =?utf-8?B?UEgxeERob1kyaU1iZEp0UWRYTU82SUtycWVJOHdvL2t2QU5adDFjVk51QW94?=
 =?utf-8?B?NGpBbEdSUGU0M3huQlBjdFpzYVovRXloNWFrK0VQVWFYYjZUTkthWFdOaHBZ?=
 =?utf-8?B?Nk9MYlNuWFRKY3VzQVBndE9scWxNT3hGZUx4YWo2RHhtMHl0aE1teVBKUzNY?=
 =?utf-8?B?UnNwRWJsWjdKQ1ZwQURncG51VmVVS2RvSmljdHZaV25WY2R1Ry9BRjBlS016?=
 =?utf-8?B?Vm1NdjQvbW42bjhrY1c4QURiK1hUOUpmYjhpSmxHZVdsb21ReFhjUlBya1Za?=
 =?utf-8?B?bFhURm9PM3MxbXRZanpIRHRJUVc2c3J2Yi9mdEdWUWdrWEN6TjlBVnR6Uno0?=
 =?utf-8?B?a1BkNHZvSDdLVUhid2lTaE8ycDdsZmdGWlRJc2xnT1JOemE1LzJLNG1reVlP?=
 =?utf-8?B?NEFFNVhuU1ZpLzFDU2xBaER6SWdUMWphYy80NnhYcXc1bkppMEJSNFY5SDA2?=
 =?utf-8?B?VG5MbjVIMHdvdURla0Rwek9CZDl2cWNXNFZUZitKY0VpZG11MzMwSlNMOVl5?=
 =?utf-8?B?TE02WFMrS1NTZ0VIM1UxL01Ka3FqRW51T1BDVjRObFZaZWVDSFM5TzdhMVlW?=
 =?utf-8?B?d200ckNETnpxNnlUZ3RmRCtaaW5EV3ovaDZZdDltWS9CbWpPWVoveFY1RDRI?=
 =?utf-8?B?YTJjSW9NMkQ4SFlEdFpTZVNoNCtraDNYYmhjZitvbllhNW1xMk9Da3ZObER3?=
 =?utf-8?B?aDhJalkzSkRBRnh4VWZyYjB5TFluL3BzVG5vY3hXT1I4NW0rSHZiWXdPeFdr?=
 =?utf-8?B?bDZINitUL3ZMUzRNcVhudFBaUDEzelppRm5UeWY0dmNlWUsvdzFRYWN2WWkv?=
 =?utf-8?B?MFpQeU5VdDdTRlFVWUdpVEpGVDN3bDJ5R0o1d3RJL25pRHhidGhxNGM5dVRj?=
 =?utf-8?B?M2JoVkxJQmlQVE5QMHJIaFh0Rm8xVjdvN0ZlblpYcU84ck9GeVZ3ZHE5RFp1?=
 =?utf-8?B?NUdpS0Mzb0p4OHpQdkFlUkRRaWFNWEFCbThnRmRSd0N1eHdyTFhpOHh3cHpU?=
 =?utf-8?B?UjdaYjhRRmJQeWo5TzdQNTNWUVo2TlQ4YzFKSTVBbElrOHhwZm9MMUE0MW5K?=
 =?utf-8?B?N2Y0UnJ3RHRsRHVIclZuWk9GOHJIUzhOY0FUZHdXekF1L2ZGVVhQaTJxS2J5?=
 =?utf-8?B?TUE0RnJBdWhrdXVhczhoRUkzMS9YK2JLekU4ems4VDdXS2UyYXRMamwyL2p3?=
 =?utf-8?B?VWp4VURCek9mM2xOUkxJTzZFNnlFdE5IYk8wcUhZc2ljSWFHQk1aL0N3aVAr?=
 =?utf-8?B?dUplb09UUStQeDZHQ21iS1FCbTRpN21EYTRNWVdmWjZGVjkrTGFmMW43VDkr?=
 =?utf-8?Q?MNczpL?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C605515BB72EA2478330932526EE726F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10368
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b1788709-3144-4ae6-695d-08de51f60d74
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2JYaWNJZDRjbXl6bHFRclM1VHFUMlBNdSthUUl4L3BSYjdMb2h5b1JQWkps?=
 =?utf-8?B?cllrY29Td2FJNXptaXk2NHJadlJXQnpCb1YvTFcwMUZ0UzZDZlRQeGJDYjZK?=
 =?utf-8?B?Yy95M0RBcGxQN24zZzRPaGhienBRUUZWak44VmRKZHR6V3hESTZDTUQweHA5?=
 =?utf-8?B?TTE0T2g1N3preDVmQkJEcTZ2ZFFudzBGSCtIUTdjdkZINHZQdEg2VGlMSnov?=
 =?utf-8?B?SmU3UFVOUmdOemVyR2pEWkxad2l3dFBMbjlQRlFSQnpEVUQ3ei9CR2pjWWtV?=
 =?utf-8?B?ZDNJWXpsSnNIZUk2UUhTaTdZbmV4cmR6NXBqRGFLd0ZYMTdyNDlMMnNTUy9I?=
 =?utf-8?B?TGJUTGppRGwzOXRsTkdVRmtWZU10d2xIQ24vdHFGaUlBZHhOVUVpSDI1cWdr?=
 =?utf-8?B?OHNqS2NYNUdkVlM5bHcyc1BkOUhCMkxtc1h1Y2xUNW1raS9LNUo3eW00TXdX?=
 =?utf-8?B?Q0N4czJLNkRaTVRid0FmcVJoQ0d5OVlZZUJzU1NEYkxlY0cxNmFHUVlwN2FJ?=
 =?utf-8?B?b2pTQkpPM0p1L0FMSzFmZ3BCdlY2bS9YalQvUWxHVG54OGk5ZVBaV1ErK0VP?=
 =?utf-8?B?MUg1djc3dFdCTFBrb05VTHREU25LNkk5Mkk2Nks5NjBleCtsWFJNZU9CLzRn?=
 =?utf-8?B?UW0vTndubmd2K1JFZ0NjL1kzSU1jTUxKeXJRWGkwbmttY1NCcWg5ZEprb3Ay?=
 =?utf-8?B?WFFwbjVKb0VXdlhSSGtNWUxxeW1lWEdDUWNxR3FVdm92a21tdVdFSitua25M?=
 =?utf-8?B?emdjcHZBWEpLWUdRZ1l0Mk84ZkoxY1AzcVVmeHRBYzNmWk52N21aVkk3UjFz?=
 =?utf-8?B?dVZQM3ErV3hMS21kN1dXZDhxb3kzRDNKSkhVaUJsU2dLelJ0dStjWFZEaVk0?=
 =?utf-8?B?bXg0aHBqQzB5dFNtdlY1bGhZaW92cEY3ZkNmN0ZxRk5sUWlBQm84dUxGamNS?=
 =?utf-8?B?Qk05TFNoYnFPNUpQVzNZUmVzL0p6czczcHpmdUl3RTZiNjY4dTd1VnJNOWQ3?=
 =?utf-8?B?bFVXazh2Z0p0M0NlaDM5NEhtWDNUZS9pTjdRYklOTmNkVE9wd0lLQ2Q2VTlL?=
 =?utf-8?B?YnhjZVorUEU0RExxVW9xbm40VEtIbEF4M2YyS0cvaVp4UlFiMnpsaHdadXVZ?=
 =?utf-8?B?RWdodkxPWmZtV3lYdFBpSndGelNGemw1cDZvemVrNnpWM3A1bTNJS3BWWG9s?=
 =?utf-8?B?RW9ZMW5JeU1mTjV3Mk9TTnVUc1BDaXlZYyszeFE2VlpVVUtVUnR6dXhBb01Z?=
 =?utf-8?B?U0dYQ2hFU3ptNGV6d3BiZk5FY2h1akIwbmJCMjV3eTdyaGw5Sk1WOVAvakVE?=
 =?utf-8?B?TEV4aWtERlpIK0tsT3AxSk5wOWhCTkhLeEpMMGY4a2p0ZldjTERHS0dIQUVs?=
 =?utf-8?B?T3JOZXRmVHBGV0lQaE1ZeUl5RjVwWGQxUWRWZENrRmM1OE9YcElJcnNSRERV?=
 =?utf-8?B?L0grV2gvaEdLNFZTQUdSS2lzVGxjNkl1ckkxclpjYWZ5Z09kSW9idlVTeDFG?=
 =?utf-8?B?amx1dllSNGIzK2ltR0NlSk9JbURMcGdseDB1SG5SYTZQYW42Zk92VG0wbFVl?=
 =?utf-8?B?bHNuZWxNbkdnSjNkWStyemdMVFpFejVxL1RvZzdBN0J6K1hrK3dnOThlUXIv?=
 =?utf-8?B?VGlLME5JeHFoS2JlSHlQeGlCNjFRd29jVUVzNVNWMXJ0ZWcxOEdDOWpoV1dL?=
 =?utf-8?B?SFExK1BrZE0wd3F0SGVRbUg2aE42N1ZIOEw3bHVqRS9JcUZVRHZrN3ZXSnN4?=
 =?utf-8?B?cDNWTUQweTVVeDJvdXdrQ1RPSGQrNHhWTUdDNEpTTVl1bjU3Tkk1M2xMVG5B?=
 =?utf-8?B?K0dSam5JWENsRzZMN0grc1dzZVFvUEc3c3lTaTVobEtFQzJYYW4wd3V3Zm5h?=
 =?utf-8?B?WUl1cmptNXl3Zmo3dkNuREZqZFdKWUYzUytZOWk0ZW1ReHBFUU55SUN1YXhX?=
 =?utf-8?B?STI4Myt5dnhSNjdsWkkrTDc5cEJQYjQyNFBqYWFuMlpnaU1yZ09xVnVrYUZC?=
 =?utf-8?B?YlRZRWZqR3RKSHc1YjdRNERPaWdwTGo4N1YyaWxtQ2RyQTgzdjNhSjVJZm5T?=
 =?utf-8?B?OEN5ZVI0c1JVVTdPVk5CRms1OG5ZYzluU2lxOFBSZkhlTDdBY0hIZU44UkJQ?=
 =?utf-8?Q?CZZo=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:18:20.0777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4059b632-d699-4e39-accf-08de51f63381
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 16:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229213

DQoNCj4gT24gMzAgRGVjIDIwMjUsIGF0IDA2OjQ4LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gVGhpcyB3YXMgbm90IGFuIGlzc3VlIGJlZm9yZSBsbGQgc3BsaXQgZnJvbSBj
bGFuZywgYnV0IG5vdyBpdHMgYW4gaW5kZXBlbmRlbnQNCj4gcmVjaXBlIGFuZCBuZWVkcyB0byBi
ZSBicm91Z2h0IGludG8gZGVwZW5kZW5jeSBjaGFpbiwgb3RoZXJ3aXNlIGNsYW5nIGZhaWxzIHRv
DQo+IGJ1aWxkIHdpdGggLWZsdG8gYXMgaXQgZG9lcyBub3QgZmluZCBnb2xkIG9yIGxsZCBwbHVn
aW5zLg0KDQpDb25kaXRpb25hbCBweXRob24gaW4gYSB2ZXJ5IGNvcmUgdmFyaWFibGUgbGlrZSB0
aGlzIGlzbuKAmXQgaWRlYWwsIGFuZCB0aGUgY2xhbmctY3Jvc3MgcmVjaXBlIGFscmVhZHkgaGFz
IHRoaXMgZGVwZW5kZW5jeS4gSXMgdGhhdCBub3Qgc3VmZmljaWVudCwgb3IgIGlzIHRoZXJlIHNv
bWUgZWRnZSBjYXNlIHdoZXJlIHRoYXQgZGVwZW5kZW5jeSBpc27igJl0IGVub3VnaD8NCg0KUm9z
cw==

