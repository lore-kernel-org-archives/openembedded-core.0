Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BFCFEDA03
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:08:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82670.1773770903608476807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 11:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lBneReyd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7536196479=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HF8Ux51546830
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 18:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=IVu2L1FT7
	fi386nJ1WBc2smCvsI4Y/080d3SsysaQVk=; b=lBneReydBOBnvR2AX5bDiZsQk
	6WRbjv/qilZ983IPGilf/PX6Q4E7FkJQGAKfyCZInyB6/8Cc/0cg9YIOfxIg5ZK3
	4wRf8PhrYIrlsXiY4i+3/VQVOru+oOFvc+njpTrGWRryM76rf7rENWKUJKftb2jQ
	fhIfJEyNDEwAX6sfe3FpEo5O9+ojqy1k00SFkOHTxoNJ3wQYtrWeGdhRa0+28Po9
	UnnnNgGWOolLhWs2eJT1rXKp3bBcLGdrTk6AKQIOFgTf8QkS0eqT827w0s3qx1XY
	561i7T4f6kANEhcnXQkwcH2ZygU7q2Z4jr2K1XJ2Rvu+R08R8bnZmxmczqcqg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cy9anr92u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 18:08:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDWMZOwxZ1B+1OIJ0zBFw2BNwxDdjhsTmb+sD07OOqyoS1FkEVf3O27mmB9yBmL+9mS5dfuH9zzmoxg5Re2g8uF1jCgqYLjm37GR4bXMBYNWCc6HcuOqwkNSpZx99LxX8+bp5c/pMKAb9KZojqNUmS2mB+X7n10SfWJijzM6vZKIUuezDAa4io8YR69NMLetyoDu82mwexown3YEZRGik+VbklOUquJQPjQJ+gLR8+ecneojp/mmz5rpeOOrDp/ePuVt27VjPYF4kmsLhUzzNfHl1DVUQJR5t5WMqwhI/ivFLWVHxoaABTxlOmJBoHBWbbV2qn4GcnhQxOxBjAkKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVu2L1FT7fi386nJ1WBc2smCvsI4Y/080d3SsysaQVk=;
 b=JUKflqGjwthGvhubTtInlB0udy9ZYLJSd2RHZ+dce+YzYkGUScV1cHxYX4+sezNnBbKUO5z0Y+Avav0vCHkgsg/DgfvYN2/1N70m4YmaUySczvd3kvrwKkUuY09f9GaN2glc3b0J5xdd/tYwLPWSsSikTLjNSYuSooDb3JiYt2/35PdtljJFPkt614QThx61Xxb7FrWV/SCILQcd9m9bEgbXG06SkQCxa6MafwkBxrhf21bL2s+/xto7D8KGX3Q4J+bqvwOBd8OXzhv+Q6kMSxsaAT1Dm6+URXL7gKHoJeKfZLg9HRi3ahiA4aHiWueDRVMKH1q6D3a/LpDtaRDOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 18:08:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 18:08:19 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] kernel-yocto-rust: Move rust kernel dependencies to bbclass
