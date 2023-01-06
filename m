Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7C9C4708D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 11:05:39 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.54])
 by mx.groups.io with SMTP id smtpd.web10.11400.1673003135142362759
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 03:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=YBqxF/76;
 spf=pass (domain: siemens.com, ip: 40.107.7.54, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiBXxhDNDDDwii1c+3jfuMPBTeGLSJeOb2YUr0iLaHdws6Kp9cvcLLSXkKGcbf5avgcCE+1GqoICUAFMiBodFEm+C8HNBl4PrGb1hYoPplJ7kV9sC1urfpGk5vUd2oljRvt2h6RaNwEtymcm1CrDaeDDFkYUZBy8WJeYBgMsWWZTiuZTjQ8S86Ej23YPLFZeyatH08mmwVv1kb7b9KLHpXwq913K/A8LUrDINe03vBFxWfmFgXQk2t8HFjid4pX9nt9cYmlvg9avbCOa9OBVaKlUcyN8Pd3zk93HGFjGtuUpNKcu/YZipauxD4bFW/yEb19nHqolPWMiPg3tJEfaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j7U4z16ezSpfPlEC5C36FS/kZPqivUOiAVu+Ot9UEI=;
 b=kEcwh58qzMpAYhZCNPxuxifqLFujWhejLKbjElGab6myh2jeNw1PwyNk/yvVyOCGaG/qdc4TQk9evB0xA+LlCiS5PsmGtRoxM6k90+amKvJLuL4SRWITVhnqxgG88Sv04DnK5aaWaL/IVYs5graB92HI00nOK5Sqz1LJMbobV/JcuPJvAB7+LhnqlVMOxgwCq2HZNSXhpFU/cOBkVP9J8mDChjRYsYAt9AY4AZPYoBcKQuhR7HTvSVWRlc7yuolELBpVdCXU4jcJK50w5vMb2n9mF4RyB+T5U+BTKeMSCkoZWA8TeFCVcSWMWB5/nit+HGcXkputdBNhPNeh+yx3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j7U4z16ezSpfPlEC5C36FS/kZPqivUOiAVu+Ot9UEI=;
 b=YBqxF/7626nhMPD7bJTj6fyrmW7ftPIjThZ8QHjSoffdArUWC3kVtpQhREyB9aNCJLE66mDet0cx2KraNt0WV9/8C/rcMcjWqFK6qBYpGhdUc8NC1v+UuCn0wPccsWNNXwAyFstDngPG0aKwiyBs9lv0oJrliU7/8bjg3wa6+w1AaC70mJH+uTgjA6tzWKdUxaB9QyDefKxe2sezp0APXECAa+jxNnw5x/u3OACuY/QaAxMVexv3ZfpemEw2V847bRiGXKnmtAJm7iqZZ9HIrXkLLLAH+4RFuhdXKSf0lXX75quPWDkA71RAsVGjjik6OXYwO9q5XPub3e4DeiteHg==
Received: from OS6P279CA0100.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3d::11)
 by GV1PR10MB6328.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 11:05:31 +0000
