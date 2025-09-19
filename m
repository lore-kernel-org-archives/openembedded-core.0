Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74ECCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 03:08:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7286.1758251308459634756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 20:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=b2ep+iWt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=135712f5a8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J0P2eX148773
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 20:08:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=pf17/batzc+3SLlPDbNiiz
	Lpko6MdDenIck6SmtOvgA=; b=b2ep+iWtaSV/Y7P1wVob75Ew8oUE6l0z2ztD9J
	kZBjwyHirwYUcPDTthidCY9A0xa6NufEy0pjaWyREMYF0/LZzJMEWJxAs0QYfsPk
	r3cfP6jycHpdMsGAoWSFBdHCHrK0HsgBE60E5acpq+tfECk4Y+DnX+h8PUik/hm6
	KDgCYg44XWyvII6Xl8iDr8qUgQAkI01C6woQA840lYXMY9pcdoxJN6FCclO+0yur
	dpG9Dgk0t/yVu8O8gq9QcQj/IISBjm9MzZu7nZGuS7fbuGrmf/kYjJPpyQ3QHENU
	s1TAXBaoB22BrWS8dPEQvtbRQV2rGbDkmTXdBNkt817evkpw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vgr03g2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 20:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwOGv23JmqWTjn+VRVef/Q6OfyTVhw7RJ2GYuiqnYSd49SJvcp8hZx3bmkH2ti1wj0pcD0FUGMZMjVa0MbGmMLb1R+9qyTwfpRzRm1so95mLx+vHtD6adeNm5Kroho4mPv/Z0IUJt7L32WwgBWDwoUZ8SytE2/2XPkoJD3la/zakf/M4Q0HGXceF+qw8krlIvk2tV9+VmKdybdb/NHd004kRpBS1PI0jCFjdgOUiyEdtAXZHAFUdmZZeGnXqaDyowL+n007AqbE1uC/X0OjcBPFMJ5efw5Q6DFx8a7nlRPweRbJrIaNuKrMA52jB0LIgippXuTgVIcCma/CJGNaBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf17/batzc+3SLlPDbNiizLpko6MdDenIck6SmtOvgA=;
 b=ie3ykL+Amcj00U5eVqdeDzOn9N0akfbmhsrFrIQ1qV48vL51eGZEtUdI1/gWASaWCkBpgglnHGelX6bPrhsFNboMLc3HexAevy7HJqdkom2gPGoUXycz5b5VSjZBZYtu4vI+Qhz8ZLWK4LYM7ofE8LzC6LYXxy/AG2BjM+P3d2D4yEjhZhX+lYsUEWybUtJtcSg/TK+Cz8PNo0wavCGqAE2T7mmjUCVDQMP68WizjWtl0kKgQfeRojf6U4xCC+5U53pUp4iRSXT1OwA/6r17pAGaTeI1Ie4yGehwGkd07JWCoLp0DSPIQohQ9LyHxpM5qdEess2otz52ZrgADOIEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by MW4PR11MB6912.namprd11.prod.outlook.com (2603:10b6:303:22a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 19 Sep
 2025 03:08:24 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%5]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 03:08:24 +0000
Content-Type: multipart/alternative;
 boundary="------------NHu96HrIkDXHlDVHfIBG7fJS"
Message-ID: <c4cea784-50c6-435d-bb5e-a36824b72990@windriver.com>
Date: Fri, 19 Sep 2025 11:08:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/8] debug_build.inc: collect debug build tuning
 configuration
To: mathieu.dubois-briand@bootlin.com, hongxu.jia@eng.windriver.com,
        openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, peter.kjellerstedt@axis.com
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
 <20250916040927.103722-4-hongxu.jia@windriver.com>
 <DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com>
