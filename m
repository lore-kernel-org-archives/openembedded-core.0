Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96ACBFCA195
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 21:44:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26334.1773092669622865152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 14:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=PeUaeYBs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7528379c80=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629LH9th3709431
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 14:44:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=phPxgvUThYNkt8OKsGuLPV
	uZ7CsnQeP7Ut/cEou4ISg=; b=PeUaeYBsNssTdbP8CNYMSS+GcabM/4bN+W1xui
	6xzkDRZwx9UzW8L4Jd8yOminFA7SNFORKc7jbFy4j3CPKdu8JnnquZMsdQPLtm76
	LC35zESxPLevuLQ7b+2wyopPXdA3CI+pJhulzMNctkKPFYRfYX6gTh8zc1bN9EtD
	oDb9QeAArGBHQki3yLJvrMET6g9SHh3Yr26GxX1P9pAHU/7uhDjWs1+qzUOAiOZr
	vH+995dg8Bcvt3y/26yS6nYGUGzlzBMcf+o7OrSAW71PQCXGtf2yrXXCEX3J3xO1
	ho5nlaPOGVEvPTdRe5TrkME7JZex0RuwKTY0c259bM5EJOpQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62j9f1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 14:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jmtf42IVP6l49uMBeYOJm+bhHefD6zVY0ZXUXuMJErAyMyPJdTcXnB6+3AtQeHRuYCN/5kWEhDeK8TaWrquve99W2dGf9Ek5N563pj9isIW9//guzyfNj0ig9Pb3WjUvCoBkBa4lVx2U4G/AfatoZu2oCilr+Z2343XS3/G4xjxHDLllLDkwC9WERtT73G6cka8t9bFS3cduem+qkBPuqyefcJYzkRI5Yoh+jM9rXMGnl1hBXFibLxFDfJTgshuwqWx0zmCq9Gg6G17hHklp9gb3gYTBpACQTS8Vg/u6d06+m4m9fm8ARugYDQgpdJl9Jolh4u3H+CRQMPF+OjU1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phPxgvUThYNkt8OKsGuLPVuZ7CsnQeP7Ut/cEou4ISg=;
 b=dsAZSKP0RQBZ1Q/XemSyVQRjjKmePvtRBxYQ/mX9ee023LZzU3bN4yzfP0v3csVTHWzIdBzjMs3VJV0wcvBCwvrTOSgllW32Hc8YUjhKc7kl1GMF1DGP1F4chpJELtOkwV9wrXB5Wv4W2C/25/wT3eGXvVzr7kESmyAM2ehxAOWmFgrpEK0kk5+cJVASJR9bV///fQunuy9gJOv6/avEefacfJtpIQFTXtANkmOr2WtbNtOOazHnXyaZsa4mYzZdlPpT5hBosw3DgN5scZnZ7sK6wIO7JgK1knn12JPJlhw3WawLEc86cqJB/iNBu0MLJc2yc/L1MSesKwmvq7gDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 21:44:23 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 21:44:23 +0000
Content-Type: multipart/alternative;
 boundary="------------RLDUp2VmdqrsS7q8YUIcDXLK"
Message-ID: <7b97ffcb-02f1-4c23-a5f3-f0123925222f@windriver.com>
Date: Mon, 9 Mar 2026 17:44:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
To: alejandro@enedino.org
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        "Chen, Qi" <qi.chen@windriver.com>,
        "Jia, Hongxu"
 <Hongxu.Jia@windriver.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
References: <20240618181226.2693197-1-alejandro@enedino.org>
 <CANNYZj8r9oXzeJcRZQZvv0Q5xDvLioS6300xiuDN8fvJGagMvA@mail.gmail.com>
 <CAHMutrYycC+o624V-GhN7zA7Z0DEJL_gx=P8EK9frxM3CD=-qQ@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAHMutrYycC+o624V-GhN7zA7Z0DEJL_gx=P8EK9frxM3CD=-qQ@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::12) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bef0f78-5915-4904-5f40-08de7e2506d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|8096899003|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	q+mk0oirdSeJtD4VOc57ZbMyLEP3j76mAQG1yiIinBZyXVtwTAApIGrTUONKIZUZ+7F+wJMpS6EOXynMep4fJL8tJGHG8UbTYa0nqygwNp4Y5GiaZhwTgAjdIOYscunBX2Anke4XghMPZM6BJIEPPu777hO5UB4Ty8tfilxUc6pYxSMA1qvyt9w2XeJwPXRH8av0sUknzVZLH5LalEqBztWffPkr0sxzrN+vZs4PmYjvQd1qE18pIU4gPZI/LdZ7Myd0VudNChEqoeN2MMOsZQE9paLzjDZF4I3zOK8cNbZJO2JFQFFxIop7SgCiAMqRkdH86YuoZZNZqncsPE763WdM58UgE4CxcDPkad4fuKxZ1BmgKyQBYa2i6mxuHhc/XvHDwrRHOv77oWxzohe9/kY/oEHTIaFUjQrI0B0fsoa946QN+1+/ECWvP7Inb/ef22HRGSVX/Y7XcAqi8yasuMr+WjQ2ek03gmn4ri6doLJjE4yAfbBwubhUsCP9o6C30jUzjjrZVZF6LIW+ak+Wa61KsB+Nhds03D3/ruAG8PWaCMdb2YXONvliGtoGJOyP9pD2Urkj4ZCVAvWPZtzUhBKjLwJO6eT9YfBfz5A0BZpgrB8ookv/oQNTlgzet1u1fOQgmmVuROgfvdjle5kukG43XVvMiH5SZR6Der/VU4PkGZKTj0FvdXHlWWwCL9uM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(8096899003)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d3ZiTVkrdnlCYXFhSzBLZ29RN1BLT25HaDAyRVJGTzNvT2dkbVJ3UXk5bGF2?=
 =?utf-8?B?TkpBSyt6WlRlK0Z3TUJJeVF4d3QwRnB4RkJSN01nMndEMnZiZGtwWU1PWFNJ?=
 =?utf-8?B?dHlSaFYrN3lJRTdhOXdaVzVRNW9XdlZleHFIbFJKMHlBWGI2aEJiSWZISWcy?=
 =?utf-8?B?UjRvQ0tKL09BY2FDYTNRTWdoNE03ZVgxQ1RhaXQrTVNkUVVLaHo3alY4Zlpr?=
 =?utf-8?B?dUUrckxlbU1LZUVHQ1J3b21ibkNQOFlpbDlXeSs0ZnhaSEdvZXZNbWpkRksr?=
 =?utf-8?B?K1NIQnQ1R0NvTFNoZXgzMHVJZGh2c08vcmMyMDh5d1N4S3lqbGR2dklPVllh?=
 =?utf-8?B?Y3EySkxLNmZiSjZ0LytENUx4eVpablNEZnBUMDEvNzZPd2pkVW1ibzJ3T09k?=
 =?utf-8?B?Q2VSUDVXLzFvUHM4WE02bkVxM28yNkErN3RxQ0Y2WTRGSkhtRC9NMzJxdHdV?=
 =?utf-8?B?N0JNS05Ua0xydmt0SDIyampVZWxDaXZkSGF1bUpLclJ3cXRGS0FFN0VCbU9z?=
 =?utf-8?B?UjFZQnY5clk4Ny9hN1FmUVV0eEVtc3dSWnBVeWF5K1JRdm1OZ2lod2VwTXdt?=
 =?utf-8?B?T0FGMmRuWWRVRG1qNFRIeEJ2SjVFNy9Xa3R0MlZsVENDUTRQd05SYytyVGlB?=
 =?utf-8?B?aWhVaWlkSldrK2NVNk40ZkcwRWRrRTZQMFpja1ZDbEIyTmZsQ2c2UWVoR01m?=
 =?utf-8?B?TUp0cHhaN1ZzZDg4RkRJTnhYa3RjRWRmUm5XeHh4WGN3WVpveCtFOU9yU2RD?=
 =?utf-8?B?MnRNNDd6em5mWnJzNFBiVUtVYzEyM0VNUDlEaUQrK2FIb29pYm1xa1E1V09x?=
 =?utf-8?B?czBZNWdlbEdyUEZ2NktScUZhSTAyY2tsR2o2cmVSbWpkSlYrQWhlbERtQXpD?=
 =?utf-8?B?NmVYVVlJVndDRGRsVlZjQUF2dUhsQ1ZMQ0prTCt4K2JTeEhHMk5VNGVvRVg2?=
 =?utf-8?B?Z1U4VVM4OFE3Si9saDhWdFhKNFVWckNwcjUyaUJkVTdaVDVFOGNVTXQ3elZ2?=
 =?utf-8?B?R2NDZGQ5TE9RLzhqMEt5SklBR05rdjY5d1VzZHlwUjZtaFQ5TDZBZ1Y4bFFF?=
 =?utf-8?B?ZnpPOHVHUVo2d0x0OVdMZ3JhVitySlNlWkZMcWhNOHJ4ajF2WHplSmZ5azU5?=
 =?utf-8?B?cnkvNVNqY2J2NVBWNWVyT3pFS2xHT1pPcUtzbWE0L2l3L1VVUWhENTdDeUZh?=
 =?utf-8?B?MWNQTkxoRDFTdGt5ajZxT1BZd0d0Ymh0Zkx2aGwzL015Q0c5TXU2RlB3ZGpY?=
 =?utf-8?B?Q25rZW5BL3hBd0VSeVJGMWw0clJGdkNyKy90NTE0MWg0UFVSd3g0VWNTRitM?=
 =?utf-8?B?R1MvODZ5L1RPT2xwa2NHcmllQ2NXc1paamRZOC8zaUZGT1RXOEYzdUxrbGhx?=
 =?utf-8?B?cFNOcGlKUWRiSUcxdmVFOHJoUGoxQWl4WUhDM2NHS09FSUlRK2hwOTFBbTlj?=
 =?utf-8?B?VTFSaS93dEl6Mk9QRkJyVC9VUFFlbDZCb0JYVmJQbXM2em4zbzV4bWFRYW9s?=
 =?utf-8?B?d0NaT3hULzhTMzVsS2RVUlNlYnljL09YTzQwZlRQWFh3WUROZTZRR05kUWpD?=
 =?utf-8?B?cFBycDBwdS9NWUYvZHBoTUVFRENYamQ2c0Y0SksxbC9JZnlxdGcwSlNPQU82?=
 =?utf-8?B?Mm1YWmhqOXZwOUFDWE1uU2NtdFRZaVVnSTJ4Ylp5UlBPZGN6UzVXR3RYVzUr?=
 =?utf-8?B?RlVMSUJWWk5hdUdCQlZmcUx3ajU0TDFEUVhDWG5Vd2gvL2tiWGE2ZmxEbFEw?=
 =?utf-8?B?ZkdMOG1adTYrSEQvREtKTlZ1M1lYL3ZXWUtMNE9GU2puRklYYVE5RGk3cTJl?=
 =?utf-8?B?Wm1VK1N3TTdjMVJaWDd2M2o3STRtOVJCekNadGZ1QVRiNmNVQzFTUkIvZ1RV?=
 =?utf-8?B?aVNabHlVbkJvSThVT2NVampkcnFLWkFyaVFzeGZMMjBiQWZOTlZ1VEdWWXpt?=
 =?utf-8?B?WjdKdWNyR0NEOWZqYm51cFhaY0w4VXY3Uyt3akpKKzBzY2pXVE5YanpPTStz?=
 =?utf-8?B?ek54RGpJZ0p6VFk5Q3ByZHNpUERlYmF2T09OY0oxODBrb1J4NUNaZ3J2VFBE?=
 =?utf-8?B?aTJmQUtiT3dKMFlhYUhUSFdqYzNwdC9hVVBmcDJNcWFtdVlCaUNmZFZVaGZM?=
 =?utf-8?B?Zlh1aDBnMTBLZW1uWkdiRkN5NmxCRGlWZG1rNWNhbGI3M0lLL0k4NlNvMkwv?=
 =?utf-8?B?SGI2L2k4ZjZ5TzlmSlZ5QVpKT1BuNEhVWDI2bVFqdmVMTFJhQ3FCd2RJMWhB?=
 =?utf-8?B?NnM0WitNUzdaYzNmTStlUnNpQW4rZU5WS0V3YVpOSjdyOUFZUGZ0VmpUYjNk?=
 =?utf-8?B?R01JZi8wT0dXODVvSFJuNEdySmZlRUtmc0RFZGgrQUpqTEQ0ejNMV0J3VVdQ?=
 =?utf-8?Q?SjHT9l3cmZH/Q3Rc=3D?=