Received: from HE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:3d:cafe::ac) by OS6P279CA0100.outlook.office365.com
 (2603:10a6:e10:3d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 11:05:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 HE1EUR01FT032.mail.protection.outlook.com (10.152.0.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.17 via Frontend Transport; Fri, 6 Jan 2023 11:05:31 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 6 Jan 2023 12:05:30 +0100
Received: from md3hr6tc.ad001.siemens.net (139.22.139.42) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 6 Jan 2023 12:05:29 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] busybox: 1.35.0 -> 1.36.0
Date: Fri, 6 Jan 2023 12:05:05 +0100
Message-ID: <20230106110505.443726-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.139.42]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT032:EE_|GV1PR10MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 95494c65-0d80-4d30-3496-08daefd5ed22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	24/o76L9AluSkDRvzFLFt6OH7cFRZ+XWGMyiBbwHEctJxY9XQwYPb3eAb6JjdAEwjh7QhrCYE3gtW+hNuQdtYmcRiYAY6eM+QkwmYQpDFVt+LqsaNzDJbOHQ4aSfoCs1Tw6UekAwNtkTE4q5S+wX/BHCf9mEfxJnAG94FyqZZW/Eak6gXVEYTCx0iC9LWnMGWN3moCcTpEVfRYxsYHxy43MXjt3mmR/rMPD92/H3+bxfC4Of8p7DoQPMoHiVrV7PlbTUMSQ4Y4SSi4xiXUZODPWWbatGDKlVb4AgpYJrpAEISHbF8qe6XUr+pV05Wokxa2OSKEjd5NePj76XzeAJLo4ymztNP9X6b3LAg5YarnQF4hzLlsQBKlOW8hnmtXIr13WYFvsdeoZby8h9iBg1DRiSsOwqLidAWFFrNSptpLHBHZzOwK7yoeKlZUAvTbJKrRe6gcGGCuk0tnFOWN+UUtqsE7MX6hxDFKc6yvPqfSQ185QjWYKD9/V0Eilqcq27eptkBETGGry07pqS+lhWeu3mNparhDHltZslfTG5EDdV07rv6JlfEDwv8xKGPFDHy2FEyC819nODO9BcyAoR4eC9r0IXYrLj92d0gw9LtaNQ21FFbjvIHN+Xiwb6j0xSsQ4QBmxqJBzXO1K8/7zup6FO9HSnnUueAr/xrW3z1+LYXrX5VVKcC8e8gZBg+6xkqtx9/VPXje7RPFfsoTlx3zjpmlUYKjKnGccjhEo8ywc=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(7636003)(186003)(83380400001)(82960400001)(1076003)(26005)(47076005)(86362001)(336012)(40480700001)(40460700003)(82310400005)(36860700001)(36756003)(7596003)(356005)(956004)(82740400003)(30864003)(2616005)(44832011)(107886003)(2906002)(16526019)(6916009)(4326008)(8676002)(41300700001)(5660300002)(8936002)(316002)(70586007)(70206006)(84970400001)(6666004)(478600001)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 11:05:31.0923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95494c65-0d80-4d30-3496-08daefd5ed22
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6328
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 11:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175575

- update to next (un)stable version 1.36.0
- refresh defconfig
 - disable new applets (tree, tsort, seedrng)
 - use hw-accel for sha1/256 sums when available
- remove and refresh already merged patches

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...ab_1.35.0.bb =3D> busybox-inittab_1.36.0.bb} |   0
 .../0001-devmem-add-128-bit-width.patch       | 128 ------------------
 .../busybox/busybox/CVE-2022-30065.patch      |  29 ----
 meta/recipes-core/busybox/busybox/defconfig   |  10 +-
 .../busybox/busybox/recognize_connmand.patch  |  10 +-
 meta/recipes-core/busybox/busybox/sha1sum.cfg |   2 +
 .../busybox/busybox/sha256sum.cfg             |   1 +
 .../{busybox_1.35.0.bb =3D> busybox_1.36.0.bb}  |   4 +-
 8 files changed, 17 insertions(+), 167 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.35.0.bb =3D> busybox-i=
