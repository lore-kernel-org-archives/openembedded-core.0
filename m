Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67577C38147
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 08:57:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12194.1702717026667621764
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 00:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UNPux9iP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07146a665a=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BG8v6ZV031688;
	Sat, 16 Dec 2023 08:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=iXXmicSuP1Sz+9uYJF
	uhwEyYjXOUBowijYl/mhg8fvE=; b=UNPux9iPKWgCixWKqArzVbKkHka5Tqug7t
	IWZEMSVD3E8G3K1+4o/fO+yN9GdcV1TQ4O/m5W+3mmhOLYFtAQ6w4PyD+pvKGTF9
	O9mheIYEA3YfT+oVKArsQi+DtP9iUVQTODQhCDoKDU4DctB82VmaKWCnCr2diI/u
	Xac7tKxRwZOYnxQE/6bHxLeckp0tpQTuJbnKkF6VOnD22m1n3dfDXxcAz7qmz07T
	vUZMTnmXmyN8jHTlXgPGphiG1UaQqF/truJoApDpSwdo0XymtGC3jyVehBHgmPCA
	fEk1wpcQsnCWbrOZeEUZqvZJRunJ5PPSlY6r5PB/neTOi98Cf0Jw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5r6a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 08:57:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvmvwsWPWDvE4cZZpdPJmeiFr/6rgdRF8zn7FCjTbu4dOvkXNPF8rjKt2OdN48fHqvRaDuTZfR8JSi/3lluIFehV90bjOZ2nRiuVFFIxYmAKHC/Rfi7+xezaMnK2UtSLeIMnwQkXNdMKbyngOIVFOz0FX2LHaGtW6WnjG7elGPkkWxLBAUuN48jYVbVpSql6D+0s9F4cImhETjAQFS42mHH2BSkQglQzeS1KBqQId0R09XHpu2ujt0nGlMMGxPowt2hU5c9zlQr4Dvq3bPqX6S9SypAe9fwD1jbtRjD8KXHCoPLmNeczYAtKwiNfMs7UhSxKgTfhokunl6r8zdCQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXXmicSuP1Sz+9uYJFuhwEyYjXOUBowijYl/mhg8fvE=;
 b=ffxruMaV/Z5nY+6s2GeZIiV63WOTpMefAw5tGxdS4XO6lf+/bNrhSJAQikEGlN+YL2KhNO7wzj8O+aTbxsRHrbj9Z/JSk0RPm8DrgEbpgPQUkaYqRxt+JdL5MiBtKlhNBmaDxmExs0N3YJMkh/5Mjc3DU11PBEXThZy1mE4B5c4xUNUBsyr/f2gNrypgwOpZfqDxXkSASUqD4Xzgb5Tpx1S9su181xgBJAFm4k1kPBWOBw4M1a8TKnRE3C9IVlhujitjEzE/HnUnJcpOgYnstxZV00nD00SqWqbQMkgaUOV9gw6uxFx8aL9JQjT6ipsyeeMxEtI8N+JMW7prrGIpEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Sat, 16 Dec
 2023 08:57:02 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7091.028; Sat, 16 Dec 2023
 08:57:02 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH V3] rust-cross-canadian: Fix file conflicts for arm and aarch64
