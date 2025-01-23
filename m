Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A97C0218C
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:49:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13939.1737647378652320717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 07:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31187efd39=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N9vhQb026689
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:37 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw1upc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOryRhcewQAPyG6yPuMixtdl0JrJWJKH0uvljBfj7+OwpeeSR0KcKrS1rcbND29PJXakUbYb6oZF0twB1vvN7TDkmo7Kx3w1OqJs8tAdf3oHZxmPo17WNVC3w/VeMdUT/QVMWC6J526y+ukMckk/BJEdyyPgrL7aQbxbD/Xu3bWvQqXxKVT98XAyelkHK+3BIX9RX3WrplLhQHRoGgnhhKC7mYNd74OIs8efPd+455qioifPw4VWTZen70CDb2C/JRRKPDzxknvf4QcVK3wSgFAYXi5sEV/vNeH1qHnVsT5D/vC8H3RkmaDspzao/vrIzARLHfaJ8uksuehQ9xV7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tl+cwfdZIh9yQP0pl3VHjcMhrL3HSBo8oDScTVLNo7A=;
 b=pr+MCMx9dHH81iU4q/Ee1g0Z8Oed2S3j+k8/xC+sNHZFw1uFG5vMFGNbUSgNTbVwUFyf8Nw91ChFJKgermiGREuyhnj4ZIYObcdFBduAFnf+4aqKdTid1MSKcT4Y7I1yIFeCSFOCm4R1yJThNL8wFgyfgcXYFnrpf+NTEg62lJq5Ugg5PqKzBOP10JcQdvNFD5Cds28AnGsbbeziXX9t65pTuZVSvDyJ4jlzH2zNVedt8Xis0pYGQsQlg+vjcUDeMRIG77vkLh4ZJKlun7hK90PVxvUMSoXdGzrIW2EW9Ucu5/XgXnoWUw+Oe5T1SDdEnGfMvLlSK1UpBaO/Y6it8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 15:49:33 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 15:49:33 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH V3 1/3] rust: fix for rust multilib sdk configuration
