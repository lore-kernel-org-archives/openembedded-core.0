Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFA1EDEC04
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 03:38:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10762.1772595483604416676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 19:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BvjTG6m2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62423REk3701654
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 03:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=n9XArRe48vAj2LVgfQMLG8PydzoeXlwSbiJzOvmPJBw=; b=BvjTG6m2+ZZH
	RZA1cxt/IjKzSxDyEpSlysLJ2iT5zkp98PeHmW6IxaOGDXo53JGTK1guIW/3WPD3
	UjEbE9KT8Ckuc32owvOxVKzWBt2mBIiM5AscrtdW83Mto8KnNqX7lHFlXkQr801s
	elvxtncIjSq30dOdrLH5yKyEXco1mAt82VW0QN8afNnTkBBagX/DyTbC/P/0FgFM
	cWEs49Wbp2PJLedDX72CZPn6lcEY/PGsgL0dBKhf+R2pshtLNBcAqibFgnO+vpjp
	q7rx8i0K7g+lB4tVATliPjXL0v89dVQlOAFrpN5ZZ8iCOsCVSa6AB1vCrE1D8Waa
	RcTNbSZcwg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4mjp5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 03:38:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLthTUSIaGr66KrJeRvH50mGYZ3lk6LQfdAp7gqiH3FDv/6X0g/NK1azc9lfG+XDMRipn0sp4DXX4+9C8bg8cO52ciDnphNCJSLqs3b/2LpU7fsHhYisiihGkr2pljcOrSeSvLxaG9H9a/+5pXs90tUVQiPNXQE38WjqCXvM2zKQZcm24tgkla/bWZQymrWiP80024vfV9neNPfGEkRq/MonaJBnWwRH0XsBrNur3r578pIZiH4uoYkEj2yoBu0cwLxTX6tTpHMes7MQcpRMBIKccmlcwW8nH5cxmCMaOSwoD/o4o/ETs5sZSumnqiDdkPBoEQsdAtOr5M6KJSxXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9XArRe48vAj2LVgfQMLG8PydzoeXlwSbiJzOvmPJBw=;
 b=l0UOY37Tlb2wDEOGToym9mqSRcNFducc67Je0CTpX/ToWfSMp9Fpuy9BkeYp5M+QLT+ZHXMO6XES25zg/fjm/6K+KqVm5odQ/v56UXeRKoOifpeU0c5uNku2PPBOIe6XXFrvjx0z6MeUBTdhd7UNPyVnDGqXziwWAlYBo53uDMCywo9lVINVPwh01gH1b3fc2ejBDfKIWHRE0xU0kv6YmEHD+0rOGjGWEzKAHX9JOIQK3klfLep1xHwIeo9J/Eoj4TIFkZykP/t7U7Qygvacgd1E9OGmMh6XmAcu7AaI+m/XKdavuJ7rrat0BH+xHfuWggyDyAhVziIDpzVjSwdeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::853) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 03:37:47 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 03:37:47 +0000
