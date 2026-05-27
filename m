Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16DBCD5BDE
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 01:47:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11190.1779846428021407878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 18:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FU41L8z7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96077a4c2c=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R0fkTj2014740
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 01:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gm12q4Y6pt3n+rHkOuTG25Ur+EMFkonBoBNI2lkX9pI=; b=
	FU41L8z7ZNgmPBkTpfhF5b6RahsDM3+lfgOhpZyOEiBTwT4C857LKGVCOWwGrSIv
	L37AlCny1XsRxdYD9jmMVHWcUA9oTQqwQKUqKFKAJWKsNblLpS5X8YAgrqLbUqYG
	O0MPLc7o72cxDQtI/k0sUWBu1epf4JYeNxaR11HHq6OGrXPilGREfMjMUesElUDG
	S0cSOx2n+x4bGKJnwAvHoYkfJPHGp4zzlHnC3xy/ggxoojcMIK1A+qvSF3VOzvgu
	wLKldMNML1B/XaxF3vzuPtSqi5LEqlbmc6iw1kVZ3KbYDEQVB3BEGIr3my/MLKFd
	+mxmvNScdoXp7IbLvoBanQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f05548-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 01:47:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKN6M2758APhq28ipVBulqWzSDfdHRWTdJW+vkVhbIWO/L8qza5k2Wovq/gHtS/q2AbQJGSZLuAneVRVmpRaViPqUmbq3aD31Dpk7uzDcZRljD4e/iXl8W9+Q/HJ9123zGuKlun12TXiAb919YEErPNsE/sNUB5OrHfml6aJi7GFHsgg/WGRY7c4snA5Zumuo0xT/cLt0Gn9E1adbSEW3bstPRHH98X3yNfK/K9xbaieby0Ga6yhr8JqV3+kyfANxIaUwzVFDF/SmqXfIcuTBeo/22wybPXPbqoL1yNWR6uGGKuNtZRhbikMzeD8JKi6e8rraYaAOEdBaNWLpPNYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gm12q4Y6pt3n+rHkOuTG25Ur+EMFkonBoBNI2lkX9pI=;
 b=km5buHUcTd2MVJOO+nM+nDNygC84fWmaMtOqZsH4sgGljsFtw8eFtFY0vdqwuDP7dBMB35Fu/MtbdiDiHuSAlr+OF4dqo6KG9LmnwEpBx9zuF6S+mGfhQt8sC8Y1K3k+T4mFH/LXs0gC/zGEVtL+luEpIwErqYYhWkmw7I5G6oWdThqI/C700ds6PsQ2KVD7kLtJR+v4HWp9DfXaxQWKzCSVBUXRhUulomkoa09fkjy8RJp2rAXadmuaICfyv33Hq6A7eqJ7En+1ikxjApeedbQCoQutO/ocBrDKvGUW7V20NrhG4y/Ab3T71fr+QgqhfvIykWKXPVaDxJd/5s4/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB6704.namprd11.prod.outlook.com (2603:10b6:806:267::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 01:47:03 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 01:47:02 +0000
Message-ID: <d7f4839d-8294-49ff-aa75-bd20befa020a@windriver.com>
Date: Wed, 27 May 2026 09:46:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] subversion: fix svn-revision.txt conflict
 when building for qemux86-64
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260520023754.2076160-1-haixiao.yan.cn@windriver.com>
 <CANNYZj_1Fd1c2FY_34-=Yin+D2HMws=Uc6Ms1BKS4NDXsyZnbQ@mail.gmail.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <CANNYZj_1Fd1c2FY_34-=Yin+D2HMws=Uc6Ms1BKS4NDXsyZnbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SN7PR11MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 591d8895-7f3e-47f1-046b-08debb91d960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099006|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	KjEk9lmYUNKCjuyVY9qIeD83m4nLBvIwc3A1N5wA6TAdbdJsE+JKg0qAb8aSHJwJIeolXOyQI38huMij5Iq36sKoAu3lqsiHazt7MP8kFW8HUIXLmCz5mmczlJiN31fI1oZ1d6siUB/L1FhzWVJ9Uz9x0sniBTNK0uvnIk6pLZMp9Qpkgd1ZmxOO7N9Urs6To34IrCra1P+GEcZ0kaPgSQOseMPlTrpU/MOpBc0zw4Vk3sXATUg86Mc2F8tTJVktTv5fsQ/ofowlOKj7GAR/a2EldIGcnicgzOsbVzjVZzY+c7qMyHrCUxPdYAwT79M7wQrJFShH/WyG+0BaJKyFJp4K4RBncSyiCTl/6BI4ZoWL6z+VrZovQDSJIwIXSoxc1Uhnq1ITSOpGhRr9+vwU8PLE+XrucSsNM9vCWqLndgVLiJpJrNiJ1otA8b4YvbMLDGtgBpzmwPllNips6c3siU/5p3mNOQ5WFH8bv0ZBmTZZbJBIrPfECBT1iSsnUfCYrUNxiq/7GdPYCtX6gBA+VaBhDFU3IC7sgodV2tWfC9IO8gzzaj4ANvdmds6ws6GT8tHjT3Okt2/rx/bR18UCITZetObyL+kLE/PxT9w/AKwlC6/UDcnaOrrdBdtloCXHaz3zuLk+LaBFwxccGViCzg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099006)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWZ1QWlEa0FmK3pTNmtrVGROd1hsOTVxWmk3OGNYWHVGWWE1ZWxpSWJZRXh5?=
 =?utf-8?B?V2JVRXpuNk1GVS9iWk05Wld3SzRxa2UreGx5U1Q2QllTZGFYakNaemNNR2Ro?=
 =?utf-8?B?dHJxQWVJWE1lUHpORkpLeVY1OEtZZGZUNFNZU3JwVnlWODNwUGIxWXQxYzVn?=
 =?utf-8?B?WWpTdEZ1aElZQUlrQXM2dktwMkllVTMxM2wxZTlqSE41Q3lsOURxU0RoMVda?=
 =?utf-8?B?RkptdnE3dElRSVdNci92aFc5aFJVOHo2cGZqT1dFMjJ6QWxnOXM0aDhTNktz?=
 =?utf-8?B?SmVHMHMvam1IbnRTcHZGOHVnTnFjUWRSOVFZbGFLTVJxbzZ1U1pLRnVGNmdz?=
 =?utf-8?B?bktpUXdCZWdDcjlVOHhETjFoTFZ4SUZvK2wyOEthL1lkYXlKKzR2STZTWWd2?=
 =?utf-8?B?M2l0dzUwYmdQbkUrNHk1dzd2ek8wMGxxaHNpVkVrMGdnVkxTV0RxQ05ZOWRy?=
 =?utf-8?B?bncvRGhyWEwvVUM5bGxwdVdhSXVPVmhxakNxNGtNZkxqN3VTYmhSK2xzeUJM?=
 =?utf-8?B?Q0hVejJFMy9BbVhlUno0R2twZTFCQXVKYzRKQjd4UGxIYllYdDRnZDN3L0lk?=
 =?utf-8?B?YjZzaEQ5OU0vTE05b1ozL0xnTDhkS3hlOU01R2hQYjd1YTdud3JESjZWTUxL?=
 =?utf-8?B?TksyMGRXT1BySE1hSnB0TENaa0FGSS9wNmEyS1hGa1R4b05NcFFZMnZTTzhy?=
 =?utf-8?B?bEVDZEh2Ym4xN1kyZjR2QUMxWExBQjNueWZsWDV3SUhBTXo1Qm9sWndMQ3BW?=
 =?utf-8?B?VmNaUlpVUEllZUtNRmhoL2RxZ2FXczRFZVR5SjFjV1ExTXpzSUNKeHlxMEo5?=
 =?utf-8?B?VXppd1VmcXk2MWRxbEFRY2E1WEtXMlkvODh2cmQ2NFlCWkZSMFRvVkdVVlRQ?=
 =?utf-8?B?VkF2Q0VmaGVZdEZDTjlzVkh0MXdOUWtZK04rSDBlNzVEQVVpNGhtZ2tBV3JM?=
 =?utf-8?B?VjVrckhQU0U3d1d2WUg2bFp5TFZNZ1JLNkpxTmsxSzR1OWF5WXRSODdqRnlL?=
 =?utf-8?B?Ull0eWRKV2Y3WThDK0xpY3l4UkRTZS9jQlZiZVJWUG42SDI3UmIwVitkVUdp?=
 =?utf-8?B?eU5iNXFuTTVScHlKQmlqNkVaTlJEZTlqSnN0UWJzcm5uSnplVUxBaEwvUjhP?=
 =?utf-8?B?cVp1b2xqT0FSYktvR2lTc3k2elFDaW9kVXhaQ3UrdzJFM2pTNUNQUjJFNEZS?=
 =?utf-8?B?Ui82R0gzTTFGQmM4RXgwaWZxTk80R3lkeXgyQXNNMXdnMktxU0lyeXlRU2sw?=
 =?utf-8?B?dU55SGZHK2Nxb3gwUkhEeWlsOEhYYTVQNFlHS1pwNERuWExZNlc0QUpqdVhF?=
 =?utf-8?B?SWFQR0VYQ1ZWVlZTeHlaVVdzbjVDR3p6N2xLRjBkb3JJbThIYWRyMnBiUVdh?=
 =?utf-8?B?Ky9IY2ZIWTIwdFVmUmpQZjliUGUvTUQ5MGtsTldkTk90Vy9FdXpJcllmTHJJ?=
 =?utf-8?B?L2E4OU56Rkt4N1BGKzArRVd4d0ptYzR0OFNsbDJjMmFYcWsrdEhhcVlSckhG?=
 =?utf-8?B?QnBEV0Q4TGxTdU1ValI4b3dYK0FqRWpraW1Lbm1wRDAyaVp2MzZ2ODM5aitS?=
 =?utf-8?B?cGwwM2NkY3ExTEVCMm4zZlYxY09RazI5MlBrQm9DVUVWaUg0SzhsTXVsNEFI?=
 =?utf-8?B?V1BnWFNBL1VJY0hWSXFZeFRQVkNUVTdnMkFyV3VVQjY3MFV6WjI3Z2w0djly?=
 =?utf-8?B?ZmNzVSs0Ri9vYWR1MVJSS0Z5WW1iVFZPc2gyK0J5bDNmWEp5dFZCd1pPTTFK?=
 =?utf-8?B?S1FGaVRBajdwUU9yRGZpRTN3QXZTS1JvUFBSY0ZmN1dpaVpXcHUyczI0dVdz?=
 =?utf-8?B?V2FYWSsrZlhYZlZtaTdXU2RGWWhHd0FFb24xTlhkRkRiL2NLNTNWU0p3L3o4?=
 =?utf-8?B?ZHMxdGw5ZjFhaWZtOGd4dEl1a0x3UDFFaXdFejczYVpnbFNuZVRXVnFGdGky?=
 =?utf-8?B?dkxKdG82S0N6Z3RhQ2Rja1NZb1RWcjRPT2FFeDAvbzRNcHEzOWNSSUhwczNu?=
 =?utf-8?B?MVF1RkFsc1FPVjR6MUVXUWdmRERTZGxqbUtKUGhsRGh3SkFuMEpOdGd4QUQ5?=
 =?utf-8?B?VGd1QnF4azhGZzBZR0VocXN2YUdEaDRHK21SdWVmdWQzc1JtazF0bll5MTZQ?=
 =?utf-8?B?WDFkYzZvYUQ2d3lJc3RGRXBHWnQyWEFKbkp3TkRQT1dybmVwc1ZEckZrcjBl?=
 =?utf-8?B?ZkFRaGpZczhkVnlFK0EzbytZbFJJVHZnWmkrN2I3NzdScGlOLy9KZlQ1Vlcr?=
 =?utf-8?B?OUpLRGlSejRIZzhqaWRYZDBzOFV2TnM2MjM1R2lvdmt5Q25nRDhHMDh0VFFo?=
 =?utf-8?B?bWZsaWxSTGZsWUJvY1ZVTlZ0R21ObUxqRm9FbVpFWkNXR1pvSXc4OUVYRXd1?=
 =?utf-8?Q?eaep8zz1oSUPeT3M=3D?=
