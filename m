Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5B3C36013
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:06:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45769.1743066394455515718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 02:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=518172d04b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R6nj3s029761
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:06:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hm68nq31-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:06:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7ulaOYH+Yb3mSCLy/PG+if9vXvYDv0zJVv9mtjoGwcKEckXSE0rqFNEDteeSVzSN5dmNc/RokqXYS2XW08ZuSCecL5nUaZITE58qXxd/NLv1c1kNiJQQt9+l7yjsfsycsBcD+3MVFQnAKjCZjl0ivEBMCw9RGZQO5uoBQXLYcCk5lR41OkHIkbRaqn1Emd7TWn6fVIRZfgu68pnIAglwWyO3JN5QfUV8RURicox6Je3g42gQsm/Y5UMSr+nMoDsiMLeNVeUpOBlkn5q1mDH2atZj7vyoTMz3Zn1DpYTVSysYE9JAaI2y1l82J4U4iPYHc1DmCHFj2RgTG0pbWrQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NThae4IZbqL5gboZ4KM7pnQ5ZPlHF2evO1rt1qDFTak=;
 b=StHdDK+WYSJbch+PaHOvpoVSlRW/YR6mH5NQ6PaTaDy+9YrVnqFmjZBzXk66+7Mh/5Eh01BxwW9DxU3CD3mZYAuIfnVNU1l+fKbzoaz3zlgfRBA6zAGZ9r4dYAiyKbbPzfMJtmcT1Tt5WmNJsXUHgIsCZKauyw0Me5TJo4UxC+6dO+0IKE0mBAAUue+G9db6vKV7AMp2MDmuOF24DGGm3JzmnjOowOiZrEfxqt48pcoD6DgTE7M1zFmS0il/+EMYQfkt2Tyei1sk3R//Q1KJyY2aXv4cEm2aGSyPak7hfi+I6ImZrTYMhpPMWPZ79ZAw2bp/EET/zrzCAaXzfmcLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) by
 IA4PR11MB9060.namprd11.prod.outlook.com (2603:10b6:208:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 09:06:32 +0000
Received: from DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7]) by DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 09:06:32 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2 4/5] rust: Fix build failure when multilibs are enabled
Date: Thu, 27 Mar 2025 02:06:06 -0700
Message-ID: <20250327090609.1096447-4-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327090609.1096447-1-Deepesh.Varatharajan@windriver.com>
References: <20250327090609.1096447-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To DM8PR11MB5637.namprd11.prod.outlook.com
 (2603:10b6:8:33::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5637:EE_|IA4PR11MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: e7907097-28e2-4381-4d4e-08dd6d0eaac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3QPu756+gp51XplM6gTs7oBJRqCZ0kSdUg5zSjesQ7olMVSus9WJrmxSYXgZ?=
 =?us-ascii?Q?cB7PSE1uephQ/3+XtSvY4M0Dms6p4COCJuFSstWfZ9wvgjFqYgRAO8bh8cUc?=
 =?us-ascii?Q?TT7JCkJTJhH5w49HvffD+BQQlKJUo36DJWa4lc8LKKrTn+iEA1oRWce7YXwD?=
 =?us-ascii?Q?hivQp7DkeF86489G1LHn2YHS0VthG2WeABS8D7L/ZshpbQpQ7kzvgOexJkos?=
 =?us-ascii?Q?M9IzfpV0pHQx2v61AEPlT9G1GeNdt2gZOCTh2moBdUu3c5ad9Bc6Ct1gDpqJ?=
 =?us-ascii?Q?Gep3TmCcFqGzPzvqElMyrMVWPXunIFKIC39nAFlvaC4BEi3HUlHOS1JOAP8u?=
 =?us-ascii?Q?54cjTIs+iiQp8TK3vPfDETE65ty3DDz0p4b8kvy/RuUa92fxWBeRg0R508av?=
 =?us-ascii?Q?3eZ0x0l7T9v0w955EeABwafb/jaGRFjsj+uw8C3yFf/K9reDH396TCKWrsFq?=
 =?us-ascii?Q?yTIQs9V87Kzm0v9lKT7s0cnWIfNdMY9aIm3eXcqhu1LAYMSuMDh13evcTUAZ?=
 =?us-ascii?Q?GgP2blo5hL6vCQvWs77OHIySXXjfJoM6ekHyWZ1sFIImcrso+Sy60PjtWU2b?=
 =?us-ascii?Q?AcmeCfxcYw45KC2NP/l0G7nTP26KeGs5CPdadWOPYjZeROaXkpFdYC0Jda6u?=
 =?us-ascii?Q?YY8zg4st/Ono1+OTY+azW1Wu4CLgLX1oKc75TpETyS2kmiJdq9YW3a6axx+2?=
 =?us-ascii?Q?wwCrRxFOY2aZ2SpHyDlORoMNI1Ge+Ir5w2+01IG6vCRaD6TDyAq5vRsBQNDB?=
 =?us-ascii?Q?d+DM2CRYp3lF8/BuxYH5yXphOAYypKT+78oU5KxNKmD0uf+bMCtuT8zUxJlQ?=
 =?us-ascii?Q?5cfIP7H+uYboGdXI+vb64eVQQnOk6gJYZX/1MHm4amEqc2t+4f4eg1oHOC6g?=
 =?us-ascii?Q?+L2mRxNQB6676h8HzxPEHcDWSfn2rp0u50qa1YCjkAAhr4wMM3e+VFNxXpFI?=
 =?us-ascii?Q?KUs+/URpxfZSfiJ4FZORJNAcRUJLDfvwANXutMYqHhD5zEJViS0GlA2Mc1X3?=
 =?us-ascii?Q?S+2ek5SFeRRnteyUQnVzy1bnWpsod6Zy2g/S8ObWy4b1FousO4jDT5JeWZ13?=
 =?us-ascii?Q?aGp+rThFb0cV7Z71ETCewIcW6pS7+FyK/peryQudDhvN4omIYnPJ1exNdFxB?=
 =?us-ascii?Q?NBnHPKkkc3VQwXt2WKJ8brUlXA6qVmZPwc9zkpbtMR59PfFJaCjAjfEM/pE6?=
 =?us-ascii?Q?khoCR6pdaxKQO92dZHGZ7d/q93zL+TVoK65iyVd7oGhqKRGvb1Uktxq7alnj?=
 =?us-ascii?Q?E+s5cL+x0mxgSTDDgrDat6r/S+AmLi+Sn58T91AEd3wnZHraaOi/eRKN1fSv?=
 =?us-ascii?Q?xAty1GRDq75g2iKeJQ9A6U0uAq4qBX4yG9+alXx59TTnplgJ/32UZTdpBdS8?=
 =?us-ascii?Q?CJHfoDU5qhrhD2USTjyyrgAzV7xR0wYfXFWT4KZhVcqhTa4Ciz43MBOxex9R?=
 =?us-ascii?Q?hf/e6xz4ShR/TnTcQxOVk3QYCF/UnGrM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5637.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RAdGXgsxvepsxEOFOxEqC5mek79cgyymX6dLAAkA3wT+aQtOdcr87PrwsM2Y?=
 =?us-ascii?Q?ZP+Hw0nQ+ig+fKN0iXKo6jtjt0vHgigBSRM4XIPs/9D8SqyQhZfjV6G2yJYU?=
 =?us-ascii?Q?/CAB9kH5jgjjlJGPnYjxRugLiOX5A9xnSe4MXkYfVUQMeYVyH4/C6HlSVTvB?=
 =?us-ascii?Q?YIN30ku5o/9oa3FgEgiQriTBbEqC3sxXWDLpCZb8RPFQ3pSAoGvjSHGoYKHs?=
 =?us-ascii?Q?U4XN5cpc9WHo3zmjEMOabWcMiqasXHXLRNGjM8MmVoDhgecOzxI4EU6rdkw8?=
 =?us-ascii?Q?0goZhZ7E8oOObR1MdUXhY+GL5iJm3GzghEsUIG/k8NGO6cE1s0TiFtNvq7vr?=
 =?us-ascii?Q?9M7hI5zLCAWBKpuTzKwbFBNzJe9DvQ8fEFjkjLyqcUuFyVlokX/JBVVnhJ7P?=
 =?us-ascii?Q?wg+sPuZ78FKQhr9cgYwFteCsaFamMFG1ZOrGN1SBnJBufobtgpmiILqB1ckG?=
 =?us-ascii?Q?mNM2MdpZzxaIOhgATO+YGa5Hl89gEj8Hiwsj6Gn9vXyAk/O4ToOvVv7/mOon?=
 =?us-ascii?Q?/isg2y4lltlZGvbn9hYht0tkGlfHJBpfmPeI733rQyvMvT83/0CsrxggOuxO?=
 =?us-ascii?Q?kbtWkvOTqglkiPkZj0XvpX1iI5kKMonWCewgQ2NpZPLsnM+vpRFRu94iiUBQ?=
 =?us-ascii?Q?OLR+wwCG9UuH7UBDdLQ/oN3GnKWNcr5q8BcXEtiZSSgjH4CMxINOxJeOysY2?=
 =?us-ascii?Q?ZXBOa+vWDVq3dCuaxo5PyS3xVIIVfnz6IMif0L088BY9uNQ+xprr4rXaQtUX?=
 =?us-ascii?Q?xKNWVevXPjknMZMhEDbZYFipzPBJb/iJx60z3B2ltekWNGFvFhsFcdgbyreh?=
 =?us-ascii?Q?8XJG7zLTa5RCLOhgh1xiw0tLixEku8G9dCCy4R7z2Oc3kOZ4d6C3XrCf+K3d?=
 =?us-ascii?Q?6HDrHMBPkdgrMIhuSLlfrFdO5A768yoh1GNgoyoo6gte+IrHUA9Ky7Ou3zd+?=
 =?us-ascii?Q?L0RKE8gcDqsuih5M+kL+I0HbjIspLHPu2Ie2arRvm8I6qpEPXjQVvduVYdl8?=
 =?us-ascii?Q?nBMARdNfwVc828ptM+HN1VpXDCECLLKywShmlwidJiWYt+bZPSrRYNRilX4G?=
 =?us-ascii?Q?0VFpH8rAou+P4DA1gJL1q0vWCeoNlm1g68k6Z9uyf4x0wmcKPlbinZgzgrNL?=
 =?us-ascii?Q?ZuzoDwxfD9/F/RGfD16p5QMogK36FQLLcgORikLzN33EdRRGis+uUE2A1vlP?=
 =?us-ascii?Q?uzxyB9a49H5v/g5k+LRfG6NmH5nDReVQpxE0HB+9oeohzX/lUCA1JUxeQqE5?=
 =?us-ascii?Q?TDPaMHSUuyQVF55Ff31hSGzNK/hA+YdMbuyNk9mD+vvDpuSL4wvAyTpPV6ev?=
 =?us-ascii?Q?57ijIr5FUeCKYSR46257zuOar6Py+4nZNKRlNJce6/IV5VufESWxAF/BMznB?=
 =?us-ascii?Q?puhoTN4CpMAKBU0/S5hKsUI3+t78TjWnT9Y9mGkcBSUZ9S5ecsliwrfuK3EP?=
 =?us-ascii?Q?CPnqcL1ruFB6bu+q/ac6VBamBCs51HKKa+QFB2FVa0vulf1ch7mxw70yjd59?=
 =?us-ascii?Q?wiUe9FAvQp2Prm37N9aTw1hGQLNUDFsjWeVfAnWSEElAiUPE1v2wJWj6Aupk?=
 =?us-ascii?Q?P37a+h0dMU10Hxya02BriHfGIwpKzcqttxuKQgY9oHHGA1pwFIZMwgzjTpfw?=
 =?us-ascii?Q?qubi7J7dcoMelKLXHEEsuRo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7907097-28e2-4381-4d4e-08dd6d0eaac3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 09:06:31.9635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5iC3J7jdcUKxHJ9vZIrDhmRVx73qQ6wxUMYh9+wUpPDTPNNjVZArETxkEWXUNAn1PV9hm347HQMCSqn6rXqJw3zjF3A/C0ST1fJytjjG7436V/CeMCsN6pIFrNhOrTH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9060
X-Proofpoint-ORIG-GUID: EKSMQPRf6nifrkIioppJwnAWM3jQBkxO
X-Authority-Analysis: v=2.4 cv=etjfzppX c=1 sm=1 tr=0 ts=67e51519 cx=c_pps a=clyc6YhGvfCRRXf4btgSWw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=jo-aCNbwI8Z-XyvCaKIA:9 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EKSMQPRf6nifrkIioppJwnAWM3jQBkxO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=930 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213715

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

When multilibs are enabled, building rust is failing because of the following commit
https://github.com/rust-lang/rust/commit/68034f837a39387e49fc7d7c5b088f5372a1127e
with stage1/rustc cannot able to find dependent *.so files. The issue is
been fixed inrust-master with the following commit by passing the necessary library
paths before executing stage1/rustc

Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/139d6ba054a1a4cc5fe64981ad46fd5547bd4916]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../Zdual-proc-macros-additional-check.patch  | 31 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/Zdual-proc-macros-additional-check.patch

