Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F123AD41C04
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 08:11:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4575.1765440664583882565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 00:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h/p/qpHx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4440256309=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB4pcLF2382361
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 08:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9cCsQ8bzlxKKkgNxJaztagtofJlduTGo8Rv5Wa4wmeA=; b=
	h/p/qpHxiJqxdcqFvopVCLzZwLoFrP0Iahmssr5ewBrDprPc0Kmf+u5sj31HhTH2
	0lGwgyFG+QJ69/8+oFHgXDZfWANa+Pp+zU8qD5Rm7CKHDlkFvj4M9nZdrp16w0SF
	X8LbWa+BstWOqxr9IZLqAg13M7JS0Y2aJXgIrkVXpaQNkwZapMwhvo+myUkOSXKP
	UuVxPpjmVksk8CDnFRJf0/IGHj2lxvI0A10/YCr4XZTdEyLAZyhBMM9kofXNTLVh
	WkmoSnSGgvBfSNUy/kq3VvD/ZFfF0joIGDd1AvntvXXY24LeWIbmUykVtn4sTbpk
	0TNDpWb4dyUjtryB+riDKA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010018.outbound.protection.outlook.com [52.101.56.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07hsqs2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 08:11:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzZ9yK1WtSWEpiuCLbZHROVC4eYv14RyThuk+76VWjPiR7lXphAuLyVKdt2N+LhTjYKcTc7lmywTkfGuzJSSBNnzRMNr/lG40dj0zQvRYFFpPOLWPQUbplIhTsP1C9e6d2Vks4lxC53R/SZKWcFq+gnBPBwOaa1O+4mdi4wGl1+OOiGidLQGiLEnU0srKycCCq9Uk0Zfd11ec+Et2JcC8508XcM6gINTI3UMcrJafxoXQHWjiDdpo0O/HlLIRHwdB2VqhK4p85sPwgO7yKa79eWQ0x/mAqkwyCPCl+NoPFKPjDdyivKuh3+x6TEza4fhKD9qJ2yJRHsUJqB2TAKy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cCsQ8bzlxKKkgNxJaztagtofJlduTGo8Rv5Wa4wmeA=;
 b=NB0OwKSF4STCmxmPq5bQAL1tXOpRhb0Bcqyp+cCyO+SJ/wbWwZVaowP7wWmZR8inUoNlSsocZHrPafbBw3Nk23sAwaaqHyx2Y0EWd3FxTpqy+yTtfdGM9O1r3gFF+osP4GJ5XY6Uy+mJfVuAkBmgYfvMEci2138O8LPgYwYI3dFj1z2yk9luDUze8ljaj4SsAISeLQ+9bYSSBLUMY4ovP58lU4Ag1A7kyYeJUTBIbBr+S61UDIkcYyuJMQazIHEy5UeboqGLRvlWGpb9g33nh+8uIhTStuS/qDXvxUcVF80P/JOYiVSbUoo9WDE8dbowXx7kbdCJD023VcdUM1YJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DM4PR11MB6333.namprd11.prod.outlook.com (2603:10b6:8:b4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.9; Thu, 11 Dec 2025 08:11:01 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 08:11:01 +0000
Message-ID: <32af68a4-a8f5-404c-b7cd-baab63223a9c@windriver.com>
Date: Thu, 11 Dec 2025 13:40:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] rust: remove passing tests from excluded and ignored
 list.
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
 <20251210101803.1120711-4-Yash.Shinde@windriver.com>
 <c1d25645-bafb-4d28-b1f2-31931288133c@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <c1d25645-bafb-4d28-b1f2-31931288133c@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::14) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DM4PR11MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: ff20ab93-8c88-4f2c-ed9e-08de388cd295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?anNzZWV1TTRxZnRtYW9ldDRNdVg3c1lxRTN0dyt4VTZSRWVsR01xYmloalI5?=
 =?utf-8?B?cE50VUtKT29hemFaZW0rd3VaSlhpbXZNME40a2xnT1dmS2N3U0VtQWdtcDFa?=
 =?utf-8?B?UFkrYzRTK3IvWHZUakRrbGRZbnNqZzM4ZTBHYjB0UWI1UGRjM3NQeDZHdHd4?=
 =?utf-8?B?aWVodlJRNUo1bENkSWZWQWNQTHRYNnlQSlV2SjkyWEZ2Zzl3Q0hhejBaMlBM?=
 =?utf-8?B?R3M3OTA4c2N0NUVRQXVmNkIwM3draXJHWkJwb0kveG50c3FoYjQrTGFQTU9K?=
 =?utf-8?B?V3ZrSXBteWFTZEdsdTVTd2JrZ0Y4QXJuSEc0azN1SEtPSzNLY0UwLzIzUStG?=
 =?utf-8?B?QVRlR2hjMUcvQ2FteGNOUHkvcngzTFZtYlBLNTV3djFuWmF1eWtRSi9oODlB?=
 =?utf-8?B?SVN2SHVVcGVuR1VDNFdkNkdOOEZia2xpci8rVjhiR2NKRmFqY0RZVXhVcEdL?=
 =?utf-8?B?d3RFKzhtUTRsVmFtdjR0MHJxZ1RMZEZLVVBKUHd1THFmU2E3WGJjWitiMjVk?=
 =?utf-8?B?L1A5REJ5NnEzbEJoaWpiMVhBY21lMkRlZGJnYWtsR0JRVXpBM1ZkTFhUTWVO?=
 =?utf-8?B?aE9FSlJ2VkxvRTRlbnMrVlpKTlFwcGU0a0xHMllGK29SK1NuVTdUSExwcG5q?=
 =?utf-8?B?Q29MUjUraUFWeDFKeHBSNGZ3UmoxQ3BQVkg0dnphNFhZOC9kcTRjMUxHMVhz?=
 =?utf-8?B?Rzg0UzNKbEFpVnRpQStObW94MlpSSEVRM1ZlL2R4WlBYMGtHck1RYjV6aldi?=
 =?utf-8?B?dnVtYjdBSkd3a0wxUmZ0T0RyaVNHMzkwTEFkckJrOXY3YzZUZjdNd1JyM2FS?=
 =?utf-8?B?ak9FN1BmY1g3NmMydW9WLyt4ZmFpT1NJc29VRGsvbXVPNUdqQUx4bUJwdWhu?=
 =?utf-8?B?bmxVb3RKSlNraVk0ZEY3NkZ3RkRrQ1ZZVDZFc2tRWi9BYXNLTUZienFZMGwv?=
 =?utf-8?B?TEdKQ0NiVUNsWXpoc3o4ZzMyQjlLWUxqRDR0eVFlTnhPekRnWE5wTEdpT2gy?=
 =?utf-8?B?bmtQTzd5M0RNSFZRcENTMXFFd3RpTWpwMWlMamEyUmVSaWxZVFlMTVA3Wlhy?=
 =?utf-8?B?U1pDY3plREpEUkJxemZjMTU1azNBTVQ5eW1nR0Y3VXgzTnNqTk5wMzFtSzFM?=
 =?utf-8?B?SVlZTytsd0ZUN1Z3NkVVSzVGQURUS0VtYXZiZHBGaVV4N0RaditqbUJSeWdF?=
 =?utf-8?B?VW52TUphY0ZmMThsNjdmSmVwSEdYSXF6SXlFalhvQ1dPdUsrTmc4Wkl2VU9h?=
 =?utf-8?B?eisrR2syRy9OYkU5TnViOUt6SCtMSjFuMys0c3Jib1IwWDZlV0pnWkRCYU5O?=
 =?utf-8?B?ZlRpUGFYcnRFWG0xcjIxSkNNN1J5bXRIdlNmT0JvbWhPVm9GOEt4NE40bDMw?=
 =?utf-8?B?YzZ5dTBsN0tEMEhYbjhvV1pNajRuY0J4amF1cFFpT1FwVG1oOGJHUWpaek53?=
 =?utf-8?B?cElOd2hyMEJtcVlWSTdubnhxeTBDRWhESFNBSEdZN3R6OE5mcDJCZStZdUc1?=
 =?utf-8?B?dTJqTHVqbzFvMlkyMy9DOUNqWDRXMHFKNklNYlJGa2pKcWVKRklpVzdEbHNR?=
 =?utf-8?B?VEd3RHc1L3M1d3pWZldBK29RdkVNa1MwVjlJNlc3Qjk5TDgwQ243L0R5c1Fr?=
 =?utf-8?B?clRIN3hMZ3RENVZYMTg4d3Y3TS9PZ2NkNFJudkJwU1V5YlFhQjRVcURZMU44?=
 =?utf-8?B?TVFHK2dQMjFZRGJTYzVrSEhKNndwaXVncUo4ek1RWm0yMUt4cEt1bFNFbnhC?=
 =?utf-8?B?UDJRajVvQ1YzelQyT3NtY0RkdS9VT1lhUGtFa0RaQlh6eVBzdzl3azZXZksy?=
 =?utf-8?B?UGtWcSs0cDE1ZXh6Q3hVTnp4YXhMZGVKSit5dXA1ZUI5MVpzbnIwNDBhNW4v?=
 =?utf-8?B?MWlud3kxM09uVkxaa1VKMWE4UHprY1dpS0Nhc1FKRldaQXJod2FpYjhYakcr?=
 =?utf-8?B?OVo4RkdrTGJkS2lVc2E4dzQrQVV1b0kwZU9KSUtENzZHdFZjd0FXTExaM2lG?=
 =?utf-8?B?WkhZVDd1UjF3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vmp6WnN6eWcrREl4QUxZRVU5cmJGWUw5Rjd2R3VaeTkvWitYYjJiL3lCUmdU?=
 =?utf-8?B?MENpR09rMXhXeGRna3JBL0NvYUlzQUtyZUJHckNha3RKaWRHOGZvMWtzaGt0?=
 =?utf-8?B?VmI3dGxmN09nY2tHYnhHTVliYVMyVFJvUWd4K1RudXNIOVQ2cU5iTzR6YXJ0?=
 =?utf-8?B?TjRhQURhV2tGaXBpbmNDRHJMSkhwZ3BtOHd1RkEwbXU4dGxKVnBwYXhKNHBM?=
 =?utf-8?B?cDdISDNNT25weUJPbEZvNDVIRnEyU1FMeFFLdW9RSWRyb0p2bUxEczdrYWlH?=
 =?utf-8?B?ZUNiY1pQSEo0bk0rWnBUbFR5a2paejBGeDMvVFV3RVhCdGZCYmpMMmRPcHJJ?=
 =?utf-8?B?cjZvNjZVT2ZTMFgvLzc0ZTBRZlhyeTFBeWtBaE1DbXd2eWU4dllRRlBqbmVG?=
 =?utf-8?B?MW5PblB2QlNDTm02a0J5aHpyWklwRXZUbDN4dmIwQUdyVlNwNVZ1ckFXQXpH?=
 =?utf-8?B?bjZ0VEJ1ZHZZWU16dG1ZS2lZbzAwajExNVd2TUFNNXpXeEhId3lvR0NpUkdy?=
 =?utf-8?B?V0paVzJIZzJBT1FNQlc3QXhqWWxjTnpsemVMRUFqMVhJS2dIaUtHWTRycEZD?=
 =?utf-8?B?M3JKbEJQbmpBMUsrVForb0NRcXpiZDJyUUg0WGhhTmRaMXN5M1RkWXc4Nm1n?=
 =?utf-8?B?ZkNVN2ZNdUhJdHozczhKNUoxVWx1SE1WVUpDa1p0UkN0M0I1S1kxVmdVRkI0?=
 =?utf-8?B?OFM5RmJTV3BnUUlCVzVYNDBqaHRGWWp5UDMxMzBMZzRlakdITElicjhnWE13?=
 =?utf-8?B?K1QzV3RPcG9NTExob3owU3VqUnlXRkk0ckl3eXJ2a2FocDQ5cEorM3Q2d1Iv?=
 =?utf-8?B?eEdna0w5eStqcVErSnZsNDM2YUtUU0RBbW8reFRGcWdvTmdNZHhBWHQzS010?=
 =?utf-8?B?Yk5RY0Y3MEpZdytjRmdnbXcvQ3pwcm5NUjBiNHJEU1kzLzh0WUZTdyt6c3Bo?=
 =?utf-8?B?NWR6RE90Ym5qalpHd0k5N1ZZZEwwZkVSN09DMUtvS202WVZoTEk3c2dCV1Mx?=
 =?utf-8?B?ZUpjNFB0ZFh0MUVQNDZxWGxzNXVNWmYvV1JmZGZQejVtREtDQ0VhcHBYdjd6?=
 =?utf-8?B?TWROOSt2SUpNSVE5dUZsaUFySEVNNHMwT21NRnE0UFhxYU91WHpVVElxRTFq?=
 =?utf-8?B?OEFTYzUvdkV4NzBVNmJhN3J1WW4wMGxGRnRpR0J6WktyNUVhZkhKWDBUejdB?=
 =?utf-8?B?V2VnU1hDZ3NKY3FrZ2ltVnN1U0xuV0xmS0hLajRzYzllTWpyK0JiRlV0M2Yv?=
 =?utf-8?B?TEhJOFBkeEp5T1dKR3A4aUdwZWRsVDFyZmxObm1CYUF1T3hNT0RSc0FNeU9j?=
 =?utf-8?B?QjkrcTEweDVML0l5TkQ0aGNya1ZRQzBnb1pqeXBaL2o0UFdrdU1HWlZkcW9X?=
 =?utf-8?B?NVVsV0hnWUZwdTlWejlqYmgzeFlBSWtUQmxRckJpVTcwNVNQNm9vU1pYaFN1?=
 =?utf-8?B?bnpnSmZReEtuaXhwbFlWRGdBNnl4OHBCY0dSYXVhK0hocndlK0NmUnFkN1Vh?=
 =?utf-8?B?Y2pzSEtLdHJ3YXk4a29RRVd6d3hhWk5yd3J6NWY4bTNTcFd2ek5XVUEvd1hx?=
 =?utf-8?B?aG00R3VLNXU5VDU4Q2pzb1Q0L2ZBaitWM2w3SFRMZldRSXIzZzk4eDRMK3dB?=
 =?utf-8?B?VElsc1I3NG9OTzBjSW9DTkgxQjRNdXJPNWdVTXFIdDgvcG5oQXNOeGpHWjR1?=
 =?utf-8?B?eU5naS9HcDdva2dibGpDb2xFQ3dSVEs2ZFp1bzBKOWZhMHFQMkZIdXFDUWJ0?=
 =?utf-8?B?UUI5TDFsVDNvcXdsUGtmc0s3VkVHOWR0NkJDcFhpd3FsNFZsWE1aY0lCT3B0?=
 =?utf-8?B?S3FvclB2VjJnZlRqcGFVSFRIRUxYREd6OWM1czFBWk9abkpzRVdMdTBpSjBP?=
 =?utf-8?B?L0JGK0hTdnViSmFBMlU4S0lOb0hKVXJ4MnJqTytkZnF1c1FuTWNBa2xLeGdz?=
 =?utf-8?B?Y0FkeEVuOXdtUE5LS2NxYmxJdnZwdjJzT2Z2ZHlGZ3lQM2JsU3RPOTVja25T?=
 =?utf-8?B?UzlGMkZFRmFVem5yWmNMOS9JRjdNTU9Nb3RIb0JWZFRrUStUQVBFQy9Oa0xs?=
 =?utf-8?B?dnNLNlNYY3ZaOHV4OXVTckhvNnN4ZFlYYmNhR2owUE1mQ2lCeFB2MlB3WW0z?=
 =?utf-8?B?OVZ6dGRXSkpYUjdkSE1adXdOY0ttU09aUmt1WFpZTVNKbS9td1MzbWhGTUw1?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff20ab93-8c88-4f2c-ed9e-08de388cd295
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 08:11:01.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Cr3zRQChYu+J0b2J0/SW2O3KqYfAaPqc8m0XeLYjpRK/kiFkdugNXM3F5O0zU1PUhkwTLEgfN3LKf1hJ+Iz7y4QGQK5k+sL3pPfNGLYr9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6333
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfXyvUXGTYiKJZI
 yMhJ4b8gTgVL7YA1/P+48n8MXU5P+Skjbd5vTmSLHQEtyT/Qe2BA12qU7kWAGV5KIeYbGMGLuRr
 qNwgCbY0qhkes7AQQXVrulvdICZ6cYaETrOBk80RW/w8WahiGGC4NOxurUa/jLJIEsfh53FSwyK
 Q9/JHgFWDhPcCSj319Q14YwMqo6FB2XPLPIRVDe1eTQfHQwyoibFdQRsyP1xGrbTvp7aXK/EScF
 UaZn+PvEPGTq9Z/5zgRqsfviRHGsWQIPCDLa45886KWXDUQF/LsZupJXVp1a6L49DpW+gHXOk42
 Gbnc5NG5hfg43sNLuOxNOyl0QF+TXYfIv1qw1kK+bhzsiTOEYATj3t0twG+Ei2SHpCvbXh1CoIA
 naRaryZc5uDH8WxPw/Om2TWjF8O5aw==
