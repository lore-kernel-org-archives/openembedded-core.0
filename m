Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCE0C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 15:51:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18365.1741967470571726575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 08:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51686a36d0=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBHMZ9018256
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 15:51:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bxxp9ke0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 15:51:09 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52EFnBJr029922
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 15:51:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bxxp9kdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 15:51:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CM6aeP14w532syCd5P2Y7qpHW3ww0zanerpcEuYmIoFIQBc9N+S27CzFZXi9gts+okDMJ2pfPNbV6yto4GU+UWEx/tDIGJzoOtmLVwpwRxnHlOQwGFV09nsdjyX9w7v3X5ucNuG2XgD0XVe27Q7AqYzHe/yAOp7swoR+Nlf8kb7LlxyTIR+3B0e0kHVaTgNVQVYa4cYWlHaCLGCfsv1hF+5IW7erG3vaD1tXnk5gaCuBygxVSeRrDhrMNXZJdAKKDdbtVleGIE5WIEvMwcyRQoEmcESAKMFxixymXvqVe5WXAliIIKtieP1WEXCyRGlV5zTFXnpfSFuSqab9FQRXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdH+2dk8rV/TSA1eAPTXL3QUDIzTX61oMMnLr+037f0=;
 b=ZrW3VKAaDlHTkfuS9SyIpQA5lrDfAHdZUNlG50nU6kudzKti//0uRwph+O0U8ty5buUsQieDOPdfdM4w1QQ9dPxTdgMOQQ8RKm+OuNwtxMjJrQ+/AvZ3/9almHda8d3kcGRJXMu0tadfmOz5qZ4zfFJEf5UlbdRKODugjBVN/JHGX2CPlVmRoSZ0Ce2pLRlUGfdrQ7P6P7bieQDoIj/AX9bDh0OrF7QeHhQ/9nAMg69CkPljqvcNMkjKiYZpOHegh+6P2oAfSziKVmLp+Dpyu2J3t+4x6GLgcohT3SFOvoCnQuFSbApeohyr+HAaz+82I2mjptBHr+zs75fPOT6RyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB7962.namprd11.prod.outlook.com (2603:10b6:510:245::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 15:51:04 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 15:51:03 +0000
Content-Type: multipart/alternative;
 boundary="------------46cFzvx5owk5HxGGtBhN4www"
Message-ID: <aa6b3d4c-bf6b-41b2-98e4-0ff854c5fc8d@windriver.com>
Date: Fri, 14 Mar 2025 21:20:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4 2/3] rust: Upgrade 1.82.0->1.83.0 --> bloat
 alert !!
