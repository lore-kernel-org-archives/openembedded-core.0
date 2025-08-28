Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F493C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 09:45:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16997.1756374297409343143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 02:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sdScTRA+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0335ea6984=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57S7kEEx2226053
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 02:44:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ME2WXjcPhvyuRzdrWIPOIZ/CN1J1R+1xTp1eIP0rE2w=; b=sdScTRA++zPO
	+/ZTM+gK5QpVp8nhBWDyfJPYFzNjO1qVVvumsodtx+DtirqNXL0WEnuUB6HDaQ2W
	3UScQPiEPNxAv17qj7jGBQFnmzkS+htrj3vVFrfk1zFwU1CxeW1z6zzD4XjGtOx/
	Ey4KsaE+bUL0t/ZD9WgORZ4+NfC/GdHSo6mjmoIQ7UKNLrgeqXTP0LnyhWCeP3dB
	BCScVlOtEfEyAtaTbh54MKxjvbvOzP0DrAyyw4cq0QeFHC+xjMxgUqdZqpmZdvkN
	OAlkRNubw6oHHbREUIpcThYVpuHsoAJcWpeZUrpC+k38q/fa36lvKDQq3kTR7I5j
	XdzI4d6E3A==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48qd5hne0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 02:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Byq0ryN+CFFloXexQhRkpcDZz0W1Tz1zDw5EA7759A7HhNX25/qrWdWup2Qr7+CgN7ZkyQ5Ltqzeor0MzWITmLhiMLPwpfhcbV2o0nR6D2/+pngyTGbhsUXM8xelyraUkyDzvEvLt92OksNZf6s0Igm23t5IpDOXHbcSUU9beBi9zv/nnyGboXpZcaX/ArRmJF1Nm7XqV1wTcnDtNb22i0x13CDEccY5PLQsPOjlZj/p5iQiH1xArkZHAN7SBpBVDmZv+lNobwqt9gBCAXZwrQdZLpY4A/5S3yAWe1fxzrJBCNgqZY/NaycQqOPwxQkRahJEJIWZWMPeP7/wy/xukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ME2WXjcPhvyuRzdrWIPOIZ/CN1J1R+1xTp1eIP0rE2w=;
 b=EqlPS7jeVc+klytaYVcT7Y2odK0kL8KgMg6BG0kumvARwyZd7eksihEcpjwCDGQALjagz3hUq+WGxs3ZDmGuhsvq2SySaTi5et1/JR3FOQzO2oYbsj2z31xA7HEtsMcFrpbFjYlcig9b0QCXrp5UyeiTFGGigOdpZyHYjYb/G5tBW5MrSJfm0DKoLHEL/ls46IXyxv0KoUOc/WPlUHdROSG1gXANL6nkOXQrhrfg85EpG/cbloyNxzgieda1lW++/Sauj93Soj9kKorNRHMEYlwd7mE9a1yobyikxblmOcJNwOE+yibEhu9OuakEdbEFNQyg9dsDIKRUYVVlnkqEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Thu, 28 Aug
 2025 09:44:48 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 09:44:48 +0000
Message-ID: <b0888e2e-b8eb-4707-8242-2abf5f7e86db@windriver.com>
Date: Thu, 28 Aug 2025 17:44:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta][PATCH 1/1] kernel-fit-image: skip kernel section
 if linux.bin is missing
