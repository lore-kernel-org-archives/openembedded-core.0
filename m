Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3A1F3C256
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:26:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14094.1773062786978060365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rXOc0oKV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75281fa3d0=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Br3F0531417
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 13:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=UncvFqpIdDed8xsG9vbI8x
	8iK6uRGYNnDw1WX/6B/Z4=; b=rXOc0oKVU6UbkHSBRfOFN+RDJcJCMmTBkEdFeu
	28MkvPPHGDLbsupQzn2bzd//9eZ4foGDvl3Pc3kZOu4GwNir36YqrDhbIzXJOv++
	DWU6MVshCihJCK0Ur35u8fIRANJEyi+tdo6Mhh+Qr9ceppWScTiv+Ljnc1w/woT6
	9ETojF6HIxHT5XXUZ0jRuB3TAEBu/vCy0bF2vCZE1bzl4fW/l4C1khyV5vzFCt1i
	zcrg1oE3C8pATe/T5bzz6pjru8n0ncGw4tVwULg12RS5MPHbxZNdyuOQpPuur1PG
	S1DxLV/OhJ89s+fls0+OTRCagj0mce0WxL94f/rKf4SOALPg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011003.outbound.protection.outlook.com [52.101.57.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb081w44-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 13:26:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j75WdFb9GKX+b2yyM3sxQEr+Wg8mH9YZB28BmyoUdqg2BzdgrfTdIz7NrxxOzgObZGRAUAfh7Eyxx4Xp+6dVUrSku6G0qC2hzYhmrmPeihrCUxAwwvEdrYz+XAAq3O4MVY4MPY6DGayokMVqaM5PNHnLUZKVPU91EKmqBFsbOTqwuV9ThmpbwaiwSvxKvA6BSdLlpJTWwQ0edKvdFzmw+tA8kpRaIsrQjSGbp3BJp6i9P9qQtienhGkTrGlEHzH668Z61zApLVGXJENCAwhXDwPuvPNB+M7bSFEWSmeOlghFrAfB0YtO32w7PciR+emCOfypwSq+reYmBpxKaFY7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UncvFqpIdDed8xsG9vbI8x8iK6uRGYNnDw1WX/6B/Z4=;
 b=QMW4D2C5JWJKDs5ac8C/Yl3V2sMn3CnL6GtgySAE/ZuDcnaj9U5C4nu9PFT0+OnBHZT1bgwzFYJf3EoYTqTp06T17YDHcaob08Gyi4waz12Gz/QLwUiZTkNOV3j3xwrUi0iKJJn6ZZu5KvNbkEu+PKw3naoGPQrN/RAZEZGmmfqI6r/SCJ/XCfd7JAuPQr6K+S1kuUo7eHgqU1V0T8v25zHYxCheMDTWY2sCNiMYpj233gInStywJh8M/jCPbYAeIAHONkKWuBtszyKmmiHCbg3ki1nP/Glu5KHZUROCnTKvMabkEtiqDSzFsIz5asrU10evm4ZekuiqmAHr7e/wHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by DS4PPFE901A304F.namprd11.prod.outlook.com (2603:10b6:f:fc02::5b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 13:26:21 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 13:26:20 +0000
Content-Type: multipart/alternative;
 boundary="------------tG0WH0e2xPoMtkBUgLglCnU1"
Message-ID: <3fc9ed71-f82a-49ae-b48a-298ce8df40d1@windriver.com>
Date: Mon, 9 Mar 2026 18:56:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/7] glibc: Upgrade to 2.43 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Hemanth.KumarMD@windriver.com
Cc: Randy.MacLeod@windriver.com,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <DGY2CYFRS69Z.3CLMQ8NPRDMMZ@bootlin.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <DGY2CYFRS69Z.3CLMQ8NPRDMMZ@bootlin.com>
X-ClientProxiedBy: MA5PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::13) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|DS4PPFE901A304F:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b40c761-f7b4-47e2-66ef-08de7ddf73b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	Lf3Fl48f9b0YWDGqRce8aY4vvalOrXEmfbTuiKybogHE9Vgjy6XrhEoyCr/SgGHhAGPR54Hy0iD6ZegfoAofcllrJkjI2ExYRE+i66Ti3gPTgG3mQxroyEcygDjdiIpx8Kblxv0L4HCpxuKiASyjS+VRoOf0DFAanySLiJ5n/G4/wcrc2vyleK4o7nZtOVRLy8d0IJLc4i0e8PdCG95ScyOfBr1MBOu6npZIYH/OpzuD58TBMkHrXfSNDbRNHDvYF4qrZ3MTqfLScQcAvsDEZgcTDq0aV8KZZWY2q4WXYIZP5JdywZ8vqExmVUzJrArtMQmOHnPRcvLHeMZKBD1Fk3c7ihOBWkE3/dOsg9sNe+v9y/qwktUmpIMk6XPOUznzpIVg02TBg7lyTugy0sLSYebkKa0j8MQ47DnFa1vSfgA24ANKshv6B/oAp2qPLlzecw+5B96Fe2LKugt7EEk16y1ZLQwtNNoG3o9aoRJtjhk4ycJZUOBcr64hJU3qlOQc2mINS0hzYDlbqb2G7l3eK9ObFwN7LUmr9YZNRw+Ghpk3t7k1+66R5uW5+oVgwnANmuMGzIOsQ5+keKG+erbP6gAab5WISWUrqmB0tBPJsN8YnSIaV230CIXvzyD7UeqmQ2aCW5xCGDVyaHpo386e+erI2kfjUxms+YsctUOYW5SS+4hICqzcak2UgcoOND6xK5r4cBM1ovkJ3vhWdMapu9SIHbRqYMP0r4hTofHS950=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWxNeDhNZmdwaU9nMmpUb0hETTZFUWdBRCtGV3VzMWJoWDJiaDRZc3d2Vzl0?=
 =?utf-8?B?YStoTEtQZW9Sb2E0UmFleThVeWtrQzRiekx3RmVZZDhZVnBWSXcxbVN6a1RI?=
 =?utf-8?B?R1RMSjY2VzFySGtEQlgvYWFxK1Mvd1IvUGdGbE5mSzRpcEp2R0MrVHVFOU9a?=
 =?utf-8?B?NDhCMHpjQ2JveCs1WWNieXBqZFlocm9xUU1TUjR4MndPV1JwMi9sMitEbEor?=
 =?utf-8?B?MDVPM0dpOTZkQ0hTV3NneUNaZFFybElTVklYeDQyck96Q2FCL25VWnZRNUZo?=
 =?utf-8?B?K2Rpd3lJR0YyY09sUEtmc1JQNXUrVmM2TnRINmJuOWZHdElWNU1NbC93T1Ay?=
 =?utf-8?B?RDNWcS9mcHJrakdwR1RWUlc3QlkwRzhXb2QxY3d4QzdQWVJBKzFTMUlJZ2JV?=
 =?utf-8?B?ODdZOUdzMHZsY2dxU1dxSDVGUUMvdkRoLzFLaW92bFdYRW52UW5MZ3dwaTk2?=
 =?utf-8?B?a1pQYTFsUGtIZjhETUcvWURpUnRGSGVMMWt5cFNGOENJUmN4SGpzTG0wWkZY?=
 =?utf-8?B?UEFULzlqbWxPU2dCMTQvOVd3QzcxYkFQYVhDNUtKZTVSRVVQaUR6K0FXSCtN?=
 =?utf-8?B?QlZVZ1N3MWhmM256R0Z4Y2RiYURIbUlIZ2E5V0lmRW9hOHFTbFMxa21LbG93?=
 =?utf-8?B?Y0lJN1Q0WEg4YWxHT1hnVEhZL0FLMEZRRElFaWViREFRU3hVL01QZzhMdWpr?=
 =?utf-8?B?Z0JabVJ6SlVkR0JRbXdqTnppMFpsVnAvMnJRL3IvVTBDT3k1TGVsZ0h0WGtH?=
 =?utf-8?B?c1Rta3A5THBxQ3MvSzFVcXFxRGRLSkY0bFFzcjNSdTFha0thRnJzWGVUOFJh?=
 =?utf-8?B?Uk5BV3V1YzhXVE85VWdjenpZdjlZQVVBeTNpV3Y5dDQ2K3VNTThNT0ZTdzFZ?=
 =?utf-8?B?OEpUOXR0cnJxYitKREJUby9tNWR4Z3F4MGlRU1ZORWFPZWV2cUJVcDZtRkdt?=
 =?utf-8?B?ZjlHOWdsd0xwVE1RWnVJSkg1M3Uxa0tQbzk4WDRicktSekNSei9KREI2ck1i?=
 =?utf-8?B?TmxhSDRuSE16RGhUVzhpL1BrNE80YXMvSlZDTjhQczhDK0FiMVVvd1dYZHh6?=
 =?utf-8?B?NjB4MGVBQlpBZE44ZWVseWd6cEdQNUkzbG1wU2FYdEwyTVlaVkxrYmpIeDhL?=
 =?utf-8?B?TTdXaHRiL2x4VjFHSnpabndyK3U1UjFCMWdDVmxaU1d6QWhPdnR0OEU2cWh5?=
 =?utf-8?B?Ni9jUUkrdUcrVi9FNWVucEpXY29wcE1MZnJKUHFZdTZ6NzZBRGMwVmpUWGlm?=
 =?utf-8?B?RmVuMkp1MTVMajBSTEJUUVBzWHVGdlhhM2s1QmxsZkEyUmJORlRhL3lKWTZw?=
 =?utf-8?B?bEJLaEl6RlJBT1FQTFo4L1phNHBCc2JlWWZaUmZ4dTZISVZPN2hkblhyb1NU?=
 =?utf-8?B?d01FN2d1V241Y3V1VW5yVlp6VHFCcDBDVFJ4RUhvTWZWdjM2VXF6U1M4Q1I0?=
 =?utf-8?B?b3pCZ2dlVHJHeE95WXJicytZS2ZlbDZ4ek15MlUwV29QWlZDL3lrOEdjek56?=
 =?utf-8?B?c0pVaExtQUJlTStUZXJ0NnhSdG9YMWtKUUdWcng5QVRtdm5aVmgxclpqZEJH?=
 =?utf-8?B?VWIrcDlrRS94aFVaY0x4cFdCYjhWWU1mK2lFRDFCdVh3Wm5GT21aaVNqeFMx?=
 =?utf-8?B?V3ZFMWxxMU4xRzRtVk5XTHFkOTNOMktKNHJPZnBpZDFpbkUrOHBTT010emFM?=
 =?utf-8?B?T2xkSHhaMnNWdFY0dm1iaWR2YmNGdWl6MGN5bXZ3S2JrdUpYUXVsdVRVRm9k?=
 =?utf-8?B?QWdIczZRSVR4MXpHSU9oa21xSjdad2ZndFhnVkhyOWFQaUozWFdBbUc5Z1du?=
 =?utf-8?B?RlVFay92YVFWUHR0N1VzVk4xbytxY3FMNklKVmRTNGgvdVhlV0EwekRETnVC?=
 =?utf-8?B?N2JQVXM5WlBlSjVYOU9tQ0g0c0NwT25IdmRoRmErU1NoSlcrQUZDcDVKUHcz?=
 =?utf-8?B?SFBGbmM3Sk4rY2E1S2NNZFVCVGhNUFRPRzhBR09LRTJjOUx0WDMxdUJPanNM?=
 =?utf-8?B?NWRZeHBVK1ZBQTJselNTTGpKT0tRZ3BLZWQ4STFtOWIvSjEyUXVvMklCZTZV?=
 =?utf-8?B?QjJmS0g4S2ljZmoyQmw2NmJCWWJ0cFk5a0ZtYTBIM3pUbG1JM1prb0FKcE1l?=
 =?utf-8?B?QWRFUWdRRmh4K2ltTGxIYy82RTdqaEoweDBsZGsvakxqeHBkancxcS9majV0?=
 =?utf-8?B?ZitTN1ZGK1FDUTdObUpQYjRtU0xkSldwOEdpY1I4K2ZJelRLUTJXYWRSb2VZ?=
 =?utf-8?B?ZWFOSk5OdzhPTHRUN3ZoWUt1Z3ZmMUhOUFhPVEV6Y2pOdGMrY1paQTlQT1lT?=
 =?utf-8?B?djRrNkl2R2EvRVZjOHRXREhDOXNWVUU0cVNPMHJUWkptZnNOV0g0aGJmNXFQ?=
 =?utf-8?Q?5sZ3q1v0/ljKAR18=3D?=
