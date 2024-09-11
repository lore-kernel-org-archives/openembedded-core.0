Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE03EE49A0
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 13:12:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21347.1726060345561243062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 06:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998409ca54=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B4rFIk021006
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 06:12:25 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gpbk492x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 06:12:24 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48BDCOi3008439;
	Wed, 11 Sep 2024 06:12:24 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gpbk492w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 06:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvFmKSWImXdD3oEP/0zAzAlpLUN6I6ePLU8Ub5be9ah/VafJJI5sqzwNeyfMZtBtlbBc35svVJer2pNEJoa6dhQryflZvWGciNc3WVTcIYvtPT+DkXm27vAIrmCB6pZTStAcCiLm6tORgxneK+iuDbeiFUFJgF70wL25XVvjdRzAAFDW8ptZ5c7bOQmXtNJ/tAMIZtkquzvm5tL46xX8DtoI1KaJTfHaDv1F1q+dFSqeSvAyZq9PdIcQRCPRdnIbs1la96vohAt9DQpza1Qs/wt2GFzQlkS4y4cToebns6Ms9YRN1r6GnUb/L2L/XAznRDpYVzXkVhiMYyDWWOg9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1j2IiC9+cq8uls1JxQjt/Ti3OMgK+AXiLQo8MPQvuc=;
 b=s+iM0brT3YBEWsA5CMROX7os1i5aDXhiY3WO6ph/HdxgbWulxRkbbHPTn6Ht6u1Bnyyh9+jUNldM0YWMJDlOnhRkD71LE8Q7WGbjODiZCcxe6Ry+psl/Nnc9uQlQy1Coi4kQfmpr7a1SlKxk8d1pbveX+lpaBsjEfc+VUQrA9aHEnt3z9G0btme957MZhaPSkIRZfrz5+FsrRjWsRPikuoc+FOdKf5YTo9hoM1dPeLnl/nV8ir56Y+7CUsnTk0zem//JCe6KWWynDbWn/my+TczZg2UziNJMicuGet0qpDA6Q5nGDScjIWIO6fwoHQ94GciXYMNQ09k+hwBRqMZ2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 13:12:20 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 13:12:18 +0000
