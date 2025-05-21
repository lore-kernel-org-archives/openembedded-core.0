Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAFFC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:56:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4069.1747846559423148348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 09:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=723649de9b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L6vok4008810
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:55:59 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs9p0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:55:58 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LGtvE8001983;
	Wed, 21 May 2025 09:55:57 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs9p0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 09:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8mTn2K+ywSfyizFz8EwdqMVTI2OfH0DRTALzMJ+A3j7A/IKVzLJjLxjd/dd1CGhZ80jwZ5QLuZTkczp8YkOzSD6679b/EJ9gTU8LSFkLv57LuvpqS1jphF+OFHTplgRV7iPBoqsFf6sv/mEbtY9/6HV3hpnno/SIr5kpfDjd3npm/9T4R8pdFUMvyEw4mk/9XhSdLePer5p4gPVUOgk+FNPefNMeQ/Xc8ZMJiX4a3HERf2OAMfwcBNM/f6Ofy477Dh1ueJJrEUmAEGvbulbhVVs8wcrMmc4eCKNIfJSeSwHJGZqMFg9HY32U3PWsyrxq04JNz2dF8RKJuToFw1nTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruJyXPlKN0D5pKIGVfBT38VaJrgHLB1VpghDApSN2mM=;
 b=DzW3ZiPtZDdeBCkI2feSslq9JGaQkcKhYCgyvGINbICgdPX9hR5fmdHf+ySoNzUbo1yZsPK68GrJNSh7zNb8IOUmtQnODDH1g28XzqRo/AtyH1ylfgGXoUFvd6TSgQPhs8WOZng2D980emqTbobHEYBQzVQ+SU2XHd+bUXRvQR08UUw2+0s+VHJ6fXHsQ8wuVceIw6BFs+E02e00H4I7pMILPFQ75ErHNeV+D4lDtWpc2QP+GMmf8lIEWgEGlW4QEwgb3y34dw7y/ATkGfUIPovfapv6MFPhf86mrwfEadrr2tj4RIJPYFxUOKZDr6N0ewU/8ueDKCVLZ48exdRdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 16:55:54 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 16:55:54 +0000
Content-Type: multipart/alternative;
 boundary="------------NzSUmunRhDzZ5lSTOSXqtwbv"
