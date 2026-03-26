Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442AC106F319
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:19:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44154.1774520384398464512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SYuv3b/m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7545558680=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5Lbhi291230
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PqPjNZyVRTVtSLv+GBYd8naxEJDyF8Tjw9rdfBaMwn8=; b=
	SYuv3b/mj4Fd1sgW/kJBhP3mMtV2hUxCzII1iotrlaaQVqlHLurcWeX62yS9MgkM
	2SyYmDYIMyCbFYh/dEvU5xTyWIF1M9fDwnj+zvNZGYt6uE6+v1be+c4x8fAZoX/q
	XPYqTw1AndC0hSkSOd/COQyymHnCTjRxRu/H20R/Seq44Jj49GGuAE+XS9fehGBS
	CXzo+hrEcl65a6AEPUzEtnxTzdS1vZbLq4GJeN1SDLyKxEMfbWUGsHzquSv9z6Sf
	AzrCIWZskdqgkSlhywTrACjewnK+MaUoQnn4JCs+KdmtU9mMmZ8EZWsXRTm58CEs
	2sI717JCR67Kcnvi5Cslgg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6xar0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 10:19:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWFZYWao6wIEG44szgf1PdAqVS4dVt+51uZUKpiGXHePtwHye5u843iIRZuHcBaCTQk8MLhJlNDBQJEazpDNIgJ5DjULRf50fwqpIRKpIW38QdiqW5AFQOdK79kMKocz3qEfxnZcXLzQ+EpflKQF9WL57mdm7SKMBRFs8ZHEr3Z3XYsaTCd3UBFkj6cqDrV47nHlwgI/xe1flGjxaxZg8gXv5WSD4M3r1g2/htirt6FFDOWLnEjndz30z9NOs7mgmnOnj8NgjiqsHIpmxFal7AzmZmoE94kLMS/GFQ8A0BYF2bAj1Qw3yskLYDJd33r5O3s+VmJsM0qYp2iBSsm3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqPjNZyVRTVtSLv+GBYd8naxEJDyF8Tjw9rdfBaMwn8=;
 b=GApujEcKZ2ltp/LqKHbpFlueYx1dDSA2u+w7U+8PQsKEk+gkPytH19M0ruCB9ZTO5NueDz0ZXHDM7o/SLBq41yOQI6RrlZFPKv7wc9T2ZZBlSfSlm4ok42i9x3DGUHJDOl6hPfSRPgWnxzY42uptI4J7YGyDaFnzZvisCVU6iDv3IBNd5BApy+rjUiszw6eEG+QD8AbPuYrVyxg2GcJKyRBkrvk6XN+N+Dn19hvKb5fZ1Mm5pGM8ghpN8wFkvmfHDP53twsg3veZ3Hs3UyOe5tprh7KTuarlqaNslodFIkTWoTSdDY31MJ8H5G4KrJnI1J1aLi6qQyTRHejSekZmkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 10:19:40 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 10:19:34 +0000