X-Exchange-RoutingPolicyChecked: 
	pxoiQ/FWCyBqHvs0uyarke5M0LTQAiLEexY6aNXcxfnHiWIARRHbeST1aZ1Tc4YnhHE2UfNs0E/+8OvmJZnx23tfInCkgFpLhXkmLM2dCND+EHJasiK5He4hqa1vrRsLyZXTMQLpQEqpqCE+kBHWipsmGAOSKaBagVI8An862LZSEnnxwD/Qi6cqUpxTuff4Y+1x57bRhZIszWJmRCxqP18yJHy8FcCzM9MRO2g+/l5GFMHJW+UtqnX22pUnjzPkdsRIILJj+7xqPxcJSkrMINak2CI/5ws29D6U1nKk6S7VgyOeyj4bPB38iqft7YcK+zOV/Z7GPnxnYrvH8WuAPQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b40c761-f7b4-47e2-66ef-08de7ddf73b5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:26:20.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vc86kBGPe7HZkHjaqLVnzCif/++Z1f9YW0Js2sWEGaXREk3y2BYCSw0UOeuxqeKnEgg5UABfwqqbzzdnYrQB3g1hvDxZE3XwhUluygRmITo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE901A304F
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 5V4llJRZWZ79yr80ge-dw8GYrA2ovhpR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEyMiBTYWx0ZWRfX1YXx1JvcVuEF
 nigJIcLwF2CcsZsPwwS6kf3qz2WMDJ6CuxO05b3QgCHb7q0Mzl1NhuJn56/ldWbSYcWBmdeOl0q
 aBFuMB9dEaXaPHo0hskVwNz0/AWuwjzkcHBxS9iQw6HXUa59mM47uwfc3/NkPkl1xRt3qZIUKA7
 l+zCgG+X1m1xWH0GyS0sGQbcgUn24nA8WKDsCmebfQW3lWaS/Peqiec6iN4Ogj8auI7QshJlAPE
 FAFlZ2ef2A5J9jHgGlHW1cr8+Yt76ea8/bjX3itKrV3HKxbQwU5e0V5LcC+euoVQ1UoVt/BMmmw
 ThS3yzxxHxRGtA8BM5hDtnwpaEdRPqTNw4gJvx8TsJnt9zZs1cxeuzzkTc+dLTftCpvll8+Cx7D
 VFNGdKwutes4x6na3MiptdwzE5zl5TLDPiLsyp1Ab/IByAWL3zMswRe4YF8l9jUZuwBG7QmbVHB
 QaQmGbliyZ3dQhdgOdw==
