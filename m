Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D9E1098787
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 13:52:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13214.1774014727578781551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 06:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OyXeqrQ6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7539085b31=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KCfoPn1365357
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 06:52:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MzJm8IJudPUDbl+2oj4jIs3nz5y0Qi6tnQCm2HNpi54=; b=
	OyXeqrQ67akj4McbL77L+ky8HX6usvBjOglDkehDDF4kfM5KzNnDmce/s4y2/FLl
	DFb5V+nLtLkwPO0HIAifkH5xJ/RuAjf5xfFeV5/ghLbO/qnmJT1jhHnS5HbRGoUA
	0QOCMFNli3nrMOVXSPUv9Wkixb5spoBUicGhhD6bJJd0RFoVJbLlgq8YS3gb4pdf
	N8aPHYG8YLRcT9Qpz5Hz+WAJTGfouJfd/crimFUK+E2NytxLK+yaBoJdnhGRSl61
	mZ8btmMr6ky5Y9l0zNHCVzmWsMHIzbEmsOy2hBh2Zj5ILRhbrUUqPPuLzx+soXzy
	3YBP9BENq0Fs1STZUGunlw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y183w4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 06:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9mOD78shHgtb9hLgxNQpcFmjFfObt463QqTGr4pwiHepb4shROv6cuyxdEHpE1kvib4Gr1VRPMFTIIBJbHnoI/7xXbBN1sMtBy4IoBgr3fc5eQstLH/Qdt2ykTvZZ1+tTpaztuWSMwbkvNWXpf3wlPbqH8eXtMYr1EOmfQA5V5FG1t050RxBvhAT1AjBfov6uxiGA9Tj8rWi/xsvjnDA9D29hxCYxuj1MS5wU9hLQyOXSKVAFQ9hp56IohMtbdjTEaDyjAgtdW9tW6+V62mmaQ5u//OTBFWCQTAH3cW8oulzxRsa5M1+MIdTlYGpDPgNnKLKZn6FU09ncHvrGaLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzJm8IJudPUDbl+2oj4jIs3nz5y0Qi6tnQCm2HNpi54=;
 b=BW+2qqwl+hBrHd1/9+H6qfNvH9HBe1/3PMgzoQaUbVqWKnzoBDcd41OVSbWUlVDi/uSVghj90IFRWjmxtORy22Nf2t83gupBXbUGkF50WWv4TJif6y75qPiWfweA1Uv+mAmZJydZYE7Q94XtI3dfwI70lXuArREw1UKj1L/5CnFXfPqa78zXYYlB9AT4X0VVZi8ZJHLfOO5bX6iRmkpYpiqnNq1CcTad+w2wb+yqzilVVW9v0L0aMwIju+ES4ZdAxwelFl1D1cBz03GFuymVUG61DwSswPXdafAYqeBiXupmZsgNLqyN7IMDGPkWU+f1vfOMHNVHsyoN88h1oa1UMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SJ5PPF50B3E12BC.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::828) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Fri, 20 Mar
 2026 13:52:03 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 13:52:03 +0000
