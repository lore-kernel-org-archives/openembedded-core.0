Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20BC1067031
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:11:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22461.1773324705179158542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MJTBIh1V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CDv7JO2662017
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 07:11:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=p+pxlxK8QjuQhDaiV+uOeXOgG9CUXUCrUvb6V9grRA8=; b=MJTBIh1VSc2V
	Q3wP7knfpI6xoHpIlKhhxxobSxa4kHlDa8NNZNVlH8PPb6GCzbHehdIL/H5Qdl9T
	Z7Jwg9GhRFHvNijUpWrHcaudmTkGjdAscuGjy22aWQaNU3dfhxG15QFN49YdPWra
	OU7hOkNp/NeGvdcLrDMD2Wvf+JeIJDGjBMd1sLnCsaWmbCtSGMo+/O9JzTl2xlyn
	hJTQBXLWu+lonx+0JcEGkYS1eHltBTlWWwU7ytbc7K3n81xnJnprGHImRCucngh5
	rxZAcFr+CPwWjrvpfZ5YZA3j+ntVp4tSk/aLx+ZBNSxIzui7mYv4aSSdqDpwUlUo
	ae6BUS/xPQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6t8srq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 07:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFStKFE74ryuQUOxB1LMSzrkFnTJMtKKo8FkY0kqsOSwP183El/Z17A5DmYPjiJnm4fjnKIZCfxdqcnl8by8v2n4JI1JFarZdBIaFeKbaSi5Arr/l9/NOpnGWqMi2n68V6c8tbg3QFeLRjpzvTikfsb/O9hQ2kKTHGxXxx+qRqQ9XWx49xwpo9PQxQrHdJS54v68ohU42SZ5QGr6jzWZJ/1WePL9Q4Cf/n4WZQ15wNndVHEGbd4xz4p+eWJZ3u+ydQy/I5xTgOwtNMqbRAzD2rV4LTRUXkhBTJu6TpU5ByRCv8ySNahsEIujtWtOSqeZdVR9X3yx7hDYDsKuZuVo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+pxlxK8QjuQhDaiV+uOeXOgG9CUXUCrUvb6V9grRA8=;
 b=DG8NGXWQCSEJ1KgMZ36RG8Rg+FFPbMtyW2PN4cQ+QAr4agq2vpPCgHa14eaSOyyvpir0wY7gM3BrnyOb7zSwEkMuX1oXg4QdWpuZNoAdb2lKoua126llg0GPMLaUW1/4lwlm+eYuQs4v8ieiBt4JOjw7JmpGesJOkp6cEKLA/+augahpr2TPfsV6KC4R8uptp9N/qs3MuiTuK44eXiO2Tel8fNbUkhBU9PyHTdHhdT6BCVX+wppv2ypXPyGa5xaCFwSS/dI3ECbL/JlfINpefSkTpe4NAnI4X95Y8TFSbs4cnXwe63F1DKvH82cLEmhfR6pWorVEQsXmvruQicyUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 14:11:40 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 14:11:40 +0000
