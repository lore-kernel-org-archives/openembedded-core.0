Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E68C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 03:24:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8147.1738207461091143008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 19:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41258a84a5=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U3OKeS029399;
	Thu, 30 Jan 2025 03:24:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny72ady-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 03:24:19 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50U3OJDO029393;
	Thu, 30 Jan 2025 03:24:19 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny72adx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 03:24:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3ccBqbkf2Adr7RSS984o1IY0rBijBjxNIOV9x73AKXETc8vNTiAeBFRokp6CreTLXMDI7zXH1xVG/pDS+FJT++PrT+a5gl9pv0SshfW6+v9Vih559zZYWBuexrqj3MV4O6yf/vGPIEQ697Dds4G0RNUBQNmmkQ3ALgL/AkdnJYBDhu5JeiRv4FqKg8KrGRGQaKampQBhNg/2c7+e2lwdMBIydCZpmtzkXFszoZ7A+CyT3fjms8QWHNptheQmgW5cWfVfyeT5SamLutY9NAi1EG6kZoMmOaZsq1dXeZu7pJuCnm67p1wqbTIA9a2qhORJ/mq7DN4JjvL68UDyMSFGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pL8zONB5tA7rPAVtI74KlkyXaQDexG0VzowVa08iCQQ=;
 b=x+w4g9vV9xp6tnow54YjU80stmG4JOHtUBunxwvVuNXRTeNOoFC0trT2bJMeUKSFIhIQtnz+tWzpjJSKG4JgB127uej7pqTBZus82+NzlzhpuZznwAm7HsvTJk7ToxBENECJe+qtmEfgPEbDYysYuLd1AyRqYqTwiAUm6GZ0Cg9gRyEk8cb4SrtOAdFO0vAezzx1YK01cSnkavMyJGJtty9mwHOI7TO6F8DyamCbgqn3xCSZJiEnVuLkTNiVE/MvbxaASJTqVXD0IfqqYqpwVZqvbrRXnZiR90K02xeZI5RwrgLkgEEBHpghcP1iXAqVlEkEsEHzuMHe2IbVPkLwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 03:24:17 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%5]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 03:24:16 +0000
Content-Type: multipart/alternative;
 boundary="------------Hlr89zDlyya3GE3EJrWU6Abh"
