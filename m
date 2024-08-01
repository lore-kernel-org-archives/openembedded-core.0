Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164ACC3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 12:55:37 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.90])
 by mx.groups.io with SMTP id smtpd.web10.67473.1722516933121357458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 05:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=kyH1x+24;
 spf=pass (domain: kpit.com, ip: 40.107.51.90, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVnu+qK3UuAOsCDSCVAVZZmQFFEeG3IUyQ38GvvLu0qVlSDS+RZq37R6gbiEurRiOWJbzw16eMYZqWsaQHa5lijnDGmCfABahvaN+6n8+6qH9RP2N/VrhM0j3m9ObNQ4GxolhvNofZ3jUlVP4+Gc3gzWYemaPr7+1wGKYgeveT7dsRRzlCkv2aLtmnvn1IVEugYkazdxEWMBnx6fZXQxrwf3W/Ep1o3Nm88GeU+88tnwsA5t2v9l1sbiWvdsXIj6aHFLWl1Rg/DpxSJowZVEIhox+HXI1OKrykNy0qOSGgfyDNdqbTubgZzg+wpc9XaXOfrJrwIzrJfUlxAKYZw5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGUXNJv6CsfTQIDLmz4ZglefJFWq842t26FCCqgYe+o=;
 b=d4/Ui0Vs1i0XdEiFKg7vOuF01TDmt3JnLu2EjIv0yddfVUEUwLUzuR0marw7/8HGUvNlQNLh0bduZcWzG4GElRIW/GFKfU5qV8ZAG6Ot2x08JN/iYKJbd9+7KgiHQaq6KD/qRLyRE19FCa0MhCPlvdj/jV1UoDiD2l010a+1mOvF32aS7Zm5iKzAeLQRR5kbe0mWbryi4esO62aQM9knyCuk4ZmwkE1BvB3osf/2vpsRVMZziLZyGWc8HWy/TyIt6fChvVsapO12gHAksCpZnecGIhF5IBJjNgz3lfbB3DmRdTXCT9XFriirM4LHi2D2GS6Tp2rqzmbmOl3Gu1Xb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGUXNJv6CsfTQIDLmz4ZglefJFWq842t26FCCqgYe+o=;
 b=kyH1x+24uS6GcZjARq+2eg1tMz2YJ9PY1e09IwaHhTtx25gOUAZSUKCjp8Ory4XQnqWI6Eukv7NpIABdqWRwCjLwmnSZPNShpb3JiK/9IOIsZWXcWd+o1Bo56L5xSmYLbayClitTFVUhk8996Iih/TkR8k+JJ/4ZnZhF6LXUhCw=
Received: from PS2PR02CA0057.apcprd02.prod.outlook.com (2603:1096:300:5a::21)
 by MAZPR01MB6160.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:4f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 12:55:26 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::4c) by PS2PR02CA0057.outlook.office365.com
 (2603:1096:300:5a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 12:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 12:55:23 +0000
Received: from LL-1259L.kpit.com (10.52.130.23) by PH3EXCH02.kpit.com
 (10.52.16.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 Aug 2024
 18:25:17 +0530
From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-Core][scarthgap][PATCH] rust: Add new varaible RUST_ENABLE_EXTRA_TOOLS
Date: Thu, 1 Aug 2024 18:24:41 +0530
Message-ID: <20240801125441.16164-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.52.130.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH02.kpit.com
 (10.52.16.26)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|MAZPR01MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 4adff641-e296-42ac-fb9a-08dcb2293560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MrifMZ6FcHNurFKeHncN7W4WNhPi6vuMrZtt3j8HMdJ8T5laGuN1As9bshr1?=
 =?us-ascii?Q?p9mlwJgjvtCfIAOudXnYqVDMVlFowjNn13n0g6PsHPI473fJMazHyJ7IRBdt?=
 =?us-ascii?Q?bJ9sNu3TCkPMFsbwwF8Ox0hd02xAmwafeLUYgj9eC1mD1pyMho7YpO+XvjeE?=
 =?us-ascii?Q?31fiMILWw/pxfV3aDtGSG5eutCPr3w1YDr7+QHZV4+NgfCUN+b36r6pYusCd?=
 =?us-ascii?Q?m1fETG/vGMZUIr+8YlcwlFqu0oW0RMPEJB8Didr1a3HFLy7bnCSOWTxhXu8q?=
 =?us-ascii?Q?FZ/VK7fPLIq0GIcy+vvGWEnTFyTxgR7Y4PDHmabQ9NUB0DNMcihOTgqhz/jN?=
 =?us-ascii?Q?zREHyoA95bpx4lFgOYuemNU1Z9lLXL8BV25DfIsZl8P2pbp8m5Blp61Zl8lL?=
 =?us-ascii?Q?C2wPI+qx/zvBLTLVrzdIRyhrv/VJAOUvCQnsTYQGVn1zFqrVDs/TVKJlcvTN?=
 =?us-ascii?Q?Ha7pFLvCWkYgNpJXS69UPD5J/WYw6Ql/mdR8TCDAc9Xvufe9ezZqVGcOajXv?=
 =?us-ascii?Q?OoNeF/i/EThj0GQjFldXt+lXb5q20BT/RL9kC1URtylWCBF2NE8UvWKKOeCY?=
 =?us-ascii?Q?fC98f6cabApd+Ik9qa2OQ/44WHDXz/ZM5iP9PcCbLqjLQVghbDguXqaJM97N?=
 =?us-ascii?Q?0XUESVlzD7pW9YP6/jtfmkUsyCVHXl4iGa+Aw1UA5iZ0jjbr8bzdxA5+F0NF?=
 =?us-ascii?Q?2Qjxu9e5eg/I3a1YA9vIK7UgGZ19Nqz4z7aVxIyV1aEUGXpy/sheB1YpegT1?=
 =?us-ascii?Q?I/tga0HJjm73ymDEOJTFIIiEx07kSKvkU82ZEy/V1UkPyNB5ULXh7yjAyzkW?=
 =?us-ascii?Q?jsSF/tXxLXpXYPH0mJB4JvgkgQ7nIDqJeAtUVheStXAEYL+rweAq60JdmVno?=
 =?us-ascii?Q?VbU8pSLiFxtzo8xf/QVsNB0zZMYfRbu9WUZR0i3LlfoMKoqFh+/TOB9fd8ah?=
 =?us-ascii?Q?9j3jlrm6IPeqjoqcgfNgrcq697OBXBlLYkLKZUtr34b5c2kPm/8+AZTMP90a?=
 =?us-ascii?Q?9XKjZiyyGfzJdGCtVzxl5nhFawGc8dNZOCMnegD2OtTMedQD1siGNJT0gPpZ?=
 =?us-ascii?Q?Lj52kdFu3gehAtF3mLUblMbRMDnyZK8f7Dcz1k+4EDHUfyzJ4umO9o6hb07x?=
 =?us-ascii?Q?o7kgVEZWc9a+InJKwi/3ZHfZNZCffHSH9Cex2z8pGcpuC9MoUIJOMjRYGQpi?=
 =?us-ascii?Q?QtBzFezHfc7ht7MF7JneuNdJqFFVO8zER12O7iWPE8kuctOKeyiupcHU2g6G?=
 =?us-ascii?Q?L35bwutZt997iQUUx/3ecCBCnE7qSs0nqsJ72hVrHZjsS8HvNxLxDtI55PXq?=
 =?us-ascii?Q?fpwJiLMN+lY41mbNLIWaWNfm1V+Rw7y5ShC/qX6xK1jbNS0p0m9KRvOJcB97?=
 =?us-ascii?Q?0KASbC3agxgHaQGWm/j8+MbccSNZ/itsyAx3MJ1vg3FkrJTgys+lfSekbewt?=
 =?us-ascii?Q?yogt3kXVzcJws0ZG5x8zQMrN0IlFXxep?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 12:55:23.6844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adff641-e296-42ac-fb9a-08dcb2293560
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 12:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202730

There is a need to enable some extra tools from the rust for the build
and so this new variable will help for that

This varaible then we can use during do_configure task to add overall
values as per json format in build -> tools

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 meta/recipes-devtools/rust/rust_1.75.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devto=
ols/rust/rust_1.75.0.bb
index 76e1fe2d84..c33f31d261 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -70,6 +70,10 @@ addtask do_test_compile after do_configure do_rust_gen_t=
argets
 do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
 do_rust_setup_snapshot[vardepsexclude] +=3D "UNINATIVE_LOADER"

+# there is a need to enable some more rust tools for the project
+# We can extend a list of more tools via this variable
+RUST_ENABLE_EXTRA_TOOLS ?=3D "rust-demangler"
+
 python do_configure() {
     import json
     import configparser
@@ -141,7 +145,7 @@ python do_configure() {
     config.add_section("build")
     config.set("build", "submodules", e(False))
     config.set("build", "docs", e(False))
-    config.set("build", "tools", ["rust-demangler",])
+    config.set("build", "tools", e(d.getVar("RUST_ENABLE_EXTRA_TOOLS").spl=
it()))

     rustc =3D d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
     config.set("build", "rustc", e(rustc))
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

