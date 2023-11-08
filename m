Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A478C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 06:09:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8204.1699423775920702647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 22:09:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bOSb+NC6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96767f8fc1=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A84K4Fu011255
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 06:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=+EOKBiYFZHn3U+0FVM
	4EtAuD51dU73Ee0pvwJnhg8ec=; b=bOSb+NC6/rgi8H++VK/FqMrlm30MYS1O5r
	DL/UJyr6j6TMiOsrnTdPUeFLCuXZZtSNirR083sLIgrB4CQUt0l3KrK6NIma+qzg
	E/LGig+B4ij2i2EPdR8A3vUlhvDYJciKpW9IW+hNnZw4LQSd0CXCVt3s4BrfHlK5
	dZd2TGI17uIC7CIRc+nHPPb1uuOEdwiRJrcYsP4DEKiQozvtCQSOiFKhUz/RxEM4
	Y08iCbO45NG7Xt46XBgtW0h6yLgX0Gr8Rimw60cKvVoZrJa/1rcRNRLRWKiLLkFP
	OZZ91M1vQyZQci3Wg+A7hztcxFsStw89YcSoNiIo+tOAuXzeBjIw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w3t0byw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:09:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYC0RgWStl//BezljyisxZ79JKucUceSzRMPW219JrIdPPS/2Y8uY41MEI+lmaWP4urywUYQ1wAWx+cAkEgGOucafnFagfCndQ4VDuy3lx+nQvFoZ8SRLDx25ASvZctDF9/TUc96I74ckBL4z5sLPJT+7K6e0rZuee6TkWjQdofcp4D05C64xq6cQ2IhwSv3MWM1t5Gh3ZTwxH60cCMS8L+18E+wFXIH6t33Ffl/aCdf7W4fUSuR4133/v6Tze2+G7S2qNVu9z3QXgsWFX8P8/fgR2WM6Psi7Cv41US84gr9EnnqPrIoKwCMqx4AfaPBHsv6R4yEv0E+FfYGWdk+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EOKBiYFZHn3U+0FVM4EtAuD51dU73Ee0pvwJnhg8ec=;
 b=X45DwOeiJ22q9Cwf0La17GGwpr/dYxqnmPGkZLiEBrYby+cUNrURt2J7SK2ImvCkjYJUkD5IfQmgjMYmBWTD6uZRXhMeNpwk9pJdpashYzVNuFHJk9j4U6KtvsClUTOhBvNqdhmD54Tv/TRtyEscFCo2wdPbfASezf/rLaoKVrU9mxswNwqNwUdqp2LIpETPKV6+No/dpL3mTbgiO7XdoylQVN6gFldizC+5p4MKXXuy2iOJOjWC0TvxBGtENgkWog57Dt6xv0SCKeTSHYTco8UvQmV9qxhY70UVPmF/z1a8aP7YYfLHu1hZUIK0lkO+o6IzJWXRV7G/Gt98V3sxyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 06:09:31 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.6954.030; Wed, 8 Nov 2023
 06:09:30 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust-cross-canadian: Fix file conflicts for arm and aarch64