X-Proofpoint-ORIG-GUID: Wlu_jI0ZP_PTYrb6tJIfHfI1xidY1Nit
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69aeca81 cx=c_pps
 a=VrK8WKSpsKTEY/+VWLGgkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=CCpqsmhAAAAA:8
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=3QfTYvXwHVfALaG83icA:9 a=QEXdDO2ut3YA:10 a=UBFVfQAFWYhimOpKR3UA:9
 a=Yizj21Op8YKwM3tX:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232708

--------------tG0WH0e2xPoMtkBUgLglCnU1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09-Mar-26 12:43, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sun Mar 8, 2026 at 4:07 PM CET, Hemanth Kumar M D via lists.openembedded.org wrote:
>> From: Khem Raj<raj.khem@gmail.com>
>>
>> License-Update: Match to changes [1]
>>
>> Added free_sized, free_aligned_sized, memset_explicit, memalignment, and new time bases (TIME_MONOTONIC, etc.).
>>
>> Support for the Linux mseal system call to protect memory mappings (sealing).
>>
>> Added support for the openat2 system call, allowing more granular file opening options.
>>
>> New, optimized, and correctly rounded functions from the CORE-MATH project (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).
>>
>> Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by updating ldbl-96 implementation.
>>
>> Improved remainder, frexp, and frexpl.
>>
>> Experimental Clang Support: Added support for building with LLVM Clang (version 18+) on AArch64/x86_64 Linux.
>>
>> New CPU Detection: Enhanced detection for newer CPU architectures.
>>
>> 64-bit atomics for 32bit x86 patch is no longer required since upstrea has dropped this logic in 2.43 release
>>
>> [1]https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
> Hi Hemanth,
>
> I also note this failure, that is probably also related to this series:
>
> ERROR: libcap-native-2.77-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-p7zx603b/tmp/work/x86_64-linux/libcap-native/2.77/temp/run.do_compile.3180827' failed with exit code 1
> ...
> | gperf: /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-p7zx603b/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6: version `GLIBC_2.43' not found (required by gperf)

Hello Richard,

We are able to reproduce this error on our local and we suspect it is 
because of uninative, there we see UNINATIVE_MAXGLIBCVERSION = "2.42".

Do we need any update here on uninative for glibc 2.43.? (We see for 
every glibc release the uninative was updated)


Thanks,

Sundeep K.

>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/3357
>
> Maybe also some selftest failures, such as:
> 2026-03-08 19:23:59,572 - oe-selftest - INFO - locales.LocalesTest.test_locales_off (subunit.RemotedTestCase)
> 2026-03-08 19:23:59,574 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-c, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-el-gr, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-en-gb, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-es-es, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-ja-jp.euc-jp, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-pl-pl, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-pl-pl.iso-8859-2, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: Fatal QA errors were found, failing task.
> NOTE: recipe python3-3.14.3-r0: task do_package_qa: Succeeded
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3482
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3362
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3254
>
> I know there is also a lot of errors that looks related to RPM in there,
> these are probably because of another series.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
--------------tG0WH0e2xPoMtkBUgLglCnU1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-Mar-26 12:43, Mathieu
      Dubois-Briand wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DGY2CYFRS69Z.3CLMQ8NPRDMMZ@bootlin.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Sun Mar 8, 2026 at 4:07 PM CET, Hemanth Kumar M D via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>

License-Update: Match to changes [1]

Added free_sized, free_aligned_sized, memset_explicit, memalignment, and new time bases (TIME_MONOTONIC, etc.).

Support for the Linux mseal system call to protect memory mappings (sealing).

Added support for the openat2 system call, allowing more granular file opening options.

New, optimized, and correctly rounded functions from the CORE-MATH project (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).

Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by updating ldbl-96 implementation.

Improved remainder, frexp, and frexpl.

Experimental Clang Support: Added support for building with LLVM Clang (version 18+) on AArch64/x86_64 Linux.

New CPU Detection: Enhanced detection for newer CPU architectures.

64-bit atomics for 32bit x86 patch is no longer required since upstrea has dropped this logic in 2.43 release

[1] <a class="moz-txt-link-freetext" href="https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe">https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hi Hemanth,

I also note this failure, that is probably also related to this series:

ERROR: libcap-native-2.77-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-p7zx603b/tmp/work/x86_64-linux/libcap-native/2.77/temp/run.do_compile.3180827' failed with exit code 1
...
| gperf: /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-p7zx603b/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6: version `GLIBC_2.43' not found (required by gperf)</pre>
    </blockquote>
    <p>Hello Richard,</p>
    <p>We are able to reproduce this error on our local and we suspect
      it is because of uninative, there we see&nbsp;<span style="color: rgb(36, 36, 36); font-family: &quot;Cascadia Mono&quot;, Consolas, ui-monospace, Menlo, Monaco, monospace; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">UNINATIVE_MAXGLIBCVERSION = &quot;2.42&quot;.</span></p>
    <p>Do we need any update here on uninative for glibc 2.43.? (We see
      for every glibc release the uninative was updated)</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Sundeep K.</p>
    <blockquote type="cite" cite="mid:DGY2CYFRS69Z.3CLMQ8NPRDMMZ@bootlin.com">
      <pre wrap="" class="moz-quote-pre">

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/3357">https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/3357</a>

Maybe also some selftest failures, such as:
2026-03-08 19:23:59,572 - oe-selftest - INFO - locales.LocalesTest.test_locales_off (subunit.RemotedTestCase)
2026-03-08 19:23:59,574 - oe-selftest - INFO -  ... FAIL
...
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-c, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-el-gr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-en-gb, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-es-es, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-ja-jp.euc-jp, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-pl-pl, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-pl-pl.iso-8859-2, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: Fatal QA errors were found, failing task.
NOTE: recipe python3-3.14.3-r0: task do_package_qa: Succeeded

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3482">https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3482</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3362">https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3362</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3254">https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3254</a>

I know there is also a lot of errors that looks related to RPM in there,
these are probably because of another series.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
    </blockquote>
  </body>
</html>

--------------tG0WH0e2xPoMtkBUgLglCnU1--