Message-ID: <490b85d7-9c06-4c1d-8ff4-8b04b8bb8b83@windriver.com>
Date: Wed, 21 May 2025 12:55:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] sbc: Fix for gcc 15 compile error
To: reatmon@ti.com, openembedded-core@lists.openembedded.org
References: <20250521162632.27169-1-reatmon@ti.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250521162632.27169-1-reatmon@ti.com>
X-ClientProxiedBy: DS7PR05CA0086.namprd05.prod.outlook.com (2603:10b6:8:56::7)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ2PR11MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6d1635-9e72-424c-cb37-08dd9888595f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|8096899003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b3FYejh0Yy9JdHVOYmtlelhYU3VPU1FSOHRoanNBZ05GR3BVRFFwODlIMzhx?=
 =?utf-8?B?d05YWW5GTHdiSGhTR2dNcUZWR0JvY255eDkvMGZ4VzhNbjhUSlR0Nk9DTE4x?=
 =?utf-8?B?SXdNRGdoeTN4V01Fb211OHFJRWV1d0p6VzNwRXloMDJUN3VQbWJCb3M5UFMw?=
 =?utf-8?B?SDRhK1hyR0c3NkRsbU1oSlZoR1hGbFhNNkwySFFqakdFbmdic2xheEpNdk15?=
 =?utf-8?B?VTVyV0lJSmZLUmJUcVJUdkFNNkxNcUllK3A1a1RGNWxRVTBYeTh5eWFFY2xC?=
 =?utf-8?B?cVhJQ2VoekZDMFJ6MkVpN0pzNVdpcVhEc2hJUkpSczFBM1RDS2l3SGdsdXVV?=
 =?utf-8?B?S2RrUFE0ZkxQZlhhNTE4NjRaajZCM1ZOVGx6WHIzRzZCUmYvanA5Qld5TlNj?=
 =?utf-8?B?N25YalZ3aS9wcld3Tm5DeS9LUStXNFFaTnBwL3hYNVlBZFNiYnhCMTFUa3Jk?=
 =?utf-8?B?VEszYXQ5djhRNVNMYmNpNTVGekdQcXk0WEsxMTlmM1B2Q2pCWGVpZ050MnlN?=
 =?utf-8?B?VEF0OUpSWU02MUFHUFd5MzBBdGo4QlVuWGxTQTNOZjVhRmJSMjB1bU1EM2VJ?=
 =?utf-8?B?SjlDUnlSZVhqdXRIbGIzMW5mZExQaXhPNHJQYTA4SGdjb0NkdGdvQ1ExK1VN?=
 =?utf-8?B?Nnh2VWo5ZnMrYzl1NFpXMVlXanQ2elo1MFVHRW5ma2hLQVV4TmpFOGFmV2JU?=
 =?utf-8?B?eS82bzJ4RjB3c0Q0aldnTXdBb2NyY1pDQnFRSS9lb2VMMjJQVDJoSEI5V0F0?=
 =?utf-8?B?cnk5SEJQMTJTTXFWQzcyeERqd2ZTZTZkRWpVSE9hMTlkSFRlS1FaY1ZHeGVJ?=
 =?utf-8?B?am8xeGFkbUtXRTV0a0ttVUFJTnRhdlEvQnhlV1B2aGZ4Yk15TThUblBNRGJz?=
 =?utf-8?B?MG5EZksyc0RkcW9NdExrcHdEYzdaTVhVNzU0a2FpREljL1hlQzNnek5rMm9u?=
 =?utf-8?B?WDhFeCtzb1gxNzBnd21vSDM5bGNrRDFIbDB3aEtYZGl6cFRJanFXZlNKM1RM?=
 =?utf-8?B?YjkvbHFvMzM4Wkh0SFdiYUlLQkxiVVl4aGRrNUxMYWVFbE5EZWkxTTM1bVhp?=
 =?utf-8?B?TkMxVjRVU0o3Q0RVYk9Scnp3bm5vc0ZmcGwwd1hTYkpjNmxvaE1tY0lkNWpl?=
 =?utf-8?B?anNmMjhIWlNiYUNVb0h1N3JFdzA0YXFBOUZxNUpTT0xLQzk4d2xtUjRFVHpk?=
 =?utf-8?B?STdNUWZzckdzbllscnMxeWVhaWpZQ0gwRGVZZU1DQkhqNzM2elYxMlhkK2d0?=
 =?utf-8?B?dHBWZVE5aVYyK1F3eXhuTG8xNzQ0S3lNZjNIaklRZ29kcGxyWEl2OUxnK3lF?=
 =?utf-8?B?NGZwOHRtcExWQWQvRGlFaHpXb25zS2dCR2Q3SjdVR0JkemVmd3hJbko2V2VD?=
 =?utf-8?B?ZGNCNWVPQlFqVCtRRFM1MXA2ZDE3VUpIQnJ6L0FEVlZPMzVwRGdEaWNFUzBL?=
 =?utf-8?B?TCtxbkw2QlpEclovalB0bzA0anBsWEs3SU5xYmtxNmxtMmtOK0ZHcmFaOEh5?=
 =?utf-8?B?cll0MnJaYlJ5QmpxbjhFcGxTWXpQWUdXbnZuQ2FQYmZCcUZlUjRGMk14Mk5y?=
 =?utf-8?B?bW1xbG5SeUJ1Z0FtUFEvZ1FFUkphVUxHR2E0dVFONVpFNUtmVGhtQTlpQk1W?=
 =?utf-8?B?MTFzUGJzYVdVVGVHZWpaWUtHMHpSYUpWeUFTOGhoZlFjQkE0cFdTNUQ4TzE2?=
 =?utf-8?B?M1JFNnhZZzJVc3hSRjE2ZVBhUlV4N1R2T2k0ckhEUGhDSnRjSVNNVkJXV0o3?=
 =?utf-8?B?SVFDSmhYMWZWNTY3b011Nm5LUGdWOTVmenhrYkVZMkk3NHNKYzdsbld3VDZh?=
 =?utf-8?B?SkJDUzVhYXpkSlhOcm51Q3hodHpERFZvYUhwT0xVZldzWGtDSmtFa1czKzBD?=
 =?utf-8?Q?WnHim3zVZLoiX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(8096899003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0IvbXRDWmFYcVhIY3RwSkJyWjNXbVZpcGFSbXlJRjJWT0hKNjEwRXpOczFY?=
 =?utf-8?B?UXZuaWtMR20rNTBhTmJtU3ZmTEliMG51bkhCWDdRUHhod1k2SldFUkJreDlP?=
 =?utf-8?B?WldDZmtVdkpmVkJKdVFxUEd5cTF6b1ZJVGZGa0orbXpYaU9TYk5DUmFnRmE3?=
 =?utf-8?B?SGg2dHhnajdqRjBkQ0hzYU4rTVVmNFdpZkJaT2loOXFoUTUyZGdwclRLR2Fj?=
 =?utf-8?B?WkplYjUyZnlYa1lxSEpiYXVYSTB6SkcwajQ5VWgxZWs4QktxZnpXcHdDbWdR?=
 =?utf-8?B?T1RwRFEvbU1RTGFGVzNZVUIybXlmMEorR3ZxZDVIc3pyVW5GWVF6bGVRZU9i?=
 =?utf-8?B?SzVCRElObC9ZQXRpUUZnbGRIcFBWbGhPd3VxSGx0ZnpEY0xWZ1ZHd1BlS0cr?=
 =?utf-8?B?TlUxRHY5bmVLM1FOb2RvZlZnRWdvNzAvYjloQmhRRGE5S3crNy9tQmFhZ3FC?=
 =?utf-8?B?UWNBb3ZlY29QRDNFeGRXcXFndlFFVDlEaHpnb3lmekJMWVJmejFLRGdWRjJK?=
 =?utf-8?B?TnlJWkxyREtONVpzaXJUYXE0c2tYcW1Ra1dFeGM0QXQzS04zMmxnUG5qdE9F?=
 =?utf-8?B?dU93bjhOWXpPU2JyR0lUNGxha0FUb2JtcmVTbmtNZWxmcm10aHc3OW1FR2N1?=
 =?utf-8?B?cllEQk5Hcmd3WFBxeUpuRFg1Z3BTcUhUOThRMFBlTW5tYUtVbkZnNGRKdlI5?=
 =?utf-8?B?MzBrVnJDZzBVcmRsSUZxWXFUdXBoMXdDWnkvNm1jeWNqK2dlYXhWSGFsYzZi?=
 =?utf-8?B?Q09OR1FXQWUxSjU3RVd1RHlRTkxyT3NGTGNVMkhVUnlydFR6eDdyOUlFcTcr?=
 =?utf-8?B?K3NuMGpEYVc1anQ2WGFiWTlaY3lFT3ZZTGpsZmZGQmVPNEV6UWNERDJ3cHgr?=
 =?utf-8?B?a05DK0dNYUU0NnZqSnRMRllGVDRabHNnWE5uMTgrU2NOOHRwa0YrZ3EvQ0hQ?=
 =?utf-8?B?QXJHWTFUbnhQRkxhM0QyMHZVclUrRnpqRmlUUUVDTUV0N1dKSGtjbW9xcUZj?=
 =?utf-8?B?RHc2QXA5b25GMXdaTHg3cmgxYmV4eGdLcXBjaTFuMFE2alpLckpsZ3VyRi93?=
 =?utf-8?B?TXA5bVJMY2tqaVpqVkxwTW43OEZWcEtrRmRWUktLdVlQeEc5UmYzUTZrdXov?=
 =?utf-8?B?bUNwbFlMV1dJSXdBODNjcXd3aDM1c09qbWlrTC9WZmRaMW96aVU0bXQyRHhM?=
 =?utf-8?B?Zi85MEJwU1ROM0plQUMyMXNURVJvcUMyUlNvTEVyNHlOZVpXOHlNUCtlQkdU?=
 =?utf-8?B?WXJESXJvOElCcEcwSnpnMEVmcWR2aktzSVpBU21WTXpDczY2aHd1SytQZHUz?=
 =?utf-8?B?TE9VaG5hVGg1YkNHRWYwREtWN0pBRVRWZlJRWGFGb0FuSjlISDZMcnVTaHRp?=
 =?utf-8?B?a2grRnBLaEZza3pmN0YvTHA1L3RxamtiNU1ySkVUVE12R3hTWHlOVmhibWNv?=
 =?utf-8?B?b0tGUjN1dGc3N05SbVlXbjhuVEpFcEpEWDVKMWlrT3o2STB0cFhqbXdLRW9p?=
 =?utf-8?B?OU52KzZsWG1waVEvdmwybFphMEt2RkJ3b3lxZzB6SWZxSXhaQUU3Q29Eb2sr?=
 =?utf-8?B?VmhVZms2bG1zbllacTAyRnYyenE1eVVDTDdHeEhjd0dza0htZ3BDNVhiTkZ6?=
 =?utf-8?B?UUFGSnAvZzhaeEFieTdmNGZIcTVscWU0T05Gbm5nQXg4a0dxTnBOa28zS0Qz?=
 =?utf-8?B?TUFHQU1xQlZFdmJtL1ArWHRtUk1EQWFxZ1FJa2hDOVZYTzZULzA5a3NhVlUw?=
 =?utf-8?B?aUJDUXE3dzFYNlFHVGNFTmw4ZXlhU2hZRDQrTTdra0xYZWY0SUdIQ2RmYjFS?=
 =?utf-8?B?S0FreVQveXlwL2djekswK1F2Nnd3UWNKVEc2ZXVGa0lCaFhrU0FZWTBLREZk?=
 =?utf-8?B?QnVDUCtHQmVkUENPcmJURG45dEFPUnQ1TDU4dGVEQXlBTjJ5d2hJcTJCVDNq?=
 =?utf-8?B?MldHVGwrQXdVQkZaM1RaL1J3VUFSelhhK3I1d1QzUzdRM3JydnR5SUhtY2Yv?=
 =?utf-8?B?WTVML3lRa1RrcDhUZVZqSjNBQldnaTVTSW05TDQ2TGRjSDJYdjU0Z0dCZWxL?=
 =?utf-8?B?V3NVQ25OeSt6Zk4rVjhVZnVUOG41VDJiK3pUUEdBOTBNNUZKNkpwUlJFcDAy?=
 =?utf-8?B?YXdObUswb3A2cUVuTGsxQTJZZXFQSldGYzJYQ0cxWXJpKy8zbm5ocEk3MnVN?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6d1635-9e72-424c-cb37-08dd9888595f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:55:54.1231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YAjEAuimMbx5EaTdSLqbBovnhS0NjYJVRaMWBb9NPq3gx8W9E9hg0yzkp08FqmP3/d/ZVr1bmSCC6cAk0XWMorAf6UmAqLN8NsJ3AJhuFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
X-Proofpoint-GUID: jgzrffNHDzCYkETwSeV2lgpFHp5UOlu2
X-Proofpoint-ORIG-GUID: uuuCom49yIdLT4a6aspcQBwZS6ulgxKL
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682e059e cx=c_pps a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=Dei6p5SHAAAA:8 a=sozttTNsAAAA:8 a=t7CeM3EgAAAA:8 a=sxB1MEY90qO2qfXFn5cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uo0zXuyXk6r5bdvPJKIA:9 a=A1pEapj_j5oCTEPk:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=M-Yerj1wOn-OpK7r_3ei:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NyBTYWx0ZWRfX/nzNDPMXIlYK sOLBkX1avddTueyPOR52c2KFLcGs2/+o54iZmGU+rYo0smh15e3rv/jhhliaaLZTinXOVo3kbF0 koePT6TdmNX0nHiXhn6sQtmkfaDEJcwjas5yYpLeqg+8b/ripjo6lW1lRsJ+VNAIVY22QklGsGu
 nmes8Ie5Rv/12BrfbT8m5LG6lvnfUN/Nt+SYhP+ixq1vjZqPsMs0iqpQVkr7WwFIOomktzWXYqA m9KglXcQvD12bHxx9wGZ+AV2nRBhcrwFu6bflXYzPFX8sWUxzFrqBeZgZi14avsrXsPz9VlzMkC JIR0ixhczIHVeCVLTbd8KKw8vwGd+UZKy6aAnzxYJgcdkUchbpMrIyHrzRUv75ttGRWcMjJBuuF
 QkuirT6TkvW+BjFESno3nZEWVr/767Rejcm2mC1h+pORFcdEAvn+8PzJNpBB+I9eHo2txs7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 16:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217050

--------------NzSUmunRhDzZ5lSTOSXqtwbv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54L6vok4008810

Hi Ryan,

On 2025-05-21 12:26 p.m., Ryan Eatmon via lists.openembedded.org wrote:
> With the move to gcc 15, the code is not generating a compile error.

Do you mean *now*generating a compile error?


I guess the YP AB doesn't have a build that catches this target.


>
> ../sbc-2.1/sbc/sbc_primitives_armv6.c:284:9:
>     error: too many arguments to function 'sbc_analyze_eight_armv6';
>        expected 0, have 3
>
> Simple fix is to drop the C standard down to gnu17 to avoid this new
> error.
It would be better to file a bug or at least send the
maintainer a patch or a bug description. That's:

 =C2=A0=C2=A0 Marcel Holtmann <marcel@holtmann.org>

from:
https://git.kernel.org/pub/scm/bluetooth/sbc.git/tree/README

Anyway, we do have 17 other such work-arounds:

poky.git
=E2=9D=AF rg gnu17 | wc -l
17

so one more won't hurt that much!

../Randy


>
> Signed-off-by: Ryan Eatmon<reatmon@ti.com>
> ---
>   meta/recipes-multimedia/sbc/sbc_2.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-multimedia/sbc/sbc_2.1.bb b/meta/recipes-mult=
imedia/sbc/sbc_2.1.bb
> index 5aaa52313f..8b91e7e65b 100644
> --- a/meta/recipes-multimedia/sbc/sbc_2.1.bb
> +++ b/meta/recipes-multimedia/sbc/sbc_2.1.bb
> @@ -19,5 +19,7 @@ SRC_URI[sha256sum] =3D "426633cabd7c798236443516dfa83=
35b47e004b0ef37ff107e0c7ead32
>  =20
>   inherit autotools pkgconfig
>  =20
> +CFLAGS +=3D "-std=3Dgnu17"
> +
>   PACKAGES =3D+ "${PN}-examples"
>   FILES:${PN}-examples +=3D "${bindir}/*"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217048):https://lists.openembedded.org/g/openembedd=
ed-core/message/217048
> Mute This Topic:https://lists.openembedded.org/mt/113232263/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------NzSUmunRhDzZ5lSTOSXqtwbv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54L6vok4008810

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Ryan,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2025-05-21 12:26 p.m., Ryan Eatmon
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20250521162632.27169-1-reatmon@=
ti.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">With the move to gcc 15, the=
 code is not generating a compile error.</pre>
    </blockquote>
    <p>Do you mean *now*<span style=3D"white-space: pre-wrap"> generating=
 a compile error</span>?</p>
    <p><br>
    </p>
    <p>I guess the YP AB doesn't have a build that catches this target.</=
