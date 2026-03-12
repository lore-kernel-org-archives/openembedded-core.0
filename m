Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E39F106ACDF
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 19:08:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.590.1773342479667243215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 12:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Ye+EE8l7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7531442a75=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAWeiK3560518
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 19:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=iKOQbpEsh46wEM8o4eE8YC
	mq0QKH0ONK4pMTr4IdMwI=; b=Ye+EE8l7ATQF92IyVaTnfQsCPkkZRDmJrqU5hg
	DmZrEjBsIn8V0SAwxyvoGzID/dGX/jARWeFxsgYtVbV1hmIFRAkGiwUTjuG0cuR1
	SGn9ZCwa/647QXP4te3M0Nike/jgDlqBxfoTDsD95G/C0YuqEcfwnxc7nSiy/cTv
	jIMYhqaPYz6dVLcG2vpD1+kPdWgBAlSFZZT754MfuCuB19dBiyrEhyJ+mnOVdE5O
	yAZxFHwzShO+tTmJmfTYirBz/HjUEalvgGUjqUBYzBkYpGPI6s/34O/NEpIjCZVO
	ikiN1WW3+MW34mIPvhsKpkh3Nyqx3Q/3p1BG13Y++/7FHBkg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78h6bx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 19:07:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbDdXx4GrTDNChVHlmEnzjNAsEuNORlCR3eYGr5+TxeFwR9VxwMwjSWW0EMpSHNJ+1LBUcF63LEjaY6hMGbZh/9YXukeZMRTmFokRvKjtZa4E53dRwi0F9nXciAK3LAtkO0ayfmCqdNypuMZyBBekycT1tgfJaPQYqOxlw1zVPL7INwu+xw4OXqYetZwgSoO9x9uO2GTpVkXQ+YlA3jpFZg1sA2txtJWyWAz4asPXQtPBnbMibZXaYv/V8i60uP6st/pYGeJJ2h6V6OyFDHndvYgaEucjyrR51fTdWkgVaXThD2FLIdrMOJANBvnLbP0gYBTf8fy3fRF+gW5ZkOMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKOQbpEsh46wEM8o4eE8YCmq0QKH0ONK4pMTr4IdMwI=;
 b=XhW5Kn+AH3gFD2YyHWCkGHU+U+e6ho9FEJtLd3HrEvm1Hjlj0zbTiq5LCuYPDJxk16l+HeocMio10b6iLsR9x0rl+XZmKg6h6Zya2VoCQ5XM4mA+vcrlMBHDUecS4uZPXKviM8V4iqAEIgyZL5+bYrOpDRJtLvUKS0gR8KuyXvxWFhk4OpGK3gmPGZkS47CQbctLndofCVYsZJmkL7pBM6jiOF/RAqLVp/+XaotohLRUBGWJC1JdsdomtpWhbf7QRvZ3rinJwGVjpM7kU0q8v+zjN6p3ek38fzQWYgd+k69XA5etdY0AWvj6zl/b2d0xW2DguVawk+LNyOb4ut3Lxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 19:07:55 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 19:07:55 +0000
Content-Type: multipart/alternative;
 boundary="------------fVXMAFo4XT8rgocbNtfUy4dG"
Message-ID: <0d193cac-0f0e-4eb3-a462-ba5c459bce73@windriver.com>
Date: Thu, 12 Mar 2026 15:07:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 5/6] barebox-tools: fix build failure with
 glibc 2.43
