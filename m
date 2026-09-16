Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449DFC982C5
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 15:24:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17565.1789572240455375158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 08:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oXVOBsZc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3719b62dd9=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFC4vl2078327
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:23:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=y+fnov+j8S8K2G+aOA++GXPRkxXWDWUeuV/Dgmy/a04=; b=
	oXVOBsZcBxi2xqXId0UrVCULfxCz0vEg7a52v6/2rTVX87Sd2TLLXlvujJtDJEEu
	ensD2uKgbct8l2W3okui4AdVTP9vfZp1YvltvzFtwRR/PfGkoCSFH+1NDqLnQbe4
	6nC6ivKiSjKPqn6MXZZmqjTU08znHB+d49Hgh75J+iAqUhakfVhDKWeKJWLuRIlN
	Wz4Zip4JgsUvxF6fMvR9dNDBCczqD07WSed4poJP2J8D3IhGBK3ZAyLs8Su3Tyro
	0xgcMBeXwpMjDlZ1WDm1zc2YR5tvWo1SrKtSestec7PaboG9dcmcnvPcakk/Uzzj
	GlTzi81bkeHEZRRJ0gSGCQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021118.outbound.protection.outlook.com [52.101.57.118])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn68g7gr2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 08:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaPpmjuJpSP31AJusmTc41KK0bjQULFFvDft2mrsIRpxtn23bbEU3u7gXX4o42GUNMJA3AoDPeCo16MCd3299Pl5CKqCHi5t+kbvt4aMjyMYQPMGZiblwG0GNXLARXAPwFewjkLY5VllTq25+S6m3Y1v+h5+1fwsoArTNrHKJKBbrZHPoc1FWBXVUoNYXtSBsW/xBCvq7pmdrpnJ14LJDQHQZKGxdNQaHCIgJOTEUcVeeajG06C8Gek1/K2/jdnVBlkf9nsliORNgUBYvjEwsqkul0HqzA7sUH52O4FUM0OH6Fd5b/CV4aUUntO+Tc3erZW49VcWWgjMGTU6JpwZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+fnov+j8S8K2G+aOA++GXPRkxXWDWUeuV/Dgmy/a04=;
 b=lcytb4VzZaxXFrGsdkpU5dFbEso0mXh4j+JGMYPs0N1nTpuoQD05cHol+w/3ONLPM66xf+kt5CgYSJoVq3Fy9O9X7N9f4Kd+HW1wdM8R1OoS+uMuLlrfd4tmMGoiOZ6LSft3gc+lv97d0zwz4LVTDbTIrAkcikzQk88+hVFg5bL9NLz35GMq5BHIea0nItGJa6sAhmAn90U6bVoTiaHsL/mOdbqk3o3j4mMg4dUXkKZkCNBpR7dDVjk6JtEzqPllNBFdW9vsRE1DVm/zKOAyuVwlrcojwMwvhVjHXKX8owA4an460JSETWy3fsX1MTgMhKSFkcs6MkmcqIc0DCVhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA3PR11MB9184.namprd11.prod.outlook.com (2603:10b6:208:570::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Wed, 16 Sep 2026 15:23:57 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:23:57 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, alejandro@enedino.org,
        antonin.godard@bootlin.com, sunilkumar.dora@windriver.com
Subject: [PATCH v2 3/5] rust: keep the build host triple out of cargo unit metadata
Date: Wed, 16 Sep 2026 20:53:24 +0530
Message-ID: <20260916152327.1765623-4-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
References: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA3PR11MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 960e5525-9b94-49f7-89b2-08df14068695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|12006099003|22082099003|18002099003|29003799003|25016099003;
X-Microsoft-Antispam-Message-Info: 
	Vfk1CqeBL3g54w9UITGeNvupyveGZ+alsPvPbiFKVjVWiwudS6EHJmLZyIKoqMQIBuLpmcuCZwITeQ/X+2FKhS6QsYo2LSBMw7vvcSNYnV53HPX8fWUch2sA6pob/tWvEQ6LcxGe/GhLEElHM8PBUKBuagECJ+pEI1cu+jLoWtXI2nvf8dKuCu9Yg33P0cUYlpX6z3eMfYskTRgiRAITmqdFReOqRv6KcULk44hnx5sfeljcDIb8/2Der85JlwZItgOVwd9wrHClqxbxx/7PGKBJoA6puRW9bmPPd3+RQwkUqQgqx/a8o3KisLtIEndeRhWQqZ6iNTKMjZQNCNCtsOyKcC47n8Oee9tqnQp6Wxn5gObk15JPlN3Uz6FQgmDSKekkPLqXXEvuH423yjH+3P0PCVWR5nxNFjucZqWCQt0PC34ujI2Bct/iaDBQOMWyMSOeePCfd5yp7Bn+7e1CWntEk0a+nbMMWQXpVTl8ZaZxg2emb32MJc9OCd54VzwJOVffF+JECy2mhrL8zKGxh3wygissEq/pGhwUcPrjiVYC2SF+ShqrJfpei20+uVuEZypXQBO3bYAT1Iwpv2/fpVm8UjyzbRSpnJGH+MyxWSthUX+svkleJ2jWKRNHz7HQlS4+JPHyPfUQksOUDVO7X8iCuRJEaabIHzCaRhzZFDk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(12006099003)(22082099003)(18002099003)(29003799003)(25016099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cIy1Q20Sn9zzqBZp2oTSYnazC0DIVRhsq2txNS2CAXHDd3F7X2fwholPSOjJ?=
 =?us-ascii?Q?QRws/XV/H1d4Kpm4hZO+AWlK1T9eWwfB5QGilfsj6D3Q1lI8/koV54T8JCKS?=
 =?us-ascii?Q?jSSVqrViiqBRWkSNPqZs2m1iuXGLiYyPj48c0trrx3eJe7LujJI+Yw3TbRss?=
 =?us-ascii?Q?eFBHC1q4/Y8JdelxKMEAxr2zczMxCfEJFR3aYgYwxDFe+Hm4TGjoncMKYvwF?=
 =?us-ascii?Q?MR4dZCtW5xN9c4Fxa4namodTb/G985lREcvMqlBVC+QrcCYywQ12lCvC/GE5?=
 =?us-ascii?Q?YuJjxK0G+Ao/4OgPVzbXiEpBhpHfRQZidkVw0KSlwWn5A48S5OKOMkkXFUBN?=
 =?us-ascii?Q?SwMY5dJV70c0uzEc5LDNAMglF/ENVWR0n4Wljyh0Aq+2g1I8ZBHkSPuiv7qU?=
 =?us-ascii?Q?4Fx0BYArVVSeB6XMtfuxzp7hVQwrYV930HG23Cs3UindiXNCfshgtQZPFI6x?=
 =?us-ascii?Q?8h05O+DDmmS1P7aWCx+tWTemfURy7ByARWZNpwS8GhYtm89RHkn4rlR859I8?=
 =?us-ascii?Q?N7Yg9/vAW8W5041Rl+vTJIu6NS0u+Zqmj+0JZ3I0i21yhdKolJx4SYl7GPWh?=
 =?us-ascii?Q?Gjbs7PuMrk7gK8qUTgXE3zfs/1awMJilx7G2mPzBXjBNXDq9ffOou3BGWNvF?=
 =?us-ascii?Q?gXBwPh7qUirFoeH9KNWVsLiiOm+SqmiE1iJI/p6822y+99EZZ/+ULi7Nm78I?=
 =?us-ascii?Q?7yBs0e7ASxsO3YjjIWuFo//unzlbplIJriWeuQ9lEdbVN/TvNTFGO2mT0avB?=
 =?us-ascii?Q?ffUgGBC8tx4qNurp8UUWyzBu2YTgkg+ELCtgWRqtNJjpSt2gU2jxCMis2ear?=
 =?us-ascii?Q?n09/AxywZMQfHxJBFxtvguEfVhR5I2iFxRsKcrZ7Am82JMZqSMrd+h3kn3QI?=
 =?us-ascii?Q?Y+S2s4H6oKy5lvMCGtNYfJ+l6/3LIDno8g9B873ts2k2v3zS8jO8aP8R8W00?=
 =?us-ascii?Q?Fzy5cEI6V0hvzDTt9zoeBZwjGyy2ddT3kRRs8EdyejlZeK9UhzLB5sSQ6Y6H?=
 =?us-ascii?Q?yyx/uF79BUWF+fWUkpK+sVYz1EFGlb9TJVEzPAh+cbWIgTEn44wxA00RM8cb?=
 =?us-ascii?Q?b/vQ9mbWp1ZYJSKvA3D1y2IUUfksVd7wHzt3vSV2OT3wDgfBQrFhbCx2lEmR?=
 =?us-ascii?Q?+A/gfA+uNJ5jUcy6BOkOArGPQ3Qg7a1CL2griRvkqMUstAfgBBsd+ls2TV60?=
 =?us-ascii?Q?z1drFO1AkFMGoai/zVE9l4CRtv10My2ihPTpZNtPVLhxQJiGVNzeCbpJCUYf?=
 =?us-ascii?Q?E7TmJ2gXJFrkkWCz3Wd+j8Dmomrcni5ZB24DTiJ3x/bWxjialyVnBYVslk7/?=
 =?us-ascii?Q?WZnj9OvysRiDPItT+BovZi3CA2G1duZRhpofsnzk7YMxI+MrZxP3fZ9jhHqC?=
 =?us-ascii?Q?KtcDgNh339qJGLGaqwYh24gKdT7MoSXd9WjzIWwB5vmAiSt2WM8KXRMIatyP?=
 =?us-ascii?Q?aekPDOZDP3XI9ch+m5ZMAO/NvdbX4aCwyEv1uczJw/2BVpW7IM5w0vyoG+di?=
 =?us-ascii?Q?VEsF8DMo2i098y5dlIayMJUGZRLonc+5lWabol95IgUpTeJOJtJVEqoNvp04?=
 =?us-ascii?Q?bt5+xgrd/wSbX5ECwrXv5eDHUR18C+i+z4R8i5rS0UalCrhFOXPO8w9p8VO7?=
 =?us-ascii?Q?eZmUr33ukQCAstfoveG1yXCS+FQz3GO+oINqbvdIBtKWweyu2yxoA+ePdhwD?=
 =?us-ascii?Q?erp5wAf/mI20ZoWPSJPRiYoBbqNJeUhs7qLZ4gcMEw/sr+qStoPrhXQTgFtj?=
 =?us-ascii?Q?3KXhCHkZ2PmZ4ppIQ5bY+St7qa8J3ao=3D?=
X-Exchange-RoutingPolicyChecked: 
	5ITV7LKazwbj28tgcfKLNvqRXxS7pKqoQdikduDWj5N+JWHH+RcYjit7YLmFT1O2ktlCM6LJNriRgMcxRL3tr/QAUku6Wg8k9YREkAD+QPXLudQ2Lk4eFDanU0BJ/7PLxduRaX9Sa4ioUsTZyxG3vLkdBCIFeY4aIdp0ZbGdiAZnwiRMGXjld0hBKWv6Ws/JKMMpsjDyVBFaiv4+TrQrKipsCt9eHHof9mfcVIg15sDtyT+8DmeVWp08IdQIYR/qRYHklduHwQRRII7aAyEzyVDrWoMzJGRReQJNyEfQjRj5sGsUBQcJIMclbAwJit8WW1OzF1aQ2pFVSnmb940CxA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960e5525-9b94-49f7-89b2-08df14068695
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:23:57.1957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Am6s54beuxDs/w7CMtw6T0KTPtMJc5txLgi2iMZH5KAsI0hTY91XJo/gjYmUQIA+NpA6x3ew44rgsgmhg8sJiGDitfUFq45VRpo0hsQltbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9184
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: tFdZGLjgAjGfZ58J7xlOIUq9VSCqdeLX
X-Authority-Analysis: v=2.4 cv=cswOAF4i c=1 sm=1 tr=0 ts=6aaab48f cx=c_pps
 a=Fp6ZGEvu10dMZ3IStNZSqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=zjtiufAZAAAA:8
 a=TrGZlGhXKWsQoEPy0aEA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=2tRhtM0yMehlNRDZlsEQ:22
X-Proofpoint-GUID: da3MhDzPKOutcXt1epyft6fMbv1V4cIx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfXznxyZted/yfr
 gWCnJNtVj39ViV+u/LAykdLaS1LfIFqDp8cNNqkW8o5SnkYsNtCNabdKLia1yo7CUwj73AQMEBS
 HuJyKVoUQ293MtZAzJvZalVGrNrHqcIzRTqdh1wv33dyEfMO02tH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfX11uCi7fRIzVR
 m7wBjom7WkeOUqLJjLteKl1cuSdSZ9nWm1ibt2eT+h81tMx3snTaYeHDbl+TB6pvpTBjg78/yS+
 svJWkIylEiptbown6nFh7sDOtM1N2Hrb2J2nqhNUlzYEMQn/lXJ2JJBtuq2YqKNmHHM0HpAJWRc
 TgiLtzBOvVAMVjfJDdLymIDVKMO3RsgqH/57ZPTA1cU+8DOfXXguqJGDyhQhdGy04Cw+HJ3Qlj1
 JXzyVWHNcW6ieWCdL7rGLRuJGPirLXCREtN5bbWrYqA7d4SxCkWSPU9Vb13b46AdTB2RJ9NP4M3
 QTFf4+T5NJe7KjV67VOld4hAVZZU+35Z6WNhtxlubkpSpb9iIyCgR8MMw7PFHOZuv7uylWAfRl1
 0eYm8+Ip26qmwDHPPKDKU82caPhLvemzrEwAjX3CcmEt+ua16rqFUoLjDWNrLjmzzpJ+ip1Z5UW
 GfYkeWFrFhn2LdnEoxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245984

From: Sunil Dora <sunilkumar.dora@windriver.com>

cargo hashes the "host:" line of "rustc -vV" into the metadata of build
scripts and proc-macros. Every target crate that depends on one picks it
up, so the same crate gets a different -C metadata and StableCrateId on
an x86_64 and an aarch64 build host. The added patch drops the host line
from that hash.

[YOCTO #16376]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
v2: added Alejandro's Signed-off-by, dropped the link paragraph from
the commit message. No code change.

 ...-host-triple-from-unit-metadata-hash.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch

diff --git a/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch b/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
new file mode 100644
index 0000000000..d4cb48a7a3
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
@@ -0,0 +1,62 @@
+From 5c4fd7d8b85f4de5be387777a782fc3ddd1227d8 Mon Sep 17 00:00:00 2001
+From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Date: Tue, 15 Sep 2026 17:05:36 +0530
+Subject: [PATCH] rust: keep the build host triple out of cargo unit metadata
+
+cargo hashes the "host:" line of "rustc -vV" into the metadata of host
+units, that is build scripts and proc-macros. Every target crate that
+depends on one picks that up through its own metadata, so the same crate
+gets a different -C metadata and StableCrateId on an x86_64 and an aarch64
+build host. Drop the host from the hash. The same class of problem is
+reported upstream, framed as OS differences, in
+https://github.com/rust-lang/cargo/issues/8140.
+
+Patch by Alejandro Enedino Hernandez Samaniego, from his strict-version-hash
+v5 series for openembedded-core:
+https://lists.openembedded.org/g/openembedded-core/topic/120939810
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ .../core/compiler/build_runner/compilation_files.rs    | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs b/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
+index 88cab85..9dbd203 100644
+--- a/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
++++ b/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
+@@ -877,7 +877,7 @@ fn has_remap_path_prefix(args: &[String]) -> bool {
+ }
+ 
+ /// Hash the version of rustc being used during the build process.
+-fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, unit: &Unit) {
++fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, _unit: &Unit) {
+     let vers = &bcx.rustc().version;
+     if vers.pre.is_empty() || bcx.gctx.cli_unstable().separate_nightlies {
+         // For stable, keep the artifacts separate. This helps if someone is
+@@ -886,7 +886,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, uni
+         // omitted since rustc should produce the same output for each target
+         // regardless of the host.
+         for line in bcx.rustc().verbose_version.lines() {
+-            if unit.kind.is_host() || !line.starts_with("host: ") {
++            if !line.starts_with("host: ") {
+                 line.hash(hasher);
+             }
+         }
+@@ -899,12 +899,6 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, uni
+     // This assumes that the first segment is the important bit ("nightly",
+     // "beta", "dev", etc.). Skip other parts like the `.3` in `-beta.3`.
+     vers.pre.split('.').next().hash(hasher);
+-    // Keep "host" since some people switch hosts to implicitly change
+-    // targets, (like gnu vs musl or gnu vs msvc). In the future, we may want
+-    // to consider hashing `unit.kind.short_name()` instead.
+-    if unit.kind.is_host() {
+-        bcx.rustc().host.hash(hasher);
+-    }
+     // None of the other lines are important. Currently they are:
+     // binary: rustc  <-- or "rustdoc"
+     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 54502ccc9e..a294201c6e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.patch;patchdir=${RUSTSRC} \
             file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=${RUSTSRC} \
             file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC} \
+            file://0007-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f"
 
-- 
2.43.0


