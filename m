Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664CBC28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 10:34:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8671.1742294057234228758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 03:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=517274a2b0=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I71vev014426
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 03:34:16 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92jtvgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 03:34:15 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52IAYF9U003893;
	Tue, 18 Mar 2025 03:34:15 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92jtvgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 03:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0IELrNf1eRAmJpX46lw4I2lNdYPOFOpmLDuGL8Knhky+YNsyPEDj8qtS++6H0nqxQj0sohucopYAa+iAkzWoGBRgxdhI7AlKmwlrLmqYtk75gzVZ42ugNWkMvc+BfTHbuhHWyTSqEMBaI4MBlQXqG0LJG4utgvuFdtcP8Hls9VYO9g/ewxEuV5ji+5pPhdbtwMQUuxSDUfsGLcUeR4jCOug6u1v82LzOxmNtZmTFhTvs5OMH8cPDvZwQZhiWQyqCWLPci6hO6CZVppsx/2pkINd3TmFNz5v/lorXYy5ejszVAwA4FxoKpuBuTAJtB2UMUPI3dRlyd21k20Fw+LXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUxOPqJhTA8BgFeK5ZQppxZgoJ6lrCcjBHCUK8Q0bPE=;
 b=n5wb8cc7dEc5RHI2UWUdUg70gHs+B96VUJ0e3U7Mqi3oXbBDk4Z+TcinigJPxa3LT1KbNuTjfbOn1aIm9CKN9UBpZb7dpzgyW0O2GgRe3NAW7iyksl2nSI8HJYthOL3vfHT8KSmQTHJUrB6faUqBimwC3p7Egu4lwVyVR8AvA4kPftwWWwhLnyfVK6QRfIG+Z7iQcVuIh2ywyy/9iwkzR1v66gsGnntN73RKu/cz5GjutlwcpL3W1eSZQaDi162lXOGUnGjZrPUuITfyI/ob+JYgcRZjgJWz4QeiiQJ84y15mdSrfL+I2pexHQNNi6FUAp2RVMjkMPcG+VxqeoADYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 10:34:10 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 10:34:10 +0000
Content-Type: multipart/alternative;
 boundary="------------KpLYeWEYiYhlA05V1FJFB2rA"
Message-ID: <4cdc1b55-fd96-45d2-909c-c583645c2b70@windriver.com>
Date: Tue, 18 Mar 2025 16:04:03 +0530
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
 <aa6b3d4c-bf6b-41b2-98e4-0ff854c5fc8d@windriver.com>
 <8977d71f-acc9-4653-8f56-076893329f4e@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <8977d71f-acc9-4653-8f56-076893329f4e@windriver.com>
