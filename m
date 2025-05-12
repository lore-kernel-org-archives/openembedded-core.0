Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFACC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 18:01:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.57182.1747072870014893020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 11:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=722724617f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CHfCx1010370
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:01:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hws8a2e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:01:08 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54CI17Mq009690
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:01:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hws8a2d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 18:01:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djHPnKrLiEry6ZdVGOmfEtoLYpg8mbk/6LFdrypYsnKdXhccxnJwW/Ci8qRWwTzFIBHPoZ+JvHyEi3gSxE9B7SeJl8TCcC4FXsbEJoKoVe720Xps9cBTEb2Pep02ZrX/DjTTpx1s3TwyWnG7znEA9pUeG2cOIs/qa0lyjTGJjFENKDGNyYKMqguKiAPzbpZY+D925d2Jx1gFZojPWm7iIlRIJ9PXc6l2btMenIEcCEXqrcaljjGY7LepLpLSP5hdmMuw/VK33Nas1AB6ioeLe/GXrRgpFz+9lYJeqPFIbR+TmLv9n6GiY2AfjBqh1Y4bn1f0GDRJj9XDDEhJgPS39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKfethDJo5g95AVt4CBsj86xQ99RSJ9fJRZWlR1tq6I=;
 b=PKtyvY5HOckroA1Yed+n7DxX6Jk9LZMYaPc9vh0HEwksswKeyOyRx3sUrlQEbfJIbMcQQPgw5t8NRHEG7KvjfeiHCN0FkzFKnuXGlO8EQ3V6dEHz/5Nv/eP8kPGsYf0DPiU5hB3pkqa858GaKwXxfE3nibtlMI49xtUjuDiO2sMWHUnQfKUBcXMUEwLUeFkKRX8vGUYnvcn9bgo/ZP7Wqw1+Dt+K0wAG9kfFNGCeYi+FeyTExoT4pKegFaTJ0SSPPlOirwbUZGfamRB6DKqsUnza7V68RMuPfFtVScuHE9jjujME0Otd1WLDrl5gc7tCXejjt7yTf55UjtXNMRiL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 18:00:50 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 18:00:50 +0000
Content-Type: multipart/alternative;
 boundary="------------ojz6Nrc0BFCKy46AbbUZpN4H"
Message-ID: <293404cb-43de-4f1b-b42f-bd3d900814f4@windriver.com>
Date: Mon, 12 May 2025 14:00:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] coreutils: fix help-version.sh ptest with
 'single-binary' enabled
To: ovidiu.panait@windriver.com, openembedded-core@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>
References: <20250508072814.106107-1-ovidiu.panait@windriver.com>
 <20250508072814.106107-2-ovidiu.panait@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250508072814.106107-2-ovidiu.panait@windriver.com>
