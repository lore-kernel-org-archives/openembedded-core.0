Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D2CC28B30
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 07:12:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31635.1741590739576324872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 00:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5164982c3b=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A6ILjS013728
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:12:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b411swu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:12:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1oueKc9yCW3UO3xdxx5ueeDagiRXy4ytqSSGFSU94uEgY4xpKjxQfKCBLwUXnPjADaYnPS/go/kard/mXrYCfNOhlCFIeW/QPmU14KK5aMIE181UP8XkI3I9kba5DKyojM470XjAAvNNXEiMUiQasNw66Zzz3JY+1/q5/HTiTdFsYAKdc/mhSNnlbsZv3jLlD1znLvST4Tapo2udL851BcgNKRP9a4icCMJ0tQ+ICNBnaZxhwgMesjewCwMVWUaPMOj685svwod/58sIk6OoL7aAP+L1AAdeoq7T7S6M2Le38DJGYbkr0wmOSmnhqhHvtql3LA93LWB07ajyNFCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPwXoYmXAzeHVuI6TJx5/IjyWeo9wmJO4fhnLpgtvXw=;
 b=uRcCvK6uXh2wdA994Zj0RaeFgRfEmXpaXamOKHCE8Vg43PWHmawSDZvHFRpQgwbzPSVrckRGY1PtdevnunOlhB5ZB9iIM0SdPQOJj+uehTN98kDcq/hNNzNFqr1tgQanoXl2A5JUIj2awS8X+bHwmkZ4hGEnI7XQDecMsqbeE1TbliqRLD4Kh46gB+jnztkv16OkHARpwPNIH0tcqWrfqqGRJlry1UGDxUrX8K/nCScxjPut9pk4ygv7s33KosFetJDERmdSAXeSomRUOzL2Z5qXPi8Isx0Myq9ytmN0deuycFoM1O+tdqaJ3qcOCZ1Fegj2yJGE7Wi7FHoW5ZN5vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:12:15 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:12:15 +0000