X-ClientProxiedBy: YT3PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::9) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: f4963064-4905-477a-9330-08dd66086aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ai9GQXBXNmhRRnJudTllaCt3bXVHM3A1a3BIcHRIOW5qeEY2OWR0TkpYWFNq?=
 =?utf-8?B?UFcyU3ZKWjQwSDhuUkhxMVcxUyszYkEvdWUxbWRpS094Nm5ZNGRaL3dnbUQ0?=
 =?utf-8?B?UmVPUUZ2VUpQOG92UjQ4eE9pZXZGR2p0ejV5dlF0YkpnRVlCaTJsN3R1bjRs?=
 =?utf-8?B?RG9GbHc2UDZWenl1THNxT3dzM0IzQ1EzcDhuVm9ZYVVKZHF6Z0t1TUhmWWVy?=
 =?utf-8?B?YnpHaTErNUF4SnozbzZTYlN6OTIrNjg3b1lPL3FETHBUb09uazB4ZDdCeWI5?=
 =?utf-8?B?NHR4aXZTYk9ZaXoyMVlCbS83aGVGSHA4aHdncmJDNlptNjh0TVNIYW8vK0kr?=
 =?utf-8?B?eVRGS0NKU2NvYWM3ZjhIbUJGdkJZSnptMjJvR2hzTDFndG9XTEhDKzI1N0hX?=
 =?utf-8?B?blN3clNXTzd4RStLTkZFQlRXRnBQOWZCcVRpbExNcW1PcllmeWM0V05TWVc5?=
 =?utf-8?B?RURvdkxhUjVnbXhsRUhXREd6b1gyeHRkbHczYzhJKytCcTJKL2ltK1JFcUY2?=
 =?utf-8?B?cXZGTmtIMnBzQ01pUnV0YitjbDdMTGFYeFdsL0xCa2hwTVNFaU82YUlSMXpt?=
 =?utf-8?B?cmhzcFNMRStjNmZUL1VvRGRCWjdmVjJDdmJ4eEJFWC9jeENrWU5oOGdhQmR2?=
 =?utf-8?B?L1paL3gvTHNicGU4VTArUFBrbmsxb1cxMnNralNVNHRpT1o0NDhoM1hVMXlL?=
 =?utf-8?B?blRzVVlneXE4cEsxK3B5bmNSNWZBaW5TVlQwb2hWS0FjM1dKQ00xalAyOGg3?=
 =?utf-8?B?UFBUWThrQ1IyaHBYbXhJRFZnMk00MldKd3VSYkJOSCthbmJTWmlhaE1qMFoy?=
 =?utf-8?B?ZXQ3RCtWdWs4akxWRVNDdkxCUTAyNUJzZW5QbEtjUFRkb0w4SWFZc3NUY1Jo?=
 =?utf-8?B?L2tFNnJFRWUrQ3Awcmc5S3hOcWZJdGxBUWRpbDFjS1dWbW00QWtkbDZNRGVF?=
 =?utf-8?B?YnArb3RhY1JlRVZaNldmNSt3N2VGcktnSi9NZm1rL3dYK1hHTjhIOWs0cFlN?=
 =?utf-8?B?bmFRZThnc1l2TjNRdnB6K2pGMGZYT3ZWN1BUTXF1RzU5bWRPYmJ0RmQ0OFVq?=
 =?utf-8?B?NnFRcm5oY2ppaWN6bm5XM1drN3hwT0tNT3NobHZ3QnpKcWRncXF2YTlPWUZ6?=
 =?utf-8?B?TCtsaWpiTmlWdEYwbVVDNlVDcFZRaU4wOWdEOUU5a0VXOUtOQWh2MWdWOVE0?=
 =?utf-8?B?ajd1QTkyc3AxRW9lZXV6QTIyQkJEVVhrUEdxb002SFZ6OStNa0NwVkN0Tzky?=
 =?utf-8?B?Sk9VS3Zuelo2RkN0ZUZ3cWZrRENGOGdyc0lLdnFYcjExbHRUTjRtdUFtUkpl?=
 =?utf-8?B?MnN4dUpqUmdOZDZOekcramI3LzFzTE9zb1JNMkRuMUI2enAyRGc2U2pQQ1kz?=
 =?utf-8?B?QXo0dDFjUnY5cWZFNjZaT1RPNnBkandIeG50T0xkeEhxYlhKQmZzV051ZmVa?=
 =?utf-8?B?T0VtbXZJVXNyMU16RjVvZ3IvZzJwcGEyNFZrTlg0bmhBQ2phcWxuN2ZPYWJj?=
 =?utf-8?B?SzVtM2pDRi81Qk9WNnRpVVdtajhIM1BDbVlYUmlzdGF0Vk5zU2lxVytGakVG?=
 =?utf-8?B?YWFLWXZ0Qys0OEQ5OFRKWGxZa3FoayszMnhGR0Q1QkgwUlI3bm9kMUMxWFBn?=
 =?utf-8?B?MnNzRFNyY0RMUHRycTNSdlQxcnNtbmlITUM4TXYyUW1GVjhDYnZyYlBDQ0wy?=
 =?utf-8?B?a1IrU0ZRbFVRSGZkTWZBSWJwTjFKVnNHS0UwQjRtU1p5SGs4M0ovb2lDejAy?=
 =?utf-8?B?ZmJCRTI3SWhYbVVReitMSE1nc1JpSjNFZGswWjd5RlpWam0yRlBmQ0JWaEVo?=
 =?utf-8?B?bFhhamJwaDl6a0I3VTh3dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWJVSExUcklEeDRSUGFvZ2lrU1JmMXRhenA5QXg5Q3FiK2xmWXlNcEE2dXlB?=
 =?utf-8?B?UHlxQS9zNTZrQkRiVWpNbFBNUkEvK0pEUWhJZFNad2V2ZW5aV25SZFlwSnBG?=
 =?utf-8?B?ZXpRUFMrZDdGbm54ODBsUzVKMWU0ZFd5SFF1K0E2Y2RIcG5XdHoxS0EvNUtS?=
 =?utf-8?B?S29GRkRXdmE5T0FXalNmWjZLdzNJYlpLdkE5M3B6cmJ6OXpqQkpqRVFJQjJv?=
 =?utf-8?B?VXVKcm1UMGgrRVNtRHdtZVRrZjFYODUxb0FJZVhtQ1dvVm5HL095bW9oN3lB?=
 =?utf-8?B?OGVLWE9uMjU5S0F2WjE1MVMxZmlVaUF2RStIUloyM1ZaYm1obTR0WHo5UzZW?=
 =?utf-8?B?ay94Zy9SUTltSjRtV1VxTDNiUTg0djllcmdqbVdBT1QwR1E2ejh3RzFsVEQ3?=
 =?utf-8?B?UDc4UjZNQ05ka1VWMDhUQ1Ewb3Z3N1g3QkhhYmlVUFlCeU9PeUp6b0FEdWRj?=
 =?utf-8?B?U2h0N3Zhb3V1b3NnZVZYZC9pSzA4dTd0cEJlbDBaWGI3N09uVklLczVLSDlr?=
 =?utf-8?B?bVBVeG01NnlUck9WbURjS1pWL2g3LzFnYmUxT2wwV0FCV1RMdjRzTWtEcEFo?=
 =?utf-8?B?b1RuaXhpU0RZQWloaHFyU1kwVWt5b3RWTit1N3JGUlpWdENlc3F2OVVCRWhx?=
 =?utf-8?B?R2VQVHlFbmgzYlNZWTl4cDhPaDcxWGg5UzZqWmpwUTdkZFFEQ0lSdUdMa01Z?=
 =?utf-8?B?SVhMMXdjNjEvZUt5OEJDbEw3b0Erckd1dlhhZk14REd6Q3VkK0plQ2drbmFu?=
 =?utf-8?B?VWEwUGxYTFBKa1B5SjUzY3ZTNEdTa3hjTFZqN3BSRWM0Q1llS2RacU5OT2NP?=
 =?utf-8?B?QTV1NWxKQTZ6aWhibytRTFNhenJZSHFmanNDZGpqaUdCUWNiSkZUUDljSnBN?=
 =?utf-8?B?VXhNcEd3Ny92Q0pUU3BCZFZieHcwd3BoQlhNbmllZVZ6NmhkVEh1Vno0MFB4?=
 =?utf-8?B?Tmg4Ylcxem5OZC8xdDlTbFNTaVJsQUc1bjdYKzRiTHlQRE5zcWEwQUVzU1dh?=
 =?utf-8?B?QjF5cnVxR3p4N0RXcUtpc05KYmd3WXZyelcwRmFLTGRPRzVRaFZ0VUVmRW1x?=
 =?utf-8?B?UURLVFY4MlBQcjJyUkpVL1JPRVVwdHlmSm1aRjZVejZPSlh5S0w3UmdHc2ZI?=
 =?utf-8?B?dGpUZ2FsNVFGNjZZYWlCZk9MQlRqMWQzVlZIM2lJdHJrMUc3VTBmWjJvdG1i?=
 =?utf-8?B?VDBQVTI0Wm9KM1pocnY3SUxBakJ6WmRCY09CYWJtbjdiYTAwZ052dVB5VDN0?=
 =?utf-8?B?bUxibEZLWlJKYnRoYUVhVXBzTUwzUjRMeDZLNnpEZHU3TGdtMU9jakFkWXI0?=
 =?utf-8?B?d3BMY1VvazgxdTJteUxVVHFrRzYwQ1BrK2pPNkhFMlMzRUlLT25OZVlmRktZ?=
 =?utf-8?B?dXB6b1pIelIzR2kxZ0VvTVVsbU90NFViS0g0ZWQ1U2FSQUtrRWxXM3lLQmVT?=
 =?utf-8?B?dC93MTFnWk52cHhiS241YXAwaXFuRkRwcHdwUlFMWERYUVRnMzZPM3d4SHo1?=
 =?utf-8?B?WTdLUDJMVUw1Y0I4V05kbzlCeDZUZ0plazZMYmtVeG1LOHd3aEgvcE5tNE1E?=
 =?utf-8?B?YU9kTTB4VVMxSVJoeXhWNkJDd2x4Tmg0anBRcWNlOG85dWdCaElDNklDUzJJ?=
 =?utf-8?B?dVFER2tlemxqdHZNMmJoMmFaRmkxdUtaaEZhN2V3cVY0WkxZUkFtL2FqUnJj?=
 =?utf-8?B?cXF2R3NxRkRhMXVqdHdXdi9nbGdxQUxiTjI3RGVWVFVmWFM4VDZUL1A3SzN4?=
 =?utf-8?B?cDd6U2dOOHZYM1FVam9LdFcxbm9GekYwNk5sOFc5QXMrZmhVRDkwa3RSUm43?=
 =?utf-8?B?bi9vdXZRY2tSQUZnOGZxc203YUI0Y09BenNRZHdrVFlRSjcyTXAzZmJlMWl4?=
 =?utf-8?B?SVFtNFRvWHZjNWFkZjVQcGpudCtqQ2pyMUNzSE5FS1lpRm02S2hEak1jZTRT?=
 =?utf-8?B?QjRqTjduYTZxNmY5K0F4RzZCMXdrcUZqMlBvdmc4OHF3UThTUnlvVzZtOXI0?=
 =?utf-8?B?NE9YZ3I5MGk4YzhNVnNoVTBieFNKZEVTZWxnbUYrdEYvYkJBc0Fjd1g1YlFV?=
 =?utf-8?B?WUo3TXdDcFZ4VG9qa0Z3ejdjMEdXQ1dQZjhSMHFzclF0TlBWSVZTamM4RnYw?=
 =?utf-8?B?YnVGaW5yZzUyRlROcVhUQmhYWTJFV2dQNHZ6eFoySVlhaWhreml2c3JtZlN6?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4963064-4905-477a-9330-08dd66086aec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 10:34:10.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0GpG8cBB0noB4HavL2XHgYmdDLbg9WtvjTUvFfDKmCFYNrwrwgcoHolRDobfxEU3DeUHVgBo43tgcL8iDyBd4ozzaHnBkpUX21FQ9sGj4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
