Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4BEC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 15:37:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25011.1709912227326306533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 07:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g9Fd+5Yj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=379735740e=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 428CXOOc017416
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Mar 2024 07:37:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=1XMnG5XHTq8jmt+IFU
	jKrjLqV7Fe9ldYwqr5rYk6xwM=; b=g9Fd+5Yjr9N7OjAZKqmLN58X+Zc8GwI4GW
	TGSIoR0ERjTRN2p6U6wCHOkAT5kIUf6uUVTH2oMnv3glr/0TO1QnU3VmXjxNXSgL
	938bU8wYlSC1pQy7l4sq116HNQwQz5AtVQF3o/nyD7S9LEFeo4V7FsEcZ4PGibU1
	C+s7MSomsTat7QXMg/a6u0vpxAW1OeIPXsGOYL4rH3GX2cKOeN5palIRQltD0wyC
	VlLnfOIykC2Kzm4bzNmXLaiq80AU0FIOHA5TjELCy3wjFI6VLoKIu/rkYIP4hWVG
	rgLeldzezaI5eKvpocwU7WoZUYXpbqH4zJRCIMT5Bpu9ftoT8RSA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm5txh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 07:37:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htScqvqjIoGPz5idJNjQQYNCH5J0h7f5Cbid7mSgJwF5dgVv4P0+k+oasmWJJQeXykaYcjXGBYnia4w4OMMBkRuoPXHTNd+wqVqxE8bzdpkGsfEqJ/OzyK15OHJECwPA967ZV9/H9wl2QeiGo1SHAGqDAxgcwrgQxZGFm5S7DuESPUizb8ZGHsm7VMJpdqWMl8U8I8WwSY6WijeDvXk/ouiB3qg8jk73A7guT3BSCZgR/BEzhB0ujhviidQhmekC/bouoqpQhC44fXbguM7tnnbel2Em13huJhPhKUowe9wiw6/gAEYoaFMgcLm0atZEwtsyEULIxwwwNYDqOMTIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XMnG5XHTq8jmt+IFUjKrjLqV7Fe9ldYwqr5rYk6xwM=;
 b=jy8waLQXfKIQbc/X7Jr5rDbLBBy4ic6HqXJ0nbndCx9ZpgWS9vxbnHP4l1Vd+/1zx1VXS/rkHpfXPZPbLg7uCuy0lGLNoSn42+Lr4ansjcLWRDFzyn/szbwx/SqYiI/ZwqsbGDIcB/CiX26aE6hUdV/fPievBJFRHIi+R03AmsH7ljXrbF/5zyNquUF1IPStMxJbNbUP+sCn2J8KBV9vho6WuPraZmzllUHZFfulu6IG+9qgwUaV8h5Q+7g5S4SNEivpz2R0OaaybgwpkDJqY+iaV9Sv8RXgB0e/OIB+KbPqMTy/beH8fyBW/lAIKczkoDLRbrrGs7Ipz/O8t4PYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 15:37:02 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::4961:e732:f3e9:f512]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::4961:e732:f3e9:f512%5]) with mapi id 15.20.7386.005; Fri, 8 Mar 2024
 15:37:01 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com,
        umesh.kallapa@windriver.com
