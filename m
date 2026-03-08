Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5898DEA8527
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:09:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40616.1772982560548547506
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VEjCzbnH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628EQ7gk606391
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 15:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=7taLkAyltsVsYgfTVfq2MWXkhxcIdKy5jANSyuK4CV8=; b=
	VEjCzbnHA8yXxh/eZQGgIx5sEk3ster++2e5bVGURWJLv8jDedXK0ux99pv8wupq
	V87qRRQEPfBf+XEnoTZG78dRgVoVVlQ1PfZWn+epJujIeAoFM01+iiwKSnh5xs+l
	lfux89poQqHWAkjMI4dlCdy+jTDDob+0ESv752zTTWi7qAYLwE3e9Z2Q7S+TTUjm
	gtg1HVjmwddt8SqPRQFvvBWe1/tls2uH8bVwgB0X0MDvUIM9o9aAdAOkaOZDK9lG
	iEXKtGIWaPDziSn0Q+U1rQm78DiJIudH1JJ2+3znVnfTPw7lWgRqhLthXnTGBxAb
	KjcHWZxKc3gNNiNijntDRQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v948x-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLM/hP4QGBQ766U0Wok0YpZGysJHvL6GkuFzxuFWMG1tIybZOAqLeJcOtG1L2ICIuA8362QP1dRsTfaEou7Jop9RPcK8dWCYpn0FH+8InukSenZXlOW1xWKoBlOCTZTuVGKJ6kOg6AOvq+mvOYEh2cGlme76F73cR+vUdCnIA5uGfFVte57f/HbYi897WHTeodSVE+gw5Vk9Kf2PnGpzUhhOmJprdb2Mr2D5CKpi/JfquX8xdkFSf1gtRnHtdGsiLwOfT/whnipTsb+GEut70kSRVa02tj+j/eAiQbGVNDO673LscyxDn7n0gvBP+WH/MHOaNdUOkIO1YCQeM7fYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7taLkAyltsVsYgfTVfq2MWXkhxcIdKy5jANSyuK4CV8=;
 b=hfxv+Z2Z4sPVOls/xypvm8ikMKDPKpIYWPuB0EwWUAbnaXJr/NQ4ajatI0gstJbj+v1D/D95kKYoDqXz3dAV7adp4lZxVKCPuTRLrrA5lYvVDJW5icT0J4j/sSEI2B5sH40mqLsdZ5sXTSuFqzEdydHY6kLa+e/3gE3Mq93wvJdJfOzGBsYXeE2GGFnYiYNz4n8dncmsVjEZrq7PdalDcCpkhL0kRKTubn5OdR7TDAPhe8WRdW5LwtuHFSgrmZ5G4jRMH4/V58xvW6LJbE1qbVm5jckijRJqjy9njVtHb52Ub7Bg2OHNbftB6cfL2NvYOzXxiInKhcfoYLvRFAR1+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.8; Sun, 8 Mar 2026 15:09:16 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 15:09:15 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v2 7/7] ltp: workaround openat2 build failure with glibc 2.43