X-Authority-Analysis: v=2.4 cv=QdRmvtbv c=1 sm=1 tr=0 ts=67d94c27 cx=c_pps a=tyvwN2z/Y66O58r8mq/nTQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=-s5NcXeHXF-B1QZ-4l4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=t7CeM3EgAAAA:8 a=io179-_ENtLLCYE6_mcA:9 a=LeQCscWDrymhQr-Y:21 a=_W_S_7VecoQA:10 a=zY0JdQc1-4EAyPf5TuXT:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: N3R6v5_YpY_d_fqvlBGIz5CllJgE-2Wo
X-Proofpoint-GUID: sVv1ewFgGU8ID8poWDR--NkJvrxBW3C-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503180077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213198

--------------KpLYeWEYiYhlA05V1FJFB2rA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52I71vev014426


On 18-03-2025 06:05, Randy MacLeod wrote:
> On 2025-03-14 11:50 a.m., Yash Shinde wrote:
>>
>>
>> On 14-03-2025 19:18, Randy MacLeod wrote:
>
> ...
>
>
>>> Thanks Yash!
>>>
>>> It's a bit odd that you see an 8G diff and YP AB saw 5 GB but that's=20
>>> close enough for now.
>>>
>>> Please run the same analysis for 1.84 update both before and after=20
>>> removing the src/gcc .
>>>
>>> Please summarize the data for 1.82, 1.83 and the two sets of data=20
>>> for 1.84.
>>>
>>> I'd expect 1.84 + "rm -rf src/gcc" to be somewhat larger than 1.82=20
>>> but much smaller than 1.83.
>>>
>> TMDIR FS usage =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0 v1.82.0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=20
>> v1.83.0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0 v1.84.0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0 v1.84 +=20
>> rm -rf src/gcc
>> du -sh poky/build/tmp/ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65 G=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=20
>> =C2=A0=C2=A0 73 G =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 73=20
>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72 G
>>
> What steps did you take (bitbake rust-native ? ) before comparing=20
> these tmp dir trees?
>
> So what made the 1.82.0 and either 1.83.0 or 1.84.0 differ in size so=20
> significantly? See below for my approach for the src tree.
> Hopefully you can do something similar or better for the build/tmp dir=20
> that's a ~8 GB diff from 1.82 to 1.84.
> And still 7 GB after rm -rf src/gcc. Please read the rest of this=20
> email and send the update if it's ready before
> spending time on the analysis of the size difference.
>
I performed a basic "bitbake rust" build which internally builds=20
libstd-rs, rust, rust-llvm, cargo and their native builds.
In 1.83/1.84, each of these build sources contains a rustc-1.84.1-src=20
dir which also includes the gcc tree(1 GB) and the enzyme module(~400 Mb)=
,
resulting in an additional 1.4 GB of FS usage per build.*
*
=E2=9D=AF=C2=A0 find . -path "*/rustc-1.84.1-src/src/gcc" -type d