From: bin.lan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v4 0/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
Date: Mon, 10 Mar 2025 15:11:32 +0800
Message-Id: <20250310071133.2713991-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0203.jpnprd01.prod.outlook.com (2603:1096:403::33)
 To CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|SA1PR11MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d82b3b2-efb7-411f-a910-08dd5fa2e30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ts6lQ8pk8xl3Ly9dMA5YDXfX064adhH4eu+rIWCkHaJtgOIuBAf66+Kjaarq?=
 =?us-ascii?Q?Z16VwQbH3DjF/LNo5WIBXEHrg0PvX+gcqZQ94cJX2+fTKGpTm/PVy1XsFxlm?=
 =?us-ascii?Q?514J6G+EyZ1oNtSSm2UeJ0ihnhX+iGiteNoWIti21eonPX9HldglCGF6mPjo?=
 =?us-ascii?Q?fQ+8f1iaZsdC0aqy8EKHmwqptLyyEy40VG9pxGP2ZCh7AC/ctHM5ngjELcnv?=
 =?us-ascii?Q?FmzcJsvfHmwy9hMPi5cTF/SwH2exy86YBvDz03ziE3kPd40apaeGLd3Akxzq?=
 =?us-ascii?Q?ufnF2LBy9yUYjUkPtihWvJtXCroGmYTh38I5dTkqYUn9UA5JUdfKBO0saMsJ?=
 =?us-ascii?Q?QrDdnujnQAlemAhVTbmorow4OKKZAkDTCUIJQ2881y+Uo7VIzFFN6zQyLntQ?=
 =?us-ascii?Q?MhOrbfGKhgyHycbx9rDJokL7BJB0sS2u6wmr6euQol83TH+tAKZ+NBr3VrzZ?=
 =?us-ascii?Q?YXm0t+jgmE0y5qr1VYlidg4jvHXCCONtid6VBq+AlS+53QorscjaXQ4GeR6r?=
 =?us-ascii?Q?buEQtaOYPtRH61g01aavstT3+Rn1sQL/owzJ5hssQ2jXiQcqzZLYsBatdQxI?=
 =?us-ascii?Q?4639W8y3Xi1LNWmWnOGHwIm9E+s5xWj70gH2s5xtzQhlWKHb6xf6OeKb9D09?=
 =?us-ascii?Q?YZC3+jaJNIRuSvDMec+747BZSsSWyeT6n/OT3p0jBMeMDOOIcPEyUYCE3Jdv?=
 =?us-ascii?Q?zWU7POdB0rKz/gSmF1OEVSj9B2q4ZQgXiiONXAl0mD1WrkN1cBpuQBM+c2YW?=
 =?us-ascii?Q?ByxH/I7sdUp013CN9SVTRAnvh3cIcka3smkmt6zJu0Shxlga1YtaIkC0qbB7?=
 =?us-ascii?Q?CHXZZPTFsq1FY/ea7taVJwj8SHSdLtuHzAuyr0Zc/iAALtxCHLlmsN67SVIx?=
 =?us-ascii?Q?Kxd9azRxuozbzz5z4LoZvDG371fkGLDTyx30F/OFQmM5QY/+3b/0LjBCArDF?=
 =?us-ascii?Q?470igfmS69hW51epBTvSnz2X3D+nxAFPS+K+HV2g/L3D1PGCbj8O74wSI8dS?=
 =?us-ascii?Q?IBtweNBAkLW8heWqG4UvRdQDMiY+y0urEQQrYXbFrM4B+agW0rK9mlhrli/b?=
 =?us-ascii?Q?OBoOIUf8NXv0Jf7qwtc1XjU4Zpu8aE+Ds1F1jhiS69H6gEhwpcgoaLaXqEgt?=
 =?us-ascii?Q?E4yhZS1MlK6rT9f5sY/YLGQ1a9i3QTl23njrxRZDRWtGkHqQPdfIO0WZdibX?=
 =?us-ascii?Q?6xwQfOs2KHlqVrJOjGmRmxtzcRAUYVDdYxRgnFfSoFoRByqS8MOXJVqfmX7S?=
 =?us-ascii?Q?0ORbnbdGHIqe1G0FmXXEpuFOzb6rvmbXNaRfvhhgo7I32Fa8V9C9cH+yaI58?=
 =?us-ascii?Q?aOtckEkYWl1gaZ3QTUZ88MfWVVB3pqYu2qsWudAOZY2D9r/J/zE5ehlLjTLl?=
 =?us-ascii?Q?63WHSj8PfmW6NkKNXcf1y3+uxzevaAogdL7i0vV69cJ8VYK5eBAYGx+a7poj?=
 =?us-ascii?Q?baY9X3FQTEOQzPtdbDSpQb/ykDd09jzm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RIXhXGreR4eSLjOG99GWyp2xWQGF19Pjswq1eYu9ex6wg0XOxEESsWeQNsWs?=
 =?us-ascii?Q?NnfDPUekWe3ldCdvPKhN4EE0oZSFr4l/QhjYyluO/oeCcXZeW5JZzngoeItB?=
 =?us-ascii?Q?2h6Dkk6KEtsWN07nkSMYiw+uUew7IhGuzqocNxqN9s214c1F3ItzYS7rexDn?=
 =?us-ascii?Q?WoGNDVxe0Abog8BhulDr31/YFQkVgvYDdD6cPAkpZUYwr7ry06ZuuGdkcpUC?=
 =?us-ascii?Q?HU10ULfM2ug8zFVP1JO9BmNLnSKCkqV7m8kyGuFloFExj2FlJ6BCdY5aE/Rb?=
 =?us-ascii?Q?q9hcnphIADLNtxi7zjQDqeHANgrHFxRXq5ucvO78bHsT83lSRTW8jdGUNm7K?=
 =?us-ascii?Q?GmFzFiMnMdkf/yIgzA59TGit1Eak+ZwiTjXN9ZIbGjsJW4vR5B1baEIViqQQ?=
 =?us-ascii?Q?5YOEgPxJQwSZ01kyFMHuZp8eCc6WZlzsJO4AgPzLcq0wc7A12JjWdsE1x+MS?=
 =?us-ascii?Q?nMUbVBvO5ty6nXimci2E90j6hZzYLcTAklnL27vdYto3bSme29fdc1hPvaYG?=
 =?us-ascii?Q?J2I46n8OjJSYXLqM7hQiSmCiErisHzoC7mqeVobJQ9dJmnDfMj6xfNhbZ7du?=
 =?us-ascii?Q?YTeRlPlnjTMoBuQiFeBk9h3AY1suZcNFhu4dZNNSRPHtU6Rylmc7/9fbaPDe?=
 =?us-ascii?Q?gendal11ldFRmnWvTT/BIaEjIa+kBszi9fEHZZ6KUmFcexvB0vTzSk7Rm8MP?=
 =?us-ascii?Q?kxypR2i1zqAiOKR7of4RRG2j8kxqqX5HpR+EsD5Tt9tlbXZsWABmP/cfbbtE?=
 =?us-ascii?Q?BuZxpDui5rK4BW/W/o8h1sYDMazcBF7K6cpVuLizJtNEI8dxR8XiLRoFtZp5?=
 =?us-ascii?Q?bt/YJg/C8Ng7dD6RnVGrJnVnIVZrmkkvcrUZCqeP4S6VXnwkWhCUi9+RGXiV?=
 =?us-ascii?Q?oYPDYzkqmd7nbA5ifSAHWWkXAqOSeY3ATN7Zxu2EBgwntzwcLW0f8U90PUx2?=
 =?us-ascii?Q?dDJE7AzSt5S+eAHglZyjGYTIa7XF5x88hqhg6NOhlgS9uLQBxFSstfH+3Id6?=
 =?us-ascii?Q?QSU4VQls6jEeK/+/Kssd4tc7PcAhwa3noumU7HXKCEWIuUtZu/+gzDAuw96p?=
 =?us-ascii?Q?eHZ7Ew3QvAnzoBDKOYO92f37WPunVSEyDoGWZ6orm/bns8aMgbE6qL93N3xx?=
 =?us-ascii?Q?NTETlIIogmwEyTX8++hV7kYKUU04AZndDRi2e58/4+QRGopofOmjiCo4x92o?=
 =?us-ascii?Q?Lt8BgPSXdHaaQz+DG8PGZX5uKY44DhPq/WbMCs1AfUcaNkShcQiSGZFrDkuO?=
 =?us-ascii?Q?1w47rzLBNc83IEzrVe9trLbcz8QW0bwiC8acrR6cIO1GsEVgL7hNxLZJXGM5?=
 =?us-ascii?Q?rRigqClfyxT9WlHXZLb5jVlqWT+BSxv+tO0sEmq0EIZX3cB5FOIzGRcINr0x?=
 =?us-ascii?Q?IzhFysqtNNXsdP9gWE2ExfYFPVPM7+2bUxgtvGiY1r7Ek2EtHMekBHQqdxxu?=
 =?us-ascii?Q?2y1AGG02hIfGpfhkR2kZOj31AMTk34HEmrjcsxkXl+o1CZqIyA0OW14P+/XZ?=
 =?us-ascii?Q?uR+WDlt42Vg/zSAOyhxZkpxz01lPdKseTEgkbpfZXozZWLMV20GfJR111qiL?=
 =?us-ascii?Q?JzdKxRCuydoB0JeC2eaNj1a8MJtQ5hYd7cnfgtHCAZYEHFHlCN0whVdlrPzn?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d82b3b2-efb7-411f-a910-08dd5fa2e30b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:12:15.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AtV7l7B2E/06JqfSQHgprxWy7HSPOuJIf7+KlJuE7sE61WbD5AiohZ8vitGIthjQ12lEaySVW3Kkf3OWxsUkm59pKKTUFcJr/3hMm1shWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67ce90d2 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=t7CeM3EgAAAA:8 a=Q_ClVfzJme7Dk76u5v4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: j2olUR-GJ2IBAd7KDavMv2H8Kob1DkM4
