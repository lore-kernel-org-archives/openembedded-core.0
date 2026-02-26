Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA94FD460A
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 02:43:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62168.1772073821634478277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 18:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=b1URRbnb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6517ff52a5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q2HT1g3651528
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 18:43:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=x1BqpAE66ToeSHmsxRXRViayc45wW0DAdeaW3ctHH60=; b=
	b1URRbnby/UAM1Yf16kQ9BoYwHmODYPnxzmy5+e/Ls/xCSNENO7X20G3U4kvz6n4
	OnJZYelXiV0o5CLY/KwQVFY28kKn0t7Qns01stY7pxqQSHX4KNIJ3mpHRJ261S+D
	0QG2TjNzC+w24nlM+vlzyVEDFkTbZRgvC7dJc9HL5CU1UgsbghovTweYKyLGAW2O
	JnzGj3B+iVFlWg8UIdIYmOdBrJzXqEA8k4+0xUtppiTwfSf4J7dn6fa7b5yGXjea
	fzCueTgCCy8mBinxK/Rii8SVc1SjA0B8wSUN655oO6njD8jhkfXFrl8BTmbxMoEF
	9VasUd3eFczW9fnOcuYojw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf8v45rpw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 18:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POxkUUpAfCOWBSvowLcSADj14vnt3iL7Hp/c1omUSSz9urwZtDRGSkifp0j3sQMW1zc9LUMUUVcvwc/XZz9hm1jyDUkEP+teFKFt97Sc4CQiWmsL7YR0ln1D3iQ6irSPzpeo8dZ+O6dP0cj7ROoVKvFKikEw/29vCTNDk1vxyWdNkrEUIhDSsAN+qJ8vMB2IeCRDjAQiE1RKGEMUQ5AmTZJZYttqZzJs6TmOGCDefKKcaiduzOrTGX/xfl2iaMDKDmC5GHzj9OkycTCZwiU5bmPcNyf0ubX02u8xjYNnUmX43T2BkGoNHW8amlaO74V30r5Nf0QTxOdpPiVSx8qc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1BqpAE66ToeSHmsxRXRViayc45wW0DAdeaW3ctHH60=;
 b=Iro2vkurD10I603OcqI9w8fdZYnQP8lMiIRjvgTbZsjYF/+nEYEy0XFmS1k4cf/K11WW0KsmNrDzQCKLUt/TakUogdPj7kHmJZmOFe1/XaOH3bCCGKG9gHsc0S9hstwsDz8NANmrtdtzuxhTQ1092o545mL2RX1jLL6Yj8drGDxh+kgOug9xmQvqbQkGLxPM/Y8EuLis3evx6IwASyIPxf3PEK+FmX05jVdtDspHCEyApejPVqzgFR2Am12iwnP9v5T3VEgjFujiO6VWbgfXJg95QLUq3SElLCCUYXMu/l2at3Z6Y0YBs8lOzgd29KjyrjU967wHWUfmPjzRvUi8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16)
 by IA0PR11MB7332.namprd11.prod.outlook.com (2603:10b6:208:434::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 02:43:37 +0000
Received: from DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a]) by DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a%6]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 02:43:37 +0000
Message-ID: <c782a636-4a30-4244-b11f-26b192b8cce4@windriver.com>
Date: Thu, 26 Feb 2026 10:43:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED
To: Randy MacLeod <randy.macleod@windriver.com>,
        Wang Mingyu <wangmy@fujitsu.com>,
        Alexander Kanavin
 <alex.kanavin@gmail.com>,
        "Chen, Qi" <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
        "Yang, Zhangle (Eric)" <Zhangle.Yang@windriver.com>
