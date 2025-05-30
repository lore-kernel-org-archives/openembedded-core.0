Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52496C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:28:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1427.1748590128128306649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82455211ba=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U5VKWW001202
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 00:28:47 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm60mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 00:28:47 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54U7Skj8021256
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 00:28:46 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm60mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 00:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKEpvqnGII5LCt7Dd3rXLCXkl3MmRN4pKb3THjWEByxMMT+RZTGCEjzMus3DBBfPKDwq72VyNe8ssoo0oso/tiUd6Av0QfjEI+nlDS6VY1Zp7f7O/I2AWcfirGJBceHdYrAXBea3/CI7DTWAK/Wk1JmHZQbnrxf6lNm2WntEehSOR7+7s3wjiwUKT3eySHHDFqAeHw12C+7txJ7RE2PGCcE1YdemRvNlPTeYdpH6q1pZYsrNWVOzEPfAi3XxTyl4zlhLIuFciDaEjPpGsa8IcrwBhAF/tLnxHRG7p7EeJVcjny9ZVLf9e9gpkJ850S3cKaDl50EXcnlkNgld8hbiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kd2Wu2FmGVMY3OQvOtHhsAwOMizzVNhvbAW+A86XnXA=;
 b=tczw3Nms5mXLqgyBJue4rlQ+CMefwpjrsApKFV5k8rzIaqWUetv7yHS2ajymM2bljJNcOtIzl+7PyTkO0vE+BkLK7Y13zFTWsymgwvTF5Ou/RLWziQ+OzZqkkv1LYowuvDJaxMOysgx97LgaOiNsNBi3iuY5b6n4pN34E7YZiC5IMoKXnNNvJEPld6KSIm2ZiiAHVueuyf6oE0L0XiVpZvTcooXJ74ngUEFZEzywIYrAeAwvkauJmmy5RDN0VEgtcd6Le/vctBn3WHTcNJpDDxdmsICMIvpamFZZDESF4K8e6DqH5X8KRgSltNpGKz7ORc/1QZ7LQDlwYmj88LjyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SN7PR11MB7993.namprd11.prod.outlook.com (2603:10b6:806:2e5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Fri, 30 May 2025 07:28:42 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 07:28:42 +0000
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH v2] gcc: Fix wrong code generation in atomic
 intrinsics for arm
Thread-Topic: [OE-core] [PATCH v2] gcc: Fix wrong code generation in atomic
 intrinsics for arm
Thread-Index: AQHbzor+MHM5euSSvU6ZTvv2jW9vGLPqyGcP
Date: Fri, 30 May 2025 07:28:42 +0000
Message-ID: 
 <DS0PR11MB7901644E01E3CA127166FE3EE061A@DS0PR11MB7901.namprd11.prod.outlook.com>
References: <20250519183029.1517865-1-raj.khem@gmail.com>
 <c04e2ee0-920c-4ff1-8656-22eaaa0c05bf@windriver.com>
