Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D119C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 04:18:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36425.1785730682466608411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 21:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sx+gW8g+;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=267553595e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6731um03181757
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Aug 2026 21:18:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=kQdpW0lToFpdOrEv5j9+c7HIuLNLEl3NKLYRu2AZ3Ks=; b=
	sx+gW8g+yebxUBhAGlcq+S21NDNp95Vmkep9vYrXOxJLHrwwqmCbQMe30Ons9qyh
	dxRGrIRZVCihUXugxALaqf4Ge1ezZPKSCbNW+BKN4nySiXNKt9Vv6aMJKJmsw/zH
	AEtr3thYrST9XjROuUkbJgbL6yXZDe6B7GSBZ0E2FogTCkHQ9HNH73kai8iJT+NM
	csgLCGlMUUgLP/ESlgV7vZPrft4R/bEi4SHy2QffsEMNY3nqg5ut8Mj1yPtBtdwV
	dA+LpR+xZi09XqSHUPWpxXhLBIArxV4N+HhLXKQLBhOS9OSTLZBDZpuZggZ3njmO
	Wyh7M3YWu/uXF9xCxLFm8A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013025.outbound.protection.outlook.com [40.93.196.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsc31hpvr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3u9bz1aVSXjnEag+TIGO53WZ/hVUaMghbwrBk4deTIO4vIR+Gl0i86ZwOcvHVBhA9m6dkEoj7yROU1zMXyzJ1CUiC+qg6ur2NChhF6aEIqbQaAL6tY9OqZkp+wlk1hnovnJ3eCr26e809CdjNIpCoA8C1BRV+iAbZUdzfuqOZLWU2MArxoucCjd9fmnYHF+sBgIEi3T5Qr26syfltsOpvbgiEX3DCW4mw8I6HJpzRsJQumX5mXzAPhMKhwxHmiRTIBX1cQwUaY7S5cgOBJZcG7MkHUerMX7GAP1L2Hcv3fSS6HROlZNyQ45/wkxR/Bd/FP5O8zCGH9W0Rg6Cviebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQdpW0lToFpdOrEv5j9+c7HIuLNLEl3NKLYRu2AZ3Ks=;
 b=QmlYxBCrHmSjWMCb6wljqepZWoyj6pj13OQU81n46mQTDZOcUHPeRSFiVPWgIxcoA3JpZjRTe7LfKRoih5nw7RCG+fFoUvl9L1bj5ngc+8fBVdvQ2Wbj+A+KxkhGNiIL/foTsUgH/Kwr+c17mwzTxMS1sYBw+ngDkK+uVcRJYDSkeyEODJtZ5fl6gqNPju44SzY8xIdJLFSBlhRTD6S4YnVbmMb4FFRYsTkvzOiijrdApjdUZuyxB7d3apMZAqBRX6e/3un2waI/mz6rEsncGCmpHHyxhwsShogWrluDeJJYQKqAExCgnpaFN+njj9CH5pJV1YrGc+0K0t1aY1wkFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Mon, 3 Aug
 2026 04:18:00 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 04:18:00 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 1/3] clang-tools-extra: disable tests
