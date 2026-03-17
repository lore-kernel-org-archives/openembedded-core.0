Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4CAFED9E3
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 15:01:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78137.1773759654843497405
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 08:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=VkRrEztA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753627e77a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4e2Jm1215478
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 08:00:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=J3Kk2JD7qZ0o0NFhuHAY0l
	h37tAJD5n0pfZdJPXWE+s=; b=VkRrEztAeLnvqKyj+IhRko57s+HpmD3vgiDZ1D
	lnGqPlhDh7MWxeus5LDIuPZESpO/GniNDBg0OGHAA8putUyxJlnBURsolBsfsp3R
	Dtsypht7cLI+PXqWAYlhiVD5fzOnTssw4temNXdIDTlwJ5kNmpZ7Z3TeFl1LeXzC
	QJrf9FdhRV5HhsZnxtNRZFIv2b3tP9dqz2ElKyquwyiuYtPBDGYnsj4AYTRuix1c
	xDuxpqM+cOxUmNlvhjTtXihDhZV44OPQBKOU3JNUeht0gAPnGGGOC8iIxsSppqdh
	vBoz7iPwPVgrN/NN+s8CK6Gx8yfM7qHcFy8uq2VSm0aKpKeA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011020.outbound.protection.outlook.com [52.101.57.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y13b9b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 08:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J12aElkfFoAPILMOovn0BXi4P3YR8Wd7WyRgkkFVzxcR+ze8KftnXbCDzl7mulqUYWCTiLGP9qoY4GrcZxUpguDQcUuM8wwTvh9bJZq4wXqz6vaygcOoHU+4lLVvlDZrwEubSgml6o3xN6p2+ta2VG6RN57t5M2P8VH9pcmw79HppQ1XCQZlu2aBLeUFbq5LdX1ZWfEGgONCF5ygLXCnB3ulCbgoTBAytw7rF/wsgMbOC2nBG74UNACRwITE3FcgF8tNs5iBtomAnDbf2pOs5hLkJNVGh89xmn0WkOTBFFWx0rmJpMryfYBoOrKF7z8l85uDngUdFcdsMR0Xwms0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3Kk2JD7qZ0o0NFhuHAY0lh37tAJD5n0pfZdJPXWE+s=;
 b=NsfEpXmq5qHqQWF2tsmMzcofRqlXQMW8DCylIXZJf4gwZOjeZzWxqOCoyZkDlsu6C18oSOp4fWECvrY3hGhP/eiGXPyyDHA0Rb+B03l/TYAWGrcZumeG4T96UUDNIKZ3ChPlkjPbN6ibzcBCnoml3MQOsw/G+BYYYzio+GoLJn4yuZA8H+aJVsYk7XPLeICsD+KEVYBjJhE3qavdAGTgdfaq7oEPRsx1ZtWq6+CfY88D0/yNsABNgW87aAA18SjiXngAy2dWU2bTDdpJQVYMAwhkpYbrIwNrUXlmzGA6bIExfk6ZhRppl2F8xU8tB3MmYKhxa2s5P9BhsHKPMx6Wcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 15:00:45 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 15:00:44 +0000
Content-Type: multipart/alternative;
 boundary="------------WKPJ2NyEuSZx0aOIOtZ0jl96"
Message-ID: <7974c052-83e6-4725-ae14-62e2d8a202cc@windriver.com>
Date: Tue, 17 Mar 2026 11:00:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] rust: Drop
 oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, "Marko, Peter" <peter.marko@siemens.com>,
        Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
