Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5931C282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 18:37:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2641.1741027029047371027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 10:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=515753ec7a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AuqeG001627
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Mar 2025 18:37:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s78aged-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 18:37:08 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 523Ib7pb007842;
	Mon, 3 Mar 2025 18:37:07 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s78agea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 18:37:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcM/Uow/7JPtIKruYVVWZiG7ms5eTFPbHz32LWj1revUb/X933mnCYDv9z+uRTVUlSvKCFVaIyYG2pkPI9ZN0vhd61hbs2c2KdwWah1bvKFpeULoPCjz0Al6DyJx6enL0TGtJXkGAVqsiOnL97VDqyoOwHIDfaD28bZ55B/h3Ya3kL+tgUsp1HVV2OsRVdZiLK3e6UjcKrbkWcreSpuunVCmazyJJAkEOVbRdDTAsNpk0zu7+PjBSLyHq4nOyffikxpf+O6NpRzfwZlJ2kmI7XkTrxiVvi0niMjK4giejjbb9yMlcTdJbBLAK1ZfTfLq9ceuXCVFTlw6UxwOYBp+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oLGWyr0ADhUp+B1T30vBAciza8Pa5gRSgfjUdQx/9Q=;
 b=bUnTR5aIqJ2mNk1keSDbyQc7E9+K8QZygjBt4PCWsFqMvxP62H776BOU648RmBzRt+jsIz2tyHbauG9SZhVk2w5KgwzwM4zRbQoIuVhn3z9D/MSAUfKcs8sxn2dxwSRnhw2w+4WPSEkEQh6JwESSzh9qUM6wc91BWTvW2CX+D8oxW+ZQEFgNU+rCVZ5pvIdlSH/XL71kO+LUGaT1c5MypvU160+ieot7c7UXrAl28MER7ZKd//8qM2LdyDVEmLih+jbMT9pQ/O9+9m2hPB3MRudwbxIfOP2K/LiOmw8kbfXXSLFaraZ2gqTiR7MN5rW9fmakSIfFHs8Y0r682geiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 18:37:04 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 18:37:04 +0000
Content-Type: multipart/alternative;
 boundary="------------0QC9aeSRg7inkFZCIpK3Wfnn"