To: Randy MacLeod <randy.macleod@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        deepesh.varatharajan@windriver.com
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Khem Raj <raj.khem@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
 <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
 <c411d58d-bd27-4107-9b98-e39de14204df@windriver.com>
 <5d748ede629df75d0ed30df5418b42b936d5416b.camel@linuxfoundation.org>
 <03997060-1f1c-4784-af57-bb83b0514ebb@windriver.com>
 <a82ea56c-dc36-4784-a6cd-33d97014bdbe@windriver.com>
 <70820f45-41b1-487b-ac53-1e49ef57fd5f@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <70820f45-41b1-487b-ac53-1e49ef57fd5f@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8f1c71-65d4-40ca-2072-08dd63100653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Qkk4cEp1RmMxM2hrb25USGh3aWFWQlplU1JESGpBVU9hOXIrY3h2TVVadXM2?=
 =?utf-8?B?a3NXcndLbkNpVlZBblNIS0JVZ203cTRiZ2hQSlk2a09oYzJXRGdsNFZDN3Zk?=
 =?utf-8?B?b1VEYnRJZWdnZU1GdnRYYkpNWVIxb1VIMXRmZ0luaXlsenpRUVlSaEdCczRz?=
 =?utf-8?B?dXRaaGlMYnBzc05aR1R3VitQdzJVUFNYK0poeFFGb2N3eElxQ1g1NGdIOUdo?=
 =?utf-8?B?UUJhcE1NZ1UvR3l1UUl1Y2NrU2lJbVJidnFOcXR5R0pOYmRJRDF3b293U2R4?=
 =?utf-8?B?T1FuaVA0RllvZkt3eGtEMnhQbnA2WVQ0NFFZbytXWFQreG04WFR1VFJFK0Vu?=
 =?utf-8?B?NUFSenZpV3h2Zy9FeXVyM2x6MlpNYUh6SjQ2R1RNZXYvKzh3OVdYVlVlV0RJ?=
 =?utf-8?B?cGNQNWI5VVZUdEVrUUFFV0lpc3B4cmdzeEpPU2tDTkJiTFZCN3J0N2I3Q1VB?=
 =?utf-8?B?eFhPcXd4M2JyVDh6U1MxYjFpZWk3MEZFTjNvK0Y1OEc1QTBoWlViN1AvRjJr?=
 =?utf-8?B?emZseTVUMkNnQUkzems1dTUvbXdHOTFIWWs4RXd4WWQ3MHo2NlViSGVjS1Jy?=
 =?utf-8?B?TG5lQlN5a1N4cGw5TjZaTnRhaWVaWlNQQVQvL3hEbGw1UkQwVS9UQ0NNWENN?=
 =?utf-8?B?RXBWMmx0Z2h2SHFYRyt4RktQZlh5emdNejlLWkdNUEZxUnVpeFdNQVE2NDR2?=
 =?utf-8?B?bVhXdEhVV0pUdzFxSm5wZjRxZk1ibmtibURLcGdYSDJod0tvR1ZJSXBvM3o3?=
 =?utf-8?B?RTMzQ01EcWMrMlkwRm9GaTllM0V4elFFQ3ZnTXJLc2IyTU5qOVlFVEZ1UVhM?=
 =?utf-8?B?c3ltRFBvSlJGc0RKS08wSjRhSWhIcUE0U1dIeWR2OG4xK1hVUWRlRUUxMTcy?=
 =?utf-8?B?L0V3M2Z4NkV0bFVlSUtzZVZtaVpUaGVOUzIvamdHMDFYUU9DS2xkNkhtTUVx?=
 =?utf-8?B?YU1hbG1uWGd5dkY3VnlHZzVwWEVwVng3VEQzK0VhTi8rWTRKT1lNbk5SRUlV?=
 =?utf-8?B?L1V2T2Iya0dUUmxacisxZHlzc3F1eFh4ZHkxQUVlYnVzSHJWMmVNRWo3VEdU?=
 =?utf-8?B?TmlyVTRSYUs2TjBNR0pRTjBvRjdQZDVoTHk4YXloM1h3cllUMUdGbkN6NzlC?=
 =?utf-8?B?SXJRWFRnbUFRQVVWeXVGSTFHUENVdVl5aG9xcTJkTURmZjdSaDgxdEQ2OTVX?=
 =?utf-8?B?SWtGTDZrM0x5ZEorKzRhME90aEM3R0tHTi9jdjlEeG9wOGFvWWVFYXJnWm1B?=
 =?utf-8?B?N3hXVjdrWHNkWk5mdTZLT085VVNGZHlzaUxBRHlISnQ1ZDlvbC9EL21kWEh3?=
 =?utf-8?B?QkVCNjRRcWRBSWxmQ1ppY29UVHdycnIwWnR4NnZEd1lCQUNWSE9hSGl3SWZF?=
 =?utf-8?B?QmJpTVNrTDNlUXNidExSRVVMQ0xuRjdRb0pRTXhWUndseWFHTi9xOFdGWVNh?=
 =?utf-8?B?OFlZSWI1MGIzYzJVUWc2cVB3ZDdpWVM0MWVTR0swcWV6em4wR3JaTnRwd2ZR?=
 =?utf-8?B?QjZyZnFxY094QlRURVRMcm1UaysvOGlUVk1BVFl3M3FqN0xRUG1Sa1NsaWg0?=
 =?utf-8?B?YkpYRmdRMEF1OWhDaSsvT3ovU1dHM1hQMWhqenkrNXZWNjU3ZkV6dkZBUFlV?=
 =?utf-8?B?ZnQyUG5yTHAxSitDdXN6ODdMSWZndWtOci9QL0RLYWxhMGZ5QjdnNURrWTZp?=
 =?utf-8?B?aHZNSldUYWcvelRCRlRJNHZ4dlJMTzBiSnNFdVNxYnk1aml3RmtzWjRIOWFN?=
 =?utf-8?B?dHZvUkZ6R2ZBajRuYXRZT2E4RTJiVU5IRzBQU0VrZFd3SXpLeFA1NXAwMUNY?=
 =?utf-8?B?bWRWdnBVYW8vdVdmVHcwUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a3BFNEpDTzlDQm0vOXNsV056NlRqdFZSMElTVzYyRUhsbmZVV1QvVW9mYU52?=
 =?utf-8?B?cTNmRUhFSWRKblkxUkx1cW9nQUVYOWxISlY5V2dFYVBWbHdUNnJDU2dWUnZX?=
 =?utf-8?B?SXFDMXZUWTBNeHpBaDZocmJlQzI3OFVnMXBQM05hRGx5YjVWU3hIWE0vbERy?=
 =?utf-8?B?TGxRY0I5MlZOQ0huTjMrVTVGbXdDc0U3ZUcxV0pLL0x5Yk5MS01xRHkwMU9l?=
 =?utf-8?B?alBOMktMRDJETzhNSVVEdnJldEZ4OFZQU0o2K1ZpeTNzUUNVNGRFUVY1RXIz?=
 =?utf-8?B?ekcxb2xvaVp3NTBoYUlyQUVoQnBYS1d1OHVnZDdxUTRsdkpNTGJWejFZRENF?=
 =?utf-8?B?M0xPY1dQQXZFQS94dnhEOExNNlpwTlh0QXhRL1NkQXVRTDJKVzlBRlNLT2tl?=
 =?utf-8?B?NlNMeXVvWkR1aVo4OW13cGZOZk51VHJiYk1wUHFRRzNYS1M0Nzg3UEgxYnZ0?=
 =?utf-8?B?R3JaMDhJZjZoemU5WTJoSWRrZEh1K0oybk90S2pwa0lnQUVKR1RvbVVuY0ZF?=
 =?utf-8?B?VTZ2dkEvQ2h2czVnZE1MR2M2QTU2VkZkU2hyMVFGWWd1UFNJT3Y4UFJkcmwr?=
 =?utf-8?B?RXMwQ0NDTytCVW1tZXVmcTlFWWl2czViNGZ3dEo3WFk5dWd4N2hGSUZvck1l?=
 =?utf-8?B?UW9hSG1DaUh6SkxVeUxxendJZ0hoc1RvS2ZmbVRmd2ExK2I0QnZyZXBIdElm?=
 =?utf-8?B?QUpicEdUa01DbXhSZ1hLeWtyZmVsZkdZQURUT092NWhQUmkzcGR3QnNTL0Ry?=
 =?utf-8?B?T05XS1R0TEhWQUJDWEdmcXZ2NndEejRPU2YvTEd4SUxYQTIvUUNlWlJ5Z2Q3?=
 =?utf-8?B?bUkwWHVLaGJud3ova1k0Mng2c01IR0hXUi9pWjBuWHlycW1pTkd1b05RTFRZ?=
 =?utf-8?B?ZkZVcHNHeUdIdG1zUXpBd3pQSndwTW4wTWh5NldsMktscFE5OGFTeWw3c2Y2?=
 =?utf-8?B?N2NoWFFKemdLbHZuWjJDbWhZSTQvc2d1TS83RVN4cG9NYzhnUFZCSDUwNThp?=
 =?utf-8?B?eUZRUGN4Z2VrazlpVGk3QkxiSk93aGdqT3p4OENRYVhFL0dvdEwxSlc5dE5o?=
 =?utf-8?B?cmxtbURjRExPWVRwQ1psZnd0VGk4T3BEMUgrMW1TdXlUcjVkaDZpUTlycktr?=
 =?utf-8?B?TmlKV1JBWWlzMHpkb1EvSE1tdGJmT1I0cUFpY2lieDRpTHc5YUV5bVFoQmVH?=
 =?utf-8?B?YTJSMXhVZWtPY2JRL2sxTkJBZ0hqcTJ4dHI3cHRnRHdFZXRBSC92YnhmRVBp?=
 =?utf-8?B?eXlGUUFhbE80NTVoZ05IYk0vZHdUZnp2NTIyS240RmVMWExFVjBBZ3U2VnVp?=
 =?utf-8?B?VW5waDNVUm9zVTUvdGM3MTY3TXoyOWY3Mlg0T0dUdDQ5VU53aTZXa3crTjFr?=
 =?utf-8?B?cWozTGVFbFVHNmhEL2N1UFpuK21oaFp1a0tBWFh2bjhzMExXTkRJT1FpTHZj?=
 =?utf-8?B?bjNiMjlYRTh6TFEyRWc2NnZoSFJlVWRUN2thNlFhd0xrOWh2QmtOQk5Bb3Vr?=
 =?utf-8?B?T1duZ2xGL2JSZ3hHZTVRZkt3Rys5c1NGYlpIZVF1Q0dzUm85ZkYwYUJSaVNR?=
 =?utf-8?B?M2pKcG5RU3ZuN0dTSmNibkdTOHd4S2l0OFZ3bVc5cXhtTjJjZTFXMXBORnI5?=
 =?utf-8?B?b1FsMTk5aE1SMUYxdG9Id0d3Ujl4bWxPTXZySldZRitUZ0dRKzQrMVk4V2Ri?=
 =?utf-8?B?MU0yMFVGR2gxR3J1NHVJZjNSZU56Yit6VVJjdW04b3NVM01VaHI2dFhNeFd3?=
 =?utf-8?B?Zk02cHNPRHBZRmgyc1l1TG03c0E0RFI1WTNvd1B0NytvUkJ1V0JDK24yVWpC?=
 =?utf-8?B?VkRvU0FWNTJkN0xYdDVhenRLa01vclhGTlJWL3FMSmFiMlFHSlYxMlVSRGVF?=
 =?utf-8?B?RDl4eGJEejBrSGo1b2lGQTN2d20rSHQwSXQ0MjVXU3BPSzdTa1pENStzamlC?=
 =?utf-8?B?bk5BTk9oT0VNOWV3RFA0YjVmSDJxZEJyd3k1M2grZnk4RVNra0Zkb3JkWWtx?=
 =?utf-8?B?VjVYNksrZks4ZXRUa2hkVFM1Z1hpcFNEdHRmVXVtZENDMWZqRW9DYkFXWHRt?=
 =?utf-8?B?YmZTNWRSOWJ4RUQ5S0dTcXBZQTh5NHVHMWo3SlNVMTA0eDlFUXBTQWNZUC9G?=
 =?utf-8?B?S0ZxQ0JJeFhxSEdJQWxpTllNS3k1R0NSYldlRGRIM1YxWlFsaEQ2MnBxZU52?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8f1c71-65d4-40ca-2072-08dd63100653
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 15:51:03.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qd9+3w+ngNi5hytse4QiTGJSXT5mAE2ki+U/LqctyFyNsrzc5gLjpRPqzIdI4Z98xBCXsUnQHyoMsh/jTvS5L2zUFGps3qirbu8acfKi68w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7962
X-Proofpoint-ORIG-GUID: GRsFY1gtP7k4iYKgnXdShDj7R4zgQ51b
X-Authority-Analysis: v=2.4 cv=C+PpyRP+ c=1 sm=1 tr=0 ts=67d4506d cx=c_pps a=c8UlD/aNTkVRGuk1JCy5IQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=DDSR2f3-EjuoMR2uMJcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=ykgYWsb9Q86-sIhXOMYA:9 a=6z-XYWhYEN0STv3a:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: GnB2NPu0Tg1aEkjmGvKtJVtcigdSf2kD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503140125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 15:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212854

