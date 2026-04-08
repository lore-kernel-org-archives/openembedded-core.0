Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7765310F9945
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:39 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.107630.1775657857020072341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=fY58V3yB;
 spf=pass (domain: axis.com, ip: 52.101.69.23, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QByACRLsicoGPe8PYEqFQyY1CapyYyAl+hpLGLssPw1D2oSOCuYOfZagRIiJUqXzs1oPWtfP3mUlJrTy99HTP/Yq2tJXdZLUAOd06fliPVE5xS9K89CoXXbKBaZ2p395VPtX/KAwOPl77pCH9AUllvkjDYpnDzqCnU0fr/9KoR9TbmCwWHFraVCpmFfgc21YJ62EAMabBEky8iywtjbeh1OXSHqPWhyKr5Ygq2m7zGW526lX7HIriqwU8kl8A1OM5AD1WxwBCRQp/x//AVjVJn3QPYF2kFL1QVmXLg3e+IuE1V4kZiTS5xHza57ktu2f7yL9PuhA7NFQhe3TfQ5goA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ew7x97Nq+uA/IfosFdXsDZWG3POl4JTunRL6Ba9Ub58=;
 b=Mqjz1gx/0XbiPdILxZhvr0dv1FvyUBqWKrXN4Vyr53Tf9++0JHmbbxzOja0QOx5vY+kdldOBmPo2K4NtuRt4E0FEnB0D0keAGIj1h6ix/8qAjBl5VMZXdnPHc4HWejfJRJvVO8XMAQ3htwGDaMl1M4gCzB9CC9Kiyp69Vjg6nXSaxIyxuL1GgGuflcITSN7+H6tey6iTRjoF8kfbfPeIqzyic/+ItAEdEoqz9/Js4KfpLSplgqwwc/jH/xcSw3HEQLvoyg7+pUlDLTY7vB6oU225s0tGdpkRaB2qxuNFBNUSLYt9l6vSNKebd8N+IgfFisuZNcve+IGzYzO17qFoxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ew7x97Nq+uA/IfosFdXsDZWG3POl4JTunRL6Ba9Ub58=;
 b=fY58V3yBJUY+Rz9ZZXhVbcGz/rfGQ2nbLBQfkTK7cWie3C/xnwQBezDRJl55z8e7BSCqi3SKyGa0wjAQMCAT9JzQUyWA4l6xLvHcObPouhJ3GVwmiaGenro2ouDsDbaRaKhJU4EidCO1H6qZh1WrV6OdWSHHcIYJcVxGmwktzEo=
Received: from DUZPR01CA0287.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::29) by VI0PR02MB11773.eurprd02.prod.outlook.com
 (2603:10a6:800:32e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 8 Apr
 2026 14:17:32 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::f5) by DUZPR01CA0287.outlook.office365.com
 (2603:10a6:10:4b7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 14:17:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:32 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 7C9AB1D7C
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 776BE1204FC; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 01/10] gstreamer1.0: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:09 +0200
Message-ID: <20260408141719.1086823-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|VI0PR02MB11773:EE_
X-MS-Office365-Filtering-Correlation-Id: 88af36b7-6920-470e-48a6-08de95799313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tWiGXGh3LVqre2O15nKgttBW7ORXcRIRUGKAhQtuKsowt2TGS7a8YQ8z+G8Hg8deHiJVgaSpI51y+rgpJWEN0OW85OLyHu8NywIHlkYfXzF/37zuUNS3hsEI0tA0z9LvyoOX9Eo3gYk9cE9FkRvlXYjgfRSDZj7/jwjoEgIBSsY0RGxdMNKMACkw9a+EU507bRb5+9jifzHqINUCS8Uy/Ms8feEWmi6lifrmyNizgDkA4bbqtvv5yEhknR7nxy08eaBomVJ2eX77IjZcLwvXcslhbHkNw9vxtZNI5UNqrFyg5fICXR3YIsiirxteoqI52r9zX97ICbd5yuhzCIcwGTwkltM67rNRLLzgoo4jUWzj/FG9E57A8T+LU3AsBFPZjiS2rKgHNtj3aT/5509fW0t5CY60YYJhmQCH09S/GrsRyHg+9N0lVigWlhN/k06FUeWkgxmFjGEREMnpBiV3gMSaELA1uep3N6DRThHWfJDmkwziGklNt4myRHf+NzXbaq/11yRL2LNZKCEhSa/odkzsw6PwMznuhdRrtA/4uJAbagsEOyiPFcbFTHaK5TtohrD1dY6e2srvCx2vaSGxczkZabmAT1GS5drTbbvTPgbQNwtfoIusNYqRldkYHA/9Yp/dp1tsEIno0YjlybyPHdVE5JA1HSFlpC0lfliy6FntTV8X0UBdmODBcxEVrldL3EYkmd8jWcRzOOxBxlCwTUQ0gY0L0uNgJ/zEr5j7+g8=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jAzOALVWo2xmrlwXZVczZtyMq0pLcEc0kBraWqt3ixdEbOfO5y3qz2g1yK7YPs8R6drd5auw2u7exbzVPkIsOWdV5NrmHrqG4o4NR0xL7Px4zILm8sYAa4rSJZIWt2QcDzn+vb16vIjT5Go+cAD0ez1pohU6Eqev+FVQFtxe9Wswi7ENSs5dyJZk4YD8kFm0BnOVQO70QaLjBgT9d91QzLYT9pkbv52oqAUWLOVKDO70yLMNY1xUj1ZFTjuhiHNw8HCBeXTGBJlsQtod1B/MUucdooQnKWtm+YbgKojTM3/X0O6GzJ8L/X+8WCLiOSmD7HtcoVYR7yPmQEAfDxfzKVArkVLLI/zXH0lS8+xTsscCguTIms48QC1lq/iX9bYcItKup34cU6tZ/S8Ffn6CCrS8NOjAPIigJ1H4hcOlUNQGbayF7M+uIdJVLkeWqf6Q
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:32.3784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88af36b7-6920-470e-48a6-08de95799313
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11773
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234847

