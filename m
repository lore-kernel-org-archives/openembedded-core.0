Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED9DD0D161
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:22:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13014.1767810122861430016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BYBvGYXE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5467bb7847=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607ARg5e2865901
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jan 2026 18:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=LLsppJdQxk46WuvUxyvNtX
	r7OzJ7k5fbdmKaltDxI6k=; b=BYBvGYXELYcaBizfXYuccaReB8WhYrffwsGmzD
	ieKky5akycds8W+Bgxh6Jnsj7iMpzV7Ktjzgi+irkTHeTZvKplzMPCCDILPtEkux
	2euYJpsxefLZIPLTmtoNAnohYubkYMGsKJbYK1VxW/TbHgjw/6UPgk4N2ASqLAaz
	5w3P4BnLdIsgIY9nukxiHPhA+5e+v/5Kr0RhTlLnEmXIdUnJ8M48Dz6VBNjzxJ9C
	hF99pkufgRge94E8dOPZ1jxX3Zf5ssFB76BpZPBdYmF9/RtwTcR4ncXb5j7ulKOI
	e56vwF/TgMmwP8XWejV6CIXe5z/lvH1ffwV/j31UPQtTsvuw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33cetj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 18:22:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPRapGtbR/jZn1Y1R1CEpZOKsQTQ4EDsyyTRD1Rgt6lgLGB0adFgGTIhMLNZ8gWAh4IBxljTIOpzTwB6mIsDmnRQCsqDXq5UeoLJxVhOoZ/ioBSFiK3NGxUnz62u9T3aspviI97HZIp2PWzfP7JyLqk8I+inm2QqSFEr9uD2I/EtinfNCJMpxfkUSdNp2Js/1fI7GA0FbgI34hdZ1M4+efM8sURxi6pTTGuIIAWgriv8tfcvj8ldYMRBRt86cjOLuI20NV9JrtuznJ6ipH8L43IgREs5xs0hcM3iEoLaPe5JliSNLMdmhAU4ORBwVGDjSiEj4ejDBzuYSg5hYOkhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLsppJdQxk46WuvUxyvNtXr7OzJ7k5fbdmKaltDxI6k=;
 b=YY+z7t6iiA302zuaNZ82nsoQyF+WK/n2iR3Dd26Reo94lS2pLrdQjULvU3MU+Ft8yuc+mlGcZU+XN5PUB22s8xF/mIA74KCblGhulCMQRneAzNfLbD9g2XMrL6lpaK4v28kctZBFg9hQ7bEoU0W0PnnoiN3fG+3h2UyFIXgQl4iU9bHAbEH3FVyx1Y1x6KsgiPap0JuWW34QrQH0XDCNlyh07z6Rv4CPhkPbBElIwJZMwH50AfSg2zZhiEv3B+fV8yTS9cqR6Y+4rFiGGkT62lzxPTbl2+XD2pWNuxhZtwL2Kbx05DxHVogrhzG8+ESMN46Hs3P0T82kThAsOBeHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB8436.namprd11.prod.outlook.com (2603:10b6:610:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 18:21:58 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 18:21:58 +0000
Content-Type: multipart/alternative;
 boundary="------------fVNLCAI0gXCRMncSPyj5Y0qe"
Message-ID: <980e869b-15e4-4b6a-a2ac-3e13ecb43b00@windriver.com>
Date: Wed, 7 Jan 2026 13:21:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 03/15] rust: install Rust library sources for
 'make rustavailable' support
To: Harish Sadineni <Harish.Sadineni@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        bruce.ashfield@gmail.com
Cc: Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr, openembedded-core@lists.openembedded.org
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
 <20251230141540.1974380-4-Harish.Sadineni@windriver.com>
 <eb3a975606e2cf27a04c999158a9d39f2cb7a007.camel@linuxfoundation.org>
 <ad562934-8523-4071-801a-8dd5709c0868@windriver.com>
 <6baec353-7ac4-4801-8e13-225e4d9432f2@windriver.com>
 <663fe060-072a-43a4-b0f9-20e172007c47@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <663fe060-072a-43a4-b0f9-20e172007c47@windriver.com>