X-Exchange-RoutingPolicyChecked: 
	m+TnHL7zQ8/tNa1ZZ8jEBDe7/3TV2GYOnL0mLLAoUl8jrN/rd/pCLoUeQaQYGsmwVy1XN8UorkdOTZ+3aVoDR89xaabC/og7YXvhA8JzgPeJbLGyaK7VBrQqfDsODbs6OzrT+faxa1XalCGoR3PYevLVjof7Vz6E/tGB4PIWbHef/E+21IT/EbwVAEgg96l/a+i2pbglesP6+tH3U5FYceTbUZqreyQhzSLNUj4k1QHZ5L5diEOJJunjXJwnHb5JOcjDcRS/T5iFuWPMI9emB8HvnoBqHyz7ZRisO07EyTyds5vTCKZwIuCG+qKt6hG2dZUsHBuVWIQHVBNQERFEPA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bef0f78-5915-4904-5f40-08de7e2506d8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 21:44:23.0394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcHbn4nE04BszP+n6tNrWkotleMKRoBZ7tqAWEMtD4YcpXlgJGaDB9D3cn7owc2XyDDlga/+Ge0Ty3HKge7JSg83pcDFSHKGtKPcudqiUXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69af3f3d cx=c_pps
 a=qHW1pi9L+1RZ0SKNcL3CYw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=MhnL__LWAAAA:8
 a=Q4-j1AaZAAAA:8 a=ixY-ZCe-AAAA:8 a=rhrC7H2CAAAA:8 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8
 a=iGHA9ds3AAAA:8 a=8l91wnhupvcrZj-u9eQA:9 a=UiJ00zzK1Jc7mUab:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bN1Kp5pgs3qBcrEZ6rcA:9
 a=18ECGU-S1z3PJTdG:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=DArMNfZabhNmbrQIurc0:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=RM0M0f_N3ZaV-G_kF7GM:22
 a=QyCRbUpJFcq6Z3CqAfLQ:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MyBTYWx0ZWRfX+nT5N+NOaU34
 9yozSLg8pEqJZVTKKxjQ56CdNuWttihVumK4tBqoECBEJ9RD46np/jy14WfWpJ6dEDPYyXSAT1c
 FQ+go7RsSNAXd4g60I+5SdwuKM9a1qjkDMp3ScKgPi8l1rcvMP5xTM1U5/PCXwBtgPXCNjFOkx9
 7WnCehKAQStPcc0K6ZfgQwcPSHo5RiTpO5d3CbsSg1bhq6gBibhduelwnCA2/C5GbTi82rJq1or
 oZiy8lSil2bKM+tfsqgCNhrQUKecObScMWK/es3AGi9gty9JtnTcHDHRZzBNYbfXrwxwLiNC0cK
 mewzdjRj3NPqTDNKAaXgW2nezUQY4+Tat6k347aYiFDUN+sw2dKpVkYE/XILyCX52UjrQDLl+Pr
 udh9W93HeIXV+gLA+VazbvoNgsSZ56GXzlcT4YFb9rycolsjRCPQlvixDbt3XQyRy2r8yZ5z6zJ
 sDUHoWDqzO49RbXfGqQ==
X-Proofpoint-ORIG-GUID: VdvQSCrOh-oscFCUVvgDe8I3ABwmHDgB
X-Proofpoint-GUID: cKkmNo2wVYxTPcmqFlO7KVUQIbyswUa_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 21:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232754

--------------RLDUp2VmdqrsS7q8YUIcDXLK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 629LH9th3709431

On 2024-07-30 3:15 p.m., Alejandro Hernandez Samaniego via=20
lists.openembedded.org wrote:
> Sure thing, I'm in the process of doing so

Alejandro,

Are you still using picolibc ?
Do you want to update the version to 1.8.11:

https://keithp.com/picolibc/dist/

picolibc.git on main is =F0=9F=93=A6 v1.8.11
=E2=9D=AF git log --oneline 1.8.6..1.8.11 | wc -l
1682

=E2=9D=AF git diff 1.8.6..1.8.11 | diffstat | tail -1
 =C2=A04320 files changed, 465509 insertions(+), 422873 deletions(-)

../Randy


>
> On Tue, Jul 30, 2024, 1:00=E2=80=AFPM Alexander Kanavin=20
> <alex.kanavin@gmail.com> wrote:
>
>     Can you submit the pending avoid_polluting_cross_directories.patch
>     upstream please?
>
>     Alex
>
>     On Tue, 18 Jun 2024 at 20:09, Alejandro Hernandez Samaniego via
>     lists.openembedded.org <http://lists.openembedded.org>
>     <alejandro=3Denedino.org@lists.openembedded.org>
>     wrote:
>     >
>     > Enables usage of TCLIBC=3Dpicolibc extending OE functionality to
>     build and use
>     > picolibc based toolchains to build baremetal applications.
>     >
>     > Picolibc is a set of standard C libraries, both libc and libm,
>     designed for
>     > smaller embedded systems with limited ROM and RAM. Picolibc
>     includes code
>     > from Newlib and AVR Libc, but adresses some of newlibs concerns,
>     it retains
>     > newlibs directory structure, math, string and locale
>     implementations, but
>     > removed the GPL bits used to build the library, swiches old C
>     style code for
>     > C18 and replaces autotools with meson.
>     >
>     > This patch adds a picolibc recipe for the C library, a
>     picolibc-helloworld
>     > recipe that contains an example application and a testcase that
>     builds it.
>     >
>     > Picolibc can be built for ARM and RISCV architectures, its been
>     tested both
>     > for 32 and 64 bits, the provided example recipe produces the
>     following output:
>     >
>     > hello, world
>     >
>     > Runqemu does not automatically show any output since it hides
>     QEMU stderr which
>     > is where the QEMU monitors output is directed to when using
>     semihosting, but,
>     > manually running the same QEMU command does work properly.
>     >
>     > Signed-off-by: Alejandro Enedino Hernandez Samaniego
>     <alejandro@enedino.org>
>     > ---
>     >=C2=A0 meta/classes-recipe/baremetal-image.bbclass=C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +-
>     >=C2=A0 meta/classes-recipe/cross-canadian.bbclass=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-
>     >=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +
>     >=C2=A0 meta/conf/distro/include/tclibc-picolibc.inc=C2=A0 |=C2=A0 =
40 ++++++
>     >=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-
>     >=C2=A0 .../conf/machine/include/riscv/arch-riscv.inc |=C2=A0 =C2=A0=
1 +
>     >=C2=A0 meta/lib/oeqa/selftest/cases/distrodata.py=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-
>     >=C2=A0 meta/lib/oeqa/selftest/cases/picolibc.py=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 18 +++
>     >=C2=A0 .../picolibc/picolibc-helloworld_git.bb
>     <http://picolibc-helloworld_git.bb> =C2=A0|=C2=A0 40 ++++++
>     >=C2=A0 meta/recipes-core/picolibc/picolibc.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 21 ++++
>     >=C2=A0 .../avoid_polluting_cross_directories.patch=C2=A0 =C2=A0| 1=
19
>     ++++++++++++++++++
>     >=C2=A0 .../picolibc/no-early-compiler-checks.cross=C2=A0 =C2=A0|=C2=
=A0 =C2=A06 +
>     >=C2=A0 meta/recipes-core/picolibc/picolibc_git.bb
>     <http://picolibc_git.bb> =C2=A0 |=C2=A0 35 ++++++
>     >=C2=A0 meta/recipes-devtools/gcc/gcc-cross.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 +
>     >=C2=A0 meta/recipes-devtools/gcc/gcc-runtime.inc=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A03 +
>     >=C2=A0 meta/recipes-devtools/gcc/libgcc-common.inc=C2=A0 =C2=A0|=C2=
=A0 =C2=A05 +
>     >=C2=A0 16 files changed, 296 insertions(+), 5 deletions(-)
>     >=C2=A0 create mode 100644 meta/conf/distro/include/tclibc-picolibc=
.inc
>     >=C2=A0 create mode 100644 meta/lib/oeqa/selftest/cases/picolibc.py
>     >=C2=A0 create mode 100644
>     meta/recipes-core/picolibc/picolibc-helloworld_git.bb
>     <http://picolibc-helloworld_git.bb>
>     >=C2=A0 create mode 100644 meta/recipes-core/picolibc/picolibc.inc
>     >=C2=A0 create mode 100644
>     meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directori=
es.patch
>     >=C2=A0 create mode 100644
>     meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
>     >=C2=A0 create mode 100644 meta/recipes-core/picolibc/picolibc_git.=
bb
>     <http://picolibc_git.bb>
>     >
>     > diff --git a/meta/classes-recipe/baremetal-image.bbclass
>     b/meta/classes-recipe/baremetal-image.bbclass
>     > index 4e7d413626..27f2d2d10a 100644
>     > --- a/meta/classes-recipe/baremetal-image.bbclass
>     > +++ b/meta/classes-recipe/baremetal-image.bbclass
>     > @@ -16,8 +16,8 @@
>     >=C2=A0 # See meta-skeleton for a working example.
>     >
>     >
>     > -# Toolchain should be baremetal or newlib based.
>     > -# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib"
>     > +# Toolchain should be baremetal or newlib/picolibc based.
>     > +# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib" or TCLIBC=3D"picolib=
c"
>     >=C2=A0 COMPATIBLE_HOST:libc-musl:class-target =3D "null"
>     >=C2=A0 COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
>     >
>     > diff --git a/meta/classes-recipe/cross-canadian.bbclass
>     b/meta/classes-recipe/cross-canadian.bbclass
>     > index 1670217d69..059d9aa95f 100644
>     > --- a/meta/classes-recipe/cross-canadian.bbclass
>     > +++ b/meta/classes-recipe/cross-canadian.bbclass
>     > @@ -36,7 +36,7 @@ python () {
>     >=C2=A0 =C2=A0 =C2=A0 if d.getVar("MODIFYTOS") !=3D "1":
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>     >
>     > -=C2=A0 =C2=A0 if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]=
:
>     > +=C2=A0 =C2=A0 if d.getVar("TCLIBC") in [ 'baremetal', 'newlib', =
'picolibc' ]:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>     >
>     >=C2=A0 =C2=A0 =C2=A0 tos =3D d.getVar("TARGET_OS")
>     > diff --git a/meta/conf/distro/include/maintainers.inc
>     b/meta/conf/distro/include/maintainers.inc
>     > index 42599267c1..ff24597723 100644
>     > --- a/meta/conf/distro/include/maintainers.inc
>     > +++ b/meta/conf/distro/include/maintainers.inc
>     > @@ -578,6 +578,8 @@ RECIPE_MAINTAINER:pn-pcmanfm =3D "Alexander
>     Kanavin <alex.kanavin@gmail.com>"
>     >=C2=A0 RECIPE_MAINTAINER:pn-perf =3D "Bruce Ashfield
>     <bruce.ashfield@gmail.com>"
>     >=C2=A0 RECIPE_MAINTAINER:pn-perl =3D "Alexander Kanavin
>     <alex.kanavin@gmail.com>"
>     >=C2=A0 RECIPE_MAINTAINER:pn-perlcross =3D "Alexander Kanavin
>     <alex.kanavin@gmail.com>"
>     > +RECIPE_MAINTAINER:pn-picolibc =3D "Alejandro Hernandez
>     <alejandro@enedino.org>"
>     > +RECIPE_MAINTAINER:pn-picolibc-helloworld =3D "Alejandro Hernande=
z
>     <alejandro@enedino.org>"
>     >=C2=A0 RECIPE_MAINTAINER:pn-piglit =3D "Ross Burton <ross.burton@a=
rm.com>"
>     >=C2=A0 RECIPE_MAINTAINER:pn-pigz =3D "Hongxu Jia <hongxu.jia@windr=
iver.com>"
>     >=C2=A0 RECIPE_MAINTAINER:pn-pinentry =3D "Unassigned
>     <unassigned@yoctoproject.org>"
>     > diff --git a/meta/conf/distro/include/tclibc-picolibc.inc
>     b/meta/conf/distro/include/tclibc-picolibc.inc
>     > new file mode 100644
>     > index 0000000000..203765dfcb
>     > --- /dev/null
>     > +++ b/meta/conf/distro/include/tclibc-picolibc.inc
>     > @@ -0,0 +1,40 @@
>     > +#
>     > +# Picolibc configuration
>     > +#
>     > +
>     > +LIBCEXTENSION =3D "-picolibc"
>     > +LIBCOVERRIDE =3D ":libc-picolibc"
>     > +
>     > +PREFERRED_PROVIDER_virtual/libc ?=3D "picolibc"
>     > +PREFERRED_PROVIDER_virtual/libiconv ?=3D "picolibc"
>     > +PREFERRED_PROVIDER_virtual/libintl ?=3D "picolibc"
>     > +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-gli=
bc"
>     > +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-gl=
ibc"
>     > +
>     > +DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
>     > +
>     > +IMAGE_LINGUAS =3D ""
>     > +
>     > +LIBC_DEPENDENCIES =3D " \
>     > +=C2=A0 =C2=A0 picolibc-dbg \
>     > +=C2=A0 =C2=A0 picolibc-dev \
>     > +=C2=A0 =C2=A0 libgcc-dev \
>     > +=C2=A0 =C2=A0 libgcc-dbg \
>     > +=C2=A0 =C2=A0 libstdc++-dev=C2=A0 \
>     > +=C2=A0 =C2=A0 libstdc++-staticdev \
>     > +"
>     > +
>     > +ASSUME_PROVIDED +=3D "virtual/crypt"
>     > +
>     > +TARGET_OS =3D "elf"
>     > +TARGET_OS:arm =3D "eabi"
>     > +
>     > +TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE}
>     nativesdk-qemu nativesdk-sdk-provides-dummy"
>     > +TOOLCHAIN_TARGET_TASK ?=3D "${LIBC_DEPENDENCIES}"
>     > +TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D "zlib ncurses"
>     > +
>     > +# RISCV linker doesnt support PIE
>     > +SECURITY_CFLAGS:libc-picolibc:qemuriscv32 =3D
>     "${SECURITY_NOPIE_CFLAGS}"
>     > +SECURITY_CFLAGS:libc-picolibc:qemuriscv64 =3D
>     "${SECURITY_NOPIE_CFLAGS}"
>     > +
>     > +
>     > diff --git a/meta/conf/documentation.conf
>     b/meta/conf/documentation.conf
>     > index b0591881ba..ad89142934 100644
>     > --- a/meta/conf/documentation.conf
>     > +++ b/meta/conf/documentation.conf
>     > @@ -421,7 +421,7 @@ TARGET_FPU[doc] =3D "Specifies the method for
>     handling FPU code. For FPU-less targ
>     >=C2=A0 TARGET_OS[doc] =3D "Specifies the target's operating system=
."
>     >=C2=A0 TARGET_PREFIX[doc] =3D "The prefix for the cross-compile
>     toolchain (e.g. arm-linux-)."
>     >=C2=A0 TARGET_SYS[doc] =3D "The target system is comprised of
>     TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
>     > -TCLIBC[doc] =3D "Specifies C library (libc) variant to use durin=
g
>     the build process. You can select 'baremetal', 'glibc', 'musl' or
>     'newlib'."
>     > +TCLIBC[doc] =3D "Specifies C library (libc) variant to use durin=
g
>     the build process. You can select 'baremetal', 'glibc', 'musl',
>     'newlib', or 'picolibc'."
>     >=C2=A0 TCMODE[doc] =3D "Enables an external toolchain (where provi=
ded by
>     an additional layer) if set to a value other than 'default'."
>     >=C2=A0 TESTIMAGE_AUTO[doc] =3D "Enables test booting of virtual ma=
chine
>     images under the QEMU emulator after any root filesystems are
>     created and runs tests against those images each time an image is
>     built."
>     >=C2=A0 TEST_QEMUBOOT_TIMEOUT[doc] =3D "The time in seconds allowed=
 for