./work/x86_64-linux/rust-llvm-native/1.84.1/rustc-1.84.1-src/src/gcc
./work/x86_64-linux/cargo-native/1.84.1/rustc-1.84.1-src/src/gcc
./work/x86_64-linux/rust-native/1.84.1/rustc-1.84.1-src/src/gcc
./work/core2-64-poky-linux/rust/1.84.1/rustc-1.84.1-src/src/gcc
./work/core2-64-poky-linux/libstd-rs/1.84.1/rustc-1.84.1-src/src/gcc
./work/core2-64-poky-linux/rust-llvm/1.84.1/rustc-1.84.1-src/src/gcc

=E2=9D=AF=C2=A0 find . -path "*/rustc-1.84.1-src/src/tools/enzyme" -type =
d

./work/x86_64-linux/rust-llvm-native/1.84.1/rustc-1.84.1-src/src/tools/en=
zyme
./work/x86_64-linux/cargo-native/1.84.1/rustc-1.84.1-src/src/tools/enzyme
./work/x86_64-linux/rust-native/1.84.1/rustc-1.84.1-src/src/tools/enzyme
./work/core2-64-poky-linux/rust/1.84.1/rustc-1.84.1-src/src/tools/enzyme
./work/core2-64-poky-linux/libstd-rs/1.84.1/rustc-1.84.1-src/src/tools/en=
zyme
./work/core2-64-poky-linux/rust-llvm/1.84.1/rustc-1.84.1-src/src/tools/en=
zyme


So, *1.4 GB * 6 =3D 8.4 GB
*
Thus, it takes ~8GB of extra space than v1.82.
>
>> du -sh=C2=A0 poky/build/../1.8x.0/rustc-1.8x.0-src/ 9.8=20
>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 12 G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12=20
>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11 G
>>
>> The size of TMPDIR increased from 65 G in 1.82 to 73 G in 1.83 and=20
>> remained same in 1.84.
>> After removing "src/gcc"(1.1 G) the size is reduced to 72G.
>>
> And the build and test worked well, I assume.
>
> If so please send the update with the rm -rf src/gcc .
>
I added a "do_unpack:append()" task to remove the gcc tree in rust=20
recipe and it works as expected.
Currently, we are investigating a few issue seen with the rust v1.84.1=20
test suite.
Once these issues are resolved, we will send the update with "rm -rf=20
src/gcc".

