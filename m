Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667EAC61DEB
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8123.1788094770422244900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dG85i60p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCnB9V1367518
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 05:59:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=vz2idaRyCpAEEUtPqd7Uza+QJlm0b1csXuSJemZMdEg=; b=
	dG85i60pMIfGYthB81MK9wK8P2fQa2Sh2soTTcTjNzD/yzak3dPUQyv7nLXF9rzG
	YIfmm3XsUAkEnDXDX8Qbr7nAX5X/V91MFXBV2usi/RmSK/2gwdPNQXkkl8dfUczU
	UiVY2cWFfHhr9zNd7KxWaCIdVM4c3xCK0xPO+2kI/qk9p5h329mpFPgj4dzh/dGD
	Vaz2+z+HMUPUAJ2VaBpKq8MWYGr+5XmAabfhiPRkUM1+K4iqWaxbhZSf6kt7HDvj
	GVBu9V7t7RA/HjOMyFqii8wJc0Ts6EZdR/PhL4nP5TAHxFQL76lAAE4yUsSXUpB0
	UwAR+okWGROv4+Ya3Hz1bw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021107.outbound.protection.outlook.com [52.101.57.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxe8wbs-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 05:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juMEeoldlq1wPx69xXTTtEyPgrYZE+lfULUElMCgHB1mCyz1FG+g8OFJCTntJfz04rleuve371V1osjKq6RpVBbK0a1B42mzdL8CuvJ3mEB0vBak4X7Luipmcam+QqGZXvhZkEcim72PK3MaWDT53QUDc4bRHwxDt69OKd0gcnVV4YGo8sWV3KD1qY0y2rNXOGYzRvz4RmxmjnaACnkRaL8b+A2S2Yv3olLX1IR3v2u21SSfS9SUF05qog/LSJseJmsB4P6PPX4AWlD8uOQPnwac0mjWrz/sPOMM3nhZNmeWuEtvD2sy5ZJsp6keM9vheZBoyAaAwPEtNF/yYsb9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz2idaRyCpAEEUtPqd7Uza+QJlm0b1csXuSJemZMdEg=;
 b=w0ktPjWpzPI+WTmiNu3ixEi9c8wxk3TE4JwIODyO+gOGYfMI/RnTlBjE+Kn+bKUzBIQ5fZHAf4tHVWeyvkF9+9HmmsavAfVvIxw6gL6qGY/J5TyBmAkMfU4yaUwfQcYlUIxZGH2mt8zPW0ukQW5GEg2krGo8uddyYRR20FXOg6WvIR0PZPBxzpVYIArQl0Typwk0jS8oYi9Rv/6vSXeaWz5APavOQ0Vi4Jbrtm3TWTHMxo2dmFY2gC/qCWBFiw033OV0SqUSVsJq2q9zyDLEjfdRutn1ZT7oCzBGfIUq/XLfWkQI+XAGP4rVzosXr2WJlKgP8U5V46199Pg2s2l84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:27 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:27 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 04/11] rust: Fix build and oe-selftest failures with LLVM 23
