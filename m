Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C46C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 12:20:13 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.65])
 by mx.groups.io with SMTP id smtpd.web10.11198.1753186803769727944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 05:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SzL9QWK7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SzL9QWK7;
 spf=pass (domain: arm.com, ip: 52.101.84.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=L0b9eBPo+vimPeXnypLamSPA3sGScj/UjH5Mmq1twE/7DQZJJxuJfvC/Fyd82PW+L9evKTWBvgqX8aQ5lxb2Ao7Itq6lTky9m9wfK2L8GlXAMHmmf0pzMMK/PAulj4mmXuJB+H24A16r5WfnIWqA8WDJAUEiXjB4hrtakuwquaqBfoUolOcJB9r2TJB9C4vwrvxEv+K81y3phyDS3eWptGafJ26TofcZuP45LSwiDyc5DnbB7LdiC0Mxc2UMcA7lTt0EcIv+DSqwLSAV2h/YB0JhYqo4mEooSA3ygEcQf+Vx2bNTGm3M+FmvBu6L7vY6zrbaH5pYD04dO4Xszj8rlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIf/vqMLzjiXMffQKwmlvb8SR81B979p/jL00apk214=;
 b=Vc4mjHRCT8bp7fxTnWsvK2t09dqFtoHH+MRe3LDvKrpwlLrVV9OKyDMgZZR86iHxcbAyPswXFPgoyPrkBMky2HkQ/yA/nf6W5tNW3LE1DUBSl9uFjZtVeg0FO0ad7dDjTucuVhBKqnLST4gV17DG9nw0eXBOBA6KBf4BlhEeCfhFXCgmOD5Uw2+Os8zww6UisTAn08FJYw7m0pxDLKfMADaXCAZ18038NFEKy9sNX8YkFpGp1y+WzDwRijgjy6GF1j5xWIE7NH3TOuwxHwfjsyfpMv50ggs7JrREYhbCZ2ZRUeJNGypbyE5hhYmSwQzK7HTl/QlyUnYZ+qWUA15/Yw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIf/vqMLzjiXMffQKwmlvb8SR81B979p/jL00apk214=;
 b=SzL9QWK73jLmnFYVJSI0eoy6wAIphuVEF+wdT8pzxsPTGRQjKO7f8UWoFkhgLqX1bZoJJkl/z7VV6kPahYNUO9H1zczO2rEQeaauAsSgmpxOXFNyEYH+0ikmw/sIW6gfheOhYsnpllOv2SiqYOwoUWeHzXlXnI549N79z/0PP4Q=
Received: from CWLP123CA0171.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::10)
 by VI1PR08MB5326.eurprd08.prod.outlook.com (2603:10a6:803:12d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:19:55 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:400:19b:cafe::7c) by CWLP123CA0171.outlook.office365.com
 (2603:10a6:400:19b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:19:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 12:19:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSkOKPEVhEiVodF3N1kauxcdXbtwfVNVnLMD7+o4x8EceV+gl2JqTi2RP5Kb49UVOhmrniXbR44UvizFVqEnQrMokbWW0OJhJtstWgY1WQ1PlzuYfhyHMhcFVsbxMb0ubFuk2ju2+/ISz4fc1iIuxIzy3Q4kRaV/WTcbDMqydSRnUpg9BWX7HPTYOuBgPSCktFZCaH2D8+Rdgi247jrN2N5QqNLPYpx3an0pnDWByJMB2PuxbhcCv/mpgXplxnlNNwXcy1aY5G4eexsKLttFAsbnp0A3pg2L6hrdtYesZKmzzTPED1CYRIb8ljeeNY6szYEZO/QLvuDDUiEuxMK04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIf/vqMLzjiXMffQKwmlvb8SR81B979p/jL00apk214=;
 b=jO9KfWb/JxD2LNqu3RLL/Oq4z3Z+lVPWMlLaFSdr7x6KK3gGt/Pza6Js52BeYR4QvHF/9b7wg4iqCC8VP0L9xzbTitd2XQh86TnDatnCRp5GMcWCMhVWnhTrsOgpYGNr59lVDkw+ZZo9Kb6gjIirdixhEM5ecMuh88FB4czTzDzN46x74vd8OBo6zLAmEFHrVaUv4/bvWDd6R3euHpnZ+NfeftgxRzTOnQITeknKTwexkuOxPzeudq1CLra+rOhpsS8rhfmrEIs0UOO0xppvMm95E/g7yOCZltPz4kCJwJHMNtzfFNHGb04ec3y0HPhesztdBOXP29xl3L98rryJ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIf/vqMLzjiXMffQKwmlvb8SR81B979p/jL00apk214=;
 b=SzL9QWK73jLmnFYVJSI0eoy6wAIphuVEF+wdT8pzxsPTGRQjKO7f8UWoFkhgLqX1bZoJJkl/z7VV6kPahYNUO9H1zczO2rEQeaauAsSgmpxOXFNyEYH+0ikmw/sIW6gfheOhYsnpllOv2SiqYOwoUWeHzXlXnI549N79z/0PP4Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7871.eurprd08.prod.outlook.com (2603:10a6:150:17::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:19:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 12:19:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Quentin Schulz
	<foss+yocto@0leil.net>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Markus Volk <f_l_k@t-online.de>,
	Trevor Woerner <twoerner@gmail.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH RFC v2 1/6] mesa: move PACKAGECONFIG defaults to recipes
Thread-Topic: [PATCH RFC v2 1/6] mesa: move PACKAGECONFIG defaults to recipes
Thread-Index: AQHb+ir1ENF1oeXfakSMROC6sfl4p7Q9toWAgAAo9gCAADHTgA==
Date: Tue, 22 Jul 2025 12:19:17 +0000
Message-ID: <9A05F4A5-D250-4BC4-8D1B-7C7F57F96223@arm.com>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-1-f713d0858949@cherry.de>
 <5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn>
 <91998d10-a656-4ccb-bcf8-2670936b0d09@cherry.de>
In-Reply-To: <91998d10-a656-4ccb-bcf8-2670936b0d09@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7871:EE_|AMS0EPF000001A4:EE_|VI1PR08MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: 203fcc6e-8870-42f7-198a-08ddc91a10a7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UjRKSUtCZlA3T3FHaVk3WFd2SjJaQWQ5TUVDWXBiSU1YSzJ2T25RVFQzVnAy?=
 =?utf-8?B?eDRRb1FaSTBTRVNkSU9HWklkaEYzU1orWDVFUHhGVkcvL3ZZdUNQMHhDeVVw?=
 =?utf-8?B?WlM3V2M4Q0xEei9JaFAzMVhaMEJRTk9hZkJ4eGd2NXRWSzl6cVcxa3dVc3oz?=
 =?utf-8?B?bWozdTI4WkNuQjd4Y29aVGpKdDF4eHVOeGtmbTNYV2tmaE52YTlZOHk3WjR2?=
 =?utf-8?B?NzlidldOMmJ1VWN0TlZWQVdNZjlKQ2JpUTN3Yi8wVUs3cTUyVDNXTTEwQ3pa?=
 =?utf-8?B?cXkybWdJM2lzNHFFWWxFOWMrLzNNazNidU1jdnFoT1o0NmlKck40L2l0d21T?=
 =?utf-8?B?bnllNjJRNG5VRW00dmx1U1hzd1ZrYzBXS2h0cnFWbWtMMGVpbkZZNjh2REJn?=
 =?utf-8?B?c2lpL0JnT3NrcmdYTW9pQXloSWowWWo3VDBuejY4VkVCZGlBS243RlIyT2Fi?=
 =?utf-8?B?RGp1c2x2VjI0cmFaK08wY3dJTzZWNzAyUWs4ZGE3OUpic2QwV0FQTmZ5RmE2?=
 =?utf-8?B?L0dOakdYN0hnVlk3cjdFQVdDU3hPb2pjQ09sYkNGL3BpRm9EeEFPTk54b0ty?=
 =?utf-8?B?dU8zSUI1dDhUcDR6bFVUMk8yZ01QV3JkM2JsMlgyY0xTK1hrcFc2dG1pS2l4?=
 =?utf-8?B?N0tYOWZWeWpsL1NjcmRMR28rMmFBcVBnRTd6SGNUUzV4eUNlY0h4cnBNQ2ts?=
 =?utf-8?B?UUJMVyt3Znh4ZmFqbjUvWlRUKzRRbUcyZDJTd1dFUEMzKzhFV2pQYmkwckRu?=
 =?utf-8?B?b3U1Z0FEcWU5OHFBdVE1TVdRNXJHSlZibmtoTGIzL3JZakZ6c3VCcmVYWEhw?=
 =?utf-8?B?SXN0cnlnR21ocUN2V1VpK0x1RGRTckZ6ck5KRm5mdjhVdDZLMldjc1liaXQr?=
 =?utf-8?B?Ymdaak0vYnJlSUFSODNuSjBpR2UwaUVWeEN1VVJUdGxJemx4elZsVllRcHZB?=
 =?utf-8?B?aUFSV3orSUNwRTg2d1hRNHc1ZnZQRXZtcjdoTy9iTitCQWRmZHc2a2tQMCs0?=
 =?utf-8?B?TGNPT2U1dnc2MWhLZnV2WVIyUzl1MTB4R0VOYnFEL1hoNFFLY3dNa1BJVjUw?=
 =?utf-8?B?bkFxL1l4eDNTcytiM2VqL1oyNG9yQTFPUVRnc2xxMG8zUVhYb1FsQjVPYnk2?=
 =?utf-8?B?aVIyNlExb1JHQ3BTUUQySU5sMDZSeCtwNGZNSnQ2ZnIzbGZKa1JwMUpLdXNx?=
 =?utf-8?B?ZDAyOXhlbG1IK3NzeFUyeGY3NjgzWFBhT2RpQjdsZG1ieWxxRks1L3NsdlQ0?=
 =?utf-8?B?TVA1eFhnU2U5eUx3MVpFQzJtMk9PdlBkeVRxZnJBYi9KTmZ2UVlOZk54WUdV?=
 =?utf-8?B?SmJXM3V1QmU3T0pvK29QNFFJNjgveGUvS1hKLzV6QzlyVmdzMHZ2S2tqYjlU?=
 =?utf-8?B?UU9sNEphQ2EweTJ5ejhGaUE3aUwxalI0cDZCTUhoNTRFVHJqWkVUQ2p1N0pP?=
 =?utf-8?B?Y1Z6SmZpNkVaYUsyM3pwQzl3MGJKWG42WEVJcUY1Wm9oU2lEMWE0ZlB5SHZB?=
 =?utf-8?B?VXR6NW1LNFcvR05LejNXRllFS1RISzlNQ2p4bHpRNUxKRTRBZWR0SXZrZXl4?=
 =?utf-8?B?a3FpL3JROTZPN2xObTVoMUpYYmVGTkdPeURsZjVCOGV4Q2JmdHh4Mi90OXRr?=
 =?utf-8?B?WnBTbi9pcyt0VkRWd1EzeDQ4UUlXWEV1enlmYmNIQ093TXcyYkRBWTVuNHp5?=
 =?utf-8?B?VnAvOHk5emxxQVhvQ3N5V3BmU1pBQW9yNGFPMVUxYzJsaXhuUS9RUzUxOXRK?=
 =?utf-8?B?dldqVjhLeWZHSW1UaU9TOU9kTGRoMnhSaUIzRTgvU2hGUUFuWDNPY0RWQmZO?=
 =?utf-8?B?ZGhhbk4xQk8wVWFBaDdOMVFmVk51MVozNGIrbmtSY25kMW5INjFUV1dvaDhy?=
 =?utf-8?B?eXJlRThGa0Y5dkVFNWVaSXl4RmFnSFR1Wkp1eVdHa2FBaHg4ODd4Y2xRd0VR?=
 =?utf-8?B?SUR5WHgzZklENDZaVlFBVlhZWW1TTmRNWUZIQW8yUDV4cHZ4THM1SHZ1emhw?=
 =?utf-8?B?TWJBOSs5N0ZBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A2D75D85E5D51458664F46ACB9C7C10@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7871
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4b0c78d4-3853-4f07-3f98-08ddc919fac1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|36860700013|376014|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0ZOMnFqRGord3VhNlVSWTMrdk9mOTFVZG9oWTFhNTB5eis3VW0yNVA1a2tm?=
 =?utf-8?B?eVgzclZ4TERDeXREOVlYUWQrV05yUjFDaVhmVEVDN3FjV0ZuYlN3M1FNWUlG?=
 =?utf-8?B?MkxhZ2dGYXU3d2pCN1hucGtmSk4vYUpuZ3UrQ1hTSVFQMmZMSmdOQ3VKMjRq?=
 =?utf-8?B?aytqVEhkQkZOYlFuaWZlS0FsTitFclZLcll0RkhFMmpETkJaTG90QVVmZGNW?=
 =?utf-8?B?L0ZKQjVRaXFBRFpkTWhCV05OaVR6dXg0amlqTWRRaERKOVdUM0FlUUxJakhn?=
 =?utf-8?B?MmRpK2xNUVFOblM4WXZReFhSZGExbElkR1dBOE16c0VqYy9OeGI2R0tySW9m?=
 =?utf-8?B?VmlIdUNGM2VjaTJvbzBLQzVWSDFEWUd1dkNMN2VxOUo0SXU1WDNyT3c1Q0FF?=
 =?utf-8?B?LzVSZVp3bEE1SFRNeVAxLys4S3MyUm9teDczdXpsZEY3L0JUYlpvdVMvMk9p?=
 =?utf-8?B?Q1ZQT3hOdkRTSzRET0l3SXRuaVUzOXdwK1J3NFpkb2JOb1dKdGRIRUdidmQ1?=
 =?utf-8?B?WDlnbzZKSzJleHRrZXIyU2V1R1hJTHlSNTY5Uk4vYzBPeEhhS2hTKzVFTDNq?=
 =?utf-8?B?Q25zd1kxcmZvbVlFMU02Wlljck5wTTFJSEJOdjFxbjU1Smh0Njhpb0J0K3Iv?=
 =?utf-8?B?R2VZLzBSanRqYUsraU1UTk4xbTdTK2YrazhraHYxaDJTVEI0OEhwYWU0RjdF?=
 =?utf-8?B?TlZYTVZGQm84T0M2NGFWVFg1eWhlK0FUdUJ0MVFRUjBtSkpVQUJJTlRXQUta?=
 =?utf-8?B?Nit1MHcvYVQ1bmNWL2tkOXdBK0N3SWMvOFlCWllKc1VGSmtCOFZ4L3Z0UDEz?=
 =?utf-8?B?R3ZDcFFxTEYvSi90T2hFY3dVU1IvSm9rb1pidmNyWEp5eGZpK0tvRTFsVkYx?=
 =?utf-8?B?dlAwR25NQWdlcllRV3IyNEhUNWlzTE9hQXMxODRHNEVJU1ZNRXRpMUo1OGRu?=
 =?utf-8?B?b0YzSEVDMkN3NkphVGtFVmU2M1ZNU2J5bFA1RUh4WFZIRnhibUNyM01CQUxr?=
 =?utf-8?B?aWNweVRxTnV4TlpYT3BIaXpjWWJoOVd6VG5jbUMwOXk1SmdtYW5MMDNJbE5Z?=
 =?utf-8?B?VkFYVnVWR0lHbXBKcHRyeGRoWCs4VE5UcmNaS0pkbzFiaGVzSWZ2N0ZoNDRw?=
 =?utf-8?B?TUVTMG9zdXhHWXdaQkJxT2JkS2Z6K2xWVm4vLzBpMjlNdVJQUGc0Q0hFK1VU?=
 =?utf-8?B?TStVV0NaVXFYQ1dhRGVFTVlDMkgydElPOGt3WDZKc255dzVYYWxaZmt6dTEr?=
 =?utf-8?B?c3Uvb2VuRWhPelc0MkNOcGcyMTdKYndnamhsOE9OYXFxTy9qVUpjZjJRdEZr?=
 =?utf-8?B?ZHFtYkNjZ3ZlTzRZL3dYU1JmYWRkVkZQWG9Ib2JTUTZ4cnhDbThTVHZzUmEx?=
 =?utf-8?B?VS8vOVFzUGpJM0hlcnhScDU4UU5UbzRoeWQ0RmVRWm15N0FFVWJGQ3ovaito?=
 =?utf-8?B?QjNNQjF5RFVjMVA0ckJKTkFOUVdteGc0Nk9nQlplY1BYMWRSSmkrQVFqM05p?=
 =?utf-8?B?aU1kbWZmL2paNzRscHhWQXRkOURrY3drSE9wem8zdW90MjBkeEp4NUhUdkpx?=
 =?utf-8?B?THJiZTdXV2hjQlFERUNXdlpyRGZOalhEbERSWVF4QnZ1dGNWbGg5cVpnRGtk?=
 =?utf-8?B?bFZZa2lXaHkyaVF5N241NWEyMTFKb2RncUlqVmorNk1IUW5xKzcxRDNDL1lM?=
 =?utf-8?B?Z0ZoUnZUNFdjenJqTENLZWNVdGJBWUZqN01yMy80Mk9iZFJuZHZ1WjBKTzkx?=
 =?utf-8?B?dU1Vc1hJK1cwT1VMd2UzeGZua3h4bWVZM0g5NkpNN3pHazVUeWtXMUdpdkZX?=
 =?utf-8?B?enB1TWFJL0o1TkpSZkVDZDVxcmFXanBha0lvMUUvbzUrNTVMenU5d0RvcC9T?=
 =?utf-8?B?am5nK0IyUm9pUlJibFdMUC9sRU9BN3VCeHBDNzNTbnAwN1VHVURhUTZLbzla?=
 =?utf-8?B?eHQ2QnIwVDhnQ0srNjVTcTNvWE5HMjNBMUJ2Y0V1RVNGQmppa3dEYUpvcnBv?=
 =?utf-8?B?N3dDa0dnQUxEMkZEVENObGMyYk1QQ3VvMFRxeU5xU3RYeWFhM1ZkUGhPM1R2?=
 =?utf-8?Q?bpJW8B?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(36860700013)(376014)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:19:54.1258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 203fcc6e-8870-42f7-198a-08ddc91a10a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5326
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 12:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220736

T24gMjIgSnVsIDIwMjUsIGF0IDEwOjIwLCBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPiB3cm90ZToNCj4+IFBsZWFzZSBvbWl0IEVHTCBhbmQgR0xFUyBoZXJlLiBJZiBJ
IHJlbWVtYmVyIGNvcnJlY3RseSwgdGhlIHdob2xlIHBvaW50DQo+PiBvZiB0aGUgbWVzYS1nbCB3
YXMgdG8gcHJvdmlkZSBHTCBsaWJyYXJ5IGluIGNhc2UgdGhlcmUgYXJlDQo+PiB2ZW5kb3ItcHJv
dmlkZWQgR0xFUyBsaWJyYXJpZXMuDQo+IA0KPiBUaGlzIHNlZW1zIHRvIGJlIGhpbnRlZCBhdCBi
eSBjb21taXQgMDE1Y2IxM2E2N2M2ICgibWVzYS1nbDogYWRkIEdMLW9ubHkgTWVzYSByZWNpcGUi
KSAocG9reSkuDQo+IA0KPiBAUm9zcyBkbyB5b3UgaGF2ZSBhbnl0aGluZyB0byBhZGQgaGVyZSBt
YXliZT8NCg0KWWVzLCB0aGF0IHdhcyB0aGUgaW50ZW50aW9uLiBBdCB0aGUgdGltZSBJIGJlbGll
dmUgaXQgd2FzIGFuIEltYWdpbmF0aW9uLWJhc2VkIEludGVsIEdQVSB0aGF0IGhhZCBoYXJkd2Fy
ZSBzdXBwb3J0IGZvciBHTEVTLCBzbyBtZXNhLWdsIHdhcyB1c2VkIHRvIHByb3ZpZGUgdGhlIGJp
Zy1HTCBBUElzLCBhbGJlaXQgaW4gc29mdHdhcmUtcmVuZGVyaW5nLW9ubHkgbW9kZS4NCg0KPj4g
QnV0IHRoZSBmYWN0IHRoYW4gbm9ib2R5IGNvbXBsYWluZWQgcmFpc2VzIGEgcXVlc3Rpb246IGRv
IHdlIGFjdHVhbGx5DQo+PiBuZWVkIHRoZSBtZXNhLWdsIHBhY2thZ2U/DQo+IA0KPiBJdCBhY3R1
YWxseSB3b3VsZCBiZSBqdXN0IGZpbmUgYXMgSSBpbWFnaW5lIG1vc3QgdXNlcnMgd291bGQgYmUg
dXNpbmcgdGFyZ2V0IG1lc2EtZ2wgd2hpY2ggb25seSBoYXMgb3BlbmdsIGFuZCBub3QgdGhlIG90
aGVyIG9uZXMgKHNlZSB0aGUgY2xhc3MtdGFyZ2V0IE9WRVJSSURFUyBiZWxvdykuIEknbSBub3Qg
c3VyZSB0aGVyZSB3b3VsZCBiZSBhIGxvdCBvZiBwZW9wbGUgdXNpbmcgbWVzYS1nbC1uYXRpdmUg
YW55d2F5Pw0KDQptZXNhLWdsLW5hdGl2ZSBtYWtlcyBsaXR0bGUgc2Vuc2UsIHRoaXMgc2hvdWxk
IGJlIHRhcmdldCBvbmx5IHJlYWxseS4NCg0KPiBAUm9zcyB3b3VsZCB5b3UgYmUgYXdhcmUgb2Yg
c3VjaCB1c2VycyB0b2RheT8gTWF5YmUgc29tZSBBUk0tYmFzZWQgU29DJ3MgdXNpbmcgc29tZSBh
bmNpZW50IChvciB5ZXQgdW5zdXBwb3J0ZWQpIE1hbGkgb25seSBzdXBwb3J0ZWQgd2l0aCBsaWJt
YWxpLCBvciBzb21lIEltYWdpbmF0aW9uIEdQVSBvciB3aGF0ZXZlciBlbHNlPyBObyBjbHVlIHdo
YXQgd291bGQgbWFrZSBvbmUgdXNlIG1lc2EtZ2wgdG8gYmUgaG9uZXN0Lg0KDQpJIHN1c3BlY3Qg
d2Ugc2hvdWxkIGtlZXAgbWVzYS1nbCBhbGl2ZSBhcy1pcywgYnV0IEnigJltIG5vdCBzdXJlIGlm
IGFueW9uZSBpcyBhY3R1YWxseSB1c2luZyBpdCB0aGVzZSBkYXlzIGNvbnNpZGVyaW5nIGhvdyB3
ZWxsIGFkb3B0ZWQgR0xFUyBldGMgYXJlLg0KDQpSb3Nz

