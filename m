Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9AACCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 20:47:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.687.1759870030260434285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 13:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EvQH93M1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2375dc7ba9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 597AKY9K3370954
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 13:47:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Nju8ZODkWpz3jTOQmQ3oy9
	7hdErCgfnVJ/LJf2suYMc=; b=EvQH93M1fmS5bzWlprrUp+I/5FCi3V/UCWrScW
	6tFgckYkGnQfl4bbZk8LaTXdegTvyM9XFSzody6rmlsE4HQt9WBzgNA4y+M7Nkvq
	CNqnsWUGVVpnzrhjIsyEkTI4z+LW0DgtgdJZCEpkxIZLZmzExgmhhCNxBRvDjF4S
	/+2a6FhyZ5OszKMTQ/GG7JnwnJ/cO/a+rHcQInhBdZLF1c/9W74thecX0ZrcJ62F
	9c/1wucgtB9YG1q+6tsQDEOKeBCktLg9prOCZiH7jzGVw26h3shBO0rztgbi73bI
	17CSMdYiCdSNUjyQfDZ6WwAO6y7+pbEAwLbCuwgy8cvPjaaw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jxuwkcfu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 13:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZ2zoyz6upxQoZ/YqPiSfpsJLBBJDg5keHA2xmb70e+Pua0qjkTX/2yxzdUPEFtIZ1SelowAryJ/MDCGY1VBnUymtmLmuMazBIFLxNoAN06bO0jLVuaFY7h/HRjQAigaALeCfnPZKPRZ+J6oSlr5If7fEU8jgBgmP1RFo4/MvFNFE7V89Z0bZxSjRH52qHAm1eIcQUitPILcRp2xTFCvtyTLyWp/WUrevSdAdtMa3CB4y6YIgnOZy5X2LAsYyryp10Byhqr7Qunz5qTcmNGowRmT9fcvBJ6dh6DFvawYT+3QNNyLR1jvXrSDRv1j0OiyLeRJALI7rKB1logacr68SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nju8ZODkWpz3jTOQmQ3oy97hdErCgfnVJ/LJf2suYMc=;
 b=TrXJjxeWhX/ZpKKoC0Srf2p0fNfouQWPMYpP9xKVQGT8UtME68oraVPi383TAE3XVdM9GRpBq6d7+PZUtrPq8og2/yrgvFjeG803KFW85S7SrjcYD4FNrDVFqoK4zoeT7byUisQvEpD72kDBXK+6cKH8iroO0DJOp8anw2ACw93mECqjohqLxU6b6gOSlBlRu+6ee4H2WjsTKzb5T08UXdDO3iipS9ynlha/8znZnPdDNx3YCeYxNRhIUF5+rIefaz2Np5krgLFUC21m5T8JLGMeHAY7DKK6oU9CXsBDAT1+4Q+dliJyUPto1z6ZTTueGGKGbQfQnZ8t0Ktls8S3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 20:47:04 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 20:47:04 +0000
Content-Type: multipart/alternative;
 boundary="------------dOKi1Bl1fPPj0GCuwSIoQpbR"
Message-ID: <a95eb395-fd7b-46c4-af13-516bcb8d1473@windriver.com>
Date: Tue, 7 Oct 2025 16:46:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] gawk: disable persistent memory allocator due to
 licensing
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, Liezhi.Yang@windriver.com,
        peter.kjellerstedt@axis.com, ross.burton@arm.com
