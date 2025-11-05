Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910E8CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 16:25:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13812.1762359949459126456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 08:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Jy2pSG3Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3404129863=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5GCXAc057743
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 16:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=EBlE/t8CCr9n1sEWoXqSk9
	s4TrSzzSl0MPhpm1+qVk4=; b=Jy2pSG3YcqoAJPnoOa1zXJiQTuWzwN0nmGQqqS
	8OBOV3bWA5qOEkVqbrTGrix/btP9gwZu0j6MofeFjqnPAGH+Lr523LhcCaI01TMD
	6I0TIPOTP/9mKIzEDoeA2KQE0Pu/dP7tVBt862/BEVP4aNykOtZdnvB9u8KOZVYU
	2tIs7qo8swypicuqMh5ZnHqt00Uz/U4rla6qYA6uT1eoTXEnUpHpv8KUIXFu8W68
	BrpWs++wHY+481mNS7zd3+ycLDLfCAHl2YNH+YCEpC75xnBVGUTPkTDSrNPwcYq+
	LbAY/2BH0v3NkKvjskHVN05Z0XPDgP4p7CK5GJxmPsl57Pew==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a89w78135-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 16:25:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRAUz7UhzxXuLQpXVvI1AtHa49lLGEM7eZjzxfeHJMdAib9rgWGZycJXGC9SAyMB3NCdKI1btcuhQGt5V+dnDpTqXId53SH6U8DBqA7yUo+L5OFVb5nHkbhL1UkoEzzsR8dmXuIiwmdGMCpQXnhfSQD8MTgsnRln/QrGMIknP6Cf/grf62DvEUFiuqZJXS8QXlnJoAARMCSoOZQJRdw4zP3ZJhekmBTYbYmDorPSJoST6PJ3D9A4QjJtEbjhcfQk/62r+EuTs1aou0+osfQGKZH9RJn3GGTmf1M+z4ilArm2aTsF/JQxR8rHnmJwYD56qJCkEKZE14byQUMiyUIweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBlE/t8CCr9n1sEWoXqSk9s4TrSzzSl0MPhpm1+qVk4=;
 b=MePMupB644EOYKKIaI8iWX7ECbBq3cIm/CeVo9j2ZnPMJpErlY6JGxRIvP6UXDpyra1v9hf+KwsdSH5qyX/Rh/rc9WBvqb9aKqin7MPuQQU8d17yVcBmLF6vIUEZb34VDxtSIcgq9til8MIY+6Klp7VIUrusDDrmopcRSm+f5mvZCaW05iX9NdZvXwXFl+WnMHSO3THZ0nSrUswiwWIpadgYkBYHHY21LM3Cww+Ziph3FIBTOms39Rea0oiRPC5N1sqwAJVCx60yiRAB7jkTXPHO5tpg2vmsaduiL/CmWwokM7ySFo8CTZHPd+bMuDv0hKKxPLp/Tax3trEPyQP+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM4PR11MB6456.namprd11.prod.outlook.com (2603:10b6:8:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 16:25:44 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 16:25:44 +0000
Content-Type: multipart/alternative;
 boundary="------------IvWsb0IaqfhjzdTNDuWpaqKx"
Message-ID: <40dc532f-eeba-48e2-9cec-4afd050a3855@windriver.com>
Date: Wed, 5 Nov 2025 11:25:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/8] linux-yocto: add clang-native,rust-native and
 bindgen-cli-native to DEPENDS
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, sundeep.kokkonda@windriver.com,
        elmehdi.younes@smile.fr, Yoann Congal <yoann.congal@smile.fr>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
 <20251105130942.833204-3-Harish.Sadineni@windriver.com>
 <CADkTA4MnXVqGaXJ3u-aFghcByOn4rcoL=rtReBpNKZ6brKBp7Q@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CADkTA4MnXVqGaXJ3u-aFghcByOn4rcoL=rtReBpNKZ6brKBp7Q@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM4PR11MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: 830fd7e0-7e95-4661-ceae-08de1c87f828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|14125299003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFMwUWwxd2hsZm5TYnlybWxRWTJ5TFdUZnU0ODJNVyt1SkxiSld0UkNadC95?=
 =?utf-8?B?eFlVNWl4VEtXaXRxUG1zKzZKM2xhM2xkbFRwM2ZSVmlhZ0pVQVU5bzh3VWxt?=
 =?utf-8?B?MkVWZkZkSStZdU9OaWhEK3lIWi9HbnUwOFB6dUVQdng0V1ZSNkxNbFFiMUJ2?=
 =?utf-8?B?eUQrWnRrL3B1QWc2RTB2M2p2V1E5K0x3ZnZ3Qlgya1htZTdnd2tIbWpRMnVY?=
 =?utf-8?B?UGt3MHorMnZkZ0NHRnl6Wm5IRkJrYjVwSU8wU2N2d05pU2xsOHV4WE96QThJ?=
 =?utf-8?B?bWFlWnl0aVZHd1pYUmVKNlJ2dC9mRlJ6a3hSVVp3aHhucDQ0cExiVDQvdGk1?=
 =?utf-8?B?RUVRNFE2TXpGelpVYXUvZzRNZVI4U1h1ekoyc2lJQ1NTUnBRRTR5cy80bnBS?=
 =?utf-8?B?Zm81TklBRDFtVEh3MzJqY2x2bElqWEp1Q2dDUTlWdmJxeTlzZHV5eER6MTdu?=
 =?utf-8?B?YnU3SUNuS1g0Zk1weGllYW1LWGxveXdsWngxZ1lTeGtzVGlBZHRMdFh5RGFn?=
 =?utf-8?B?b2tJNm5CQ0E1aUJ6SnhsVXorRVp2RmdzSHVhclFPaldzU003Y1VEQThNOVFO?=
 =?utf-8?B?dzNIejM5eXI3NWhxcTE5N1hzNm1xeVc2c3NuNXg5NHlqY3RpTHkvbUlLN3lj?=
 =?utf-8?B?WXp3UTIyTXFEVkNYOE9FT0J5SGxlcGZYU01YYTR2TlkvYndUcy9GNW9TSDBO?=
 =?utf-8?B?c2VkZ05QSkdyUlU2bjZTRFlCcXhhWU5yU1R2S05DUTQ0RTQ2aW9CcUlNSllk?=
 =?utf-8?B?bFdaWHZOakp0Y1BlRjFFK0p6WjN0L0ZnSTZ0K1dOZGRwblVab0g4SndobS9Z?=
 =?utf-8?B?aXN4YTZGc1pPZ0wrcGFoZjVXOU9GRmF6UXFXd3cxVjhUbmphYkJ2eTZCMXNP?=
 =?utf-8?B?NStxamFXVytPcUhlVXJXRXJZdE0vT3pvZ3o0RXk4M21NWVU2NVdmTVJMeVp4?=
 =?utf-8?B?a1pTZm0xTlRZQkk4dlhSejhnMnA5VTMvQmcvUXlSS2FwMFpDQURDYVFNd25l?=
 =?utf-8?B?VEszbHR0WUo5UkJrT3dzcWExTFBNT1lIVGpacGJCaGVmd0M0NW9KZjZYUVVL?=
 =?utf-8?B?S1lzUUhyblBxOXA4ZTBvUGFFZGFXdC84amd0OFJlMDVVeE94dE41bVhvRUh3?=
 =?utf-8?B?NUxPeFpQM1lvL1FwVjBtZEhlUzdMNTFGTkZFcVlPampQODgwd3JiOVBXSFJ3?=
 =?utf-8?B?SHVOTjhMMi9HaG53TzFUL2VkK21QOXM5d2d0WnY5WFREaklnbDdndTlxMnRh?=
 =?utf-8?B?LzcwSzEvWWsvWmxkeVJuMnlQNTcrSjJuNSs0YjJCTSs4NkdwbEM2SktTL2d2?=
 =?utf-8?B?UHdScmhUa2EyRWh6ejJvSFUwUElFZEVRaDNlTWE3eFlGZ01CZVZKb0txM043?=
 =?utf-8?B?ZXNxSS9wMDJGOG41ems0UFJWQ0Rac0lWa2dSblVXNFRoM0FVamRzbW5Wekkx?=
 =?utf-8?B?T3d6MHNXeVMwVGdMSEJGdDErL1lRY293TWZ6UGdSNkZCczdRT3Q2QlByWGJP?=
 =?utf-8?B?T2RSb1FSYVNIR21iMmxlSnNIUjM3KzZHd2QrTm5GaVRtelVxRU1IOVF6MXhB?=
 =?utf-8?B?eFdUMkVVMWRjZXJOZXJtV255N3o5eEZLbGgzZW1zTDNGazVSNStrb2ZFY3JP?=
 =?utf-8?B?MXRoempxa3RVRTY5UDBBVGUxQnZ1MkhHNTduWlg4dGpKeEo1TFYyVkpodUJT?=
 =?utf-8?B?Y3hHNDlORGN3WnY4Q0FMbHM3VGIrd2tTTUZvOUthUy9lb2N4b0U4aXNnUGJq?=
 =?utf-8?B?MndJTHlYaVRvdXFucHVKQkFybGV3ekMzZ2lKcmxHWTFRTkVCZVJBWmNiSlM4?=
 =?utf-8?B?R1RzenE2dGw3b3g4QThzTHE3T2hIdmo2R0FIV1ZVUlBEZStDamNqK3NGQ09D?=
 =?utf-8?B?SlA4b3dBNnFJNkppVzhpYUx4YW9aaE10ZElwOXJhSm5veUFlMHpyY0N0Z2sz?=
 =?utf-8?Q?iPozSS05FtxbehKUbNvSHlv0c3FPCjtn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(14125299003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SmtJR05ZUERiaUdhMjJCWXh1MDEvM1pNOGRVUlFqNW9PKytsNmtSQi9sTFMw?=
 =?utf-8?B?VkFONzNvU0dndGZJYUhFWmlQTERGUE9xZ0Q1S3NDRzJtQVRSOHpZNW9RRkRU?=
 =?utf-8?B?MVY4N2l0b3lnQnF6Z1JPM01xaEs3MGxWWk9YcmtCQ3N4WjExa1FTVWttNmhy?=
 =?utf-8?B?SmJHNlRSU200V3lOQ1ExNy9mUHI4Unh2czZDenZQVEJqN2JWWHhjeTV5anZE?=
 =?utf-8?B?NEN1aW8rTG5OMzV3Y0xJOEFJcmZNRHB1c2NUZ0RxbXJzdTVYbms2NTZjVyt1?=
 =?utf-8?B?ZWxUN2thbUpFbTN1NXd2TEI2M2g5ZFduZTBSc1owaXV1SEtNN0h2K3NmekhQ?=
 =?utf-8?B?NGh6aThGVHlGTm9NamdPeTN4Tnl3a3M3VnJvaDZHeE1sSzY5YUw5bXcwckVW?=
 =?utf-8?B?WGErRmo5NklqcVRnTUZxUHNHcEtyNlNNcWM4ZUNhb1U5cjRHZFpsR2ZsZFBQ?=
 =?utf-8?B?NWxpbFFEM3VLQzNJZzNYZjcwTE9yTWpEVm9zRzNBeGFWZEZpMTJTRmxIL3JP?=
 =?utf-8?B?MU92WnkvMGZ3NWltaHBsTG4rOUI5azFWckJvanpvZDdmd0xnOTQySldrbGl2?=
 =?utf-8?B?b2htbmhJQmFNT3lKRmorTkMxZ2l2YWdVN1VUTmw4NU93Nmwzc0xZMlRDdHh3?=
 =?utf-8?B?ZzFuaFM5MGFCMVoxbU9qSWp0dTVJYUFwQXE5eDl4RTZuVjhKeGp3SWxkNlNX?=
 =?utf-8?B?VlVobEtoME54bGNKVjZlc2E5YzZSM2NFQlRhbm5kRXZHaHRQSmUvUGNnejdo?=
 =?utf-8?B?dzYxQ2w4eWVZcFFFdVorNHBZUHd1UHRkNU1LdzdHeE9OMlBaaXg4R1RPR1N4?=
 =?utf-8?B?THdtQ0VaZnhGcVgydkFIQ0RXM3NaNXhONmRHUlpvM0pVbzU2RTg4SUU0Y2E2?=
 =?utf-8?B?YnRlUFZiRmtRenU1YkIvRUlQMTVzOU1LcVpNcFBjU3h3MkJOeVY2eGRrbGRa?=
 =?utf-8?B?cUxNTXRHNmxTOFJZOGhJOHZkY0FST1M3VDFLZG8rbURvd3VTWERkcU1xQUpT?=
 =?utf-8?B?NSsxWmxkVmpxZTFJZFArU2VHMGFVSVVlQUZDZ2lYVVdpdmJZVTV0ajBYZnRh?=
 =?utf-8?B?ZHczblNaSjRrM3pRL1crNTJaSmdaZ1pFNmdDSHhjZ05mUjNLRjJnTXZPU2t5?=
 =?utf-8?B?SDI1ZVZTQ1dta3lTd0VIZysvUWdxcWVoUVlXUjIrcFNkVkdoV2FaVEgrOWJE?=
 =?utf-8?B?bGJyRk5zUGVqR3FJQk5laUlLTWVjOXVMTGlITjFaSWJjQ2J4SkI1dmdoZEhE?=
 =?utf-8?B?eGpPekRWbFFzank0OElnS1RVYjdHa0pnenlDUWhFajlZQ3puMzBQUGQ5Lzhq?=
 =?utf-8?B?RCtFS2lUL1N6TUxTZlVWTy9FY2lFK2xJbnJuNVJsNnZEam5qdTAyNHhNSzdY?=
 =?utf-8?B?ZS9vQ3dRM2ludldDT2tQWitSQ1RCZzZHL2hHeE90WmlnZThVdi9Yanl4Q1FM?=
 =?utf-8?B?M3F2WVFtbElObG1uT0ZjTGFpY0trRWlWekdIaW1wZHBGVjJNaEp0bkw3dzZX?=
 =?utf-8?B?bWpDUm40djVUUVYzaXF2cjFnY1hLdEppWTZYODd1QTJSZEpmU2tRSXJweThI?=
 =?utf-8?B?MEF1UTZuVnJ4VEJiTWs5MkQ4clZ2a0F5ZHBvcnVSeXdtK0Z0SkFVckFkMFV5?=
 =?utf-8?B?RWpIUW1xZUNtOWRqSndmU2Y5ZmZDOFdTRnE3dkJ1SmtPZGlwREY4U2lJUEY4?=
 =?utf-8?B?TXd2bThyRlZHQmpvTUR6MzJFbTA1S1N2K3F6UHNNSnJwY1RVbWRWVlhXb2Rr?=
 =?utf-8?B?eFh4TVFrQncwUjJIbTlxOWcyTHdMdkJDemN4RGt4V1pvc0JxVC80MERXb0ly?=
 =?utf-8?B?dU1Ka0d6dmI2TEpJUTJ5RktJYU5WZk9uNjdOOGRHdU9DMEVDK0RYN21oWDlq?=
 =?utf-8?B?VHdlN2RFZlNydTJRK1ZlL05oblpMOWNsVU5OZTY3aTZDOTJiL0Z5Mm1yN3Y4?=
 =?utf-8?B?TURIYmo5bmRlalhrZEVYdEZHc1A0NmdGNlN3eEJjTE83V1M1Q3BzMlhtbU54?=
 =?utf-8?B?dGNEN1RJR0pzSWxHbjkzRzB1Qnc4d1plaDB0TE9XVGRQeHdKeXMyNUU2SmtG?=
 =?utf-8?B?MDMvUmF1SjZaL3JqamJEcGxsanlNSnU3NzM5Ti9YUnVaUEdVRmxOc0krUUk2?=
 =?utf-8?B?WkZ5dnVveU1OQk5oV2dUdzFCYkJrcHV2a3N3WHVGTXN4c3VZMDB2QWRsMm5k?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830fd7e0-7e95-4661-ceae-08de1c87f828
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 16:25:44.5469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdX1y9YC4dfxv1h0bwKHYECv29uN7+1oV7jyg3BRe+uHv+20Lu7LzgrZQVnQwZAryyf/tC+Jq1/q6Jwr+IeurRI9LZfpXhIxdT5fWny+g5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6456
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Ubs1ciLWejye3wSikb7hlC6ALsNBzTuk
X-Authority-Analysis: v=2.4 cv=FYo6BZ+6 c=1 sm=1 tr=0 ts=690b7a8c cx=c_pps
 a=ziZy7zD1dJq8wwEro8zYwA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1H9S5zupAAAA:8 a=t7CeM3EgAAAA:8 a=LYVmv8Sl0YxWvGshb9oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=m99DSxKkbA0fuVD5WtEA:9
 a=8dVm_bHmSY6F9kgC:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=KJqDGGnLsJCYSyNEcnDM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: r8qwWOtX0I6jzBRGtGsrz0BTwwpVyNmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyNiBTYWx0ZWRfX/PKDSQzvEFFW
 gywf0HvnX1apvQ2VaU+acfMeLaLNNoFaHWG+Hozc86l32Pv/SxKgSBbHoAUxaQI2YlAJx69yaZ0
 pkpJI3c6teRiOj6qYIx6Nnip0uLYWKZcn8l9KCm+T8+8WA8WRlztJ5kWJysKXwK9vRooxEIoQkB
 4DVTI0DxuFqkEX3m+IAPszAammUbP/6aG3qFg55qcP8DCAKcr1Td0fzEhrCTTuVfhGTC/fLyXZ1
 5YGH4FKvAH1wY1O/1P062ut+0cW518wSM2lYEjGqWel+1Idj7bYL9sEtpIt+MbiLvM4NETidYFB
 vJERuTSwf8tgXVZEVlz8tuCEGCGnw35ZTVpkgG0Lryhduir2TvrdY9/YjATZrQSOzjUSDjGpicO
 4F/9XngBJpnD6tGJ9GbyBNULpFjZIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 16:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225775

--------------IvWsb0IaqfhjzdTNDuWpaqKx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5A5GCXAc057743

On 2025-11-05 8:30 a.m., Bruce Ashfield wrote:
> I'm reviewing both series that have come out for rust in the kernel.
>
> I'll leave=C2=A0it up to the submitters to figure out if there are=20
> differences between
> the two series that need to be consolidated.

Yoann and I have been talking and unfortunately, Elmedhi doesn't have=20
time to
continue to work on enabling kernel Rust support.=C2=A0 I've suggested to=
 Harish
that we add Elmedhi's SOB line to the patches where it make sense.
Harish will continue the work and hopefully we will be ready to merge
early in 6.0.

Thanks for the prompt reviews Bruce.

Harish,

For v3 or even v4, it would be good to benchmark:
$ bitbake linux-yocto
before and after your patch set.
You should share the approximate build times and the FS usage.


We'll try to figure out how to speed up this workflow by optionally enabl=
ing
users to provide the Rust binaries using rust-up or something like that.
I don't really know how to go about that but I'm sure we'll figure it=20
out with some help
from the YP community.

../Randy


>
> On Wed, Nov 5, 2025 at 8:10=E2=80=AFAM <Harish.Sadineni@windriver.com> =
wrote:
>
>     From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
>     Add `clang-native`, `rust-native'=C2=A0 and `bindgen-cli-native` to
>     `DEPENDS` to support
>     Rust-based kernel modules or features that require generating Rust
>     FFI bindings using
>     bindgen during the kernel build process
>
>     Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>     ---
>     =C2=A0meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ZIZow7znH24hp-Bzsr1MbyP1rpVYh0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9=
ROY77mn_TMYmdbyxGUmCRg$>
>     | 1 +
>     =C2=A01 file changed, 1 insertion(+)
>
>     diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ZIZow7znH24hp-Bzsr1MbyP1rpVYh0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9=
ROY77mn_TMYmdbyxGUmCRg$>
>     b/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ZIZow7znH24hp-Bzsr1MbyP1rpVYh0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9=
ROY77mn_TMYmdbyxGUmCRg$>
>     index 4d0a726bb6..e2ffd96b59 100644
>     --- a/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ZIZow7znH24hp-Bzsr1MbyP1rpVYh0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9=
ROY77mn_TMYmdbyxGUmCRg$>
>     +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ZIZow7znH24hp-Bzsr1MbyP1rpVYh0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9=
ROY77mn_TMYmdbyxGUmCRg$>
>     @@ -81,6 +81,7 @@ KERNEL_DEBUG ?=3D ""
>     =C2=A0DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm6=
4",
>     "powerpc" ], "elfutils-native", "", d)}'
>     =C2=A0DEPENDS +=3D "openssl-native util-linux-native"
>     =C2=A0DEPENDS +=3D "gmp-native libmpc-native"
>     +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES',
>     'rust-kernel', 'clang-native rust-native bindgen-cli-native', '', d=
)}"
>
>
> I'd suggest that those dependencies should be in a variable, assigned=20
> with ?=3D and then use the
> variable in the DEPENDS line. That makes it easier to adjust from=20
> bbappends, etc.
>
> Bruce
>
>
>
>     =C2=A0# Some options depend on CONFIG_PAHOLE_VERSION, so need to ma=
ke
>     pahole-native available before do_kernel_configme
>     =C2=A0do_kernel_configme[depends] +=3D
>     '${@bb.utils.contains("KERNEL_DEBUG", "True",
>     "pahole-native:do_populate_sysroot", "", d)}'
>     --=20
>     2.49.0
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--=20
# Randy MacLeod
# Wind River Linux

--------------IvWsb0IaqfhjzdTNDuWpaqKx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5A5GCXAc057743

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-11-05 8:30 a.m., Bruce Ashfiel=
d
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4MnXVqGaXJ3u-aFghcByOn4rc=
oL=3DrtReBpNKZ6brKBp7Q@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div class=3D"gmail_default" style=3D"font-size:small">I'm
            reviewing both series that have come out for rust in the
            kernel.</div>
          <div class=3D"gmail_default" style=3D"font-size:small"><br>
          </div>
          <div class=3D"gmail_default" style=3D"font-size:small">I'll
            leave&nbsp;it up to the submitters to figure out if there are
            differences between</div>
          <div class=3D"gmail_default" style=3D"font-size:small">the two
            series that need to be consolidated.</div>
        </div>
      </div>
    </blockquote>
    <p>Yoann and I have been talking and unfortunately, Elmedhi doesn't
      have time to<br>
      continue to work on enabling kernel Rust support.&nbsp; I've sugges=
ted
      to Harish<br>
      that we add Elmedhi's SOB line to the patches where it make sense.
      <br>
      Harish will continue the work and hopefully we will be ready to
      merge<br>
      early in 6.0.</p>
    <p>Thanks for the prompt reviews Bruce.<br>
    </p>
    <p></p>
    <p>Harish,<br>
    </p>
    <p>For v3 or even v4, it would be good to benchmark:<br>
      $ bitbake linux-yocto <br>
      before and after your patch set.<br>
      You should share the approximate build times and the FS usage.<br>
    </p>
    <p><br>
      We'll try to figure out how to speed up this workflow by
      optionally enabling<br>
      users to provide the Rust binaries using rust-up or something like
      that.<br>
      I don't really know how to go about that but I'm sure we'll figure
      it out with some help<br>
      from the YP community.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4MnXVqGaXJ3u-aFghcByOn4rc=
oL=3DrtReBpNKZ6brKBp7Q@mail.gmail.com">
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 5, 2025 at
            8:10=E2=80=AFAM &lt;<a href=3D"mailto:Harish.Sadineni@windriv=
er.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Harish.S=
adineni@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
            Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">Harish.Sadineni@windriver.com</a>&gt;<br>
            <br>
            Add `clang-native`, `rust-native'&nbsp; and `bindgen-cli-nati=
ve`
            to `DEPENDS` to support<br>
            Rust-based kernel modules or features that require
            generating Rust FFI bindings using<br>
            bindgen during the kernel build process<br>
            <br>
            Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.S=
adineni@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">Harish.Sadineni@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta/recipes-kernel/linux/<a href=3D"https://urldefense=
.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ZIZow7znH24hp-Bzsr1MbyP1=
rpVYh0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9ROY77mn_TMYmdbyxGUmCRg$" =
moz-do-not-send=3D"true">linux-yocto.inc</a> | 1 +<br>
            &nbsp;1 file changed, 1 insertion(+)<br>
            <br>
            diff --git a/meta/recipes-kernel/linux/<a href=3D"https://url=
defense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ZIZow7znH24hp-Bzs=
r1MbyP1rpVYh0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9ROY77mn_TMYmdbyxGU=
mCRg$" moz-do-not-send=3D"true">linux-yocto.inc</a>
            b/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com=
/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ZIZow7znH24hp-Bzsr1MbyP1rpVY=
h0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9ROY77mn_TMYmdbyxGUmCRg$" moz-=
do-not-send=3D"true">linux-yocto.inc</a><br>
            index 4d0a726bb6..e2ffd96b59 100644<br>
            --- a/meta/recipes-kernel/linux/<a href=3D"https://urldefense=
.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ZIZow7znH24hp-Bzsr1MbyP1=
rpVYh0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9ROY77mn_TMYmdbyxGUmCRg$" =
moz-do-not-send=3D"true">linux-yocto.inc</a><br>
            +++ b/meta/recipes-kernel/linux/<a href=3D"https://urldefense=
.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ZIZow7znH24hp-Bzsr1MbyP1=
rpVYh0VDQlXOEul6CEdsYkpvfWwn9RxbJGBwCQ_KRh-xMdj9ROY77mn_TMYmdbyxGUmCRg$" =
moz-do-not-send=3D"true">linux-yocto.inc</a><br>
            @@ -81,6 +81,7 @@ KERNEL_DEBUG ?=3D &quot;&quot;<br>
            &nbsp;DEPENDS +=3D '${@bb.utils.contains_any(&quot;ARCH&quot;=
, [ &quot;x86&quot;,
            &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-nati=
ve&quot;, &quot;&quot;, d)}'<br>
            &nbsp;DEPENDS +=3D &quot;openssl-native util-linux-native&quo=
t;<br>
            &nbsp;DEPENDS +=3D &quot;gmp-native libmpc-native&quot;<br>
            +DEPENDS +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:${@bb.utils.contains('DISTRO_FEATURES','rust-kernel','clang-nativerust=
-nativebindgen-cli-native','',d)}">&quot;${@bb.utils.contains('DISTRO_FEA=
TURES',
            'rust-kernel', 'clang-native rust-native
            bindgen-cli-native', '', d)}&quot;</a><br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">I'd
              suggest that those dependencies should be in a variable,
              assigned with ?=3D and then use the</div>
            <div class=3D"gmail_default" style=3D"font-size:small">variab=
le
              in the DEPENDS line. That makes it easier to adjust from
              bbappends, etc.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div>
            <br>
          </div>
          <div><br>
          </div>
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            &nbsp;# Some options depend on CONFIG_PAHOLE_VERSION, so need=
 to
            make pahole-native available before do_kernel_configme<br>
            &nbsp;do_kernel_configme[depends] +=3D
            '${@bb.utils.contains(&quot;KERNEL_DEBUG&quot;, &quot;True&qu=
ot;,
            &quot;pahole-native:do_populate_sysroot&quot;, &quot;&quot;, =
d)}'<br>
            -- <br>
            2.49.0<br>
            <br>
          </blockquote>
        </div>
        <div><br clear=3D"all">
        </div>
        <div><br>
        </div>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
          the NULL pointer, for chaos and madness await thee at its end<b=
r>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------IvWsb0IaqfhjzdTNDuWpaqKx--

