Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996E8D7876C
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 14:35:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12095.1732199696923239155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 06:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105595ae68=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALBhhL1024148
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:34:56 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7wjnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFYWAi5lgGAnNF0PdyzGOf2HdTURTQblv4xUWE3Sz3Aig141LCC+Uedv2ixIeJwY1x7Q7DbWIoWldxCA2Zc/SKwvgVP92RSsz2JdgJzN0PShQK8INzBzVaJTx2yPAOZQyv+UpffoXjd1pzB3g9Xw7QsHbcH8xG8a23pKJRkV9fC/GbV0YEcwOvGVZPfMvI1r09q3IlWc7Bl/OIxtP+rg6NyjM7HBwEb49UeMWQedcsnNOJf7n5XQ4eMSTyiF/ZAl9X7/JCCrFVvNYO5CvZ8qBjw0ddoXOln6zrHNRm7p6b/C7kzRcGZYLiI1waN0y/Qz8vqeETCRnnBYSCy/yA2KvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4ACP39WSYepbaGyPhdf71BkgT596EnD4W5B/xRG6CM=;
 b=eVoUI/HDCBmz1Uc62SCCiqI9J5Jf1QVb//6hm4kxAnD15Zikm5dxp8wRGj/diWqqzXiFDlX4CJqsaL+VRGkEFkC+z3/rh0mar2IS1ztbQMRNxFDwYcGeljp4C7p30L8OuPRWOimuZ32QnCpSb+R6EUO0qg0pHxxYsbSV+WPAyXbLmprkq2lrS6M4/NqdJnm2TQU/22wCa4fb5+Uf+DA1GpjuLlQz7kJDLKkpuWbU5fmNltP3gVfwsNUXTYHjn5QSikgVulalvn12nsqnRJTZ6PnqAKakmNaxzyAN9wUdu+lWJywKueNj8ViGw98I+aWlYBDUZgGYbAyW+qwyCXg85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by CY5PR11MB6368.namprd11.prod.outlook.com (2603:10b6:930:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 14:34:49 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%3]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 14:34:49 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust-cross-canadian: Fix environment setup script conflicts for multilibs