Message-ID: <685f6356-76ed-426c-bcdf-c95d3516a0c9@windriver.com>
Date: Wed, 4 Mar 2026 11:37:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 14/19] python3-setuptools: upgrade 80.9.0 ->
 82.0.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
 <20260303065640.2541884-14-hongxu.jia@windriver.com>
 <DGTDVX11DXL7.3SS36BY5FSO6O@bootlin.com>
 <1899825EC78E920E.971272@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <1899825EC78E920E.971272@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::17) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbb2bc1-9148-435f-9264-08de799f670e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	EuRP3J8TCxg+6ANRnT6yi6h8X329O5gQD0dP5MG5s3cdvACeRAc05F8iQzIF3+DU8quuz87pKO1pzUBOwaHXgO8KJe/aBXRR6HoYtnGc7q4G1XIVGo9u5aQxitEU7HYdDZmEDbZPdGGgCt6V6fAOvEg0Q8d4nnfUmR5mBlDTvypISWlYm3qcztbicebc4NMBdPnqe9Z7tNYA4GA++6ZhtzVCb6R0vu7S7a28XI3JWVn0EgKyvIPjyEMZRryujSe/lnr1kgJ9uJvha/gqIdJcbOL8nM9c4il54P9uKDa7y0UFZPae3Jl6dog9mJSjoO6LnDBRIMJrMUTQ7iflwhwYPRKrsV/EpHInJOTiita3koPuWDQPEYplAdduLo7v2Kti/iV7VCrgtLMKHHjCivkwRoo2r5heykHA4yQKJH2NqKtVaIHB3w5y9Ng6HDrzQBDKCOLqiczKOrFdAMYJthenRVhAx7qmUufbNIy1xilAt+HS1sIRc9E1B7utiGlGEEOTOLUeACXYvyrmrQXRRmc4x4FZG8o2aDDEq9GUfAFhYGtOrRVzhcMkszIP4tmY2JCM2ECWQ0g33XTxKs8XbIuPeV/DWcEyKVSgueu7x0m56QUsWl4GTb+GJFVzj98ZJUi15FFLZ2aVqxh63JET3DH3TppgwQ5Ig4bw9uJhWKMjr8U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SnRYOUtXQlF5V3NmdkdHRURzVWJzWWdvL1JoYmxTU0Fvc1ZXV0wvMENoVzNa?=
 =?utf-8?B?Szd2K01JVzZhVDIybko2VGVVYXdvdzV1KzBzT1lpZkY0Z0ozTkhBRGlldUdP?=
 =?utf-8?B?c0VUV2NLWWQyMmRYUk93UVRMOWFvUkZiZmhaSmkxaXA5UjJTZGpmZG9rb09D?=
 =?utf-8?B?RldJWWpxcVBCc3BRTFFIR3ZoQlZoUkNvdU1QRndDcFNJWWdtVkVWUG1OUE4y?=
 =?utf-8?B?RVUreGhIVHJvTnpWY21ZdFBYNU52d2dZYTRoc1NYdVd3SmZFUFZzNFB2U3RN?=
 =?utf-8?B?WDZDRUlUZUZFM29CNW9kY09pVkV0WUFOdFhVeG93bytwZU9sRTVoektyaTdH?=
 =?utf-8?B?aWd3c0tPaHRrdlFqQjJuRE8zdGlDZ3JmNEdXRThsZFRNS1pmclRXUFVHNGFO?=
 =?utf-8?B?QlQ5OU02bnJkYnVhc0xxeW85UW53WTlBeGgwcjN5bWVabGs0ajExeGdGZnhZ?=
 =?utf-8?B?TjNkMUZhYU9TbkpOWTJVTFcyZXI0TklGYzYyZVFlNHVrbk9QUm16cC9jZS9h?=
 =?utf-8?B?ZVlRRkVLZWp0SmlaWDJ1WEszTk15MVE0UmFJejRhbm8zMFYwcXlQbGUxcXdt?=
 =?utf-8?B?aVlhdzQ2RytjVlBWTEZMbHd4K1JVUU4wRldQelR1VjNDbDh2dzlaYjJMaXQ3?=
 =?utf-8?B?NVRZMGdmNGdLWlNiVTZmMnNhTUN3TVFRZnpFY0h0Tm9jTmsvNk5pR093QlJQ?=
 =?utf-8?B?UWV1YlRWN2ttd3g2Zm1OOXBmYVA5ME1FY1lQNE42Y2tOdDhiNlVCenl2SDVD?=
 =?utf-8?B?ZGFUaDlMem8wWE44Yy9tUzFrcXRSbkFNSloreWRRZmZ1Z2dkbVV1dGtBaHlJ?=
 =?utf-8?B?czZ3NGxnaENnU0c4dWozSWkwUXg2NmtULy9ndUpubnozWDFNZndsTkczNU5N?=
 =?utf-8?B?RXgzeVg5K0R3RUd5TGwxV0JPcXJlUkhCajcxUzhtUzVmaXI4N3dtejMvNDNH?=
 =?utf-8?B?M2NCa3dDR2xUUDkvVXRSRFpaTTEzc3QweDRVbUJtWEx0THVlZ01scFNla1FE?=
 =?utf-8?B?ajlyRmQ5MFFUWHhjdzR5MmUyUmprNW9RRDcvV1dVMU9KK1ZLT2IrK2k2bFB4?=
 =?utf-8?B?YlJQRWltcVFBUVRLdlFaSEE4bDhKR2lPSDFIKzNNNGVQWDhmL1ltRHNDMXll?=
 =?utf-8?B?aEVTTFdFRXBxc0F3bmh0M1JDa0lCdVI4d3BtRHVJVkxDbmowUXhOaW92dWlU?=
 =?utf-8?B?Q3l5VWE4eDVGM0hXSDhtaEQ5QXJSVXUzRUxJdW16Nys2aGlmOXNZempmaG13?=
 =?utf-8?B?aXFycmlwRllDTUdnUm1aMVIzY1lZZllVWjFhNFB1ay9SVzZGMlJiWW5hczFh?=
 =?utf-8?B?SmsrcnNLVHFQVUN3bmlBYmMzcjloYVNwc2J4UUd5cG1VZ01zUEx5KzhBY3BB?=
 =?utf-8?B?K21lQUY5S0VnNHFBNlRodWhsano5WERRUGMwMzlYaVQwQ1N1WGUvZHpndjJv?=
 =?utf-8?B?SEZCZllBWkpMOVZFYXZCcFIvTDRJbWR1dHhVMzVYUk1PaTdhdkViU3RKQ2RK?=
 =?utf-8?B?Ukxyb05QTmtXdnZtSFgxSGhxZEVnTEhMUkpHRFV5ZXk0bDhzSUxXaGZRNXBx?=
 =?utf-8?B?K2NEM3hRU1dLamQvOFpiQ3hPbVJyWmNNbUsraTI5VFBBSUJ2U3B5a2JYVWtt?=
 =?utf-8?B?RlBiM2dGMkx2c2o4Y2g2NWFQY0l1QXBoQ2FTZnE2bDVnVU9zdHl1Z1djTzhN?=
 =?utf-8?B?MTh2QXVrKzByd0g1MU5MS2xHSEFOTSs1QVQzRGdLMVVrb3ZvOFZadnJSUGJU?=
 =?utf-8?B?ZHdYK0daWHl2dGpQdTViL3ZEVTU4TE4weFd0YjY5OHBsV0pkVFZRaXJNcEpR?=
 =?utf-8?B?YkhEVmkxRERVemNQdUFQbzZ0KzlLZkZHUlVvSDF0MytiYk9abjdGSmt0RGZq?=
 =?utf-8?B?RlNhWlVBSmtUYjlPV2JaTEtUUkVKb2h1RWpabDZ0ODc5YndOQUhLZFZyRnZM?=
 =?utf-8?B?ZUxoZjd1RHNSQzE0SmlZSUdUb2ljbnQranB5aVdnYUUxMG4rTFpSWktXcWVu?=
 =?utf-8?B?Q2FFVE9CMWxmcDNIYWR3VEtBZlNFdklHR1d6OG5SVHJZR0c1MlpyVENxSFZQ?=
 =?utf-8?B?blJvSEJsY3ZhbGZTV0R4THh0VEdQcldXTmpHN3Rod3pRZFdKWURvS0hWTEcx?=
 =?utf-8?B?L3AySXY4YXo2OXF6TVJUNzU0b01KTTFhM2FMSTI1ckdPeUZSOGl0OGhFNnBE?=
 =?utf-8?B?OVZuK1NVSkxyQ3FacFQ3MFViRFg1ZHloaU5JeUJ1emsrQmRKeDN4d1lMS1NF?=
 =?utf-8?B?ZWg2ais5TkIrakJ2TnpqTmFhQU5pdkR4cFgvQVl0Y3pqanJNZHVUSCtwUVhQ?=
 =?utf-8?B?R2JjVURGSTdhWWZuNERkU1cyTTIyR0RxUG8yd1QzVm1LUFpUOWVoZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbb2bc1-9148-435f-9264-08de799f670e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 03:37:47.1038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUopHX+NFoE05N5RJOhsxCv79J6+TPxO8SLH2V3gutIv6jkB85Ox7jRn5rfMM1UcJRlylbLcc0064lo0+y4SzC9rzQLYo0UKz7Oi8LT2C+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a7a91a cx=c_pps
 a=XnoXs6g8SJkBXVwgXvPJGw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=dXvAoEkxAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=EgjA6SED1V3569uzDyoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iJ39DRKJB4kz2P1Iyp3E:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PAlEoweaCl-qoFNp0sdfYDdWPmVlsKy2
