Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BAFD6EBE6
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 08:07:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.111917.1732867657766660672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 00:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=20636204d6=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT7Y6GW001495
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 08:07:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671asvwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 08:07:36 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AT82uRm013184
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 08:07:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671asvwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 08:07:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d56YoOsGe9Mv9pnW+IT70C4P/QPksdPf/Eavu/hrGDb/2n/z+ocJXguAhPCFQoQI941Q5EZqZVojnpddTYUjb00E/3RBXxHJTGRgT2yucfYtUL6ANzF1z/PLyyblr4JSYI274jQPxw4Kdc72vw0v6gAWfcPPU0Dolfq02I4ItXJ1VBKhnwe6SI1+ETdoZktQVBngdcdGwRGKNhnARGoHNsPrh1tsDeMtoVfUjaeI2qQFu5o4JDHfwYNzs6+poOVtdMfRy1tcD2u8fZCa2/v/cB5WyxNNRRuYmPWkNyEQmdF+VYLPAD0ZmVsV2cqrVZe6Y84kpOa7OifPkfIpIIf5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H2RtuxlraJ4O3YwO7PU/hPTNmdpWNWXAPwjNmtd0T8=;
 b=Ks8aYbUVTXjGttj95x82fa2amSjQxaITUDVe97wFwU1wW31oXNymn7dUiNx2NPGTaO6T7oXh/KEtm2rnP8jyetuz78a19QLcO1FtnhjQTMZ6wQT34jNxEBAGifH7vexMMEMFWO1bmfDh3YmBanhqWwfuEKcPi/EFQ8zt6F5wpOzNpOvILWZjOxNTPy6QBXutgAH0eNPwG1BurU/UxjRTiuiO8H7xj5RW2ZyZJCHDyR5rB3YZcZISflXmQXwVbaOHo6mIC6OBeNQ0IRJC4YlGBTKOSZpW5fVD3VzCbeJ0GCDjingTVkJwQUEiiRLpBxxKspIaRwwij9HzW0h38JQzwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by IA1PR11MB8150.namprd11.prod.outlook.com (2603:10b6:208:44c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 08:07:32 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%4]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 08:07:31 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH V2] rust-cross-canadian: Fix environment setup script conflicts for multilibs