X-ClientProxiedBy: BYAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:74::21) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ0PR11MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9c25b0-6242-4583-380e-08dd917eee2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UE5QdjJNejlSamFUdVEvaE9Sa04wWjdnb0Z5VG5JSy83ZnJFN1k3VFROcWtU?=
 =?utf-8?B?T2E5YXdEOVFlSjdiVXZrRlphL1dHYWk5c2dmNWN5WE1XK3FSQ1Z5UW5sRllz?=
 =?utf-8?B?MjlrUHBVQ1k4SVRwdUpkb1YvaTl4aEZFOTl5MFFLeUxGdm8rZWp0UlJHcFQw?=
 =?utf-8?B?MzRSdHcvWDR4V0F2WU5WRnptOGtCTXZJcS9LSFQ1UW9uaHpZN1F2bE5lQk1P?=
 =?utf-8?B?TkFMYTVLcEFjUlZNaW9qdWRneGtia09iS3ROWVp4TTRjRjJTc1R4RWFkRGVp?=
 =?utf-8?B?aXRoNUlaU0dHSnpiMjVQMmx6UXBMVnd3RktHMlJnRWRpbDFZNEIvMGhwTjJY?=
 =?utf-8?B?RVF2SFJFdkZpRWdkdnJZSWdDNEtVYk9nYXpHT1FMNmdlZjJKYlN4aHdRWFFK?=
 =?utf-8?B?eWFxSGdTbS9OZ3N1SC9KSFlIbXhVT2VKRGhkT0Y4clN5b3l3NHV4cEZ1TFNK?=
 =?utf-8?B?cm5EYUdoRDdnanR6cW5SdmxFaWl6VS9IN3ZEOVcrZ0JYdHJiRjR0UkxISjVO?=
 =?utf-8?B?Ny90VHJqSUg5NUlOWjJETUNkVVlqazlCNnVueVNHeS9SVzExclBKMGNHazZm?=
 =?utf-8?B?Y3lCSithbjlrdW5uMi9zYytWMnoyWXRjOUhkM09CU0ZsM2Mzd0E0d3hxZ3dX?=
 =?utf-8?B?QVp1Z0RvRVRxVG8vay9GQWk2SmJLWXl5OGpudUlNOUdIcVlNQmZuMFcxMmln?=
 =?utf-8?B?Q0RHa1pFSzRKd05HQ0hhREN4ZExHaWdFcHI5eVFaVVpKeDNtazBCT01idDNK?=
 =?utf-8?B?S0RiaDZtcFgyNUsvRFVJaXpGY0prQ2UvZ29PbytpNEliSjNRWGY1SmNxckYv?=
 =?utf-8?B?M2llcWVXa044VFpCTThrcHVSVHhxdW4zb3ZYYlNpcDAva2RML082d2F1aVdq?=
 =?utf-8?B?bXExaitRekdiV1JIcCtzMDhPVzhxOEdwV2ppYStwaExGWDkwM2M0eVU5N2hF?=
 =?utf-8?B?bUw0cGRnZmpIOWI4dUhaOGxmOFQ2UXhVUUZneXZWRzNONE9NRHphWDRnU1Fq?=
 =?utf-8?B?TGxta2pINVg3NFI5UGtpa1lnZ0MzOXpzL1hncFhHWHFaUjNxcFBaYnovRWRW?=
 =?utf-8?B?Mm9HYmk4YVFlTnhnVytmdEFGb2ZLSTE5d2h6MEZ2ZGNoWllyenVzaHJhNHpq?=
 =?utf-8?B?ejF4V0tuWmd3aStrempqMUZCTEpVdWphZGVZeFhxM2YrTmVsZHp2ZzV6MG1j?=
 =?utf-8?B?aDlTUGRxY3c1ZXVwT0RQVXRZMjZGMVZVWFVMMERDaTFJelJwR1NCODJFdzM4?=
 =?utf-8?B?azlZZWwvZGNkRnNyZG96TjdWRERUYis3eVBlY3I4YjdZK0k1S1ZPblZNYjFp?=
 =?utf-8?B?UGRPSnBHL055VzN6WkJma2JOQVNON1NyREEwUFliejE3RG5SeGtOdVdjYm9o?=
 =?utf-8?B?L3FwcHNNd2FiSkVGT2IzWkpURlJ2cXhGRzRVS3hIaFE1VllWeE1ERnJVOHFj?=
 =?utf-8?B?SmVqd3BKaE1tUUNzZDFxV3FoQnVWSDlKNWJXNUxRWmdadUpFZlZDREtLOWds?=
 =?utf-8?B?V2phN05UN3c4dDJuc3dmK0NFSlprbE96cGMwU1NNS2VNcDRiMlRpdzhhcnVQ?=
 =?utf-8?B?ekozQ3l6RjY1SFdTVk9MYmpnVjVNWlZNUEJtN1lRemdrL0FBaURNWGJNNmY5?=
 =?utf-8?B?WDBod0ZTNkk4dVU0eC9pTWlkak5OamdmS2xBOUQ3bGtldERGVCtOWVVBRjdq?=
 =?utf-8?B?NU1kN0NWQTA3Q1V4SFE3SmlWcDQwc24yWm40REREREV5V2JFWHpKcTNmcU5x?=
 =?utf-8?B?b1FQR1hxaDNjVWdVNURLUDNlYVdmYzQ4dWIyOXRZajl1R0pTNnZEZ3QxRkNO?=
 =?utf-8?B?TG43d3VJOFdzdHlJNHE3OVZ1d3BVRC9CTlp3aGxDSUY3eFRBdTQzdno3QlY4?=
 =?utf-8?Q?JujC1AjovYW8T?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFpDaFFhUUpBUXowTjdzSjlUMlJ3cWFFWHhCRWZmUGhzd2pVcTVmS3JweG4x?=
 =?utf-8?B?Wm5hc0U5bjNVZVZLQ0tiVFJWV0p3MjUvYkF4UTdSQlZXLzFobVBhZlhhT2lL?=
 =?utf-8?B?WmowVHNZQU5EZ1NHZ1BPT3VySEVjN3FSdUpYaC9pUEF6TWxrQkd0R3pKRzJ0?=
 =?utf-8?B?TCs4OVJ4MG1LR2hZVVEyVlhJbW8rZnM0UHJ0T2JWZDl2dUxtVGFRMWl4VmU4?=
 =?utf-8?B?MXZTbjFHRVRNeGZOWjNsKzVLTlpjVFFPNDhmTWhQdk05K1cxR0ZKUWkydkZ1?=
 =?utf-8?B?OHlaMWZyZFNQSDNUS0tYK0RDZVFtYXdBSHdQQlNNZ09jZW9JL3JSN05SOS8r?=
 =?utf-8?B?cFhwSjh2OVJtNGhsUnhEYm92cE1VbktxYkJPbUZ0b09TaU14RVk2V3N3RXpw?=
 =?utf-8?B?dTFXM0JJV0ZkbngxWGRKMzE1RGlhZkNDc29EeURvbkZzZ3poWENnZW5vL1py?=
 =?utf-8?B?Ry9KaVNNclQrQ1BNYzZ5Qms3cjdtYndvSllCUXRJSmRxenF3Ujc5Z1o4YnFI?=
 =?utf-8?B?SUpJNUI2c3ZDb2NQdjRxN3pIUEJ6Z1dOT2MrbTl0YWVmNjR6TTM2ZEZqVG96?=
 =?utf-8?B?ZzZBT0xCYUhwVVc3cC8xcFRNcWIyVmJHbjk2eVhLUTlza3VPRkpTdzUrN2pI?=
 =?utf-8?B?SnVXRWxRTGJwNmgxeU5wMlZEVVZvRXBsaHJydFpINVZsRFhndHRUREhKR3I5?=
 =?utf-8?B?MFRuc1k5MnVoazlKM2JIMFZsR3h2VWdYWEdmdTBLMkZKTWs5WDV3dXFldnFC?=
 =?utf-8?B?eFJYemdvcUlLNWZmSVdXUGVGY1pSRkEyZDhuQzVCYlBzMWpsN2VBVkF0bGk4?=
 =?utf-8?B?QnJ2Um96S0M2d1lSYTFUcllkY0d5cUxjQXhmVjJKdzgxZ2ovY05pVFlzSDZ6?=
 =?utf-8?B?NzQ0MDJyZVlyMVpRMDN1MCthK0R3YXFhVktaVWFqZWJId25XanZUNTFCWGdB?=
 =?utf-8?B?UkVJcEFXVnFuZEdkUnVMV0IyRVJzSXR4OVMzYTlXWG5LUmtYQUhIbVg0VDZl?=
 =?utf-8?B?elgxbTE2cjdkTkZsTEdWcE9GSnY0ZnI0YlZNdW5BeEwydmg2NEZ3L0FiRTBs?=
 =?utf-8?B?WVgxdTZOaDQvNXRTdzFBcHdzYThMd2lwZHkwUXBkRG4zeGVFcmtaR0ZyVkto?=
 =?utf-8?B?dy9rR2tPSXdEaE13UUlSNklOcWpYVEw0WXlGZXY5czFmVW9vZHhBREdnNEYr?=
 =?utf-8?B?RC9rWjZHMTdGQXVnMENnZ1ljaWlxNW51ekREUm8wR1p3S1ZOcGExazBpOVh5?=
 =?utf-8?B?cFJ1aStpVGRqMXRqUGRtWnRmeGhWL2tMUFl2ZjZhYWY4SzVtWFhWdzJYVmJt?=
 =?utf-8?B?bVQzM3R2YTAxbjFyYUl4MEduTTlwTjRNcnN2WWZWRXQ1MXN6M1MxRUQ0NjE5?=
 =?utf-8?B?SDFsQW43SDVHVVdZNmNIdkRza0hUeGJmUC9MdzB6UUNsZWQ1SUFlMEFESC9Z?=
 =?utf-8?B?RHFVL3h3T3BkUUkzN2FoYUdROHpkUFA0VjcyV3IzbWdKN0Q5ZythaGNRMVVw?=
 =?utf-8?B?cEEzN0JVVzBQQWJSMVJvUUVyTWwvMUN3ZElPaTlESk13cjNuQmtRVExRTXpE?=
 =?utf-8?B?YlhVS08wYTVjZkVqYStGZFVEd1ZPU0ZnK091ZkFGTmIxdmI1UkwzcG1Qajdk?=
 =?utf-8?B?NnplMC9US1J0V1pUWWo2YWcxUkIvTTA0bzY5YThLZkZJWXpLVGk4V1ZRTk9y?=
 =?utf-8?B?Y29rM3FIV09kcjVSdkkxZU5kRHhUOUtVRW40Z3JJdFdxenhqc2VsdXNleUlT?=
 =?utf-8?B?clhCYWJsbnpZZXEzbGh5WWdCNVp0NjNoRTBKbEdVZ09DaGM3Wk9WSnp5UzlP?=
 =?utf-8?B?bHdGT2FPTGliUHJnU3A3MUxxSEJ5WVM4dEt2UHlVbWwwdEF1V3A2ZnMzbnJB?=
 =?utf-8?B?cHZpMVo3a2Vra3NER1NnWlh6T1QwTlFSMDl5a2tPYm93cDFybHcxeGE3N1pw?=
 =?utf-8?B?NitqUHJYcHJKREluVG1Ta05HcS9Kbld1M05PcDU2cHF5WGFtWVA1OWlVTlRn?=
 =?utf-8?B?QXpMZEZmR081MXVCdmlOVHI5OHJpWHZ6NkYwU0RQSEExbjhBNWdXWGxEZnNN?=
 =?utf-8?B?bEdsbE1Hb1FLaXdER0tEV1hVNVV0UEhpYXBnM2FEQmJyVmkybFhoYVpldnRX?=
 =?utf-8?B?eGUvT1hLV3FlSGpyamZMdTc2MTVOU2gwUm4wcFBjb0FnUURETGlVL1kwRTZl?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9c25b0-6242-4583-380e-08dd917eee2f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 18:00:50.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98qnY6egxo40qaMVIOGRI8iH5HlYxKNXfzDIL5D1DlItMQZOnlpYl9RS4H3qxANIf3KmjpZjBkZHpyUQukupF/VlyNNqs991mr1cKKQMLz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
