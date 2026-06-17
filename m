Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37DDCD98F2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 16:38:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20114.1781714310781494231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 09:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gcWrZDdO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0628ccde72=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFnjP02199244
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 09:38:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=y4AT1MkL5t1HCyMfPPOxD0sJVnYWiIyjKCwuQph5NxA=; b=
	gcWrZDdORZ67Tt8z+jQqMk/fNc6lzMhMeU/oDdXfOEZ39ihnMYj529CV0ulKOeDG
	Td/JYHHroHs7I+SAtPNvhmiBCRtHd5BLjO6Y5tp18CT2JHkaci5/yXVeftTi4sKZ
	hb7Q8qjoaxk492fEvI6qy1l9s7EUmhTHxwIKT+lKGeVdDoFebrNBaENaxwkwrIhu
	qCQ09zbzafHSXE/yaCQ37+SLytnHKl06V/0qqg3EsvraqGh0oEOwHjgKB4s5Wc5x
	ci/oV8USI/n8uYe5/9OaIQdJvzgjbmGDGKDFhcqPsKmgNtUsZj+SIwyJoTqtkNpt
	ZqbO2KwcLoitcDyJr1mfeg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefbsc6b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 09:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUSDUYu+Tgec8aXBPF8ncHT/g5surwi9fDJXhC1sQu/LxxriqwEcq6YAdIUIuLM4ngGPDGFucLLWGXE4XDAidwMyyxY2FELZ2M6OhhX08hYFHvDYBGJiw4I9BXF2YPJfM3gMFI2c3lMuX39u4KDUhE0Bn55F6rbQEmzK1mOWeSNfX7Y+g97OxPTq5SCC+0xjqHvQlaytsyxucgjFxw8G01XDJGBJ3YgVgWTfNIY2csUcfDhBXj4hKHlZRCLaw3ydWEIfuRP7x7FJ/2nhQ9VzW+KgriiiRo4KVNO5BI9SRiJAQyht5+XSZpVQgJUhn4sYI9YM76W4gLtoxQsqmVUI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4AT1MkL5t1HCyMfPPOxD0sJVnYWiIyjKCwuQph5NxA=;
 b=BqBKnO2LeaRCfYvD4puYbssfDCF0RPbxvCdg9jS9+TLjovxkiM+3j/KqDeYuMnMtO6CdLcZxrNsPPJoipbgDSKbM3ZBYG81ivPOZCtODtXnv1f7r32b0tUqVJCgUXKsSVhEPSviUjQEAHApXPENGFiToxanz9hPTVjMNqDXV/epjVDyr6gVgzFj4WeizBIkmMxBG603oB/oShTlvrpLpeiDFqgjSyB1XjOugb4A5LuFnyoXp/jeMmunEAIB8y7LBYN1a6QFxW/ceFxyzhd2WFyYuQLLPrZ8DUEk6q4k622Ng+jNo4hJaMeBRxskeRcxhvig5Hte/Z9q8OPEYhye5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 16:38:26 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 16:38:25 +0000
