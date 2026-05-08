Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9719CD3427
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 01:57:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4455.1778205429289612672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 18:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=aHm9Ifyb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=958850bb7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6481GCTZ1140853
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 18:57:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=twhJhgpOJcI2CXi/ZNGj5e
	kDuKLwPs3W3yMzupySeWs=; b=aHm9IfybCtsZrID1x/Wi7oy2VBX59h7NduvthE
	+a3hqZ9K+G94T/jP1Lzu0fkW04FpEQaXKs7KttAMH2SQM28ij1CPNGtYbFfHzc1S
	eh6i5IMlgjdKBLz//2R6bYGSaOI5rW3z+gISgWjeBA0yvqaCFBAFzqoEGtYEP+i8
	qFnhfAjCh3YCTDdcK26hq7EDsvDKRvVndHseFs8lfeZzfHdMyCA6fA5PX9P2Wdfx
	tHK1V8e+N3PFX5dysfh7xB3WmUh74ZkkmS4S02V4W6yDk/HG3swxbnovzbeQ7ZCD
	35TBuhayizP3GHVknpVX9RQI6Rov8gKvo/ycoRHWlig0R0eQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyya1w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 18:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN2Z3/tLFWDKgru2IhHFsW5/UROkWbPZwtyS07W/Yl+OM4IoatC51r6chrNiLJZKI9RVmJ7nTnwY63LRpp3k/v0qe2k2Zg05FCE5FnPcuoVQxNwdHWadWDXyMdum1KnlT79XbISxLCatB1AAgn0aKYw01qjhR9BknIHogvzELF9Kthia5Rx+iglsVrfSho3uT0MTXuGnadPIaJcf/NZ0UPEBaBgmuoMTbdAuGjW6Hy4VcYAIjnVKCKhRRGa7EbhUCIx6USAc1pppJcVWiL0nY2ztqokfxM3R8+WOFdlLCVkgKGgGJWd7HwNLEtmFW7kevAt/dbH7PaG7BavlnBfZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twhJhgpOJcI2CXi/ZNGj5ekDuKLwPs3W3yMzupySeWs=;
 b=ZtCqfev3o0m5gfFzKPOXqXZ+QcJnevdTpjvhmlbyJDPSTWjO0HjtBrOfaI+G3O8/XgOpP0Pv1LSb24Sf5S4LoVGcZPSFVCZAL/i5TKFGZGW2pxVwZ4jsaDfrt6cD8T5yuHi8zDrRVUW038WyYWR15Z7G6Du8gXa8JLCsVOHi4JK/iEbp6TnMLKaxRPi3Stf3Ibm56ET5bAHTHfeMZAfS/XVg7lO/eI7PcrSkWZR6hUY+/VS7sLkgsLkEXsgWyQCQyJwDSR6uR6B9FNIGxRCDs5G5gVQQPYYmuVlS/34LWDvEt9laJ6QLcnoWQ4j7Hup/PSI/cUmCetlplYzf8CrUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BL1PR11MB6003.namprd11.prod.outlook.com (2603:10b6:208:387::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 01:57:05 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 01:57:05 +0000
Content-Type: multipart/alternative;
 boundary="------------ItTYvDwz0bppGFyfm9vb0emX"
Message-ID: <1f7b593c-ed38-4de7-9409-b0f424dcdc1f@windriver.com>
Date: Fri, 8 May 2026 09:56:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: disable vulkan when
 x11/wayland not enabled
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
References: <20260507051048.3943372-1-changqing.li@windriver.com>
 <CANPvuRk2881_Eb=On2az8XnXiJbtC8azT1LQ7GBSCMuZHvfPOQ@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANPvuRk2881_Eb=On2az8XnXiJbtC8azT1LQ7GBSCMuZHvfPOQ@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BL1PR11MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 1049fdf3-cab1-430b-f915-08deaca51aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|8096899003|13003099007|56012099003|22082099003|18002099003|3023799003|4133799003;
X-Microsoft-Antispam-Message-Info: 
	TiMuaoJX+8NJ4wjEmdZ8QlNpB/skSls2ScE3d35EyXEC3gUV5MONnvlYL+x4FsjEZoyU2ou3CTV+/CEmflLDfO+aUKQFAfMn3f293K5/j8ypceZGP4+1fU2OMeAn1UMmRCv9nEM0N4r11c5kBHWnKKeo6eELYFNAtOnepY0GDzWhcTBhaFJA8jg8kTM06HyEveK2AcaX2GRMxbkHFe1EmtkDWMEeyMRmMJEUZB91srImg2oG6nfZPWuxCe3R7kBVQ1sXdNqnPi1HzvRpU6thRqYIpi3pXhuKWGT7fvbln3LBYZVbBnrdSRI9SGgWa4Xp+gnuh/wLZAqeRzv/s0t7GVO6hjFwzqHdj1hykQKSAocT6iAosvq5oM+Tg53xtI0RNFiJqWmWoG6Zct1pnj3zP2vJYd1U8RIDIJpTYtkVmfymM65R6gPR/uC6BHWMnXQjkcAyuwvT9jm0zthxpJmFCJtLsts1Nkh2CYldnIhr3IZEI59n3VjmHjdXaBPrsrDpQuk8Cbp7Lk0cdNkUdHVo9pHKtukD+C8fiun+PNQJ7Q0t+sQ+3PwAWtTMVU88v8aWvik/RUJY+e/txcSrP85wo0ZDJVF/yDi15X8JMVW/AjCrao53m0Y/9C5Ovm70Ek00vzlpa5BR7hOHuYzWgLt91A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(8096899003)(13003099007)(56012099003)(22082099003)(18002099003)(3023799003)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnFmWnowWWNDYk5zWkpPRlhxZ1NVbWY3T2VKQS9oUnhUMFhYcWRPbm82VzVJ?=
 =?utf-8?B?WFFwcGs4cSt6L3lNZHdUbFF4ZDYycHg0dlJZTmlqU3BPUU02WDFWUTRPWS9w?=
 =?utf-8?B?SUtSd3ZUUDBrN3RrRmJwaTAwZ3poVk1Ka05CenNqOXR0R1ZiZHlISitubmNn?=
 =?utf-8?B?OXB2TzE5bGVkVE56N3UyUWRVU1JtdDlSVjhIb295STkwRHdqT1hRZHd0Qmo2?=
 =?utf-8?B?d1l5aG00Sk5kRzNQY0NmYkYrb2E5eCtUcExlL0x0ckF5OVpsaG1yaW9UNjZm?=
 =?utf-8?B?cU83MnV5S3dVQnNMRlhaYmJFUEU5U2RHUzZzZFJCVEJ4VlJxcFpOaW1ZK0pG?=
 =?utf-8?B?YXQ5U1JGdDJzeHBNaFdpWUlVTlFFRXN1VDllZC9XR2ZUZjlLVDZZY1VHUkk2?=
 =?utf-8?B?c0FBOC9NMzVMeXIwaDl6RjNYZXFocWYxZS9xeVJzZC9XYkRvVHJiRHN0MXNI?=
 =?utf-8?B?WC9iZmxEZUw2ZDZIYzNCV0dvY2x5RjBGK3ZEUFBxZWxsZkFGOGpkdzRGRkwx?=
 =?utf-8?B?R1poRW1wdDFSWHZuM0dZanVpTkZlUHVqSTh6WmZmMVZQK0dvd3R5QVJORVBs?=
 =?utf-8?B?OFdhNmhuR1Y0MHpreEIxYk93YU1OdjQ4RTJtZjBaSVBndzk3bWlDM29vV09o?=
 =?utf-8?B?Sm9PVnJ0OS9rR1Yrc3lrVGZUektSU0w3dUMyRVdiWDQ4U3Z1REVGUitnOEVD?=
 =?utf-8?B?MU5vdkFIemlKVHFDTjhBNXpDNWEzQTFpc2hJM0JkTlovZ1RvRlhXdThsSlFu?=
 =?utf-8?B?K2JaYnRXbW5kak5qMUMvVmg2YzVpaldRV1gxb3BFdDJPOHhMS3ZhK2RsVHVV?=
 =?utf-8?B?VlhlazFMTWNvcUVUc3hvMThyemdPR0VvRFo3MnB6VWgzV1ZObWp4RnZ0aFAw?=
 =?utf-8?B?ZEVyOUZFMGRDL2F2clA1V1RybThvWFFJOFhUQUtvaXhsV1hGYnAxbCtYaUdZ?=
 =?utf-8?B?QUdENkZ0TGxIbWpUVjRYeGwzWXkzM2ZudUo2N3FSWUFYblpIZEd5eENndkM5?=
 =?utf-8?B?djM5L0E3Q1BDMEtQbXE5bHNmMi9wRkJLUEgzaVV6ZHdyWDJLdDdkaWJxcnNa?=
 =?utf-8?B?V2NjWE53R2hZVllzM0dDNFpaNDdod0wxSjlITlExMkx3VXVaOTdhZVpNaFpJ?=
 =?utf-8?B?aktRRE5Qcm1pY2xQZ3pkV0hEVDJ6ZWd3WG1LejBMbENRRVFBYkJUTDByNlly?=
 =?utf-8?B?QXVQWEdYQVdYdVlBaEEzTlVoVEMzTEtQNk40bTNZQ2UyTmNSZ2Myc1hFVFl0?=
 =?utf-8?B?NDhEcDFubU4zbndvUTBpcFRCYTFkckc1VHYyWTUwRzYyanlIcXZBbzBrSjlq?=
 =?utf-8?B?aFgyaW9oV0hpdUMyZ0tKQndDVlYrZVJzRzV3N29sWXhvd3ZpVFhDMzVrTk9M?=
 =?utf-8?B?VitReDJLeVNoODRsZURoSDhzOFlXMDZlZDRBUEQ4K001Y1FSc044N0VvOWo4?=
 =?utf-8?B?NkRrOVUzNHNXcDVvdEpWR1lCVFpvNlBlVW9zZ0VFWGdpOW1DYmhoZ2RUY3ps?=
 =?utf-8?B?aHZVbVpzcDE1RzJQblhaNC9lMGlLOVlubWtLRXVXTGZrazdrYndUNmhWd2tl?=
 =?utf-8?B?R3g0dE56eVZXM1NkNlpZeTBaSENtak1weGR3T2d0dlJTYnNQd1hwM0FGQ0tU?=
 =?utf-8?B?cVJBeVhrbndxZTBIS09DUzZYQmlGQ0ZhNGFLaHIxUWZBc01GZkJzLy8zdVNK?=
 =?utf-8?B?bVZITEYxUzBqMHlIYVZRNGZnSksxNndmRzVhaG1oRTVnQzRSOGMvQ3U4N1pL?=
 =?utf-8?B?S1VxUE5PNFUzaDVoY1Y2VmFiTTRkcWh2WCtQaWY5cC8reTV5NFl5QmZMdHFV?=
 =?utf-8?B?alFNd0hYTFNDM1YrZTZQaUhXS1JxSkF1OWVPN1RFbTdwb0Zta0YvR205ekU3?=
 =?utf-8?B?UFp6Qlpya0pZZjk3a0hTcWlUNlA3cHJXc1FWNzhJSjY2N2hHUkdHMWV2bkZP?=
 =?utf-8?B?UWhUMFB4V3dqY1p3QUY3c2EyTFdjMHhCZ1lJLzBXVWFTekJMRGFRU21IYjVz?=
 =?utf-8?B?azh3aWhQQTRQMTlKRndkUTgzcEMvSlhlSjF5czFsZ2VOdHlwRmhSQk5aNlhs?=
 =?utf-8?B?dVFWbC9qUWViNGQyZ0srVVhuYXhCRGFFMWhXS3NGZDJvbGwrS2hGUjVLQ0RV?=
 =?utf-8?B?VlNaSUZEejNHWWJSNzMwTElPcmRueUxlVXpKdURzZ0wxUlRzTFNlRmtRbWR1?=
 =?utf-8?B?ZkxnQnp6bGJ2WUU4d1VnWTluWlpFN3pNUVlmZ2J6QUc1VDJaRHRJWXFnV3gz?=
 =?utf-8?B?TkYrVlVoQ1NFQTZSaHJlVjlXNkJlbExQZ1IybTA4US9XUmt4NURZWHkwMG9X?=
 =?utf-8?B?TWNvakExMWlCM2drRThVdlNaRXRFRU9Jc2hQUGMzK1FhTjhneWhKdEZIS3Z0?=
 =?utf-8?Q?0fs4MS6lSS6fD8CU=3D?=
X-Exchange-RoutingPolicyChecked: 
	QvUXFXsNuBCQUavRejpwmnagS3jKIAJqX9n8Q54jXvZnOAQjKpnRpf46dUaIYoiTTrieL2o+QdZEjzJqyvEZ8y7jSNQi43FKC2VJEAnmWo4D+k5+41z0IjF9IFlaO45kDUeRgWriFo7LZtf+Dkp3JbBb4bQ1CjebYjxo4U7X8GLCUkiMdy7oWVA5yelSVPMF5ro8+clCPfQBnzC5vbDyOzArLoYe/8zIX8m8jwvI0L3u74mF8md2qYR0P+NDm4aeiSpeNhPglG+e6R0ZCOHPbrZdtMquafhwo58RJCwoPXfZ5NA/W6bzOX9zswmJU4YFeG7n894O7wiZkzeUSdvX2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1049fdf3-cab1-430b-f915-08deaca51aaf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 01:57:05.2353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvMDp8lASkEeGXtAMj4MGBT6UmRgbXfMh7V6TV6g0Pwm5g+I6LqP8Knam3F5JG+FRY6ZaSCn6r2H3/hZkAlXz1KGMRoTY8WG6tr1QIDzcT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6003
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAxNyBTYWx0ZWRfXwXruIDUOubWp
 BqOGBaYXxoS59+6rFf4qZKv0g5yL4tuGbGP5b4zxcCamLtkrmpYk7M0om/soAG/8jObZHeD7t8R
 PHU2gLJvbXfFlP3Kwm1gUPhBQ9UtDLnN85Y8AfhBob/SSt3v12PII5bsmi+H+rh3qByzbLz2zp9
 438hZE+E6vo2OdBdVV5xx5h9wifTcG9nc5CkGnmscor0UAb10vf8itcQ+VFL75e+tKUeYmReupf
 pD6du9amZCrpvNXrqZ3i10z3Qy5Dw5DGuqipJz3FP8XEE5ssLqyjwb5sRPRrA5e+XZfaLf93HUS
 ZKzOjsKM5OYJma2hHWQBx5hkMENvd2CGtDoTsmgYa2H1h6iM8Rd1BRECpQUoWxaIck8iLE+cYHu
 +d1AWYLiGBVPyYmi+sR204sftN9jR5FizDfReindlZxTH8ZvTQTKdYZYdtAQGu9M0AWm3j5cjQo
 1ZD7DcyAYlAXu3j8+ow==
X-Proofpoint-ORIG-GUID: CUgMA3tNgMNYNb19-GqQQVkSYw-jqkiY
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69fd42f4 cx=c_pps
 a=bGC7MwCPNpf+Sn14ocfQJQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=ySjF6f4xAAAA:8 a=AziMl8wuAAAA:8 a=ygfikJQSAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=ZSsTv3fS2doPkkGlD5wA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=owEzr8MtPq2bjeSRDYkA:9 a=5964ksdYl-21SJQZ:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=SVe2G6S_LxxHVpu7-jkk:22
 a=QKHmAbfgFgo_a26yQnRY:22 a=rfsfOhzgo-V0TFs3tIRs:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: u-io2xm9HTwX6fNzsa9Xn1flnEk3rRlb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 01:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236629

--------------ItTYvDwz0bppGFyfm9vb0emX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6481GCTZ1140853


On 5/7/26 16:40, Jose Quaresma wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> Changqing Li via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7Vf=
ufnRvC5_W3JR5-ywidzs6L4$>=20
> <changqing.li=20
> <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!dPR5Lm=
VIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3=
JR5-ywjPgScZ8$>=3Dwindriver.com@lists.openembedded.org>=20
> escreveu (quinta, 7/05/2026 =C3=A0(s) 06:11):
>
>     When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
>     do_configure will failed with error:
>     gst-libs/gst/vulkan/meson.build
>     <https://urldefense.com/v3/__http://meson.build__;!!AjveYdw8EvQ!dPR=
5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5=
_W3JR5-ywqg724Gd$>:311:4:
>     ERROR: Problem encountered: No Windowing system found. vulkansink
>     will not work
>
>     disable vulkan from PACKAGECONFIG when x11 and wayland is not enabl=
ed
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     ---
>     =C2=A0.../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnb=
yzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++
>     =C2=A01 file changed, 2 insertions(+)
>
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnb=
yzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnb=
yzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>     index cdf3a20dff..51f51761f9 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnb=
yzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnb=
yzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>     @@ -32,6 +32,8 @@ PACKAGECONFIG ??=3D " \
>     =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('TUNE_FEATURES', 'mx32', '=
', 'rsvg', d)} \
>     =C2=A0"
>
>     +PACKAGECONFIG:remove =3D "${@'vulkan' if
>     (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) =3D=3D '') el=
se ''}"
>     +
>
>
> Using the 'remove' override on the core should be avoided because it's=20
> impossible to revert the changes on other layers.
> In my opinion, it would be better to use an auxiliary variable to=20
> define when vulkan=C2=A0is enabled, and this could be modified
> if necessary in other layers.
>
> PACKAGECONFIG_VULKAN ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11=
=20
> wayland', 'vulkan', '', d)"
> PACKAGECONFIG ??=3D " \
> =C2=A0 =C2=A0 ${PACKAGECONFIG_VULKAN}
> "
>
make sense,=C2=A0 V2 is sent.