Message-ID: <9045437d-5fd4-450a-9098-0db61510b11a@windriver.com>
Date: Wed, 11 Sep 2024 21:12:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] buildcfg: Print bitbake branch and revision
 when it is in a separate repo
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1725456147.git.liezhi.yang@windriver.com>
 <8f43b5d81fdd28340c6c14fddd307b55ac05883e.1725456147.git.liezhi.yang@windriver.com>
 <CANNYZj-MPo05EF2qRezSXKpK6L8Djg0CZxBv--ozuLM42JbGUg@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj-MPo05EF2qRezSXKpK6L8Djg0CZxBv--ozuLM42JbGUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0230.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::10) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|BL1PR11MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 120277ee-1756-4d2c-e6e1-08dcd2635d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bUtja01xbzZ5YjVzeWk5UU1rT2xkZmVRN09GakFGRFlWRlRyTTVaRjV3bGJo?=
 =?utf-8?B?bDA1aWoyaWZzSFdzSEhlOXVCeHdVYXV4aEI3Q2R0OSt4VFJJRVBoZUVPaGFu?=
 =?utf-8?B?cWhic1FhN05ybXRXL0lkVU5uaG4xN0xFNkk2NnVFb1h5WUlCMzNWODZiWExM?=
 =?utf-8?B?VUhTSWhpWXJqYkk3ZWhFQ28yaFAvYW9oYmFiY1NNTmpiOWxiaysrRGpHTUdI?=
 =?utf-8?B?WUlOdlhOMEFQWjVjbW1hRUk3TVp1OWRZT1ZOK2ZOeTNrdmxzVHdQVVlTZnox?=
 =?utf-8?B?akY2Y0YyWHZVN2o3aDh6anhTc2tBNXpxNFc0ODIzTGZ1R05ST2xzaHk0R0x4?=
 =?utf-8?B?NWVNWmVwZ0ZoRUZlWTZlMUduYlJFd0JwVEpEdHliaC9IcVRDU1Q4V1ZJbGJZ?=
 =?utf-8?B?Yiswb3A5eUx4RFlvcW9YMU11U1R3eDg3QyttbW9TUDhZZm5EVm51UU1yaFVO?=
 =?utf-8?B?NjA0U3IzQXdiamxEelZiRk54VkkwRkFkMmtDTkRIQTJFeUZKSFMrSWNrRnVJ?=
 =?utf-8?B?ejhtdWgrU0RTbWRzUG1DNVpvQ1BiWUNTTVpxMEZBckhHV25TMHQxT3Zuc2NH?=
 =?utf-8?B?K1piUm04M3RLUXFUTkN5THl1UCsycDlkU3htYXNPRjc4U3RJd2pxZm1tbDI0?=
 =?utf-8?B?dzBPUkoyQnJndlJtVm5BVll4TXhCcDNtbzg0UDl4THRlMDJ2VndNU1FpZXA2?=
 =?utf-8?B?TVBtRHVtT1FVZGRzdU01N2NqT3EydytDVHQ0WWp2RlJhTGJYbVZNeW9jcGp0?=
 =?utf-8?B?WVh3UWVHTDRZRG1lc1VBU3Q1N3U0RW5SYlRIQ0FEbFBQY1RkcXZ1a0xQOXJn?=
 =?utf-8?B?emoyVmZVQWlxNHdFVFJNNDhtZGN0RWFueWZ0aERtNE84SXZ1N1BGSEhkR2FT?=
 =?utf-8?B?Mjg4R1hLaUZPbW9JNXprczY0b2RQdU9lNkNHSzNteUVBSThqSXpBQkk3eS9Q?=
 =?utf-8?B?RnE3cjY2V2s0c0JFOWZUY0J4SDVNSGNtdFFBcXdsYWdlOFF0Q21uRlZNWUNs?=
 =?utf-8?B?d3FLQitvbTdLZGFjc0t5UlNEaTFYZDZUUWp2bnFINU1WK3NQYWUveWM1TnpP?=
 =?utf-8?B?bVVHUnpUTTNVcnJKK0ZEQUVXamhyNFl3L3RsUTVXemJ3VlpJc08vdklOdFBJ?=
 =?utf-8?B?VGw2ZVhzZ2cxTURZamNXTUJtVS95NHVOOHcvN0pUVXZjUUFpS0hyOS9aSFU3?=
 =?utf-8?B?aXRIU0JCVWdEOWNXbXRodk94WkZQUFpqd0RvOCtON3hWLzNJNTN3c2hUNWVu?=
 =?utf-8?B?VUs4RGFrQUY5MmlydU04ZnMySGJkamR6Z3lINE9Dazgzem1EVXJSYUlyWm5X?=
 =?utf-8?B?TzdXZmZIUGd4NmEwY0o2YlpnRGt2Z0NtNUdtd0gxN0g5blByZWtSMEpSN3FW?=
 =?utf-8?B?SkJzM3d4dldUK2RVWXU2WEZITDlQZURQSUNyYnVvZlJ1TktXT2NwOE9oY0cy?=
 =?utf-8?B?b2dQUWN5REJYUFRYVXVDZjhBa21KazcycVJHUGJlMFdlSU1kRWY2TWhJbjRl?=
 =?utf-8?B?WDRabCsrZzB3aGVHUDZxVTZzSUZ5ZTZXOXpoVjZ1aWQ0bzBiT2pVTWQ3dzVz?=
 =?utf-8?B?UStuWGJpa2tMeGRYRFNBellUNXdkaFJkckQ1aGhSU200dkt5V29Pd0Q0NTUv?=
 =?utf-8?B?WWZqdDlPTnUxYWNNTDF4Yy9NenhoVmZCaS9FVnorQXlFazdzQUx0WHZNL3hr?=
 =?utf-8?B?R20vVlRjZ3d1SEVGNytKd3YvTnJrd25MNHE4b1ZZT2xRNndYc0RHYllDdGFi?=
 =?utf-8?Q?lLSlKiCwgwOUYOVyuY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MngzeHNqb09IY3RQUDZjQTdid3llZ1hxRGQxMlFoeldidGZRQjVHc3VDcXVS?=
 =?utf-8?B?ZmtXMjhDQlBscm1zSzdSK3JZeDVBTGNaN3d1Wm4vTkVnTFRvTjdZbHgzOE41?=
 =?utf-8?B?TEtqVkVzTmpxbkt3WFQyOXQzYlpLZHB5NjIxc0RQdnhEVktpakFDQ2FjRDUz?=
 =?utf-8?B?elhKN29IaktWQUxleTYyZGIzQUZrcnZwQ1dvL3VIbStaNnlNaHlTb0ZqdVds?=
 =?utf-8?B?VGk5YUN5VjJuaDFmRmJNZmEwajdTYzZWTFI1TVNrY2NIM0t4czA3cnE2ZmFa?=
 =?utf-8?B?ZGwrM2h1Q2NicUo1cnVYSmVpNy9iZ0lKb1kwNFNnaTgvMGVnNmFST1kwOXla?=
 =?utf-8?B?c1pzM21nRHViUkFlREwwLzNZVXlESDBqWWF1bXAveHlUR0VMNTNDbFQwbjN0?=
 =?utf-8?B?bXN3NU5GZlpYMlpWaUlKMDlvQTJFNUI3N0hkdjk1MW13dkVQMWhUbGQ4N00r?=
 =?utf-8?B?bnhvYjBWOUx3aWEva2FML3ZDS3BmVTJ0S1oxTmxhLy82UFJKUGhKamxFV1Ev?=
 =?utf-8?B?S2p4bmdkcDEzRWh2enI4bmh0UGNwNnRMaXE4VkVzMXEwL1VINStyN0FlNVht?=
 =?utf-8?B?cTNxTVYzK0c0ZHljeHBGb3JRT3R5bEkySG9HVzNDb1dkRUttakpTakZ4V1V2?=
 =?utf-8?B?S2ZpSjcySFNZRngzOTBBRnpRUXlvTjhoNitFaUF0VzRIWnorUStLNXN4c016?=
 =?utf-8?B?Y1FxNlRJeHJydkxHMjFYMytFZHgwRkVibzcrUEVhZmMwMjhpR1orNk5DOFkw?=
 =?utf-8?B?NXhRU1ppQzFpTVg2QmYvRFZTN1MweWdHb3oxcjJKbXhKSEUrNHY5dWR4THBx?=
 =?utf-8?B?YlpYVzJCQm92N1g1MUp5VnFxdmJXOVMrb1ovaXorK3A0R2pJbVNDcjF2Nytv?=
 =?utf-8?B?S081Mkl6MUJ2RWpXRkpNaThtYUpzZnI1c2g5Ym0yVi9qQ0RzT29paEEvVWVC?=
 =?utf-8?B?cmh2UVZyblRwWllqL1Jhbmh3bWZQOUxjK2dseDZldU5OS1hobGZUanBvZEcw?=
 =?utf-8?B?c2FJV3ZIcjM2MTk2dWFEU1NCeEFTVmRsTEU3MUFFRFpuRndBUDdYQU80cjBF?=
 =?utf-8?B?VUhlTjBtcWpKNlR1NGtCSUZ2ZW92c3gwK2REZ0k1MEtzOTFBN0dJTWJaQjBt?=
 =?utf-8?B?YXhkT1dmVDV5aUpSQzkzUU13MnE2elVPd3RvZU00eWdpbjFIRGtkeURxTW1v?=
 =?utf-8?B?a3JIVFJINjk0WWpSMVluZXFCbkZ6Wm1QbmowVzhoTDJtV1BjazNRRUZoamFr?=
 =?utf-8?B?ODJBYTBobjJhQnA5VTBYM3BTUCsvSlRVL2NUajZ0QkEvcVp5REhwdlJlVGVX?=
 =?utf-8?B?VVFMMW1zYnk3TW9IMzFsWHhaSU5EM1dZYTZqckYweWF2YnZOZVdHajVyUkVM?=
 =?utf-8?B?ZngrT1VKSmJNMzJBTmRDZ04xMThsUjhlSDRlTXZteWhLOHptVHZDZk9BNzha?=
 =?utf-8?B?eDhURWtjdDZ4bytodkFaLzBic2VuQzBlZlZ5YlN3a0J4eVRpemNDbUFhZUJo?=
 =?utf-8?B?VEY5VHVFQVVmdUxDR2N0MlhCMjlmZ0hKRW5Tbk5xT0RVY1N6K2lTM2wyeHFX?=
 =?utf-8?B?QlRJbGVJbjN4K0NGV0Q1QXlucnRUNHdqMUdXUUtUcGEvK3BYL0hkUmNacmda?=
 =?utf-8?B?WVRhelJqNTEzTFJYaEdDQWs3aHE2RUx3eHBwRmFnVUhvWVJXcGRwK21xOG9U?=
 =?utf-8?B?WS9hQmh0SUJKdWZIRTJWaDNDdkdrb1RIZFBCZmRWOGswRFJvb3B6S2wveTB6?=
 =?utf-8?B?MWRIN0dBblkxKzl6N0kyUDNDalVYdXoxN3pIU2c1S3NoVGlZdzUwbWdnMEJh?=
 =?utf-8?B?ZVY2c2lKcURmL0ViU3ROaXN0aHFzYWRCeWpKVEZCY3ZVNXNkNEZGQVM5czF6?=
 =?utf-8?B?dXdVUDQ0c2dFR2NRZXY2OUVtNTNTYVZtTUdhS0hhOWZxUDcwaE1JR2FhaTNI?=
 =?utf-8?B?Vm41RkhnTXJZOTE2UkRwSUJqaXozSDZWZ1ZDOXg2dFd2TUhaWnY0dGFYTDVO?=
 =?utf-8?B?Y3hMSk1QWFI0VXpnaUg5WUd2MVdST3Z4N0tDVHl0NDRjclVVQkowbUZlYXB0?=
 =?utf-8?B?R2hla0J6VEJvRzZJNGpNMXg0MWhVQ3hSR0c1QmxndkxuQVZxS2hZMEt2TG1Y?=
 =?utf-8?B?V0tsVmlFVC9XaFBJdVdwWWdhR2wvZzg2SUNLVmR3N2VBMVNBV3hOM3h3VGVa?=
 =?utf-8?B?c3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120277ee-1756-4d2c-e6e1-08dcd2635d00
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 13:12:18.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOR4N6UiZHlLp8ekOBlkxgKYkXrrGMfCCOe6qUHty7UR68XuCcoO+UJn7ZSlMx0fwV+pNdg7/Re7NeozpibcjJr3PRuiRs80CBN2Ikv5sHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5978
X-Proofpoint-GUID: OMY97Zak-IFi-5-xL69v-fSL0FhBcIkG
X-Authority-Analysis: v=2.4 cv=Ye3v5BRf c=1 sm=1 tr=0 ts=66e19739 cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=sp3MFURpEol9DfbNtx4A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3TcHeFqv52RAZ6JS2IfRxnxVBGEX7vP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 13:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204384