Message-ID: <d0e15a68-0aeb-4fff-8e43-1ba7a804defd@windriver.com>
Date: Thu, 18 Jun 2026 00:38:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 1/2] strace: Append BPN to FILESPATH to help
 devtool
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1781624800.git.liezhi.yang@windriver.com>
 <0b67fc315b54be36e0ea82fa54bd22ff1e3d62e8.1781624800.git.liezhi.yang@windriver.com>
 <CANNYZj_t-dgUf_XVxPi9hO80Tz1k=3qEm2q=t3fJ9i4sE1_gbA@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj_t-dgUf_XVxPi9hO80Tz1k=3qEm2q=t3fJ9i4sE1_gbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0051.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::9) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1d34bf-6c50-4e35-4160-08decc8eda73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: 
	FaK5RZ1yfpna8d8Mm2HhpS8r6SIP1VSTWNJK/oR8NQygvBXMoDKENdZtP7ejLoB5khFI5sMroaL7eSRESyjBn6395qEKMXTj/iYcb4qRmE8pxHgq6r1gsbBMJqJNGcG2Xrw4VLvssSJmPpEtJbqyHIS3agtNpaezF/XIPB4ZGsZzxKLvwuqunz8hFnvXnP57krBSJMfVMkpEtVd41I4t5kSO45a0Cmnl+MVKNoQYyOJcWtpVqAMdJGHC9JhplOTmO+HBOpVzloakSGPrGG4byvbktfLZzeN0vM0UlpG7yFS3OiRFlMnEP4MKH1eAF0JeWu0n16ltdvofQDlBnKzwD7NrFp8CM4o45RIdfpYx5cLD2vZ9xvqoyIr+YkdEFPe9hVylD3oMpAQS8YtQZuWxaimVeDL8JM9sAXKlZK4LVPqjQSkQLJ3IZlw6YYE+LTeuOUUrIFPuiD8GfHrvnfU+84Mjjxw1DwfZ761EPKwo0IvV7BBzw8xAEI53cTlwmnoYC891GOjwmtEvokd6+3P3R/9s9g/qs4ivTwFUBKRlj2txCLGDdz6Gu6X57aHe3Lds9O4NzS7gAsz8aH8j9uLYcgcv5UXuI6VpJwcuKfQ4FolqH5YeYxj4/hWJR+QIuiXIAKDF2aHpLI3PURIJQAugGMKgtvY0u8Ug8hURfxFEBN4sgcDCrvwemsEf0t1KK4J7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eERsK1NCQVlWdlVRQUF2eFNaMDNlZnl4djcxcDJNWDFFMytXcXB2REwyVkNU?=
 =?utf-8?B?K3ZGRWtQTDJQejlYUjFwZHpJNDZWb1VLRE5tMC9abm52dVRXQnV0aTZYSkNl?=
 =?utf-8?B?ZU1JdGlwTGI4Tk5JSDdzUnp0UnNFWURhUk44VW1EZ01JVm0zd3Z6a3hacng4?=
 =?utf-8?B?TCsrNlduSHBlbS9panVBazYybFY4bWFOMUdmTkRCeXU0NkFZNVRwMjVHcysv?=
 =?utf-8?B?amZxTnVDQ3BGKy8ycWErZGsvSTk4YWVPUERPd1NSSGR1YkFTTVZ5dUpUd3FV?=
 =?utf-8?B?dDcwZytPa3lMc2IrV3Z1RUtGOVRUeWdFWTdiYUNpK05JRmtxY0VHWDA5WFdm?=
 =?utf-8?B?L1VXUXJ3dnBEb3V1ekZ5Q3d3SVliekloRDBrVW1DeDhta3dBRTEvZy9kMFpE?=
 =?utf-8?B?WVdzb2pxbDhNbjBSTURRNS9Mczc2UU9MWDBCdmdtdHRZbUhLZ2o2eUt0WEhK?=
 =?utf-8?B?UUVNdmFVcTBoK2hFb21sY29LbFhRajJiMmxoWkl0ZUhtaUZ2OTdjVnBjek5r?=
 =?utf-8?B?Zy9qOFhoZVVSUUl6Ty9Hc2hSMWphbjZlMWI5OTVqM01qWTVBemxnL0FoemFJ?=
 =?utf-8?B?UmZXWnQrRUEwSWtMNVdxd3BqOGlpUUpyQzkvV0p3Rk5WZjZHd2lIK1hSNUdI?=
 =?utf-8?B?eDRKRmpERmlPdnZZa3k2dmw1YVBSMlpoK2lTVnEyTjNlV2VPN093UlovbkFC?=
 =?utf-8?B?YnFkeHUrV2pHV2s5VVgrNVRhWDJsMjZtZGhNV1BRZ0crTUIwL3BUZngwWCtW?=
 =?utf-8?B?SXVRdUxkS0s5dGo2L3hzRlJwcjdIcStuK003YnBKVlNwakw0UXFRa2svdktx?=
 =?utf-8?B?RGlLd212Wk5VeERhUlFDY2duWDF4NDU1KzIzTlJGaHdBaUJ6WmNEWTBtd0ly?=
 =?utf-8?B?VmZtMVNQbEtuYWZMUmdZbTA2TWcwNXhMZHlJWkhBYjl4dmx0Z0Z3OVZRY2c3?=
 =?utf-8?B?aEN0SlUvV0JUMXRPYVNLQjN6bGxxZzZiblNwdnBhM3NFRTRtNDJIZ3hJUTF2?=
 =?utf-8?B?N1VSQkxlZWxDUnVBU1prTm1aOW0zbWJ3ZC8xcktsaW92eUxTMUJRb25ycG5T?=
 =?utf-8?B?VUlwblExaTVYeCtvdEpIR3BHdnpDREtiK2YzUm15ZlN1N0JMVEQ4MXEzVi94?=
 =?utf-8?B?WENaOEhVTXk3Nis0NVMzUTduL0QyYVlXd1kwSXZvUmN5ZmZQRWlyVlFjSmVW?=
 =?utf-8?B?YTNyeDRnaVd3UTByOHQxR2xqSnI1dVJxUGliYXR5dldoOEdJaG8rRnZiWHJ4?=
 =?utf-8?B?RktQZnFRUlNtb2hMMSs1RE8wUTQ1UlZFVGY2MFdOVHJzdi9kSXVYL244Yk1I?=
 =?utf-8?B?UjQ3MXREcDdUekJzSnczd1FScUsxdSsySWFaNkFQdzRuYjZhbEV3bWxPRFda?=
 =?utf-8?B?NnJ2TDAycUVrdkVrM1BDeGR0VDBhOUhnUEtoNWFidTJwd3BVbHU2MVFMcHJ5?=
 =?utf-8?B?MW9jTTgxeVhZZFo3UUlTb2R0dXlVbmVMZzNqanB2YldmRWJWWFdDNTBaN04y?=
 =?utf-8?B?Q3p1OHU3ZVQxR2F3cTZXQ2piY2NOcTBHZXI2anFwRFFJRGh4U2xlK2NackV3?=
 =?utf-8?B?Qm5namNXbDRWeXlReHY5bXJFaDZYZ014ck80N0hzME85RlpnaGZIWVY5d2dM?=
 =?utf-8?B?ZkViTFA3d0RGUk4vOXkvcEVaOHB2azZVcWJxMlBmdnBTMUhRK0tLMlBaU0J1?=
 =?utf-8?B?RGdzd2UvMzdZZlNJS2VlRzJaQTM0YzMvbk1LOFlNWk80UGVwUmdPZklxaDlD?=
 =?utf-8?B?QWtjS2VlVWFUVnBmNVppdDY1THk1T0UzSSt4RWdJUEN6YWUxb3BEakxMbTZ3?=
 =?utf-8?B?Vk1kUExlSnpKS0s4SUg4UXJERkxvU0lJQXFoNGtuRFRTMTlJUW9SdWxHbXZG?=
 =?utf-8?B?RmxCSGFvMDI4SjRYR1JMUkswZzE1UHFseks0T1BaZ21nSEx3aXRrVnN5SEh1?=
 =?utf-8?B?UUFaYWxZOXdxdEg0aGhvMUtISndCVW5OZDN6QzgyMHJMSys2QkFFTmJNMFJk?=
 =?utf-8?B?VFJQbWg1WXQxczVheTl6N0p0Y3R5KzIyMjJaM3ZWTVgxZ3VkY2pnSTBaMWM5?=
 =?utf-8?B?ZXNJS05CRUZsSTR5Sjk3dDd2bCtORDRTUlJldHk3Qk5mSmdibndDdFNqTjEr?=
 =?utf-8?B?M2x4c0pUdFdSemVQa3JsMFo5dGNoWG0yalNjNGFkWm1wOG9NZ25lUmRCRWVN?=
 =?utf-8?B?anBNc1VNZTZtTnlrUWFyOHNzL2s4WkFNVXFBMVdkdEl1MzExejVTa0tZdjls?=
 =?utf-8?B?ek0zTnUvaXU0czJDbnZLQVRWY3hUR0N3VHVPdXUwL3NPZEZkZ3lwR3lCZ2tU?=
 =?utf-8?B?UGx2UTQyYW41dStuUDA0WDJGTnE4c09vZXd5cFYxMUNiZmpTWWZlTG90SVZD?=
 =?utf-8?Q?QFqPRuBI9uHgm3x0=3D?=