//Changqing

> Jose
>
>     =C2=A0PACKAGECONFIG[analytics]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
>     "-Danalyticsoverlay=3Denabled,-Danalyticsoverlay=3Ddisabled
>     =C2=A0PACKAGECONFIG[aom]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D "-Daom=3Denabled,-Daom=3Ddisabled,aom"
>     =C2=A0PACKAGECONFIG[assrender]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
>     "-Dassrender=3Denabled,-Dassrender=3Ddisabled,libass"
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#236555):
>     https://lists.openembedded.org/g/openembedded-core/message/236555
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/236555__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159U=
Kn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywjKCbECS$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/119192696/5052612
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1191=
92696/5052612__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIO=
eVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywrSm1KWM$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWk=
vQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywn3VeNul$>
>     [quaresma.jose@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Best regards,
>
> Jos=C3=A9 Quaresma
--------------ItTYvDwz0bppGFyfm9vb0emX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6481GCTZ1140853

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/7/26 16:40, Jose Quaresma wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRk2881_Eb=3DOn2az8XnXiJbt=
C8azT1LQ7GBSCMuZHvfPOQ@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">Changqing Li via <a hre=
f=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYd=
w8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7=
VfufnRvC5_W3JR5-ywidzs6L4$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;<a href=3D"https://urldefe=
nse.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5s=
L159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywjPgScZ8$" mo=
z-do-not-send=3D"true">changqing.li</a>=3D<a href=3D"mailto:windriver.com=
@lists.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">windriver.com@lists.openembedded.org</a>&gt;
              escreveu (quinta, 7/05/2026 =C3=A0(s) 06:11):<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              When vulkan is enabled in DISTRO_FEATURES without x11 or
              wayland,<br>
              do_configure will failed with error:<br>
              gst-libs/gst/vulkan/<a href=3D"https://urldefense.com/v3/__=
http://meson.build__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWk=
vQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywqg724Gd$" moz-do-not-send=3D=
"true">meson.build</a>:311:4: ERROR:
              Problem encountered: No Windowing system found. vulkansink
              will not work<br>
              <br>
              disable vulkan from PACKAGECONFIG when x11 and wayland is
              not enabled<br>
              <br>
              Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing=
.li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;.../gstreamer/<a href=3D"https://urldefense.com/v3/__=
http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw8EvQ!dPR5LmVIme5Flfw=
BJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywrb_=
TT-G$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">gstr=
eamer1.0-plugins-bad_1.28.2.bb</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 ++<br>
              &nbsp;1 file changed, 2 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"h=
ttps://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!=
AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv=
0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">gstreamer1.0-plugins-bad_1.28.2.bb</a>
              b/meta/recipes-multimedia/gstreamer/<a href=3D"https://urld=
efense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw8EvQ=
!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7Vfufn=
RvC5_W3JR5-ywrb_TT-G$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true">gstreamer1.0-plugins-bad_1.28.2.bb</a><br>
              index cdf3a20dff..51f51761f9 100644<br>
              --- a/meta/recipes-multimedia/gstreamer/<a href=3D"https://=
urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw=
8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7V=
fufnRvC5_W3JR5-ywrb_TT-G$" rel=3D"noreferrer" target=3D"_blank" moz-do-no=
t-send=3D"true">gstreamer1.0-plugins-bad_1.28.2.bb</a><br>
              +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"https://=
urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw=
8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7V=
fufnRvC5_W3JR5-ywrb_TT-G$" rel=3D"noreferrer" target=3D"_blank" moz-do-no=
t-send=3D"true">gstreamer1.0-plugins-bad_1.28.2.bb</a><br>
              @@ -32,6 +32,8 @@ PACKAGECONFIG ??=3D &quot; \<br>
              &nbsp; &nbsp; &nbsp;${@bb.utils.contains('TUNE_FEATURES', '=
mx32', '',
              'rsvg', d)} \<br>
              &nbsp;&quot;<br>
              <br>
              +PACKAGECONFIG:remove =3D <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:${@'vulkan'if(bb.utils.filter('DISTRO_FEATURES','x11wayl=
and',d)=3D=3D'')else''}">&quot;${@'vulkan' if
              (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) =3D=3D
              '') else ''}&quot;</a><br>
              +<br>
            </blockquote>
            <div><br>
            </div>
            <div>Using the 'remove' override on the core should be
              avoided because it's impossible to revert the changes on
              other layers.</div>
            <div>In my opinion, it would be better to use an auxiliary
              variable to define when vulkan&nbsp;is enabled, and this co=
uld
              be modified</div>
            <div>if necessary in other layers.<br>
              <br>
            </div>
            <div>PACKAGECONFIG_VULKAN ?=3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.uti=
ls.contains('DISTRO_FEATURES','x11wayland','vulkan','',d)">&quot;${@bb.ut=
ils.contains('DISTRO_FEATURES', 'x11 wayland',
              'vulkan', '', d)&quot;</a></div>
            <div>PACKAGECONFIG ??=3D &quot; \<br>
              &nbsp; &nbsp; ${PACKAGECONFIG_VULKAN}</div>
            <div>&quot;</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>make sense,&nbsp; V2 is sent.</p>
    <p>//Changqing</p>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRk2881_Eb=3DOn2az8XnXiJbt=
C8azT1LQ7GBSCMuZHvfPOQ@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>Jose<br>
              <br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              &nbsp;PACKAGECONFIG[analytics]&nbsp; &nbsp; &nbsp; &nbsp;=3D
              &quot;-Danalyticsoverlay=3Denabled,-Danalyticsoverlay=3Ddis=
abled<br>
              &nbsp;PACKAGECONFIG[aom]&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;=3D
              &quot;-Daom=3Denabled,-Daom=3Ddisabled,aom&quot;<br>
              &nbsp;PACKAGECONFIG[assrender]&nbsp; &nbsp; &nbsp; &nbsp;=3D
              &quot;-Dassrender=3Denabled,-Dassrender=3Ddisabled,libass&q=
uot;<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#236555): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/23655=
5__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyz=
aA2dNv0fRnQ7VfufnRvC5_W3JR5-ywjKCbECS$" rel=3D"noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/236555</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/119192696/5052612__;!!AjveYdw8EvQ!dPR5LmVI=
me5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR=
5-ywrSm1KWM$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">
                https://lists.openembedded.org/mt/119192696/5052612</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!dPR5LmV=
Ime5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3J=
R5-ywn3VeNul$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blan=
k" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">quaresma.jose=
@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr">Best regards,
              <div><br>
                Jos=C3=A9 Quaresma</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------ItTYvDwz0bppGFyfm9vb0emX--

