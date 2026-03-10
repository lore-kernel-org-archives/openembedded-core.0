Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A128FD2D83
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 13:30:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40109.1773149441730043988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 06:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=eruzkJ7e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752994159e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7ROvS674336
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 06:30:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Ym9oxXCw2/1DDMqwsk/kHl
	xylNujUbsrgv/wFZ1rvIs=; b=eruzkJ7eSsKjpf3bgo227QYMJkUpiir9CQ0z9b
	NPm8Y4HHtm6siiJ67EFj3Hks7IfWiGk+jEyjth5jC4vYivzJjieErm6RHJlB/fAh
	dLo1kn0hcqhjUeF1CdpS1hwjkjPdoMmR9dvVgl0fRDAvYI3oHmOJYxxInSZMPzIP
	FV6QJj91za9eGAe5PhI3DD/x4nZiogWtAHzvd+ZkQ7IO+oEFdqJ0Dre86UJIIUl0
	1UneQ2GKza1AgcPv3odIEgsjqB5jn+4MAhtnuXehn9J+MgssuAd61dkHotVIS/sA
	iwk7mGcOlqwjZ2Od11+2EenVq9VTym9dxkYQ0mDtaYocQq9Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm3161-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 06:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQymLARXvqfZSXvet7lLNpQjcFlwgKoz1XRhjACHWR6CNnPi0H0u4BgOunpm+AK3SDO5uRaMOuC+Jz51RWp613c/zKa9ElfMA1k/wnYUS7xOXUZJErzGfYi64AVIR+MU5tyFZ4lqsgyrnsUEqlYYP/jV+VZLXprPEagKl0eWEiCaXauBKrwH2lQv3rX8LMUQu6O+EXnEoPP04kZ4NjwlQ1ao8WmvQGiwovr7z8JDydwrGxSVrjIgf2cntfP5p961dyK7WaS316fmtYVJKEbJ+KF2zXnKx0ykGNIptX1iwfMutZUDyLUPHWThRR2l2JnpAGiBz2EcCZjBX4dUzeVymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym9oxXCw2/1DDMqwsk/kHlxylNujUbsrgv/wFZ1rvIs=;
 b=OVIlN5XEvgygU0nnixU58C+EUYGEAhTcUnBrI69OMpfBFPdLV4y4y9j8IvEMH/JsHZa76gMAyJw2fMgE+zJCvrFR6ExMlxlMprCrSAAhPphdteuN9xMGD3K4XeLEkzJitmwooDk9/SZV+rNuNaSWql+0d3YivN29io6hGV8uPHPudbDfqVqo/uo2n9qSCDZsN2f8OZCZyVRUjFelAwOHAZf+Oe/w9v7Ny5rKrr/i01GSNJmCtq+1VWpiYqDjM5+qhhzYEkaD2gm/+bfEUQkbsAP3Q/7/3cPjQkM24v48Ok0+C2nlvuEBxpEH3nfmyzFOC8bXN9vNNga31Fk0rUOpeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB7991.namprd11.prod.outlook.com (2603:10b6:510:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 13:30:36 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 13:30:36 +0000
Content-Type: multipart/alternative;
 boundary="------------iR8zdu0BO8AbjTAA0xz6nmv6"
Message-ID: <66dd7f13-045b-499a-a79a-2753e5f35014@windriver.com>
Date: Tue, 10 Mar 2026 19:00:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, paul@pbarker.dev,
        yoann.congal@smile.fr
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
 <20260304174324.1186644-2-Harish.Sadineni@windriver.com>
 <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
 <22371edb-5575-4636-88cc-462d0b19646c@windriver.com>
 <CADkTA4P3mPN8COS=Qeqf9Rzu3-E93r4j11x9b2hX5b2etR34zg@mail.gmail.com>
 <2e0e0fda-248c-4018-a9d1-2c6679560e2c@windriver.com>
 <CADkTA4OZVd17y5v2XYzZx1gRqSE81A+RRo4-WaL13195GpKTAw@mail.gmail.com>
 <cff0fc23fcf9e5176fc4830f1ff395a79bcaffe8.camel@linuxfoundation.org>
 <638a690c-6890-47da-a604-a25b86140139@windriver.com>
 <CADkTA4O0dKthNDw5mM473SCd-2_MQXUDoMCQnkwQKafWW=mPXQ@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CADkTA4O0dKthNDw5mM473SCd-2_MQXUDoMCQnkwQKafWW=mPXQ@mail.gmail.com>
X-ClientProxiedBy: MA5P287CA0036.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::7) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9f7d08-e36f-4518-84d2-08de7ea935e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|8096899003|22082099002|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	mWEmwSsV0cMruoLL9qw3Td1kgIYKm3tc3wvqjcBgcpJG9TjcNaKBrKC93Dt/TAUYTxxazGtWBE8liVeKx2G0oH3IkXpMef3Jk1jBcgdgI5VE5ixFexY2YLHbHh1SmGOdClI5JP7ttN5Xx//5NV3EOvpsslKAaoFtRq+Mefe10LG6RxuZbI6bJcSEDq6vvx0/mBbR3brB7UhffWbyvBQQxgGjFJJKoqSgO5s8TPeqEFC6ztpsKnxmUtR301Vwlxj53Hsexl7P8iWhAylHT8byLSGxw2jdjzITnbKfAXqPW3w8htBP+ARMDztmrKEhmVqRVxPvNAckARg1XS/RDe91D1ea89QWo9nle4JFGfTsUuBs7r/Gd2NYBTmszjUe/37KPXr6XuAou3SZokq8K60OSsSU9O/wGJFGCSvOQLWOJNEyJrHJLr2Kgm2Kmj47bCPrJU9HB+O6y7C5SxaoUNennH0SXEqBoBDbgAa1mMRc/YfqweN32h+O6N/FtIiUDt69jJ8CNvcrs3iVddKw46C3P1mSmV0K1NvYkFzuD+CLKPdMgxqJxJBsoXucUiGSXoiEleUOs2LdRfUqd3RwTeHuMaGWAg65UZZwgcJwp4VoNEquaUBmX9QqZKOqx2EMwku9PLKCtoGlxlM8C8sn93Px3ucK0TQbXwq7uDIpteFy7WbcnMUL8RrbanIhx8V5Jcz9G40FQ36npi2JmG2yG8fJ8fyAiu4aEmSagfuZG/kiBmg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(8096899003)(22082099002)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZERpM2RaaUVwTFVIa2ovM1QwM2tiVXdwWHlnSjhwTFRMb3pXMjhZWUJXd0Y3?=
 =?utf-8?B?QWptSmozN3FIcVEvMDFkMUVac3lPMHdDRzlpeEVra2kyNWpFbHJrajRiZ3BH?=
 =?utf-8?B?K0x6cEMvMUZrNFZEOXhKVVlmb0t6LzdVZ0VzQW9aSzlEa3BqSG42YUxMSElR?=
 =?utf-8?B?WnVBL2FjaHNRTGhySTlPY2N6dTN5bmNCTjhnTnhrUE03akRoeG9qQVRsa3JM?=
 =?utf-8?B?ajF1Z3ZhQ2F5VnJ6c00xZnM1dE1RSXNtdUlmaEl1KzZlamEyaThXREhPcnpm?=
 =?utf-8?B?V0k5VUZmSnBqc21JSmZwTUJKRjc2a1MrRFNpM2dNaVExY2xwMjkxNXNjandG?=
 =?utf-8?B?UzhCSURITjN0Wk5IRTNDK09tN3NNc21NTVRYN21nSVErSTY1REhTb0JwWTN4?=
 =?utf-8?B?K3NRZnFkd0F5dWUwcVU4SWVNS3NHSEN1RklmYUNEcVU1c2VnRi9ybTBLK2Fu?=
 =?utf-8?B?dHJmMUNTYUk4VGFOUkFMcUduN1JjaFFWeFptRG1TSkpwMkpTRVZUQnpOb05x?=
 =?utf-8?B?aXQvVVFuZXorckhNRHFCMXB0VTcrL3B1WWsrTjRGUURJRzFMZVJlRUQ5WkFI?=
 =?utf-8?B?RU9rUDlHYStCMmRSUEx6U3N5RVZPRDdRdmFDZGRHYlhuMk9oOHQ2MzhNRWxm?=
 =?utf-8?B?cGZjT1Y3ZDNBTHJsN2UvQXJ6RTl3UDFmWVdFZjJXRGphbjJ4ZTJGOFZhSWVt?=
 =?utf-8?B?ekV6YnBUeWlPcVNIR2lvemdRZWJSZnNkd2k4eGphV2dTZTZaaURuR1EyZDRJ?=
 =?utf-8?B?MFdRdmdBZ2ZxVmFLTVlKNzJUeUFqZTdmMC8xM1lLL28vd2NjMHFMVE5teFkz?=
 =?utf-8?B?Z2lXS2w1djhtZE9xR3pZanZzSy9oOFJKT2wrN3hqZzFNQTRlQjE4ZjNVdTZV?=
 =?utf-8?B?eUhuRXcweG91Y3FsekRrZ1RrYktybTE3UzBURHZBM2RJQk9GVHdnUE1uWFVP?=
 =?utf-8?B?WUNLQ3JVaXFqU0pNQWVPdWc2azArK1N0Y29zeFNXeDNlMUFpbm1Od3hNbzN2?=
 =?utf-8?B?eURURG5uaTZzWDZ4MldGWmFMajhXR2JMajZoOFpGMEs1Wkk1TUJRdHhkWjU1?=
 =?utf-8?B?RmJBNUJRY3lMTlZzc215WVZwbWl2d0sxQmxSMnlYR01TdUFkUldQRmttdTZn?=
 =?utf-8?B?UkZuMThGYjZ5VWJ4VWNINHVXSzBEanppb0xnT2dCajk2MVl0NXhMK3hEY0NS?=
 =?utf-8?B?SUR5RUpEbzg3bmpxUGM2L2N0Z3A0ZGlaNHNYN25sUVV0NlhSQS8rK1RlVStU?=
 =?utf-8?B?TlBHaHpXMHI5VnIxT1k0dUF1TnlBckZzeHhUWG00Yk0yUncxbjcweWhSV2Zi?=
 =?utf-8?B?Vmc2NzVkRzNIQVo5RzB1bjM2b2lmaStFTy9JcmtYNlBIM3BjcXJ0bEJ5TFEy?=
 =?utf-8?B?My9Xa3Vpd0owR3ZCT0R5dnBGUFRpMmQzNE93c0ZtSnBLYUVDR0UrZU5aTEpw?=
 =?utf-8?B?VDRLWWErT0Z6TWxVMjltSWVqUHB3Z0dOdUphcnR0cFZOWG5VeG9ETDQ3ZG9y?=
 =?utf-8?B?bnVRZ1lHSWxQOWlRdWxZaURmeG53WXpFWURRZ080d29kOXV5Vm5iRlJhRmww?=
 =?utf-8?B?NEJNeUw2QmY1a1V3bkR1alJuSTJjSmk5c0RHajNKQStuNmhlYWsrbldrMjhM?=
 =?utf-8?B?V0FTNi9EbVJtc0JGK0hPcU9Yb0krOG5JL0J4Mlg4aEVDQ204bURBeERGU2hi?=
 =?utf-8?B?V0JrK0FoMUJsMXBuejIrQS8ydVkybm5lM3lBdTR4YjNoaDJkMFZzWkxBcTVT?=
 =?utf-8?B?ZlNBUERuYUdKNHBHS0lIeUoxWUVxckxMQVQ1aHhwTmhDVXQ2d29jUXVTRUdK?=
 =?utf-8?B?MlYrQW8yN2UxQ0JBZ1VKOFRZUkhxTU9YOFhFNWJPbEZZRG9BRmRJQTVNQkNY?=
 =?utf-8?B?czZ2V1FaVlhQSVJPRnQ0SEJQN3VFZ2ttRUFma2h6U3NVcGxmSkdKL0RhQTZM?=
 =?utf-8?B?dUVpOFJ1Zm9rT3Z6bFhDb1ZGbmlIeHNSNU0rQ285Nld4VndzL1Y4dUNDMCt2?=
 =?utf-8?B?NHdJSDRXU3ZQUnhCcTJTYWt4c3lZdXZtQ1dDL3RadEV1R2NNbWJ3c0xRblM1?=
 =?utf-8?B?NTg3M2IzY0hwOUxMVm4ya1RTZmV5elVra1BEWXFsaG45WkFtL0QyNWgrSE96?=
 =?utf-8?B?clVyTDhXMDFDbWxSYzY2dnI5cE1aTzNlZ285U0FMVGlFc1F5KytWSUZxMitz?=
 =?utf-8?B?MlpJd0pYVFhiYTc0NmJFRTl4Zzg1bFlaWUY3SXNCV3htWVNXdUV0ajlMUUNp?=
 =?utf-8?B?VWVFMWNuUzBSMWZTelgwdGtxbjdKaU9sKzJJVTVmSkdCUEJPK01xSk9zTnFN?=
 =?utf-8?B?ZXNnOXJzOWpXWWlqdXZhTTh2eExQb3RwZmQ5eXdsNVEzSWs3T1hJQ0FCallE?=
 =?utf-8?Q?pvsfup8TXv07qnlg=3D?=