Message-ID: <d153ffef-33eb-4c68-a2e5-6c4c7320fd9d@windriver.com>
Date: Thu, 30 Jan 2025 08:54:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: rustdoc reproducibility issue fix
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com,
        naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com,
        yash.shinde@windriver.com, deepthi.hemraj@windriver.com,
        harish.sadineni@windriver.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240726133559.1124668-1-sundeep.kokkonda@windriver.com>
 <CANNYZj9V8K5upKxUdA8U4OXsdvt_+TTen=MogiVjJfqkV7jOOw@mail.gmail.com>
 <74363653-308f-4465-8bf5-4f8aab01379e@windriver.com>
 <CANNYZj-egdbGeyLRRQKT2+ewmfNWC6SxJKy-yDDGQtaUZYp4tw@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj-egdbGeyLRRQKT2+ewmfNWC6SxJKy-yDDGQtaUZYp4tw@mail.gmail.com>
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|LV3PR11MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 2898a237-ec75-48e0-2938-08dd40dd9393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|8096899003|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dUNKOHdJdzBYQVd1WGdNclM5WktodUpwd1lGczNSNE9YZVJ6cWhxblpJNlFS?=
 =?utf-8?B?OGgwc2pDSGJTaEhodDBRdWFKRzBZWUdwZ0dTa2JOL0J6SWFCdXhJcTBvOXlt?=
 =?utf-8?B?MklMS0dXdkVlVkZzb3VGQ3J5UUlpL2ROak94QW5nUlhxaWJKVXN3VWJyeExq?=
 =?utf-8?B?L1lFY1JCMGMzdzczQ2JvdkZpelp2RVJZRGtIMVMwRVhKcldWUWdwYmFyMHRy?=
 =?utf-8?B?YnlLS29zb2prL2pwQ1ZwcW5XanVRTVMveTFCcHZVT3Z1b2ZNOGZIWkxCQzN4?=
 =?utf-8?B?SEpLZERzWC9naVI1L1ZNMXIvQjgwcnhQUFFObkNITktna2pXT09qM3c1ME1h?=
 =?utf-8?B?RG80SXJhbGdkeWpCV2ZvTGF2T0dncGtXSVpvSTd3VHFqUzZ1NVZ2dGVIUTdJ?=
 =?utf-8?B?M2JsMjdHK1E3YXZ3SU51Vy9sVVFjTGpSSVo2dmxHS2MyTUxvSlQrTEhrT092?=
 =?utf-8?B?ZEdSVjNVd3JCekxaNUdJSXdIWEswdzJBTkV3aUN2alBURFRzaHd0SWM3QW5Y?=
 =?utf-8?B?NmZTdHJxU2x0cFlwWFpBdjF0WmhqSVFQT3ViQUNCc0JScW4vMGMxQnA0TytL?=
 =?utf-8?B?dkoxaGE5U3kwZ1ozOFlmQURYWUZ3amdOWU8zL3ptZ2hnRlkxY0dVNnRJT2dE?=
 =?utf-8?B?YzEzbVZGMlFTSXJtZWljZWFGT2h2d2lVWjA4NEt6QllESE5pKzJyNHk1MjRH?=
 =?utf-8?B?bGQvTjJmelJ3RzJkQ0x3bHVsbVBQRCtPdXRRUExwWldmUHdzQ25qY2pkWFcv?=
 =?utf-8?B?Z0U3SmJIZCswUjkyUzU1bFhaSTFIMnFHTHBkM3VGSlIyOU14cVlSdHpPRnA0?=
 =?utf-8?B?OURoN0NDWCtlVG94Q01NMDhPT2l0V1lZa0FIV0NQOFdUbWlFaXN0eHRNOVhW?=
 =?utf-8?B?NmNUcWg4enlQTWFUendxaDdPdTZvN1Z2U1dQNWlEdW1LN0V0N3Yzd3NLNEh3?=
 =?utf-8?B?Wkl3MklqdWQ0NE5sZ3IxUUFGTXdNME9tdndBTm52YzR3ZWpGZnNEc0JqNENk?=
 =?utf-8?B?K0kwMERXd0k5bEkyRFo5UTA4OWlkTWM5QStQbjZjNFdkN2hTZlFyUU1BeWhT?=
 =?utf-8?B?c2VtQzlzZnpDL0o5eTFvNlV3Mjd1bDBuL012TnhWSzdhMDVGYThZbXBMZ051?=
 =?utf-8?B?dFV3Uldzek5qbzkxVk5VdWlkT2tsZThnVGswSE9sUCt3SFdhajFpWVFzMzBB?=
 =?utf-8?B?RnhSV0lKeWVQekdDSDZKRWF0REdOSTkwem0vWmFwWFVSa3V1alplUSszWHNZ?=
 =?utf-8?B?T2kwQVlwLzYxcWFOc0pKUGhaWVVOSjN3c3dZRDBrQjl1Sk5BdThaT2dWNVNL?=
 =?utf-8?B?THpJWTlUa1E1cThpY1pNb1ZLZ24vclA4Vk9IM2x2eTBwU1IzYWx3Q2R4WFJq?=
 =?utf-8?B?VXk1TWt0SzQrdjU0RURiT2xVM3Bza2g4aVdWdThQa3JiNlIvL3NYZUk1QVpn?=
 =?utf-8?B?RWxwU2lReCtEc1pyUFJpemhJQzd3SVczc0c1Z3lZcWhMNW1IdElQOExCRENj?=
 =?utf-8?B?YkxCUjY4dEZNRlNvdXlpSUZLZGQ3ZjNrTkxsa1BuNEpibzFaU2V5MzJZNjNz?=
 =?utf-8?B?WHJvQXFjbjJqOERXUkFzbjZOaGR1RjVmM2Z2MTM4c2hBOTFtTEQ3WGlTY2V1?=
 =?utf-8?B?MEdoL2FHcnFnTlFsTE40ZEtJTEZYdWhtWkNYK0MvVitaNnFLemZ1SnNBWmFG?=
 =?utf-8?B?dWlQMlNBYlVMMEYxZEkvcWg1dm1nNnpwTGhJYmZmeEcrajY2alhSQXhMZk5t?=
 =?utf-8?B?RVlaRHVlOUMyYWZxelAzamlLNXJDemdrdEpKWGtMdzJMNDM4Qk1TZ1Y1SEZk?=
 =?utf-8?B?UFMwTUlRcVdKeDVvZ0dDdGNuNnF1U0ZIdEh1S0FFbkFpWFZLM0o2RTFXMlNj?=
 =?utf-8?B?bUV4TmV3T3paUUJtQmhlVXVnQ3VMVG1MSUs5SUc0aE1uc09ZUDUxbzZ3UkNQ?=
 =?utf-8?Q?aomsJv9sszrD8vnNhtmNi+XiZu4T/IQ+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(8096899003)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVZpL3o5eWx3dElpeXVaZ3dLWHJqZU5rNldLSTRydXRmRTZDTHI2a2FWZEdm?=
 =?utf-8?B?L24wcUM2aWVrcEZUVDVURE1UT2lvRUQzeVNKeHFjc0N0azljbmo3cFlSZHNl?=
 =?utf-8?B?dWVjOHR4ajhyOHpaOFk3cCtoNk9iT2ZEaS96ZExqVXFZcVpsdCtsaFBydW03?=
 =?utf-8?B?SVZWTXZkRXo5Nmc1MTZFOEJ6NFVvcWtaQklqV21yZlRJSVc4QUh3NkdpMWJK?=
 =?utf-8?B?U29KTytkZEp2enBPdVo1eVFaTUFZS2ZEVHR0S003Z2RzdnlPUmREWDV6dUgr?=
 =?utf-8?B?TGxDcWt5cEc5a0JhejhjRjJEaDNCSnVWQXg0clpwUmNXYkRBZVdUcG9pZ1Vv?=
 =?utf-8?B?OWF0OFQyOWc5RlJnbHVPWE9RZEkwWkZnby9MZHNjZnp2bkhKMFMrcWU0bGEy?=
 =?utf-8?B?YWVWeFg0NE5OTm1UR3V0QUxXODZwd09UMFhkcFZkSXAvcnVhaWdTT3ZEejls?=
 =?utf-8?B?bnRvU2JhcDNoblFyZG5TYVdOU2w3UWdxVzk5dTR6aVNhQ2ZWR2NvUDliS3VZ?=
 =?utf-8?B?Y283Z2k4Z1ROdXFkOG9wR0JhVWR6T1JjQXprRGM1aXhWb09SUHZvZGswSTdk?=
 =?utf-8?B?d2NlamR5WXRLcWlKdjBhQTJHSnRQbGQ1OHZURXRuVHVvRW5xM1BIQkRkQ2da?=
 =?utf-8?B?SW5rUExjSHU4akVobThENGRWQnpnU0FNeEN0cFRTZXU4NXpkKzdTblZFa3pZ?=
 =?utf-8?B?bG1OeEJHKzlqUm9HL2Npd2RDWHlPUVN3MVZKa21HSmNBVXJmSlovdHN4TmtS?=
 =?utf-8?B?S29TTTdpSjh3YXBxeUp3RTRWQURVZGxDOGN5QzMxSCt3U0ZXM1V6Z3pJM0Zy?=
 =?utf-8?B?aUw1WFB2MFdpZnJIUWswaSt1dTl2dCt2OW1wVVdkSTIzYktLS3NiZUVIMUEx?=
 =?utf-8?B?TlRpdDFKWjl3RUVkMHl5bTExbHhpRVpzQXgydFpEbExnSTUzMkxWNEQvNFJk?=
 =?utf-8?B?UzViSDJQVktFTkVCSGRjN01xblhwRmxNMWlnUy9QUU9sb1NwOGFGYTFFdHJY?=
 =?utf-8?B?bllNTzlkTWJGdURwZTBHVGVGY2hVeldOak5NN0RBbGxsWXBJL2t1b2FDT1dU?=
 =?utf-8?B?SUtuTU1YNmZ5RnZReG1zODk5dCtpMkNjZ2RXSytxcUdvajhkSnoyempOMzZQ?=
 =?utf-8?B?SmpHZlJNaUU4clRzY2o3SXF4eVJ3a2pBck5XS1NqMzNzdFhobkJxSnh4R1NB?=
 =?utf-8?B?Q2dick1oYkFPUkJJa3RNYUtyUWk1c2o2a1VOVm9CelFuVWFhUVBYOGlvUTdv?=
 =?utf-8?B?L0RDQmUxaHI0WnFMRlREMlVtV2dSQm56a0tCZFRkV1VmRXdnV012cGY4MGll?=
 =?utf-8?B?MjhqZTRBRS9DYnlyZkluRFJDajdrWkVsTlNKZ0NQM1pFS3V1R0NNVjFuZDh2?=
 =?utf-8?B?WWlqdzNHK0hTUGNtK2lNODJBQ2xJS0NDbWFGWER5OWlLMlpTVE54Snd2Tk04?=
 =?utf-8?B?NzczdUlpUDJwVkdJMjJFL0tGOWhsdEUyOEtsM2p3S2FqUjJJZzI3b05SRnRq?=
 =?utf-8?B?OVZOTGlPVkp2UmsyZ21zblhhVld6eXV3a1g1eHVGdk1HdXAyV2k3b2FxNElX?=
 =?utf-8?B?Y3ZmZW1ISnZ0UkRDOHpIaVdZZ0NsSU1kUlJwN1VDcUd2QmdHNkcrVHpkMUJL?=
 =?utf-8?B?MEd2RjNyV1NVeVpEWWZuK2FVSW9HanI0Z1oyZ3JJNjlOV2NzSXAwN2lBOXNh?=
 =?utf-8?B?NXdaZWNWYWEvYlUwWVRQTGl0bnBKUkF1ZzJmUXRhUG5vS0VHVjFQcWUweXND?=
 =?utf-8?B?UmVNd3NwSm9wZTQ2MG5jamJ2KzlLTUh6c3ZadWFFQ3JOY3ZSMnIyZzNJV293?=
 =?utf-8?B?Z1ZTVGVSOHdHOE9wNTVBc0lONHpyZnloSUVMVUtRVTVmY1NEUDNmTXVHTXZO?=
 =?utf-8?B?YThFaXZ5c0F2Z0NwTDZxMkNNd2s5bktyeldKUHhHZklGVkdQWXd3UHZPYk1U?=
 =?utf-8?B?MDhGWmFGb0dNRUpZbUJUVzNWT1Q0K29DYk5MN1F1ajdxdG53dlVMSmFJVE9v?=
 =?utf-8?B?S0l5ejdzZkVIY1dtYml5V2VaRm82R29Ia2lKWitMTEtNVlo3QVE3aXViTlVR?=
 =?utf-8?B?TEczcUtoM00rWjg3V0U2NEphaGk1bmZCZmZtMXFWczljZGNFdWdUWkRFOUNj?=
 =?utf-8?B?NXhuelJvWkVmaDB4MHVqbVFYcDN5SU9jaExDQkY4SW9reVFKc2tKTnIrazdq?=
 =?utf-8?Q?LlLGJ6PhB8T7OjI4CQQz11Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2898a237-ec75-48e0-2938-08dd40dd9393
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 03:24:16.6003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blsZ5pnlfh2mebpLB4+VE3NdYnR0X3G5nr7rTJpRm0iLUO5tA/x/Cy1xM0f7WuV/j0OMe9wesQ1gPhnW1hYfvZkprKKW0aFDH5o2dYackWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
X-Proofpoint-GUID: Dxvb4drTuO3CUqZ2nlVBCOEENglvSySg
X-Authority-Analysis: v=2.4 cv=fYZXy1QF c=1 sm=1 tr=0 ts=679af0e4 cx=c_pps a=uuboLt+qr3MZZMeqEnD08g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=5oIsdJQdR389XQ8fUY0A:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=7UDmj__pyXQAnCfx:21 a=_W_S_7VecoQA:10
X-Proofpoint-ORIG-GUID: rmAHj7eQA5QxGuGWk31uVxN7E4P19WJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_01,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501300023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 03:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210434