References: <20251007200944.323467-1-Randy.MacLeod@windriver.com>
 <f733467a-2cbb-4cb2-976c-2ce06da28737@gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <f733467a-2cbb-4cb2-976c-2ce06da28737@gmail.com>
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3b8198-41e0-4d13-e37e-08de05e2abf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDJ2Kzc3U0lWMjBtS3M0bDZDTnpWbHkxTGlybnphejNGeXFCLzBRY05IdVh0?=
 =?utf-8?B?YVJYVW9EZ3ZQZFQ5czVybnlLZ0pxNnpGVXpnM2piOTRQblF4emJuMDAzS053?=
 =?utf-8?B?akNSUzdydFMvKzNRQ2d2Uk5VczhUdG9KdmZSODRJMS9maWh4RDZIa2RpNUtk?=
 =?utf-8?B?ZGpNSlVwQVU4M1dqQ09nelQxYU1ZaUpXZmM3dVhaTFhrUU8yZFU4c1FadEwy?=
 =?utf-8?B?dktyTytPZ0F6bGs2ZWFxQUVaS2YzbGU3Vk5vT2x0UFJPSzlyQTEybjZxQWRp?=
 =?utf-8?B?ekdsZTlzZVgza21MaTdHMVVBc2dHZnNyM3YwMnc3RU5BdW04YTl4TFNZTUxX?=
 =?utf-8?B?MStlVEpZQkRzVWxYaEE0dUNwd0Nsc2lEbHBFSFFERm9ORGgrdVZLdUdVcVln?=
 =?utf-8?B?eUF2NloxRlVyMk9uc0hXQVpCRFNxYTlaN0ZHV2tLaWhUOTA2aDN3MEhHUyt6?=
 =?utf-8?B?K3E5VXhMN1dzVkRBUzMyNVQ2eERtekFiNUpKTHFQcklNSVdSdlZ4aGZXNFEz?=
 =?utf-8?B?SjZ1ZjR6dndISVdhaHhrR2RCZlFZaVhKQmRzTXM2cnFjbE83K2dYL09HQXUw?=
 =?utf-8?B?RW9CNzJuSnNaNE9jWWNidENDV0ljTzJqSmtrZTI1c0hFVWJIdEtMZHRwRXlt?=
 =?utf-8?B?U2k0dThxV2JLeTF4YTdpdjRSNlBVdG5WRnNuMnBDNkh5S1dLUmI1TTBwK0Rs?=
 =?utf-8?B?cFp0TU0rRXhnTE9aMnl3T2pWYzNXMi9DSnJZbG9GTURBYVVpNVMreVJZdjhL?=
 =?utf-8?B?RG9hU25wYXRSaVMyZFIvQ1FJUGdYRFlxb2ZlczEvcGI5azBNaFFuNkkwRGJx?=
 =?utf-8?B?a1ZQUWxDT2tlSmNEOXlYcGVxZXBTU1g1Q1FPMDVIeTIzRTdidEU1TlF4N2lx?=
 =?utf-8?B?c3kvaEE4bDRiNThwYmlhY3AxVlJFZWJrUHRuR0VxTmtOeTBaOEJyYVZZc3Uy?=
 =?utf-8?B?b1FldHE2VmIyMjMyN2lRdmNPQmlXcW5ZYldkTnpmOVN6OU1aV0FZSWRzc01X?=
 =?utf-8?B?dXFwUXZFUElhMGFRRGRrejRmMlh1dHJ2MU9NbC9HZW9ORlE2QThDZkRIelhr?=
 =?utf-8?B?Mm01UG9mU3FXSVRPT29ZWkpMWkRWd2ZSMmM4bnduaWZJeFZtRWFzazVKM2Rm?=
 =?utf-8?B?U3ZFU0czbG1mM1JvS3pUUGs3bFh2aDcwRS96RysxV0pvRXRvTE16bWZuT1ly?=
 =?utf-8?B?ejhEN0pjcXY3aEJncjlESU1ueC9aRnY2UUZYSnY1VEFqUnVhVXd1dU1WUDVh?=
 =?utf-8?B?eXhFTGdSVWVvVkliR24xdG55WG8xVFlwSUxUN2Roa3dGY0Z2VE1OUkJZb2ly?=
 =?utf-8?B?MkYyN3lXaGRsUEJONitpV3pFYWJQODd2ejFIUkIvSGZKbWdINkw0VXRxS2o5?=
 =?utf-8?B?c0E2QWg2SEZkdXUySE8zejlKbFo2WkhTTjQrRkNGTFFjSVdMN0NkU0tFbEl4?=
 =?utf-8?B?alM4UlM3QUVRcXdZOW9ZY21TbE03ODRHTTlmenlPb3VyNmgvWjZhZG5nWU9y?=
 =?utf-8?B?ZXF4aSttNEo3MEo3YnhrK3JxeW9MNDc4MjJ4T3BJNy9OdUhiQ1NuQmpaVDg2?=
 =?utf-8?B?emJqZ0doRU9rd1BCQWp5dTVpVkVHZElUMzVNV0FQSytCZ2xveGhuS25NUUhZ?=
 =?utf-8?B?WVQ2V01LdER5ai82M0E0alJ2ZzRvVkM3Rm9jejNjZjZzQmZoblE0YWMvdjlJ?=
 =?utf-8?B?Smx4MlROSHhxN2RHdk9LQ3VoQm90VGV1L3VzZk14d0gralk0S05Lb3h0azh6?=
 =?utf-8?B?L2M2OVBTUEcwdWxjdXFEcVBQMkswMzljcFBYMUQ5WWdOZHhCa1dLN3lsOXBY?=
 =?utf-8?B?VnU5aVZCZDFPcWtvUzdaZWxWaHE3SlVLVnNUTnpiREtmNjNaM1FPUWpPcFp1?=
 =?utf-8?B?WGRoTllwOU85clQyc2NVaHRQV2ZSQjJ2SHVITllvdFpTSXc1aTEzVjJSMlo5?=
 =?utf-8?B?N2FYd3h0dlFyRitjVDduZDdHSXVaSVBSb2NDRDhtejVqRFd2V0JNclBWdjk0?=
 =?utf-8?B?VU5mU2IySllBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjJNTGp2ZVkxaWJsblJCR09VZ3lDSjNsTDVrQ0tiUVphcFd0dXQ5MlhXUm5h?=
 =?utf-8?B?OU9LWkZ6c0U2eHZYak5yR0tsZ2NxdTM5bS9PNXorN3VSODIrQ3R5elVCWTh3?=
 =?utf-8?B?cnU0VWxyb2hEalVqRmdjdkNRU2dBTVo3Z2pFd2ZzbWpxWUdaZ1JOMm80Y2Ri?=
 =?utf-8?B?VDVFZFc1T2t1Y2htZStlQzJocUxaWnBlVllIQkphd0VjdWhGY2JMWGVXWEpv?=
 =?utf-8?B?bzRWeVJuSmhhUmVVVUZlY1BTMEViT0Z6bDV5TFMwMENCbDdXYVVWRFF0VDhX?=
 =?utf-8?B?V1VEN1dGNXo4b1NkUm9FVnFWWERTcWhxVXh6MDlGVjFuSFBzdnhLSEpqSzJq?=
 =?utf-8?B?ZUY2Q1hqOWpwSTAzMi9sWUdDaCtoOTJ5djNhRlRlK2ZyZTNkSjdqRytha2ls?=
 =?utf-8?B?enhnSlpPR1dCcHQ1VS9Kd3hzQmtYVWkzb2xNYVdBQlVRQnlpZkRnRWszcW1k?=
 =?utf-8?B?WlZqcDVYT2NiTkJDVzNDdmVQWXMyaDgrQ3dZUDFDa3hseG1sSHA5U1hHQ0Z4?=
 =?utf-8?B?N2dpVzFrYTZ4ZU1zOVo1ZjRkMTE2QlpJZ0JDNWsrR1d1bEtENEN1eS9Wc0R6?=
 =?utf-8?B?YWZDSHUyallzemNpTTk5MTEyLys5Nm1PdjBUT0pCS05QYmFIdVNPU2tLdm9O?=
 =?utf-8?B?akxGMml3Y3F5MXdZNWNYN1dVa284dFRGamJWOUk1MW1pQ1FHMkdFaXhPSExM?=
 =?utf-8?B?eXdZZFBmSlJ4VDZISFhjckZaa000OURWcEt2alBoZXBHSDR0aUVqeVZWRE5t?=
 =?utf-8?B?UkYxQzQzUW40R2JTeE9vSHlHSXJDaDI1Y2RDZk5LYlhmd2pNSUllOS9jdWM2?=
 =?utf-8?B?Q0k0SnJRTUdUYVRON0JKNk1Ta3BaMytXeWwwbGZ0c0RIeTRqeFpkeUtxYUpt?=
 =?utf-8?B?U1FZczc2bzRUeENxb0NxRElqVFdXNnVyNHFpQ2lJZ1pKRWxNUTNuVytRRGVH?=
 =?utf-8?B?YklwTEVCZ0pTeVpjWS8xa3JTNk8vVHgyYjkrZW1PV2lNSzNpR0t3QkswYzli?=
 =?utf-8?B?UFBHQU9ZVDRYSWR6djZQZFhHNnBoLzYvN0JrRDk0aG5CdlFoZ2RnNWhFK2RT?=
 =?utf-8?B?RDkxakJuMlNVTkFpei9vbzB0eGpycGorM3BkZ2MyT0t1S1RPZWVNU3FJWFFt?=
 =?utf-8?B?Nk9qR3RhTDhTNG9DWUh1ZUV6K2kybWNYOUd0bWFERmlYSVZIQ2NlS2kzdWJ2?=
 =?utf-8?B?eWJiejQvSm04bnJsKzJlSWdtcHZaZmNwRWhyNVYyd1pOa0NaelA2REZDRWdU?=
 =?utf-8?B?aEdXSnlyNi93cXFQSlNKUm02ZGgyWUJjVFVvVGc3Uyt3aGpEd2hCNHdLTDcv?=
 =?utf-8?B?ZGRUU1ZHVm5jYkJRcU1ISHV5VUoremQreUFpMmVycTZuZzFqR2JYb21sRDEx?=
 =?utf-8?B?WDFmd2ZHMzVua2hiN2Z5RFpIY3hGTzQ4eUlEL0VYb3JFWHJBTjVneWRFdjRt?=
 =?utf-8?B?SkwvUkNqNVp0SkdDYzNaazMyRzUyMnZkTk1lOE5uNmtadjJvczNNTkJ5cWt3?=
 =?utf-8?B?VURlVlZKcmVPbWd3UTcybVdPWFl2c0svMVVibGpuWFpIbFVRMlFnenNGU042?=
 =?utf-8?B?SEd1NVQvMjBWTmVmeERucHJwVzNxSHBQZkVpTnU5UDBiVkxqb05TWlNqQ1Bj?=
 =?utf-8?B?SVBibGtnblUxa1N6cHdoM04zM0RiNlEyTTRLSXRQdm5xODMwbjNTNDVEM1BP?=
 =?utf-8?B?RnpiMzFac1NyVHhyRzNZaUt0bGphRmJGcnBhSFJBc0ljVmpBeVB5ZVdhOUxa?=
 =?utf-8?B?SStrNGJvOEhtWHNldTdySjhqamZCbFM0UFFTV3lxRTMzSmw4Q25Rc3QvRmll?=
 =?utf-8?B?Q3Y3Q244WXRreWxNVXRtUGt0ZFlpZ0lNaEZYb1JjdnR5cjdnR05XUnNXUFNN?=
 =?utf-8?B?eFBaL0Y3Z2dzd0FqTHBGRG9nS241NkZTZjV5NHVzZllPaWlJbGZiZC9FWGNF?=
 =?utf-8?B?Q2lnSGcydVYrUFNwUHNWOHNSZ2RVT2pxcEFrVmVIeHNaSSs3WEFuajV6bm81?=
 =?utf-8?B?bDE3MzRROXZhVUp2QkJmRVBES0w4TDVlZ1VHQ2pveE4zV0MwL3dnSWhUMG5S?=
 =?utf-8?B?czNaSForZngxZWxyblhWWkpTU3JEVWZGRUZ0eFVnekFlWUQ5Y0FRV2ttcm9j?=
 =?utf-8?B?aWRSdHJrMmovelF5SWJMcWxtUDRPWTBtVXBFUnYzQUc5MExyaE9RNWZObWRM?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3b8198-41e0-4d13-e37e-08de05e2abf1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 20:47:04.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtOATCHSHlThqPGgCHbiWOY0aJLlI3LpiwoqstPzcNWkHMO4hdjN86tk93wS3GVwFXBh28p9Uc35KTDJUAJI85Fm7mrVyVTGZr4F/owAhVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=UMLQ3Sfy c=1 sm=1 tr=0 ts=68e57c4d cx=c_pps
 a=TuoCv7SfN2yFw/uhdbj5/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8
 a=f46cGJUgtFlrsM__ty4A:9 a=QEXdDO2ut3YA:10 a=1N9iHcwoX80A:10
 a=yLXxm-r16ukA:10 a=pGLkceISAAAA:8 a=StdTn5e6Zk6IdE3NEv4A:9
 a=0vrvTjWJBtvnaDIG:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6tESz9XlV9IzrdI5S1zNDrnI0fWlYxmt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE2MCBTYWx0ZWRfX4f9P92/112F6
 Xt5EX0oLhk+WHRIgLbGAS6vi/qT/E9l5MK+AVVxdIy6BOZK0pkoXs/9PIKmH5OCsfUZb/9f+xJ1
 QIeOj60PbkMQNz6HqN2niAeFo4pL1nx+CSXib6akhbaAYo/ljxbTZrFr/tmEQ2H6gCiQ4zs1+th
 gvi6j/kq/cYbcnjpHCpXWQc4L88LCpM3DjXqiVPH6ZfLMEqmJHvgwhPt9oRPC7k0Brp/IuB+asO
 oBnwcawVs116HYKusX4SQ1G8wkVCIv3HGi1BoaIS9sN7wdogPzT37siNuS9SDCBalVuNELwwvBU
 ZgbBZNZYwwbhx1I6fYwdL7Sg+P6DfbZx8WnJI0O00nxw1uL9OuEBbwHd5PMRXT0IwzJJTJlRmkM
 pdZHIrbb3lcRsrBooma/E4QATAEBMA==
