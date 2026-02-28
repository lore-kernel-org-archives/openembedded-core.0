Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA40FEE4C2
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 03:53:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.113467.1772250827921415262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 19:53:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f/Zo5GhO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6519ba32ce=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S2wnDp629679
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 19:53:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aDYlMt/qq0CMcLgm45JeEyPyq8avr0oO9oIscoYXfK0=; b=
	f/Zo5GhOzU4tXe+WUjT9FWKTL7/q8/K1FPyF+Qzkb6cdZoCvlzwFiC+slaKWBH97
	K1WnMthDSedWeOIjAidMY0YUFOeHAQOg5uMi7w4P+kcz2o2Y9yzeDJBqgAK0GOyq
	9vx+HuUGh4aBKI29Uv0JtcuDbd8LbNCi3RIVpfSf0xHfFCFgU8yywCGAgsYc2+Ad
	MlZGeQpTnVB4szIWxKKxnSqa0T+9sUsrKeUG52gHzl/uiU/+WHcJwlAs4EH+m0Mv
	BJ06G38Qyt5oan6da8epdnbXnZ9+YULhlnSSFaCr8hCLHoPTYWI1EhULt79TDndx
	HScZM3Yve9qeGka9JfA0ZA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010062.outbound.protection.outlook.com [40.93.198.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2ttfr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 19:53:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNhJXXlfpXKgT68cVW7rmkJrRzHbSUfrMA+aze9UHsP6et7dy8XAx/5KbxYIeDRKsL5/7P6kIo3kqaWU12UOfve98eIKpRsMIaRC8R9NCcmiONDMDSEpHnUprwEB1GQfNJHnwJRfBaRUyMRDtxHZccabI9MWD9z3jegmCwgGpm4s6ny1BO36pFACaiobnAq9tGAIuLvQRhyJQ/hVKEB+HuVoVjNWQkLlTzd7mwVvd8SyC8/yzP1kZCd86rQTYRXXq7+YLlgsXT+U8p9WLjlKZuZkC0svvwPJOr2sghiXmL1ItXcbxTvHLscPHska5miNk2oe7eIPjD8YP35Hko+oTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDYlMt/qq0CMcLgm45JeEyPyq8avr0oO9oIscoYXfK0=;
 b=SjLlpijm5f0m8jECCi/8nW7r57bG+bcVtdiZuLv8op0H2ZIstkuK2CUwUewsFVAwm0suAsoZiKPUFPaKr4DVWBKUZ99LsiN2L+h6UM3vSF1zfG3u0WHBV0O2D4319u/+lyQQxu9ScbeqZVisttmG9CGk6meRKMtduK86pgtRzM3DOyrg0II/EQxNs9Ed92qPJ5dSE+txR0IMyFEITxaJuKmX4RzYfc/J9ZznUKmFUsrQwmwtolL/RsjQEZJ/RdwwdoiGPFM5pJ08CwBdQ0yYVcp04+3NDZpmKnU08GJQo7+fLStE/ZXCbsYBbr9KFp1g0hKP6bbylCYJzHOOVi25+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA3PR11MB8940.namprd11.prod.outlook.com (2603:10b6:208:57e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Sat, 28 Feb
 2026 03:53:45 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 03:53:45 +0000
Message-ID: <9ec2a6d2-a03a-4a30-9490-10e0fe7cc5e1@windriver.com>
Date: Sat, 28 Feb 2026 11:53:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 0/7] rpm: 4.20.1 -> 6.0.1
To: mathieu.dubois-briand@bootlin.com, alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <cover.1771409846.git.liezhi.yang@windriver.com>
 <DGIA0D4P60DI.1CA8PWS58YCCF@bootlin.com>
 <212e8187-1b6f-4c2c-8d57-97cc66387c56@windriver.com>
 <DGKMRZ496JHU.1T1MJETE5VNUN@bootlin.com>
 <CANNYZj9DHuV3rmaAsZsPcbZ2ZsbMrNe+keNgVazav=3hUnYQKQ@mail.gmail.com>
 <DGMFHKEHBIY4.24DUCLY3ZXN7N@bootlin.com>
 <01d72b81-ac28-409a-abea-99671fd3b214@windriver.com>
 <DGPMPU6AOIVH.3E9XQEJBJMTZV@bootlin.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DGPMPU6AOIVH.3E9XQEJBJMTZV@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0097.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::16) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA3PR11MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef47fcc-7eb2-4586-feab-08de767cf846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	hMuqZvHhqBlQUDFbbXnJZ0abDIrOLdYWRcpa00/aZWj3HsXA2Zrh808TRR9Vp9WEVAwuoONps5HHHqckcu+/9XscEj59gVyNROQvZ/GmSqIw0HuO8brm4xOvjnefWaYVoqgKMHydrYpQ61o62+zZ3kyvf3kism7DBs49hFASfVf5H6byggzzFWa7cTG1vXVM5KRQwHDl6HCVrvVmqHPXSvo/GO1Hp73+/ZzpiyGSyBN1wzZzHNGtGOd/6ZO3BB+21ByPybd1RlAdQIuk3WmRwKHAhyzKMTe1q9Kvw8Xziigb/6UeiThsDBahce1bZl673Rg6SYmMI2D67mRveOkmR2t3+Rw86dRlslM+1HfOVnn6YACDWtxfNFD8F9W6RVGRgfjHC1DdkAi9FLJyFl6c867AYwTLVFQQMk/anTt1cGDAYSF8MlWpHzHcNaow5UaW1YaCOMyPT1fgPNVS0wvNC7nA0leYBaVqCx+ahDl4Y/6vXVJNmI4tuKSemcad2QnS+DWoE6MirpkCayRk7vkZmzOYduVgesdg89hEx1Va8Jmw0MyjJss8FBfIeNXh4PJDYol+q5odgKrifSpTnRKtdBh2URkCzvOj7NuBk2v2ych08dEIu3LyMgr6vT2nwV9A9fY86/tcfYWknjj674+rmPuLIY65iw+znWfaFgWJRtrpiJuKYjnu2x6DVu7IHCOS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bktIREQ0OXJuK3hyNndHZDN3NTlkUkVPVHdhb3hOOVd1cmVoOWR3dnl1SDkw?=
 =?utf-8?B?OEt3Yjd5SHZXVTcxSi9Zd2FDWFduaFkvY21ya2dOTy9CSVJXTk5aTldxSk81?=
 =?utf-8?B?V1U5Z3FsMjRPaTNvQm40SDhING5UQ1BEVXIwRzJmUnJPMVVKbTdCUlRjRjY4?=
 =?utf-8?B?eWtFRXhCdG1HOEZzTmtaUU5qV0g3ejdZMkhqdmJYK0ZtMVZPSUVmU0p6Wld6?=
 =?utf-8?B?TnBSYndsUlpEeld4bmRIQnNlQXNXNVdydG1TK3lxQWNZTjhlVFFhNnlEd0dt?=
 =?utf-8?B?WFRBZ21RUjR6R3IwaW80SGJCck1UUzhtOVVuOGhFZWpVdDJYcUN0eGVXN29t?=
 =?utf-8?B?c0J6M2pwNnRMbWRIR3VMeWFWZ3RqWVV4U2p1S1dBNjBtT3dTU2NMdUtGc3VM?=
 =?utf-8?B?MTRZbDVkZW4rSGErQWhTRzMwVmN4YnhmbmpDTXhSOE52dFBzdTJnbE9yOW1w?=
 =?utf-8?B?Nk5xYktOZWFDVUtzb1VmeFMrN3BocHBBR2ZIdmYzUkVBdUJQQUtHampZeFlC?=
 =?utf-8?B?elZiaFlQVGtaVms0Ym1hdkFOYXAvSlBKSzE5c0ZHTGJ2b1dBSVNIZlQ3SU1R?=
 =?utf-8?B?amhNVFIzRGtqU2RKMkRIOUMyMUhpNGtUeHl2Y3U3dVhEVmVQa1hiZDcvZXZP?=
 =?utf-8?B?L3N3WmlFVTN5L1VRVlNXYUZnOFhtQmNmZGZuTlM2d3lkd2JPcjZlRG9GUUda?=
 =?utf-8?B?SUcwYk9nWmtoSTlQQWpjUU1tTlZNTGViRnFuYU9TOG5ISmVjOVlWM1pRV0I3?=
 =?utf-8?B?YmhreTVVS200cEVVSFd4NnBlR1V5MGhVa3BFZUpkLzU4UXVpTmtpNmRFSGUv?=
 =?utf-8?B?a1dXbEl3Z2Y4WDNUaUVZbTlnU25SSjBiV0E1b2lML3FlRVlsTzhOdHZabEIy?=
 =?utf-8?B?bFU1Q0FuenZJb21aWGQ4cTJCOFVSWng2WjhBTFlKVUVaZ01pZS9xSzM1YVpV?=
 =?utf-8?B?ZW5QYzgzZVVUNno1cmRTKzE4NjRRRkgzQVEyUlZaTTRycFpCNlVGMHhkQjN0?=
 =?utf-8?B?WHZqZHM1MjFlbmliaWZ6MDhjLzZzMUdCZlovelVlUjBWdDR6QmRtcGhOU2hU?=
 =?utf-8?B?ZVgySWoyc3FZbXljZW5qS1NNNnErcGVDM2FWeTZwMGlPelpzRnJ2TFVKNkRt?=
 =?utf-8?B?MVhkZVMwSDlGVVNjcWlNb0ozRXpPWjZVeE4xYjQxZStGaEtlZ0lxeFBJVGlX?=
 =?utf-8?B?S3F3Q3hmM1JTZlVJVFVrSVRCNlQ0cXVhc0JRK3c5NUNiSkw3djh1VnRXQ200?=
 =?utf-8?B?Q0k1cVdOODExaEF2THF2aXVYUkxQcDhQNElXbVBnaS9lVW5jUm9YTnhOM2R3?=
 =?utf-8?B?WlNwNjhIeDBSTEhuMmtXNFJPbzUwbkpVRmRzcG9iSTZhNHdaNWFZV25wNkJh?=
 =?utf-8?B?SzNvdVUrak9rZ3g5UE1qRENkdGhuUlB6L2thWXQvQUpxS1ZTa2dkaTN4cVZ0?=
 =?utf-8?B?OXg4SHN0RTRneWpRWHdONHVVbzl5WkhqVzBpMEhiWGpRczdlZzc2ZUVUN3d4?=
 =?utf-8?B?MmxpclNYOVdJWlhUUUpacWw2d0NEbnlaYUNEVHJvRWNXdkFpSE05TzhPaFJn?=
 =?utf-8?B?M3hVU1cydEFjK2RLbUEzSm01bVFtbWsraVB6eVFhWmQ2R0JpK1M0cmxDSHE3?=
 =?utf-8?B?S2p5QXhwUmcvckQ4TTBPa1pxejMzMElUMDUvU3UwVzBDaEtmcHIrRFExRmhi?=
 =?utf-8?B?aVJaNm1WYWNjRVhsR1NveC9VSE5aTUJJTWxFMnBhYWk0YXIrWmZKb29JMEtG?=
 =?utf-8?B?aHRENUFJdE5UMTZUbzZVNnU0ZkY3WUs2QVA5dlZaL082b2F2NkM3MEE0czdZ?=
 =?utf-8?B?TlNkZCtBaXBNRXpaanRRSHVrNHB2YlVYclZ0ZkFQR0Z4dG1aekplM3VZT1Vx?=
 =?utf-8?B?YjIxZzlaZVpFZ2F3Rm5reFZ3N1M3VGpaVkFMVS9XUmJ6T2E3SVZVaGVmZURO?=
 =?utf-8?B?YTd3S2V2ZHdMRmFTWng2UXVSSSt1VFI3dGtwTTNKTk9BN3RTQVRxblg0NytQ?=
 =?utf-8?B?c1FKalFqbWNqZmxaVVNSZlhCTGxUT0RtY1ZLUHJwclptSVRIbHgzOVhjWURj?=
 =?utf-8?B?TEZpRXRPZlF2Q2U5ZEtoajR0bFJhQ1RQZmNCT0I0WHMzS1VKSFpRaFNXcmo5?=
 =?utf-8?B?UkNCZVJsSm8zZWl1eXBhSnVrWURsQ25HSWthOFRiMDdrRTBwVm9STU0xTGsy?=
 =?utf-8?B?NEFkS3I5ZXlZKytld3NNSUxjN1kzVnhrK2F1dmNTSFlnNkFpVWZpd2Z4Yy9i?=
 =?utf-8?B?bWJxTFZHU3ErdU9sUFNhUG9QSktkUmZzYXVxRHJza1lHbVQzTjBIYXkrWU4w?=
 =?utf-8?B?NFg1UjJGTzlsb3FQUllpZTRMaEpzWUFxREtlWnlBd0U2cGdtWnhSZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef47fcc-7eb2-4586-feab-08de767cf846
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 03:53:45.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBm1sp4iKo8HchH2qi6+DmJWZx/3pN1qwwHEBZN1f4DrNwCd0K8WT35NfS8YSoJdnM/HsLCeYrs6xwx10KPF07RWDiNsTgxvYYO8iYoJRGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8940
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAzMiBTYWx0ZWRfX8zThgjpfSAAD
 g98/9kbsDMq/s15ccGjNphFBPL+xvxoZXqPSO/iM7qvUpU8Z6dpsRs73Tzjr1gthtwp9RG0OaB+
 FeTK2+1D+d9UY15rmzjBfdEdfXM8u1x2oX6W1YEn62kZuOS7TtwTKsZUGdDPR/C1MvJpYzmHuNg
 0qAuypf2H/qlRWSIM+cOmwZfsF8NufU1Y7ooQDHeIQjTadrBgDpDppqoisMtw1+WJwtr5iYBKV/
 p57pv2L1SYA2O9bSmWN+VaS7dRhuaQErdscnPRtUI2eHKew1AnYN6Zjjck32zzUVWnjxQw8P08j
 BX1gPUVLG0d56pGjDemXpONbkj+hT0JaH5nRPv1vYGu+5GUeovMYFVBKI7QRNQiX/YKtO2lwlEl
 qdWxYGc8hr5tl2pIDEeCP87KjG6HnOdh+AQwBVYNjfjVpAqBkQHsWNRodUjXy+uIiWb5SVTaCYx
 HCxDlZOSrGy6Oswiy7A==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=69a266cb cx=c_pps
 a=zLPr+aUDpHWP/LWwllnpHg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=EMtiPnnAT5rBZVKP-ScA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OYZq5ww7GvCY-gfYxji5UUI2AWtvUQxM