>     an image to boot before automated runtime tests begin to run
>     against an image."
>     > diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
>     b/meta/conf/machine/include/riscv/arch-riscv.inc
>     > index 230a266563..b34064e78f 100644
>     > --- a/meta/conf/machine/include/riscv/arch-riscv.inc
>     > +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
>     > @@ -11,5 +11,6 @@ TUNE_CCARGS:append =3D
>     "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nc', ' -marc
>     >
>     >=C2=A0 # Fix: ld: unrecognized option '--hash-style=3Dsysv'
>     >=C2=A0 LINKER_HASH_STYLE:libc-newlib =3D ""
>     > +LINKER_HASH_STYLE:libc-picolibc =3D ""
>     >=C2=A0 # Fix: ld: unrecognized option '--hash-style=3Dgnu'
>     >=C2=A0 LINKER_HASH_STYLE:libc-baremetal =3D ""
>     > diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py
>     b/meta/lib/oeqa/selftest/cases/distrodata.py
>     > index ad952c004b..043953757f 100644
>     > --- a/meta/lib/oeqa/selftest/cases/distrodata.py
>     > +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
>     > @@ -55,7 +55,7 @@ but their recipes claim otherwise by setting
>     UPSTREAM_VERSION_UNKNOWN. Please re
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def is_maintainer_exception(ent=
ry):
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exceptions =3D ["musl"=
, "newlib", "linux-yocto",
>     "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exceptions =3D ["musl"=
, "newlib", "picolibc",
>     "linux-yocto", "linux-dummy", "mesa-gl", "libgfortran",
>     "libx11-compose-data",
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "cve-update-nvd2-native",]
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in exceptio=
ns:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if i in entry:
>     > diff --git a/meta/lib/oeqa/selftest/cases/picolibc.py
>     b/meta/lib/oeqa/selftest/cases/picolibc.py
>     > new file mode 100644
>     > index 0000000000..e40b4fc3d3
>     > --- /dev/null
>     > +++ b/meta/lib/oeqa/selftest/cases/picolibc.py
>     > @@ -0,0 +1,18 @@
>     > +#
>     > +# Copyright OpenEmbedded Contributors
>     > +#
>     > +# SPDX-License-Identifier: MIT
>     > +#
>     > +
>     > +from oeqa.selftest.case import OESelftestTestCase
>     > +from oeqa.utils.commands import bitbake, get_bb_var
>     > +
>     > +class PicolibcTest(OESelftestTestCase):
>     > +
>     > +=C2=A0 =C2=A0 def test_picolibc(self):
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible_machines =3D ['qemuarm', =
'qemuarm64',
>     'qemuriscv32', 'qemuriscv64']
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine =3D get_bb_var('MACHINE')
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if machine not in compatible_machine=
s:
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest('This te=
st only works with machines :
>     %s' % ' '.join(compatible_machines))
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config('TCLIBC =3D "picol=
ibc"')
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake("picolibc-helloworld")
>     > diff --git
>     a/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
>     <http://picolibc-helloworld_git.bb>
>     b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
>     <http://picolibc-helloworld_git.bb>
>     > new file mode 100644
>     > index 0000000000..573a571c24
>     > --- /dev/null
>     > +++ b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
>     <http://picolibc-helloworld_git.bb>
>     > @@ -0,0 +1,40 @@
>     > +require picolibc.inc
>     > +
>     > +# baremetal-image overrides
>     > +BAREMETAL_BINNAME ?=3D "hello_picolibc_${MACHINE}"
>     > +IMAGE_LINK_NAME ?=3D "baremetal-picolibc-image-${MACHINE}"
>     > +IMAGE_NAME_SUFFIX ?=3D ""
>     > +QB_DEFAULT_KERNEL ?=3D "${IMAGE_LINK_NAME}.elf"
>     > +
>     > +inherit baremetal-image
>     > +
>     > +COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv6=
4"
>     > +
>     > +# Use semihosting to test via QEMU
>     > +QB_OPT_APPEND:append =3D " -semihosting-config enable=3Don"
>     > +
>     > +# picolibc comes with a set of linker scripts, set the file
>     > +# according to the architecture being built.
>     > +PICOLIBC_LINKERSCRIPT:qemuarm64 =3D "aarch64.ld"
>     > +PICOLIBC_LINKERSCRIPT:qemuarm =3D "arm.ld"
>     > +PICOLIBC_LINKERSCRIPT:qemuriscv32 =3D "riscv.ld"
>     > +PICOLIBC_LINKERSCRIPT:qemuriscv64 =3D "riscv.ld"
>     > +
>     > +# Simple compile function that manually exemplifies usage; as
>     noted,
>     > +# use a custom linker script, the GCC specs provided by picolibc
>     > +# and semihost to be able to test via QEMU's monitor
>     > +do_compile(){
>     > +=C2=A0 =C2=A0 ${CC} ${CFLAGS} ${LDFLAGS} --verbose
>     -T${S}/hello-world/${PICOLIBC_LINKERSCRIPT} -specs=3Dpicolibc.specs
>     --oslib=3Dsemihost -o ${BAREMETAL_BINNAME}.elf
>     ${S}/hello-world/hello-world.c
>     > +=C2=A0 =C2=A0 ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.elf
>     ${BAREMETAL_BINNAME}.bin
>     > +}
>     > +
>     > +do_install(){
>     > +=C2=A0 =C2=A0 install -d ${D}/${base_libdir}/firmware
>     > +=C2=A0 =C2=A0 install -m 755 ${B}/${BAREMETAL_BINNAME}.elf
>     ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
>     > +=C2=A0 =C2=A0 install -m 755 ${B}/${BAREMETAL_BINNAME}.bin
>     ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
>     > +}
>     > +
>     > +FILES:${PN} +=3D " \
>     > +=C2=A0 =C2=A0 ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
>     > +=C2=A0 =C2=A0 ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
>     > +"
>     > diff --git a/meta/recipes-core/picolibc/picolibc.inc
>     b/meta/recipes-core/picolibc/picolibc.inc
>     > new file mode 100644
>     > index 0000000000..3b380fe7af
>     > --- /dev/null
>     > +++ b/meta/recipes-core/picolibc/picolibc.inc
>     > @@ -0,0 +1,21 @@
>     > +SUMMARY =3D "C Libraries for Smaller Embedded Systems"
>     > +HOMEPAGE =3D "https://keithp.com/picolibc"
>     > +DESCRIPTION =3D "Picolibc is a set of standard C libraries, both
>     libc and libm, designed for smaller embedded systems with limited
>     ROM and RAM. Picolibc includes code from Newlib and AVR Libc."
>     > +SECTION =3D "libs"
>     > +
>     > +# Newlib based code but GPL related bits removed,
>     test/printf-tests.c and test/testcases.c
>     > +# are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not
>     part of the artifacts.
>     > +LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
>     > +LIC_FILES_CHKSUM =3D " \
>     > + file://COPYING.GPL2;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>     > + file://COPYING.NEWLIB;md5=3D08ae03456feb75b81cfdb359e0f1ef85 \
>     > + file://COPYING.picolibc;md5=3De50fa9458a40929689861ed472d46bc7 =
\
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     > +
>     > +BASEVER =3D "1.8.6"
>     > +PV =3D "${BASEVER}+git"
>     > +SRC_URI =3D
>     "git://github.com/picolibc/picolibc.git;protocol=3Dhttps;branch=3Dm=
ain
>     <http://github.com/picolibc/picolibc.git;protocol=3Dhttps;branch=3D=
main>"
>     > +SRCREV=3D"764ef4e401a8f4c6a86ab723533841f072885a5b"
>     > +
>     > +S =3D "${WORKDIR}/git"
>     > +B =3D "${WORKDIR}/build"
>     > diff --git
>     a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directo=
ries.patch
>     b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directo=
ries.patch
>     > new file mode 100644
>     > index 0000000000..da6460c95c
>     > --- /dev/null
>     > +++
>     b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directo=
ries.patch
>     > @@ -0,0 +1,119 @@
>     > +Upstream-Status: Pending
>     > +
>     > +Picolibc uses its own specs file: picolibc.specs to facilitate
>     compilation, this
>     > +needs to be passed down to GCC via the -specs argument.
>     > +
>     > +Using this specs file overrides some of the default options our
>     toolchain was
>     > +built with, in this case, they modify the include_dir and
>     lib_dir paths used for
>     > +compilation, their intention was to add support for
>     -picolibc-prefix and
>     > +-picolibc-buildtype arguments via the C preprocessor.
>     > +
>     > +-isystem %{-picolibc-prefix=3D*:%*/include/;
>     -picolibc-buildtype=3D*:/usr/include/%*; :/usr/include} %(picolibc_=
cpp)
>     > +
>     > +This had the unwanted effect of defaulting to /usr/include for
>     include_dir if
>     > +those arguments are not being passed, this works fine for their
>     flow but for us
>     > +it pollutes the include directories with paths from the host.
>     The same effect is
>     > +applicable for lib_dir and for the c runtime file.
>     > +
>     > +Our toolchain relies on --sysroot to avoid using any paths from
>     the host, here we
>     > +manually add support for a third possible argument: -sysroot ,
>     if this is passed
>     > +then the paths used by the compiler will be relative to the
>     path passed by the
>     > +--sysroot=3D cmdline argument, setting back the behavior that we
>     intended in the
>     > +first place.
>     > +
>     > +
>     > +Signed-off-by: Alejandro Enedino Hernandez Samaniego
>     <alejandro@enedino.org>
>     > +
>     > +Index: git/meson.build
>     > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     > +--- git.orig/meson.build
>     > ++++ git/meson.build
>     > +@@ -622,12 +622,13 @@ else
>     > + #
>     > + picolibc_prefix_format =3D '-picolibc-prefix=3D*:@0@'
>     > + picolibc_buildtype_format =3D '-picolibc-buildtype=3D*:@0@'
>     > ++sysroot_format =3D '-sysroot=3D*:@0@'
>     > + gen_format =3D '@0@'
>     > +
>     > + #
>     > + # How to glue the three options together
>     > + #
>     > +-specs_option_format =3D '%{@0@; @1@; :@2@}'
>     > ++specs_option_format =3D '%{@0@; @1@; @2@; :@3@}'
>     > +
>     > + #
>     > + # Build the -isystem value
>     > +@@ -639,10 +640,13 @@ isystem_prefix =3D picolibc_prefix_format.
>     > + buildtype_include_dir =3D
>     specs_prefix_format.format(get_option('includedir') / '%*')
>     > + isystem_buildtype =3D
>     picolibc_buildtype_format.format(buildtype_include_dir)
>     > +
>     > ++sysroot_include_dir =3D '%*'
>     > ++isystem_sysroot =3D sysroot_format.format(sysroot_include_dir)
>     > ++
>     > + gen_include_dir =3D
>     specs_prefix_format.format(get_option('includedir'))
>     > + isystem_gen =3D gen_format.format(gen_include_dir)
>     > +
>     > +-specs_isystem =3D '-isystem ' +
>     specs_option_format.format(isystem_prefix, isystem_buildtype,
>     isystem_gen)
>     > ++specs_isystem =3D '-isystem ' +
>     specs_option_format.format(isystem_prefix, isystem_buildtype,
>     isystem_sysroot, isystem_gen)
>     > +
>     > + #
>     > + # Build the non-multilib -L value
>     > +@@ -654,10 +658,13 @@ lib_prefix =3D picolibc_prefix_format.form
>     > + buildtype_lib_dir =3D
>     specs_prefix_format.format(get_option('libdir') / '%*')
>     > + lib_buildtype =3D
>     picolibc_buildtype_format.format(buildtype_lib_dir)
>     > +
>     > ++sysroot_lib_dir =3D '%*'
>     > ++lib_sysroot =3D sysroot_format.format(sysroot_lib_dir)
>     > ++
>     > + gen_lib_dir =3D specs_prefix_format.format(get_option('libdir')=
)
>     > + lib_gen =3D gen_format.format(gen_lib_dir)
>     > +
>     > +-specs_libpath =3D '-L' + specs_option_format.format(lib_prefix,
>     lib_buildtype, lib_gen)
>     > ++specs_libpath =3D '-L' + specs_option_format.format(lib_prefix,
>     lib_buildtype, lib_sysroot, lib_gen)
>     > +
>     > + #
>     > + # Build the non-multilib *startfile options
>     > +@@ -669,6 +676,9 @@ crt0_prefix =3D picolibc_prefix_format.for
>     > + buildtype_crt0_path =3D
>     specs_prefix_format.format(get_option('libdir') / '%*' / crt0_expr)
>     > + crt0_buildtype =3D
>     picolibc_buildtype_format.format(buildtype_crt0_path)
>     > +
>     > ++sysroot_crt0_path =3D '%*' + '/' + get_option('libdir') + '/' +
>     '%*' + '/' + crt0_expr
>     > ++crt0_sysroot =3D picolibc_buildtype_format.format(sysroot_crt0_=
path)
>     > ++
>     > + gen_crt0_path =3D
>     specs_prefix_format.format(get_option('libdir') / crt0_expr)
>     > + crt0_gen =3D gen_format.format(gen_crt0_path)
>     > +
>     > +@@ -686,10 +696,13 @@ if enable_multilib
>     > +=C2=A0 =C2=A0buildtype_multilib_dir =3D
>     specs_prefix_format.format(get_option('libdir') / '%*/%M')
>     > +=C2=A0 =C2=A0multilib_buildtype =3D
>     picolibc_buildtype_format.format(buildtype_multilib_dir)
>     > +
>     > ++=C2=A0 sysroot_multilib_dir =3D '%*' + '/' + get_option('libdir=
') +
>     '/' + '%*/%M'
>     > ++=C2=A0 multilib_sysroot =3D sysroot_format.format(sysroot_multi=
lib_dir)
>     > ++
>     > +=C2=A0 =C2=A0gen_multilib_dir =3D
>     specs_prefix_format.format(get_option('libdir') / '%M')
>     > +=C2=A0 =C2=A0multilib_gen =3D gen_format.format(gen_multilib_dir=
)
>     > +
>     > +-=C2=A0 specs_multilibpath =3D '-L' +
>     specs_option_format.format(multilib_prefix, multilib_buildtype,
>     multilib_gen)
>     > ++=C2=A0 specs_multilibpath =3D '-L' +
>     specs_option_format.format(multilib_prefix, multilib_buildtype,
>     multilib_sysroot, multilib_gen)
>     > +
>     > +=C2=A0 =C2=A0#
>     > +=C2=A0 =C2=A0# Prepend the multilib -L option to the non-multili=
b option
>     > +@@ -705,6 +718,9 @@ if enable_multilib
>     > +=C2=A0 =C2=A0buildtype_multilib_crt0_path =3D
>     specs_prefix_format.format(get_option('libdir') / '%*/%M' / crt0_ex=
pr)
>     > +=C2=A0 =C2=A0crt0_buildtype =3D
>     picolibc_buildtype_format.format(buildtype_multilib_crt0_path)
>     > +
>     > ++=C2=A0 sysroot_multilib_crt0_path =3D '%*' + prefix + '/' +
>     get_option('libdir') + '/' + '/%M' + '/' + crt0_expr
>     > ++=C2=A0 crt0_sysroot =3D sysroot_format.format(sysroot_multilib_=
crt0_path)
>     > ++
>     > +=C2=A0 =C2=A0gen_multilib_crt0_path =3D
>     specs_prefix_format.format(get_option('libdir') / '%M' / crt0_expr)
>     > +=C2=A0 =C2=A0crt0_gen =3D gen_format.format(gen_multilib_crt0_pa=
th)
>     > + endif
>     > +@@ -714,7 +730,7 @@ endif
>     > + # above. As there's only one value, it's either the
>     > + # multilib path or the non-multilib path
>     > + #
>     > +-specs_startfile =3D specs_option_format.format(crt0_prefix,
>     crt0_buildtype, crt0_gen)
>     > ++specs_startfile =3D specs_option_format.format(crt0_prefix,
>     crt0_buildtype, crt0_sysroot, crt0_gen)
>     > + endif
>     > +
>     > + specs_data =3D configuration_data()
>     > diff --git
>     a/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cros=
s
>     b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cros=
s
>     > new file mode 100644
>     > index 0000000000..87bfbad3c5
>     > --- /dev/null
>     > +++
>     b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cros=
s
>     > @@ -0,0 +1,6 @@
>     > +# We need to explicitly bypass mesons sanity check to avoid
>     early compiler errors
>     > +# otherwise meson will try to compile AND run test applications:
>     > +# ../git/meson.build:35:0: ERROR: Executables created by c
>     compiler are not runnable...
>     > +
>     > +[properties]
>     > +skip_sanity_check=3Dtrue
>     > \ No newline at end of file
>     > diff --git a/meta/recipes-core/picolibc/picolibc_git.bb
>     <http://picolibc_git.bb>
>     b/meta/recipes-core/picolibc/picolibc_git.bb <http://picolibc_git.b=
b>
>     > new file mode 100644
>     > index 0000000000..fdb159328f
>     > --- /dev/null
>     > +++ b/meta/recipes-core/picolibc/picolibc_git.bb
>     <http://picolibc_git.bb>
>     > @@ -0,0 +1,35 @@
>     > +require picolibc.inc
>     > +
>     > +INHIBIT_DEFAULT_DEPS =3D "1"
>     > +DEPENDS =3D "virtual/${TARGET_PREFIX}gcc"
>     > +
>     > +PROVIDES +=3D "virtual/libc virtual/libiconv virtual/libintl"
>     > +
>     > +COMPATIBLE_HOST:libc-musl:class-target =3D "null"
>     > +COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
>     > +COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv6=
4"
>     > +
>     > +SRC_URI:append =3D " file://avoid_polluting_cross_directories.pa=
tch"
>     > +SRC_URI:append =3D " file://no-early-compiler-checks.cross"
>     > +
>     > +# This is being added by picolibc meson files as well to avoid
>     > +# early compiler tests from failing, cant remember why I added i=
t
>     > +# to the newlib recipe but I would assume it was for the same
>     reason
>     > +TARGET_CC_ARCH:append =3D " -nostdlib"
>     > +
>     > +# When using RISCV64 use medany for both C library and
>     application recipes
>     > +TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
>     > +
>     > +inherit meson
>     > +
>     > +MESON_CROSS_FILE:append =3D "
>     --cross-file=3D${UNPACKDIR}/no-early-compiler-checks.cross"
>     > +
>     > +PACKAGECONFIG ??=3D " specsdir"
>     > +# Install GCC specs on libdir
>     > +PACKAGECONFIG[specsdir] =3D "-Dspecsdir=3D${libdir},-Dspecsdir=3D=
none"
>     > +
>     > +
>     > +FILES:${PN}-dev:append =3D " ${libdir}/*.specs ${libdir}/*.ld"
>     > +
>     > +# No rpm package is actually created but -dev depends on it,
>     avoid dnf error
>     > +DEV_PKG_DEPENDENCY:libc-picolibc =3D ""
>     > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
>     b/meta/recipes-devtools/gcc/gcc-cross.inc
>     > index 5b0ca15d47..c04177df5a 100644
>     > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>     > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>     > @@ -34,6 +34,7 @@ EXTRA_OECONF +=3D "\
>     >=C2=A0 EXTRA_OECONF:append:libc-baremetal =3D " --without-headers"
>     >=C2=A0 EXTRA_OECONF:remove:libc-baremetal =3D "--enable-threads=3D=
posix"
>     >=C2=A0 EXTRA_OECONF:remove:libc-newlib =3D "--enable-threads=3Dpos=
ix"
>     > +EXTRA_OECONF:remove:libc-picolibc =3D "--enable-threads=3Dposix"
>     >
>     >=C2=A0 EXTRA_OECONF_PATHS =3D "\
>     > --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BIN=
V} \
>     > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>     b/meta/recipes-devtools/gcc/gcc-runtime.inc
>     > index 89b0bebcfb..1fca00f5f0 100644
>     > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>     > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>     > @@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS =3D "\
>     >=C2=A0 EXTRA_OECONF:append:linuxstdbase =3D " --enable-clocale=3Dg=
nu"
>     >=C2=A0 EXTRA_OECONF:append =3D " --cache-file=3D${B}/config.cache"
>     >=C2=A0 EXTRA_OECONF:append:libc-newlib =3D " --with-newlib
>     --with-target-subdir"
>     > +EXTRA_OECONF:append:libc-picolibc =3D " --with-newlib
>     --with-target-subdir"
>     >=C2=A0 EXTRA_OECONF:append:libc-baremetal =3D " --with-target-subd=
ir"
>     >
>     >=C2=A0 # Disable ifuncs for libatomic on arm conflicts -march/-mcp=
u
>     > @@ -27,6 +28,7 @@ DISABLE_STATIC:class-nativesdk ?=3D ""
>     >
>     >=C2=A0 # Newlib does not support symbol versioning on libsdtcc++
>     >=C2=A0 SYMVERS_CONF:libc-newlib =3D ""
>     > +SYMVERS_CONF:libc-picolibc =3D ""
>     >
>     >=C2=A0 # Building with thumb enabled on armv6t fails
>     >=C2=A0 ARM_INSTRUCTION_SET:armv6 =3D "arm"
>     > @@ -47,6 +49,7 @@ RUNTIMETARGET =3D "${RUNTIMELIBSSP} libstdc++-v=
3
>     libgomp libatomic ${RUNTIMELIBITM
>     >=C2=A0 "
>     >=C2=A0 # Only build libstdc++ for newlib
>     >=C2=A0 RUNTIMETARGET:libc-newlib =3D "libstdc++-v3"
>     > +RUNTIMETARGET:libc-picolibc =3D "libstdc++-v3"
>     >
>     >=C2=A0 # libiberty
>     >=C2=A0 # libgfortran needs separate recipe due to libquadmath depe=
ndency
>     > diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc
>     b/meta/recipes-devtools/gcc/libgcc-common.inc
>     > index d9084af51a..e3db17d700 100644
>     > --- a/meta/recipes-devtools/gcc/libgcc-common.inc
>     > +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
>     > @@ -53,6 +53,11 @@ do_install:append:libc-newlib () {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdi=
r ${D}${base_libdir}
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>     >=C2=A0 }
>     > +do_install:append:libc-picolibc () {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${base_libdir}" !=3D "${libdir}=
" ]; then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D=
}${base_libdir}
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>     > +}
>     >
>     >=C2=A0 # No rpm package is actually created but -dev depends on it=
,
>     avoid dnf error
>     >=C2=A0 DEV_PKG_DEPENDENCY:libc-baremetal =3D ""
>     > --
>     > 2.45.2
>     >
>     >
>     >
>     >
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202683):https://lists.openembedded.org/g/openembedd=
ed-core/message/202683
> Mute This Topic:https://lists.openembedded.org/mt/106746173/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------RLDUp2VmdqrsS7q8YUIcDXLK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 629LH9th3709431

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-07-30 3:15 p.m., Alejandro
      Hernandez Samaniego via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAHMutrYycC+o624V-GhN7zA7Z0DEJL=
_gx=3DP8EK9frxM3CD=3D-qQ@mail.gmail.com">
     =20
      <div dir=3D"auto">Sure thing, I'm in the process of doing so&nbsp;<=
/div>
    </blockquote>
    <p>Alejandro,</p>
    <p>Are you still using picolibc ?<br>
      Do you want to update the version to 1.8.11:</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://keithp.com/pico=
libc/dist/">https://keithp.com/picolibc/dist/</a><br>
    </p>
    <p>picolibc.git on main is =F0=9F=93=A6 v1.8.11&nbsp;<br>
      =E2=9D=AF git log --oneline 1.8.6..1.8.11 | wc -l<br>
      1682<br>
      <br>
      =E2=9D=AF git diff 1.8.6..1.8.11 | diffstat | tail -1&nbsp;<br>
      &nbsp;4320 files changed, 465509 insertions(+), 422873 deletions(-)=
<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAHMutrYycC+o624V-GhN7zA7Z0DEJL=
_gx=3DP8EK9frxM3CD=3D-qQ@mail.gmail.com"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 30, 2024, 1:00=E2=
=80=AFPM
          Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">alex.kanavin@gm=
ail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Can
          you submit the pending avoid_polluting_cross_directories.patch<=
br>
          upstream please?<br>
          <br>
          Alex<br>
          <br>
          On Tue, 18 Jun 2024 at 20:09, Alejandro Hernandez Samaniego
          via<br>
          <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer nor=
eferrer" target=3D"_blank" moz-do-not-send=3D"true">lists.openembedded.or=
g</a>
          &lt;alejandro=3D<a href=3D"mailto:enedino.org@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"true" clas=
s=3D"moz-txt-link-freetext">enedino.org@lists.openembedded.org</a>&gt;<br=
>
          wrote:<br>
          &gt;<br>
          &gt; Enables usage of TCLIBC=3Dpicolibc extending OE
          functionality to build and use<br>
          &gt; picolibc based toolchains to build baremetal
          applications.<br>
          &gt;<br>
          &gt; Picolibc is a set of standard C libraries, both libc and
          libm, designed for<br>
          &gt; smaller embedded systems with limited ROM and RAM.
          Picolibc includes code<br>
          &gt; from Newlib and AVR Libc, but adresses some of newlibs
          concerns, it retains<br>
          &gt; newlibs directory structure, math, string and locale
          implementations, but<br>
          &gt; removed the GPL bits used to build the library, swiches
          old C style code for<br>
          &gt; C18 and replaces autotools with meson.<br>
          &gt;<br>
          &gt; This patch adds a picolibc recipe for the C library, a
          picolibc-helloworld<br>
          &gt; recipe that contains an example application and a
          testcase that builds it.<br>
          &gt;<br>
          &gt; Picolibc can be built for ARM and RISCV architectures,
          its been tested both<br>
          &gt; for 32 and 64 bits, the provided example recipe produces
          the following output:<br>
          &gt;<br>
          &gt; hello, world<br>
          &gt;<br>
          &gt; Runqemu does not automatically show any output since it
          hides QEMU stderr which<br>
          &gt; is where the QEMU monitors output is directed to when
          using semihosting, but,<br>
          &gt; manually running the same QEMU command does work
          properly.<br>
          &gt;<br>
          &gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<=
a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferr=
er" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">alejandro@en=
edino.org</a>&gt;<br>
          &gt; ---<br>
          &gt;&nbsp; meta/classes-recipe/baremetal-image.bbclass&nbsp; &n=
bsp;|&nbsp; &nbsp;4 +-<br>
          &gt;&nbsp; meta/classes-recipe/cross-canadian.bbclass&nbsp; &nb=
sp; |&nbsp; &nbsp;2 +-<br>
          &gt;&nbsp; meta/conf/distro/include/maintainers.inc&nbsp; &nbsp=
; &nbsp; |&nbsp; &nbsp;2 +<br>
          &gt;&nbsp; meta/conf/distro/include/tclibc-picolibc.inc&nbsp; |=
&nbsp; 40
          ++++++<br>
          &gt;&nbsp; meta/conf/documentation.conf&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;2 +-<br>
          &gt;&nbsp; .../conf/machine/include/riscv/arch-riscv.inc |&nbsp=
; &nbsp;1 +<br>
          &gt;&nbsp; meta/lib/oeqa/selftest/cases/distrodata.py&nbsp; &nb=
sp; |&nbsp; &nbsp;2 +-<br>
          &gt;&nbsp; meta/lib/oeqa/selftest/cases/picolibc.py&nbsp; &nbsp=
; &nbsp; |&nbsp; 18 +++<br>
          &gt;&nbsp; .../picolibc/<a href=3D"http://picolibc-helloworld_g=
it.bb" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">picolibc-helloworld_git.bb</a>&nbsp; &nbsp; &nbsp;
          &nbsp;|&nbsp; 40 ++++++<br>
          &gt;&nbsp; meta/recipes-core/picolibc/picolibc.inc&nbsp; &nbsp;=
 &nbsp; &nbsp;|&nbsp; 21 ++++<br>
          &gt;&nbsp; .../avoid_polluting_cross_directories.patch&nbsp; &n=
bsp;| 119
          ++++++++++++++++++<br>
          &gt;&nbsp; .../picolibc/no-early-compiler-checks.cross&nbsp; &n=
bsp;|&nbsp; &nbsp;6 +<br>
          &gt;&nbsp; meta/recipes-core/picolibc/<a href=3D"http://picolib=
c_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">picolibc_git.bb</a>&nbsp;
          &nbsp; |&nbsp; 35 ++++++<br>
          &gt;&nbsp; meta/recipes-devtools/gcc/gcc-cross.inc&nbsp; &nbsp;=
 &nbsp; &nbsp;|&nbsp; &nbsp;1 +<br>
          &gt;&nbsp; meta/recipes-devtools/gcc/gcc-runtime.inc&nbsp; &nbs=
p; &nbsp;|&nbsp; &nbsp;3 +<br>
          &gt;&nbsp; meta/recipes-devtools/gcc/libgcc-common.inc&nbsp; &n=
bsp;|&nbsp; &nbsp;5 +<br>
          &gt;&nbsp; 16 files changed, 296 insertions(+), 5 deletions(-)<=
br>
          &gt;&nbsp; create mode 100644
          meta/conf/distro/include/tclibc-picolibc.inc<br>
          &gt;&nbsp; create mode 100644
          meta/lib/oeqa/selftest/cases/picolibc.py<br>
          &gt;&nbsp; create mode 100644 meta/recipes-core/picolibc/<a hre=
f=3D"http://picolibc-helloworld_git.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank" moz-do-not-send=3D"true">picolibc-helloworld_git.bb</a><br=
>
          &gt;&nbsp; create mode 100644
          meta/recipes-core/picolibc/picolibc.inc<br>
          &gt;&nbsp; create mode 100644
meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.pat=
ch<br>
          &gt;&nbsp; create mode 100644
          meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cr=
oss<br>
          &gt;&nbsp; create mode 100644 meta/recipes-core/picolibc/<a hre=
f=3D"http://picolibc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true">picolibc_git.bb</a><br>
          &gt;<br>
          &gt; diff --git a/meta/classes-recipe/baremetal-image.bbclass
          b/meta/classes-recipe/baremetal-image.bbclass<br>
          &gt; index 4e7d413626..27f2d2d10a 100644<br>
          &gt; --- a/meta/classes-recipe/baremetal-image.bbclass<br>
          &gt; +++ b/meta/classes-recipe/baremetal-image.bbclass<br>
          &gt; @@ -16,8 +16,8 @@<br>
          &gt;&nbsp; # See meta-skeleton for a working example.<br>
          &gt;<br>
          &gt;<br>
          &gt; -# Toolchain should be baremetal or newlib based.<br>
          &gt; -# TCLIBC=3D&quot;baremetal&quot; or TCLIBC=3D&quot;newlib=
&quot;<br>
          &gt; +# Toolchain should be baremetal or newlib/picolibc
          based.<br>
          &gt; +# TCLIBC=3D&quot;baremetal&quot; or TCLIBC=3D&quot;newlib=
&quot; or
          TCLIBC=3D&quot;picolibc&quot;<br>
          &gt;&nbsp; COMPATIBLE_HOST:libc-musl:class-target =3D &quot;nul=
l&quot;<br>
          &gt;&nbsp; COMPATIBLE_HOST:libc-glibc:class-target =3D &quot;nu=
ll&quot;<br>
          &gt;<br>
          &gt; diff --git a/meta/classes-recipe/cross-canadian.bbclass
          b/meta/classes-recipe/cross-canadian.bbclass<br>
          &gt; index 1670217d69..059d9aa95f 100644<br>
          &gt; --- a/meta/classes-recipe/cross-canadian.bbclass<br>
          &gt; +++ b/meta/classes-recipe/cross-canadian.bbclass<br>
          &gt; @@ -36,7 +36,7 @@ python () {<br>
          &gt;&nbsp; &nbsp; &nbsp; if d.getVar(&quot;MODIFYTOS&quot;) !=3D=
 &quot;1&quot;:<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return<br>
          &gt;<br>
          &gt; -&nbsp; &nbsp; if d.getVar(&quot;TCLIBC&quot;) in [ 'barem=
etal', 'newlib' ]:<br>
          &gt; +&nbsp; &nbsp; if d.getVar(&quot;TCLIBC&quot;) in [ 'barem=
etal', 'newlib',
          'picolibc' ]:<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return<br>
          &gt;<br>
          &gt;&nbsp; &nbsp; &nbsp; tos =3D d.getVar(&quot;TARGET_OS&quot;=
)<br>
          &gt; diff --git a/meta/conf/distro/include/maintainers.inc
          b/meta/conf/distro/include/maintainers.inc<br>
          &gt; index 42599267c1..ff24597723 100644<br>
          &gt; --- a/meta/conf/distro/include/maintainers.inc<br>
          &gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
          &gt; @@ -578,6 +578,8 @@ RECIPE_MAINTAINER:pn-pcmanfm =3D
          &quot;Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"true" clas=
s=3D"moz-txt-link-freetext">alex.kanavin@gmail.com</a>&gt;&quot;<br>
          &gt;&nbsp; RECIPE_MAINTAINER:pn-perf =3D &quot;Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"n=
oreferrer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">bruce=
.ashfield@gmail.com</a>&gt;&quot;<br>
          &gt;&nbsp; RECIPE_MAINTAINER:pn-perl =3D &quot;Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"=
noreferrer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">alex=
.kanavin@gmail.com</a>&gt;&quot;<br>
          &gt;&nbsp; RECIPE_MAINTAINER:pn-perlcross =3D &quot;Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" re=
l=3D"noreferrer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext"=
>alex.kanavin@gmail.com</a>&gt;&quot;<br>
          &gt; +RECIPE_MAINTAINER:pn-picolibc =3D &quot;Alejandro Hernand=
ez
          &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" =
rel=3D"noreferrer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">alejandro@enedino.org</a>&gt;&quot;<br>
          &gt; +RECIPE_MAINTAINER:pn-picolibc-helloworld =3D &quot;Alejan=
dro
          Hernandez &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D=
"_blank" rel=3D"noreferrer" moz-do-not-send=3D"true" class=3D"moz-txt-lin=
k-freetext">alejandro@enedino.org</a>&gt;&quot;<br>
          &gt;&nbsp; RECIPE_MAINTAINER:pn-piglit =3D &quot;Ross Burton &l=
t;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank" rel=3D"norefer=
rer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">ross.burton=
@arm.com</a>&gt;&quot;<br>
          &gt;&nbsp; RECIPE_MAINTAINER:pn-pigz =3D &quot;Hongxu Jia &lt;<=
a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank" rel=3D"noref=
errer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">hongxu.ji=
a@windriver.com</a>&gt;&quot;<br>
          &gt;&nbsp; RECIPE_MAINTAINER:pn-pinentry =3D &quot;Unassigned &=
lt;<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank" rel=3D=
"noreferrer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">una=
ssigned@yoctoproject.org</a>&gt;&quot;<br>
          &gt; diff --git a/meta/conf/distro/include/tclibc-picolibc.inc
          b/meta/conf/distro/include/tclibc-picolibc.inc<br>
          &gt; new file mode 100644<br>
          &gt; index 0000000000..203765dfcb<br>
          &gt; --- /dev/null<br>
          &gt; +++ b/meta/conf/distro/include/tclibc-picolibc.inc<br>
          &gt; @@ -0,0 +1,40 @@<br>
          &gt; +#<br>
          &gt; +# Picolibc configuration<br>
          &gt; +#<br>
          &gt; +<br>
          &gt; +LIBCEXTENSION =3D &quot;-picolibc&quot;<br>
          &gt; +LIBCOVERRIDE =3D &quot;:libc-picolibc&quot;<br>
          &gt; +<br>
          &gt; +PREFERRED_PROVIDER_virtual/libc ?=3D &quot;picolibc&quot;=
<br>
          &gt; +PREFERRED_PROVIDER_virtual/libiconv ?=3D &quot;picolibc&q=
uot;<br>
          &gt; +PREFERRED_PROVIDER_virtual/libintl ?=3D &quot;picolibc&qu=
ot;<br>
          &gt; +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D
          &quot;nativesdk-glibc&quot;<br>
          &gt; +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D
          &quot;nativesdk-glibc&quot;<br>
          &gt; +<br>
          &gt; +DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;ldconfig&q=
uot;<br>
          &gt; +<br>
          &gt; +IMAGE_LINGUAS =3D &quot;&quot;<br>
          &gt; +<br>
          &gt; +LIBC_DEPENDENCIES =3D &quot; \<br>
          &gt; +&nbsp; &nbsp; picolibc-dbg \<br>
          &gt; +&nbsp; &nbsp; picolibc-dev \<br>
          &gt; +&nbsp; &nbsp; libgcc-dev \<br>
          &gt; +&nbsp; &nbsp; libgcc-dbg \<br>
          &gt; +&nbsp; &nbsp; libstdc++-dev&nbsp; \<br>
          &gt; +&nbsp; &nbsp; libstdc++-staticdev \<br>
          &gt; +&quot;<br>
          &gt; +<br>
          &gt; +ASSUME_PROVIDED +=3D &quot;virtual/crypt&quot;<br>
          &gt; +<br>
          &gt; +TARGET_OS =3D &quot;elf&quot;<br>
          &gt; +TARGET_OS:arm =3D &quot;eabi&quot;<br>
          &gt; +<br>
          &gt; +TOOLCHAIN_HOST_TASK ?=3D
          &quot;packagegroup-cross-canadian-${MACHINE} nativesdk-qemu
          nativesdk-sdk-provides-dummy&quot;<br>
          &gt; +TOOLCHAIN_TARGET_TASK ?=3D &quot;${LIBC_DEPENDENCIES}&quo=
t;<br>
          &gt; +TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D &quot;zlib ncu=
rses&quot;<br>
          &gt; +<br>
          &gt; +# RISCV linker doesnt support PIE<br>
          &gt; +SECURITY_CFLAGS:libc-picolibc:qemuriscv32 =3D
          &quot;${SECURITY_NOPIE_CFLAGS}&quot;<br>
          &gt; +SECURITY_CFLAGS:libc-picolibc:qemuriscv64 =3D
          &quot;${SECURITY_NOPIE_CFLAGS}&quot;<br>
          &gt; +<br>
          &gt; +<br>
          &gt; diff --git a/meta/conf/documentation.conf
          b/meta/conf/documentation.conf<br>
          &gt; index b0591881ba..ad89142934 100644<br>
          &gt; --- a/meta/conf/documentation.conf<br>
          &gt; +++ b/meta/conf/documentation.conf<br>
          &gt; @@ -421,7 +421,7 @@ TARGET_FPU[doc] =3D &quot;Specifies th=
e
          method for handling FPU code. For FPU-less targ<br>
          &gt;&nbsp; TARGET_OS[doc] =3D &quot;Specifies the target's oper=
ating
          system.&quot;<br>
          &gt;&nbsp; TARGET_PREFIX[doc] =3D &quot;The prefix for the cros=
s-compile
          toolchain (e.g. arm-linux-).&quot;<br>
          &gt;&nbsp; TARGET_SYS[doc] =3D &quot;The target system is compr=
ised of
          TARGET_ARCH,TARGET_VENDOR and TARGET_OS.&quot;<br>
          &gt; -TCLIBC[doc] =3D &quot;Specifies C library (libc) variant =
to use
          during the build process. You can select 'baremetal', 'glibc',
          'musl' or 'newlib'.&quot;<br>
          &gt; +TCLIBC[doc] =3D &quot;Specifies C library (libc) variant =
to use
          during the build process. You can select 'baremetal', 'glibc',
          'musl', 'newlib', or 'picolibc'.&quot;<br>
          &gt;&nbsp; TCMODE[doc] =3D &quot;Enables an external toolchain =
(where
          provided by an additional layer) if set to a value other than
          'default'.&quot;<br>
          &gt;&nbsp; TESTIMAGE_AUTO[doc] =3D &quot;Enables test booting o=
f virtual
          machine images under the QEMU emulator after any root
          filesystems are created and runs tests against those images
          each time an image is built.&quot;<br>
          &gt;&nbsp; TEST_QEMUBOOT_TIMEOUT[doc] =3D &quot;The time in sec=
onds
          allowed for an image to boot before automated runtime tests
          begin to run against an image.&quot;<br>
          &gt; diff --git
          a/meta/conf/machine/include/riscv/arch-riscv.inc
          b/meta/conf/machine/include/riscv/arch-riscv.inc<br>
          &gt; index 230a266563..b34064e78f 100644<br>
          &gt; --- a/meta/conf/machine/include/riscv/arch-riscv.inc<br>
          &gt; +++ b/meta/conf/machine/include/riscv/arch-riscv.inc<br>
          &gt; @@ -11,5 +11,6 @@ TUNE_CCARGS:append =3D
          &quot;${@bb.utils.contains('TUNE_FEATURES', 'riscv64nc', ' -mar=
c<br>
          &gt;<br>
          &gt;&nbsp; # Fix: ld: unrecognized option '--hash-style=3Dsysv'=
<br>
          &gt;&nbsp; LINKER_HASH_STYLE:libc-newlib =3D &quot;&quot;<br>
          &gt; +LINKER_HASH_STYLE:libc-picolibc =3D &quot;&quot;<br>
          &gt;&nbsp; # Fix: ld: unrecognized option '--hash-style=3Dgnu'<=
br>
          &gt;&nbsp; LINKER_HASH_STYLE:libc-baremetal =3D &quot;&quot;<br=
>
          &gt; diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py
          b/meta/lib/oeqa/selftest/cases/distrodata.py<br>
          &gt; index ad952c004b..043953757f 100644<br>
          &gt; --- a/meta/lib/oeqa/selftest/cases/distrodata.py<br>
          &gt; +++ b/meta/lib/oeqa/selftest/cases/distrodata.py<br>
          &gt; @@ -55,7 +55,7 @@ but their recipes claim otherwise by
          setting UPSTREAM_VERSION_UNKNOWN. Please re<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return Fal=
se<br>
          &gt;<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; def is_maintainer_except=
ion(entry):<br>
          &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; exceptions =3D =
[&quot;musl&quot;, &quot;newlib&quot;,
          &quot;linux-yocto&quot;, &quot;linux-dummy&quot;, &quot;mesa-gl=
&quot;, &quot;libgfortran&quot;,
          &quot;libx11-compose-data&quot;,<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; exceptions =3D =
[&quot;musl&quot;, &quot;newlib&quot;, &quot;picolibc&quot;,
          &quot;linux-yocto&quot;, &quot;linux-dummy&quot;, &quot;mesa-gl=
&quot;, &quot;libgfortran&quot;,
          &quot;libx11-compose-data&quot;,<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;cve-update-nvd2-native&quot;=
,]<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for i in e=
xceptions:<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;if i in entry:<br>
          &gt; diff --git a/meta/lib/oeqa/selftest/cases/picolibc.py
          b/meta/lib/oeqa/selftest/cases/picolibc.py<br>
          &gt; new file mode 100644<br>
          &gt; index 0000000000..e40b4fc3d3<br>
          &gt; --- /dev/null<br>
          &gt; +++ b/meta/lib/oeqa/selftest/cases/picolibc.py<br>
          &gt; @@ -0,0 +1,18 @@<br>
          &gt; +#<br>
          &gt; +# Copyright OpenEmbedded Contributors<br>
          &gt; +#<br>
          &gt; +# SPDX-License-Identifier: MIT<br>
          &gt; +#<br>
          &gt; +<br>
          &gt; +from oeqa.selftest.case import OESelftestTestCase<br>
          &gt; +from oeqa.utils.commands import bitbake, get_bb_var<br>
          &gt; +<br>
          &gt; +class PicolibcTest(OESelftestTestCase):<br>
          &gt; +<br>
          &gt; +&nbsp; &nbsp; def test_picolibc(self):<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; compatible_machines =3D ['qem=
uarm', 'qemuarm64',
          'qemuriscv32', 'qemuriscv64']<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; machine =3D get_bb_var('MACHI=
NE')<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; if machine not in compatible_=
machines:<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self.skipTest('=
This test only works with
          machines : %s' % ' '.join(compatible_machines))<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; self.write_config('TCLIBC =3D=
 &quot;picolibc&quot;')<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; bitbake(&quot;picolibc-hellow=
orld&quot;)<br>
          &gt; diff --git a/meta/recipes-core/picolibc/<a href=3D"http://=
picolibc-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">picolibc-helloworld_git.bb</a>
          b/meta/recipes-core/picolibc/<a href=3D"http://picolibc-hellowo=
rld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true">picolibc-helloworld_git.bb</a><br>
          &gt; new file mode 100644<br>
          &gt; index 0000000000..573a571c24<br>
          &gt; --- /dev/null<br>
          &gt; +++ b/meta/recipes-core/picolibc/<a href=3D"http://picolib=
c-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-=
do-not-send=3D"true">picolibc-helloworld_git.bb</a><br>
          &gt; @@ -0,0 +1,40 @@<br>
          &gt; +require picolibc.inc<br>
          &gt; +<br>
          &gt; +# baremetal-image overrides<br>
          &gt; +BAREMETAL_BINNAME ?=3D &quot;hello_picolibc_${MACHINE}&qu=
ot;<br>
          &gt; +IMAGE_LINK_NAME ?=3D &quot;baremetal-picolibc-image-${MAC=
HINE}&quot;<br>
          &gt; +IMAGE_NAME_SUFFIX ?=3D &quot;&quot;<br>
          &gt; +QB_DEFAULT_KERNEL ?=3D &quot;${IMAGE_LINK_NAME}.elf&quot;=
<br>
          &gt; +<br>
          &gt; +inherit baremetal-image<br>
          &gt; +<br>
          &gt; +COMPATIBLE_MACHINE =3D
          &quot;qemuarm|qemuarm64|qemuriscv32|qemuriscv64&quot;<br>
          &gt; +<br>
          &gt; +# Use semihosting to test via QEMU<br>
          &gt; +QB_OPT_APPEND:append =3D &quot; -semihosting-config enabl=
e=3Don&quot;<br>
          &gt; +<br>
          &gt; +# picolibc comes with a set of linker scripts, set the
          file<br>
          &gt; +# according to the architecture being built.<br>
          &gt; +PICOLIBC_LINKERSCRIPT:qemuarm64 =3D &quot;aarch64.ld&quot=
;<br>
          &gt; +PICOLIBC_LINKERSCRIPT:qemuarm =3D &quot;arm.ld&quot;<br>
          &gt; +PICOLIBC_LINKERSCRIPT:qemuriscv32 =3D &quot;riscv.ld&quot=
;<br>
          &gt; +PICOLIBC_LINKERSCRIPT:qemuriscv64 =3D &quot;riscv.ld&quot=
;<br>
          &gt; +<br>
          &gt; +# Simple compile function that manually exemplifies
          usage; as noted,<br>
          &gt; +# use a custom linker script, the GCC specs provided by
          picolibc<br>
          &gt; +# and semihost to be able to test via QEMU's monitor<br>
          &gt; +do_compile(){<br>
          &gt; +&nbsp; &nbsp; ${CC} ${CFLAGS} ${LDFLAGS} --verbose
          -T${S}/hello-world/${PICOLIBC_LINKERSCRIPT}
          -specs=3Dpicolibc.specs --oslib=3Dsemihost -o
          ${BAREMETAL_BINNAME}.elf ${S}/hello-world/hello-world.c<br>
          &gt; +&nbsp; &nbsp; ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.e=
lf
          ${BAREMETAL_BINNAME}.bin<br>
          &gt; +}<br>
          &gt; +<br>
          &gt; +do_install(){<br>
          &gt; +&nbsp; &nbsp; install -d ${D}/${base_libdir}/firmware<br>
          &gt; +&nbsp; &nbsp; install -m 755 ${B}/${BAREMETAL_BINNAME}.el=
f
          ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf<br>
          &gt; +&nbsp; &nbsp; install -m 755 ${B}/${BAREMETAL_BINNAME}.bi=
n
          ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin<br>
          &gt; +}<br>
          &gt; +<br>
          &gt; +FILES:${PN} +=3D &quot; \<br>
          &gt; +&nbsp; &nbsp; ${base_libdir}/firmware/${BAREMETAL_BINNAME=
}.elf \<br>
          &gt; +&nbsp; &nbsp; ${base_libdir}/firmware/${BAREMETAL_BINNAME=
}.bin \<br>
          &gt; +&quot;<br>
          &gt; diff --git a/meta/recipes-core/picolibc/picolibc.inc
          b/meta/recipes-core/picolibc/picolibc.inc<br>
          &gt; new file mode 100644<br>
          &gt; index 0000000000..3b380fe7af<br>
          &gt; --- /dev/null<br>
          &gt; +++ b/meta/recipes-core/picolibc/picolibc.inc<br>
          &gt; @@ -0,0 +1,21 @@<br>
          &gt; +SUMMARY =3D &quot;C Libraries for Smaller Embedded System=
s&quot;<br>
          &gt; +HOMEPAGE =3D &quot;<a href=3D"https://keithp.com/picolibc=
" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
" class=3D"moz-txt-link-freetext">https://keithp.com/picolibc</a>&quot;<b=
r>
          &gt; +DESCRIPTION =3D &quot;Picolibc is a set of standard C
          libraries, both libc and libm, designed for smaller embedded
          systems with limited ROM and RAM. Picolibc includes code from
          Newlib and AVR Libc.&quot;<br>
          &gt; +SECTION =3D &quot;libs&quot;<br>
          &gt; +<br>
          &gt; +# Newlib based code but GPL related bits removed,
          test/printf-tests.c and test/testcases.c<br>
          &gt; +# are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3
          but not part of the artifacts.<br>
          &gt; +LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;<b=
r>
          &gt; +LIC_FILES_CHKSUM =3D &quot; \<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://COPYING=
.GPL2;md5=3D59530bdf33659b29e73d4adb9f9f6552">file://COPYING.GPL2;md5=3D5=
9530bdf33659b29e73d4adb9f9f6552</a> \<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://COPYING=
.NEWLIB;md5=3D08ae03456feb75b81cfdb359e0f1ef85">file://COPYING.NEWLIB;md5=
=3D08ae03456feb75b81cfdb359e0f1ef85</a> \<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://COPYING=
.picolibc;md5=3De50fa9458a40929689861ed472d46bc7">file://COPYING.picolibc=
;md5=3De50fa9458a40929689861ed472d46bc7</a>
          \<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&q=
uot;<br>
          &gt; +<br>
          &gt; +BASEVER =3D &quot;1.8.6&quot;<br>
          &gt; +PV =3D &quot;${BASEVER}+git&quot;<br>
          &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/pico=
libc/picolibc.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer noref=
errer" target=3D"_blank" moz-do-not-send=3D"true">github.com/picolibc/pic=
olibc.git;protocol=3Dhttps;branch=3Dmain</a>&quot;<br>
          &gt; +SRCREV=3D&quot;764ef4e401a8f4c6a86ab723533841f072885a5b&q=
uot;<br>
          &gt; +<br>
          &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
          &gt; +B =3D &quot;${WORKDIR}/build&quot;<br>
          &gt; diff --git
a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.p=
atch
b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.p=
atch<br>
          &gt; new file mode 100644<br>
          &gt; index 0000000000..da6460c95c<br>
          &gt; --- /dev/null<br>
          &gt; +++
b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.p=
atch<br>
          &gt; @@ -0,0 +1,119 @@<br>
          &gt; +Upstream-Status: Pending<br>
          &gt; +<br>
          &gt; +Picolibc uses its own specs file: picolibc.specs to
          facilitate compilation, this<br>
          &gt; +needs to be passed down to GCC via the -specs argument.<b=
r>
          &gt; +<br>
          &gt; +Using this specs file overrides some of the default
          options our toolchain was<br>
          &gt; +built with, in this case, they modify the include_dir
          and lib_dir paths used for<br>
          &gt; +compilation, their intention was to add support for
          -picolibc-prefix and<br>
          &gt; +-picolibc-buildtype arguments via the C preprocessor.<br>
          &gt; +<br>
          &gt; +-isystem %{-picolibc-prefix=3D*:%*/include/;
          -picolibc-buildtype=3D*:/usr/include/%*; :/usr/include}
          %(picolibc_cpp)<br>
          &gt; +<br>
          &gt; +This had the unwanted effect of defaulting to
          /usr/include for include_dir if<br>
          &gt; +those arguments are not being passed, this works fine
          for their flow but for us<br>
          &gt; +it pollutes the include directories with paths from the
          host. The same effect is<br>
          &gt; +applicable for lib_dir and for the c runtime file.<br>
          &gt; +<br>
          &gt; +Our toolchain relies on --sysroot to avoid using any
          paths from the host, here we<br>
          &gt; +manually add support for a third possible argument:
          -sysroot , if this is passed<br>
          &gt; +then the paths used by the compiler will be relative to
          the path passed by the<br>
          &gt; +--sysroot=3D cmdline argument, setting back the behavior
          that we intended in the<br>
          &gt; +first place.<br>
          &gt; +<br>
          &gt; +<br>
          &gt; +Signed-off-by: Alejandro Enedino Hernandez Samaniego
          &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" =
rel=3D"noreferrer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">alejandro@enedino.org</a>&gt;<br>
          &gt; +<br>
          &gt; +Index: git/meson.build<br>
          &gt;
          +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          &gt; +--- git.orig/meson.build<br>
          &gt; ++++ git/meson.build<br>
          &gt; +@@ -622,12 +622,13 @@ else<br>
          &gt; + #<br>
          &gt; + picolibc_prefix_format =3D '-picolibc-prefix=3D*:@0@'<br=
>
          &gt; + picolibc_buildtype_format =3D '-picolibc-buildtype=3D*:@=
0@'<br>
          &gt; ++sysroot_format =3D '-sysroot=3D*:@0@'<br>
          &gt; + gen_format =3D '@0@'<br>
          &gt; +<br>
          &gt; + #<br>
          &gt; + # How to glue the three options together<br>
          &gt; + #<br>
          &gt; +-specs_option_format =3D '%{@0@; @1@; :@2@}'<br>
          &gt; ++specs_option_format =3D '%{@0@; @1@; @2@; :@3@}'<br>
          &gt; +<br>
          &gt; + #<br>
          &gt; + # Build the -isystem value<br>
          &gt; +@@ -639,10 +640,13 @@ isystem_prefix =3D
          picolibc_prefix_format.<br>
          &gt; + buildtype_include_dir =3D
          specs_prefix_format.format(get_option('includedir') / '%*')<br>
          &gt; + isystem_buildtype =3D
          picolibc_buildtype_format.format(buildtype_include_dir)<br>
          &gt; +<br>
          &gt; ++sysroot_include_dir =3D '%*'<br>
          &gt; ++isystem_sysroot =3D
          sysroot_format.format(sysroot_include_dir)<br>
          &gt; ++<br>
          &gt; + gen_include_dir =3D
          specs_prefix_format.format(get_option('includedir'))<br>
          &gt; + isystem_gen =3D gen_format.format(gen_include_dir)<br>
          &gt; +<br>
          &gt; +-specs_isystem =3D '-isystem ' +
          specs_option_format.format(isystem_prefix, isystem_buildtype,
          isystem_gen)<br>
          &gt; ++specs_isystem =3D '-isystem ' +
          specs_option_format.format(isystem_prefix, isystem_buildtype,
          isystem_sysroot, isystem_gen)<br>
          &gt; +<br>
          &gt; + #<br>
          &gt; + # Build the non-multilib -L value<br>
          &gt; +@@ -654,10 +658,13 @@ lib_prefix =3D
          picolibc_prefix_format.form<br>
          &gt; + buildtype_lib_dir =3D
          specs_prefix_format.format(get_option('libdir') / '%*')<br>
          &gt; + lib_buildtype =3D
          picolibc_buildtype_format.format(buildtype_lib_dir)<br>
          &gt; +<br>
          &gt; ++sysroot_lib_dir =3D '%*'<br>
          &gt; ++lib_sysroot =3D sysroot_format.format(sysroot_lib_dir)<b=
r>
          &gt; ++<br>
          &gt; + gen_lib_dir =3D
          specs_prefix_format.format(get_option('libdir'))<br>
          &gt; + lib_gen =3D gen_format.format(gen_lib_dir)<br>
          &gt; +<br>
          &gt; +-specs_libpath =3D '-L' +
          specs_option_format.format(lib_prefix, lib_buildtype, lib_gen)<=
br>
          &gt; ++specs_libpath =3D '-L' +
          specs_option_format.format(lib_prefix, lib_buildtype,
          lib_sysroot, lib_gen)<br>
          &gt; +<br>
          &gt; + #<br>
          &gt; + # Build the non-multilib *startfile options<br>
          &gt; +@@ -669,6 +676,9 @@ crt0_prefix =3D
          picolibc_prefix_format.for<br>
          &gt; + buildtype_crt0_path =3D
          specs_prefix_format.format(get_option('libdir') / '%*' /
          crt0_expr)<br>
          &gt; + crt0_buildtype =3D
          picolibc_buildtype_format.format(buildtype_crt0_path)<br>
          &gt; +<br>
          &gt; ++sysroot_crt0_path =3D '%*' + '/' + get_option('libdir') =
+
          '/' + '%*' + '/' + crt0_expr<br>
          &gt; ++crt0_sysroot =3D
          picolibc_buildtype_format.format(sysroot_crt0_path)<br>
          &gt; ++<br>
          &gt; + gen_crt0_path =3D
          specs_prefix_format.format(get_option('libdir') / crt0_expr)<br=
>
          &gt; + crt0_gen =3D gen_format.format(gen_crt0_path)<br>
          &gt; +<br>
          &gt; +@@ -686,10 +696,13 @@ if enable_multilib<br>
          &gt; +&nbsp; &nbsp;buildtype_multilib_dir =3D
          specs_prefix_format.format(get_option('libdir') / '%*/%M')<br>
          &gt; +&nbsp; &nbsp;multilib_buildtype =3D
          picolibc_buildtype_format.format(buildtype_multilib_dir)<br>
          &gt; +<br>
          &gt; ++&nbsp; sysroot_multilib_dir =3D '%*' + '/' +
          get_option('libdir') + '/' + '%*/%M'<br>
          &gt; ++&nbsp; multilib_sysroot =3D
          sysroot_format.format(sysroot_multilib_dir)<br>
          &gt; ++<br>
          &gt; +&nbsp; &nbsp;gen_multilib_dir =3D
          specs_prefix_format.format(get_option('libdir') / '%M')<br>
          &gt; +&nbsp; &nbsp;multilib_gen =3D gen_format.format(gen_multi=
lib_dir)<br>
          &gt; +<br>
          &gt; +-&nbsp; specs_multilibpath =3D '-L' +
          specs_option_format.format(multilib_prefix,
          multilib_buildtype, multilib_gen)<br>
          &gt; ++&nbsp; specs_multilibpath =3D '-L' +
          specs_option_format.format(multilib_prefix,
          multilib_buildtype, multilib_sysroot, multilib_gen)<br>
          &gt; +<br>
          &gt; +&nbsp; &nbsp;#<br>
          &gt; +&nbsp; &nbsp;# Prepend the multilib -L option to the non-=
multilib
          option<br>
          &gt; +@@ -705,6 +718,9 @@ if enable_multilib<br>
          &gt; +&nbsp; &nbsp;buildtype_multilib_crt0_path =3D
          specs_prefix_format.format(get_option('libdir') / '%*/%M' /
          crt0_expr)<br>
          &gt; +&nbsp; &nbsp;crt0_buildtype =3D
          picolibc_buildtype_format.format(buildtype_multilib_crt0_path)<=
br>
          &gt; +<br>
          &gt; ++&nbsp; sysroot_multilib_crt0_path =3D '%*' + prefix + '/=
' +
          get_option('libdir') + '/' + '/%M' + '/' + crt0_expr<br>
          &gt; ++&nbsp; crt0_sysroot =3D
          sysroot_format.format(sysroot_multilib_crt0_path)<br>
          &gt; ++<br>
          &gt; +&nbsp; &nbsp;gen_multilib_crt0_path =3D
          specs_prefix_format.format(get_option('libdir') / '%M' /
          crt0_expr)<br>
          &gt; +&nbsp; &nbsp;crt0_gen =3D gen_format.format(gen_multilib_=
crt0_path)<br>
          &gt; + endif<br>
          &gt; +@@ -714,7 +730,7 @@ endif<br>
          &gt; + # above. As there's only one value, it's either the<br>
          &gt; + # multilib path or the non-multilib path<br>
          &gt; + #<br>
          &gt; +-specs_startfile =3D
          specs_option_format.format(crt0_prefix, crt0_buildtype,
          crt0_gen)<br>
          &gt; ++specs_startfile =3D
          specs_option_format.format(crt0_prefix, crt0_buildtype,
          crt0_sysroot, crt0_gen)<br>
          &gt; + endif<br>
          &gt; +<br>
          &gt; + specs_data =3D configuration_data()<br>
          &gt; diff --git
          a/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.=
cross
b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross<br>
          &gt; new file mode 100644<br>
          &gt; index 0000000000..87bfbad3c5<br>
          &gt; --- /dev/null<br>
          &gt; +++
          b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.=
cross<br>
          &gt; @@ -0,0 +1,6 @@<br>
          &gt; +# We need to explicitly bypass mesons sanity check to
          avoid early compiler errors<br>
          &gt; +# otherwise meson will try to compile AND run test
          applications:<br>
          &gt; +# ../git/meson.build:35:0: ERROR: Executables created by
          c compiler are not runnable...<br>
          &gt; +<br>
          &gt; +[properties]<br>
          &gt; +skip_sanity_check=3Dtrue<br>
          &gt; \ No newline at end of file<br>
          &gt; diff --git a/meta/recipes-core/picolibc/<a href=3D"http://=
picolibc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true">picolibc_git.bb</a>
          b/meta/recipes-core/picolibc/<a href=3D"http://picolibc_git.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>picolibc_git.bb</a><br>
          &gt; new file mode 100644<br>
          &gt; index 0000000000..fdb159328f<br>
          &gt; --- /dev/null<br>
          &gt; +++ b/meta/recipes-core/picolibc/<a href=3D"http://picolib=
c_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">picolibc_git.bb</a><br>
          &gt; @@ -0,0 +1,35 @@<br>
          &gt; +require picolibc.inc<br>
          &gt; +<br>
          &gt; +INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
          &gt; +DEPENDS =3D &quot;virtual/${TARGET_PREFIX}gcc&quot;<br>
          &gt; +<br>
          &gt; +PROVIDES +=3D &quot;virtual/libc virtual/libiconv
          virtual/libintl&quot;<br>
          &gt; +<br>
          &gt; +COMPATIBLE_HOST:libc-musl:class-target =3D &quot;null&quo=
t;<br>
          &gt; +COMPATIBLE_HOST:libc-glibc:class-target =3D &quot;null&qu=
ot;<br>
          &gt; +COMPATIBLE_MACHINE =3D
          &quot;qemuarm|qemuarm64|qemuriscv32|qemuriscv64&quot;<br>
          &gt; +<br>
          &gt; +SRC_URI:append =3D <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"file://avoid_polluting_cross_directories.patch">&quot;
          file://avoid_polluting_cross_directories.patch&quot;</a><br>
          &gt; +SRC_URI:append =3D <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"file://no-early-compiler-checks.cross">&quot;
          file://no-early-compiler-checks.cross&quot;</a><br>
          &gt; +<br>
          &gt; +# This is being added by picolibc meson files as well to
          avoid<br>
          &gt; +# early compiler tests from failing, cant remember why I
          added it<br>
          &gt; +# to the newlib recipe but I would assume it was for the
          same reason<br>
          &gt; +TARGET_CC_ARCH:append =3D &quot; -nostdlib&quot;<br>
          &gt; +<br>
          &gt; +# When using RISCV64 use medany for both C library and
          application recipes<br>
          &gt; +TARGET_CFLAGS:append:qemuriscv64 =3D &quot; -mcmodel=3Dme=
dany&quot;<br>
          &gt; +<br>
          &gt; +inherit meson<br>
          &gt; +<br>
          &gt; +MESON_CROSS_<a class=3D"moz-txt-link-freetext" href=3D"FI=
LE:append">FILE:append</a> =3D &quot;
          --cross-file=3D${UNPACKDIR}/no-early-compiler-checks.cross&quot=
;<br>
          &gt; +<br>
          &gt; +PACKAGECONFIG ??=3D &quot; specsdir&quot;<br>
          &gt; +# Install GCC specs on libdir<br>
          &gt; +PACKAGECONFIG[specsdir] =3D
          &quot;-Dspecsdir=3D${libdir},-Dspecsdir=3Dnone&quot;<br>
          &gt; +<br>
          &gt; +<br>
          &gt; +FILES:${PN}-dev:append =3D &quot; ${libdir}/*.specs
          ${libdir}/*.ld&quot;<br>
          &gt; +<br>
          &gt; +# No rpm package is actually created but -dev depends on
          it, avoid dnf error<br>
          &gt; +DEV_PKG_DEPENDENCY:libc-picolibc =3D &quot;&quot;<br>
          &gt; diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
          b/meta/recipes-devtools/gcc/gcc-cross.inc<br>
          &gt; index 5b0ca15d47..c04177df5a 100644<br>
          &gt; --- a/meta/recipes-devtools/gcc/gcc-cross.inc<br>
          &gt; +++ b/meta/recipes-devtools/gcc/gcc-cross.inc<br>
          &gt; @@ -34,6 +34,7 @@ EXTRA_OECONF +=3D &quot;\<br>
          &gt;&nbsp; EXTRA_OECONF:append:libc-baremetal =3D &quot;
          --without-headers&quot;<br>
          &gt;&nbsp; EXTRA_OECONF:remove:libc-baremetal =3D
          &quot;--enable-threads=3Dposix&quot;<br>
          &gt;&nbsp; EXTRA_OECONF:remove:libc-newlib =3D
          &quot;--enable-threads=3Dposix&quot;<br>
          &gt; +EXTRA_OECONF:remove:libc-picolibc =3D
          &quot;--enable-threads=3Dposix&quot;<br>
          &gt;<br>
          &gt;&nbsp; EXTRA_OECONF_PATHS =3D &quot;\<br>
          &gt;&nbsp; &nbsp; &nbsp;
          --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${B=
INV}
          \<br>
          &gt; diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
          b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
          &gt; index 89b0bebcfb..1fca00f5f0 100644<br>
          &gt; --- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
          &gt; +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
          &gt; @@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS =3D &quot;\<br>
          &gt;&nbsp; EXTRA_OECONF:append:linuxstdbase =3D &quot;
          --enable-clocale=3Dgnu&quot;<br>
          &gt;&nbsp; EXTRA_OECONF:append =3D &quot; --cache-file=3D${B}/c=
onfig.cache&quot;<br>
          &gt;&nbsp; EXTRA_OECONF:append:libc-newlib =3D &quot; --with-ne=
wlib
          --with-target-subdir&quot;<br>
          &gt; +EXTRA_OECONF:append:libc-picolibc =3D &quot; --with-newli=
b
          --with-target-subdir&quot;<br>
          &gt;&nbsp; EXTRA_OECONF:append:libc-baremetal =3D &quot;
          --with-target-subdir&quot;<br>
          &gt;<br>
          &gt;&nbsp; # Disable ifuncs for libatomic on arm conflicts
          -march/-mcpu<br>
          &gt; @@ -27,6 +28,7 @@ DISABLE_STATIC:class-nativesdk ?=3D &quo=
t;&quot;<br>
          &gt;<br>
          &gt;&nbsp; # Newlib does not support symbol versioning on
          libsdtcc++<br>
          &gt;&nbsp; SYMVERS_CONF:libc-newlib =3D &quot;&quot;<br>
          &gt; +SYMVERS_CONF:libc-picolibc =3D &quot;&quot;<br>
          &gt;<br>
          &gt;&nbsp; # Building with thumb enabled on armv6t fails<br>
          &gt;&nbsp; ARM_INSTRUCTION_SET:armv6 =3D &quot;arm&quot;<br>
          &gt; @@ -47,6 +49,7 @@ RUNTIMETARGET =3D &quot;${RUNTIMELIBSSP}
          libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM<br>
          &gt;&nbsp; &quot;<br>
          &gt;&nbsp; # Only build libstdc++ for newlib<br>
          &gt;&nbsp; RUNTIMETARGET:libc-newlib =3D &quot;libstdc++-v3&quo=
t;<br>
          &gt; +RUNTIMETARGET:libc-picolibc =3D &quot;libstdc++-v3&quot;<=
br>
          &gt;<br>
          &gt;&nbsp; # libiberty<br>
          &gt;&nbsp; # libgfortran needs separate recipe due to libquadma=
th
          dependency<br>
          &gt; diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc
          b/meta/recipes-devtools/gcc/libgcc-common.inc<br>
          &gt; index d9084af51a..e3db17d700 100644<br>
          &gt; --- a/meta/recipes-devtools/gcc/libgcc-common.inc<br>
          &gt; +++ b/meta/recipes-devtools/gcc/libgcc-common.inc<br>
          &gt; @@ -53,6 +53,11 @@ do_install:append:libc-newlib () {<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;rmdir ${D}${base_libdir}<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
          &gt;&nbsp; }<br>
          &gt; +do_install:append:libc-picolibc () {<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp;if [ &quot;${base_libdir}&quot=
; !=3D &quot;${libdir}&quot; ]; then<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm=
dir ${D}${base_libdir}<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp;fi<br>
          &gt; +}<br>
          &gt;<br>
          &gt;&nbsp; # No rpm package is actually created but -dev depend=
s on
          it, avoid dnf error<br>
          &gt;&nbsp; DEV_PKG_DEPENDENCY:libc-baremetal =3D &quot;&quot;<b=
r>
          &gt; --<br>
          &gt; 2.45.2<br>
          &gt;<br>
          &gt;<br>
          &gt; <br>
          &gt;<br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#202683): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/202683">https:/=
/lists.openembedded.org/g/openembedded-core/message/202683</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/106746173/3616765">https://lists.openembedded.org/mt=
/106746173/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------RLDUp2VmdqrsS7q8YUIcDXLK--