Date: Sun, 30 Aug 2026 18:28:44 +0530
Message-ID: <20260830125853.1139807-5-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 93822e5c-59e7-467d-a881-08df069685b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|12006099003|3023799007|56012099006|5023799004|11063799006|38350700014|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	9aZrhVfZKFOyVvnN3RAniUIYQ6A6Tq4g/JugWPKatLat3UBo65RB8qaMuwgTHq2G/tVS1CtAwitajoW4m6sm5azeas6QziwOiiesUp34r86ZKw+oUslJrLxNHP8LMVez9L8CzUWq7Ras8u1k0WamGsepTv5LcNVvktBxZE9JOdODnX7t3AddyoWohFRjtpUGsiysHlaTUJ//KNf5gszGvij19hxB34RG7uBAsJ7DNiX5NyPeGztXXNCwFf5Be+qBiYfvSoVUlp0mfQEcoc0y1RLSZNKIGOIAMSM4gLk2XXdE72/MJ0aH7hEYq/UfyHhluEfzsZ6ivrfGPXG7eQpuytGo83X+hMnsswgl4K6BuG49VmZ3RBMR/Sj1FpquNixh/9g1Hs5x2pI4kTpAqVMi0HuWmqZMuKlbpGWcnYzBon8kHefqTcpR2k8JM8E0gEwrlxsL8NG6xnxIhLUhRmm5U1LfrbRSk63poA+XvprjFIZU83VUPgursESqYdpBbWVpVlkXHEtoFK383Y5IiDuTVgxV0B/abvxqNp9S6AC7pcY3T+SzNeHStKW8y0Mk5k3b7Mqjyqg0h3Co0Jc4s1zhuXTBIEn95x0RnKgP4LMs4mXashfSDYsMC6tV40RDCoS6z7q30eTAF7jSvfirVs7aPgyKMoqYynZxqmpY6IXD34c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(12006099003)(3023799007)(56012099006)(5023799004)(11063799006)(38350700014)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UQ0nowHJFBrzo/pXjyTcdtj7sTx5aZUmLKrsjDeFvvcfY6D4fxGLQUtHr8Yu?=
 =?us-ascii?Q?ycqYF/yuPSZYJTH+vHGhuodiJ5g4RM9Blwm2L7w/qpqREwPOqnuNcLKn5+7I?=
 =?us-ascii?Q?b82t65VbBx+KNLmshW/lyQizwsRsajp8QsJeNFBckSLueUZCtKgMOQ2YjhSw?=
 =?us-ascii?Q?vgECmNtoG0XAraU1oXlG1eFxC+fB8XFMrHEMVrOZwzK8gcyoFULplPXTEfFU?=
 =?us-ascii?Q?yXHQXR1+tI8A6kzdbSDbgATFw5c1rcgekKOC2T5uLHkPyMfC1Zb5XveUNbRJ?=
 =?us-ascii?Q?Nr8BjtCKPbR+6EVwnhtClsKT9dh5sXpAydS0qJp6FnYHdRg3xlCyKKekCCoM?=
 =?us-ascii?Q?XGr0WWADQ6+MkHVYNX9M3kiUC6aFe+wDav0Fj2kk/VO17zCduVUTMSYexZUO?=
 =?us-ascii?Q?H7vq2A/P274iVSaJNFQs4WUIzhJbch7QZa4COROUaSqPO/OqRQ0jWZzggGfr?=
 =?us-ascii?Q?MGHYjNJ0q+4sI0f4HxqmGQ8m0bPVnHJXHzgoZGiA++Jx1Q7tfUMmfgzlItIf?=
 =?us-ascii?Q?GA6PnoTGJE3ZPXdNTYKEi9bbYdErB6o49ith0l+P6wiMn8fverJN6vUXLD9V?=
 =?us-ascii?Q?OMhVr8l3tkTC/BDs+XfhFxrJV0huWwup5QLPD1+I/KIiIL53SZlmngPzgAdT?=
 =?us-ascii?Q?+HOI61MLwZAaq/GKuaTYimlIyERzx7HKHnsQ4h5XbdTQnoLpyqgfMlX5iZTG?=
 =?us-ascii?Q?4dzgfdOEynjAAAapsDYD/BDJoE054az9A8KhTQxHhQMO8x1bJknd6f6JaxzS?=
 =?us-ascii?Q?Yyvx9t4dNYHmF+sJtHAwRQpCUsZGGF0A+UodjD1+LP8cS2x9Fz+mVjoGzNr1?=
 =?us-ascii?Q?hL6Ka316xFp1x5VUFao2+rZrhkiHfALGMLb22u5pyO8IfbQiWZQFjeKjtHYM?=
 =?us-ascii?Q?U+m8t7XUE8ZxkicKvTtrAgBazpafJihlZG4V3Ah12eA8rjK1f7K3H7lJqguQ?=
 =?us-ascii?Q?nfwqdcj9zKPBys5tkINhRrCEkAsIYfwjwmuwBPREPI2nMoqjeAbWGaRviJDu?=
 =?us-ascii?Q?HHpL64b5CFjFtVRzTz9sB0bo4Uj4VYZfJle/26b24HyPyTNvTguF4+sLZPQc?=
 =?us-ascii?Q?VrN2o6dfycpCzf+U/Ia2W8s02dR9Yx5iXm8fxk2NcXvW5yRZyBoEvAAB+wBM?=
 =?us-ascii?Q?dPTBbZIA/u+PSHT2GplsVvub23wBFjRMwwzZNuBYnh/7NRbJbiKVLQJRNJPn?=
 =?us-ascii?Q?fos/sZ2HD3eVoZCXC2K/JetsO8ROeKfQDUQq/M+y1tXjd0CKcwQVyit/+xvX?=
 =?us-ascii?Q?UPixraVICjbM/1mXEVyKwTZZtY7Y3dmyvtlzYWMo4w029l9T37QM2Tos+Fma?=
 =?us-ascii?Q?rcKixocNdMVyi/g/O2RkL26WvnCp4v/t4zw1bjYNM0zL2Dt/49Gxye0wuIOp?=
 =?us-ascii?Q?MTtjoSiAUx4MoN043qLa0QwIsF9Gy2UeqkdDK2IjJZU5vDiGi1Y9cOMd7wHe?=
 =?us-ascii?Q?f/8Pdvv1DFnoEJ2YeeNw74Atw7xs6tjuyJgUp/En6PTXQXnzffeWXTp83MKG?=
 =?us-ascii?Q?1uPtjPKzVR2hofeKN4TmbUgrepDM09MASc2lt0Rm/p7TaSiQphmbJioBBiab?=
 =?us-ascii?Q?3ASXxwsJn55zgVebFSoH9lGCanv/3V5/dq05wpI+qgJlygi/0i7ZGNf5kW39?=
 =?us-ascii?Q?6w1mi8UevoHPM2CQyDzf3Eaii1QAHGCMty6Swx7g9u+U9p/R5ZbeLWl8kO4N?=
 =?us-ascii?Q?ETIFwm6VKI06h4NlRN+hIiRAxrto5t6HDiBZuXJiGK521krimnvZuv8Gtm8j?=
 =?us-ascii?Q?XC6S3yuf5/vUGa0GeaW8fZSQHWw6wR4=3D?=
X-Exchange-RoutingPolicyChecked: 
	TOhjfg0wwRxVbYYBpXMzwzI94iwIor2305+1kCgK1WIYSFHYDI9MzyuO+jjJUZlTAjyNHCojMztSC3Qcg/wpxqtcUvmFkC+Tsw8oWsE3xYPvX3Qn3OlizqM3sJBPJHB1fUHc64GPikiTJxftO6K/HFuOt5B38mn7WUTjbEDxD9Z0YWJ1YiDtMTC0+lfTOwBV1mIS2V/T04BBPcJaIkKnBPkp79VftNG0pxv5CNNnQS1x5FnV6AHmXT/9XL3HLj70YdkYXq9sul2OuSRA2IfHqAg9qDEC8OKyUOrChGa3yv5rf72Fw8yXG+4iFsXLBmY0nPI+2aw7wFFSa1NnTpkpkQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93822e5c-59e7-467d-a881-08df069685b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:27.0607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOr0q7Ddf5RkWUeJ43fy2ufb/m/12kKBlenMQ9lUW1UAgeffG4gFlHAaW7GpW8OhhobFi5Q05P0ZLyrmMbcJcauI8PHEJVhILUCLCHfYWyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX0TCGSq6sTDyJ
 UF4fpzeutDHamTcC6u7KqXLUC+COztmAprzZBQVmf9OungThLvsEle/Zf99g/f8Z047849+iCks
 xaizBfkEfKA6Ot5dQ90bH3TExUlfWRD32E4MZxVhgKO904NFQdPKD93IXtpliBWLKxdQS/VmWjE
 6QE8jYVskGeXWcUvVB7FJA4YItmEQpiwWS1OPBEnCt1Y8I118mIxZYS6hgChhJ3NifWie93PNDA
 JOt6QQwtl6vwK0y2XFDlwR+V+OhmuaVkFL5ZHR1wInGFo810MWvNka9mbgVMku5N6Ix1xwOcHqg
 b7edUuE644PGUoIWilPecd8dYT6tl/G6X+T2Y4Wii1oCSKvId+P1dvq7wJB1HX6dnNRnQCLH/LJ
 T74Z9g9DfqXkeHPz2/mW+SEe4PI/niBYrTbFuilrvrm6mO2hhnVtoxWeey/6JXvehFgwgH4q0VT
 nilh+IwG6xDp2O59WhQ==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a942931 cx=c_pps
 a=AVViaUQ/FgKrFaIAxxVSSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=ec8kEqO2Ja7XmsrQUKcA:9
 a=3W00s2MDHjVg_fyO:21 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfXzSaUPpMCPdN3
 qJHjDW6/zuPr70ROcn60ogGpWbMYtB147NH5p09gI3qJ/P5UOtdhafnVNMIegYhlInXmT1HMZLQ
 wO1v4pRLIeMfwpcSeQXQLNAqdJATNH9QycCBTwinHIRTKCrV6GNc
