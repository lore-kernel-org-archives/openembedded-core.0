Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F02C021AD
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 05:38:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43278.1740029896687036128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 21:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=414618de0a=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K4kF7U022371
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 21:38:16 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00k9yqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 21:38:15 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51K5cF6S032040;
	Wed, 19 Feb 2025 21:38:15 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00k9yqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 21:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYJiOkfrtu4gJEpq0sq2PsweUyKac2fUsUUuaVFLtcmgGZzCdIl7s5vT2PtZ9PUPTUFOKC5afQaEKET4E2n0u749LIjRE2wKZbDTAkVx2DT+P0aWXEJPA3G/PXtrOAtDvnVnK5s4aEdqFvwygBgD87PaFVf2HxXPexXf+lxq6YqFlEZvCyjSqmD7WAb+M1YaMpLVxC/DE8q9e74wMes2ZTaal2kuWALSX11RcXgh8LzOoyUOaiuG/JYBAhftRhQiVDg1YBWAALnAcyS+MhA8uuYFV1TSQRVtq51SWx4ecSJdkwPlkItd3A1e46v8QXcJpSJZybcdx5CeqGgNeeaqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oIgq7ovjBZiFMv63eK1ArlysXJqNUqAnhl2HPPmho0=;
 b=K/KqxkXcSL8yragiB3juIkcKuGgCejITRXf5I5IRXTn1ezRX+X4nzpVIsnpNsXVO1VVo008BE+jENee8Kg3gZTMl07+GyvwK1lHq72Qg5+xfYoNWp4cYCAnQoHYcZlQi4vzLOSgYO2Ny8Kt7l/taToZHTReM+R+1pGGLo5fzsZnBh0ipBxVb3FVmo/KW5njMx70zHcNF8drEDNVVykHfwPgQPvN0KEssbqrvqNRU4Oq/wyzAIWvDeFEcj+2mdE6Fcmg6bislViKENMCBP0Im69dlXbfG4HikbRnfsviDQ+iespy07vvvdM9JM1toT0o9juoeuC6NypeAHPWg+9u8sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 05:38:11 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 05:38:11 +0000