X-Exchange-RoutingPolicyChecked: 
	WhKbeyYoONcfa30Lc6iO40Znyd8RqNWX7EgOraOyjCqgzw13fWXKTBAFcMsGnGyswjgc2HLJLquNO/4V2v+ZyRW4hh02u45bjiRjzrDbRrvptFopkcFU1lbpfCvPlWkivOn2NCiNYTLC8Mq5984v/y+JjL6FK3wDVRkw1TBkPt2Ri422m8gMfQiDYp/XikZ+u44gxOEy+IPngYbVwVcaUuSJ14LmgBoRA00IgVtFk5oQgqtRIk0zWcpeZftBBWD6lq/Vy5uqNew4/IOU0JUKpDuSrodLYHmUwq53E+tSPi7vsJhOqDuA3HrB4UjPytFuZ55I51cotuVNNDZ3tyooZg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1d34bf-6c50-4e35-4160-08decc8eda73
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 16:38:25.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKw9tTHcOzldNwihS6pgZv6rJVn5XdZLIpdrhgwr15zE01Wt7Gno4lL18F3F33uT0dRBDymwgCvLt9lurSCWKKeVlR4FcZBjLcwuhYnkmYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: cHymENvrkcdB6JHAcTw9RW3THO7IuRN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1OSBTYWx0ZWRfXySBPx1iSaezq
 pRheVqpxOVBpujpdZdFvyrn9viZoFiiDZr5A81sUpIeZKakzmbYBm51beO+FVhq8RbPimC+gzfh
 n+kLliUa/tGsCOlMJFvKa+fFz9MbrymQ+ZmzzzbVZaDCywqclApOOXoqR0woR9eD8g/kW4OIGxd
 NClEmsEnkfwvGofzE3qWM5+nKuYAVsZiL4tYZndNlHk7j5mtoQ5jWVuEBez13AF+fLPzbd2OlyL
 whdm2Kaps1YixOHdIPUhrCuUbW769IODkjGXVBMtO+CnSdZZr8ET5Za7SbMoL5pmhz7DjQ/A2EN
 Iqf0hf+3hIPTKQOuDlCoklO4nWQjjKjIV95ZPyJWGdTJ4ZjVIkCH3V5VEC639nOf2F0aNl0Nwyk
 QOAT0HiqQ3556h2YGbGHoNxh9evgtjVSLjg/H1gXAvP/bmTfif39Xtx31YiaatCHNS/n2/n/auB
 pY4+lVuRkm2R6+exZEA==