(I also did a similar analysis as below and mentioned the details with=20
the image attached at
https://lists.openembedded.org/g/openembedded-core/message/212842.)


Regards,
Yash
>
>
>
> I took a look at the source tree differences a little.
> I tried using ncdu and meld but they aren't really the right tool.
>
> I ended up doing the following:
>
> Unpack two tarballs then mkdir du
>
> =E2=9D=AF=C2=A0 du -sk rustc-1.82.0-src/* | sort -n > du/du-1.82-top
>
> =E2=9D=AF=C2=A0 du -sk rustc-1.84.0-src/* | sort -n > du/du-1.84-top
>
> # manually edit line order
>
>
> *=E2=9D=AF* sdiff du/du-1.8*-top
> 4	rustc-1.82.0-src/Cargo.toml			      |	4	rustc-1.84.0-src/Cargo.toml
> 4	rustc-1.82.0-src/configure			      |	4	rustc-1.84.0-src/configure
> 4	rustc-1.82.0-src/CONTRIBUTING.md		      |	4	rustc-1.84.0-src/CONTRIBU=
TING.md
> 4	rustc-1.82.0-src/git-commit-hash		      |	4	rustc-1.84.0-src/git-comm=
it-hash
> 4	rustc-1.82.0-src/git-commit-info		      |	4	rustc-1.84.0-src/git-comm=
it-info
> 4	rustc-1.82.0-src/LICENSE-MIT			      |	4	rustc-1.84.0-src/LICENSE-MIT
> 4	rustc-1.82.0-src/README.md			      |	4	rustc-1.84.0-src/README.md
> 4	rustc-1.82.0-src/version			      |	4	rustc-1.84.0-src/version
> 4	rustc-1.82.0-src/x.py				      |	4	rustc-1.84.0-src/x.py
> 12	rustc-1.82.0-src/LICENSE-APACHE			      |	12	rustc-1.84.0-src/LICENS=
E-APACHE
> 24	rustc-1.82.0-src/COPYRIGHT			      |	24	rustc-1.84.0-src/COPYRIGHT
> 40	rustc-1.82.0-src/config.example.toml		      |	44	rustc-1.84.0-src/co=
nfig.example.toml
> 140	rustc-1.82.0-src/Cargo.lock			      |	140	rustc-1.84.0-src/Cargo.lo=
ck
> 736	rustc-1.82.0-src/RELEASES.md			      |	768	rustc-1.84.0-src/RELEASE=
S.md
> 36364	rustc-1.82.0-src/compiler			      |	37124	rustc-1.84.0-src/compil=
er
> 43928	rustc-1.82.0-src/library			      |	44484	rustc-1.84.0-src/library
> 165588	rustc-1.82.0-src/tests				      |	169872	rustc-1.84.0-src/tests
> 1379288	rustc-1.82.0-src/src				      |	2889512	rustc-1.84.0-src/src
> 1975056	rustc-1.82.0-src/vendor				      |	1926968	rustc-1.84.0-src/ven=
dor
>
> Since I'm always asking for you to do the math, I got chatgtp to do=20
> mine for me:
>
> |+4 config.example.toml +32 RELEASES.md +760 compiler +556 library=20
> +4284 tests +1510224 src -48088 vendor|
>
> Positive numbers indicate an increase in size, while the negative=20
> number for |vendor| indicates a decrease.
>
>
> # Similarly for src and vendor subdirs:
>
> =E2=9D=AF=C2=A0 du -sk rustc-1.84.0-src/src/* | sort -n > du/du-1.84-sr=
c
> ...
>
>
> sdiff du/du-1.8*-src
> 4	rustc-1.82.0-src/src/README.md			      |	4	rustc-1.84.0-src/src/READM=
E.md
> 4	rustc-1.82.0-src/src/version			      |	4	rustc-1.84.0-src/src/version
> 44	rustc-1.82.0-src/src/stage0			      |	44	rustc-1.84.0-src/src/stage0
> 							      |	56	rustc-1.84.0-src/src/build_helper
> 							      |	56	rustc-1.84.0-src/src/rustc-std-workspace
> 60	rustc-1.82.0-src/src/rustdoc-json-types		      |	64	rustc-1.84.0-src=
/src/rustdoc-json-types
> 1208	rustc-1.82.0-src/src/ci				      |	1220	rustc-1.84.0-src/src/ci
> 1408	rustc-1.82.0-src/src/bootstrap			      |	1468	rustc-1.84.0-src/src=
/bootstrap
> 2348	rustc-1.82.0-src/src/etc			      |	2344	rustc-1.84.0-src/src/etc
> 3368	rustc-1.82.0-src/src/librustdoc			      |	3456	rustc-1.84.0-src/sr=
c/librustdoc
> 42096	rustc-1.82.0-src/src/doc			      |	43048	rustc-1.84.0-src/src/doc
> 290368	rustc-1.82.0-src/src/tools			      |	693384	rustc-1.84.0-src/src=
/tools
> 1038376	rustc-1.82.0-src/src/llvm-project		      |	1038408	rustc-1.84.0=
-src/src/llvm-project
> 							      >	1105952	rustc-1.84.0-src/src/gcc
>
>
> the major difference is the src dir.
>
> |+56 build_helper +56 rustc-std-workspace +4 rustdoc-json-types +12 ci=20
> +60 bootstrap -4 etc +88 librustdoc +952 doc +403016 tools +32=20
> llvm-project +1105952 gcc |
>
> Vendor dir is harder to compare since there are so many files and the n=
umber of files has changed:
>
> =E2=9C=A6 =E2=9D=AF wc -l du/du-1.82-vendor du/du-1.84-vendor
>    1511 du/du-1.82-vendor
>    1530 du/du-1.84-vendor
>
>
> The total size changed from 1975056 to 1926968 - a decrease, so that's =
not worth looking into.
>
> ../Randy
>
>
>
>> Thanks,
>> Yash.
>>
--------------KpLYeWEYiYhlA05V1FJFB2rA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52I71vev014426

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 18-03-2025 06:05, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:8977d71f-acc9-4653-8f56-0768933=
29f4e@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2025-03-14 11:50 a.m., Yash Shind=
e
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:aa6b3d4c-bf6b-41b2-98e4-0ff85=
4c5fc8d@windriver.com">
        <p><br>
        </p>
        <div class=3D"moz-cite-prefix">On 14-03-2025 19:18, Randy MacLeod
          wrote:<br>
        </div>
      </blockquote>
      <p>...</p>
      <br>
      <blockquote type=3D"cite" cite=3D"mid:aa6b3d4c-bf6b-41b2-98e4-0ff85=
4c5fc8d@windriver.com">
        <blockquote type=3D"cite" cite=3D"mid:70820f45-41b1-487b-ac53-1e4=
9ef57fd5f@windriver.com">
          <p>Thanks Yash!</p>
          <p>It's a bit odd that you see an 8G diff and YP AB saw 5 GB
            but that's close enough for now.</p>
          <p>Please run the same analysis for 1.84 update both before
            and after removing the src/gcc .</p>
          <p> Please summarize the data for 1.82, 1.83 and the two sets
            of data for 1.84.<br>
            <br>
            I'd expect 1.84 + &quot;rm -rf src/gcc&quot; to be somewhat l=
arger
            than 1.82 but much smaller than 1.83.<br>
          </p>
        </blockquote>
        <p>TMDIR FS usage&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp; v1.82.0&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; v1.83.0&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp; v1.84.0&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp; v1.84 + rm
          -rf src/gcc<br>
          du -sh poky/build/tmp/&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 65 G&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp; 73 G&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 73
          G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 72 G<br>
        </p>
      </blockquote>
      <p>What steps did you take (bitbake rust-native ? ) before
        comparing these tmp dir trees?<br>
      </p>
      <p>So what made the 1.82.0 and either 1.83.0 or 1.84.0 differ in
        size so significantly? See below for my approach for the src
        tree.<br>
        Hopefully you can do something similar or better for the
        build/tmp dir that's a ~8 GB diff from 1.82 to 1.84. <br>
        And still 7 GB after rm -rf src/gcc. Please read the rest of
        this email and send the update if it's ready before<br>
        spending time on the analysis of the size difference.<br>
      </p>
    </blockquote>
    I performed a basic &quot;bitbake rust&quot; build which internally b=
uilds
    libstd-rs, rust, rust-llvm, cargo and their native builds. <br>
    In 1.83/1.84, each of these build sources contains a
    rustc-1.84.1-src dir which also includes the gcc tree(1 GB) and the
    enzyme module(~400 Mb),<br>
    resulting in an additional 1.4 GB of FS usage per build.<b><br>
    </b><br>
    =E2=9D=AF&nbsp; find . -path &quot;*/rustc-1.84.1-src/src/gcc&quot; -=
type d<br>
    <br>
    ./work/x86_64-linux/rust-llvm-native/1.84.1/rustc-1.84.1-src/src/gcc<=
br>
    ./work/x86_64-linux/cargo-native/1.84.1/rustc-1.84.1-src/src/gcc<br>
    ./work/x86_64-linux/rust-native/1.84.1/rustc-1.84.1-src/src/gcc<br>
    ./work/core2-64-poky-linux/rust/1.84.1/rustc-1.84.1-src/src/gcc<br>
    ./work/core2-64-poky-linux/libstd-rs/1.84.1/rustc-1.84.1-src/src/gcc<=
br>
    ./work/core2-64-poky-linux/rust-llvm/1.84.1/rustc-1.84.1-src/src/gcc<=
br>
    <br>
    <p>=E2=9D=AF&nbsp; find . -path &quot;*/rustc-1.84.1-src/src/tools/en=
zyme&quot; -type d<br>
      <br>
./work/x86_64-linux/rust-llvm-native/1.84.1/rustc-1.84.1-src/src/tools/en=
zyme<br>
./work/x86_64-linux/cargo-native/1.84.1/rustc-1.84.1-src/src/tools/enzyme=
<br>
./work/x86_64-linux/rust-native/1.84.1/rustc-1.84.1-src/src/tools/enzyme<=
br>
./work/core2-64-poky-linux/rust/1.84.1/rustc-1.84.1-src/src/tools/enzyme<=
br>
./work/core2-64-poky-linux/libstd-rs/1.84.1/rustc-1.84.1-src/src/tools/en=
zyme<br>
./work/core2-64-poky-linux/rust-llvm/1.84.1/rustc-1.84.1-src/src/tools/en=
zyme</p>
    <br>
    So, <b>1.4 GB * 6 =3D 8.4 GB<br>
    </b><br>
    Thus, it takes ~8GB of extra space than v1.82.<br>
    <blockquote type=3D"cite" cite=3D"mid:8977d71f-acc9-4653-8f56-0768933=
29f4e@windriver.com">
      <p> </p>
      <blockquote type=3D"cite" cite=3D"mid:aa6b3d4c-bf6b-41b2-98e4-0ff85=
4c5fc8d@windriver.com">
        <p> </p>
        <p>du -sh&nbsp; poky/build/../1.8x.0/rustc-1.8x.0-src/&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          9.8 G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12
          G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12
          G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11 G<br>
          <br>
          The size of TMPDIR increased from 65 G in 1.82 to 73 G in 1.83
          and remained same in 1.84.<br>
          After removing &quot;src/gcc&quot;(1.1 G) the size is reduced t=
o 72G.<br>
        </p>
      </blockquote>
      <p>And the build and test worked well, I assume.</p>
      <p>If so please send the update with the rm -rf src/gcc .</p>
    </blockquote>
    I added a &quot;do_unpack:append()&quot; task to remove the gcc tree =
in rust
    recipe and it works as expected.<br>
    Currently, we are investigating a few issue seen with the rust
    v1.84.1 test suite.<br>
    Once these issues are resolved, we will send the update with &quot;rm=
 -rf
    src/gcc&quot;.<br>
    <br>
    (I also did a similar analysis as below and mentioned the details
    with the image attached at <br>
    <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/212842">https://lists.openembedded.org/g=
/openembedded-core/message/212842</a>.)<br>
    <br>
    <br>
    Regards,<br>
    Yash<br>
    <blockquote type=3D"cite" cite=3D"mid:8977d71f-acc9-4653-8f56-0768933=
29f4e@windriver.com">
      <p><br>
      </p>
      <p><br>
      </p>
      <p>I took a look at the source tree differences a little.<br>
        I tried using ncdu and meld but they aren't really the right
        tool.<br>
      </p>
      <p>I ended up doing the following:<br>
      </p>
      <p>Unpack two tarballs then mkdir du</p>
      <p>=E2=9D=AF&nbsp; du -sk rustc-1.82.0-src/* | sort -n &gt; du/du-1=
.82-top<br>
      </p>
      <p>=E2=9D=AF&nbsp; du -sk rustc-1.84.0-src/* | sort -n &gt; du/du-1=
.84-top</p>
      <p># manually edit line order</p>
      <p><br>
      </p>
      <pre><font color=3D"#CC0000"><b>=E2=9D=AF</b></font> sdiff du/du-1.=
8*-top
4	rustc-1.82.0-src/Cargo.toml			      |	4	rustc-1.84.0-src/Cargo.toml
4	rustc-1.82.0-src/configure			      |	4	rustc-1.84.0-src/configure
4	rustc-1.82.0-src/CONTRIBUTING.md		      |	4	rustc-1.84.0-src/CONTRIBUTI=
NG.md
4	rustc-1.82.0-src/git-commit-hash		      |	4	rustc-1.84.0-src/git-commit=
-hash
4	rustc-1.82.0-src/git-commit-info		      |	4	rustc-1.84.0-src/git-commit=
-info
4	rustc-1.82.0-src/LICENSE-MIT			      |	4	rustc-1.84.0-src/LICENSE-MIT
4	rustc-1.82.0-src/README.md			      |	4	rustc-1.84.0-src/README.md
4	rustc-1.82.0-src/version			      |	4	rustc-1.84.0-src/version
4	rustc-1.82.0-src/x.py				      |	4	rustc-1.84.0-src/x.py
12	rustc-1.82.0-src/LICENSE-APACHE			      |	12	rustc-1.84.0-src/LICENSE-=
APACHE
24	rustc-1.82.0-src/COPYRIGHT			      |	24	rustc-1.84.0-src/COPYRIGHT
40	rustc-1.82.0-src/config.example.toml		      |	44	rustc-1.84.0-src/conf=
ig.example.toml
140	rustc-1.82.0-src/Cargo.lock			      |	140	rustc-1.84.0-src/Cargo.lock
736	rustc-1.82.0-src/RELEASES.md			      |	768	rustc-1.84.0-src/RELEASES.=
md
36364	rustc-1.82.0-src/compiler			      |	37124	rustc-1.84.0-src/compiler
43928	rustc-1.82.0-src/library			      |	44484	rustc-1.84.0-src/library
165588	rustc-1.82.0-src/tests				      |	169872	rustc-1.84.0-src/tests
1379288	rustc-1.82.0-src/src				      |	2889512	rustc-1.84.0-src/src
1975056	rustc-1.82.0-src/vendor				      |	1926968	rustc-1.84.0-src/vendo=
r
</pre>
      <p>Since I'm always asking for you to do the math, I got chatgtp
        to do mine for me:<br>
      </p>
      <pre class=3D"!overflow-visible" data-start=3D"48" data-end=3D"176"=
><code class=3D"!whitespace-pre"><span><span><span class=3D"hljs-addition=
">+4	config.example.toml  </span></span><span>
</span><span><span class=3D"hljs-addition">+32	RELEASES.md  </span></span=
><span>
</span><span><span class=3D"hljs-addition">+760	compiler  </span></span><=
span>
</span><span><span class=3D"hljs-addition">+556	library  </span></span><s=
pan>
</span><span><span class=3D"hljs-addition">+4284	tests  </span></span><sp=
an>
</span><span><span class=3D"hljs-addition">+1510224	src  </span></span><s=
pan>
</span><span><span class=3D"hljs-deletion">-48088	vendor</span></span></s=
pan></code></pre>
      <p>Positive numbers indicate an increase in size, while the
        negative number for <code data-start=3D"255" data-end=3D"263">ven=
dor</code>
        indicates a decrease.</p>
      <p><br>
      </p>
      <p># Similarly for src and vendor subdirs:<br>
      </p>
      <p>=E2=9D=AF&nbsp; du -sk rustc-1.84.0-src/src/* | sort -n &gt; du/=
du-1.84-src<br>
        ...</p>
      <p><br>
      </p>
      <pre>sdiff du/du-1.8*-src
4	rustc-1.82.0-src/src/README.md			      |	4	rustc-1.84.0-src/src/README.=
md
4	rustc-1.82.0-src/src/version			      |	4	rustc-1.84.0-src/src/version
44	rustc-1.82.0-src/src/stage0			      |	44	rustc-1.84.0-src/src/stage0
							      |	56	rustc-1.84.0-src/src/build_helper
							      |	56	rustc-1.84.0-src/src/rustc-std-workspace
60	rustc-1.82.0-src/src/rustdoc-json-types		      |	64	rustc-1.84.0-src/s=
rc/rustdoc-json-types
1208	rustc-1.82.0-src/src/ci				      |	1220	rustc-1.84.0-src/src/ci
1408	rustc-1.82.0-src/src/bootstrap			      |	1468	rustc-1.84.0-src/src/b=
ootstrap
2348	rustc-1.82.0-src/src/etc			      |	2344	rustc-1.84.0-src/src/etc
3368	rustc-1.82.0-src/src/librustdoc			      |	3456	rustc-1.84.0-src/src/=
librustdoc
42096	rustc-1.82.0-src/src/doc			      |	43048	rustc-1.84.0-src/src/doc
290368	rustc-1.82.0-src/src/tools			      |	693384	rustc-1.84.0-src/src/t=
ools
1038376	rustc-1.82.0-src/src/llvm-project		      |	1038408	rustc-1.84.0-s=
rc/src/llvm-project
							      &gt;	1105952	rustc-1.84.0-src/src/gcc


the major difference is the src dir.

<code class=3D"!whitespace-pre"><span><span><span class=3D"hljs-addition"=
>+56	build_helper  </span></span><span>
</span><span><span class=3D"hljs-addition">+56	rustc-std-workspace  </spa=
n></span><span>
</span><span><span class=3D"hljs-addition">+4	rustdoc-json-types  </span>=
</span><span>
</span><span><span class=3D"hljs-addition">+12	ci  </span></span><span>
</span><span><span class=3D"hljs-addition">+60	bootstrap  </span></span><=
span>
</span><span><span class=3D"hljs-deletion">-4	etc  </span></span><span>
</span><span><span class=3D"hljs-addition">+88	librustdoc  </span></span>=
<span>
</span><span><span class=3D"hljs-addition">+952	doc  </span></span><span>
</span><span><span class=3D"hljs-addition">+403016	tools  </span></span><=
span>
</span><span><span class=3D"hljs-addition">+32	llvm-project  </span></spa=
n><span>
</span><span><span class=3D"hljs-addition">+1105952	gcc  </span></span></=
span></code>

Vendor dir is harder to compare since there are so many files and the num=
ber of files has changed:

=E2=9C=A6 =E2=9D=AF wc -l du/du-1.82-vendor du/du-1.84-vendor=20
  1511 du/du-1.82-vendor
  1530 du/du-1.84-vendor


The total size changed from 1975056 to 1926968 - a decrease, so that's no=
t worth looking into.

../Randy



</pre>
      <blockquote type=3D"cite" cite=3D"mid:aa6b3d4c-bf6b-41b2-98e4-0ff85=
4c5fc8d@windriver.com">
        <p> </p>
        <p>Thanks,<br>
          Yash.</p>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------KpLYeWEYiYhlA05V1FJFB2rA--