Date: Sun,  2 Aug 2026 21:17:39 -0700
Message-ID: <20260803041741.790019-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
References: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::12) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e2ecca-fc5c-4cec-9ae3-08def1163441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	F79KV3kLLgdIlcKbVpIXVkChZEYQ4DeEnJhX9CV9shmrehOQlefqFJ0X2C4LIYYz+V8J62Oi8zKfWX6A/lWPZwXtMTdC13wMiiUF0GrHwJ1h85YiwRxy67lgKiMVU7AwwxZsYiZBcmMHIm+k/r4WPugj5ePU9Sp5sCq3KGK0AZbR5KunW6lrR9uPVxYj/bSP2Sy23wvwlyjssNIqoSO0Y07ymUPFb0PN/b86FfgTesLvVt+wfBv6ay/zaK/+U4WMrYEMm+8ya2VFg4zKrnqEsCINRxT2GKEtEUKHXv61xGn4RdjGO3YgFgMFwsGF9B4JUB4kih+sz0A/PMuSwHoC8KAzkPq5yXIfRWCNDF/EOW/6IKrkQCeL1aXiJA0JBUPBU7kb4gzCKO/RBPnnUF9MXnnCgPVU6KkYCWWqUbPjK70nrMRQWWIyQ80I0c27cNE5c2ON+uklUpyuwEG2RYlWMfjsF/Jz+2KrIKOCuywB9DgCH4kcxd23ayfjwqLI1VOkbKjSSQrAgHlwId0lHipYfRUB3P4ef54aqsh5CPiu1LQuJltLS3ubrtE7ecs/6uXJkD1uxKJbRHAYGu8ygQVk9OAt0q0rUl6zbHiSMCyKWEjy6GAbDDQ5UtIVqlaTWIkCozOc8EeE+jYEQ6WEjCRVW4OvEIuK1JGwd0OFxqqi0A1NxMompr1otKyhAhwFfEWlmpeKmmGpfEyG4chh61JtnZY9LZCzO6ZGuNjI3ZbbSiU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/noTqxsMRCS2eBI/ZPDuFC9mTW26nr9a7iL6kCWRtwHUMtAVFt25xY5ObdxD?=
 =?us-ascii?Q?N+8ztgHsKWjiPilfDtN98cgURHM5mylcUcnLfhgRhaMvBW3SE9vdptB149rF?=
 =?us-ascii?Q?1ObIKRVpVLshRZEOTooQ2zC6dzPxwldHhIOkn1zCX7+iVSEk6c6hA4j5u/PO?=
 =?us-ascii?Q?x/YWSLbca6NDkzh3wHvkCLYxII/sIBaMEK939+mXUY48JpnLNP+6i1kd/vt2?=
 =?us-ascii?Q?XQEimSIlPHDgSe2Hwtrayc6SFHSb6BzMDce8wavSZbK1EoQACki2m3R8l7a1?=
 =?us-ascii?Q?b5E3UCO2Tn1gOoWaoCHlL81aCrWMqXaFLbFmisW7XBjUqxasnm+2QCRjnDmG?=
 =?us-ascii?Q?/iUvYBq7VogBFfR+kvuOV1NINs/uJbMhEsL7Z7CW+l9tr+RBf6G/qs/3i3Ti?=
 =?us-ascii?Q?N4aVNK3hnXzksFyut+1Ot70ZCPzMBRemAWMDXRDjdB1JGL7B8U0tx+Ks4Yk4?=
 =?us-ascii?Q?VpmaAUJChZrR0aXjBa1BUlxNHxmLEDYAH7RGFid6e6Fkr774p4uuvUU4JFMH?=
 =?us-ascii?Q?1sa9eL5EWnkI4yrn3/rl5/fc/CiLLqIe8Bho1n5khlSwJa8mnu/pSDAr9Yfw?=
 =?us-ascii?Q?FIZWYj/mEWGrAcfDLVxnIvJWl+m27Ky5ZhqEeJSw9OL4ze9tiBKFmg0KM/K1?=
 =?us-ascii?Q?QSqXpj4xBy77B3vPf0KMS2abCfDJaqb1WF+fliEisSzUZPGYQUDWkBln+Zry?=
 =?us-ascii?Q?kmLv6WQwOdyip0slYCRq2T+p0o4/1f15INwLytMAzx/ETTMaJOi8X/9zhBIh?=
 =?us-ascii?Q?rItBbeqs5Osg/oxpbLLG+j6/oADWyWMmRvHG93BANfmrLOhV2Lm8CDt1UAbg?=
 =?us-ascii?Q?YxeS3q0Pw+n20snoOKHi/pSX/vXtsJOOxCJb8M38wLOPI7NELLpH8HF+FmiC?=
 =?us-ascii?Q?XgWPQRH0K79W4Z+e8pcOXr4LxKyNgNM5bnlVsPql7gUF3U+5NeIWetL1Tc1W?=
 =?us-ascii?Q?C9dA+Oguh+2qmDCi/9DUKZ+KfjW9jhPeOlBa+bJ7+QHzr8gnM1b7m8Dah+Bz?=
 =?us-ascii?Q?nrNbIIa0hTNYEaVdQW/nqRhVFFGVgU+SnRM6ivhkeBdldS7hXWAQw3/rHL70?=
 =?us-ascii?Q?S8lsvc8M2qnVPUKkaTHFUrttskp9nKpwRUiRMbaVo2VUmra1qNVHVteD3GdD?=
 =?us-ascii?Q?milO3YKz89K/QOkgmb8pG3f0I8tGg4qGWm/uI9vzFfU15pz8MnlDIw1jsSXu?=
 =?us-ascii?Q?tKACRNtsG8EaXm7HPmPKfPsnWgucaft6Vs3KoigERvOvbe48+9J0t7xgiQx2?=
 =?us-ascii?Q?14uBiFWTTbVVOXDcSzlN5d8HzpFTpg0Ks5wg7HQPTYdY3jefQEiv1KSLBpRm?=
 =?us-ascii?Q?/R6J4tE2up/kadv/7GqnO+kTxyikN86+m4mFGxgFW5/ZERdTN2E1YHnzCTk6?=
 =?us-ascii?Q?Ph8DICec8OnEGKh2b5bhgVAov03KxLPImomG4gjDnO+S3VXoXsTST8/h7Lmy?=
 =?us-ascii?Q?jh3a1DaHSjJBhWOH0XcE1vJXeV83O2B/NoScvY8uppVd9xJGIt07KG1Rq3Q+?=
 =?us-ascii?Q?oSJyGouhfWM9jPuKE5lYMDDRDTTMQECJDW5E4VFDcs8r+BzuRPI4naQT+xg9?=
 =?us-ascii?Q?GTSR5T7tktY/GCYYfmJUBVKRnz7AUNpIcYTvkCOmKQyKP1XswvUqQqfEIBiU?=
 =?us-ascii?Q?gSw8RYrc0YlFhOdQTC5XusB6yV/lagXTE0nIQTA+K+NPUwwBm4nOSqID9bnd?=
 =?us-ascii?Q?sXxEppP3IFNEluRxAd06ByPHAaoWw0lNT7nDn4+rV9N2+LPc5pq//20YCf3D?=
 =?us-ascii?Q?zi9MGxmzwlkqPt+Rrspg+P+1KHFsWq2+rKA5crHbrPr6HDUeZ+vl?=