X-ClientProxiedBy: KU0P306CA0051.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:28::15) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|MW4PR11MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2ac67a-47d6-4a12-ed2d-08ddf729cbab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UlBPVnJaT29yRVBpa1M0Sk1VQ1VTTkxZVWN3QmJvVW5za2tCSXo5SnR4THgv?=
 =?utf-8?B?ZjRtNTRaWk1JS0NVTmRkamZVd0ZZYnBVcHUzODJ0UzBVVXFoN0JwVEJRcGtC?=
 =?utf-8?B?L0d3Ynk1dlM5ZFRSM00vMi9GeUJPYStMTUkvcGMxYnA3T3doaEtqQWF3MlFG?=
 =?utf-8?B?RGMrekFiamhKU2diQUFqMC9wOWhnMXgzR1hEV1VoOVI2czZYSHNzRW1zVldT?=
 =?utf-8?B?Q0FmRXFndHRLdFluRHVPdG5HMEZnODErbkx0WjV1L0pTVWFoT1pqYXJ4dlEw?=
 =?utf-8?B?WGowelBOVmVTTmNXVEJqYzI0dmRHRDllUmxsYTJBamZXNHJKRXJxR0txc0I0?=
 =?utf-8?B?QWJWM2F4cjBXVG5HaVBqSEpsUTdNSktxWS9LaFA3V091RjAwQ3VMcGd6WXNq?=
 =?utf-8?B?R0hmdzlrKzBMa3p4UDI1R0JkY3FXVjU3OGw5dEs5WGJPUzVJYmRwLzlrVWx0?=
 =?utf-8?B?U3VuM2xid3dIcHZkWG0ySDBTRkU3ZSt4elJVVElxMFNtMmRVRkI4V0JWcm5v?=
 =?utf-8?B?blRYWnRONlFVNm84MVF2dmpISG15Yy9RVUxOSWxmOU4rcjl1VnNWZHZwdzd1?=
 =?utf-8?B?SkhpKzFGeEJpNC94dFFQWU1MVGcrY1lFNDlINmdsQkxZL2FqaUwxbUlGV3VU?=
 =?utf-8?B?eUlVZ0FKMlpmY3hhQTI2N2NwTTJRRHR4VHZnMnY5YjVJWERkSkVoNmJ0ZlVW?=
 =?utf-8?B?MmI0ZHE4TWFYNXB6eUZqbUpFMVp5V3VDakozZWZseWN6Um84eVZacjIwMFI0?=
 =?utf-8?B?Zk1WTHcxNGFJWFBmS3B6aTg0RnhNakpjSVpCK05WU3FsT2dFR01wcUlEYXdX?=
 =?utf-8?B?d0NIRVk3d0VwTXo0QlkrTzdjWGc0ZUdMakpjTExSMm9mYXcwZENTMkhpYjZ0?=
 =?utf-8?B?NWhqVnF1ZGtwMTgyajJ6SVB4VVM3SzNPQzN3RE1MVFZ0R2hCUXM1UUhVYzRk?=
 =?utf-8?B?ZnNxenFjZ3g1cVVaeGV1bmdrWFRob2doQ2hiSEx6Ny83OWUyZDhqeFIzZXJL?=
 =?utf-8?B?ZHJ6ckNXZFNJUHFwdEd3QU9HM0Y2c0FidnpobEhJTENlZ2x5QnVuTExxNTJ6?=
 =?utf-8?B?SnpzMFhuVENNZE9WOGlwcWZxUGpOUVBOL0RQMWlicFBHTEtENUNBTHVXbHVY?=
 =?utf-8?B?ckYrSmJSdjlhbEhoQjBySGNUTnRyVjRUcUFVWlJqanM2U05MVHhjUElCNUxn?=
 =?utf-8?B?RVg5OVZ2ZHZBTVRnSUIzdkJBT0RIMWZmYUxZL0ZLcnpLTGlMY1lTNkRFMWYr?=
 =?utf-8?B?NmtyMVRjd3QrS3VGYUR4dHJCVGlKc0RGMit1WlpUbFFTc2tnRFprWWs4T3Fs?=
 =?utf-8?B?akVRSGE3SnlaUGlqYU5pTU1qRy8yUzczSkFMNVRSMUl0UG1Cb0VSZVVDRGUw?=
 =?utf-8?B?L0ZJT0t3SU9GSC8xUVZEWnhBWVJScDdTWlJKYW9ueUlMVEprOWphRkM3Qjlp?=
 =?utf-8?B?S0g4ZzhSS3pycXppb1RRT3hLcVREVHlIdWF3Ykp4Q3ZzQXRKMVQzV0ZGcFYw?=
 =?utf-8?B?d3lQUmRNR053NEQrQTFpQU84OVBLQUEvTFVDZFR1RldaWndDMzVWQ0R4MG1B?=
 =?utf-8?B?dlhHOFFucnV0M3NpamZkQmwxekZsR2pqT0ovUUJOUXlrTk5wR3NXQzNVMzd4?=
 =?utf-8?B?YjZYV2NnVHByRUEyRGJZWTBxRjA0MmZOaUFybTRqNnFKN3RuMHFEcjQ1UmVm?=
 =?utf-8?B?RmZnbWFoVGtMRU1FR1JmQWpDbFFGd0NsZ0s4Z0ZBUGF1cWQwcFR3VWp5WWJ3?=
 =?utf-8?B?WmVYNzFMZkdXLyt6SlYzWHBKalUwdnlzYXFoUDdrVVJqbnpsMXNySzNWT2hV?=
 =?utf-8?B?MEhQZklUTXYrVzZKNzRXVWhvNWVMeFZMNUYyeXJhT0dQK01nUlhpanJLZnNH?=
 =?utf-8?Q?igHCPNm4c12b+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUdqTVpGNHlKd2pYWDVjNldaOGR2K1B1S3dGbFJHRCsrL09weEJHd21tNFBR?=
 =?utf-8?B?MkxlTXZydWtBalkxNTJJNUpteEZGbmZSOEZuQXg2R2RYNlB1Vm1DaFRiYzJB?=
 =?utf-8?B?cmJ5QzlmT1pGYys0UCtuZVdFWmJ6ekt0WU1HV29wenRpa2hXcU95OU9jZTVK?=
 =?utf-8?B?WUNNaExQUkpUeklxZ2tIdEdINUpWc2FVK1RESjc3K0FsbFNVd1E5dGlsSEU2?=
 =?utf-8?B?WDVtVnU3K2twMDhaMFp3dmg5bEl3Y1ZGRExVQk5XQm1wWGNvcVJ1VzRlVXc0?=
 =?utf-8?B?MVRjOXpyRFd4WWlNekxUQWdQeVZnNUFITUZ1N0xNZS9RMENad24rYnd1Z1Bv?=
 =?utf-8?B?cHB4SU5DY3dBYlRSc3F6aG9jaEtiUVB4M3RIZ3NVOU9LQTJib1kyaG9qb2Nh?=
 =?utf-8?B?MkVaOHhaR2QwR0xVb2tEWDBqblpRSXRoMXhyMFVDcDI4aDQyVTdYSlpKaU1l?=
 =?utf-8?B?MWcyMG5SdEduNUJqV2QyMXRzTThlWGphREoyWU01bFlJbkpVVStFR1pFRys1?=
 =?utf-8?B?OFZmc1R4QXd1T0xKTFc0blNpYy8rajJrLzNCN25jbW5KTTdtemhYdDF5RHhi?=
 =?utf-8?B?MkRBZWVpZGt1Sk1ZYi90VHpEU1dkWWlYRnFjd3lURFBjaU51dFdnU00yaVht?=
 =?utf-8?B?OEtkdEdvSXE0UTNTVklIdWYzT2NEUHdUdW1zUllUWUhvY3NydlJQd29QY2p1?=
 =?utf-8?B?L3lDWkhUU2EyNVlDUklQZi9NOTZRY3RoaldaVVBRV28yRm1jelVTY1VSVHFP?=
 =?utf-8?B?cjJwQlFGZ0s1VmRNclpJandnYVJtSmIwV2dPR3BvY1dQM09pOExIOGU3bHp5?=
 =?utf-8?B?N0NaNFczVWhMMFN3T1pJREpjY2pFVGdFd0N5eDVtb3gvN1E3ejBmekFpMThj?=
 =?utf-8?B?NkEwVXkxYzNGS3V2Y1Y1WEYraUZ4V2RvWnVTTmpHWGlmeEJ4eDVDLzRwWWhC?=
 =?utf-8?B?b2ZvNDY3b3dyTFFWRGhoL1JhQ0RDcTQyeWNGdVBFWXNlVXNvRkN5MFczSDQ2?=
 =?utf-8?B?MzBSdDlZcGRIVkN2YjF2WXM1RGExTzFBdlVMOG85a2oxY3RtSlF5M2FGQnN2?=
 =?utf-8?B?K3lLUE1TUnJYNmpFRHZKVHlqbXJVWU1pR2ZEeklMeWZmUmRPekhyT1YrUlha?=
 =?utf-8?B?ZUVIdGt6VE1jUThybHUwVUREK3NoRzJlcjdqbHZPeHNVUUN2SVA5enoyeU9m?=
 =?utf-8?B?QitETUcxTktuM3h6RFZBL0s3N282dndKaXEvOWp0bHFNUVFlMmJlb3hkN2dq?=
 =?utf-8?B?c3dkOGlhL0dDbE1yRW9CWVZ1RW9tQXJHdE1RdHZaRFQwdHY5c0dwYmxRYlY5?=
 =?utf-8?B?UjJNK2JDZTNpQnBvTnhIOG9wSGVSbTBOTnhQMXJRSkJJTUE3UE5INUJXcys1?=
 =?utf-8?B?S3kyMVFNMFZySjlZR3NiL0kvQzZFWHQxY3hsVCtvRVYzK2tiQzFkZE45YUxE?=
 =?utf-8?B?emNhbFJERktmVGxZTU9XdlltblVjZnpjWDJKWlNLcnVtbTlFZGFxdUhSV2dq?=
 =?utf-8?B?TmU4N1dSRUJEZkE0NXlSTnFPWGJ1aTZlRGh2QnNsRlF5d0ZKM1I4aG5Jc2ZI?=
 =?utf-8?B?SXlBbXlWZHBIdWFuUEJwdk4xcEQ0QmtKYW9oYnRVSDhWRncxN0FQeGxOVVFJ?=
 =?utf-8?B?TWJXeExmeURjdVovcFE5LzFIYmxCY01UUlhMUlpaaE13Q2oxQmk2NlUxcnhx?=
 =?utf-8?B?ak9obTdCak5mM1BwNklnUDlyenFtNklKRFN6SjFQcVEydVkwd0RmK3dOaE81?=
 =?utf-8?B?VXdxWE9TSkVBV0V4N2dSTDE0K3RBYWtXNnZ5UzJmaFpVVERHUlN2NVZZVkhr?=
 =?utf-8?B?dit5UUlyQWl1aU84dWpwM0F0RGZZZnhOcWNuelc1YzdNQnpjT1c4N3U4RzRp?=
 =?utf-8?B?TUFCWXFzdVlFZHgyY2QvNVVNZVVKc2o4dVNwcmtWZ3ZsekFmU3BudnUwemVw?=
 =?utf-8?B?UHl3Ry9IMFJQVTlKL1czTjcxL3ZWaWUreTB3TEd1MjhjM1d2aTRsWWpsTzgv?=
 =?utf-8?B?dmhCYXBWNTdaeVpsaUI0YXArM1JscWtXSG8xMkpJZkVTZUVGRFF6VlBqTWN6?=
 =?utf-8?B?ckpBQ3oxVmZaS0ZyNXlIM1hzU0ZMU2VGQ3QybCtQVzM0alZwdWl4ekhldll2?=
 =?utf-8?B?bHVhRHRYb25jeWgrd1psTWlCNjNnMlc3OWx5LzFoWmZzVjB0TzlFRW10bGpM?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2ac67a-47d6-4a12-ed2d-08ddf729cbab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 03:08:24.2740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ln1mNnmmViDuR5VeKcsva4sFuSjR4zG+WbwxzXEEPSl7JwV3vE0LgcGSs6Zj62cNfpAdk8LkV2Y884OgZSxmuHhYqEMt9F+xcm/rAba6li0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6912
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Z+LsHGRA c=1 sm=1 tr=0 ts=68ccc92c cx=c_pps
 a=LPqnct3xGwQwGN9n+XDEZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8
 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8
 a=GNXcT7g_-OSGf6333NcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TGWRFvGZnzJx6LKCTUUA:9 a=87XeMytEpbQ5ClK0:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=VLVLkjT_5ZicWzSuYqSo:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DJkSsOXMd4TorDI5t2hcxzlPVhZGP3ph