Changes since 1.28.0
* b2a3b2e: Back to development after 1.28.0
* f8b4f2a: input-selector: fix race condition selecting next active pad
* 193b858: input-selector: gracefully handle active pad disappearance
* 52f8be4: input-selector: don't consider pad being released checking
  for eos
* c711f7c: input-selector: fix regression receiving eos event
* 3d48df2: input-selector: don't wait for active pad when eos
  (active-segment mode)
* 583ae1a: typefindhelper: EOS case explained in more details
* 305fb65: gst: Fix a couple of new const-ness warnings around strstr()
  usage
* 88cdc0d: ptpclock: Fix potential out-of-bounds read when parsing
  ANNOUNCE messages
* 443fb64: ptpclock: Fix copy-paste mistake in error messages
* c520284: ptpclock: Initialize PTP message to avoid invalid
  uninitialized variable warning
* f8f0df1: caps: gst_caps_append_structure should not allow NULL
  structure
* d08ede5: aggregator: Various introspection annotations / docs fixes
  for vfuncs
* 1a98767: filesink: Add debug category to file write helper
* 1f415d1: filesink: Report write error correctly on Windows
* 1aa6b48: multiqueue: reverse playback: use segment stop position as
  start time
* c7e0e43: aggregator: Handle gap event before segment
* 816e87b: bitwriter: Steal owned data in reset_and_get_data()
* 7c2da22: tests: bitwriter: Fix leak in test
* 835da19: modules: Remove NEWS from git which is generated from full
  release notes
* 201b14e: modules: remove RELEASE from git, will be generated from
  template on dist
* 7694a7d: modules: remove subproject README.md from git
* 6376a84: modules: dist common files from monorepo root
* 291e479: meson: Deprecate `system =3D 'ios'` in cross files, use
  subsystem
* d609133: gstcheck: Disable fork on tvOS and watchOS
* 55bea0a: gstreamer: Stop using deprecated G_MODULE_SUFFIX
* 020a8fd: registry: Skip .dSYM bundles when loading plugins, try 2
* d8b40e3: gst-stats: Also allow ANSI colored logs without 0x in front
  of the thread id
* c21305a: gst: Add explanatory comment to call_async implementation
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* 216d38a: all: GThreadFunc return type fixes
* e76eebd: registry: Skip recursion into and from .dSYM bundles
* 9a94133: filesink: Fix wrong open() in overwrite mode
* 749cbe0: baseparse: Preserve upstream buffer duration if possible
* f71eb59: bin: iterator is not nullable
* 1b3939b: baseparse: Fix out_buffer leak in frame_free and missing ref
  in frame_copy
* 1afd273: gstreamer: update translations
* cf7231d: queue: Fix potential use-after-free in log function
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../{gstreamer1.0_1.28.0.bb =3D> gstreamer1.0_1.28.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.0.bb =3D> gstr=
eamer1.0_1.28.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
index 63633fea05..b727783746 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstrea=
mer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.=
patch \
            "
-SRC_URI[sha256sum] =3D "6c8676bc39a2b41084fd4b21d2c37985c69ac979c03ce59575=
db945a3a623afd"
+SRC_URI[sha256sum] =3D "ce5cd44d4ffeafdcc3dddaa072b2179c0b7cb1abf4e6c5d18d=
4375f8a39fe491"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)} \
                    check \

