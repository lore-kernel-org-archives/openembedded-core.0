Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41E6C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:29:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148040.1783337366372534261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qE6MfvHd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=164719aade=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666B2EHt3158164
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 04:29:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=IuhS40CKcELOH/wWWrTE+HaSVAOi7anIOgm1Vo+aCdU=; b=
	qE6MfvHdpww+SLNuQA10OfbkwiJuRPGZMK3xkqrUCpINe/VkdPWDEDzZ+R6cHXag
	9H6pfDudygscj0HvEs74FVajUy/ZcfpRmDsxD8BVV6krhHtHVVYwRUIDQt6q7XVy
	4YzfdI/XN+lpo/oIqdNlFfv2RHkW6kPLWX0pekbrh6GBST73EEul0vyzPZ9P1K4k
	5XZpendnJ1yixFTbUD0LgTkOD+jbdKpXxRLyoDeAUPV2dpuw7hg2aVCK8KFQO5Ws
	QyGlexZ5djU921yf0qP5wnTZ9lkZoFw9saC7Enh7bTOrNNE0LnUukV7mJVzoj/aM
	KioSDGciuoFSFb2i0zGdyg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f71pe1tg4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eU7a8R+ESvahHLOanCzW2x/3stlf1q2m+1wPybuI47cnBurB+r3+xb4oeJcWD6TuGTfgAb27RTew3gyeyf+wjDIG/D7t5rV9pq8zIq5RY7e0WVC6w39dcYCRu7A68xVwHinsXRz+aTdunv1sZlDsYho+PJkZngTqNBEU+cSKV6DcupSkfVy8Qp1NX41P+0vv65dUbgDq2ID2uKGYTe9HnhLu/30YGJwQWn4qNtgwvUmoV5irxmGu8IFGqe7Xn6WQB3vpgNgxa/f0df3o5gmQOdPJITPWIJcazNI/oDCYLF4jKebcx91SZozpCyfWoujEnr4UyimeH+9TfDanWAGacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuhS40CKcELOH/wWWrTE+HaSVAOi7anIOgm1Vo+aCdU=;
 b=VyGV5wzbSRxbEjGie0FjOfzg1rhGsdsphOFubN1yzk0XQaOwHQEIfkFcgn9OZst5g2ACOLAWW0vcI4+tcQGgnYSVkDOQRoSIMNf3m6ODsghWRA+E8lyko4JO23LmoNyubAYGyTctTmnc5imMrIzbE/NCe7nC+U+LE71Nz3rNpZy5hubnEJQZlPg5+Gllq4w97XLHGGhjKFCr5FDE+fO+EkogoPM0L1xHQpg8dzdinoCMCoi58IAmOWoD41R76TjynR107VBjFSDSbPsLBnhOowPKQyL7xoSoDGbXKo2ta+uy93zneBd91O30Zst7LayqMQQkG+iL5QeEsem93ilfTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM3PPF67FA1A8F8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 11:29:24 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 11:29:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH 3/4] kernel-yocto-rust: Add lld-native to DEPENDS
