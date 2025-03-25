Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125B4C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 04:44:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.58956.1742877862047725912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 21:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51793d335a=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P4UOLD025554
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 21:44:21 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg42pw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 21:44:21 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52P4iKpR012727;
	Mon, 24 Mar 2025 21:44:20 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg42pw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 21:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEMBxAuOFfcz+wen4If/9W44PXF9/6mErBDYfVHPg0zi/swphxqY5Ni8eGFd/rFpzyHRr3bptwjzW+H7dPauJr4hoXPgg4LgnpskRt0bGaFsWe504k+WkY7Z7LZNlcGHh7lWlAWy5VJdvyJdD5AJuxxNY7DzdJT6JOzZttxIURkXcCgX8TK0VYsvk5+a5XDcITub3RKyfnbEA34yM0Tc244wMYP2v8EI7/gfMhklwVAlDrYbdlD8cZMinvBHs/5avE53rqx27QepgrhKJbeauD2Qb04tMfdhV6hF10rkkTD45S2IU3dw6eMDwOzA1eoHQZAliWT7HSU6dV+vitUYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeatHUyPNQsmKXKGabXXB7KszwXrWRB5RwjbCwP/NnA=;
 b=B4onD6FIB8peAyMAYZNQ8MV0JIvvnNuUAowTd16XcCDYpt1PwP2SlkEUagSEEmwmsXc5TR+X/mCVElfXNfS/hZu86wogHHZh4k6VGI3aXbrIoIn6q8c0Fb6b7GcabAvdY2SBzrpJlMwbh+vB+3/7R+/7OO57fpxLBJLS19f46UGDvFBTyHZ/dYN3FNxX5JS9Q+VPMqRHSQcrtwREY0YTD5MDttoYRrCdp/utMUId+eddOtzSlZ44/mR6T+HVZJTLat4heX4pvljTzQxO3Py1EDQwVzXVfhH/Ce66zrclUDbQbA4cEQ6/88JE2P1Bbt1ZTfLaL3uwIkGGjViGoM66gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 04:44:16 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 04:44:16 +0000