Date: Sat, 16 Dec 2023 00:56:44 -0800
Message-ID: <20231216085644.3202920-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|SN7PR11MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8e30ff-a0eb-40ab-86d9-08dbfe14f834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aGGnt1t2XOXZ6itjXpiBwG24YoALsEi3aBDmt2At0Ts/f721ICb6mooNmUvh+MVQg9ZH16HMADRBTx1RaROmvLBYqPgok2eXDBRPlnZolZEOVQTHtAP1rWVUasSV7C0X5vDD3q+IJ/FtLOUUkwvQxiVrd/GYnLqDqjdY4OPCHjMaM02nBNP1cccGS3IIrnlrm3D9CSSuXGmq0qkuEeKFy62P2t5kqdUngutRAuW1JqvUTIzDCmWuGbATZDFphgKdZbQPkO4DCJfNyM1R3QXzDFPLwPnJ/K3atM4P0WtQ9MuBZ+RnYUxC3t/soJXwti4XJaq+j1aRafwgpPkRKlUL5UQCUfvb8Hlfz9r96M09YAkqke4kK4XkW4YpkaU+je5TfunVgbGsLTkNvqRHM+p4bkAUYnVeybkTg2qnKSvWHpe7RCySKutO3YujUTIqAWIefVvJlLhEfdLXUr87YTdZD6FVVbcArL15A+l0o4yB9gO579gnagVn0wqhKbFWoqCfH+bcncxm8aTT8mYZfudVAXboBaZLH6w2z381MqI6vpZh8OqOjlbPnG+2yBY0tdqKGwCN/mDVXug7f95opdcE45cMXz/vgbtYN7QjrsaUD2nmyRLtTX0wjKXL1z/ccLdq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39850400004)(376002)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38350700005)(316002)(86362001)(36756003)(38100700002)(26005)(83380400001)(107886003)(2616005)(1076003)(52116002)(478600001)(6486002)(2906002)(66476007)(66946007)(6916009)(6666004)(6512007)(6506007)(9686003)(66556008)(8936002)(8676002)(4326008)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QTy4wec9k5DcL/n3yM2NFxBDddvaS+OOgx4/9TyFUZBVZHJOpcZSKA2bHtoJ?=
 =?us-ascii?Q?bAEZevXnv8C617+C78ASq+vkJ/Ffhh6foANUBNHanWln8XX6GzK48gUeMEzc?=
 =?us-ascii?Q?phZgaP0Npfa010f2AJKFQkT/fGCUY1OpkPXhSjVpLUelh0ZB4pwdOOF1y0VN?=
 =?us-ascii?Q?gOWNum3J1rf0qiMqLbs2YReKVMuTRARaAZL6+KLA81St2jekAYol390mQCS5?=
 =?us-ascii?Q?B0wSiBj4gBRaTQ5iJ5YaSaGx3CFAAaMXfphGmMbZYjwfGg82M1yluT7J6Zvk?=
 =?us-ascii?Q?cN2BWQIAoBSdBU5NJTPfYvzVns4w1oaZK2r0MUqLFsvztKkUDW8tQpECbr2J?=
 =?us-ascii?Q?fKJergN2Z3gRyH5gBGf3miaZatatkXYlHDrUKMroUq1RtLhxWk6qKqIAMgiR?=
 =?us-ascii?Q?dLiP7jMTvceo884rpAMEpjQxUvqwChf31gS8t4nfa/VUy5SLOG+oCRrUE5TE?=
 =?us-ascii?Q?PJiXbMmlJa6gr3Ad9C13Ewft13/VO8YCz8wvgg67QJpTsISRk3b5Git8h17/?=
 =?us-ascii?Q?DIp2pdYwEzAnHjD9ePmSyo7+HjyeWFdGUSfQZ+Q0HoqM9Qa9072f4FHQwc8h?=
 =?us-ascii?Q?pWqwXl+LBD/xGc+/CEbdLMRWmL1IZbx+440vdhf/q53vYdcwr8+eA+iGcgoq?=
 =?us-ascii?Q?CugAaGukaaeFhWy85jm/1sStihy37pNK3067eBKPT7yge1nrrZcVRBGv+u9Q?=
 =?us-ascii?Q?AElVzJVzuPMa+LDwAxIkf9KdU/k/gXzCc2gde2EZllfYkIv+0nt0ZotgH2Nw?=
 =?us-ascii?Q?f4GO3G2jRX/9U9IJoXW6aJRSH9NQ7ygIfZfcmWMAT4cz5qVApnv2xt+cz2qy?=
 =?us-ascii?Q?C6Y4xkqdo/D/IVF9s4L0+x/Vcxmoc0/YUz7z+GBTVlVpHcH1AcheUryF9dM/?=
 =?us-ascii?Q?J9WqT7lNVtNbUUtczrWrPE+SjefIbK4AMPFWOrqyuotwvrm0LNeaHE2S0o7A?=
 =?us-ascii?Q?CnPLVfsnGPFqX3Fxs7VPMVUvrzSjt6i1L9PBhzwpIUeJiEe1M398srxyeZZv?=
 =?us-ascii?Q?g4cyOrxjtR4U44kD6Ji3VAaCC8DyT7B9ZSFvyrG0t5YIx7whxIMyyVyyKNYi?=
 =?us-ascii?Q?c8Z+D4XNaMXP/vNiVChY000jl7py26BDkxhb8Z773Orgg4ww4CL7OivFIV/3?=
 =?us-ascii?Q?Xye46dz6yHvq6yyweulreO8Ew02oTVQFXs5b9VXIuaop77RGOX0rwVORfpSo?=
 =?us-ascii?Q?x1f5JZqHUdjpacdQz/aJLTnNpUwST3nweSEJ7/UCTEWLnLJdgMBbR4zmjeQD?=
 =?us-ascii?Q?DfZKozMXcydOeo0hMeKhdkiKOjhvrnwfkNYKSAdOrXbfQCHPwLEaV9bdX1fw?=
 =?us-ascii?Q?hU2FPEMQn8LB+ECZY++Qbbh+uUGNTQ28u+jD54Xt8MYsuXe2JuXTGve17ZbP?=
 =?us-ascii?Q?PCTffKDYX/F6jb9mnjkQwYwxKu7VethpEGm0ABrIqPxAMMiObrP+G0tXnaaQ?=
 =?us-ascii?Q?1kHuGhbmv7mGPpqtqyxHbZMXXyGYUXo/jURneJyauAS9tJxOlqdyeaEGFAqb?=
 =?us-ascii?Q?oDqU3yrURKBQoNXeHL015GmLvrM29C0LVUQ1cxx+L+5m4zS5WVyx5zOQXF6K?=
 =?us-ascii?Q?bTINqKOGTjfWJj0d3zzrjE6VcZiNhQuBllDUBk6IlsVbpVd91l+zw6fWWnFC?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8e30ff-a0eb-40ab-86d9-08dbfe14f834
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2023 08:57:02.1100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WrjdstJvRAdunW5BP+mv0s/pyAgLpkGv8oSw/1cfrVF9858D+2wGMRNEk0E0M4OOlcXrDS+2E95H1IRQgT41O74InuT5FkHZw2U2vrklys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
X-Proofpoint-ORIG-GUID: 2txU4hwafeNbi_BwnbgjVe5TT8DyCTyp
X-Proofpoint-GUID: 2txU4hwafeNbi_BwnbgjVe5TT8DyCTyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=580
 priorityscore=1501 spamscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312160068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 08:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192555

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Rust multilib sdks broken because of the conflicts between attempted installs of rust-cross-canadian for arm and aarch64.

Arm and aarch64 target architectures are trying to install cargo.sh and rust.sh in the same path which resulted in the issue.

The current patch modifies CARGO_ENV_SETUP_SH and RUST_ENV_SETUP_SH macros that uses MLPREFIX based on the multilib architecture.
Hence, creates different file names for the environment setup scripts and resolves the issue.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 7bfef6d175..9996d3d4a3 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -52,7 +52,7 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${MLPREFIX}rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
@@ -66,7 +66,7 @@ do_install () {
 
     chown -R root.root ${D}
 
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/${MLPREFIX}cargo.sh"
     cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-- 
2.42.0


