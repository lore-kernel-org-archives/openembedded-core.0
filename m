Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D469ACAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 10:43:17 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.46])
 by mx.groups.io with SMTP id smtpd.web10.9130.1758969782767044399
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Sep 2025 03:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R7o5xgJw;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R7o5xgJw;
 spf=pass (domain: arm.com, ip: 52.101.83.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hjiHw1l5EuDoMMmiz9eakUAtOeEajebnzVsUThl+RWFbJjou/28r2bfWJ06sWSKzsoIHHFmwZWPMWzDgehV5QKD/7Ty54FNEP9aX62V7W62OE1tkCLlnb0VEkO+/zN7dLDeY/logXC9Tzlg9tCBEAYMrh9MN8gyonNe1zNYEIuCsPeTk6tyr19WHRaeSDXBHJn3eFdbZR9N3Y3ZdqebAu+XsuUol0J/T1rb7E9M6i6I22tAwGRzO/ny4rCXTepbTkwNxvZj3QND4inyKOjCiP3hiMqFKp0y03fRY4bgez0C6tEXpeOYH9jnuBoHZjHybcB/hse7YyiejgQdrrcpBNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/Ni2vmRzkh7FTvOC9H3DBbePhwqo3PwORxpxv791hk=;
 b=LC5tV+WnrKx3Z+XwisoV5sd7QTwdf7h0eNPKypz0Du8SHFG4Cy0KFAKk/08OvcYyjTU11GjsDjXGLO74fXQjzxOe/ytAuGwfn/JoB9WWT+PUR9Bs152wry2/lDCR0qZMSf1pe2GCpCz0Lavq/ZfPL1GYaTAmjj7Hps7oKGbvxEdJuXRHTUUkxJyA3JmdFYsQehGeRTMO7MpIEMp7VuQEVmv2A+amcy7tpMCxa7IsTD+Q1lMsB2Q73fKY7LxjwXomnwut5sSAIRNCSqgk+MrFbgRxRB3Zarht72iH5idWWiXpdj/IHgJ/4ZGkjBTFFb/cbAz7b7irLnUA4ke+hak5Ew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/Ni2vmRzkh7FTvOC9H3DBbePhwqo3PwORxpxv791hk=;
 b=R7o5xgJwiqWbXPE1L0luRQNHjU1DFOyQUkBdjdYeme5yVl/25efLK3anQQntUa6Ozm1Wv30lCIm6D5mvy1isKiAB7bgphyzAcyIGBBGLpiFmpXd/1SPivLMwNxbmrzKbGnmuTmlX1AHJCQM0mGcQJ0/ZhKXU2iRIdUvAzZDm7o8=
Received: from DU2PR04CA0318.eurprd04.prod.outlook.com (2603:10a6:10:2b5::23)
 by DB3PR08MB8891.eurprd08.prod.outlook.com (2603:10a6:10:42a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Sat, 27 Sep
 2025 10:42:56 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::8d) by DU2PR04CA0318.outlook.office365.com
 (2603:10a6:10:2b5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Sat,
 27 Sep 2025 10:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Sat, 27 Sep 2025 10:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCkqVVxZapEktN5IjfvomAgHqcJIwYYv9PGvoIrvrYcgLjPNXcDYaJgEq6DuT3clIeJmzkLoBBcIk2kQVyGPaZxUFW/PYZseCwsiVhaI9pKcWMCe2P1rnZonaiFf28bDzjS4cHMaXRekxCFtPc0aj+5ut5alZTl8s/ToHBUXsaY0OK0v7YQiHcbo3OckdMDk7zRUmVYb/bkRuPlTr+JNVHMSQwTqPFy4U0jaBTA0islR5SSkwlvVjmP4N4S89chSlGCCAcxY691BSX3WuSFtWZWwg/PX7wRTQyi2VlcyL0v1GrRX2OedoUOAvNByo79zcliTjacRdWaXCHcC8K1XGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/Ni2vmRzkh7FTvOC9H3DBbePhwqo3PwORxpxv791hk=;
 b=Y5UIxzeAaoaIMXCJozzuhIaYVlTKwuqnIp77xSgXjpeA0RI3d2LT0zd6jwnKJ6KpsVDpNdeh4r68NYdJpbjVVWb5faE97c9ytLUFodxQpWTYiiV0xLqZ/zu/1zarr8lVLK1fNdZJE3a/4GVH0K2R+SW7EEHU4eFZarrLSI6EdROdrU9NSrkDvEhZ9NsLyswpJYwOT3szenEx1lAxVF4PALDHey9LBlfWPNPJacV4O/XrI9n3KoVWo72BvQsULhRxsG5GlI2oL7vM3mrzDv5kSjzZFxr0+u+nhFWR0qhDj1Z8vJR/vLm1gHiUeRnijrV1T0jxpqF6ir36c8I7gGEWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/Ni2vmRzkh7FTvOC9H3DBbePhwqo3PwORxpxv791hk=;
 b=R7o5xgJwiqWbXPE1L0luRQNHjU1DFOyQUkBdjdYeme5yVl/25efLK3anQQntUa6Ozm1Wv30lCIm6D5mvy1isKiAB7bgphyzAcyIGBBGLpiFmpXd/1SPivLMwNxbmrzKbGnmuTmlX1AHJCQM0mGcQJ0/ZhKXU2iRIdUvAzZDm7o8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10645.eurprd08.prod.outlook.com (2603:10a6:102:3ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sat, 27 Sep
 2025 10:42:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9160.008; Sat, 27 Sep 2025
 10:42:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson: upgrade to 1.9.1
Thread-Topic: [OE-core] [PATCH] meson: upgrade to 1.9.1
Thread-Index: AQHcLx8SL0LUojQBUkCjcWk+mTGoULSl9+kAgADgnAA=
Date: Sat, 27 Sep 2025 10:42:22 +0000
Message-ID: <16A323EF-D982-48C6-BC6A-6DFDC1ED6247@arm.com>
References: <20250926195204.2323521-1-ross.burton@arm.com>
 <CANNYZj8Y+Wj7-JAbC8wSZ_zeR9ptyUrKNpgckDc0Xh26OOARig@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8Y+Wj7-JAbC8wSZ_zeR9ptyUrKNpgckDc0Xh26OOARig@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10645:EE_|DB5PEPF00014B90:EE_|DB3PR08MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: 4205f5d0-48c1-4ebd-c8a5-08ddfdb29e71
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dXZTaExYdngyRGpRNjkwSU9seUo3aC9qdkVTTExKWU83NittQkVQK1UzRHFi?=
 =?utf-8?B?UjNJS21FQmVVV2lSWTBxUFd0TmRJSEw3UEFmNk03N0RQMldxRzBEa1c0eFBw?=
 =?utf-8?B?MWZTWk53TUFXMngvTzFqOG5XRjVSWGdwYmRDZk1pTWtKT2VHemdweVU1ZUxP?=
 =?utf-8?B?WWw4Qk10VmkxejRWNGlVK3FWVTE2RVJBNU9hbXBNN2lJZzVMNVE0YXVhVkZ3?=
 =?utf-8?B?U1BObVJVc2NFeER4QjdnbkRYakVvd0NlSzJmRUNieDRxcUs0L0VBeFd0TFdy?=
 =?utf-8?B?aVViem95ZGNYK05GcFlMcmtyejBITVhPN0Z3ZHJXck5WODI1cHNFeXlHVkU2?=
 =?utf-8?B?TGIvamVlb2ZXUitWNkRLS0RRSDJTd0NxSkZqY2w2Z0dBaTRTL1JINzNwK2I1?=
 =?utf-8?B?bnVtSG1WemxETU95TEVvaVhDSm1JNzlEM0phY0dyb3ZTVSt3bjU2STJyQ0Zo?=
 =?utf-8?B?cjB4N0FVTldCWXRkUkxxTWMrcmVxUUMrNXJTVWVwMFY5aE1QeUNkY0FpSzRG?=
 =?utf-8?B?dTFmaVpTUWFGcXJtQ2VyaVFUYkdIdkloTjNJY2Mya1haM0lQS1dFNG1xOGlZ?=
 =?utf-8?B?MEZlbmZPMjdGcVc0dGk3eHA4UEJOcHRCc3FNdDR6c2Jad2Z5eWp0ZUhmWUdM?=
 =?utf-8?B?elF6VTBiQWwvTGN2dEJ6TXJoVXFxUDh3K055em1mS2hwUlZWREN4RnNOelVp?=
 =?utf-8?B?SWUrOTJwdEpKbzZnYk0yazhhNmlud0xlMkxPNCtKUEpXeXR0eXNCbGVNRndS?=
 =?utf-8?B?MVlPcXRqdG1CbXNXWHRBMHhWYW0waHpvaWtkdkJ3a05YQXRhUFdWSkZpaUF1?=
 =?utf-8?B?R21LSFZDMUR6K0hXZjlUNXFYWFJRNDFlUkFQS2JROTVWcGJaWFBDSlkyeG1F?=
 =?utf-8?B?R1NkZWlQY3hGNitnSVVSZURSQitHVGhMa1NhMCtkdTRWdWJ1RmlPbWZRWDZw?=
 =?utf-8?B?MCtTY3Z6VHBnUTQ5Z3BUSUo4U1JhWVk0eE45OVo4dEUwMlV3eFR2RzRLdFI1?=
 =?utf-8?B?WmswbjBDTFRVd0xEL3ovaFRXamxudFJ6YW5FNHFvaGVUNDdldEdobkJkbm1v?=
 =?utf-8?B?WGdtL1FCL2JjOGlPbDRrTnE0QXJ1YUQvWUJtUm85SVJQa1hXbVZqbjBJY2pm?=
 =?utf-8?B?SmVrYmZHaWIvWHZpRElzdE1BZDNUQjZDZDdWQy8xNGZFL3BTSytIQnhmanJK?=
 =?utf-8?B?YWd0dUd4UEpBbXBEV01BUWU4dWhWS0o2UVhQNFZPUDl2MzNuRURIbXBxOFpL?=
 =?utf-8?B?ZHFVSE5jdThvTXp5Zjl2RnlnUWRVblVVWFVVR2JjaUNJUVozelhLa2FxcmRy?=
 =?utf-8?B?NzZRaGY2MkltamtBR3Q4Q0lPWEtQU05hckVmQVV6TUtlTWdLM2VqUlUwRjV6?=
 =?utf-8?B?d2VYUFBLZVJUYW5oMnU4bzRxZ3ZGQnZEbEFmcFgvNURtT3lUc0ZocVdUYUVU?=
 =?utf-8?B?QzF1bGU0UHp3K3UzaHpSRW1kaGl1SjVQR3laUDdXcXpLMmY5ZWNaWGpZY1JK?=
 =?utf-8?B?UWxkazQzbmN1ekJPMlZ6em5HMXpxcExmaWw1eXd5cjI5bFJsbnZFcE5SZlQ0?=
 =?utf-8?B?Z01BTmlvZXZFRHNsUlowTERVaEVPZ205TGlCTnUxcU1ZWTBkdmluYjBKcEgz?=
 =?utf-8?B?bEVGdmNBUlR3WW5xR3BTMks2dlczdWlRbUNnMytBU0FDcU9wMVlWMEhYSjJY?=
 =?utf-8?B?QXd5TnQ4bWRCVTNYN2o0YUVsUGlPU2EwWHdXNnlCRmZET0wwdGIzeXNvRURQ?=
 =?utf-8?B?RDNvWDVQOXl0Y1V6TGpXcFIxYXBlOEQrVUl0cjNTY1duQk5zeDZLVTh0Z0Fw?=
 =?utf-8?B?c2xKMlpNaDBwRUs2M2hBK3F5Q3p0c0dMVDB2TXF5TCtXKyt4QVB2dDFzdVZt?=
 =?utf-8?B?UmVwTjlWZjBYWk5EM2VtWExDaG8yWllxaEZOdXhzQXBrU1ZYdStwZ2xxOW9S?=
 =?utf-8?B?eHpwc1QwWFo0aDZpRHI1MWVwUHVuTzl6N2JVTXhBUnh2a3JWM2ZKdXNQNTBF?=
 =?utf-8?B?R1dCb0dJRmg2eVJtUEwvdjVPa0MxTFNEL3ExbGNoUnN5aUFBa2J2RDlpTWlx?=
 =?utf-8?Q?iGpbMR?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <177863296DCC0C48BE4DAE08EEFEB06A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10645
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f45b6fc7-4f53-4d96-efd3-08ddfdb28a94
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|376014|14060799003|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0lOZDZpZGpFM05pclBiaWdlNGpSa0RKR3BBRWUrTGE3VkxsZ091MDVRaUJB?=
 =?utf-8?B?dndVUFp3ODREVjIydXlEalc3T1hhV0xRS3FSZzBJM0Q4UEZDZmdKMVk0MGJp?=
 =?utf-8?B?aDMxTXBIOUpVWThhQ2UrQXBub0lTZVU4dExiOVJScFljV1hLS214MVdBZmRE?=
 =?utf-8?B?SWM2bjFuU2VxKzR4Y2tyeXhwT3dSSkloODQxMU1Nbll1R0hhZUxnWTBNVmJi?=
 =?utf-8?B?dWQxRk1BcGsvQm1GNUlpZlBuU29ZSEx4eWJtWUJodW4xRnZnSjZsQ2V3OURi?=
 =?utf-8?B?TUhmTDVwT2hONUs1MEVSYmhSNTV5aDlDSVc0R3JGaUZTQk40aUZic0syTjIy?=
 =?utf-8?B?K1UydXNqcnBleE9tbm5IRC90aUhlVDdQQ0NxMGZxWTNIRG8vdG1ldFJXOWZp?=
 =?utf-8?B?YTZCMHNaZDROaUZoUnl6R2FFVFlRMmRQNkZkOVhhVDJOSkk2OXo5MWJXdmVD?=
 =?utf-8?B?YTcvZlc4YzRlSHJ3TkVpN0dxYklQbDFlTVZiYTRZc2Yra0phMHdGTDBWYVJW?=
 =?utf-8?B?dlc1dGYwcnpjdXVnaWFiNGRuMzZHWDBKMGxZMDRsWmU3dHVYNWl1L2s5Wjky?=
 =?utf-8?B?UnpMUkRFdm5tZm1ySEpKTGMzd0p5cXEvV0MvNGZCRS9icllHQSt4emZMcW5S?=
 =?utf-8?B?eUFpcnppaEZqSDcrMlFxV25ic3ZtMjFKNW9RdHR2VnlQMVNIeDRBMVpVdnRz?=
 =?utf-8?B?d1lTaDh2WlpYUUF2bUF0MFJmMFFpNGkwaUZmQ1BzazJSTDhOTHZ0Y2dLVzFp?=
 =?utf-8?B?R202NUp6NVNZQWxySHJjRCtVSEZGaE5rRHcvWS9XVzh5SEZVL2MxZ3JvTjRp?=
 =?utf-8?B?RG1zQS9RUG1qSHBuYjZIUElPOUxyVTFlOTdOYk91WFlkdkVNd2VDaC9GZ2xC?=
 =?utf-8?B?QzhxY1JxOWpkTjhEOHNCU29FWFo4VFFuYXVVUTNpSm11U2JhbGZ0eVhPazYw?=
 =?utf-8?B?WUlDa001eXUxdXRQQVFXWnl5Zk1UbURhc05zQUxXMjFKblBkSEU1T3pmc2xI?=
 =?utf-8?B?NHBKdVZyc3BBMEdsMFpqOTAzWkw0T0JsYXpYZ25RR2dYemRPSDNwMkc4QmVn?=
 =?utf-8?B?dC9xNjVoRlBwcUNYM0JMcURpNXV6MkUwYms1aitibzZ0V01VdFRFcFRVTWJL?=
 =?utf-8?B?emh3RkV4V1o2SnJvbzdMeEVNaStVUGhFTGZvdG9WRkNodFBwblpRRWNsRGw0?=
 =?utf-8?B?VHpRbTA5bHdJVDYvUFM3Y09raVZMUTQ2Zll6aEZGb2RRek0yWmh5K1Z6UFpo?=
 =?utf-8?B?REROVW5WcDl3OVUyQzRXQnh6NEZBN3U1SVExTXd0cXQ1M2tFWEg5Qy9BQkJ6?=
 =?utf-8?B?bTlYNHc1cE5uaTdvb0NzRGI4NGMydVFpMkRFMkJTR3hPSUo1cFdPeUQzYU5Q?=
 =?utf-8?B?VlRBRmxERG1KcDIrZFdBZWl4QzBVUkJpeEhYR2VLMHZiOVVHKzh1ZWFhV1BY?=
 =?utf-8?B?QzVmNUZaTk0raWJpZkkvOTN4S0FUaWM1VmpodmJQNXBIbnBTTTVQZE9FQkcv?=
 =?utf-8?B?aXkvSEFKaFFHRldYUm5SSlRmNHdvVjZNQjA1b0RsZTlEZWwvQVV0VEk5WnVP?=
 =?utf-8?B?djY3eGdFWFgyVlBreU9RSFl6Q091MUZFSnNqN1A0UEZrMlMrcHBUZGw0OC9K?=
 =?utf-8?B?djlpdHJib1I2MExVTnZmK3ZhUzNJNGo4SVEzWVNVelA1R3U5cjQ0dGR1aDMz?=
 =?utf-8?B?cWhnZmlBT2RLaUxRMEpuOUpPUW5lVUFKWHh6L0ZjYU5PTVY2V2ZieEh4S1JI?=
 =?utf-8?B?bTJ1YWJjL2VOSlZ5ZlpySnBrMTlGTExEbXV1TndQSUNRZ25UQWFobTBkZnpT?=
 =?utf-8?B?U1kxbng4RnJPVUxlbzZiK2Fma0crSHg3dzZGMk10dzlvd0pNcUVsSWIrTEtz?=
 =?utf-8?B?MC8zSTgzOWRnQXYrK0NmUGJ0dURkOGxaKzZzbEJidVNIQzJYWC9iZlBqRnd0?=
 =?utf-8?B?bVc0UHdlOXA2YVZxeE1BcTFRVENOZ1p3MlJyUW8vZmRQOXFxWUlGSnZJYlpq?=
 =?utf-8?B?YjIyaGU0RjVxQlpCTFBVazdWNHVFYWlvV3A1MnRjdmh3OVNsL3AvdmFhUXA2?=
 =?utf-8?B?a21UM2Irb0Jyajh3ZDl6anQvNDJyQ3hWSlZXYVFmNlBvVjVTeVlDRExoNkFk?=
 =?utf-8?Q?37xU=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(14060799003)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 10:42:56.0276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4205f5d0-48c1-4ebd-c8a5-08ddfdb29e71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8891
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Sep 2025 10:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224097

T24gMjYgU2VwIDIwMjUsIGF0IDIyOjE4LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbGQgcmVjaXBlIGRlbGV0ZWQsIG5ldyBvbmUgbm90
IGFkZGVkLg0KDQrwn6Sm4oCN4pmC77iPDQp2MiBzZW50Lg0KDQpSb3Nz

