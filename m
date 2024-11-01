Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB99AE6B24B
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 12:03:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35904.1730462608222643175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 05:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1035258c17=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A18fYbF016494
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Nov 2024 12:03:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42mf2e8vq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 12:03:27 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A1C3Q6s019030;
	Fri, 1 Nov 2024 12:03:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42mf2e8vpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 12:03:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDA1ZWcid45KvZjkc3eiuU1U5MUB+BF/LaFbpXpdjbpUFVbDEw+eh6JyTK9fy3C6qDwx7a08LHI7LfGOidXfiCyfzco3uHZeRlmFWu3Yi9mxWTyDCnOz1/quKeTISfl0eoyyW2dWAhwUX7egqGvy676yD0SVO/12qVdBrPDc9ViTWeXs+qYFk/wRUMkyK/f13iRGiYvp1QE5GwhYXpKfG1wk0LkfUxQcG+AlOYY0djvyp0NJY65EJQ5yXFOM1T2QwCtm/7UrHiuMq/Xo2PWpUIUGB0Enhb/n4qCNI1tBzMM7pC1toWBYF5Q73kvq43cxBMADqRPg9it04hDR6Om+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjPybE+jCjk5sdnsK3Fy9r8qe7dIGSJU0zF6UQFultE=;
 b=wWamBmthNxHqG8/ODTScm5rmNze4x/E9RfZmEWlutjWMxp8pTFYBVuQsl3vyO+Qi8TQrAukLoNUAxtxo+z3KZAcPRPZjyH+2sTIZU6M1/wNDFpHoF13JOcRb8hCBZhNrRql7kaQEsz3rdfn6H9bo+IEqlDi/xmsnnTzk870W7CnlhK4SNQKVu3nn5n+HZaoWTmzhOl0C2qVkkkyr1fvcIVPV2iAnxuC1l6nevS9mFP1iY3IebShmUAxLA83wy8G8ksjrc9zzdYF5JYfNcGtKvgCzG2rRs2FpiVbLILqeHzPFmXCOXpQeVZDVbf5qgrstlJLN45KzrTaHwcWfJeJq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 12:03:03 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 12:03:03 +0000
Message-ID: <90a525c3-91ec-4428-88d8-6fcab0e5147d@windriver.com>
Date: Fri, 1 Nov 2024 20:02:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] archiver.bbclass: Fix archiver interaction with
 kernel recipes
To: Phil Reid <preid@electromag.com.au>,
        openembedded-core@lists.openembedded.org
References: <20241010052529.18502-1-preid@electromag.com.au>
 <26e580e6dadced007020601689e3d7a4f2790e45.camel@linuxfoundation.org>
 <f05b8b5d-0bda-4e16-a925-9e74eeb03c8d@electromag.com.au>
 <533a239d067329826080a0390ce87d811798101c.camel@linuxfoundation.org>
