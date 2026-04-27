Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61CDFF8850
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 05:01:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36074.1777266078754443781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 22:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=aU5bL/W5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=857747364e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R4SqiS2923247
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 22:01:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=6goz0ACtp+b65R7UbUhs1vGgNZfFV1bn+1QmA9u72xM=; b=aU5bL/W5hhTR
	5xzQdOyIT7y8AkEsHjI6O86bg9T/0ikCIllJe6dXW00OpPlewpKaY42ZLlJl77di
	SwfVDp8vj2ui64Kbra9RMzlkKiGy34LRFrm2/xd0cP+KsYmOIqXGUKrwkGfV2VfV
	k6jHZgS3p5fkbgEGcbSv+xbxr/KH2w3CIRj+fz6/ToPhHkLR0hArVSuB0w7tpNnO
	C+X0su1NQAh+XfyveYPzgbgU4320Mvkjbs3wqrZ8L13njV6Xa+QfrIdg6t42hrMO
	r18yJdaav0O8TqNZDsz6mxkwzY0+JIfTWD6Q2siEWJ1FD/pbJlBbzmxpxo3NOBSs
	hu801wvMBw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012020.outbound.protection.outlook.com [40.107.200.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drrw2scee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 26 Apr 2026 22:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnR+dIqrR3S1Noi5LkG3WHU8/oMBOZw+MJEImlh7tosTYfD0l40rypkoCdDmzlogSzVWpq0QsHQTllazCEgRu9yiwZqjNmqSevzVTpe/T5bYLGWSaEGwZlE6q3nZ3aBZuMYYm6DtlQBbWSLUl3UsBFudJnV7E3p1nFKqXG+zcXgtKUWDGU06fAbPM8cjIkNtrsNvFM1TBwNuJbSLAGHVJ2hz6bYa1sFNSmYp/PZg+wj5f0f1NSugSPHrxyFISR8+jsnhd/4r34BaNk15rv0jOb2C946hh3T+Sr/BrV8hmMTekpYL/tSEUIBd+p09wAX8PhK4Sb7h+DwFeNCET8InhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6goz0ACtp+b65R7UbUhs1vGgNZfFV1bn+1QmA9u72xM=;
 b=CKmuRPgFVnJuhdG9IK+7OHUVqwyRtt4cTrWGJkaqqcgn/+PlIrHpQUJ/sWMexPPmmQO2e8pCxZdoGr0/4q0W6d2+cb9bifmppMku6pMPFt1gDxmjFkbWZ1VY0/kYz7KWWHtpKU6eMR4qXddQnz1fYojQZJoz6GsMnf1/U1r2z8GPoJSZw5o39Lz6pkDkq9v9y78l+CZ8zzhh27yRTBGIzME/36Fag2Yylx61LYkCnwbaawdGI0nYpwkS2yWQre5O9QxPW2PHG/gS21z/lPaZrODVuGuKQCiT8x/oX935oo4ptPJ/W5r9pCM5QwMowvCrvFCoqHP3VH7rwJ5GVNof2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.13; Mon, 27 Apr
 2026 05:01:15 +0000
Received: from DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a]) by DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a%6]) with mapi id 15.20.9870.012; Mon, 27 Apr 2026
 05:01:14 +0000