Message-ID: <065f08e8-e402-4379-8575-60621d4e6c63@windriver.com>
Date: Thu, 26 Mar 2026 18:19:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3-numpy: add cpu-optimization option
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260325022629.2245688-1-hongxu.jia@windriver.com>
 <CANNYZj9i9EFbo79nNPAtzXo03gLeJNC4qW-9Pp9u1UstvQp46g@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CANNYZj9i9EFbo79nNPAtzXo03gLeJNC4qW-9Pp9u1UstvQp46g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0134.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::6) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a3247b-2f02-4ea9-cdf7-08de8b212d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Clteqj4A+nggjgK6eCmJzuyBPiOrf646DVPR7c5G4s9eKPjFjUeOK8Wr9zCYzHkOLidmlvwdMdDUEAoSj3IrEIzYmTadcfTO3bTcaEFmk3iF/fd1QNXYi+iIdIAY7PCy82RsUP3ZfrtEpHFP+kYx6Wc57JKk+HL3IsTGPlpVkxMbbQRcypLX4VGWihhE0Z0unKe5lBf527j0nWAhd3ojMT7cYizr9hwOLcPC8arHAvpkqJHf8Vn5fjRQk71K00jNfHZAvqB/l0VO7bS77QwqZvSJKoI0AEHGj949A3T2697C1IQ7nZnhZc+I1TvW5FDFYSeX7MvpgW+nPgNYqgG2nlA/38pnjPaxCYwh9mRExaJ4NYpzOs3RwOs2exaEGsbp/hs7KBa6+QPu/BERlW6P0lHtUVujw1NH8kBmRf7j4+6YuLCco29uIgITrDIt+Hs+H5lzpCYF80kHLCZUvhcAXOx/rv26OXgUpaurlojTH5OcViGn6SXKPoCeOxhN2D+sq5zmpYVCnVCQOLvJDQ0ot8ZtRwLUiRWSK/RMzWN0cmqhsWdLjnBtIM5XIHra/2pM2fqOAC/QSTBVg/U7hyPbg6UoDu4B2XAlqqKEVDuPtGxeYs6Ohp+WmYc5vFlEqX50diLGqhXzN5EnIbqOXZcxcexTVeZkweSfB8RHCwzfVzqabY7T/2/ftOQVQqQof/tJuaVyb+noAIllWk6mSUHcRYmYCf36Em37lS78Da7b94s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zzh4VzJYcDk2VFJpOXhFSGNuSmIzSGFLd1p5Ni9yRERuNGxyOUNjZmRlKzRV?=
 =?utf-8?B?TFI2eGJRRXRiOWNLMlBuS1VZdCt0djRUSHlYcThBNFErV28zVTBqcVNCYml1?=
 =?utf-8?B?MWNHbkE0VnVhTlFtRXgxR3dUVS9jbXFmeEFwYUJzOCtjQ1lxQXRoRGg0R2R4?=
 =?utf-8?B?V0x0dUI5TElyY2F3Y3J5ODNFZXc2eGVVTjFDUUpJVWZsL1d6NWNNRGROaHhx?=
 =?utf-8?B?bGxoRjgycWozb0UyT2QvSk1KdHowMExHRWdWTWF5OU1XdWRzclhmb1Z1NW1m?=
 =?utf-8?B?cnhJcGJ4bHhZdmxsb3hpL2kwLysxa0wwVExpZFBVdlNXSWU5cCtWMk1nbWJI?=
 =?utf-8?B?eTFZS3FYeHFrWVo4ekF5MVdhVS9PSHdYY1MvNTZrWm0rSk5lSDJzNEM0bmk1?=
 =?utf-8?B?L09TaFJEY21CaXlrbWZzUHNLMndWaExRM0JFRExGVi9uazR2Q1duUzZvOGN5?=
 =?utf-8?B?K3Ywdk1aMVU0VVRiRkpkdlVyampOdUhhTDhIRjV5Vk9DczNHS0MvbFM0bk92?=
 =?utf-8?B?MkoydXJ1UTZMcXZsOHpRYTVPREdYd1J4TFNGdzZqbmc2T2w2UE5iR2dpRlpp?=
 =?utf-8?B?a2R3SVlrdGRmVlhac2p0WGF4bWZEZGp0MzFRcW94SFF6VFFWaDZEMGprTU04?=
 =?utf-8?B?NVJuNXJSTmh5SXR6eTJuRG90aUhSTC9yVU9jeStGU2wwYjRCQnd1T2tKWlpk?=
 =?utf-8?B?Z3EyZDZrc0syd1BlRGdHcG81WER6S0pDczhhbjJsbnFOdmVINzY0eGR2MU9t?=
 =?utf-8?B?cUpRaTFqN0pkbFcvWmwzbSt3NTdna1c5VEVaZ01HMXMyaWo2c21SYWRBWFFK?=
 =?utf-8?B?d2QyMmdPRjVVa2VaNWZ1Z24wS2RxQTBGRDFJL1I4eUdkbUN1eGkzZUd4c1l6?=
 =?utf-8?B?VkRVdXYxNktvcVA3Umk3aTJoT3VZSzdhYTE0clRjdFRBRlkybDllVFBkUFdM?=
 =?utf-8?B?dkZlUGZ2WktLUXpQbnpqNjg1Y0F6bnd1Y3BacnNkUU5qTHlMd0dCeW92L0pw?=
 =?utf-8?B?OC9JVy9Bc0ZUcitON1c3cWc2R25mWjFHY25qUXJsd29mMmtnQ2d1c28wLzJn?=
 =?utf-8?B?dmg5M3JLaFpubXFHWnlTVU5QUHQ0OWVnK0cvZCt5Qk5CSHFRYlZJMDVDT0lP?=
 =?utf-8?B?ZVRSdThmakNsbzlKMU1Wc0VGdktqV1IwYnRNTGpQckRGdStMdncvUWpvQWYz?=
 =?utf-8?B?U0Y2ZGtRYWJlQklySTErQ01MQWJDdVJTWjFZcmdQUFlnTTgzOHJ4Q2tjcnVF?=
 =?utf-8?B?akZJOHBlNmUydGRnVSs4dkIzRzJEMGJjd1NvdWEvYzJGNFFwZ1hRL1ZDRWhV?=
 =?utf-8?B?dDBsNmJCSGRqZzJ5aWJrS0ZiK3kySklPb2NVNys4UGNlemhCcS9YSXdUVEUw?=
 =?utf-8?B?K1B0NUtGZG9zb1JmeFRFZ3VTeEtGdHV3SVU2YXVjRElyMC9GOURhVVVIMDlv?=
 =?utf-8?B?cWZsYTYvMUhFa2xlTnY3TlYwQTkvMzYxcFZVdExmcHFkOTFzdkpxNVEwTHpO?=
 =?utf-8?B?VDA0ZDN4cHZyWmdIdWtQMnBiYUx0K29tVnR0OU05VlRUdjA1ZVUva2lFOE0y?=
 =?utf-8?B?RnErYVNYcnc2cUp2VFhqNjJVSURsVE1HK3JBUGdwSDdhQ3ZmU2RjZDYzQy9k?=
 =?utf-8?B?Ny9ieWIvZUswMW5UbVFJdC9zYVVtaUtad3RUM2xvOXE0bTV4QlM1MlJSZEJV?=
 =?utf-8?B?djJ1MmNjTXp5V3pYTWZ6YmVSMkJUMTBSMGx2U0JIUVQ2WEkvcm1na2x5dFVo?=
 =?utf-8?B?K2s0dm1hb3crSU1WY0U3UUFZbVlUUHpRRE4rekl5UFBwdWV5eDFTdnptUGRD?=
 =?utf-8?B?Wkp1TGV5RzdMeEhnVCtTcmtmK2JVc28zOFpQZzRmMjlsTysxRjZRblBTMktS?=
 =?utf-8?B?a0kwRnNvRC9FMFhibjJZcTQrcy93QVJTdXFnOW5LWXBWMEhOckRNbzI4U1FW?=
 =?utf-8?B?aVdNTk81Z0VTeURtWVdSUHpXT2RYMlZOb1VzcVFicWJrekQvSTF5M092Y3Ew?=
 =?utf-8?B?UnMyMTlqUkNpbTZBekdkNTJSampBM0g3Vlphc2trejdHaEVZNExwejRUZTNB?=
 =?utf-8?B?U2RsOUt3UHMzS3JRY210R2RJYzhHYStOd1dyUTh5R0ovUWdZbk9SNktBaWVN?=
 =?utf-8?B?STluTnVvU3pEK2c1MjdTWDJ1dklraHhxMUUvN2NpWjJtWm9WcmY4amhGL2tU?=
 =?utf-8?B?bXNaLzZ0VkkySFRnZDlaQXh4b0E4VGxNUlFKUndMbXFNNHB1djJsU3UveC9n?=
 =?utf-8?B?Y1FsQ0g4RkZhekRCaDVKaUFrd2x2aCtuWkkrVVg2ZTdtN1FITWJySTUzOEVh?=
 =?utf-8?B?V1Rndllpc3g3eUl4Y3k2YzNFSWNiVitoSnJBSld1SjlNd3ZyTkIxUT09?=