Message-ID: <411c4265-0aca-44ee-a56a-dc6f34e507e4@windriver.com>
Date: Thu, 20 Feb 2025 13:38:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] qemu: fix compile error with
 lttng-ust
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250219085502.2297068-1-kai.kang@windriver.com>
 <CAOSpxdYQo7sqX+8MCxxKxgcBdeDLuyGgk7+KFqDV2gSYAkL6Dg@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAOSpxdYQo7sqX+8MCxxKxgcBdeDLuyGgk7+KFqDV2gSYAkL6Dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:3:17::16) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfa85c8-e45d-4d5d-96d1-08dd5170c329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aHRiaTRlTnRuZElFQi9MQ2NBdEdJeEpnNUFqdm5pck9jUkxTQThnclBIT1Zl?=
 =?utf-8?B?WXZKcysvZHpoa3lUYy9UMVhrcVV6ekRzMUh6VkJUelJIem11U2tEMW9pNXBE?=
 =?utf-8?B?b3NIaWQ1K2xmdWJQeFJwTkRQMWVzYmtXMGRnL3FMelVCNXV6RWxPalR0TEFj?=
 =?utf-8?B?OVMxdEt2V2psdlp3eTB6ZnpnWWM2WVQwd3ZKS1JFVndsS2hGTmxXc3Z4RjUx?=
 =?utf-8?B?WUhsVWw3MDRiYTk3czRsd2lqMnQ5N2o3MllyT0RBMEUxclBZWVpTNEJaK3ZZ?=
 =?utf-8?B?NTBPL3dWMm1lMUQ2ODg3ZUVNR0ZLVGd4bGRMZlBwZlpDSUJjY1FiOHIrUFhQ?=
 =?utf-8?B?MGY3ZVF2UXNvTEFsMnZkc25MRlYzQkJBYzc2ZGkzVGZIUUlXSFQ4dXBnVCs2?=
 =?utf-8?B?eFBPa3RJMCtyV3hPUCs5YmVnNDdFOWVUUlppWVd2L28vZ08xNFNHOEtBbzh5?=
 =?utf-8?B?cVhvK3laWU82VjZOV0J5QjlOcnR3S2lpcUdFWGdZbHVjR3hVVkM5NzBxOHFQ?=
 =?utf-8?B?bjlGMGdQWXpOMlk3aVpMYWdyTGRtRzJ4Y3ZXVUFmMVRTYUZkRWRGcHNSQUNC?=
 =?utf-8?B?Umwra21DNkk1NG96dTY3RTQwaVFiOGJTVzdVUEcza05tcHRXQTczTTd6RUgv?=
 =?utf-8?B?K1BrTy80bzZFQzJhMTQxNENldTlkQTA3QU1EcnBIMlRXY0Jnb3cvdU5HcWZC?=
 =?utf-8?B?aFdBTG5neGZXaDR5bW9iT242N245VTd4NkUzS2I5S01JdnVHQm02dHB0ejFD?=
 =?utf-8?B?SzRKN2F3RG9FR1pJVklJU3hqc1gydnd0aHN1OVZJTzdtZEZDeFdIVXJJR1NY?=
 =?utf-8?B?ZzFjaG43YlZnaTFhaWJ0QnZobU5hMkdTUlJjSFlOYllnbjlqUzdPdjNlelNl?=
 =?utf-8?B?NkhmZ2x0MEpOV092QXFjRWFtSVUvaHJKUlZZUmtQbHd5RTJySEE0N0tqdU5X?=
 =?utf-8?B?RkY0MUNzMGFIMlUrenJ6SEt3Mk5BMDcxaHAzOVdKaWczaW9qRWhud3o0S1Zm?=
 =?utf-8?B?bWkrVDMwTWo0Q0EvMlBvSXg4OFNpM0hhRVhzQU5DV2dJVExwOFl3S1B2VzYw?=
 =?utf-8?B?TTR0VmNMbGZMbEkyQm43eHc3Z3VpeWpOSlZqVXFkaHNxZW93RlpiOEJsNHRI?=
 =?utf-8?B?K2RsaHp1QXA3QXNLVWNySmNDVWprMzNSRlU1L0x2SGt5WTl4YmtBRkRXbm9s?=
 =?utf-8?B?RXlBR3Z2Ym1VYWdLTXp2bDhmNDJpelU4UWpmd3FTcVF4dG94WEwvSTNKcGll?=
 =?utf-8?B?bXlxOVNRbWxXNGFTZm1QcWU5aDRaS0FnT21Bd055dHZjcFFrUU04RlBZVW02?=
 =?utf-8?B?WW02ODYyY1lIZFA0aUdwcThGSFIwanM1TUVwQXgzenhiU0Y4RlFmNzhkS2FJ?=
 =?utf-8?B?ZGVuSm1PUFdZVmg1UVBlQ1pwamFKT0tkNkN6dWJDYTN2QmsrTUg4WVBBRlRw?=
 =?utf-8?B?STNuSG9GVVl2b2NzWTY4RnptRExjN1ZMU2UwNzUxNEo5YTBqVzJxOUZ3U2dT?=
 =?utf-8?B?QWpHNE15UXIrL0lBSnJpUzVVR3hZQTd6cDJTNVR6ZUNIdldpQnRUN216Zmpz?=
 =?utf-8?B?cWp3VU5nRkVORkFCSnd3b0txbCtYbTVtcE1WNkpUcldBeUkyRk1zYUxIRXRO?=
 =?utf-8?B?TXloTy92aWxJT2MwZWpWY0VQNWVFWFEvSE9XQnN4TklWaXlXSVBzeHM3T1Ni?=
 =?utf-8?B?WGQ2b0hITlhUVFgrYjlzdGVpL2FuVU9uMmtreUxXQndkMldyUFF1RE1SY2xa?=
 =?utf-8?B?K3gvQ1MvVHArRUFLYTQrbjRiRDR4WjFtZmI3NVVwcDFjdUtRWUUvOU1RdGZj?=
 =?utf-8?B?RUQrRVhoTXk2bEIvNk5WZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M205Y2VveEFmdUwrTktVKzY2TE81V1BnNVppV2xjTHRuWUZkN1BFcXJRNUJ0?=
 =?utf-8?B?VDg5TnNyaStYbzNTbUFTVlFET2hic2hHcXp4K1dvSkxTdUVQQ2piZlRqNHdN?=
 =?utf-8?B?MXljT1N6NHpXSVQ0VFg2SEdvdFBkMkZXbkV5bTBlRnZ4Q0I0dDdLdHRISCsz?=
 =?utf-8?B?RG1FODZaUFdFZWJrVGM3a1NGN3VDZXFvWGxOeitha1lIQmdaMlRWaW9RUFZz?=
 =?utf-8?B?eG9seWlLZlllQThBaGI2czcyREtPYXVVMW1hbWg1VEVFMGZTMysvMVZsRytF?=
 =?utf-8?B?SjBYUkNsQ0lPT0VXM0FzTHRLd1ArSzRsd3A5NkMyQVJtLzRZMkVwK3JXSFgw?=
 =?utf-8?B?RDYyZGxvNjZHYnhDL0xmMURhdVpZZXRFWFlyL0tQNDFYcHRadmkvNUl3RjFi?=
 =?utf-8?B?ZXRBT2NXMUhlN3hBZEJENGREVFVXRHc1NVZoSW1KcXhSMGsrWUZmM0Z5aXNV?=
 =?utf-8?B?SVBrZ0h0OVRvampaWHhSZmp2ZjlFNTkxU2FmK0ZvVVo3ZXRwV1RQbWVGY3Bk?=
 =?utf-8?B?a2pkMkx1U2c3dlNIMHlNT0toYU92WVVNTnJGTk0vZDNsZ3pGaUEzNXJNM0Vv?=
 =?utf-8?B?Qi9VVnhaTkhzV09qUlB1UXZRZGJxVXZjTzBmOHU3djZpRENWSHBlVnErTXNq?=
 =?utf-8?B?ZzYzQTVMWnpJb24zRzJPdGdFaVc1RkJyMG9pRUlicjV6TGlNemxob09QeHBZ?=
 =?utf-8?B?QTV3TEhXZ2pHcjJvYnUwSExueFBUK29xaHNocm9aMjRIVThMOG5mUkFUWFUz?=
 =?utf-8?B?djVqUjg5a1VQWHpJcWtoR2pMUU41Zitvc28yNWV6ekM0NVlvdFM0aVBsL3kz?=
 =?utf-8?B?TU5ndnB0VGNGY1NzZVhmS096Z296cXpIeURnMTJXVXJ4ZlFEajdlSG0zZXd5?=
 =?utf-8?B?em1OVGxreWF2Y0phbjBoWnFha1JvU3V0MU9HZ0FFZXNoQW5kMzVBdmcydWtK?=
 =?utf-8?B?MkJSaE1aK09RVDJwMEJUZjNUcVhoTE9Lby84SVZHSDNDU0YxMEJsaytSdjA0?=
 =?utf-8?B?dFZnaWtjcmJicjlxa0xJbUhiSnNLejJqaTBBa05GVStkUGVMZ28ycFd5RXFE?=
 =?utf-8?B?TjJpNnR0TzRva00rSVhSUVI2cW52VFFDcndPRGJra0xGeHBGZDZsVi9PbnFa?=
 =?utf-8?B?QUFqMVVZL0JsOGtBZXRWOWEwNjdmTDlxNm01OENOVVlYUUtkUTJWUi92eEFq?=
 =?utf-8?B?T0hYcnQvb003QkttWGdwZ1VLM2lpVlduVjBDWmVIWkQxeUZGNUI1Y2xVUWhZ?=
 =?utf-8?B?aHg1L3luQUFZeDhwYUlFUzliYnR6VFpJaWJ3cEM2RlR2WUlhcXZzNGJsd3NQ?=
 =?utf-8?B?Z0djVkVpdVFwdFlIZzBpK00rdm0wbHBqMm9jOGhKQW1VV29SZ21za3ZMZERP?=
 =?utf-8?B?OUJLRFgrQmJIM0ErbUtkTE9laTZ2MktHbEpYbVI5TjRJNXp6RFQyQTFIRXQ5?=
 =?utf-8?B?WEwrYisvTnRxZ2ZzMHhBYUFRTUFUT3dTdE5GRXVQdCtSYTBLSzY3REZ1b0dH?=
 =?utf-8?B?ZTI0T1ZMd3AxT1F5dmJ0U2VycHlQaG1kZ0xENXFiUlByZ3NmTTVEN0tZN3ls?=
 =?utf-8?B?Z1FYWTh4cUJiNjBPMjlzZklIaDJNL282a09wZXovejFnWkhIbkF6bjlmbFE4?=
 =?utf-8?B?bVE5RVdYRFp5RmVRU2xyUC8yaDh4T29SakdWVTl4cDJNTlp4dWNqVWFOQTJK?=
 =?utf-8?B?NHFoTUs2MkRneGhycSsrbUJEWC9nTUl4TzRpSnAxYVhsN3RVRzRqRXZnd2VF?=
 =?utf-8?B?M3JsSklWWnhuSkczV1cvSnlpYm5IVENEYUpZeHhUUm5iOHFLRGh1aUU3Rjg4?=
 =?utf-8?B?dzNWSlRjeHRkY2ZpdDlQY25oTnF2MXlWRkdFbkcvU05zUjZRRHFUQmdsekJF?=
 =?utf-8?B?WW94cVdVVkhFODdWTjBqOWV6NVlvdVQvdzZRVkZNMDlvWE1EbStvWDVWVXdI?=
 =?utf-8?B?SncyL0lVL2dEL1JOaldxb2hhRXV5SmVyTXovMVorRFk4bUdNYzEydDJlOUlM?=
 =?utf-8?B?OVloNnFKUW9ibGRHZUdNdFFvL0VkTFJqTmRHYXRNQXFYMlF2VWJaMzV0dDQz?=
 =?utf-8?B?dkd3RTMycWVxMEllR0lXVVowWWhqN2ZKeFNzVHBEaUUxVk5Gc2dmYk83dTBI?=
 =?utf-8?Q?aJIxxao7gASiR/EXV5NfqgnRb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfa85c8-e45d-4d5d-96d1-08dd5170c329
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 05:38:11.2191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfcgDjrK5/i61yUwYbgjDEo4gV91kUpZLwbTX/N+6J/crHC5xkZf4Ffm1wXOuMN03mUERVRnYou88aajXwZEZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b6bfc7 cx=c_pps a=1mby/iHf9ieL9308fKykyA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=1NWNoF9oAAAA:8
 a=ID6ng7r3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=_enOPnqeAAAA:8 a=g25rqLcNPGPSVFnY1asA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=97APRTa-CG6DvPMFVxHL:22 a=AkheI1RvQwOzcTXhi5f4:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: WscXWXEOG0k24--FY1RMbfo5mpPkDXsn
