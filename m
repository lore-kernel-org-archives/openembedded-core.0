Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E530BCCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 17:03:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14809.1762362219410253836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 09:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=kuC+emTe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3404129863=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5GCJ6G057545
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 17:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=hjWsVhpyGydYXQ7pHKp2Pe
	lJb6cJpS2pNUimxAUVC1o=; b=kuC+emTeJgkKLGsadJMbWJ2GNL5aQp8eHtYEZV
	3DHCpFkLqha1XOCWFktWypeVr2wBv8h4wfmDOtt5TUa3vH7Un+aiGYUH0EeBWaTQ
	Xl02Q3X2jKHw74L05qJBQ5vhfPGtSb4ATF614vzDiZCcMhzkaqbNdKNCaVxgBOer
	eRJdlX0OnJF6/1gq9DhIppYUzLCQ68ApZmN7qmyNUV832LYUu8hAuHAh9Bj3Yqv0
	I2YDvkBVQasDwq35w0kWYURuspnZyBfRi5O9RN6r/VZ5todRcE74hSr1ZUIpGYHi
	dYTepauHmIfTZcfSKDSvH0uvxf62po7tydPsOBThLw8R6uCQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a89w783ny-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 17:03:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpKmSHeur1SPygBoYn7n9dMm40Cho6wyREuY5JeOOSGbk5Q2m0VTqUVfQTqFABCPFXAG7RqQTc6SkhkoNwM5eUB1cu36TVGGVBbDQRaBwFDXAcgtsYBCEghpG4ANY+pyJIU+jOsco7ok/aDLYgKszw1yADq3dT8ghcaOGDx0sLHkkGUGaUIft/9edV1vUpZJqgsEqYO7CFzvZPqQaEn4H/X7fN8bz7gJYHzUHAkUAP3/KNPnAmZWBMRyPl0aJPMIHepVNgooBG8286U6IX+zPJfOLCC2kXSOUSwjoXQHfu7Sm0ncCbWa6SL7vT01tLx1I1SmaOizlg0NnsHlh2P+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjWsVhpyGydYXQ7pHKp2PelJb6cJpS2pNUimxAUVC1o=;
 b=Oy70k6NUY1cCkR1O09moG35aW9Yr0J3iWjAwLkMoJDxMaHVXGuqIjMP6UmnUVvlVHcAWHjoQsGCjzonXmjBR37Wlw2zBf2kmxaidSxEkXeIgY7VsyHYl10YeSV1xvh2jwPVUkUmHLqOoAD5CpIV+XE6/4hlsXf9/VMb+nZMEg1yJdQoTzmedZz/PPeviArF7FZ/BfjDW0MOKYNoMvSxif137hhNWuhu2zZUGWrxP1OMCVb5NEBKlg6ApKBrhDu8UOIYgd61FfvPvaayaEFRkRXAdhmqpPMGKfIdf5XfC5SJGXG9S4jI0RTHd9MIY5DhtWdw2q7I8fh2BjreKnHsAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH3PPF1BAF94C4A.namprd11.prod.outlook.com (2603:10b6:518:1::d0d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 17:03:35 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 17:03:35 +0000
Content-Type: multipart/alternative;
 boundary="------------jtta8q7rTpX0MNH1OBs76GMh"
Message-ID: <fdec145a-8f47-46fa-854f-73338998a719@windriver.com>
Date: Wed, 5 Nov 2025 12:03:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/8] rust: stage rustlib sources for linux-yocto
 make rustavailable support
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, sundeep.kokkonda@windriver.com,
        elmehdi.younes@smile.fr, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
 <20251105130942.833204-5-Harish.Sadineni@windriver.com>
 <CADkTA4MRn4u_mFsmwJt1K8MiBECcgers6rkKGTTWQK-KBGnCpg@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CADkTA4MRn4u_mFsmwJt1K8MiBECcgers6rkKGTTWQK-KBGnCpg@mail.gmail.com>
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH3PPF1BAF94C4A:EE_
X-MS-Office365-Filtering-Correlation-Id: 1296b41f-1eb3-4ed8-c9d7-08de1c8d4192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aHBZelcvSlBpZ3QzWmdqUzF0MjN2Umc3SFczRXZuZG5FNXNWVTI5SVRCbTFz?=
 =?utf-8?B?VHFmTmEzY3hwY21NV0lhd01uVlZJZG1FQ0FwTUFPcVppc1Y2bW5xMzhSYVBj?=
 =?utf-8?B?L3paUnZLNVR5ck5xc2hYdGNYd3ZqRXdHTkNHaXFTNy9Eb3Z5UGZxRTZIMDZY?=
 =?utf-8?B?UGNmRzRQeVhWY1IrYzl2a05qeFArYWYyRE5uTXNSekZpTGVGcTBTVzh0eVFv?=
 =?utf-8?B?Y3Z4dnh2NVlDOFE0M1U4Vi9rZDJkU0NxZG9qZVpYQlJkS3dKMldOTjg5QjEy?=
 =?utf-8?B?NE5FYmo1eExPdUZPQWIzQU1uOFA1VnZlaDhuaFlLSlJVdm5JakdTT2tXdFor?=
 =?utf-8?B?MHA0YWh6MFZPbHA3ZnhodkhVWGNjWHpCVW1MZGJKVldmanU3bG90YU1KSkVs?=
 =?utf-8?B?ZW1Sbi9uUWk0NGJ0ejIwZ2Qyc2lPaUFJQmk3bExra1RiQTd4Ly9tclNKTnVS?=
 =?utf-8?B?Q0RzZXJFRnJEbXhFTE9uSzFid2NRNVZ2eWM2UVIvbFpmQzZPTEJWM0ZNOXU3?=
 =?utf-8?B?TzNkOTJzUEY4NDFzNHFEOC95S0JGeEtPZ1BsYmdKb21WREJCeldsQTNQV1Vt?=
 =?utf-8?B?YldFdVRaZ3RGY1ZTbC83Y2RVTmhNbjJaVjBSYWFnMWdQKzkvNTF1NE5pKzNK?=
 =?utf-8?B?Vkt2YlZBbUJZRzFqaXJMaDlOb0w5YXp3N0hjNER4N1lHUStUTlIrK0JWbEx2?=
 =?utf-8?B?cmszcUc3b0YwbFRIaW1MeGJuQ1EyeVZYK2k0SHNwVklQQ0M1Y1hMcG1OaGNE?=
 =?utf-8?B?VC9YRUVrL2p3dTd5RDBrV2VCMWx6OEQ2RVc1N3hzbjJuNFRYSGsxTGQzWkNV?=
 =?utf-8?B?TGpjaHYvNnVGbXZXN3dBUldkdHFmWTZiMzErVndOVERiWEdrbVJ2Um1veGZH?=
 =?utf-8?B?QlZLb1oyL25EM0Y0N3dZV01YOUpaNjQwK3N6QVJuQmhMSTNWRzNuQ0JBYXY0?=
 =?utf-8?B?YWxNV1ZvRUVHUjNPcGQyb3dmUmN3Q2RHMkNFV3FOSVk2bEtkQkhkNVIzNHRV?=
 =?utf-8?B?aDFMMEZZSWRFVFpJd2pxalNidU9ENjEzUXFMMlhUVTB4LzQ0RmgwREJFTDN1?=
 =?utf-8?B?Y3p6a0Y2QXdTQzJLVjZMUDYwZ2dKaC9qbjVmb2NMeGRTMXQzWWt2OGF1UDcw?=
 =?utf-8?B?ZkVyVW9FMWovRC8zdUorckhnMVJ5QW9wM0gwYW1KU0lPMWlVTUlhcU9tbUFw?=
 =?utf-8?B?MWFtYzYzTFpGU3hjendJdnhLVVNzSlVJQVZmSzFndENrM25FeW40aHZxcGJr?=
 =?utf-8?B?dllUcWtzU3czTnIzV2I4QXlFTkV5MSt1VVV2dVZOd203OU5yREwxdU85Wi8v?=
 =?utf-8?B?L0lNV0k4RytYc2paQ3NFZW56NExmOHphVHIxZ01zcXpOREhoWXJaTTBxcmZX?=
 =?utf-8?B?WkJ2Q2psaHFpYWN4S0JiTXRaQ3ZEbHY5WWM4Z0xxem1qZys3VlNIaVZ1R2pK?=
 =?utf-8?B?dzJEWUZyc2dHWm82YjNhMlI5UHJ1KzZ4NzFmK2pjbEtRdkxoOTY5S3gzNFl2?=
 =?utf-8?B?Z3lmVXJnQVA2ak81R3lkNktUZk5Wa0pzNUhRRVBZTHdORDFjOEpHZHFxc2RJ?=
 =?utf-8?B?RGw0UXEvRVJqV05CZkVOd01oWUdPdGdWRDBpYWU1YkMwVC9nODJSa3Y3T1gr?=
 =?utf-8?B?VDdUU0xET0ZLS0pqdkR1M2lnbHRUaUI4SkRkSDZZaktFSUR1bTl6Tm0zTjJX?=
 =?utf-8?B?dFFCTU80T0NLMUZkWUVrNi8xT0l2aEFRNnhPcW1hZjkvblhnUkFHUURiVVhY?=
 =?utf-8?B?ZVpTUDVyaFZoOEN0amdCbGViVWtVV2NvbVBINnF5SnpydG1mVC9OWGhqR29u?=
 =?utf-8?B?QXFhRjNicS9LYVAvWEx6dzNRTXBLWis4WTQrUWtUQzZaYkJOd2ZRQjExVXMr?=
 =?utf-8?B?M2p5MU42b1ZwZzRHVTdLZnlnWlZDTzZnNlB3RW8vcEx0QVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkRianRzMmg4eVdKaWZFZTM1SVRnTlp0cE5CSmJFYklsb25WeEdZRWpON1dk?=
 =?utf-8?B?eVpVQmYvSU93WHcwdnlOcVp1ckZWeHpHY3ZGWkFkZUVkUDlONEdlOEY0SU9q?=
 =?utf-8?B?VmRGYkEvWXpUNXA0bUZMb3hkY0k2NWlBUlAzSnAvSC9lVW50QytLTXphRnly?=
 =?utf-8?B?aFluSHZHcWZoM01kTXZZZ0NEYjVqdVhSZk44Z2h4UDl1K0gyQnA4dkJaZUhy?=
 =?utf-8?B?dFVXR0F3OWsvd0UvR0tpSUszUFVKUFJhZjhCM0FabGsxTXhTRTBCUGxyZjdx?=
 =?utf-8?B?TlJvYXNoa3VKaVRkWTV2bTlkMmozT04wcHVDeU03cm9zNXpyL1ROdlRwQ1Nk?=
 =?utf-8?B?WE9BSk5Rd1RTcFU2dVVaZWlPNmtnYk52THQ3M1d0MXhHbXV1UFZyQ3UvOFNr?=
 =?utf-8?B?a1B4eW5NK3F6TFVVVXFqSDdkcWtMdU5MbWxBU1EzL3FjZ1hIVVR3UG1YUGRl?=
 =?utf-8?B?dUVMdHVvV040UlVzM3NtTXpyTFBJMUU0UE1VSXlXM0lKYnJFK2V3cDI1RlY3?=
 =?utf-8?B?bnlBT3RpM1JDQjlnb3V3OXQzSEtGNU8rY3NFWEZkMW5iWkhTVm81Qis3Uy80?=
 =?utf-8?B?eDJxRm5QeVpiRU1ycnYzSWZ5T09UYlVaMUJtNjBRS0d2SUlna1NITWx4VTlv?=
 =?utf-8?B?Y1ZvVFdTOEp6Z3hObnBYY2swMXNRclhtY1R6d0xBZmRjdTBSQVRiT2JJVnJW?=
 =?utf-8?B?NjFyMDRwRWRGSnZmYzh6aXdKeTdUTThycWtHTFN1U2tBR3FicXlaVEFpcXFK?=
 =?utf-8?B?NFRoc0ZrdzBoUnJZOFArQ2RXY0RtalM5OTl1UmFiRGVZeEpjQWkvVUYxRTFW?=
 =?utf-8?B?MlNpT0tEOXU1dUpITVR6RThUOEpKK1ZTbFkzdHB0dWVDd0NsYlZOV3paRTJS?=
 =?utf-8?B?djdPUzVlS2xUdzBKK21laHlmZlpkR2ZLdmwzV3hGamNrZk5yR0Vrdzg5K0gy?=
 =?utf-8?B?SitPU1JEWmxJenlBUlp0czNjbTBIUkpGdzEzQ2dvWGRNT0hnMmJWVGhUUjlY?=
 =?utf-8?B?S3h1OEkvRFc1aXJZcEhCbW1sUFdRNDZNVWRhOERRTEk5aTBtdkJrQkJvY1p2?=
 =?utf-8?B?MXl0WEEvQkE4YzlpRi9LMXZjT0MzMDFGL0o1SE1TZm9qNzRNa2M4TWtnSUxV?=
 =?utf-8?B?ck8xZklTT0YxNmVyTkVWQk5RU0dBb25zV20zcFA1NFM2dXI5TUIxSkRJem9L?=
 =?utf-8?B?NXRtYUc5bEFPUXZWUVlIc0I1RzJyTHplWDVJQ3ZiSGNPcDJvdWUrQlphbksw?=
 =?utf-8?B?UXRiS0tGc2RwcldpZUhpN0pjSkZZYWtXclNmdFpDVVRqdUZjYUNxSWg3ald3?=
 =?utf-8?B?aTM2QWNMbWt2d1VKeW9oMk5PWTdUeE03TldCeDVPVXJabzhiSzFlQmc2dHhP?=
 =?utf-8?B?MGJtbmpJZ3ZyYmtJUms0ejM2bU9MRWt3eXhudjJQWTI0aGRzaWFnS05Ua1lE?=
 =?utf-8?B?RWtHYkh0NWdtY2VKZ1JrbGNuSzZTdVJjTEM2Yi9lWUNDQVVNKzhsS1MvR3h1?=
 =?utf-8?B?OUtDTzNjVWpONk1VRXR1U1dwS3o0SS9vRGpRbG1IaDR3UzBZZnJ5ek9xRWRk?=
 =?utf-8?B?eUVEWHFGdzVublZyaWV5Mmwwbk5LUTFDbTM5b0N6L0JibkFCai93aXRMbURa?=
 =?utf-8?B?clpXelFOMFZKb2RkM09veEk4MlFmU2VxVlAvNGpDSGVBVVNEMlFrK2RuSTJT?=
 =?utf-8?B?VFFTSXBjblJoWUg4bUZlTFVzK3NSSGdzc0VvM0svUHFnRktNdEp6SHZrMEdD?=
 =?utf-8?B?UjdwUC9oYks1Z3p5V0pXV3RacHZZUngrNjBXbS9rNk4yb25YYnp0bnlSOG1J?=
 =?utf-8?B?em5iaUtqVVQ3R2trYlMrczl2WEJTUEtWSmVPcmJFOXVZNy9RaldsbU5Bay9t?=
 =?utf-8?B?QWlQSDFoMVFJSUFwektVWlZ3SWNCUHZOc2ZPUDk5c2tCWklkK2VDcmJzY3BT?=
 =?utf-8?B?Rlc5MGRDRThwQ0trZGthRXhjSEVmb2lZVnFqaFRDZStkUUs5bHNDa0lROExD?=
 =?utf-8?B?WGdjOG5kNG5IdDhDdlhLQmVXZWJJSGxQdlM0ZWpHMVZFQnVxeDZEU1hyTVEw?=
 =?utf-8?B?QzZPUUtacGtuWlJBSkY5UmUvMjQzZGpEZlJWMWVhODE5MUNtMHFmd3lJR1ZV?=
 =?utf-8?B?WEsyMDZMMVFhS0YzQlRFbTJuaGVGdHBYOGMzL0lZUThWRzlIVkZ2VTZucjhk?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1296b41f-1eb3-4ed8-c9d7-08de1c8d4192
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 17:03:35.1354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgo6Uge7ODF1HMj7zfgbP7qLYuUCTINyXQbCnTp/3LAzKsa+8kpllOYV/oj6gXMNlRKj6dd6GwLy7WZxlU3miMPPrwTmZ4JoCgTKmHVpYeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1BAF94C4A
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Zy3rY7HFIvBlUxWiqbtHOBDfoO6rhSeW
X-Authority-Analysis: v=2.4 cv=FYo6BZ+6 c=1 sm=1 tr=0 ts=690b836a cx=c_pps
 a=2InGsGVdz7DAox/zTLSmPw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1H9S5zupAAAA:8 a=OXYdKju-AAAA:8 a=t7CeM3EgAAAA:8 a=LYVmv8Sl0YxWvGshb9oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=m99DSxKkbA0fuVD5WtEA:9
 a=a_eu2NCe0RkIgM07:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=KJqDGGnLsJCYSyNEcnDM:22 a=vS1OVC_SZrKemGXf_pMR:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0hyBD8tZfBQdNu9thT5pXoiemDaPOIT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzMiBTYWx0ZWRfXxAY1FCrC58ZK
 Lkwl3nDLyonvjfEYr08/CXi0J/ALVQ+4xXLTyr+WuKn5bAh4AyuLdENvKxoZYS1VByYfj7ETSmn
 XJH+3bmruQe3LAAuyxVV58J0uTWERlUcl/6d7Tk8Hm9f5ZlxFfz6myUSqfdm7rvNKWzb46lk5AS
 mcV8mFTspwDXY0VMPH6fYHmHyZxgoTyz+/romHLUcZ8Z2JoFcCGE8r6vCYOCllGwfrcMOZK0W0q
 533RmvwUPaPCrDmPdHQvWHvwZEG8NUkRtkmZBdA53fZxxJ0fjzUC9CwffqNJGC/qk2oX55l4+rQ
 cxQ0rtBThuO1QSx2dgm5mOmWg8bXFR2ZAcXEe+c7Iwu2aUSSXGVCmYbi4FKP2n2sqRw0gBlcjsm
 QlLEGisnmmdEnSB5/lGyMchLhX7BjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 17:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225777