X-Exchange-RoutingPolicyChecked: 
	XAz9vlJENXxbBYeh3g4YK6nKMEZ6DBcFkIdZtjSKjTWrZsAGkoIHgK4dXS/BFS2xHY8m9Vwl1BJRxynOW49XMQ9PMhEGmiWIH4+B/uv+9iDp4JnhR+il5Pwlbm0ex7iKMaLE3Xc35/O5hxyMM+eOUugksJRHyEqTHWIp82N4/xrtnbvXi98J/azaiVm4bFqG4zh6/V4ghvWzEujhFvgGu/n6fL+4f1yFWzMIY1UObwoP+nJ/wR45getGX+Zaks/UTJi8Apu0Gp8O5hnMFzvSxX13PkdA4XenPWJTs5hdDeyFX+Z8c6Av1/mzggnplGuf0sAY4Og5+v97AhgYc4lglQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e2ecca-fc5c-4cec-9ae3-08def1163441
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 04:18:00.2329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITBMTqYA/hdraeAWUm8RD9bqpd+feM+sucYhGJC9dABs/+vi1ADN0nY2e6rhTgDqXoj0K6nmg8Jxph/Nt2TwApgCZ4VJ2LEnIudseSVV04nrrB/fnDElMMZn+vbKPN7j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
X-Proofpoint-GUID: FBD6pQYD6GYqZ6w6SVDDklGFutNmB3aV
X-Proofpoint-ORIG-GUID: FBD6pQYD6GYqZ6w6SVDDklGFutNmB3aV
X-Authority-Analysis: v=2.4 cv=afFRWxot c=1 sm=1 tr=0 ts=6a701679 cx=c_pps
 a=XslAgrSL5Auaid5C2fKBmA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=IQOrjEw-PoaY6VFe8koA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfX04UdKwo/K2YA
 i4dSwRxlOAh2UjjUCRi0HKqXUXzafj9JKGM6QTRKbsgNAvYLskbwBJNNjzNFUdYe1kSeeG/pMB+
 zhDixwlAeX2/K2R+HHUz6+1Vs5qIz7VTowB66Wcg6PXl3ZY+hObx1S6DJ0Wfm32LGxk1Qe9wCeG
 7p3vPE4G8mN9z5o25kgdlx6bXMHQRZ1Ut0jYV3PUTMgMuABkG6ZEXyAKQB8H2LlGmZGtfmQ6iW3
 FI4JBdE+//uC3S0K+okas0riWu1IzfB9LxHAogd2kq7k9kAiLJQ5x43njJj8ZY7+28l19MfpU+w
 4dyUMbSXfzB2DrrwMkqJsl2O3C7ok/uopF/sgK0PZ8ZeiKKTaaMZjxahm59+EG8EGEYS5kctQpq
 qHv5u/6qvLeO9JB1BHXyzXJFx+GOKPDVEV7rI+hCLVKOyAP1ux8YdGymXld1bkGqNB9FikM06xN
 SdjhcA8ELS7O6+rvsKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfXzCNtMGwJW3zG
 03Mlvet2O04OBQibNtf6xVmpulDPMixpBC2Lk8WbZ+JIfnvWjL80rDkOUZg0JCUswxzloDepH46
 uYu+mJLz5SrNo/Q0DMsoxBR6RLmMdhAD9XlBSsWA2LyO6qlpHFFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 04:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242594

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
exists in LLVM's CMake project but is not visible when Clang is built
separately. To run clang tests, disable clang-tools-extra tests for now.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../0042-guard-clang-tools-extra-test.patch   | 74 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