References: <20260311132658.1230334-1-Deepesh.Varatharajan@windriver.com>
 <e4863d03-6c88-421d-b613-d846818f6a54@windriver.com>
 <8e26998b-52a6-4d5e-964f-5f4b5c09b43c@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <8e26998b-52a6-4d5e-964f-5f4b5c09b43c@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 7502d81c-f9e1-4441-8ac4-08de8435f6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|13003099007|56012099003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: 
	Sr7vX+wfHuZjDEEusQ8tKooSYpgZ+hSUw2RIo7/8xgBtie54AlJIQOQMAKDEUOaacAlc1lnXYiY2xKAV9zuG/GYV2npXgie4flikBg85MTblgkksJJYW2bhB38qxfkyxknmnFeLY4X5BhRr+H1l7JpXMfiKqvdxs7wAP7DOJ79vOssf9X/Xqh8io7ZrNwj1LkUt6+Zx9E6bUyws0DJLSeIdVfAxq45Fnam6HsjebcYN9MEUynMtV6TFWvyeHFoYz6J5nFCTTeiC+X2fFW/qjwAdK25wSJYG7G4zQapHVHl8vi6Sm6u/3NY+42I1JEWhNAdSSsdhtemOKPCpAj7aDI+V9t6RS2EbDJDNeU50H00RzwaWelQQSyjGHFxsqzcJUugfdlQWk5hMTac1/D1EZ0dWCLrjA/uSJTKYkOwV7ab0fzRwxqpAb40Un+ADOsy9/v2F+Ak2kvLIV+7sh2qzs9JiYva/nZjKeklcv29LbV6njnwOkOx1TBF6XLqfNzIpkY6qL86oBQSr37/sTGZAP7IpHsKUPk453M1v67TaAL8L1VxwcolM+5lRf9pZ8aB86WZdvZTmG8MPLZFv+tigyjk2YHtWKk9CARMUMR+YghSoJ8y+oEUcvwS9XOnz5G/Pj117gF8U8S1F3f9EsFup+mznVgVOSvDbX7uiXn/y2UFQmHo+g0OQ+ZvyFx56gG5s3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(13003099007)(56012099003)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0VNSFRPWHdVOUNPTHNqejgyekVNNW5kWHZZRHZ5ckEzMGxxZUFMekJRbUY3?=
 =?utf-8?B?ZjE1YUtMNjFwYkFKcDdnSm1iZUlBMmhIMGpOeW1xVXhsSTJ2WWE2Z2dta3lm?=
 =?utf-8?B?dFo2aXZZSHBSeTh3V3NFVHRqRHRaYzA0R1g1dGFQRVplTlUyQllLYWsvS2Vx?=
 =?utf-8?B?ZEFVQjIyNjVyU080TWR4b3J5cXpvMHhqNDRXZmJhbysrNytoRFp0bzZ1Vkph?=
 =?utf-8?B?VDJEUGJmc1JpSWlsbWY3Q2I2WDFWcGpBaitpWVZaUE5UU1lNendNS1NoMjl5?=
 =?utf-8?B?VExBWHlzSUU3eS9HaXlzdnd1WDBTU0JrT2lHaVB0OEVkUlBKUXFTanFrOVVI?=
 =?utf-8?B?c1JFd0kwMTRZYUtUdmtoby9QTm42VTlVUjZGbjNlRFJ1SFNFcjNzZUUvNDlz?=
 =?utf-8?B?MVo4SDBPOElDRnM4QkJrcE0rRHlRcVJVQWxxQ1NFMWp0S1VKSUF1VythWFpt?=
 =?utf-8?B?ZFhXYlAxTTR4citTcitDanI5Z0Y1Slh4dnVEKzN2OFE5NHIrWG9Vc0JzeU1Z?=
 =?utf-8?B?SmlNbnA5NC81Tk1KRlFUbytUSWpiYjRibFBITTgyWE00MkRmcDlrYTRhM1E2?=
 =?utf-8?B?bHdINnM4YkVZVEtkZ1BySGQ0SVhZNDQ1TWF2SzZjTEhPTzlJUzh0NzFFNkcx?=
 =?utf-8?B?YjVWUFhlTG4xaDZFZ2UwUmlUS2RrQm1tZDFhbkVycHdMRDdQcmxmeFovOW8y?=
 =?utf-8?B?NzZDTlJKbE5OSUdrcUdQT3l0YTBYMDB1alVnaGlZNjNpblBQb05kbWJseFRl?=
 =?utf-8?B?S0VFNWxkUE5zSHJiWVpoVWxSNzB2MnRoL1RNNlovWjhvSmZOUTRleFYzUW8v?=
 =?utf-8?B?b0lTV2czZ08xWVVLYlRLSE1uV1R2WElQRThha3Z2VHlGMlZvdlNxMWM3bUtL?=
 =?utf-8?B?QjZJL0pYdUlPelYwMENUT0NQWU95M3IxQjM1Vk1wcHdhQWJ4UTAwY3AxVFZh?=
 =?utf-8?B?cmt5VE5WZ2YvM1RJeXFFT2dVRko4TS9WZ3lETFl3NkMvVWtlRHhkVkpYRjdM?=
 =?utf-8?B?d3hDdE1rU3Z6K3EzWmlOaEFvTHB5b2dodUxMYms2VkxXUDc0SXNoUlNzdC9k?=
 =?utf-8?B?YWVGdFpIOUJSZ2VZRm1hTkxjelR0T2plTGVNamR4L3J5cmJOYTg0ZHYrN0hj?=
 =?utf-8?B?NWw3TGRlazRkZlRwSk1ydzlUdVNaVng1eFhUd3pVT1E5cjBzb2h3TUp5TlA2?=
 =?utf-8?B?aDBTaW9EMmJaUWdCME1DdTVPK3dwNmpTTjZmUmp3MnByWWIvVk1TY2s4QXho?=
 =?utf-8?B?MVMycHhOM2RmckltdUN1WXI4Mm9UdlYzdE9rQUVJZjJKU1JPZTVHOWdRL21S?=
 =?utf-8?B?ZDZHQklLOFYyV1RsQWNhcGEwN0FRRHJjdWxKY2pFTnl1T0ppTi9ESzgvdGpJ?=
 =?utf-8?B?MWF2ak9YeTN0SzFCV3Vxa0t6QmhaejVxWWVtc0FpRUFFQTZtWFhhU3BFekZv?=
 =?utf-8?B?UHNyQWp0R3hDR1VzL0NlQzk0Mnk5NytjQXE4OGxXVCtoSVMvWis2QzNmVU4y?=
 =?utf-8?B?S0cyL0EzQlhiM3ZPV0hTOWdUblgzODFlYjEzQlFFUnRIbHN5OVlJUmErWkhH?=
 =?utf-8?B?OHVWcVFtdEZrcWh0YzliWG1YZi9PZmFkaHJ3RURselRlb242L1g1ZnZtQzlQ?=
 =?utf-8?B?YmVGa01GZGFTZUo3TVJHRWRncFZiWCtLdStYbU1GdlYwRjF3dFFRL2diVlFJ?=
 =?utf-8?B?djZRWThsRWViVkNscFdLLzFFeFZuSG0rcTF6Z2MyQys0QkZUMHh4NW5GMHBp?=
 =?utf-8?B?TDhWMno5ZTF6RkxITzNVVUdKNUVzeVNpdXAyUlpGK203TWF6Wm96bEwxSCt2?=
 =?utf-8?B?SkhFekpyWVgrMWRVczdWbnFKTytSZ2VrK1ZMdGVNWjFiSGFsNFRNcmh1VVBm?=
 =?utf-8?B?MnRoUGFHWGlxSXlqbmNSNzZUdUM0RmswS3dTbGIrMjVOL3hicjRsOUhTS1ZS?=
 =?utf-8?B?Vy9XNUN0a2RxVnhUbUkyNGNZeTNmdnIvU3R5TDI5YVh5ejFDSlpiSjlZM2k1?=
 =?utf-8?B?cjRDQVF4MnpGUmlXWE1CS3N0cHd1enRsMTk1VkpMREdUcTN2N0xOZTJRYlJu?=
 =?utf-8?B?RmlncVY5SGxHa2hqVEpkcHp1SlZZMGl3OXB0djhQU2Eybm9UUFhPQllUUmlK?=
 =?utf-8?B?OGhyYS8vWUcxcWdlMVE5NWx3amVsQ1RnUnBTaGdCVlFYazNLaHF2akM2L3cw?=
 =?utf-8?B?M3BoNXQrMnIwZTM2a1VKcXoza2pJVERRR2tXM0hITENwTzk5Q2FzYkR1ME5q?=
 =?utf-8?B?WlBuTnJxS1M1R1lPZ1NsbnR5TmVtcDBlWm9HV1cyZTBaeWJCVENyeForUVA1?=
 =?utf-8?B?bHFyZ0dXTTh3aFdncnZpSnJDY1ZqL3B5ZEFBMGFUN3ZTa1ZuSkRhL3JMa3FK?=
 =?utf-8?Q?s7AKSZ8EDGn6awio=3D?=