Content-Language: en-US
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <533a239d067329826080a0390ce87d811798101c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:404:e2::20) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 5280e039-00ba-42ec-6d00-08dcfa6d2397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TjRaNm9wS0g1VUhiZkcyOVhLS0VOSjlsa0t2WW5vblU4c0dXSzlNaTNvdDM2?=
 =?utf-8?B?SEFDYzBNSTg5WnlnVDM4YXN3cEwwRFZ6cXd1ZkRFT2ZUdXU0OWJoVkREaTdk?=
 =?utf-8?B?TFhtS1ZqTkRiZHlZU2JOTDEvdW1POXo4bjE5UDN6QUtsUmQrWW5ZcmFIWG9l?=
 =?utf-8?B?YlhseU81RGhDSkdUMFEzVys1S2pETkorazBib3B1NjhkNUo3TFZpOEZVUW13?=
 =?utf-8?B?YUppbkI0OU1qdDBnbkQ5U1JiaWtuT1JuQmJ2Nk1BTFFvWlEzTnp0dXdjdUkr?=
 =?utf-8?B?MWJhejVoQU5MM1FuczBUZzBwTGV5VjRFbDY0L0VJOFFrRERzKzN3OW1kSkhV?=
 =?utf-8?B?eXFNRXZuSGN5S0trSVUzc21lMTNWR3NDVmg5b3ErSW8weFNQZUM4bWJPN0hO?=
 =?utf-8?B?RG5XWXVIVkcxZGtKOHU4VFdrNHFaWHd2alJucHZIQmpFWE5NUnA0WVp4RHdG?=
 =?utf-8?B?NmFkQ3lzaUMyMUlWbVhmMk1wOTFBSTNxRGJNY0lpaHFteGlHMGVGajJnWHdY?=
 =?utf-8?B?eERMWE5RWWxrZzc4MFkwOHkzcHpGQmRZeCtxVy9jYmZKZDBJZjlKRnhVeUVN?=
 =?utf-8?B?V1B1RGE1RDVTU01QUkhvdmZNakJScWxzakxHbUg5V0o4eEVXTVByTDhycnhp?=
 =?utf-8?B?ZFNBVVNEa3RlUkgrQ3pEMm1OUHRnZTJaN2NPTVFEc0lEclVibFgrUXhJRVU0?=
 =?utf-8?B?U2ZqVUt3SjVPSFpzV1lVenEwZGxjTEV4WWdSM29IVWJLRzhSUGcrZGNCY1JZ?=
 =?utf-8?B?ejNQaHhEL0ZwaUFIblpDSllnQ3pvWmdsdGlpZ09kanFvd1FpaXZWZVA3NzVV?=
 =?utf-8?B?bjlyd2tpL1AwTURjc0VkYi9YWlVmK1JMUzZtdEU4WnE3Nk1WUkZ4OTFTMy9h?=
 =?utf-8?B?K1VqNTY4U2l3NVhZNDN2dC9lOGRabllKaGZuZ1ltS25jcHYySmhCQzRMLzE5?=
 =?utf-8?B?bWV0VXFmSEYrL05BL3lOeFBXcWJTY1RCeWdLQ2FnNGRiVEZzTk11UHQ3cCtz?=
 =?utf-8?B?ZlU5NWtqczd2U1I4U01tcjdDWXRienowV1JhM2FjZ3NvL3VzRDA1bCtzUTVa?=
 =?utf-8?B?UDQ0K3FEWGZpYURqaU5qNCs1ZWR4bWpRYk4vZk1TODQ4N082RGZ4YnlYY1Nk?=
 =?utf-8?B?RDBLUXZ3eXNsMGNBWTdtd3RQR0JNUEhZMHU5WjdoZSt4TzdMYkkwdUJBdUN1?=
 =?utf-8?B?ZzYzS1c3bGpuUkx1dnNJN3BhRWh1NVF3b2hER01NTHJvQ3R2UUJoSTVmYVpZ?=
 =?utf-8?B?S3dGRWdJMkZlNVJZc3lzQ2hFMFRzbHRXeFVKNkJCWHUzbXN1RjUxcFJ2UFpj?=
 =?utf-8?B?c0xTNEZjMXJKL003MmdBYkIzbWRXSndqc0hmNWxjNUFaaldCR29OQkxUcE0v?=
 =?utf-8?B?aitUdytRM2xIM0ZWSDlqZzh6Nk1PaHBRR0loUnVPM3p0N3NPQVNPZmlGZVVQ?=
 =?utf-8?B?UzVLZEpuRnBJb204ZkZXRGhKdy9nYXRlclJhMm9tWDJPYjhnK1l5S1F1b1A0?=
 =?utf-8?B?OU14SnZTY2RxaytQOFlXVk9VVEViQkVRRnR3eTZwOUhoUTZXNXZPYm5YNXVq?=
 =?utf-8?B?WnpJSDdIdXBnRFZtMEZtYncwZHlMbDhmRUlFbGZLZS9WR3N3Y2l3bEwvdUhj?=
 =?utf-8?B?VC9pbEExMWxxdG81MHhBQVV0Vitzb1VDTjk2RXlLa1Mvak5ja2xtSjV0NTNE?=
 =?utf-8?B?dThSd01vOUgyNVprMmtJMFNmWkRXKzhWcWpMNm5IZGNZWktubW1WM1FZcDlB?=
 =?utf-8?Q?/Yevm3YTBYLPY9nqKqNNcvmR0xnF/bR3UEs8ElI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mm1lNEJLSGlzU1pqd2pTLzRCQ08vVEwrb1RTeHl5NjdQcmNSSUY5Y3JJREh2?=
 =?utf-8?B?U1RQNHZEaklCUDJBbVFPampaUGkyQ2huTUx2SnVCekJUdzdrNjRiNkhSc2xn?=
 =?utf-8?B?ZEV4YXUwbFRGOHcrbWk5L08vQTJRNjRsRTdZRStVY0FBTDM3UGVHNG1WTnlH?=
 =?utf-8?B?U2FWZ3JvTWxyNVZhcllMUlVqWW93UFM5RHZ3UU1KNXhLZEIxUE1BeENFcmQ4?=
 =?utf-8?B?RFVlUDdTK04zRVdsRWw5bDV2czlkL3hENlBLNlJxQmt4cS9yVmwzYndndDZS?=
 =?utf-8?B?aDlKeTRNcUxvYlJtMk1GbSs3NVBFbmlXL2tyN01iVHE2T1piT0dHeFhDbEVt?=
 =?utf-8?B?anZsaVlHblora0w3Vlk5MExHaCtvVVBUUTloRHRPOTA1TDUwMnk2S0gzakVl?=
 =?utf-8?B?OVdRUVBoWXh2TnFOK0QxYitqdnFuVTF4SlZDVnB6MDczVG82enVEeU4wTktP?=
 =?utf-8?B?T05XK0tCaUplS1pISDR4T2dyK1hlV1dhMVd4NUtQb2pTaTdTcE1HUUp3c1dX?=
 =?utf-8?B?MVRCT08xbUhOYXJyeGZrYldwd1NvY1VGZ0piR2NlNXRiOWszbXg4NDNZUzNm?=
 =?utf-8?B?a2JlWFJBM1J4RHJVNFk0Vm1pK3Z1bVgyTXdnTVBZbmNCY2dLRXh0WjIxQVpK?=
 =?utf-8?B?SjRtZlhZZW1LcXdkVG13VG5jZExPQk9tcGtZNmM2Vm1tOEh4bS9pUWFZTEpW?=
 =?utf-8?B?bGZFNmo1RXdwK0ExRUs0QWR6R2liZ1F3cnVhUDUvOVBFS0R5a0RrUlYyNmhB?=
 =?utf-8?B?YjhNOVNXbFluMlNXelVPRExYZ2hZSjlMWHF1NlJ0RzhOd1NUL2JnQkh1czlG?=
 =?utf-8?B?Wi9yU0xrUTdWclgzWkFXenp3ejYwQWFFMnhvWWY1ZWc2Q1JaWHhGOGJIT1pl?=
 =?utf-8?B?dHA3b1NreXpFSnBtdnFpbnRkRVdEc0RSTFo2K1BKZ0RZbjdWODdPcGFKUlFr?=
 =?utf-8?B?V2o1STZVSWtNblFQZUFJaWVLbkloNjRCUG9nZUx5djBEQlBQNy9hdVpISys5?=
 =?utf-8?B?WXUyUi9YUzRlZHVZVm45TXlwVHJTRUprT1VmSDZJRFJOTkEzbzMxUk5VZU9K?=
 =?utf-8?B?YnNwbGhabS8rZ1dXZkRETHcyQXZ6ZE56RUI5b0JtZkZWOHd1eURlMTZMbnE5?=
 =?utf-8?B?Y01mSUpaM3p0dDY3dlJlc3dIRFl3RUFxalpYREFXUmkvYy9tOE9aMmJwbmZx?=
 =?utf-8?B?MVdnc3VtZytsckZ2RjZNOTY1Vit5ZFN3a1ZVMmRxczFpQzdXSXFwby93aml1?=
 =?utf-8?B?RkxjSHdhQ0FnWDdnMjFXdE5icmFsb2ZWTkIzb0l4eVVzbnRQczRrYnRJVXgx?=
 =?utf-8?B?dXVHSjdsS3VlQy9hZDNFSWVCVDBiT0ttd01oSGdvTDJZUzlYaWtKRnJpeitZ?=
 =?utf-8?B?WWN4Q0N4WlBjNndnMlpIMW9NVW5RVDBaaW1kRWRRbzRjK3paUFFNUlJLL3du?=
 =?utf-8?B?YkNGQWFrdzU5Y1JVcEszQ1ltVE15KzdNa0tGeTZmRWFGQk1uRm1tUktBYjFO?=
 =?utf-8?B?eE5pWms4ak5YcmJpb3ZxN1dEaGNjMThvbytNcXlQdWF1NFdHbGFnazhUS0o3?=
 =?utf-8?B?aXY2WUorblVoRGJLSVpYazNJMmVJM1A1ZEZzVndmRlZZcm1pS1BlVUtDZ29F?=
 =?utf-8?B?SjczalpqOU1JZVhrOGU5bkhHTUNZU3dleVhxanNQQXBKOWhoU3FSckN1ZG9h?=
 =?utf-8?B?OWVQVzE0NTdxRHA0SXArUVBBR0JHaWNobVIyd21KUVdBOCs5dHdKT2RyV2Rq?=
 =?utf-8?B?Y1NMdG5kV0FuZWlPcjJXQUw4YU1OOGxnOUg1SXZxaVJteStXOFpTZlcrUm1S?=
 =?utf-8?B?eFpNQW1Ea1VwRmZsbFhudDh1Mk95RmVKc3dwY3BqTFdBRGhaTDJ2Z2IzV1px?=
 =?utf-8?B?K0h1N2FkK0VwV2ZiS2tNMmN2WXYzdWdWMDBvVUg5K1Z3S1JLdDNtV2RtampW?=
 =?utf-8?B?Q0FjTXlRODlSRUgxbmlETVBURFVFVEVabklCdnJYZkVqb3I3T0xxUW5LckZv?=
 =?utf-8?B?RzdlVnlWSDFvQVNIRCt4SmtYelBGdiszck52c3M3bkdTdnF2cG90d3JwTnNU?=
 =?utf-8?B?eGc4OG1KeWpxM0k0TDhMcjFqZVRpbHROVUR2a3QyclZMbGRoNElkbWpGbzN1?=
 =?utf-8?B?VldFNmlUdU1tSFhCd2lzLzZyTGNBNnRGNXk0Y0VpOENUSjlPem4ycTJZT0VY?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5280e039-00ba-42ec-6d00-08dcfa6d2397
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 12:03:03.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvx5cuCSWNqhO7luYeMO0eSr9hAP79DGDUDunVs4pe6lqX4xGYWec14GyrIpwb35AKXmJ0FB4UPhtW0Pi//8HODjmJWgfolU2pReicBoY2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-Authority-Analysis: v=2.4 cv=K4dwHDWI c=1 sm=1 tr=0 ts=6724c38f cx=c_pps a=SX8rmsjRxG1z7ITso5uGAQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=wkFzPVxRAAAA:8
 a=TZJ3w4f3qPVT0khAxGMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=vI-w7cdEEOKAU97EXJah:22