X-Proofpoint-ORIG-GUID: DzwpUstFk35-BiYLrnt83XkKzxzCcsvz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDAyOCBTYWx0ZWRfX10qHGAEsjwmG
 uJtXYqC0p0AHhS1m6cTxvpggGIkozJEpfG7/T7btI8jdufOrloMI2MmJ1mB2iaSkHkwzsENGrpG
 ci5HGYmL5T2hiaI5C3sN/zTbda/0uRo87STPx80U+BiFowtwEkxSU/9XWANUh7pTE5n9/GvEc6X
 t7TgR4s8VQbORj7MXcgnKVzJGkoqWb24nDop3WvbdeR9bSHed0sznr5qYEI2XzpM1lxhJCnlPKh
 WPBXvoiauyOL8IigyeXiB6ElUOoY3vbWveqVBQJ3cNz/EH0t5rW5qGhUmCaHz4VHe6Ir041BgQq
 xKvbDfqVH5txBSIBlUzBK9MAM17pKsKTLZ6+C2R7iXsTdhStw6UWZkIN1vjpW0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 03:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223719

--------------NHu96HrIkDXHlDVHfIBG7fJS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58J0P2eX148773

On 9/17/25 19:24, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue Sep 16, 2025 at 6:09 AM CEST, hongxu via lists.openembedded.org =
wrote:
>> The modern compilers and code seem to require extra steps to avoid DEB=
UG errors,
>> Move debug tuning configuration from recipes to an include file to add=
ress these
>> errors.
>>
>> Introduce separate variables to avoid the :remove operations, such DEB=
UG_OPTLEVEL,
>> BUILD_OPTLEVEL and OECMAKE_WEBKIT_NO_INLINE_HINTS
>>
>> Suggested-by: Peter Kjellerstedt<peter.kjellerstedt@axis.com>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
> Just a note about this patches: I had perf reproducibility issues [1][2=
]
> after taking this series and I believe this is linked with this patch. =
I
> suspect this is not directly related with it, but more with the issue w=
e
> have had with perf reproducibility last week.
>
> So I dropped this patch for now, but I will take it a bit later this
> week and try to go further. I still wanted to provide some feedback
> here. Also, if anyone believes this issue IS related with this series,
> please share your thoughts.
>
> [1]https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2=
505
> [2]http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0ss=
72vce/