X-Exchange-RoutingPolicyChecked: 
	UDJNJFOcmpHhAQQB72DQBQfc07PUkLJXIrZuV2Lqjp9k2X2z9X/WVkLijAgUVnloX5t6IYKmbqXFyykhsYV2vuTnTXld/cGm/JzEZeXDuzI+4JGtqORZjtZH76dJ6OxOiAUG8I6ixX13gTI5ovjh8C10Ja+nCGVFpcH9raOwf03nmhsmlWTLf8Qe1J/wU/k88S7L1JYv1mGzqbiaBZ6bmgR09T8lmnVOtj+vfH84DzX+FdcidU+L/vuNYpn0Pztiir2zfoknA2pTS0oJq+Z9IaCpAvaAp44+tMUF1l3ddq7IzN1+0Db4mCz7iwMpMQRqixGKZwOpbCPGdNBvbocRYg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7502d81c-f9e1-4441-8ac4-08de8435f6e3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:00:44.5963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LGvoAKu2URtDptoNo2CfRUpCMmBtX8WNtkzbp6WoFCRXm5YyhQQCYQPfwULhR0/KeTfqMP9J4RDJ7iClQ245FEvvN57m8P0ud1IZGTs/A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69b96ca1 cx=c_pps
 a=pqTWcw9xC4/AVWcamW/T+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=iGHA9ds3AAAA:8
 a=ei4SEBeUAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8
 a=YzEm6m20n1tR2QsPAsMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3boyagmPodij3BtVw1gA:9 a=O5tSApFEm1na3i2u:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=8zIOOLb7Ym0NljyPXbuS:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: l_TQNBtJq-pcnQtbuutx_HRjIdTE6Rs1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMiBTYWx0ZWRfX9wPcAwD8LLI/
 5SZvTom3JqL0fVBfA/dgWh51qdCeJuJNkfFosGC5lZcDRY1qzakmfuar3Sz5HS94O2HQ//IPU7a
 YeYO/Zwxr+AL+MVNw3Egn9dDLxIY8VWJU9dTEuLQmGeKczvGcqrNRXM44cEx/vmFT0mzdjDgzWd
 IUJBazJ1IGe/O4v97nsqtpWmBKhQATDZ4v8yBtjRb423kHNF8kTDUZo5bktYqXrGD7TxVH+wkn3
 Fz7r8583f81xZvAe2wIfUkQz+Ci61JRywpt+lppaAvStSqEPD7spW+p+5jFkXD5jDIQ1ZFVsyjC
 lSJjQ7aCSr2XasF1snaRYz/L2FsxP2Z8F9ynKzq6mBsCYoEi+yCS+jOfzq7YCtL/F7koPewut1C
 s7XkMURtgW5fOadBM/sIq41BpyMC4Q==