X-Proofpoint-GUID: 1RUS1B2R-frHgaFzzMXzX99GsWMItdW7
X-Proofpoint-ORIG-GUID: HLxv8DPnJwnZ9EyYmMaazF42cd7cz5iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_06,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411010087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4A18fYbF016494
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 12:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206617

Hi Phil,

On 10/11/24 19:57, Richard Purdie wrote:
> On Fri, 2024-10-11 at 07:40 +0800, Phil Reid wrote:
>> On 10/10/2024 15:17, Richard Purdie wrote:
>>> On Thu, 2024-10-10 at 13:25 +0800, Phil Reid via lists.openembedded.o=
rg
>>> wrote:
>>>> Changes to the logic of is_work_shared where made in
>>>> commit: 5fbb4ca8da4f4f1ea426275c45634802dcb5a575
>>>> "archiver.bbclass: Improve work-shared checking"
>>>>
>>>> The resuled in a change of the logic (simplifed here) from:
>>>>  =C2=A0=C2=A0 inherits(gcc-source) or inherits(kernel) or (inherits(=
kernelsrc)
>>>> and srcin(work-shared))
>>>> to just
>>>>  =C2=A0=C2=A0 srcin(work-shared)
>>>>
>>>> With INHERIT +=3D "archiver" in the local.conf and a kernel recipe t=
hat
>>>> uses
>>>> KERNEL_PACKAGE_NAME. When KERNEL_PACKAGE_NAME is defined the kernel
>>>> source is not placed into work-shared, but the archiver ends up
>>>> deleting the source folder in the work dir, and the build
>>>> subsequently fails.
>>>>
>>>> Restore the previous logic while also mainting the referenced commit=
s
>>>> intent
>>>> to consider all recipes that use work-shared. Logic is now
>>>>  =C2=A0=C2=A0 inherits(gcc-source) or inherits(kernel) or srcin(work=
-shared)
>>>>
>>>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>>>> ---
>>>>  =C2=A0=C2=A0meta/classes/archiver.bbclass | 5 ++++-
>>>>  =C2=A0=C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> You're effectively reverting that commit whilst changing the logic so
>>> it looks slightly different.
>>>
>>> Was there a problem with gcc-source archiving as I notice the patch
>>> adds gcc-source back too?
>> To be honest I didn't test without the gcc-source, I reverted the comm=
it first after
>> finding that commit to be the cause and modified it so it consider it =
always considered
>> work-shared path and called it done and the old logic conditions.
>>
>>>
>>> The commit message isn't quite accurate as gcc-source isn't something
>>> which gets inherited.
>> Fair enough.
>>
>>>
>>> Does this only happen with kernel recipes which use
>>> KERNEL_PACKAGE_NAME? That might be the key missing detail which would
>>> allow us to reproduce the failure.
>>>
>>
>> I haven't seen the problem on a virtual/kernel.
>> When KERNEL_PACKAGE_NAME is specified the kernel source isn't put into=
 work-shared.