Message-ID: <11612993-f599-428b-9c62-e61f7ddab32f@windriver.com>
Date: Mon, 3 Mar 2025 13:37:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] rust: Upgrade 1.82.0->1.83.0
To: alex.kanavin@gmail.com, deepesh.varatharajan@windriver.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_RQmowF90R631qOOkGMftSCo2ic20WemBC4m1bEpdh=Q@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj_RQmowF90R631qOOkGMftSCo2ic20WemBC4m1bEpdh=Q@mail.gmail.com>
X-ClientProxiedBy: BYAPR01CA0035.prod.exchangelabs.com (2603:10b6:a02:80::48)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: d6faaee9-c062-42a5-bbba-08dd5a8264ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OWRIeklWSFQ3VGZnQ0lXZUZSeXRnU1czVUtBSEZEWmxBaXd3aDdVdFN6R2xL?=
 =?utf-8?B?Y1lKa2IvMlc0OGh2bWUzLzVBeG5wZnBzWHV1UGVIK01DcjFkQVU4RGttendv?=
 =?utf-8?B?S21IUStSaXB6TFdyamFsNU90Nm1SVndROEhEdHE1K1hxcDFMNm9aUkpNQUZR?=
 =?utf-8?B?RmFCemhSMExkNEFjUnZOM1FZM2x2WjNvRHZYY1lBT3BiYkxnazNnTDlFVzVi?=
 =?utf-8?B?SlQ2TlJKMHdmcHJIWFZrYXUwcVA4aDI2WWViUGsrTm5UeTFQSU5RdlM3UVdR?=
 =?utf-8?B?dnJrZ1QvNlFKUTVmeXpxZHBEcjVJblNidDc4T1h0U2JpL3ovQ2hMaHNiTHQr?=
 =?utf-8?B?a1dXbjhJaGNPV3p6dUxyMk1ab0NXWktLdGgvWEpGQ2l4ZENlU1NUUnM3dDA5?=
 =?utf-8?B?NXB6U05IZm04Vmh1bHdpWWVBQzZoUGlMYjZENUl6eGRMYldVOWhUOFhkcWww?=
 =?utf-8?B?VVpqNjZqbXNsLy81RFhRQ0htVU5kL2VieEo1N2NKUi82RW1aWHU2Z0lzVmZE?=
 =?utf-8?B?Q2FGOStBV0VqSGU2UG1UUmVLcHNWSHN3c2FCMjM0UkZrUXBmdGJCdzlmL3VC?=
 =?utf-8?B?Z0ovOTJEbVZ4eFhOWlVxMTB6R2ZtR3FHSmlOTUVuYUtpenB6b1VVQ3BCUHFz?=
 =?utf-8?B?K2ZvcEtuSktTNTNkcnd1SHcxREQyMmZZUktrVFgwQnJTUTVUTEpWdTRzY1VK?=
 =?utf-8?B?NTZ6cnNnTkJxNkVnV3JKSmxvOXhSOHJhdXFKTytUd0o3aVNkYWZmY2RmMm5m?=
 =?utf-8?B?ZE1CLy85eWJVakVpaHgxVENZM1lCYVkzTUo2T082L29YT1Uxc0hmdktNM2lE?=
 =?utf-8?B?Z1F3eG84SW51TnlMK3N5dUJXR3RrTkNNWjZSU1BKZXZoN3EwM2w2V2FwN3JP?=
 =?utf-8?B?b2krZkdIVnd5elBOc2ttQ2NSbVpFaDdzUnN0NVFwTHcrN0s3VXNXcTVvN1h2?=
 =?utf-8?B?NFk2WUpPdWdRTXhIbGtySkMvNk0xUytYdmIzc0JLajVaS1FCQjY0R3JIVjQ0?=
 =?utf-8?B?anlGY2NHY3ZoTnp5VEV5WXVwQll5VncydU9XVjFvRC9RNmJ3ZVMrdzJZTEhy?=
 =?utf-8?B?WHNFOWlUUXV2VzZzeFUvSXZPR3ltdzVORnRSNHBaWUVpKy9RTkh3WnpNUHVk?=
 =?utf-8?B?QW42eGdGb2Mzc0R0SGIzbEM0WTBlOHpCTmVYSzk3blJwS2tTOHBqMTFuTERE?=
 =?utf-8?B?eHZmRVJxdXA5MUhXUXdhWndldFVmN1RTdlN0d1FDdFV0OGUveWVxMFA2Qi9j?=
 =?utf-8?B?dW1BdnpiYjQ2dkFaQVFnTXZiS1NHTEJCWFBWMlk2MXc4aWRoOHp5UnBOTzdq?=
 =?utf-8?B?Q2pHZnNjSHpDZjhkYitnc3NqMWFWeHYwU0l0RXNDRk4xdGJKeFZ3aTk4VDE5?=
 =?utf-8?B?N0Nld09ETUNKUFpsakR3OStpOVZQdnZKdUh1U0FTRDNWMUUyQ1NhVnRuVXZP?=
 =?utf-8?B?ZXNFSGx2eHNXbVQzYXVVRzVCVzk0V0ZqdXFRZGdST2JpQ1duR1J6NGRSWDYv?=
 =?utf-8?B?ZWpUblBpeHRMQWZvR2dnNFV6ejJNNFdRNXA1NUtyWXpUckFKaXNUTitGSCt5?=
 =?utf-8?B?ZUdQRUxPbmsrenhuYVR2YkhkN1VvenBkV0xlT3ZybE1kUlZFUStOSXZDcXha?=
 =?utf-8?B?dExVaWZNN0V0TFBTeWw2S25mNUw4TFUzNU1aRnl4NklKcGhBZW1UdTlZQXhw?=
 =?utf-8?B?K2R5MVkrT3FJaTFDN01BK0Y4bGpDbFFlbDlwYU93Sm9MckNiMEpJMk1rZVU1?=
 =?utf-8?B?RHhRUVJjVEw4R0NVMEw5RlJVbDVEczRwTVo1TVZ0SlF5NXU2R2lHdnhnYmdK?=
 =?utf-8?B?bGhITE1UY1ZvQXZEbnJRdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTNzQkNUVnpFeW9ocE9ieDBxQnF1ZzlGbHVwVDEycUNiek5lc3R2alN2WE9E?=
 =?utf-8?B?OExpMFQ5SFlRSU5qVDJxb1d6K0R4MkxxTm5HcWIvZkNVVFl0Vlk5a2EvajRI?=
 =?utf-8?B?MzR0SWgxUThCbjkvSHo2bEd5V3V1OEl2bzI3bDg4RlRqZTRLbDN6QjhVdGxi?=
 =?utf-8?B?UFRadC9LZGw5ZENvS0FQaEg3T1UraERpNGo0czcxMzAzZWtSOTNHT0FRWlFz?=
 =?utf-8?B?Q2l2YUVPd05VMXlnZHdxczRQd1Rtb0RQOFNCTzRud3pBb051SHJmNmpoeXky?=
 =?utf-8?B?eFVVTmR6YVdpemNtK0NzQmJ5YTVFbWtCMVNNMCt5amxwbjdtdXdyUi9wcThk?=
 =?utf-8?B?bUlXQXdRRGkvV0dkeURIT1o4RFU0MzQ1SkJybFlHYmM3cldqNjBlVG96YlEy?=
 =?utf-8?B?TW85Tzl0a2d0ZUtkNklTMGxuNGpBamt2SWpWcnJTUTNnWE1xc0VBLzI5NHRZ?=
 =?utf-8?B?a0RUQXlmMlUzUW1INGhYT0tzVDNEbngvSTBmZjdjUnRQeFkwdXpEZFpxMmlm?=
 =?utf-8?B?d0hVdHBBQ3JOQVlLaDJYdW4zMThNemRKUUdMcFl2R1Ntd2N2dU0zMXkxNnVB?=
 =?utf-8?B?WWU3RzJTdEZKWXBrVlFCdEFXZ1h3dUhjK241cHRGM3kwL3dER3RzVE5KQUor?=
 =?utf-8?B?a0F6cDdoZ091dXFzaW0xWHozRVl6WUZ4T1FDQ3M4bWtYVkNWZXpiZzQ1V3No?=
 =?utf-8?B?NDJQQWxIdmwycEh1bHlUaG9BT3FFSTdXbFd6QjZpSjF6ck1kVC9hOUQ4TVBp?=
 =?utf-8?B?czcxNEsxODMyY1ZzNWc4YVlwUWRZQ3lkM1p2elJsRDZNVWZkVUFSOUk4SDQ1?=
 =?utf-8?B?dHN0SFA5TFB4d3pKQm1XL2V2V0ZVc2ZMcXlsWG4yTWRNWno3T3VpMFA2M1NF?=
 =?utf-8?B?Z0lZL0VRWjB1SExiV2k0SE5vQ0pabHExdWFsb3NUWXBDTjdmNnozVTFPRzZY?=
 =?utf-8?B?ZXRzYXRidWNkWG1kdEs4dE51cmhFbXY2YUU2dUExQWNMWEpPNXcwckwxZklH?=
 =?utf-8?B?YXdCRWVHdndSNERUQjA5SEZiYmlhRTlOTDlGRzg0UGpkd3RDN0lJeFJ3V0Na?=
 =?utf-8?B?cDQxekVEcjNOS1A1M2lyYlQvV0Z0Z1RoVFEyQU5vSlVvZVVwNTk1aE11N0RH?=
 =?utf-8?B?OGEwWlhLUE9Da0FiMlh3ZHdOTGtDcGtNM21HT1NzRHVublJRV2VrUE5tMXNB?=
 =?utf-8?B?YnpRUzFpMWtDSUxqMXRqRzNrNmlMaHRIZ3lXNTdXVlBBZVNJRDF6S2p3cWhT?=
 =?utf-8?B?N0RsQTRjcUxTb3ZiTjhJazNXOWRRU1Y3SjdVQkdFazZhK1pSZ0xieVBWWmpP?=
 =?utf-8?B?ay9CVzBiVkdjMHVtaDBCczZqeTJVKzQ4QkJlMWl6V3dhWmowUlpLQlRmQVdn?=
 =?utf-8?B?R29yUklDZ00vSitTVEVvNlVQQ1pzUXlCU1JGNjFPTm9EOFR3V3dRSVp4dHFH?=
 =?utf-8?B?ampOSjQ1elM1eTg0cVNUYmxFMTdIeUJGa2o4bXNLK0V2U1JxYzR0WmxpSzZR?=
 =?utf-8?B?VmtYYVY1MnRQRmJTVmN6ckNyK3hZb1NYT0k5N3dQR3EwOFBOZmFraXA3LzhG?=
 =?utf-8?B?M0NuYjF4bGczQWZaVndUOTVYdXB3Q3JYRGc5WlBVdlo4VU9zaFhkeG13SXp1?=
 =?utf-8?B?TEZjcDFLdVp0S2VtUHRqWkFXOEVmMjc0T3pyeFlzM3MvZXZLRDY0QXhkSE1a?=
 =?utf-8?B?K0s3aWpvZitUQ1VSM3lTbTZ4RDFkdnVtVit4UktmYyszbm5ocFlnWEEzWVVi?=
 =?utf-8?B?dEN0QU5KN014OWNhZzhEYlVBa050SUlwc0ZkaHFpZnJIUFV1cjF3Z0JZZzB0?=
 =?utf-8?B?bms4OCszOENLZTJhb1pWb3crUWZKUGRhNlVjVnYvYzdTeVh4MFR2M0tYNXBP?=
 =?utf-8?B?OXBCUEcwVUYvZkFGdW5iOFBqT2xQMDk1cy9DbUVVYkw3aXpvU0NTckFTTm5P?=
 =?utf-8?B?alpSeHBFWUVMeVlpdWVnWGZJZGRkeGpuQjViSU83M1p2Y0xqWW9OcDNDT2s2?=
 =?utf-8?B?NnhoQ3FteDlmdDR5RDRNYjV1K2RNMWkvWVlvUUxnZGF0aUkxc3ByZXJKemxU?=
 =?utf-8?B?S1c2aGlyVzdDcHc1WCtuRUVHZHQ1V0VrQWVvVEJ1Y3Z4YTRKVTVTRHZON0Y1?=
 =?utf-8?B?b0t0ZmNYYkQvd1dNcmZxelNRY0xieGJHWEMvemkzMUxoOWVFL2pnWTVhRWlw?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6faaee9-c062-42a5-bbba-08dd5a8264ef
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 18:37:04.5160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84Uc2ENtV6sxvYWL5ZDoat9DAbkcf3WDHw0hN8agDQ7yJDNvPONpVuW4FfC4moE/GP6Od8VxPKzvBPrlBzHUYaHq6Q9d3sx/r1BGdS1Ngxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
X-Proofpoint-GUID: auLabVnpryW3uSW9I_bBaxP3r_XZlrt-
X-Proofpoint-ORIG-GUID: 9HpqmNy76nFx-QkqrraBDag-A3PiVP_v
X-Authority-Analysis: v=2.4 cv=cfwormDM c=1 sm=1 tr=0 ts=67c5f6d4 cx=c_pps a=6H1ifQWhBrriiShMtbI+RA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=JA2aq940_KOEktMTT5YA:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=-te-KJHzSgvSjT3uPxUA:9 a=ah2hQgUWkbjHKC_Y:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_09,2025-03-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503030142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 18:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212226

