Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.110])
 by mx.groups.io with SMTP id smtpd.web12.4225.1594326004140837474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 13:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=CZHF0uJE;
 spf=pass (domain: prevas.dk, ip: 40.107.1.110, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVTeb1rf7aAj2A4Lmq/3Wl2daHYPcq01Ts+eZjlnM0NBySHsUSkXcTli4xaeZ4YEzJWBuBA2iLTH2Oz2exog35gsyWv2OnPz5nUatGfPMsidxS4gfv7Km+RhfLdoGM7Y98kEUbpPST3S07pTEZld/9PVY/qnEYwc95d62btQncVkNYpxT/ziy4Xzgq2MgJXZy/L2UcEqRTgGE621zzEbJeV5Vz+ZhYwnCvgIPOCQaue95EmV/1rVVDfU/jmZje1A16Uuy0oNcaz3qbEN3gzMX2ZMMPfT1Lf2azpZOo70DKqC5WFCVjxf61O9ixAyy8zjk2b1ZTpm+uIzMOoi5QLDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSmctGBqLxLuLNyKy65dpIF8ZKSvKNT0y/ejo4inKbM=;
 b=i3ndy3D5ywYDzwqM7NvIiBixem8XFUw+F9ntD0bCfmVed3H4jImaIC/hh2xTr4LP5/zHWOUPF/lDTJuCrXVCH8rWwtiVeC6FUcqaQDRSl/xWO/xJOXUY+60V5nUE181iwXUFCmFjc5DZ3m+5Oos5PFm2/nNIh+1Ps9IG5QVX4gfAwe/EqC/b1HIimpf9xi61xvCEc7p2DL9E9t6gtN0khP8XyVdXNJkothMuJyaRo/9ufsJ+9chU0Nf9sblswWqvcxFAP9Ho1SSF9XJI7aSfi3zCBzOeHbLiIV/2AlQn64m8/4xr5sWJzanIinu66+VF2ywgaElXiXml/fVjODQHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSmctGBqLxLuLNyKy65dpIF8ZKSvKNT0y/ejo4inKbM=;
 b=CZHF0uJEebVVlUsqCMr5MRBQ743Sm9Vs6qtApR8/n2SmUaZqd1AfUFDT8RlIcNXgkMeKpE4m5V7mSeJZ4mb/HterXmsihws2ydvhWdTSgGs4gKOnC9WWlPHef6hYrmsZqzIeOdLrz4t15KnL+PTH96KkpK3kScihdYlixX7foqY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:144::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 20:20:01 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3153.031; Thu, 9 Jul 2020
 20:20:01 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] move find_cfgs() helper to cml1.bbclass