X-Proofpoint-GUID: c1WZteqOpgFH6x4zQ1R7Voip05Nu38wv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51K4kF7U022371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 05:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211740

On 2/20/25 04:03, Steve Sakoman wrote:
> Hi Kai,
>
> I'm getting reproducibility errors with this patch set:
>
> AssertionError: The following deb packages are missing or different
> and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/t=
mp/deploy/deb/./core2-64/qemu-src_6.2.0-r0_amd64.deb
> The following ipk packages are missing or different and not in
> exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/t=
mp/deploy/ipk/./core2-64/qemu-src_6.2.0-r0_core2-64.ipk
> The following rpm packages are missing or different and not in
> exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/t=
mp/deploy/rpm/./core2_64/qemu-src-6.2.0-r0.core2_64.rpm
>
> The diffoscope output is here:
>
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250219-auclt=
pnr/packages/diff-html/
>
> It appears that full build machine paths are appearing in the packages
> (see above link)

OK. I'll figure out the root cause.

Regards,
Kai

>
> Steve
>
> On Wed, Feb 19, 2025 at 12:55=E2=80=AFAM Kai Kang via lists.openembedde=
d.org
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> When PACKAGECONFIG ust is enabled for qemu, it fails to compile:
>>
>> | In file included from trace/trace-ust-all.h:44179,
>> |                  from trace/trace-ust-all.c:13:
>> | /path_to/qemu/6.2.0-r0/recipe-sysroot/usr/include/lttng/tracepoint-e=
vent.h:67:10:
>>      error: #include expects "FILENAME" or <FILENAME>
>> |    67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
>> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Backport upstream commit to fix it.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>>   ...-fix-compilation-with-lttng-ust-2.13.patch | 75 +++++++++++++++++=
++
>>   2 files changed, 76 insertions(+)
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/0001-trace-fix-co=
mpilation-with-lttng-ust-2.13.patch
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtoo=
ls/qemu/qemu.inc
>> index bee30cd56f..02afafc2e8 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -128,6 +128,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV=
}.tar.xz \
>>              file://CVE-2024-3446-0005.patch \
>>              file://CVE-2024-3446-0006.patch \
>>              file://CVE-2024-3447.patch \
>> +           file://0001-trace-fix-compilation-with-lttng-ust-2.13.patc=
h \
>>              "
>>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu/0001-trace-fix-compilatio=
n-with-lttng-ust-2.13.patch b/meta/recipes-devtools/qemu/qemu/0001-trace-=
fix-compilation-with-lttng-ust-2.13.patch
>> new file mode 100644
>> index 0000000000..d3cb19c839
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/0001-trace-fix-compilation-with-=
lttng-ust-2.13.patch
>> @@ -0,0 +1,75 @@
>> +From e32aaa5a19e24233180042f84a0235a209de71cc Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lurea=
u@redhat.com>
>> +Date: Mon, 28 Mar 2022 12:47:13 +0400
>> +Subject: [PATCH] trace: fix compilation with lttng-ust >=3D 2.13
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +On Fedora 36, with lttng-ust 2.13.1, compilation fails with:
>> +
>> +In file included from trace/trace-ust-all.h:49085,
>> +                 from trace/trace-ust-all.c:13:
>> +/usr/include/lttng/tracepoint-event.h:67:10: error: #include expects =
"FILENAME" or <FILENAME>
>> +   67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
>> +      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +In lttng-ust commit 41858e2b6e8 ("Fix: don't do macro expansion in
>> +tracepoint file name") from 2012, starting from lttng-ust 2.1, the AP=
I
>> +was changed to expect TRACEPOINT_INCLUDE to be defined as a string.
>> +
>> +In lttng-ust commit d2966b4b0b2 ("Remove TRACEPOINT_INCLUDE_FILE
>> +macro"), in 2021, the compatibility macro was removed.
>> +
>> +Use the "new" API from 2012, and bump the version requirement to 2.1 =
to
>> +fix compilation with >=3D 2.13.
>> +
>> +According to repology, all distributions we support have >=3D 2.1 (ce=
ntos
>> +8 has oldest with 2.8.1 afaict)
>> +
>> +Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> +Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> +Message-Id: <20220328084717.367993-2-marcandre.lureau@redhat.com>
>> +Signed-off-by: Thomas Huth <thuth@redhat.com>
>> +
>> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/e32aaa=
5]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> + meson.build                              | 4 ++--
>> + scripts/tracetool/format/ust_events_h.py | 4 ++--
>> + 2 files changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index 04ce33fef1..861de93c4f 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -455,8 +455,8 @@ if 'CONFIG_GIO' in config_host
>> + endif
>> + lttng =3D not_found
>> + if 'ust' in get_option('trace_backends')
>> +-  lttng =3D dependency('lttng-ust', required: true, method: 'pkg-con=
fig',
>> +-                     kwargs: static_kwargs)
>> ++  lttng =3D dependency('lttng-ust', required: true, version: '>=3D 2=
.1',
>> ++                     method: 'pkg-config', kwargs: static_kwargs)
>> + endif
>> + pixman =3D not_found
>> + if have_system or have_tools
>> +diff --git a/scripts/tracetool/format/ust_events_h.py b/scripts/trace=
tool/format/ust_events_h.py
>> +index 6ce559f6cc..b99fe6896b 100644
>> +--- a/scripts/tracetool/format/ust_events_h.py
>> ++++ b/scripts/tracetool/format/ust_events_h.py
>> +@@ -29,8 +29,8 @@ def generate(events, backend, group):
>> +         '#undef TRACEPOINT_PROVIDER',
>> +         '#define TRACEPOINT_PROVIDER qemu',
>> +         '',
>> +-        '#undef TRACEPOINT_INCLUDE_FILE',
>> +-        '#define TRACEPOINT_INCLUDE_FILE ./%s' % include,
>> ++        '#undef TRACEPOINT_INCLUDE',
>> ++        '#define TRACEPOINT_INCLUDE "./%s"' % include,
>> +         '',
>> +         '#if !defined (TRACE_%s_GENERATED_UST_H) || \\'  % group.upp=
er(),
>> +         '     defined(TRACEPOINT_HEADER_MULTI_READ)',
>> +--
>> +2.47.1
>> +
>> --
>> 2.47.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#211689): https://lists.openembedded.org/g/openembe=
dded-core/message/211689
>> Mute This Topic: https://lists.openembedded.org/mt/111266608/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