X-Authority-Analysis: v=2.4 cv=B4qJFutM c=1 sm=1 tr=0 ts=6a32cd86 cx=c_pps
 a=2iQKv3wDMkjwRE6X2MvZ0A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=fkKPS1_--ecyvDWTaeMA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: XxasaZbdhD9L28TTtcR4mvCqq_7wSWKb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1OSBTYWx0ZWRfXylVaaLJnbxBP
 Z3eiDnEBY9MfYrlUwRkMv4WO4eRQQz9VuPQje0AKY+1zucuTpMlxOhWW7QTj5pqUaZKt3Tr0XEk
 cfFrfM/ga2tK7bSzePRjgesCv4C2uEB9TtqwQXvsShEPW5rDYB9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 16:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239038

Hi Alex,

On 6/17/26 00:09, Alexander Kanavin wrote:
> On Tue, 16 Jun 2026 at 17:51, Robert Yang via lists.openembedded.org
> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>> +# To help "devtool finish" can add 0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
>> +# into strace/strace rather than strace/files.
>> +FILESPATH .= ":${FILE_DIRNAME}/${BPN}"
> 
> I'm afraid I have to disagree with this. Devtool does have support for
> conditional patches as seen here:
> 
> ====
> alex@Zen2:/srv/storage/alex/yocto/build-riscv64$ devtool modify strace
> ...
> INFO: SRC_URI contains some conditional appends/prepends - will create
> branches to represent these
> ...
> WARNING: SRC_URI is conditionally overridden in this recipe, thus
> several devtool-override-* branches have been created, one for each
> override that makes changes to SRC_URI. It is recommended that you
> make changes to the devtool branch first, then checkout and rebase
> each devtool-override-* branch and update any unique patches there
> (duplicates on those branches will be ignored by devtool
> finish/update-recipe)

The problem is that "devtool upgrade" doesn't copy the overridden patch
to workspace because it is not in SRC_URI, I'm trying to see how to make it copy
that.

// Robert

> ...
> 
> alex@Zen2:/srv/storage/alex/yocto/build-riscv64/workspace/sources/strace$
> git branch
> * devtool
>    devtool-no-overrides
>    devtool-override-libc-musl
>    master
> ====
> 
> so this strace issue is hitting a bug in that conditional patch
> support. Rather, it should be investigated why is devtool writing out
> a duplicate of the patch to a different location on 'finish'
> operation.
> 
> Alex


