Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.53])
 by mx.groups.io with SMTP id smtpd.web12.11622.1605217094521572566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 13:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=q0c6abFp;
 spf=pass (domain: nxp.com, ip: 40.107.21.53, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOZ1as/NH5CS1JrmeN9l8ih8tk3NxPQwJojLIyFxLjdAa5xC3WcM69iLIPdFAyyOu8GbbvzZzIe0krvSkOkcRBZe5FX27whw97zWUFBjDpfX6fVrYYjSrALSYRk6c3uxWEs0HW13OiVZyZ/dTYieViFktnFTbO46Pu/u/2wz9AGQGlg3fq6J80XYyesIUzz5dhSra/ZBdw5pJ9Uod5jZUo8Kn9tgZtOc3xhKWdOCMYLUd0WVG8adv4UO53csH+c+CR4JqfQptcf6B7UUSpXmkLeUh2AlCLpV53zIFgWMqz1q7qYkKqvJODvsPVit+sQBva1eYQcFkWIWAgiaEivHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyApmIOY1UG38SZrPlq2/Ml/YXjMwE74FtDPaoTGB2k=;
 b=jmj88Nw5RbSxozrB7MXtdIiXYucepnx16yQ+LzRDbVj8HWCK+6XC35TetmsGO8kQ7cvOTntSXGglv9vHELFEZou+RvQNVS+49j9QNBXWBrtEKshuej/muTMKGWWRBQAs1ZL2USZQncceWnN9oGpr/wmQ0lCuB59Ed3v+ldMCo898X3uH5v4clkH2iEaYIvb8IAXbLZa5eo5e3Z8I2V3Kow31XfgIHL4WDA2Uf/48mcwHTVWA2kxsLVZWdsOi2uRNH6Dk3Oq6CJVClGTdO5s0bKoD4MSVzhXfA0NHG0HCjkPtSnFf4vpgqGV/8WDYS0fEHbzA6ggJWRgBoZm1S8jXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyApmIOY1UG38SZrPlq2/Ml/YXjMwE74FtDPaoTGB2k=;
 b=q0c6abFpf6NrgOyfUPm1HEx/ssxuc+9jNZgxQo6Raz4O8litB6jaMAg2XW19BmDvTTEtwRqIuE0sMdOWpUtAr5Weep5185hytGhNgVoJGwgJOP6t4J/20GuTigEJ0FGYQhl3wq4AoyYfYb+ddv0KPr2YR8OmUfaYzUsSnm8ATgM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (2603:10a6:803:124::21)
 by VI1PR0402MB3453.eurprd04.prod.outlook.com (2603:10a6:803:6::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 21:38:11 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::7dd5:534a:a183:dc71]) by VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::7dd5:534a:a183:dc71%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 21:38:11 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH v2] mesa: Add xcb-fixes to loader when using x11 and dri3
Date: Thu, 12 Nov 2020 15:37:46 -0600
Message-Id: <20201112213746.12863-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To VE1PR04MB6621.eurprd04.prod.outlook.com
 (2603:10a6:803:124::21)
