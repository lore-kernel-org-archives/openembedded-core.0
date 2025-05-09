Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC5AC3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 14:04:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15775.1746799459770840033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 07:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7224021966=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5495WCpI030450
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 14:04:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430pknh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 14:04:18 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 549E4In6024157;
	Fri, 9 May 2025 14:04:18 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430pkng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 14:04:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzLTlKfDUSU4KKfzKabf4aAp+yfVh99Z+4lysrv4dkDtL89KTfyrPoJBNFFi7JDPhNiBvzSBybML18ziGW22HLWiU3WGEc4r/ucMYQlUPAeKumBXFcwmze7eQrAO3X06JVZjJear6wBkRRVRFj2+5z/PpW4BITf99+p0hsJsdh40gNWaEC87jum0RWU6a2/2t34Y3veFyhaVDKf2LyH/N+uu896HgOape6KA2QzLZyABjPNiiOE+vjZlK2xubVBZMZwyXonb8HEAjQGtfRO69s/DkqYohRypY6Z/AKwO55c0Hc58cyWoBjm70z4BtqWwqmYJra8Nc+wlJf2N6JpXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BBWBOV0RNBgBYxr2RK8t4IyFXqYptvm0b1NQxQFXK4=;
 b=XfYyxneJw84qtLsvP8Y7eFU5RzejzOCKxbX+gBLJvP/d7Dy4EbgK01yS1SuyJxKsQuTpv7GUwq68S1ffZSQSL7MXIS80qW+aA4yNh+mR9VCP+xh+WmsYkFAmOMfmZARjPI7sJRd7A5K6n1AFivJfW2fjwMi11k8d1ZqIbIHQomidLzqFTd7PS0OLRhfQczYh8Tr1/0gySGiy3AbKSxMJ/TALHNec+ZJsoq74aCo9pBCDkGE7rsSiUkDXjUcVUzxykFd66/cZFm40fNwlExeavZ+Ri8IywICieOrwXaguEkjcNDf8r5IKVROG6R5clnxIShTH8VjTBp99N8zVrDRx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 14:04:15 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 14:04:15 +0000