--------------jtta8q7rTpX0MNH1OBs76GMh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5A5GCJ6G057545

On 2025-11-05 8:32 a.m., Bruce Ashfield wrote:
>
>
> On Wed, Nov 5, 2025 at 8:10=E2=80=AFAM <Harish.Sadineni@windriver.com> =
wrote:
>
>     From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
>     When building the Linux kernel with Rust support enabled (e.g.,
>     via `make rustavailable`),
>     =C2=A0the build system expects the Rust standard library sources to=
 be
>     available under:
>
>
> If that call is happening at configure time (in configme), then it=20
> would better to have
> this preparation step in the same location versus separate before=20
> do_patch.
>
> Bruce
>
>     =C2=A0${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust
>
Don't use /usr/lib directly, pick one of:

=E2=9D=AF rg STAGING_.*NATIVE.*=3D meta/conf/bitbake.conf
422:STAGING_DIR_NATIVE =3D "${RECIPE_SYSROOT_NATIVE}"
423:STAGING_BINDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${bindir_native}"
426:STAGING_LIBDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${libdir_native}"
427:STAGING_LIBEXECDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${libexecdir_nati=
ve}"
428:STAGING_BASE_LIBDIR_NATIVE =3D=20
"${STAGING_DIR_NATIVE}${base_libdir_native}"
429:STAGING_SBINDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${sbindir_native}"
430:STAGING_INCDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${includedir_native}"
431:STAGING_ETCDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${sysconfdir_native}"
432:STAGING_DATADIR_NATIVE =3D "${STAGING_DIR_NATIVE}${datadir_native}"

657: -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \


Same comment anywhere that you have ${VAR}/usr/foo/bar/baz hardcoded.

../Randy



>
>     Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>     ---
>     =C2=A0meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!aQ1fra7eKRFm-_YXYz7UyG_3CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2=
rarbvOLRkywoZ9mfu8xuBA$>
>     | 8 ++++++++
>     =C2=A01 file changed, 8 insertions(+)
>
>     diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!aQ1fra7eKRFm-_YXYz7UyG_3CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2=
rarbvOLRkywoZ9mfu8xuBA$>
>     b/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!aQ1fra7eKRFm-_YXYz7UyG_3CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2=
rarbvOLRkywoZ9mfu8xuBA$>
>     index e2ffd96b59..05219d166e 100644
>     --- a/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!aQ1fra7eKRFm-_YXYz7UyG_3CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2=
rarbvOLRkywoZ9mfu8xuBA$>
>     +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!aQ1fra7eKRFm-_YXYz7UyG_3CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2=
rarbvOLRkywoZ9mfu8xuBA$>
>     @@ -71,6 +71,14 @@ do_install:append(){
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${ST=
AGING_KERNEL_DIR}/${KMETA}
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     =C2=A0}
>     +do_patch:append(){
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if
>     ${@bb.utils.contains('DISTRO_FEATURES','rust-kernel','true','false'=
,d)};
>     then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -d
>     ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust ]; then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mkdir -p
>     ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0cp -r ${TMPDIR}/work-shared/rust
>     ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     +}
>
>     =C2=A0# enable kernel-sample for oeqa/runtime/cases's ksample.py
>     <https://urldefense.com/v3/__http://ksample.py__;!!AjveYdw8EvQ!aQ1f=
ra7eKRFm-_YXYz7UyG_3CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2rarbv=
OLRkywoZ9m53T-LsA$>
>     test
>     =C2=A0KERNEL_FEATURES:append:qemuall =3D "
>     features/kernel-sample/kernel-sample.scc"
>     --=20
>     2.49.0
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--=20
# Randy MacLeod
# Wind River Linux