--------------46cFzvx5owk5HxGGtBhN4www
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-0064b401.pphosted.com id 52EBHMZ9018256

DQpPbiAxNC0wMy0yMDI1IDE5OjE4LCBSYW5keSBNYWNMZW9kIHdyb3RlOg0KPiBPbiAyMDI1
LTAzLTE0IDg6NTIgYS5tLiwgWWFzaCBTaGluZGUgd3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDE0
LTAzLTIwMjUgMDA6MTgsIFJhbmR5IE1hY0xlb2Qgd3JvdGU6DQo+Pj4gT24gMjAyNS0wMy0w
NyA2OjM3IHAubS4sIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPj4+PiBPbiBGcmksIDIwMjUt
MDMtMDcgYXQgMTY6MDIgLTA1MDAsIFJhbmR5IE1hY0xlb2Qgd3JvdGU6DQo+Pj4+PiDina8g
Zm9yIGkgaW4gYGxzIC1kICpzcmNgOyBkbyBkdSAtc2ggJGk7IGRvbmUNCj4+Pj4+DQo+Pj4+
PiAzLjVHwqDCoMKgIHJ1c3RjLTEuODIuMC1zcmMNCj4+Pj4+IDQuOEfCoMKgwqAgcnVzdGMt
MS44My4wLXNyYw0KPj4+Pj4gNC45R8KgwqDCoCBydXN0Yy0xLjg0LjAtc3JjDQo+Pj4+PiAz
LjlHwqDCoMKgIHJ1c3RjLTEuODUuMC1zcmMNCj4+Pj4+DQo+Pj4+PiBJIGRpZG4ndCBjaGVj
ayBmb3IgdGhlIG90aGVyIDQgR0IgeWV0Li4uDQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4gcnVzdCwg
cnVzdC1uYXRpdmUsIG5hdGl2ZXNkay1ydXN0LCBjYXJnbyBhbmQgc28gb24uDQo+Pj4+DQo+
Pj4+PiBTaG91bGQgd2UgZG8gdGhhdCBhbiBob3N0IHRoZSB0YXJiYWxswqAgb24geW9jdG9w
cm9qZWN0Lm9yZz8gDQo+Pj4+PiA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6
Ly95b2N0b3Byb2plY3Qub3JnP19fOyEhQWp2ZVlkdzhFdlEhZkpYSkxxNXpVWF9PUkFkVDBp
bXN5NVBmSUFIVkJqdzNyd0pScEpIMEhnbXdSSmlUeU1GSVFlYkhmN2pHOW9fbDdHS3UwNnQ5
eksyUk5hTlgzQ3Vqc1RZUDQwcHlYSnhZT1hPNzh2dyQ+DQo+Pj4+Pg0KPj4+Pj4gU2hvdWxk
IHdlIHdyaXRlIGEgY3VzdG9tIHVucGFjayBydWxlIHRvIA0KPj4+Pj4gLS1leGNsdWRlPXJ1
c3RjLTEuODMuMC1zcmMvc3JjL2djYyA/DQo+Pj4+Pg0KPj4+PiBPciBqdXN0IGRlbGV0ZSB0
aGUgZGlyZWN0b3J5IGluIGEgZG9fdW5wYWNrIHBvc3RmdW5jPw0KPj4+DQo+Pj4gWWFzaCBo
YXMgMS44NCBtb3N0bHkgd29ya2luZyBhbmQNCj4+Pg0KPj4+IHdpbGwgYWRkIGEgcG9zdCB1
bnBhY2sgY2hhbmdlIHRvIHJtIC1yZiBydXN0Yy0xLjgzLjAtc3JjL3NyYy9nY2MNCj4+Pg0K
Pj4+Pg0KPj4+PiBPciB3YWl0IGZvciAxLjg1Pw0KPj4+DQo+Pj4gVGhpcyBsaWtlbHkgd29u
J3QgZ2V0IG1lcmdlZCB1bnRpbCBZUC01LjMuIFdlJ2xsIHNlZSBob3cgbG9uZyBpdCANCj4+
PiB0YWtlcyB0byBiZSByZWFkeSBmb3IgcmV2aWV3Lg0KPj4+DQo+Pj4NCj4+Pj4NCj4+Pj4g
VGhpcyBpcyBhbm5veWluZyAiYmxvYXQiIHdoaWNoIHdlIGF0IGxlYXN0IG5lZWQgdG8gaWRl
bnRpZnkgYW5kIA0KPj4+PiB3b3JrIG91dCBhIHBsYW4gZm9yLg0KPj4+Pj4NCj4+Pj4+DQo+
Pj4+Pg0KPj4+Pj4gTmV4dCB3ZWVrLCBJJ2xsIGFsc28gZGlnIGludG8gdGhlICd0bXAnIHVz
YWdlIGluY3JlYXNlIHRvIA0KPj4+Pj4gdW5kZXJzdGFuZCB3aGVyZSB0aGUgNSBHQiB0aGF0
IFJpY2hhcmQgcmVwb3J0ZWQgY29tZXMgZnJvbS4NCj4+Pj4+DQo+Pj4+IFNlZSBhYm92ZSwg
SSdtIGd1ZXNzaW5nIHNvIGl0IG5lZWRzIHRvIGJlIGNvbmZpcm1lZCBidXQuLi4NCj4+Pg0K
Pj4+DQo+Pj4gWWFzaGUsDQo+Pj4NCj4+PiBDYW4geW91IHJldmlldyB0aGUgcmVhc29uIGZv
ciB0aGUgRlNzcGFjZSB1c2FnZSBkaWZmZXJlbmNlIGJldHdlZW4gDQo+Pj4gMS44MiwgMS44
MyB3aGVuIHlvdSBoYXZlIHRpbWU/DQo+Pj4NCj4+DQo+PiBUaGUgZm9sbG93aW5nIGRpZmZl
cmVuY2VzIHdlcmUgc2VlbiB3aGVuIGNvbXBhcmVkIHRoZSBGUyB1c2FnZSANCj4+IGJldHdl
ZW4gdjEuODIgYW5kIHYxLjgzOg0KPj4NCj4+IEkgZGlkIGEgYmFzaWMgImJpdGJha2UgcnVz
dCIgYnVpbGQgKGluIHNlcGFyYXRlIGRpciBwYXRocykgdG8gY2hlY2sgDQo+PiB0aGUgZWZm
ZWN0IG9uIFlvY3RvIGJ1aWxkIEZTOg0KPj4NCj4+IFRoZSBUTVBESVIgRlMgdXNhZ2U6DQo+
Pg0KPj4gVE1ESVIgRlMgdXNhZ2UgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoMKgIMKgIHYxLjgyLjAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IA0KPj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqAgdjEuODMuMA0KPj4gZHUg
LXNoIHBva3kvYnVpbGQvdG1wLyDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgIMKgwqAgNjUgRyDCoMKgwqAgwqDCoMKgIMKgwqDCoCANCj4+IMKgwqDC
oCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqDCoCDCoMKgIDczIEcNCj4+IGR1IC1zaCAN
Cj4+IHBva3kvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9ydXN0LzEuOHgu
MC9ydXN0Yy0xLjh4LjAtc3JjLyANCj4+IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDC
oMKgwqAgwqDCoCDCoMKgIDkuOCBHIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgIDEyIEcNCj4+DQo+Pg0KPj4gSXQncyBtb3JlIDhHIGlu
IHYxLjgzLg0KPj4NCj4NCj4gVGhhbmtzIFlhc2ghDQo+DQo+IEl0J3MgYSBiaXQgb2RkIHRo
YXQgeW91IHNlZSBhbiA4RyBkaWZmIGFuZCBZUCBBQiBzYXcgNSBHQiBidXQgdGhhdCdzIA0K
PiBjbG9zZSBlbm91Z2ggZm9yIG5vdy4NCj4NCj4gUGxlYXNlIHJ1biB0aGUgc2FtZSBhbmFs
eXNpcyBmb3IgMS44NCB1cGRhdGUgYm90aCBiZWZvcmUgYW5kIGFmdGVyIA0KPiByZW1vdmlu
ZyB0aGUgc3JjL2djYyAuDQo+DQo+IFBsZWFzZSBzdW1tYXJpemUgdGhlIGRhdGEgZm9yIDEu
ODIsIDEuODMgYW5kIHRoZSB0d28gc2V0cyBvZiBkYXRhIGZvciANCj4gMS44NC4NCj4NCj4g
SSdkIGV4cGVjdCAxLjg0ICsgInJtIC1yZiBzcmMvZ2NjIiB0byBiZSBzb21ld2hhdCBsYXJn
ZXIgdGhhbiAxLjgyIGJ1dCANCj4gbXVjaCBzbWFsbGVyIHRoYW4gMS44My4NCj4NClRNRElS
IEZTIHVzYWdlIMKgwqDCoCDCoMKgwqAgwqDCoCB2MS44Mi4wwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqAgdjEuODMuMCDCoMKgwqAgDQogwqDCoMKgIMKg
wqAgdjEuODQuMMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
IHYxLjg0ICsgcm0gLXJmIHNyYy9nY2MNCmR1IC1zaCBwb2t5L2J1aWxkL3RtcC8gwqDCoMKg
IMKgwqDCoMKgwqAgNjUgR8KgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoMKgwqDCoCDCoMKgIDczIEcgDQogwqDCoMKgIMKgwqDCoCDCoMKgwqDCoMKgwqDCoCA3
MyBHwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNzIgRw0KDQpkdSAtc2jCoCBw
b2t5L2J1aWxkLy4uLzEuOHguMC9ydXN0Yy0xLjh4LjAtc3JjL8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgOS44IA0KR8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEyIEcgMTIgDQpHwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDExIEcNCg0KVGhlIHNpemUgb2YgVE1QRElSIGluY3JlYXNlZCBmcm9tIDY1
IEcgaW4gMS44MiB0byA3MyBHIGluIDEuODMgYW5kIA0KcmVtYWluZWQgc2FtZSBpbiAxLjg0
Lg0KQWZ0ZXIgcmVtb3ZpbmcgInNyYy9nY2MiKDEuMSBHKSB0aGUgc2l6ZSBpcyByZWR1Y2Vk
IHRvIDcyRy4NCg0KVGhhbmtzLA0KWWFzaC4NCg0KPg0KPiAuLi9SYW5keQ0KPg0KPg0KPj4N
Cj4+IFRoZSBtYWluIHJlYXNvbiBmb3IgRlMgdXN1YWdlIGRpZmZlcmVuY2VzIGluIHYxLjgz
IGFyZToNCj4+IDEuIEFkZGl0aW9uIG9mIGdjYyAgfjEuMSBHLjIuIFRoZSBhZGRpdGlvbiBv
ZiBlbnp5bWUgQUQgc3ViIG1vZHVsZSB+MzkyIE1iLg0KPj4NCj4+IFJlZmVyZW5jZXM6DQo+
PiBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL3J1c3QvY29tbWl0LzkwMjgxNzcxMTU3
MThiMzhjMGExODljNGZiOWVkYTAzYTE0ODQxZDcNCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9y
dXN0LWxhbmcvcnVzdC9pc3N1ZXMvMTI0NTA5DQo+PiBodHRwczovL2dpdGh1Yi5jb20vcnVz
dC1sYW5nL3J1c3QvcHVsbC8xMjkxNzUgDQo+PiBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1s
YW5nL3J1c3QvY29tbWl0LzU5ZDQxMTRiMmQxYWFhYzlhNmRmZTc3MDk5N2YyZTc5Y2NmZDI4
YWINCj4+DQo+Pg0KPj4gRGlyDQo+PiAJMS44Mi4wDQo+PiAJMS44My4wDQo+PiAJRGlmZg0K
Pj4gcnVzdGMtMS44eC4wLXNyYy50YXIueHoNCj4+IAkyMTBNYg0KPj4gCTMzOE1iDQo+PiAJ
MTI4TWINCj4+IHJ1c3RjLTEuOHguMC1zcmMNCj4+IAkzLjVHDQo+PiAJNC44Rw0KPj4gCTEu
M0cNCj4+DQo+PiAoUFM6IFBsZWFzZSBpZ25vcmUgdGhlIHByZXZpb3VzIG1haWwuKQ0KPj4N
Cj4+IFJlZ2FyZHMsDQo+PiBZYXNoDQo+Pj4NCj4+Pg0KPj4+IC4uL1JhbmR5DQo+Pj4NCj4+
Pg0KPj4+DQo+Pj4NCj4+Pj4NCj4+Pj4gQ2hlZXJzLA0KPj4+Pg0KPj4+PiBSaWNoYXJkDQo+
Pj4+DQo+Pj4+DQo+Pj4NCj4+PiAtLSANCj4+PiAjIFJhbmR5IE1hY0xlb2QNCj4+PiAjIFdp
bmQgUml2ZXIgTGludXgNCj4NCj4NCj4gLS0gDQo+ICMgUmFuZHkgTWFjTGVvZA0KPiAjIFdp
bmQgUml2ZXIgTGludXgNCg0KLS0gDQpSZWdhcmRzLA0KWWFzaCBTaGluZGUNCg==
--------------46cFzvx5owk5HxGGtBhN4www
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52EBHMZ9018256

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 14-03-2025 19:18, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:70820f45-41b1-487b-ac53-1e49ef5=
7fd5f@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2025-03-14 8:52 a.m., Yash Shinde
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:a82ea56c-dc36-4784-a6cd-33d97=
014bdbe@windriver.com">
        <p><br>
        </p>
        <div class=3D"moz-cite-prefix">On 14-03-2025 00:18, Randy MacLeod
          wrote:<br>
        </div>
        <blockquote type=3D"cite" cite=3D"mid:03997060-1f1c-4784-af57-bb8=
