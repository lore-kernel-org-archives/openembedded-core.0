Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34905C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 08:35:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.61251.1742891716692635110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 01:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51793d335a=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5UKRM014877
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 01:35:15 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg42v2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 01:35:13 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52P8VHmi022276
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 01:35:13 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg42v28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 01:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skWs7X6+KcROFDF5LfRpbI87K1uPBeirJLElF8Tt4PaVvUF0Nju0IaqozH6FXgHJO7jiPDGik+dLkN5tlsWGqWb4rTdgaByZL7vhpeX+smnmjp9fKyesZHQM2IZn43SiCf6Rhv5IBN/kw3b2rQF+CgvOAW2ClCThG1C4hbCuHqx1UJ4NOx12xocIPGGxrkGJVKVH4zui7Vf+il3QAPy19XnJgacX/IhgxV7cqeTB4PHrXkYAlX3x0r58HIPurMr+vX9Bj90A70Vt1Eo3t0NaBJlllt1cIh7b4QtaZKOrvvH8P+i+YMxKSapz7X3Zo58iC47k8tUNQlfMMQ34aaauyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRbqZZ9sV75MgOGqFNR6qOshc0a/DU6OcCRir6ZN5os=;
 b=y1IhDDuS3kw/CUDhxjuDbYkwSN62/FX7yuTrN6r8kx418nlPgrn9T2s7npqqQo7CybckkQpTIj3EWfRR620d7UNSTYO5jKzoV/fTqaedC0YTuMZN223srzXwImYOe+m3mcTeTsDS41TlGqf6dfVqrkBnXa8tn18SWu4O3nJhXzNMfu3L4fiY85hfzPeceNOeX3eAEfcgX4D+YsOPqMHfEHAjgphkbg1UT0BSpnJlHQkBRq1339fjCvQ+ItYERH5ozDGEyQMHM0cRzz3ZUz7RD7tMjBUScGuPQO8L6kR7YKJTCVzgBxrA1/+UD3OPZxflSrKPqWZVJePIBnQ/wgB3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 08:35:09 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 08:35:08 +0000