nittab_1.36.0.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-devmem-add-128-b=
it-width.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-30065.patch
 rename meta/recipes-core/busybox/{busybox_1.35.0.bb =3D> busybox_1.36.0.bb=
} (92%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.35.0.bb b/meta/rec=
ipes-core/busybox/busybox-inittab_1.36.0.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.35.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.36.0.bb
diff --git a/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-widt=
h.patch b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.p=
atch
deleted file mode 100644
index 985e2bf1d9..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From d432049f288c9acdc4a7caa729c68ceba3c5dca1 Mon Sep 17 00:00:00 2001
-From: Aaro Koskinen <aaro.koskinen@nokia.com>
-Date: Thu, 25 Aug 2022 18:47:02 +0300
-Subject: [PATCH] devmem: add 128-bit width
-
-Add 128-bit width if the compiler provides the needed type.
-
-function                                             old     new   delta
-devmem_main                                          405     464     +59
-.rodata                                           109025  109043     +18
---------------------------------------------------------------------------=
----
-(add/remove: 0/0 grow/shrink: 2/0 up/down: 77/0)               Total: 77 b=
ytes
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3Dd4=
32049f288c9acdc4a7caa729c68ceba3c5dca1]
-
-Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
-Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- miscutils/devmem.c | 68 ++++++++++++++++++++++++++++++----------------
- 1 file changed, 44 insertions(+), 24 deletions(-)
-
-diff --git a/miscutils/devmem.c b/miscutils/devmem.c
-index f9f0276bc..f21621bd6 100644
---- a/miscutils/devmem.c
-+++ b/miscutils/devmem.c
-@@ -29,7 +29,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
- {
- 	void *map_base, *virt_addr;
- 	uint64_t read_result;
--	uint64_t writeval =3D writeval; /* for compiler */
- 	off_t target;
- 	unsigned page_size, mapped_size, offset_in_page;
- 	int fd;
-@@ -64,9 +63,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
- 			width =3D strchrnul(bhwl, (argv[2][0] | 0x20)) - bhwl;
- 			width =3D sizes[width];
- 		}
--		/* VALUE */
--		if (argv[3])
--			writeval =3D bb_strtoull(argv[3], NULL, 0);
- 	} else { /* argv[2] =3D=3D NULL */
- 		/* make argv[3] to be a valid thing to fetch */
- 		argv--;
-@@ -96,28 +92,46 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
- 	virt_addr =3D (char*)map_base + offset_in_page;
-=20
- 	if (!argv[3]) {
--		switch (width) {
--		case 8:
--			read_result =3D *(volatile uint8_t*)virt_addr;
--			break;
--		case 16:
--			read_result =3D *(volatile uint16_t*)virt_addr;
--			break;
--		case 32:
--			read_result =3D *(volatile uint32_t*)virt_addr;
--			break;
--		case 64:
--			read_result =3D *(volatile uint64_t*)virt_addr;
--			break;
--		default:
--			bb_simple_error_msg_and_die("bad width");
-+#ifdef __SIZEOF_INT128__
-+		if (width =3D=3D 128) {
-+			unsigned __int128 rd =3D
-+				*(volatile unsigned __int128 *)virt_addr;
-+			printf("0x%016llX%016llX\n",
-+				(unsigned long long)(uint64_t)(rd >> 64),
-+				(unsigned long long)(uint64_t)rd
-+			);
-+		} else
-+#endif
-+		{
-+			switch (width) {
-+			case 8:
-+				read_result =3D *(volatile uint8_t*)virt_addr;
-+				break;
-+			case 16:
-+				read_result =3D *(volatile uint16_t*)virt_addr;
-+				break;
-+			case 32:
-+				read_result =3D *(volatile uint32_t*)virt_addr;
-+				break;
-+			case 64:
-+				read_result =3D *(volatile uint64_t*)virt_addr;
-+				break;
-+			default:
-+				bb_simple_error_msg_and_die("bad width");
-+			}
-+//			printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
-+//				target, virt_addr,
-+//				(unsigned long long)read_result);
-+			/* Zero-padded output shows the width of access just done */
-+			printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
- 		}
--//		printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
--//			target, virt_addr,
--//			(unsigned long long)read_result);
--		/* Zero-padded output shows the width of access just done */
--		printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result);
- 	} else {
-+		/* parse VALUE */
-+#ifdef __SIZEOF_INT128__
-+		unsigned __int128 writeval =3D strtoumax(argv[3], NULL, 0);
-+#else
-+		uint64_t writeval =3D bb_strtoull(argv[3], NULL, 0);
-+#endif
- 		switch (width) {
- 		case 8:
- 			*(volatile uint8_t*)virt_addr =3D writeval;
-@@ -135,6 +149,12 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
- 			*(volatile uint64_t*)virt_addr =3D writeval;
- //			read_result =3D *(volatile uint64_t*)virt_addr;
- 			break;
-+#ifdef __SIZEOF_INT128__
-+		case 128:
-+			*(volatile unsigned __int128 *)virt_addr =3D writeval;
-+//			read_result =3D *(volatile uint64_t*)virt_addr;
-+			break;
-+#endif
- 		default:
- 			bb_simple_error_msg_and_die("bad width");
- 		}
---=20
-2.25.1
-
diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch b/meta/=
recipes-core/busybox/busybox/CVE-2022-30065.patch
deleted file mode 100644
index 25ad653b25..0000000000
--- a/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Fix use-after-free in awk.
-
-CVE: CVE-2022-30065
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/202=
2-June/089768.html]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-fixes https://bugs.busybox.net/show_bug.cgi?id=3D14781
-
-Signed-off-by: Natanael Copa <ncopa at alpinelinux.org>
----
- editors/awk.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index 079d0bde5..728ee8685 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -3128,6 +3128,9 @@ static var *evaluate(node *op, var *res)
-=20
- 		case XC( OC_MOVE ):
- 			debug_printf_eval("MOVE\n");
-+			/* make sure that we never return a temp var */
-+			if (L.v =3D=3D TMPVAR0)
-+				L.v =3D res;
- 			/* if source is a temporary string, jusk relink it to dest */
- 			if (R.v =3D=3D TMPVAR1
- 			 && !(R.v->type & VF_NUMBER)
---=20
-2.36.1
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-cor=
e/busybox/busybox/defconfig
index 5e1e1f5638..3d36447c63 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.35.0
-# Sun Dec 26 16:55:55 2021
+# Busybox version: 1.36.0
+# Tue Jan  3 14:17:01 2023
 #
 CONFIG_HAVE_DOT_CONFIG=3Dy
=20
@@ -123,6 +123,9 @@ CONFIG_UNICODE_WIDE_WCHARS=3Dy
 # CONFIG_UNICODE_BIDI_SUPPORT is not set
 # CONFIG_UNICODE_NEUTRAL_TABLE is not set
 # CONFIG_UNICODE_PRESERVE_BROKEN is not set
+# CONFIG_LOOP_CONFIGURE is not set
+# CONFIG_NO_LOOP_CONFIGURE is not set
+CONFIG_TRY_LOOP_CONFIGURE=3Dy
=20
 #
 # Applets
@@ -338,6 +341,7 @@ CONFIG_FEATURE_TR_CLASSES=3Dy
 # CONFIG_FEATURE_TR_EQUIV is not set
 CONFIG_TRUE=3Dy
 # CONFIG_TRUNCATE is not set
+# CONFIG_TSORT is not set
 CONFIG_TTY=3Dy
 CONFIG_UNAME=3Dy
 CONFIG_UNAME_OSNAME=3D"GNU/Linux"
@@ -831,10 +835,12 @@ CONFIG_MICROCOM=3Dy
 CONFIG_RFKILL=3Dy
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
+# CONFIG_SEEDRNG is not set
 # CONFIG_SETFATTR is not set
 # CONFIG_SETSERIAL is not set
 CONFIG_STRINGS=3Dy
 CONFIG_TIME=3Dy
+# CONFIG_TREE is not set
 CONFIG_TS=3Dy
 # CONFIG_TTYSIZE is not set
 # CONFIG_UBIATTACH is not set
diff --git a/meta/recipes-core/busybox/busybox/recognize_connmand.patch b/m=
eta/recipes-core/busybox/busybox/recognize_connmand.patch
index f42c74caad..4f28beb556 100644
--- a/meta/recipes-core/busybox/busybox/recognize_connmand.patch
+++ b/meta/recipes-core/busybox/busybox/recognize_connmand.patch
@@ -4,14 +4,14 @@ Upstream-Status: Inappropriate [OE-Core]
=20
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
=20
-Index: busybox-1.22.1/networking/ifupdown.c
+Index: busybox-1.36.0/networking/ifupdown.c
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- busybox-1.22.1.orig/networking/ifupdown.c
-+++ busybox-1.22.1/networking/ifupdown.c
-@@ -521,6 +521,10 @@ struct dhcp_client_t {
+--- busybox-1.36.0.orig/networking/ifupdown.c
++++ busybox-1.36.0/networking/ifupdown.c
+@@ -628,6 +628,10 @@ struct dhcp_client_t {
  };
 =20
- static const struct dhcp_client_t ext_dhcp_clients[] =3D {
+ static const struct dhcp_client_t ext_dhcp_clients[] ALIGN_PTR =3D {
 +	{ "connmand",
 +		"true",
 +		"true",
diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-c=
ore/busybox/busybox/sha1sum.cfg
index 20e72d9263..01137a2486 100644
--- a/meta/recipes-core/busybox/busybox/sha1sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha1sum.cfg
@@ -1 +1,3 @@
 CONFIG_SHA1SUM=3Dy
+CONFIG_SHA1_SMALL=3D3
+CONFIG_SHA1_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes=
-core/busybox/busybox/sha256sum.cfg
index ce652ae4c6..a5b0ab22d1 100644
--- a/meta/recipes-core/busybox/busybox/sha256sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha256sum.cfg
@@ -1 +1,2 @@
 CONFIG_SHA256SUM=3Dy
+CONFIG_SHA256_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-cor=
e/busybox/busybox_1.36.0.bb
similarity index 92%
rename from meta/recipes-core/busybox/busybox_1.35.0.bb
rename to meta/recipes-core/busybox/busybox_1.36.0.bb
index e9ca6fdb1a..e46d43e681 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.0.bb
@@ -49,9 +49,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-n=
e.patch \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters=
-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printabl=
e.patch \
-           file://CVE-2022-30065.patch \
-           file://0001-devmem-add-128-bit-width.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
=20
-SRC_URI[tarball.sha256sum] =3D "faeeb244c35a348a334f4a59e44626ee870fb07b68=
84d68c10ae8bc19f83a694"
+SRC_URI[tarball.sha256sum] =3D "542750c8af7cb2630e201780b4f99f3dcceeb06f50=
5b479ec68241c1e6af61a5"
--=20
2.34.3