Message-ID: <ead8d5e5-0be7-447f-85d2-0a143778d702@windriver.com>
Date: Thu, 12 Mar 2026 22:11:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libarchive: upgrade 3.8.5 -> 3.8.6
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
References: <20260311224221.3926155-1-peter.marko@siemens.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20260311224221.3926155-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9c83c5-46f1-4698-6bd7-08de8041480a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yDea0ZMj0CE9X/z/cuPv2U2q+muxR7nGM29hThPHCUdZyR3YC6J26pxmEHUUqoRu5g0St1H3WGuR5sxSSoz+mVgoUmDtqHsb/fnGWrBu4IpknDcNH+MGy27AdmDsFu/1YO/2tMJ0oyMKR7lujG3xEhmxbfZOwrNIL2qLIfeb3bSbtloYnUR/7jKyvUyHCQBnGzWjIezjU83e3DCrA4mPrhDEOhxJRt+wVAB/uL1BW0KbhBmGnaIVuvElDA7Le94qsjulBnGNQ17U586mcdj8zHC8zxI8X+WrNosA65ntkSB5ZNC8hm1oXeGrrGAFTJXCJSaKEXBGbeBTKmtW9ghqZrreDjeci/G8WQ+KsrZdHcVA8i7vM8EQ+B/PtOTj6bd5FYXp1aFgu1t8QUoIXetnTd/Qr1FKeSSPxYf96nb4r3UexVPnWXtS0uhVsVy1FZ+dYIdPBDCK91xQe7O5b1GJCPmjCcNevZtKaU31nF47wumb7gxf7C/BcHfiG1MoZEFkArZ66y+SYYl4lnv/zu8GZyw0EhBtc1yWYWZ2xIsP8n7ivmpbdpOAzlvt93mC6KBB2snXqrQHGNrJfaU7QnBm3SuA0MnHm+K5So8GNvvKyfqF8j23lVWe34FtoVK+XyK8v1jA9a1PD2qak7oct1QYXlQxiHWrpKxB/D+W+YgzwSO+4AkFpFVz7lBSpMuBR0U9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHN4RWlrYnU1SjYxVWlONkdaS2pnd3BuYnFUVTVrVTJaMVVqaVdFazN3OHIz?=
 =?utf-8?B?UVZ0NjQwNVE3RVJiTWZXR2U2UEVNY1pzZmE1Y052OUVORzF1VzU3VW5icnNq?=
 =?utf-8?B?eVJVWjhBbGh3VGkvT05vSHFGY0pybmdRUTQ1UXcvYlhJMzlqZ0c2Z0h3Smxl?=
 =?utf-8?B?a0NvQ0lYaFFXSURlbFFsKzVldExNQXAreW45QmZpQ0R1RXc3RTRJTWVlL0VV?=
 =?utf-8?B?RHhRSmV0WGxsdmljUjZCWU1obk1LOHZJL2tWdFRqZVFsajM2VWVDTG1TYnJH?=
 =?utf-8?B?Q3BWYy9HcVV4RjNhcW5idWlxdm1tNS9OK0RzZWxPZjdweXdjMkF2MEhZbjNy?=
 =?utf-8?B?SDVNc3lnaFpaa3Y5c3pHYnp6d0dDamFNbGZqaUtYOFNaQ0hUV3hwWVF0TWZ1?=
 =?utf-8?B?U0M4eFNpdGViVzFBWUdJc3YzT2ZTa0E4blMySHJRaTlqeEl2U2puSjRjWEdH?=
 =?utf-8?B?dTMzdGdIZGsybEwwcGlIQk8xOFNIVEdRUnpmOXZza3hWUXpZMjNSWmc2U2Y4?=
 =?utf-8?B?YzVkMnVnemZZTU1qbHFocFE4WStLS1RzTmMyZzhSV1I3Mmdwb21wRGI2MlhJ?=
 =?utf-8?B?Q3dNNHZYR1REbmczbUhvYW5pWWZxbTYxTDB2dlFBYkRwY3pndG9ZNWJuOU1R?=
 =?utf-8?B?TktVclVHNHNhbVNJZ1RVa0lzcEF5akFzZnFPVGFZTE95RkJmUnRyMmwvZWhY?=
 =?utf-8?B?S0FUbDVJRmgzUXRZNk4ySDZiRWxuRDU3MEJDY3JxN3B5eWhnZDhQcWFUY3Bt?=
 =?utf-8?B?ZytjMStLeVBaRmZadEdaYWk2SHRBOHpqVUoza0FkRTNYaWRTeWpxbWJieDRk?=
 =?utf-8?B?ZEdRenpFekdsaWJFWGxDOCt4VHIwVU9NR1MwRUFCUW5EMGltWjU1ZnVralVJ?=
 =?utf-8?B?VWZuTzlPNHpGQ0VobkNiZWVlV1djUUo3OVRTWENaMSt3dDQ0NDM4YzZMWm9B?=
 =?utf-8?B?YmVWaTZ3V0xoS2lCY05NYkRGVHl0QXUyYXZzRU5nUTFSY05HNVFtYUh2QUpS?=
 =?utf-8?B?aFROZllOazB4RlFUOWVjVFRMS3VqNlRqT2ljY0NXUVpqK1hPdDl3ZzdqWFJY?=
 =?utf-8?B?QnBsMmNiVDR2ekIzTzV4R3QzajNnVGlqUjBRN2h4a3FNR202UW1ZeEd3dTFu?=
 =?utf-8?B?Qk9QczM3ZWtQTlZyVDFVMUx2UzgyendaVFplM0V2dWcvazJnT3hER3B2cUFr?=
 =?utf-8?B?MlJCd09XYW5XWjhyeUtMalEvTGtocUlweHRFZld6OVU3NmxYU1VETEwwTHBj?=
 =?utf-8?B?dXJVOHhXOWVuOWd3V1VYTkgzZnR0Zjg1N2VlclhnalRzQ1daSnVudk56Qi9O?=
 =?utf-8?B?UFBIdkd2NUUzcCtJaVROalVVYldqZ1M3aFlKUmxrVFUrSS9EYnE3NXdQTCtx?=
 =?utf-8?B?NENSUGJTTEZ1NXczL0ZTcUtGdGhmTnNxZTk5dmc4RHdnQkFuNDZkc2NCZXlD?=
 =?utf-8?B?eHBsTmVDZHBmYlp3NVI0c01WVys5OCs0RjdGUVhUSHIzNjVEWEl3cjBEMFNh?=
 =?utf-8?B?SjROemNDei9sMzVyMmJrVFBOS1BTaWUrTWZyV0V5eWVUR3VBU2xkdE9rSUsw?=
 =?utf-8?B?WGV2TXo3UGswS1NacHgvK1pjTHhLN0pCNS95cnBrVVo5QUFEb3pQQytzUDNZ?=
 =?utf-8?B?dS9pUUxSaUNjQmFNZkRodGtzbVdNbXdqbVlrdjFxbVFRQlZPWnQ4Wis4MEZ2?=
 =?utf-8?B?NXRPazlYOWk4cUpVdkxCOFc2S1lGUjFYdzkwNUxuZjRnS21YSWtQTXVaa0ZC?=
 =?utf-8?B?cHNXdmtaMndZUk9remNPYWZyZ3ptaEhoR253a0hvdzJ1Y01oaDVOK29HY0gx?=
 =?utf-8?B?VUErSElhYjVlRXdhcE5nRTZ4cWVvUWYxSDJRZE42bU4wVWtOSnhqMjAzUGor?=
 =?utf-8?B?Mnc1NzZTNEpBd1BzN291Zi9iSW1qWjVzSGc1K3NTcHhlcEduWjUxYmdyOWty?=
 =?utf-8?B?eEtNNmJ5cGFNSE1qT2hvR05Jc3VxMDU2emFVWW5sem9Fc2FNYWsvYXpsOHds?=
 =?utf-8?B?RWFSa1VmcGxHdXlscW4xMVZkSkJwdDkycTRYSTg1VXBnZ04zcUR2NXRTMVR1?=
 =?utf-8?B?WGFJV2RWTnlDbDJ1UStaY2pOZXVFWkFYWXh5RVpjREZmS1hYbGZqU1pXVm93?=
 =?utf-8?B?Q3RqZkVWYmdEQlArZU1wcmY3NEZCTExiNUtCWGxlNU1jYzIzRk4rUHQ3MWlB?=
 =?utf-8?B?V005OFRHUGViaUFRTGR2WGFJNjZickJLaGt3Z2NGbjR5dXN2b1NoQkhOZlFu?=
 =?utf-8?B?cWJyMGZOalFHWlJVSjhOMFVySG9iUERXY3h6R0VvSlZHMGYzemM3U0xFSEsx?=
 =?utf-8?B?anlMd3hMTVVGMG8wd1Arb2piV2VRWmcvSTJtdTJrN21QY3Jacnl6YlgwajMw?=
 =?utf-8?Q?sA6nJGcNIx16MXJU=3D?=