To: kavinaya@qti.qualcomm.com, openembedded-core@lists.openembedded.org
References: <20250812091453.1760880-1-kavinaya@qti.qualcomm.com>
 <20250812091453.1760880-2-kavinaya@qti.qualcomm.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20250812091453.1760880-2-kavinaya@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0247.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::18) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA1PR11MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f5f83c-2c0f-4318-acf7-08dde6178775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFhOamIwWklnLzUzUXJGVzNWT1k1Q2x1amUraWJDVjBDNXpGVmxOeGd3QnBv?=
 =?utf-8?B?d1ZOWVhTVXV5aXh1Zm83bm41TkxUZVhpenhVV2V4cmVRdmtqU2YxdkMrNG5O?=
 =?utf-8?B?dnpmaEozYzVqaW91Qm5hWXdyUnBsazhYcmNLK2J2alpsM1Q2QmVGZldobU55?=
 =?utf-8?B?Qi9PY3MraXczSzJhN0lTSytGS2ZOY1dCQ093Uno1VjVSb2ErNzdZbUJzM3ZC?=
 =?utf-8?B?TTRVRG5nUTBFTDF2WnNaRW4xNTE4blhIbkZQQ2JPa1QzcGZjdHVadWdQVHkr?=
 =?utf-8?B?clNuWk56MDJuV3IvSG1qN3Zja2JjR2E5MzhOckszNk9kTjU4Z0l3cE8rVC9t?=
 =?utf-8?B?M2ZVbG51SEUxNHV0bzUrMFNFdnQwUjA1VEZPTkhuallpeVVsTkFOY21Zc3Ri?=
 =?utf-8?B?K0t6QW0wZmh1WG95NVRuajVMOG9KcTBHakdXZGhVRk5sSE9pUW1MVHQyenA2?=
 =?utf-8?B?ejdQQjZ1U3NIMHNNK2NobFpyeUdwMmYxK0tNZ0c0QThQeWx6clZ3SmVReEFG?=
 =?utf-8?B?dzVTcU9OaU04RitJaXVVRjkzN0paamY2Wms3S1MxNnZJTUJTSk5nUm9UbEQ3?=
 =?utf-8?B?VFdERkovNFhaU2JIREw5VGpPMmJ5bS83Q0pvZVh3Z1JDNUtKVnNuUUJaKzI3?=
 =?utf-8?B?dTRXNy8xU1FVVytYdmcvNjc1VHJoc2RIQkpTdTVTWW0wcXVVVll0dWRIaW1l?=
 =?utf-8?B?eUZRZW05b2E5Q0xBM0NhbjBSVjhoRU9qdk40Y0lpdE5MZzlPeFJjU0xPWmc0?=
 =?utf-8?B?aFJjQjh4amFHOGJZRnRyZ0srM0FuUlZFTy9jOHoycFdmWGdKOFo0ZFN5cUhZ?=
 =?utf-8?B?QTk1M1RpMC9pcGJ2TzMzWDdMNFNnV29OMkV0ek5YUGtoWDVrVUxPUkNaUHlV?=
 =?utf-8?B?QWtVbDM2LzhMTkI4dUs5T0F5Y25vcG0wTGVsa2o3eXlkdUxySUQxOGJqcjVn?=
 =?utf-8?B?WnpMZ3d1SHdYdXV3d241SEdmRVM1dFEzZUF1WVk1clpqK0F0ZGxSRUlyNzB2?=
 =?utf-8?B?WXhhSnJRK1BrY215VGJtV3MzRE1rQXNRbUJiTzlUcWV4QW96cXlDMmtEQVN6?=
 =?utf-8?B?NVBTREJ4ZnN4elhJWHlwMWx3dXV3dHdjR2FDOU1KVlRXYmJoT3h5c2dmYzFw?=
 =?utf-8?B?ZlF3Ynh3c3hYMTRmWTNyOHBmSmpwMWtzNHd3Mk1oR3lDOWVuWmsvY1ozWDM1?=
 =?utf-8?B?RWk2MHVHYndRUjN2SG9ORnNlNmdRL0MxWmpqRVNtMmhlVTZKNlMwK3gwblAv?=
 =?utf-8?B?b1FCL2hiUldDRkphdFJUT0FiU2hFdUdIdDlpL2M4cThlNmFJUWl5RUswMTAr?=
 =?utf-8?B?TDVVQUVKVW5wKzZEL3ZqeUJsRitLRm55bHRRWGNZd29oRXhoZGE1WXYwTEFY?=
 =?utf-8?B?ZUxWWDVhR0tGOU9KeXgvU0NIYkt6Z2IyT0plREVvS2oyR1hxTUR4QkFNSVZL?=
 =?utf-8?B?czlLKy8ySmNOKzNEMXM2S0thWloxZ21tTW9iUEdHdDhDNWpUQ2dsUjBEYlhF?=
 =?utf-8?B?NDRFdHVWNWNKV3p6aHFrbk9PUXZjWWtPMzJzMVBzNHpBN0k5bzVmc2RFOWdv?=
 =?utf-8?B?RGxjQVAyZDZqeEV3VTE3aHdDWElKbStNaDRVa2dZVDNSd0Fzbkh2VmlOL0o5?=
 =?utf-8?B?YnN1dk5CZzAza20rZENRYWxrUzRGZUh4MEpMc1Jva2E3Z3QzWlFXZVhxbFAr?=
 =?utf-8?B?SzRJYUtuQUhHSUN1VVgydWVWQW1jREhXMUJ5dElZN0pwRzJhc25aT29jckZS?=
 =?utf-8?B?YnFINURBWXNiNTJpbkgybmduZmNVa1RhN1cwemwyZXBNOWNJT2hZbXBPQ1pW?=
 =?utf-8?B?eE1HUDBvUnJsQlRzQ2RQS3I4UFVLM0JxZTNzdGFPNmhUcGJHUGZWWVdYYTNB?=
 =?utf-8?Q?A5v453xTvVp9V?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T01waWdIVkM2WVFwS2FzV3Q2VXl4cGdFcUpScUlGOEZuTUIxc0Q3c2NQNTEy?=
 =?utf-8?B?VTgyc0VyTUlWV0RyRmV0SHdEUkE1ek1yb2pSZnNNZ1BoYVdLRWV1ckx0UHRr?=
 =?utf-8?B?cnNmTEdNMVE5VUVodGdTQWFFVk16dFMwczVQMXR4MGpaSzEvMzQ2UEpWeTBB?=
 =?utf-8?B?b2tsdGdHWjg1M2NENkxtVEVjRktxM2Z1R21RN2hZaDdreDBPcC9jTFhOYlky?=
 =?utf-8?B?OWhBY3FlRHNpaFg1NE53Ulh5WTBuZlNYZGlFenVFQzU2aUVOdi83RysvR0JH?=
 =?utf-8?B?Wmx6MmpqYlJOMkM3NFZkSTIrdDNEdE5uM3I3OVJXaUFzYjBLZ3FmMWZCTzRi?=
 =?utf-8?B?N3hTZURjQkpFWUpTWSt2Q1VwTGt2RXMxQjE5YmliYWFPVWZBektaNnNaV0c1?=
 =?utf-8?B?VndEQmhYVUlVK1dlVlNsU0lybC9hTlRMNjlFNTd0bkVzdjIvUmZqMXFvN2Nl?=
 =?utf-8?B?NUxpNXNLWk5EdEpPVWxHQ3ozS1A5bGRwa0VpTW8xWG5kZXNSMDdkVnhhaGE5?=
 =?utf-8?B?cloyUjJaTjJ4aVJyRm8wdzJSbzBMYVVmYkozNVV4YmJtbHdPZXRKSFlUVWFH?=
 =?utf-8?B?N25TQks0VFBmUGFjdlpTZ3EyQ0JmMzFPQjZIUGFNZnJLRTBJWFFEYlNLaFJz?=
 =?utf-8?B?OHlqUFVTY2dZeTVnelFuekFDTExRYVZDWVRZYXlJdWRXc2t3MnJqSFBkeHhL?=
 =?utf-8?B?cHdNYnJEaVEyUTFvSXlnamo2ZnVxS2Rmd2JJQ0NtUTdBQVJ6THpoMDRHeG90?=
 =?utf-8?B?Z1NQMGQxZCtpbThjQXVHOG9mYUd2a2p1eDB3ZUNORHh2aEFDa054d2R6UCtX?=
 =?utf-8?B?T3luWjlISHJhTndGU1RWd1JSakZzbUowVFArWVMydDIwSlRNanI0SmNseDdp?=
 =?utf-8?B?OFJDdmY0RmV0Yy9xVGJSNUtXbzFwbFZJZC9nRXZXcFhERXhNN2plZzN4aC9T?=
 =?utf-8?B?TENlN2tLSDdjUzEydXFvWENGbzY4dlJpUDFOaDBBYmJkL2JoRmIxOFZFdE8x?=
 =?utf-8?B?VUM1RmlwSnBOWUF2YlFXMWVKRkJDYnEreC9mMG5TTUF4UENjWUNBaDZoaHZX?=
 =?utf-8?B?SS9KajRJUnh1bFhvVjNpMWlIU0dTNzV6RHJYcDNHaVVlYkt2aEpWNUJiSzdT?=
 =?utf-8?B?bUhhaFViTHhuQ3dPWWNaYU5MSEEyOFNKYm5OOVJ2WjNEMncxcFErc1htRzY3?=
 =?utf-8?B?dllFZFdOakxQSWp4M1hLa1NCT3g4Y0JZYnkxRHhNaHpNMWxVdThOZHM2RjVI?=
 =?utf-8?B?N3ZOcUg1bUVDaTFRcVpacGdOaGRYM1pEMmR5bkcxdnZrdXJJSWsrRGtRZFJu?=
 =?utf-8?B?WkV4QlZQYnZockJCRExZcTI0WDEvRjBIS3RZR0owWCtyQURxc3YzSXJDOWNm?=
 =?utf-8?B?K213VW5EOUt0enRCNTR3ZlJydmVQWlFmcmVDajJwMEV6elp0dXZWNW9SVmx3?=
 =?utf-8?B?bTNhWGRGTmJEeXdTOWJobTZ4Zkg5ZjlIeHNsYUZPS3pUd09wc09LRndPVldK?=
 =?utf-8?B?cGRvUWp2WEN3ZE5DcjVsMzNhUEtySnJXdm1iRmNRTEpSNFBsYnhzdm0zSlVJ?=
 =?utf-8?B?amp4c2JMOXNtTlcwWUE3U0lLYXc3NVl0bVMxaFU5SEhQYXE5UU5WYWUwejR1?=
 =?utf-8?B?TnlEeVZVclpOc0Q2UVBsV2FDMWwrVGhpY2k3aG5ySTFORWJiaFV0QklFSTVZ?=
 =?utf-8?B?RlhuaFhKVW1Nc3ZvSzlzeS82YTRuc094KytoY2JNRG5JMXdQcG03VGorVEV6?=
 =?utf-8?B?RXdXQzVNNkQzVXlZa0w1eENCT0R2djFWOWFudExiNGxua3o2NGpIN2tiaVgz?=
 =?utf-8?B?SVhmdmJDaVVTNFRzSWhpdnhLd3pIYVFHU3FiN3dabnllTlVDcnplV2VYTXZT?=
 =?utf-8?B?SnpMSDBQbm1RSFJjTVUwWDRPaU0zR2FSaXBYSVdCaUFGdW9CSkY0U1ErYnJi?=
 =?utf-8?B?Ty80V0F3N2t1Y04yTXJxSlFsYkF0SS8waWVXcDVnbU94UVNOMmZNWjZRK3BH?=
 =?utf-8?B?Qmc0eUVvbVBvWm51dTdiSEJQYXR6amVBV0s0Q2twdHZ3amxQOWFPVUtKU3hi?=
 =?utf-8?B?RTRsMFlVNlR6RWJLY3lpSEF2THZ1R2lER0lwaDdsSXdrTHEvTEVRZVUvMzhQ?=
 =?utf-8?B?TFFibllKTldFWkhYdDNIQVhveisvcnozeFF4UEVNcUxlZWE4NG45MWd1U3VD?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f5f83c-2c0f-4318-acf7-08dde6178775
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:44:48.8742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IL3YkuzVelh3n+QzH7YGHiDhx7iYDAs8IDa7OQ2+aJJFoGu6bELN8WQ3DAFOVu4CO0KtcXO+S8ZOwb1tI+fMRiLmpIWK54U53CGJxkLuMDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6097
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA4MSBTYWx0ZWRfX7U9kcqPwJbKW
 PzEufnieCSKwcnzBXH5uiB/ySkM/bByyGWm16ODTBDjXxk+oinjN3R4+1xg2kyifYBA5SZve6/1
 ssB39zjQJtDVJ/lZJbyTDOFmgnSmw5C0Ux50avZJw+Qvfl8mRgUT2n0d9eMgKahfUe5HZbPeJYS
 SmkW6Hchsavt0Zx31cO/xDDYDzyrCxhx5jXMmRtF8/zTA8UeZ71EJjEHkC4pWTxsdGRPup5gsTt
 TaB+PkpCyWwFdYb9W6A6EQUlSmfm3WD8eSK4PzjTojTLIJNReyIuJsw5jsuvNqcW8Ft2dbM+GXl
 jd0crsKVFgdOrOMU6q9ufBOZ4kjIPjmB3cvzuH1vCAdaKN7f8014XAcvJhcGlo=