p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20250521162632.27169-1-reatmon@=
ti.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

../sbc-2.1/sbc/sbc_primitives_armv6.c:284:9:
   error: too many arguments to function 'sbc_analyze_eight_armv6';
      expected 0, have 3

Simple fix is to drop the C standard down to gnu17 to avoid this new
error.</pre>
    </blockquote>
    It would be better to file a bug or at least send the <br>
    maintainer a patch or a bug description. That's:<br>
    <p>&nbsp;&nbsp; Marcel Holtmann <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:marcel@holtmann.org">&lt;marcel@holtmann.org&gt;</a></p>
    <p>from:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://git=
.kernel.org/pub/scm/bluetooth/sbc.git/tree/README">https://git.kernel.org=
/pub/scm/bluetooth/sbc.git/tree/README</a><br>
      <br>
      Anyway, we do have 17 other such work-arounds:<br>
      <br>
      poky.git<br>
      =E2=9D=AF rg gnu17 | wc -l<br>
      17<br>
    </p>
    <p>so one more won't hurt that much! <br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20250521162632.27169-1-reatmon@=
ti.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Ryan Eatmon <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:reatmon@ti.com">&lt;reatmon@ti.com&gt;</a>
---
 meta/recipes-multimedia/sbc/sbc_2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/sbc/sbc_2.1.bb b/meta/recipes-multim=
edia/sbc/sbc_2.1.bb
index 5aaa52313f..8b91e7e65b 100644
--- a/meta/recipes-multimedia/sbc/sbc_2.1.bb
+++ b/meta/recipes-multimedia/sbc/sbc_2.1.bb
@@ -19,5 +19,7 @@ SRC_URI[sha256sum] =3D &quot;426633cabd7c798236443516df=
a8335b47e004b0ef37ff107e0c7ead32
=20
 inherit autotools pkgconfig
=20
+CFLAGS +=3D &quot;-std=3Dgnu17&quot;
+
 PACKAGES =3D+ &quot;${PN}-examples&quot;
 FILES:${PN}-examples +=3D &quot;${bindir}/*&quot;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#217048): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/217048">https:/=
/lists.openembedded.org/g/openembedded-core/message/217048</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/113232263/3616765">https://lists.openembedded.org/mt=
/113232263/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------NzSUmunRhDzZ5lSTOSXqtwbv--