Date: Sun,  8 Mar 2026 08:07:21 -0700
Message-ID: <20260308150834.2508331-7-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 832bd29d-22e4-45f2-d9c5-08de7d24a9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	hbwS8sgDf07dZ5pb+veL+wJA03sr+OmCC/s80FfOJ/SBA+/NK5fbDSxQs/pvt1a72FFnBJkWwjrAsdHIWnqe+QohX/MKF7sMm9wfGbXufydlR16u7UsLxMIy5T6atePXorzKxOSMjpS1t9bs4EaPPJYC5bskbtgdty6iAC9BBbYdxyED6XFlRsoIXiVe5C10DfRoByaOOgcmKSFY0D3KvXAC9VVkuljnw9/91v2kDDyGqJXaXY5mN0k8LjnLoxie9YPeCqB5nR5zOTGEOoNACOR6DzMPgcDYCJUG2JvYxqx9miDOXM4n/5CB62cSLQ0vr9DPuwlx/Klx+MPIzTyCc9Uy0fdE0vYmAiXSil4vUrriRcETwOkTLw7MJvJxcnICmuyOKwzEZiRxneJAIoTudPviU/WyCv9v6/ujJ8PwC7Zq1r/uNEI57OMzU12e+7/hQmu3AiV71MQaajwEMZx2+Il02Q9dEjbrfhAFM53asaBh8L3m9l2Q4KzWA12XoJ6XTYNPhFRTcTClrtSbpEUhC5f6n5eZ+Bb+NKlcZLC0OqhULpIZlaLFEfeBA6k6v7C1Yc0UpKPzZ3HVibPLnzq0ZUhk5/qJe32WxpT4fb+IFGDUubDep8ydH7B5t9x/xbVh9Yju6Qi6tCue0H4NfnK1Sr4TACP+4HUU2mC9et/YaqhDUQcIkVVX5aJw1inWrdlLjBBwjJBwMlYKwtKtDuUUsKaa5+tu3y211z6z6Jt619wAFnzSe/xo1SxmafI4j+6aAtBGqgr85a825MJ/hGJ+dr5pfn6sgSh6gpiwCxBLi4o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eLo7Rl0ozbc7W2fAtNNoMDd7U1qB+45JkO2IhroacRNJLmJNREEdmRyhPEzR?=
 =?us-ascii?Q?aq01DEDW7qBcd5IYZSJ4a6IKeOHpLg45e35r3amdTYj6rJ4oAIMCQ7Gg6xVZ?=
 =?us-ascii?Q?nlYbWOi2AZft+dD19rT+KYfJJ5HxxGAhF6oxzKBi9wt/ntcicWrGwMZIqi5G?=
 =?us-ascii?Q?7nItKiSSoOASIFeazWR+JgOfQ5D4MTNfPdEkJ/orFgbOKGniGjOCcuNaSjcP?=
 =?us-ascii?Q?gqh5u4K3gcyg2gVEQiwhDzb94rMzyRsMI8m0RFwYD90jN+OY09XtHAUUtyWQ?=
 =?us-ascii?Q?EPiUcEdTpB612rNKqD/uBpeVm/mMH3Dbsn2R7VUfelk+bYfu/gFWLBligpDA?=
 =?us-ascii?Q?TMcIPczftr3psJzZ6PNSxXJx4HVrYnXXqU/YH6Zzt2ZjlPKCsoZqaf9c8NiP?=
 =?us-ascii?Q?WPClOr/nZGzDZOjcFMVQ3Ncts9dF/IHHuz/HW7m3yCGCSV13YG16Tb9Iy8md?=
 =?us-ascii?Q?Mt/F7RFBl3hGk5t3YF4+wEdszqOhaO4XuiX4556GSdaHID6nzQ5Cv4PPwf+h?=
 =?us-ascii?Q?lSC7JVuHHt1oxL5VVR1VEdkyss67oms2LRPZBM+fuCUOdCg9qHN+mzl4K1fK?=
 =?us-ascii?Q?eraSenhe67GfC4eAlEL671wR07uoLx0eeOQnwwGIhNC4K6XZ2Yq/F9hbTUfc?=
 =?us-ascii?Q?G17bTTftikUemZ8/0r4QgINXmJpmj8MwFpfnAk84zgSCi2tZXjSweZpg2fSn?=
 =?us-ascii?Q?Miz+G1XvCUbBAS/RB5bxW6LvEeUbGGUtOsMgIPBzku3dqjSeJwFqLGz4GR1+?=
 =?us-ascii?Q?78IDVx9q/QCdLzc9iAWJLeYDhT1ksK8FkZxZsSS1kKYwHmtwVSzLNcgz9RC5?=
 =?us-ascii?Q?u2pxy0xm4SQG3ev8h0nMjk+YnUo9D0xffVNSqL4W7dsBR1cIJ10aP1UrDkRY?=
 =?us-ascii?Q?Iz/4Y40Nlp2KoS+F6k7QaLJPXWjzht4Vmd1HceGTkHabkwaNBKFP3Kb6JsJw?=
 =?us-ascii?Q?ILMBTJQpz771bDWyVlmyQPxTsFOLQNGwk+G/N2PcJblvYv/NZTg51lRjuwmZ?=
 =?us-ascii?Q?r3D1y9t2LtrmvvIX2//RWOrz3wS5pmZ21M60GnxgWotN2pN/vA7Zz21ugygu?=
 =?us-ascii?Q?q2Xmw7d/dxv8nvMC9g9HghRQCvXSl6AJrEod+SgDraup/iYuY+CdPgKRoXQH?=
 =?us-ascii?Q?1RI/zxol8vA3zzCHW2Ak/KRU7wXy9B/rTaliWgXhbupdxMK1jNN29yLjwyuR?=
 =?us-ascii?Q?XcDTg1NF37SmRMUvP8WWOEIm0JB9Mq2EfSPWSdHEdjHTvoq8BnJT2xLxBBfn?=
 =?us-ascii?Q?8sPA767qVPya7ZZdlrpiefAhhzWiROyZKbZcPhmF67yO4A5II8HopTHz9yPP?=
 =?us-ascii?Q?5v0kqplsmJPy95NP25ZnLJ5ng24/Ro85JNPt6nxTvrOI9tGnXuSuBnRrIrkW?=
 =?us-ascii?Q?uJIc7Vyx5bVyFHYr/nzvMtHcePdg+Gy/kJx0fqdF58ChgzBAtd/W8N2KtE9g?=
 =?us-ascii?Q?X/2Ev1JmeTCixVrMf0Ox9JCKng8TJCEsixKwXjqvVTvh3GHT2LmIrs36o7yB?=
 =?us-ascii?Q?MvWNpk1M9rm8A2Ey7dpVsfXtkhaKSX6YHAGXGPl3lWgvivgrq7h8BGnB1cu7?=
 =?us-ascii?Q?NAmAYrGCd6nHEjYb4VK9qovLC775L3zZLRyxsKN4MLXebATAvD2F/6rg1pnv?=
 =?us-ascii?Q?Y5ZO0hKe+7GVElUXYIGuMqlP516N4zvObZO/NFbIaCwpLhj46OJ9JW1DH54Q?=
 =?us-ascii?Q?ylUBIqCz2JUlJ/x7SIUstbBg+4xP08EYxcDMmWEGf3ppH6Q79wqRPBuDIZZw?=
 =?us-ascii?Q?HJCNXkFh/2mvr449IN3wpMPmclf7RqE=3D?=
