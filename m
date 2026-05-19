Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0328FCD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 15:26:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1329.1779204362875527790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 08:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KVVchC/J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9599896a81=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEc0VZ4108460
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 15:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=w/G40XMUb
	YHOvraGiylshxUFbNmRotWGEwQyCrMiiG0=; b=KVVchC/Jir9k1E7FozKey9pK+
	CIsXr3Xx/fxqIq3SndTktspoUnVql+k1vh9c8wyeAqwGL7ftgfBSHY3mD5iyISok
	9OV6J6QWEAW7ceLeDjufBYuWOM4ZR1ujww9+oybq4hR7OlWiPkCma6j846t54zvw
	zmPhdu9NX5fBgFz6+//dmeqjdZ9eGhjvYiY2cN+nj1EhopY2VfZPNGbH9wUnA70p
	Juvzs4ditHmO1e3b8bB8M/hjaBULJ7DgdJX1qz0xle5IKKJiAU6nxPUAeFv5CUg2
	rlsXQNMYcLoJ7TbsaEGSoBMrtiJt14e5lOyHmga7lEoVi9bghcDOh7z7s45uw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf3uwv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 15:26:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3AZs2uqBRw2gcAwqdjClHFHCTsTMVrOsKQ57lfh7zUD0Nq2kGzJVqcIzbE8j3n/4qIM0I13jLpfXWaJJIvw4PonwL+PrTVIVGPMj3+y3vX9RSUKNq9rkfOP5/L8JoOk0cg/sQTB4GL2ALbsJVx1S1uik0Hs4a33UjkKpfS9NeVRgBMHZI3qE2drKBOFDwcV5kvIxjbSKhrE/Sw8KWzuPpTIiujeUERVjHfmjb4VoY9cRalrqfiBvuI9rFTcEO+iGuh1/C8em1SWTDUHKUPMq/QF+QZFOEgqeMV82Gb9y9i675+ivWgdlhiGpXB1o5IryIBGTVKPovbNmXL7OyVp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/G40XMUbYHOvraGiylshxUFbNmRotWGEwQyCrMiiG0=;
 b=YEU5vaDeOCpWjzSFqYbIkKvxnjnj4BKyhTf0R2e9kCJCH3fHNQiXPNDwy01LYc5mpwn6uqq1r5QzetcKHw2rm4gA4Oc+1MLb37jVWdFfrYpHbswuCpzT0V4KbNc6hUnKf8sfgkew2DpSCUdoyTodG3jrKxUjv/BCy5GTc7wKy3HFjPkGotNqyq0isM/Cb4eKTL54x/nkn+qMSZyM/t3qoKK2bRP3Eb4G9kNBacPJVhbMXBdTw0bcuYOQ5uddyX0HzmbXdgrw61NvcxbAr9xg1vtXtS8rigGZFUwAwpboDR3BULAy5KXfwqKz/1DPFfmp8s6BqNZLmRoWYbhxlNnWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 15:25:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 15:25:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2] perf: disable BUILD_BPF_SKEL when rust in kernel feature is enabled
Date: Tue, 19 May 2026 08:25:12 -0700
Message-ID: <20260519152512.662193-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:23a::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 2288c419-4b80-4332-fc84-08deb5baece0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|56012099003|18002099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	39qxRfAjOXqd+/U13LnpaXr+qou0N++o9KB4YVLphvpS3WfW+YiC6AwyguMPntXKcPRrQfu2aWExqxrv2lUKksNi0p/JInexZu5ri5rIOk2qchwN2sYFVKpqryrIYqjfPKuBLJ6qWkoGwZjBqb1yiyl2GqsyjInkar6/lZDKeTUMgJXR1xS2zRxVAaJKVEc1uBaB7vm89xRNAGRfMsgkm0wh564U5M/X9ukZbphEVljm+dvuQQQSKNXUpWoBxtkQgSYJMAaFb4Dh+qpGzOfk/GA3law9OwMwa/l39c4gU3PhJ5Z+9kyCiq5FqZv5KO9GMMjkJ+i/7VcNbJwr0qppNKOVF4oWFTu3Zbr1DUyEFE/MdxcxTMRhfNSHU7mSXXucJJRIQcq6ygNiwAVWhWpYaTc6brC5R1BNRbX6sJ0K/wQgOxv7tQnA64VY+1jBsaj6ZREz1XIhfNJxavdthWkL4WVWzKay+cZF8U8GR6KBfnm//D/1cxpnYW+5rPOoobnnvYDOh5KA2LtXqBQOz29MvFYSBEZpDWExGKip+YfogbSXKf/qXgVgSlcu0F50mVE8kRwlykDMiuNPfNqZkSQnLQSIA82vxU4XNYqsWVUXTqLd3GSkhXwwHN12IqmPhcSYtz11xZ2Pg3Aeh7GuXjw/2dOFqZ38BqpRXqNng8TIRJLRlqU7HmPXDVHrWQT1LvH6QUQq0Fz06temHKXzfJH+mX/SYJTynfYu/rSeciIHsi2WHkg3ZH01QrXpVjbF0Ip1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(56012099003)(18002099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m3Kb+Hj8j0yA0YhAldzAmkLLVhqFAZplqkko+vGXZ7p/GPg4cS7kwqzJsfX3?=
 =?us-ascii?Q?/ZGL/cFHYHGSUurLRkLR+WyZ4ATj2CMEZYc96/H4R5f+rvsVB4iXFlRkvY3o?=
 =?us-ascii?Q?6OCoADkiv5QsIh3vk8LinC2tBcYtDz0Sfbl9OKzhswJpujIyiUW+NBNH0ul9?=
 =?us-ascii?Q?xi9I8O7L40I7qZHTMhNe3kcLAScUj0WyhNU6tgGax9Sx2ReLoYWPK1xGpmkH?=
 =?us-ascii?Q?PksEnegPb1Z7Mc3ePPwIPpUiSzJtns7IS4ixAJjSKB/9EL/ArKLr4cjzMhWP?=
 =?us-ascii?Q?xtoFHyrEjamJNfjwf7On88LXnEphL0H5pTBoRrk4Mi6fESkybv/OYYZXMn2o?=
 =?us-ascii?Q?NUVKCtmSccZEl9gfKJGIeu1DAw/e7djpZBD+BoaEF9SyTCniZX+6/ravh8WR?=
 =?us-ascii?Q?Teez7RY6cOc2wJId+bBOMEdRWACoaHW/bbKGY6f8vE9Xa8DlcBS+B9A7nF0O?=
 =?us-ascii?Q?5PkR1Xy45PmDY9Qv+/GlNSwMUGq5qO9XQk9WRjZRT54QN5kwYjAoH9PXq2d8?=
 =?us-ascii?Q?zBC668uSJHR681x7L2jSPXD3ALcEh/THZ97EEEfFeQPhhZJTcczLVCyXecmd?=
 =?us-ascii?Q?Qnhnhxm/uQIrb4SDSGI4KwfqKfnrgwZSvsYVzrmv68pThv7ygkdjv2uJ+e+L?=
 =?us-ascii?Q?iYy3kPe/Rz2rpkFytJGlo/qm7i6oL09jcnwYMhDKhyJGiJo3XZtAZNFLeWsm?=
 =?us-ascii?Q?4Z7rC32TChlpjP9SmDSXX9v6zYmg/RYp24Wcm6yM8mIhjo2DPN7oUpn71341?=
 =?us-ascii?Q?UFc4U2HmYboWtQRkXNs0ln79NmDycYHtZlVLfcyf85Auk5pSKvEssdKunw1v?=
 =?us-ascii?Q?7C52/hiz1R4tLmb4uNAYOMshB1gbmwhhPBjXzmCNdS1tiwAWqieYNQ0pGxq7?=
 =?us-ascii?Q?DbIzpYhGC4IbVJ/lRPo7hvgeKmA62P16IhVkNFjQZeWvYoZ1LwFmRzRzFOTS?=
 =?us-ascii?Q?LOc6ay9nYiMhVIKfKNdmXZTZG/lkvLH1m9RyENUyKAHv8ejG3fEbXEBgG/B6?=
 =?us-ascii?Q?yhDm6sC1NcZm1xxXcb+XvmhdNOjTR4/iHLR8Rqh3fms2NQPLyMspQ+L+WSv+?=
 =?us-ascii?Q?nOToxr9BVm4FQ3ykBOVsN5I3/m9+P4cCyL2CuwdupnIcwSkSLKeqXtUFtPIb?=
 =?us-ascii?Q?k8KyWUKRV0pCifWnIl1BI6pSTYNBPbfOZZVVfwOFdEMicNKRYGJoGYoUTi5L?=
 =?us-ascii?Q?9Jc9T4Ljq8L1G0idZx5WVDEuHHpkjSzlr/JWV+IywIDINTgFo0X0iDG9Kdln?=
 =?us-ascii?Q?IAZ2vq9CTcz23wbA6UiX0vzjAAnnOjW8MZR9bAbbDXsm2vw4XtyfAlfQ0fHH?=
 =?us-ascii?Q?bdwvxX4RFC3hhK14mNdRZraO74UBAME2KMYqhGCiAszcRPprD1F6Yc3uFK6Y?=
 =?us-ascii?Q?hZo3wPXdDM4JoyzYgX1z7n75qqt7S/Q2vV/Hekq/Ej5Ua0UO/4KoEDFDLrop?=
 =?us-ascii?Q?34AxKcuBjul2Mo2zCBPeOBOXzOOCLKkjtWrmivqiTbDzdnNLF+OQEnZ14cf6?=
 =?us-ascii?Q?3Nm3vFZBDjeypzWzy8Nyj1IZk2ksjWmWHn0mCbWfKPMXCQ3pDpwe0mX8wO4Z?=
 =?us-ascii?Q?KTydXrUBRlyU2W4/9VN8rPGbfPuAKTXsoBAi9C4wVDR5SStaL/rZWE/W69U4?=
 =?us-ascii?Q?5xn+vnFa8B8Q6CmP+S17BcV1VT0FOo/V7wZngQt8pVgf5NdvKEbYSG3NsLn3?=
 =?us-ascii?Q?3GnEmZRDoq0TM7tUSlpCBmZs3Yf5wHa+LOiyYlMP+/dMcIp6YZDh7kufRrsG?=
 =?us-ascii?Q?NEUfZV+2fmf/c4UJK3u90SOcuU0RfbM=3D?=
X-Exchange-RoutingPolicyChecked: 
	JxTJOijS7uF3PMa4lcqk2WY635AYHPDbnr+sAgh/xzm2J51DgaBnf23gTMV3xYrmGnv+dl64Qb9lA8sc5V8tb3VjnnB6t5uhZ0/PHhA1SpXaLcT11W15A38YQ7Gji46Ra5nnoFWTTPv22+68r9E7fDjBgJEfpr7b3Wlea1gOaa8WRmkRr5TSIF0SaUSQFOBnKsx1CKAXDSDTYLvBlVybm8QW5r/f+EePPnoCjzR9fPLcejSaLVniGblXKVdX5Qu1P2RBY7dbVUMresi/0MF+UthE+mZ5uSDzwhQOGA9GDASNqEplzLWVOVG78w216QXb0fRaAl19gqpBB6KclT+rGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2288c419-4b80-4332-fc84-08deb5baece0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 15:25:57.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNkaw8chsXlSgRN+y3VWhoSpcCoEtJLpesBxi6r0/AYMTXvt7UBzxYCFo/Xf1IYVLDtHEQHdDKK1+ZBO3hwgKuLy4Tgh8k3IHNoCmGmBItA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
X-Proofpoint-ORIG-GUID: baLz9_jmZ4P2OQjkj0RokAadxRpORplP
X-Proofpoint-GUID: baLz9_jmZ4P2OQjkj0RokAadxRpORplP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE1MyBTYWx0ZWRfX0U4TAm2urLzX
 TAaPi8eTaNoiogPNo3S+5N8tkUHcFydMHoqjGb0yqD49dwcXZmtAbcdvCBZAJP3e7IAn9qlWb/9
 F2YGRlijnDgMmAOPch8crrEh2313EW175wafsqT4vsy3W3wVlPorn2MtTVMwhChPVNLi60vVwsb
 8uq9J0WNF++O16EL0LI/0Do+YB1s1dBIZH8NlXBIpl1FGVt+x+YIkGwBmmmWFf2gaaJFELluyMB
 eVtE+OJLhXxpVr8IKOm5Z1xiZeAHTcgLvOMSc0BhMvHWOK3tO0NRHRy1QE7oEp8DPRRZ6itgY7G
 WpqkrJGcpqz7DD2t49HtXczZLLIEABHFFr90/NUYaqlBzPbO6Zq1w2kcmV9wR45uAkbRfqHcQw2
 tXlUUYn1RtYPoLrWm0qVLLRFWCkdTHvvc6uUPmkb6GR088gsFhAfZzpAEd8X9f6vr2QmsR1m0Ch
 v9C8pFgb2Y7HluH01dA==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0c8109 cx=c_pps
 a=5dagRegx5OoopB5Oy6OMtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=0mx_9Wd9amnvr-jIZOQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 15:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237333

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Enabling the Rust in-kernel feature pulls in clang-native as a
dependency for the kernel build. During the perf build, the presence of clang
causes all BUILD_BPF_SKEL dependency checks to succeed, which makes perf attempt
to build bpftool as part of its build process and make build to fail.

Previously, When Rust support was not enabled, BUILD_BPF_SKEL is set 0 due to missing
clang dependency.

Error:
| make[3]: *** ../bpf/bpftool: No such file or directory.  Stop.

As a workaround currently disabling BUILD_BPF_SKEL to make perf to build.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c3ef25fd99..6e4d395828 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -438,3 +438,9 @@ perf_fix_sources () {
 		fi
 	done
 }
+
+# Disable BUILD_BPF_SKEL when the Rust kernel feature is enabled.
+# Rust in kernel support pulls in clang-native, which satisfies the
+# BUILD_BPF_SKEL dependency checks and causes perf to attempt
+# building bpftool, resulting in a build failure.
+EXTRA_OEMAKE += "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'BUILD_BPF_SKEL=0', '', d)}"
-- 
2.49.0