Hi

I clone the branch of you on contrib

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmathieu/m=
aster-next-success

https://git.openembedded.org/bitbake-contrib/log/?h=3Dmathieu/master-next=
-success

And do oe-selftest without the debug build patches, the issue we have=20
had with perf reproducibility still exist

$ oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

...

2025-09-19 05:05:31,099 - oe-selftest - INFO -=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2025-09-19 05:05:31,099 - oe-selftest - INFO - FAIL:=20
test_reproducible_builds (reproducible.ReproducibleTests)
2025-09-19 05:05:31,099 - oe-selftest - INFO -=20
----------------------------------------------------------------------
2025-09-19 05:05:31,099 - oe-selftest - INFO - Traceback (most recent=20
call last):
 =C2=A0 File=20
"/buildarea5/hjia/contrib/openembedded-core-contrib/meta/lib/oeqa/selftes=
t/cases/reproducible.py",=20
line 406, in test_reproducible_builds
 =C2=A0=C2=A0=C2=A0 self.fail('\n'.join(fails))
AssertionError: Bitbake reproducibleA failure
Bitbake reproducibleB-extended failure
The following deb packages are different and not in exclusion list:
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/deb/./qemux86_64/perf-dbg_6.16.7-r0_amd64.deb
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/deb/./qemux86_64/perf-python_6.16.7-r0_amd64.deb
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/deb/./qemux86_64/perf-src_6.16.7-r0_amd64.deb
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/deb/./qemux86_64/perf_6.16.7-r0_amd64.deb
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/deb/./x86-64-v3/apt-dbg_3.0.3-r0_amd64.deb
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/deb/./x86-64-v3/apt_3.0.3-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/ipk/./qemux86_64/perf-dbg_6.16.7-r0_qemux86_64.ipk
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/ipk/./qemux86_64/perf-python_6.16.7-r0_qemux86_64.ip=
k
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/ipk/./qemux86_64/perf-src_6.16.7-r0_qemux86_64.ipk
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/ipk/./qemux86_64/perf_6.16.7-r0_qemux86_64.ipk
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/ipk/./x86-64-v3/apt-dbg_3.0.3-r0_x86-64-v3.ipk
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/ipk/./x86-64-v3/apt_3.0.3-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/rpm/./qemux86_64/perf-6.16.7-r0.qemux86_64.rpm
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/rpm/./qemux86_64/perf-dbg-6.16.7-r0.qemux86_64.rpm
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/rpm/./qemux86_64/perf-python-6.16.7-r0.qemux86_64.rp=
m
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/rpm/./qemux86_64/perf-src-6.16.7-r0.qemux86_64.rpm
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/rpm/./x86_64_v3/apt-3.0.3-r0.x86_64_v3.rpm
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB=
-extended/tmp/deploy/rpm/./x86_64_v3/apt-dbg-3.0.3-r0.x86_64_v3.rpm