diff --git a/meta/recipes-devtools/rust/files/Zdual-proc-macros-additional-check.patch b/meta/recipes-devtools/rust/files/Zdual-proc-macros-additional-check.patch
new file mode 100644
index 0000000000..6bb1738d05
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/Zdual-proc-macros-additional-check.patch
@@ -0,0 +1,31 @@
+Fix bootstrap failure when multilibs are enabled.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/139d6ba054a1a4cc5fe64981ad46fd5547bd4916]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+diff --git a/src/bootstrap/src/core/builder/cargo.rs b/src/bootstrap/src/core/builder/cargo.rs
+index 066e6bf53f..a2f6fac4b1 100644
+--- a/src/bootstrap/src/core/builder/cargo.rs
++++ b/src/bootstrap/src/core/builder/cargo.rs
+@@ -646,7 +646,10 @@ impl Builder<'_> {
+                 // Build proc macros both for the host and the target unless proc-macros are not
+                 // supported by the target.
+                 if target != compiler.host && cmd_kind != Kind::Check {
+-                    let error = command(self.rustc(compiler))
++                    let mut rustc_cmd = command(self.rustc(compiler));
++                    self.add_rustc_lib_path(compiler, &mut rustc_cmd);
++
++                    let error = rustc_cmd
+                         .arg("--target")
+                         .arg(target.rustc_target_arg())
+                         .arg("--print=file-names")
+@@ -654,6 +657,7 @@ impl Builder<'_> {
+                         .arg("-")
+                         .run_capture(self)
+                         .stderr();
++
+                     let not_supported = error
+                         .lines()
+                         .any(|line| line.contains("unsupported crate type `proc-macro`"));
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 28f5aebbb4..ee23e5aa8b 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
 	    file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
+	    file://Zdual-proc-macros-additional-check.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "e23ec747a06ffd3e94155046f40b6664ac152c9ee3c2adfd90353a7ccff24226"
 
-- 
2.43.0