Subject: [PATCH V2] rust: reproducibility issue fix with v1.75
Date: Fri,  8 Mar 2024 07:36:28 -0800
Message-ID: <20240308153628.1828036-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 2838df48-8642-422a-cee0-08dc3f85995b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GGBN034kZftgu2ZPIzL84pyCcC1tRSDhOYIXWFe1PPi4Z7Mp07tgBvv02YyB6As2d8dCe4BIfaya253S5BSw1wjbLok6sAHRCc3kLEskyTnzRflosf4DYX8Rqklue4Cg2pNHAEngTFpcfmsi1ieNhaVVhvdbUksto55KaPbFU032pkjnC9otlwEmGSPMqQHSkByKrKgnAr2/pHkf98nTv3kMoJqw9ytxTvnuOaFOsip2qDj4RCPAIkVDZIdiGN5we7+J10ZAb0Lq5Sxs3tpec07rnfrun7NY+2sKMt/ZsbDXBhE/YSTLxNpO+dNSgtqYEF8maP3hSfG5OgvvLEJqq9xcc1VF2i+9N1sBlgceQeuQfxfosX23nV1aMXCI1Mg5L5Jh3bip0e3rpRHAc5ckGA4JMqVBeVfcJNtvllNU/aN6uM50XJ1K3tEXliTEFlRzYPdxDYP1sVbC5Yyq76bb4mqJH+LSeLmEHifIMCAy7uEC+Ydet0XUPEPBaBDA3JAynBV1xveIGZ0WJdFRCQt45JPzRe4XGsVcfcYh9RzJAouHjlsktyOmqMKuE4rgN8d4yEFABM/aFYd9hSckdzYJnvJWhQFVMiPNxD6kDk4qguvvjDk3H6wkpRoRtW2HJ1aTll2w4B7Tz+peQVozRjZk5uF1CuVUeFlo9V/fczMvyOnofFZKRyuj19hnWNCMRlzh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J4ctOrPyVrR4RlhaVYOjwpsKi3j8/0GSNLrxXcrTLGT0xHwbhaTr7eWF2763?=
 =?us-ascii?Q?mN2B4xFzdAPmtB43vJreTXAi28iKPyDJY9K3DksRr1fUrAwZPJ1FhaNcYXzJ?=
 =?us-ascii?Q?TfCG2jYvnHaWKL2epC7U8NWTSDSGy8yjy3ACzBztI+ngF84SJ2LmRFpSeFKB?=
 =?us-ascii?Q?gQqqPkCuUzLQiWYJsILUVMI+L2dKX/rYCjZoASDtdPlDgkvXwLbCRlFZxgst?=
 =?us-ascii?Q?bF/AiZjdpbcTNGoa3hNaQQW5Hgq81aITq11I4BP4JotOZdfEfuNRMRu/N4Cv?=
 =?us-ascii?Q?ltCnG8ucdodklfeQAS9BI/AbBIrcbCii/X1Yea6mg+dY/w2zZtr/w98GX5gA?=
 =?us-ascii?Q?Hw93Q5ZnjdeLKXX63w98xDOKi/2xi+2yG18ByzuvUYuggAvxR9y23Ab/56HW?=
 =?us-ascii?Q?IMpxIbGMa7T8tiA7hoBy+tTeE3CQReBgYc4vtg/ZmIYtwB5NF5PP4L5q29hO?=
 =?us-ascii?Q?OHFgWGGtpSkoGf6UW5ljqyUFxKQIKbhtXnjANCMDhJZpxjMAP9RxofRQ48fb?=
 =?us-ascii?Q?9D2tBo7KDRV995FgqJLZKIFbUcTAUZWWLgGrXLBTYN7LQUQHTwGlfdsRuuRv?=
 =?us-ascii?Q?5LJ4VHJf6pgQ6sA3uuWDvz82KhlJSsh/k5ZuD5IaO1LqtMgnG5kM6++oUiuK?=
 =?us-ascii?Q?HzT7OkKe/Tn8opS//2siWbaPRqqPDVWek7zOEYskRDMZXl0wtfQwlD8g4w6x?=
 =?us-ascii?Q?KI9UGY9189MGBUO2RLnxwYnNwVyxhjGcQMVc47vY7n9Pl3uO4Y76WaD71HE5?=
 =?us-ascii?Q?FHkTw8oVmGwGPWMIbNDcf34BrZLU6C81GctRC4r+cMLyoeltI4JlLUEM+yhT?=
 =?us-ascii?Q?ToXjxzcabSAl0fQhFej+IOuMH9LRl8V0LevsK5jQMVfnzJAUSrGdoQj3Prlq?=
 =?us-ascii?Q?ETD47N7UH/n30weFactq95LHwx6FHPKh5/7SY+k4txMp+s69nxpCXERSLxpF?=
 =?us-ascii?Q?8VeCRSo4SMJ1WqFWvddXJe2H2QTeGGFqde5zkeKUwyLLK+LmWcr0ORK8dUfj?=
 =?us-ascii?Q?qxvGejaUkCxehcmYmzxfIbJ5qOFXh1at5ZyarcwwFINBM/7zBaxXvkRWsycK?=
 =?us-ascii?Q?efUwhfM7oE12vf8cskYhLPskFq07/qGk7hzn+FdbBrdP9LkMTyVGEyr2X7Wi?=
 =?us-ascii?Q?Cs6dp03LIzhsOoA29Jf6gA5uBSvQ1ymSzOLiN4XhhAXTyoVFvN6xccRCgivL?=
 =?us-ascii?Q?I2xQb008CQZmIM7kJ8ZmrGBYytHFPtxqT8voatl8l+H56HT44/BKUml3eajl?=
 =?us-ascii?Q?FlsbL2pB1okfM9U+iSHFvx/0ShrcTMwsSY3xJCZh6HzuMVzn6RYmBGm0e+KU?=
 =?us-ascii?Q?MoiToFZfUy08XiGSjgMstnBVdCwbTsTAcbr2wpvHZ0YNRigfP1/914+WvikI?=
 =?us-ascii?Q?4PtcKm0KLCW97P7evD00f87Yztje7YExgYeDExduHCblulltQOued3RdGCMN?=
 =?us-ascii?Q?nKJBdpveH/Ib8nrnGmR7tACUuUJDzSa+ycxFBp5FM1OARbvPw6amS3sFyE6t?=
 =?us-ascii?Q?XnKTdKBziDcoe6Tz/WThgfajTSGpGPL0ruSTskl/5yq6B+Sgh7WFplic1Kou?=
 =?us-ascii?Q?ct0zLozUSKJ4OCSLlcyxwrafvaNSd/rCvJYLuHsoQlDrf8QrqNM4CwG7+Ztx?=
 =?us-ascii?Q?pAwcRElzPo+SU9jtq9Za3hI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2838df48-8642-422a-cee0-08dc3f85995b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 15:37:01.7524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2lnvTgO+A0dq8PYjOGfTv/XdJeVdRBg59ndHtfo7PGJmRzVSxX/RmqAVDD0RvX/943EpEzIpXdqWuqOe8PKLDMKFRu1OeYniXK4MAc6Y2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