2025-09-19 05:05:31,099 - oe-selftest - INFO -=20
----------------------------------------------------------------------
2025-09-19 05:05:31,099 - oe-selftest - INFO - Ran 1 test in 32633.939s
2025-09-19 05:05:31,099 - oe-selftest - INFO - FAILED
2025-09-19 05:05:31,099 - oe-selftest - INFO -=C2=A0 (failures=3D1)
2025-09-19 05:05:34,691 - oe-selftest - INFO - RESULTS:
2025-09-19 05:05:34,691 - oe-selftest - INFO - RESULTS -=20
reproducible.ReproducibleTests.test_reproducible_builds: FAILED (32633.79=
s)
2025-09-19 05:05:34,736 - oe-selftest - INFO - SUMMARY:
2025-09-19 05:05:34,736 - oe-selftest - INFO - oe-selftest () - Ran 1=20
test in 32633.939s
2025-09-19 05:05:34,736 - oe-selftest - INFO - oe-selftest - FAIL -=20
Required tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=3D=
0)

...

//Hongxu

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223592):https://lists.openembedded.org/g/openembedd=
ed-core/message/223592
> Mute This Topic:https://lists.openembedded.org/mt/115268059/3617049
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
hongxu.jia@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------NHu96HrIkDXHlDVHfIBG7fJS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/17/25 19:24, Mathieu Dubois-Briand
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue Sep 16, 2025 at 6:09 AM CEST, hongxu via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The modern compilers and code seem to require extra steps to avoid DEBUG errors,
Move debug tuning configuration from recipes to an include file to address these
errors.