X-Exchange-RoutingPolicyChecked: 
	W/Ncp/eVEtev8mopFNBDKRCvyBbzxTwOIYmqiLc/PWiRGXdR8h2pZRvZ25SfmwPYu+0G2LUa/3c2RWgOLCg2qdybWdUAlBe87o7L5tkHbBgRqyoolTNhHLoDjRPVBnOw6WU0b5X/CtatPjjSQPqvYK2JhsefjFRyzMDIunksA4xGLUDEaL/qW+a124kbJosXU5PTmndZ8N0cKs13UvzYM0luG8QsMV20ICo/8jMmb6+BreBkLZRQm9JjI7nr459ho5o2kgpJrlNfVspw6/TwLajU7MG+nYwzIVvmkBelL9NtZGY47nf9oqtdve04li8AYzq7xvPOa1hh74YBY7BzyA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9f7d08-e36f-4518-84d2-08de7ea935e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 13:30:36.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrL5VJ2Ryys4+a4IFSCMNuwJz6JRHu1W5fWE/itDoROztYsDkXijSgqgzQkPhcPPPYqw6YLORVwtiq8Jj/FOi4//I3fnB3XxV7rE9MM3qVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7991
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: xt11RM6lzLA901V2hTE1TLOVQDuzxwMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfX0RvxsrppnGnO
 IZ4PClQi8R7eNmzQwQOWALHF1VLFb399ZjVO+jhIIVw3qPZa9kJUs/2Gx47qkG4bbKyYth+ES4t
 nMsCaeNOIglTsSfS51pGpZTj0eGoU9Hz2o9hhTD5pIPDQePVtvuI7JQlZSqWp0VWBmaj7S+WKbj
 8tkRo9rT41wR271IcHn8mbOWUb1gkfF7JsndTpbagylV3rIXVGEF/5yholqANtaSB+mjB4YNRfm
 yqHQF7H/r3KThhBJdjeUyy0bnh7/D/HXy+mpkbYburEPe1vFZvH+24yq2soNIHdL/WLDNCEtI3l
 40UFVh5OzQJwMdxTAEGWYcZnMyLGO5VbxUGfi1dK0lNDPCcxrMTiZv8LBjdOw+3k/KHntqtxU2o
 Ply6936yaTdh6PgaZQLTSENREHK+vwww4YCC/rS78CNyuldshPOqNFgFDmZNvKV1wqcElqKFmnv
 VoF2QtrE3C/tqNiAG0Q==
