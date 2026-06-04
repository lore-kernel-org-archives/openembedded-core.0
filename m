Return-Path: <bin.cao.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6EBCD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 10:17:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8068.1780568266473723716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 03:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PAn7BPQx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061546ea1f=bin.cao.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65498Les2577164
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jun 2026 03:17:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=478rfn7VCr0Him1nWDUObKUQ71J9VRQUnbAuT05/Hzo=; b=
	PAn7BPQxYVTLtefOgSc5WqJ7xL97qC7beF0QUYRB6s79ppwIinz9inf5xJvbPA/x
	ZjE/IhmgewcnK7mL+v3m0T8SZHLv8jAVza+Y4BNwsVkKDWrkI0DwMTKpeOCf087N
	biL1HS1riyekglfSXPOb8iY73xALuxwjYG+m4Vc3IQ5raNApg2cn1ZtA+i11tmw7
	TzmpInZu/XhT6IveJhcAABA3VzSigtn3JdeAWuBmDCuvdKf1SDtEqSuzuF78C/KC
	57/ykvzGxaJN+S/ZeccZMC5gKi9AwB3Z/9Gk9OULzlyFp96Z1hFw9zUjUSiZQSjp
	c7Svq/9w54S4bOUVQmlyTA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010033.outbound.protection.outlook.com [40.93.198.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ek5m3046f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Jun 2026 03:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tl7R35T0wlH2la36OBZCNSiucWQgSNlonLmCYPXcHL1uM8iuM9guQsDz5sJfIfY/5tCUNuaNvqgFt42fIypHxiQxFqpM8jIqPdfGeQYPpFQQ/xgrVBIEtIC88LKrhIYVO1LJ8DtvQVkeg5xcbydb3WBWKYLpfXHw4MreK8jjKyKl1jh6H+BO64QqMrSZfZ6q2a9Pvz0wR9WQglrOGPVDM3s1VAa4YJpBR0AZ1EzsG1Tm+TF5E719oIL38qWomTsDiFfFQ00qw3i8+5nB8Ktpyy7FdCYZl5v8GSV/3WIrei0hFVbAGab+NySHcanAA/Db7jSOc0njQYWfAzm6oWv1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=478rfn7VCr0Him1nWDUObKUQ71J9VRQUnbAuT05/Hzo=;
 b=Wb5AdoDrX7qM9FqBhQ6FzoXHVShUdqkOj9ZFSEYv/D+yR3wfuF8Mb/Mzfo61SH7vsiVwXuC6RvhT4eZ0ctARFVfnJRke3TqGQa8p8svTvWqp3ZliPMWsVSpgXZw/xepz/++k4kELiYfo67GD+ZPBi+3ljdkz73yQavlYcpA7lu0oaowKZAUTdEPBa2DHWLXcoH7Bez3RaQdYt8vBgQQHNIRj16/UatchbgGEwlfgNGG7KDXyRvee0wtKJMLj8hxQCHpDg/HxNxNBqIjH/vCJmmAo8BKnwjGvG0fkrpwFj9/+GyoJ95uLEmRyP/usI2ePvw2IIKnAcP/2pklBdGKLAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9)
 by SA1PR11MB6941.namprd11.prod.outlook.com (2603:10b6:806:2bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 10:17:36 +0000
Received: from BL1PR11MB5319.namprd11.prod.outlook.com
 ([fe80::ec64:aa59:c014:d275]) by BL1PR11MB5319.namprd11.prod.outlook.com
 ([fe80::ec64:aa59:c014:d275%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 10:17:36 +0000
From: "Cao, Bin (CN)" <Bin.Cao.CN@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] python3: sanitize userbase in _sysconfig_vars
 JSON to avoid host path leak
Thread-Topic: [OE-core] [PATCH] python3: sanitize userbase in _sysconfig_vars
 JSON to avoid host path leak
Thread-Index: AQHc8/PV4sFNYcH6ekGxxAShMSUFqrYuLjFg
Date: Thu, 4 Jun 2026 10:17:36 +0000
Message-ID: 
 <BL1PR11MB53194E1C3D9D5C2DCD2EC52ADE102@BL1PR11MB5319.namprd11.prod.outlook.com>
References: <20260604050245.2932931-1-bin.cao.cn@windriver.com>
 <CANNYZj-Jou5mg=-57omtthGH1s3Jq3ezz0KGA2NtCJVeh6tyiA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-Jou5mg=-57omtthGH1s3Jq3ezz0KGA2NtCJVeh6tyiA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=2136e162-83df-4223-9305-67ce12a643d1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-06-04T10:15:20Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5319:EE_|SA1PR11MB6941:EE_
x-ms-office365-filtering-correlation-id: c56cd33d-13ec-4d03-e5af-08dec2227ff4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|38070700021|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 mE3dK5VstXlashgWSIk0Vo1z1eQ6waldOVLPok6ZPPy67UTalYm6wop03W+JXZE76W8vNXx8I20yH9ssfRoWp/3Z8f1qMe9suPfn001F/pAjg72JN4Q8m79myDw5UB4SdUbGxNJPm2PeoCYmj27WErS0v0Qj5pNtU2tgrM3NDiKkfv6mClzPbu6uduL552SJNjbDzZSFPOzH4P9MBZ//MgAHm6l6w6dkt37dR4OaOT1wipXX8jCjelSl+J8B/GR0pA0jfbBL5WrtvRD+Hmv/UJZm2tappzbYxAi0S2CYP6b3i82NatTm1Fn8mVtPsX1/t1crSafAZQDU3RspWOqA63bxW0NDknDPyigI84HV2PLBoLfcsIZ2htTSvXdAaG1SzGS8BZ9f8oWCFUqDEdeeZIu6LskUAWWmXvduow+MwWCwAFmlf4y0o856esWL7h9g0pU86GvtRQ3SevQpZspAs1bySiyqRYah8Nbt0Zfj6rRW/z3Xn/6GniYAgPCwjQxxnWsVyXsWHS6tJu0EKqelG2wHbRfRmN5/67LIiQP4sZXux7yLfyLp2D+czRhvygp0UALKoWkp+WGAjK94N/thtEBEhQLZbQh6cl/5Vbam89/C049vnGwWlUi4sdK66MJwVu8Rrfuj8twHZUkKCAyjtzDZoBE2k7LdlufNZN+TNXnQWy3wF/eZXzG353ZioRZymCyPxyiS2NKT+3qvh/vlkKrCReYA7fyqa9K0TIha2Se80YW8EHIyMmFawYQTz5gB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5319.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZVRTTmxlVFlCTjFDMG9xUFE0elUxMVJSTm1qZU9SaTc0NytTUkVsT3VEZmYr?=
 =?utf-8?B?K0c4WkdzcnJqUGU5WnV1NmxTTmN3d0RnbTlGY1paRnhGdkxlUWNHd0xRL2pi?=
 =?utf-8?B?OTNvQkc3VXdoWnZwT0N5SUcrNzZZeG4vclhzSmJvNmVKaXR3bmhBc2xuaUJG?=
 =?utf-8?B?bGNrdjBVQUU3UHFiaE81U1VRd0tUOUFXdUk2WXliMzB0QkhSSXlnQXVUdFA1?=
 =?utf-8?B?NzRpMUFibEZwNnZ0aWFmWmNrM3lIMjEwUWtENEN2NmFqQTFDcE1ROGtYK2hD?=
 =?utf-8?B?cjFPeFkvOFNEWC9KcTRjMmRTMmlXU3ZUMlg0bWFUTzVIRlk4dlp3UldhWXpZ?=
 =?utf-8?B?MHBaM2RzaWhOZWVuN1NYWHViU2p2cHREbjhzT3ZkOWxTdG5BWlZyTm9hdHg1?=
 =?utf-8?B?OXFmZVl0a1ZtTzVhTC85TTlNU1ZKSVB1R1ZPYjJWYUFCdmdXdGovMWhrMUo0?=
 =?utf-8?B?cERBY1dIUnVWMTNsNHgzQm5EMDVBTlNlYTVCN2JmdlA5YkQ3MDJ5MEhQQkJH?=
 =?utf-8?B?SUF2b0laYmZCV0RDUVhScWNnWXRZbUdJWEtOWGJXV2ZvdDBUS3NPdmdrRHRZ?=
 =?utf-8?B?WnkwUmJ6eW80UGl2MWF1ekUwaXRLM0xvY3Z6S2dzOHBwcnF3cElFMUQvc3RB?=
 =?utf-8?B?MGh5a2NYUS8zR2xSdHdsRjEwbDYySkpVSDUxZFlhREloZHVibitFMDBjQ3ZX?=
 =?utf-8?B?SWNFVkpreWxSVUZsNkZaSEltc0dGc0QrdFFWWkR3ZVhnZUZBaVBMTkN4QkNk?=
 =?utf-8?B?a3prZy9nQzBJbUtxRVNCdDFSWUhGNjlhL0g3Y0hvUnlYYitycHJScWh3MmpC?=
 =?utf-8?B?elgxN0pvOHlJTXFXNU9BOHd3L3VCa1dvZGc0R21CUndmbm1teHRydkZHMm5Y?=
 =?utf-8?B?OWdlQTdPRU9rU0hXbkFrMFZqWVVzUEVWb2JHcHZQMitNY1lJQ2psNVN3Tzcr?=
 =?utf-8?B?NThNcUoweHFuNEZFUnJDZGxiYlhVaVQ0QUxjY0hiNHZVZ0RSdzk4T1NXMzFB?=
 =?utf-8?B?Ymx5OFAxMjRGZEJhcHg0OUdjeVRvVXRhamJMMVBaSUlQYjFnckgzS2srZkdD?=
 =?utf-8?B?bFlWbGg3S1JXWlp4TTJQN0FUMXVjREU3UCtVMm8zSmk4WG1tS0lUMjljZFZa?=
 =?utf-8?B?TmZPdHJMbGtONUxNaE45ZVdvYUhKY3FaVHN0ZE1yZXhpVkhabnN4M044Q0g4?=
 =?utf-8?B?WFRPbytYdUlZOFNhcHJWcE5VRkNaWFY2TUlGS1VIVkRoZTVmNFg2ZVBzdVkx?=
 =?utf-8?B?ejB4dVR0UCtKWFY2NnpkL09UQXVhNFJHSHZPLy9xajNrdFdmSVQvendlZGMw?=
 =?utf-8?B?T2Y3d21NMWdoanhzUEpKU0NBZzRSNDJydW1FeTdLTnhtckFoWlVoNXhYRXFz?=
 =?utf-8?B?N1IrS0kyTlhGRVEwN1ZQdUxFM0thSXVOV0V6anV0TmkzVWVlRmszbkIrQUkv?=
 =?utf-8?B?U1d5RFhTdGZlQ3M0TkVOemVwUzRuai80OUZ5ZU1hOCt5TkdsRkJJVEUwdUxD?=
 =?utf-8?B?UUZVVGVlWVpEdm9aeTl6N1Zxay8zdnFnZU5aNGpISGJPWE1jS3RGaDhMWUxm?=
 =?utf-8?B?MTluaUJ3c1pMUUpaMEpGNjBRWjNySUtNcWJ5UG1rM2l0RE8xMmIwcStaMXZT?=
 =?utf-8?B?WlVyc0IzM01OUGJaS0pkb0svK2NmNVZrcGhQbWtubHVvaDRLL1RUc0w4NURT?=
 =?utf-8?B?UWpEdUUzdnZJckhaWE8xTjFJbEJQUFFyQUtBM0N4NU9veVRMNkdadG5Ldmxa?=
 =?utf-8?B?ekhETDNxUGg5SDd5LzJ1L3k5VXVJUVFnRzhXOWVHa0daZ01ERnpjVGZMbVFp?=
 =?utf-8?B?VFdLLy95c2pYczR6YmhTVWFqcVlSK1N6SEo3NXVQSGhGWmkxYkdRZFpSOWxa?=
 =?utf-8?B?dy9PMTdHalVrb3YvdHgxeFB5WmdISWpOY1E4a0E1eWx4S09ZR2VQWHhDeFlO?=
 =?utf-8?B?ZWt5dlg1NVRjeW5IWmdMaTVGYit3bHVOMklzek1KSjFrTXpuM2pyOG9TSGlP?=
 =?utf-8?B?WktUN2NLUi8vWmdQdmN6OXI4QlFyOTlFNkdxWWdKVEVua2w4bnRFZWxLWDJY?=
 =?utf-8?B?bVNydlNPR1FvbG5HTzBvWGhQK25pVDBKaGRqSE80dWpQOUluMzhTOVhpWldM?=
 =?utf-8?B?QWlteXlZSXAvcVpKc0QyWUVseHMrRU5uaWZsRmxNRFpjRE9kV2FIU2ZXek96?=
 =?utf-8?B?bXlBMGlxQWZyMkZkQ09USUVPMm9uNlprSEtlSmNmMHlNM0dRM2hNazRLOGpD?=
 =?utf-8?B?V0lSSWpjbHZwNERlRVVwbUVwS2ZBbU41WDdCakN5NkVRQ0JkMDlYOTlWMlNQ?=
 =?utf-8?B?djN4TjFxZ1BSTkIzeFFHZW1yZnFuNVFGdkVmYmJYd0NxM0NuQklJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	bSvexmR8wqVK3A3eI+o9n/5UtOKE0MsubJbdlyCb88AgcM1TIImzxAniEIU5d0KSA21K+pJM0zzL1e2pbPoP+aoQax433HZ0YtdgAaDru1C2fSp82rawe75DZVgC+llmA2kRRgE+T8DQQ20DHE5fM0ZkpBC1HTJMJhjTZnH6FjZ7QggQTMFTptjnZjuwoieMrzy4bl0yK+QzCQ3bH1D1yJAXz9TtuIGTt1ukYeuSAoF8AxoZOD2yJGm7meb/boQPWj2DSokPX3ZVQunILEkeRqWW2EGncVt/qlLL7ablqmmP5iDX9s+Up9F35QV0GLUjJCWwI99yzHz8z6IVzu+GEQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5319.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56cd33d-13ec-4d03-e5af-08dec2227ff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 10:17:36.4389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKfvi8GBDTBOa7fRiMjHQrh8PAd5fo4Pvty3shqvVwdudxMO+hMCr0ruA1mhwnFfPpaIccOxFZV6/3laFKkAsrrUmiIKabMr0S9Z0C3kxNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6941
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5OSBTYWx0ZWRfXzKwEzWNDsrfT
 WWF7sCKO8AQ7n6sSjDuce/e11329XgiOC5nfOcBu9OxtQM7zhDeTVRZ5Fj1CIoEYwFEtfijCUhG
 OnbKPzXx2aczf2ZvD5LT0Wx9o7ii6vxbVfAYrXw+7UsgdP+1zAtGg4vb3SkZC1ahLyrBTaWPkGY
 MTR1OZeOGdt2heWgUyirHJrA8QpvVLO9xCd6KOw1vzwGed96lUEUqwWSQBCecWyXwTZ0sKcAh20
 Mx8+wXgPE+WDIvT0N8ovdxrHR/4Ygcc7yMz74rQoT/JpJzeYSCZ9+yAaKRgkCeTKD4WkrH5zKSB
 qGFdpl2r4LAjA3SLJf+R6lGFliRl7WgP39q6o/L122f+nRPsSjVpCYPdGlAdseBQ1WfxiEaZBtU
 iDA4BQvTLvuidVRCSwFWsVI2CxLGkEPKbASutvmzXZfuIQUe4XBPqjMuSyDMoubzosJgktbeJix
 sm1gEVmVMi++swYyEZg==
X-Proofpoint-GUID: __3XlPIaABLGHTXSANgq2Lu_7yoY4i0c
X-Proofpoint-ORIG-GUID: NSFEQcyn8zi60owt-IYatL37D5MbURqP
X-Authority-Analysis: v=2.4 cv=CPsamxrD c=1 sm=1 tr=0 ts=6a2150c9 cx=c_pps
 a=bAGtXK+quTc+G+CnAReeow==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=LVVdaqqDU9W9cF4QaU8A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 10:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238122

VGhhbmtzIGZvciB0aGUgY29tbWVudHMuDQpJIGFkZGVkIHFhIHRlc3QgaW4gdjIgcGF0Y2guIFZl
cmlmaWVkIGl0IHdvcmtzIGFzIGV4cGVjdGVkIG9uIGJvdGggZml4ZWQgJiB1bmZpeGVkIHZlcnNp
b25zLg0KDQpUaGFua3MsDQpCaW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IDIwMjbl
ubQ25pyINOaXpSAxNToyOQ0KVG86IENhbywgQmluIChDTikgPEJpbi5DYW8uQ05Ad2luZHJpdmVy
LmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gcHl0aG9uMzogc2FuaXRpemUgdXNlcmJhc2UgaW4g
X3N5c2NvbmZpZ192YXJzIEpTT04gdG8gYXZvaWQgaG9zdCBwYXRoIGxlYWsNCg0KQ0FVVElPTjog
VGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCkRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXpl
IHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCg0KSSB3b25kZXIgaWYg
dGhlcmUgc2hvdWxkIGJlIGEgcWEgdGVzdCBmb3Igd2hhdCBnZXRzIGluc3RhbGxlZCB0aGF0IGNo
ZWNrcyBzdWNoICRIT01FIGxlYWthZ2UuIEl0IGJyZWFrcyByZXByb2R1Y2liaWxpdHksIGZvciBl
eGFtcGxlLCBidXQgWW9jdG8gQUIgYnVpbGRzIGV2ZXJ5dGhpbmcgdW5kZXIgb25lIHVzZXIsIGFu
ZCBzbyB3b24ndCBjYXRjaCBpdC4NCg0KQWxleA0KDQpPbiBUaHUsIDQgSnVuIDIwMjYgYXQgMDc6
MDIsIEJpbiBDYW8gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGJpbi5jYW8uY249d2luZHJp
dmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4NCj4gVGhlIF9zeXNjb25m
aWdfdmFyc19fbGludXhfeDg2XzY0LWxpbnV4LWdudS5qc29uIGZpbGUgY29udGFpbnMgYSANCj4g
InVzZXJiYXNlIiBmaWVsZCB0aGF0IGlzIHBvcHVsYXRlZCBmcm9tIHRoZSBidWlsZCBob3N0IHVz
ZXIncyAkSE9NRSBhdCANCj4gYnVpbGQgdGltZS4gVGhpcyBsZWFrcyB0aGUgYnVpbGQgaG9zdCB1
c2VyJ3MgaG9tZSBkaXJlY3RvcnkgcGF0aCBpbnRvIA0KPiB0aGUgdGFyZ2V0IHJvb3Rmcy4NCj4N
Cj4gVGhlIGV4aXN0aW5nIHB5X3BhY2thZ2VfcHJlcHJvY2VzcygpIGNsZWFudXAgZm9yIHRoaXMg
SlNPTiBmaWxlIG9ubHkgDQo+IHN0cmlwcyBrbm93biBPRSBidWlsZCBwYXRoIHByZWZpeGVzIChT
VEFHSU5HX0RJUl9UQVJHRVQsIA0KPiBSRUNJUEVfU1lTUk9PVCwgZXRjLiksIGJ1dCB0aGUgdXNl
cmJhc2UgdmFsdWUgY29tZXMgZnJvbSB0aGUgYnVpbGQgDQo+IHVzZXIncyAkSE9NRSBlbnZpcm9u
bWVudCB2YXJpYWJsZSB3aGljaCBkb2Vzbid0IG1hdGNoIGFueSBvZiB0aG9zZSBwYXR0ZXJucy4N
Cj4NCj4gU2V0IHVzZXJiYXNlIHRvIGFuIGVtcHR5IHN0cmluZyBpbiB0aGUgcGFja2FnZWQgSlNP
Ti4gVGhpcyBpcyBzYWZlIA0KPiBiZWNhdXNlIGF0IHJ1bnRpbWUsIHN5c2NvbmZpZy5nZXRfY29u
ZmlnX3ZhcnMoKSBhbHdheXMgcmVjb21wdXRlcyANCj4gdXNlcmJhc2UgYnkgY2FsbGluZyBfZ2V0
dXNlcmJhc2UoKSwgd2hpY2ggcmVzb2x2ZXMgdGhlIGFjdHVhbCB0YXJnZXQgDQo+IHVzZXIncyB+
Ly5sb2NhbCBwYXRoIGR5bmFtaWNhbGx5LiBUaGUgc3RhdGljIHZhbHVlIGluIHRoZSBKU09OIGlz
IA0KPiBuZXZlciB1c2VkIGZvciBydW50aW1lIHBhdGggcmVzb2x1dGlvbi4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogQmluIENhbyA8YmluLmNhby5jbkB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjE0LjUuYmIgfCAxICsNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTQuNS5iYiANCj4gYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xNC41LmJiDQo+IGluZGV4IDJmODIxYjEzMGYuLmNj
MThlMTM3NDcgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uM18zLjE0LjUuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zXzMuMTQuNS5iYg0KPiBAQCAtMzkwLDYgKzM5MCw3IEBAIHB5X3BhY2thZ2VfcHJlcHJvY2Vz
cyAoKSB7DQo+ICAgICAgICAgICAgICAgICAgLWUgJ3M6JHtSRUNJUEVfU1lTUk9PVF9OQVRJVkV9
OjpnJyBcDQo+ICAgICAgICAgICAgICAgICAgLWUgJ3M6JHtSRUNJUEVfU1lTUk9PVH06OmcnIFwN
Cj4gICAgICAgICAgICAgICAgICAtZSAnczoke0JBU0VfV09SS0RJUn0vJHtNVUxUSU1BQ0hfVEFS
R0VUX1NZU306OmcnIFwNCj4gKyAgICAgICAgICAgICAgICAtZSAnc3widXNlcmJhc2UiOiAiLioi
fCJ1c2VyYmFzZSI6ICIifGcnIFwNCj4gICAgICAgICAgICAgICAgIA0KPiAke1BLR0R9LyR7bGli
ZGlyfS9weXRob24ke1BZVEhPTl9NQUpNSU59L19zeXNjb25maWdfdmFycyouanNvbg0KPiAgfQ0K
Pg0KPiAtLQ0KPiAyLjQzLjANCj4NCj4NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlu
a3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcv
UmVwbHkgT25saW5lICgjMjM4MTE0KTogDQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjM4MTE0DQo+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExOTY0MTM5Mi8xNjg2NDg5DQo+IEdy
b3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS91bnN1YiANCj4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+DQo=