X-Exchange-RoutingPolicyChecked: 
	ovz9f8nt8EmQ9P/4wzJjGTDiH2p1SvnhuBpVK7lY0gMoRvyRJhSeZQgD63f94K75IxvrXDBvojCjokxXTv2N1GBlvtw/+Lv9O+CyxLfenb4XBQcf3szVKP5/aYawqJ5SIDaKnAK4iOXNmpzGdfW5Bg1zrn/eiGACgKrEUmmzzldUtkw+2sJrXuvJvgD9RZDH8r3aL3EWvoTEjiRS/ohexks4qTtcMuJ6KBYxYncnh6/LUCC1kzdJuWr247CF/orYbhZMqpSjreSRax2fcupE2vHq692N5PKA6ZLAFR4+NFJbrFpUMKJXT0X1WRHCMri1Qmvtxp3DKlf56pZuMRlhhA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a3247b-2f02-4ea9-cdf7-08de8b212d29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 10:19:34.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RX9Y8rmuHdSCoKEMOxj9L5uztaaSRPn1udjWaKEK7tINPWrZwPjeWzf0mV+F79kKENqHZyLXCjompoBbwC7Tbjvw2/aEvLxZOrVmJrC5fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MSBTYWx0ZWRfX04ZHCqg93C7U
 Nki731cLyVy6b1Xiic+8vqvRO4uVgW89NARbTNytg2+kVWNXBQf7FE4SnVJFT85InMUnk+EI677
 1tam41ql1Cp36EP5nQgLYbBn2W07xfGC1EJ4bqhfTDAKjkqosg2tSBJxjfVi638ovVSyl3RY6qA
 tg5m0MEv73GZ172B6/XNABwv9cV8LsZMWqUykYUWKsVceShjWWCuxLm+w7uxTNnVf2qNWFLcj5N
 FTRMQnGZvG+Mve2S7P2w1j1G3oILYk3jJRIHGVDn5HhZ9c5rQQS/NkDIvjof7sGRNIHiL4vPmwa
 Oi5AbFPDYOkFmQhMm8PtkhIsRULj7l/S1SEBML34aI75xrNpPEizHDcif2XLA9iHUcgMpEh8aim
 hyEdm/sYXO9TRTVE11burF5153RXkjqU+u9kh4r3SAuOAgXwCF/QEA3D3sDzNjI03Dy8JM9CDTr
 BxlZERqvXe3wvC5xPOg==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c5083f cx=c_pps
 a=e/sPstj0vE6DIEdYTBOJlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=hKpBA07XAAAA:8 a=Q4-j1AaZAAAA:8 a=34I4sqZvNDNPVNbTC_0A:9 a=QEXdDO2ut3YA:10
 a=e5PuFNF6PdRcDgRFK7o8:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: Wy_Gc23V8s_VcHbXebjmAQ1DyelB2Fvo
