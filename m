Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10324C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 14:46:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1711.1784731562836858160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 07:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=oXHZHv2O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16630aa996=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDijsd1242127
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 14:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=H8OycGMuGzbwQ61f+KvYY/
	MbAbdFAOF3wHR900iLue0=; b=oXHZHv2ObLZvDiDZSCgSUY8Ng2bIpm2RGwrSHI
	Sv+/QTg2drrc9kkUQUE1RjVOuoLvntgVBC+rV3d7uH7KTY2cBZGdGye451cPx27r
	LJ2+Lch/cdAbgHj/cmzsyFDzGqq26vzQQoXbOPMbDCvsiAAWnSPc6w/ICq5VpJaU
	g7SNIllzx52dAKpLp4W5lEHxegEt+dWkoJvcVmK9B9zEfKiyF3ShfnAV6znUivQ4
	rFGrLXvfyxHU5vXPjVKQNMc2lDO7AMyR5QsgaRWT3ZvpdzWPiaag9YZtNlBiTm9g
	UJtZ2Qmuj3pYaoGOIN52GjC4PrxNdlLAp+XDsat710DKxTWA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fga8x83ea-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 14:46:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INeMoJVJuUkATLu83Ga5kD5PsietLZOf5nFtBiz2aPuOVdgHgg3v7G58uM+2rDadnMo/Xnt4GhYGuWSh6nj7illge3JXQzUgOHIOvuAkNukzlLENYBoRT98xmsFwERgYoIQS9UNfVp1dUqGZ9zHw+J1JosBMlB4ucFqpADKM79XTN01IQarpi8K8d6mQkWK0MGhyvyt0Ne+SiORv6VCfrRJoLx9qOskbMyNhdwWKk7zH7NNdLiBVOrJBlSbY/c2/2ZIykpyiH8UuotI2E/1oJafpySaU4ToXlI+0lCGI1gLBQgIVfv1tOQdM+h4bA+68UU4ZSVuOC2V0AYUdVo4yRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8OycGMuGzbwQ61f+KvYY/MbAbdFAOF3wHR900iLue0=;
 b=XK671rDGiTjekWR5Do9Qu4LQlk75jJQFMk3aToQe3vPGWEe8DdwgURBFAuvokQfwGYqJhqT0a5KcDfY6FnUJx1wC9DEEotLhzSJHGT6fN02Fcx3zoDUrvQAqrwfPpQGOxXlPIxSZCfF1VSd+Zlrn+A6sTx5ukJ05fW1khmFxVfiz6AoNfqZI+q2NNk2fDQm93o0jjh+mv/k8kpUMAAy5N3zvWuBu3SEHPm6ydMlPTCMSr1Mty2zgnfvdy5sN0MftBBHxmK+aKhJyWZRhDHuRORbCwcD227BYYH8Eh/3geD/tIBw2AessnLVZmK2tkhVkXiXWWvJqhFpLGlWOX2HfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 14:45:57 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 14:45:57 +0000
Content-Type: multipart/alternative;
 boundary="------------TkhJXLZsyErZRrNyCvfKsh2G"
Message-ID: <2c3d1180-5390-4a4a-af2b-39f1bc78c385@windriver.com>
Date: Wed, 22 Jul 2026 10:45:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] linux-yocto CVEs in need of triage
To: yocto@lists.yoctoproject.org, paul@pbarker.dev,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        linux-yocto@lists.yoctoproject.org,
        "Navuduri, Venkata" <Venkata.Navuduri@windriver.com>
