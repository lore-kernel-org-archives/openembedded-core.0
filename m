Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1538C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 10:21:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10409.1699438873075239182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 02:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q3gs3n6K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96767f8fc1=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A89lDt0022057
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 10:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=HJELmSAshkUSmWxybR
	iJrsi6cgiVCT8sViaHZAb33e8=; b=Q3gs3n6KPTjrxmMscvw3xKjdqY8aO511tF
	W+YS6WU/+jiKFSRxRcS1b/nbTZ0dbIVSKtBg6ScyqRsKDbGFFdleWBvqZppPLjiC
	00ohICqCizkujxV1qELpcjbBP6Wgdzb/6h1yrATyvrnZ97/nMrYSI+xCCWi3/681
	J6nrcKbIj+8y16xzhUlWct14a0GUGgkhFYn1K46LBsHGRilM2F8aKU8PtoO2NO+d
	L26dzoWsXkDuvXTNqjgoQCYhgTLQD7UICuwbHBj3KbhszmLFwI53YOcf1TnTBIHu
	QpyndoCTCdm6qpYCpyPzP1ite8CIGeduT7PzVUf24V/WzHYD/31g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w3t0j2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 10:21:10 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A8ALAWf031712
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 10:21:10 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w3t0j2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Nov 2023 10:21:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdh00LRYicB5xhAB+wAXNxdeIoJ//0kOMQ/tvVBU/o8GtjMXgBs7W6PvbeGLeKjsWKrewLUZP1f/XYzxlyyYOSoWwpW581Vi9+1j1SLWbU0tBdUlrb+959YHNuBQoYFkPbzznKZGZb0ORsabKZGxUSSqeziFnkOZZY7NX2m64vCutlZi3Bh0py1yfMKIFgMf2J9xPyr45CNIoL6cPKPBYHPqsT7XChpHSaDHVDbqGuFczaX+WZU/82r3PrBAlo3CUFGZzUG2cX93XJRDg0vWWhNvb/TtpJkA9Ok79Uj3huM/43jQXdWgyeIuRCT7EO0sjPQFT1qNJca0GWW9LctfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJELmSAshkUSmWxybRiJrsi6cgiVCT8sViaHZAb33e8=;
 b=Je6RWpf8xI/9Jdp9Z084UrVzcfa2DKM9IaQA+SiyQIVznwAOCVzy5mjxvlBxyMB3yv1KLcSwKfbHik2FefA74+voK7OBQUX0s9pY/6C36uk8DGALCqJK8baJL/aTpNOzGLcq8d2UnaBMKQ6YG+jBI2K3e5zvKqs1xkhCMEyWPY1ld9nr9zk7AzkvwgyG73SSOwrxQKs0h2guKqyjhU6ZmsT4CS+r4BRqRe6wRqqs82Is7iJ7VELJBLiVuHSdDqVpimEw8Lo5oaJrUXwStflF2M1h/1uizgFIHUBDnaIcF7dB4OLsRxaifxXuWfB5KoHu2cuBSdzOtr67+Lsr+ELiVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by IA1PR11MB7365.namprd11.prod.outlook.com (2603:10b6:208:423::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 10:21:07 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.6954.030; Wed, 8 Nov 2023
 10:21:07 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        raj.khem@gmail.com
Subject: [PATCH V2] rust-cross-canadian: Fix file conflicts for arm and aarch64
Date: Wed,  8 Nov 2023 02:20:45 -0800
Message-ID: <20231108102045.3190366-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0165.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::20) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|IA1PR11MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea60998-bb5e-4ccd-2846-08dbe0446b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E81M7oh3kKWftIZg5GYdIlUSi8TMXD6VCXJLCcbL3BLUMK20j3UD3SAqlrRreViqneSd7oqa0gRbpGFQfoZX9b+haN8ANuUSCH6COeJmdZHvW64wGXPFwFRcmEAy2/v2+S0TLXvYCEAggYdt5T8H/dWoD2Jj97KHguQVapU886TN9somTM8pvCl6qPwwIiUB4wdK/D3KavlLDGZtSKxg3/B+vk6Yif3mY6LT3JQ4quktN0DprfKznXkE26YCGctuZC1mcPBdQHVR81Z968VEHpdLSWX7cd/inb7cZ3G1CZstoaQGUZZkOXoXvBFL+WWDFKd6QkRwqxN5kePvJJWFpS7UcSn5Kan1wbUyS+SgRrapk6pq1hFnVW1ey1Ei2zyZjberLiPL2+2xZzTfXFItu0+BQKSG/FhM7wdSBGmyPKiMO+Iau/PszFok4DGYWtgIB/wGGqwxXjOmautsO5LYpsr7po/0ioYGeDxfd7puBaQoDPZG76N/nAisn0aWM+R2RMOoO7rbBHf1VO9qiJUvx/Vmu6v9rXcuCNwWO4WF9PtjV8JAA6geLQguvYFe8jOcl+YlgHo0v04+GbesFz4FsADszLGhIdQcA2EDQSZkevqseBltsD1TJnucJqby+3vC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(346002)(396003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(1076003)(8936002)(2616005)(6512007)(9686003)(26005)(6486002)(478600001)(36756003)(66556008)(6506007)(6916009)(66476007)(38350700005)(316002)(66946007)(6666004)(52116002)(8676002)(4326008)(2906002)(38100700002)(83380400001)(5660300002)(41300700001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VMcOWc3TwRtDmaBcaSQK7HzG1etoqFfXoUj//8I6xDD+ZYnt10Wz2xYVoGh1?=
 =?us-ascii?Q?ovSmsJ0Axf4xA9oVD1AsAHXjvPStpyXuzR5/Ht9ofv9gExUVEmqG/sbRvxn9?=
 =?us-ascii?Q?A/6cf9DkCENL1oAQ1PHsPDIl0A21t2exMCbvTNe77I/KcCkKnyxB+VmZRns4?=
 =?us-ascii?Q?sFiOauLswryXTxVHIhFtWTV/C8l3+HjXXJMAhwL3OuIsicpZR+fsuwBMy0dQ?=
 =?us-ascii?Q?bnKP8onqbJ29EYM5whn2n2tE/BUlkjQ28NNpGfAvypMnH2lWGhBuMEc/OPSU?=
 =?us-ascii?Q?1zOZC/3f7+YVaC2m97he8iGJ6MimPUxHi/VIKRDlSigMard1ExGwGrpFsaZk?=
 =?us-ascii?Q?CzZ5OpPRZPsDEYg3pM7cFcuZ+lWLIjG0ZlqeOntsE9OU+QZGzyKCN6K9syGZ?=
 =?us-ascii?Q?0UCWxKdd7KMqIr97VZZsb68pbYzNeSCIDL+ztL0g75LuTQUTUgGM2DE5l8hp?=
 =?us-ascii?Q?yAzOE8kkQkI0ubWQOf0s9z6FcwLYcM/v/RXY9NyaV+MvGTyyfhnsdspFjav5?=
 =?us-ascii?Q?rcWTTcKct0t7n0Mq8tjsDiJFvLPHkSmqV26sswzQYzOPT1ReCD/dDFD+jQW8?=
 =?us-ascii?Q?96nymZMlczDQAILeHnDdoqlWXVYQ1UVRIG5R5HnFW6vahc3ZhdK+FEn+UZEu?=
 =?us-ascii?Q?7ATFSimvqx1D6VGCPbQKFvTy2Swuk1wBKmsvIqzdnD7m362v8R8p0ythAPdV?=
 =?us-ascii?Q?R9zXqqW1erjZE3FCx25fm2QD3RFD5IpVASDCXhJxTU8zir27HYIjPU8Rovef?=
 =?us-ascii?Q?mbpsWRlzS13RRSlUFbgP3/FU1fnrU8pJ1XxCYlmEuVd4UZO6ml2Z7C5XWHgU?=
 =?us-ascii?Q?mJ/VFLxtnts74uiysEU4Io1PFTKGy7yj0j68Abub60Becp0z1HDWRUoUhYSL?=
 =?us-ascii?Q?V7gSWg3HiWb3L0ogC2gtvVZziIabTlxLpAUABA2zbtIU+70zgvJ6Vw8azw6U?=
 =?us-ascii?Q?zmu4XqHgUAXJUifTNRao/Quc6tptWEdynGLe04hPtZSjEo8Pv1P/v5Bl3ot+?=
 =?us-ascii?Q?jUVBXrvttNEXX6zEwS6f3cDwFFCCZUHCP3dFNtUgga3PCzYfxpj0x3CV3lMs?=
 =?us-ascii?Q?VWD7clYlALGYU7dWFxql8mbh+n2Wl+RxfucJ9oHmqqTdfA8AEleKK6F4Izuc?=
 =?us-ascii?Q?75AbzRtnYWIE0lObwSmb7FF5S0duAo5SkwlBCY5Oih+o2X/stwJlWhuUvruL?=
 =?us-ascii?Q?AXiF66nafnOOrC3fNDLq35wi/pRb6xzsJLpoz5168CXb0NVNZcm5pRNfV/zS?=
 =?us-ascii?Q?zxzn07mifv02kS5VNg+QUuIbpqcorF6S70hpVSwk/vk7jATojbdbkN76gDhB?=
 =?us-ascii?Q?cNc+vOYvv5pW9OljeFXmHShdO1V1p8mqpmCFhhEaY2J+f+F9KDgo/KRqzlbl?=
 =?us-ascii?Q?xZqByTnpcl6m3j4hFo+T0z3SbTHY/9OH8Y1SBe+/VvzMaTT9qk2m1ug+Rsum?=
 =?us-ascii?Q?L+ZLRJ9cBb54rAg1SQHZticFfG9JepxlEaN1V/gB+cD3zWZrTx6+W9er8IYV?=
 =?us-ascii?Q?M1PrFWgZUZKkKb7uBLJTKQAjvgocVBUeBsQTSPsSK/pcoJlBDfuuA4P/k+PN?=
 =?us-ascii?Q?2rp1Mt5AMLuiqO51kWPh477MCUCQ6ETod6EDyLJykh3SD4mQYQiR/0FEXzz1?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea60998-bb5e-4ccd-2846-08dbe0446b79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 10:21:07.0150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KymTeS6AWV3LOAWH3RIVVpOfvawtOpsEOiFOLGABYEZshyn7DfQ01tOZeTLvqPkYEYD9/C191UiegOKftDPXqclA659sPmhdlb/HiT0GGeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7365
X-Proofpoint-ORIG-GUID: zZVUerXJLrl_bmEF7C0m215l24SUl1Mo
X-Proofpoint-GUID: 9HwXUdmllTUYCk8TmXvbJdBE-ERNoWDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-08_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxlogscore=769 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311080086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 10:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190311

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

[YOCTO #15061]
Rust multilib sdks broken because of the conflicts between attempted installs of rust-cross-canadian for arm and aarch64.

Arm and aarch64 target architectures are trying to install cargo.sh and rust.sh in the same path which resulted in the issue.

The current patch modifies CARGO_ENV_SETUP_SH and RUST_ENV_SETUP_SH macros based on the architecture.
Hence, creates different file names for the environment setup scripts and resolves the issue.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../rust/rust-cross-canadian.inc              | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 7bfef6d175..9efc2389bb 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -54,6 +54,18 @@ do_install () {
     mkdir "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
+    # Set up environment variables for AArch64
+    if [ "${TARGET_ARCH}" = "aarch64" ]; then
+	RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust-aarch64.sh"
+	RUST_TARGET_SYS="aarch64-unknown-linux-gnu"
+    # Set up environment variables for ARM
+    elif [ "${TARGET_ARCH}" = "arm" ]; then
+	RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust-arm.sh"
+	RUST_TARGET_SYS="arm-unknown-linux-gnueabi"
+    else
+	echo "Unsupported TARGET_ARCH: ${TARGET_ARCH}"
+    fi
+
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
@@ -65,8 +77,19 @@ do_install () {
 	EOF
 
     chown -R root.root ${D}
-
     CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+
+    # Set up environment variables for AArch64
+    if [ "${TARGET_ARCH}" = "aarch64" ]; then
+	CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo-aarch64.sh"
+	CARGO_TARGET_SYS="aarch64-unknown-linux-gnu"
+    elif [ "${TARGET_ARCH}" = "arm" ]; then
+	CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo-arm.sh"
+	CARGO_TARGET_SYS="arm-unknown-linux-gnueabi"
+    else
+	echo "Unsupported TARGET_ARCH: ${TARGET_ARCH}"
+    fi
+
     cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-- 
2.42.0