Hi Alexander,

On 9/4/24 21:36, Alexander Kanavin wrote:
> I don't think putting this into get_layer_revisions() is correct.
> Bitbake is not a layer, and obtaining its revision should be in a
> separate pair of functions:

After more thoughts, I think always print bitbake branch and revision is better,
this is can make the output consistent whenever bitbake is in a separate repo or 
not.

I've sent a V2 for it.

// Robert

> 
> is_bitbake_in_separate_repo()
> get_bitbake_revision()
> 
> Alex
> 
> On Wed, 4 Sept 2024 at 15:23, Robert Yang via lists.openembedded.org
> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Clone https://git.openembedded.org/bitbake into poky/bitbake
>> Before the patch:
>> meta
>> meta-poky
>> meta-yocto-bsp       = "master:377fd06d86f5f3be80a927ee19c30d9557077a7f"
>>
>> Now:
>> bitbake              = "master:5bd0c65c217394cde4c8e382eba6cf7f4b909c97"
>> meta
>> meta-poky
>> meta-yocto-bsp       = "master:377fd06d86f5f3be80a927ee19c30d9557077a7f"
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/lib/oe/buildcfg.py | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
>> index 4b22f18f36..5e2de15127 100644
>> --- a/meta/lib/oe/buildcfg.py
>> +++ b/meta/lib/oe/buildcfg.py
>> @@ -73,6 +73,12 @@ def is_layer_modified(path):
>>
>>   def get_layer_revisions(d):
>>       layers = (d.getVar("BBLAYERS") or "").split()
>> +    # bitbake may in a separate git repo
>> +    bitbake_dir = bb.__file__.rsplit('/', 3)[0]
>> +    bitbake_git_dir = os.path.join(bitbake_dir, '.git')
>> +    if os.path.exists(bitbake_git_dir):
>> +        layers.insert(0, bitbake_dir)
>> +
>>       revisions = []
>>       for i in layers:
>>           revisions.append((i, os.path.basename(i), get_metadata_git_branch(i).strip(), get_metadata_git_revision(i), is_layer_modified(i)))
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204207): https://lists.openembedded.org/g/openembedded-core/message/204207
>> Mute This Topic: https://lists.openembedded.org/mt/108264652/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

