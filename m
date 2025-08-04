Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DAEC87FD3
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 04:53:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10934.1754283189033976198
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Aug 2025 21:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03119b9b16=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5744P28N1834410
	for <openembedded-core@lists.openembedded.org>; Sun, 3 Aug 2025 21:53:08 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489j6gs1kj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 21:53:08 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5744r76h1879883
	for <openembedded-core@lists.openembedded.org>; Sun, 3 Aug 2025 21:53:08 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489j6gs1kg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 21:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2Q2R5r4Q8811vr2m8ztJoqAkDI+BioyPT/TXehlXSnklZWSCjnAV0IUVKkhlV5YrCR1cSlXpgSZsTGKxUEMgBETNZlfowyUm+BfcELP8lhHuvFI5PdvF9EP1RMZFw2lw0AKGwn/m/oxSiHQFzxVcBt/sIVx7btPZs97D0emORcGVMHG2i8ojTobPhjcJ1EbCEdUA+h9cjKQWZqHHPcpD43lkY8hv5hNMAbXKqmdIIKMi6XXKIyaRD9HSvNgCoDX+gqgfASNuy+0sZ1oPwZQ5tC784Bh8YpXgLgrlO9Fg4RZBSlXMvVY1pVwBZ47t8hdEVtfQIeUQsTYz3bmchfSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oLtyrceFSpOYAz8UixgmtLwoUgHBjWeEayI+6SPzHc=;
 b=NTO0aBQ2UrvrIj1lqB11A2nvch9psi0iuLHbbkbo+cPUkvcbmuH/18+wWqutgiBwZRsqGNF3qMwzv5Bet3u+t4UyRB7q/niU+f/mkReSH/W68UMKPhe0AhDHMQos4rBJJNNDNmHX76qt+KG+PhA8iFqzZ9QAxuf4IY62kslF1RNtjmn5QoY+V6wIKYpJM/0oWKau7VweTfiPwcasgECZaWKhEUpAvIYPA/+yIvVg886pM6tbIezDKw7itOYOq8M1klNOT6w953O9Udha/2RWOkdyggKWrligOr3lzBwulUT/4nUMrZ7XItZjbEXUa6/w1y6Zyr+qh9Cwm5avEvQvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 04:53:05 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%4]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 04:53:04 +0000
Content-Type: multipart/alternative;
 boundary="------------ByXfpaD4sAzhmjAKwYC30hB2"