X-Proofpoint-GUID: ErUnl20uURl7N8M6JgAtZEH2UF-U-6wT
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69b01d00 cx=c_pps
 a=9fgoEbmtC9fw8tSBsklw+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=1H9S5zupAAAA:8 a=qxFMHT5GAAAA:8 a=t7CeM3EgAAAA:8 a=JH7ihdHkebUDIor2HXIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=fN2--gfEVN-7-OqPMpwA:9
 a=N3-Uf1Q_6tknnwB5:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=KJqDGGnLsJCYSyNEcnDM:22 a=CaZ4uPzsNBjnP1W_AGgG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 13:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232783

--------------iR8zdu0BO8AbjTAA0xz6nmv6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62A7ROvS674336


On 3/10/2026 6:14 PM, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Tue, Mar 10, 2026 at 6:58=E2=80=AFAM Harish Sadineni=20
> <Harish.Sadineni@windriver.com> wrote:
>
>
>     On 3/10/2026 12:50 AM, Richard Purdie wrote:
>     > CAUTION: This email comes from a non Wind River email account!
>     > Do not click links or open attachments unless you recognize the
>     sender and know the content is safe.
>     >
>     > On Mon, 2026-03-09 at 14:01 -0400, Bruce Ashfield wrote:
>     >>
>     >>
>     >> On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Harish Sadineni
>     >> <Harish.Sadineni@windriver.com> wrote:
>     >>>
>     >>>
>     >>>
>     >>>
>     >>> On 3/9/2026 9:59 PM, Bruce Ashfield wrote:
>     >>>
>     >>>
>     >>>> CAUTION: This email comes from a non Wind River email account!
>     >>>>=C2=A0 =C2=A0Do not click links or open attachments unless you =
recognize the
>     >>>> sender and know the content is safe.
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>> On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Harish Sadineni
>     >>>> <Harish.Sadineni@windriver.com> wrote:
>     >>>>
>     >>>>
>     >>>>>
>     >>>>>
>     >>>>>
>     >>>>>
>     >>>>> On 3/9/2026 4:56 PM, Richard Purdie wrote:
>     >>>>>
>     >>>>>
>     >>>>>> CAUTION: This email comes from a non Wind River email
>     >>>>>> account!
>     >>>>>> Do not click links or open attachments unless you recognize
>     >>>>>> the sender and know the content is safe.
>     >>>>>>
>     >>>>>> On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via
>     >>>>>> lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIy=
PNmuAqUaeJv3wtCoY4XeJd8am36JgQ$>
>     wrote:
>     >>>>>>
>     >>>>>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>     >>>>>>>
>     >>>>>>> Conditionally add 'clang-native', 'rust-native' and
>     >>>>>>> 'bindgen-cli-native' to 'DEPENDS'
>     >>>>>>> when Kernel Rust Support is enabled.
>     >>>>>>>
>     >>>>>>> These tools are required for building Rust-enabled kernels
>     >>>>>>> and for
>     >>>>>>> generating Rust FFI bindings via bindgen during the kernel
>     >>>>>>> build.
>     >>>>>>>
>     >>>>>>> This ensures the additional dependencies are only pulled in
>     >>>>>>> when
>     >>>>>>> Rust support is explicitly enabled, avoiding unnecessary
>     >>>>>>> native
>     >>>>>>> dependencies for non-Rust kernel builds.
>     >>>>>>>
>     >>>>>>> Signed-off-by: Harish Sadineni
>     >>>>>>> <Harish.Sadineni@windriver.com>
>     >>>>>>> ---
>     >>>>>>>=C2=A0 =C2=A0meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqU=
aeJv3wtCoY4XeJd8KLPsVX0$>
>     | 3 +++
>     >>>>>>>=C2=A0 =C2=A01 file changed, 3 insertions(+)
>     >>>>>>>
>     >>>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqU=
aeJv3wtCoY4XeJd8KLPsVX0$>
>     >>>>>>> b/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqU=
aeJv3wtCoY4XeJd8KLPsVX0$>
>     >>>>>>> index 4d0a726bb6..b7961bbcdf 100644
>     >>>>>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqU=
aeJv3wtCoY4XeJd8KLPsVX0$>
>     >>>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqU=
aeJv3wtCoY4XeJd8KLPsVX0$>
>     >>>>>>> @@ -76,11 +76,14 @@ do_install:append(){
>     >>>>>>> =C2=A0KERNEL_FEATURES:append:qemuall =3D " features/kernel-
>     >>>>>>> sample/kernel-sample.scc"
>     >>>>>>>
>     >>>>>>>=C2=A0 =C2=A0KERNEL_DEBUG ?=3D ""
>     >>>>>>> +KERNEL_RUST_SUPPORT ?=3D ""
>     >>>>>>>=C2=A0 =C2=A0# These used to be version specific, but are no=
w common
>     >>>>>>> dependencies.=C2=A0 New
>     >>>>>>>=C2=A0 =C2=A0# tools / dependencies will continue to be adde=
d in
>     >>>>>>> version specific recipes.
>     >>>>>>>=C2=A0 =C2=A0DEPENDS +=3D '${@bb.utils.contains_any("ARCH", =
[ "x86",
>     >>>>>>> "arm64", "powerpc" ], "elfutils-native", "", d)}'
>     >>>>>>>=C2=A0 =C2=A0DEPENDS +=3D "openssl-native util-linux-native"
>     >>>>>>>=C2=A0 =C2=A0DEPENDS +=3D "gmp-native libmpc-native"
>     >>>>>>> +RUST_KERNEL_DEPENDS ?=3D
>     >>>>>>> "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True',
>     >>>>>>> 'clang-native rust-native bindgen-cli-native', '', d)}"
>     >>>>>>> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>     >>>>>>>
>     >>>>>>>=C2=A0 =C2=A0# Some options depend on CONFIG_PAHOLE_VERSION,=
 so need to