Date: Tue, 17 Mar 2026 11:07:53 -0700
Message-ID: <20260317180753.488090-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0309.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::8) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LV3PR11MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: a1928b2e-875b-471a-8b8e-08de84502b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	D0DNUHDq6M+Q6c1GVhifnNNkl+JjAF87x//8JYNi0icdhI5YM2uU7yMfK98kSqIj6DOzbaeioe2kkbPZ4KVGPGO0k6+SMiize8iOQDEIuFAtCjKzZyi+UjWlRVk4KYarwTm3pSzacMFoLI1OR2S9wsXV1sMkb/mr5bFYwqvN5EwBUjNjZQ7q4mgLkZmIXGVgBCk8DiZU+gs5ddTbhePaBhNQGZ0pdbtkldvAnqvwm1eNsiqpe8QN9+4l9MsrcPjprZfII0+xT1BEzI38SX5i93hUkA0JcQTqUnaoJKCWMBHm+aBYxFu/r3Phh+/E/IoGI0zlNS36vvKPRXc86F016TRwasLNRZjbE5ZAONnlwzKikRN/ldgku7J7ttBiFIvWk8IQJckPiESXnMo9/XsEli6usnpktSQylOIUMQCkhFFRgVL7D11Cw4NtkXK8gOUCTWL+Ol7WFnUKqC+ZYRwyxXLDcXUXL7Hgk7hxcRGqK89pyqodkVY9t+6xdlzqYph+RYMZ3fYEEjtW1gpvJ73AAsQ/D42vDExGU2Qcnp7GXayOYHAAMcPIgwX8CspWZj48QqT6pl4h6kMaENySdkfqTqGWuh1iHTogs8uNNfOSJ0NQOhdKPkriBiJIyB+jG0msCaB6DQtc+HWw9yUv3AQAHc02iRCk3Az4Tw75OtNo6DmmpzZAvuK0hsaoN3vHhvHZnN3/xfKNz6TjNesEvpvvndpOtsHFan3YsOZGt6a/DD46Zz1a5E/oQnjKdcKge9J47iKh3sw1s8WgKb80DePl3pJq83+qOZqm3RfvQ6yc+Xs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G2tLkKnQiDMj48UwiYXAFzLkGEkZNOTzRTYUsp5OZxS1wzxu3NlSAaGoRlVj?=
 =?us-ascii?Q?6bgGYXYMvt2jYBb4D5cGKlCEzpl3DVMIRRsGsXk6mURmyp/vj27ZUUGxfDGJ?=
 =?us-ascii?Q?c8U8bEIn6gMc9HZgSdtMpp5QLSnzoHCmhsiLUX4k0fgJkM7xzbkusJkAongk?=
 =?us-ascii?Q?DZvpdF7iB34MNxrRbbSmfT/TXugBjaEuEeAPiErRTQin5VkvBJNP5qXakLDJ?=
 =?us-ascii?Q?KhsVKxpnzD4ZCRfHV60dWB2IGs9v8/crdEt/N7gFedDM1KKxkfnT3NEDGxxc?=
 =?us-ascii?Q?AcmgkW1TFGQ18T90WSh095cj4RaMVeqEd7kVCOrPIHqJFGce5eu0/qyGOUo5?=
 =?us-ascii?Q?o1L4T7js4Z1tCNdxMUR4b/GpJCi05vVNDzMbAS/Fk/fvuR3B8UnJGAaAdZv7?=
 =?us-ascii?Q?qJ5OU9MH+UFrCv3HqG89rKChoznC2S42YwStXJD3JvAqIS/oSE3GY5j32888?=
 =?us-ascii?Q?ACsEe+oM25b5wW2cNOm5qyMXePkrLaGZ4Vw84p4bdqnhq3KDj6iye4FqzdfH?=
 =?us-ascii?Q?aEn15SmJk/7bPS83TuSPtIZ/2/X2Vz1UnTCb2diAsHjr+35IiMczElkxzLro?=
 =?us-ascii?Q?cbHyX2nlNPiRin127aJNUugVzE3p4Bmzr41a3ZDI1iEuY7XZzM7cdlAp0ZfM?=
 =?us-ascii?Q?Kn8xEYbK3m9287QM6QjECgdvFhGnU63FR8y5ALENY2idiBE829azgKHz4gpq?=
 =?us-ascii?Q?jnR5EewBnm+dCxP54MM4RdFFWscUIQV6gFjch/2hXIqA8EPmPe9fu4Dp7Xsa?=
 =?us-ascii?Q?TX+JXw/JjKQRqmZU2ZVYBlDi+A+gkEdih4x2vbsy7URfnVNeciyiM0bTAv58?=
 =?us-ascii?Q?vPkkKLKqWQ6CoEyx6JEuTAyadcTn1mitcEJLuewH0GjhAojitTXDO8wsXIAJ?=
 =?us-ascii?Q?fQrdI7L4fL0uQJLnvMOBpW5bQ0d15TgbcnbsxP/10MS/cF+YaEhbbIPqxqH9?=
 =?us-ascii?Q?cU8Y8JOZHbfvAU37Azxt7R7O44AsG0p+jWIxdMUg8zYUKzdO5IpGtmwPAiso?=
 =?us-ascii?Q?b64gE7w6/k5kVAL3BaDP/bix6MwWjJZy16xK3gw9vrZonphwmReta2ioTzf+?=
 =?us-ascii?Q?u9Yb/8L7/zdU1XURRB4p4QXLCcLJ83FCYEdcfnLEwnfvFWQkwGyvUsPnOY/D?=
 =?us-ascii?Q?x7P3Kmn+7tS1YMUsYHUBTlEJ8v3b3W9DuB9I/MOMJegwHPVjq2IxgCyWngCV?=
 =?us-ascii?Q?NiTy0yP1jaDHW948FobES3wsfr7bjXhNKcFso/lj8aAnddcaJjfxm59t7MLp?=
 =?us-ascii?Q?SPZjq1oFW5B/ALJZxOhPW6cJmM8zM97rbwpxO+XqeA4y3oHfAYlfd0qz5rnW?=
 =?us-ascii?Q?sHh5zT0KsR1LN1DVYXsO1uFSlACWdB9iOLPthXaKnxCPF/qM8CveNSDlC2Kt?=
 =?us-ascii?Q?w1DLp6r/ybc0a18q3eYYh6U9e8dK5ZomPGjuIrrhEEk/qzNyKSyj3tXfrZgp?=
 =?us-ascii?Q?saN4hl63GFCU1fpjOQHJpLOTXLvoU0AE0NHgwx8Kaxl9cqLPLeAcQ+4pcF/G?=
 =?us-ascii?Q?UY5PeKtLGIwqhhrc8ZUdj3MugN6Sq8+JegZhc8RWaU3tATYW3p76CV/Oxrgg?=
 =?us-ascii?Q?+SVjVcJ6yQ3aXD0w4gJsmgzjU8+Perxm4zJjVLax2BFKdXnN/kvTskqp/++m?=
 =?us-ascii?Q?jSct6xpEaoSi8wxSSxi2m6udLcsSM6anLvtYMesv+nLTVsN3VmaIn6P0jFzA?=
 =?us-ascii?Q?cgZNjx4bmyb+5mhTJMQwyF6OxLMuaHERrr8v9791nzUin4gAmLBGte24l3ar?=
 =?us-ascii?Q?qmgGbfjsP1aR8XkaljsP4Lm8OE3vG3s=3D?=
X-Exchange-RoutingPolicyChecked: 
	RIjAVRsz9Gv3rJjN5Rq4JlZyEN2bPFfoZQsMoU3V/6rOrMceuTGohije8is7QgjMMwc4N2WK2Wekz95IofCqxSXkx7YrmBNBNi2zn4NezrRn2VoAxyizNCLc2ooTQ1CLkUwGf6seBt+qz60fNsHdRBNse3kPMupB6SWnpPnqoEY9Th1CDN5OZoIyTvY/Wiys74i6F3tAPOu7ilM6HRzi9GwI6I7qp9RqGlILjQZQeLCSQa3NhYFffapSyj+omZAcHGCcMha9dGR9KZfJ0Okz750AgxWtTXhMF0atoh1RCv+H0xQcqV1sx3cDE/p/mtrE5wzi7etyIFtHxN2xY3J/7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1928b2e-875b-471a-8b8e-08de84502b40
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:08:19.3521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPRwW8DHjWb2M4GXVov58EmJoIjItFETjmcG4JmZTA9fA59bdnegfgz6zM8FLIltNXtBzirg6mfPsX796Wg2JrKd+zkZ1MVaJYY8GWJO/H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
X-Authority-Analysis: v=2.4 cv=IrMTsb/g c=1 sm=1 tr=0 ts=69b99896 cx=c_pps
 a=8Mab7lbrFfecTh0PXXvUKw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=ILQc7MRpY0pvY6cX50kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _mUNndGvbkLKeCN2eJ-K4J0dCNyXtO7g
X-Proofpoint-GUID: _mUNndGvbkLKeCN2eJ-K4J0dCNyXtO7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1OSBTYWx0ZWRfX3Pg5FSQogIGo
 5l7x0Izod+WlYhu3G6YGq1N1Yt9kx92K+4f8OJXNVGygBr8vpwK3/CP5f7KFfSuCwYHjaeyHYHt
 LRuIYqCSjg2wfAh9QJhTYUbH4iVWNFs1twDuWbGiJDLEwlZbAqfhqsVbMVus2DSgBsdB8OY73Yb
 YtadSq1lCHU0xCB4w3rW2VAzNAYsYIW6B5gKBU8mOOLcIawegtbw9fjIr4UK9CyIP2oV/NPdz1L
 mKR4Rxo5NXEqqlKoUO96PBNktsGTBBwTZJyJZyvfQi4DN2LDXRqG0JWbWpyOpEq4SfnnJe9QWx1
 KK1wBlC5/w9kmTdKs88HHdqbosiBhJz9aEUIq+aPgVr+2NfIFfXapOs02Gx+/fJujFgLPi33PYk
 JxbIMIoKhQu5dNvxfwwORsZhNKy7vsRnmFcVEr4LB9ZjyVxbQFVe79lgtm0JqAO229LIVGKTxPl
 w8bZTBez7Z3JAvACSSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 18:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233331

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Move the rust kernel dpendencies from linux-yocto.inc to
kernel-yocto-rust.bbclass.

This centralizes Rust-specific configuration in the dedicated class,
which is intended to be inherited only when Rust kernel support is
enabled (e.g. via KERNEL_FEATURES).

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 2 ++
 meta/recipes-kernel/linux/linux-yocto.inc     | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 608ccc4609..49f2bfc1ae 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -10,6 +10,8 @@ RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
 KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
 EXTRA_OEMAKE:append = " KRUSTFLAGS='${KRUSTFLAGS}'"
 
+RUST_KERNEL_DEPENDS ?= "clang-native rust-native bindgen-cli-native"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 RUST_KERNEL_TASK_DEPENDS ?=  "rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
 do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index f47873348a..4e230d405a 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,8 +81,6 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
-RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang-native rust-native bindgen-cli-native', '', d)}"
-DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