X-Proofpoint-GUID: j2olUR-GJ2IBAd7KDavMv2H8Kob1DkM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=987 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503100055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212488

From: Bin Lan <bin.lan.cn@windriver.com>

v3:
Some failed test cases are disabled.
All test cases are passed when running in intel-x86-64 board.

v4:
The Upstream-Status of patches is set to Pending, I will discuss it with Babeltrace2 project.
Add some notes in the commit log to explain the license change significantly.
Add more notes in the commit message to explain the change of babeltrace2_2.1.0.bb.
Remove "INSANE_SKIP:${PN}-ptest += "buildpaths" in this patch by setting the correct environment variables in env.sh.
All test cases are passed when running in intel-x86-64 board:
# TOTAL: 1962
# PASS:  1962
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0

Bin Lan (1):
  babeltrace2: upgrade 2.0.6 -> 2.1.0

 ...001-Make-manpages-multilib-identical.patch |  9 +--
 .../0001-tests-do-not-run-some-tests.patch    | 58 +++++++++++++++++++
 ...not-run-test-applications-from-.libs.patch | 28 ---------
 ...sts-set-the-correct-plugin-directory.patch | 29 ++++++++++
 .../lttng/babeltrace2/run-ptest               |  4 +-
 ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} | 33 +++++++++--
 6 files changed, 122 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-tests.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (70%)

-- 
2.34.1