Message-ID: <6db064df-dafc-4634-aae8-8587d325751d@windriver.com>
Date: Mon, 27 Apr 2026 13:01:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 2/3] ovmf: fix CVE-2025-2296
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
References: <20260427045650.2365793-1-hongxu.jia@windriver.com>
 <18AA1DD7A8866F0B.1773850@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18AA1DD7A8866F0B.1773850@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::19) To DS0PR11MB7621.namprd11.prod.outlook.com
 (2603:10b6:8:143::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7621:EE_|MW3PR11MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: 33059b57-c6df-4918-ab38-08dea41a020d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Bg4LfMZAu/oVBDKOeWV90+xbGFeaNrqRZcdnCf7nga84X/cBUf58Pmx0uoTYKkQ4vH0mV2P853uqhy7IDLPr/OIAJOHBgD+fQh5giJaU5f7Bed2kfiY6ngXdoS59Ufpo/M7RNw+mx9XKICrqcIgpIxeZ+1gZFyLZh8+p7t1Ujl3pTEo4+4uxTn88bCqrZbZnK0Y5WAt33yWt3zq2X5tyFARygBfg3UXa78USfUGwM1ZqIgZlxUaFcJW7GuZRAM3v6BGJ3WZFbUeUZrdsLAAGz3bT+Mw6YmEjlxckZAPqb62SV/F+iu7Qe6gZCvcCqnGNpeG2HINx3CqpzpRa7z62s36TqQ9+eC5l8fbZO6+DGQyXvn1I4APLNlBznglgdoDXVAiGLXZxUS5FEBs8lyI69d4IDIayq6rP7pcHo9CmdFBgHt8SOvCUH9knqLU0Y5Iczn2WNneo6QITHYy5/wXNoYdGWJSWCBnJmkvQLeyedUaq6+kula6ZRg0huMRtPkZurBS9kXbT0i/tNa41ddpIqXJMPezJTHrVSXdl8B2KaO5nyQ80OeCXLSad4l4RpJFWS/6/bXV8O7X9Pzv+K9tnS1Xqiznfo8YAXXWKiZ5s2TxoO/hrvQvy/YT5ExucX6A8NCsMZTP2sYBMfiMqP4c2su2xVONWf0OxTD04gc/gLu+y8VdcTN6cbQIy0vmRTk4m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7621.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDBvUldzZlVKSk5na1ovbm5wRkRzYjlKWms5Yk81bDFjNGhMdlBYVjl1eTBs?=
 =?utf-8?B?RzVYSkpCaThFOVRWU2dteDBPT1I0anU3RC94Z29aSE1WRTlCTVRLMGRDT3BY?=
 =?utf-8?B?U3JjZGxIUzZSWXM3Nk85ZlhKRkEyYmh4UHFxNEVnai9NQlg0WDdSRWRYaksy?=
 =?utf-8?B?QnJyUFlNeCtoYVVIWHd6OFRTcEQwNlE0YmRvb1hMOFFwVkpXdDE3MjNWQ0dH?=
 =?utf-8?B?TGFmckt5ZGxqeU50K2xtVTk4L1IvS0tSRXl2TTFJcnRPc0JJeUFZVVMwb05L?=
 =?utf-8?B?YzQxZDV0cTFUZmprNzBnWGRvcW9sSm8yWlFDOWVCRkJxeDM3aEF0QXZ2UjFG?=
 =?utf-8?B?NHRlTFZPMllwSXgwY2dsYW5QLzNZYjUzM25naUJuSFZDV0ZZNzMvTGtucWJl?=
 =?utf-8?B?QlQwMXJMQlZsN09MeityZUszMnZ6b01QdkpkL04xaVZ0RWFMS3FmZFYyU1p0?=
 =?utf-8?B?SDd1NElCOExQc05KL1FUeFlwRjE2THhJU1owdEVBd2hCak1ZSThDdzMvNW5n?=
 =?utf-8?B?MW5uS0JPajhKSW15RVY1ZTNZTlJ0MnpJY3Z2bzJOOUNmNElDTTdXSUtYK0t3?=
 =?utf-8?B?cUF0dkpDMDY0cnRJWGNKajhTb1M0MVdhYkxGdmhBa1k0MFdtS2JiYzJ6UDU3?=
 =?utf-8?B?OUphMm9iOGhUVy9Cb1Y1aXV6Y2NJdmNlL21kRlFQMmNRVUwraGtYK1RtWTlz?=
 =?utf-8?B?bEZNYmYrT3RCOVhpdVh1L1NjMkEzRzgvcHNGbnlGaHI0cEJtMzJpM2tNZFJ5?=
 =?utf-8?B?RDk4RTFxUWxlUnVYV3MxcGdWTXNvTkY3Nklkc3lWTzlqYzdlSUg5SGxBM040?=
 =?utf-8?B?MVYxV1dObFFqbFUwNURqVTlyekg4THMzcyt5ZmY1aG84ZlNVMkJjdlozYllu?=
 =?utf-8?B?eERQMUFOZkZlMWhYRkNKK3l4VXdWZGxFNk5Bbk5qVWw4M1QydWhqcXFKQVIz?=
 =?utf-8?B?MEdmZmRaTlNGVWt0bVp6QVVDMUUxYUgySjc1NHl6VDd4RmlpN2JqQ1lUdGp3?=
 =?utf-8?B?L3ZGbnhSZDRPdzZ0UWRpeGdIaGN2MU1xZ2RCM2NReXlxRDBLUUVlQ3RLZW5O?=
 =?utf-8?B?Qm5UNjgrU3A1blBiWHpsaFVadGdCN1NSc3NKc0NqRkJFZ3JwN1BpQXdrY1FT?=
 =?utf-8?B?SGZRdjR4bVZKYzY2Z05kb2ZoSm8rZE1YQmZUNnJDVWRiYXlHQ0U3d2ZDYVFW?=
 =?utf-8?B?MyswRDQ0RUNFSDErcmJsTnVrVUdZTGxRVlRydFUveXpPMGVKcEpnTlZ4OEVZ?=
 =?utf-8?B?VEZNaUVaTUtIcDRKbGhTVlBGdFNyOUY5TVhuMDUyNEt3L2piZTFpNTZZVHho?=
 =?utf-8?B?VThSeGZGK2w1ZDJUQ0hMaWtINW9OY3Z6cFN2T1JiVUVhUVlQaFRKN2dvb041?=
 =?utf-8?B?TFVqVHYxd2VLZFhEeVd3dUlKZVZaNW1PMFRwUUU4NGdaRnkwbTVQM3ZOU0pW?=
 =?utf-8?B?bTdwd1JMV1pvcDB1RFhvRGdNMzJMeW8rb3ExSnZDQjYyOTZBWW95OTVSeHRN?=
 =?utf-8?B?SFVKOXhCTjBnUVJJdGI4OHNFQmIzVTJ6QUZmMDQ5QXB2MzdtQWsrYXR3R3lp?=
 =?utf-8?B?RWg2aDBIcEJnYmJMUWxlbDVGRUxlUGVOWVByVWkyaE5Mc0tEbmxMR1FoZmw3?=
 =?utf-8?B?OE90NFp2STVmNTdEWkN1YkRNWUFDY2M5UVEvalRLWGRRc0pmM3lmN1VKZUdi?=
 =?utf-8?B?blFoT2dubGRwV2QzeGsvWmE0WWcrTHRsV01nd2I4cHh2NmFHeXBncWpwTWdH?=
 =?utf-8?B?a3B3Q1VFQWNkUWFLYXM1Q1NBTnJWSVRwWW9SN1VmTGNRTm9OTlpOT01pUzRZ?=
 =?utf-8?B?WXFPMFMwelRUV2M1L256cnBvS2JkWkxxSC84UDZkNDFpd05VNHhJcllOVGVo?=
 =?utf-8?B?c3FGYmdZNTNNWklUU2xlbmowSUEydEk4WFhsMGxzVmJOUk9EZ2l0bWhES2dX?=
 =?utf-8?B?WGFmVEVuKzJJK1cyekora1pnTGNIQS8ydTYvRTk0a0Y0TDRUTTNSakN2b25v?=
 =?utf-8?B?cFZGRytOR1Vmc0RxRnkvUmxRbFVBajVhZVI3MGZEYnVpYndHUXVMY0ZONVA1?=
 =?utf-8?B?Z2NJSElTa2ZPcjZoTldDZ09MM3FkdjVxdGhHNC9zdjF6cVhJQ0hoeXoybEV0?=
 =?utf-8?B?QUhITzdNSmN4dXVxbjkzU0M5SmRYUVNXbytkRnBibDUybnVpSFpsdzFaZi9r?=
 =?utf-8?B?OFdUS1ZXbUYzSkpGcUUxaDFFbUU1ekpsc0lxQ0JER01zQjFVZWNSdlNwU1Zv?=
 =?utf-8?B?MTNzU0ZOUStZc0J3RHFvR3RSSWFvd3F1dWhQUVJSOFVOelBDVWltVGRtbVlG?=
 =?utf-8?B?OVFRb0EzTHhlVkZJQmU4ZHdiaHdZcnBjOXIzbWtzTGk1YVNTUkkrdz09?=
X-Exchange-RoutingPolicyChecked: 
	XcW+yq83U2ep9R4T58F7GgpT90dcWgrX+uyKn8DvGblj892774EsfUsLmbXNQASfH5A8CYhALIMt5NiEl93yRRLErZX35g/fTuQXcW2ngflFrIO7cJUOqvv6f6HPOfpPtzMKzfLxfnXaMWJOKjFU1uo8Z6dJQZ7kMH471Pjv1PW6Gxu10jE+5Dozs7Ie97rwG7yNw+3SW2HJv0kroUewQquVptZf8SU4SY3HhMHNmVVG91BOUPoFqinp/ZztrnAL7HmQB81DPqy4wzrbaESqyR8cgRUoHvwE5EoeJ8LkFZhZYgJBdCfp+gK4CMd7pgX9RHELs+EnHQqjkZq75cwZBQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33059b57-c6df-4918-ab38-08dea41a020d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7621.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:01:14.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsTaXSAVd7f5dtJ9VxXIS9Sm5SiAwymw+czraog9GWNOphC5JywNphUR0sAQ6iH8h7S2n+/gVOw+UR4On64RRT4TzUrTopaSuaFrl+5W2cU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 6C7HkcKaATQG8x3DLQA1oYL1-8LVWwE0
X-Proofpoint-ORIG-GUID: -GyFl5P320DyH-ISJN5hBjsO9Wl_I0Ts
X-Authority-Analysis: v=2.4 cv=Pu+jqQM3 c=1 sm=1 tr=0 ts=69eeed9e cx=c_pps
 a=Og0UtPbLppQH9mpfBaDriA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=9ZQJ7c2RC_aSDkH4CBAA:9
 a=Xsb97kV5trg0EJB2:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA1MCBTYWx0ZWRfX7Sc7NgKqJPuN
 4JSEnCUr1JBbkf56vQtpObtmUx3pcOy03ktwc36xBT1dtchz2PVNEC1i39zeOYrqxGSzbAEGxcp
 8raOPi14ZOVBoHiC3zvgsAk2EDwKIzOCv3JouaD8gS6oycUoQQ+A3CUvh6lh5MrPjAejDVqWLVo
 61NiCFqGJKaOSzcJbAoR1doqWHTr0LASLZ2CByFDu/s8KNcktztsSqUmhNVfHclwoDCeH7UaZ10
 nzc9vEzqva4nXEjLZEZejTIID5eYlugJ7D/RanL15ycIOTsyMyQ/VuEZ2ok5ZMdqW3m7BsY3h+B
 F1BQa4BF2M8oNwqz0BzL4I1fOWBfJWeRSfTtEGVxkKsYmccIvWmkrdfs3Ib6bwtFeJONXEJD5Zj
 WfGw4Gl1c+8Hqc357GEGHk3meOn06mFFYOJLU0EuDmqvpAPcN83Jj2gKaNNP5zoL+qGAnA1MJ2b
 ePCyccgvmNzmX+RrRdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63R4SqiS2923247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 05:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235978

Because of ovmf use `CR' at the end of lines, I submitted the patch to=20
my github also

repo: https://github.com/hongxu-jia/openembedded-core.git
branch scarthgap

//Hongxu

On 4/27/26 12:56, hongxu via lists.openembedded.org wrote:
> According to [1], EDK2 contains a vulnerability in BIOS where an attack=
er may
> cause =E2=80=9C Improper Input Validation=E2=80=9D by local access. Suc=
cessful exploitation of
> this vulnerability could alter control flow in unexpected ways, potenti=
ally
> allowing arbitrary command execution and impacting Confidentiality, Int=
egrity,
> and Availability.
>
> Backport patches from upstream [2] to fix CVE-2025-2296
>
> Note: backport 0001-AmdSev-Halt-on-failed-blob-allocation.patch to appl=
y
> the CVE patches without confliction
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-2296
> [2] https://github.com/tianocore/edk2/pull/10628
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...mdSev-Halt-on-failed-blob-allocation.patch | 159 ++++
>   .../ovmf/ovmf/CVE-2025-2296-1.patch           | 762 +++++++++++++++++=
+
>   .../ovmf/ovmf/CVE-2025-2296-2.patch           | 175 ++++
>   .../ovmf/ovmf/CVE-2025-2296-3.patch           |  42 +
>   .../ovmf/ovmf/CVE-2025-2296-4.patch           |  34 +
>   .../ovmf/ovmf/CVE-2025-2296-5.patch           |  36 +
>   .../ovmf/ovmf/CVE-2025-2296-6.patch           |  54 ++
>   .../ovmf/ovmf/CVE-2025-2296-7.patch           | 124 +++
>   .../ovmf/ovmf/CVE-2025-2296-8.patch           | 125 +++
>   .../ovmf/ovmf/CVE-2025-2296-9.patch           | 108 +++
>   meta/recipes-core/ovmf/ovmf_git.bb            |  10 +
>   11 files changed, 1629 insertions(+)
>   create mode 100644 meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-fa=
iled-blob-allocation.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-1.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-2.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-3.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-4.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-5.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-6.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-7.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-8.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2296-9.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-failed-blo=
b-allocation.patch b/meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-fail=
ed-blob-allocation.patch
> new file mode 100644
> index 0000000000..181ff3376a
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0001-AmdSev-Halt-on-failed-blob-alloc=
ation.patch
> @@ -0,0 +1,159 @@
> +From dbec8dc5ba6341d816ffd495fcd7eeece1716bb4 Mon Sep 17 00:00:00 2001
> +From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
> +Date: Mon, 29 Apr 2024 20:07:19 +0000
> +Subject: [PATCH] AmdSev: Halt on failed blob allocation
> +
> +A malicious host may be able to undermine the fw_cfg
> +interface such that loading a blob fails.
> +
> +In this case rather than continuing to the next boot
> +option, the blob verifier should halt.
> +
> +For non-confidential guests, the error should be non-fatal.
> +
> +Signed-off-by: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
> +
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/10=
b4bb8d6d0c515ed9663691aea3684be8f7b0fc]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../BlobVerifierSevHashes.c                     | 17 ++++++++++++++++=
-
> + OvmfPkg/Include/Library/BlobVerifierLib.h       | 11 +++++++----
> + .../BlobVerifierLibNull/BlobVerifierNull.c      | 13 ++++++++-----
> + .../QemuKernelLoaderFsDxe.c                     |  9 ++++-----
> + 4 files changed, 35 insertions(+), 15 deletions(-)
> +
> +diff --git a/OvmfPkg/AmdSev/BlobVerifierLibSevHashes/BlobVerifierSevHa=
shes.c b/OvmfPkg/AmdSev/BlobVerifierLibSevHashes/BlobVerifierSevHashes.c
> +index 2e58794c3c..6477c5c3d3 100644
> +--- a/OvmfPkg/AmdSev/BlobVerifierLibSevHashes/BlobVerifierSevHashes.c
> ++++ b/OvmfPkg/AmdSev/BlobVerifierLibSevHashes/BlobVerifierSevHashes.c
> +@@ -80,6 +80,7 @@ FindBlobEntryGuid (
> +   @param[in] BlobName           The name of the blob
> +   @param[in] Buf                The data of the blob
> +   @param[in] BufSize            The size of the blob in bytes
> ++  @param[in] FetchStatus        The status of the previous blob fetch
> +
> +   @retval EFI_SUCCESS           The blob was verified successfully.
> +   @retval EFI_ACCESS_DENIED     The blob could not be verified, and t=
herefore
> +@@ -90,13 +91,27 @@ EFIAPI
> + VerifyBlob (
> +   IN  CONST CHAR16  *BlobName,
> +   IN  CONST VOID    *Buf,
> +-  IN  UINT32        BufSize
> ++  IN  UINT32        BufSize,
> ++  IN  EFI_STATUS    FetchStatus
> +   )
> + {
> +   CONST GUID  *Guid;
> +   INT32       Remaining;
> +   HASH_TABLE  *Entry;
> +
> ++  // Enter a dead loop if the fetching of this blob
> ++  // failed. This prevents a malicious host from
> ++  // circumventing the following checks.
> ++  if (EFI_ERROR (FetchStatus)) {
> ++    DEBUG ((
> ++      DEBUG_ERROR,
> ++      "%a: Fetching blob failed.\n",
> ++      __func__
> ++      ));
> ++
> ++    CpuDeadLoop ();
> ++  }
> ++
> +   if ((mHashesTable =3D=3D NULL) || (mHashesTableSize =3D=3D 0)) {
> +     DEBUG ((
> +       DEBUG_ERROR,
> +diff --git a/OvmfPkg/Include/Library/BlobVerifierLib.h b/OvmfPkg/Inclu=
de/Library/BlobVerifierLib.h
> +index 7e1af27574..09af1b77de 100644
> +--- a/OvmfPkg/Include/Library/BlobVerifierLib.h
> ++++ b/OvmfPkg/Include/Library/BlobVerifierLib.h
> +@@ -22,17 +22,20 @@
> +   @param[in] BlobName           The name of the blob
> +   @param[in] Buf                The data of the blob
> +   @param[in] BufSize            The size of the blob in bytes
> ++  @param[in] FetchStatus        The status of fetching this blob
> +
> +-  @retval EFI_SUCCESS           The blob was verified successfully.
> +-  @retval EFI_ACCESS_DENIED     The blob could not be verified, and t=
herefore
> +-                                should be considered non-secure.
> ++  @retval EFI_SUCCESS           The blob was verified successfully or=
 was not
> ++                                found in the hash table.
> ++  @retval EFI_ACCESS_DENIED     Kernel hashes not supported but the b=
oot can
> ++                                continue safely.
> + **/
> + EFI_STATUS
> + EFIAPI
> + VerifyBlob (
> +   IN  CONST CHAR16  *BlobName,
> +   IN  CONST VOID    *Buf,
> +-  IN  UINT32        BufSize
> ++  IN  UINT32        BufSize,
> ++  IN  EFI_STATUS    FetchStatus
> +   );
> +
> + #endif
> +diff --git a/OvmfPkg/Library/BlobVerifierLibNull/BlobVerifierNull.c b/=
OvmfPkg/Library/BlobVerifierLibNull/BlobVerifierNull.c
> +index e817c3cc95..db5320571c 100644
> +--- a/OvmfPkg/Library/BlobVerifierLibNull/BlobVerifierNull.c
> ++++ b/OvmfPkg/Library/BlobVerifierLibNull/BlobVerifierNull.c
> +@@ -16,18 +16,21 @@
> +   @param[in] BlobName           The name of the blob
> +   @param[in] Buf                The data of the blob
> +   @param[in] BufSize            The size of the blob in bytes
> ++  @param[in] FetchStatus        The status of the fetch of this blob
> +
> +-  @retval EFI_SUCCESS           The blob was verified successfully.
> +-  @retval EFI_ACCESS_DENIED     The blob could not be verified, and t=
herefore
> +-                                should be considered non-secure.
> ++  @retval EFI_SUCCESS           The blob was verified successfully or=
 was not
> ++                                found in the hash table.
> ++  @retval EFI_ACCESS_DENIED     Kernel hashes not supported but the b=
oot can
> ++                                continue safely.
> + **/
> + EFI_STATUS
> + EFIAPI
> + VerifyBlob (
> +   IN  CONST CHAR16  *BlobName,
> +   IN  CONST VOID    *Buf,
> +-  IN  UINT32        BufSize
> ++  IN  UINT32        BufSize,
> ++  IN  EFI_STATUS    FetchStatus
> +   )
> + {
> +-  return EFI_SUCCESS;
> ++  return FetchStatus;
> + }
> +diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/O=
vmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +index 3c12085f6c..cf58c97cd2 100644
> +--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> ++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +@@ -1042,6 +1042,7 @@ QemuKernelLoaderFsDxeEntrypoint (
> +   KERNEL_BLOB  *CurrentBlob;
> +   KERNEL_BLOB  *KernelBlob;
> +   EFI_STATUS   Status;
> ++  EFI_STATUS   FetchStatus;
> +   EFI_HANDLE   FileSystemHandle;
> +   EFI_HANDLE   InitrdLoadFile2Handle;
> +
> +@@ -1060,15 +1061,13 @@ QemuKernelLoaderFsDxeEntrypoint (
> +   //
> +   for (BlobType =3D 0; BlobType < KernelBlobTypeMax; ++BlobType) {
> +     CurrentBlob =3D &mKernelBlob[BlobType];
> +-    Status      =3D FetchBlob (CurrentBlob);
> +-    if (EFI_ERROR (Status)) {
> +-      goto FreeBlobs;
> +-    }
> ++    FetchStatus =3D FetchBlob (CurrentBlob);
> +
> +     Status =3D VerifyBlob (
> +                CurrentBlob->Name,
> +                CurrentBlob->Data,
> +-               CurrentBlob->Size
> ++               CurrentBlob->Size,
> ++               FetchStatus
> +                );
> +     if (EFI_ERROR (Status)) {
> +       goto FreeBlobs;
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-1.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2025-2296-1.patch
> new file mode 100644
> index 0000000000..5cdbb12f19
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-1.patch
> @@ -0,0 +1,762 @@
> +From 459f5ffa24ae8574657c4105af0ff7dc30ac428d Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Tue, 14 Jan 2025 17:36:39 +0100
> +Subject: [PATCH 01/10] OvmfPkg/QemuKernelLoaderFsDxe: rework direct ke=
rnel
> + boot filesystem
> +
> +Split KERNEL_BLOB struct into two:
> +
> + * One (KERNEL_BLOB_ITEMS) static array describing how to load (unname=
d)
> +   blobs from fw_cfg.
> + * And one (KERNEL_BLOB) dynamically allocated linked list carrying th=
e
> +   data blobs for the pseudo filesystem.
> +
> +Also add some debug logging.  Prefix most functions with 'QemuKernel'
> +for consistency and easier log file grepping.  Add some small helper
> +functions.
> +
> +This refactoring prepares for loading blobs in other ways.
> +No (intentional) change in filesystem protocol behavior.
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2025-2296
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/45=
9f5ffa24ae8574657c4105af0ff7dc30ac428d]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../QemuKernelLoaderFsDxe.c                   | 345 +++++++++++------=
-
> + 1 file changed, 205 insertions(+), 140 deletions(-)
> +
> +diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/O=
vmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +index cf58c97cd2..7ad1b3828f 100644
> +--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> ++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +@@ -31,13 +31,6 @@
> + //
> + // Static data that hosts the fw_cfg blobs and serves file requests.
> + //
> +-typedef enum {
> +-  KernelBlobTypeKernel,
> +-  KernelBlobTypeInitrd,
> +-  KernelBlobTypeCommandLine,
> +-  KernelBlobTypeMax
> +-} KERNEL_BLOB_TYPE;
> +-
> + typedef struct {
> +   CONST CHAR16    Name[8];
> +   struct {
> +@@ -45,11 +38,17 @@ typedef struct {
> +     FIRMWARE_CONFIG_ITEM CONST    DataKey;
> +     UINT32                        Size;
> +   }                             FwCfgItem[2];
> +-  UINT32          Size;
> +-  UINT8           *Data;
> +-} KERNEL_BLOB;
> ++} KERNEL_BLOB_ITEMS;
> ++
> ++typedef struct KERNEL_BLOB KERNEL_BLOB;
> ++struct KERNEL_BLOB {
> ++  CHAR16         Name[8];
> ++  UINT32         Size;
> ++  UINT8          *Data;
> ++  KERNEL_BLOB    *Next;
> ++};
> +
> +-STATIC KERNEL_BLOB  mKernelBlob[KernelBlobTypeMax] =3D {
> ++STATIC KERNEL_BLOB_ITEMS  mKernelBlobItems[] =3D {
> +   {
> +     L"kernel",
> +     {
> +@@ -69,7 +68,9 @@ STATIC KERNEL_BLOB  mKernelBlob[KernelBlobTypeMax] =3D=
 {
> +   }
> + };
> +
> +-STATIC UINT64  mTotalBlobBytes;
> ++STATIC KERNEL_BLOB  *mKernelBlobs;
> ++STATIC UINT64       mKernelBlobCount;
> ++STATIC UINT64       mTotalBlobBytes;
> +
> + //
> + // Device path for the handle that incorporates our "EFI stub filesys=
tem".
> +@@ -117,7 +118,7 @@ STATIC EFI_TIME  mInitTime;
> + typedef struct {
> +   UINT64               Signature; // Carries STUB_FILE_SIG.
> +
> +-  KERNEL_BLOB_TYPE     BlobType; // Index into mKernelBlob. KernelBlo=
bTypeMax
> ++  KERNEL_BLOB          *Blob;    // Index into mKernelBlob. KernelBlo=
bTypeMax
> +                                  // denotes the root directory of the=
 filesystem.
> +
> +   UINT64               Position; // Byte position for regular files;
> +@@ -177,7 +178,7 @@ typedef struct {
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileOpen (
> ++QemuKernelStubFileOpen (
> +   IN EFI_FILE_PROTOCOL   *This,
> +   OUT EFI_FILE_PROTOCOL  **NewHandle,
> +   IN CHAR16              *FileName,
> +@@ -196,7 +197,7 @@ StubFileOpen (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileClose (
> ++QemuKernelStubFileClose (
> +   IN EFI_FILE_PROTOCOL  *This
> +   )
> + {
> +@@ -219,7 +220,7 @@ StubFileClose (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileDelete (
> ++QemuKernelStubFileDelete (
> +   IN EFI_FILE_PROTOCOL  *This
> +   )
> + {
> +@@ -229,18 +230,17 @@ StubFileDelete (
> +
> + /**
> +   Helper function that formats an EFI_FILE_INFO structure into the
> +-  user-allocated buffer, for any valid KERNEL_BLOB_TYPE value (includ=
ing
> +-  KernelBlobTypeMax, which stands for the root directory).
> ++  user-allocated buffer, for any valid KERNEL_BLOB (including NULL,
> ++  which stands for the root directory).
> +
> +   The interface follows the EFI_FILE_GET_INFO -- and for directories,=
 the
> +   EFI_FILE_READ -- interfaces.
> +
> +-  @param[in]     BlobType     The KERNEL_BLOB_TYPE value identifying =
the fw_cfg
> ++  @param[in]     Blob         The KERNEL_BLOB identifying the fw_cfg
> +                               blob backing the STUB_FILE that informa=
tion is
> +-                              being requested about. If BlobType equa=
ls
> +-                              KernelBlobTypeMax, then information wil=
l be
> +-                              provided about the root directory of th=
e
> +-                              filesystem.
> ++                              being requested about. If Blob is NULL,
> ++                              then information will be provided about=
 the root
> ++                              directory of the filesystem.
> +
> +   @param[in,out] BufferSize  On input, the size of Buffer. On output,=
 the
> +                              amount of data returned in Buffer. In bo=
th cases,
> +@@ -257,10 +257,10 @@ StubFileDelete (
> + **/
> + STATIC
> + EFI_STATUS
> +-ConvertKernelBlobTypeToFileInfo (
> +-  IN KERNEL_BLOB_TYPE  BlobType,
> +-  IN OUT UINTN         *BufferSize,
> +-  OUT VOID             *Buffer
> ++QemuKernelBlobTypeToFileInfo (
> ++  IN KERNEL_BLOB  *Blob,
> ++  IN OUT UINTN    *BufferSize,
> ++  OUT VOID        *Buffer
> +   )
> + {
> +   CONST CHAR16  *Name;
> +@@ -272,17 +272,16 @@ ConvertKernelBlobTypeToFileInfo (
> +   EFI_FILE_INFO  *FileInfo;
> +   UINTN          OriginalBufferSize;
> +
> +-  if (BlobType =3D=3D KernelBlobTypeMax) {
> ++  if (Blob =3D=3D NULL) {
> +     //
> +     // getting file info about the root directory
> +     //
> ++    DEBUG ((DEBUG_INFO, "%a: file info: directory\n", __func__));
> +     Name      =3D L"\\";
> +-    FileSize  =3D KernelBlobTypeMax;
> ++    FileSize  =3D mKernelBlobCount;
> +     Attribute =3D EFI_FILE_READ_ONLY | EFI_FILE_DIRECTORY;
> +   } else {
> +-    CONST KERNEL_BLOB  *Blob;
> +-
> +-    Blob      =3D &mKernelBlob[BlobType];
> ++    DEBUG ((DEBUG_INFO, "%a: file info: \"%s\"\n", __func__, Blob->Na=
me));
> +     Name      =3D Blob->Name;
> +     FileSize  =3D Blob->Size;
> +     Attribute =3D EFI_FILE_READ_ONLY;
> +@@ -312,6 +311,23 @@ ConvertKernelBlobTypeToFileInfo (
> +   return EFI_SUCCESS;
> + }
> +
> ++STATIC
> ++KERNEL_BLOB *
> ++FindKernelBlob (
> ++  CHAR16  *FileName
> ++  )
> ++{
> ++  KERNEL_BLOB  *Blob;
> ++
> ++  for (Blob =3D mKernelBlobs; Blob !=3D NULL; Blob =3D Blob->Next) {
> ++    if (StrCmp (FileName, Blob->Name) =3D=3D 0) {
> ++      return Blob;
> ++    }
> ++  }
> ++
> ++  return NULL;
> ++}
> ++
> + /**
> +   Reads data from a file, or continues scanning a directory.
> +
> +@@ -349,25 +365,25 @@ ConvertKernelBlobTypeToFileInfo (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileRead (
> ++QemuKernelStubFileRead (
> +   IN EFI_FILE_PROTOCOL  *This,
> +   IN OUT UINTN          *BufferSize,
> +   OUT VOID              *Buffer
> +   )
> + {
> +-  STUB_FILE          *StubFile;
> +-  CONST KERNEL_BLOB  *Blob;
> +-  UINT64             Left;
> ++  STUB_FILE    *StubFile;
> ++  KERNEL_BLOB  *Blob;
> ++  UINT64       Left, Pos;
> +
> +   StubFile =3D STUB_FILE_FROM_FILE (This);
> +
> +   //
> +   // Scanning the root directory?
> +   //
> +-  if (StubFile->BlobType =3D=3D KernelBlobTypeMax) {
> ++  if (StubFile->Blob =3D=3D NULL) {
> +     EFI_STATUS  Status;
> +
> +-    if (StubFile->Position =3D=3D KernelBlobTypeMax) {
> ++    if (StubFile->Position =3D=3D mKernelBlobCount) {
> +       //
> +       // Scanning complete.
> +       //
> +@@ -375,8 +391,16 @@ StubFileRead (
> +       return EFI_SUCCESS;
> +     }
> +
> +-    Status =3D ConvertKernelBlobTypeToFileInfo (
> +-               (KERNEL_BLOB_TYPE)StubFile->Position,
> ++    for (Pos =3D 0, Blob =3D mKernelBlobs;
> ++         Pos < StubFile->Position;
> ++         Pos++, Blob =3D Blob->Next)
> ++    {
> ++    }
> ++
> ++    DEBUG ((DEBUG_INFO, "%a: file list: #%d \"%s\"\n", __func__, Pos,=
 Blob->Name));
> ++
> ++    Status =3D QemuKernelBlobTypeToFileInfo (
> ++               Blob,
> +                BufferSize,
> +                Buffer
> +                );
> +@@ -391,7 +415,7 @@ StubFileRead (
> +   //
> +   // Reading a file.
> +   //
> +-  Blob =3D &mKernelBlob[StubFile->BlobType];
> ++  Blob =3D StubFile->Blob;
> +   if (StubFile->Position > Blob->Size) {
> +     return EFI_DEVICE_ERROR;
> +   }
> +@@ -402,6 +426,7 @@ StubFileRead (
> +   }
> +
> +   if (Blob->Data !=3D NULL) {
> ++    DEBUG ((DEBUG_INFO, "%a: file read: \"%s\", %d bytes\n", __func__=
, Blob->Name, *BufferSize));
> +     CopyMem (Buffer, Blob->Data + StubFile->Position, *BufferSize);
> +   }
> +
> +@@ -435,7 +460,7 @@ StubFileRead (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileWrite (
> ++QemuKernelStubFileWrite (
> +   IN EFI_FILE_PROTOCOL  *This,
> +   IN OUT UINTN          *BufferSize,
> +   IN VOID               *Buffer
> +@@ -444,7 +469,7 @@ StubFileWrite (
> +   STUB_FILE  *StubFile;
> +
> +   StubFile =3D STUB_FILE_FROM_FILE (This);
> +-  return (StubFile->BlobType =3D=3D KernelBlobTypeMax) ?
> ++  return (StubFile->Blob =3D=3D NULL) ?
> +          EFI_UNSUPPORTED :
> +          EFI_WRITE_PROTECTED;
> + }
> +@@ -466,7 +491,7 @@ StubFileWrite (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileGetPosition (
> ++QemuKernelStubFileGetPosition (
> +   IN EFI_FILE_PROTOCOL  *This,
> +   OUT UINT64            *Position
> +   )
> +@@ -474,7 +499,7 @@ StubFileGetPosition (
> +   STUB_FILE  *StubFile;
> +
> +   StubFile =3D STUB_FILE_FROM_FILE (This);
> +-  if (StubFile->BlobType =3D=3D KernelBlobTypeMax) {
> ++  if (StubFile->Blob =3D=3D NULL) {
> +     return EFI_UNSUPPORTED;
> +   }
> +
> +@@ -501,7 +526,7 @@ StubFileGetPosition (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileSetPosition (
> ++QemuKernelStubFileSetPosition (
> +   IN EFI_FILE_PROTOCOL  *This,
> +   IN UINT64             Position
> +   )
> +@@ -511,7 +536,7 @@ StubFileSetPosition (
> +
> +   StubFile =3D STUB_FILE_FROM_FILE (This);
> +
> +-  if (StubFile->BlobType =3D=3D KernelBlobTypeMax) {
> ++  if (StubFile->Blob =3D=3D NULL) {
> +     if (Position =3D=3D 0) {
> +       //
> +       // rewinding a directory scan is allowed
> +@@ -526,7 +551,7 @@ StubFileSetPosition (
> +   //
> +   // regular file seek
> +   //
> +-  Blob =3D &mKernelBlob[StubFile->BlobType];
> ++  Blob =3D StubFile->Blob;
> +   if (Position =3D=3D MAX_UINT64) {
> +     //
> +     // seek to end
> +@@ -583,7 +608,7 @@ StubFileSetPosition (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileGetInfo (
> ++QemuKernelStubFileGetInfo (
> +   IN EFI_FILE_PROTOCOL  *This,
> +   IN EFI_GUID           *InformationType,
> +   IN OUT UINTN          *BufferSize,
> +@@ -596,8 +621,8 @@ StubFileGetInfo (
> +   StubFile =3D STUB_FILE_FROM_FILE (This);
> +
> +   if (CompareGuid (InformationType, &gEfiFileInfoGuid)) {
> +-    return ConvertKernelBlobTypeToFileInfo (
> +-             StubFile->BlobType,
> ++    return QemuKernelBlobTypeToFileInfo (
> ++             StubFile->Blob,
> +              BufferSize,
> +              Buffer
> +              );
> +@@ -685,7 +710,7 @@ StubFileGetInfo (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileSetInfo (
> ++QemuKernelStubFileSetInfo (
> +   IN EFI_FILE_PROTOCOL  *This,
> +   IN EFI_GUID           *InformationType,
> +   IN UINTN              BufferSize,
> +@@ -712,7 +737,7 @@ StubFileSetInfo (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileFlush (
> ++QemuKernelStubFileFlush (
> +   IN EFI_FILE_PROTOCOL  *This
> +   )
> + {
> +@@ -724,16 +749,16 @@ StubFileFlush (
> + //
> + STATIC CONST EFI_FILE_PROTOCOL  mEfiFileProtocolTemplate =3D {
> +   EFI_FILE_PROTOCOL_REVISION, // revision 1
> +-  StubFileOpen,
> +-  StubFileClose,
> +-  StubFileDelete,
> +-  StubFileRead,
> +-  StubFileWrite,
> +-  StubFileGetPosition,
> +-  StubFileSetPosition,
> +-  StubFileGetInfo,
> +-  StubFileSetInfo,
> +-  StubFileFlush,
> ++  QemuKernelStubFileOpen,
> ++  QemuKernelStubFileClose,
> ++  QemuKernelStubFileDelete,
> ++  QemuKernelStubFileRead,
> ++  QemuKernelStubFileWrite,
> ++  QemuKernelStubFileGetPosition,
> ++  QemuKernelStubFileSetPosition,
> ++  QemuKernelStubFileGetInfo,
> ++  QemuKernelStubFileSetInfo,
> ++  QemuKernelStubFileFlush,
> +   NULL,                       // OpenEx, revision 2
> +   NULL,                       // ReadEx, revision 2
> +   NULL,                       // WriteEx, revision 2
> +@@ -743,7 +768,7 @@ STATIC CONST EFI_FILE_PROTOCOL  mEfiFileProtocolTe=
mplate =3D {
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileOpen (
> ++QemuKernelStubFileOpen (
> +   IN EFI_FILE_PROTOCOL   *This,
> +   OUT EFI_FILE_PROTOCOL  **NewHandle,
> +   IN CHAR16              *FileName,
> +@@ -752,7 +777,7 @@ StubFileOpen (
> +   )
> + {
> +   CONST STUB_FILE  *StubFile;
> +-  UINTN            BlobType;
> ++  KERNEL_BLOB      *Blob;
> +   STUB_FILE        *NewStubFile;
> +
> +   //
> +@@ -774,21 +799,20 @@ StubFileOpen (
> +   // Only the root directory supports opening files in it.
> +   //
> +   StubFile =3D STUB_FILE_FROM_FILE (This);
> +-  if (StubFile->BlobType !=3D KernelBlobTypeMax) {
> ++  if (StubFile->Blob !=3D NULL) {
> +     return EFI_UNSUPPORTED;
> +   }
> +
> +   //
> +   // Locate the file.
> +   //
> +-  for (BlobType =3D 0; BlobType < KernelBlobTypeMax; ++BlobType) {
> +-    if (StrCmp (FileName, mKernelBlob[BlobType].Name) =3D=3D 0) {
> +-      break;
> +-    }
> +-  }
> ++  Blob =3D FindKernelBlob (FileName);
> +
> +-  if (BlobType =3D=3D KernelBlobTypeMax) {
> ++  if (Blob =3D=3D NULL) {
> ++    DEBUG ((DEBUG_INFO, "%a: file not found: \"%s\"\n", __func__, Fil=
eName));
> +     return EFI_NOT_FOUND;
> ++  } else {
> ++    DEBUG ((DEBUG_INFO, "%a: file opened: \"%s\"\n", __func__, FileNa=
me));
> +   }
> +
> +   //
> +@@ -800,7 +824,7 @@ StubFileOpen (
> +   }
> +
> +   NewStubFile->Signature =3D STUB_FILE_SIG;
> +-  NewStubFile->BlobType  =3D (KERNEL_BLOB_TYPE)BlobType;
> ++  NewStubFile->Blob      =3D Blob;
> +   NewStubFile->Position  =3D 0;
> +   CopyMem (
> +     &NewStubFile->File,
> +@@ -842,7 +866,7 @@ StubFileOpen (
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-StubFileSystemOpenVolume (
> ++QemuKernelStubFileSystemOpenVolume (
> +   IN EFI_SIMPLE_FILE_SYSTEM_PROTOCOL  *This,
> +   OUT EFI_FILE_PROTOCOL               **Root
> +   )
> +@@ -855,7 +879,7 @@ StubFileSystemOpenVolume (
> +   }
> +
> +   StubFile->Signature =3D STUB_FILE_SIG;
> +-  StubFile->BlobType  =3D KernelBlobTypeMax;
> ++  StubFile->Blob      =3D NULL;
> +   StubFile->Position  =3D 0;
> +   CopyMem (
> +     &StubFile->File,
> +@@ -869,13 +893,13 @@ StubFileSystemOpenVolume (
> +
> + STATIC CONST EFI_SIMPLE_FILE_SYSTEM_PROTOCOL  mFileSystem =3D {
> +   EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_REVISION,
> +-  StubFileSystemOpenVolume
> ++  QemuKernelStubFileSystemOpenVolume
> + };
> +
> + STATIC
> + EFI_STATUS
> + EFIAPI
> +-InitrdLoadFile2 (
> ++QemuKernelInitrdLoadFile2 (
> +   IN      EFI_LOAD_FILE2_PROTOCOL   *This,
> +   IN      EFI_DEVICE_PATH_PROTOCOL  *FilePath,
> +   IN      BOOLEAN                   BootPolicy,
> +@@ -883,8 +907,11 @@ InitrdLoadFile2 (
> +   OUT     VOID                      *Buffer     OPTIONAL
> +   )
> + {
> +-  CONST KERNEL_BLOB  *InitrdBlob =3D &mKernelBlob[KernelBlobTypeInitr=
d];
> ++  KERNEL_BLOB  *InitrdBlob;
> +
> ++  DEBUG ((DEBUG_INFO, "%a: initrd read\n", __func__));
> ++  InitrdBlob =3D FindKernelBlob (L"initrd");
> ++  ASSERT (InitrdBlob !=3D NULL);
> +   ASSERT (InitrdBlob->Size > 0);
> +
> +   if (BootPolicy) {
> +@@ -913,17 +940,33 @@ InitrdLoadFile2 (
> + }
> +
> + STATIC CONST EFI_LOAD_FILE2_PROTOCOL  mInitrdLoadFile2 =3D {
> +-  InitrdLoadFile2,
> ++  QemuKernelInitrdLoadFile2,
> + };
> +
> + //
> + // Utility functions.
> + //
> +
> ++STATIC VOID
> ++QemuKernelChunkedRead (
> ++  UINT8   *Dest,
> ++  UINT32  Bytes
> ++  )
> ++{
> ++  UINT32  Chunk;
> ++
> ++  while (Bytes > 0) {
> ++    Chunk =3D (Bytes < SIZE_1MB) ? Bytes : SIZE_1MB;
> ++    QemuFwCfgReadBytes (Chunk, Dest);
> ++    Bytes -=3D Chunk;
> ++    Dest  +=3D Chunk;
> ++  }
> ++}
> ++
> + /**
> +   Populate a blob in mKernelBlob.
> +
> +-  param[in,out] Blob  Pointer to the KERNEL_BLOB element in mKernelBl=
ob that is
> ++  param[in,out] Blob  Pointer to the KERNEL_BLOB_ITEMS that is
> +                       to be filled from fw_cfg.
> +
> +   @retval EFI_SUCCESS           Blob has been populated. If fw_cfg re=
ported a
> +@@ -934,35 +977,46 @@ STATIC CONST EFI_LOAD_FILE2_PROTOCOL  mInitrdLoa=
dFile2 =3D {
> + **/
> + STATIC
> + EFI_STATUS
> +-FetchBlob (
> +-  IN OUT KERNEL_BLOB  *Blob
> ++QemuKernelFetchBlob (
> ++  IN KERNEL_BLOB_ITEMS  *BlobItems
> +   )
> + {
> +-  UINT32  Left;
> +-  UINTN   Idx;
> +-  UINT8   *ChunkData;
> ++  UINT32       Size;
> ++  UINTN        Idx;
> ++  UINT8        *ChunkData;
> ++  KERNEL_BLOB  *Blob;
> ++  EFI_STATUS   Status;
> +
> +   //
> +   // Read blob size.
> +   //
> +-  Blob->Size =3D 0;
> +-  for (Idx =3D 0; Idx < ARRAY_SIZE (Blob->FwCfgItem); Idx++) {
> +-    if (Blob->FwCfgItem[Idx].SizeKey =3D=3D 0) {
> ++  for (Size =3D 0, Idx =3D 0; Idx < ARRAY_SIZE (BlobItems->FwCfgItem)=
; Idx++) {
> ++    if (BlobItems->FwCfgItem[Idx].SizeKey =3D=3D 0) {
> +       break;
> +     }
> +
> +-    QemuFwCfgSelectItem (Blob->FwCfgItem[Idx].SizeKey);
> +-    Blob->FwCfgItem[Idx].Size =3D QemuFwCfgRead32 ();
> +-    Blob->Size               +=3D Blob->FwCfgItem[Idx].Size;
> ++    QemuFwCfgSelectItem (BlobItems->FwCfgItem[Idx].SizeKey);
> ++    BlobItems->FwCfgItem[Idx].Size =3D QemuFwCfgRead32 ();
> ++    Size                          +=3D BlobItems->FwCfgItem[Idx].Size=
;
> +   }
> +
> +-  if (Blob->Size =3D=3D 0) {
> ++  if (Size =3D=3D 0) {
> +     return EFI_SUCCESS;
> +   }
> +
> ++  Blob =3D AllocatePool (sizeof (*Blob));
> ++  if (Blob->Data =3D=3D NULL) {
> ++    return EFI_OUT_OF_RESOURCES;
> ++  }
> ++
> ++  ZeroMem (Blob, sizeof (*Blob));
> ++
> +   //
> +   // Read blob.
> +   //
> ++  Status =3D StrCpyS (Blob->Name, sizeof (Blob->Name), BlobItems->Nam=
e);
> ++  ASSERT (!EFI_ERROR (Status));
> ++  Blob->Size =3D Size;
> +   Blob->Data =3D AllocatePool (Blob->Size);
> +   if (Blob->Data =3D=3D NULL) {
> +     DEBUG ((
> +@@ -972,6 +1026,7 @@ FetchBlob (
> +       (INT64)Blob->Size,
> +       Blob->Name
> +       ));
> ++    FreePool (Blob);
> +     return EFI_OUT_OF_RESOURCES;
> +   }
> +
> +@@ -984,34 +1039,48 @@ FetchBlob (
> +     ));
> +
> +   ChunkData =3D Blob->Data;
> +-  for (Idx =3D 0; Idx < ARRAY_SIZE (Blob->FwCfgItem); Idx++) {
> +-    if (Blob->FwCfgItem[Idx].DataKey =3D=3D 0) {
> ++  for (Idx =3D 0; Idx < ARRAY_SIZE (BlobItems->FwCfgItem); Idx++) {
> ++    if (BlobItems->FwCfgItem[Idx].DataKey =3D=3D 0) {
> +       break;
> +     }
> +
> +-    QemuFwCfgSelectItem (Blob->FwCfgItem[Idx].DataKey);
> ++    QemuFwCfgSelectItem (BlobItems->FwCfgItem[Idx].DataKey);
> ++    QemuKernelChunkedRead (ChunkData, BlobItems->FwCfgItem[Idx].Size)=
;
> ++    ChunkData +=3D BlobItems->FwCfgItem[Idx].Size;
> ++  }
> +
> +-    Left =3D Blob->FwCfgItem[Idx].Size;
> +-    while (Left > 0) {
> +-      UINT32  Chunk;
> ++  Blob->Next   =3D mKernelBlobs;
> ++  mKernelBlobs =3D Blob;
> ++  mKernelBlobCount++;
> ++  mTotalBlobBytes +=3D Blob->Size;
> ++  return EFI_SUCCESS;
> ++}
> +
> +-      Chunk =3D (Left < SIZE_1MB) ? Left : SIZE_1MB;
> +-      QemuFwCfgReadBytes (Chunk, ChunkData + Blob->FwCfgItem[Idx].Siz=
e - Left);
> +-      Left -=3D Chunk;
> +-      DEBUG ((
> +-        DEBUG_VERBOSE,
> +-        "%a: %Ld bytes remaining for \"%s\" (%d)\n",
> +-        __func__,
> +-        (INT64)Left,
> +-        Blob->Name,
> +-        (INT32)Idx
> +-        ));
> +-    }
> ++STATIC
> ++EFI_STATUS
> ++QemuKernelVerifyBlob (
> ++  CHAR16      *FileName,
> ++  EFI_STATUS  FetchStatus
> ++  )
> ++{
> ++  KERNEL_BLOB  *Blob;
> ++  EFI_STATUS   Status;
> +
> +-    ChunkData +=3D Blob->FwCfgItem[Idx].Size;
> ++  if ((StrCmp (FileName, L"kernel") !=3D 0) &&
> ++      (StrCmp (FileName, L"initrd") !=3D 0) &&
> ++      (StrCmp (FileName, L"cmdline") !=3D 0))
> ++  {
> ++    return EFI_SUCCESS;
> +   }
> +
> +-  return EFI_SUCCESS;
> ++  Blob   =3D FindKernelBlob (FileName);
> ++  Status =3D VerifyBlob (
> ++             FileName,
> ++             Blob ? Blob->Data : NULL,
> ++             Blob ? Blob->Size : 0,
> ++             FetchStatus
> ++             );
> ++  return Status;
> + }
> +
> + //
> +@@ -1038,13 +1107,13 @@ QemuKernelLoaderFsDxeEntrypoint (
> +   IN EFI_SYSTEM_TABLE  *SystemTable
> +   )
> + {
> +-  UINTN        BlobType;
> +-  KERNEL_BLOB  *CurrentBlob;
> +-  KERNEL_BLOB  *KernelBlob;
> +-  EFI_STATUS   Status;
> +-  EFI_STATUS   FetchStatus;
> +-  EFI_HANDLE   FileSystemHandle;
> +-  EFI_HANDLE   InitrdLoadFile2Handle;
> ++  UINTN              BlobIdx;
> ++  KERNEL_BLOB_ITEMS  *BlobItems;
> ++  KERNEL_BLOB        *Blob;
> ++  EFI_STATUS         Status;
> ++  EFI_STATUS         FetchStatus;
> ++  EFI_HANDLE         FileSystemHandle;
> ++  EFI_HANDLE         InitrdLoadFile2Handle;
> +
> +   if (!QemuFwCfgIsAvailable ()) {
> +     return EFI_NOT_FOUND;
> +@@ -1059,26 +1128,22 @@ QemuKernelLoaderFsDxeEntrypoint (
> +   //
> +   // Fetch all blobs.
> +   //
> +-  for (BlobType =3D 0; BlobType < KernelBlobTypeMax; ++BlobType) {
> +-    CurrentBlob =3D &mKernelBlob[BlobType];
> +-    FetchStatus =3D FetchBlob (CurrentBlob);
> +-
> +-    Status =3D VerifyBlob (
> +-               CurrentBlob->Name,
> +-               CurrentBlob->Data,
> +-               CurrentBlob->Size,
> ++  for (BlobIdx =3D 0; BlobIdx < ARRAY_SIZE (mKernelBlobItems); ++Blob=
Idx) {
> ++    BlobItems   =3D &mKernelBlobItems[BlobIdx];
> ++    FetchStatus =3D QemuKernelFetchBlob (BlobItems);
> ++
> ++    Status =3D QemuKernelVerifyBlob (
> ++               (CHAR16 *)BlobItems->Name,
> +                FetchStatus
> +                );
> +     if (EFI_ERROR (Status)) {
> +       goto FreeBlobs;
> +     }
> +-
> +-    mTotalBlobBytes +=3D CurrentBlob->Size;
> +   }
> +
> +-  KernelBlob =3D &mKernelBlob[KernelBlobTypeKernel];
> +-
> +-  if (KernelBlob->Data =3D=3D NULL) {
> ++  Blob =3D FindKernelBlob (L"kernel");
> ++  if (Blob =3D=3D NULL) {
> ++    DEBUG ((DEBUG_INFO, "%a: no kernel present -> quit\n", __func__))=
;
> +     Status =3D EFI_NOT_FOUND;
> +     goto FreeBlobs;
> +   }
> +@@ -1106,7 +1171,9 @@ QemuKernelLoaderFsDxeEntrypoint (
> +     goto FreeBlobs;
> +   }
> +
> +-  if (KernelBlob[KernelBlobTypeInitrd].Size > 0) {
> ++  Blob =3D FindKernelBlob (L"initrd");
> ++  if (Blob !=3D NULL) {
> ++    DEBUG ((DEBUG_INFO, "%a: initrd setup\n", __func__));
> +     InitrdLoadFile2Handle =3D NULL;
> +     Status                =3D gBS->InstallMultipleProtocolInterfaces =
(
> +                                    &InitrdLoadFile2Handle,
> +@@ -1141,13 +1208,11 @@ UninstallFileSystemHandle:
> +   ASSERT_EFI_ERROR (Status);
> +
> + FreeBlobs:
> +-  while (BlobType > 0) {
> +-    CurrentBlob =3D &mKernelBlob[--BlobType];
> +-    if (CurrentBlob->Data !=3D NULL) {
> +-      FreePool (CurrentBlob->Data);
> +-      CurrentBlob->Size =3D 0;
> +-      CurrentBlob->Data =3D NULL;
> +-    }
> ++  while (mKernelBlobs !=3D NULL) {
> ++    Blob         =3D mKernelBlobs;
> ++    mKernelBlobs =3D Blob->Next;
> ++    FreePool (Blob->Data);
> ++    FreePool (Blob);
> +   }
> +
> +   return Status;
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-2.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2025-2296-2.patch
> new file mode 100644
> index 0000000000..964ee306bf
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-2.patch
> @@ -0,0 +1,175 @@
> +From 20df7c42bd446fe725bfc78cdb40577456c421d8 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Wed, 15 Jan 2025 00:29:52 +0100
> +Subject: [PATCH 02/10] OvmfPkg/QemuKernelLoaderFsDxe: add support for =
named
> + blobs
> +
> +Load all named fw_cfg blobs with "etc/boot/" prefix into the pseudo
> +filesystem.
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2025-2296
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/20=
df7c42bd446fe725bfc78cdb40577456c421d8]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../QemuKernelLoaderFsDxe.c                   | 94 ++++++++++++++++--=
-
> + .../QemuKernelLoaderFsDxe.inf                 |  1 +
> + 2 files changed, 84 insertions(+), 11 deletions(-)
> +
> +diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/O=
vmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +index 7ad1b3828f..1f63adda0b 100644
> +--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> ++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +@@ -21,6 +21,7 @@
> + #include <Library/DebugLib.h>
> + #include <Library/DevicePathLib.h>
> + #include <Library/MemoryAllocationLib.h>
> ++#include <Library/PrintLib.h>
> + #include <Library/QemuFwCfgLib.h>
> + #include <Library/UefiBootServicesTableLib.h>
> + #include <Library/UefiRuntimeServicesTableLib.h>
> +@@ -32,12 +33,12 @@
> + // Static data that hosts the fw_cfg blobs and serves file requests.
> + //
> + typedef struct {
> +-  CONST CHAR16    Name[8];
> ++  CHAR16    Name[8];
> +   struct {
> +-    FIRMWARE_CONFIG_ITEM CONST    SizeKey;
> +-    FIRMWARE_CONFIG_ITEM CONST    DataKey;
> +-    UINT32                        Size;
> +-  }                             FwCfgItem[2];
> ++    FIRMWARE_CONFIG_ITEM    SizeKey;
> ++    FIRMWARE_CONFIG_ITEM    DataKey;
> ++    UINT32                  Size;
> ++  }                         FwCfgItem[2];
> + } KERNEL_BLOB_ITEMS;
> +
> + typedef struct KERNEL_BLOB KERNEL_BLOB;
> +@@ -989,15 +990,23 @@ QemuKernelFetchBlob (
> +
> +   //
> +   // Read blob size.
> ++  //   Size !=3D 0      ->  use size as-is
> ++  //   SizeKey !=3D 0   ->  read size from fw_cfg
> ++  //   both are 0     ->  unused entry
> +   //
> +   for (Size =3D 0, Idx =3D 0; Idx < ARRAY_SIZE (BlobItems->FwCfgItem)=
; Idx++) {
> +-    if (BlobItems->FwCfgItem[Idx].SizeKey =3D=3D 0) {
> ++    if ((BlobItems->FwCfgItem[Idx].SizeKey =3D=3D 0) &&
> ++        (BlobItems->FwCfgItem[Idx].Size =3D=3D 0))
> ++    {
> +       break;
> +     }
> +
> +-    QemuFwCfgSelectItem (BlobItems->FwCfgItem[Idx].SizeKey);
> +-    BlobItems->FwCfgItem[Idx].Size =3D QemuFwCfgRead32 ();
> +-    Size                          +=3D BlobItems->FwCfgItem[Idx].Size=
;
> ++    if (BlobItems->FwCfgItem[Idx].SizeKey) {
> ++      QemuFwCfgSelectItem (BlobItems->FwCfgItem[Idx].SizeKey);
> ++      BlobItems->FwCfgItem[Idx].Size =3D QemuFwCfgRead32 ();
> ++    }
> ++
> ++    Size +=3D BlobItems->FwCfgItem[Idx].Size;
> +   }
> +
> +   if (Size =3D=3D 0) {
> +@@ -1083,6 +1092,55 @@ QemuKernelVerifyBlob (
> +   return Status;
> + }
> +
> ++STATIC
> ++EFI_STATUS
> ++QemuKernelFetchNamedBlobs (
> ++  VOID
> ++  )
> ++{
> ++  struct {
> ++    UINT32    FileSize;
> ++    UINT16    FileSelect;
> ++    UINT16    Reserved;
> ++    CHAR8     FileName[QEMU_FW_CFG_FNAME_SIZE];
> ++  } *DirEntry;
> ++  KERNEL_BLOB_ITEMS  Items;
> ++  EFI_STATUS         Status;
> ++  EFI_STATUS         FetchStatus;
> ++  UINT32             Count;
> ++  UINT32             Idx;
> ++
> ++  QemuFwCfgSelectItem (QemuFwCfgItemFileDir);
> ++  Count =3D SwapBytes32 (QemuFwCfgRead32 ());
> ++
> ++  DirEntry =3D AllocatePool (sizeof (*DirEntry) * Count);
> ++  QemuFwCfgReadBytes (sizeof (*DirEntry) * Count, DirEntry);
> ++
> ++  for (Idx =3D 0; Idx < Count; ++Idx) {
> ++    if (AsciiStrnCmp (DirEntry[Idx].FileName, "etc/boot/", 9) !=3D 0)=
 {
> ++      continue;
> ++    }
> ++
> ++    ZeroMem (&Items, sizeof (Items));
> ++    UnicodeSPrint (Items.Name, sizeof (Items.Name), L"%a", DirEntry[I=
dx].FileName + 9);
> ++    Items.FwCfgItem[0].DataKey =3D SwapBytes16 (DirEntry[Idx].FileSel=
ect);
> ++    Items.FwCfgItem[0].Size    =3D SwapBytes32 (DirEntry[Idx].FileSiz=
e);
> ++
> ++    FetchStatus =3D QemuKernelFetchBlob (&Items);
> ++    Status      =3D QemuKernelVerifyBlob (
> ++                    (CHAR16 *)Items.Name,
> ++                    FetchStatus
> ++                    );
> ++    if (EFI_ERROR (Status)) {
> ++      FreePool (DirEntry);
> ++      return Status;
> ++    }
> ++  }
> ++
> ++  FreePool (DirEntry);
> ++  return EFI_SUCCESS;
> ++}
> ++
> + //
> + // The entry point of the feature.
> + //
> +@@ -1126,10 +1184,24 @@ QemuKernelLoaderFsDxeEntrypoint (
> +   }
> +
> +   //
> +-  // Fetch all blobs.
> ++  // Fetch named blobs.
> +   //
> ++  DEBUG ((DEBUG_INFO, "%a: named blobs (etc/boot/*)\n", __func__));
> ++  Status =3D QemuKernelFetchNamedBlobs ();
> ++  if (EFI_ERROR (Status)) {
> ++    goto FreeBlobs;
> ++  }
> ++
> ++  //
> ++  // Fetch traditional blobs.
> ++  //
> ++  DEBUG ((DEBUG_INFO, "%a: traditional blobs\n", __func__));
> +   for (BlobIdx =3D 0; BlobIdx < ARRAY_SIZE (mKernelBlobItems); ++Blob=
Idx) {
> +-    BlobItems   =3D &mKernelBlobItems[BlobIdx];
> ++    BlobItems =3D &mKernelBlobItems[BlobIdx];
> ++    if (FindKernelBlob (BlobItems->Name)) {
> ++      continue;
> ++    }
> ++
> +     FetchStatus =3D QemuKernelFetchBlob (BlobItems);
> +
> +     Status =3D QemuKernelVerifyBlob (
> +diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.inf b=
/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.inf
> +index 7b35adb8e0..a2f44bbca1 100644
> +--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.inf
> ++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.inf
> +@@ -30,6 +30,7 @@
> +   DebugLib
> +   DevicePathLib
> +   MemoryAllocationLib
> ++  PrintLib
> +   QemuFwCfgLib
> +   UefiBootServicesTableLib
> +   UefiDriverEntryPoint
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-3.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2025-2296-3.patch
> new file mode 100644
> index 0000000000..0ea2a70bf5
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-3.patch
> @@ -0,0 +1,42 @@
> +From adf385ecab69631952bdc8b774ebd77e82b94a00 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 16 Jan 2025 15:42:13 +0100
> +Subject: [PATCH 03/10] OvmfPkg/QemuKernelLoaderFsDxe: allow longer fil=
e names
> +
> +QEMU_FW_CFG_FNAME_SIZE is 56. 'etc/boot/' prefix is minus 9.  Add one
> +for the terminating '\0'.  Effective max size is 48.
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2025-2296
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/ad=
f385ecab69631952bdc8b774ebd77e82b94a00]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/O=
vmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +index 1f63adda0b..0947b6bf2d 100644
> +--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> ++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +@@ -33,7 +33,7 @@
> + // Static data that hosts the fw_cfg blobs and serves file requests.
> + //
> + typedef struct {
> +-  CHAR16    Name[8];
> ++  CHAR16    Name[48];
> +   struct {
> +     FIRMWARE_CONFIG_ITEM    SizeKey;
> +     FIRMWARE_CONFIG_ITEM    DataKey;
> +@@ -43,7 +43,7 @@ typedef struct {
> +
> + typedef struct KERNEL_BLOB KERNEL_BLOB;
> + struct KERNEL_BLOB {
> +-  CHAR16         Name[8];
> ++  CHAR16         Name[48];
> +   UINT32         Size;
> +   UINT8          *Data;
> +   KERNEL_BLOB    *Next;
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-4.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2025-2296-4.patch
> new file mode 100644
> index 0000000000..bba3b51c78
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-4.patch
> @@ -0,0 +1,34 @@
> +From 1111e9fe7078eed9e5c50e1808776ee40a629e16 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 16 Jan 2025 15:52:54 +0100
> +Subject: [PATCH 04/10] OvmfPkg/QemuKernelLoaderFsDxe: drop bogus asser=
t
> +
> +Triggers when trying to get root directory info.
> +Reproducer:
> + * Use qemu -kernel with something edk2 can not load.
> + * When dropped into the efi shell try inspect the file system.
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2025-2296
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/11=
11e9fe7078eed9e5c50e1808776ee40a629e16]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/O=
vmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +index 0947b6bf2d..3e1a876bf0 100644
> +--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> ++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +@@ -290,7 +290,6 @@ QemuKernelBlobTypeToFileInfo (
> +
> +   NameSize     =3D (StrLen (Name) + 1) * 2;
> +   FileInfoSize =3D OFFSET_OF (EFI_FILE_INFO, FileName) + NameSize;
> +-  ASSERT (FileInfoSize >=3D sizeof *FileInfo);
> +
> +   OriginalBufferSize =3D *BufferSize;
> +   *BufferSize        =3D FileInfoSize;
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-5.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2025-2296-5.patch
> new file mode 100644
> index 0000000000..e3a8292356
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-5.patch
> @@ -0,0 +1,36 @@
> +From 46ae4e4b9574530e5081e98af0495d6f6d28379f Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 16 Jan 2025 16:03:01 +0100
> +Subject: [PATCH 05/10] OvmfPkg/QemuKernelLoaderFsDxe: accept absolute =
paths
> +
> +EFI shell looks for "\startup.nsh".
> +Try "-fw_cfg name=3Detc/boot/startup.nsh,string=3D'echo hello'" ;)
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2025-2296
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/46=
ae4e4b9574530e5081e98af0495d6f6d28379f]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/O=
vmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +index 3e1a876bf0..5b90420dad 100644
> +--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> ++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +@@ -806,6 +806,11 @@ QemuKernelStubFileOpen (
> +   //
> +   // Locate the file.
> +   //
> ++  if (FileName[0] =3D=3D '\\') {
> ++    // also accept absolute paths, i.e. '\kernel' for 'kernel'
> ++    FileName++;
> ++  }
> ++
> +   Blob =3D FindKernelBlob (FileName);
> +
> +   if (Blob =3D=3D NULL) {
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-6.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2025-2296-6.patch
> new file mode 100644
> index 0000000000..3515efe008
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-6.patch
> @@ -0,0 +1,54 @@
> +From c45051450efbdae4a38f07998b3e7b77abe7173a Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Mon, 20 Jan 2025 11:28:37 +0100
> +Subject: [PATCH 06/10] OvmfPkg/QemuKernelLoaderFsDxe: don't quit when =
named
> + blobs are present
> +
> +Allows to use the qemu kernel loader pseudo file system for other
> +purposes than loading a linux kernel (or efi binary).  Passing
> +startup.nsh for EFI shell is one example.
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2025-2296
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c4=
5051450efbdae4a38f07998b3e7b77abe7173a]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c b/O=
vmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +index 5b90420dad..add914daa8 100644
> +--- a/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> ++++ b/OvmfPkg/QemuKernelLoaderFsDxe/QemuKernelLoaderFsDxe.c
> +@@ -71,6 +71,7 @@ STATIC KERNEL_BLOB_ITEMS  mKernelBlobItems[] =3D {
> +
> + STATIC KERNEL_BLOB  *mKernelBlobs;
> + STATIC UINT64       mKernelBlobCount;
> ++STATIC UINT64       mKernelNamedBlobCount;
> + STATIC UINT64       mTotalBlobBytes;
> +
> + //
> +@@ -1139,6 +1140,8 @@ QemuKernelFetchNamedBlobs (
> +       FreePool (DirEntry);
> +       return Status;
> +     }
> ++
> ++    mKernelNamedBlobCount++;
> +   }
> +
> +   FreePool (DirEntry);
> +@@ -1218,8 +1221,8 @@ QemuKernelLoaderFsDxeEntrypoint (
> +   }
> +
> +   Blob =3D FindKernelBlob (L"kernel");
> +-  if (Blob =3D=3D NULL) {
> +-    DEBUG ((DEBUG_INFO, "%a: no kernel present -> quit\n", __func__))=
;
> ++  if ((Blob =3D=3D NULL) && (mKernelNamedBlobCount =3D=3D 0)) {
> ++    DEBUG ((DEBUG_INFO, "%a: no kernel and no named blobs present -> =
quit\n", __func__));
> +     Status =3D EFI_NOT_FOUND;
> +     goto FreeBlobs;
> +   }
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-7.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2025-2296-7.patch
> new file mode 100644
> index 0000000000..a9d9922695
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-7.patch
> @@ -0,0 +1,124 @@
> +From 3da39f2cb681eb69f4eef54acd4b25d25cd7103d Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Wed, 10 Apr 2024 17:25:03 +0200
> +Subject: [PATCH 07/10] OvmfPkg/X86QemuLoadImageLib: support booting vi=
a shim
> +
> +Try load shim first.  In case that succeeded update the command line t=
o
> +list 'kernel' first so shim will fetch the kernel from the kernel load=
er
> +file system.
> +
> +This allows to use direct kernel boot with distro kernels and secure
> +boot enabled.  Usually distro kernels can only be verified by distro
> +shim using the distro keys compiled into the shim binary.
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2025-2296
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/3d=
a39f2cb681eb69f4eef54acd4b25d25cd7103d]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../X86QemuLoadImageLib/X86QemuLoadImageLib.c | 56 ++++++++++++++++++=
-
> + 1 file changed, 54 insertions(+), 2 deletions(-)
> +
> +diff --git a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c=
 b/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
> +index a7ab43ca74..e4dbc2dc7e 100644
> +--- a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
> ++++ b/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
> +@@ -57,6 +57,25 @@ STATIC CONST KERNEL_VENMEDIA_FILE_DEVPATH  mKernelD=
evicePath =3D {
> +   }
> + };
> +
> ++STATIC CONST KERNEL_VENMEDIA_FILE_DEVPATH  mShimDevicePath =3D {
> ++  {
> ++    {
> ++      MEDIA_DEVICE_PATH, MEDIA_VENDOR_DP,
> ++      { sizeof (VENDOR_DEVICE_PATH)       }
> ++    },
> ++    QEMU_KERNEL_LOADER_FS_MEDIA_GUID
> ++  },  {
> ++    {
> ++      MEDIA_DEVICE_PATH, MEDIA_FILEPATH_DP,
> ++      { sizeof (KERNEL_FILE_DEVPATH)      }
> ++    },
> ++    L"shim",
> ++  },  {
> ++    END_DEVICE_PATH_TYPE, END_ENTIRE_DEVICE_PATH_SUBTYPE,
> ++    { sizeof (EFI_DEVICE_PATH_PROTOCOL) }
> ++  }
> ++};
> ++
> + STATIC
> + VOID
> + FreeLegacyImage (
> +@@ -339,6 +358,7 @@ QemuLoadKernelImage (
> +   UINTN                      CommandLineSize;
> +   CHAR8                      *CommandLine;
> +   UINTN                      InitrdSize;
> ++  BOOLEAN                    Shim;
> +
> +   //
> +   // Redundant assignment to work around GCC48/GCC49 limitations.
> +@@ -351,11 +371,35 @@ QemuLoadKernelImage (
> +   Status =3D gBS->LoadImage (
> +                   FALSE,                    // BootPolicy: exact matc=
h required
> +                   gImageHandle,             // ParentImageHandle
> +-                  (EFI_DEVICE_PATH_PROTOCOL *)&mKernelDevicePath,
> ++                  (EFI_DEVICE_PATH_PROTOCOL *)&mShimDevicePath,
> +                   NULL,                     // SourceBuffer
> +                   0,                        // SourceSize
> +                   &KernelImageHandle
> +                   );
> ++  if (Status =3D=3D EFI_SUCCESS) {
> ++    Shim =3D TRUE;
> ++    DEBUG ((DEBUG_INFO, "%a: booting via shim\n", __func__));
> ++  } else {
> ++    Shim =3D FALSE;
> ++    if (Status =3D=3D EFI_SECURITY_VIOLATION) {
> ++      gBS->UnloadImage (KernelImageHandle);
> ++    }
> ++
> ++    if (Status !=3D EFI_NOT_FOUND) {
> ++      DEBUG ((DEBUG_INFO, "%a: LoadImage(shim): %r\n", __func__, Stat=
us));
> ++      return Status;
> ++    }
> ++
> ++    Status =3D gBS->LoadImage (
> ++                    FALSE,                  // BootPolicy: exact matc=
h required
> ++                    gImageHandle,           // ParentImageHandle
> ++                    (EFI_DEVICE_PATH_PROTOCOL *)&mKernelDevicePath,
> ++                    NULL,                   // SourceBuffer
> ++                    0,                      // SourceSize
> ++                    &KernelImageHandle
> ++                    );
> ++  }
> ++
> +   switch (Status) {
> +     case EFI_SUCCESS:
> +       break;
> +@@ -465,6 +509,13 @@ QemuLoadKernelImage (
> +     KernelLoadedImage->LoadOptionsSize +=3D sizeof (L" initrd=3Dinitr=
d") - 2;
> +   }
> +
> ++  if (Shim) {
> ++    //
> ++    // Prefix 'kernel ' in UTF-16.
> ++    //
> ++    KernelLoadedImage->LoadOptionsSize +=3D sizeof (L"kernel ") - 2;
> ++  }
> ++
> +   if (KernelLoadedImage->LoadOptionsSize =3D=3D 0) {
> +     KernelLoadedImage->LoadOptions =3D NULL;
> +   } else {
> +@@ -485,7 +536,8 @@ QemuLoadKernelImage (
> +     UnicodeSPrintAsciiFormat (
> +       KernelLoadedImage->LoadOptions,
> +       KernelLoadedImage->LoadOptionsSize,
> +-      "%a%a",
> ++      "%a%a%a",
> ++      (Shim =3D=3D FALSE)        ?  "" : "kernel ",
> +       (CommandLineSize =3D=3D 0) ?  "" : CommandLine,
> +       (InitrdSize =3D=3D 0)      ?  "" : " initrd=3Dinitrd"
> +       );
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-8.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2025-2296-8.patch
> new file mode 100644
> index 0000000000..97d77883fd
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-8.patch
> @@ -0,0 +1,125 @@
> +From 4b507b49664514d7f09e6b7a9ca2da25a5e440fd Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 11 Apr 2024 08:15:22 +0200
> +Subject: [PATCH 08/10] OvmfPkg/GenericQemuLoadImageLib: support bootin=
g via
> + shim
> +
> +Try load shim first.  In case that succeeded update the command line t=
o
> +list 'kernel' first so shim will fetch the kernel from the kernel load=
er
> +file system.
> +
> +This allows to use direct kernel boot with distro kernels and secure
> +boot enabled.  Usually distro kernels can only be verified by distro
> +shim using the distro keys compiled into the shim binary.
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2025-2296
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/4b=
507b49664514d7f09e6b7a9ca2da25a5e440fd]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../GenericQemuLoadImageLib.c                 | 56 ++++++++++++++++++=
-
> + 1 file changed, 54 insertions(+), 2 deletions(-)
> +
> +diff --git a/OvmfPkg/Library/GenericQemuLoadImageLib/GenericQemuLoadIm=
ageLib.c b/OvmfPkg/Library/GenericQemuLoadImageLib/GenericQemuLoadImageLi=
b.c
> +index b99fb350aa..9d0ba77755 100644
> +--- a/OvmfPkg/Library/GenericQemuLoadImageLib/GenericQemuLoadImageLib.=
c
> ++++ b/OvmfPkg/Library/GenericQemuLoadImageLib/GenericQemuLoadImageLib.=
c
> +@@ -57,6 +57,25 @@ STATIC CONST KERNEL_VENMEDIA_FILE_DEVPATH  mKernelD=
evicePath =3D {
> +   }
> + };
> +
> ++STATIC CONST KERNEL_VENMEDIA_FILE_DEVPATH  mShimDevicePath =3D {
> ++  {
> ++    {
> ++      MEDIA_DEVICE_PATH, MEDIA_VENDOR_DP,
> ++      { sizeof (VENDOR_DEVICE_PATH)       }
> ++    },
> ++    QEMU_KERNEL_LOADER_FS_MEDIA_GUID
> ++  },  {
> ++    {
> ++      MEDIA_DEVICE_PATH, MEDIA_FILEPATH_DP,
> ++      { sizeof (KERNEL_FILE_DEVPATH)      }
> ++    },
> ++    L"shim",
> ++  },  {
> ++    END_DEVICE_PATH_TYPE, END_ENTIRE_DEVICE_PATH_SUBTYPE,
> ++    { sizeof (EFI_DEVICE_PATH_PROTOCOL) }
> ++  }
> ++};
> ++
> + STATIC CONST SINGLE_VENMEDIA_NODE_DEVPATH  mQemuKernelLoaderFsDeviceP=
ath =3D {
> +   {
> +     {
> +@@ -174,6 +193,7 @@ QemuLoadKernelImage (
> +   UINTN                            CommandLineSize;
> +   CHAR8                            *CommandLine;
> +   UINTN                            InitrdSize;
> ++  BOOLEAN                          Shim;
> +
> +   //
> +   // Load the image. This should call back into the QEMU EFI loader f=
ile system.
> +@@ -181,11 +201,35 @@ QemuLoadKernelImage (
> +   Status =3D gBS->LoadImage (
> +                   FALSE,                    // BootPolicy: exact matc=
h required
> +                   gImageHandle,             // ParentImageHandle
> +-                  (EFI_DEVICE_PATH_PROTOCOL *)&mKernelDevicePath,
> ++                  (EFI_DEVICE_PATH_PROTOCOL *)&mShimDevicePath,
> +                   NULL,                     // SourceBuffer
> +                   0,                        // SourceSize
> +                   &KernelImageHandle
> +                   );
> ++  if (Status =3D=3D EFI_SUCCESS) {
> ++    Shim =3D TRUE;
> ++    DEBUG ((DEBUG_INFO, "%a: booting via shim\n", __func__));
> ++  } else {
> ++    Shim =3D FALSE;
> ++    if (Status =3D=3D EFI_SECURITY_VIOLATION) {
> ++      gBS->UnloadImage (KernelImageHandle);
> ++    }
> ++
> ++    if (Status !=3D EFI_NOT_FOUND) {
> ++      DEBUG ((DEBUG_INFO, "%a: LoadImage(shim): %r\n", __func__, Stat=
us));
> ++      return Status;
> ++    }
> ++
> ++    Status =3D gBS->LoadImage (
> ++                    FALSE,        // BootPolicy: exact match required
> ++                    gImageHandle, // ParentImageHandle
> ++                    (EFI_DEVICE_PATH_PROTOCOL *)&mKernelDevicePath,
> ++                    NULL,       // SourceBuffer
> ++                    0,          // SourceSize
> ++                    &KernelImageHandle
> ++                    );
> ++  }
> ++
> +   switch (Status) {
> +     case EFI_SUCCESS:
> +       break;
> +@@ -303,6 +347,13 @@ QemuLoadKernelImage (
> +     KernelLoadedImage->LoadOptionsSize +=3D sizeof (L" initrd=3Dinitr=
d") - 2;
> +   }
> +
> ++  if (Shim) {
> ++    //
> ++    // Prefix 'kernel ' in UTF-16.
> ++    //
> ++    KernelLoadedImage->LoadOptionsSize +=3D sizeof (L"kernel ") - 2;
> ++  }
> ++
> +   if (KernelLoadedImage->LoadOptionsSize =3D=3D 0) {
> +     KernelLoadedImage->LoadOptions =3D NULL;
> +   } else {
> +@@ -323,7 +374,8 @@ QemuLoadKernelImage (
> +     UnicodeSPrintAsciiFormat (
> +       KernelLoadedImage->LoadOptions,
> +       KernelLoadedImage->LoadOptionsSize,
> +-      "%a%a",
> ++      "%a%a%a",
> ++      (Shim =3D=3D FALSE)        ?  "" : "kernel ",
> +       (CommandLineSize =3D=3D 0) ?  "" : CommandLine,
> +       (InitrdSize =3D=3D 0)      ?  "" : " initrd=3Dinitrd"
> +       );
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-9.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2025-2296-9.patch
> new file mode 100644
> index 0000000000..8f0535cc4b
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2296-9.patch
> @@ -0,0 +1,108 @@
> +From 1549bf11cc94b135b6ad8fa5ebc34bdf7c18ba9c Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Tue, 17 Dec 2024 09:59:21 +0100
> +Subject: [PATCH 09/10] OvmfPkg/X86QemuLoadImageLib: make legacy loader
> + configurable.
> +
> +Add the 'opt/org.tianocore/EnableLegacyLoader' FwCfg option to
> +enable/disable the insecure legacy linux kernel loader.
> +
> +For now this is enabled by default.  Probably the default will be
> +flipped to disabled at some point in the future.
> +
> +Also print a warning to the screen in case the linux kernel secure
> +boot verification has failed.
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2025-2296
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/15=
49bf11cc94b135b6ad8fa5ebc34bdf7c18ba9c]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../X86QemuLoadImageLib/X86QemuLoadImageLib.c | 48 ++++++++++++++++--=
-
> + .../X86QemuLoadImageLib.inf                   |  1 +
> + 2 files changed, 42 insertions(+), 7 deletions(-)
> +
> +diff --git a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c=
 b/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
> +index e4dbc2dc7e..2d610f6bd3 100644
> +--- a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
> ++++ b/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.c
> +@@ -19,8 +19,10 @@
> + #include <Library/MemoryAllocationLib.h>
> + #include <Library/PrintLib.h>
> + #include <Library/QemuFwCfgLib.h>
> ++#include <Library/QemuFwCfgSimpleParserLib.h>
> + #include <Library/QemuLoadImageLib.h>
> + #include <Library/UefiBootServicesTableLib.h>
> ++#include <Library/UefiLib.h>
> + #include <Protocol/DevicePath.h>
> + #include <Protocol/LoadedImage.h>
> + #include <Protocol/OvmfLoadedX86LinuxKernel.h>
> +@@ -421,13 +423,45 @@ QemuLoadKernelImage (
> +     // Fall through
> +     //
> +     case EFI_ACCESS_DENIED:
> +-    //
> +-    // We are running with UEFI secure boot enabled, and the image fa=
iled to
> +-    // authenticate. For compatibility reasons, we fall back to the l=
egacy
> +-    // loader in this case.
> +-    //
> +-    // Fall through
> +-    //
> ++      //
> ++      // We are running with UEFI secure boot enabled, and the image =
failed to
> ++      // authenticate. For compatibility reasons, we fall back to the=
 legacy
> ++      // loader in this case (unless disabled via fw_cfg).
> ++      //
> ++    {
> ++      EFI_STATUS  RetStatus;
> ++      BOOLEAN     Enabled =3D TRUE;
> ++
> ++      AsciiPrint (
> ++        "OVMF: Secure boot image verification failed.  Consider using=
 the '-shim'\n"
> ++        "OVMF: command line switch for qemu (available in version 10.=
0 + newer).\n"
> ++        "\n"
> ++        );
> ++
> ++      RetStatus =3D QemuFwCfgParseBool (
> ++                    "opt/org.tianocore/EnableLegacyLoader",
> ++                    &Enabled
> ++                    );
> ++      if (EFI_ERROR (RetStatus)) {
> ++        Enabled =3D TRUE;
> ++      }
> ++
> ++      if (!Enabled) {
> ++        AsciiPrint (
> ++          "OVMF: Fallback to insecure legacy linux kernel loader is d=
isabled.\n"
> ++          "\n"
> ++          );
> ++        return EFI_ACCESS_DENIED;
> ++      } else {
> ++        AsciiPrint (
> ++          "OVMF: Using legacy linux kernel loader (insecure and depre=
cated).\n"
> ++          "\n"
> ++          );
> ++        //
> ++        // Fall through
> ++        //
> ++      }
> ++    }
> +     case EFI_UNSUPPORTED:
> +       //
> +       // The image is not natively supported or cross-type supported.=
 Let's try
> +diff --git a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.i=
nf b/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.inf
> +index c7ec041cb7..09babd3be8 100644
> +--- a/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.inf
> ++++ b/OvmfPkg/Library/X86QemuLoadImageLib/X86QemuLoadImageLib.inf
> +@@ -33,6 +33,7 @@
> +   LoadLinuxLib
> +   PrintLib
> +   QemuFwCfgLib
> ++  QemuFwCfgSimpleParserLib
> +   ReportStatusCodeLib
> +   UefiBootServicesTableLib
> +
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovm=
f/ovmf_git.bb
> index 319f03a8d2..f0503db9fb 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -26,6 +26,16 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;b=
ranch=3Dmaster;protocol=3Dhttps \
>              file://0004-reproducible.patch \
>              file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.pat=
ch \
>              file://0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-R=
esumeC.patch \
> +           file://0001-AmdSev-Halt-on-failed-blob-allocation.patch \
> +           file://CVE-2025-2296-1.patch \
> +           file://CVE-2025-2296-2.patch \
> +           file://CVE-2025-2296-3.patch \
> +           file://CVE-2025-2296-4.patch \
> +           file://CVE-2025-2296-5.patch \
> +           file://CVE-2025-2296-6.patch \
> +           file://CVE-2025-2296-7.patch \
> +           file://CVE-2025-2296-8.patch \
> +           file://CVE-2025-2296-9.patch \
>              "
>  =20
>   PV =3D "edk2-stable202402"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235976): https://lists.openembedded.org/g/openembed=
ded-core/message/235976
> Mute This Topic: https://lists.openembedded.org/mt/119026030/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
hongxu.jia@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