--------------0QC9aeSRg7inkFZCIpK3Wfnn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-27 11:11 a.m., Alexander Kanavin via lists.openembedded.org 
wrote:
> On Thu, 27 Feb 2025 at 14:44, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> --- a/meta/recipes-devtools/rust/rust_1.82.0.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
>> @@ -129,9 +129,11 @@ python do_configure() {
>>       # [llvm]
>>       config.add_section("llvm")
>>       config.set("llvm", "static-libstdcpp", e(False))
>> +    config.set("llvm", "download-ci-llvm", e(False))
> Why this addition? Please explain in the commit message.
>
> Alex


The commit log for v2 doesn't explain this. In fact, I think the commit 
log is identical.


I know that Deepesh sent his v2 commits late in the evening after 
checking with me and
that he was focused on fixing the issue that Richard and the AB identified.

That means that it's worth putting this through the AB again to confirm that
the issue really is resolved. I think Deepesh said that he was able to 
reproduce it
locally so he expects the AB test to pass.

On chat, Deepesh said that he'll reply on the V2 thread tomorrow to 
explain more.


I think he should send a v3 with updated commit log as Alex requested.

In general, your commit logs are a bit too terse for me in that the 
explain what you
did but not why you did it.

Also the change to meta/recipes-devtools/rust/rust_1.83.0.bb seems to be 
a single blank line addition so please get rid of that in v3.

../Randy


>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212020):https://lists.openembedded.org/g/openembedded-core/message/212020
> Mute This Topic:https://lists.openembedded.org/mt/111414671/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------0QC9aeSRg7inkFZCIpK3Wfnn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-02-27 11:11 a.m., Alexander
      Kanavin via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_RQmowF90R631qOOkGMftSCo2ic20WemBC4m1bEpdh=Q@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Thu, 27 Feb 2025 at 14:44, Varatharajan, Deepesh via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:deepesh.varatharajan=windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/meta/recipes-devtools/rust/rust_1.82.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