--------------Hlr89zDlyya3GE3EJrWU6Abh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 29-Jan-25 11:02, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>> I just ran some benchmarks to see how much disabling parallel
>> codegen-units affects build times (the parallelism is only at the
>> crate level after this change), and unfortunately the increase has
>> been significant.
>>
>> As of current master, rust 1.81.0:
>>
>> rust-native 527 seconds -> 853 seconds
>> rust 1123 seconds -> 1688 seconds
>>
>> I presume the codegen-units parallel issue can be fixed properly by
>> adding a sort somewhere for determinism, but finding that spot is
>> probably very challenging. We do need to get to it though.
>>
>> Can you please point to the request/effort to set up reproducibility
>> tests upstream?
>>
>> Sure Alex, I will look into it the ways to optimize it. As I remember, when the 'codegen-units' count is increased it is causing rustdoc binaries are not reproducible.
>>
>> I've to re-test it with some higher values of 'codegen-units' on latest rust sources. I'll test that.
> You can simply drop the patch and then rust will pick a default value
> of 16 for it. On 1.81.0 that still makes rustdoc unreproducible, I
> just checked that.

Thanks for confirmation Alex.

We already have an open issue for the reproducibility issue with rust 
community and there the /rustdoc /issue with 'codegen_units' also mentioned.