In-Reply-To: <c04e2ee0-920c-4ff1-8656-22eaaa0c05bf@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7901:EE_|SN7PR11MB7993:EE_
x-ms-office365-filtering-correlation-id: 42ab1eaf-ca4d-402e-512b-08dd9f4b9a8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?mvIShE/g1CtXIWycbXo290w2lYkek+x+/J41aBXJMnFdAqDDX0fF1P/vw4?=
 =?iso-8859-1?Q?Eod0B5wyx1FxWSCyeMIXOxyBEllFOg780Y8m6xmehnbRg3fNwp3hYDAP/f?=
 =?iso-8859-1?Q?8fBD79URrW9k0u/imEvlM8ycjYr6GNAMeGLn0Qbk3j7Xy6tsLqOpgEfw+n?=
 =?iso-8859-1?Q?wtTazqz2xJiK4hiUcg1+A5JaRG64pjF6r7opk6+Bc8bT32rwbw2YEO3ZbK?=
 =?iso-8859-1?Q?w/Mr6+SfXqeZLHm2fQ3roOVtwGg9P5qlYScis20OuW4I5mEcqLpVlDcw8G?=
 =?iso-8859-1?Q?Qjn8ygt9OxstmlsQFPJDrak0LHbZOTe8xioewCBlY2hbVmN3wnZkSkacyn?=
 =?iso-8859-1?Q?MYfnJBgru+KNWRYILrUCPL4HhX+YZib5z8iroBsXpf2WxeI1ASOXC1CQKl?=
 =?iso-8859-1?Q?2lSPzvVj4+H00mVQtlQAMyXg94QgNCzUUmmIcw/fmATy4WJE8Qd5I6to0D?=
 =?iso-8859-1?Q?QVC+AHEheEMVCERcXp3hSriIorJIv7ZuCdPE0a2v3qh5jm7aRNjXFcLnge?=
 =?iso-8859-1?Q?+El0n/DWlWtQ+YQwH00yZTkkHmoqG0HAL585iNgajXHwQhViLP+SL3AQdB?=
 =?iso-8859-1?Q?nxc8wSI/nK0a/TkznFeKMp19XO2HXQ5uZ2Nf+JRtHGYdUlO7RiI/VTjy9g?=
 =?iso-8859-1?Q?MX9HwjyGvw2yg3AcP2qOPVP+Yri98lDH6boGpIIjqKX9xv9m0Q6KbvabWE?=
 =?iso-8859-1?Q?0KidxOJ7+Z+wtklcQxpiJOHsjnk1nIVi0LiKzbU9PGIRSFpnt4JR8QekYL?=
 =?iso-8859-1?Q?qT59VbEtYce+ccgSt90BXntKoHJC/wy64XAvhM4rC/cooYvHDrmK7PTM9j?=
 =?iso-8859-1?Q?pk/N0EmHxdAVFoEfEevvFjPEFYt7VxTc+JFRvWxyUemdMhMxLT7iUsa8G6?=
 =?iso-8859-1?Q?+4cWAJlZEqXOPNLNWjARdHdE9YMh/Cw8SpL2IAjB5frQXPAt35DpIkqfXa?=
 =?iso-8859-1?Q?LGCCImJ9kz1ZZlbTpNBwcxPTGs/XlN7QJDs55mbiesnBxImp+VjBmMf/y3?=
 =?iso-8859-1?Q?dDYkK6DvN8/mq868xeYm143qe4jHHbAZIA19H7nxE4ZcHPzW64BbcVfxdb?=
 =?iso-8859-1?Q?Mpc5SETYklsmrUFxmPV+CaVxOQW2T8fddnDYhR99EU5JtBhAnRHv5J7XcV?=
 =?iso-8859-1?Q?F9IrZ7H19hJiwGobtWIx/vv0EfMTNOJhQOdTvbmoj3jLielLhcEF/P8qRa?=
 =?iso-8859-1?Q?8U3YPiSlVdfqQQBKtfxrM3uZSQF3BdGcHi7QG+JrAIx4g38cjkaApHM1vu?=
 =?iso-8859-1?Q?VUEYUN94S4xtY9W9vNMzF2wLi9JKiZRPTvtd9EAentTJ/QAL0YBk9c9ujY?=
 =?iso-8859-1?Q?xlg31YK5EqZtMgvS6eAJX705RqnZd8TGqmAB8jvgyd/+RMcf30J5yUuLUB?=
 =?iso-8859-1?Q?PJ5+ZEVeZpBA2PDj/UaFhmCqA5LQ36nju1MsRiMJ4kbRNr3l6WDendrzAy?=
 =?iso-8859-1?Q?hxZY794eHaDX29DoZSNiJO2MHTLJe1/ha7DIFtu7NLRfjNnZEdDqcCpyaE?=
 =?iso-8859-1?Q?HKpzfHC3oHK79RxI4OhrlA?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HVQ1hOYbt9HEeCLZ/w4FdiIYapm+yjbCoH5hUkV1K3i8kOTYNjwGw47wNY?=
 =?iso-8859-1?Q?ezgfGgvlx0MSMsAPYzUhCSZAb7Q+6KweyOUIw9zDrvL1RyQ3vAzxNH4VTm?=
 =?iso-8859-1?Q?sKVRK5sfzWMFfVvrIHmEWUtWEGTbAVkAtSB+O1TE2fO385H5WUFTea0fA9?=
 =?iso-8859-1?Q?WGtgU4mVnSIN25dRXGVaaWJaX/7aAHlTBDcp/cKesZYNWzPSp58K0tK7Ho?=
 =?iso-8859-1?Q?5Z2QAgEsqxlFxDCqasaf+EZm+YL4bvZxCg44FwIcx0XN9DmlmdLQ0HL6q5?=
 =?iso-8859-1?Q?jt+NWBrNxCo5Lio7X3MO0o5mJ6hHIlVWVJiUd247qulvMzGmJhiK5XMDfl?=
 =?iso-8859-1?Q?0pJ2my038LkbV9Gn/9w7JDQ2GBw+/F0dxumT4Ny6OhXXbRfsZkrmKxOBm6?=
 =?iso-8859-1?Q?rVPqeHF9cYC2ZGodp8OGn77sK0yl4McfjzlPhTvyjblFiGhbnjOV5IGBlX?=
 =?iso-8859-1?Q?GEEDeThBfLUEzEBuQLZmHMxxnxFh33g15k5uBECH0Ddmo00P4/uLlu17AR?=
 =?iso-8859-1?Q?9AJ277WhgNpzy9XbK2sA8XHJ8WLPyiRgITPLnQY3y8BXq9FcVn0xjo8oGV?=
 =?iso-8859-1?Q?ezMIh4unKPvVlZQplZ6HPYesY4LStH6tIPD5c3P/mk4hGCiZLaRAfzZL7v?=
 =?iso-8859-1?Q?VxO/o6OUmPCPE13xFYXERt1a1qvLlISKoJEb8osPwwU3THDdJWf2g93S8U?=
 =?iso-8859-1?Q?CYjiFzbAgFjc7zWX6BVXnB0yR/JJ07dnJ9xRvGo0nA0Weo/uVJDrt2eWVU?=
 =?iso-8859-1?Q?FcZ8PBk8bFV10AwggmxG860jtX3jEQxIcFSEwxgyVthAjT7eCLMhly3o8t?=
 =?iso-8859-1?Q?/ci2sWVH50GcfU3O4UETD5UdEuFNsFlaniS1llHx+Wdeq7IrPcCHuxfiNa?=
 =?iso-8859-1?Q?p+queHxkWGvs2wKx6hVC0Op+oPYc5CFZCz3sJBFG46Zr40JtmX4E4o70Oj?=
 =?iso-8859-1?Q?i7Z7sKmyrOJIkAH6abZjjyIVb4lzDpb3FThxXql6kzs+GzrtR6nCy/+YKO?=
 =?iso-8859-1?Q?sOcqvMXkaEN2FZmnU2nxxc4TQq1sqrZGHMlE3htAM25XXf6tcnlYDcjY83?=
 =?iso-8859-1?Q?+khrdhVwXxmHABkyw9AGD2vEkzl8pB9m8mjZxdBwPLkgAN6meMx/siVPJ5?=
 =?iso-8859-1?Q?eHFVgjnropj6xKXaUQAqQV6PhrTZxoFxSw5wFiKfDdAhQOb5NKb6TaNI0O?=
 =?iso-8859-1?Q?Tb8jjov6QN2NTnhWy5fKX0SFkCkepgZCernxezKlOd4Y32C6CCnQxSnT+H?=
 =?iso-8859-1?Q?wMwqMt1IRIox2nQKNPQuRvTBP3cNCrQCJ+4Z7oJAomI0Sh1XbmQzWSZThH?=
 =?iso-8859-1?Q?iH/c1bXayio2E0K+tW6gbP6vClx49+FHTcRGCRYHseaBJKin60Gp+a2q2U?=
 =?iso-8859-1?Q?13qJ8s919qy4cYERGOo52536UOYBO9tIKvgRiDgkOGn0wU/pU25t2IOT6T?=
 =?iso-8859-1?Q?GeU2RhayHmJ3cdHPPCNUF89sVIx860d/RQlycBmlgMwR0GD/RV/VbZKqBj?=
 =?iso-8859-1?Q?XNBiJHiMvgX2Ip1RPNZWClBXrUBNCDvKGfiSugqePq/LZ3op10eLoAbY49?=
 =?iso-8859-1?Q?fe7F4+eCiJFSnqcU/hAjsPOeX9CB0HyKVs8vGp591LalbMa7abEaSFo0Js?=
 =?iso-8859-1?Q?q6IwY8H0pSYb/LAGP8/TyhWUUMCmI+nkJmkFoKmgQLuE4fOz0JlXLcng?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7901644E01E3CA127166FE3EE061ADS0PR11MB7901namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ab1eaf-ca4d-402e-512b-08dd9f4b9a8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 07:28:42.0190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IspvpqGdUi+c80VYt3tiAd8HkQ9NaoKJVh6pqOa/w9Zb29Mez3j+VeoQEPxInYLtpVsN4XNYb4ZO4zngVno/isfKKL3xClFGtHVhQLVDFcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7993
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=68395e2f cx=c_pps a=wbehbjfXV6i/z4r9WFT21Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=mDV3o1hIAAAA:8 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8 a=6riKLmWeAAAA:8 a=7CQSdrXTAAAA:8 a=08jEHAZ4cad-xGRF3twA:9 a=wPNLvfGTeEIA:10 a=eHq-4oAGj-HwF987vN4A:9 a=iK6u0zojywJfCUoR:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=ykqYCi_xeFNNVC5ly69F:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA2MSBTYWx0ZWRfX6scR9AiOY9Va bfgfdqr5+7HdsVfXwoVyo/HeAd7GDOPcBX0NX+I8gH5PB2gdsLOX08pQmvBa7FBtRxTNfEFLaBW YmGbgUlYEyOHky+eJyxZHgtxRp8TVtjWsNILogKLxpPCC/isn9IZufRGhun/fW7I0N0uipJPtAn
 bIM/tdcvtYYtvRwuNoqYLTZJUZfg8Flf6A6ZfBFRqgB+2lov/YDLSwyfnSowsb5UqHaqZRjr34e godbr7BS/7TT8n7vMqVj/7pAb71G6CDnbdUgwXT0p5B7PEBP+r1Mf+K0dNTRQHESf+3267Yan4s Vj6MN1LXmbAbYFoCPHmlRsYb6BvJzKvueqs3L9W1t8omrM2IdT1184AtjQ/+7NKNtLvFlIGXzxE
 ObbtbCNeDrozZ6rHUSNgmyqvQ2Nt9+USPD1vS3A5VD5VmJ4VBtK/BJcdUMPP+f71DMC5cESH