X-Exchange-RoutingPolicyChecked: 
	a0D2fUNnr/RimbreSYzB/8xKghfVvhjuKG49kH2yh/T2kZaVStFOsl/RHi5Mqb0PAfXcT2I/aT/oQECa3JuRGDV/h265ERipRl+3kdybduRJrDqVE7Rb3t6PI29cT3or1SvM8klJhscYTzQ4DJXuRx08biZscIqJZ49a1kNPHGiGyMCLbn/ufy/202l+yxDdwoWzfFU47jei3vgOsSJt4zEGgA72O2QVhu339p9W2Prq0j18XG8VulSZdna2vh7Ioo5j3DR/tqea0fPyKAATzDhp5/4bMkOfKyL6VJ39hxs3+prslDp5qs90ZIBVwlpO9UCGqLeXmkfgHAUiH/HRxQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832bd29d-22e4-45f2-d9c5-08de7d24a9f8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 15:09:15.8203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3+V1q9j5pOWh3IRHKE44MMFSMCc1c3N2nP/2RJQdH/jaBKpZ20ivjMdT+hoPyy4o1uL5MNXvRc3psVhdZ0zdh49i8ltY48NWtEqZJqq1jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-ORIG-GUID: vcX9VpzFwmgq4x85UDbe3vytoRr3JWSe
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ad911f cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=5uUD0Id6OvlxfbuOjvwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOSBTYWx0ZWRfXxOZUet7RbrKK
 23KKMyuiGKWeX2Fi6M2HLKmMhFFeFzhPCKq/0mODVsNLe8T32dG16eeum98C+mvM2hnxe1MoE5I
 YhqdR5szO08HP86sZ6DazFGFKt+1YiVPSuIVhIVw7cSjUHJSa4lsH6DM6wS+Ko07pbMIioUl0Lw
 Idiku8coSr1aXSG2iRPawcqsDqW3l6S3fsEhHr/blrQooIYaMtV8TjOSnn+/hQr/4Fys+XCBr8L
 HanXcPs4mIXqTtp+I3lCIh5TpH9PK0RnmvJ3Xtil/FMS9SHsbdmd5LaZP8JaINfCuJPtz09Vg70
 +sh2Cul4U1D2VncE3v538sMtGwXrD8oQ4U6vc/cSSXnAsdB9G3lxCM0ZG8JyDYSwxqpXl+a/E6P
 Qc3Eoq9qAZkdbvT1psrWXrpKZgcZIFmLtfwQz+tMPfT9RMBhSmMqOxbctwk1rmHQ937B1oCr8BA
 BFQvKjA2GalftHif5hA==
X-Proofpoint-GUID: vcX9VpzFwmgq4x85UDbe3vytoRr3JWSe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232659

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...tp-fix-build-failure-with-glibc-2.43.patch | 34 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20260130.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
new file mode 100644
index 0000000000..148731f782
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
@@ -0,0 +1,34 @@
+ltp: fix build failure with glibc 2.43
+
+glibc 2.43 added native openat2() support for the first time. This
+caused compatibility issues with LTP's internal openat2 definitions
+in lapi/openat2.h. LTP's configure detects glibc's openat2() and
+sets HAVE_OPENAT2=1, causing lapi/openat2.h to skip its own
+definitions of struct open_how, RESOLVE_* constants and the openat2()
+wrapper, resulting in a build failure.
+
+Undef HAVE_OPENAT2 in lapi/openat2.h to force LTP to always use its
+own internal definitions. The proper fix will be investigated and
+submitted upstream ASAP.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
+index 03327bdb7..bd44573c9 100644
+--- a/include/lapi/openat2.h
++++ b/include/lapi/openat2.h
+@@ -14,6 +14,11 @@
+
+ #include "config.h"
+
++/* glibc 2.43 provides openat2 but LTP uses its own syscall wrapper */
++#ifdef HAVE_OPENAT2
++#undef HAVE_OPENAT2
++#endif
++
+ #ifndef HAVE_OPENAT2
+ /*
+  * Arguments for how openat2(2) should open the target path. If only @flags and
+
diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-extended/ltp/ltp_20260130.bb
index bb3b7e9ca3..57e3120839 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
+           file://0001-openat2-fix-glibc-2.43-build.patch \
           "
 
 inherit autotools-brokensep pkgconfig
-- 
2.49.0