https://github.com/rust-lang/rust/issues/134589#issue-2753629767


We will work with upstream to find the proper fix for this issue.


Thanks,

Sundeep K.

>
> Alex
--------------Hlr89zDlyya3GE3EJrWU6Abh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 29-Jan-25 11:02, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-egdbGeyLRRQKT2+ewmfNWC6SxJKy-yDDGQtaUZYp4tw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I just ran some benchmarks to see how much disabling parallel
codegen-units affects build times (the parallelism is only at the
crate level after this change), and unfortunately the increase has
been significant.

As of current master, rust 1.81.0:

rust-native 527 seconds -&gt; 853 seconds
rust 1123 seconds -&gt; 1688 seconds

I presume the codegen-units parallel issue can be fixed properly by
adding a sort somewhere for determinism, but finding that spot is
probably very challenging. We do need to get to it though.

Can you please point to the request/effort to set up reproducibility
tests upstream?

Sure Alex, I will look into it the ways to optimize it. As I remember, when the 'codegen-units' count is increased it is causing rustdoc binaries are not reproducible.

I've to re-test it with some higher values of 'codegen-units' on latest rust sources. I'll test that.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You can simply drop the patch and then rust will pick a default value
of 16 for it. On 1.81.0 that still makes rustdoc unreproducible, I
just checked that.</pre>
    </blockquote>
    <p>Thanks for confirmation Alex.</p>
    <p>We already have an open issue for the reproducibility issue with
      rust community and there the <i>rustdoc </i>issue with
      'codegen_units' also mentioned.</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/134589#issue-2753629767">https://github.com/rust-lang/rust/issues/134589#issue-2753629767</a></p>
    <p><br>
    </p>
    <p>We will work with upstream to find the proper fix for this issue.<br>
    </p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Sundeep K.<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj-egdbGeyLRRQKT2+ewmfNWC6SxJKy-yDDGQtaUZYp4tw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------Hlr89zDlyya3GE3EJrWU6Abh--