X-Proofpoint-ORIG-GUID: j13sDTF9kofQVDLgA4ci0GRpkeJQkwri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAyOCBTYWx0ZWRfX0xEcrN5I9qzo
 0cYNnQ3punXyQCqEW2DV0dEx32yKslidyiYYJ/70j+0n/1rs7GelUIEvEtavWSQtXEi5ah3dCSC
 PuIkDmqri1fBv+7UELyIkKK08u966NXGnv2AvaeNevcCOQwxV0GzkBnT8l8mHcw4Y3pJxPjpOiw
 e247Xddvdz6b3/LTNeFARptzOCuEXeE6NN4yUrlfkSqGX++Pdd1qEwdwKcEJeNot9wcHqrywAkC
 C1GGZc/CC7tP0M8oKgfLHS9MTIEpZncmX5LljImSTL1ydRtTCl6jIinMfZ5nYtJZ6Avh4oNH9V3
 b8J48AO3n5DOpAZw4gkG7eiIs9W0qawCxXkTcLjckSPEhsLHuyFDUc07dAA33n3DOlrxidObX+G
 lavrp1eZ5H1v7pEsjbRsX27IdaA3QcKHl3tTtaNn72nGENSF0s6QBr3AP0CD3+vmnCmKRt6w2nQ
 JccL9A0Kul2wNsx1Rcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62423REk3701654
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 03:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232343