>     >>>>>>> make pahole-native available before do_kernel_configme
>     >>>>>>>=C2=A0 =C2=A0do_kernel_configme[depends] +=3D
>     >>>>>>> '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-
>     >>>>>>> native:do_populate_sysroot", "", d)}'
>     >>>>>>>
>     >>>>>> I thought we were going to try and use KERNEL_FEATURES for
>     >>>>>> this?
>     >>>>>>
>     >>>>>=C2=A0 =C2=A0Hi Richard,
>     >>>>>
>     >>>>>=C2=A0 =C2=A0I have tried this but i got circular dependency e=
rror with
>     >>>>> KERNEL_FEATURES. So, I opted using variable
>     >>>>> KERNEL_RUST_SUPPORT.
>     >>>>>
>     >>>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>> I'm curious about that. Can you share the details ? (diff and =
the
>     >>>> bitbake error)
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>>
>     >>>=C2=A0 =C2=A0As discussed previously, I attempted to use the fol=
lowing in
>     >>> meta/recipes-kernel/linux/linux-yocto_6.18.bb
>     <https://urldefense.com/v3/__http://linux-yocto_6.18.bb__;!!AjveYdw=
8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNm=
uAqUaeJv3wtCoY4XeJd8cBMffSY$>:
>     >>>
>     >>>=C2=A0 =C2=A0KERNEL_FEATURES:append =3D "
>     ${@bb.utils.contains('KERNEL_FEATURES',
>     >>> 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}=
"
>     >>>
>     >>>=C2=A0 =C2=A0This resulted in a BitBake variable dependency chai=
n
>     failure. The
>     >>> issue occurs because the expression is trying to read
>     >>> KERNEL_FEATURES
>     >>>=C2=A0 =C2=A0while simultaneously modifying KERNEL_FEATURES, whi=
ch creates a
>     >>> circular dependency.
>     >>>
>     >>
>     >> Yes, that's clearly not going to work, but that wouldn't have be=
en
>     >> the suggestion.
>     >>
>     >> Wasn't Richard asking about setting the RUST_KERNEL_DEPENDS
>     based on
>     >> the KERNEL_FEATURES containing rust.scc ?
>     We understood like Richard suggestion is to use KERNEL_FEATURES
>     everywhere instead of KERNEL_RUST_SUPPORT variable.
>
>     We can use the KERNEL_RUST_SUPPORT variable to append rust.scc to
>     KERNEL_FEATURES and then we could make other checks depends on
>     KERNEL_FEATURES.
>     But as the other recipes (make-mod-scripts, kernel-devsrc,
>     module-rust.bbclass) do not know about KERNEL_FEATURES, so again
>     we've
>     to depend on KERNEL_RUST_SUPPORT Variable.
>
>
> I'm curious as to what you think is different about KERNEL_RUST_SUPPORT
> and KERNEL_FEATURES as variables ?
There is no difference i guess.
>
> They are both defined in the kernel recipe namespace, so any=20
> limitations about
> the visibility of one, is true about the other.

We will set KERNEL_RUST_SUPPORT =3D "true" in local.conf, so it is=20
globally visible.
In contrast, KERNEL_FEATURES is conditionally set based on=20
KERNEL_RUST_SUPPORT inside the kernel recipe,
meaning its value is only determined at the recipe level and not=20
accessible elsewhere.

Thanks,
Harish
>
> or am I missing something ?
>
> Bruce
>
>
>     So, for consistency we used everywhere KERNEL_RUST_SUPPORT.
>
>     Is this implementation ok or we should switch to use -
>     KERNEL_FEATURES in kernel recipes and
>     KERNEL_RUST_SUPPORT in other recipes.
>
>     Thanks,
>     Harish
>     > Yes, along with maybe with a tweak to the KERNEL_FEATURES code wh=
ich
>     > could expand " rust " or maybe " kernel-rust "in KERNEL_FEATURES
>     into
>     > "features/kernel-rust/kernel-rust.scc" too just so there was a ni=
ce
>     > short cut for it?
>     >
>     > Cheers,
>     >
>     > Richard
>     >
>     >
>     >
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------iR8zdu0BO8AbjTAA0xz6nmv6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62A7ROvS674336

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/10/2026 6:14 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4O0dKthNDw5mM473SCd-2_MQX=
UDoMCQnkwQKafWW=3DmPXQ@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at
              6:58=E2=80=AFAM Harish Sadineni &lt;<a href=3D"mailto:Haris=
h.Sadineni@windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">Harish.Sadineni@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              On 3/10/2026 12:50 AM, Richard Purdie wrote:<br>
              &gt; CAUTION: This email comes from a non Wind River email
              account!<br>
              &gt; Do not click links or open attachments unless you
              recognize the sender and know the content is safe.<br>
              &gt;<br>
              &gt; On Mon, 2026-03-09 at 14:01 -0400, Bruce Ashfield
              wrote:<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Harish Sad=
ineni<br>
              &gt;&gt; &lt;<a href=3D"mailto:Harish.Sadineni@windriver.co=
m" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freet=
ext">Harish.Sadineni@windriver.com</a>&gt;
              wrote:<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; On 3/9/2026 9:59 PM, Bruce Ashfield wrote:<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt; CAUTION: This email comes from a non Wind
              River email account!<br>
              &gt;&gt;&gt;&gt;&nbsp; &nbsp;Do not click links or open att=
achments
              unless you recognize the<br>
              &gt;&gt;&gt;&gt; sender and know the content is safe.<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt; On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Ha=
rish
              Sadineni<br>
              &gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Harish.Sadineni@wind=
river.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">Harish.Sadineni@windriver.com</a>&gt;
              wrote:<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt; On 3/9/2026 4:56 PM, Richard Purdie
              wrote:<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt; CAUTION: This email comes from a
              non Wind River email<br>
              &gt;&gt;&gt;&gt;&gt;&gt; account!<br>
              &gt;&gt;&gt;&gt;&gt;&gt; Do not click links or open
              attachments unless you recognize<br>
              &gt;&gt;&gt;&gt;&gt;&gt; the sender and know the content
              is safe.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt; On Wed, 2026-03-04 at 09:43
              -0800, Sadineni, Harish via<br>
              &gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://urldefense.com/=
v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRr=
lc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4XeJd8am36JgQ=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                lists.openembedded.org</a> wrote:<br>
              &gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Harish Sadineni &lt;<a h=
ref=3D"mailto:Harish.Sadineni@windriver.com" target=3D"_blank" moz-do-not=
-send=3D"true" class=3D"moz-txt-link-freetext">Harish.Sadineni@windriver.=
com</a>&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; Conditionally add
              'clang-native', 'rust-native' and<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; 'bindgen-cli-native' to
              'DEPENDS'<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; when Kernel Rust Support is
              enabled.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; These tools are required for
              building Rust-enabled kernels<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; and for<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; generating Rust FFI bindings
              via bindgen during the kernel<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; build.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; This ensures the additional
              dependencies are only pulled in<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; when<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; Rust support is explicitly
              enabled, avoiding unnecessary<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; native<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; dependencies for non-Rust
              kernel builds.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Harish
              Sadineni<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Harish.S=
adineni@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">Harish.Sadineni@windriver.com</a>&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;meta/recipes-kerne=
l/linux/<a href=3D"https://urldefense.com/v3/__http://linux-yocto.inc__;!=
!AjveYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPI=
W6qIyPNmuAqUaeJv3wtCoY4XeJd8KLPsVX0$" moz-do-not-send=3D"true">linux-yoct=
o.inc</a> | 3 +++<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;1 file changed, 3
              insertions(+)<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git
              a/meta/recipes-kernel/linux/<a href=3D"https://urldefense.c=
om/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N=
10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4XeJd8KLPsVX0$" m=
oz-do-not-send=3D"true">linux-yocto.inc</a><br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; b/meta/recipes-kernel/linux/<a=
 href=3D"https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8E=
vQ!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuA=
qUaeJv3wtCoY4XeJd8KLPsVX0$" moz-do-not-send=3D"true">linux-yocto.inc</a><=
br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; index 4d0a726bb6..b7961bbcdf
              100644<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; ---
              a/meta/recipes-kernel/linux/<a href=3D"https://urldefense.c=
om/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N=
10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4XeJd8KLPsVX0$" m=
oz-do-not-send=3D"true">linux-yocto.inc</a><br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; +++
              b/meta/recipes-kernel/linux/<a href=3D"https://urldefense.c=
om/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N=
10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4XeJd8KLPsVX0$" m=
oz-do-not-send=3D"true">linux-yocto.inc</a><br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -76,11 +76,14 @@
              do_install:append(){<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;
              &nbsp;KERNEL_FEATURES:append:qemuall =3D &quot; features/ke=
rnel-<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; sample/kernel-sample.scc&quot;=
<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;KERNEL_DEBUG ?=3D =
&quot;&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; +KERNEL_RUST_SUPPORT ?=3D &quo=
t;&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;# These used to be=
 version
              specific, but are now common<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; dependencies.&nbsp; New<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;# tools / dependen=
cies will
              continue to be added in<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; version specific recipes.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;DEPENDS +=3D
              '${@bb.utils.contains_any(&quot;ARCH&quot;, [ &quot;x86&quo=
t;,<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;arm64&quot;, &quot;power=
pc&quot; ],
              &quot;elfutils-native&quot;, &quot;&quot;, d)}'<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;DEPENDS +=3D &quot=
