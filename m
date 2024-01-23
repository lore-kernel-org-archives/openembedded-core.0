Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9BEC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:10:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7152.1705997444152383521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gOJUnw1s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MCfXe7020788
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=OLdP9IAacWpoOLY8aCWfzibkyIr8I34+mCvMuSg9+04=; b=
	gOJUnw1sGuqO0JdjUJkdHFWszh9vsCCiy1ut3LTAqPRCrmsfvIIGHibcffnsPwQa
	gi1uQxlGQmpUB+VZ1YOwQNdHBEmn4xdC8tCUt7jtb5sbE4AWe6pXjzsnDfvhzlT+
	ZuAOHFmPsZLHGT/h28nFz8Gnu7Mf5ZJEpX6S+RcRkoE4td6AjkPYK6P6BGx1CQIg
	buR+ki74SWbf16I+3j2P2FNkjQ0GUf+nQ39L1UT3HIDvYDp91rumEtqvEtX0mTSd
	Jb4b7geSJEEmHfNJL5/ttJH/qO2X1NBVyYv8CnGCRud6x4ggP+ov9gUtA6Te6yJv
	XiB+Jnw2LIPmicPezPPiDg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyk5t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLhl7mzMdv3DGid2gJuu1HZH9H+/XSNXmbaShOWN4fufkvbtqjJKwtqelhFDN7wzXPJNMrdQeSkOYTUNIgaSNfHx/R4mVvpiUkRLaXDb5f5VGjlu//l3sl1WTxXa2qSjRC2dPRzzamrK+86/xPW040Q/BW5cp/xsZ/zCcnETdJICc5fvTQFCTrE8Jwp218Bc3ys5hIB1fqVBAlxvkNnY4voT+oOQkrrM3XctwenbQaRH3xXhzFyhQhifa8s38y1yJE5+oEJx6L7AFOzrTqNb9IIk7qH68UCNZ3+6Ww7gNYsgvt3Ih5RYQvwmodMmgHFmv6ZqtGY3V43CQqu1bRCNaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLdP9IAacWpoOLY8aCWfzibkyIr8I34+mCvMuSg9+04=;
 b=Xlhds+w4Pi4qvQC2qK54vrPfszDeaz9fFnc/vHkHgx1f009GMCfu685fuB0df0qmBBEm9ShW+DxqwAoP61/x1MAz3i/YVudbrFlRo4zinSxTl6cx17DXMT3NeBYqUKc1kgVYCTxQ1yVVlVdP5hi9SkX+JMPGjKlQIcBI0gwlBKAtYGwFGZ69NkHc+NGOfs9rox++VLqRK9IgF8fvFP1BYrxYfxfUC3hqxSJ9+BIWCIM0bNBjDR5v6ZUyh/RtRvdl2K1sMILd/xWLaHDT2R3h/RqqbKNdmoJvGFWExg49YQboo2rjUhdyZAtekXoteyCY3aN02VyY7jfr2ARxavAgHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 08:10:41 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 08:10:41 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 4/7] rust: Fix assertion failure error on oe-selftest