Message-ID: <8b79c84e-99df-4b5b-a43a-467dc65364bc@windriver.com>
Date: Mon, 4 Aug 2025 10:22:54 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Randy MacLeod <Randy.MacLeod@windriver.com>
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
Subject: =?UTF-8?Q?Clang_Testsuite_Integration_=E2=80=93_Initial_Progress_an?=
 =?UTF-8?Q?d_Next_Steps?=
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 6572e950-b545-4445-aac4-08ddd312cc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|52116014|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZlQ0NkU5SVUyMUlLdUd3b1p4TForRkVCcitkUHJYYnJuKzVYa1p1ZUhBWHU4?=
 =?utf-8?B?ak1nQ2I3RlI4QkZ1R0lqOGV3Rk9XR0RQU0lTSEFMTEVrYXFFUVhSWXVnWE5Q?=
 =?utf-8?B?aFdGTWJhdEJMcmxkc2xUeXYzblJ5QWRjMTRhRDFpS3hHLzV2WXNPa0c3Mng1?=
 =?utf-8?B?K280L3ZyYjRZTlU1dVdONjRNL2taY3FHcEtmdVJCY3FNZVVablU2azF6aFNE?=
 =?utf-8?B?VXNEemV4dW9objFLUUNFSGJRUU5ONHIvOUJHU2tHVXJkbE5UaDVkeXh3cGxp?=
 =?utf-8?B?NGw2MTVXK1RHcmJlVVhEZGcySm1ZOXR2WWdFZDROWEk1WEllZXRZWk5TVHVJ?=
 =?utf-8?B?QkI1TkxMK2J4Rml0WDV5WXVmNWd6REkxbUlaVDRIVVN1b2c0ajZaYkFBUVls?=
 =?utf-8?B?KzRVNC80OEg2bmJoNTdEbUcwK1N2aEpRS1NIYTF6aWNULzhqbEFMOWFQWStt?=
 =?utf-8?B?WUUxSHlHbVZJOU9RTjc3UkF5a2FXemdtbW5CbFJsWU82NWp4cVNxOFZVWXYw?=
 =?utf-8?B?NW5zSlNxU1lERkhScVQ0MjJJMVpCVW5ia29pajdIUmF1MFZya0FIeGtNaGN1?=
 =?utf-8?B?OG42cVdTTTNwQ1R1bElaMEkwNFJ0TUhMYkl1S0JBYTdybktNdnFVQzVlWm9a?=
 =?utf-8?B?Q0ZJNWhyS0c5d25uNzcrUUp1OEdUL2hpeTYvaEFGK3ZPa01lSGtnRzNlTElZ?=
 =?utf-8?B?T3dPTE83bWJveUFDWE1nSGRxVTJHUWRwN01sZmVLWnZTYzdKS2NHT0N4eHV4?=
 =?utf-8?B?OWdlYnZOMUZzVEdEYkhqT0xvdTNCNVJlSFpxS2FXc2svOFpteWZuSXEydmVM?=
 =?utf-8?B?d1M2dkgrN2toc0ZvTWlaSWpjVEZZY3BKeFhNc0RiWU1oNHFpYnkzUnFPNXpL?=
 =?utf-8?B?ZjJHdW8vUmNpSjM0dXpkQW4zdlJJYkZOVXRoZklnN2xVNkgwRy9iQlNkWmpk?=
 =?utf-8?B?WGd3VWwvMU5HMmVXVTNydW12OWNNVU1wVkRFT1ZKdmo2dzlKbERJWEV4TFdT?=
 =?utf-8?B?aks3NmVlYmpaSXowVWswQ05vdTVCeU1iLzl1bTlUZGRXeVFna1E5c3JLWnU1?=
 =?utf-8?B?Ni9jRVdZeUhJdXZnQ1lSczgxWU0ybWhuTXlWNXJOV3Y3V3dlODNRRE02WGpG?=
 =?utf-8?B?b3l0dzBvbXZqVFJ4Q25iUnZYVTJzUkdaNnVjT1VucU9DckZIQUdxcXdadUlU?=
 =?utf-8?B?SW8yb3ljZHBnQjkzS0EwaWdlYlpLdnp0NExyRFpOTGJaRXRqaDllTFF0UVlY?=
 =?utf-8?B?L1V4ZktFZnBmZ1FxS250RTVzYlIrRmhQdGEwb0pzZ0tlUUxoZ3lFSFAwa1lO?=
 =?utf-8?B?amYrc2t2RDBUTjJKeXQyWDArZVJqWWdPcFNTMjVIMSs4dkpCWmlkdUV5dTE1?=
 =?utf-8?B?b0h3bEtBVDFaVVdZSXNSZXNZcExhbTBzSU5mbXB3bEI0ZW9SSitsU25ndEFP?=
 =?utf-8?B?WWRKcEdieUcrYlhUbmVwNXZTVHpWVEtCN2FWSDl6TEkyMTRSNWlZWWQ2TkVq?=
 =?utf-8?B?VElrMTNlck9HQW0weXB2VHlqZDc4SUJFU0kzdEdwSEpVd2pndGFmV0ZkTlda?=
 =?utf-8?B?S3BVajhKenk1SktwazU5dXVieWYyL1cxUFFhcHB4MVdRZWo1S0lNS0tQSVVP?=
 =?utf-8?B?cCs2aFEzZGVSTGpBT3JXcnZGZ3ZGMkpkSzUwWHFISlQySnhRUm9RTTRRYWNp?=
 =?utf-8?B?a1ZZbWpXSWZ4bE9sYm11NGpQbldGTUVjNnpBVzQzZkZzbWFNVGVwTTJ2cGhT?=
 =?utf-8?B?WW8zV3plMzFMZERiM1RvWVVsS2MzWWJkanJZRndUWWV3bkF4d0VFYWVGd296?=
 =?utf-8?B?dUNHSTd4aVJiR1VoMlM1WndoRjg0U0RJcG9uMnl4eStDQXJUYVFZS0NUSkcy?=
 =?utf-8?Q?rLF20rzLYQC+Q?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1dYR0V4MFVub0tzdi9RUUFXNHoxYmxXZDVITU9rZjVpSXprL2pyQWsyYllS?=
 =?utf-8?B?RDk0Q2NpUFRCOFQzZDJlWUUwRnhBTERTRU53WHkydU5wM242d21TcE9vZjBQ?=
 =?utf-8?B?RlBZSU1RU1ZzVjV4eUFuRms2R256R3VwU1VBUVU4eTZtMXI1eWNJaXY2Vm1X?=
 =?utf-8?B?UnVNYkNnT3RRVkZrTngxZGxmYXNGRDJZVEMxeE5pSnp0MGhmYnQzSHFxVHNp?=
 =?utf-8?B?Q3FsaWp1UWcvZFBlblZyQ2syaDhialNFRUR3MWJjNnovMDVWWXduVWJSOVZF?=
 =?utf-8?B?YXMxbDNQWEpxbDhzOGxGNmpaTkZmdGVuNW9CMzRnSmJLUGJleWxLTGpOT2V3?=
 =?utf-8?B?anZoTWhvZ2JJcTJMbjN6ckp2RHlHK1dxQ0RNQUdrV3ZwaU1oZ0ttSzA1RnZu?=
 =?utf-8?B?TTBNamZsUncrbVJ4T2wzZlpaWm1JZEVZZlBWbERjcTVOVk9BTkhiKy96K1l4?=
 =?utf-8?B?T3k5NGZ4MndNL3VQQnd1THFSV0dUbktrUjR2dmNlbzJKTUJrRGN1MFMwMkpl?=
 =?utf-8?B?dG5TbWtmcFlxN1NacFBjSUVteksybVl1VGY4TDVwUE1hVHVkQzhoc3BELzE2?=
 =?utf-8?B?a2xUNWtiY0ovZ25CL0w5cEF0c2kzaDJ4c0NJajRKek94U0Jid2tSWWFSZXND?=
 =?utf-8?B?cmF3eTNzSU0vWDFwZDgyMnpDY1MyRlE3UlhNQVJHaStxdzFkekE1emI5SHlS?=
 =?utf-8?B?VGw2bHRLUUNTYVFWb0ZpeWk1M0xrSUxqTlRmU2xJMnR4cjVUZWZjSU5yR0x0?=
 =?utf-8?B?YzlLM2RIcTE3Q0RtRUZ4ejRERVZ2eUQzQ2UyaU96aDFiK25PZ09RUEMxTVRx?=
 =?utf-8?B?YWNyeW10Skw5OGp2VGxFOHpaWG05NW1tRm5SdVYwRXpsdXVNZ1IxTk5ZSXdx?=
 =?utf-8?B?cm1xbVRZR3hkdjZFN0lkbExRa3RKcytNS1BVc0tSTDRYY01yNUwzU2g1LzBr?=
 =?utf-8?B?MTMrMWcxNkJ2TjZrSnk4bmlkdzBVa2xocW5GbFpHTDNpdDdzMEZQY2YzMDk4?=
 =?utf-8?B?S2FGK2R6aUNvTWtiSE82RVJuTXowNjFzTmZZQ2xVb3VNNjd1cTYzVG5XTFRj?=
 =?utf-8?B?Ry9JNE5tZ1dXd1J0cFEyYWozRlVtTGZFTmdXNjM2MG5DM3gyczM0Qk4wS3VV?=
 =?utf-8?B?K2t0ZzlBL1FyZjl0QVc2bUNUWEp5TnFzZTJ3NkpVOSsvT3ZRVmVxYWJVK1JU?=
 =?utf-8?B?NjZ1dks2a1ZPRjkvK3ZFWC9pbDhLRHU4ZE1tUDJEbUI2dU9hbnhZMktaQjNu?=
 =?utf-8?B?eEpQWUFWN0p6eXZSTHdiL1BDREVnZ0F5NUt3L21pREhrT0x4M0tDdlc0dU1q?=
 =?utf-8?B?MCsvcWlubGM0RkwwbUxyZ3o3TFV3b2JrUm15R0c3aGRzczhuK3VrZHBZOW9K?=
 =?utf-8?B?V1hmV1RqOXg2WmdUcW10NlFuMXJMNm1QaFJ6S2VmcnlYRFVZUEgvelY3Umxz?=
 =?utf-8?B?bHkvNm52cmg0V1hzamdkMk5XNzRML2wrcm5qc1EyS0JNakxhQVFFc1l5RFJj?=
 =?utf-8?B?R2p6dSt1Q1pGOWgzOUtDcFAzN1VxdTRuelZ2L0F4MjBoQVJlbTAxdThVZktS?=
 =?utf-8?B?K0JKNDdtR2FQRXJxWlhXT2RmbzRreWlJQmhpQXJoSkZGWUNCb212TGNaNWdV?=
 =?utf-8?B?OElVOW9sM1BaNkJqUk9pYzJjQ211TGdNVHpzTC9FalNXNEJKcm9mZVZ0S0FZ?=
 =?utf-8?B?U1NyVUdwdHRueXZhTmREcENMOHhOWlVJdzlTVDBxNHlNRlFNQ25yR2QwNEVZ?=
 =?utf-8?B?Y0JRVldNNUtTV1VNRU14SFl4Q1ZOVllERk9hRlBVQmliYW9wT00ydWtOa1dj?=
 =?utf-8?B?QjRKancwTFdqU2F4dTgxR2ZFcTJKWHN2MXJOcEsyOTZlMVdPSlFOeERFREV5?=
 =?utf-8?B?STkzbzVIN0tCTWpYdEpmTjhqNVp3SUsvTHhjV0g0aXRJNTBJTDUrMTVPbGhY?=
 =?utf-8?B?MmhzNkZqZm5OcjJnYWdpUnFQUGY4Z3p6cVh4MTA3WTE2SzFnNnlYS3lDVGlX?=
 =?utf-8?B?TlJIZkxZV2JHYkJ0eU41bmpYTk5lZ2JtNWtDM3FPRjJ3UzNvd3JKK1orNStu?=
 =?utf-8?B?VFl2eHljZ2E4RnJFNTVjRHRkeUFxb3Y2NzlaSjNIbkpPRlNscFVJTGZBalA3?=
 =?utf-8?B?S3VyVDZMeUVvaHBQQnU5aTVOd2JSd3JQL1JCSjd1UEk2aGpOVDR3cE0yS1JC?=
 =?utf-8?B?cVlEVXNVK3N2QzlKb2V5WmdTTXJaNU05T3NKdEVLVTFwekM0bWRrMjZrSGIy?=
 =?utf-8?Q?YfXIhgw2YcOZxA/BKXyPsObLccNwq8Q85AJJDGgkww=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6572e950-b545-4445-aac4-08ddd312cc37
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 04:53:04.6748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOIczHM3e/0muh7Cx3xBrIc+K/PWj8pjzBYUpXmVQ2hqEkIw6S+DIAoV73gcy065iDnqGd6KqZXzlyptJzYHwY+POh5quu/5kqjCcsBZW4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Authority-Analysis: v=2.4 cv=d5n1yQjE c=1 sm=1 tr=0 ts=68903cb4 cx=c_pps
 a=2SqP+K/7gXR7M5QT5t26og==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=5KLPUuaC_9wA:10 a=iGHA9ds3AAAA:8
 a=qBKthHf6GWBdHUZyjXgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nyo9WNU9cn-gMt32H5UA:9 a=woRWHz7kBrH8sWWz:21 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: M49jWLlku3owpkQlrBTfOrAPSl01OiWl