X-Proofpoint-ORIG-GUID: HMZBw6uIBzCOJMKRCzw8opWI71_W_3GA
X-Proofpoint-GUID: N2QFzNTR0cgDrN5iBgBXLnG_eR6QCK-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE4NiBTYWx0ZWRfXzwin94TPDUt8 6JnpB5BjFKy2hjHe8TN+uTHvaKNJGIe1/aB9JyHsgjSpOVUooNPcjvhaQxPTiBT1LFp0F4v+pwp MLFyDh6cw3LewdzXvXIb71J8nkVyK4vGPFF0vPwrXcRoPi0loC6bEUZkLl3liTddPKT0LV0cjBA
 HRQoCy91BGjdZVNmM5Xud+7SEfIUcipzpQkNjjuVT1fmtBBOf0I1q8tLeti6aPPojBPqNvoMW5E CkZH1VE/d0tkhNzRuQSemu8ilspeWUDD3ybIl4szaUmFGmZMRmvJQb5xIHkW7zaxEqBsGalgqYV NgVYd426z80FzlE/+TW/RYuQxRL1M9qY6wjH+DSfraSWD3lvNSbIaCmJUgWr2M0+bFPKSnUbZ6P
 kjiKb1Zx/VOxA6C0p5CIzjkn0LkLSuiROaCuDvmPHaALLtYIC2bSiLH+YduDu/8I5azids0G
