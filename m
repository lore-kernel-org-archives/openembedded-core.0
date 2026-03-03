Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626B8E67A8A
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 07:10:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12926.1772521853269616328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 23:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=kJTyuJte;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235r7p33963541
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 23:10:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=LRpWf9vZvQxhET0lTUDutTlXUkAxAzapZ01YoN96Hz0=; b=kJTyuJteWo9T
	4qIO77ndPj2xlWfNQKJPf9aFhNq6AKI5ZlDEj4meqGcfGcv0I1vv72nOiRdZzA8J
	Gs6DVsoreZYLTHbDJN/9lL2/nvMUn2/suvBttbhMK3C0F41gTmtY2TH6+G7BAI7P
	K3JUHD1x+WR80SEqH6lp8o4Hw1ywRvjpYaadaw6bv3ZIz9goHhohXdYgxozKok7L
	BDSYVtm9g7tQvObyHPQRbOVMmGHHtSL/VASq9rFow1S8yfxcEoVgWVI226ZbbPsx
	tFUHc4Oa7mVJMJgSkuU5h8M4ZuvNzl0eGeQ4WFWFm1L/4UdfqZeCtpevr88YTZv2
	iyVPTHM0bw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh43184-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 23:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t049c3+ExJGESpbRovjpYWIizgKG10PtHAPXCS+tInKEwAR+9FxENIaa6+7u3xqlr15WlLfjomU/1DBszO571IIS4nRHnqs3stBxYF+kqbntJueDZa/gIERBnm5s6zjiHLzi8GcuwZDk8vG3qcPQen1NE1r4pyd58YGIcduJo+7SiCBJnWZrUcnrlNgrGiS7kFisfdwMrYz8sggntdgRuACAIq5KfF72+ncYezYwGOAoU5H44KZNY5Nya+eHyw3a5uH1LGQRJk4k6k6ULy+ImzgX/sRDQtpueAXust3Aelr3waK/u+8lm13mrUIMKCgKZAoMvaG7fXUHzC0CdihqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRpWf9vZvQxhET0lTUDutTlXUkAxAzapZ01YoN96Hz0=;
 b=RX/AvyV/zZZ5mNM+jtRccAMI7Up4nyC3Cv+6oBzrwTCbQQyBSPjf3fzDkc/YyXgwlzVjLEbnq7xZ/uu2PilWi/pqjbv+McOT5hRyUzXLpWkfvFQ2NRKror/gBLJ8EWsz/H/HgoFXYzBW6IYKjvSSeGGrLEcPtJp1bg/WRmqaapuAUyKdikvuHx3tuMubhAtuUoBOygWDqXz4KNwwcQ1H4zGD/mzh/UUYLqs2mN3Wx2zJPfu4G6SY5h6u6hS/eheOuUhLQInMuCsN1JXK8hjiwurnmvZBa98vZOCnJXGnzbUhoTvrHSxybsaUaeAAv7dgfviXhD9p5brfUURBcsKQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 07:10:46 +0000