X-ClientProxiedBy: ZR2P278CA0039.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::16) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6a5f94-e195-4eb6-b9f2-08de4e19a4be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NlZGZjdINUJ5QzBrMG9pQUR3djFIR2J0R2FtYkJLelJwbnkrb3NldTk2YkZv?=
 =?utf-8?B?M0VSd2RYUXJXQURpZG14TGlTcDNNRStQeTZkNDFob2hueG1JZHM2c1J4RVJH?=
 =?utf-8?B?eHRCeDErclZZb1FNeFZHZmJmSEJwT0lWQTJJaktyOHRkWXgwRHFpQzFaM1B4?=
 =?utf-8?B?ZjYwWVJDVnlUeDh3L2tKcC80cWF5emNyanFIS0Jqa2tFVldjWmF0cnNWdzFn?=
 =?utf-8?B?Z3BRU1pBa0p2TDdwMFpPQ05YdDcwWFZPSmZUNE5oeUFMdzcyb1ZMNDE1VXhE?=
 =?utf-8?B?OC9ZZ0hJTXRxTFpkRDJCOEsvNStLUVJ4bEZwVkFwcFQ5VXVnbnBtNWZ6Q1N6?=
 =?utf-8?B?ZjNvaXFmNWlmYzU4RU5qbmx2dnljM0NDak1MVUFXbDdxWXBHR1dFdERVZ1My?=
 =?utf-8?B?M0Y1dDA0L2JDZURtOVhBVjBJNmNXYWhPK29ZcVh1VXMrOEo4ck42WVNOMzJk?=
 =?utf-8?B?aEg2SUFUbytDK3VjWVVZblhQRnZLWU5VQnZIK0xWNnJnakx0SkZRc1N3Qndy?=
 =?utf-8?B?blh4eGh3dWM3Z1BGMTloZ0J0cHpLdmcreHUxcVFhWndkejNLUVRxekJabHpp?=
 =?utf-8?B?eGlhMUd1UUFCTHJHZE1RYmlvU252WGNaWldSSmNpdDZjNVZ5L2VDejh4a3Vx?=
 =?utf-8?B?OTZ1YmZGVHlGZ3hzMW82SXI2UGZZTGgxUXdEa2c4MUNNMG9heEpnWDRNMWlW?=
 =?utf-8?B?akFxNW1pZ1FCV3dCRTVUZW9ObmRKcEs4R2k3bll1a1ZiaHo5eVhWL2loOUdp?=
 =?utf-8?B?UjJla2MyNEpvSlNOSDBMUWk1dVNWTzc4MG5SSllNQ3FnNHl0K3pOd3QvNVNh?=
 =?utf-8?B?aGExMmhTY3JiR3VVRWNOaFNkVksrbzVhT3hEZ1ltVEJQYjhBdGNCeXAwdzNw?=
 =?utf-8?B?dlBHb1I0b1EzTk5tZ2pDQlptaVEwSG1CZEZQdTZ3ZWM1cVhST2lzd2xmMHd0?=
 =?utf-8?B?QWhNNlFsYjdlS1NQU0pJRjBaSXFMcWxmQjQ5TzZmVEhWdlcyUVJHS051ek5W?=
 =?utf-8?B?eHhHQW5Za1RwMEJaTHNoOURIKzBCUDZUVU41WkF0NGI4dEZGWmsxWXdKZ3pS?=
 =?utf-8?B?aDdFemZvOU1ZR0lzYnhrWWdueWhzdHZ5a0VBbXVJeDFYM3B2Vk83YUQwcmpT?=
 =?utf-8?B?YXdFamF6aG0zaHF4Y3RTYmJ4V3Zic3BJR0FLV1J4THdwSlRoSk5OV2UvYWJP?=
 =?utf-8?B?YnlSaGZOZGRGK3Nxb2ZPRVFTV281eXFDcG15NC9mUWtENXJ5Q21GczlGMnh2?=
 =?utf-8?B?dS8wWHVnc3V2cUJtTGtwbEV4OEZxT1NxelYyOUtFbWFXSzVYZ3EwanB3L3JR?=
 =?utf-8?B?NTJUWUlTZHN1RkVKci9TSkxlVnVsUEZQeUptZlExSG9aakNzV0g0aTJnVmZ4?=
 =?utf-8?B?VGkrL3h2TXp3K3VZa2xEaEtjaDZWeUZwbGRPM0xxR25PNXBKNkQwOXQ1TDhM?=
 =?utf-8?B?a2gybTcrbGlwejg3YTI1c1dOblc3TVJtYjY3MnoyVEMrK0hoYUNKMytkSUwz?=
 =?utf-8?B?Q0ZDb1Fpa21tRzRveFNHUUNsQ1J0aU0rd1d2bU1IandRVXZaak92U0UrQThM?=
 =?utf-8?B?R1BRSWp0Y3NRM0UxSWJJS3EyYmNtV20xcHVqamtFbndhRTdtNjRkdjZONXQz?=
 =?utf-8?B?OFg2Zi9GZVo3UjZjS2UrRkhiN0xLY0swd0hoOG1SbEt6UXpLSjRESGdMTE5h?=
 =?utf-8?B?bDlJQzhuSXh1RVhFM1M4bVpqWnZzWDJtcUoxdi9RU0ZwMlBNQUFrdTlwMzJC?=
 =?utf-8?B?cEU2NEhjNFdld3J2TWZQSTllTXRZbFp6VG94TWxIK3VzVFV1ZWdaTlF2bEhz?=
 =?utf-8?B?ejlEM0ptZzhDYXZYckNvNWZ1bXdFMkhUUmNYS3BQUHJOQnluamVrbEFwUjBz?=
 =?utf-8?B?TUhmUU1OS3dDNlphbis3R010b2FuMDhSRjQrckxwY25VSWJwYllvdURZVnZJ?=
 =?utf-8?Q?uGYGYUABYKs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZCtsZXZoYkZGNm1KSTA0K3JFNXU3YnN6WlNKZnRKQ1RHSjM0RjJFOVZPNFdp?=
 =?utf-8?B?VmEwMkdBOVFoN0FGUmg0RU1BblpxUU90bDFnKzN4dkhBR1phWGVDb1c0dmpX?=
 =?utf-8?B?dmRMS3pKU2M0Vzc4QytnODJJdkI4TkFaN2JJWmNwSG9vdllObWtacTJ4REV0?=
 =?utf-8?B?OGVNdStIU1h2ajREcmdPMHg5ZFNaWXdVU0NiOXVkRzZuaTdoMVBLMTFhelF0?=
 =?utf-8?B?YnJ5WHZWVzdKMXp2KzFLWktEcmJlZTNjWkhwTmd1TVVueTVQaEhIMERUTWxz?=
 =?utf-8?B?TkdmYmtxWkQ5NFowMUtwZW1mUWlvR2JpVnZORDdEa280QU9Nb2VvRXBUbjY3?=
 =?utf-8?B?YWF6OTloVXN5NmF0clR0c1FZTGIyWUNlYU5ia1JVdFBzMkZCRHp6QURZTWNK?=
 =?utf-8?B?amJuSFhpdVBWZXVkTVVXMVBBS2ZibnRTQVAxaXhoaVZRNUZ2K3dxVmxUYUd4?=
 =?utf-8?B?bFZvY29uRzhIVmZqbGdZaUFreUVrbndWNVJVaUNHdzl4MHBNQ2daekROcUtG?=
 =?utf-8?B?a0oxZWt2eUlZM3MyZzNyM3NzeTJ6U0ZuZVM5eDA2WGU1WmdKTUc4K2hkeklp?=
 =?utf-8?B?Ui9TSlppOTNXMitOZ1hqZ0hFSmZ5WC92OExZbDhZQVhDOE5kR0FneERKQ3Nv?=
 =?utf-8?B?b3VOaUVINUdKSld5bUkvRnlTSDgwUjNUVkpRS01pQmEyMGg1SldQa0hTVDFp?=
 =?utf-8?B?ZkFTVVJwYUZESDZqejZNTkxLYnpSbTJ6a2pGMUQ0RkdOVld1RmZjaHlCc0pp?=
 =?utf-8?B?NnR5eHpHOTBDbm5TOVR1aS85OCtVcFRjcXVpMHF4UDlQRTNoenVBVFdxR3Js?=
 =?utf-8?B?K0RHcVR0RmFVbE1LTXlqVnRXZmRLeXVCa3ltNHhkY3BlaWhWc1pINktDcThR?=
 =?utf-8?B?bEkrRVorM2JzK0dTMEpra3VOZzB0MGRvUzhqMG1aSVZtWDNjZTRmbThPeXpF?=
 =?utf-8?B?TEZ2YUEvTE5teEwwc3Q5cEExVHZhbVNvVFJ5MUVpNEE5aDB2dDRjeUE4UzM2?=
 =?utf-8?B?aVpjT0dqaVViR2JzTnM2Ry9KczJMVTJwU3JlMWk5UlhuVmd3TmttMGhGcVJo?=
 =?utf-8?B?WncvUjRIWjlLd0xCRDFWb1lIdkVvRzB5MHNxMURPTCttSzZvdGZER3NnUkdF?=
 =?utf-8?B?Q2JMZ3pCL1FTK2dJb09Hc2k3eXVrRHI4VERFREFZb2h0MXZROVJ3Q3lrSUdE?=
 =?utf-8?B?UVdLS2pyV1l1c2Z1ZnRMSEdJZjJMNXJTK2wrTzJIWjhYYmRmcTNTYW9zSERi?=
 =?utf-8?B?dFRXUUpHWEl0OWVUaG9MQXNzbjV1dFg4OXhtSlhtSis3djVtOTgvNERCajYv?=
 =?utf-8?B?a1ZrN25zNEx5Y1ZJNldGemZuSEIvNWVOUEQxSm13Y1Y0bzU2dGY2dis0QzVC?=
 =?utf-8?B?S1k0NzJNbnA2cnJab3hGK2hJTEE3R0dtbHptRkY4VDBQODdWRVdxM2hPdklu?=
 =?utf-8?B?NWNYOElCZmlobFdzTzZXUWs0REhha2JmQm9vUmpLQ1RtVm5qOWM5Zzk0dDZB?=
 =?utf-8?B?TVdPVWNLaTg1Z0ZsWUNsclNXd2pUWTNuaU0xVGM3T2h2elNxZDd5d24yVWpl?=
 =?utf-8?B?TnNXbzZLWXkwRWhoWHk1S1BBSzlxS0pudk5SelBkZURhTTRzN1NNb1NhbFhJ?=
 =?utf-8?B?T00zSFloZHBHMDNTdXlwS2w4bGdScUF4bGZkNis3QlBpK0hLV0xsbW10cEJo?=
 =?utf-8?B?VERkSmZLMWtyYmtGZWhEMXE3ZHJLSDlYN0JiRkp4SnFhWk9TcXJ0TXlLUHZ6?=
 =?utf-8?B?M3lyeVRIREdhK2NlR0JDSDFmOXl6ZXRlaDJDdng1T2NXR3dPQkE4ampXYThP?=
 =?utf-8?B?UVpLR2NWdjVPMUhJVTBrMDZEZWpBTzUwRWdQSFo2UWRPYUFsTkZGZGozMU1F?=
 =?utf-8?B?NDNvVWlKV0txMU9yT2h4czNiN28wYTcxa1RPeXhZWFN0aXBQZHZ4WngxNmxu?=
 =?utf-8?B?SC84ZHRNWUpnaTVidjlkaUxHNlA2ZEFUNzZIZW9IcWRTQWMxLzVSRU5NSWpY?=
 =?utf-8?B?TTVaZGpkZWdYelBST2dzdmNDazBhT3puTlRUWWg4SHB4RVBTUFdpQzZ4OXJv?=
 =?utf-8?B?MlFBWjB3dG95L2gzZEp2N0hYME1ISDdyU3JHbDN6dWZvQ0JUQk5TU3JmQTk3?=
 =?utf-8?B?Zi9ZVVBNMXNrRmhEZ2crblFxeXBiYzRRTXc3bTlxUlc0QXRoMFNOZjkzUEVs?=
 =?utf-8?B?TDNGNHlxNVVQdWxob0Ric05pNlBXYVRta2NkUWJ2QnQvTU9ybUZSSzF1TFZa?=
 =?utf-8?B?TE1INzVLU25aVHpNV0NUTFlSL2JNSjhUVUFNUU5ROStrNlZ4c2FCTTRacmp2?=
 =?utf-8?B?cWpZYXZKNnZPS1ZzMkJ1S2ZqYVJJcm82NjVMMjRvZ1Rmb0xvdHVuZnA5dzgw?=
 =?utf-8?Q?BU5aedI3T3fKcy+o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6a5f94-e195-4eb6-b9f2-08de4e19a4be
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:21:58.0777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MubU8XmngTC91KGSyc9skEx+Skdas0FlJeHsQ6Ooeu+RNEt53v5QHFKBiKUeMc0dbiRrxh/7E27HEXcrP52jq9aYk3KPJ6XGQgUGb1jOuHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8436
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695ea449 cx=c_pps
 a=aX6hwv3pUrsX0fnHaj1tZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=RS5sdrFlJqfRAIFxHt0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uU529naxH7Beel6JuZMA:9 a=Ci1RBfEqXePGGX6n:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QrB_R1RhODh3y-I4f3pF_Qc4Ojfk2Wzv