Date: Tue,  7 Nov 2023 22:09:04 -0800
Message-ID: <20231108060904.2305647-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|DM6PR11MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: a0004414-46e4-4f9d-40d2-08dbe0214549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NhAGfw1WMBfnnRVHPSiz55Becg2t0+B/m5b9/BfuT5MHk+nKb6dwZl16cW56i05g1QaeLpK7mYbrIoTieDyz7Wj3IsuD1YzeFWBXpDKbGtPSVTAH6pIaqTn0NaTORMPY9KSbZlDh/wRxy+Rp5AJ7UAwi2QXej74fIYLWdjywrQTd+O8E5XC2BkYNM6Eu6u76MbhLL2p/UW1CiP3ZV7RyiKzCD1mNQsREYDViWxGh9u8EFPzsQhKQYKIzqqK9x/TbstjtJd5k1tgLtmX4KPgnVg3QDYd78JE68N9pt/6EDoPY0MLkysAQeze7Q4Wk/WsJdOezmDdMjk5EM6xtCuixSEBXc7bmKtjG8aOJs9XXtZmIekL+vaCeWPBECFzeggPaUd4ToawAgstZI1DTIwP5UVMOfQ69U7DQgUIsiiMRGDCAHqC7j6I2pV5vUqHNY1J4YqKZFnk9nQnvmM6l8/ZlXQUJSsu5ejUqwaHsM1pnh27Gv0jMJY6bOm6L9kqpxK11PFxEmZEBwzrk3d+s1lGVWnZgSbmCpAUrSvRILvHpfW2XHvfBVyUAhjpa7w+zuWx1kaIrOm27QYU/pXN2qSIibL/0Acxf1ffQN/a5Map/tuccnyVg6OBudxAdxh0Ffqqz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(346002)(39850400004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6486002)(6666004)(478600001)(86362001)(36756003)(38350700005)(38100700002)(52116002)(2616005)(6512007)(107886003)(41300700001)(6916009)(66476007)(66556008)(66946007)(6506007)(9686003)(1076003)(26005)(5660300002)(2906002)(8676002)(316002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ICOu7Pbr+LVp6bh0rydkKthQKvJcZnnwUvoIYM4Il4VzqwWDBWZVDfJnJPWy?=
 =?us-ascii?Q?Ylf+mXfpxIRmJ2YsNXYJWUdEnda/yLEgKa1ozolGRMpN6Bc0l2g8w5F8uokh?=
 =?us-ascii?Q?eLTXaONNBlqx2GhKlacbgvPxs+YVIugY7PklkXwWolJhyhkO6haqdMQMzY3j?=
 =?us-ascii?Q?IEm3iSmIa7AiINZfT8v+upqAgym8DOPyPkYZK5p8pnwqRh22FHd6YcnZvSv1?=
 =?us-ascii?Q?fQxlWQM4GbJjE6Fab930+/WVr6teHPEubW4d9MKZg7ODbFUF59OVjzIn2gu+?=
 =?us-ascii?Q?Qgabt6upQUz9I+E9KtJI4eNnsbr++lf5zJ7a3DRW4/reenS7wn5tnISlFjtu?=
 =?us-ascii?Q?vcP1FKlaDkMY6AXX6zzpLyQzClxpZjHYmVBt7QU1QHn3blXloB3FbIXcFU+e?=
 =?us-ascii?Q?ciMyiwkpsWGHqtyzoAh8u/qR/PgYDX/nbYffpxzzg7DnhkTr/6uMXRMuGdgM?=
 =?us-ascii?Q?eRBZW+gM6tJg4zh00gsbzQScu2gbdoFMFu5295wY/B0VXQuxEMFthmc/GIM8?=
 =?us-ascii?Q?lTegjDqD2rgRMM1E2t8LuDS7Lk/vWEPnK/IenXdgt9WINL96zZGJj8VToxq+?=
 =?us-ascii?Q?zFeqLo0gfG2mnxPLEfgHcjO78obsNzW0MV4oVJwAxsuCtqe5lOI7G98+97Ut?=
 =?us-ascii?Q?p7CtgbdGGXLK45WkUT2PLJ5VMetwE96no7+Pohv0tRs+vzMf1gZpOX9BMrEo?=
 =?us-ascii?Q?wsUoOe9a7+VwVDptc4PQrlbOEsRyBuBeOK6+ei8FJ6ER39d/mlA4qs+Nub8c?=
 =?us-ascii?Q?usqe6x0KEZ/A/BBcMeiFyJk2KFy1Bwz3I+w+RxTZ4bV1OGSLsvMAGSicVoN6?=
 =?us-ascii?Q?IIqDBpmSMQTwKHEblxMrFtYCu32VBqxO6DfmWwXTf8ki4M+Orzz8p6dfr8rg?=
 =?us-ascii?Q?64wF+f2GYfOo+Y9QqQemsKzqNnl//1P8VJGpLlF1Ce3ex9Qb3zV6rsQzsEBQ?=
 =?us-ascii?Q?PPhm0z2a4PlvdBCiYVS9OebS9ROc/dnr3RVxAZbWyPMCxQzTLFgmXauW2AEP?=
 =?us-ascii?Q?7ChRnVMvuru37LfiaDARvXj6hg13ycmm5zR6f3ernSOZJ+Kl1lmlVQXDl6g0?=
 =?us-ascii?Q?h+5g5z3EdZdhupL0k5CrmCwNEgYTP5OEP1jCXFvE5k9gZ+f4Dl223pwBbPvh?=
 =?us-ascii?Q?MAUK/Qra9QtYBqTyhEE9YZHEAnHT7TKGCJ+ggy8eMa48PEPj11gZ8tnrKVJa?=
 =?us-ascii?Q?ytzk6S6kd+MCHl1o4WKRNBWfHUmuDcH6U+IolgC73Kjb6cy/hlYHpQd+hBOf?=
 =?us-ascii?Q?Uriq5KOtc9Px92ruBJHIECI6yq5D91oId6SUYsZgYBEvvJpuiIs9XMTe/buT?=
 =?us-ascii?Q?FPkJhrf6ThnZR1n55paQag8aUVTSMmKjlBnDaC6O7rO6b5SSqb3zq8YIc0A9?=
 =?us-ascii?Q?awK3ixUQ3TqENjfJLt8mp5/Y+g4iAZAsFFuI6ucCL7Ek2cvaLQAZybcx1TBf?=
 =?us-ascii?Q?CKFJRkfw/q7SnZRoVrH+sFHbEFxm1oeOOTmtlemCAxpCHMDfaEpuYtF/tK++?=
 =?us-ascii?Q?moj92MDmieAkhokliky7DO7UjVO8upBt8dzVe6STladn1F7dobqGSooeKTWK?=
 =?us-ascii?Q?AhK6DnDwUoQmOB8cC80eRcPeG0hptFnEX+5Xw5VGyOXG9DYGR62OpotXF0JX?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0004414-46e4-4f9d-40d2-08dbe0214549
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 06:09:30.5888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18cj/2eoxQs364b+tKKi0NXQeMiBe80hxBhNUsczLfWyjISABYQ6PrJGbwQjekOs94DPiVsjvInSuSjYxYImWZi3XTbDOlUvgB2m2/qo4pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
X-Proofpoint-ORIG-GUID: jmwTKkkHPI5w6aHjd6WnVTLr5Lulc487
X-Proofpoint-GUID: jmwTKkkHPI5w6aHjd6WnVTLr5Lulc487
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-08_01,2023-11-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 phishscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 mlxlogscore=718 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311080048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190304

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

[YOCTO #15061]
Rust multilib sdks broken because of the conflicts between attempted installs of rust-cross-canadian for arm and aarch64.

Arm and aarch64 target architectures are trying to install cargo.sh and rust.sh in the same path which resulted in the issue.

The current patch modifies CARGO_ENV_SETUP_SH and RUST_ENV_SETUP_SH macros based on the architecture.
Hence, creates different file names for the environment setup scripts and resolves the issue.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../rust/rust-cross-canadian.inc              | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 7bfef6d175..94c3b0d696 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -54,6 +54,18 @@ do_install () {
     mkdir "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
+    # Set up environment variables for AArch64
+    if [ "${TARGET_ARCH}" == "aarch64" ]; then
+	RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust-aarch64.sh"
+	RUST_TARGET_SYS="aarch64-unknown-linux-gnu"
+    # Set up environment variables for ARM
+    elif [ "${TARGET_ARCH}" == "arm" ]; then
+	RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust-arm.sh"
+	RUST_TARGET_SYS="arm-unknown-linux-gnueabi"
+    else
+	RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    fi
+
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
@@ -67,6 +79,19 @@ do_install () {
     chown -R root.root ${D}
 
     CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+
+    # Set up environment variables for AArch64
+    if [ "${TARGET_ARCH}" = "aarch64" ]; then
+	CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo-aarch64.sh"
+	CARGO_TARGET_SYS="aarch64-unknown-linux-gnu"
+    # Set up environment variables for ARM
+    elif [ "${TARGET_ARCH}" == "arm" ]; then
+	CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo-arm.sh"
+	CARGO_TARGET_SYS="arm-unknown-linux-gnueabi"
+    else
+	CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    fi
+
     cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-- 
2.42.0