@@ -129,9 +129,11 @@ python do_configure() {
     # [llvm]
     config.add_section(&quot;llvm&quot;)
     config.set(&quot;llvm&quot;, &quot;static-libstdcpp&quot;, e(False))
+    config.set(&quot;llvm&quot;, &quot;download-ci-llvm&quot;, e(False))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why this addition? Please explain in the commit message.

Alex</pre>
    </blockquote>
    <p><br>
    </p>
    <p>The commit log for v2 doesn't explain this. In fact, I think the
      commit log is identical.<br>
    </p>
    <p><br>
    </p>
    <p>I know that Deepesh sent his v2 commits late in the evening after
      checking with me and<br>
      that he was focused on fixing the issue that Richard and the AB
      identified.</p>
    <p>That means that it's worth putting this through the AB again to
      confirm that<br>
      the issue really is resolved. I think Deepesh said that he was
      able to reproduce it<br>
      locally so he expects the AB test to pass.<br>
    </p>
    <p>On chat, Deepesh said that he'll reply on the V2 thread tomorrow
      to explain more.</p>
    <p><br>
    </p>
    <p>I think he should send a v3 with updated commit log as Alex
      requested.<br>
    </p>
    <p>In general, your commit logs are a bit too terse for me in that
      the explain what you<br>
      did but not why you did it.</p>
    <p>Also the change to <span style="white-space: pre-wrap">meta/recipes-devtools/rust/rust_1.83.0.bb
seems to be a single blank line addition so please get rid of that in v3.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj_RQmowF90R631qOOkGMftSCo2ic20WemBC4m1bEpdh=Q@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#212020): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/212020">https://lists.openembedded.org/g/openembedded-core/message/212020</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111414671/3616765">https://lists.openembedded.org/mt/111414671/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0QC9aeSRg7inkFZCIpK3Wfnn--