Date: Thu,  9 Jul 2020 22:19:53 +0200
Message-ID: <20200709201953.10646-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: AM0PR10CA0030.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::40) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.112.31) by AM0PR10CA0030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend Transport; Thu, 9 Jul 2020 20:20:00 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [5.186.112.31]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6473f217-f505-4bf0-8547-08d824457527
X-MS-TrafficTypeDiagnostic: AM0PR10MB3570:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB3570AC9A52AFF86CEBEA396593640@AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9u2nIruQtkh6Qeh66JbGlpuVuJh+t86wD+/JSopx6dyyxsUz6LT6ETvHWN0q61k9Fvc5oLKFexBvUxASfXZooZ/h99dK210QHQHtglxv4z9HF2BPcxPEBSORmu8Nhws2K/dtX+t7ouA0WUQhJA5NHbRSBGlSuxXsKU5YzqhFnaVG2+t4B+EtQjbqg/3ARnCxiwmfr6+cRZ3xfD2SqPjeVTHOfLax/mHAHk3HKdnwM26LLqZr+we5WBS8sbdxeB3NRbvkud49DfUvizKkCM9T/jL47b/6hw4OgmKB3QI6ticitZT+9oBakd+rHNZ7jTVY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39840400004)(136003)(396003)(366004)(4326008)(66556008)(54906003)(26005)(107886003)(6916009)(186003)(2906002)(8936002)(5660300002)(16526019)(2616005)(36756003)(66946007)(52116002)(44832011)(8676002)(316002)(956004)(6506007)(66476007)(6512007)(478600001)(1076003)(6666004)(86362001)(8976002)(83380400001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	FD/DiTXI1qpogdV4W31bkXN4C/i5WGyxeRPtBsQAx58aHgg6xzitBti2vemtn5wR7cYK1YrEeMWRb8o+Ya+rNicAlC4ZN7GfgY0+XfRy2L22eStqeBFieyCW45YoqAoyM6hSjQnyWm8H4Ujf3w/27i/J6KXlqX5p4Qi/JGOobUq3o2/VEYmEY+owoHMcMw73BIjQz8RatItqp6e2PBhncK0nZaAiedLx5o67CZ5i41dMRJY0zFXEKZGijwLgP9wA81AwKhxUKOZVAN/tVb1541BVHxvmDIeKegGlMNQuzPYWj93Kjrq1HRe+bKdBUiNBhWEVY87JnUm8dWZOrgfEXuxkcfR7nN1+Zz1xD973rOF/krWOxRSX+9IcPgtlG+1L1wVSv68QsxcXIdC+Gr3u3hAJ1lG4fmcUYmEJuTEUETZw48ND8UABZ92llrlvSm7Hssl2EdZd4ORgfsB5ZZbt7NuuHUOISwkZ+pCw7BaADF0=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 6473f217-f505-4bf0-8547-08d824457527
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 20:20:01.1831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rd60sUz5PavBm3/4lhtat8Tgyd4cPqxGQIhzcCwtRzSp7Zls3ljSeUjLOlbgnbg/82/8XoaIz7BNRNtskGwVUD9WDhLtiBR92HFNeUswEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3570
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

u-boot.inc and busybox.inc contain identical copies of this little
helper. They both inherit the cml1 class and use cml1_do_configure
right after having used this helper, and other recipes that want to
write similar logic for doing Kconfig via fragments will also need it
or something equivalent.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
Those other recipes can certainly also just copy-paste find_cfgs(),
but I think it's nice to avoid even small pieces of code duplication
(it all adds up).

What does cml1 stand for? I can't find anything in git history or
comments, and "basic support for the Linux kernel style build
configuration system" doesn't provide much of a clue either.

 meta/classes/cml1.bbclass             | 10 ++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc    | 10 ----------
 meta/recipes-core/busybox/busybox.inc | 10 ----------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index c7f6723cb3..8ab240589a 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -1,3 +1,13 @@
+# returns all the elements from the src uri that are .cfg files
+def find_cfgs(d):
+    sources=3Dsrc_patches(d, True)
+    sources_list=3D[]
+    for s in sources:
+        if s.endswith('.cfg'):
+            sources_list.append(s)
+
+    return sources_list
+
 cml1_do_configure() {
 	set -e
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index c91da02959..5ec3d90764 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -70,16 +70,6 @@ UBOOT_EXTLINUX_INSTALL_DIR ?=3D "/boot/extlinux"
 UBOOT_EXTLINUX_CONF_NAME ?=3D "extlinux.conf"
 UBOOT_EXTLINUX_SYMLINK ?=3D "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
=20
-# returns all the elements from the src uri that are .cfg files
-def find_cfgs(d):
-    sources=3Dsrc_patches(d, True)
-    sources_list=3D[]
-    for s in sources:
-        if s.endswith('.cfg'):
-            sources_list.append(s)
-
-    return sources_list
-
 do_configure () {
     if [ -n "${UBOOT_CONFIG}" ]; then
         unset i j
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index 6cfdcd7344..45aaa2b41c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -133,16 +133,6 @@ do_prepare_config () {
 	fi
 }
=20
-# returns all the elements from the src uri that are .cfg files
-def find_cfgs(d):
-    sources=3Dsrc_patches(d, True)
-    sources_list=3D[]
-    for s in sources:
-        if s.endswith('.cfg'):
-            sources_list.append(s)
-
-    return sources_list
-
 do_configure () {
 	set -x
 	do_prepare_config
--=20
2.23.0