References: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
 <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::9) To DS0PR11MB7621.namprd11.prod.outlook.com
 (2603:10b6:8:143::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7621:EE_|IA0PR11MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 36716a1b-562d-4c1d-b9b1-08de74e0d750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	64YkbByLkN1qiAbxc+a3OVDkBQ04lEFrwUr61NXqT/uB3fEuI3WkMmFR2BmM+YpZZ3EFPmxfBABsOOy9RiKckpQKXP/T94YJuHxzne8FFLVVm3e8MObUrQmfUBcNO+eelvMZ1WwqzbHVmVNl5A97m9fYTy5GInKaoGEJHZxwMjPs9GzsrnBbgZE0JRTUQ83ejNeOEB0doRsvfDeMh9U+bx4CJhB6i0Ck82r5Y2s2MfEOVZw3J+umiCq1Nl9UsTsDlBk4VLl5EuUR5uTFKYVXsRAisqMOT5TERL15FrVhzdJHyHs5H4++p+lmc5yC6QeOL1b1lpui1O9RDjghVhguGdg5aHvIvgWn+mh7lBo/R4z6ns5HUVgu7ffXd7iDQaztmKzMgBZfy63OZAh3rNRDBLgJsnItl2as/VwyIRzKGY02Eb1YmVLfpxGIkTVH5QsM21jdKaHNjH5WGPSwP1ExnstGLaQEVJG0IcAlGJzcofg4ecRbQCkE67RcsrdADQil1rpRIzoQ5ndSd53G/kWPtWwPH+tIKuIlx6A8JjafzeWn8rQQMKTOmnkYgvxvXqCBXjiNKbfQIMXxBXtfMPyumI2sG9/g6hMgZqpU4w57a1qeVCI2EF63B9sr3jFtdVm/5MdC2GtJztTNN2de9lC+svEsC3mdfnlp/U34CwO659eI0+EWehqltPIQZZy8UdoW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7621.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akk5dmlGc3pzU2pLUHlkZTd0RUt4UUdwdWJRbmg2OEdKYjQzRzcxOGF5Si9x?=
 =?utf-8?B?SmF6aExDb3FzMVAvTkNOZ0ZCSm5CODVHb1BpM3h5cW9jclUxSmFieFc0UG5z?=
 =?utf-8?B?WHU2RVdOanJNT3Y5TWErdVhWdllZZkFuK1ltRnl2Rzd5U0hJVEUxNit4UHlC?=
 =?utf-8?B?cHZFcktuTTFQYWFKd05yTWVQNE45eWhpTzJUR3RDd0dwTjFEWE5UUmJaWlFY?=
 =?utf-8?B?cjR6WGZkUDhWeldWQnY2WHRYRFlnZEIxZWI2NG5nN1E1L09oUmYrUlllNm05?=
 =?utf-8?B?TE5veUZuSHNySEU4T0hTNUErYmUwU2lNZXVVOS9pUGQvMGlIRUR4V0c4MG9F?=
 =?utf-8?B?LzRnaHZKbzFuVHZienVSQjZ5Tzl0bER4TzIxZk43MlVnOHlOSlZuZ01jZWMy?=
 =?utf-8?B?dlFsMFpjNjhsMVlOK1lIV2JjbHc2NHpmVm5pWUE5S1dUcUNsYTJRdGdRNzhu?=
 =?utf-8?B?Y3NKenhtZWg1VUpJaFFJOFN2UG1tRlFhdTVmR0o1ekRJRWZoVFNOUGlaNWJw?=
 =?utf-8?B?dExGdms1NGd2S3NpUTBIRVVwaGJ2SUJWVHVMSTZvMU4vYmVwU3NZVktSbndw?=
 =?utf-8?B?d2NtbVNqNHB4OURLa1dpdGNWSUlTMk9oRWpCRE95ZUlHVFRCS2loTDAvY2FU?=
 =?utf-8?B?Y01GZGhGSGlSVlMyQ0tNTnROcFk2a0dyREpGYmtpcXpvOVBxUlliWHd0Z2pW?=
 =?utf-8?B?eDA2N2ZYOTJ0SlFqZjI2aStuek9Gc0g3WGw5MDZma1VEbjJrdkthMk80QVJJ?=
 =?utf-8?B?bXVONERKdUFpVGlBQWlFTWhoTUxBNVVNOTgvYkdUZy9SNmRoV0lhMUpnT3hX?=
 =?utf-8?B?T0Yva3pBUjNvdXVrZFoyQW8wQWFDLzJzM2xpZnJBUFFaelphSGhtWTlhMHdw?=
 =?utf-8?B?d2NYa0I5MzhZR1E1OHcxcW83VmwzWVlOV0dZQ1hxcGpmOTN0Z1V5NkJLMlhC?=
 =?utf-8?B?V1Zvd3Y4cC9HUWxSNzVjZ05IaUEyRXN5SnplNnErU1FadE05L1drUnhwOWtG?=
 =?utf-8?B?MytoRUFaQ3BpL2JFeE9pUHR2dGdMd3EwNVY4aGlSL2NweFUwR1F2NUk4MENw?=
 =?utf-8?B?eTVLVkpnOFMwek1tVHhUalBYNHp1bzh2WDFOaktpN1V1bFRyd2srYmlVb0Rv?=
 =?utf-8?B?dVl1NjZyUmlsZFJKcW5tVFdpM0dxQkxmQ0xtT1IyTHoxRmk4bnFvVDJpWFJS?=
 =?utf-8?B?ZlhqUWY5NEQzbHNVcWgrc3ZQRForcGFsSmVsdnc2cGhSc0lFTHBEcnZna1BC?=
 =?utf-8?B?eFdQb3lKZFZZUU16VFZhZ211SFJ1d3JxN2ZBbU9ZRmNOL2xzZ2dWWENncFpT?=
 =?utf-8?B?ZkhGRWJjTm9FZVRQMzVYUnR5Z2tkcWJnYXU2dUJsT2RaVUxCU2ozL3pFQlAx?=
 =?utf-8?B?aDdLZmo2V0NmQ0V0ZFhBOHVlN0I2TC9PcEthZ3VHQzVXOTk1ZWovVmdabmUx?=
 =?utf-8?B?Vm5WNmE3dWtnQUFqK25pemVIUkU1ZEE0UHBQMkI2Rld0TCs4aTJJMm0rZFV3?=
 =?utf-8?B?VTlwYzVMb3VPd3ZkemJ1WURLdktxZFo1YUlBOWc2YXY1TVlVVE5Bck0vQmt5?=
 =?utf-8?B?YUZZYWR6eTRUU09NdFhCNjNXMEFITGdSSVR3WXoxL0NDeGZ0WWg2blFMT0RM?=
 =?utf-8?B?M20vbWF2NFVzM1BzeExBalRSeWdNc2RTcUJGZERmVlFnMmQxNDBWbVNGMlY1?=
 =?utf-8?B?SHcwQVVNSEU5MmpyM2N2NUJoNXdMN21jUVR6YU9KYmI1UHdwV0xTV0RKcGlm?=
 =?utf-8?B?bG51eGNHVUdKN0h1N3ZXSTZkSm5Zdk5TUUlPVjNFSU1XMy9wVzloaXRvVWtM?=
 =?utf-8?B?OXVmT0IvY1diSTlvdUFjcnUvL05WWWgzbkJJa2NoaTI3a1BiZVF5M1hlbGJS?=
 =?utf-8?B?RW54N25zR1dSaG0vNjdscGIvbURheGFDUyt5aEgybWNDSXQ1NTI5TXVidTNP?=
 =?utf-8?B?eWNhYXpKektMLzdXWE9KMlJxRmwyNFh0bEdESGRvWWhLNjdJU3hGeUlRQmtK?=
 =?utf-8?B?a0VwaDVZZWpWR0N2YjZZOWFDUENKKzdHbUUrV1JPd0VHT3BqUWJKbngzK3Fz?=
 =?utf-8?B?UVZ3eU9jbXpIOUJFdEZkUUJYRDhsbFlQbzN2eVlIaVVvTDFTcTJHM0wrQzNJ?=
 =?utf-8?B?MFozclNCSld2MStOSjk4Q2ZUR0NqbXNNdjBNYTE4VlYrUXlvVlVRL3Z3ckZW?=
 =?utf-8?B?alkyVXlBVjZNWjhXTnRrYUp5WEp1VHhROVFEbFRnUVFiYTdMeHR3a1R4M0lO?=
 =?utf-8?B?ZE9LUnRTdEpuM0k4MzB3NVFhSzhIeGJCVHBEYzE3K2I5SWtiUE5YWElYYUh2?=
 =?utf-8?B?OHFYdE5yNDB5bGN6WkxhaU5RdmlQd202TFFWTjVPQWdldHhHNy8rdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36716a1b-562d-4c1d-b9b1-08de74e0d750
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7621.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 02:43:36.9362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwW4wpJA1ASgsPrEpk1MTrsVpaFcaRsNto/qUUWWZw/Ft01zRrp5YJ40RjZ7fp1LEnyKI/JDpXEh8OsmUi2ih3ejr3u3cVP1grYoLwZrIb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7332
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyMiBTYWx0ZWRfX4q0euuhcaXch
 HfJLp4dXYEK7q/R9HSPXwmgTCb2lc4WFRbfOqI2qquGOyCmTXH0klk45Zkqp4j3Bk7q1ahYAXSm
 jeY9aEfiRCEtPZEPymb/KawiRbK+SIV5ZJ3MMTpJDeObZX8PUzyocg6bSbEgj/Ew1gkHe6H4p50
 OKOzo9gGeVG+pfZ3JbP7Z3mXeb7olGqKDMGWm/8PUa2M0U0N5ZG89IzzVR9FxVGdBaXe5tGUH6n
 w2dNCciUQfz/Xsu5j68NR91JgJcDIbDL6+dl2lVZh+Wr/ckFORoFHlqx6N5JOIz9W5aswPQbs0F
 DHdMHiJUcONacTlI2/q4cW5/IWnnfZ/fGx+MRr/ziweP7Z/ar1hs+x0tLVE9q/EKBf6Ia6AQG8m
 gfrATn7YB9sne3rncomqT7EM+1fUcGYDJXDfVMUa3SyXaUUvw+hZtJZqHhDBUywH0d4mPjHiqvs
 EIJCO8Fdie+/ILl+bVQ==
X-Authority-Analysis: v=2.4 cv=SNNPlevH c=1 sm=1 tr=0 ts=699fb35c cx=c_pps
 a=r8gZD2gelFFA3OdVKTiE/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=qjeijYMx8Omyr4abFe8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: g6yrM0mxItPgyj6IOqShZwBo8hb_BKoa
X-Proofpoint-GUID: RMWKo0ATxM7TcKf4ACt01fws6XYDu2Wb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260022
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61Q2HT1g3651528
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 02:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231982

On 2/25/26 00:41, Randy MacLeod wrote:
> Hello Wang, and everyone,
>
> Alex mentioned in the YP tech call today that he's on vacation=20
> starting tomorrow, iirc.
>
> Alex,
> =C2=A0 =C2=A0 I assume that you won't be sending a patch series for the=
=20
> succeeding AUH upgrades.
>
> Wang,
> =C2=A0 =C2=A0Have you or do you plan to work on that?
>
> If not, Hongxu and maybe others at WR will work on that.
> I'm going to focus on the failed AUH upgrade set of recipes.
>
Add Qi which is doing investigation on AUH

//Hongxu

> ../Randy
>
>
> On 2026-02-18 1:41 p.m., Auto Upgrade Helper via=20
> lists.openembedded.org wrote:
>> Hello,
>>
>> this email is a notification from the Auto Upgrade Helper
>> that the automatic attempt to upgrade the recipe(s) *python3-rdflib* t=
o *7.6.0* has Succeeded.
>>
>> Next steps:
>>      - apply the patch: git am 0001-python3-rdflib-upgrade-7.5.0-7.6.0=
.patch
>>      - check the changes to upstream patches and summarize them in the=
 commit message,
>>      - compile an image that contains the package
>>      - perform some basic sanity tests
>>      - amend the patch and sign it off: git commit -s --reset-author -=
-amend
>>      - send it to the appropriate mailing list
>>
>> Alternatively, if you believe the recipe should not be upgraded at thi=
s time,
>> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
>> automatic upgrades would no longer be attempted.
>>
>> Please review the attached files for further information and build/upd=
ate failures.
>> Any problem please file a bug athttps://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler
>>
>> Regards,
>> The Upgrade Helper
>>
>> -- >8 --
>>  From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Sep 17 00:00:00 200=
1
>> From: Upgrade Helper<auh@yoctoproject.org>
>> Date: Wed, 18 Feb 2026 13:46:27 +0000
>> Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -> 7.6.0
>>
>> ---
>>   ...dflib_7.5.0.bb =3D> python3-rdflib_7.6.0.bb} | 25 +++++++++++++++=
++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>   rename meta/recipes-devtools/python/{python3-rdflib_7.5.0.bb =3D> py=
thon3-rdflib_7.6.0.bb} (34%)
>>
>> diff --git a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb b/me=
ta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>> similarity index 34%
>> rename from meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
>> rename to meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>> index e421aa2bac..1b830e8aa9 100644
>> --- a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
>> +++ b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>> @@ -1,10 +1,31 @@
>> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool up=
grade'.
>> +# The following is the difference between the old and the new license=
 text.