X-Proofpoint-ORIG-GUID: mycEUAVU2SZFJvQMfKqNhbFJOUnny-_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603170132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 15:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233328

--------------WKPJ2NyEuSZx0aOIOtZ0jl96
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62H4e2Jm1215478

On 2026-03-17 12:10 a.m., Deepesh Varatharajan wrote:
>
> On 17-03-2026 02:38, Randy MacLeod wrote:
>> On 2026-03-11 9:26 a.m., Varatharajan, Deepesh via=20
>> lists.openembedded.org wrote:
>>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>>
>>> This patch was originally introduced to address a rare failure on=20
>>> the PPC
>>> target and with the latest version of rustc this issue no longer=20
>>> occurs.
>>> So, this patch can be removed.
>>
>>
>> FYI, merged:
>> 3b5c2d8bdb=C2=A0 =C2=A02026-03-11=C2=A0 =C2=A0rust: Drop=20
>> oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
>>
>> If this causes problems for anyone, please let us know and we can=20
>> consider restoring the patch.
>>
>> Deepesh,
>>
>> Surely there's some existing data that you can point to,
>> to convince upstream to double the timeout if not 10x it?
>>
> Currently I don=E2=80=99t have data since I can=E2=80=99t reproduce the=
 failure with=20
> the latest rustc.
> If the failure happens again, I=E2=80=99ll collect the data and reach o=
ut to=20
> upstream to discuss
> increasing the timeout.

Deepesh and I talked offline and he reminded me that while we have
some old ppc32 errors logged in the YP bugzilla,
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15625