Date: Thu, 21 Nov 2024 06:34:18 -0800
Message-ID: <20241121143418.3142224-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|CY5PR11MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d03c21b-6213-49c9-8812-08dd0a39a70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xeWNySgBGEiLF6/WvsgfRdfhiJKOWh0040O7nWkZo8C5Fd+SccohEvFvy0c2?=
 =?us-ascii?Q?NAcE0TjA/69MhgLIpmIh+ZIaB/Yyr48wUvDFsboZFY31iK0iSN2KnCZP/+lq?=
 =?us-ascii?Q?mWVzMNk6nNj9sJW+/c12goq3KRH4m4ggAu5qtQm4ZhJTN8pYX6CuiWmocmCg?=
 =?us-ascii?Q?03cw3lfPHghC3/P1ESQ+r3+ge3XLai29gWMn5XCs97TAjOvdlwXl9V1cREvd?=
 =?us-ascii?Q?okEtsb6xu95it2rvKc2slVrrPXm6kIILEX6w+nj7JKvjzMTv3S7Vo5S6+0ic?=
 =?us-ascii?Q?C8sTPaWtzHsepBYF/UoY7bkPeMo5q9ovqdXSqy05YZxq4mxlvYbyND2HWRW0?=
 =?us-ascii?Q?VDrAjShusScM8IrbCKzgvJ0smETOy+1Ea9l7p4VRn5dG5bGMXd8P6NuAKcB2?=
 =?us-ascii?Q?X+ZnxYqpEtKsbEfus31KC2QZl/kP7MYhjgE33VSLgSULuM5aLGs4IH+yWgex?=
 =?us-ascii?Q?BopEq+FikS1ol6Hs6B2cUUbFEYL4pQbdQi//NNby9NmXvwERw17OatcT4pKd?=
 =?us-ascii?Q?T7eX3sxP1pLEHPABIYBdQATrvWiY2QeIA4iEcsGxaPN5inLxPmcKhQ2Pvt/o?=
 =?us-ascii?Q?+4rqVSWaIPzUpwhTTiwnT5u1HpDXKgLMzUxDYU7l5gSWC17xwuMcG5karz2I?=
 =?us-ascii?Q?JDkylT1elFYMqJcx/0RXRfVVqWpaudtA0bdcMx1l1PvUobUtJg/TllQKnXHB?=
 =?us-ascii?Q?C9NlqPmpxegWVVLtP68pULaZfyUjzhW6AZgzm+VD0frj/oceeCBunhQrGx45?=
 =?us-ascii?Q?SbZ/Mbkj9b8mV9WClTAKOsBzCt/cNqjkLd8MaG1wrROw/mj2vTgmU27UqW84?=
 =?us-ascii?Q?VAJZYIFA7eTIcRS1Ar6y9b+0doyqHOWWloPdzkAcQ7Rak9PjdEHTzS5/yQaf?=
 =?us-ascii?Q?13/stS2+1VLmQlYP35MPT1KyopRs8gJHpsWJplZE29OrMo6FJhR0WrHecAJy?=
 =?us-ascii?Q?HeLzmiyZ+NoeIS1GcZQwGZAb1ZLl7LihqDh1ka+KPRhDLlXBo7rSgMJnGQYH?=
 =?us-ascii?Q?9FqPMw0CRQ3ss5RUDTd06aErW+7LRzVtM5Jm1rNVRG+5VmY606FXpufuGrQ5?=
 =?us-ascii?Q?moGPTq9XfXcpX6vJPM66xOEpt8IHK9/Hl4K9sE/fcZcfdbyeec2NISaOQ9gS?=
 =?us-ascii?Q?EfFVJNb6VUxIuR1KFRCXUzJKl7WPxYt7raVMwDm5y8SYjpzfv63fE+TpGP+q?=
 =?us-ascii?Q?CmD6VOmDPgQ4lJoUpvCXvNqOCYeWs+o/lLNdPQP7JgCJBXPvqjMiXcSbiBsg?=
 =?us-ascii?Q?neElkvggXCDW3eMU+I+1p9cxNyrFs1/FWUh2Ler9QJ02z1I3uoxDSNb4Y0RT?=
 =?us-ascii?Q?0eVwWNuu/FiSQ2px8y+bp9P5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wYBJH9HqvATNXyMpCd+Qh57ddSNYbFNd/FO/3g0LRz2tWrqP3uWqKmcpbhk5?=
 =?us-ascii?Q?oZ/Z7cY6b5gtBNhV8X6iUuI1WLFgWZN6/zu3Sb9Lg8ispuS0pNAjqPRgZ/yt?=
 =?us-ascii?Q?7Oz4bYiJb8LiqtwBHsBEgMSmV0JzbG5/w3+jjd2ZMeKZ0yabK5wg1TPqBKKl?=
 =?us-ascii?Q?nbghRC9b2nI3RxfsD8U9MrtXLZeSsEY6Fufv5zlfrs6r8ZgI+BSqwVzg20as?=
 =?us-ascii?Q?Ze1RfpaySqMJXBGQqHvhrfKxuxF8n8AGHm0exzbq7Cfcv5IPWusdjxUI19fh?=
 =?us-ascii?Q?aVTquQu+/y2D0cVRoHmIaljLt9GTxd9O4ztEJcy38vtMwOFfg1lA0hyiV0V5?=
 =?us-ascii?Q?ScEsGGhGLsqPAHw9Hz4SQg/rNipjRGylsYcX+4dDcY4pCfGPqwu1BrpJ1mGe?=
 =?us-ascii?Q?8CgzKwMj8XnwtcYGYOMNCIba7SMtubBzRKqqgSBK1jvFwWoPkxDa4tN80wce?=
 =?us-ascii?Q?gQNQmabTWBxpoimKb9x971UDEQbaOeUeKdIkgy2gEn/tP965xkM8+ITt+pEF?=
 =?us-ascii?Q?2NBxxKLCkTfKlFhe7SOt/KrKDUwhc3Tf5jB7J5CbAL7HiiXxY1P4nQvArO/M?=
 =?us-ascii?Q?adRkg9kFAjKeCQdVNqVp6jBzLPd9iZS14WQK4V8oUj5wI4YXB2TbcVWLUJS6?=
 =?us-ascii?Q?kXGVQz+ef36aSxNSKJi7E3H2aI/QCFskMDTW/mWXDe/vVIGOyY7G9PstbeAM?=
 =?us-ascii?Q?70QTj8GOiEtcr3OdvVXg4/mGUL0/fNJEywobrM0F6TM+BxsgF7CiFOcub0XU?=
 =?us-ascii?Q?XQZl1qZf3aqHzRIVS+4HdksoNxO5jJuIHweeYh+Zcb2Z29sj9ZsNiDSNHGMa?=
 =?us-ascii?Q?qeNTJk/ZWSKyJsm2d6Ef5ju1CSgm7pEq2wTY16eMFUuxrHc6ehXUcb70+OyS?=
 =?us-ascii?Q?Tn0RdZITHEmUcjobSyH6v0iAP0eP3nB0xq1cTP0hHNChy1CGxaQBpbzoo4Nv?=
 =?us-ascii?Q?kjd+YYupMFtx+Ndaft0M3wf1vIhymqHN9X3bVVeydJljTP1CcseDkA4x7MnV?=
 =?us-ascii?Q?DbJUjFkkkPusXuB8SKwospQ4zTffTnKXLmIxTqCkqzMxTmNwfFKqJCkGALLK?=
 =?us-ascii?Q?ZvSc6BQeQWpS3hPy9zppfHcfvlNEkoyBGhR7Hu++s53q+TY93BEvnSL9ruFc?=
 =?us-ascii?Q?BwTgubFA64j2JKNDFiWjWltCF8OlyYV02BXkPfbfLqmewhXAOnDdO2waZLKC?=
 =?us-ascii?Q?sAllVKhQg2TXLcqHYCmkAsI0M6CFhyZwk2mrCkr8aXM2QfqedsKNV4J4XL9V?=
 =?us-ascii?Q?hYTPSdaDkz3EDW9gMQyegFQ2mF0wGwiJbMEfCQb79IQiAQZ4g2mn/3NmDiqo?=
 =?us-ascii?Q?iqDGzw9J0olZeibZlSKX6LB92HRkkztDcqHVbeG7mEBCi2MtP1ZQrB8eOULJ?=
 =?us-ascii?Q?voFC//6/19mYCiTK7S4AdMYASaH4KNMyM5n259jxHAvFewLC4HcP/qw11dme?=
 =?us-ascii?Q?8SJTQc+bOa5RGsSML2AYJkoheRwi23DlFxVj/YAygaM+qaCJg3ZMwFrnY478?=
 =?us-ascii?Q?sKHawZ7JvYhWVxjAMAyKIz08pmySFF0glQ2DBe7EeJ0doe9ZG3991GsBMSNA?=
 =?us-ascii?Q?Xku28rjlHsVzyvvVLX5dMo4seXAcwfXajM2fMkzTA9oHpymnzershZ87IgZW?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d03c21b-6213-49c9-8812-08dd0a39a70a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 14:34:48.9889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35OKSrboRsnNVMV3K/EC2TRWvcV9lAMPkBG7SkoKq4yLsox8cF/DH+7WbWbHhge13rLQNDYaagF5cYOyh18OzOhQ4nEqV8zC2GLmlPqLsKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6368
