Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC8EEFCE33
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24451.1772646269759494131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UIHGm402;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624EHLfa2960433
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 17:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fUiq63CpipNAeH8sVGbYIkpQEnqxRiRjTd/av/tJzZU=; b=
	UIHGm402H13F05zfpVZJuFInnaQnf/oFNNH2rsyV/zWAZKtfjDgPyGv4X5RVAHjH
	Z/GZlNzRwA2cbtc3gxRm8azd0GZllunnAvnEcZM2X/HDbgBmGdaMIR/W3+3tSuYD
	+nVggdwiyvLz91ZGPbhP4SfBScbcohWV1odV7Fmdgck2d/E24ALkESP4/5qsnrFL
	pveMFZh4acnQ1EGEGAu7je3ZsRrSnZRL5Wg/YhPkzS8ObTuIkBCvFuw8rQb4401E
	6WabbERK8VRtNWfLVYSZnwA/cQmku2xJ2n/H+9KrMRZvHlAD1PF2fOlqVf4O50K3
	XNx+8RFQPExpOsYttZaEOw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010027.outbound.protection.outlook.com [40.93.198.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvnj2d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:44:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDtY568nTojRA1JUrc3qnnPBwMsEHKhtG2/CDEJUdUVtbIGTGjx2x7USZ6jaIMe3MJ9ywtYYTMgdQg74jIOc6Y9UNcrMFqPmZ4QUyBk+Z+xpcxGlnh5gPSDdPYNgEy4cqDC237kCewsIo3DpXPMHusf+POGtBM+fVENVExJD+AJVjsQow5yw9pf8pGI11I64c1rMUfCSeTxnj/LnZWPGGI7dH68YeUHK1oET3o1PwHnIuzFHbyLZyIn1HqDCVXEap400cA9YQ5WpFHe1Yk+U9pNyDeu9unqxHMNC8sNydSp9FBJ6CTjJEZSp0TP4dh8taiFgk5bqkfHRVMn/1r3z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUiq63CpipNAeH8sVGbYIkpQEnqxRiRjTd/av/tJzZU=;
 b=At6Pa6TbU0Q/zuSXJeQNKIefya8paXgu0aYfFBfrAO4ErYKkEz8kh/Nlwf4H2Wugbs5z8X5GpymRJrMIb2wI/GS0+zmn1+LbigrR0TJXH4WcTllJtSKZyLg5EAvFEiZRy7i7OEoJB4A0++vvlbxzpppv41mcdt2PlPsGnAi0sjl2kPnr+3LKSLfwRqQlNgD8qaKlgbwSvAhcQupCb7Khf7PlLe6n7FTAhAcc647WOHLwBQBcqFjsUkrProrx0p5DiMlyZuf08dSyfu41ihbOCYizdbDJGghsZxWCYhdryvw8PbatXYy3DMBtVPXykXK363kwmDhN33ne1g+KE9y4ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA4PR11MB9396.namprd11.prod.outlook.com (2603:10b6:208:56a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 4 Mar
 2026 17:44:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:26 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 14/14] runtime_test: Add rust-out-of-tree selftest
Date: Wed,  4 Mar 2026 09:43:24 -0800
Message-ID: <20260304174324.1186644-15-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA4PR11MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: e93eb51a-559a-4a2d-e3bc-08de7a15ae04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	tsziqbtk4pvdKlMdEoPTV1eludTnuc0tqxGPcdfIndr2lBwvzU6UoONdSlyex/7hdjibYOeSycH4ZTR4yNEsjllRsjKooQnslq5hwN+mJ1KPlUJOhE0hWJvG5f0YXMvLdoS2XarqYgMGsPF8j1Si7qTgFVkXtZH31CCeaSpCnR3By1bT7RtX3AG/ot1pG+1uftNtH764FGQZpcjwUtUeGV9fA0AQWRFElLFqv4cw0RdhKfnbJeQqAMAHjf/QmpgpPzx+CfDcFCjlhmnDhxI+CO4r2VH7ReMEKRjkXGwldbBI8iP5CQUXb0k+x6sbuzH7yTgDx1J5jeZn49aOOsvAOlWX95/IZmXD6/iCSmnzqmswB9T30kUs5+6SKjWWSyO3nczFz02yBUbxMjQMe+x8MNAuHIWjO43I0iLfi2wzNDRTmuGvW/TLyitjHCODgVqvpwX0UY9lYQs50WhCMv/0WJ8FDdsn8RcWiipm8OC8Aw+m0B0KdeHha5lEToh/JyTjqkb8ruAL6OgDuelVRtykG3HUR0AJFt27JUzJ5KPYT5nP74vdsxu2IWkBUTsmp4JneuFHAN+M/nai1zpcNrQQlQu79UNoA35b9rnt2uALxZZb66E7Q1KMBBWmCctT/1DLRayh5k7Ocjsfjgz+kQRZl30CSi7eLkSz3WrtOsFwQpcTjlWC0muaO1dIXYjdg5UthOCDqjQBaZj4lH1feOJlJqKv6lOJUuW4MXniPZsuZdrbCpOQgDroVnN0yvVRMcdLBYS/kbEwJSvxckqCBOB+cvCXYNjennTzoZfE9DTBPeg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nUmkKU+03cft+z0haNWEuwHA7Svzv1ltC0VitFf0Q9/G6h0ANriVPTVA8tK7?=
 =?us-ascii?Q?ceeZdEOs8ZgQY3nEhMe2Bak2Lw9zyXytfJTZ/6J5AniuMqRPdrPGkFDmCsbn?=
 =?us-ascii?Q?0mUBZzyBvtbT7QWklpQa2vJHKpMS9I/PLM+fIs2grnYhWh1xES411pUd1vYe?=
 =?us-ascii?Q?4L+TapeavLZnbtY560hgtTHG3wvlrfN34KEawB52RhEVYKwuCkiH1+NRKn/o?=
 =?us-ascii?Q?Bh3dY2hP/NoEcaAJDDvzd1bpV9yh7x2eBduTVbgAUNoOQKWdWfNkI9Mg2V6W?=
 =?us-ascii?Q?0pHOYVp7YRmi2INsQB8Q4UJiLK28EfRMhy7hP4XZwjRcsIn8fvzwfs3uwMGO?=
 =?us-ascii?Q?vkZ9of7i4Jb4pnIFkszcXzYJhdbVsH7lnFlcHB6dBF2g4Cgpre5Z73usTTVd?=
 =?us-ascii?Q?hAW5zt78uzHuThHp8gUqqkKPsMTLI9cR1JDJx1gQnYokbG88v+JbI/23UOP8?=
 =?us-ascii?Q?/Vm2phnSJhzhIp5UC1mE1sV6LOuyGnrNifimiLfSEOri4EfzAZt6qKY/OKC8?=
 =?us-ascii?Q?ZcJbJajJIiAvWwn1aSBlLFMRn/rTR/Jnck5wbiMS7IsC6/L3bmCS7AfDmmBA?=
 =?us-ascii?Q?I8rPG36B1ciFDmuUbpGMz/9demQhcF3mVssxtX5tOu9R2qN3ZsQE+KMvzeHW?=
 =?us-ascii?Q?erszTrza/ZLnQA8UxYXbmIO+Q9inOwC8L4L7+k9BNQME8Xlkaaj4/vlzTsYG?=
 =?us-ascii?Q?l74Pdad0FLAYTDgxpl3YtaQlsCV7VoVlE6xbxKvLM91S7y65vk2Pb/MbJkbM?=
 =?us-ascii?Q?JwByD5gji91Fl1p5kEkvbUiC33rbtNfn5FYi3+TziV5eYcChSieRVpD3ADiU?=
 =?us-ascii?Q?r6xPIru8jt9MI0AtCjV2b1+7acYtQfL1DG505j8POswYnBiB952yno7gltKd?=
 =?us-ascii?Q?ZLrYBDfCgB11WqRt52Ng8mhH2tq76TzaRvdoS9KsRRQjBt89ROhUFP4b0ejK?=
 =?us-ascii?Q?jVemjgOWmK5lwqpE9+2wo1Lx7IbtD6kmzg0TAmEOxMnOjKe1bZRclc9fmxhc?=
 =?us-ascii?Q?FvG2GV93nE6PQU8oxtw7+gci6TXPuvALgpwZ9XN3XzgPl9Y8ycYRwmP0AbcA?=
 =?us-ascii?Q?aqpqO66ge1AKXcVEFIEtC3a0AfYgYNvUhfguBxtMu+TXXUOcQe9283QY5UUP?=
 =?us-ascii?Q?6AQvm/5KnUvd7QlEBRsgnnINE1BdiieqW2fKfFzenqb8mK5vjBcctrgcnO4d?=
 =?us-ascii?Q?M7qHrDH/mwod/ngLgeYvO7B5S7w1IsXtELWnwE6LhrxsIpaa/uhy0Q2hULu2?=
 =?us-ascii?Q?+Byk+m+dxSTR4v9qZwtl4L/qPXgoR/YQNOGK2g+Ooklk6LOymfRmojTf3FTv?=
 =?us-ascii?Q?Wdq/ZrAC/XzbasKRcCUqRnJLDfvPsFInQDC9bv9GsV7eLfhYZGN3EBcIXTdx?=
 =?us-ascii?Q?J4nvi+MT4hkdkd+vQTXzoOxqIwTuhzm1v5p4coWXI8/hzks1zXKXWcF7qtA5?=
 =?us-ascii?Q?ztXakMH4+SrDDuvPzHb2gpETMSGISHeiPaPkFdiDM1UaZxyz+NL1v41GkUDM?=
 =?us-ascii?Q?Oj75GJ4N6irEKUuCldM6tdo2eTDPh5RWUxOgtkuB1JT6O9nOsxDZpdLBPD6x?=
 =?us-ascii?Q?3ajO3t91l0QfvDzcUmvVPNv2bcYX6hIEQCrLUJsFOirozad+D1yxNH4Gw5XZ?=
 =?us-ascii?Q?r3S0l/MFtRaFHT9GPkVv7YPNZt+7j/ZVPuaMZYlODn8WK42LveeP4GtHkMtU?=
 =?us-ascii?Q?koA2a4YIK/S7dSTx3T91c7lX/Br/0JTxTnCco2DY0NzUkUqZF0HLVYGpbAgR?=
 =?us-ascii?Q?ZGoL+4C/NwOl1dIeWkby6wfGIAbqShM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93eb51a-559a-4a2d-e3bc-08de7a15ae04
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:26.6453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZ0soeDRCR4q1Jeg+yfYlkD7v1LF1nJy83OAfTbywDuVWM49WUvmBExrPvyfDfRnhf18T3D5Y9WDr4arLQ0O5sjWi3OEC0GuhLx+ttj8Pr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9396
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: KO-n3basdp_oJhFChIL4DC4Jm3wFN4DL
X-Proofpoint-ORIG-GUID: aN5tX1eQ3z19gEZ3241zPeQL6Tan6M0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX+9+nPN5qKzY4
 APCRVXvizbY/W4Q8CTz1BOFR/p/ESDfPgU0mTv36euzb1B9CEv+qicZg1599jbf0jkOZFe3s5S6
 7ScBCsq/23+GKiGg0iKLntzjWz46cUgR7g+66C6Z1WNrGqq5MPDX+oRu+L/O4lb2k9M8xl2l2jY
 5LLmm/mGrtiD0UNf8w/CsyVnNE4oYjqp8SUdO3bd+P6ZCcs8Gn1jBn2Eg2R00JoDTt9hXGNDhHP
 MAX3Mwjxs7Ae5wDwrmrmfAekiCcDVwA7C7TtbyB3r4t1AvN/ujWwt89dM9znTC6akCxA8aFzvHI
 GP12lBDukSj4wSXqJ254wEBXSj//NHb9CrtI+u89Ku+wtCiYkAfMd35p64JVtkg1qVnrjei6GzK
 fjfFLgLUH1gb9yUOnbKAyFQe2bTjFYa743M1WCPiI1KACbEXqAkoG+z/97eFQNKhb1sSa+HGax7
 cllecigR9qrmFs4Pwkg==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a86f7c cx=c_pps
 a=oTJwsqqp05Np5voO4IKyrw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=PMCPsi-Yzk6GkJUXyKcA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232430

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust-out-of-tree-module recipe compiles and
run properly: check that the dmesg output is as expected.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 6b7cd45684..463dcc5396 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -493,8 +493,11 @@ class RustKernel(OESelftestTestCase):
             self.write_config(textwrap.dedent("""
                 KERNEL_RUST_SUPPORT = 'True'
                 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
-                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal kernel-module-rust-out-of-tree"
             """))
+
+            runCmd('bitbake-layers add-layer %s' % os.path.join(get_bb_var("COREBASE"), 'meta-skeleton'))
+            self.add_command_to_tearDown('bitbake-layers remove-layer */meta-skeleton')
             bitbake(self.image)
 
             with runqemu(self.image, runqemuparams = "nographic") as qemu:
@@ -508,3 +511,14 @@ class RustKernel(OESelftestTestCase):
                 _, output = qemu.run_serial("dmesg")
                 self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
                 self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_out_of_tree")
+                #Disable status check due to intermittent failures on armhost/qemuarm64.
+                #The module loads successfully, but qemu.run_serial() occasionally
+                #returns an incorrect status.
+                #Bug report: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16189
+                #self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_out_of_tree dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust out-of-tree sample", output, "Out-of-tree Rust sample expected output not found in dmesg")
-- 
2.49.0