>> +# Please update the LICENSE value if needed, and summarize the change=
s in
>> +# the commit message via 'License-Update:' tag.
>> +# (example: 'License-Update: copyright years updated.')
>> +#
>> +# The changes:
>> +#
>> +# --- LICENSE
>> +# +++ LICENSE
>> +# @@ -1,6 +1,6 @@
>> +#  BSD 3-Clause License
>> +#
>> +# -Copyright (c) 2002-2025, RDFLib Team
>> +# +Copyright (c) 2002-2026, RDFLib Team
>> +#  All rights reserved.
>> +#
>> +#  Redistribution and use in source and binary forms, with or without
>> +#
>> +#
>> +
>>   SUMMARY =3D "RDFLib is a pure Python package for working with RDF"
>>   HOMEPAGE =3D"https://github.com/RDFLib/rdflib"
>>   SECTION =3D "devel/python"
>>   LICENSE =3D "BSD-3-Clause"
>> -LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D7006e973486c4700556f6d58cba=
0ab6c"
>> +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae=
53a3e"
>>  =20
>> -SRC_URI[sha256sum] =3D "663083443908b1830e567350d72e74d9948b310f82796=
6358d76eebdc92bf592"
>> +SRC_URI[sha256sum] =3D "6c831288d5e4a5a7ece85d0ccde9877d512a3d0f02d7c=
06455d00d6d0ea379df"
>>  =20
>>   inherit pypi python_poetry_core
>>  =20
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#231360):https://lists.openembedded.org/g/openembed=
ded-core/message/231360
>> Mute This Topic:https://lists.openembedded.org/mt/117879875/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux



