Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BAEC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 15:19:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10914.1783523955299158314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 08:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KecvRXm+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668CLhWW3910653
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 15:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=g/tzWG2nGYMOHsutqqeIh/cLpYBFORS0e0OgEd9JmVs=; b=
	KecvRXm+cAHBIR62Xx/GeiL0fLaIAmBMD2RU8SI/2dLG1b+2oIAr241dk+r+HjH8
	pYSVhqVvVceQBAvV/1JnZMt+7ZX+SW6ln22SZxujNJjlt5Y8LpxtpsdNi6Z0Y4LX
	e7LtGWdefxjvNlTe/nTalTrk+DNwUoLS/FBrY0ctyvAr1GavkTR0dlv2smBoDZNc
	Sjsrg8vdDTySWtrpVSdsE1lsrbSdbUhYSAsKZnpm87pYeF7RRXq8V4W7mcVmswWg
	vOZCgc7FkM5r49nenaP1jiHlQt+QnFegtBcvi9X/rwKRbsU0OxxQ3nriQNwEnokf
	IATJKraV36gYyPOhwkkJDw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6s58eh79-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 15:19:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQBhxDMFnIzYbnqnmMadgYydI4rVdmbnLd6fsN8rpUdDIb3hFPxNhaKCzXki08IV7BTzvdPmkZI62PZiFc1Y1FPpAB5VhYZq1jKSFYsK7iT3pccxxHuHMPc4ISuxgAg2MiKx4HWZPRJ7CdJQjeOY1i6qiHJE24OPxn7KDEyosTm4Z7npSXWjg7wdKZJZOJLAHK88VobJAagG0NOFuYtQxim6+182hZi5mAt9pD0QpqYCceMHtsGqz8Z78m/2W117yku/uCdVf9WBwMr5HuimReNx47g9RNax3rr8mFiV4DpwvsR8qPKV2AyqOwqw+TfgnDenDFdHJ8uEFbTaHe+Bsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/tzWG2nGYMOHsutqqeIh/cLpYBFORS0e0OgEd9JmVs=;
 b=QXHKF0leur0mNq/kGKDWbjXkLY9KVQmHZOvHPbuUk1G79YRE2SevmQDP+eqAzTqZuQxMJNNQL5uxttrcOaghC+p2iIui9WJwBK4Y7GUXJE1kDC2p1MAzV9usbSveh6eDxW5994BstNHqcbVTPeg/LBRTGTkD+W1ybh20vy0MFnDiYa4c358zgAz3NJX/3BEB9HssgGwLNOTMm65io1F/c+pXnSKBQbGIKV0wQDbM4autd1hck18dpL/UDlBPa63p6aQscYDc0hT/pA/JQ/e/Q7jjFtM4qQ/8CRHt4jGIBb/dknbiG+4UOmurno0k6WwSYk46ksldDWfOpd5SOVwqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LVUPR11MB9810.namprd11.prod.outlook.com (2603:10b6:408:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 15:19:12 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 15:19:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH v3 4/4] kernel-yocto: Set CLANG_FLAGS for kernel config checks when using clang
Date: Wed,  8 Jul 2026 08:18:16 -0700
Message-ID: <20260708151816.2115030-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260708151816.2115030-1-Harish.Sadineni@windriver.com>
References: <20260708151816.2115030-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LVUPR11MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: f0929fb0-221f-4832-d0b0-08dedd0443a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|38350700014|11063799006|56012099006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	ByCnF8ZzD+gfRekWvTuZN9gSxGhZ6SM60WhkAYk9749mnyVZ5O7Gd8L5UTpyiW4f9mKQgn3+FWe5mdCry5XYlfpdr9T2k3MuGs2OuCZ4UH9oFrx0JnBr0OBsVrnzuoeZVEK7FO3ec5HQQeVD4Co5NCNRhoDSSHmLWNQNrK8yzaN7IP7jkYxTVUOyd3Hc2VAgSSZTlltwYzmRRbFMKxyE1H88FMK8N4HIjcKApKATpy6Vd31kMFE30BOk3jGUuqBT400Lz74cO5YSfYdYnz5b/41rVXVtfM7v4VhdG4addaW79Os1GcrX4X9zKsbkj69EIz57EOkAfDmFWDEj+JZ4nbm9C8/Lbfz5gHcD6MMnLdkENizj7SmBqd+2pcef4FoLzDUN3AD4bNl2MmreKjmEvVkugk9Iuz2DLS0SNhe9KFJVfLK7fOnCl7UXg0tRG+qXfd5ElojQuC/jIJAdAiqZ0id1WMpAJT9/wEVJXICXWxsxs2uNx+dSazHi6Wju7zLKfSv/Lc2uYXh46w4YDL/q2lMFsHFd4OZ4UX7RVKeoYbSOX2uw2mePJ3jSx+WOSifzRtoutbhuIKTyN/95yWHVlCrXR0eWPG1wv84YdAnoUwikSVRo4jkPwVVB7M7PyG/UvZC3j55f8berZN2O+YUJjqcc+2FOWVahPmgJ2iNPDVKOBLD9n5hrWTmbjAOzFbYEnlEy58xJI181VDAJk1ayKAXl9yNuA8+mOZ2sIklomps=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(38350700014)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+5xQYYyGTxz+RQWgCeelP80RyNyzt/03VInzBzr8/LT2SjrBXlgXlA1QbA+o?=
 =?us-ascii?Q?8BvTDmeUQO+vlEepfuAtbvwOiwbPcPBPPdt5vMLFV5D783jTMUVvQkiD4TWJ?=
 =?us-ascii?Q?ejaBYkuTynbF2cu3Gdck8pfXnqkIp9CtkckDnDN+JiJOUAx9SIVCohJJG1vK?=
 =?us-ascii?Q?LzHl/rJv0KLBYX5RcKqm5SmNe8b3itJ1PbPWK0Bn2X1lehb0g3ukXUpNV4Ks?=
 =?us-ascii?Q?0xkM3LL5He2WZ551/IvxJpaaLsybpnqkB9aSb7HYBm9Fhetcj3a5IJmi36cl?=
 =?us-ascii?Q?WmwSw0WcTjUdotaDVTtvhjmmgfdeGVHPspqZMuCfkBJq41eZTcK21QPofcPV?=
 =?us-ascii?Q?BnCZGfUAk1wB9bhS8sn8G9VMaN/uoCVWzsv+aHGjyQt7q8b0u7kv8p1PiTGH?=
 =?us-ascii?Q?z/VMz9DFfLOJAxbUo5FLIyuNgKQaFVebP5ZHK8g6cTT+/VsFaghdkea3K8pG?=
 =?us-ascii?Q?TcAAR3f6dd6jphsYxTmNw27G0SxToda7bGSGcMMdr2fFfJKm1EhOTdmg+nLg?=
 =?us-ascii?Q?y4tUoORlP/iEZrkm9vZHPaXn6Y2pg6FR61Nx1HnrBb7rPxgmICnDmA85I/2z?=
 =?us-ascii?Q?3vu0J6HGxFEpS+oP7mXs+m4DJMxN51wx6ln1o1rZF2UaTVLwbde4j8Qz6dhg?=
 =?us-ascii?Q?GgYrCwy/kJA/UPSntKS6MUGGyWrlIV/RD8+n21kC3OvTI2Th7j8nMprORk7K?=
 =?us-ascii?Q?QAnoBa3QmuPbyHf2sQkg/gV8/UBLZfUvpMaZHkKkyRvfvhGyse06Wv0w7HrT?=
 =?us-ascii?Q?2vzVVAniYQS3OvUwHaAD6imBo+KTOJ5Ca2l5xTMifj/pGwG+blUwpgSUvasi?=
 =?us-ascii?Q?dMAXEBSZu+NlmKkLEc/3QY3mw5tjlVcTJfnmc5cVhgKM17oaABamLDHRK8z6?=
 =?us-ascii?Q?1lwcKZdPK1+I6znCoNceEa7pBSJxy6D7ngGzspNdrL4OpTjDusFRqM1ua06w?=
 =?us-ascii?Q?Nn8QQT1xj+fR8A/ARZa5IdcaIhN39OpqTBsV5mON/6CNrCSzY3yqwBdaVled?=
 =?us-ascii?Q?XFJwLUJ4mbPw5byiyr/HWBYwLPQ+qo6/Hun5F8AHBt/bgRQzrdgu3G75ssKy?=
 =?us-ascii?Q?V4CB5yt/R2ENp+8zUPAQJ3dTa8HZeNR42/37YKXnNYokL0+TO9q88VJil2zW?=
 =?us-ascii?Q?raSmbAvb3m8uIm+xBEwzfxM7N9HQGjsyDdcP4ZlcSPfxx7ej8bT8Sd5Ja/oe?=
 =?us-ascii?Q?gxeS+AB1mWb0xf8T912Nh1m5o+Yi6AR+YYTlEqeDPDZXqt4ExZVN314dNUAt?=
 =?us-ascii?Q?K0cb4119evF9uLFwBBAmBgw873bOJDOmnFTeZENI1RBKbjpVbQSt8ncXfBub?=
 =?us-ascii?Q?6lxFdHhAVP/f6J3WXMuE53hDZq2ZqcEIFSTxzwdaCAxVHfC497kw1fRoVmpU?=
 =?us-ascii?Q?oHsecxRCpQ/A5KODYBIvs9yCH77kXTl6LLSYslcBCjAwOX/hY9BJmgsDhQaA?=
 =?us-ascii?Q?8fQX+ewldRwpC3x2XJ8iREWWEFLWVSQGz+wtgtRXEyCxmEFwM27kZ6HRquFc?=
 =?us-ascii?Q?Xz+1H+nJM32o/7hcxyu+cP8FjcR+zxrdBCtOG76LwfJHyAIxRhIMeY2MIA6r?=
 =?us-ascii?Q?oY77dMep9Q1JULVCbYyLm7cK3h2rTDyfoS9yQvm8nC2nKnIkwjUoLALlBqYT?=
 =?us-ascii?Q?L/9jdy+jQEAyiHl8JJEBiTdou1+7c3Oze5hYSb2q0u9u7tUvDrrQrICzl1aK?=
 =?us-ascii?Q?jaZ/r05d0pKOOKfhkF1X3UtEhKvOG9N7JLd9yrjF+jFRpbIf9wHzOdy/9dib?=
 =?us-ascii?Q?jnGYR02JwGMFTBjmKTDdNzea4Maqc8E=3D?=
X-Exchange-RoutingPolicyChecked: 
	RJhALDlwwwjK0IlrVtSupPUv/UL5PJBzQhuu1d+xS5sOSPgbeAdTGStD7t2okRQXBlBgSPy5tNrDLJfwQw0Ik9Qng1VSDNmWX9ZTQLYgEUoCZ6Sup4EK/aqs1ZujZ4W5jGEh2JsPiJ1ud8BS37JeaKlmqlxs3SgXkCr9FSMF8MNu4zU/lJH7LBEdYPucQCPVmQ0zg3oePqkDKOoldz93zQBYwbdW0x5IgLUOlLyFAvH2pVtuyKgH8FxDKO68/8edTprrIJflezyPR+M33iPiSN8MeU7b8jh5sDZoJBwDN5ivA21R/UBTwD2zTA76ZoXyH0741fTPkedXUqT1WcBcYA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0929fb0-221f-4832-d0b0-08dedd0443a2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:19:11.8459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3jJkN1N8R4ldqknDSSBc1y2RUZ4bQ8lG3DPdksHvzGooWnI8puMFQh3RipVUKv9geWf9kFSEQN0GexhE1F7MuY8ob0QnHI6iPe5aDnYM8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9810
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXwVf6yb+XMJo1
 X8n5l9D1HhZgiw6gRSSSZOxPNm3YOMDZQ4MA9Biga+meYAdbuSgcvTastOsjCKJ7D9YJL0FgPGM
 w/n/oxxmDzW+oy3DLMEigT5X9UB4AanBAx6KjyeztwsCuLuqHfyY
X-Proofpoint-ORIG-GUID: XyIkgvm30Ippjj0H9albc_r3DvhDgtDb
X-Proofpoint-GUID: vAISqg_Oy12PC0L0d7OEQCgYSXUser0w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXw3Z4nH/dTVGE
 DRgqRNAzWHQt/jHquGwSFolU4jZw+vvlzwkk8/XDB2DfyhAKTCj8M+LdRG8MqdoeHZm4qbZcwcE
 crLCJVNqA+gSO668nkkqKyLI/xXvwpYypV1MKR0GTKzFz6rTLuaWJ1Kh4QjoP4Ma4P4h7NW+iFZ
 zBUID0cPY2/Ur9A+GxIc+BRy5HAT8aECIO17+VdnsPMuBacQcxZCQT0iwRAIMBvZJz0IAYYfNsa
 /YA8/vmkSxEgHWHZSmE7TPNLcY6u9L3jVwk1DzriQJCFe81devtzo3VDeqy5m5ADmlSZx7TXxTD
 qU+OxF7+HaG53Ps92Eyx5jzwe/QstGITXIRyZlWBywL/Nw+Tu8Q4RZVvIBly9GY3t4Zh9nn9/hk
 Gp8S8Dv2qyaSDwgUsraNvpEHX0+a0uBg+eVjxhL92Xto+cD0S5S6OWl9ddKcyJxpkUZy7Ds/kut
 ND35JVdfhSmF+DAbf9w==
X-Authority-Analysis: v=2.4 cv=H5frBeYi c=1 sm=1 tr=0 ts=6a4e6a72 cx=c_pps
 a=WaebrhBVOVZn7IYqRlctMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=aOuplgckfP-gDmdpiNwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 15:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240495

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When building with `TOOLCHAIN = "clang"`, the kernel's configuration
check (do_kernel_configcheck) fails with:

  kconfiglib.KconfigError: scripts/Kconfig.include:51: Sorry, this
  assembler is not supported.

Fix by setting `CLANG_FLAGS = "-fintegrated-as"` in the environment
when `TOOLCHAIN` contains "clang". This variable is used by the kernel
build system (via scripts/Kconfig.include) to pass additional flags to
clang during config checks, ensuring the assembler test passes.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-arch.bbclass  | 2 ++
 meta/classes-recipe/kernel-yocto.bbclass | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 6ebc0f13ea..c0ff60c0de 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -93,3 +93,5 @@ KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP:toolchain-clang = "llvm-strip"
 TOOLCHAIN = "gcc"
+TOOLCHAIN:riscv64 = "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang', 'gcc', d)}"
+
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e7fdeb5d4b..78a4a7ade7 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -603,6 +603,9 @@ python do_kernel_configcheck() {
     env['STRIP'] = d.getVar('KERNEL_STRIP')
     env['ARCH'] = d.getVar('ARCH')
     env['srctree'] = s
+    toolchain = d.getVar('TOOLCHAIN') or ''
+    if 'clang' in toolchain:
+        env['CLANG_FLAGS'] = " -fintegrated-as"
 
     try:
         configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
-- 
2.49.0