--------------jtta8q7rTpX0MNH1OBs76GMh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5A5GCJ6G057545

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-11-05 8:32 a.m., Bruce Ashfiel=
d
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4MRn4u_mFsmwJt1K8MiBECcge=
rs6rkKGTTWQK-KBGnCpg@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div class=3D"gmail_default" style=3D"font-size:small"><br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 5, 2025 at
            8:10=E2=80=AFAM &lt;<a href=3D"mailto:Harish.Sadineni@windriv=
er.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Harish.S=
adineni@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
            Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">Harish.Sadineni@windriver.com</a>&gt;<br>
            <br>
            When building the Linux kernel with Rust support enabled
            (e.g., via `make rustavailable`),<br>
            &nbsp;the build system expects the Rust standard library sour=
ces
            to be available under:<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">If tha=
t
              call is happening at configure time (in configme), then it
              would better to have</div>
            <div class=3D"gmail_default" style=3D"font-size:small">this
              preparation step in the same location versus separate
              before do_patch.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div>
            <br>
          </div>
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            &nbsp;${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    Don't use /usr/lib directly, pick one of:<br>
    <br>
    =E2=9D=AF rg STAGING_.*NATIVE.*=3D meta/conf/bitbake.conf<br>
    422:STAGING_DIR_NATIVE =3D &quot;${RECIPE_SYSROOT_NATIVE}&quot;<br>
    423:STAGING_BINDIR_NATIVE =3D &quot;${STAGING_DIR_NATIVE}${bindir_nat=
ive}&quot;<br>
    426:STAGING_LIBDIR_NATIVE =3D &quot;${STAGING_DIR_NATIVE}${libdir_nat=
ive}&quot;<br>
    427:STAGING_LIBEXECDIR_NATIVE =3D
    &quot;${STAGING_DIR_NATIVE}${libexecdir_native}&quot;<br>
    428:STAGING_BASE_LIBDIR_NATIVE =3D
    &quot;${STAGING_DIR_NATIVE}${base_libdir_native}&quot;<br>
    429:STAGING_SBINDIR_NATIVE =3D
    &quot;${STAGING_DIR_NATIVE}${sbindir_native}&quot;<br>
    430:STAGING_INCDIR_NATIVE =3D
    &quot;${STAGING_DIR_NATIVE}${includedir_native}&quot;<br>
    431:STAGING_ETCDIR_NATIVE =3D
    &quot;${STAGING_DIR_NATIVE}${sysconfdir_native}&quot;<br>
    432:STAGING_DATADIR_NATIVE =3D
    &quot;${STAGING_DIR_NATIVE}${datadir_native}&quot;<br>
    <p>657: -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \</p>
    <p><br>
    </p>
    <p>Same comment anywhere that you have ${VAR}/usr/foo/bar/baz
      hardcoded.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4MRn4u_mFsmwJt1K8MiBECcge=
rs6rkKGTTWQK-KBGnCpg@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote gmail_quote_container">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.S=
adineni@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">Harish.Sadineni@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta/recipes-kernel/linux/<a href=3D"https://urldefense=
.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!aQ1fra7eKRFm-_YXYz7UyG_3=
CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2rarbvOLRkywoZ9mfu8xuBA$" =
moz-do-not-send=3D"true">linux-yocto.inc</a> | 8 ++++++++<br>
            &nbsp;1 file changed, 8 insertions(+)<br>
            <br>
            diff --git a/meta/recipes-kernel/linux/<a href=3D"https://url=
defense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!aQ1fra7eKRFm-_YXY=
z7UyG_3CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2rarbvOLRkywoZ9mfu8=
xuBA$" moz-do-not-send=3D"true">linux-yocto.inc</a>
            b/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com=
/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!aQ1fra7eKRFm-_YXYz7UyG_3CWtT=
HXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2rarbvOLRkywoZ9mfu8xuBA$" moz-=
do-not-send=3D"true">linux-yocto.inc</a><br>
            index e2ffd96b59..05219d166e 100644<br>
            --- a/meta/recipes-kernel/linux/<a href=3D"https://urldefense=
.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!aQ1fra7eKRFm-_YXYz7UyG_3=
CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2rarbvOLRkywoZ9mfu8xuBA$" =
moz-do-not-send=3D"true">linux-yocto.inc</a><br>
            +++ b/meta/recipes-kernel/linux/<a href=3D"https://urldefense=
.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!aQ1fra7eKRFm-_YXYz7UyG_3=
CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2rarbvOLRkywoZ9mfu8xuBA$" =
moz-do-not-send=3D"true">linux-yocto.inc</a><br>
            @@ -71,6 +71,14 @@ do_install:append(){<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rm -r=
f ${STAGING_KERNEL_DIR}/${KMETA}<br>
            &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
            &nbsp;}<br>
            +do_patch:append(){<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;if
            ${@bb.utils.contains('DISTRO_FEATURES','rust-kernel','true','=
false',d)};
            then<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ =
! -d
            ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust ]; then<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;mkdir -p
            ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust/<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;cp -r ${TMPDIR}/work-shared/rust
            ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/.<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br=
>
            +&nbsp; &nbsp; &nbsp; &nbsp; fi<br>
            +}<br>
            <br>
            &nbsp;# enable kernel-sample for oeqa/runtime/cases's <a href=
=3D"https://urldefense.com/v3/__http://ksample.py__;!!AjveYdw8EvQ!aQ1fra7=
eKRFm-_YXYz7UyG_3CWtTHXzhxMr5phBTi_YQ46IB27rIgqcyW8RJk9RxCbHBesM2rarbvOLR=
kywoZ9m53T-LsA$" moz-do-not-send=3D"true">ksample.py</a> test<br>
            &nbsp;KERNEL_FEATURES:append:qemuall =3D &quot;
            features/kernel-sample/kernel-sample.scc&quot;<br>
            -- <br>
            2.49.0<br>
            <br>
          </blockquote>
        </div>
        <div><br clear=3D"all">
        </div>
        <div><br>
        </div>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
          the NULL pointer, for chaos and madness await thee at its end<b=
r>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------jtta8q7rTpX0MNH1OBs76GMh--