X-Proofpoint-GUID: 8yu9hZwgmvkCq1tv3d9FRBXnFpJTg4RP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2510070160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 20:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224561

--------------dOKi1Bl1fPPj0GCuwSIoQpbR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-10-07 4:39 p.m., Gyorgy Sarvari wrote:
> On 10/7/25 22:09,Randy.MacLeod@windriver.com wrote:
>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>
>> In gawk-5.2, a feature that allows gawk to preserve memory between runs:
>>     https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html
>> was added. The files that implement this, support/pma.[ch], are licensed
>> under the AGPL3 which some entities perfer to avoid. Force people to knowingly
>> opt into using this feature and license using:
>>     PACKAGECONFIG:append:pn-gawk = " pma-if-64bit"
>> where pma is an abbreviation for persistent memory allocator and the
>> "-if-64bit" suffix is a indicator to users that the feature only works
>> for 64 bit targets. Also add AGPL to LICENSE and LICENSE:${PN}, when using pma.
>>
>> Correct the license to be AGPL-3.0-or-later. There hasn't been a change in
>> the license terms, at least for main.c, haven't changed significantly in
>> the last 15 years:
>>
>> License-Update: Reflects conditional AGPL use and more as described above.
>>
>> Testing requires a non-root account and following the example in the link above:
>>    $ truncate -s <size> data.pma
>>    $ chmod 0600 data.pma
>>    $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>>    1
>>    $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>>    2
>>    $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>>    3
>>
>> This works on qemu[x86-|arm|riscv]64 but not on qemu[arm|x86] where the
>> --enable-pma is ignored because there is a requirement and build-time test
>> for 8 byte void pointers in m4/pma.m4:
>>    if test "$SKIP_PERSIST_MALLOC" = no && test $ac_cv_sizeof_void_p -eq 8
>>
>> Finally, remove an old comment about GPLv2, GPLv3 versions of gawk
>> since this is no longer important as the GPLv2 version is not maintained.
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> ---
>>   meta/recipes-extended/gawk/gawk_5.3.2.bb | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
>> index 833fe78bf9..ffaef93e8a 100644
>> --- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
>> +++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
>> @@ -6,14 +6,21 @@ HOMEPAGE ="https://www.gnu.org/software/gawk/"
>>   BUGTRACKER  ="bug-gawk@gnu.org"
>>   SECTION = "console/utils"
>>   
>> -# gawk <= 3.1.5: GPL-2.0-only
>> -# gawk >= 3.1.6: GPL-3.0-only
>> -LICENSE = "GPL-3.0-only"
>> -LIC_FILES_CHKSUM ="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> +LICENSE = "GPL-3.0-or-later & AGPL-3.0-or-later"
>> +LIC_FILES_CHKSUM ="file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \ + 
>> file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 
>> \ + 
>> file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19"
>> +
>> +LICENSE:${PN} = "GPL-3.0-or-later"
>> +LICENSE${PN}:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma-if-64bit', ' & AGPL-3.0-or-later', '', d)}"
> Thanks, but this has the same typo :)