Received: from DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a]) by DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 07:10:46 +0000
Message-ID: <a493f426-aacf-497f-bb51-b7558d700695@windriver.com>
Date: Tue, 3 Mar 2026 15:10:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 07/19] openssl: upgrade 3.5.5 -> 3.6.1
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
 <20260303065640.2541884-7-hongxu.jia@windriver.com>
 <AS1PR10MB56974F259389E8F040610854FD7FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <AS1PR10MB56974F259389E8F040610854FD7FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0171.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::6) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7621:EE_|DM4PR11MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa930ec-5fe7-4190-cb7d-08de78f3fd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	N6bXBX/sdBBvbiRq976mdFb8ukIIdQiFNbwD0b0vYGsTJq62FZ0AnFEL7vUDPX4H7E96hmaIDYZbWbVgjqJ5p3pO1cg6KU0UO29qR+869Z80y1dcpDoNNvuIgm4jXn5RuwmfGBV+I2OZ12IUJHkK/h5bdSoK8MdG7MWapNJOH8xjjxVIWSY8ENRVZw4wpJRqGNWPGHPBgR+TC7vw+h+u3OOVs+Gmgg/4wEDPRwC6T6SxF5qhgnqgo2MF2PImt14ASnGwWaoKORau5B5YrH9LTrtegaVPLDm53CRutOPuVF2gINfbsIhgrdquTi4hJ0OqzJL4udcY/74JrofYsQ0bBxYKHlBYTKWBZZaElJ9H4B/o5ZRfPb3t/vTJAL1cR4m7cU7P9xbcYL4tiD7653gKlgbAEdCrNk0GauTfRlm2LDsWnmiUU2we/dMY7OiDhsbAWGr6/L0P3rU5RLyHfeIBisabb+8ozDgzHm5hF0pNNZ/W8ycRh2vd6x1Qv3ZmVl0loK1VsWI7ZHUsDhJ93lVNoSBBpW/oQ6l5Z1jAcxSmS2cGtKCJ/Gk+RTsZ3f+S2iHDYKH/JTu17TtxJfeuxCSpZwR8ubPZTbZr1GJcnMC0tKBsyjPh3l3FlT5eyMo9cMWwiw+uZDylC5ekkEREQFA2kfbEwbSy3UdNHPz9JW6QudMSNaDAzkSQGeEIJ+0tykxs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7621.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkZKdllkVlZMMWEyaTJBSlRsdUF6STFYUVRiVG1TUFZMT2VUdHUwc2Ztb1Bw?=
 =?utf-8?B?dU1zL3NuMElHakxTaWFtTVlKTUcyT3FSWnY3Umo1RStKWi8xUTVYRnpzWjVX?=
 =?utf-8?B?NVl2bUNidkNuUmJpcnJCbEJkQmc2UW52NGdzUVNzZ3pYWk4zdS9RYk95ckQz?=
 =?utf-8?B?VjhKaDhhb0pqeUg3cUxzcXl3aE1DQ0NoQUlRTkF5THJhTWhwMi9PbVBaRU5R?=
 =?utf-8?B?YktNaXNtaDNLTUM5eWhkaWtwMTJtbHVBeVkwMk5TK1VKN2JJa2pNOHR5Q0lu?=
 =?utf-8?B?Smo5OFBxYmtiaUY3UkhBTzREaWFUUlNGczF0NkhEZXV4N24wb0Q1eTk3U1Rz?=
 =?utf-8?B?Y0kwQXN4RkVSUDFVNGJwcDc3VnJtalN4UEtZWW0yNlpVQ05pbzE3N1NkbVZK?=
 =?utf-8?B?aFNxdGNWRDI2amJZT0EyTi9RckpGb1dHMXVIa3B4TVJ2S1pyeDdkSUcwaDRy?=
 =?utf-8?B?c2dUakxoQ0RQMkJDYkJmaTBFZjM5RWJxYnkvRzZKVThGWnh1b2dmbnJpQUpp?=
 =?utf-8?B?MlhaeU1vWVFYVmx2VFVZOGY4bXFKRmVES2l5cVBwVnRHRzYyVXI2YTZXaTJw?=
 =?utf-8?B?aC9KeFdpZnJnUm9jRSt5dFdqYzRZdnowK003NFZJbkg2NHFXRGFndGsybjVk?=
 =?utf-8?B?d3pNOUYzS1l0WWlTMUhhZHlFREo0Z0xzdHZkd3Frak0rM2dOdWlpSzNIZ05Q?=
 =?utf-8?B?c0hPcmN1cExKa2ZLdVZCTkJBNTNvNEl2MjBSbVQwRHpETlgyZ0Mxa004L2N3?=
 =?utf-8?B?Z2VnZ21nclYrdjhlbmw4YU1OUjg3TkpJNmloL1gyV2lrTk9acnVva1IrQ2pl?=
 =?utf-8?B?Z1hNbUQrcTk1clMzUU5WR0s3cEhWdGQrYStIYXc4STR4OTgxTEtpOGtMYlFI?=
 =?utf-8?B?cGNzVHlUVXh4NTI2WU5mSUlZWS9UTnpmcmgrTWlFeFI1ZFdGam4rNUI0ZUZl?=
 =?utf-8?B?ek1kb2JCU0hCVlUydHhxcVg2bEhxa1FnWjFPbjBtbkFWZDRsM1hHVFFlN3FN?=
 =?utf-8?B?KzlqS1YwYVFtdDN1OC8rbXFodG1kK21sMERoRDdaLzJMYmRTdkVxUEJacXgz?=
 =?utf-8?B?VDVBaWR0elBXRTN1eEpTV29NWXpaQzFFOXUyR3NTNGFFQmV1OGZ0cjVEa2ll?=
 =?utf-8?B?RExMeGNzUjN6eGo1RlNPR2pYa3NWd216bmRZTXZTV3ZnY3hWWjlsMDY0enhl?=
 =?utf-8?B?VW5YcEt0ZG5GOEhGdHgvaGtvSS9CMmQrZDc1MW55OWxxMjFtblNiaGgxZFVI?=
 =?utf-8?B?cGUzSExBTTVDcVFJWWl4M2htL1l5QzVSeGJBam9IQnN3WG1Cb1hUSzcxbmFu?=
 =?utf-8?B?OUJyUncwY2hBeHZybzdhdGRrai9DTFlCZjNVcGc3UnVEYW5GTzMrdklWTnZO?=
 =?utf-8?B?ZkdJUnl1ZjBNUnVXVmkvSGlMeHRwNWg5bW5ncGpiayt3SzBVcTZXaFo5MUVT?=
 =?utf-8?B?YUJTbnliWVpvb2JkYmhOalY4ekRKbWJxNDJXV1hNMzN1bGhRZDJIckRoZHRD?=
 =?utf-8?B?eTFZa1ZLREM1Um1RL1pJNytnWisvS0I3dUY3RTZrQmpXU1VqR0JTU1h6akpa?=
 =?utf-8?B?bGgzR1duaVl6d29sVklXUEF4NTJnRTRjc1VWUEpXT0RLNFhzUFF5YlJJWE9y?=
 =?utf-8?B?ZzE1bUdaZ3BiZ2ZvU2daVXc3bWU3VE82SnBray9ha1NPMHRZWDhqRVRWczRV?=
 =?utf-8?B?Nyt6WGJJU1BEZTNRNXBtaWpBbHJyMlJQK2VCTUx3cWlPMGZidXdnWndGVHIw?=
 =?utf-8?B?WStGdUFEWmhNR2N3L1Fyd3lzTnpSSDYvQ1ovZlZNOFlqQTZFcFAzWHEyeGEx?=
 =?utf-8?B?VFR4WkcxZm5GQXF4c3FlczZOTWgzRDc5YzR1aTdOV2dJUmthYW0xakJZYWpC?=
 =?utf-8?B?Vzgva1VtbkhlWWVnQlliOWZpRXN1Qnhqd254N2VDemtGblczVDlnTzljK0g4?=
 =?utf-8?B?OU8zSzRyK2N3UEx0c0lQelhYL1Y5YlR6bDBUT2J6aG5IalRsbmtKRFQvOTds?=
 =?utf-8?B?Z2QxdnYxd2lnc09ydHM1eHgvaWxIWE9pV3o4QWZQSFVNWDdidmtxazI3d21J?=
 =?utf-8?B?UzhnZmpaQlcvb21BSis3Z3kxcSsvYkJaOGVEQXJaQ3JlbVhueTF6S2cyNHEw?=
 =?utf-8?B?VVFuWHd1ZmI1bWpOeWxIS1lZOUVvKzMrZ0VCVGEwYzZ5eGtuMnlBWElGRDVP?=
 =?utf-8?B?V2NITkRDdzM0dTN5MzVkbzlTK21haFVIaXFhK2pXMjkvck1RYU1iSnF6Ykta?=
 =?utf-8?B?MGd0UDVNTmlkRVJOQ0FKZTYrTVNjTndHU3NDSHNLcVhsUE9WekxuTUZidmNq?=
 =?utf-8?B?Qms0WVBKNlU3RitmMWVHNHZQeEdzcGlSQmR0SkI1UWd2NG54aDRvUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa930ec-5fe7-4190-cb7d-08de78f3fd16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 07:10:46.1155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6Y2KnXomfSrGVBnfR2F0j3/jmBfh3ClMntkZBcYkK4sVdxthSbHby5kEdonqd+6uEzqmRXe2DdUanEuisHodQxS+95dsl2AlunuLXGqYBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: f9cU-LMnFjalGMmeZrIaMFNIghqOnsB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0OSBTYWx0ZWRfX4VzjmqZy1buq
 7mUjNAVtS6es2+QrvUgwEI2HuUpUX64zQjnx3RmyCx641KHLowHJcjSLXQjBVdtA532R3zH9Bz2
 rkQZqC2ecUPVpP+qdHRJOeGYhlpHdJCDztCf3LZceod34TWaUiNW3ksJ7cCnWrxRaIvN8zeBEPy
 210R89g5PjqmqMVtcjDId0K2YI8xyzwVhJyohxENH9cRFjbWQ+nqdZykVP+XkLUT5fTdNSBEglL
 bDjChAgQzImCGiWWhSvFeZdNOplyPmVJJPBrskoyz89fkq86kKdvR/aLGmnrj2UqM2DrYgBJaHs
 266DKpu8GdCf1JzE+FahgHIXz+jQ+LI9wAZHi5BnxrdmuqXS6KCiVDM9dd7fmxRvTidrxq4hw+G
 WFSnucc9SIlmvizvav5w9RijqySCavxbMPiLzGRACyHnr0x3sLER6FyZtoG3kEgSxkrQwR5bInN
 UdBY342bniFyCiJNBag==