Message-ID: <7441663f-95fd-4004-9402-8d4e11dfd540@windriver.com>
Date: Fri, 9 May 2025 22:04:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] openssl: add fips support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250509093740.1367372-1-yi.zhao@windriver.com>
 <CANNYZj8+SvOzz7D0a_sEi81vhi3up699eYoJ1pgBsW0xMHuhog@mail.gmail.com>
 <b7826686-6580-41ea-bc93-89a28798d7fd@windriver.com>
 <CANNYZj-pfxvDHcHwtCePMp4VZCyKFo-oCz_3dv9_rEcvOrC_OA@mail.gmail.com>
 <5ecd3be7-de58-450d-8941-fd87769684c3@windriver.com>
 <CANNYZj_pz+p7aCQbfyt4gVGgM+eRyuKW0yVN1iOZheRBZ-wiAQ@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANNYZj_pz+p7aCQbfyt4gVGgM+eRyuKW0yVN1iOZheRBZ-wiAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:405:4::21) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 443f2cf5-038c-4d79-7314-08dd8f0261c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L1lDTTlrMTVVWENPVTJEOTFDVVY4c0FtYWtod2lPWmJBY1JTVUY0R3JNMTMy?=
 =?utf-8?B?VGtjQnYzQ1lRNUErRDVLbTdZS0NRUUJQVnVIM2Iyb2xwdDUzdHhJaTgwb1hh?=
 =?utf-8?B?VHluQktmNXVrN0YrMHVpYzJWUkdIWXRpdTZ4ZzV5Z0RKKzVaVG0zdFNBZEEy?=
 =?utf-8?B?TDhWY3FtUVN3K0NrMGx6R1hZZkNpSkR2by9DSVhNYzA0MHpXemhselFLM3Mx?=
 =?utf-8?B?N3MwTml1Q1JjRktzVlNrNFJFWXE1RDhVQjhUc0JoQWpWeHNLaDVmVGRwaFdj?=
 =?utf-8?B?dzB1NWd3elBXK3RlRyszSGRLSjl0blZpUVpSbzNKYlVMZmFQN1RFUkQ2S1g0?=
 =?utf-8?B?TFpPNzNZb2RkeW1GV1RaZ2szdG1adFI5UVU5eDY4OHU3d0RBNjh5aVpWWEhp?=
 =?utf-8?B?cE9DSUJBQ1NpdUg3cnNTZEltZ01wMmlEL01VMTBFUGt4TURoUjlUNDBESmNN?=
 =?utf-8?B?SnYyYml3UloxRVlabUN1QzhGZFZ4cWpKTzdlQXMremlDVG1zanZUWW5sSjRS?=
 =?utf-8?B?ekhsc0xJRGViNERBaUZURW1CUzVxTTluQ0dYS1BHT0NVdUNyeEdZVUhjQXVp?=
 =?utf-8?B?M1VRQTV2RUdEOEtRdWJVM0crck5HT2Nialh0M3NYWHhiVHFmWGdtMHJDbWZD?=
 =?utf-8?B?cUl5NlhUSG0zS1BJVlhkMHZaTDVFN0Z2cDNDYU12K1hKLzBVK1FXdTV4Qmc4?=
 =?utf-8?B?ZDd2aUxHM0VVcnIva2h0T0xrdTlpUlpDMjQ5aVRWVmJtRzNFL25wd3BzMEMv?=
 =?utf-8?B?OG14UjliZHJvU3NGN0R2QnpzQis4V1VoWVMxZDlBQUZpenIwbEF2OVFaSEFQ?=
 =?utf-8?B?QXBOU3kzbGIydWFJTlhPdUMyaVJla21TMVhFZ3hseldnbTBDcTRleUFaOFBO?=
 =?utf-8?B?Sng5N09LZ3FzM2sxaTFCNFVWbU9ubTYwclJBdHQwRjV0TGRkOCtEUTlzemp0?=
 =?utf-8?B?Y0paM1llNGVCdG9EUGhUTkVWUFlaaUFKOXBGU3BDaktIazgxWlJvbEdZMzFn?=
 =?utf-8?B?YzJZdGRLbGg1R2dkVHl1eG85VGNsK3p0bXpQRlBIK20yRXpxZkRBSERUWDhR?=
 =?utf-8?B?UVN2YW9jYnNqYWhvNDZ2SXBjQ3dIdzdMRHEwd1l3UGpJazF6eTduMCt2Szll?=
 =?utf-8?B?dWFPRUVlUTdPbnduMFB4T0poWmMwSndpU2JnT2Q5aWlMS2V6TUJOSUtqYWh6?=
 =?utf-8?B?ZTB3VXhLeDBWVjJ2amVZdmx2Nlp0UEpZK3NZUzRod2plOGo3L1BxMnVjMm1W?=
 =?utf-8?B?MS9Dd0NTSzRPcG1qd0dTWk9wRGZYUUptd2daV0JTWlBNYXAzclVXcEptUzM5?=
 =?utf-8?B?ZUlJei92REdEYXhvYnNxZTZ1SU9TcWFud3ZJUDdOb1BZdWloRVBiWWp3Nys2?=
 =?utf-8?B?UUllUE9paHArQk41c2RsR2lENkxCZ094ditYdE5sUkd1elpFeGNURFhPZDdI?=
 =?utf-8?B?ZkZBWXVwUTZlWWdOZk9QM0RkZTZNME9Zenk2L2FnK1VkVzUxa1hoM3ZtQVRk?=
 =?utf-8?B?ejNta0ZTQ2RBa1dBYWFPc2dUbURiaWtMdit5VWdWY1gwQWRZZ1ZJZkR0SVRY?=
 =?utf-8?B?TmowSmxqNFVId2ZDNlJTbXlYUXFzdDlpVnFuL3ErRDZzU0dvUG8vdDlLaGds?=
 =?utf-8?B?bXBzekZVMXRCVGFxcVEvNjBSVlE1b2prWmZkNkxLNjJ1eDZTN3ZTZkUxeTBj?=
 =?utf-8?B?VDVOUVRqei9PQUo2b0doeDMrMTNEakx4NEoxZFc2YzVGdVdxZGtWTllRM0p3?=
 =?utf-8?B?TGI4Y0ZldnVKZDlrQWR3WmZpMlNQbmc2dWN4cDNWQUNPRUVheTEyODBDT0Rr?=
 =?utf-8?B?MlZZRTc4eWlsWUVyL0RlZFRMRC9JV05MRkZqalZwd3A1akgweEpjNGdUQ3hv?=
 =?utf-8?B?V2x1WC9Ea25EWkRqUUp3Nnh2Z3cvVTliOVdGZzFDQnZEaDNmcW9oNWtLaEF1?=
 =?utf-8?Q?zIurguraPSI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OG5ZVVh4ZlBqZnBxeXpXanFrTlBVbnZYS0QxcitpdHd3cVFFeSs5L29jbGhJ?=
 =?utf-8?B?Yk5yUzVzRnppalVzVTVaZ0dLb2pOUktTdk9jSEovQnFPUFJZZjkvR1RUbVhE?=
 =?utf-8?B?cHNyZ3dCbkFLaGl0alZTTlFhQ3VvQUNnNnlhSkZhOHRjT0tlVmlxV2FuMmNm?=
 =?utf-8?B?YUJ0QVRKaVVZd05MTWtpT2dhZTdxM0hMVVV1dXpKS1lpV0FpME9vUmxndzcz?=
 =?utf-8?B?aE14TWxMQU5iRlRsZHNEVkplVS81RHRMWlZadlFRRDByUDhvZ1dNdW1lVUFs?=
 =?utf-8?B?VUhBOEVHczE0KytRbzhiam44YlpWNlhHalJOUWxPUnpXdUMzcyt5TFpvcmFB?=
 =?utf-8?B?RTNpZzVoT3M1cFVsVVZHL2JRTU56blhXTVRRd0ppa0VPM2xiWGU2OTFrR0Ni?=
 =?utf-8?B?WTJ5UVl2NDR0UG9oZDdEMnVtemsybTZnUWk3NEdQbjVGUEhhcU00UGxLcWlV?=
 =?utf-8?B?aUZvakExN0hnNzBBUWRFV2RUVEpTZUFWWFZ4M0FIRFo3Z1BIMEhZOTdhMThY?=
 =?utf-8?B?Tyt6UTVYLzNYQXRTMHp5VjBwWXprakpTNEdYa21qOXdySFhvVDNxRWNpTFV3?=
 =?utf-8?B?Q3kxZy9iQTVGK1VRNDJGMlRoZVdkMVBwRDdqdkcvRGpUZmFjQk9qUG9YMTVK?=
 =?utf-8?B?OGUxSkRkTkFNTHE3WVVBeDE0a2FydmZuSjlrOGRoMDlKM1pVcUpkVVFQVTBB?=
 =?utf-8?B?ZTJBOVpBQTg0ZkcvY20zVFFYbkdvNnozMDQ1ZjNnYUxjUHg0b3BHRlZaSXB6?=
 =?utf-8?B?VlY4TGZEYTlma0ZVekNqejhEQVZDZUhMOThRdU5rR1BoQ2hvRWtJMDB1Skto?=
 =?utf-8?B?UUhodlVlY0lMcGQvUlJCS2pnSXNSbTVxTGwvMXhIK2VlV2xwN0crTzVySUFr?=
 =?utf-8?B?T01HMnVBa3RUL0NZQjMrQUFPelBOcUxrVC80YVF3L0dNZ3h5U2RFbVM3VS8z?=
 =?utf-8?B?dmFtK0FVOC8rMThIOXE3Rm1LWW9QSjJIZEo3TVRlSW4xc0t5VUFwdkV1NWxK?=
 =?utf-8?B?c0xqSjJHT05oYmFESWp1YXRsdG1jUFJlK3JYaTkyOVc4T0hud0RpWW01RU80?=
 =?utf-8?B?OWNhU0Y3ZDhxZ1NuOGxnWG5teDh5bms3d0lsOGxxTWI0enkySWtRZjZ4cGc1?=
 =?utf-8?B?TGV1eWh5T0Zyc25QVG8zVW5nNFN6TW5sNSt6V1lMYWJCdlRZUkp6RlFQTnhm?=
 =?utf-8?B?REpyMHNaTHBSaExLZGNFOUx5dU5kdUU1SFh5Q293d1BPUkIvTG9QbHByUW9D?=
 =?utf-8?B?QzNKVDBBYkQyZE9MSlZ0Y1BNeVRyYXEvaTg3ZzVlRmVyTnBDUEg2S1dNNGdr?=
 =?utf-8?B?N1k4SWRaYk10Z1YzQ1E5UVgzQVN0MzEyZmlCYjhVWUx6Q1ZKNU9pMlVBQldB?=
 =?utf-8?B?aitCN0VtbjBCamNjc2tuWmQxdGMzZFB3cWlRMHd4bmo4UjhUcDRNcE5YY0hJ?=
 =?utf-8?B?eEJDZEtZQmpMWWlzdDFyTFg1MUZkR2d2ODh3VmFUNlFrT1NqRjFIWHZRU21E?=
 =?utf-8?B?bi85eENieHE1MTRLTW1pcnl3U3p4VE9ZdlRKMnNOV3FYaUxVcmw2S2dyaWJj?=
 =?utf-8?B?ZWV4Y2Y3cEE4MGhtM0sxb2VrMlFnWkdvdkZoWGtOUmxWQ3VuMkhqN1JDc05V?=
 =?utf-8?B?YzBXRXo4Z0ZnL1lVanJ2ekU1cWtMdkFEM015aWxJZFFPUzBHNWtJS2xXTzlS?=
 =?utf-8?B?cFV4Mk5peVBOblFGRGlWV1hIRWxqV2hseUxkQkwyQ21YdlhPdHVwdHBmaFBr?=
 =?utf-8?B?dkh2a3Z6NDZVd1RzMzhNOW1BdFpwTTNjL3ZpRVJGTFc2QlAxSXNSMzJrOVJQ?=
 =?utf-8?B?L2tPdE5CL2s1cVVvT1FxR3BqK0hjY0N3VktLRHE0d3d3QmZHV1VnSzI4WXlx?=
 =?utf-8?B?WjU4WGpJY1BHU1ZtdGpwbWxsM2xaNitqYU85bitQcGtEaDU5eXBtNEs4NGl6?=
 =?utf-8?B?YVU1UkF6SGV2cGVoMnhBUllVLzlMazlNcjJoVmtKTGM1RC85b3k5dzU1U2Rs?=
 =?utf-8?B?Q01tR0hHK0ZVdnRKaFZwVEVra3dIMGFxVklKU1d1U1BqTjIzeUxSUTF0anNS?=
 =?utf-8?B?SVNlSzhLbVY2bEhyUlc4Ri90cyt0Wll5L0FIeTZRaUx3bUFvYkgwZG1ubWgz?=
 =?utf-8?Q?4MNBAGimFMYs1+4oQ5h63n6zf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443f2cf5-038c-4d79-7314-08dd8f0261c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 14:04:15.2040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGH/vEsp3b/nfpO95Q8Rz+4VAMpVODOVcy6Jq2TGuW4KULsAAW7GiLoI3aZp9gpfEQOwy/HufU/P+W4bt49bNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681e0b62 cx=c_pps a=dbfzVNK0jQbpEhEqKt7tuQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=mca00sUqe_gciyrRGUUA:9 a=QEXdDO2ut3YA:10 a=tu8dij1calsA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YP_Us0TsZ9FgkybWoh5NcNeubYi-HhDz