Date: Tue, 23 Jan 2024 00:10:03 -0800
Message-ID: <20240123081006.3310715-4-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123081006.3310715-1-Yash.Shinde@windriver.com>
References: <20240123081006.3310715-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f69a766-c874-44d6-2fde-08dc1beaca9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lm4yTOcSF7lI2TunXSTYYf4PVq56PWsvIYYwvr7V3TYR6/K7N0dZ/2Cb4iKkLY4yRUSax5d4vXtljmkgRffp52EznVIR1PLOdrcSoD5dcAh43hZRXUg2cekyRMwjssliUEc01KcYF9a+3+RVUtXl+pAa36NE/eSxe2a+qivwrnqY+L/zQTxVP5ow2vcZViCYfLe7dSCq9A9xGWd242uFFm1fR6o9gTDkCmrUvs8LIUusoMpMR4tY7+C+c1EUwFnd+KI3HtlV99FNgFLGrQamb2aSlsiSMe39uDUvCHRz36fwvyFg7dZHfAIfS+gYBTdekdIPXHh9eTo4PwYeEdiSke1x84WGj5qkQ7eGuqgUU10qjeTLsqdGg17rOlQmiWToJA/z9F4S/6KsiMIAqVCqmu4+Hb8RERixSIvuJMMTJSjH1AY1W4arCdUkFFHIGBOFsyCkjPjSZ/dwo7geP5uHIFriekihRuC0MUZPcz6rzcwItflARYNXltdagdtFpNlp2q5F1i8WbvF9MulKeHcyFSh3oNEysxq3fBDXeEMHmVyhwV1IAMky4kuEXGZXCNoliYlBJ6A3GH+1hXS2Krxrdv1QlpSqccHATXx79LYcwo4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(316002)(66946007)(66556008)(6916009)(6486002)(9686003)(52116002)(6512007)(6666004)(6506007)(5660300002)(8676002)(26005)(1076003)(2616005)(8936002)(2906002)(38100700002)(4326008)(478600001)(36756003)(38350700005)(41300700001)(86362001)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?33gPHk0HqJguHJsYZxsqKurlJnqc62wAJeYvh1nMiBUUzItpfxnp3872/Rq0?=
 =?us-ascii?Q?YkCTVUAvdzpbwwTCx8CXLAq6SfuRB0+tMDUAeYf6cGpgRq/CJePx0sAcooVL?=
 =?us-ascii?Q?LK4cqUysBSKjqLhjAyrZ+I41SerK8ZSVvTZNaMHAMgKRS3YwaObe6WrQH1IE?=
 =?us-ascii?Q?JizTtvXqZFATUNRXBD1nqZUY06I5L0ureHEF+uQS5fmFU7LA+s5v8wBMBi9i?=
 =?us-ascii?Q?cDnm/py8vAMlQDbSQl/rxKhOTy8T6DfeRZjQXYBQCn3d3b/5Au9YX/XRPygA?=
 =?us-ascii?Q?bCbNZsIvqLO9sztq3hqyjJt2YjOPPIWxnMsXlCi6AJuyDbtIswh/RkBckwh0?=
 =?us-ascii?Q?zRiWHGqfCVkY2pUwTBLX9tduAczSV+RGjPYLcsyJsepIO9D7auzFxgXdc5cU?=
 =?us-ascii?Q?f1YehWyhOTBJWITFzEH2MKEEI6VJgcq9XIqgtPoMZ9Vx8Lb2wAXomo1SE3iV?=
 =?us-ascii?Q?HwORuhkyMRlZ1A0/M6diWAlQMMHkiK1jZXaVkok9r1WvB+Jgo/AF1YMrm+F7?=
 =?us-ascii?Q?gxlTi2mIyTVeFF8WzAvt5AcVPrT1otFDPMSvrD2QJiuA+x4ymtjqazE8eAeq?=
 =?us-ascii?Q?itu8IpDy0WtPpcT0tLbz2Ajwea33DPmuD2kOYGYRgFW0T+w5/eKu4PDh771u?=
 =?us-ascii?Q?+k+6BAZVs5V7R2rhJxsGBH7xQjzACiXTBUm7kVRrnjdK7V0g3Cvca1TmLi7C?=
 =?us-ascii?Q?Ng3ZxgH4GNLnU2K+u2AQ7QN7JBrouVyivgMjFE1pIS1+jBGTo5Td9KDLA7ep?=
 =?us-ascii?Q?9OtwJhjEZBdYwX0TZoEwWErc1ZOaPQulCvzlO1CU4d3ttJ1kuqVtwvj81hf5?=
 =?us-ascii?Q?HBVDcnls3MEj1dD/7DTkhmemiy/oWl7C79uBQCAUrubSbIGLDp2i0JVJ5uVq?=
 =?us-ascii?Q?v2GkH35WObtuq/H/XG53Wmyc//Chbam/+LUlUuAfsUby/XHlV3N5Go61pcCi?=
 =?us-ascii?Q?RCA5TXggdBvN3jz+a/tBaOFykZNF3fFGtmOTrqVsL4oc4jdp+1q4w2LxsR6D?=
 =?us-ascii?Q?4eWTtog1aCY8Ai6aC0d5xYCfaBDp/rRWNuuRyHAezR06zXsT9lpbMRSke9xe?=
 =?us-ascii?Q?FRGkkczcgaDGfTeaYfC5oKytUojRGlj4n7K5vXN3AjlqiathICtX3A/+xOtP?=
 =?us-ascii?Q?ZFGNSSh8Q09f76mE0VosnM45xqflu9A20M7fZj0dePiNXQ+eDi4gOMoXi5Qq?=
 =?us-ascii?Q?NoKrQLsM0h2kpL8pyB8zTBKI7mbgsxyWWKNcucYDgVlVVPULrQTkW4gbt1LH?=
 =?us-ascii?Q?8i0NYXuF15fJeAYF9tE/9bZRRYCnp+nzviO+usdMjk9uZejiamgPwHrt6LW5?=
 =?us-ascii?Q?ThpejXWDXXostqYF5DpHq46ifAqbe8gveTUhK0VimBRufzDPywWC7geNp0CV?=
 =?us-ascii?Q?PYf2ZFXsAgTVRybQ9tvpxpCARhclAkCcCXYDLDK9xru8v0WbEP+UNrR8+BHj?=
 =?us-ascii?Q?A4+Gy/EUm3vMGuOSgwbJo5ws9wzDDbkJirnHbq80bR9QGOqBo5aOkdDHulbq?=
 =?us-ascii?Q?v0ss+TP32VfKHdAUmdNjufe1pBgxiCAntvce5raZStPxS5XZxILTKO9VcS0Q?=
 =?us-ascii?Q?76zfLL8ngUzJmcB+K6GYGO9cOn5/lVgSjBNFlc7z2ICKCpXpyiyyFg/DQNWj?=
 =?us-ascii?Q?Yw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f69a766-c874-44d6-2fde-08dc1beaca9d
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 08:10:41.6422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zJ0LDZLH7GbCuPWHnqO+Pfl/AmcPeRgImLc25AWCYOeZS5sDdWYCANB6fNu3YhsiltQtzNBuw2d+Poy2kdSoAYfPCUXRB/si1rBn8i06SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-Proofpoint-GUID: 6UqbN7MpNVy2wqPvPnv7H0J1JT1QBoUF
X-Proofpoint-ORIG-GUID: 6UqbN7MpNVy2wqPvPnv7H0J1JT1QBoUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_02,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=817 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194209