Sorry, I missed the commit step!

v6, FTW sent.

../Randy

>
>>   
>>   PACKAGECONFIG ??= "readline mpfr"
>>   PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>>   PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
>> +# pma: persistent memory allocator:
>> +# Disabled by default due to AGPL license.
>> +# Note that PMA works only for 64-bit targets and is automatically disabled at configure time otherwise.
>> +PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
>>   
>>   SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>>              file://run-ptest \


-- 
# Randy MacLeod
# Wind River Linux

--------------dOKi1Bl1fPPj0GCuwSIoQpbR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-10-07 4:39 p.m., Gyorgy Sarvari
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:f733467a-2cbb-4cb2-976c-2ce06da28737@gmail.com">
      <pre wrap="" class="moz-quote-pre">On 10/7/25 22:09, <a class="moz-txt-link-abbreviated" href="mailto:Randy.MacLeod@windriver.com">Randy.MacLeod@windriver.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

In gawk-5.2, a feature that allows gawk to preserve memory between runs:
   <a class="moz-txt-link-freetext" href="https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html">https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html</a>
was added. The files that implement this, support/pma.[ch], are licensed
under the AGPL3 which some entities perfer to avoid. Force people to knowingly
opt into using this feature and license using:
   PACKAGECONFIG:append:pn-gawk = &quot; pma-if-64bit&quot;