X-Proofpoint-GUID: 9Ng3PPQIWK7pKTNC3-sY7VNWu28Bz7eG
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a6897c cx=c_pps
 a=CD2IJdD5qp8L8UJuiUkm2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=s9e2T47jAAAA:8 a=FOZC9FOpAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=k-42gJp3AAAA:8 a=ilKATfAMAAAA:8 a=pGLkceISAAAA:8 a=mnQmNr8GAAAA:8
 a=oCrMlvxrpkL8TO54_SMA:9 a=uCHaoWw3D5WkjwlE:21 a=PRpDppDLrCsA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=CxX688lCtmX4rDtm-yj2:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
 a=73awMTU50e6eLoBjGbzZ:22 a=kJ1edbOCtaRpYhyEJ7sn:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6235r7p33963541
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 07:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232259

On 3/3/26 15:05, Marko, Peter wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> This should not be taken until Wrynose is branched-of.
> We want 3.5.x which is LTS.

OK, according to https://openssl-library.org/source/,=C2=A0 3.5.5 is alre=
ady=20
newest in 3.5.x, please drop this patch

//Hongxu

> Also the most relevant release notes for the commit message are those f=
rom 3.6.0.
> Patches from 3.6.1 are already in 3.5.5...
>
> Peter
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of hongxu via
>> lists.openembedded.org
>> Sent: Tuesday, March 3, 2026 7:56
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 07/19] openssl: upgrade 3.5.5 -> 3.6.1
>>
>> Release note [1]:
>>
>> OpenSSL 3.6.1 is a security patch release. The most severe CVE fixed i=
n this
>> release is High.
>>
>> This release incorporates the following bug fixes and mitigations:
>>
>>      Fixed Improper validation of PBMAC1 parameters in PKCS#12 MAC ver=
ification.
>>      (CVE-2025-11187)
>>
>>      Fixed Stack buffer overflow in CMS AuthEnvelopedData parsing.
>>      (CVE-2025-15467)
>>
>>      Fixed NULL dereference in SSL_CIPHER_find() function on unknown c=
ipher ID.
>>      (CVE-2025-15468)
>>
>>      Fixed openssl dgst one-shot codepath silently truncates inputs >1=
6 MiB.
>>      (CVE-2025-15469)
>>
>>      Fixed TLS 1.3 CompressedCertificate excessive memory allocation.
>>      (CVE-2025-66199)
>>
>>      Fixed Heap out-of-bounds write in BIO_f_linebuffer on short write=
s.
>>      (CVE-2025-68160)
>>
>>      Fixed Unauthenticated/unencrypted trailing bytes with low-level O=
CB
>>      function calls.
>>      (CVE-2025-69418)
>>
>>      Fixed Out of bounds write in PKCS12_get_friendlyname() UTF-8 conv=
ersion.
>>      (CVE-2025-69419)
>>
>>      Fixed Missing ASN1_TYPE validation in TS_RESP_verify_response()
>>      function.
>>      (CVE-2025-69420)
>>
>>      Fixed NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() fu=
nction.
>>      (CVE-2025-69421)
>>
>>      Fixed Missing ASN1_TYPE validation in PKCS#12 parsing.
>>      (CVE-2026-22795)
>>
>>      Fixed ASN1_TYPE Type Confusion in the PKCS7_digest_from_attribute=
s()
>>      function.
>>      (CVE-2026-22796)
>>
>>      Fixed a regression in X509_V_FLAG_CRL_CHECK_ALL flag handling by
>>      restoring its pre-3.6.0 behaviour.
>>
>>      Fixed a regression in handling stapled OCSP responses causing han=
dshake
>>      failures for OpenSSL 3.6.0 servers with various client implementa=
tions.
>>
>> [1] https://github.com/openssl/openssl/releases/tag/openssl-3.6.1
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   ...ke-history-reporting-when-test-fails.patch | 25 ++++++++---------=
--
>>   ...1-Configure-do-not-tweak-mips-cflags.patch |  6 ++---
>>   ...sysroot-and-debug-prefix-map-from-co.patch |  7 +++---
>>   .../0001-extend-check_cwm-test-timeout.patch  |  4 +--
>>   .../{openssl_3.5.5.bb =3D> openssl_3.6.1.bb}    |  2 +-
>>   5 files changed, 20 insertions(+), 24 deletions(-)
>>   rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb =3D>
>> openssl_3.6.1.bb} (99%)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-hand=
shake-
>> history-reporting-when-test-fails.patch b/meta/recipes-
>> connectivity/openssl/openssl/0001-Added-handshake-history-reporting-wh=
en-test-
>> fails.patch
>> index a74c79303f..5104a3cc00 100644
>> --- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-h=
istory-
>> reporting-when-test-fails.patch
>> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-h=
istory-
>> reporting-when-test-fails.patch
>> @@ -1,4 +1,4 @@
>> -From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 200=
1
>> +From cda360c014be3c6bfbec23045ae0cb784908cf59 Mon Sep 17 00:00:00 200=
1
>>   From: William Lyu <William.Lyu@windriver.com>
>>   Date: Fri, 20 Oct 2023 16:22:37 -0400
>>   Subject: [PATCH] Added handshake history reporting when test fails
>> @@ -13,10 +13,10 @@ Signed-off-by: William Lyu <William.Lyu@windriver.=
com>
>>    3 files changed, 217 insertions(+), 33 deletions(-)
>>
>>   diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
>> -index f611b3a..5703b48 100644
>> +index 5e56060..f9bb035 100644
>>   --- a/test/helpers/handshake.c
>>   +++ b/test/helpers/handshake.c
>> -@@ -25,6 +25,102 @@
>> +@@ -26,6 +26,102 @@
>>    #include <netinet/sctp.h>
>>    #endif
>>
>> @@ -119,7 +119,7 @@ index f611b3a..5703b48 100644
>>    HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
>>    {
>>        HANDSHAKE_RESULT *ret;
>> -@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server,=
 SSL
>> *client,
>> +@@ -828,15 +924,6 @@ static void configure_handshake_ssl(SSL *server,=
 SSL
>> *client,
>>            SSL_set_post_handshake_auth(client, 1);
>>    }
>>
>> @@ -135,7 +135,7 @@ index f611b3a..5703b48 100644
>>    /* An SSL object and associated read-write buffers. */
>>    typedef struct peer_st {
>>        SSL *ssl;
>> -@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)
>> +@@ -1181,16 +1268,6 @@ static void do_shutdown_step(PEER *peer)
>>        }
>>    }
>>
>> @@ -152,7 +152,7 @@ index f611b3a..5703b48 100644
>>    static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
>>    {
>>        switch (test_ctx->handshake_mode) {
>> -@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX
>> *test_ctx, PEER *peer,
>> +@@ -1268,19 +1345,6 @@ static void do_connect_step(const SSL_TEST_CTX
>> *test_ctx, PEER *peer,
>>        }
>>    }
>>
>> @@ -172,7 +172,7 @@ index f611b3a..5703b48 100644
>>    /*
>>     * Determine the handshake outcome.
>>     * last_status: the status of the peer to have acted last.
>> -@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal=
(
>> +@@ -1645,6 +1709,10 @@ static HANDSHAKE_RESULT
>> *do_handshake_internal(
>>
>>        start =3D time(NULL);
>>
>> @@ -183,7 +183,7 @@ index f611b3a..5703b48 100644
>>        /*
>>         * Half-duplex handshake loop.
>>         * Client and server speak to each other synchronously in the s=
ame process.
>> -@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal=
(
>> +@@ -1666,6 +1734,10 @@ static HANDSHAKE_RESULT
>> *do_handshake_internal(
>>                    0 /* server went last */);
>>            }
>>
>> @@ -195,7 +195,7 @@ index f611b3a..5703b48 100644
>>            case HANDSHAKE_SUCCESS:
>>                client_turn_count =3D 0;
>>   diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
>> -index 78b03f9..b9967c2 100644
>> +index 7cf654f..b4459d7 100644
>>   --- a/test/helpers/handshake.h
>>   +++ b/test/helpers/handshake.h
>>   @@ -1,5 +1,5 @@
>> @@ -300,7 +300,7 @@ index 78b03f9..b9967c2 100644
>>   +
>>    #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */
>>   diff --git a/test/ssl_test.c b/test/ssl_test.c
>> -index ea60851..9d6b093 100644
>> +index 27b4415..64a13c0 100644
>>   --- a/test/ssl_test.c
>>   +++ b/test/ssl_test.c
>>   @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx =3D NULL;
>> @@ -360,7 +360,4 @@ index ea60851..9d6b093 100644
>>   +
>>        return ret;
>>    }
>> -
>> ---
>> -2.25.1
>> -
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-=
do-not-
>> tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/00=
01-
>> Configure-do-not-tweak-mips-cflags.patch
>> index cf5ff356ee..d1526cb69a 100644
>> --- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-=
tweak-mips-
>> cflags.patch
>> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-=
tweak-
>> mips-cflags.patch
>> @@ -1,4 +1,4 @@
>> -From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 200=
1
>> +From 8db9b88edbfbf40d56f330110efdc5cade6f183e Mon Sep 17 00:00:00 200=
1
>>   From: Alexander Kanavin <alex@linutronix.de>
>>   Date: Tue, 30 May 2023 09:11:27 -0700
>>   Subject: [PATCH] Configure: do not tweak mips cflags
>> @@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com=
>
>>    1 file changed, 10 deletions(-)
>>
>>   diff --git a/Configure b/Configure
>> -index fff97bd..5ee54c1 100755
>> +index 6cc03bf..2bcb075 100755
>>   --- a/Configure
>>   +++ b/Configure
>> -@@ -1552,16 +1552,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --ta=
rget-help
>> 2>&1` =3D~ m/-mno-cygwin/m)
>> +@@ -1573,16 +1573,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --ta=
rget-help
>> 2>&1` =3D~ m/-mno-cygwin/m)
>>            push @{$config{shared_ldflag}}, "-mno-cygwin";
>>            }
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-=
strip-sysroot-
>> and-debug-prefix-map-from-co.patch b/meta/recipes-
>> connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-pr=
efix-map-
>> from-co.patch
>> index dadc034c91..f70b14ab84 100644
>> --- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-s=
ysroot-and-
>> debug-prefix-map-from-co.patch
>> +++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-s=
ysroot-and-
>> debug-prefix-map-from-co.patch
>> @@ -1,4 +1,4 @@
>> -From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 200=
1
>> +From 31f71d1f2def3def2b44ec905cc9bcc7d8d2b454 Mon Sep 17 00:00:00 200=
1
>>   From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.c=
om>
>>   Date: Tue, 6 Nov 2018 14:50:47 +0100
>>   Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from =
compiler
>> @@ -28,14 +28,13 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>   Update to fix buildpaths qa issue for '-ffile-prefix-map'.
>>
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>>   ---
>>    Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
>>    crypto/build.info                 |  2 +-
>>    2 files changed, 16 insertions(+), 2 deletions(-)
>>
>>   diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix=
-Makefile.tmpl
>> -index 09303c4..011bda1 100644
>> +index 71b069e..ad82899 100644
>>   --- a/Configurations/unix-Makefile.tmpl
>>   +++ b/Configurations/unix-Makefile.tmpl
>>   @@ -513,13 +513,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags}=
 || (),