Date: Fri, 29 Nov 2024 00:07:10 -0800
Message-ID: <20241129080710.330266-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|IA1PR11MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: d320a07d-de2a-4d34-1525-08dd104cdfe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BHU53A0bwNGGW563IIu4DE9yraRiwgrI3DzFdzUPH2itvvkn77ZPo9JCX4fa?=
 =?us-ascii?Q?Wqh+7n08CPMaplhtIdJCc3xbPUwNGofO1iJDOaNve+ZIsfXU5RslBalxp+Tf?=
 =?us-ascii?Q?9iYZTcnF3oh7yhwAoJ2jHO3NNuHg3TYjcOIox1z87DpU03HtyI9StRwveI0X?=
 =?us-ascii?Q?hu22V4QOJcfIUF6P+eggMIGshVjEYbLoUxpIDurKfUxuZYluwWE0hVFueLJO?=
 =?us-ascii?Q?1xDWNTnus1RJIrVR2rq091iZRLYWUQYl8+YM3x3THq3OqyZJVpWcwZm3JVlw?=
 =?us-ascii?Q?6oBpyS1a2WvOIhy00FsyvJiKktSYd7v25NZFpd9HgREWlzrNl6RuZJ5S2rF8?=
 =?us-ascii?Q?InNCEs20xUGc8NexjFiByTMRuETe/wfi/VJxTO0gUghntKiqW6SZGQ6ik2il?=
 =?us-ascii?Q?Bdt+Ci+CVtDuDLrpXHwe8GYqVwarKaErO0NU0rw7l6wgFod+6e7CBicCnWkk?=
 =?us-ascii?Q?nKSDoaph5KheZCc7tvKn4WrT4WFfqwIqEoY1I3X6ige27VJKMF/KT56PkcUf?=
 =?us-ascii?Q?d+CF+e55WxXNPycSGETLSyu1+/N0SSisVKY4bkNLYxQTzm7vsoOEXYGtEF6W?=
 =?us-ascii?Q?drOJqltW/SxkPkAH9hVn8v6mJMYMHpthQt6WGRMUZPuKZAQAi7SB7Mnzp4Mu?=
 =?us-ascii?Q?DXOsU61nz8D3k/tL3BwXYVVDp8qc+4XJUAYyyn7Ok+EQ66VMxKUpiHK+JL3X?=
 =?us-ascii?Q?fhtOjXo9RsyqUIZ9ljmQM5qq2nFObwNzRlVeJZ3Gycy6nYIv4L+Yhkh58ia1?=
 =?us-ascii?Q?RGt9VxusEB57t7ixDtez4+1/lwzsh2gJORvn+RNDzFYwNH6tkeCubHVx8il8?=
 =?us-ascii?Q?5+wbV1z0o95wY/E08s5S/3xU67Phf5kL1OnT02xddcWtTzdtgLvfCtOx1X1O?=
 =?us-ascii?Q?yEjKtmj0qri0dCUGOUbgKJdri8Y3gw+dDHrKURAt//Act5tMMjTyFbowBQy0?=
 =?us-ascii?Q?RtthfYFG1CxErcBLqVHQX0/UyiAS9/HeNyEghWMfxYJQPnrQvDkFirAQeC3W?=
 =?us-ascii?Q?PUj1L4SzlfMAV3EWcu1L2CZaJ04oVDEj0TPhBimijr8os1y7n82I5qb5vZL9?=
 =?us-ascii?Q?CtXbLfK24hWWm9ZJ0GSo6ppQHSBPwpepicba81BeY8qi42gb6oXzOeclokNB?=
 =?us-ascii?Q?rXSx1AqQwx079IVMMUR5miGjODpCGGKnGg7fMz/JxNwNVT4LmvJq1BjSmgBy?=
 =?us-ascii?Q?JFRsc5EZf4e+yGDdr9gw3E8mAqnsE/96mrKnM0zWG3WjpSBxpNFBa77PjC5u?=
 =?us-ascii?Q?OrJSqSaTZxo4HrzrWbY+Pbs7hnJ8uM5eO0LtmEAEbeSsBjQbu4a1wNAHJ5w9?=
 =?us-ascii?Q?048eHRGX3uln1qPCgPIQN/yBlapmdmY7Aty7gdcnOnJTuoAaXriiGOBpERWM?=
 =?us-ascii?Q?MXLElJnloQLD+8LMoHjl1shpjWUY/rhJjMw64GxNdJDQh7EAtA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hRDpNTZGcXE/JcQRndI+9mjL6+SBtTkb3XNKgIdZvMIP3oMd8jGWWm9bh4E3?=
 =?us-ascii?Q?4hlXG5uMwnoI8rFQEeFdxdoI5WeyiNFZJqGgSX7aXMIJVN/mFdrfs8BX1aLz?=
 =?us-ascii?Q?nvQVZMxv4XXjbOpSNeBUTui8Mj2DQdipCgoyg+hhXFDMYuH1ZpVngRDmduuW?=
 =?us-ascii?Q?gBkXyqzxdDhlI3kWteeBDq1uCAkjlqwK+qI6BYGfDzOtRMRU4S07cXQKeaFY?=
 =?us-ascii?Q?32JxodOmdu9X3JTBMIwUjh9riFyD1sf2MnQ1ztNIbNuq4cSH+vjTSWg1a2DK?=
 =?us-ascii?Q?CgZNASecvUm8P9/rhwv64c+FainNi33BIFpgyqVHFjr0dqLgSEwX0y4KmS/U?=
 =?us-ascii?Q?D0hrNj0x6XOFeWx49AgexfeijY2QLRfXirphJQsj5sRUjRnrrMtLV9v6Ha51?=
 =?us-ascii?Q?DDmMDw/vNdjZAK03pny0q6HA8pC/H+gMJpJFIE2/rplGi71Be1bXmsEyUdQa?=
 =?us-ascii?Q?hwFJn46Rg1Tk3VVx6ry/J5sWs1EZy6QMWvrdJqfiB1CckjN3olPjC2wmbsbv?=
 =?us-ascii?Q?gfGe0G2tw2LFHHLKSKfxg5bmoxG8JAm7GfhYk513JpCUQLdYVRzijXTAuEhY?=
 =?us-ascii?Q?j97yu4jf9EPeqf5WaCjVA6CuPzhg1FDE3hIzA9Q2leH/2pceI0wXXHni3tO9?=
 =?us-ascii?Q?ycGELAkiVHvu36Nsl2Mgm2XHdhf3zpEBiGufdq5uZxsxZnQLvjBS+5ny7/gz?=
 =?us-ascii?Q?xjdf49db8YZcSo/lEB7ulDNvVMynzsUjjIielCbSVNFscVHTlqR2+MBMR/A1?=
 =?us-ascii?Q?P5l/gajTT6+LYSGG1LdcsOe3zMMazUUNFfyAxRotLlhxVnHcwN26JEMBP6Yd?=
 =?us-ascii?Q?iWaRsiMvuY0wxh3xT4rHTITcXb4D5p61AW4hjh8mgulLEx58pwleVvx/oYs0?=
 =?us-ascii?Q?2g+kG+P4HN23Y1POmcGcDUvUeRHBOMxZ4skJp/U++hPm1y6v8ajSMLZurXpE?=
 =?us-ascii?Q?ItMPOQMnxchGyXf8xRmxXVO2YH90eO8MLUNnWTxqUq4NxYsDHnG1NNAvFFYk?=
 =?us-ascii?Q?iYzDC7tyHS+gvFabsuCoyvIWF9o7+RhzrMKErvLcEBeRuL2XlJOIAvgHZfo0?=
 =?us-ascii?Q?xPiG4SP8hpce2eZr7yGTbhm25SkKKjY6RCkHpGfXQaiLxro8eJYrRyYtq+kU?=
 =?us-ascii?Q?wxJxkvVaOV7BJGlPuHfQeWm03q1WGu5Dc5ObqlCZ67aHkzL0r1HZhXEzP0J1?=
 =?us-ascii?Q?V9Ml2YmFFH9w2cji8IkXKr4FfO0/cbugIQu47u5l/Pu9qrP+eeluESkfZrVM?=
 =?us-ascii?Q?uQli6zGMqHGCXwZzYH/H7EjyE/jMe91BScFkBR/xqQi+hMng0T7uwhMox430?=
 =?us-ascii?Q?dyiPjuaWyqgctPaWvHfqmEYYmJNr4RbZmC5ec2PeFIYljOcq/isnAKRcWjs2?=
 =?us-ascii?Q?gW2lTiIO5CFptAyVRAgntBVum7TAfeu0rprzIbmhqCJY0Ktspx8rT4all3wz?=
 =?us-ascii?Q?vthpLZmhu1U8Vlv8nh2miek20SwARoAD5JmTim9S7tyiNHLfosFTC+bud1gf?=
 =?us-ascii?Q?+eX5qumh1shTQJp7s40DNBW70WkAGrwXMAYwWJdgtjCdrf+vcdoBuf/X7P5J?=
 =?us-ascii?Q?pkGrD44HNtcgenr4ka8pC/7L45UC7xgoUadtUVH2ZnAqo3syerAuhsIZN45n?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d320a07d-de2a-4d34-1525-08dd104cdfe0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 08:07:31.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekfuGN1Tg6a/xym2KOZ+Gb2mR56BI+vcYeLOpoA7gtNdYwucjeYNk4u1Kvs6FaMMIakwBLH8IppYvWCU9cTSEkk8yIWVOFnmAr45hvXEBRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8150