X-Proofpoint-ORIG-GUID: iZuV7EuhTh9RSOP4xqZlqmmKPGgChR1W
X-Proofpoint-GUID: QwP4oq7fqAojnlPDflud3YB-GhyXB-OO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244642

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport upstream Rust commits to address build and oe-selftest
failures introduced by the LLVM 23 upgrade.

New patch:
0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch
The backported changes update LLVM 23 compatibility in the Rust LLVM
wrapper and adjust affected LLVM codegen tests.

Selftest Changes:
Exclude the following Windows-specific test from oe-selftest,
as it is not relevant.
tests/assembly-llvm/x86_64-windows-float-abi.rs

Excluded tests:
+---------+---------+---------+
| Before  |  After  | Skipped |
+---------+---------+---------+
|   43    |   44    |   +1    |
+---------+---------+---------+

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |   1 +
 ...ommits-from-rust-Fix-selftest-llvm23.patch | 661 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 3 files changed, 663 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index fa8a8c1e7c..645b5d5fbf 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -83,6 +83,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/tidy',
                             'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
                             'tests/assembly-llvm/c-variadic/arm.rs',
+                            'tests/assembly-llvm/x86_64-windows-float-abi.rs',
                             'tests/codegen-llvm/thread-local.rs',
                             'tests/mir-opt/',
                             'tests/run-make',