this issue has NOT happened on the new YP AB HW.

YP AB is not running ppc32 testing anymore so let's wait and see if=20
anyone else encounters the problem
again and re-opens the bug.

Thanks,

../Randy


>
> Regards,
> Deepesh
>
>> ../Randy
>>
>>> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.co=
m>
>>> ---
>>> =C2=A0 ...crease-timeout-in-process-sigpipe-ru.patch | 31=20
>>> -------------------
>>> =C2=A0 meta/recipes-devtools/rust/rust-source.inc=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 -
>>> =C2=A0 2 files changed, 32 deletions(-)
>>> =C2=A0 delete mode 100644=20
>>> meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-pr=
ocess-sigpipe-ru.patch
>>>
>>> diff --git=20
>>> a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-=
process-sigpipe-ru.patch=20
>>> b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-=
process-sigpipe-ru.patch=20
>>>
>>> deleted file mode 100644
>>> index 5bd1abffb4..0000000000
>>> ---=20
>>> a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-=
process-sigpipe-ru.patch
>>> +++ /dev/null
>>> @@ -1,31 +0,0 @@
>>> -From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 20=
01
>>> -From: Peter Tatrai<peter.tatrai.ext@siemens.com>
>>> -Date: Mon, 4 Nov 2024 13:58:16 +0100
>>> -Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe=20
>>> rust test
>>> -
>>> -This patch increases the timeout for the process-sigpipe rust test,=20
>>> which
>>> -occasionally fails when the server is under heavy load. Increasing=20
>>> the timeout
>>> -reduces the likelihood of false negatives under load.
>>> -
>>> -Fixes [YOCTO #15625]
>>> -
>>> -Upstream-Status: Inappropriate [OE testing specific]
>>> -
>>> -Signed-off-by: Peter Tatrai<peter.tatrai.ext@siemens.com>
>>> ----
>>> - tests/ui/process/process-sigpipe.rs | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/tests/ui/process/process-sigpipe.rs=20
>>> b/tests/ui/process/process-sigpipe.rs
>>> -index 11f363d62..c12d66016 100644
>>> ---- a/tests/ui/process/process-sigpipe.rs
>>> -+++ b/tests/ui/process/process-sigpipe.rs
>>> -@@ -23,7 +23,7 @@ use std::thread;
>>> - fn main() {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 // Just in case `yes` or `while-echo` doesn=
't check for EPIPE...
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 thread::spawn(|| {
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 thread::sleep_ms(5000);
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 thread::sleep_ms(50000);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process::exit(1);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 });
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 // QNX Neutrino does not have `yes`. Theref=
ore, use=20
>>> `while-echo` for `nto`
>>> diff --git a/meta/recipes-devtools/rust/rust-source.inc=20
>>> b/meta/recipes-devtools/rust/rust-source.inc
>>> index 04204969ba..47a0154cdc 100644
>>> --- a/meta/recipes-devtools/rust/rust-source.inc
>>> +++ b/meta/recipes-devtools/rust/rust-source.inc
>>> @@ -4,7 +4,6 @@ SRC_URI +=3D=20
>>> "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
>>> file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patc=
h;patchdir=3D${RUSTSRC}=20
>>> \
>>> file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
>>> file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D${RUSTS=
RC}=20
>>> \
>>> -file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;pa=
tchdir=3D${RUSTSRC}=20
>>> \
>>> file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patc=
h;patchdir=3D${RUSTSRC}=20
>>> \
>>> file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patc=
h;patchdir=3D${RUSTSRC}=20
>>> \
>>> file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=3D${RUSTS=
RC}=20
>>> \
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online=20
>>> (#232879):https://lists.openembedded.org/g/openembedded-core/message/=
232879
>>> Mute This Topic:https://lists.openembedded.org/mt/118259934/3616765
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub=20
>>> [randy.macleod@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------WKPJ2NyEuSZx0aOIOtZ0jl96
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62H4e2Jm1215478

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <head>

   =20
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-03-17 12:10 a.m., Deepesh
      Varatharajan wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:8e26998b-52a6-4d5e-964f-5f4b5c0=
9b43c@windriver.com">
      <br>
      On 17-03-2026 02:38, Randy MacLeod wrote:
      <br>
      <blockquote type=3D"cite">On 2026-03-11 9:26 a.m., Varatharajan,
        Deepesh via lists.openembedded.org wrote:
        <br>
        <blockquote type=3D"cite">From: Deepesh
          Varatharajan<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:D=
eepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com=
&gt;</a>
          <br>
          <br>
          This patch was originally introduced to address a rare failure
          on the PPC
          <br>
          target and with the latest version of rustc this issue no
          longer occurs.
          <br>
          So, this patch can be removed.
          <br>
        </blockquote>
        <br>
        <br>
        FYI, merged:
        <br>
        3b5c2d8bdb&nbsp; &nbsp;2026-03-11&nbsp; &nbsp;rust: Drop
        oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
        <br>
        <br>
        If this causes problems for anyone, please let us know and we
        can consider restoring the patch.
        <br>
        <br>
        Deepesh,
        <br>
        <br>
        Surely there's some existing data that you can point to,
        <br>
        to convince upstream to double the timeout if not 10x it?
        <br>
        <br>
      </blockquote>
      Currently I don=E2=80=99t have data since I can=E2=80=99t reproduce=
 the failure
      with the latest rustc.
      <br>
      If the failure happens again, I=E2=80=99ll collect the data and rea=
ch out
      to upstream to discuss
      <br>
      increasing the timeout.&nbsp;<br>
    </blockquote>
    <p>Deepesh and I talked offline and he reminded me that while we
      have<br>
      some old ppc32 errors logged in the YP bugzilla,&nbsp;<br>
      &nbsp; &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D15625">https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D15625</a><br>
      <br>
      this issue has NOT happened on the new YP AB HW.<br>
      <br>
      YP AB is not running ppc32 testing anymore so let's wait and see
      if anyone else encounters the problem&nbsp;<br>
      again and re-opens the bug.</p>
    <p>Thanks,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:8e26998b-52a6-4d5e-964f-5f4b5c0=
9b43c@windriver.com"><br>
      Regards,
      <br>
      Deepesh
      <br>
      <br>
      <blockquote type=3D"cite">../Randy
        <br>
        <br>
        <blockquote type=3D"cite">Signed-off-by: Deepesh
          Varatharajan<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:D=
eepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com=
&gt;</a>
          <br>
          ---
          <br>
          &nbsp; ...crease-timeout-in-process-sigpipe-ru.patch | 31
          -------------------
          <br>
          &nbsp; meta/recipes-devtools/rust/rust-source.inc&nbsp;&nbsp;&n=
bsp; |&nbsp; 1 -
          <br>
          &nbsp; 2 files changed, 32 deletions(-)
          <br>
          &nbsp; delete mode 100644
meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-proces=
s-sigpipe-ru.patch<br>
          <br>
          diff --git
a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-proc=
ess-sigpipe-ru.patch
b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-proc=
ess-sigpipe-ru.patch
          <br>
          deleted file mode 100644
          <br>
          index 5bd1abffb4..0000000000
          <br>
          ---
a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-proc=
ess-sigpipe-ru.patch<br>
          +++ /dev/null
          <br>
          @@ -1,31 +0,0 @@
          <br>
          -From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17
          00:00:00 2001
          <br>
          -From: Peter Tatrai<a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:peter.tatrai.ext@siemens.com">&lt;peter.tatrai.ext@siemens.com&gt;<=
/a>
          <br>
          -Date: Mon, 4 Nov 2024 13:58:16 +0100
          <br>
          -Subject: [PATCH] oeqa/selftest: Increase timeout in
          process-sigpipe rust test
          <br>
          -
          <br>
          -This patch increases the timeout for the process-sigpipe rust
          test, which
          <br>
          -occasionally fails when the server is under heavy load.
          Increasing the timeout
          <br>
          -reduces the likelihood of false negatives under load.
          <br>
          -
          <br>
          -Fixes [YOCTO #15625]
          <br>
          -
          <br>
          -Upstream-Status: Inappropriate [OE testing specific]
          <br>
          -
          <br>
          -Signed-off-by: Peter
          Tatrai<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:peter.t=
atrai.ext@siemens.com">&lt;peter.tatrai.ext@siemens.com&gt;</a>
          <br>
          ----
          <br>
          - tests/ui/process/process-sigpipe.rs | 2 +-
          <br>
          - 1 file changed, 1 insertion(+), 1 deletion(-)
          <br>
          -
          <br>
          -diff --git a/tests/ui/process/process-sigpipe.rs
          b/tests/ui/process/process-sigpipe.rs
          <br>
          -index 11f363d62..c12d66016 100644
          <br>
          ---- a/tests/ui/process/process-sigpipe.rs
          <br>
          -+++ b/tests/ui/process/process-sigpipe.rs
          <br>
          -@@ -23,7 +23,7 @@ use std::thread;
          <br>
          - fn main() {
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; // Just in case `yes` or `while-echo`=
 doesn't check for
          EPIPE...
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; thread::spawn(|| {
          <br>
          --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; thread::sleep_ms(5=
000);
          <br>
          -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; thread::sleep_ms(5=
0000);
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process::exit=
(1);
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; });
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; // QNX Neutrino does not have `yes`. =
Therefore, use
          `while-echo` for `nto`
          <br>
          diff --git a/meta/recipes-devtools/rust/rust-source.inc
          b/meta/recipes-devtools/rust/rust-source.inc
          <br>
          index 04204969ba..47a0154cdc 100644
          <br>
          --- a/meta/recipes-devtools/rust/rust-source.inc
          <br>
          +++ b/meta/recipes-devtools/rust/rust-source.inc
          <br>
          @@ -4,7 +4,6 @@ SRC_URI +=3D
          &quot;<a class=3D"moz-txt-link-freetext" href=3D"https://static=
.rust-lang.org/dist/rustc-$">https://static.rust-lang.org/dist/rustc-$</a=
>{RUST_VERSION}-src.tar.xz;n
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"file://0001-Define-more-ioctl-=
codes-on-riscv32gc-unknown-linux-g.patch;patchdir=3D$">file://0001-Define=
-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=3D$</a>{RUS=
TSRC}
          \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://rust-oe-selft=
est.patch;patchdir=3D$">file://rust-oe-selftest.patch;patchdir=3D$</a>{RU=
STSRC} \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://repro-issue-f=
ix-with-cc-crate-hashmap.patch;patchdir=3D$">file://repro-issue-fix-with-=
cc-crate-hashmap.patch;patchdir=3D$</a>{RUSTSRC}
          \
          <br>
-file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchd=
ir=3D${RUSTSRC}
          \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"file://0001-src-core-build_ste=
ps-tool.rs-switch-off-lto-for-rust.patch;patchdir=3D$">file://0001-src-co=
re-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=3D$</a>{RUS=
TSRC}
          \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"file://0001-riscv32-Define-pla=
in-syscalls-as-their-time64-varian.patch;patchdir=3D$">file://0001-riscv3=
2-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=3D$</a>{RUS=
TSRC}
          \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Update-c=
all-llvm-intrinsics-test.patch;patchdir=3D$">file://0001-Update-call-llvm=
-intrinsics-test.patch;patchdir=3D$</a>{RUSTSRC}
          \
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
          <br>
          Links: You receive all messages sent to this group.
          <br>
          View/Reply Online
(#232879):<a class=3D"moz-txt-link-freetext" href=3D"https://lists.openem=
bedded.org/g/openembedded-core/message/232879">https://lists.openembedded=
.org/g/openembedded-core/message/232879</a><br>
          Mute This
          Topic:<a class=3D"moz-txt-link-freetext" href=3D"https://lists.=
openembedded.org/mt/118259934/3616765">https://lists.openembedded.org/mt/=
118259934/3616765</a>
          <br>
          Group <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Owne=
r:openembedded-core+owner@lists.openembedded.org">Owner:openembedded-core=
+owner@lists.openembedded.org</a>
          <br>
Unsubscribe:<a class=3D"moz-txt-link-freetext" href=3D"https://lists.open=
embedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/=
openembedded-core/unsub</a>
          [<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:randy.mac=
leod@windriver.com">randy.macleod@windriver.com</a>]
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
          <br>
          <br>
        </blockquote>
        <br>
        --&nbsp;<br>
        # Randy MacLeod
        <br>
        # Wind River Linux
        <br>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------WKPJ2NyEuSZx0aOIOtZ0jl96--