X-Proofpoint-ORIG-GUID: fkurLQK7rN2miigjvPcWa-Quc9-88G5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NSBTYWx0ZWRfX0q5SBq2Pz0Fp
 q5RF0ZN4KtrQTJVq9AIzqtkBE6xeTeAtR+pQSf6q7vvqIxo5cgksxul2H3K91kQT1CW4zxA25yi
 sm5ZSsOhh6IWOOloS2N6NenQvnpcQvg10V+dCFr0zSqxS+N89RZj3VJHYl/2sZ3ScjtjC5IyI46
 YPqzIGn2bkUuHIsE53gJqmBH4d3KB2IQrJqUo5xzQdIscMXRWuaIoU8D6KfZMAzU1ocg9vH+w/d
 CTbUgstmsH6wzZTYOpX626BBAFnLRyJYCQEZOXFFM+W2iWDqsBbdvqd9gcvSaSwVpsdsms7gtQe
 3JKtgI4hy+Ijl73a90Yz5zB7J9yTIjlrv4wJuq2GGVpDHMFV/p2k4CzakznGFzLMJVG83PBFChX
 wIhD0nka0bFhw63k0fhUsisDdy6brP1r1lg1+0rvh8DFmdrBhU6Pxb8ZxaFJTLXFqDhJUj0fP8u
 qoXpCsQIjc4y+jvbG0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229026