3b0514ebb@windriver.com">
          <div class=3D"moz-cite-prefix">On 2025-03-07 6:37 p.m., Richard
            Purdie wrote:<br>
          </div>
          <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df54=
18b42b936d5416b.camel@linuxfoundation.org">
            <style>pre,code,address {
  margin: 0px;
}h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}</style>
            <div>On Fri, 2025-03-07 at 16:02 -0500, Randy MacLeod wrote:<=
/div>
            <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex">
              <div> </div>
              <div class=3D"moz-cite-prefix">=E2=9D=AF for i in `ls -d *s=
rc`; do
                du -sh $i; done</div>
              <p> 3.5G&nbsp;&nbsp;&nbsp; rustc-1.82.0-src<br>
                4.8G&nbsp;&nbsp;&nbsp; rustc-1.83.0-src<br>
                4.9G&nbsp;&nbsp;&nbsp; rustc-1.84.0-src<br>
                3.9G&nbsp;&nbsp;&nbsp; rustc-1.85.0-src<br>
              </p>
              <div> </div>
              <p>I didn't check for the other 4 GB yet...</p>
              <div> </div>
              <p><br>
              </p>
            </blockquote>
            <div>rust, rust-native, nativesdk-rust, cargo and so on.</div=
>
            <div><br>
            </div>
            <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex">
              <p>Should we do that an host the tarball&nbsp; on <a href=3D=