Message-ID: <4004d896-bfce-4184-ab8e-88997ac5cc7d@windriver.com>
Date: Tue, 25 Mar 2025 14:05:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] rust: Fix build failure when multilibs are
 enabled
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        alex.kanavin@gmail.com
References: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
 <20250321132502.2607941-2-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_5kjhg3WPi7E-UxYX2yFXw-KFpR0gdExet79uG-Xin_A@mail.gmail.com>
 <6b60bdbd-8095-432f-b3fe-37057b1cb086@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <6b60bdbd-8095-432f-b3fe-37057b1cb086@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:510:323::21) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH8PR11MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: f33132c6-704f-47d7-9b7c-08dd6b77f337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjgxaldSS2xBMlNmbG5jczR0dDcwc2JQdU9OcFNRRUVhYnQxNVNITmFJZlZJ?=
 =?utf-8?B?b24yWHV4Q1h4T2dqaGM1UjZhbmFZb2ljV0RyOWlzbkF4amoweHJkRy9wUndR?=
 =?utf-8?B?U2liSmVJN1QwL21pbVU2dUlGNlE2R1YyQzdVbjVtZHpzU1c5eDVrekY4c004?=
 =?utf-8?B?Vm5OUFN5c3NZZ2tHVXJKU3BUL291dGtFQ0hMbWRKcm9wSHl2V2lPYWFSRVp2?=
 =?utf-8?B?bzloUlhxbGpmNWRzVWpacFpncUY0eGd1eFJiVURoclVaaDhlQlc1Tk5lS0Ns?=
 =?utf-8?B?dG1EWGprK1YxS3dIcTUrMUpqaW9Tams4dmtZTk5INmJ1TlJQbnJwcSsrYnhZ?=
 =?utf-8?B?SmNqaTBmdlhLLzFKQnBYaDN5VGREamF4MkQyaFJyN1Z0ZDBOMytLYXpkdlJu?=
 =?utf-8?B?eDdiVFB0QXkxbUJiTzFDbjI4dkZFNjV3OWl0WFRFVzRzL2lBSHpaUHB5dmJZ?=
 =?utf-8?B?QXpmWEFodTdDTjgzU3hacGI5ZEVoTFFaV0JaODFOdlFlRkF1REp4QnhhTXlm?=
 =?utf-8?B?MEFxRG41Vjc0a29mVERQOVV5WnpaL1RacGhSc25iaklRZjhCUXJDVTd1bFNN?=
 =?utf-8?B?QkxCRmdETzczN1Z1NmN3bHg4Vi9TeUJxUDFtaXdoSTMrZ3NjUlVYTUhqR09N?=
 =?utf-8?B?SG9KaWhMZWtnTm1nZVdBNXl6RWZaRmg2SUlyNkp4cVJoclNOV0JVNVBUVkVR?=
 =?utf-8?B?WEMwV1FYc1M0QkNGV0lwZ2FGR3RIbXZONDJybmRpWHBoWmU4YUxoaXpneEov?=
 =?utf-8?B?YTFVeW0xaUI2SHd3VGhydFlFR05sZ2dsbkNjenhGaXdSaFd1cnhkZ0NHR1JR?=
 =?utf-8?B?bmtkRVRkMVc2cjFpRXJqK29vYUF5akdneWFHNTFBQzF2Z3UrbkNJaHJTRmNP?=
 =?utf-8?B?U20zQnJ0RFFuTlBJOXV4b1NqWjBkY1RUMWIrMGZsRjZEb09EZTF5eVdFbzBm?=
 =?utf-8?B?V3VJeDVFd3dqMmhIOG9WM0s0RHR2eithcE5DaC9YaC9SSGM1dDZVeXdoY1F2?=
 =?utf-8?B?cDRmTFRaQU5yaW00MW1CRitTV3VsWmNINStzU2pBcEZXS2U5VTlpaXJJTHc3?=
 =?utf-8?B?dmhMTmMrUDk1cGdpMUtQZ3ZMMHM4bzA2cmpQK1d1NVBONXc4KzRmS2s0aGlV?=
 =?utf-8?B?SWdhUXBaU004MXJrMm1iTHMyeE1xSVVXTC82d1p1dWtJWUIvdm1lTWRzZ2JL?=
 =?utf-8?B?eURWZHpDRDlCZ2tiNytBRkxobVhUNG53dXVOdCtsM1ZLQk9DVWRGRDRoZlBK?=
 =?utf-8?B?NFE0QW9sOGpCSHdQdUtDSXRSZ1VFSlhqeHA2dDkvS3FLaWM5NzI0S2pDaWdO?=
 =?utf-8?B?SHUwbmZQckJiU2pUWENSNXUySGZXZ3NSUUlJbS9ZVWxrcHRqdXNqYUR5eHhp?=
 =?utf-8?B?Rk1WcjhhbTJyR1ljRnduODJTNUxZQStQSVVMNkVFUVNHU1FEa1dxVllFdWdp?=
 =?utf-8?B?TGZPc01rUnFFSEt3WFVSQ2lDT1BFZU9abm5naHBRMlpzWFJCMmx1RTJud0RP?=
 =?utf-8?B?TEtlajJ1TlVsMSt1dE5rTENpakxZeDZzQkM3RkhQNWhWVTEzMTdncldNcktS?=
 =?utf-8?B?SUNPdHVCbGE4enBOUVk4T28vekN2MHl5c2habGJESGVNZUFsaFRUMTliSVA0?=
 =?utf-8?B?VnV1Wm12K1dmUGVQcTBHYVZjK1E1RlJQS3VYL01aenZQWXJKZFJad25TRGVv?=
 =?utf-8?B?Nms0alhweS9WaENHakJLWkZUT21xVEU5cjIxK1RIY3F5dDZ3bWQ1V0Z0OFBn?=
 =?utf-8?B?ZzYvYjEvc0hMTzg2cUp5aEdnT2t0WHlXYlFub2syNmQxK205R1J2SUxDMnI4?=
 =?utf-8?B?VE1SR1c1ays3SWJLRjZFVjlkRnA2a242SzNPdkNKSmU2c3p5M2VieE5WVG5F?=
 =?utf-8?Q?zLxRKStsCUZhQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NU5HS1JPM1MzQkZCS3p6citZa2s4cG1FUGtQbnZnQU0yQVlma0ROMDRiOHRx?=
 =?utf-8?B?RkRsUUdmdkhZVHpzb3lKVkJtRTRJb1ZxVHRPd3BHM241ZWRKUHRMdnBwQTJw?=
 =?utf-8?B?UkVRZGFiUExEaUFNSXUvZTJETkxuSUh2dCtKTjJ2TWFoMXo3aWJXSVBoUy9X?=
 =?utf-8?B?YnI5dDVlRkgzZU9FaUI2MkFyT20yenVOM2MwT0NBYm00Mm1tV0w5MGJzZXQv?=
 =?utf-8?B?TzRqTExvVnZSMVQxamNsNnBrczRhOXo0VUpOVEdRVEZhMlhQcVp1NFBrL3lx?=
 =?utf-8?B?ODN3Njg3Z1lUK0JtZ1hQaHJQT2I3Wk10ZFRWM3AzL1ZQQWlSMUZMbDQ1OVV5?=
 =?utf-8?B?aVBtazNjQmFrWFltdG5ZUVVpTndjbTkxWmZpQ2tXVmFjWHZWeGo4engrM3R0?=
 =?utf-8?B?VmFHeHpzenZHdmFtQ0xVcm9FamkrcjBGM0Q0eDBYbWp2cW1GZjZ4bU5oK0xz?=
 =?utf-8?B?aHI1Q3YrT1VUZ0NLallhNXZNMjk3MlI1RStIRmlEV2RzcnRtNG1rTXBpS21k?=
 =?utf-8?B?aTJkV2xRV0lvZDNETy9VdG5KcGZqT2o1K1g1VWJRRkVPcndwWWRLQ3N5c2Rq?=
 =?utf-8?B?RERpNkdpeVhoMXRSRSsvc2NBZjhFVjN3WTJzcTBMb1NYYXlCNzVDekhya2ov?=
 =?utf-8?B?RmZBRFY1cGQ2c1dRVmpVZXlCTERoTklxTTZ0ZHBJQnd1eXZFbERTSnRGY1dF?=
 =?utf-8?B?VklpSy9vdXZRYkQ2Zkpkdm45N2thTzlXTjZFUUFiTFREWWZBaGlQZGx3RnJV?=
 =?utf-8?B?NnZneFhNU1Z6ZmlVc3hTZ3IvSE1sNUdvaGt5VkdOdVVVUEF0emNBdWN2RU4r?=
 =?utf-8?B?SC9sT0p1Y1ZDaFF5MytBTTRPam85ZkQ3cW5ybW5JNm42NnVRVDk0dFVndGlF?=
 =?utf-8?B?cHU5aWt5dWRtRmdKU2VvU1kwRHlDUUdQbnlITHNHSW4rRkxBL1dGTitIN3hM?=
 =?utf-8?B?ajJtdk1hWHhHQVh5MW9zUEZmaGMxRElqTjNHb09zSTRic3dyQk5iZTExT2Qz?=
 =?utf-8?B?aGdUVU9pcHAxZm9FMEpLZFlqOUxjR01hSlhQT1VVckN3a3V6QURkaHdGVzlU?=
 =?utf-8?B?eTFZdnJZN0R2bUVkOXVmN29IU29Od3V0dkh2NElDdU1oT3Y2ZUpEbXVmUURB?=
 =?utf-8?B?OHdhSkxJM1NtQnY1NUN2Y3VOWVRWaHZ2Ykw3T0VLOVQvbnI3TkJwNWVvak9n?=
 =?utf-8?B?UFVFL3c5cjhPS3Rib2kwQk5sWk1vaVI3SlZ2TTRxcmR1NTdIRE8zTkJCK2Vv?=
 =?utf-8?B?RDBHcmRSZEpqdTNPeWRoNFJkZDlKM25qaTF0TW44ZER4TDJrYkZNVitySzJq?=
 =?utf-8?B?bnViSS9nUzByMk5yS21OMDd4UytFbkJod1B4YkJZbDIySjZPSlRXK3g5ZWdX?=
 =?utf-8?B?TlZSRVB1YjQvb2RTeS83d0dSbVMvSy9pUUxGSTRHT1FKRVF4MHowWHRMWkdD?=
 =?utf-8?B?KzRpTkgzYWx3d3ZsL2V1cXd1MWlwaWZpUWtwa2lYSzBaaW1OdVlKTVNFQ09X?=
 =?utf-8?B?VnlPUjJDTThQUVRLd3JyREI4bTRveXRteUpaWTFhajRXaW5UVmhrZXpVbEFU?=
 =?utf-8?B?SHE5L3l3ZW5wYU9uYk96RVQwWXNoVWZpcU1SYmtvRDFwdE9Kc1g0QU5JNSts?=
 =?utf-8?B?b2x5NFJhamVYQ2E4enpFN0ZjZlNMY3Z1M0xmUS9OamNrUjNLOXBKQnpValRN?=
 =?utf-8?B?N3RUeTdVMmcvZXpTaHFndWNXWEV6S1RCWUYvZnpGS3hLaTdGNHdNQk9nMWp4?=
 =?utf-8?B?WkRqWGRHaU9hL2RMSGcvSXBCeFRrRmxRNkp3OHFLVWw1WkdEaG11Y2xHSllF?=
 =?utf-8?B?Njk0YTd0b3AvalJvN2U4aHVPNVFmTSt5VWVYU0RUUHlZNURFM1JnaUFYSUti?=
 =?utf-8?B?aFpJdE1Id1NvVnpKSkhjMmF3c25tTnMrR3hwTFBwSnVLbWVFNjFiSHRaLzc0?=
 =?utf-8?B?aXRsN1g2bjRzWXlKTkVBbUhSbmNPTUpIR1paY1RJMmF1dWkxL3pyekphVndQ?=
 =?utf-8?B?V00yMitGc09NTmFlaXpvT2U1R1ZYRzd4S0FFWGJJZ1krQ2tocjRhNng3STlV?=
 =?utf-8?B?bzUxRkQxYTQ0RE1NN0RnTDgwcmlTbVIzcCtuVmZnSEdzZWhFVXo5WVdXbEtq?=
 =?utf-8?B?Z0k3VDhtYXJKbXhLTjZOdzRnbHJVQnJMK3ExaDlzcXI1UHVoN1RUdXd2ZGc3?=
 =?utf-8?Q?JN1vYW4gn3RU5lgzRw2m1UU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33132c6-704f-47d7-9b7c-08dd6b77f337
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 08:35:08.4049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWVVgMg9LSY/NahMJ7yvSpYxjqxU+FyfQZpmd40lv6daU1U0d75qx1PbWeROoHZQBMOEN+rJtcFhXiDFBAtUyPg4MwblnahUGXjZI1ozxBYQTYt/JFFeqjnaFAxrWPq3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e26ac1 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=u639SeGWG-bHb0tcPqQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LnbdApIJNZumF5u_rIFtmlwD4r7GgSPB
X-Proofpoint-ORIG-GUID: q5RNGEWu4hEjNEWU7db6BhMxBMnhOXvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=580 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503250059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 08:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213593


On 24-03-2025 23:18, Randy MacLeod wrote:
> This will block the 1.84 update until we understand the root cause.
> What happened in 1.84 that we need this change?

The issue has existed before, but with the new commit 
(https://github.com/rust-lang/rust/commit/68034f837a39387e49fc7d7c5b088f5372a1127e) 
from Rust 1.83, an error has started occurring. The problem is that when 
multilibs are enabled, stage1/rustc can't find the lib*.so files in the 
lib directory, as they are now placed in the lib64 directory. To resolve 
this, we initially reverted that commit. However, with the current 
update, we removed that revert patch. To resolve this issue, we exported 
the LD_LIBRARY_PATH to include both lib and lib64. After doing so, the 
issue was resolved.

Deepesh


