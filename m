Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D48BCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:49:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15778.1758286177494244639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 05:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=m/aPuEat;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13571bdf75=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J9kevu1068606
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 05:49:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mrqK3lhlHyjexkxCRj3xL6ZS/MuVbhoCrWdbzAWTTqI=; b=
	m/aPuEatZO/dqwS+MRf9i5r75Ef1SK0cHPbyrIPBs0oVu8TDbjar8k6RPwu1luKS
	jcGOZyHymNr6ahTnQGIxf/kU3xfwLvei+BOJHDrEOwabmBWJ9uokuKejib9oCeTW
	rLa4Yob6tkQR8atqYW4xjtly7OAikPlObsGeM751Yo79KBtvwrIVS3YBlZeHqrN5
	loPMbH0GPsldDudjAygxobU2sFgf5nQRqphdsxReEpcrr1qliWVI+6tG+iPjN0me
	+qGm2pt640INPmQBg7egkujhY3boUfamXVqG2wQxLqEX4tfXEQypX12IxnCacdPt
	6xaThuF9+9vfwP/Oi8EDJQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010012.outbound.protection.outlook.com [52.101.46.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vgr0gfu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Sep 2025 05:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4gXV5vIa2CiLb2wMVrrXSbVtqyM3DCJc7ZjepwqNiIcEZmxw0O6c/tw1aYQuqIFHI9fMvpwl81l/5uKWOJ4kYIA+EpqSzdaM/VqR7jGn+6hU0nZMV/QOVFp/el1DrGYkuPHAabbIDf4ecdnh2eLS+cL2LGQFWJGqDNeAf/HQNjfKaPLgf7F8pOzWU9QW6SyAomOZ2MGGOdOkQJAEMjdlO1FA6nMiO8Ap5ZwPa9wAbgh34vq8XRK3Xh0GmNV8UKSxsG/Dnjg2W9ibVZVYOexMusR0b03ytrcfsuRsU+eBweo3BYHhRFp5AhmrIDOdF4Wzlr7yLDV2PG5ZFia9XnRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrqK3lhlHyjexkxCRj3xL6ZS/MuVbhoCrWdbzAWTTqI=;
 b=yuD2QziM/z+k6jDMmK2+ZZX+ZYHti8fXcoPqBcHe+YaDWKE/mUqnh1imQqbxyjIBg+NiNTa3CjAtQ4F6/nJpQBFJa/OL7txijh82uvr8CcE+Sa4ta47TTOn5BkbQA8QSCclkG4ZN1r4iqRUK1JfetexxW4lB7Hiwp7b7u+eWaZjif0rlO9N+LAKa+XcDVhwo2RK8Hzi/Z7WQ6IhoYnAextag8qVSEwl6eWiZ0Qci50pt0/pcw1tZVlMTRgIjSUES0B5aB34FzA13NIMIQnMA2IYomWu0GfQrlYhL5oA4QSp883ZpqtIbHyjB2VPWirYvMleFJmd1G5JPSU660dgubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 12:49:33 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9137.016; Fri, 19 Sep 2025
 12:49:32 +0000
Message-ID: <831a7eea-d724-43ce-b8e0-b6dd384d8737@windriver.com>
Date: Fri, 19 Sep 2025 18:19:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Remove rust-llvm dependency after LLVM split
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>,
        Khem Raj <raj.khem@gmail.com>
References: <2906764e-7bca-4947-93f0-2564ccc75129@windriver.com>
 <4513AF0E-A093-4587-BD47-343AC3ECABDE@arm.com>
 <af52f896-b980-4923-bab2-d93c44c71970@windriver.com>
 <909D91E8-7C35-4975-9F76-5D49904F9B8D@arm.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <909D91E8-7C35-4975-9F76-5D49904F9B8D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN4PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::7) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA1PR11MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee48a22-03cc-42bc-6dd6-08ddf77afae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NlUzM2w4eDRDcHJxcG5Xb1h5UmxhUkhRL2RtNmpVbllUTVowa0hzQ0p4SWdw?=
 =?utf-8?B?ako2aVZ4M2JmWXpadml3Snk0QXRkdWUyNStUUjljcTR2TzZmYS9sbHV0dm9x?=
 =?utf-8?B?S2dxdWhwZE9YZmtKOERNZUZxMjMyaHNmYURSejVmc2tOWVNIRDlSbjZGaFJS?=
 =?utf-8?B?WWh1c0Ria0s2VnZTVGR0bjZLMXk2V0U1UmQ1UkUrT1VaWW8waEhOV04yTGRI?=
 =?utf-8?B?OWM1Y01PREJML3AwdTBGWXF1ZERtY1FYdElWYXR2dTZMK0YvOW04TTJ1VTRH?=
 =?utf-8?B?ZjlPUzdlVFNJRzYwKzNLQ282aDNkUitWV3c5N3k3QTZSV0xOQ0lkMkVWYUNx?=
 =?utf-8?B?UW1tSHBFdmUvN1BIOXFjMG1mSHdVU29CNGMrRDU2aFhCV3E4S0xabXB5QmVV?=
 =?utf-8?B?UUpOUWV0Uk40R29VejhIaXFnN0d3RkJaRktLSktLL21pYiszUzFjVFBMUXJP?=
 =?utf-8?B?d1QxQmVZODZvK1hqL2l4VzVNdkdwT2l0YXNka2swd0hVZnVPZkVReEE4YXll?=
 =?utf-8?B?NzlFN3d3UzVDOXlZZ3h0NUNzeis0ZzVnU1NSYzBRWVc3MkFhL2I3Z0taUTdT?=
 =?utf-8?B?R1FKQjV0c0czQ0krMWpOeDhSM1ZlUnFYVWxEN3QzcUlDakhiNUxPRnllQ1Mv?=
 =?utf-8?B?VkFZM0Z3Nk1udGhWQnpvbHRlY0FEZkhxSGYwYS9mUktHOE11VTFmOGRJT1BY?=
 =?utf-8?B?MWlkbTlFWm9GbGxmbEIxYlFETEJmVTN0eGtKQmpwUml6STJYWG5WdU11Vy9i?=
 =?utf-8?B?SlNzOWpsMStsVWlGZC9DRG9OQldrNHhIUEcwRCt5NDRLNXBJSVpjOUUxUjdL?=
 =?utf-8?B?WUtmN0ZBTldXYUtWcFFRVFNvR0tqbXBWSFJIeGRkVjkraHZiZ3orVGd4L1JN?=
 =?utf-8?B?MTR0a25PbEpnWDZPQU51aWVyczhFWkJvMFgzZWVvNVNZbVVQRHk0M1MvTHJ0?=
 =?utf-8?B?cGVBVkJQdkhlQ3doK0ZpbnlGYWV0bHc1RWFnamVFajV2M1FoODVsYnJmZjlt?=
 =?utf-8?B?M2thUTJJaG52c1Rnd0hmSHc1bERGTC9HanhmMGF4TFZ0SUVhR3dyVGRFKzdB?=
 =?utf-8?B?L2U4djByTlNnWGNzT2VMa2NIVVRyVjE5bUFaL2RQK2IxV3ZFK1Y2OUp3VU1O?=
 =?utf-8?B?TUMwbG5TWk1Ia2s0REE4SzJYcmk2RTdsTUpVU0Z5aEhBN2VzR216SU9sMThw?=
 =?utf-8?B?OUpjUU5VWThQTU9OZ2EzSVVSV3BMTTA2RGF1a2tBK0xJZXowdG5RYVNYOVVy?=
 =?utf-8?B?WS9HTy9rL3RVTElDb0s5Mmt2MVZBQXgrdkltWWJVakJmbkhkNXZkVU9kOWF3?=
 =?utf-8?B?eUxWajVPYmEzY2c5cmRyQlZiN3J5NjhZUU9ORlJYUTNER1BrR0sxRGs5anIy?=
 =?utf-8?B?dVhGUTRxZXNZMldzajZCNWRvdW5iMHI2OGEwdlZLWDluSEI5UDdxemltWU9Z?=
 =?utf-8?B?c0NDVlVuTWpydWlTME4rR0l6MmZHUys5UzZZMGRoVUZnRHZYL2oxQndyVEpN?=
 =?utf-8?B?L3ZFaFkyWnpMUDhSdGp6alRsWHFKbDBxVEcycUk1R0tVcXpYSnY0Wkx4QVN6?=
 =?utf-8?B?MWh3cENsbE9lVGZlRm5Zd2krSk91VWMzeW9WTEpLckI0Z0dnQnRORWxqVW5n?=
 =?utf-8?B?TTlxZzU3NXozTDZUdUVrWlFJY3RjT1p2clh1ejczandFMlFlVWtENy9VSk1u?=
 =?utf-8?B?Mi9VbkxRR2JGTVRsWHV3MlVMTTMyMUtZc3drQzF2SFIxRWJFeTM2cDRsZSsw?=
 =?utf-8?B?WlBZaTNSZm0ySk5HUHRYWEg1S3V2MFFGQk1MTjhuaFl1bWJQREtObCtyeXpU?=
 =?utf-8?Q?+V7LS0IDJYR/uneWMJzHqWCu+7BkAdozpCKFc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnJqOWJFa2ZxcGZRR0lDRUpGL1lBMUtxQm4vUlZvZTgvM1JnTGZkNnBha01K?=
 =?utf-8?B?emMwMlY0ZldSV2RySVExOWgwYlUrUHBjazl4SVVGNHNXWndQUXVjL3c5bkVQ?=
 =?utf-8?B?ZlJBM2lrSHA3TCtlSnhRaDZ5RXhIeGJWZmpQV2tGdzRuK3hJRGMrNVRwemNJ?=
 =?utf-8?B?UjZuMkI5TDZNL2ExSklVL3hvWXJJdFBjZjNzUlNRZnR1c21CbU9vN3M4ckRq?=
 =?utf-8?B?N01tRml0dTNpS0JLSXNrQU9OMytUUS94K2RUZXRLcnZpVWZycGYrTHlHOHY3?=
 =?utf-8?B?S1M4SDNVZkJteVdJVVdRaVYrc2F1dUxuc2Z4UlNGaytucldQTEdvbWsvUXJt?=
 =?utf-8?B?bi9QMWo2THllc2xPZ0VMZGNsaUl4Qktsa2lyVWlzZHp6TGRPbGUrNUJ0bmlH?=
 =?utf-8?B?Q0R4WiszT3lsMEJUTmhFU1JENnZaWHN4ZnVpd2ZLWWhpaGVSZGdmVGlOZDdY?=
 =?utf-8?B?SU0vSzJHdlYvUk1CTjBHZ05idmJHNzR4RmRIdjhRTmZ6SlA5L2toTzJJYlBU?=
 =?utf-8?B?di9PUDBnSzJoMExydGd3RnJPeW84SjFLeEExYjB6ZCtMdXp6ZVV2eVNmUytn?=
 =?utf-8?B?MjJuMGF0OTY3UkJYUVRWcm5RbHpneHg5aU9kTUV2YmdBRENmYytGbDZJQTdD?=
 =?utf-8?B?ekI1U050cWZ5bmNISlBreVRIakNtSmxxS2xpUXdjd3YvZXhSZGhBb2xmSVk2?=
 =?utf-8?B?bkdjSERQcEtkZzlmcEF6a2dBVkJ6cS9yRGRTL0owSmNjQXJyMnI3b0N5NmRE?=
 =?utf-8?B?VG5JcFRaa3FjMk1ocTRWL3VNNGxoVy9FUVNlL0lCNEYvTmVIUzhmQVluQU5a?=
 =?utf-8?B?TzAzeVl6d011VlU5RS9KWk1UOGp0cUlSMjYxdXM5aGVQOXJwMXg5R0xIMHkr?=
 =?utf-8?B?Z0hQUUMyZEswSi81RmlUbWNHbS9yTFRsYVVqVmNCUVU2Q2x2V1ZoY0cwMVhz?=
 =?utf-8?B?VDJvZkRBcFJGWTN2N01pYkhlZ1JUd05xQ1VydjZOWHpOWk42Q3o0bmdUY0gy?=
 =?utf-8?B?QTc2U0E4bXcvaGdrdjdsZWFPSlY2aU5YYWhJa2FndnI0UFR2MEdtcllUYWhC?=
 =?utf-8?B?dXhCQ2hlb3A2NDFURzFGdTFMUzhhKy9XcjJFaVlMbVRHSm9pQWJ6TGNuVHVw?=
 =?utf-8?B?RnhYTTN4bXBTalowQlZ5Ukx2U3FaaWEvNWppVC9kWGJNYldtbGtPQnlaWVVX?=
 =?utf-8?B?dUlaSjFZYitQbDZhc2xsUFdpMUZ5QlNWMDhIRVFzd1hONVNGdnVLUjkxTU5Q?=
 =?utf-8?B?R1FFak4zYzlvWkVhamNONU5XYUFiZzJDa0ZqcElqdllYK3FLWkI3djd6ZDR6?=
 =?utf-8?B?Q01oNzJxOHBDbjVtSXFjeFRTVW9SSGlMSU9wWXlUdWUvTHRLQlE5YTdFbStj?=
 =?utf-8?B?MXBicDF6SW9pYzFFMU1IbHAxL2JjR0hlbEdHNUFCREFkRkxrWGhmNFVMM1NG?=
 =?utf-8?B?ZTdKSkRaSWMrZ1kyemd4YWhBZVd5QkdFVENQV3ZXdld0REVTY3Q5cUVEQXcy?=
 =?utf-8?B?anpQZXE3MzNUN0hOaDBHRlFDZmtvNmxGc09YUkFTeFJRZmtMSDFIYzluSVZI?=
 =?utf-8?B?dnBzRHVLRDE4NkZudEt2Q0p5U3lUa0JUWG5Tb29TRWVZRWlOOGlhM3MwZ3hN?=
 =?utf-8?B?ZTNmRGMrMm40M25CUVNwWHJGMVE5KzNqTGFXL3NUeGx2QkNCbEhSMm9lUkZS?=
 =?utf-8?B?NHFadG1JR1R2dGhLai94Y3BPdVZQVGw4Mk1Ud3AwUmlXZzYwOURMaDFsSjJk?=
 =?utf-8?B?cE9YdDUyaks5U3c4ZG56SnNESWdzeVdFTGJPUDNGMVVvdld4L0ZNNDcrSjBa?=
 =?utf-8?B?b1Azd1hmVG1jeGdQWHpMR3QxTjIvSEhiZXFDdE1ZNVk0MWNqSlhWdnhEc2RW?=
 =?utf-8?B?MHpDUkkzMFZMWm1vMXBmRi9HY2lMeUIybkwzUnZjaFlDRXJmbXVHWEV1OWNk?=
 =?utf-8?B?d0VIaFhvRFplb0c5NE15RHVpZ2VYK3l2T1krdHV4MW5pdVVxVDQxRmlGb0tE?=
 =?utf-8?B?QVZEdkpPS1pNcldDbHI2WHVNT3VWZER6RzZmMzdJSGo2ZEZIUDQvTmhPNzdL?=
 =?utf-8?B?bTkvaGMrQUlvVXpEcW1Ba1c2b2ZCZEVscXF5MEhwbU5WM0hRRnk1Z1Y3MDdm?=
 =?utf-8?B?TXNUenB6dkVTNzd3am1obEJGSlhkOGo4cnNzR2hSQVF5RHlwYXZZUVdmdXc1?=
 =?utf-8?Q?2w2JaDbim1c+u+gka+213SM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee48a22-03cc-42bc-6dd6-08ddf77afae3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 12:49:32.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6M95Q+0DQZUZpMGP24stxgNPN+VIDNzqqLAe42Z4L57XAX5gCKvnmFb/62HXbuo5waosWKZvvFcwIoLQIqDl0WcmEPa1PNgVrkMr2H/O+DMAvKABE+aEhz78dB5AF68
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Z+LsHGRA c=1 sm=1 tr=0 ts=68cd5161 cx=c_pps
 a=QD3RM0NeKQHimiaxCRpEvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=1NWNoF9oAAAA:8
 a=t7CeM3EgAAAA:8 a=sWphACFViKfVYQt2ogQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=lPB0YCCQEzgA:10 a=raLgtFQXjjEA:10 a=97APRTa-CG6DvPMFVxHL:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SIAkhynd80nfdsHU4mNc1_HDj2Mx6YaT