"https://urldefense.com/v3/__http://yoctoproject.org?__;!!AjveYdw8EvQ!fJX=
JLq5zUX_ORAdT0imsy5PfIAHVBjw3rwJRpJH0HgmwRJiTyMFIQebHf7jG9o_l7GKu06t9zK2R=
NaNX3CujsTYP40pyXJxYOXO78vw$" moz-do-not-send=3D"true">yoctoproject.org?<=
/a></p>
              <p> Should we write a custom unpack rule to
                --exclude=3Drustc-1.83.0-src/src/gcc ?<br>
              </p>
            </blockquote>
            <div>Or just delete the directory in a do_unpack postfunc?</d=
iv>
          </blockquote>
          <p>Yash has 1.84 mostly working and&nbsp;</p>
          <p>will add a post unpack change to rm -rf
            rustc-1.83.0-src/src/gcc</p>
          <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df54=
18b42b936d5416b.camel@linuxfoundation.org">
            <div><br>
            </div>
            <div>Or wait for 1.85?</div>
          </blockquote>
          <p>This likely won't get merged until YP-5.3. We'll see how
            long it takes to be ready for review.</p>
          <p><br>
          </p>
          <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df54=
18b42b936d5416b.camel@linuxfoundation.org">
            <div><br>
            </div>
            <div>This is annoying &quot;bloat&quot; which we at least nee=