On 3/4/26 10:27, hongxu via lists.openembedded.org wrote:
> On 3/4/26 03:11, Mathieu Dubois-Briand wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On Tue Mar 3, 2026 at 7:56 AM CET, hongxu via lists.openembedded.org=20
>> wrote:
>>> History v82.0.0 [1]:
>>>
>>> Deprecations and Removals
>>> - pkg_resources has been removed from Setuptools. Most common uses=20
>>> of pkg_resources have
>>> =C2=A0=C2=A0 been superseded by the importlib.resources and importlib=
.metadata=20
>>> projects. Projects
>>> =C2=A0=C2=A0 and environments relying on pkg_resources for namespace =
packages=20
>>> or other behavior
>>> =C2=A0=C2=A0 should depend on older versions of setuptools. (#3085)
>>>
>>> [1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>> Hi Hongxu,
>>
>> Thanks for the upgrade.
>>
>> We get some fails on the autobuilder, that are probably related to thi=
s
>> change. Error message is not always the same, but it refers either to
>> setuptools or pkg-resources.
>>
>> ERROR: buildtools-tarball-1.0-r0 do_populate_sdk: Could not invoke dnf.
>> ...
>> --> Starting dependency resolution
>> --> Finished dependency resolution
>> Error:
>> =C2=A0 Problem 1: conflicting requests
>> =C2=A0=C2=A0 - nothing provides nativesdk-python3-pkg-resources needed=
 by=20
>> nativesdk-python3-setuptools-82.0.0-r0.x86_64_nativesdk from oe-repo
>> =C2=A0 Problem 2: package nativesdk-python3-pip-26.0.1-r0.x86_64_nativ=
esdk=20
>> from oe-repo requires nativesdk-python3-setuptools, but none of the=20
>> providers can be installed
>> =C2=A0=C2=A0 - conflicting requests
>> =C2=A0=C2=A0 - nothing provides nativesdk-python3-pkg-resources needed=
 by=20
>> nativesdk-python3-setuptools-82.0.0-r0.x86_64_nativesdk from oe-repo
>> (try to add '--skip-broken' to skip uninstallable packages)
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/99/builds/327=
0
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/326=
4
>>
>> ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf.
>> ...
>> --> Starting dependency resolution
>> --> Finished dependency resolution
>> Error:
>> =C2=A0 Problem: package=20
>> nativesdk-packagegroup-sdk-host-1.0-r0.x86_64_nativesdk from oe-repo=20
>> requires nativesdk-meson, but none of the providers can be installed
>> =C2=A0=C2=A0 - conflicting requests
>> =C2=A0=C2=A0 - nothing provides nativesdk-python3-pkg-resources needed=
 by=20
>> nativesdk-meson-1.10.1-r0.x86_64_nativesdk from oe-repo
>> (try to add '--skip-broken' to skip uninstallable packages)
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3299
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/3314
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3302
>>
>> Can you have a look at these please?
>
Hi=C2=A0Mathieu,

We need to remove python3-pkg-resources from python3-setuptools, and=20
clean up recipes that runtime depends on python3-pkg-resources

Please drop this patch, v2 incoming

//Hongxu


> Copy, I am working on it
>
> //Hongxu
>
>> Thanks,
>> Mathieu
>>
>> --=20
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232341): https://lists.openembedded.org/g/openembed=
ded-core/message/232341
> Mute This Topic: https://lists.openembedded.org/mt/118109855/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
hongxu.jia@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