X-Proofpoint-ORIG-GUID: TpARgijLBj8fEj8Eql7p_tNY7bz0HdN9
X-Proofpoint-GUID: TpARgijLBj8fEj8Eql7p_tNY7bz0HdN9
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=693a7c97 cx=c_pps
 a=GAehYNPk9jHZ2DyfQldz4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=4ilfFmmJCuSHC2sYzaUA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 08:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227514


On 10-12-2025 23:50, Randy MacLeod wrote:
> On 2025-12-10 5:18 a.m., Yash.Shinde@windriver.com wrote:
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> Remove the ignore tags for passing riscv64 tests and
>> drop obsolete "tests/codegen-llvm/issues/issue-122805.rs"
> Can you add the upstream commit id/shortlog that removed the test?
> The issue is still open it seems:
> https://github.com/llvm/llvm-project/issues/122805
>
> so you should explain that as well.
>
Actually, the issue is:
https://github.com/rust-lang/rust/issues/122805
https://github.com/rust-lang/rust/issues/122805#issuecomment-2012121917


and the test-case was renamed to "dont-shuffle-bswaps.rs" which passes now:
https://github.com/rust-lang/rust/commit/3580698996f6da6f006477809d7959bffcfd3bf0

>
> ../Randy
>> from exclude test list.
>>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/rust.py          |   1 -
>>   .../rust/files/rust-oe-selftest.patch         | 100 ------------------
>>   2 files changed, 101 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
>> index ebc9204420..3a41391101 100644
>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -80,7 +80,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>>                               'src/tools/tidy',
>>                               'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
>>                               'tests/assembly-llvm/c-variadic-arm.rs',
>> -                            'tests/codegen-llvm/issues/issue-122805.rs',
>>                               'tests/codegen-llvm/thread-local.rs',
>>                               'tests/mir-opt/',
>>                               'tests/run-make',
>> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> index 7d26d75820..b39b326455 100644
>> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> @@ -202,106 +202,6 @@ index a05f274136..0e69b4cb98 100644
>>    fn sparse_inserts() {
>>        let cache: VecCache<u32, u8, u32> = VecCache::default();
>>        let end = if cfg!(target_pointer_width = "64") && cfg!(target_os = "linux") {
>> -diff --git a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
>> -index 828328df843..30753c56c76 100644
>> ---- a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
>> -+++ b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
>> -@@ -8,6 +8,7 @@
>> - //@ compile-flags: -C lto -g -Cdwarf-version=5
>> - //@ assembly-output: emit-asm
>> - //@ no-prefer-dynamic
>> -+//@ ignore-riscv64
>> -
>> - extern crate dwarf_mixed_versions_lto_aux;
>> -
>> -diff --git a/tests/codegen-llvm/const-vector.rs b/tests/codegen-llvm/const-vector.rs
>> -index f4307492341..617e31140e9 100644
>> ---- a/tests/codegen-llvm/const-vector.rs
>> -+++ b/tests/codegen-llvm/const-vector.rs
>> -@@ -3,6 +3,7 @@
>> - //@ [OPT0_S390X] only-s390x
>> - //@ [OPT0] compile-flags: -C no-prepopulate-passes -Copt-level=0
>> - //@ [OPT0_S390X] compile-flags: -C no-prepopulate-passes -Copt-level=0 -C target-cpu=z13
>> -+//@ ignore-riscv64
>> -
>> - // This test checks that constants of SIMD type are passed as immediate vectors.
>> - // We ensure that both vector representations (struct with fields and struct wrapping array) work.
>> -diff --git a/tests/codegen-llvm/enum/enum-aggregate.rs b/tests/codegen-llvm/enum/enum-aggregate.rs
>> -index 0161e5f3fa1..773a06fabb4 100644
>> ---- a/tests/codegen-llvm/enum/enum-aggregate.rs
>> -+++ b/tests/codegen-llvm/enum/enum-aggregate.rs
>> -@@ -1,6 +1,7 @@
>> - //@ compile-flags: -Copt-level=0 -Cno-prepopulate-passes
>> - //@ min-llvm-version: 19
>> - //@ only-64bit
>> -+//@ ignore-riscv64
>> -
>> - #![crate_type = "lib"]
>> -
>> -diff --git a/tests/codegen-llvm/enum/enum-match.rs b/tests/codegen-llvm/enum/enum-match.rs
>> -index 57db44ec74e..1e2507f7c90 100644
>> ---- a/tests/codegen-llvm/enum/enum-match.rs
>> -+++ b/tests/codegen-llvm/enum/enum-match.rs
>> -@@ -1,5 +1,6 @@
>> - //@ compile-flags: -Copt-level=1
>> - //@ only-64bit
>> -+//@ ignore-riscv64
>> -
>> - #![crate_type = "lib"]
>> - #![feature(core_intrinsics)]
>> -diff --git a/tests/codegen-llvm/enum/enum-transparent-extract.rs b/tests/codegen-llvm/enum/enum-transparent-extract.rs
>> -index c5efb8d472b..e79b8916fc1 100644
>> ---- a/tests/codegen-llvm/enum/enum-transparent-extract.rs
>> -+++ b/tests/codegen-llvm/enum/enum-transparent-extract.rs
>> -@@ -1,5 +1,6 @@
>> - //@ compile-flags: -Copt-level=0
>> - //@ only-64bit
>> -+//@ ignore-riscv64
>> -
>> - #![crate_type = "lib"]
>> -
>> -diff --git a/tests/codegen-llvm/repeat-operand-zero-len.rs b/tests/codegen-llvm/repeat-operand-zero-len.rs
>> -index b4cec42a07c..d450fead9a4 100644
>> ---- a/tests/codegen-llvm/repeat-operand-zero-len.rs
>> -+++ b/tests/codegen-llvm/repeat-operand-zero-len.rs
>> -@@ -1,4 +1,5 @@
>> - //@ compile-flags: -Copt-level=1 -Cno-prepopulate-passes
>> -+//@ ignore-riscv64
>> -
>> - // This test is here to hit the `Rvalue::Repeat` case in `codegen_rvalue_operand`.
>> - // It only applies when the resulting array is a ZST, so the test is written in
>> -diff --git a/tests/codegen-llvm/simd/extract-insert-dyn.rs b/tests/codegen-llvm/simd/extract-insert-dyn.rs
>> -index 729f0145314..2b1d1beb86a 100644
>> ---- a/tests/codegen-llvm/simd/extract-insert-dyn.rs
>> -+++ b/tests/codegen-llvm/simd/extract-insert-dyn.rs
>> -@@ -1,4 +1,5 @@
>> - //@compile-flags: -C opt-level=3 -C no-prepopulate-passes
>> -+//@ ignore-riscv64
>> -
>> - #![feature(
>> -     core_intrinsics,
>> -diff --git a/tests/codegen-llvm/transmute-scalar.rs b/tests/codegen-llvm/transmute-scalar.rs
>> -index ce1b0558b2e..e8fda2cd566 100644
>> ---- a/tests/codegen-llvm/transmute-scalar.rs
>> -+++ b/tests/codegen-llvm/transmute-scalar.rs
>> -@@ -1,6 +1,7 @@
>> - //@ add-core-stubs
>> - //@ compile-flags: -C opt-level=0 -C no-prepopulate-passes --target=x86_64-unknown-linux-gnu
>> - //@ needs-llvm-components: x86
>> -+//@ ignore-riscv64
>> -
>> - #![crate_type = "lib"]
>> - #![feature(no_core, repr_simd)]
>> -diff --git a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
>> -index face1577c3f..09e0846bad0 100644
>> ---- a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
>> -+++ b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
>> -@@ -1,4 +1,5 @@
>> - //@ compile-flags: -Copt-level=3
>> -+//@ ignore-riscv64
>> -
>> - // Seehttps://github.com/rust-lang/rust/issues/135802
>> -
>>   diff --git a/tests/ui/abi/rust-cold-works-with-rustic-args.rs b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
>>   index 551485469d3..575db924968 100644
>>   --- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
>
>
> -- 
> # Randy MacLeod
> # Wind River Linux