X-Proofpoint-ORIG-GUID: L8I-qQlTetA30Ehnh2LL6t6Yrzethft8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzNyBTYWx0ZWRfXyf2n4hGjj9mF AKn/3HT425aiRYd6oQfoq7ND76nWBh/Ekpj2pFVNargrsYMRB3B6acEj5ei+JUP11oJCTUtyyYU pM7qL9WG+HmcHdUu36R1zkTbYZhtoXT7Axd9E9JeadLrDBKVtnn+fdA2cqIn8sM98wESYwH9R6s
 1LPMkNODN3yU26Sddh0M9BiI81rsDs9mirw5rDeYoCF07BFRL6qdK+wBQmFSihp/J16EE2r1WFU yl+lM3CrI5WgaJag8dnNQG0gOMDD1QM1wOhsICRuwyiT7KWvCwUJbPldqa+LOKWUV5wB45Ock3v 276IhQzF8G0r9CD5r/+j0qdKXCW05fNNOPNrVB+dW7YcOOhgWmN8qSerGy0XajMzpRR90pq07F3
 VVqVxV36XBgk86fTX5jKBK+ef2M37XTlt8P36pcSIKZzm+ltOC3l07pdmyk/lO45NI7YXjkl
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 14:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216206


On 5/9/25 21:44, Alexander Kanavin wrote:
> On Fri, 9 May 2025 at 15:17, Yi Zhao <yi.zhao@windriver.com> wrote:
>> The original file is generated by util/mk-fipsmodule-cnf.pl during build.
> Thanks. It's a little odd that this script is not using 'openssl
> fipsinstall', but rather seems to be writing out a hardcoded config:
> https://github.com/openssl/openssl/blob/master/util/mk-fipsmodule-cnf.pl
>
> Otherwise looks fine -  you can send a v2 with the information
> provided in responses to questions added to the commit message.

Thanks, I will send V2.


//Yi


>
> Alex