Date: Thu, 23 Jan 2025 07:47:53 -0800
Message-ID: <20250123154755.3579988-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: c849aa5e-026f-422b-8829-08dd3bc58813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DUg/ZDwIa79Cbb7ADeA7svezsOm5WTzauaQPZrPdnCeUcjCM5kq2MwWWRRpJ?=
 =?us-ascii?Q?eg6kc56vfoCxEUP0fUAAinG7PWXVFcugIMwaLJ/GGZUV70+ML0UgjoJPGLLc?=
 =?us-ascii?Q?zcZfvlLJczslS7MlZOWBBWD/+QgmxQJ+PAIWyh+NCiSes1pgGJcPKnsHr4hs?=
 =?us-ascii?Q?s/T1iJwBbSwqISAVCqcetwfhjzCBYl/j5o6QXEJLg6xWuTHcgPAlIMAqYGxu?=
 =?us-ascii?Q?qZsmRDtFAkuCA8scXrvhZ+oxMLkw2RL0lNdhj+2J4eO7Zl+rgs0bzSYUtHIM?=
 =?us-ascii?Q?S1nsCCI1Su1F9h98vvf1DPnZcipPTNfyysqH6kDjOQd1BqGl9suUsa3ufPJP?=
 =?us-ascii?Q?v1/b7fetiBtS02HboSvvHkT4fLcEeGV5IcSstUwSsAuVVGEa2AyyOW0VSQCS?=
 =?us-ascii?Q?xziXeg3E3oORwoJfo5gcg8JKlV/ppL/h9HLKQf3sQ84cc9VDgfRoG6wFyc3E?=
 =?us-ascii?Q?NPJNTcqI0ZH1rKu1gSFB9SuPTySFtZRaV/M0GKQlEOMjroUKq+8L6mkkGzeF?=
 =?us-ascii?Q?4sp6UEp2S+eLK18vrQOYcHicmtJtUBnomE/wG+N2jYXlTW7l3rQpj70QnmsH?=
 =?us-ascii?Q?CoaP3gvlyyM+9IKPgXLZOfatHz8Ma/gOMQKhpX3fNucutqgTgX2705/wwt/u?=
 =?us-ascii?Q?OY9qUPlbBqjrBk30TYybGkO4T+hi1f8gLCKjXAxeU4WSHJkjLn1v+MQDCFYY?=
 =?us-ascii?Q?qSHtzxxlyYacLz7cffBgzTYY2UhkcskgdSBy22urm/B9KA+4JxIkIKwh2bcB?=
 =?us-ascii?Q?h1nhnCboL6qE7RcOzzgGhgslgPama6vHF2T1AwW04zfsK/XsjrEH/zX3YjGk?=
 =?us-ascii?Q?uaazUYZJgQyFhfOLx5hvL/ScXk2J/s8oSp6orxFgp6bWbjDDn+mwaxP0sD5T?=
 =?us-ascii?Q?NcwxXPTXvhx78C+4OSXvMkUMZXYNMRMHszMB00LCmjpCR18iYapyNAWWq/vD?=
 =?us-ascii?Q?E49zJ1lIFkt8VgsFPtfhM2AOIYxXnFZxzUVuBvT1pnAjEkogILvxUhpWOsh/?=
 =?us-ascii?Q?OjRrXqgpJWMJlQC3xcxMMou/u9wyU2Gw1on5fIWxLY/2JiUrps3Tmhr78BP7?=
 =?us-ascii?Q?E+Sx+PfqVTEpwm0Vg68dSVxc9xp84K6+1BOedf4VWr2SH74NYWaMvEhXEjh4?=
 =?us-ascii?Q?Xyu28B4GK0ABCgN01VH1NKQ3wlfU6LkWhggp/gmdOuxFj+ik33+x7EwpY5lu?=
 =?us-ascii?Q?Jayg/P4yXuymLpDgiPjHfmGfVJ4bSnBsjOFu2hr8Bj2+9jme5pwXpwf1iN/u?=
 =?us-ascii?Q?ijDjx4KpKtRiiRnn5Sz6Ee4wKEI0wnvfPu3vFNWT9lajvmGKxivttn255A2O?=
 =?us-ascii?Q?S3I0qf1r7Rr85nlohPebyVTnWZJrm4EUT4OWroIyU5k+FyrOrj8lOMYo+G5+?=
 =?us-ascii?Q?dX4/rDhmky5Yz3FskLJ8rVNZXxp9sMB1TjjlNfOvJGt2aYrIzg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1LG5EkSaMpwX1+m1uOlVtdBJS6ofuBrEfGGMThKjwGe9uzzoZaP/0ZnJaXHS?=
 =?us-ascii?Q?LvPYPk04hovJv8qxubmAlPjbtt0PpmwRLKiy3MjS74V3ydvcsSKVKX/GFAPa?=
 =?us-ascii?Q?GgdJTt06E/kAA9qCwTwzFcGt0+aooUkWeysr6+ln7OM71+J2gkXTzbsQP5uC?=
 =?us-ascii?Q?6iCkoiOYaqMvlhLIIjrctkOSDhtZwwgD9oPhBfu/u5Ey/5zTRQABU6Lmymh4?=
 =?us-ascii?Q?YzugkN4Rwn8YalkMkMDQiHUXn//dA5L23XPwHNkJH8NPJcH/FuGOo69AJoXR?=
 =?us-ascii?Q?6FglCGJCOyErlf9TBlnNensG50fs3/QdPLS5pnw30Q6RW8tnE/Mar2G+D7bZ?=
 =?us-ascii?Q?tttnBjfEDd8fnZOUe7NIwza2wxqmx4xDVnxvyJtT2JjIus4LeN70mq/kezit?=
 =?us-ascii?Q?Yq41rC3FdbX2gitrxKB/uMV2A2avuJBk0nIV70u/aRloMPGmm6NK4wHf64y5?=
 =?us-ascii?Q?2p1maabKqBC+m/KweIdxYtgm7dKKBAuD16mL77ur3p501uZuqnTt0o6+OA/b?=
 =?us-ascii?Q?jrtunN4RQFlPIHrQX1z8VSRPJV8G1mTYTvV6icO+ONc5CIvlkAnW/8d+6UJl?=
 =?us-ascii?Q?UatnkqQ/dXs1P+xLdP1vFKZNnSPRu85sHIeY5oTOCqGGlp/6N5dmYK6yHBJp?=
 =?us-ascii?Q?qnjsje5LtTLp5kuasrUVuImDuUVvj25oAmAYjR51c/+UfOSwURSqDDhzW9Tm?=
 =?us-ascii?Q?ZMF3p6wflct27Krq4O+JDKDorfhP4kIM3xbw6EXojb7o1hsPmdVslEbageW6?=
 =?us-ascii?Q?XtAViG100oQCYaEFSwxYZdtZNmOx5Wl8IDI/byq7Rfrj4anquXVRqJPAYlkj?=
 =?us-ascii?Q?AWehRhwoYXjVB1NKlEkN/WA2ODWWZR9q5uwxe99y2Mb9lVU3g+pHsABJY97C?=
 =?us-ascii?Q?hmPrQqs99J25u366TrP9yvVlV9K8npxPIDwbTSQGfhWdvL9W3QEBYyU7Xm/L?=
 =?us-ascii?Q?GUXKgbXJsIhXIDvUMTS3eTUvNwgdxpJLrkdkKLEz3KGorRgDlo4rpb4M8O9W?=
 =?us-ascii?Q?25tPg/ahhNs1H59+jQXlJsN+97q+2RwdWJLaRrqAyI7qzZcZXUmgyZB0h7v7?=
 =?us-ascii?Q?CvhYIEW6yb5bSMIWf2q5ePHEIojpTSP94cmU8YO+cdLby0tyOSECXfSp6N3S?=
 =?us-ascii?Q?14bzq0i72rrbtS4OV5wNFhpUbK8wreU3mPQo7zEnpRIf67TG37HNHCANN6i4?=
 =?us-ascii?Q?JCtTsV55Sa88FpI55bxv4rbNYQi7fWMFfTKnTbusQYNYkFLD7tQsaFngMQoB?=
 =?us-ascii?Q?dtfdeMAuZokdRgpyonEipRspfQ6HQFT+93LgQCdCPQyFE65ihaXQolhjdviS?=
 =?us-ascii?Q?KwQYusoCAJ4qeT7OQ0gF9HeT0JdWwd8zWlPWluF5kJi1tgcrnEftmQ/9o8Os?=
 =?us-ascii?Q?ypfb3Rmq2w5m5baGXS58PcZjTVp/35lZwiILh4P3hrPwtmvjdwknzxsLyK1S?=
 =?us-ascii?Q?xTrvfWSV7eCZE3V6BwQLUho/BETCXu3rMkyIqM1OyGE80+33ahDpQJNYky2Y?=
 =?us-ascii?Q?wxdW9mfAItHFbHBFIQTbAyOghtd9p7c7O+2ebxeqHWJ5+17zpFwsYMwuLFRU?=
 =?us-ascii?Q?tWl5QTKBP19wcNzoexDCtEQQrMgaLKt6BD8I3ZcWe5tzoOXvv6BXE5WrKFjB?=
 =?us-ascii?Q?G5tUL4gUfNAzrTYOmN4E8kE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c849aa5e-026f-422b-8829-08dd3bc58813
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 15:49:33.5093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3y/n05EVU/FGtJsaid/9z9aPI7TpS9aJT2pyWn1XLNri7Mp+90aq5lbxaoMdv06xlDeWC7jGgQW4PRH2z14sxHk7ZnWxB9Zb7uue2R9yfss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-Authority-Analysis: v=2.4 cv=b/xI4sGx c=1 sm=1 tr=0 ts=67926511 cx=c_pps a=VzeH2YOhhDlPZ0WtbyP6yA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=7mOBRU54AAAA:8 a=t7CeM3EgAAAA:8 a=G3Sakq1ebUq8u8lUnCcA:9 a=wa9RWnbW_A1YIeRBVszw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ydvDm_GGLsfDnJcAJ4FOz8INrZfrGCh5
X-Proofpoint-ORIG-GUID: ydvDm_GGLsfDnJcAJ4FOz8INrZfrGCh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501230117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210196

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
The rust sdk installs both 'rust.sh' and 'cargo.sh' for lib32 and lib64 in the same location.
This causes below error while installing the lib32 & lib64 binaries:

Error: Transaction test error:
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh
conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
 rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/rust.sh
conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
ERROR: Task (virtual:multilib:lib32:/media/build/poky/meta/recipes-sato/images/core-image-sato.bb:do_populate_sdk)
failed with exit code '1'

The change includes:
- Prepending '${RUST_TARGET_SYS}' to 'rust.sh' to differentiate between target systems.
- Moving the non-target-specific environment variables to 'nativesdk-cargo' and 'nativesdk-rust',
instead of being managed by the cross-canadian recipe.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/cargo_1.81.0.bb         | 13 +++++++++++++
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 10 +---------
 meta/recipes-devtools/rust/rust_1.81.0.bb          | 12 ++++++++++++
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.81.0.bb b/meta/recipes-devtools/rust/cargo_1.81.0.bb
index 123032cdf7..db18ecfda9 100644
--- a/meta/recipes-devtools/rust/cargo_1.81.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.81.0.bb
@@ -50,8 +50,21 @@ do_install:append:class-nativesdk() {
 	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
 	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
 	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
+	
+	ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+	mkdir "${ENV_SETUP_DIR}"
+	CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+	
+	cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	# Keep the below off as long as HTTP/2 is disabled.
+	export CARGO_HTTP_MULTIPLEXING=false
+	
+	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
+	EOF
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
 # According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 25c0e64ba1..846dde4dc6 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -54,15 +54,12 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
@@ -81,11 +78,6 @@ do_install () {
 		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
 		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
     fi
-
-	# Keep the below off as long as HTTP/2 is disabled.
-	export CARGO_HTTP_MULTIPLEXING=false
-
-	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
 	EOF
 }
 
diff --git a/meta/recipes-devtools/rust/rust_1.81.0.bb b/meta/recipes-devtools/rust/rust_1.81.0.bb
index b583508456..15ecbf74a0 100644
--- a/meta/recipes-devtools/rust/rust_1.81.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.81.0.bb
@@ -272,8 +272,20 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
     rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
+	EOF
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
-- 
2.43.0