References: <4ac849a706feb16688020d5bcc3e74aececd63cf.camel@pbarker.dev>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
Cc: Dmitriy Korovkin <dmitriy.korovkin@windriver.com>
In-Reply-To: <4ac849a706feb16688020d5bcc3e74aececd63cf.camel@pbarker.dev>
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4fb904-a5c7-40e2-04a0-08dee7fff044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|23010399003|1800799024|11063799006|56012099006|10067099003|8096899003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Rcg2SQ5FZROUbTQ6/cW91jeXHZvcIerdITkCZuiHGNFGypNsiUXMRtRxFxsR3552PnqWmbFDyclIYu41wTT5+J6sSnky7sofdWDTMh8UlJUAl234ZLykl2VwtmqCMtuHWvnxb696tsdAARqUUeTEUvEhOMb3L+qGMn/cS6jSFriqkQuZbZG/iWj1tGpNwcyXdKDsSWoBSsMSDKbKJpuKuOWYEHdfLj4R/FAAsqQ+D49ada2qG/j4ezU13WbRBZZ0MB67SDxF7Hvu0FmlX8k/WO4GtkCZgTfZXtBcZHVm3eaD9N/+5k4OOfST2v4Aly2vvyG+Zmkt9/3aqMPlelRwrzBp5CEYGNB9DBUmaomAHVWMsL9uZn0QYzMqM3vrowd3OPvRh5yJzoF0366Qft8j3mHbA+XEOYZaPSJ0d+/K4uv0skkNoA7NmdZCh8LpTPJi+BDtVlSacWvQRCw+5MaImoxhZtWQx+qZBxYZQ+Fk8qu/v9g2X/ipHVCsi3yJYnJGyqLdE14bLlzZK6941yODqkyJfs59dr/ZbwWvLvjuPZhmF1tJP9IbaO1Of31Hj9AH607QJXXg/2CT1SDLJEgsLYhdzYN+956wBu68MJjLoG3o95xxE4eI+8Z1Luv2Jq+e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(8096899003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0o3ZDlHenVMeWk3eWVhQ0VDZ0hyakE4aXo4Y3k2MFltcURGNE1uKzdoRHRt?=
 =?utf-8?B?VWNEZVBNZHJYRGZiOWJNcFN1THFla1VwdlRNNFRhY3ZGcHozemliMXZmcGF2?=
 =?utf-8?B?cFdMbVhVRVh1MHR5REkvY0dmWXhvUGtOMUlEWFRBRnpiTmxtV09lOG5iMnI4?=
 =?utf-8?B?dVpVWitiMWpzTTlGNzczZEVReW4xTHpvaVpYMUpaREdaZ2l4TmgxV3ByRENz?=
 =?utf-8?B?T01OWHNlZCtmMVJJOUt0Rit0K25yaW9sRFFxSnYwQmp5ek13UzlXanJzc1RF?=
 =?utf-8?B?Sy9NN1N5dForMUhDb1FmY1NpdVJkUjJQcWdya0VBTmRrSldWY09Gd0ltcW10?=
 =?utf-8?B?K2RpQ1ZsNzEzWHVod0dtVHZOVFRHdnlPQjd3RDhzS2Z1Q2xOeEx1ajBkLzR1?=
 =?utf-8?B?aE01Y1A0RFpyVUh6eW1ITjBkb3BWSGdRMmowMnViWUo3Q2ZPMHZuNjZybmRl?=
 =?utf-8?B?ZTQydzRUdkM5VlJBL0xPMmd6RUV4ZXliWFFVL0JpeDhWU2g0UVdpZUk3aG9z?=
 =?utf-8?B?cHhFcHluNHRWWVNyU3hBOUxXbUFRK2RnVWdUQVBvVnA3TlhQWkhBRU9MWlVs?=
 =?utf-8?B?SGN5VzVUTGdaMXUwMlBiSjRidWlZaXMwRFFnWEhpZHZPS3JyOXhIS0JBaGds?=
 =?utf-8?B?VHdFODJOYlVJeU5CZmswRVFiMDJkQVlITUF0Y3d5R2pZYm9aUDgwZk1KVjh0?=
 =?utf-8?B?NFVrV1Z3Yi9KVnl4bzl4SXJZMkZXeFJZc0lzTUFXSjU4UW1GQ1dEYkpGNlJQ?=
 =?utf-8?B?RVVrOVR4THpIMTltdDZmQWtWU1NUTkVPVEk2UHV6NzJzVDIyekhaNmJQS0x2?=
 =?utf-8?B?MVpwRCsyWHJFQ3N6YW51alkvb09CSFM3eWFCWnlaZHZ6N3ZIQjFlLy9qVFpN?=
 =?utf-8?B?UDd2VlZ5c0psQm5VZ1JlTEQ2VFpOVzFWNVUwWGVIdW1VQ2hMRmtJaTlONmpj?=
 =?utf-8?B?MHhnUWRlbUEzazlhSWgxdkRjSDFxV3JuOWdTSkRwYS9OWmkwUTFqWnFrT3lG?=
 =?utf-8?B?Rlo1cStQdUp4RUVIR3FuYlU4YnpKWTZGenFVRk0vVmpGaVEzWjl2Ui9TZDBN?=
 =?utf-8?B?S01lN3ZDV29ZWVBTei9BWnN4RHd6anlYRWg0aWJHTE8yL0xRcm9LbUFtTzJL?=
 =?utf-8?B?dTFtRjF6YytJRTdpcUpVNVFrQW9HaTRVU0NlQXpvTjRTdjlRWHZxNG5JcDAz?=
 =?utf-8?B?b3BUNmoycWdkTzZHOVZnZWJ2aTRwbGpMbVZ6OHIzRUxTVWdiakJKZGZMYllJ?=
 =?utf-8?B?QUpSdkhyeVdsVDhZaXBwNmdRNysydjdxcUJKOTU3S3VVTFdRaHZpKzBna2Zy?=
 =?utf-8?B?SlhFYlhEaWx0UUprZmZjdHFvMHNTL3NuNiswKysyQVAxQjRsYUgwRk1VUVBa?=
 =?utf-8?B?Ym9sWVNFVFE2VDVYU1FWUktZZVhNSXkrdHROSFNsK0FIQUNJVUErZ3dHUFpW?=
 =?utf-8?B?TXczM0VIVHkxODlxQmp5R3NPN2MyUE9Uc0xMa21iY2RMb0ZuYmo5OWVmeFYy?=
 =?utf-8?B?ZXVUVDA0Mk5yaWVQRnA4MWhFekg2VWV6STZsYzNVNUdscGVCM2tXSUN1NUgx?=
 =?utf-8?B?NHpBV3d0dkpxcUs4bVM5SjM2bHZnZkRORnk4QzI4YzkyZitQcEhacXJycFk1?=
 =?utf-8?B?aVk0MHhEUkhYdVYwNm5CMDRKL1N2YVJYTzRSNGJGTFFIN1hIalp0VGs0bGwx?=
 =?utf-8?B?RktXcndNUUdtWHMxT1BqUG5QUnhqR3g5a2s5RjZBMnJvVEpHYW5La2x3cDFZ?=
 =?utf-8?B?RjNyL1lKRExjZkdMNjFzamJhc1ljR1pnNDcrdGRWWXgzV0toZU9xQ0E3djN0?=
 =?utf-8?B?VFEyV2QrU1FnRk9HUFhOcGw1Tk5wL05Cc0syZU1aakhhOGpBNmhSejhuZElw?=
 =?utf-8?B?ZDlteDhCRHRDMVlDRG9LdEM3Q2FjSXZURTZJTWUzbXN4MUlGcFJrdCsvaFQx?=
 =?utf-8?B?VWlwaEhONy84ZURGSGtLK2cvaVNINHhpWFJzU1pDY251M1hXcENON2M3YXRv?=
 =?utf-8?B?ektHNEFIOWVYNmh2cVo5OCtzTEhnU0R2ejhHbERPd2dIaFA3WlhkbTc5OWd2?=
 =?utf-8?B?Si9XU0Vxd1JLZXBSNlZ2d1BzY29tYUtYK1pnb0VHRzJCM2ViejhYNlNZeXZi?=
 =?utf-8?B?Y3U2VXdqNm9iVlB4Zlc4Y0F0OXY5YmJBUm4wVmgvN05PWUZwTjluZm0vaWdn?=
 =?utf-8?B?ak1ON1VhQWpRdTFzMXVlNUFGdk5mcUNvYkxENkVrL0RFOEFTRUNJSVl6dFIr?=
 =?utf-8?B?dzNGQXlwUHlsT3c2ZGQySU8zV3pheGFCY25kT3dPTVRGRkZ5MVZQN2JWWjg5?=
 =?utf-8?B?WVV2SEJZRHp6b0hGNnpGZk1MbzdnRnJnb1FiWVM4MkdsbkRvNEREZXFMZ3M5?=
 =?utf-8?Q?RtMX0xOolQdvThqk=3D?=
X-Exchange-RoutingPolicyChecked: 
	f6M880YUEh3ljZtwPfaXzwwEB+am10dVcHSy5kjRrEhjRjGwVLtKFRyUtFUrfR43560Nu8C3ZGPvr9FAJ//qIFJtjZrrL9RMVkBpBwI2vw5xwm6qvZNyBebvR9sdaHfXkRb2Mdu+DS11CB/4Q+bm+e4xgnoYB+FXdaRkLupFLtpXbEjRQiaqJdXYqOyhNDjtWJEqZrkDWN5zygIQYsJ+G6Pq9qwNbrOtEr3bs/RbbGAUVfNOyc02NMbiCYEOKMSPNjHK7jbDrWQtUk9+XlF2+0hvTR7LbPU1sTiHWwSuZsxw2W4CDQvPCtXZHsbHyhuewrb8tJXLQP6CtGfEdVsvuA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4fb904-a5c7-40e2-04a0-08dee7fff044
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 14:45:56.9194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye3WVFiYFFUGetAJfu5jGAXscGiv5CmSGRl7w1YNsYu23ReARLge8iyzoNZv8rTc1Rzp1Jw41cskiDm1M9MTRoT+u/mPLbGPrz8Vhwd88ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0NCBTYWx0ZWRfX/fVUKfBCqZdB
 KeKaUIEXJh6uOf8+cacVkBnLLqjlQiBCXZ6gn2yEpxgciAQFyDXR91Z9LlhxBg16JlLelVTQSA8
 smlzjvt+Bq8nRz5i3IpoC4wIGdiLeBzclBtFaGAd1gDOd+VotIWM
X-Proofpoint-GUID: nMh59hhl3sZgZxKRZdTIQZ0Mi6Hlm-bd
X-Proofpoint-ORIG-GUID: vbXpdaCaxquBr01_uYVAenDbud9QrpRv
X-Authority-Analysis: v=2.4 cv=XdO5Co55 c=1 sm=1 tr=0 ts=6a60d7a9 cx=c_pps
 a=Z+ESqgFbrcYkgT1kPBc/rQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=lOA4Tsq15FW4ftcsoVgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Mu_aR4gVCO2T_TqR5QQA:9 a=iFN-tqU-n73PPs_k:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0NCBTYWx0ZWRfX4Vv+rwWEsgK8
 jxSgwSUsNd9vel7Jy+Exl0tq0N5d7qge8Z3aqNq3xeG2hJqGWAjWKWVe0ur0co/irv/TFS26vr9
 fcUKK9d0WAqmPIhvyrAS7IVvBzY8SRG6hTVTApJCfs3FOA6nUY6js+Dg0WLH13NgXwy4UX3bKVE
 FmwIl5wmzx86I+lsxgWfKQL2XullcF9GvqhYuF/v5hOBiHqw0X1i8/ylqdwM4i/1r7MbVfmxnyn
 RSq5NRQTyKfdbO6LHKnZYcgwFdDrk0v7D2Bwt1aUHnrPO5eGwMpQ3r3Vv/zYFa8O+YRC/PrQ9Z9
 UOvtwMWkdl8bGsTD/GD9raU5fqGViFN/tAvsqT/hHY+AzB949Yekx26N61T/pjcPOrsHTEV7MlT
 56F5/PiyM0FHAiT0/cs7KPcPOoDhpX7ujwren8GCQAZgCJ9Ew5zqeELE0nUqMPisyoPkFsuMs1W
 SS2naar4WzJx7JyiLXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 14:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241697

--------------TkhJXLZsyErZRrNyCvfKsh2G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 66MDijsd1242127

On 2026-06-29 15:33, Paul Barker via lists.yoctoproject.org wrote:
> Hi all,
>
> We would appreciate help triaging the following CVEs filed against the
> Linux Kernel, which therefore affect linux-yocto.
>
> Each of these is missing an upstream fix version in the CVE data, so
> they show as unresolved in our CVE metrics. However, they may well be
> fixed already in the kernel versions that we ship. So we need some help
> to determine the appropriate upstream fix versions.
>
> For each CVE, at a minimum we need to know if they are resolved in the
> mainline kernel, and if so then which release they were resolved in. A
> pointer to the exact upstream commit resolving the issue would be
> preferred. This may involve a bit of investigation, so please share the
> information you find that proves that a CVE is resolved in a particular
> kernel version.
>
> Once you've investigated a particular CVE, if it is resolved upstream
> then please send a patch to update the linux-yocto cve-exclusion.inc
> file with the appropriate information. See recent commits to this file
> for examples of what we need, e.g:
>      https://git.openembedded.org/openembedded-core/commit/?id=3Dded28c=
a69b326e51ac5cf363f06c6f0931a9c1bd
>
> Once we've got patches merged into the master branch, we can look at
> backporting to wrynose & scarthgap as appropriate.
>
> The open linux-yocto CVEs lacking an upstream fix version and not
> currently tracked in cve-exclusion.inc are:
>
> - CVE-2019-14899
> - CVE-2021-3714
> - CVE-2021-3864
> - CVE-2022-0400
> - CVE-2022-1247
> - CVE-2022-4543
> - CVE-2023-3397
> - CVE-2023-3640
> - CVE-2023-4010
> - CVE-2023-6238
> - CVE-2023-6240

Venkata, who goes by Adhitya, has looked into all of these issues.

He's found one CVEs:
 =C2=A0 =C2=A0CVE-2023-3640 - x86 cpu_entry_area KASLR bypass.
that we can backport via linux-stable.

He has notes on the rest of the CVEs and will reply himself shortly.

../Randy


>
> Best regards,
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#66616):https://lists.yoctoproject.org/g/yocto/messa=
ge/66616
> Mute This Topic:https://lists.yoctoproject.org/mt/120036383/3616765
> Group Owner:yocto+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/yocto/unsub [randy.macleod=
@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------TkhJXLZsyErZRrNyCvfKsh2G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-06-29 15:33, Paul Barker via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4ac849a706feb16688020d5bcc3e74aececd63cf.camel@pbarker.dev">
      <pre wrap="" class="moz-quote-pre">Hi all,

We would appreciate help triaging the following CVEs filed against the
Linux Kernel, which therefore affect linux-yocto.

Each of these is missing an upstream fix version in the CVE data, so
they show as unresolved in our CVE metrics. However, they may well be
fixed already in the kernel versions that we ship. So we need some help
to determine the appropriate upstream fix versions.

For each CVE, at a minimum we need to know if they are resolved in the
mainline kernel, and if so then which release they were resolved in. A
pointer to the exact upstream commit resolving the issue would be
preferred. This may involve a bit of investigation, so please share the
information you find that proves that a CVE is resolved in a particular
kernel version.

Once you've investigated a particular CVE, if it is resolved upstream
then please send a patch to update the linux-yocto cve-exclusion.inc
file with the appropriate information. See recent commits to this file
for examples of what we need, e.g:
    <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=ded28ca69b326e51ac5cf363f06c6f0931a9c1bd">https://git.openembedded.org/openembedded-core/commit/?id=ded28ca69b326e51ac5cf363f06c6f0931a9c1bd</a>

Once we've got patches merged into the master branch, we can look at
backporting to wrynose &amp; scarthgap as appropriate.

The open linux-yocto CVEs lacking an upstream fix version and not
currently tracked in cve-exclusion.inc are:

- CVE-2019-14899
- CVE-2021-3714
- CVE-2021-3864
- CVE-2022-0400
- CVE-2022-1247
- CVE-2022-4543
- CVE-2023-3397
- CVE-2023-3640
- CVE-2023-4010
- CVE-2023-6238
- CVE-2023-6240</pre>
    </blockquote>
    <p>Venkata, who goes by Adhitya, has looked into all of these
      issues.</p>
    <p>He's found one CVEs:&nbsp;<br>
      &nbsp; &nbsp;CVE-2023-3640 -&nbsp;&nbsp;<span lang="EN-CA" style="font-family:&quot;Aptos&quot;,serif">x86 cpu_entry_area
        KASLR bypass.<br>
      </span>that we can backport via linux-stable.&nbsp;</p>
    <p>He has notes on the rest of the CVEs and will reply himself
      shortly.<br>
      <br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:4ac849a706feb16688020d5bcc3e74aececd63cf.camel@pbarker.dev">
      <pre wrap="" class="moz-quote-pre">

Best regards,

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#66616): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/yocto/message/66616">https://lists.yoctoproject.org/g/yocto/message/66616</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/120036383/3616765">https://lists.yoctoproject.org/mt/120036383/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:yocto+owner@lists.yoctoproject.org">yocto+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/yocto/unsub">https://lists.yoctoproject.org/g/yocto/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
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

--------------TkhJXLZsyErZRrNyCvfKsh2G--

