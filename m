Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAC8C43217
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 10:01:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.39155.1666000899750108472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 03:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e/zfJsho;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7289922617=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29H8mjoY020702
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 10:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=LBOoC45IboQXlxKWGOb/QVwiqi6j/Q8YH1oTSREHXLE=;
 b=e/zfJshosj8HJm31X5A8bsGFcjGg3ED9a0Pl+wawmvw42wAMJvEjferrE+/+POmgDyRk
 9GWVlmWgCxgp+5fUR71cHDP50WKF+3OrpSkM632fpSbQDkGzrXx86nRuJEAZPXk5DQeM
 qt6tU2zPFGbAq+1rPR4sVKTOopJkkX0ldrppAB1ggP4fNa3TMifulLRHpyD5w2NvRVSi
 lTYaHGGag1n4RaEQPf1F3b4nB2cXHJtqJM5FOR9oZ9QlYYYxSzdJYR++QUm2KhimDxrb
 lFjBu7AOPcTK5+7CsPTeGG0e0p/fioLn6+JcvcYwa34fdBXmRx/BIMX5B7YQf+R86TTG Ag== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7ku99g12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 10:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuBOfE48VGu9b13/AoeBZ31yzLtsRuVsBC4WdX4ylwD1GxH01LXPtNeAnExb6xMGCPD2XQEmmDSsV4AsLAJzjqjXjciTtMng0Ut+L/bNqpbZ5xUIlCHfzCfs17QrykTp6psNGaSF2a8MBr5VIYAv/7zIF/ZeA166n7BCoTZFVSXWD7TxYn8H6vXpFAtZfS/Ublw+RQXZYBR3y0puPli4zjSc8xC1rk6bOirzEuivUQHEfuzhNlL4Udtmt0l7LKjeDmAX/4Mnz7B7yCig66BMfWCov0MiefKTLKXkc2uJGpYKIMkOpWHf1iKDGrExTDn/MtzHxDONW049H/gISlneLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBOoC45IboQXlxKWGOb/QVwiqi6j/Q8YH1oTSREHXLE=;
 b=TlvPUP17G3J13H01XVhfZtKFl4qPaZT1FT2iRxp0DWRfDjIr70lDfLi+HcyS6Ht3tsXZ8NRM7j40QrhH8Csdo/mN4eaaB/HIPTBoIB7l926ZF4arE+W6rhRW1CR5QGNsnLPtJdTaW12VAhT+hmeeG9cy9uh2Linv8IhseBV34Y7wLhUCpWptDODjIiLyQwUDbN2P/BS7fzkyKwIKNro9TmADeQ7u+ly0PRH+ugPz7B1ThijBaBQsVhJXcPlV5A/pK1V//Uvi3DYnwmUB6IUGHZrfYG8uG5ctOPTSvHBAe1RctPYzWeADqspOjrpb4Jy6aLNGDs9f8OUMlujaltoPUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 10:01:34 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8%11]) with mapi id 15.20.5723.033; Mon, 17 Oct
 2022 10:01:34 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] lttng-modules: Fix crash on powerpc64