Date: Mon,  6 Jul 2026 04:29:04 -0700
Message-ID: <20260706112905.41381-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260706112905.41381-1-Harish.Sadineni@windriver.com>
References: <20260706112905.41381-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM3PPF67FA1A8F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad4591d-c65a-48c9-1117-08dedb51d487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|56012099006|11063799006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	YoDok/qwpSJE1kuMArC5vCzxEEqELqx6NkmKlbisztxWMuldKAalDYBWdjllJAE3SAS4jM1+KJXE8uBpKJhxnRxFCoHOJS450EmZPML50ZPhQLCfQAdTnb4pH5QoLLJLi0Hahn0bzwEd1xTvfr79e8DZKh1qTRsL0zvMTzagxIB9FoYdgjEu6UWyFDO96ns3dcOGKIyqsIbOQK0E6ugP8tILVr7Dkwbn6yj04NS3ZKaE7kBRwsiHJTcZo/pZB8qgIsxY79brJDoa0L5fBUtWtLcoY/5G8i09temBb2OsIrmhOpNtHA6P0MDd0Mike/xtGNLC+L4eQjz9Ipr19+rN9MZkutWSsjs3BvSa4CKbLN1gncV6mwfiQq3lbYn5KP/qVNopQNJi0N9HXioeYeKZD2ExbTPyEu1fh8UrXVMV4NW3yn9+yxdxvn4a0e0yvPFKNID8ATlaJasyr3cLpHOX6+y4aBpfamUDd21WmS0CMm/o+Ow9tswiZgkLF+qeSEWBZ527tQmd6yQTZzvTUo+pTmvYo64T2NSgjJeU4lcl69xObuw9RR9ALMv983akKkEfqr7tIMkPRk+x6rxRyQkOEu6iithIuDzxKaZ9M6DCDxpUyCDo+hJwKUbgCrTaVBBl70n2BVVA2ZsO40E+vd4cLaaU8aoDbk4iObzjSLEw+KTjW62YKiutl9uBO0ht7LG/E/ovsFNXgDA+RkAMJfIS3z9kUs9zSv/dgu6FZN26raQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ijlxGTpvomocc/hN4MVwaFiBmxFl9XrQAk2ZJVwavngq4P+6hA8jgyXImWkn?=
 =?us-ascii?Q?fGDnSM2dOoiIU9NU8qbaqmkiJiNWvsYWEvVf5ECCBD6FCTfxGesgYnNr6rVR?=
 =?us-ascii?Q?IcXI7gCIJfvZ6a+ZjvVLfkePmRitW6zX5DQdJNmJet55I/9FrTF8WLpzj4L2?=
 =?us-ascii?Q?jLOosqu7GAJiBba7VqzrWGXiPXGDZiFUaWlF6Gp6laWo7xJX0qFiadTTGZp0?=
 =?us-ascii?Q?AkwksGdEA3S+5mkqAp3LZ4MdVkod+UwXKjWmFsg/Nc66LdS7Fj0zLJ1HYamX?=
 =?us-ascii?Q?KgDkdRSGRX57RU5HFjDmnNGd30r4T2bfDfCnC/j2gACnf1bYiA7T90KOKe8V?=
 =?us-ascii?Q?TIU+PLpxZVLKTcj7X1VcjzufVIJSZeQ6bK7FB/rp0IHiZM2Bp0XZcQqzNYEC?=
 =?us-ascii?Q?86T2i2Tzy+5FS7u++euljwVuKfXUQZPUDNlZtzNI6MrrJcZKLJpu/p9t6eBt?=
 =?us-ascii?Q?4Le+2CMFInhe08GWr9ZWuYL1E1LXSmxDHHXtMLofirVZ69VPSB6cDuwpsxIZ?=
 =?us-ascii?Q?gu5OwhBs4gRBmx9L3tMk1w1vhKqq010pstA+I8gZxHuyuIUGChvXtOyF0OgE?=
 =?us-ascii?Q?0ook1faggscQ3tsqFzSCDQX9wDUb4mwY7vLNWMj6kZgzugk0bvtZaoIo14RK?=
 =?us-ascii?Q?dqtcG+aH1HlZB9fmovXU6g7/NR+KEF29QDmC/cXHcvuVOJL7U/SX0QvqyXAZ?=
 =?us-ascii?Q?zht0OJRcdyxYBNuAejrrLYjw/D3unbhMvjNrXt8s7rNBOU6/crkMOcUz0Xce?=
 =?us-ascii?Q?zVvEHsH0B1bxmo4sSVpGzvdSZVcZLeCwmNDCE06xnDVGbFTzArvcwY4MW3Kv?=
 =?us-ascii?Q?djXgDvgIUm5ydaTavaLecZpdo9Q5wuC26c1yumkhp+EymyCWw8yrDBHgZ10K?=
 =?us-ascii?Q?meTzV1h0bZnPynV0HahNllvvEGypiLCNEmL1ST21o3z8p34uZycGr1wZ5cU7?=
 =?us-ascii?Q?jNpg6jqi+X8zZwPj9Xw2VZLIYob6G1SBJ3THhlFqBOIOAU5d2ENfIYLNA04k?=
 =?us-ascii?Q?Cuex7YG5L+SVnj3RQK4VeZjcME8MTdoYa5QGbJZqRVsi2Qws9FLAaGSz/Lrt?=
 =?us-ascii?Q?V9/Hr2DHe0w919iKvGBkCWMYBek4CtJ9LCfazH90HdFr1AMx5BdudJyRSqaz?=
 =?us-ascii?Q?0k91JsAJdumS8ZKkGgvxeR6L5/uqgJUEZaNvdNYiwTXc/Fdr94G9UX+2X0SO?=
 =?us-ascii?Q?VBmGF19phNg8senUGmMhJkTL2YfoCg6v2d3CQ4rIa1E/3PQGshos+prJB516?=
 =?us-ascii?Q?582jsaQ3cYhsohwcTCnjew81+WCPVma0Yne7M73adOWvowkKYZa3PrmC3ErT?=
 =?us-ascii?Q?E1RDIFvpjZNKzoU3niT4BQaUmHRQwyzNOLD66p8s8+w5X/kdaUAm9wYrzD2e?=
 =?us-ascii?Q?QUBhZPOvLXEjqNzJ0Dsvw0+p3SWNLgw+IlrTSXB0fJweDaCXnHPwwNAOrzmu?=
 =?us-ascii?Q?DiDTlLXhMdmiYOhGe9CBicQz6ERAPr023oY1hOjB+I5TDikusb4Du8keMh4t?=
 =?us-ascii?Q?86xqupGO2FsHqf4LMTLkx65AvaEHexpBn59YVaBt2wnsAErzM0KSQSUBvS6T?=
 =?us-ascii?Q?KIvXd1o4swGgpUjbGR4qH80D+gQpSlDAA3LBdfUUfE0hk2+FqY9bHIrxiRR6?=
 =?us-ascii?Q?AeRvjqaBIAySVPUaM5duAIXzZmL85jsnQgaHKm9bZZEnR0ByMeDKXNlXUeRT?=
 =?us-ascii?Q?Y7H5jfra6N/y/Y7uiIB1MXAVMDs3lYmBE4AQFPMSMQva/3and9Gi46at5v+P?=
 =?us-ascii?Q?ahlZa8RH9k6x4TnufKqplvRdDBflUn4=3D?=