X-Authority-Analysis: v=2.4 cv=Q+HS452a c=1 sm=1 tr=0 ts=68223764 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=C9wsYybCWvYpjtaLJpEA:9 a=QEXdDO2ut3YA:10 a=dn8Sa3vdjl7WPOF1GIUA:9 a=ojXtMr29m-jDdzx7:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505120186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216383

--------------ojz6Nrc0BFCKy46AbbUZpN4H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-05-08 3:28 a.m., Ovidiu Panait via lists.openembedded.org wrote:
> From: Ovidiu Panait<ovidiu.panait@windriver.com>
>
> If 'single-binary' PACKAGECONFIG is enabled, help-version.sh ptest fails:
> FAIL: tests/help/help-version
> =============================
>
> ginstall: missing file operand
> Try 'ginstall --help' for more information.
> FAIL: ginstall
> FAIL tests/help/help-version.sh (exit status: 1)


Why does this only fail in the single binary case?

Can this be fixed at configure time to use 'install' rather than, 
'ginstall'.

Can this be fixed upstream?


../Randy


>
> The tescase expects 'single_binary_progs' variable to contain an 'install'
> entry, rather than 'ginstall', so update the Makefile in coreutils-ptest to
> reflect this. Note that this is already handled in the non single-binary case
> with a similar sed command.
>
> Signed-off-by: Ovidiu Panait<ovidiu.panait@windriver.com>
> ---
>   meta/recipes-core/coreutils/coreutils_9.6.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
> index fe2cf73d40..a95644d22d 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.6.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
> @@ -220,6 +220,8 @@ do_install_ptest () {
>           find "${D}${PTEST_PATH}/src" -type f -exec \
>               sed -i -e 's:${B}/src/coreutils:/usr/bin/env -S coreutils:g' \
>               {} +
> +
> +        sed -i '/^single_binary_progs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
>       fi
>   }
>
> --
> 2.34.1
>
> pLK@tY:ATbOf1"dW
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216143):https://lists.openembedded.org/g/openembedded-core/message/216143
> Mute This Topic:https://lists.openembedded.org/mt/112783420/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------ojz6Nrc0BFCKy46AbbUZpN4H
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-05-08 3:28 a.m., Ovidiu Panait
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250508072814.106107-2-ovidiu.panait@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Ovidiu Panait <a class="moz-txt-link-rfc2396E" href="mailto:ovidiu.panait@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a>