X-Proofpoint-ORIG-GUID: roNiCXD78nZz-NSKkqQqynzUqNQNIVbL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDExOSBTYWx0ZWRfX6hwiC8CBUfpS
 rF4vvNKIhnOrBw1WgD4RKnCI0EepdvXZYlmdr07M2A5b20RHWlIYEnKxURWVknIcfKLEuszM3ki
 1cx7Nu8GJwBhCRtPuZ9yLiTqlcikuPYfEQSWtqCPIi31oM3nvrFFy3lknpoWmnpC8SvSJAY/FkX
 fdQ98fl90NP3yG6k23rj897oTAfScov2EhnSbp3vPcfvVmB0+9NxkbWmaoQ3Z3wq7Upfi6jSFlp
 L/GzXpBMn2OsROHgFWivA22unq5WoDvHVjvTw94afpeKUA0V0qfRsvSIH+e+Vq9stPuH2jRLvrC
 90TdH5ZsXFOF8cnQ2nZCeWBgUe6B6AwLUMWWXqzWKeVVKL99HlHI5oMGJCroGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58J9kevu1068606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 12:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223744


On 19-09-2025 15:50, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 18 Sep 2025, at 15:42, Deepesh Varatharajan <deepesh.varatharajan@wi=
ndriver.com> wrote:
>>> Can you share a branch with your changes in? I=E2=80=99d love to run =
it through the performance builders to see what it says.
> So I rebased this patch on top of my clang/llvm split and the results a=
re encouraging:
>
> https://valkyrie.yocto.io/pub/non-release/20250918-107/testresults/buil=
dperf-alma8/perf-alma8-vk_ross_wrrustllvm_20250918175407_f5c74dc97d3.html
>
> The build time reduction is slightly more than with just the split whic=
h is good, and the tmpdir size drop is very noticable too.  Excellent wor=
k!
>
> For reference, this is the buildperf results for just the clang/llvm sp=
lit:
>
> https://valkyrie.yocto.io/pub/non-release/20250913-79/testresults/build=
perf-debian11/perf-debian12-vk_ross_llvm_20250913145051_e65d2b894fd.html
>
> Cheers,
> Ross
Hi All,

As mentioned earlier, we're encountering a Rust build failure when=20
multilib is enabled. The issue stems from "llvm-config"
looking for libraries in "$STAGING_DIR_TARGET/usr/lib" instead of the=20
intended "$STAGING_DIR_TARGET/usr/lib" path when
multilibs enabled. This appears to be due to a hardcoded library path.

I noticed there's a patch=20
(0005-llvm-allow-env-override-of-exe-and-libdir-path.patch) present in=20
clang. Even though the
build fails.

I also attempted to export the $STAGING_LIBDIR variable, but it seems to=20
be unset or overridden during the build process.
Is there something I might be missing or overlooking here?

Thanks,
Deepesh