X-Proofpoint-GUID: XWil52TghKW97EwuhRorxyyFb2dgTbYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233962

On 3/25/26 20:46, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 25 Mar 2026 at 03:26, hongxu via lists.openembedded.org
> <hongxu.jia=windriver.com@lists.openembedded.org> wrote:
>> Add a cpu-optimization option for disable-optimization [1], disabled by default,
>> otherwise import numpy failed on qemux86-64 with kvm
>> [snip]
>>>>> import numpy as np
>> ...
>> RuntimeError: NumPy was built with baseline optimizations:
>> (X86_V2) but your machine doesn't support:
>> (X86_V2).
>> [snip]
> This error is odd. The default tune is v3, qemu guest does support
> both v2 and v3, so perhaps you could check why numpy selects v2, and
> claims that machine doesn't support that, and whether we can configure
> it to match?
>
>>   +PACKAGECONFIG[cpu-optimization] = "-Ddisable-optimization=false,-Ddisable-optimization=true"
> Reading https://numpy.org/doc/stable/reference/simd/build-options.html,
> I do not think setting disable_optimization to true by defailt is
> correct. Currently, numpy will auto-detect the capabilities of target
> machine, and configure itself accordingly. With this change, that auto
> detection is compeltely turned off.
>
> Please explain the rationale for this change.

In our case, we use `-cpu kvm64' other than `-cpu Skylake-Client 
-machine q35,i8042=off'

QB_CPU_KVM:intel-x86-64 = "-cpu kvm64"

//Hongxu


> Alex