diff --git a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
new file mode 100644
index 0000000000..9b4e29ff64
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
@@ -0,0 +1,74 @@
+clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
+exists in LLVM's CMake project but is not visible when Clang is built
+separately. To run clang tests, disable clang-tools-extra tests for now.
+
+Without this patch when CLANG_INCLUDE_TESTS is ON got the following error
+
+--------------------------------------------------------------------------------
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-clang-tidy-infrastructure-header-filter-from-config-file-simple"
+|   does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+|
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-modularize" does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+-------------------------------------------------------------------------------
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
+index 6b6f2b1..26e4c10 100644
+--- a/clang-tools-extra/CMakeLists.txt
++++ b/clang-tools-extra/CMakeLists.txt
+@@ -8,7 +8,7 @@ include(GNUInstallDirs)
+ option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS
+   "Enable query-based custom checks in clang-tidy" ON)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   umbrella_lit_testsuite_begin(check-clang-tools)
+
+   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" OFF)
+@@ -45,7 +45,7 @@ if (CLANG_ENABLE_CLANGD)
+ endif()
+
+ # Add the common testsuite after all the tools.
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+   umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tools-extra/include-cleaner/CMakeLists.txt
+index dc147f9..4855577 100644
+--- a/clang-tools-extra/include-cleaner/CMakeLists.txt
++++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ include_directories(include)
+ add_subdirectory(lib)
+ add_subdirectory(tool)
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
+index a1e9da4..94dcb96 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -215,7 +215,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 441ea099a9..d623990eca 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
     file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch \
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
     file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
+    file://0042-guard-clang-tools-extra-test.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.49.0