From: Yash Shinde <Yash.Shinde@windriver.com>

    Fixes: thread 'main' panicked at 'assertion failed: `(left == right)`
    left: `x86_64-unknown-linux-gnu`,
    right: `x86_64-poky-linux-gnu`: Cannot obtain compiler for non-native build triple at stage 0', compile.rs:1474:13

    Add correct target value for cross-compiled targets on stage1 during rust oe-selfest.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/files/target-build-value.patch       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/target-build-value.patch

diff --git a/meta/recipes-devtools/rust/files/target-build-value.patch b/meta/recipes-devtools/rust/files/target-build-value.patch
new file mode 100644
index 0000000000..23e8c76801
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target-build-value.patch
@@ -0,0 +1,26 @@
+Add correct build value for cross-compiled targets on stage1 when
+bootstapping rustc.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits/b888e2f82b9dbe81875f50d13adbc0271a9401ff]
+
+Signed-off-by: onur-ozkan <work@onurozkan.dev>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/test.rs b/src/bootstrap/test.rs
+--- a/src/bootstrap/test.rs
++++ b/src/bootstrap/test.rs
+@@ -1489,8 +1489,12 @@
+         // NOTE: Only stage 1 is special cased because we need the rustc_private artifacts to match the
+         // running compiler in stage 2 when plugins run.
+         let stage_id = if suite == "ui-fulldeps" && compiler.stage == 1 {
+-            compiler = builder.compiler(compiler.stage - 1, target);
+-            format!("stage{}-{}", compiler.stage + 1, target)
++            // At stage 0 (stage - 1) we are using the beta compiler. Using `self.target` can lead finding
++            // an incorrect compiler path on cross-targets, as the stage 0 beta compiler is always equal
++            // to `build.build` in the configuration.
++            let build = builder.build.build;
++            compiler = builder.compiler(compiler.stage - 1, build);
++            format!("stage{}-{}", compiler.stage + 1, build)
+         } else {
+             format!("stage{}-{}", compiler.stage, target)
+         };
-- 
2.43.0