X-Proofpoint-ORIG-GUID: 6Nh1nJ1qlEm75IKUHuJCA6gIz7vl5wtY
X-Proofpoint-GUID: 6Nh1nJ1qlEm75IKUHuJCA6gIz7vl5wtY
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673f4510 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=7mOBRU54AAAA:8 a=t7CeM3EgAAAA:8 a=e5nkONjkl-vrtydZ3ioA:9 a=wa9RWnbW_A1YIeRBVszw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_10,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 14:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207540

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

YOCTO [#15061]
Rust multilib sdks broken because of the conflicts between attempted
installs of rust-cross-canadian for arm and aarch64.

Multilibs trying to install cargo.sh
and rust.sh in the same path which resulted in the issue

This patch implements architecture specific environment setup scripts
using RUST_TARGET_SYS to create unique filenames.
The changes ensure that these scripts do not overwrite each other.
Additionally, all target-independent variables previously defined in the
rust and cargo scripts have been moved to their respective nativesdk recipe files

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/rust/cargo_1.80.0.bb    | 24 +++++++++++++++++++
 .../rust/rust-cross-canadian.inc              | 24 ++++---------------
 meta/recipes-devtools/rust/rust_1.80.0.bb     | 14 +++++++++++
 3 files changed, 43 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.80.0.bb b/meta/recipes-devtools/rust/cargo_1.80.0.bb
index 123032cdf7..2246ce2534 100644
--- a/meta/recipes-devtools/rust/cargo_1.80.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.80.0.bb
@@ -50,7 +50,31 @@ do_install:append:class-nativesdk() {
 	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
 	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
 	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_cargo.sh"
+    
+    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+    
+    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	mkdir -p "\$CARGO_HOME"
+	if ! grep -q '^\[build\]' "\$CARGO_HOME/config"; then
+		touch "\$CARGO_HOME/config"
+		echo "[build]" >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
+	
+	
+	# Keep the below off as long as HTTP/2 is disabled.
+	export CARGO_HTTP_MULTIPLEXING=false
+	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
+	EOF
+
 }
+FILES:${PN} += "${base_prefix}/environment-setup.d"
 
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index c34b839d15..1ef14e5e6d 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -54,39 +54,25 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
-	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
-	EOF
-
-    chown -R root.root ${D}
-
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
-		touch "\$CARGO_HOME/config"
-		echo "[build]" >> "\$CARGO_HOME/config"
+	if ! grep -q '^\[target\.' "\$CARGO_HOME/config"; then
 		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
 		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
 		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
-		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
     fi
 
-	# Keep the below off as long as HTTP/2 is disabled.
-	export CARGO_HTTP_MULTIPLEXING=false
-
-	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
 	EOF
+
+    chown -R root.root ${D}
+
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
diff --git a/meta/recipes-devtools/rust/rust_1.80.0.bb b/meta/recipes-devtools/rust/rust_1.80.0.bb
index eae1f28bb8..8a8aad5a8d 100644
--- a/meta/recipes-devtools/rust/rust_1.80.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.80.0.bb
@@ -271,8 +271,22 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
+	
+	EOF
+
+    chown -R root.root ${D}
+
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
-- 
2.43.0