Return-Path: tom.hochstein@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by BY5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:1e0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25 via Frontend Transport; Thu, 12 Nov 2020 21:38:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01a93fe3-e13e-4f91-f728-08d8875340bc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3453:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0402MB34533F293EBFE1D3E128460EE2E70@VI1PR0402MB3453.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yrEouBCE35UY4PgOeb3IC5/3f1XsZM+aZCRmBLkwc3Jfg06V4embsFdsCG6Ge2tkN6E76hl3XMIZFzAV59t3dsCwVvDpXo6ik1galmErlwIGX/mV8FQ23mt7OtgawOL3oyGQh+m2YxHq1JJWFYMFq1W2L33Bj5aDK/xrU0m/De+5eqTgA6s/A7W+216Jk6mi3ddjZx/u02sBkPPKn9iUnlQlRfXdxmWYcg8iTIM7RDDzXjBeRE7LrlzRZh5lQT5D+teFkSBILiZ5WFGb0SDrqCbZ7X55C+55sggLIevVA7GhX6Sfo2hwYRN3aAKSo92If4nypZPNtl1lXF1nC1/xf1jbMzraIPDndlLXJouOfE4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(26005)(44832011)(66556008)(956004)(8936002)(186003)(1076003)(6666004)(6506007)(6916009)(4326008)(36756003)(5660300002)(66476007)(52116002)(83380400001)(316002)(16526019)(66946007)(86362001)(6486002)(6512007)(478600001)(2906002)(8676002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pnWCyIWsq+ufgvFJYLHhtR6mCtyEc3tIHofKWIdwJ59ZN+aU15KNuq1QFy7eaHqk3Ovxd7uAr82L0RLwtJge0shk8Fx4U6r892QAJiPnSCBHiJI2JadJfaubUryTTBxenYIVIu6HyOiYewOLhdbEsu7ht3JERrWO7wpVoyo2kT6GhwRqGbezdjbV84XMk4m5DfRtiJBxTdEdH08JEAlDQJoHHRxJ/RmDhl6n2ImKzE1Vh4Vq8vLaKPSIEHBj3GOkvBgonnUmx3BA8izopnxn+uDmQTG2jGrIddSWPsNRRycXC81iCvZ8TfyxdX/P3v7nFDbn4CmyQMvKezGwjI9FocxAC/yFFolmRKMjv/JCpFDJEx+FMrd0ZfQePS4LxLcUWSfpUpZEhqMuQgbNrehp3782z1cE7MLfTpJzCUmGjuwnuCNpkrtAVDuZ3m96ngEPXoxYnzVVy03ESeflHgCS+rKJIMEgX3zHBNM3WhRX9d8o8YnKGbsUO66lgKE81DUFzjTsPPkgxn4KWCXYecdM37uVnXF+qfWYzTHHF9MC1P82WUQL/XCDMYZWCxLt9ITZroGFMXQQ+EhiwOOrtyT3A8OPL8FhLG3kzjF21oI4a9DN3IY+f46eWlmAxDf5wN2zHQI5RrzYFtwKvXLVLYiuJQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a93fe3-e13e-4f91-f728-08d8875340bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 21:38:11.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2ibjnVQQ/lVrB7TsZ6V7xMYhjkNnPSXonjTbSvOkZ6euaAZKbN3DocZsgJca71WRNq+2lXekHkGLcVQajvZAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3453
Content-Type: text/plain

Backport fix for undefined symbol for xcb_xfixes_create_region in loader_dri3_helper.c.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 ...xes-to-loader-when-using-x11-and-dri.patch | 36 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch b/meta/recipes-graphics/mesa/files/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
new file mode 100644
index 0000000000..9ee72880a2
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
@@ -0,0 +1,36 @@
+From cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c Mon Sep 17 00:00:00 2001
+From: Duncan Hopkins <duncan@duncanhopkins.me.uk>
+Date: Thu, 15 Oct 2020 12:14:57 +0100
+Subject: [PATCH] meson: Add xcb-fixes to loader when using x11 and dri3. Fixes
+ undefined symbol for xcb_xfixes_create_region in loader_dri3_helper.c
+
+loader_dr3_helper.c uses xcb_xfixes_create_region() that requires dep_xcb_xfixes to link. This is dependent on with_platform_x11 and with_dri3.
+But the source meson file does not set this up dependent on with_dri3.
+The build was initialsed using platforms=x11 and gallium-drivers=zink,swrast.
+
+Reviewed-by: Eric Anholt <eric@anholt.net>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7164>
+
+Upstream-Status: Backport [cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c]
+
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index cfe02fa6373..3cb3c904927 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1782,7 +1782,8 @@ if with_platform_x11
+       dep_xxf86vm = dependency('xxf86vm')
+     endif
+   endif
+-  if (with_egl or (
++  if (with_egl or 
++      with_dri3 or (
+       with_gallium_vdpau or with_gallium_xvmc or with_gallium_xa or
+       with_gallium_omx != 'disabled'))
+     dep_xcb_xfixes = dependency('xcb-xfixes')
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5a6caf2662..ca593b8b1f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,6 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch \
+           file://0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch \
            "
 
 SRC_URI[sha256sum] = "d1a46d9a3f291bc0e0374600bdcb59844fa3eafaa50398e472a36fc65fd0244a"
-- 
2.17.1