X-Proofpoint-ORIG-GUID: Ai-y4PMvvjlYv05hgN_SCWWG37OZJ5M8
X-Authority-Analysis: v=2.4 cv=TIS/S0la c=1 sm=1 tr=0 ts=67497648 cx=c_pps a=F7QtyTBSWJEVkVFduP+sHw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=3hnehoe8rIjwMn6jgKYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kP-uWhPQzY0Z-qWtmQ_zXAK6vn26cnBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_06,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411290065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 08:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208004

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

YOCTO [#15061]
Rust multilib sdks broken because of the conflicts between attempted
installs of rust-cross-canadian for multilibs

Multilibs trying to install cargo.sh and rust.sh in the same path
which resulted in the issue

The target dependent variables are retained on the rust-cross-canadian and
others are moved to the nativesdk-cargo recipe.
By appending ${RUST_TARGET_SYS} to environment script filenames,
conflicts between architectures are resolved.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/rust/cargo_1.80.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust-cross-canadian.inc |  6 ++----
 meta/recipes-devtools/rust/rust_1.80.1.bb          | 13 +++++++++++++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.80.1.bb b/meta/recipes-devtools/rust/cargo_1.80.1.bb
index 623cda0471..e67e7e9254 100644
--- a/meta/recipes-devtools/rust/cargo_1.80.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.80.1.bb
@@ -61,7 +61,7 @@ do_install:append:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-	if [ ! -f "\$CARGO_HOME/config" ]; then
+	if ! grep -q '^\[build\]' "\$CARGO_HOME/config"; then
 		touch "\$CARGO_HOME/config"
 		echo "[build]" >> "\$CARGO_HOME/config"
 		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index b2a212df40..4941914b74 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -54,18 +54,16 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
+	if ! grep -q '^\[target.${RUST_TARGET_SYS}]' "\$CARGO_HOME/config"; then
 		touch "\$CARGO_HOME/config"
 		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
 		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
index eae1f28bb8..544f2ac8a0 100644
--- a/meta/recipes-devtools/rust/rust_1.80.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.80.1.bb
@@ -271,8 +271,21 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	export RUST_TARGET_PATH="\$RUST_TARGET_PATH:\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
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