X-Proofpoint-ORIG-GUID: aWORwwCadwBliOMxohF5T0yOv197Y2li
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMyBTYWx0ZWRfX3Wb3K9XhbxaN
 s/FvwdAa7//fys6plzdqrqjTq9VlnQIm9qY9DYbEtya7i4/GpuWsdBoURBZp1lm34ujWu+U6N9e
 +DeVwdyqYj5vTsBNGCOJPL7RAB4IFeEYP/ECiXXmTZlub6xBlTRxR9ztiT3mvjHizPDSRqpptix
 MQt1UpLyd8eJnDArzB6c+/Tul1fr3Xr3LfpSYxgHnMF5JhenbmFsZpMPefEJIcqzGBJx1BHechB
 UJFOIVlt9kY7w15OafD3Ckz8pwc7QNPTcPm6Audl9aOaON7FiPpmLs9xkz1gfgjZK4qZMoTb4h+
 q/3cOLUOIn2p7LxjdYEJ9JiofU1B+hqVA1t1MHvIhZ6DXAdMHWa6Hc9QQJoVYrY8S/818tCrAKJ
 J/TaibT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 04:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221414

--------------ByXfpaD4sAzhmjAKwYC30hB2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5744P28N1834410

Hello,

We're currently working on integrating the Clang testsuite into the=20
Yocto Project. As a first step, we've implemented an |oe-selftest| for=20
|clang-native| (we understand this isn't the final goal).

The changes are available here:
=F0=9F=94=97 https://git.yoctoproject.org/poky-contrib/log/?h=3Dskokkonda=
/clang-native

_We are now working on enabling support for testing on target systems.=20
Based on our initial analysis:_

  *

    The |lit| framework used by Clang doesn't natively support SSH-based
    remote execution, unlike DejaGnu which provides built-in support for
    remote testing. So, additional customization is required to enable
    remote test execution.

  *

    To enable remote testing, a |lit.site.cfg| file must be generated
    and configured with SSH access details and target-specific parameters.

  *

    Currently, QEMU is not launching after the build completes within
    |oe-selftest|, which is a blocker we=E2=80=99re investigating.

  *

    Once QEMU is successfully launched, we'll establish SSH connectivity
    and begin running tests on the target. This will help identify any
    missing runtime dependencies or other causes of test failures.


We welcome any suggestions or guidance from the community on this approac=
h.


Thanks,

Sundeep KOKKONDA.

--------------ByXfpaD4sAzhmjAKwYC30hB2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5744P28N1834410

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p data-start=3D"208" data-end=3D"214">Hello,</p>
    <p data-start=3D"216" data-end=3D"421">We're currently working on
      integrating the Clang testsuite into the Yocto Project. As a first
      step, we've implemented an <code data-start=3D"337" data-end=3D"350=
">oe-selftest</code>
      for <code data-start=3D"355" data-end=3D"369">clang-native</code> (=
we
      understand this isn't the final goal).</p>
    <p data-start=3D"423" data-end=3D"606">The changes are available here=
:<br data-start=3D"454" data-end=3D"457">
      =F0=9F=94=97 <a class=3D"moz-txt-link-freetext" rel=3D"noopener" ta=
rget=3D"_new" data-start=3D"460" data-end=3D"606" href=3D"https://git.yoc=
toproject.org/poky-contrib/log/?h=3Dskokkonda/clang-native">https://git.y=
octoproject.org/poky-contrib/log/?h=3Dskokkonda/clang-native</a></p>
    <p data-start=3D"608" data-end=3D"708"><u>We are now working on enabl=
ing
        support for testing on target systems. Based on our initial
        analysis:</u></p>
    <ul data-start=3D"710" data-end=3D"1402">
      <li data-start=3D"710" data-end=3D"939">
        <p data-start=3D"712" data-end=3D"939">The <code data-start=3D"71=
6" data-end=3D"721">lit</code> framework used by Clang doesn't
          natively support SSH-based remote execution, unlike DejaGnu
          which provides built-in support for remote testing. So,
          additional customization is required to enable remote test
          execution.</p>
      </li>
      <li data-start=3D"940" data-end=3D"1078">
        <p data-start=3D"942" data-end=3D"1078">To enable remote testing,=
 a
          <code data-start=3D"970" data-end=3D"984">lit.site.cfg</code> f=
ile
          must be generated and configured with SSH access details and
          target-specific parameters.</p>
      </li>
      <li data-start=3D"1079" data-end=3D"1201">
        <p data-start=3D"1081" data-end=3D"1201">Currently, QEMU is not
          launching after the build completes within <code data-start=3D"=
1147" data-end=3D"1160">oe-selftest</code>, which
          is a blocker we=E2=80=99re investigating.</p>
      </li>
      <li data-start=3D"1202" data-end=3D"1402">
        <p data-start=3D"1204" data-end=3D"1402">Once QEMU is successfull=
y
          launched, we'll establish SSH connectivity and begin running
          tests on the target. This will help identify any missing
          runtime dependencies or other causes of test failures.</p>
      </li>
    </ul>
    <p data-start=3D"1404" data-end=3D"1479"><br>
    </p>
    <p data-start=3D"1404" data-end=3D"1479">We welcome any suggestions o=
r
      guidance from the community on this approach.</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Sundeep KOKKONDA.</p>
  </body>
</html>

--------------ByXfpaD4sAzhmjAKwYC30hB2--