>> @@ -68,7 +67,7 @@ index 09303c4..011bda1 100644
>>
>>    # For x86 assembler: Set PROCESSOR to 386 if you want to support
>>   diff --git a/crypto/build.info b/crypto/build.info
>> -index aee5c46..95c9577 100644
>> +index 872684c..96d37c6 100644
>>   --- a/crypto/build.info
>>   +++ b/crypto/build.info
>>   @@ -115,7 +115,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
>> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-che=
ck_cwm-
>> test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-ex=
tend-
>> check_cwm-test-timeout.patch
>> index f6eb28069a..6bf768cf94 100644
>> --- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-=
test-
>> timeout.patch
>> +++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-=
test-
>> timeout.patch
>> @@ -1,4 +1,4 @@
>> -From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 200=
1
>> +From 1f2bfacaefde4fbf6020946333df45cdd84bfac8 Mon Sep 17 00:00:00 200=
1
>>   From: Gyorgy Sarvari <skandigraun@gmail.com>
>>   Date: Thu, 23 Oct 2025 11:24:36 +0200
>>   Subject: [PATCH] extend check_cwm test timeout
>> @@ -15,7 +15,7 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com=
>
>>    1 file changed, 5 insertions(+)
>>
>>   diff --git a/test/radix/main.c b/test/radix/main.c
>> -index 4a1e886a71..39f8c61ef9 100644
>> +index 0f3dc11..d925639 100644
>>   --- a/test/radix/main.c
>>   +++ b/test/radix/main.c
>>   @@ -25,6 +25,11 @@ static int test_script(int idx)
>> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta=
/recipes-
>> connectivity/openssl/openssl_3.6.1.bb
>> similarity index 99%
>> rename from meta/recipes-connectivity/openssl/openssl_3.5.5.bb
>> rename to meta/recipes-connectivity/openssl/openssl_3.6.1.bb
>> index 7799647415..849bfe0874 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_3.6.1.bb
>> @@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk =3D " \
>>              file://environment.d-openssl.sh \
>>              "
>>
>> -SRC_URI[sha256sum] =3D
>> "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
>> +SRC_URI[sha256sum] =3D
>> "b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e"
>>
>>   inherit lib_package multilib_header multilib_script ptest perlnative=
 manpages
>>   MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
>> --
>> 2.34.1



