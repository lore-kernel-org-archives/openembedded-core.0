Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B940EC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 13:25:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web10.20741.1747747519907944349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 06:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jY9Oscl1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jY9Oscl1;
 spf=pass (domain: arm.com, ip: 40.107.20.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DVVqcX1ASiNAF4UIJ8hKEzJJ6+Q3SWOO4oSeW9vYoU5Gbu8O2uxlHPAhDPJ7U3TSlLPWyFLV/g33ltifjuxb6aqdV8QImS9Y9MK5+hnfvA+6yIZ5WOfOPBldFebPuPWzpxE3kMAR3iXelBnIzoyWy8XBfgfbIgXHdEXExjdntbC+d1H5A4X3nnvZbdnF0ljPKl9KKwZPfNVQjxiSl/fPvvhdgIAM8y/doiP0g5K+RcSeI+SiWHwySek3yN6IV5+UcY80NJY0UojFDnhJslHF3ACv/3FQLcn0WqZhP8jjCPwwNRT4M8PB0W4L/bFmsMQJ+qQXt6cBY62y0aoPci6zow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NoprcofIPwajr+ZmVs+IrqGy0mz+vqZLLRXoC/iTp4=;
 b=zSkbXKbSz2KgM0kXSUNqqw+hSIHxX/zpw8NGig6B/lDOnBjoj0/SYWyceppI43/sXMTUk9bT6nCdmpbLrDHryD2oDJ4yfTIM31Os/Z+3fLg2wajb2h3utgbI12EdDOBwRiyAESqSl+wtipXVvscjqWeuv1StJXzVNM2VXPvuPbph9jPkc7mZgV6OWKfOhe8jrMgiNWnfImYzdb3rLA/kt+jO/HoftuoA51EibBZhdDvmqjQuYFzg8w8xHDlbHa/issnCeAhPvKNMGvOHo6Uc7f/T8x5RUNtxemML8hctrO12ke+GloD5P75RvUUe+Ew79LedjGEs9S85ol0COlF69g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NoprcofIPwajr+ZmVs+IrqGy0mz+vqZLLRXoC/iTp4=;
 b=jY9Oscl1ybuPwAlvK4+cUixdOsMLS6R87xk3HyrueGcpooY7GkDLpC9sWfGqJGD/23whQKVXT/fCnUxNgMUca3qyBggCi1x4S+U7gBj1VH7ZjFloYJTAQ8JKwcbiWG5ljuhM+LQJCO+o+gom8Yc+dubXtYMnj5OYcnLS6eAM220=
Received: from AM6PR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::17) by DB5PR08MB10095.eurprd08.prod.outlook.com
 (2603:10a6:10:4a1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 13:25:15 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:e0:cafe::7d) by AM6PR01CA0040.outlook.office365.com
 (2603:10a6:20b:e0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via Frontend Transport; Tue,
 20 May 2025 13:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 20 May 2025 13:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4nOcxRY9ySmEhpbcV2TrX5N2fA5AYksLRS6Xc8FiUpeUax7qDPyS6gCIJ+bbxOgg8AXIGsdO5QrGJUWQEESXHBQHAKKVNjHvu3KZyyJgFH8ls5fBGq4S7s2GxmW5NcSmO65kWlCpHs8XxAeDmTTC+YL7HSsm06ZxTH7R/NrZMdMwAuzvKugra2RvPQ4/SKRbwGaCRdrmLVEAUDrPanL+e/z0fwqz3T63gxtPm1Vju/AmqtcaakXTLa8QN9vRymTsVEIGAVnMBml70VNbzVaqFkzSXBTcnn2BqiDJajQj0eCY7M46Jmex1iBduUSXW940BdePrfjbumAxjabaB/qug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NoprcofIPwajr+ZmVs+IrqGy0mz+vqZLLRXoC/iTp4=;
 b=H1mJl4VK1X/aTxJI3tKFMxlkpKbCKilwvMdJ9HHPQJXh5SYPJDE/1Ha/AqFrmfFfXf5XJ4etVUD26Hs1kDVRErY02Zt1S4QjV76ypWjUrjjbsYvkMAro/NzMr88DVOQ8sZSTg3G4d/uVLkMbP5c1hJjJi7mc1jVF06ESyb0AzVnn1cUbvwDMIyg/TzacVSvP8pjuRBrfS3n7pvbHrFjdAP3lD0R5ZP6zITQxYMMQcERctNpkOeLROahq2r7ZYms8DQMwuh1XpIM3n9jPdNRxeLDICmDbrd7BZ1WjIy5ZdWOMXzZAZZuoHtSwxBozeQ2nVK94xDUd8WIKL5kZREv5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NoprcofIPwajr+ZmVs+IrqGy0mz+vqZLLRXoC/iTp4=;
 b=jY9Oscl1ybuPwAlvK4+cUixdOsMLS6R87xk3HyrueGcpooY7GkDLpC9sWfGqJGD/23whQKVXT/fCnUxNgMUca3qyBggCi1x4S+U7gBj1VH7ZjFloYJTAQ8JKwcbiWG5ljuhM+LQJCO+o+gom8Yc+dubXtYMnj5OYcnLS6eAM220=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9220.eurprd08.prod.outlook.com (2603:10a6:20b:5a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 13:24:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 13:24:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] oeqa selftest: read qemu options from
 TEST_RUNQEMUPARAMS
Thread-Topic: [OE-core] [PATCH v2] oeqa selftest: read qemu options from
 TEST_RUNQEMUPARAMS
Thread-Index: AQHbtCro8v3N+bIRpk6sOiNo++t2o7PbazIAgAAZCoCAAAMVgIAAI2uAgAAB94A=
Date: Tue, 20 May 2025 13:24:41 +0000
Message-ID: <7A241F87-9B71-4207-A97E-3777C67D683C@arm.com>
References: <20250423083634.137495-1-mikko.rapeli@linaro.org>
 <56ae50dcab799e2db27c7e423c5533546fd6ab2b.camel@linuxfoundation.org>
 <aCxgnSnv92n8b30e@nuoska>
 <2421d5a01486a5b15d056d480cb12026aa5024ac.camel@linuxfoundation.org>
 <aCyA6YrqUnlgEgPX@nuoska>
In-Reply-To: <aCyA6YrqUnlgEgPX@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9220:EE_|AM3PEPF00009BA0:EE_|DB5PR08MB10095:EE_
X-MS-Office365-Filtering-Correlation-Id: 330dfba6-c7da-4b73-bc8c-08dd97a1c1f7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?S09LV1VZOWtEMXRxaUx4d1R1U2Z2aERXMENnKzJDK3BRMzVoVi82dDJTblJx?=
 =?utf-8?B?d1FrWStCSFFGbENsUEs0a2hyQU5KdnQySW5xN0hmdkJnTFNmb2dmZ0xEYnVx?=
 =?utf-8?B?RFNQcjZQdDVVSjREajZaYmQ0VVl6RDdmSkdEMzR2S0hOWCs0Q0VyUDlUVjkz?=
 =?utf-8?B?Ny9Gb0szTW95NU5MUkdtSUtaNVc5a1ZVVkl4MlA2MDdLYUxEVHE2SDdPcXVM?=
 =?utf-8?B?elh3QVJSYUdVZjVRSHEza2NFNi9naUdDQUg2NjhnTjRGOWUxT2pOOVNVK0x6?=
 =?utf-8?B?Mmhobkl5cUY4M2dKRmRPSXRabmNvR0NJU0UrWTlWTTYxS0RpYXRwaExmQ1l1?=
 =?utf-8?B?SGM2cW4wWTcwMk9ySkZpeWxGT3k2eW9NZEM1R3dWdXZqV0FZMXpEdGg3VytL?=
 =?utf-8?B?MFBJcUJ3aTJ1VW1uZEk0c2gyRDFnUzVOVXVJUjZqMUlyTE1VaE95L3hJTDRV?=
 =?utf-8?B?ZFVOd2ZlekxqbUdIUEF3UlhuVGoxbW1YU1l3aUJXL1FHMldRTXZ0ZUtDSlk0?=
 =?utf-8?B?bnlyekpLbjNKZ2w0OFExWHZJbmZ5S1draHBTSDVTUnJzaTliVExGMUFmd1Zh?=
 =?utf-8?B?UTEweUZVcVlsYVh0NUUvM0kwRU1JcmVnZ0RiQkZHVGFMbEgxODgrRnVYOFIr?=
 =?utf-8?B?MEtXSmtINXlBNFg2a1FuaGQ2aUpFSTFkNHVoM05kTVNBZDBiZi9KMkdHVGt2?=
 =?utf-8?B?MDAyeVN0MEdQbzk2N0dNSzhzQ2IxSHRreWU3eG41VVQydnJXVXBXalVUcnlF?=
 =?utf-8?B?UmozZzBDWmlUTjZuQUxMTmxwcmZSZ3U0MVhwOWQyZFVGczRCMElFOFpndjdK?=
 =?utf-8?B?WFp4UUdySW4wOTNGeks5ZVdQMEdXMWVnNVhhdmRsdlZVWFN3OWVqK1FrWjBZ?=
 =?utf-8?B?Si9uZGcvNU5uQVJUVmlqMlpVYzVrYm1lYlZOdEpORzhGajRlMzVwSU40SDRk?=
 =?utf-8?B?elZDMW9jSlVtR3I3QVFiT0VIaktFQ1BIaWlRRnRGbGJ1THBpU3pJbHgyZHFC?=
 =?utf-8?B?bG9ZdlBWWEtTN3JTQzZreExpMHVKRWZmUk1XRHcvOGRBVERrRXBEdCtLWXFB?=
 =?utf-8?B?MFJaMWN2Vmp3R2xFemxLRjZ1QjVkNHFnR0xoNUt1dHlSQ080TWlNTVRVdTVG?=
 =?utf-8?B?aEZ5OERLNFNGZVZiWG1Ya3pCbnRVRG9BWE5uclRia2V6MjUyMnlld0hHZ2RC?=
 =?utf-8?B?M094R01LbS9GSEtVWVo3N3VabGZIUlRFOCtnemhHT3JnQnpUQ3NPQ0xZMVB0?=
 =?utf-8?B?ZW1FdklTYnc4SVdNMnhwL0czbjlZT1VEM2t0bGhVZU8rZzN3OTg4bTlybm1L?=
 =?utf-8?B?cXE2Tm92aVhUV2Q3ZlNrN2JIM0ZrWE9MTitBWHdieHZlcWRSc3AwM1NqUTRi?=
 =?utf-8?B?Qm0rd2V2VTc5c0duYVFLb3JxUml4MVR5dFR4QjRKNUM3YkZTaVZlUTNwbFVx?=
 =?utf-8?B?ZC9ocHBYcnNFYTJVSndJVkNKakU2U0xnUHNtclZGQ2o4SWFKYjk3VzBjb1hh?=
 =?utf-8?B?L0dTR1Q3d1d6RVdGTWNtQmRxYS9VeGw4ZTQ1UEt2ZWE4YWNzVFQ1TGE1a0FO?=
 =?utf-8?B?aHN1cXdlMFBqTEtKNjl2Q2NJblZKRGNmUFljcFhCTWpmNm5jZTZId0w2WDRF?=
 =?utf-8?B?QlAxL1Rjb3pFZDBmNldFOCtoL241WW9ZZVgrWndXUlBHbGtZVXc2V3loaGVR?=
 =?utf-8?B?a0NodDZHS3BKWnQrSW43QlZKRUttMnFTVjgwbklscGs4WlBoQ3l1SG03K0xr?=
 =?utf-8?B?bjR5NGhab3JlVE1CTjVLK20zNHVMcmhRR0VSWG1UeU8vRzFYdUsvbHUxVHVH?=
 =?utf-8?B?TGxnK1BTTjl5SHhKUnA1TlN4RlQydnJpZ1g3VmpSa3dxOHFBM0oyMlBpb1FD?=
 =?utf-8?B?WGJCcms4ZU9OakROVHBKbzBpRWpwb3dBb2FuQjJFazVBcXVkZk9LbjNSMEEz?=
 =?utf-8?B?VGxGcithRTdFemhkNWlyWkNGVU5JVEhpTVdpUFUwRGdraWgvNW1XVkYrWWYr?=
 =?utf-8?Q?iL5ezjC0ysEbNpJUmvuFKzr9oPXPg8=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <56C115FBFE750449AE24C6850924BF17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9220
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	648dac53-87fa-4aaa-efea-08dd97a1adeb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|36860700013|1800799024|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T09qeTg3bjlPM25JeFh0NzdZeWJFQ0RkVmJxQ0FnTkhabmU1dEpibVU5NDBD?=
 =?utf-8?B?anQyZ0psd1RhQ3NBL3NWUXMyYWRJUXRJdTIrMmViTkhwTk93bFdrK3JXQXl3?=
 =?utf-8?B?ekFSdDE4S3dsVTJlMHA0R3cxOGJSSndRUUhReFJ6Z054VWZZK3Ezazd6OVBO?=
 =?utf-8?B?QW41UGFNM1hKemw5NnJ1ZVlSVmdwMjlBbGE5VGxxQUE2UHp3OUtVd2FkWVZS?=
 =?utf-8?B?djFLeDVCcTdQQjlsQTNCeTdFa1dxYVpHVW5MT3NKMjNUckRkVE1JNGlqOWc5?=
 =?utf-8?B?YTRtUGkyTEFFTlVkT2NybXBqUy9CbGEvVUpucGh1K2cxOFdxaHpEbGtPWVZz?=
 =?utf-8?B?Tk9iNEhHdGQ4NXpWdUlBMFBSMTVYZkN1b2FNNTAzdFozSW1PV0NVbTFPV202?=
 =?utf-8?B?dUtoWk1jZnhaaXlETFlranpyK0EreDRJQnpPbUdCTXJaZWRyRXIzVWhpaHRw?=
 =?utf-8?B?OWZiMnYxVThlRldhaHFUdVZrTnp5UUR5M2RKRTZQNmVmc1o2UXVMN3hZbkYz?=
 =?utf-8?B?SnQ3Qk1zOCtRcExWRE9NTW81RGpUOUQxRkxvcFprcFdJN0UvYXowREZnVzNU?=
 =?utf-8?B?azRMR1MxdUxVdGFJZElJVTArblZ6MS9YS1VVQ2g4L2JiZi83cXZpeS9nRlVY?=
 =?utf-8?B?R3o4dkZ3QjhOWjczM01rK3dCL1pZU0NkZjNPVm43V09GVjB3TWoxSUl3eStC?=
 =?utf-8?B?WnpmSDB6MkJUVHJCM25UUVMxWk1TcGQyN05iY3FxOHFpQ3Y4UmMzcDJjVm91?=
 =?utf-8?B?NktPQ01UUDBHNm9LaGRKbVRrcnMvRmJ6Q09tclMyeFl4YUUxSW5EWk5sQ2kx?=
 =?utf-8?B?WkEwSVpzNk1NUEVZM0RrVzRrVHJ5WW1qTlpjQlFJSkE0aUh2aGpjNS90K1Q4?=
 =?utf-8?B?amVXYzdpSW9yc3hTS1R2QVAxYlA2bUFqQ1JkYlpDUUFkZURxV0h0bFFIaVNY?=
 =?utf-8?B?V0tYUE9LOTdqeUNWUjRKR1Znby9vUjZ4WnFYNjY1dFZzK3hHVHBqTHNhbHlF?=
 =?utf-8?B?Nml1ZGdtTnVoKzBOMUJxODFjaTFpUTR3a1hhWTVCYVNpd1dhT1hESUdMb3c4?=
 =?utf-8?B?czJGbDVIYXFsVVdaWFRqUEg2NGh1Tkt2U1ZTR0RZZTBIZzFtWGlYS0cwWmVG?=
 =?utf-8?B?aXVKZ2gvdGRWZWhyaTRXN1FtaWlVaTZ1ZFBPQnVCemdFNTNvVXBwWkdlTG5L?=
 =?utf-8?B?Yk9LTHVuZ1FsYWRIa2FXRXpJNUJHSk1NOU8xSEsvbVplR2VWVTFOT1Y0S3RI?=
 =?utf-8?B?bi9QcHl4WXozUjVWZllyMWFjQVlxNDNhbjg1djhvRFBxbGttMXlxeHVJbGtV?=
 =?utf-8?B?cm1LaG5tS1RSQURkM0tFMWQwQnB5cXlGQ3NFYzNWL0NwR3RHSDcxenE1ZWJC?=
 =?utf-8?B?OGZoME9jS3llSW43d1U0QUtMWXpiL25DOFM3bnY0VUN5dHcyczRYUzJ5T3JQ?=
 =?utf-8?B?SEwzU29ReVZYeXFveU81cU0rWnloQ0pkZWRKUUZmL0lJSFBBV3RHelcvbkg4?=
 =?utf-8?B?cmY1bEVIeTMwcEVKbHZFYnNiRWNJMGdlZjhKK1pxejhuV1ltUmRJYStwUnh0?=
 =?utf-8?B?NFpHeWRoOHpXaU9KcFRZV1VYb2pTTHlBZ0NmMXFLaThjQVlCRkRudm9xNHpH?=
 =?utf-8?B?eitrYUMzVFpiOEQzUUJxVmJ1WWl5WkpsemdtKzR6QW1TdWtydTN6MldWK0pq?=
 =?utf-8?B?Wkx4SkdOU3VmY21PRi9OcEFoQzZKNHFNL2d4WlFUVTJBSTE4ZnZxWmNGaWl4?=
 =?utf-8?B?dkVkdlZoZE5LbTNKUFlVZEFmczhKL3FjeXlwUk9BN2QrelUzVVB4MjNRZ2g4?=
 =?utf-8?B?TGI5K0dtWkR5ODNvSkdsSVd1ZkJVb0MyQjJMUlg5Umt3ZXZpbHRJZXJOUVBH?=
 =?utf-8?B?YXhzVmR2NmtqR2d2L2dVUjJ1T0tsK3JETUYwcndpbno1clc4K2hqcXo4aDQz?=
 =?utf-8?B?cmFIM1czZ28xOENjY3EzeXEvd3k0SmpjWW9wNnQrMHRoek9xSEd3cnk5cS9M?=
 =?utf-8?B?bDQ1VVZiRytUZ3JMMFZ0dkhlUFlwN3p1M0hzT3ZyQ1pBM0NjSm5rQnNON1FE?=
 =?utf-8?Q?SNQ1+s?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700013)(1800799024)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 13:25:15.5342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330dfba6-c7da-4b73-bc8c-08dd97a1c1f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 13:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216913

T24gMjAgTWF5IDIwMjUsIGF0IDE0OjE3LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gVGhlcmUgYXJlIGEgZmV3IG1vcmUgYnV0IHJlYWxseSwgZ2VuZXJpY2Fy
bTY0IHNob3VsZCBJTU8gcmVwbGFjZSBxZW11YXJtNjQNCj4gc2luY2UgYm90aCBydW4gcWVtdSBh
bmQgZm9ybWVyIGFsc28gcnVucyBvbiB2YXJpb3VzIG90aGVyIGJvYXJkcyBhbmQgaXMNCj4gYSBn
b29kIHN0YXJ0IGZvciBkZXZlbG9waW5nIHByb2R1Y3RzIG9uIGFybTY0L2FhcmNoNjQuDQoNClRo
ZXJl4oCZcyBxdWl0ZSBhIGxhcmdlIGNvbmNlcHR1YWwgZ2FwIGJldHdlZW4gdGhlIHR3bzogcWVt
dWFybTY0IGlzIGEgbWFjaGluZSB0aGF0IGlzIGV4cGxpY2l0bHkgYW5kIHNwZWNpZmljYWxseSBm
b3IgYm9vdGluZyBpbnNpZGUgYSBxZW11LCBpZGVhbGx5IHdpdGggS1ZNLiAgZ2VuZXJpY2FybTY0
IGhhcyBhIG11Y2ggd2lkZXIgc2NvcGUsIGFzc3VtZXMgU3lzdGVtUmVhZHkgZmlybXdhcmUgYW5k
IHJlYWwgaGFyZHdhcmUuDQoNClRoZXJl4oCZcyBhbHNvIGEgY2FzZSB0byBiZSBtYWRlIGZvciBt
ZXJnaW5nIHNic2EtcmVmIChmcm9tIG1ldGEtYXJtKSBhbmQgcWVtdWFybTY0LCBidXQgYWdhaW4g
SeKAmWQgc3VnZ2VzdCBub3Q6IHNic2EtcmVmIGV4cGxpY2l0bHkgY2Fu4oCZdCBkbyBLVk0gd2hl
cmVhcyBxZW11YXJtNjQgY2FuLiAgRnJvbSBhIHBlcmZvcm1hbmNlLW9mLXRlc3RpbmctdXNlcnNw
YWNlIHBlcnNwZWN0aXZlLCB0aGlzIGlzIGFuIGltcG9ydGFudCBkaXN0aW5jdGlvbi4NCg0KUm9z
cw==