Message-ID: <28f8c22d-59dc-40df-8e69-cac1f492d318@windriver.com>
Date: Fri, 20 Mar 2026 21:51:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] packagegroup-core-tools-profile: add lttng-modules
 to LTTNGTOOLS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20260318101025.2718647-1-kai.kang@windriver.com>
 <20260318101025.2718647-3-kai.kang@windriver.com>
 <220d88e1be8b340913eeb0bd748b862d72517457.camel@linuxfoundation.org>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <220d88e1be8b340913eeb0bd748b862d72517457.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SE2P216CA0014.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::11) To SN6PR11MB2589.namprd11.prod.outlook.com
 (2603:10b6:805:53::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2589:EE_|SJ5PPF50B3E12BC:EE_
X-MS-Office365-Filtering-Correlation-Id: 97caefdb-844d-47b2-7fbd-08de8687dddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	JF+Na9wGrCXUsWXxbwvkp2xqM1ENrFFg0Bi2glBxT8BRFQ3IkOyoZg3agTIsjt3DAV40Q2j+eVVG2bDpn4iJKr9IXuUKxMiGEb5AhbMV1SFxPgxvlf0PyUKHcI8nHYRJxfN2dUteCCbYqEopXJUN/1RCqS1aBVKMv+f9vjeE12PVmpRVOYeyiIHHENxfI/ymmgYMTTzEeUIr//fsq6EATQIMXWIcZT3A5KXDvwNiT1T7x9/FGAjXjglp+0PSg09iqgdfgm9JLKidMVRf00emMCV/sdgUModXI04fTmEaVp4V/8iAFQcsA90aNMCXGtuLH7tDzm1I89ECGhMY8UzH98ljK1K16DkqOQuU7guVdfbsLLdqnbaCr1+PgECLRfewl7+E8USPGXztMDdZ7++e0/Rd1eX+Thqx4QzhgFCJMxusNxNnFPXvFjxsY3H7EJ3A68nqO5qcKhFu0L1GbqPvnBLXf3DqQwW9T9bnMf9MW5pMPhzRDMl3e9292Og2HoG/CRzS19piPH7AFUaNnY0W4pwJCJGEYLlf5zxd/oicdfuiboh7kS+fdkAya2Q/6PZ6ckjtNybAzsoOKWdPuVcFQTbePGGBtbuylnA8Zqiqcet4+hvdjVX5+RUmaJq/2eXXPaIKfVyTzJHeA0s0NvpAKpi0liSBM9d0pr+m5mzg05U8LOq+qTWidgvQmn5qKoNycvolLZKoqZnycdMBrLBG5c7eYr+p0rBkEdttyDdUg1U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2589.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjNFdlk5L21jLzExSXNxa3Fjb21NT1RjQ29Jd25hZ2M1MitucnUrTUNOVlFx?=
 =?utf-8?B?NnVsTVkyOU5YNG80blVUMk9sRlk3ZFdFcmRtaTlsK2V1aGpmZ205TklBY3pL?=
 =?utf-8?B?S2doemFKQ1FiSlF3c2xJaC82bkZsRnUraExmbDluaitnYXU5cUxkalpQRHVp?=
 =?utf-8?B?R01ZcUtwWi9WemV0VTRvV1BNU2ZiNU5mblR3d29QL2hVRU9lRnFlbFlKUm02?=
 =?utf-8?B?Mjg0QzhjNmZKc0JuYm9qdHdQYUN4L0tiNW43Y1BmS0Rha0dyVFNIMjBTWjFj?=
 =?utf-8?B?YlkwYlhYRzg3Q0g2N3VjajVrK2JsTFFUWG10Wmt3M3VoRzFKUTEvNnBNZW9C?=
 =?utf-8?B?RnlXZ1pueko0Y3hTeU0wSVVTT0pybW1oUDNlZ1JEeHJaWlJEaTJuLzFWQ0ly?=
 =?utf-8?B?RDlOd1lPVkdkaXFwY21WbStEcGtqUDcwb0J5ZHJWVXZ2c0xXMVQ5bGJXZHQr?=
 =?utf-8?B?dFJDdUZSZjZBZWVHWkJ0N1QrRi84ei95TDhlRm9VeW1DYkhPT29SUDBpV1RO?=
 =?utf-8?B?cEd5UkoyYmlaQklSZ0RUTmR3M1F3VDJOd0lQVjM1SFdGUU5YZTM4NlE1a1du?=
 =?utf-8?B?bFhybC9EeWJ1U2swcXhjeVVDbEZjSGk2ZlJKK0FzUlNIdUdKcEV0b1NBTTRR?=
 =?utf-8?B?Z01lR0lCTUVxalBnVElKc0I5bHBPUzlMQXllekxyRGhhdUZHMnZpMUFTSU95?=
 =?utf-8?B?aWh2NzJuLzNGVDI3V0g5OFRnRENDYURPOTNKUzEzMnk4NjhyZ21XZkI3czdl?=
 =?utf-8?B?dmFneGFUcWxFTSsxa2tHY2Fsc1RZMFlna0k1b3VHODUvZWhYZ1dCdmxRKytQ?=
 =?utf-8?B?WDV4aklYNFEwNFBXcUNRVzdSUm1VZU5jV2J2RXIrblNwTE9hZVBuTU9YbXJm?=
 =?utf-8?B?VlF5UzZJOGs1U2dLQ0dLNXdSa2tnbGtuRnM2c3ZDRmlMbUc4ZWVaekNHN0xE?=
 =?utf-8?B?WEx1VGRQMFJNWVc0VkFJWk1QbHRXVWs5RDRtK0lJc0ZUaWI2Mi9nQXljU2V2?=
 =?utf-8?B?c2dNT0pJSElHNDFkTWZZdDRjTTkvNWVEVVY3U1RZVHJTUmRZUUt1bWxVWExm?=
 =?utf-8?B?a3RWMVEzNGZGK2lONTFYdy9paGJDSnlpTWdqUkR6QVJnZWhNd3lNMlB1YWdS?=
 =?utf-8?B?U3JRVWp5WWVSY2JjcFFjZktZN1BFNGN2OE40TVVvZm9KRnE1ME1qajlqcEdv?=
 =?utf-8?B?UUNEZms1RmFCMWczNStqQStWME5COWhVeFNqLzFOTkdsZ0xqR1lpdXR2cDJl?=
 =?utf-8?B?LzFCamFwU2pWSyszOEJPRjE3UWxhSXBOaTMvKzRSVUF1b3JHNUZ5cDJaYVcy?=
 =?utf-8?B?ejRac3VtRDhncEJrN3R2SEthSENPSDlaY21RdTN4NWhRU1FORCsvNlpkODZL?=
 =?utf-8?B?dGRlZFM5Tmg2dXpVMHh6YTFsZ2kxbEM4eXhFMWNNV1BXTUwvMTFWdHBRQWd4?=
 =?utf-8?B?ZUJweFA2NFRGV1lvUDM1eDZQbmdmOGYvc3owdHh4VEVReTZKLzY1VHdiWlhp?=
 =?utf-8?B?dVJtMyt0TndJQVpUME1VNHQyOTFuUXl6SkF2VkxOVmhwNGJDRVgrSzcwSGdl?=
 =?utf-8?B?c0NjVXBvbVp0Q0dqSDh6ZDFQYXVpNGE5TmhxYWFhU1A1d2ZKT3ZFc082ZXRs?=
 =?utf-8?B?TmFvVVZ1WGhaTU83RnBlOFBnOXREOG1WMWoxTDI3QU80SzJOaENOS0RZakFh?=
 =?utf-8?B?aWdxajJJa0cyU1FvZXNPbnJ3NE9rcEtsdmZadGhuVVVrbzVxRkxhN3JtTmhu?=
 =?utf-8?B?ZHo5dXdhbHBOSFlpSUpOWlRqTkNkcDh0RjRqaS9EdjRpQ2N3OEhJVytjUlZX?=
 =?utf-8?B?MEtmWjBGRThrSXNIMVVYWUl1ZCs4V3F4ckdZcnZ0TDc1Y2M2ZEkvQ3FUdzln?=
 =?utf-8?B?ZGZNRmowOUdIQ0VDUnFqdnc4YTFTYUZUSExGeHR5YXJXeUZ1cWFCZ0dBU25H?=
 =?utf-8?B?YTl0U2xzL0ZPalZWa1NNaHFESUZtdDczU2lDQmwxbThwbEdiNUJsejJ1WXll?=
 =?utf-8?B?THJQa2FhMzcrMG9sc0pOZ3E3allFUzhwWVRYSXJJTFJlNkdCRFNBQzM2SGR5?=
 =?utf-8?B?ME0wUWUxaTBIczlmVjFqbzVTVXZyVUdqUDg5NytnT2ZtRTF3NkgrUWJpVE8z?=
 =?utf-8?B?VUlLa1V6eTYvRm8vQmNaMElLMXFWN1E5QkI2U0kzekxUV25zeGRzZ2NtK0JK?=
 =?utf-8?B?TDFmUGNTcmphWmlOcFlkT0V3OTBwbVBEL1ppYVNDekRaeDNhQ29MNlhSNDNj?=
 =?utf-8?B?a1RPK2FwZW8xQkFQdW1ybXk4M0dmQXBuL3RiR2lxZzVia3NxQWpUZVJEa243?=
 =?utf-8?B?YzV2R0g4M0xmdS9VWlppSlB0NUJCMzdrT3VobkliNUhqcmZCRkkrUT09?=
X-Exchange-RoutingPolicyChecked: 
	aMOnIbfIFJx1wbDuU2mrsJ5x2MNy3aVTVsOtECnrRb9fcNrAB/SWssLLt1vtLEBCYIYYcpViCV41tai2JwtuBTUqTLMOhV8/mlaYul9v52vQM7HPPJQVSBJ1C20BPoZCQMG2UIZRvZYGvWFKLrk2qtzNIm9YUtUd6ohwi6axstYqYTgPG6mG9RmJyZ6xnzU5nIpp/8M5qzf5HDROEfSL9BZLS5iJWOQlD+IMProulTsEb26LPssyoa98opChV0x8eEcq41JHoZ94h60CmwMu0t+T75npvjGMBuMaqTzvYU42H6ca/48HCnjFPe0/IBMIFav8sg+6l/fIfdvs4X8yJQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97caefdb-844d-47b2-7fbd-08de8687dddc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 13:52:03.6834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKuB92mcrR9MwNWQ4R6WTrTXbcV1NP7enY+1W3vLWPeRqz0AwYyF3Elez07iEjKLru+RHOqKhuUB2Sds9U1K8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF50B3E12BC
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69bd5107 cx=c_pps
 a=XnoXs6g8SJkBXVwgXvPJGw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=L-Y4S1sFEjAefLUbCtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExMCBTYWx0ZWRfX4ySccRZrsHH9
 0dlmv5hSP/fobp5OkZfaNGqgddzAfdBOiG2iahbbhmbtSy2PQGL+CUBi27NQ228Ns2uiJTH7BPE
 YVWFp17q68/RC0i3rF7nPLu6Rk6p8I9JXQ+XM6GzNHABcl7DJXhzA2G5Net4rFSCIq7togPwg8Z
 49slfgmaNTR7M+lgqNaFSCYDUKzwqhDZudy+ukoV9h0YlQ1BZ+zsxFbIey0ooo1g7J0soS4KFiV
 8N2k/fUBVbw3UqruMhsbn9wc6NCapCKV0TaIy2pUw+21d5PPBt//Pub3EPo+9QWeuEuH1JIMCym
 RZKwxAzb3TACf97dP4YCoD94VkUwg9Pi/OF/BXHMrqvn2tLilZI56NnhpP/vi1vhZAidBowgQPO
 P7ypg1M5wR51E92MsCBmYSuv2bEt4CS3/fUMnULn3chy5ZF5j0NcKLDvGaKDNgVU4hORnRsx3pA
 YR8XOmuW4/H8O6vpN+Q==
X-Proofpoint-GUID: uCdeUng3g38PkbIgZGVh4AZCEzuG_PEx
X-Proofpoint-ORIG-GUID: Atwq2W1-duHNlC-TVs9UwyAY7hJzlzHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200110
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62KCfoPn1365357
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 13:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233610

On 3/20/26 15:49, Richard Purdie wrote:
> On Wed, 2026-03-18 at 18:10 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It has removed lttng-modules from lttng-tools's RRECOMMENDS, so add
>> lttng-modules to LTTNGTOOLS in packagegroup-core-tools-profile.bb to
>> make its dependent packages unchanged.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  =C2=A0.../packagegroups/packagegroup-core-tools-profile.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2
>> +-
>>  =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-
>> profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-
>> profile.bb
>> index 9c09f5ab44..42c15772a0 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-
>> profile.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-
>> profile.bb
>> @@ -31,7 +31,7 @@ SYSTEMTAP:libc-musl =3D ""
>>  =C2=A0SYSTEMTAP:nios2 =3D ""
>>  =C2=A0SYSTEMTAP:riscv32 =3D ""
>>  =20
>> -LTTNGTOOLS =3D "lttng-tools"
>> +LTTNGTOOLS =3D "lttng-tools lttng-modules"
>>  =C2=A0LTTNGTOOLS:arc =3D ""
>>  =C2=A0LTTNGTOOLS:riscv32 =3D ""
> We probably need a:
>
> LTTNGTOOLS:riscv64 =3D "lttng-tools"
>
> here since LLTNGMODULES in the other file doesn't support riscv64.

Hi Richard,

Just see your v2 patch. Thanks a lot.

Kai

>
> Cheers,
>
> Richard


--=20
Kai Kang
Wind River Linux