X-Exchange-RoutingPolicyChecked: 
	X5eoOc4F2mFI5RyH7lVItE34cKrH91bDWKhpUJZ04Zt+ZvsZ1iijgJvyTM4iaJEmApbhdJLIbwuL+O6dB0BgPGQmxnGIOyqtgYtGdxSLp0btvpoGPuVI2anre8dPIr3O5IWtzEe4QRdP3Wldem95pVp1AeGs+KrFLgXxCGGJOhkBfxpHaEsTjTvg4tmyjVVpTaQTVS3uhMRwo/2thTYA6FUVg17DQNMPfJNN66Q2+nAIvNwi03CPs3BIN8wwVvw4MYl4kMHeK3FFmxPdMDySr6NSTo6cByzmGguQ6HkaxtGJoeUw0qCdzU4G5ZHTmWhp7Z7uhD72HcQzowR/dbpD/g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad4591d-c65a-48c9-1117-08dedb51d487
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 11:29:23.8889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXn3tOgtk2ukOKthVK/xgvYOKPHAocR52DceoWa3whZ0VdsaOVolY0OdAzSO8TNwm3qoKtxJwtEHBr3ainOBEcaNj2enLqbO4Y7nECwkf64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF67FA1A8F8
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: GYVklc0CSCy8oOeu3yBONBqzcjyZlSlE
X-Proofpoint-ORIG-GUID: GhkCEMQQIed4xbLyrI89FGWR3TWfYIHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX/w0YP8WVCh4g
 PYJu2j6nPgni4qF+jqcrFEquvKIh9GznyHzfwHTwJqNAwcbhiie9tJaoQs+wcQ9vLS0WGEDvt0z
 lsvU20MDKmCr/jHiGGoonbWHxQODFNNtoH5ooQbkkqgSZyKtxJ2h/IlKUUNeqYlTqk/i64K91u+
 BvYHJZZgdbHmX7sbuXGEVBnqKhvL70AGdFtI4IWpYh/XaeKar7AHjps2D4QrV1RCvGf2DNsq1Xd
 3Hpcl3WQCa2T2YJZyN8MfEjluQF2KhbFLS3I0UfQTd21GL2T388iejuSffO4vXMeDjXJ1E3GuCZ
 rtJELTc9/E5V7JfgaiLtvDT9rzrwUpLBq25H8EJ6dk7sEl/EOvKqByzeBV1GQePHvJmQr/SqmH/
 nNKJShVyh8q92rgQ6gBgyeWQfVUYtLGcsOvHesx8o7rdfVjNzrAUxonVGD+62rMqGKpRkHecAe1
 2amHb2TvcCAEgIeKmMg==
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=6a4b9195 cx=c_pps
 a=ufjbz8VI8KEHvjFw3VA2nw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=bWKH01WpkPuerRjjk64A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX/U4wd/TU5J7z
 1hPm4wjvB7yXF1HD0d6K9BumqEu3E9oXWxwo8OWzaPj+srpZfdEzyPWxlugFhLyRbQlN6umw16V
 9Xdl+xUoMnYHBFOUyJZ9xeV5p81OtfSBL7etZUBGfTy83eAluOim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240258

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add lld-native to DEPENDS, As lld linker is required while building kernel
with clang.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..1badb37476 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,6 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+DEPENDS:append:riscv64 = " lld-native"
+RUST_KERNEL_TASK_DEPENDS:append:riscv64 = " lld-native:do_populate_sysroot"
-- 
2.49.0


