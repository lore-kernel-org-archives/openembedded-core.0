Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A0ACCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 06:28:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7381.1762928910577779777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 22:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LXcZzThB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411dc7477=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC5taW33577990
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 06:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PRrmXfKktdN6zHckZOG6ZbZgG1hoD+R8fGTMsAJS/6E=; b=
	LXcZzThBN+oHZfn3+EkoZ3Fro/kWk2drf9ACdclhB8fm+mMK5Ue24oMMqM+6UGPe
	NDuV+XC3EyjFaQp8V02Lxj094p2eZGjEeKXv+MSBz3zZEAjqc1hVH2Kj3/YWpckY
	SzbqFcZiC6iUuvTpuOs7KQd+fI4H8/2R+RbXozWZmLJUKXUSL8dz1Xmp/mo4b3x0
	ccPnlE7yKfxzhh1AkHFzD/vrOy0IqJM1ITIb/pHf1aKv8hgiNB0dlyL7lalrP3ZW
	dBzbSiefiW4WXHiGFZ8ILEtLUEL62GwBjt2bh63s1Feva0Y9DZDWoUVC+ftRWRtW
	xC7yso/urvGZCTEe8quboA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x4qc0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 06:28:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpjbBw1S9VHnlO03xAhjmCssAtGkkqoRoposr+LDa3DOFjziG2eaVJBy0w4homA7nukCH6TMO+hTCSQCjnm2ymoTPv3teskN5g5V6o3iEruUBUrTFAIyTnmHPHJYblznCt8Br5j1cCVs/LYunLg6YWG88bwZCKpUATUip3DN+vUt9O8C+et9rDGFb1gkCajv6vZEEIxEiYPhWh9yW1P9BnSuMNphYE8LXTIVrZ6zPqOCeE762sXrkWcS4EeEPhhEX9K8CL6EEtew1W/lWRkBL3Rl7ZAbW0v7NwhiuM9IdEUN5P2usAru6GrShedxf1kY5YFO5XYNmo7aGBQEi4nBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRrmXfKktdN6zHckZOG6ZbZgG1hoD+R8fGTMsAJS/6E=;
 b=B3c6XmcCc0gfK2yKa9Ur2bIbxtpVLNM4ks6kx/uUmgJfn5Fsf6FPYaqE+GaBIHM13WLszRQdTsaF5AbkK3FgO+EKrYSVt7f0xQKyUwhcssn1KueJyC4bGt1phFCknj5yu+s2DMfubdP5Z0VOyMOqncfVdUs5M9FhzquFcehb9YHrKd0+zZ5WdZeeZ80n16f0BdO9uD0BB10E0oyEMhdO/wVn30hqDMWI8YORw/inzwyPgq0O7qT4JUaKM82b7/oBi6pe/VJ95l5MUrfBzfSdryrnKX/AVMAp48c6X/C4t0HQ3PfRxFrSgwMkcZqfSDZz2/Xg4chBn8ZkSrtVNe9Q+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV4PR11MB9489.namprd11.prod.outlook.com (2603:10b6:408:2e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 06:28:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 06:28:25 +0000
Message-ID: <8179ae39-8a45-478b-bf94-8a791504d709@windriver.com>
Date: Wed, 12 Nov 2025 14:28:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: bitbake-setup feedback - long subpath + hardcoding machine and
 distro
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <63cb0d09-2b76-4557-ae38-8ac2d1772cdc@windriver.com>
 <CANNYZj_MX88gcP+LRtxig04V=htBBpJQ1j3kiPyEw_+goNoYnQ@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj_MX88gcP+LRtxig04V=htBBpJQ1j3kiPyEw_+goNoYnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV4PR11MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f98625-8093-4021-574b-08de21b4af78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OFhjbm9aTEdlK0FVT3ZDYjE0ZnprN1pVZTdyQ0tEUWVsRjkzdmJtSDUxcGl3?=
 =?utf-8?B?OWMrMm5qRlhVWXRZUmc0b3ozNytHWVdKNXdYS2gxUk5hYnk5V3I0OERsK0k4?=
 =?utf-8?B?dzRrU0R1a1dKRHNiR1JHNWhSR1NXUmpPMXppT2Jrekg2UUZDZ3UwdXQ1c0JO?=
 =?utf-8?B?WDdKVk15TWM0MytBRTRlcHRvQUkrUnJvT2l3STRxaVFzUjU0aWVHME9iT2Z0?=
 =?utf-8?B?b2hhTzJWVjVyRFFHaStFN1p5MlVJait4UXhJcVQzVUxJTDhjVUNLeUlCNHpI?=
 =?utf-8?B?L3piTXF4Z2hMbHhSNFN0L21kZlIybC92NjBiWTUyRTQyY25WSmkxc2FGZlZU?=
 =?utf-8?B?M3l0ck5QazM3L1VKOXFGTUJMYzFaaVhYdTB3WW13bXdad2k0UVJ6YUNsU0tv?=
 =?utf-8?B?d0lYSk1NRTRBMGI2NGVLVVZleG5zMnZBMUQvSk5BajN3UG5DcVhLUnE2V3F0?=
 =?utf-8?B?WWpxcUhXUnQyeURBSEFqUzZXdUFiNXV2RWgxRFNZTjVrTUJJa2FqNDJQOXJT?=
 =?utf-8?B?OVdOeUZmc2xIall0emY3TTJ5a1p2T0FEWjF5Ymp3RE5TZHlFZ2d0VGxyUldC?=
 =?utf-8?B?OG9qRCtkcVhaL0QxRWoxd2tqcTFmaHBHSUJwN3d5MDFuSEticWplRHVlcGhY?=
 =?utf-8?B?ZlBsMVVqODQvQmZLeTg2QTU0VUM0Y1RHd0dlZnBuaTRPcTIyNDFKcElqdTNW?=
 =?utf-8?B?N0lyNGZYTHVvcWNhVWZsRjZOMWt2RERDbUpQajRTcVlCSWUvME5KWW0zS2ZY?=
 =?utf-8?B?bkJLTkZPNVpxS05ZYm54eHQxTVphOWc1dlIwbHNoQ1pYcG5yOCtrSDhNc2RV?=
 =?utf-8?B?R3NUR0cyUDh6ODJrSnM1VzM1WUgwY2RZMWtuQS84Q1Nmano1Z3czRHRoZzZC?=
 =?utf-8?B?U0tmdTVNcDJLSXpCNzBJQjNuWHE2Qy9FV1Q2clp2MXpMUFZtMkFxU3RLOGEy?=
 =?utf-8?B?TGJRS0NDL0kzWUZrcjk0cWRpNHpseEJkMGNLcHloNS9SeURtcjhlOWFzdUlT?=
 =?utf-8?B?MXVkYXhxQjBBc2o2Tko2Q3ZMTzhwbExaTTZIdDd4d0hHU0FSMDhCRXRabDRB?=
 =?utf-8?B?U2lNTE5MKzdoOTkzYkpaVnFzUi9xd0gxeUNhcWZCeFhNVGVJTWZoZmt4UWN0?=
 =?utf-8?B?MHNvYjFuaXE0ekVkSU51a0xSQS81RHhsYS9md1JHbUVPWmdoSjMwdEpKWWVW?=
 =?utf-8?B?V3gyNXQwaTFLVkt3WDlhNmk5ckFNUEsvdm1KQ0lQdjNHUkVveGlMem9neUhr?=
 =?utf-8?B?aUE3cFVOUENMWU9seTJ1S041N1JacmlEc1k4Q2hzVTh5Z0M5ZlF2Y0JJRHJ3?=
 =?utf-8?B?Q20yc3M5b2lKUlpBTU1jYmd3NFptMDhTZUozcU1jVk9kS0ZEUGU3M1F5cGFO?=
 =?utf-8?B?QXBLOTg4Z3U1V2tWWEdNaml5VW5SeDJqeW9jVzhIQXZrWnU4dGJKeEo3Smpl?=
 =?utf-8?B?OHBVZGtNS0pvY00rTHdmQ0oxT2xOUyszNldXaDJWSFZIemFGbmMxRi84Y0JR?=
 =?utf-8?B?VEhZYkgraDQzdmVPYzdUeVJMZndGbmcyaUoxem1Zc1lFeGttdzhkbWtFTjY0?=
 =?utf-8?B?UmVVMUFTZDVvdzF0MVhhMnZBZ2RVS2lvR29Hd2FhUGU2WWdFUXB5cng3clZH?=
 =?utf-8?B?V08zZzVMRURMZFBxNDZwVVdxWXdiV0ZVaHR1U3hPc3dKQlNJNjlkdElsTFBm?=
 =?utf-8?B?OUU2OHE0VWtaUjRxYXdnTWsxeTlSbWpsanlkYVZqbnVIbysxcEtTVnhuK1JQ?=
 =?utf-8?B?a1dqZnJ3djlQYnhFU2wxTTNOc3dxSGZlOHJwUHl6UzE5c2xLdlZtM1VjSjYr?=
 =?utf-8?B?RHVSNStFZ2oyL3RqNlE3SFpIZSthUGcyMnVSYW93eWxtbjFDeU5qZW5GazRw?=
 =?utf-8?B?V3JMd1hicCswWnhIRHlGWWxOVERLYjFpUTd2ZGtNVUFYSlhCTk1XSUV1NVhr?=
 =?utf-8?Q?cpveFpY5J1dfvii7COeWGPdDu2VBxne6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZEttTEFHd0ZOaVpoV2tVelYwVG44cjM2SEFrTzNWRmpjY2ZKY29RSVF1S3Nv?=
 =?utf-8?B?RnVVWXJrSlZHelo2L0k0Vzg4TFBMRVhYMURJS05pUUdBcllPMk9YOGU0YWhq?=
 =?utf-8?B?TzhKTXdqVDdhbkovbFZGL0xWdzhkVUJKSWR6c094cjVVcjlMS3E3OFBEby90?=
 =?utf-8?B?ampudnZqQTllaDdmS2ZaOVR6QmIyVVFZY2FreGtRUEM4OUwzMjZHT2UvcU0w?=
 =?utf-8?B?Tko3dU1EZ0ZKQlJrM3RsKzVrNi81WnI2TVBHY2hqeEVRZFZvUmxiam5XK0Nt?=
 =?utf-8?B?NXQ3Qmd5YVM5ekdJUVBRN2dONXZxU2JKb0ZyWkEwVE9ac3NmUmxqbnRFOFVQ?=
 =?utf-8?B?bmh4NnpJWFB4b3lCS3lybEU3R0pDUnJZTVJnU0M5MDNFQWxNYmp0QkgyRmhT?=
 =?utf-8?B?eTJRejR0dkJLZXN6aGl0aEFHOWVDN01xVm1LSU9WZzM3UUdocGlHdFgvdmlt?=
 =?utf-8?B?RTVQOCtjem1NWEFSZUx1MXNkb0R3ZXVsUFJrbmY2cWpXU2lZZmpZaWROK3k5?=
 =?utf-8?B?NGRSaFZVVXphc2NaUGtvdm10TnorQVdBNktxQVYrUmJ1clJUckxNcWVOc3ZY?=
 =?utf-8?B?UUw5NUwzUkNLSWVDNXN1RllydmdxZVNYSitRTWpUSWUyRGR1Wnp5QjdpaVph?=
 =?utf-8?B?cmZybk1kYmNZcy9vQmYwZnF5L2h4VHhmK1FDTExjTjF0cHpranlaTTZWcFox?=
 =?utf-8?B?S3pyb0lxQ2JBOXZsUUpMbTFxOUZaSDBXNWJtTzFpc3RNU1ZmcFNQL1c1dlVM?=
 =?utf-8?B?U1BtREVXQTU5TjJ6d3lvc1dyaVNFK0tFWWxRaVFYeEVkZmE0c2o2WG5vMzdZ?=
 =?utf-8?B?VThYMTY5eThMWEdzRVgxcllxU0RySEgreC9YaWxpNzRRTXFxOXB0OVYySThr?=
 =?utf-8?B?OTdhRnFzTWlBZXJRNFp5S1dvQzNFUXRFbWkxL3FGZFV5cVBLdm5mMVBOamJE?=
 =?utf-8?B?aWtCTGxFSEt1ckFxaEdWVGdOTElnaTNTNXowdU9xeWpjT3RYMmVlVzU4MHNy?=
 =?utf-8?B?bVY0Tmx1REtzb2RzZmx5d1ZzZHQwWFdkcUV1WnkxQ1ozSVg0cjljOUNwK3lS?=
 =?utf-8?B?VVFodE9ZMkxNUk40a1lLaEtTMG1rNkhFNnM2aXZtcnJ6QWw4c2hNUjJ2NWha?=
 =?utf-8?B?cklYbVpYZVh2UGFRTTYrWGNWMkFIRVRDOTBWRGNXTU9QNFBseUNUZnVDK0Rt?=
 =?utf-8?B?bEgvMFRFNzY2dlJJWUZlUHh4K3Q1MkFzM3RtdjlVSS9laXQ3bU1FZnNWUzFy?=
 =?utf-8?B?MkRVSDBRdk1DS3VHL2tmTzQzdjFxVDIrcFRNQkkwN2crcmp2Y0lVc0JBeVNz?=
 =?utf-8?B?dXhlQ3lOcHJ6b1hId3hpeWc4eGhhQUZseGhabnY4d0VxZUJrUVdSdy9IR0NF?=
 =?utf-8?B?MjhLMWR1bkZ6MDJKWkZ3eUoyWS9vbFJCQUp4YkRLakRLbUg1L3kyc2lOSnJj?=
 =?utf-8?B?MHFKc1N5ZHVmUHdLaHVjc1U2NmtLekx1NDBtMGJTNHg4VkRQVzJBejRmNmEv?=
 =?utf-8?B?cHgydmRjeGNyU05Uc2d1SDRxS2FDMlhXMlFlVnYyckE5QzBQUnhnd3hONnV4?=
 =?utf-8?B?RHdqTndUT0hQZGdUNUpEcloxek5tYmtNSkp2OTNIVTRCODRtbzhOWmhEbzNY?=
 =?utf-8?B?K1FNNVN4TTZ0YWVVTzNtSnYxcFVwSXFXRnRHaURWcFM5ZXpjdlNzbTlEcWhy?=
 =?utf-8?B?em53SC9udXpQUGJRQ0lBM1I3VVFpZ2pNdkVORmpsM0hoWFR0WEEvbXhYOG1R?=
 =?utf-8?B?T1hxdEtWSjlhbkt3Y2RBN09jZmRXc0NYRkkyQUV3T096Z09US3Z2VEFSclpp?=
 =?utf-8?B?VFpJSko3WXJ1eDRBemtCRTIzM0NxbSs4VStoTHBUSlY5V2dSQ2V5MytoWVZ4?=
 =?utf-8?B?YVY1RVJpejllSFRPYWV2Wk5lYWtqaTV1bTltTTlScExiOXNRT2d6S25hRiti?=
 =?utf-8?B?aVd4MnROZm93aVhUR3Aya2NPdkVsa044K2VyS2ZkZDdYK3J4NTh1Q3l5aU10?=
 =?utf-8?B?WGI2TUU1ZG1SeHp4L0xqUGZkd0t4d1o4WTc2SGRjSm5YZVp6S01RYUZGaXoz?=
 =?utf-8?B?OWNoaERGVTRxNEM0eWErRVR2dVJ6bzFkTFZzRG5NblIzYitRaEJ1Mkt6TXgy?=
 =?utf-8?Q?28gOcvJ6qojNE33W0vfVUtXOJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f98625-8093-4021-574b-08de21b4af78
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 06:28:25.6972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH5o3ZubEjZyUl9LhJr1891zYV2Gn1qDMtJNBxt5omf8fquuakPSDcPj+HeHz2kn2Q0rXkUiOVqv+AlNH2X27Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9489
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA1MCBTYWx0ZWRfX+H0Uv8YgaogC
 fV5TkQJKjsrDFja+sThC69XZkEjfv1SXZyh9mexUWDa0DQKHRycUzjcD5ubwljxk52g4F9Z9O43
 SEZ8Qk3HslerQV/q/idarQ4uJDIbSt2GW9Uln/+piDBdLfcv9K5OrxROjuunt/k6Q7yCi6sgAxk
 yCByw4RYqUt/0mCB7PpfJ8/tONCvuWf8f8DKwHQhMlbkOHi24iRC1wGCB/iZJcPLWxT6qgWBzdj
 MsmVctZpLZdA8Mf0t4EMENYYE650+nFWxAEwYXJpkIIUXi4tToGJu4w219j+gJXQ2mFzwBJGs1I
 gS59zXdDUP9glIXZzz0X03LLMwOiWH/EsbFHBSsSrtsnmO5oZuo7+99i9/CtNU1SNISQ5v7L0n4
 d3W/lwOURhhlMoPa1ftjytqUDxfx5g==
X-Proofpoint-GUID: VmgyLKUECZHNxl2mFqBRDrVTbe7lnXyL
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=6914290d cx=c_pps
 a=BRoDR27eCUDGJJSfTO8W4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=aMtw_z7iP6ZSVbvAA6cA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SH9OXKfJ0t_mfy91meC4bCaQl25FvB1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 06:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226196

On 11/12/25 14:09, Alexander Kanavin wrote:
> On Wed, 12 Nov 2025 at 03:54, ChenQi <Qi.Chen@windriver.com> wrote:
>> The subpath is unnecessarily long, e.g.,
>> poky-master-poky-distro_poky-machine_qemux86-64. And it's hardcoding
>> machine and distro values.
>> Such design might be reasonable for testing infrastructure, but it's not
>> good user experience for developers.
>>
>> For example, what if I want to to build things for qemuarm64? I'm using
>> layers under the a subpath with the name of
>> poky-master-poky-distro_poky-machine_qemux86-64 but I'm building for
>> qemuarm64. This feels a little weird.
> The directory name is hardcoding the choices made during
> 'bitbake-setup init'. The reason is that if you want to run 'init'
> again and make different choices, it would be able to create a
> different directory, and not error out because the one it wants to
> create already exists.
>
> There's a patch for bitbake-setup to give you a chance to write in
> something shorter interactively. You can also pass in a shorter choice
> with --setup-dir option. You can also use --skip-selection to omit the
> selection of distro or machine, or anything else that is asked at
> 'init', and then you will also get a shorter directory. But the
> default needs to ensure different setup directories don't clash, and
> so the choices are hardcoded in them. If there's something else we
> could do, please tell so.
>
> Alex

Hi Alex,

Thanks a lot for your help. The '--setup-dir-name' satisfies what I need.

Regards,
Qi