X-Proofpoint-ORIG-GUID: t5S8kV2UcNNaHGyZO4erS-t3dye-e20U
X-Proofpoint-GUID: cvHmlSinTJnxJJXctedyuYMQLxqetIWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217485

--_000_DS0PR11MB7901644E01E3CA127166FE3EE061ADS0PR11MB7901namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

I'd like to share an update regarding PR120351<https://gcc.gnu.org/bugzilla=
/show_bug.cgi?id=3D120351>.

-  Sam James (GCC Contributor) confirmed that while the issue is theoretica=
lly present, but it doesn't affect GCC-14 & GCC-13 in practice.
-  Manual testing on both GCC versions showed no observable issues.
- Conclusion: No backport is needed for the older GCC stable releases.

Thank you.

Regards,
~Sunil Dora

________________________________

Subject:
[OE-core] [PATCH v2] gcc: Fix wrong code generation in atomic intrinsics fo=
r arm
Resent-Date:
Mon, 19 May 2025 11:30:33 -0700
Resent-From:
raj.khem@gmail.com<mailto:raj.khem@gmail.com>
Date:
Mon, 19 May 2025 11:30:29 -0700
From:
Khem Raj via lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedde=
d.org><mailto:raj.khem=3Dgmail.com@lists.openembedded.org>
Reply-To:
raj.khem@gmail.com<mailto:raj.khem@gmail.com>
To:
openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists.ope=
nembedded.org>
CC:
Jeroen Hofstee <jhofstee@victronenergy.com><mailto:jhofstee@victronenergy.c=
om>, Khem Raj <raj.khem@gmail.com><mailto:raj.khem@gmail.com>