Message-ID: <b1c48246-eb87-4a40-918f-31a41faf8a7e@windriver.com>
Date: Tue, 25 Mar 2025 10:14:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] rust: Fix build failure when multilibs are
 enabled
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
 <20250321132502.2607941-2-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_5kjhg3WPi7E-UxYX2yFXw-KFpR0gdExet79uG-Xin_A@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj_5kjhg3WPi7E-UxYX2yFXw-KFpR0gdExet79uG-Xin_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: f422fa57-d6f3-4d54-027d-08dd6b57b27a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UEM1M1oxRFJBTFBMMkJPZytPTy9wZnFCa1BHU3lRYXdQU1BHVk9SSDJCM2Iv?=
 =?utf-8?B?NENUaHpzd29xd2thWUR5RlRHQks0eDRUM1gwZnhxRVFMYmRjZkRoOUhGSEFN?=
 =?utf-8?B?b1dicDdsWDA3NUFYdi80VzJSNDRCamRqc2l4cFl3UXdzOWx4RFB4TDlaTzFx?=
 =?utf-8?B?NGZuN2xteUlnMnAzeTMvMGpVNHBQQzJMajFxR3U5NUZpbit1N0ZmY281WlVJ?=
 =?utf-8?B?YURHYUNGcTZEUnhaSXQwSjFtaVlDVTNTR0kxMjBrS2xxcUhBaVB3aFgwVnQv?=
 =?utf-8?B?SENQSklRcVpJZ0FpRitEQ0l2d0IvZGlZekgvbDJabFBKRjJqa1UwT0NsQm9O?=
 =?utf-8?B?YmQrbnkrQWVBMlErWFhXZ25HSU5iTnZOMDd0dUMzTTZHaFM2bUlZUFVlakNl?=
 =?utf-8?B?SnZYdWRNMXQwTU9tS0l4bmxtRXNJekp4VEtORHJxdUhDelFDaHRld1pkNWZV?=
 =?utf-8?B?ck1SZHk0dkRtWThpT0FVa1V6SW12UWhLSksvZUZ6a2hDS2RjWWlGSGVCWDFI?=
 =?utf-8?B?V1Z6V2RNNFZFUDB3RDBZa2NLOFlZbitiR1RYbzhpSWd5SXNnT2tYdkczNkNB?=
 =?utf-8?B?RUhsdHZzMkJCYWo4ckJBRHZBVkhNRG5mS0VHN2UxQXpvY0lSMUc3SnJQR3Fs?=
 =?utf-8?B?N2l6cTZ6anNra0o4MDN3bGtLQUFDbnFOUUI4ZWNuNlFwTC80UjZRb3BiNU5q?=
 =?utf-8?B?VVk4aVkra3Jha3RlRHBHWFkrRk50SnFMNXVvcWRDcjNyTHlQU2hpKzRXcFVv?=
 =?utf-8?B?bkVwamJlb3pjc2w0aEN1UEpFOG1tREVsNFllNk5Fcm96RC9nWUQ1a2RXVllS?=
 =?utf-8?B?SGVueStVTFZwc1Zkam0rM3pZRmtlVjdFYWFJeGxZSTVqZFJLSHlwUTZaQldj?=
 =?utf-8?B?YjRZalhUL0VhQWZvTGRrWEtVeURoUnkyWEFESDJNcy9kckJuMWhQNnVsdHoy?=
 =?utf-8?B?d08xemRuVEZSU3lSOGpNTURUWmtjeHlQSS9Fc0s1NU9QUUlxNStLRGhYd2NL?=
 =?utf-8?B?VHhBZWlDbDZ4STI1c0hpUk81OXBKME5wY2drUTJZcWJpQUhYVTEvcDZpUnEy?=
 =?utf-8?B?OTQrSzYrZnNZSUIwYmljcGt0ZGZER2tSdTllNzdmTkczQ2VEdjRpOW82QlYy?=
 =?utf-8?B?UjdKdE5TTzlpUklyWE9kWmZsV2orWWpHMEhmZ2VGeUNtWnNFSHdsaFZPak5X?=
 =?utf-8?B?dlFPNmswNUdmWXphRUJkcGUyWlNGTG1MQnBXQ2kxbHFtVndwY1EyUE01dXZE?=
 =?utf-8?B?bmFXSDNUZXBGRGI3NVMwdHlnUUJJNHhTYWMwRklkbkdGNFFaWEQxOWtKb2tE?=
 =?utf-8?B?TFh2UXkvK1NlWHJlSVZha1FxTFpaWlB1SU11cUhYMGNsdWdEaFl3UFBQNXcz?=
 =?utf-8?B?eXBDcEhKdkZHYWJJUHVpZFVzYVBqMmZNdjdpRkU3Ym1KbW1vcUo5TGJyV21n?=
 =?utf-8?B?TFVyMVI5V2ZOT01Lb3JaNlZVWEpNUGNXaUUyd2VUeTJkUEVOWDFCWmxCaXF5?=
 =?utf-8?B?cXM1a0R5VTMvaEJIMVBzQlRjekZ5U2w5djV0VWhPUVQxYzVjTk5Pa2pCc3Ey?=
 =?utf-8?B?R1F0NExRUkpkUmJBQTJUalNGZk9sanlmeWsvMG12dnJJV0prMitEZHFhR1h4?=
 =?utf-8?B?ZjVzSDQyelZOUjBlOHFpckZta0luNkpCUm5USTZBcTRFUkFCOHhNRGl2ZTVT?=
 =?utf-8?B?Qm55U0dndTVuRTROVnBnelhvbkVVNzVja2JvcUNVLzBUZXk1TzcreEs2d0Ri?=
 =?utf-8?B?Ni9lQm1rNlIvOStNK1VHc1JXWnRhNmVHZTBLU3R6T2dHYm1vSzdaVjlLWWx3?=
 =?utf-8?B?d0hCRjJBZDhkNmpPdXAycGRNQ29hTCsvcG9XK05tRy9scUFNcjEzOC9yZmE3?=
 =?utf-8?Q?vULK6rUPcTZTZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWhQeEs0elpHcGFhQlpZMERrVDNEd2VJVWFKNUJyRHRYNXgxbDc0bHdBSWxm?=
 =?utf-8?B?S2Y4djhSbUg0S3daVHExMFRBR01SZGM5VmVkL3pZWEZDV0thVEdkQkR6TlNL?=
 =?utf-8?B?MUVzTUtjMVFvQ0FrdWdRU0laQVlMQ1pjWlNic0w2bzk4dlo1TFE4NlE2UkNm?=
 =?utf-8?B?WFhVbWJnM0V0bVJPd3IwdEZ0eHhDbUpsRUJwTEorUWpkNmNWaGNDOHRuL1FR?=
 =?utf-8?B?d3I3b3BtZzF2NEVuQUtUZm5WNGlDR2dKRElCWnZXanB1Z095eHozMHlNQmJl?=
 =?utf-8?B?SGxrUVAwaXZtanRZa3lrVU5Yb1lVbmNVblk5dmkyOC90L3FlWjF2SmxjbVZM?=
 =?utf-8?B?bGZ0bGlnSlhPYzhHb3piNnhZdS9FSzEvbkJUL0k4dCtla1Rxdkt3cU91WHo5?=
 =?utf-8?B?bGZsRFhSRW9MUWV0S1hjdGNpaHd0b3dpZU9lMU83bldYWDU4VGVMS2VsTHpK?=
 =?utf-8?B?Q1IwZDJnTnJIV0JFck9NYWViNGR5Z2xrWEJGWmdPbFlNa3JJWTZmdzFMZ2pu?=
 =?utf-8?B?Q0UwUE91eEFhaGIvTkh6MzlzZmZMYUtMNVNnQnV3MnJnNUNaQ3k5NnY0MjZN?=
 =?utf-8?B?UGpjVEFmZ0JMVVpRU3B4cGNLMVRPNHpLZjdYZ1MzOGROSzk4VDFVZTBnNVA4?=
 =?utf-8?B?V0ZQWFd4NmZzZWJjdjhQQmpTRDRPZVBLbXRJYldRTDhUblJrYVhJdFdBMjVh?=
 =?utf-8?B?QjlTenl3QldRa1dQQmNSOTN6Q1ViY3o0cFoxcnhybUJ3QitOdlVHcTNFVUtE?=
 =?utf-8?B?VGxlUTdCWlgrSXl4WU5zOS9vOGVFWnlLMUw2THRUYnN1bVBYdU9ia2ZaRmhS?=
 =?utf-8?B?ODF3M0F0VTE1NHZXMCtwNzRPTGhFQU4zOHlkRW9BM1BCUzVONGZ5TmN6VVdZ?=
 =?utf-8?B?NUlNSEd0clhLNEE4dUlrZCtLcEVTS1NsZERCTEFIWUw5Yk9XS09lR1hIcFJy?=
 =?utf-8?B?cmIxUW1IKzYrTkh1ak5IQVpNQVNEUEx6Mk84VHQzTXB2eDZCTnpzbDlpTVB3?=
 =?utf-8?B?ZFhmKzVpbm1EdjJwZGxTblJJWXBpajMvSHQydndtSElwMk5yOEdJL2EyLyts?=
 =?utf-8?B?aFNMZnMwUjBsSHJQdDdHQ0VvSlVyYXVLYnloRyttT0VNZThwSVBGU1EzeUtj?=
 =?utf-8?B?b0Ryamk4N0hnbkVvUkJGVmxGbWg2K294RnluUWdsVVUzR3ViVWJEcHEwOEww?=
 =?utf-8?B?SnVsOFFHcXdYZzhrS1dZejJxTTd3Y2pOZTB5MFo2UEVJRmE1S2c4V0tib3Np?=
 =?utf-8?B?TSs3a0EzSUJaTCtLS25ZVTRNcDJVRjFwVGZuaWlDSUVwQjZpb01ZeEVoc1BC?=
 =?utf-8?B?MHpJR2F4Wkt3NC9mTXIvQ2daMXBiNnZZandORWJnQWUwY3hNMXFJNUFQUkx2?=
 =?utf-8?B?M3J1K0pPUU9FVW9VSWlmVWo2clJuaXFmNFZDZjlIOVY5WkhoNG9sTTNGenlu?=
 =?utf-8?B?NjZhRVpHbmtzSUxGY1pxNnBmcFNtQ1ZiRUJ2Wlg1UjRkblYxNmluNXE5VkZh?=
 =?utf-8?B?a0psNUZxcVNqczJZR1F0SzhjT29FeXllbjZSMFBNMkpkdkNHT1B6dGRzdHpr?=
 =?utf-8?B?b1VVN2ExSU53YkdRNDU0aGJ6SWdMNEN5VFEyQUM4UVM3aHg4MmQzMXRRZXQz?=
 =?utf-8?B?WFFxNU1FbnBWRzYvSW1xbDk4ejNTV1M5eU1IcDl1eS9QQ2JrMlVVU1gvbkJI?=
 =?utf-8?B?cXZnS2k5ZnBNaXdNY0xKWHFiNkM3YUdXUW9hN05KVHpMd2RmRG5uVFl0bVo0?=
 =?utf-8?B?VWZPZUdDaUlXajdKNlAzOU1JQ2NxbWpBcEU0VzRwR1M4d0JzZFNsNzZMdHJW?=
 =?utf-8?B?L1dXM1NnOHhITFJCTEpQdFVoZDNWM2FPNk0vZzRxc05vVnBDREZERnllTENn?=
 =?utf-8?B?OXRCVG9aV0FVZUNhNmlYU2NpZUN1Vy9SNjhVTGQ0YU1NekpnQUVPVlJJMUtP?=
 =?utf-8?B?Z1hYVG5VTHJlOXhpbmsxVmxIanIrbVZaUC80c2Z3ajJ0SEgwRHNqWTFNMzYx?=
 =?utf-8?B?SkkxRnp5TGx1V0RBMXJTdXprWWZiY2tPZVFVQWRGYWtiZnhpa2M3V3g3NXpV?=
 =?utf-8?B?SzJGUG15Z1NVcWdQTHZ0TDF2NGhTOUFYdklEKzlRUDBhRlhUTGRrVEl4aFV4?=
 =?utf-8?B?Q0c1NDEzVE1mSXB0dXh2OGxTYWNlQUdaRHNkK3JhaUdiYk8vRDhsQURLK3dX?=
 =?utf-8?Q?a0OxiVwF/nKE/0ZrqfmDKzs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f422fa57-d6f3-4d54-027d-08dd6b57b27a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 04:44:15.9140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKVly3N+WFz8kEUxEUShKxhtx/P63wehhiXm5D50eaz/P+EFL/txVwFVpB1ZZ+eFf+4Q/VFmN/b+4i3pKr53TmEp+CeUIW+iL7HjlA9AVta8ArJp6NWAzZFks0osp3Sy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e234a5 cx=c_pps a=yneE0G6ieORTwLKR6pgPXw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=9oIAAdUL0SlM9gdt9nMA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: O7u_2B9C80zASbnFTdIYzKE9rOMSsys1
X-Proofpoint-ORIG-GUID: ChQ6Vi9d5Q2y6tAwlxdv_ExxBYF0R9N-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_02,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=678 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503250030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 04:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213588


On 24-03-2025 14:53, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 21 Mar 2025 at 14:25, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> When multilibs are enabled, rustc could not find dynamic libraries in the
>> lib64 directory due to the bootstrapping process searching in the lib
>> directory. This commit exports both lib and lib64 paths to ensure
>> correct library detection.
> What is creating and populating this lib64 directory then, and how
> does it decide that it should be named 'lib64'? Shouldn't either that,
> or the code that looks in 'lib' be fixed so they match each other?
>
> This looks like an incomplete fix, as it does not get to the bottom of
> the mismatch problem.
>
> Alex
Sure Alex, I will investigate further.

Deepesh