where pma is an abbreviation for persistent memory allocator and the
&quot;-if-64bit&quot; suffix is a indicator to users that the feature only works
for 64 bit targets. Also add AGPL to LICENSE and LICENSE:${PN}, when using pma.

Correct the license to be AGPL-3.0-or-later. There hasn't been a change in
the license terms, at least for main.c, haven't changed significantly in
the last 15 years:

License-Update: Reflects conditional AGPL use and more as described above.

Testing requires a non-root account and following the example in the link above:
  $ truncate -s &lt;size&gt; data.pma
  $ chmod 0600 data.pma
  $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
  1
  $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
  2
  $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
  3

This works on qemu[x86-|arm|riscv]64 but not on qemu[arm|x86] where the
--enable-pma is ignored because there is a requirement and build-time test
for 8 byte void pointers in m4/pma.m4:
  if test &quot;$SKIP_PERSIST_MALLOC&quot; = no &amp;&amp; test $ac_cv_sizeof_void_p -eq 8

Finally, remove an old comment about GPLv2, GPLv3 versions of gawk
since this is no longer important as the GPLv2 version is not maintained.

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 meta/recipes-extended/gawk/gawk_5.3.2.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
index 833fe78bf9..ffaef93e8a 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
@@ -6,14 +6,21 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.gnu.org/software/gawk/">&quot;https://www.gnu.org/software/gawk/&quot;</a>
 BUGTRACKER  = <a class="moz-txt-link-rfc2396E" href="mailto:bug-gawk@gnu.org">&quot;bug-gawk@gnu.org&quot;</a>
 SECTION = &quot;console/utils&quot;
 