Date: Mon, 17 Oct 2022 18:01:01 +0800
Message-Id: <20221017100101.13828-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d7f36c-f4e5-4a01-8f41-08dab0269291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iUM43HPGPEDlFOm798j+Nt2oVlHb4NVRXGX6U31XAdrWHk3X1ICbJpDn2Q++P4TSYtwnzRG79quhZi4tVrmdWnLVKeUVawF6xfVwxXRsVzhWinQXBjM1tKEresaZSWjbkSq8Nsh4f923HCLjOTNss2fxJ9gzhJlOO/y0vYGNKrpmkxf0+0qHqP72fBcXlL1cyLBgurFaC0bVAzkq+DOLTBCh3cP7V9/3CSqussNJSUe4Uns171Tp9lgj6BRhRSFIzaukBnPcKP3D9P/i4YtSxqxhqua6zfwZ81LNvl81newge/iY6ekJxXEl+p5/r1c3/Vzyv9RHtkkvu/DkY/8Uaq/Ro8CAP4rx4qVPRraQYWDTulUR+tzE+z99AfZM2Uid/Y/JwPO5v425PPX7ENewCXjPdubEDItjT5k5NuUHG+X6fazQwXVd6S+mpvKUxMoULKiN8dOsZGobB+d6TH/PMTdFTLEXWCn1irBbgUrpAukOqmPZUqWFVMJ5aofdtq3czXqBtg2NvwQuGCj7R7BLGRsmA8+Kij8sIkh4G1BO+gffS3BjpgcIZMebSCu37xHme7MbnafR9jnaP5uW2Q2u2gyDGOHxBsKUtxB+OZ3HQmGOkbCMO8tVVuZrlH0y2P+QpkU9EXgt/59MkJfi5E+993S59WCXkdiswXvdw8+Qp1hoyE7vcrj2gqPRg60/SJRR66NSoid409PCHyBbB54SGvEpAqo83pBq9POo7Xz9rCV/ofxzqgrzlbNRHanqyvyg+kmmPG+2mAeJheq0+DQXoABGLfJOSbYg0FGzzuZ7ZXA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(451199015)(83380400001)(41300700001)(66476007)(26005)(8936002)(86362001)(66946007)(8676002)(66556008)(6916009)(1076003)(186003)(2616005)(36756003)(6512007)(52116002)(2906002)(6486002)(316002)(6666004)(6506007)(5660300002)(38100700002)(38350700002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q84/sW+tomlJBiiOgMAjN5SLJgaQDbMeN1Q9CUA8qc/dELJD9nIKO2W8NlBN?=
 =?us-ascii?Q?VnSnmNvrIU98CkhdEmgShHENBS4k8UQUlNkpSyz7Jf/G7H+bkrjOhZdp26KF?=
 =?us-ascii?Q?sE6SE7bV+vOab0wt7hp5pfOhZa+BuGXbQm+hAPEDATklSuV7UxOtOp39qWdm?=
 =?us-ascii?Q?LuLFBwStKJW0c3Lgzgc3DsRLonkxAesmtOXD5qdfOrI55syTD280I6ZM8lkw?=
 =?us-ascii?Q?RVAOthizGg03yX9SYlRNQzdDMiruyNLaElrx1Vct6mJEr5Vk/PPlh5Bd7KC+?=
 =?us-ascii?Q?etyEn5RZAP0zApzxFGSplzuB7C2EvybK6yXexhxUvHu2UTSPhJhYGrhp6Fs1?=
 =?us-ascii?Q?WycBJSvff0rkRz1oK5qW9mggQicEoA1AV48VzeQoYj6TxuDSSeR75wgEi54h?=
 =?us-ascii?Q?A67jE0HloU5hJaAm2x7ldydheROwU9tsI0F0KjwYOYwD5FaSFLNN76CuV9vz?=
 =?us-ascii?Q?7FvNCXClu7JDRjDUpBW9IM5Nz+GStfEFqayAHQeGr6rQdWAlBISj9KHZQ/b+?=
 =?us-ascii?Q?sl4WZZIMfB/EsygZjPqyDR+FNdMs1Liot8uQKtY0ogi0ZFao3Srty3LQYJ7P?=
 =?us-ascii?Q?j3VR0h+26heaxSmALJ1CAe6/VlZj4fQhHyUvvn5iGfLcsY6KcI+Ed66EbxOB?=
 =?us-ascii?Q?y3xggZyKJWGox8UiGIBgELLfoVP3+96UHMFAdW8J/bRLjhnN+SgHGdnM7Kor?=
 =?us-ascii?Q?1w4OqpRMJUeaOO/xTQ5jZv/CyHefOqn+yPyFPzkaciRmfkubfzUU73mAhBED?=
 =?us-ascii?Q?9cjc4NV1jm5YVhl9bB6u1XJj5SHUxAlk0N5MnAaWVSr62qku4ArXWIxef1pu?=
 =?us-ascii?Q?wVBT3YcYO3GKP8IFQHm0UYvk9ZGYrSXOtHFhpyIU4Kj9roFtwza4gwigi52N?=
 =?us-ascii?Q?EnvLEUHvWHlpMtO2oyQGG8YifzxKDzGzVSIXIv0RXraqeTa+RLMr5X20jygP?=
 =?us-ascii?Q?J464J7ys2SXkwDighJXgApaU1DESY3AcxNOivVRlcd0v0rKkv2Nfr/L0DJI8?=
 =?us-ascii?Q?RWOq0Jx3ZzGYtptH897lh+xR1mJSVsBxHRaVGCPSgre58Kxp8W96LngW4tFI?=
 =?us-ascii?Q?Ll78gkm0K47QUK5DOyxJlVgM8fR01tEmzEaMaDcaIe/e9RMmw4+DDGAm8cFL?=
 =?us-ascii?Q?jkfWrF2FtQTJPH8IgtOQ9oNy2PjDz5TiOTrfEWA9awiUuLhW/i1/IIu1l5kf?=
 =?us-ascii?Q?UgZoubUFRPITJJG5LZCOUkO3aT2/LAEuANmallQ80MWScRoVBPvxRoU47SWF?=
 =?us-ascii?Q?rqnunfy1JP6J5E2wEHR/82+Ti4/i5kHiYiDKNDLN4Z0oytdFTg3uhbbsk6hR?=
 =?us-ascii?Q?EMcYQcmOoY7TsDYuEbfIkY44oIfDhB60vS2YzIX9OOOPRsfGwY2XmZffuPaS?=
 =?us-ascii?Q?ur7K13zfwaPm4C0dp7xx5ZkmI4AIDOgwW3NUphtdti0QaD7AaOYSFW/flWOJ?=
 =?us-ascii?Q?EE/u+6V8vBp0YrvNj7KQrnS3ahNhRzgevP5V/2OIdd2uNQe+WeUvtILa665E?=
 =?us-ascii?Q?3K7Bsn31jLEX26cGsxnLxkrUZVLK1fwE3ROoYNUoOOK0FGxTeWxje0XM53uM?=
 =?us-ascii?Q?2qyST2TvBVTnaNDsUewYZaU5W5zfbAY0KqSTEFZG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d7f36c-f4e5-4a01-8f41-08dab0269291
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 10:01:34.3730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgRtHo87OXXdwAfzZYcP+akIBDkagPleF0vVwd3UAftNDey3MaZ2Vz/tvYrn6akKwIFsEV9dZt/1pAxqkBr+IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
X-Proofpoint-GUID: TwcAXErKyqEo_cjc2EauFwnJu1a3likl
X-Proofpoint-ORIG-GUID: TwcAXErKyqEo_cjc2EauFwnJu1a3likl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_07,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=643 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 10:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171904

Backport a patch to fix the following on powerpc64 ABIv2.

root@qemuppc64:~# lttng create trace_session --live -U net://127.0.0.1
Spawning a session daemon
lttng_kretprobes: loading out-of-tree module taints kernel.
BUG: Unable to handle kernel data access on read at 0xfffffffffffffff8
Faulting instruction address: 0xc0000000001f6fd0
Oops: Kernel access of bad area, sig: 11 [#1]
<snip>

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...4-fix-kernel-crash-caused-by-do_get_.patch | 94 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
new file mode 100644
index 0000000000..b3b191c7ac
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
@@ -0,0 +1,94 @@
+From 480cce4315ce5bf59a509e8a53a52545f393de68 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Tue, 27 Sep 2022 15:59:42 +0800
+Subject: [PATCH] wrapper: powerpc64: fix kernel crash caused by
+ do_get_kallsyms
+
+Kernel crashes on powerpc64 ABIv2 as follow when lttng_tracer initializes,
+since do_get_kallsyms in lttng_wrapper fails to return a proper address of
+kallsyms_lookup_name.
+
+root@qemuppc64:~# lttng create trace_session --live -U net://127.0.0.1
+Spawning a session daemon
+lttng_kretprobes: loading out-of-tree module taints kernel.
+BUG: Unable to handle kernel data access on read at 0xfffffffffffffff8
+Faulting instruction address: 0xc0000000001f6fd0
+Oops: Kernel access of bad area, sig: 11 [#1]
+<snip>
+NIP [c0000000001f6fd0] module_kallsyms_lookup_name+0xf0/0x180
+LR [c0000000001f6f28] module_kallsyms_lookup_name+0x48/0x180
+Call Trace:
+module_kallsyms_lookup_name+0x34/0x180 (unreliable)
+kallsyms_lookup_name+0x258/0x2b0
+wrapper_kallsyms_lookup_name+0x4c/0xd0 [lttng_wrapper]
+wrapper_get_pfnblock_flags_mask_init+0x28/0x60 [lttng_wrapper]
+lttng_events_init+0x40/0x344 [lttng_tracer]
+do_one_initcall+0x78/0x340
+do_init_module+0x6c/0x2f0
+__do_sys_finit_module+0xd0/0x120
+system_call_exception+0x194/0x2f0
+system_call_vectored_common+0xe8/0x278
+<snip>
+
+do_get_kallsyms makes use of kprobe_register and in turn kprobe_lookup_name
+to get the address of the kernel function kallsyms_lookup_name. In case of
+PPC64_ELF_ABI_v2, when kprobes are placed at function entry,
+kprobe_lookup_name adjusts the global entry point of the function returned
+by kallsyms_lookup_name to the local entry point(at some fixed offset of
+global one). This adjustment is all for kprobes to be able to work properly.
+Global and local entry point are defined in powerpc64 ABIv2.
+
+When the local entry point is given, some instructions at the beginning of
+the function are skipped and thus causes the above kernel crash. We just
+want to make a simple function call which needs global entry point.
+
+This patch adds 4 bytes which is the length of one instruction to
+kallsyms_lookup_name so that it will not trigger the global to local
+adjustment, and then substracts 4 bytes from the returned address. See the
+following kernel change for more details.
+
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=290e3070762ac80e5fc4087d8c4de7e3f1d90aca
+
+Upstream-Status: Backport
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I34e68e886b97e3976d0b5e25be295a8bb866c1a4
+---
+ src/wrapper/kallsyms.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/wrapper/kallsyms.c b/src/wrapper/kallsyms.c
+index d2848764..93017adc 100644
+--- a/src/wrapper/kallsyms.c
++++ b/src/wrapper/kallsyms.c
+@@ -39,10 +39,26 @@ unsigned long do_get_kallsyms(void)
+ 	memset(&probe, 0, sizeof(probe));
+ 	probe.pre_handler = dummy_kprobe_handler;
+ 	probe.symbol_name = "kallsyms_lookup_name";
++#ifdef PPC64_ELF_ABI_v2
++	/*
++	 * With powerpc64 ABIv2, we need the global entry point of
++	 * kallsyms_lookup_name to call it later, while kprobe_register would
++	 * automatically adjust the global entry point to the local entry point,
++	 * when a kprobe was registered at a function entry. So we add 4 bytes
++	 * which is the length of one instruction to kallsyms_lookup_name to
++	 * avoid the adjustment.
++	 */
++	probe.offset = 4;
++#endif
+ 	ret = register_kprobe(&probe);
+ 	if (ret)
+ 		return 0;
++#ifdef PPC64_ELF_ABI_v2
++	/* Substract 4 bytes to get what we originally want */
++	addr = (unsigned long)(((char *)probe.addr) - 4);
++#else
+ 	addr = (unsigned long)probe.addr;
++#endif
+ #ifdef CONFIG_ARM
+ #ifdef CONFIG_THUMB2_KERNEL
+ 	if (addr)
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
index 80b9ceec3f..ad4063bed3 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch \
            file://0001-fix-compaction.patch \
            file://0001-fix-adjust-range-v5.10.137-in-block-probe.patch \
+           file://0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.17.1