--------------fVNLCAI0gXCRMncSPyj5Y0qe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 607ARg5e2865901

On 2026-01-07 11:34 a.m., Harish Sadineni wrote:
>
> On 1/7/2026 12:29 AM, Randy MacLeod wrote:
>> On 2026-01-05 11:24 a.m., Harish Sadineni wrote:
>>>
>>> On 12/30/2025 9:28 PM, Richard Purdie wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the=20
>>>> sender and know the content is safe.
>>>>
>>>> On Tue, 2025-12-30 at 06:15 -0800, Sadineni, Harish via=20
>>>> lists.openembedded.org wrote:
>>>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>>>
>>>>> The `make rustavailable` process (1) expects the Rust standard=20
>>>>> library source files (e.g., `lib.rs`)
>>>>> to be present in the `library/` directory under `rustlib/src/rust/`.
>>>>>
>>>>> This patch ensures the required sources are available by:
>>>>> - Copying the `library/` directory from the Rust source tree into=20
>>>>> `${TMPDIR}/work-shared/rust`
>>>>> =C2=A0=C2=A0 during the snapshot setup.
>>>>> - Installing the `library/` directory into=20
>>>>> `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
>>>>> =C2=A0=C2=A0 `nativesdk` class, making them available in them avail=
able in sdk
>>>>>
>>>>> 1) See the kernel tree for Documentation/rust/quick-start.rst in=20
>>>>> the section: Requirements: Building
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/rust/quick-start.rst#n145=20
>>>>>
>>>>>
>>>>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>>> ---
>>>>> =C2=A0 meta/recipes-devtools/rust/rust_1.91.1.bb | 17 +++++++++++++=
++++
>>>>> =C2=A0 1 file changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb=20
>>>>> b/meta/recipes-devtools/rust/rust_1.91.1.bb
>>>>> index a25f65f674..7644ecf2d2 100644
>>>>> --- a/meta/recipes-devtools/rust/rust_1.91.1.bb
>>>>> +++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
>>>>> @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>>> =C2=A0 }
>>>>> +
>>>>> +do_rust_setup_snapshot:append:class-native () {
>>>>> +=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kern=
el',=20
>>>>> 'true', 'false', d)}; then
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ! -d "${TMPD=
IR}/work-shared/rust" ]; then
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${TMPDIR}/work-shared/rust
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cp -r ${RUSTSRC}/library=20
>>>>> ${TMPDIR}/work-shared/rust/.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>>> +=C2=A0=C2=A0 fi
>>>>> +}
>>>>> +
>>>>> =C2=A0 addtask rust_setup_snapshot after do_unpack before do_config=
ure
>>>>> =C2=A0 addtask do_test_compile after do_configure do_rust_gen_targe=
ts
>>>>> =C2=A0 do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
>>>>> @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export=20
>>>>> CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_SYSROOT/=
lib/${SDKLOADER}"
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export CC_$RUST_HOST_CC=3D"${C=
CACHE}${HOST_PREFIX}gcc"
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EOF
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'rus=
t-kernel',=20
>>>>> 'true', 'false', d)}; then
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ =
! -d=20
>>>>> ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p=20
>>>>> ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cp -r --no-preserve=3Downership ${S}/library=20
>>>>> ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>>> +=C2=A0=C2=A0=C2=A0 fi
>>>>> =C2=A0 }
>>>>>
>>>>> =C2=A0 FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
>>>> The commit message should mention the size of these files.
>>> Ok sure, I will add file size in v3.
>>>> Does this make sense as a distro feature or should we just do this=20
>>>> all the time?
>>> This is suggestion from Bruce that we take it as distro feature.
>>> https://lists.openembedded.org/g/openembedded-core/message/225256
>>
>>
>> Richard mentioned this thread in today's tech call when I asked for=20
>> commentson the rust-kernel PR.
>>
>> Yes, the high level requirement is to have a DISTRO_FEATURE but=20
>> common, infrastructure parts
>> such as this code that just copies a hopefully small number of files=20
>> around,
>> and is part of the rust recipe, could and likely be done regardless=20
>> of the rust-kernel DISTRO_FEATURE.
>>
>
> Ok sure, We will remove the dependency on DISTRO_FEATURE=C2=A0 for copy=
ing=20
> the library directory from rust recipe.


Hold on, I said "small number of files...". See below.

>>
>>
>> We don't want the rust recipe to change based on a kernel config=20
>> unless we *really* have to
>> since that essentially doubles the testing that should be done or=20
>> leaves a gap in testing of the
>> rust builds. If you do that for the kernel first, then another recipe=20
>> later, soon you have a maintenance mess.
>>
>> Also if the kernel needs these files, then it's likely that other=20
>> software will need it as well.
>> You should analyze why the kernel needs these files and why other=20
>> recipes do not. Perhaps any
>> kernel-like image will have the same requirement. Is there a=20
>> baremetal image=C2=A0 using rust anywhere
>> that you can use to check on that? I looked but all I found was:
>> https://github.com/ahcbb6/baremetal-helloqemu-rust
>> Anyway, let's focus on the linux kernel's requirements for now.
>>
>>
>> So, how many files are needed and how much FS space do they use?
>>
>
> The file size of the library directory is around 50MB.
>
>
I've been around since the 1990s, 50 MB doesn't seem small to me but
let's see what other people think.

Also, how may files is that?

What's the content?=C2=A0 ls -lR if the list isn't too long.

Does the kernel build need each and every file ? How did you check?
Can we automate the generation of the list of required files by scraping=20
the data from the kernel perhaps?


>>
>>
>> What are other build systems (gentoo for example) doing with their=20
>> Rust builds to satisfy the kernel's rust requirements?
>>
>
> I will check and update on this.


Thanks.

>>
>>
>>>
>>> In future when rust is default in kernel we can change this, But=20
>>> till then it is good to have it as a distro feature.
>>>> Do the nativesdk components get packaged separately? If they were, w=
e
>>>> could then make that an SDK feature instead.
>>> No, We are not packaging it separately.
>>
>>
>> The questions seems to be whether we should create a separate=20
>> packaging rule.
>>
>
> Now by default it is getting packaged with nativesdk-rust, Do we need=20
> a separate packaging for libraries/files that being installed for rust=20
> in kernel support?
>>
>>
>>>> What happens for on target kernel module development? Shouldn't=20
>>>> there be a target package too?
>>> Yes, I have made the necessary changes to include Rust library for=20
>>> target as well and have tested Rust-based kernel module development=20
>>> on the target.
>>> I will send updated patches with v3.
>>
>>
>> Before you spend time on polishing v3 please explain what your=20
>> workflow is, step by step,
>> so we can be sure that things makes sense from a high level.
>>
> We will update the rust recipe to copy the required libs to target=20
> image and then the below steps to be followed :

This part we're still trying to work out...

> - Build the image by adding the required tools via=20
> IMAGE_INSTALL:append ( e.g kernel-devsrc, gcc, rust, cargo,=20
> bindgen-cli etc..).
>
We could create / extend a packagegroup or use:
 =C2=A0=C2=A0 meta/recipes-extended/images/core-image-kernel-dev.bb

Bruce, what approach do you use / prefer ?


> - In /usr/src/kernel, run "make rustavailable" to verify Rust support=20
> (This step will check all supporting tools are available for rust=20
> support in kernel).
> - Run "make menuconfig" and enable "CONFIG_RUST".
> - Run "make scripts" and "make prepare".
> - Write a kernel module in Rust & build the module using "make", which=20
> generates the "module_name.ko" file.
> - Load the module using "insmod module_name.ko".


The rest seems sensible to a non-kernel guy like me.

Thanks,

../Randy

>
> Thanks,
> Harish
>
>> ../Randy
>>
>>
>>>
>>> Thanks,
>>> Harish
>>>> Cheers,
>>>>
>>>> Richard
>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------fVNLCAI0gXCRMncSPyj5Y0qe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-01-07 11:34 a.m., Harish
      Sadineni wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:663fe060-072a-43a4-b0f9-20e172007c47@windriver.com">
      <br>
      On 1/7/2026 12:29 AM, Randy MacLeod wrote:
      <br>
      <blockquote type="cite">On 2026-01-05 11:24 a.m., Harish Sadineni
        wrote:
        <br>
        <blockquote type="cite">
          <br>
          On 12/30/2025 9:28 PM, Richard Purdie wrote:
          <br>
          <blockquote type="cite">CAUTION: This email comes from a non
            Wind River email account!
            <br>
            Do not click links or open attachments unless you recognize
            the sender and know the content is safe.
            <br>
            <br>
            On Tue, 2025-12-30 at 06:15 -0800, Sadineni, Harish via
            lists.openembedded.org wrote:
            <br>
            <blockquote type="cite">From: Harish Sadineni
              <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
              <br>
              <br>
              The `make rustavailable` process (1) expects the Rust
              standard library source files (e.g., `lib.rs`)
              <br>
              to be present in the `library/` directory under
              `rustlib/src/rust/`.
              <br>
              <br>
              This patch ensures the required sources are available by:
              <br>
              - Copying the `library/` directory from the Rust source
              tree into `${TMPDIR}/work-shared/rust`
              <br>
              &nbsp;&nbsp; during the snapshot setup.
              <br>
              - Installing the `library/` directory into
              `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
              <br>
              &nbsp;&nbsp; `nativesdk` class, making them available in them
              available in sdk
              <br>
              <br>
              1) See the kernel tree for
              Documentation/rust/quick-start.rst in the section:
              Requirements: Building
              <br>
              <br>
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145</a>
              <br>
              <br>
              Signed-off-by: Harish Sadineni
              <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
              <br>
              ---
              <br>
              &nbsp; meta/recipes-devtools/rust/rust_1.91.1.bb | 17
              +++++++++++++++++
              <br>
              &nbsp; 1 file changed, 17 insertions(+)
              <br>
              <br>
              diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb
              b/meta/recipes-devtools/rust/rust_1.91.1.bb
              <br>
              index a25f65f674..7644ecf2d2 100644
              <br>
              --- a/meta/recipes-devtools/rust/rust_1.91.1.bb
              <br>
              +++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
              <br>
              @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
              <br>
              &nbsp; }
              <br>
              +
              <br>
              +do_rust_setup_snapshot:append:class-native () {
              <br>
              +&nbsp;&nbsp; if ${@bb.utils.contains('DISTRO_FEATURES',
              'rust-kernel', 'true', 'false', d)}; then
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ ! -d &quot;${TMPDIR}/work-shared/rust&quot; ]; then
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p ${TMPDIR}/work-shared/rust
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${RUSTSRC}/library
              ${TMPDIR}/work-shared/rust/.
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
              <br>
              +&nbsp;&nbsp; fi
              <br>
              +}
              <br>
              +
              <br>
              &nbsp; addtask rust_setup_snapshot after do_unpack before
              do_configure
              <br>
              &nbsp; addtask do_test_compile after do_configure
              do_rust_gen_targets
              <br>
              &nbsp; do_rust_setup_snapshot[dirs] +=
              &quot;${WORKDIR}/rust-snapshot&quot;
              <br>
              @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export
CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=&quot;\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}&quot;<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export
              CC_$RUST_HOST_CC=&quot;${CCACHE}${HOST_PREFIX}gcc&quot;
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EOF
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; if ${@bb.utils.contains('DISTRO_FEATURES',
              'rust-kernel', 'true', 'false', d)}; then
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ ! -d
              ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p
              ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r --no-preserve=ownership&nbsp;
              ${S}/library
              ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
              <br>
              +&nbsp;&nbsp;&nbsp; fi
              <br>
              &nbsp; }
              <br>
              <br>
              &nbsp; FILES:${PN} += &quot;${base_prefix}/environment-setup.d&quot;
              <br>
            </blockquote>
            The commit message should mention the size of these files.
            <br>
          </blockquote>
          Ok sure, I will add file size in v3.
          <br>
          <blockquote type="cite">Does this make sense as a distro
            feature or should we just do this all the time?
            <br>
          </blockquote>
          This is suggestion from Bruce that we take it as distro
          feature.
          <br>
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/225256">https://lists.openembedded.org/g/openembedded-core/message/225256</a>
          <br>
        </blockquote>
        <br>
        <br>
        Richard mentioned this thread in today's tech call when I asked
        for commentson the rust-kernel PR.
        <br>
        <br>
        Yes, the high level requirement is to have a DISTRO_FEATURE but
        common, infrastructure parts
        <br>
        such as this code that just copies a hopefully small number of
        files around,
        <br>
        and is part of the rust recipe, could and likely be done
        regardless of the rust-kernel DISTRO_FEATURE.
        <br>
        <br>
      </blockquote>
      <br>
      Ok sure, We will remove the dependency on DISTRO_FEATURE&nbsp; for
      copying the library directory from rust recipe.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Hold on, I said &quot;small number of files...&quot;. See below.<br>
    </p>
    <blockquote type="cite" cite="mid:663fe060-072a-43a4-b0f9-20e172007c47@windriver.com">
      <blockquote type="cite">
        <br>
        <br>
        We don't want the rust recipe to change based on a kernel config
        unless we *really* have to
        <br>
        since that essentially doubles the testing that should be done
        or leaves a gap in testing of the
        <br>
        rust builds. If you do that for the kernel first, then another
        recipe later, soon you have a maintenance mess.
        <br>
        <br>
        Also if the kernel needs these files, then it's likely that
        other software will need it as well.
        <br>
        You should analyze why the kernel needs these files and why
        other recipes do not. Perhaps any
        <br>
        kernel-like image will have the same requirement. Is there a
        baremetal image&nbsp; using rust anywhere
        <br>
        that you can use to check on that? I looked but all I found was:
        <br>
        <a class="moz-txt-link-freetext" href="https://github.com/ahcbb6/baremetal-helloqemu-rust">https://github.com/ahcbb6/baremetal-helloqemu-rust</a>
        <br>
        Anyway, let's focus on the linux kernel's requirements for now.
        <br>
        <br>
        <br>
        So, how many files are needed and how much FS space do they use?
        <br>
        <br>
      </blockquote>
      <br>
      The file size of the library directory is around 50MB.
      <br>
      <br>
      <br>
    </blockquote>
    <p>I've been around since the 1990s, 50 MB doesn't seem small to me
      but<br>
      let's see what other people think.<br>
    </p>
    <p>Also, how may files is that?<br>
      <br>
      What's the content?&nbsp; ls -lR if the list isn't too long.<br>
      <br>
      Does the kernel build need each and every file ? How did you
      check? <br>
      Can we automate the generation of the list of required files by
      scraping the data from the kernel perhaps?<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:663fe060-072a-43a4-b0f9-20e172007c47@windriver.com">
      <blockquote type="cite">
        <br>
        <br>
        What are other build systems (gentoo for example) doing with
        their Rust builds to satisfy the kernel's rust requirements?
        <br>
        <br>
      </blockquote>
      <br>
      I will check and update on this.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks.<br>
    </p>
    <blockquote type="cite" cite="mid:663fe060-072a-43a4-b0f9-20e172007c47@windriver.com">
      <blockquote type="cite">
        <br>
        <br>
        <blockquote type="cite">
          <br>
          In future when rust is default in kernel we can change this,
          But till then it is good to have it as a distro feature.
          <br>
          <blockquote type="cite">Do the nativesdk components get
            packaged separately? If they were, we
            <br>
            could then make that an SDK feature instead.
            <br>
          </blockquote>
          No, We are not packaging it separately.
          <br>
        </blockquote>
        <br>
        <br>
        The questions seems to be whether we should create a separate
        packaging rule.
        <br>
        <br>
      </blockquote>
      <br>
      Now by default it is getting packaged with nativesdk-rust, Do we
      need a separate packaging for libraries/files that being installed
      for rust in kernel support?
      <br>
      <blockquote type="cite">
        <br>
        <br>
        <blockquote type="cite">
          <blockquote type="cite">What happens for on target kernel
            module development? Shouldn't there be a target package too?
            <br>
          </blockquote>
          Yes, I have made the necessary changes to include Rust library
          for target as well and have tested Rust-based kernel module
          development on the target.
          <br>
          I will send updated patches with v3.
          <br>
        </blockquote>
        <br>
        <br>
        Before you spend time on polishing v3 please explain what your
        workflow is, step by step,
        <br>
        so we can be sure that things makes sense from a high level.
        <br>
        <br>
      </blockquote>
      We will update the rust recipe to copy the required libs to target
      image and then the below steps to be followed :
      <br>
    </blockquote>
    <br>
    This part we're still trying to work out...<br>
    <br>
    <blockquote type="cite" cite="mid:663fe060-072a-43a4-b0f9-20e172007c47@windriver.com">-
      Build the image by adding the required tools via
      IMAGE_INSTALL:append ( e.g kernel-devsrc, gcc, rust, cargo,
      bindgen-cli etc..).
      <br>
      <br>
    </blockquote>
    We could create / extend a packagegroup or use:<br>
    &nbsp;&nbsp; meta/recipes-extended/images/core-image-kernel-dev.bb<br>
    <br>
    <p>Bruce, what approach do you use / prefer ?</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:663fe060-072a-43a4-b0f9-20e172007c47@windriver.com">- In
      /usr/src/kernel, run &quot;make rustavailable&quot; to verify Rust support
      (This step will check all supporting tools are available for rust
      support in kernel).
      <br>
      - Run &quot;make menuconfig&quot; and enable &quot;CONFIG_RUST&quot;.
      <br>
      - Run &quot;make scripts&quot; and &quot;make prepare&quot;.
      <br>
      - Write a kernel module in Rust &amp; build the module using
      &quot;make&quot;, which generates the &quot;module_name.ko&quot; file.
      <br>
      - Load the module using &quot;insmod module_name.ko&quot;.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>The rest seems sensible to a non-kernel guy like me.</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:663fe060-072a-43a4-b0f9-20e172007c47@windriver.com">
      <br>
      Thanks,
      <br>
      Harish
      <br>
      <br>
      <blockquote type="cite">../Randy
        <br>
        <br>
        <br>
        <blockquote type="cite">
          <br>
          Thanks,
          <br>
          Harish
          <br>
          <blockquote type="cite">Cheers,
            <br>
            <br>
            Richard
            <br>
          </blockquote>
        </blockquote>
        <br>
        <br>
        --&nbsp;<br>
        # Randy MacLeod
        <br>
        # Wind River Linux
        <br>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------fVNLCAI0gXCRMncSPyj5Y0qe--