X-Exchange-RoutingPolicyChecked: 
	MThOjEoQo8BHto5GpSlGUffeJofp5gU9pjGB7CoCRQReJEmgDAbPpUt6WneNiuJh9jV4kQI5U40xMN3B+P79fDCsv0E/jMZy3RQL8ODdFff06vRgugSYbC2uxKCssNLiu2mQPt8X2yQ+Q3p0cz/EOqjoy3G46KfEJfW+mWI7Bp5hvxyosaHl/RaErui99KWrWbvpVR7As8lm7X0lu4ZTxQSoM6aR9fTxATIpUmh+3JR5jAddnZYnMyK6g58gEnssqhBJ0+Q+UKTN+9LaUnJqn6QqiqVHOn7yzTtwSoeA/ZyL/FnoYbNgXFYlF03gb2xUhoQtQbs8V+NrilI0qy1Gug==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9c83c5-46f1-4698-6bd7-08de8041480a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:11:40.4952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezxeaTbteCIk2OjchLhsLQI+9u9HcG+RfGhTpqCVLHFyFBMmBgK/P3buNV/juDtZzCdH264gLFsJxl0jLkHRF5TiDn8RH1VH3i18SrX1B7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: sMBHCmS9NjhHBnb5MKsGtfEw5-IHKQRJ
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b2c9a0 cx=c_pps
 a=/9/UiQo4Js8eZu4DIT4oEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=qhOjpNPHAAAA:20 a=3uWsZ661AAAA:8
 a=a_U1oVfrAAAA:8 a=t7CeM3EgAAAA:8 a=vlpD3pBSckTNiTQvZhcA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 8ILK5FnXkcb9TTd8T45TeG3qHIA4zVKC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfXw+lLAozmw6+l
 VG+pt64nBvdIKt2N3x4c1U9LrjIk2Eo0NdFvFT9o2t/BEmuDsFXJW1p/XYRc6DoWSBarntqfkd2
 WHibj/hiCTnK+ktvFIOc8hwIJb6bMrvkaZ6UPAcC0UOm7SyVjMRPhUzLA/4uCU3wnMN4rPgl/VQ
 MiFrBgn4Y3GdFGTnuGtjKe0IlbcmjY0zfYpV/lekrP7iHlUsWdqMUdbvDfTor0IBgOetrRhQ/Ja
 7ioRUMZ65m1no5FskzPZAxibuIH6TD0SNk3YaXf/ZDbJWfSOUFaBwGaUHxG+nkhtajdMopOR1EZ
 aM2xFco9jrjW0inTmKe4fwQql/+knGSTYCx6+k46N949VEn0ou3eHyYVcAJstZHTBYuA1yFOAJc
 LC5j+buBJUyO+OyksjCbtluOTLne/nCUepxNZwgqKqN8nlUzH7+M8qb/M2Wdj7vMAFGCfKi4IvU
 TWxJdVoM0WHHZEuJutw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232967