X-Proofpoint-ORIG-GUID: X8mYsQVS0G-tmFml2dhtmQWnXNbbS-8O
X-Authority-Analysis: v=2.4 cv=QNdoRhLL c=1 sm=1 tr=0 ts=68b02518 cx=c_pps
 a=cBPPFWgCIfQ995+N+vmBRg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=oOr3ZWOPiFYXKd_vAYkA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GExyq2dI6qfkUE5acDeBJLzg59SN9VHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 09:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222552

Hi,

On 8/12/25 17:14, Kavinaya S via lists.openembedded.org wrote:
> Avoids errors during image generation by checking for the
> presence of linux.bin before attempting to copy and emit the
> kernel section. This ensures that the build process continues
> gracefully when the kernel binary is not available.
> 
> A clean separation between firmware (including DTBs) and the
> HLOS (Linux Kernel) is highly recommended and often necessary
> to enable independent firmware updates, enforce trust boundaries,
> and support running the same kernel across different hardware
> platforms by simply swapping DTBs. One effective way to achieve
> this separation is by using a Unified Kernel Image (UKI) that
> contains only the Linux kernel and initramfs, while keeping the
> DTBs in a separate FIT image, such as dtb.bin.
> 
> To support this setup, it's important to ensure that a FIT image
> can be generated without requiring the Linux kernel binary,
> allowing the build process to continue gracefully even when the
> kernel is unavailable.
> 
> Additionally, this approach is very useful when the kernel-fit-
> extra-artifacts class is not set, as it enables the creation of
> an .its file without depending on the kernel.
> 
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---
>   meta/classes-recipe/kernel-fit-image.bbclass | 22 ++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
> index fd4c6a30fe..c0f925d90e 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -59,12 +59,26 @@ python do_compile() {
>       )
>   
>       # Prepare a kernel image section.
> -    shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bin")
> -    with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
> -        linux_comp = linux_comp_f.read()
> -    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
> +    # Construct the full path to linux.bin
> +    linux_bin_path = os.path.join(kernel_deploydir, "linux.bin")
> +
> +    # Check if linux.bin exists
> +    if os.path.exists(linux_bin_path):
> +        # Copy linux.bin to current directory
> +        shutil.copyfile(linux_bin_path, "linux.bin")
> +
> +        # Read linux_comp file
> +        linux_comp_path = os.path.join(kernel_deploydir, "linux_comp")
> +        with open(linux_comp_path, 'r') as linux_comp_f:
> +            linux_comp = linux_comp_f.read()
> +
> +        # Emit kernel image section
> +        root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
>           d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
>           d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
> +    else:
> +        bb.note("linux.bin not found. Skipping kernel image preparation. ")

I think use linux_bin_path to replace linux.bin is easier for debug? E.g:

bb.note("% not found. Skipping kernel image preparation." % linux_bin_path)

// Robert

> +
>   
>       # Prepare a DTB image section
>       kernel_devicetree = d.getVar('KERNEL_DEVICETREE')
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221868): https://lists.openembedded.org/g/openembedded-core/message/221868
> Mute This Topic: https://lists.openembedded.org/mt/114706196/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