Introduce separate variables to avoid the :remove operations, such DEBUG_OPTLEVEL,
BUILD_OPTLEVEL and OECMAKE_WEBKIT_NO_INLINE_HINTS

Suggested-by: Peter Kjellerstedt <a class="moz-txt-link-rfc2396E" href="mailto:peter.kjellerstedt@axis.com">&lt;peter.kjellerstedt@axis.com&gt;</a>
Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Just a note about this patches: I had perf reproducibility issues [1][2]
after taking this series and I believe this is linked with this patch. I
suspect this is not directly related with it, but more with the issue we
have had with perf reproducibility last week.

So I dropped this patch for now, but I will take it a bit later this
week and try to go further. I still wanted to provide some feedback
here. Also, if anyone believes this issue IS related with this series,
please share your thoughts.

[1] <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2505">https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2505</a>
[2] <a class="moz-txt-link-freetext" href="http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0ss72vce/">http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0ss72vce/</a>
</pre>
    </blockquote>
    <p>Hi <br>
    </p>
    <p>I clone the branch of you on contrib</p>
    <p>&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu/master-next-success">https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu/master-next-success</a></p>
    <p>&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/bitbake-contrib/log/?h=mathieu/master-next-success">https://git.openembedded.org/bitbake-contrib/log/?h=mathieu/master-next-success</a><br>
    </p>
    <p>And do oe-selftest without the debug build patches, the <span style="white-space: pre-wrap">issue we have had with perf reproducibility still exist</span></p>
    <p>$ oe-selftest -r
      reproducible.ReproducibleTests.test_reproducible_builds</p>
    <p>...</p>
    <p>2025-09-19 05:05:31,099 - oe-selftest - INFO -
      ======================================================================<br>
      2025-09-19 05:05:31,099 - oe-selftest - INFO - FAIL:
      test_reproducible_builds (reproducible.ReproducibleTests)<br>
      2025-09-19 05:05:31,099 - oe-selftest - INFO -
      ----------------------------------------------------------------------<br>
      2025-09-19 05:05:31,099 - oe-selftest - INFO - Traceback (most
      recent call last):<br>
      &nbsp; File