;openssl-native
              util-linux-native&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;DEPENDS +=3D &quot=
;gmp-native
              libmpc-native&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; +RUST_KERNEL_DEPENDS ?=3D<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;
              &quot;${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True',<b=
r>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; 'clang-native rust-native
              bindgen-cli-native', '', d)}&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; +DEPENDS +=3D
              &quot;${RUST_KERNEL_DEPENDS}&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;# Some options dep=
end on
              CONFIG_PAHOLE_VERSION, so need to<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; make pahole-native available
              before do_kernel_configme<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;do_kernel_configme=
[depends]
              +=3D<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;
              '${@bb.utils.contains(&quot;KERNEL_DEBUG&quot;, &quot;True&=
quot;, &quot;pahole-<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; native:do_populate_sysroot&quo=
t;,
              &quot;&quot;, d)}'<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt; I thought we were going to try
              and use KERNEL_FEATURES for<br>
              &gt;&gt;&gt;&gt;&gt;&gt; this?<br>
              &gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;Hi Richard,<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;I have tried this but i go=
t
              circular dependency error with<br>
              &gt;&gt;&gt;&gt;&gt; KERNEL_FEATURES. So, I opted using
              variable<br>
              &gt;&gt;&gt;&gt;&gt; KERNEL_RUST_SUPPORT.<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt; I'm curious about that. Can you share the
              details ? (diff and the<br>
              &gt;&gt;&gt;&gt; bitbake error)<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&nbsp; &nbsp;As discussed previously, I attempt=