From: Jeroen Hofstee <jhofstee@victronenergy.com><mailto:jhofstee@victronen=
ergy.com>

This is seen with QT code

Error: ARM register expected -- `ldrex r1,[s16]'

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com><mailto:jhofstee@=
victronenergy.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com><mailto:raj.khem@gmail.com>
---
v2: Combine, sign-offs into single patch and keep patch numbering in order

meta/recipes-devtools/gcc/gcc-15.1.inc | 1 +
...-validate-mem_noofs_operand-PR120351.patch | 95 +++++++++++++++++++
2 files changed, 96 insertions(+)
create mode 100644 meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-me=
m_noofs_operand-PR120351.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools=
/gcc/gcc-15.1.inc
index 864c6091a6b..8543d9f7d07 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -69,6 +69,7 @@ SRC_URI =3D "${BASEURI} \
file://0023-Fix-install-path-of-linux64.h.patch \
file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+ file://0026-arm-fully-validate-mem_noofs_operand-PR120351.patch \
"
S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noof=
s_operand-PR120351.patch b/meta/recipes-devtools/gcc/gcc/0026-arm-fully-val=
idate-mem_noofs_operand-PR120351.patch
new file mode 100644
index 00000000000..3f324fdc223
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_opera=
nd-PR120351.patch
@@ -0,0 +1,95 @@
+From bb7adc5dab8bcee2ef1c0d2af370ea77c49bb5c5 Mon Sep 17 00:00:00 2001
+From: Richard Earnshaw <rearnsha@arm.com><mailto:rearnsha@arm.com>
+Date: Mon, 19 May 2025 16:19:39 +0100
+Subject: [PATCH] arm: fully validate mem_noofs_operand [PR120351]
+
+It's not enough to just check that a memory operand is of the form
+mem(reg); after RA we also need to validate the register being used.
+The safest way to do this is to call memory_operand.
+
+ PR target/120351
+
+gcc/ChangeLog:
+
+ * config/arm/predicates.md (mem_noofs_operand): Also check the op
+ is a valid memory_operand.
+
+gcc/testsuite/ChangeLog:
+
+ * gcc.target/arm/pr120351.c: New test.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3De5bb7=
a328eb71daa02d15b48d3a6c6b8cd24abc5]
+Signed-off-by: Khem Raj <raj.khem@gmail.com><mailto:raj.khem@gmail.com>
+---
+ gcc/config/arm/predicates.md | 3 +-
+ gcc/testsuite/gcc.target/arm/pr120351.c | 47 +++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/arm/pr120351.c
+
+diff --git a/gcc/config/arm/predicates.md b/gcc/config/arm/predicates.md
+index 75c06d9be25..655f60312de 100644
+--- a/gcc/config/arm/predicates.md
++++ b/gcc/config/arm/predicates.md
+@@ -907,7 +907,8 @@
+ + (define_predicate "mem_noofs_operand"
+ (and (match_code "mem")
+- (match_code "reg" "0")))
++ (match_code "reg" "0")
++ (match_operand 0 "memory_operand")))
+ + (define_predicate "call_insn_operand"
+ (ior (and (match_code "symbol_ref")
+diff --git a/gcc/testsuite/gcc.target/arm/pr120351.c b/gcc/testsuite/gcc.t=
arget/arm/pr120351.c
+new file mode 100644
+index 00000000000..d8e9d73275c
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arm/pr120351.c
+@@ -0,0 +1,47 @@
++/* { dg-do assemble } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-add-options arm_neon } */
++/* { dg-additional-options "-O2" } */
++
++
++typedef struct A
++{
++ int f1;
++} A;
++
++__inline void ref (A* x)
++{
++ __atomic_fetch_add(&x->f1, 1, 0);
++}
++
++typedef struct B
++{
++ A *d;
++ int *ptr;
++} B;
++
++void insertOne (B*, B*);
++
++void init (B *);
++__inline void copy (B *p, B *q)
++{
++ p->d =3D q->d;
++ p->ptr =3D q->ptr;
++ ref (p->d);
++}
++
++__inline void emplace(B* x)
++{
++ B dummy;
++ B _tmp;
++ init (&dummy);
++ copy (&_tmp, &dummy);
++ insertOne(x, &_tmp);
++}
++
++void testing ()
++{
++ B test;
++ init (&test);
++ emplace(&test);
++}


--_000_DS0PR11MB7901644E01E3CA127166FE3EE061ADS0PR11MB7901namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Everyone,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I'd like to share an update regarding <a href=3D"https://gcc.gnu.org/bugzil=
la/show_bug.cgi?id=3D120351" id=3D"LPlnk241198" title=3D"https://gcc.gnu.or=
g/bugzilla/show_bug.cgi?id=3D120351">
PR120351</a>.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
-&nbsp; Sam James (GCC Contributor) confirmed that while the issue is theor=
etically present, but it<b>&nbsp;doesn't affect</b>&nbsp;GCC-14 &amp; GCC-1=
3 in practice.</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
-&nbsp; Manual testing on both GCC versions showed no observable issues.&nb=
sp;</div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
- Conclusion: No backport is needed for the older GCC stable releases.</div=
>
<div class=3D"elementToProof" style=3D"margin-left: 0px; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-left: 0px; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0);">
Thank you.</div>
<div class=3D"elementToProof" style=3D"margin-left: 0px; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-left: 0px; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"margin-left: 0px; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0);">
~Sunil Dora</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
<b><br>
</b></div>
</div>
<table id=3D"table_0" cellspacing=3D"0" cellpadding=3D"0" style=3D"box-sizi=
ng: border-box; border-collapse: collapse; border-spacing: 0px;">
<tbody>
<tr>
<th>
<div>Subject:</div>
</th>
<td>
<div>[OE-core] [PATCH v2] gcc: Fix wrong code generation in atomic intrinsi=
cs for arm</div>
</td>
</tr>
<tr>
<th>
<div>Resent-Date:</div>
</th>
<td>
<div>Mon, 19 May 2025 11:30:33 -0700</div>
</td>
</tr>
<tr>
<th>
<div>Resent-From:</div>
</th>
<td>
<div><a href=3D"mailto:raj.khem@gmail.com" id=3D"OWAd5534c5b-59fc-8293-a3b4=
-e10ada4cbb4c" class=3D"x_moz-txt-link-abbreviated OWAAutoLink">raj.khem@gm=
ail.com</a></div>
</td>
</tr>
<tr>
<th>
<div>Date:</div>
</th>
<td>
<div>Mon, 19 May 2025 11:30:29 -0700</div>
</td>
</tr>
<tr>
<th>
<div>From:</div>
</th>
<td>
<div>Khem Raj via lists.openembedded.org <a href=3D"mailto:raj.khem=3Dgmail=
.com@lists.openembedded.org" id=3D"OWAbbcb8871-3b58-31e8-f7fe-75370ff31543"=
 class=3D"x_moz-txt-link-rfc2396E OWAAutoLink">
&lt;raj.khem=3Dgmail.com@lists.openembedded.org&gt;</a></div>
</td>
</tr>
<tr>
<th>
<div>Reply-To:</div>
</th>
<td>
<div><a href=3D"mailto:raj.khem@gmail.com" id=3D"OWAc1776fa0-1884-aac6-c78f=
-877515f6d99b" class=3D"x_moz-txt-link-abbreviated OWAAutoLink">raj.khem@gm=
ail.com</a></div>
</td>
</tr>
<tr>
<th>
<div>To:</div>
</th>
<td>
<div class=3D"elementToProof"><a href=3D"mailto:openembedded-core@lists.ope=
nembedded.org" id=3D"OWA504a7d84-c947-dc86-36e7-7c0d6060b795" class=3D"x_mo=
z-txt-link-abbreviated OWAAutoLink">openembedded-core@lists.openembedded.or=
g</a></div>
</td>
</tr>
<tr>
<th>
<div>CC:</div>
</th>
<td>
<div>Jeroen Hofstee <a href=3D"mailto:jhofstee@victronenergy.com" id=3D"OWA=
7b8673eb-654b-e832-d756-6df020abf17a" class=3D"x_moz-txt-link-rfc2396E OWAA=
utoLink">
&lt;jhofstee@victronenergy.com&gt;</a>, Khem Raj <a href=3D"mailto:raj.khem=
@gmail.com" id=3D"OWAac356cca-d270-0b1d-746a-8d10ca4dc0de" class=3D"x_moz-t=
xt-link-rfc2396E OWAAutoLink">
&lt;raj.khem@gmail.com&gt;</a></div>
</td>
</tr>
</tbody>
</table>
<div><br>
<br>
From: Jeroen Hofstee <a href=3D"mailto:jhofstee@victronenergy.com" id=3D"OW=
A4fb73183-84ba-1c51-3770-913b8be6059d" class=3D"x_moz-txt-link-rfc2396E OWA=
AutoLink">
&lt;jhofstee@victronenergy.com&gt;</a><br>
<br>
This is seen with QT code<br>
<br>
Error: ARM register expected -- `ldrex r1,[s16]'<br>
<br>
Signed-off-by: Jeroen Hofstee <a href=3D"mailto:jhofstee@victronenergy.com"=
 id=3D"OWA79a0c177-55dc-fcde-92fb-24679aa45b31" class=3D"x_moz-txt-link-rfc=