d to
              identify and work out a plan for.</div>
            <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex">
              <p><br>
                <br>
                Next week, I'll also dig into the 'tmp' usage increase
                to understand where the 5 GB that Richard reported comes
                from.<br>
              </p>
            </blockquote>
            <div>See above, I'm guessing so it needs to be confirmed
              but...</div>
          </blockquote>
          <p><br>
          </p>
          <p>Yashe, <br>
            <br>
            Can you review the reason for the FSspace usage difference
            between 1.82, 1.83 when you have time?</p>
        </blockquote>
        <br>
        <p>The following differences were seen when compared the FS
          usage between v1.82 and v1.83:<br>
          <br>
          I did a basic &quot;bitbake rust&quot; build (in separate dir p=
aths) to
          check the effect on Yocto build FS:<br>
          <br>
          The TMPDIR FS usage:<br>
          <br>
          TMDIR FS usage&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nb=
sp; v1.82.0&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp; v1.83.0<br>
          du -sh poky/build/tmp/&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nb=
sp; 65 G&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 73 G<br>
          du -sh&nbsp;
          poky/build/tmp/work/core2-64-poky-linux/rust/1.8x.0/rustc-1.8x.=
0-src/&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 9.8 G&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp; 12 G<br>
          <br>
          <br>
          It's more 8G in v1.83.</p>
      </blockquote>
      <p><br>
      </p>
      <p>Thanks Yash!</p>
      <p>It's a bit odd that you see an 8G diff and YP AB saw 5 GB but
        that's close enough for now.</p>
      <p>Please run the same analysis for 1.84 update both before and
        after removing the src/gcc .</p>
      <p> Please summarize the data for 1.82, 1.83 and the two sets of
        data for 1.84.<br>
        <br>
        I'd expect 1.84 + &quot;rm -rf src/gcc&quot; to be somewhat large=