ed to use
              the following in<br>
              &gt;&gt;&gt; meta/recipes-kernel/linux/<a href=3D"https://u=
rldefense.com/v3/__http://linux-yocto_6.18.bb__;!!AjveYdw8EvQ!ekkiIdFR1oU=
UFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4X=
eJd8cBMffSY$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">linux-yocto_6.18.bb</a>:<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;&nbsp; &nbsp;KERNEL_FEATURES:append =3D &quot;
              ${@bb.utils.contains('KERNEL_FEATURES',<br>
              &gt;&gt;&gt; 'rust-kernel', '
              features/kernel-rust/kernel-rust.scc', '', d)}&quot;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;&nbsp; &nbsp;This resulted in a BitBake variabl=
e
              dependency chain failure. The<br>
              &gt;&gt;&gt; issue occurs because the expression is trying
              to read<br>
              &gt;&gt;&gt; KERNEL_FEATURES<br>
              &gt;&gt;&gt;&nbsp; &nbsp;while simultaneously modifying
              KERNEL_FEATURES, which creates a<br>
              &gt;&gt;&gt; circular dependency.<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; Yes, that's clearly not going to work, but that
              wouldn't have been<br>
              &gt;&gt; the suggestion.<br>
              &gt;&gt;<br>
              &gt;&gt; Wasn't Richard asking about setting the
              RUST_KERNEL_DEPENDS based on<br>
              &gt;&gt; the KERNEL_FEATURES containing rust.scc ?<br>
              We understood like Richard suggestion is to use
              KERNEL_FEATURES <br>
              everywhere instead of KERNEL_RUST_SUPPORT variable.<br>
              <br>
              We can use the KERNEL_RUST_SUPPORT variable to append
              rust.scc to <br>
              KERNEL_FEATURES and then we could make other checks
              depends on <br>
              KERNEL_FEATURES.<br>
              But as the other recipes (make-mod-scripts, kernel-devsrc,
              <br>
              module-rust.bbclass) do not know about KERNEL_FEATURES, so
              again we've <br>
              to depend on KERNEL_RUST_SUPPORT Variable.<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">I'm
                curious as to what you think is different about
                KERNEL_RUST_SUPPORT</div>
              <div class=3D"gmail_default" style=3D"font-size:small">and
                KERNEL_FEATURES as variables ?</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    There is no difference i guess.<br>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4O0dKthNDw5mM473SCd-2_MQX=
UDoMCQnkwQKafWW=3DmPXQ@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">They
                are both defined in the kernel recipe namespace, so any
                limitations about</div>
              <div class=3D"gmail_default" style=3D"font-size:small">the
                visibility of one, is true about the other.</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    We will set KERNEL_RUST_SUPPORT =3D &quot;true&quot; in local.conf, s=
o it is
    globally visible. <br>
    In contrast, KERNEL_FEATURES is conditionally set based on
    KERNEL_RUST_SUPPORT inside the kernel recipe, <br>
    meaning its value is only determined at the recipe level and not
    accessible elsewhere.<br>
    <br>
    Thanks,<br>
    Harish<br>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4O0dKthNDw5mM473SCd-2_MQX=
UDoMCQnkwQKafWW=3DmPXQ@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">or a=
m I
                missing something ?</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              So, for consistency we used everywhere
              KERNEL_RUST_SUPPORT.<br>
              <br>
              Is this implementation ok or we should switch to use -<br>
              KERNEL_FEATURES in kernel recipes and<br>
              KERNEL_RUST_SUPPORT in other recipes.<br>
              <br>
              Thanks,<br>
              Harish<br>
              &gt; Yes, along with maybe with a tweak to the
              KERNEL_FEATURES code which<br>
              &gt; could expand &quot; rust &quot; or maybe &quot; kernel=
-rust &quot;in
              KERNEL_FEATURES into<br>
              &gt; &quot;features/kernel-rust/kernel-rust.scc&quot; too j=
ust so
              there was a nice<br>
              &gt; short cut for it?<br>
              &gt;<br>
              &gt; Cheers,<br>
              &gt;<br>
              &gt; Richard<br>
              &gt;<br>
              &gt;<br>
              &gt;<br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not fol=
low
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------iR8zdu0BO8AbjTAA0xz6nmv6--