-# gawk &lt;= 3.1.5: GPL-2.0-only
-# gawk &gt;= 3.1.6: GPL-3.0-only
-LICENSE = &quot;GPL-3.0-only&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
+LICENSE = &quot;GPL-3.0-or-later &amp; AGPL-3.0-or-later&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504\+file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19\+file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 \
+                    file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19&quot;</a>
+
+LICENSE:${PN} = &quot;GPL-3.0-or-later&quot;
+LICENSE${PN}:append = &quot; ${@bb.utils.contains('PACKAGECONFIG', 'pma-if-64bit', ' &amp; AGPL-3.0-or-later', '', d)}&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Thanks, but this has the same typo :)</pre>
    </blockquote>
    <p>Sorry, I missed the commit step!</p>
    <p>v6, FTW sent.</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:f733467a-2cbb-4cb2-976c-2ce06da28737@gmail.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 PACKAGECONFIG ??= &quot;readline mpfr&quot;
 PACKAGECONFIG[readline] = &quot;--with-readline,--without-readline,readline&quot;
 PACKAGECONFIG[mpfr] = &quot;--with-mpfr,--without-mpfr, mpfr&quot;
+# pma: persistent memory allocator:
+# Disabled by default due to AGPL license.
+# Note that PMA works only for 64-bit targets and is automatically disabled at configure time otherwise.
+PACKAGECONFIG[pma-if-64bit] = &quot;--enable-pma,--disable-pma, &quot;
 
 SRC_URI = &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------dOKi1Bl1fPPj0GCuwSIoQpbR--