2396E OWAAutoLink">
&lt;jhofstee@victronenergy.com&gt;</a><br>
Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" id=3D"OWA75f6=
da1b-fc4c-eebe-8620-0c4bd2d8fce7" class=3D"x_moz-txt-link-rfc2396E OWAAutoL=
ink">
&lt;raj.khem@gmail.com&gt;</a><br>
---<br>
v2: Combine, sign-offs into single patch and keep patch numbering in order<=
br>
<br>
meta/recipes-devtools/gcc/gcc-15.1.inc | 1 +<br>
...-validate-mem_noofs_operand-PR120351.patch | 95 +++++++++++++++++++<br>
2 files changed, 96 insertions(+)<br>
create mode 100644 meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-me=
m_noofs_operand-PR120351.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools=
/gcc/gcc-15.1.inc<br>
index 864c6091a6b..8543d9f7d07 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc<br>
@@ -69,6 +69,7 @@ SRC_URI =3D &quot;${BASEURI} \<br>
<a href=3D"file://0023-Fix-install-path-of-linux64.h.patch" id=3D"OWA995b48=
f0-0cdc-c121-3cf8-6ca3abf01c2e" class=3D"x_moz-txt-link-freetext OWAAutoLin=
k" data-auth=3D"NotApplicable">file://0023-Fix-install-path-of-linux64.h.pa=
tch</a>&nbsp;\<br>
<a href=3D"file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch" i=
d=3D"OWA318f75b9-3170-3823-ef10-dd7422087770" class=3D"x_moz-txt-link-freet=
ext OWAAutoLink" data-auth=3D"NotApplicable">file://0024-Avoid-hardcoded-bu=
ild-paths-into-ppc-libgcc.patch</a>&nbsp;\<br>
<a href=3D"file://0025-gcc-testsuite-tweaks-for-mips-OE.patch" id=3D"OWA1cc=
191b9-f4ac-e161-5fbf-d603891a01bb" class=3D"x_moz-txt-link-freetext OWAAuto=
Link" data-auth=3D"NotApplicable">file://0025-gcc-testsuite-tweaks-for-mips=
-OE.patch</a>&nbsp;\<br>
+ <a href=3D"file://0026-arm-fully-validate-mem_noofs_operand-PR120351.patc=
h" id=3D"OWA5f173d67-3f52-bb9e-9f20-8b0f50ed018d" class=3D"x_moz-txt-link-f=
reetext OWAAutoLink" data-auth=3D"NotApplicable">
file://0026-arm-fully-validate-mem_noofs_operand-PR120351.patch</a>&nbsp;\<=
br>
&quot;<br>
S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noof=
s_operand-PR120351.patch b/meta/recipes-devtools/gcc/gcc/0026-arm-fully-val=
idate-mem_noofs_operand-PR120351.patch<br>
new file mode 100644<br>
index 00000000000..3f324fdc223<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/0026-arm-fully-validate-mem_noofs_opera=
nd-PR120351.patch<br>
@@ -0,0 +1,95 @@<br>
+From bb7adc5dab8bcee2ef1c0d2af370ea77c49bb5c5 Mon Sep 17 00:00:00 2001<br>
+From: Richard Earnshaw <a href=3D"mailto:rearnsha@arm.com" id=3D"OWAe131f2=
bc-2356-e167-37ae-5663479ee096" class=3D"x_moz-txt-link-rfc2396E OWAAutoLin=
k">
&lt;rearnsha@arm.com&gt;</a><br>
+Date: Mon, 19 May 2025 16:19:39 +0100<br>
+Subject: [PATCH] arm: fully validate mem_noofs_operand [PR120351]<br>
+<br>
+It's not enough to just check that a memory operand is of the form<br>
+mem(reg); after RA we also need to validate the register being used.<br>
+The safest way to do this is to call memory_operand.<br>
+<br>
+ PR target/120351<br>
+<br>
+gcc/ChangeLog:<br>
+<br>
+ * config/arm/predicates.md (mem_noofs_operand): Also check the op<br>
+ is a valid memory_operand.<br>
+<br>
+gcc/testsuite/ChangeLog:<br>
+<br>
+ * gcc.target/arm/pr120351.c: New test.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/cgit/gcc/commit/=
?id=3De5bb7a328eb71daa02d15b48d3a6c6b8cd24abc5" id=3D"OWAb1a7fe53-6a16-2b1a=
-44c2-7597c5cceae0" class=3D"x_moz-txt-link-freetext OWAAutoLink" data-auth=
=3D"NotApplicable">https://gcc.gnu.org/cgit/gcc/commit/?id=3De5bb7a328eb71d=
aa02d15b48d3a6c6b8cd24abc5</a>]<br>
+Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" id=3D"OWAc9f=
00ccd-8f02-4db6-cdd6-27513955cd2b" class=3D"x_moz-txt-link-rfc2396E OWAAuto=
Link">
&lt;raj.khem@gmail.com&gt;</a><br>
+---<br>
+ gcc/config/arm/predicates.md | 3 +-<br>
+ gcc/testsuite/gcc.target/arm/pr120351.c | 47 +++++++++++++++++++++++++<br=
>
+ 2 files changed, 49 insertions(+), 1 deletion(-)<br>
+ create mode 100644 gcc/testsuite/gcc.target/arm/pr120351.c<br>
+<br>
+diff --git a/gcc/config/arm/predicates.md b/gcc/config/arm/predicates.md<b=
r>
+index 75c06d9be25..655f60312de 100644<br>
+--- a/gcc/config/arm/predicates.md<br>
++++ b/gcc/config/arm/predicates.md<br>
+@@ -907,7 +907,8 @@<br>
+ + (define_predicate &quot;mem_noofs_operand&quot;<br>
+ (and (match_code &quot;mem&quot;)<br>
+- (match_code &quot;reg&quot; &quot;0&quot;)))<br>
++ (match_code &quot;reg&quot; &quot;0&quot;)<br>
++ (match_operand 0 &quot;memory_operand&quot;)))<br>
+ + (define_predicate &quot;call_insn_operand&quot;<br>
+ (ior (and (match_code &quot;symbol_ref&quot;)<br>
+diff --git a/gcc/testsuite/gcc.target/arm/pr120351.c b/gcc/testsuite/gcc.t=
arget/arm/pr120351.c<br>
+new file mode 100644<br>
+index 00000000000..d8e9d73275c<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/arm/pr120351.c<br>
+@@ -0,0 +1,47 @@<br>
++/* { dg-do assemble } */<br>
++/* { dg-require-effective-target arm_neon_ok } */<br>
++/* { dg-add-options arm_neon } */<br>
++/* { dg-additional-options &quot;-O2&quot; } */<br>
++<br>
++<br>
++typedef struct A<br>
++{<br>
++ int f1;<br>
++} A;<br>
++<br>
++__inline void ref (A* x)<br>
++{<br>
++ __atomic_fetch_add(&amp;x-&gt;f1, 1, 0);<br>
++}<br>
++<br>
++typedef struct B<br>
++{<br>
++ A *d;<br>
++ int *ptr;<br>
++} B;<br>
++<br>
++void insertOne (B*, B*);<br>
++<br>
++void init (B *);<br>
++__inline void copy (B *p, B *q)<br>
++{<br>
++ p-&gt;d =3D q-&gt;d;<br>
++ p-&gt;ptr =3D q-&gt;ptr;<br>
++ ref (p-&gt;d);<br>
++}<br>
++<br>
++__inline void emplace(B* x)<br>
++{<br>
++ B dummy;<br>
++ B _tmp;<br>
++ init (&amp;dummy);<br>
++ copy (&amp;_tmp, &amp;dummy);<br>
++ insertOne(x, &amp;_tmp);<br>
++}<br>
++<br>
++void testing ()<br>
++{<br>
++ B test;<br>
++ init (&amp;test);<br>
++ emplace(&amp;test);<br>
++}<br>
<br>
</div>
</body>
</html>

--_000_DS0PR11MB7901644E01E3CA127166FE3EE061ADS0PR11MB7901namp_--