&quot;/buildarea5/hjia/contrib/openembedded-core-contrib/meta/lib/oeqa/selftest/cases/reproducible.py&quot;,
      line 406, in test_reproducible_builds<br>
      &nbsp;&nbsp;&nbsp; self.fail('\n'.join(fails))<br>
      AssertionError: Bitbake reproducibleA failure<br>
      Bitbake reproducibleB-extended failure<br>
      The following deb packages are different and not in exclusion
      list:<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./qemux86_64/perf-dbg_6.16.7-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./qemux86_64/perf-python_6.16.7-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./qemux86_64/perf-src_6.16.7-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./qemux86_64/perf_6.16.7-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/apt-dbg_3.0.3-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/apt_3.0.3-r0_amd64.deb<br>
      The following ipk packages are different and not in exclusion
      list:<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./qemux86_64/perf-dbg_6.16.7-r0_qemux86_64.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./qemux86_64/perf-python_6.16.7-r0_qemux86_64.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./qemux86_64/perf-src_6.16.7-r0_qemux86_64.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./qemux86_64/perf_6.16.7-r0_qemux86_64.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/apt-dbg_3.0.3-r0_x86-64-v3.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/apt_3.0.3-r0_x86-64-v3.ipk<br>
      The following rpm packages are different and not in exclusion
      list:<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./qemux86_64/perf-6.16.7-r0.qemux86_64.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./qemux86_64/perf-dbg-6.16.7-r0.qemux86_64.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./qemux86_64/perf-python-6.16.7-r0.qemux86_64.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./qemux86_64/perf-src-6.16.7-r0.qemux86_64.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/apt-3.0.3-r0.x86_64_v3.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/apt-dbg-3.0.3-r0.x86_64_v3.rpm<br>
      <br>
      2025-09-19 05:05:31,099 - oe-selftest - INFO -
      ----------------------------------------------------------------------<br>
      2025-09-19 05:05:31,099 - oe-selftest - INFO - Ran 1 test in
      32633.939s<br>
      2025-09-19 05:05:31,099 - oe-selftest - INFO - FAILED<br>
      2025-09-19 05:05:31,099 - oe-selftest - INFO -&nbsp; (failures=1)<br>
      2025-09-19 05:05:34,691 - oe-selftest - INFO - RESULTS:<br>
      2025-09-19 05:05:34,691 - oe-selftest - INFO - RESULTS -
      reproducible.ReproducibleTests.test_reproducible_builds: FAILED
      (32633.79s)<br>
      2025-09-19 05:05:34,736 - oe-selftest - INFO - SUMMARY:<br>
      2025-09-19 05:05:34,736 - oe-selftest - INFO - oe-selftest () -
      Ran 1 test in 32633.939s<br>
      2025-09-19 05:05:34,736 - oe-selftest - INFO - oe-selftest - FAIL
      - Required tests failed (successes=0, skipped=0, failures=1,
      errors=0)<br>
    </p>
    <p>...<br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com">
      <pre class="moz-quote-pre" wrap="">
Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#223592): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/223592">https://lists.openembedded.org/g/openembedded-core/message/223592</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115268059/3617049">https://lists.openembedded.org/mt/115268059/3617049</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@eng.windriver.com">hongxu.jia@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------NHu96HrIkDXHlDVHfIBG7fJS--