X-Proofpoint-GUID: sH82Xc8bMb1wIHhOeVsHnaS3Raxrt5nT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 03:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232124

Hi Mathieu,

On 2/27/26 17:16, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Thu Feb 26, 2026 at 5:00 PM CET, Robert Yang wrote:
>>
>> Sorry, but I still can't reproduce it, would you please help to try:
>>
>> $ git fetch https://github.com/robertlinux/yocto rbt/rpm
>> $ git merge FETCH_HEAD
>> $ . oe-init-build-env ../../build
>> Add the following lines to conf/local.conf:
>> PACKAGE_CLASSES = "package_rpm"
>> OE_FRAGMENTS += 'machine/qemux86 distro/poky'
>> OE_FRAGMENTS += 'core/yocto-autobuilder/autobuilder'
>>
>> $ bitbake core-image-sato -cpopulate_sdk
>>
>> I checked the manifest file, the error packages were installed correctly.
>>
>> Would you please help to send me the error build's conf/local.conf and
>> conf/bblayers.conf?
>>
>> // Robert
>>
>>>
>>> Thanks,
>>> Mathieu
>>>
> 
> Hi Robert,
> 
> I did reproduce this again, here are as much data as possible about my
> build setup:
> 
> - I'm using an ubuntu 24.04 docker.

Thank you very much for your kindly help, at last, I can reproduce the errors
with pkg-config installed on ubuntu 24.04 (Can't reproduce on ubuntu 22.04),
there are host contamination issues. I will fix that.

// Robert

> - oe-core version: either your rbt/rpm branch or
>    oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3239 from
>    poky-ci-archive [1].
> - bitbake version: either today master branch or
>    bitbake/autobuilder.yoctoproject.org/valkyrie/a-full-3239 from
>    poky-ci-archive.
> - meta-yocto version: today master branch.
> - Attached configuration.
> 
> You will need to adapt my configuration, at least to fix layer paths and
> DL_DIR / SSTATE_DIR.
> 
> [1] : https://git.yoctoproject.org/poky-ci-archive
> 
> Thanks,
> Mathieu
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232089): https://lists.openembedded.org/g/openembedded-core/message/232089
> Mute This Topic: https://lists.openembedded.org/mt/117873427/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