To: Alexander Kanavin <alex.kanavin@gmail.com>, Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
 <20260310174403.2309825-5-Hemanth.KumarMD@windriver.com>
 <CANNYZj_JtZZ7Ftskf+W46LuradpnFv1CvyYt2G_HPJovyCq09Q@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj_JtZZ7Ftskf+W46LuradpnFv1CvyYt2G_HPJovyCq09Q@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::9) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM6PR11MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a675076-695f-4b8b-e9ba-08de806aaab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|18002099003|56012099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	jH0/YI1rvYx2dGXDhAg7Q6EtNitmMtNbdQOh8Z0J+5DYd6xyfroaGKq3mL9QfeGozrVttVFLaWcRYWQs8jOGuguZ65PNc1sdR66fzOLGjrjmUUJ3SWqtxZ0xRWlO/6KqZ6HVM/x/93sagNyfNp9MnwIRIJGpWsltGTR4g9XZvqwVK/8DfMSYLSNeN0rByAHfreizRZlyaQmPSeAgcicimSYcbpgTKVaYbRkNmkUh5gN0zehWKRNBXEGir3VmsF4Sqfq8hGXWqUbGCUuwKtKcFkU1nedUcI/RtCh29fG6tyaGD3wBMhNXXc5FugMwS/kdiQ57xFdWN/074y8emH9/VuTMy3rMu07JaLDQrqu9YpWOAQDFLGy0ePCemzmjQMikzcgpYhbM66tKk9PDCy15g6b4ju/rS5sZ+I0hCZNmJmRnoPa2JIZRRboLhEGFdiXUhBEyMolDdNZTmeOvKJacdASlTEA3Gabk6oheRZk4bW8LDCm5SGe/qDPkE3aEIK+htltK/nFuSHNKrfD2cQIJTkLLzlZ6dAp0yugETYgy441q4Fiz0CksjMdGK4J7UM6wv6X8JQohHvqA4C/9zeX5WR3dHaFZ3KgBEoClI0yrGskA7Di56yUtLVIuAPf0OAOIiX27mShz64PkELMpxh2WMtRP8YVjhbCgc13NCaposyv0BJdLDD0eb+M2jBhhMLPp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(18002099003)(56012099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUlicEcwMmpUVGt2ZzQveFM2MkVISlczdWFIVXJsMDV3aUdzSzNjTUgwTzhC?=
 =?utf-8?B?Q2c4a0lkQi9NemZuK0QrM0hDd1dFMnU0REZCNi96eTFGZEtjNWdzNlRNdGx4?=
 =?utf-8?B?dnRnU05zYnNmcUJOZUNUK1pFL015QVhEVGIvZDNYLzZabXNmckd2SkVBeFhK?=
 =?utf-8?B?YlBMQ0hPSGZmTXg4czExbXpMMjJaSzh6UGE5amZXVlJSWDVudnBubGFlWlVU?=
 =?utf-8?B?bElwcVV6ZGlWZ0dONG1FaWZYZTN6bWVyMDJRMit5dVU3em96ZURIakN0eTg0?=
 =?utf-8?B?L284eDl0Y2VyRVhSTHN4TGhBRVJzbDQ4TjdXdjN3bnE4OUZrNEdRQ3ZMTWlV?=
 =?utf-8?B?R2xNSmQvV0FPK0dMbkdtQW9hUi9pMFBqNWVURkN0TzV1N1UwNnM2MEEzKy9U?=
 =?utf-8?B?K0NmSEVwTFlmODVtYVFlSTkzZjZMWTRVSDhzOVl0MTFpTkNmaTQxSDRrRW9p?=
 =?utf-8?B?YkZnTEE4Y3Zvc0Radk0wVFBHeXVKUHpZQnZaRTZhOWhtcnlCaDdCb2VUNlZB?=
 =?utf-8?B?dGFONjJlRUkvcTRremIzVVVLYWJHMzI2QzBzY21Yc3VlQW1WbzRZR1NLMnp1?=
 =?utf-8?B?US9pWEpCMkJnbk1VbnowVzNSbWV4SDYwVFhOR0dqN05ZbGwzT3VSa0hHOW9M?=
 =?utf-8?B?VWpVSks1NERKTFZLQ0lud0JGcUxJL1NvUDZMYmR2QVNiZEhVVHROWlJVSXlK?=
 =?utf-8?B?MEFENDB3M3UvSTVMY0QzNnRnRk9kYVl6d3d4Zis3L0N1R054OHVCUWdETk5m?=
 =?utf-8?B?NW0xWWdNejJNVkFuTitKbU4vN05yRGRZQlpWUDZ5NVV5VXRlZGN4YzVaUFYy?=
 =?utf-8?B?TnM4bHRpK2dmRTVnTmcxV0cxOE5zN09MN2ZLV2xtclFOTWpyMW9HQUxPME0x?=
 =?utf-8?B?eXRIQXRXUVZ6cGptVU81RW5rc3RCUy92ZG9HVEs4Tk9vSlAvWFIxY0pKYm9Y?=
 =?utf-8?B?N2d4VHFuSDBpWVZnTnI4ZnpjZEdKbEZCb0JpVGU3VkwvbkgwY0FaaFZ4akdo?=
 =?utf-8?B?RURxMHVuVlZXMFVtVndycUhlb1VDQ2d0SERvS3hWUE5XZlprWEw3c2NxckxZ?=
 =?utf-8?B?RUdVRHFQSEQ2VEFDYlZKcWszcW9yajlEL2gzeEdUNFZ2SmlxenA2aXZxSVBo?=
 =?utf-8?B?bjVkeDZvNUY0WlpIeEtzOE5CM3phMzk5dTIwclFQcVdpUFZ2QzJUM0NGVUtQ?=
 =?utf-8?B?eUgrbk44MWl1cGFUMk9VM2Q0SyswTkQ2K05sMDhFa3NXSnRCV3NSc0Qzb0JY?=
 =?utf-8?B?SzI3dHdrZ0hqWDFQTVRTTHVLampteVRRcWZUTVVwQnBoUE9XSFhqclM4ZlBJ?=
 =?utf-8?B?VXR0cDBiandRMllnMi9hSC9pZ2JxWm1WNjljb29sWk1IODQwOXZPckFMRzds?=
 =?utf-8?B?QzB1aVAxMlBqOGlRVmJub3JZdGpyS1dvR1pKSnN2OTJEZGw3bGlnZ1RtRGcr?=
 =?utf-8?B?VkFlNDlob2JyMTVubnJ4RkxnU2VOSlFNWHppTXVKbXdKdFlpYTdrSlU1aklZ?=
 =?utf-8?B?VnNyQ09JeU40YU5KQ0xoVEkvSjZKL3VoZUttYWJOb3JEbG92ZjY1YUR6azhO?=
 =?utf-8?B?UUd6UGN0QmpCbXhnYjZxVWtYWTJhWXN6RS9pakpQZCtvQ0liTk05OFRoTmJB?=
 =?utf-8?B?YS82SjJVL1U5RHU3MEl2NGQzR055SDVVcnNSTGtWczBESnNMWFpuODVkM3lG?=
 =?utf-8?B?K3c0RG5lbDliZGRXdjNaTkY2bzJFUWNGVm1BNWx5ZmpnbEFUZTY2UXNWUkxx?=
 =?utf-8?B?ZUZOblRBZG1UVGVCOExKTDBNckcxcDdNc3dzS3o1TEkvbDZKKzBmanpzMTFl?=
 =?utf-8?B?Vld0WmZ5UUhMMGIzaWxTak5pY3hKUVQ4S0pLSWtraDcwTmdTT2FaazByQWZV?=
 =?utf-8?B?alVONUFZOVZ1ME44T0dob3IvdGgwR0FKWWtXTHBKdUYxSVMrempudWhkMkRD?=
 =?utf-8?B?aGNxREdPTUtIdnNyYXB6TmtTVkppMkpkQmR5dUZtT05wOW9ReU9XbjRoZnZM?=
 =?utf-8?B?WFY0MzgzQWxzeGxCdTFCL2ZnVUpKMkNKRk1WMEgxSkI5QklaSmVlOGdiaWdY?=
 =?utf-8?B?ZlllRThWbDd3N3JkUmtuR280UzFQYjZLSWk1MHZINWxXM2YzZGppNDBOZCtT?=
 =?utf-8?B?QVhFRi81SVNZeUJZbS9LaWhiUEtCcXFxeTJDSGZybHR2MktPVnp6Q2c2VXda?=
 =?utf-8?B?QXRvRjVMMDFvMUpFNGdwUEMxWlVxS2ZKSWplZmhzSUpsS2QxZklLUk85SXJn?=
 =?utf-8?B?ckRTK1JOYkExMnY4V0NJRFhzQzdWUms4V2FjVzRPMFoxdHAvZHduN0Q4eG9P?=
 =?utf-8?B?bEY3MG9abkFPRUZ5N2U4SXZVcy9MZGF0cDZTc0R0aUhlSW9TYTRvS0FnZ1RP?=
 =?utf-8?Q?5fneWl1zjFL11X8U=3D?=
X-Exchange-RoutingPolicyChecked: 
	FBlSiSCZ+hU7FOAAe0CmYlZlOsGLUkt179ciXMujdD7ykxiVTyNZKK4jcfKrIp/5P5X7A0oWX1RFoiVYVs6VWnSv3K61I3yHBizSwYALX3BDUrmpFAokWG9nwEpU9zJYMqPGeYPCqriRGmHnIXHhrfTBRsfbVrPjYl9qb/lN0fjWwZ10PnlKnneDEDec9ynL6ubjZlygJ9+7j8eEFoNJ0r+vWfwrt+ztUMjUUfhpAY1HftuiFW3U8o/IBuOZICSeVXOJgC6oPuT2cK6xubuc0UDsy5NOf2W9QGHIE+rhvuPWnvFBwkwALPsjJb8aLd05rRjOTNh+kBIsxRgLV/ntnA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a675076-695f-4b8b-e9ba-08de806aaab3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:07:55.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Td+07KhmjVY/Kw0b4j15knS4z3z/U45iTASZx7BcIvmxCMI2N1sClHXCeHOBBlLUhJShbQarZjPx+oVllHMdpnnP5A9V1UFVj4ZmXBrmR+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b30f0e cx=c_pps
 a=PQms4psfS+nBHIg3Mxsk7g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=WIFmTDQCso0TJoeFNZMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pGLkceISAAAA:8 a=77_RMDZpY8ZedE_7jCcA:9 a=AEyrhymY8UG0mEfe:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NSBTYWx0ZWRfX2o1CREpPKPTd
 kNN7/T+vnYcp2wQwNb35T5hPoeZ3l9h2lFI4eLMM4Mk4bhaIsvmYwmMVCzY6W1sEhCq8rlrmucM
 OMNRxDwq1tRzdK6GU7o/4CxErTg/wujI7LF05SemHgXzvDSEEGHu8/BWvaMe77IZd+WWzP4zANm
 58Uo1GhdeBr+faHunx6uui7tU0Qd/03nMJW39FPalb6I08LjNKZTebPEJntX3v11NlJw3wJiKti
 8RhL7TAtiz+HT/JGoEtdJxh2Z2MBWLVaA48qq8KoNeFTlRSGV6ZPIuEPb6Bt139IpaqEE89iotW
 xsdoUL8z6ORSp+qj3JfrRkCZkebgR97GEGzpSYqiToJ6sUb2yIafWyb34WnQ9wPTcoFFODdUmdB
 mQIG5bDeeDsx4dmMtJPvwUX6UjlEauCaTK90PRXzYxp7qJzSucEFEjI3s0xiCF0NTiQry/d3b2J
 w6U+72QV4/2+XvUhYSQ==
X-Proofpoint-ORIG-GUID: dnoj_oLeMCX7GE0iYae3H1rwcB0eAweB
X-Proofpoint-GUID: HFeuGTKMln_sgTdtC7uS5d0ipMvlqIoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 19:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233001

--------------fVXMAFo4XT8rgocbNtfUy4dG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62CAWeiK3560518

On 2026-03-10 2:06 p.m., Alexander Kanavin wrote:
> On Tue, 10 Mar 2026 at 18:45, Hemanth Kumar M D via
> lists.openembedded.org
> <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
>> +barebox-tools: fix build failure with glibc 2.43
>> +
>> +glibc 2.43 introduces linux/openat2.h through the fcntl include chain
>> +(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
>> +__u64 type to be defined before inclusion.
>> +
>> +In barebox scripts/include/linux/types.h the header <fcntl.h> was
>> +included before the __u64 typedef, causing build failures such as:
>> +
>> +  linux/openat2.h:20:9: error: unknown type name '__u64'
>> +
>> +Move the inclusion of <fcntl.h> after the typedef definitions so that
>> +__u64 and related types are defined before linux/openat2.h is parsed.
>> +
>> +Upstream-Status: Pending
> This should be submitted upstream, we should try to avoid adding
> Pending patches without a clear reason given.
>
> Alex

Hemanth meant to reply saying:

Hi Alex,

Sure, I'll do that but since we're in a hurry to get the glibc-2.43 merge=
d,
I'll keep the existing status and follow-up with a status change next wee=
k,
once I've had time to submit a patch to upstream barebox:
https://github.com/barebox/barebox?tab=3Dreadme-ov-file#contributing

Right Hemanth ?=C2=A0 =C2=A0:-)

--=20
# Randy MacLeod
# Wind River Linux

--------------fVXMAFo4XT8rgocbNtfUy4dG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-03-10 2:06 p.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_JtZZ7Ftskf+W46LuradpnFv1CvyYt2G_HPJovyCq09Q@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Tue, 10 Mar 2026 at 18:45, Hemanth Kumar M D via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:Hemanth.KumarMD=windriver.com@lists.openembedded.org">&lt;Hemanth.KumarMD=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+barebox-tools: fix build failure with glibc 2.43
+
+glibc 2.43 introduces linux/openat2.h through the fcntl include chain
+(bits/fcntl-linux.h -&gt; linux/openat2.h). This header expects the
+__u64 type to be defined before inclusion.
+
+In barebox scripts/include/linux/types.h the header &lt;fcntl.h&gt; was
+included before the __u64 typedef, causing build failures such as:
+
+  linux/openat2.h:20:9: error: unknown type name '__u64'
+
+Move the inclusion of &lt;fcntl.h&gt; after the typedef definitions so that
+__u64 and related types are defined before linux/openat2.h is parsed.
+
+Upstream-Status: Pending
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This should be submitted upstream, we should try to avoid adding
Pending patches without a clear reason given.

Alex
</pre>
    </blockquote>
    <p>Hemanth meant to reply saying:<br>
      <br>
      Hi Alex,<br>
      <br>
      Sure, I'll do that but since we're in a hurry to get the
      glibc-2.43 merged,<br>
      I'll keep the existing status and follow-up with a status change
      next week,<br>
      once I've had time to submit a patch to upstream barebox:<br>
      &nbsp;
      <a class="moz-txt-link-freetext" href="https://github.com/barebox/barebox?tab=readme-ov-file#contributing">https://github.com/barebox/barebox?tab=readme-ov-file#contributing</a><br>
      <br>
      Right Hemanth ?&nbsp; &nbsp;:-)</p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------fVXMAFo4XT8rgocbNtfUy4dG--