>>
>>
>> How would you like to see this fixed?
>=20
> I deal with many patches a day and part of the review process is to see
> if a change makes sense. So far, this patch does not add up properly.
> What I need is a change which makes sense and is something I can
> review, agree with and merge. What I don't have is time to deep dive
> into every issue and work out the proper fix, much as I would love to.
> So far on this issue, the information I do have isn't adding up
> correctly.
>=20
> Taking what you say above, "KERNEL_PACKAGE_NAME is specified the kernel
> source isn't put into work-shared" - that makes sense.
>=20
> If the kernel isn't being put into shared workdir, "is_work_shared()"
> should be returning False in this case. Looking at the logic, I believe
> that is true and it will for a KERNEL_PACKAGE_NAME recipe.
>=20
> So what you're probably saying is that the code should be using the
> "shared" codepath for the KERNEL_PACKAGE_NAME even though the workdir
> isn't shared. At this point I'm just having to speculate though.
>=20
> So how would I like to see this fixed? I'd like to see an explaintion
> of the problem which makes sense and I'd like to see changes which
> don't make the code "worse", i.e. making a "is_work_shared()" function
> return True when it isn't.
>=20
> It sounds like there is a deeper problem with the archiver code which
> needs fixing at the root of the issue. Again, I'm back to speculating
> though.

Can you provide a simple reproducer, please? I'd like to look into the is=
sue if
I reproduce it.

// Robert

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20