r than
        1.82 but much smaller than 1.83.<br>
      </p>
    </blockquote>
    <p>TMDIR FS usage&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; v1.82.0&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; v1.83.0&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; v1.84.0&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; v1.84 + rm -rf src/gcc<br>
      du -sh poky/build/tmp/&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;
      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65 G&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 73 G&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 73 G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 72
      G<br>
    </p>
    <p>du -sh&nbsp; poky/build/../1.8x.0/rustc-1.8x.0-src/&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9.8
      G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12 G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;
      12 G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11 G<br>
      <br>
      The size of TMPDIR increased from 65 G in 1.82 to 73 G in 1.83 and
      remained same in 1.84.<br>
      After removing &quot;src/gcc&quot;(1.1 G) the size is reduced to 72=
G.<br>
    </p>
    <p>Thanks,<br>
      Yash.</p>
    <blockquote type=3D"cite" cite=3D"mid:70820f45-41b1-487b-ac53-1e49ef5=
7fd5f@windriver.com"><br>
      <p>../Randy</p>
      <p><br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:a82ea56c-dc36-4784-a6cd-33d97=
014bdbe@windriver.com">
        <p><br>
        </p>
        <pre>The main reason for FS usuage differences in v1.83 are:
1. Addition of gcc  ~1.1 G.2. The addition of enzyme AD sub module ~392 M=
b.

References:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/commit/9028177115718b38c0a189c4fb9eda03a14841d7" moz-do-not-send=3D"t=
rue">https://github.com/rust-lang/rust/commit/9028177115718b38c0a189c4fb9=
eda03a14841d7</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/issues/124509" moz-do-not-send=3D"true">https://github.com/rust-lang/=
rust/issues/124509</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/pull/129175" moz-do-not-send=3D"true">https://github.com/rust-lang/ru=
st/pull/129175</a>=20
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/commit/59d4114b2d1aaac9a6dfe770997f2e79ccfd28ab" moz-do-not-send=3D"t=
rue">https://github.com/rust-lang/rust/commit/59d4114b2d1aaac9a6dfe770997=
f2e79ccfd28ab</a></pre>
        <p><br>
        </p>
        <p> </p>
        <table cellpadding=3D"2" cellspacing=3D"2" border=3D"2" width=3D"=
714" height=3D"118">
          <tbody>
            <tr>
              <td valign=3D"top" align=3D"center">Dir<br>
              </td>
              <td valign=3D"top" align=3D"center">1.82.0<br>
              </td>
              <td valign=3D"top" align=3D"center">1.83.0<br>
              </td>
              <td valign=3D"top" align=3D"center">Diff <br>
              </td>
            </tr>
            <tr>
              <td valign=3D"top" align=3D"center">rustc-1.8x.0-src.tar.xz=
<br>
              </td>
              <td valign=3D"top" align=3D"center">210Mb<br>
              </td>
              <td valign=3D"top" align=3D"center">338Mb<br>
              </td>
              <td valign=3D"top" align=3D"center">128Mb<br>
              </td>
            </tr>
            <tr>
              <td valign=3D"top" align=3D"center">rustc-1.8x.0-src<br>
              </td>
              <td valign=3D"top" align=3D"center">3.5G<br>
              </td>
              <td valign=3D"top" align=3D"center">4.8G<br>
              </td>
              <td valign=3D"top" align=3D"center">1.3G<br>
              </td>
            </tr>
          </tbody>
        </table>
        <pre>(PS: Please ignore the previous mail.)
</pre>
        <br>
        Regards,<br>
        Yash<br>
        <blockquote type=3D"cite" cite=3D"mid:03997060-1f1c-4784-af57-bb8=
3b0514ebb@windriver.com">
          <p><br>
          </p>
          <p>../Randy</p>
          <p><br>
          </p>
          <p><br>
          </p>
          <p><br>
          </p>
          <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df54=
18b42b936d5416b.camel@linuxfoundation.org">
            <div><br>
            </div>
            <div>Cheers,</div>
            <div><br>
            </div>
            <div>Richard</div>
            <div><br>
            </div>
            <div><span><br>
              </span></div>
          </blockquote>
          <p><br>
          </p>
          <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
        </blockquote>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Yash Shinde</pre>
  </body>
</html>

--------------46cFzvx5owk5HxGGtBhN4www--