X-Exchange-RoutingPolicyChecked: 
	Ny4bBL+QB1EnNL0C21VfxCdYuM2kazWEDTym/uhzIdZUAxFQf/3+M3u5WRgbvkM++yg3idrz/w5DVNcPmnbFQmztcwps5yJ0gNT6u5wtSrgukrv5G7NjrTXYAL4nndLQNwxty+htNevYbewU70A9l/E/V2RptNy6ZOp+i0JqsUica4jZLNgI+NERkbTWWmcp+O/Tq8tjDTOmQrj7Cs0VExCttx+xN9kPxuaAxyPviC42M9jZoNA5i8U5/QZEpmo+nsdNhKbiTVrUxdTyEMyllkprkyqGxsP9Jm3x8J2ALtURpTFjjwgTFUUjqIMAXlwOGWpHkyT4f6gYi1FizV8ROQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591d8895-7f3e-47f1-046b-08debb91d960
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 01:47:02.9029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6mkVyeFXlMmBmorw+HvR8iszu95wt9wZ7Nsk8f2XZpPUa3pyGH3EqyKEIQiE51qckqOq5N0IQ3V0jIhnaYpczKPq5528S9QLeAWZJQVtdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6704
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: VBzSU9VJZV5f8iC1oNceCKKJokjSWHx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDAxNSBTYWx0ZWRfX3WUzrNoLiQmD
 evZEz/v2DAKsaNfET2IuQAauK8UAgTY/3KEfFHiC7w/pUGA8RGFU5DffGOq6x2eGoYYZV5YVDYN
 wrVEq7YKSkd5s6uxWd+Wim34rB1g6nEmx7tf/aFsnzA9YS3wkGkNBe3EDB4LiLrpdeJfbWUSkBb
 CLSi1Yv4GehS7eG6iZ2DhUDsnSBrahInWmGFRJdxBtpZlp/KW53MyzuYfgbluZaWy1TrIsKgUy6
 hIkbLjNy8WUVcekYV/T2nyE38Cr5mRsd4qxEBppD8++N6EQ3mEC09KSztGwGEO7NuTMfUqfYIAp
 pWjWUJ/fdHpY523GAmgyTAPgl63OrtakivSe8GjsY/gEMNYYqmsGT70u8oXfrCNc+rF7SaW+D3m
 zTmO1suMBP8GPsWvoojGuRhKjSZLmLN0LGpuc7/Ys2JN6IXr3/rHspVK4ZzVK9kgQhPvu483wDW
 yCtDKg3sTybYJ/VPyyQ==
X-Proofpoint-GUID: cEtU09Qlki6EHAPzGCEn3X3FHZ_CkV3o
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a164d1a cx=c_pps
 a=bMPlUhRHxnpMMWJsejB1Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Vt2AcnKqAAAA:8 a=mV9VRH-2AAAA:8 a=Q4-j1AaZAAAA:8 a=5pJ2UfdMeYCoVF1XeScA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=v10HlyRyNeVhbzM4Lqgd:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 01:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237627


On 5/20/26 17:22, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 20 May 2026 at 04:38, Yan, Haixiao (CN) via
> lists.openembedded.org
> <Haixiao.Yan.CN=windriver.com@lists.openembedded.org> wrote:
>> +Upstream-Status: Pending
> There needs to be an explanation why this is 'pending', or patch needs
> to be submitted upstream, or an upstream ticket needs to be opened,
> and the patch marked as Inappropriate [upstream ticket link].

I have raised this issue on the subversion maillist, but there is no 
response at the moment.

https://www.mail-archive.com/users@subversion.apache.org/msg30267.html

//Haixiao

>
> Alex