Hello,

I've taken this patch into rpm 6's upgrading because we need a PULL from
github:

https://github.com/libarchive/libarchive/pull/2846

https://lists.openembedded.org/g/openembedded-core/message/232960

// Robert

On 3/12/26 06:42, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> Release information [1]:
> 
> Libarchive 3.8.6 is a security and bugfix release.
> 
> Notable fixes:
> * libarchive: fix incompatibility with Nettle 4.x (#2858)
> * libarchive: fix NULL pointer dereference in archive_acl_from_text_w() (#2859)
> * bsdunzip: fix ISO week year and Gregorian year confusion (#2860)
> * 7zip: ix SEGV in check_7zip_header_in_sfx via ELF offset validation (#2864)
> * 7zip: fix out-of-bounds access on ELF 64-bit header (#2875)
> * RAR5 reader: fix infinite loop in rar5 decompression (#2877)
> * RAR5 reader: fix potential memory leak (#2892)
> * RAR5: fix SIGSEGV when archive_read_support_format_rar5 is called twice (#2893)
> * CAB reader: fix memory leak on repeated calls to archive_read_support_format_cab (#2895)
> * mtree reader: Fix file descriptor leak in mtree parser cleanup (CWE-775, #2878)
> * various small bugfixes in code and documentation
> 
> [1] https://github.com/libarchive/libarchive/releases/tag/v3.8.6
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   .../libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb}     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb} (97%)
> 
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
> similarity index 97%
> rename from meta/recipes-extended/libarchive/libarchive_3.8.5.bb
> rename to meta/recipes-extended/libarchive/libarchive_3.8.6.bb
> index 7b10823002..d579cdb65a 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
> @@ -34,7 +34,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
>             "
>   UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
>   
> -SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
> +SRC_URI[sha256sum] = "213269b05aac957c98f6e944774bb438d0bd168a2ec60b9e4f8d92035925821c"
>   
>   inherit autotools update-alternatives pkgconfig ptest
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232914): https://lists.openembedded.org/g/openembedded-core/message/232914
> Mute This Topic: https://lists.openembedded.org/mt/118270139/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