X-Proofpoint-ORIG-GUID: rbw6nGHnjYcY_QcnIGItozI-1k1A-j3d
X-Proofpoint-GUID: rbw6nGHnjYcY_QcnIGItozI-1k1A-j3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 15:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196856

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Patch updated with upstream fix.
https://github.com/rust-lang/rust/pull/121959/commits/a9a979839bbdfec48c75d618ab0dce8a953589b8

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 .../files/repro-issue-fix-with-v175.patch     | 37 +++++++++++++------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-v175.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-v175.patch
index 6840bafff8..fe0507c981 100644
--- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-v175.patch
+++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-v175.patch
@@ -1,23 +1,36 @@
 rust: reproducibility issue fix with v1.75
 
-With 1.75 rust release, the '.rustc' section of shared object libs are embedded with absolute path names which is casuing reproducibiluty issues.
+With 1.75 rust release, the '.rustc' section of shared object libs are embedded with absolute path names which is casuing reproducibility issues.
 This change will fix the path name format back to '/rust/$hash' as in earlier versions.
 
 Below are the links for detailed bug description & discusssion with upstream rust.
 https://github.com/rust-lang/rust/issues/120825#issuecomment-1964307219
 https://github.com/rust-lang/rust/issues/120825#issuecomment-1964652656
 
-Upstream-Status: Inappropriate [patches need rework]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/121959/commits/a9a979839bbdfec48c75d618ab0dce8a953589b8]
 Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
 ---
---- a/compiler/rustc_session/src/session.rs	2023-12-21 08:55:28.000000000 -0800
-+++ b/compiler/rustc_session/src/session.rs	2024-02-26 07:29:15.527577022 -0800
-@@ -1269,7 +1269,7 @@
-                 | CrateType::Rlib
-                 | CrateType::Staticlib
-                 | CrateType::Cdylib => continue,
+--- a/compiler/rustc_session/src/session.rs     2023-12-21 08:55:28.000000000 -0800
++++ b/compiler/rustc_session/src/session.rs     2024-02-26 07:29:15.527577022 -0800
+@@ -1260,19 +1260,6 @@
+     }
+
+     pub fn should_prefer_remapped_for_codegen(&self) -> bool {
+-        // bail out, if any of the requested crate types aren't:
+-        // "compiled executables or libraries"
+-        for crate_type in &self.opts.crate_types {
+-            match crate_type {
+-                CrateType::Executable
+-                | CrateType::Dylib
+-                | CrateType::Rlib
+-                | CrateType::Staticlib
+-                | CrateType::Cdylib => continue,
 -                CrateType::ProcMacro => return false,
-+                CrateType::ProcMacro => return true,
-             }
-         }
- 
+-            }
+-        }
+-
+         let has_split_debuginfo = match self.split_debuginfo() {
+             SplitDebuginfo::Off => false,
+             SplitDebuginfo::Packed => true,
+
+
-- 
2.43.0