diff --git a/meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch b/meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch
new file mode 100644
index 0000000000..1e1bf089f1
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch
@@ -0,0 +1,661 @@
+Backport commits that fix build and oe-selftest failures seen with llvm 23
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/b8d3a4ac9cfeb81d1e929fe6eab0af4b77ba3bb4]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/d4a24cd6e18b98326429d8c7e7bbb269da14a5aa]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/20ac2125a2142c9bde53ca06d9b3cfb6941fd437]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/2d18054569d1169bfae7ce21e5c7111f32f16774]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/e2159107f6ebc615ba6a92960d65528baf90cd35]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/283a60b64339d611b76a4ed2f9286f417b269b2f]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/61d9ba28a99f073fbeb19dbb552ddf343aef62f0]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp b/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp
+index fe5b8edce4a..e4807f10805 100644
+--- a/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp
++++ b/compiler/rustc_llvm/llvm-wrapper/PassWrapper.cpp
+@@ -49,6 +49,9 @@
+ #include "llvm/Transforms/Instrumentation/RealtimeSanitizer.h"
+ #include "llvm/Transforms/Instrumentation/ThreadSanitizer.h"
+ #include "llvm/Transforms/Scalar/AnnotationRemarks.h"
++#if LLVM_VERSION_GE(23, 0)
++#include "llvm/Transforms/Utils/AssignGUID.h"
++#endif
+ #include "llvm/Transforms/Utils/CanonicalizeAliases.h"
+ #include "llvm/Transforms/Utils/FunctionImportUtils.h"
+ #include "llvm/Transforms/Utils/NameAnonGlobals.h"
+@@ -925,6 +928,9 @@
+   if (NeedThinLTOBufferPasses) {
+     MPM.addPass(CanonicalizeAliasesPass());
+     MPM.addPass(NameAnonGlobalPass());
++#if LLVM_VERSION_GE(23, 0)
++    MPM.addPass(AssignGUIDPass());
++#endif
+   }
+   // For `-Copt-level=0`, and the pre-link fat/thin LTO stages.
+   if (ThinLTOBufferRef && *ThinLTOBufferRef == nullptr) {
+@@ -1464,6 +1470,9 @@
+         PB.registerLoopAnalyses(LAM);
+         PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);
+         ModulePassManager MPM;
++#if LLVM_VERSION_GE(23, 0)
++        MPM.addPass(AssignGUIDPass());
++#endif
+         MPM.addPass(ThinLTOBitcodeWriterPass(OS, nullptr));
+         MPM.run(*unwrap(M), MAM);
+       } else {
+diff --git a/tests/codegen-llvm/bpf-allows-unaligned.rs b/tests/codegen-llvm/bpf-allows-unaligned.rs
+index c7a70d5b2e5..7e95a56d984 100644
+--- a/tests/codegen-llvm/bpf-allows-unaligned.rs
++++ b/tests/codegen-llvm/bpf-allows-unaligned.rs
+@@ -5,7 +5,7 @@
+ 
+ #[no_mangle]
+ #[target_feature(enable = "allows-misaligned-mem-access")]
+-// CHECK: define noundef zeroext i8 @foo(i8 noundef returned %arg) unnamed_addr #0 {
++// CHECK: define noundef zeroext i8 @foo(i8 noundef returned %arg) unnamed_addr #0
+ pub unsafe fn foo(arg: u8) -> u8 {
+     arg
+ }
+diff --git a/tests/codegen-llvm/branch-protection.rs b/tests/codegen-llvm/branch-protection.rs
+index ed1cb2cd137..11847c256d6 100644
+--- a/tests/codegen-llvm/branch-protection.rs
++++ b/tests/codegen-llvm/branch-protection.rs
+@@ -22,7 +22,7 @@
+ use minicore::*;
+ 
+ // A basic test function.
+-// CHECK: @test(){{.*}} [[ATTR:#[0-9]+]] {
++// CHECK: @test(){{.*}} [[ATTR:#[0-9]+]]
+ #[no_mangle]
+ pub fn test() {}
+ 
+diff --git a/tests/codegen-llvm/frame-pointer-cli-control.rs b/tests/codegen-llvm/frame-pointer-cli-control.rs
+index 911a5f03cbc..79cdfc70f1a 100644
+--- a/tests/codegen-llvm/frame-pointer-cli-control.rs
++++ b/tests/codegen-llvm/frame-pointer-cli-control.rs
+@@ -45,7 +45,7 @@
+ 
+ extern crate minicore;
+ 
+-// CHECK: i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]] {
++// CHECK: i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]]
+ #[no_mangle]
+ pub fn peach(x: u32) -> u32 {
+     x
+diff --git a/tests/codegen-llvm/frame-pointer.rs b/tests/codegen-llvm/frame-pointer.rs
+index 1d0dd762826..a52d95a2386 100644
+--- a/tests/codegen-llvm/frame-pointer.rs
++++ b/tests/codegen-llvm/frame-pointer.rs
+@@ -18,7 +18,7 @@
+ extern crate minicore;
+ use minicore::*;
+ 
+-// CHECK: define i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]] {
++// CHECK: define i32 @peach{{.*}}[[PEACH_ATTRS:\#[0-9]+]]
+ #[no_mangle]
+ pub fn peach(x: u32) -> u32 {
+     x
+diff --git a/tests/codegen-llvm/gpu-convergent.rs b/tests/codegen-llvm/gpu-convergent.rs
+index bb9271ab699..376d65a3d4a 100644
+--- a/tests/codegen-llvm/gpu-convergent.rs
++++ b/tests/codegen-llvm/gpu-convergent.rs
+@@ -17,7 +17,7 @@
+     fn ext();
+ }
+ 
+-// CHECK: define {{.*}}_kernel void @fun(i32{{.*}}) unnamed_addr #[[ATTR:[0-9]+]] {
++// CHECK: define {{.*}}_kernel void @fun(i32{{.*}}) unnamed_addr #[[ATTR:[0-9]+]]
+ // CHECK: declare void @ext() unnamed_addr #[[ATTR]]
+ // CHECK: attributes #[[ATTR]] = {{.*}} convergent
+ #[no_mangle]
+diff --git a/tests/codegen-llvm/instrument-coverage/testprog.rs b/tests/codegen-llvm/instrument-coverage/testprog.rs
+index ef61ede6de8..67c49c438f9 100644
+--- a/tests/codegen-llvm/instrument-coverage/testprog.rs
++++ b/tests/codegen-llvm/instrument-coverage/testprog.rs
+@@ -101,7 +101,7 @@ fn main() {
+ // CHECK-SAME:   @__llvm_prf_nm
+ // CHECK-SAME:   section "llvm.metadata"
+ 
+-// CHECK:        define internal { {{.*}} } @_R{{[a-zA-Z0-9_]+}}testprog14will_be_called() unnamed_addr #{{[0-9]+}} {
++// CHECK:        define internal { {{.*}} } @_R{{[a-zA-Z0-9_]+}}testprog14will_be_called() unnamed_addr #{{[0-9]+}}
+ // CHECK-NEXT:   start:
+ // CHECK-NOT:    define internal
+ // CHECK:        atomicrmw add ptr
+@@ -109,7 +109,7 @@ fn main() {
+ 
+ // CHECK:        declare void @llvm.instrprof.increment(ptr, i64, i32, i32) #[[LLVM_INSTRPROF_INCREMENT_ATTR:[0-9]+]]
+ 
+-// WIN:          define linkonce_odr hidden i32 @__llvm_profile_runtime_user() #[[LLVM_PROFILE_RUNTIME_USER_ATTR:[0-9]+]] comdat {{.*}}{
++// WIN:          define linkonce_odr hidden i32 @__llvm_profile_runtime_user() #[[LLVM_PROFILE_RUNTIME_USER_ATTR:[0-9]+]] comdat {{.*}}
+ // WIN-NEXT:     %1 = load i32, ptr @__llvm_profile_runtime
+ // WIN-NEXT:     ret i32 %1
+ // WIN-NEXT:     }
+diff --git a/tests/codegen-llvm/link_section.rs b/tests/codegen-llvm/link_section.rs
+index f196ea86c44..61bde683c0a 100644
+--- a/tests/codegen-llvm/link_section.rs
++++ b/tests/codegen-llvm/link_section.rs
+@@ -29,7 +29,7 @@ pub enum E {
+ #[link_section = "__TEST,three"]
+ pub static VAR3: E = E::B(1.);
+ 
+-// CHECK: define {{(dso_local )?}}void @fn1() {{.*}} section "__TEST,four" {
++// CHECK: define {{(dso_local )?}}void @fn1() {{.*}} section "__TEST,four"
+ #[no_mangle]
+ #[link_section = "__TEST,four"]
+ pub fn fn1() {}
+diff --git a/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-normalized-generalized.rs b/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-normalized-generalized.rs
+index 7639ce7b104..5b1aa97ab33 100644
+--- a/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-normalized-generalized.rs
++++ b/tests/codegen-llvm/sanitizer/cfi/emit-type-metadata-itanium-cxx-abi-normalized-generalized.rs
+@@ -7,21 +7,21 @@
+ 
+ pub fn foo(f: fn(i32) -> i32, arg: i32) -> i32 {
+     // CHECK-LABEL: define{{.*}}foo
+-    // CHECK-SAME:  {{.*}}![[TYPE1:[0-9]+]]
++    // CHECK-SAME:  {{.*}}!type ![[TYPE1:[0-9]+]]
+     // CHECK:       call i1 @llvm.type.test(ptr {{%f|%0}}, metadata !"_ZTSFu3i32S_E.normalized.generalized")
+     f(arg)
+ }
+ 
+ pub fn bar(f: fn(i32, i32) -> i32, arg1: i32, arg2: i32) -> i32 {
+     // CHECK-LABEL: define{{.*}}bar
+-    // CHECK-SAME:  {{.*}}![[TYPE2:[0-9]+]]
++    // CHECK-SAME:  {{.*}}!type ![[TYPE2:[0-9]+]]
+     // CHECK:       call i1 @llvm.type.test(ptr {{%f|%0}}, metadata !"_ZTSFu3i32S_S_E.normalized.generalized")
+     f(arg1, arg2)
+ }
+ 
+ pub fn baz(f: fn(i32, i32, i32) -> i32, arg1: i32, arg2: i32, arg3: i32) -> i32 {
+     // CHECK-LABEL: define{{.*}}baz
+-    // CHECK-SAME:  {{.*}}![[TYPE3:[0-9]+]]
++    // CHECK-SAME:  {{.*}}!type ![[TYPE3:[0-9]+]]
+     // CHECK:       call i1 @llvm.type.test(ptr {{%f|%0}}, metadata !"_ZTSFu3i32S_S_S_E.normalized.generalized")
+     f(arg1, arg2, arg3)
+ }
+diff --git a/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs b/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs
+index 35317b0dd39..3df2d569f9a 100644
+--- a/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs
++++ b/tests/codegen-llvm/some-non-zero-from-atomic-optimization.rs
+@@ -72,7 +72,7 @@ pub unsafe fn some_non_zero_from_atomic_get() -> Option<NonZeroUsize> {
+ ///
+ /// The way we check that the LLVM IR is correct is by making sure that neither
+ /// `panic` nor `unreachable` is part of the LLVM IR:
+-// CHECK-LABEL: define {{.*}} i64 @some_non_zero_from_atomic_get2() {{.*}} {
++// CHECK-LABEL: define {{.*}} i64 @some_non_zero_from_atomic_get2() {{.*}}
+ // CHECK-NOT: panic
+ // CHECK-NOT: unreachable
+ #[no_mangle]
+diff --git a/tests/codegen-llvm/target-feature-negative-implication.rs b/tests/codegen-llvm/target-feature-negative-implication.rs
+index a9cdca42839..376599738e5 100644
+--- a/tests/codegen-llvm/target-feature-negative-implication.rs
++++ b/tests/codegen-llvm/target-feature-negative-implication.rs
+@@ -13,7 +13,7 @@
+ #[no_mangle]
+ pub unsafe fn banana() {
+     // CHECK-LABEL: @banana()
+-    // CHECK-SAME: [[BANANAATTRS:#[0-9]+]] {
++    // CHECK-SAME: [[BANANAATTRS:#[0-9]+]]
+ }
+ 
+ // CHECK: attributes [[BANANAATTRS]]
+diff --git a/tests/codegen-llvm/target-feature-overrides.rs b/tests/codegen-llvm/target-feature-overrides.rs
+index 2adc8ee6f53..3bf05c7977e 100644
+--- a/tests/codegen-llvm/target-feature-overrides.rs
++++ b/tests/codegen-llvm/target-feature-overrides.rs
+@@ -23,7 +23,7 @@
+ #[no_mangle]
+ pub unsafe fn apple() -> u32 {
+     // CHECK-LABEL: @apple()
+-    // CHECK-SAME: [[APPLEATTRS:#[0-9]+]] {
++    // CHECK-SAME: [[APPLEATTRS:#[0-9]+]]
+     // CHECK: {{.*}}call{{.*}}@peach
+     peach()
+ }
+@@ -32,7 +32,7 @@ pub unsafe fn apple() -> u32 {
+ #[no_mangle]
+ pub unsafe fn banana() -> u32 {
+     // CHECK-LABEL: @banana()
+-    // CHECK-SAME: [[BANANAATTRS:#[0-9]+]] {
++    // CHECK-SAME: [[BANANAATTRS:#[0-9]+]]
+     // COMPAT: {{.*}}call{{.*}}@peach
+     // INCOMPAT: {{.*}}call{{.*}}@apple
+     apple() // Compatible for inline in COMPAT revision and can't be inlined in INCOMPAT
+diff --git a/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs
+index ecace722e0d..279780e3a7a 100644
+--- a/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/aapcs-unwind-abi.rs
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
+ // `aapcs-unwind` extern functions. `aapcs-unwind` functions MUST NOT have this attribute. We
+ // disable optimizations above to prevent LLVM from inferring the attribute.
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "aapcs" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "aapcs-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs
+index 46c08b5fc4f..1b3312839e3 100644
+--- a/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/c-unwind-abi.rs
+@@ -7,11 +7,11 @@
+ 
+ #![crate_type = "lib"]
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "C" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "C-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs
+index 8e643d6ce49..6f4eafb353c 100644
+--- a/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/cdecl-unwind-abi.rs
+@@ -7,11 +7,11 @@
+ 
+ #![crate_type = "lib"]
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "cdecl" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "cdecl-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs
+index 7df46813ed1..51c6fd15b9c 100644
+--- a/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/fastcall-unwind-abi.rs
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
+ // `fastcall-unwind` extern functions. `fastcall-unwind` functions MUST NOT have this attribute. We
+ // disable optimizations above to prevent LLVM from inferring the attribute.
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "fastcall" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "fastcall-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs
+index cc06ee12549..b5fcea52b4d 100644
+--- a/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/stdcall-unwind-abi.rs
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
+ // extern functions. `stdcall-unwind` functions MUST NOT have this attribute. We disable
+ // optimizations above to prevent LLVM from inferring the attribute.
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "stdcall" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "stdcall-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs
+index 5f910248346..15fce95fe28 100644
+--- a/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/system-unwind-abi.rs
+@@ -7,11 +7,11 @@
+ 
+ #![crate_type = "lib"]
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "system" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "system-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs
+index 69bfaf80b4b..1293e7c0a5f 100644
+--- a/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/sysv64-unwind-abi.rs
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
+ // `sysv64-unwind` extern functions. `sysv64-unwind` functions MUST NOT have this attribute. We
+ // disable optimizations above to prevent LLVM from inferring the attribute.
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "sysv64" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "sysv64-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs
+index 05f6b8b70e1..a9b6c34ee58 100644
+--- a/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/thiscall-unwind-abi.rs
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
+ // `thiscall-unwind` extern functions. `thiscall-unwind` functions MUST NOT have this attribute. We
+ // disable optimizations above to prevent LLVM from inferring the attribute.
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "thiscall" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "thiscall-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs
+index d001a16b32a..8cedb55ae1d 100644
+--- a/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/vectorcall-unwind-abi.rs
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
+ // `vectorcall-unwind` extern functions. `vectorcall-unwind` functions MUST NOT have this attribute.
+ // We disable optimizations above to prevent LLVM from inferring the attribute.
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "vectorcall" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "vectorcall-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs b/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs
+index 257f00b54e4..2a3ad330406 100644
+--- a/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs
++++ b/tests/codegen-llvm/unwind-abis/win64-unwind-abi.rs
+@@ -16,11 +16,11 @@ pub trait Sized: MetaSized {}
+ // `win64-unwind` extern functions. `win64-unwind` functions MUST NOT have this attribute. We
+ // disable optimizations above to prevent LLVM from inferring the attribute.
+ 
+-// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0 {
++// CHECK: @rust_item_that_cannot_unwind() unnamed_addr #0
+ #[no_mangle]
+ pub extern "win64" fn rust_item_that_cannot_unwind() {}
+ 
+-// CHECK: @rust_item_that_can_unwind() unnamed_addr #1 {
++// CHECK: @rust_item_that_can_unwind() unnamed_addr #1
+ #[no_mangle]
+ pub extern "win64-unwind" fn rust_item_that_can_unwind() {}
+ 
+diff --git a/tests/assembly-llvm/slice-is_ascii.rs b/tests/assembly-llvm/slice-is_ascii.rs
+index e53cd5160cf..6d660e78147 100644
+--- a/tests/assembly-llvm/slice-is_ascii.rs
++++ b/tests/assembly-llvm/slice-is_ascii.rs
+@@ -6,6 +6,11 @@
+ //@ only-x86_64
+ //@ ignore-sgx
+
++// No longer optimizes as desired, tracked at:
++// https://github.com/rust-lang/rust/issues/154141
++// https://github.com/llvm/llvm-project/issues/209216
++//@ max-llvm-major-version: 22
++
+ #![feature(str_internals)]
+
+ // CHECK-LABEL: is_ascii_simple_demo:
+diff --git a/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs b/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs
+index 40d16886c6d..d3698fda5fe 100644
+--- a/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs
++++ b/tests/assembly-llvm/simd-intrinsic-mask-reduce.rs
+@@ -1,12 +1,16 @@
+ // verify that simd mask reductions do not introduce additional bit shift operations
+ //@ add-minicore
+-//@ revisions: x86 aarch64
++//@ revisions: x86 aarch64-llvm22 aarch64
+ //@ [x86] compile-flags: --target=x86_64-unknown-linux-gnu -C llvm-args=-x86-asm-syntax=intel
+ // Set the base cpu explicitly, in case the default has been changed.
+ //@ [x86] compile-flags: -C target-cpu=x86-64
+ //@ [x86] needs-llvm-components: x86
++//@ [aarch64-llvm22] compile-flags: --target=aarch64-unknown-linux-gnu
++//@ [aarch64-llvm22] needs-llvm-components: aarch64
++//@ [aarch64-llvm22] max-llvm-major-version: 22
+ //@ [aarch64] compile-flags: --target=aarch64-unknown-linux-gnu
+ //@ [aarch64] needs-llvm-components: aarch64
++//@ [aarch64] min-llvm-version: 23
+ //@ assembly-output: emit-asm
+ //@ compile-flags: --crate-type=lib -Copt-level=3 -C panic=abort
+
+@@ -33,12 +37,19 @@
+     // x86-NEXT: {{cmp ax, -1|cmp eax, 65535|xor eax, 65535}}
+     // x86-NEXT: sete al
+     //
++    // aarch64-llvm22-NOT: shl
++    // aarch64-llvm22: cmge v0.16b, v0.16b, #0
++    // aarch64-llvm22-DAG: mov [[REG1:[a-z0-9]+]], #1
++    // aarch64-llvm22-DAG: umaxv b0, v0.16b
++    // aarch64-llvm22-NEXT: fmov [[REG2:[a-z0-9]+]], s0
++    // aarch64-llvm22-NEXT: bic w0, [[REG1]], [[REG2]]
++    //
+     // aarch64-NOT: shl
+     // aarch64: cmge v0.16b, v0.16b, #0
+-    // aarch64-DAG: mov [[REG1:[a-z0-9]+]], #1
+-    // aarch64-DAG: umaxv b0, v0.16b
+-    // aarch64-NEXT: fmov [[REG2:[a-z0-9]+]], s0
+-    // aarch64-NEXT: bic w0, [[REG1]], [[REG2]]
++    // aarch64-NEXT: addp [[REG1:d[0-9]+]], v0.2d
++    // aarch64-NEXT: fmov [[REG2:x[0-9]+]], [[REG1]]
++    // aarch64-NEXT: cmp [[REG2]], #0
++    // aarch64-NEXT: cset w0, eq
+     simd_reduce_all(m)
+ }
+
+@@ -50,10 +61,17 @@
+     // x86-NEXT: test eax, eax
+     // x86-NEXT: setne al
+     //
++    // aarch64-llvm22-NOT: shl
++    // aarch64-llvm22: cmlt v0.16b, v0.16b, #0
++    // aarch64-llvm22-NEXT: umaxv b0, v0.16b
++    // aarch64-llvm22-NEXT: fmov [[REG:[a-z0-9]+]], s0
++    // aarch64-llvm22-NEXT: and w0, [[REG]], #0x1
++    //
+     // aarch64-NOT: shl
+     // aarch64: cmlt v0.16b, v0.16b, #0
+-    // aarch64-NEXT: umaxv b0, v0.16b
+-    // aarch64-NEXT: fmov [[REG:[a-z0-9]+]], s0
+-    // aarch64-NEXT: and w0, [[REG]], #0x1
++    // aarch64-NEXT: addp [[REG1:d[0-9]+]], v0.2d
++    // aarch64-NEXT: fmov [[REG2:x[0-9]+]], [[REG1]]
++    // aarch64-NEXT: cmp [[REG2]], #0
++    // aarch64-NEXT: cset w0, ne
+     simd_reduce_any(m)
+ }
+diff --git a/tests/codegen-llvm/asm/global_asm.rs b/tests/codegen-llvm/asm/global_asm.rs
+index 32075daa3cf..8c1c4a3b588 100644
+--- a/tests/codegen-llvm/asm/global_asm.rs
++++ b/tests/codegen-llvm/asm/global_asm.rs
+@@ -7,10 +7,10 @@
+
+ use std::arch::global_asm;
+
+-// CHECK-LABEL: foo
+ // CHECK: module asm
++// CHECK-LABEL: foo
+ // this regex will capture the correct unconditional branch inst.
+-// CHECK: module asm "{{[[:space:]]+}}jmp baz"
++// CHECK: "{{[[:space:]]+}}jmp baz"
+ global_asm!(
+     r#"
+     .global foo
+diff --git a/tests/codegen-llvm/asm/global_asm_include.rs b/tests/codegen-llvm/asm/global_asm_include.rs
+index 98be9c3e333..cad9901336b 100644
+--- a/tests/codegen-llvm/asm/global_asm_include.rs
++++ b/tests/codegen-llvm/asm/global_asm_include.rs
+@@ -7,9 +7,9 @@
+
+ use std::arch::global_asm;
+
+-// CHECK-LABEL: foo
+ // CHECK: module asm
+-// CHECK: module asm "{{[[:space:]]+}}jmp baz"
++// CHECK-LABEL: foo
++// CHECK: "{{[[:space:]]+}}jmp baz"
+ global_asm!(include_str!("foo.s"));
+
+ extern "C" {
+diff --git a/tests/codegen-llvm/asm/global_asm_x2.rs b/tests/codegen-llvm/asm/global_asm_x2.rs
+index 9e3a00f0680..8c6f38289de 100644
+--- a/tests/codegen-llvm/asm/global_asm_x2.rs
++++ b/tests/codegen-llvm/asm/global_asm_x2.rs
+@@ -8,12 +8,12 @@
+
+ use core::arch::global_asm;
+
+-// CHECK-LABEL: foo
+ // CHECK: module asm
+-// CHECK: module asm "{{[[:space:]]+}}jmp baz"
++// CHECK-LABEL: foo
++// CHECK: "{{[[:space:]]+}}jmp baz"
+ // any other global_asm will be appended to this first block, so:
+ // CHECK-LABEL: bar
+-// CHECK: module asm "{{[[:space:]]+}}jmp quux"
++// CHECK: "{{[[:space:]]+}}jmp quux"
+ global_asm!(
+     r#"
+     .global foo
+diff --git a/tests/codegen-llvm/array-cmp.rs b/tests/codegen-llvm/array-cmp.rs
+index 0106b9c15c1..5b0a802f409 100644
+--- a/tests/codegen-llvm/array-cmp.rs
++++ b/tests/codegen-llvm/array-cmp.rs
+@@ -2,6 +2,9 @@
+
+ //@ compile-flags: -C opt-level=2
+ //@ needs-deterministic-layouts (checks depend on tuple layout)
++//@ revisions: LLVM22 LLVM23
++//@ [LLVM22] max-llvm-major-version: 22
++//@ [LLVM23] min-llvm-version: 23
+
+ #![crate_type = "lib"]
+
+@@ -66,7 +69,8 @@ pub fn compare() -> bool {
+     // CHECK-NEXT: br i1 %[[EQ01]], label %{{.+}}, label %[[EXIT_U]]
+
+     // CHECK: [[DONE]]:
+-    // CHECK: %[[RET:.+]] = phi i1 [ %{{.+}}, %[[EXIT_S]] ], [ %{{.+}}, %[[EXIT_U]] ], [ true, %[[L11]] ]
++    // LLVM22: %[[RET:.+]] = phi i1 [ %{{.+}}, %[[EXIT_S]] ], [ %{{.+}}, %[[EXIT_U]] ], [ true, %[[L11]] ]
++    // LLVM23: %[[RET:.+]] = phi i1 [ %{{.+}}, %[[EXIT_U]] ], [ %{{.+}}, %[[EXIT_S]] ], [ true, %[[L11]] ]
+     // CHECK: ret i1 %[[RET]]
+
+     a <= b
+diff --git a/tests/codegen-llvm/enum/enum-match.rs b/tests/codegen-llvm/enum/enum-match.rs
+index 6d8b97328f8..a0cba452e12 100644
+--- a/tests/codegen-llvm/enum/enum-match.rs
++++ b/tests/codegen-llvm/enum/enum-match.rs
+@@ -1,5 +1,8 @@
+ //@ compile-flags: -Copt-level=1
+ //@ only-64bit
++//@ revisions: LLVM22 LLVM23
++//@ [LLVM22] max-llvm-major-version: 22
++//@ [LLVM23] min-llvm-version: 23
+
+ #![crate_type = "lib"]
+ #![feature(core_intrinsics)]
+@@ -18,8 +21,9 @@ pub enum Enum0 {
+ // CHECK-LABEL: define{{( dso_local)?}} noundef{{( range\(i8 [0-9]+, [0-9]+\))?}} i8 @match0(i8{{.+}}%0)
+ // CHECK-NEXT: start:
+ // CHECK-NEXT: %[[IS_B:.+]] = icmp eq i8 %0, 2
+-// CHECK-NEXT: %[[TRUNC:.+]] = and i8 %0, 1
+-// CHECK-NEXT: %[[R:.+]] = select i1 %[[IS_B]], i8 13, i8 %[[TRUNC]]
++// LLVM22-NEXT: %[[TRUNC:.+]] = and i8 %0, 1
++// LLVM22-NEXT: %[[R:.+]] = select i1 %[[IS_B]], i8 13, i8 %[[TRUNC]]
++// LLVM23-NEXT: %[[R:.+]] = select i1 %[[IS_B]], i8 13, i8 %0
+ // CHECK-NEXT: ret i8 %[[R]]
+ #[no_mangle]
+ pub fn match0(e: Enum0) -> u8 {
+diff --git a/tests/assembly-llvm/simd-bitmask.rs b/tests/assembly-llvm/simd-bitmask.rs
+index 98f63c165f3..e8bb335c5b0 100644
+--- a/tests/assembly-llvm/simd-bitmask.rs
++++ b/tests/assembly-llvm/simd-bitmask.rs
+@@ -11,7 +11,7 @@
+ //@ [aarch64] min-llvm-version: 23
+ //@ [aarch64] compile-flags: --target=aarch64-unknown-linux-gnu
+ //@ [aarch64] needs-llvm-components: aarch64
+-//@ [aarch64-llvm-pre-23] ignore-llvm-version: 23 - 99
++//@ [aarch64-llvm-pre-23] max-llvm-major-version: 22
+ //@ [aarch64-llvm-pre-23] compile-flags: --target=aarch64-unknown-linux-gnu
+ //@ [aarch64-llvm-pre-23] needs-llvm-components: aarch64
+ //@ assembly-output: emit-asm
+diff --git a/tests/codegen-llvm/array-equality.rs b/tests/codegen-llvm/array-equality.rs
+index 706caebdcb6..c0f716b6067 100644
+--- a/tests/codegen-llvm/array-equality.rs
++++ b/tests/codegen-llvm/array-equality.rs
+@@ -1,5 +1,5 @@
+ //@ revisions: llvm-current llvm-next
+-//@[llvm-current] ignore-llvm-version: 23-99
++//@[llvm-current] max-llvm-major-version: 22
+ //@[llvm-next] min-llvm-version: 23
+ //@ compile-flags: -Copt-level=3 -Z merge-functions=disabled
+ //@ only-x86_64
+diff --git a/tests/ui/explicit-tail-calls/support/bystack.rs b/tests/ui/explicit-tail-calls/support/bystack.rs
+index ddd9c79f5c7..c89ad194f8b 100644
+--- a/tests/ui/explicit-tail-calls/support/bystack.rs
++++ b/tests/ui/explicit-tail-calls/support/bystack.rs
+@@ -36,11 +36,11 @@
+ //@ revisions: loongarch32
+ //@[loongarch32] compile-flags: --target loongarch32-unknown-none
+ //@[loongarch32] needs-llvm-components: loongarch
+-//@[loongarch32] ignore-llvm-version: 22 - 23
++//@[loongarch32] max-llvm-major-version: 21
+ //@ revisions: loongarch64
+ //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu
+ //@[loongarch64] needs-llvm-components: loongarch
+-//@[loongarch64] ignore-llvm-version: 22 - 23
++//@[loongarch64] max-llvm-major-version: 21
+ //@ revisions: bpf
+ //@[bpf] compile-flags: --target bpfeb-unknown-none
+ //@[bpf] needs-llvm-components: bpf
+diff --git a/tests/ui/explicit-tail-calls/support/byval.rs b/tests/ui/explicit-tail-calls/support/byval.rs
+index f451a953f2a..e6f26b9292e 100644
+--- a/tests/ui/explicit-tail-calls/support/byval.rs
++++ b/tests/ui/explicit-tail-calls/support/byval.rs
+@@ -36,11 +36,11 @@
+ //@ revisions: loongarch32
+ //@[loongarch32] compile-flags: --target loongarch32-unknown-none
+ //@[loongarch32] needs-llvm-components: loongarch
+-//@[loongarch32] ignore-llvm-version: 22 - 23
++//@[loongarch32] max-llvm-major-version: 21
+ //@ revisions: loongarch64
+ //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu
+ //@[loongarch64] needs-llvm-components: loongarch
+-//@[loongarch64] ignore-llvm-version: 22 - 23
++//@[loongarch64] max-llvm-major-version: 21
+ //@ revisions: bpf
+ //@[bpf] compile-flags: --target bpfeb-unknown-none
+ //@[bpf] needs-llvm-components: bpf
+diff --git a/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs b/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs
+index 5834255f3d3..c3090a20e4d 100644
+--- a/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs
++++ b/tests/codegen-llvm/issues/issue-107681-unwrap_unchecked.rs
+@@ -14,7 +14,6 @@ pub unsafe fn foo(x: &mut Copied<Iter<'_, u32>>) -> u32 {
+     // CHECK-NOT: br {{.*}}
+     // CHECK-NOT: select
+     // CHECK: [[RET:%.*]] = load i32, ptr
+-    // CHECK-NEXT: assume
+-    // CHECK-NEXT: ret i32 [[RET]]
++    // CHECK: ret i32 [[RET]]
+     x.next().unwrap_unchecked()
+ }
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index dd3e89a097..d87271b29c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.patch;patchdir=${RUSTSRC} \
+            file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "271fa73d8174f53d713c46a8310da7bf7cfdcfb8b7cfd1c2b74b84a83ae9fb1e"
 
-- 
2.43.0