If 'single-binary' PACKAGECONFIG is enabled, help-version.sh ptest fails:
FAIL: tests/help/help-version
=============================

ginstall: missing file operand
Try 'ginstall --help' for more information.
FAIL: ginstall
FAIL tests/help/help-version.sh (exit status: 1)</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Why does this only fail in the single binary case?</p>
    <p>Can this be fixed at configure time to use 'install' rather than,
      'ginstall'.</p>
    <p>Can this be fixed upstream?</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250508072814.106107-2-ovidiu.panait@windriver.com">
      <pre wrap="" class="moz-quote-pre">

The tescase expects 'single_binary_progs' variable to contain an 'install'
entry, rather than 'ginstall', so update the Makefile in coreutils-ptest to
reflect this. Note that this is already handled in the non single-binary case
with a similar sed command.

Signed-off-by: Ovidiu Panait <a class="moz-txt-link-rfc2396E" href="mailto:ovidiu.panait@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a>
---
 meta/recipes-core/coreutils/coreutils_9.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index fe2cf73d40..a95644d22d 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -220,6 +220,8 @@ do_install_ptest () {
         find &quot;${D}${PTEST_PATH}/src&quot; -type f -exec \
             sed -i -e 's:${B}/src/coreutils:/usr/bin/env -S coreutils:g' \
             {} +
+
+        sed -i '/^single_binary_progs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
     fi
 }

--
2.34.1

pLK@tY:ATbOf1&quot;dW
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#216143): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/216143">https://lists.openembedded.org/g/openembedded-core/message/216143</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112783420/3616765">https://lists.openembedded.org/mt/112783420/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ojz6Nrc0BFCKy46AbbUZpN4H--

