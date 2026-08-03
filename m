Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22D8C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 06:45:17 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37646.1785739514315953182
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 23:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=KPGVUlCq;
 spf=pass (domain: navimatix.de, ip: 52.101.69.93, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRgUOWci6Ss0NR4+w5IU9EoMHO6EzRo3kI2sBdHNTK4AzMAqEBHvOvKNv6ET8XaEPLh4tbGv6ZIyzDQIb3GWGOuKWLvSJWzgwmfXN4IdT1Z0+qydqsXIYpqdS0LhpnH6WSYvyGHwSKHClWbZpPnynMoos+dKjD5dVTWdX/UQoNoyvJ2ZpobPoL4BGtw0+dikHJjO3IaO6jYJljjAxa72j+dEM4AuBrgkYvSdUpXysEAGxWP6fwdnkqgaQj4Yu6roePqrpzCySs5Jl7V5rV+qiAZFx6v0WHl5YMELcnrLIpeC4BWRK60E+aTHFj4ujm1Kuus644y4DDY2FLJwYkRmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAxCqg+GEPEZr8HNngEgTxhyqI4lgpb463QYNuAplfc=;
 b=d/C/VWjXVZlQwqTwyMVSaNygQacD2frqhk2qdvl2CpGpO6I5iiXPmDuj3TTx4482le5kQ7n+35nyxvYgz9qVGHet5DecuUsbKfn0Mfm+n6sIvCyIvjSw0n7M3AoQRUg4q6Uux0q57ihJQFQp0/CBNKIwUeZ+v/don/4YRaURXRW/YWjeNy5y84uA9iCrHBaCVJIV+IbM1XhO9OWoWHsjvjqkVtGq40xSdTnsTaIHqvFwD1AznLDdTN3GBm33qxQ8g+nvXVWJ4Zrf93SX7vyN6aiw2ZjWq8J/zM+O8fIjsbaMppFcNQRl23u5e7AS7MurmJ9PKaPCKt5/IA6s4TJrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAxCqg+GEPEZr8HNngEgTxhyqI4lgpb463QYNuAplfc=;
 b=KPGVUlCqA++nx6bttOrlz/kLp3Zd8GJpt7RAqKZ4HomHOPUq3yoxVatxR8l6fvDU3b9DAsf51L6JUcppMegSV0rPasp6MoyyyQXbRF0AOdntZUpHU+pi2W3T/E4W+7/aPg+m7zla+xonvnAEu1C/9V3jaPoAsNQUsAKebYoSZE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA4PR01MB10402.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:26b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 06:45:08 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0270.015; Mon, 3 Aug 2026 06:45:07 +0000
Date: Mon, 3 Aug 2026 08:45:06 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, antonin.godard@bootlin.com, 
	joerg.sommer@navimatix.de
CC: Antonin Godard <antonin.godard@bootlin.com>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] audit: Move 4.1.4 from meta-openembedded
Message-ID: <ade2bf144146d1174890a073a88cb314da65d5fb.1785739505.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0476.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA4PR01MB10402:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d8532e-6f61-4452-71a8-08def12ac1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|13003099007|6133799003|5023799004|56012099006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	aGZD/APhehxqWMuJdLh1iivG1VLby2hObS18tPzf5Ue6LHHMuPSgRGZhZKa/3KN59aw8EGJc+TCe3TBf4unECnQOYoNpxarK9oNxQ9fhNVHW2VStkN0eSWApld1AZFriEKO4xlYfPfjVW4jmFo3st6F+COyCpOqI4yAc6ykvwVQkw6qhiDwFdz0EdXZLRgZ6NePK47GR+9RHspRIfcnKSHVwEKfcllUhidDyye0PwGWklBGw8Q5wEZ7Iuo5sK1Tj4RwmiukXbkIoIY0bEEpAXemBf0Qs9/bXpGi0Yiyu0KnHfmdw4/8igM3IQZRr489op/knmthUgagrxt5xpvG3syhok1h8lf4SeGIzewAA0Kp9yFTPGy+kJufSlPJknYHy3KN6wl+Rp6wBion6yNJsjVmSRP1zn6wxENUb4WtXpfCQzrPqW+vHxRjMxcBCVTD5a2Rh2kNTLlx6v/nadQqjwHHdTNFm2Zi9mOb12qlPLFL8Wsql9HAb7pvy9OsXCeEXJaKOkwM83pHWecXQLMXcseOdKLPsCeFOUc/PyycENpPbvoodGyPWRg0p3SYk7J0AKp+jWOBp7A09zNxiarBuEvOK0aSQntfPyIsj5dOJ41u6FVQABxDyPGQinrDvhasEbOlNWfgjsIMFMLszPHqehvoy1uCjZTs2ptPXbgtuXoA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(13003099007)(6133799003)(5023799004)(56012099006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eShuzA12G5T+xYzV8lDOUoLeC3RSdSgFopHG4l3ecyF1RB3rJ6w/6Ow0iY2k?=
 =?us-ascii?Q?tNV/ElLWyeQGVCiLquzIQ5FxFcKVwFq36IX+CStF0duvRUzzPYgwORAGmWL+?=
 =?us-ascii?Q?1WpJ/+7rc/jOzq+m48XAUiguKCt3dnV4pgf+rcrUcPxkRT4+7Hw1XxlCf9RT?=
 =?us-ascii?Q?e73U5+KhiEQvNcEWLGuHRcDTbjXINSKziieu2D2hPAvDKCBd9rpWh4wTRFRC?=
 =?us-ascii?Q?Q54VjJZ4wlFPzImqMYnhcUD6uR4bB50FrhFLup0dZE+8dGP4Phd6DDrPos5o?=
 =?us-ascii?Q?eatwq59ibz0w4UaODEKFoxfhnXR8pwCAD0m800tTeKubF6KxclRmexn2p19X?=
 =?us-ascii?Q?RrxwUv+3KuWqEebjZf3doccxiKdi6WTVIkcC+qaD3n6PR4/CXQmTJkP+n6dV?=
 =?us-ascii?Q?Bh+rbHrfZY85oMba+Pi5UoRDD5dGfhJ93tWYfzujKB1sPp0P70gdSLCzL39/?=
 =?us-ascii?Q?5Ub771spmxcpV+N6lXmXrtiQodk5mctJ6WanK43ONFmVrb4Sk8JO7ncraAqs?=
 =?us-ascii?Q?bQBWXiNruFb5PfggPIkw8t0Ap1pePBPLyctKhz4HSBjKPyFU0hjm0ijJbqIZ?=
 =?us-ascii?Q?QDvmjHbEAl75Gc8gIrmgj0ri5o/vu/S2mvRKgA+azdnMWeMDLPmJubss/aLX?=
 =?us-ascii?Q?cg/KRibJbNiJjEM8Ra9FfpxBFOXT/i/0heF+l80/5ybv48DxXOGG2FmXBT+B?=
 =?us-ascii?Q?vmTWYYCvdBslOGzN7XNyjyS4kbU2GqzC003cPx7k/H5JCuaXapE7DLXtv4WZ?=
 =?us-ascii?Q?exUrnqBUlgXa04pcCpBsdcVj1uMjP7XrqW2h8HFvbfIMOgwNeFfZYqLJ0U9v?=
 =?us-ascii?Q?X9Mb5H8bl4yrwhalESz1mHx7g4kzaB2IT+pLUhHY8TdrDR/34G+oUY/tHxDh?=
 =?us-ascii?Q?Vn5DSWy42pTp86gpjHwMplA86phZDY6NZYuT9l4OjKijTXCIy6cxKTzDAxIs?=
 =?us-ascii?Q?s/8Eh3pknnrf5IC1AmxCQ2HypSbRjQA1IVCDnAiRvDqGcB4FaegWD6W2Bn7S?=
 =?us-ascii?Q?Og/bn+aHIoga6lhbfqpKAHn3PY7LtqwMen9EPEa5PmneelTMc0sD+xhxXVK3?=
 =?us-ascii?Q?xcWgcwtN9yXOzE57fOwhZfS4aKqn6qg4z7/zde8Awst7823e6q54IaGp+o2Q?=
 =?us-ascii?Q?MyO7MzXUt9cZM95Rtod0yrovUod/64q2DyIjjsAfnKaaeydSG3uzd5d9JCNy?=
 =?us-ascii?Q?F2tmo0PbckzqJII247gsLZM+FKt9T2lfH12Yle8xI17HUB9OLEK8rwIf5JrR?=
 =?us-ascii?Q?vgdumWDm8gJ26z4KLmNzk9XHqXwqARsqcAUEmNhuV35PBCUOuDXL+cV/kSQt?=
 =?us-ascii?Q?y8zvhbDvWYu1rd9fHmcPh7L+lTCwsWoMbTkmA4h7R6eE5Vga8UL+mD0g8XcA?=
 =?us-ascii?Q?n6qprnDQBxyvOac89QBTTyL/GD2Mh+pyV7HcVh8wHCbXBWjcLgdgGp/fbazZ?=
 =?us-ascii?Q?/V6WyzB67cPiZmPsChAITcBpyx7lyfzjAEicMKjMc02erbIedcApoL/GllbS?=
 =?us-ascii?Q?2x5eQ0oOU7RY5X9Ra293+7Gs5O3mk0g3Qe3oYodafr5BWkgtUtdAZoUFwatl?=
 =?us-ascii?Q?pWYL+5amYcJ7UgP85UNfKTX/gJL4W5H2sy4+UrsuQbJNPXL67ea8DMAXVpXp?=
 =?us-ascii?Q?iz2x/WgHOmiw3NOdsScQ8NCNYGCtZzHiJVvRT4IereKDK/WUCvgwRT3BUlqk?=
 =?us-ascii?Q?takSBC7aY0RvcnTaduMWq4d0+iEuB9AAVhyxFPk1Up97M+K+kwzgLsnrcUBS?=
 =?us-ascii?Q?4qXQwjv9qx9QnVwCZuPb2TeYjayn0ro=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d8532e-6f61-4452-71a8-08def12ac1d1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 06:45:07.8560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLcZMKZgd/fKoKOcN8zmv/ovXv6ySNoFAOEZyzB/HsVMSGRAdzJumDJo75myP9taqW3e+0bR7EbT8l4we/Gq3hFoiXP1W4GoJ6TO/xrmVrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB10402
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 06:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242609

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

With the new established distro feature *audit* in oe-core the tools for
this should be available too. Therefore, include the recipe from
8f3df8b447aa8a27ce15ccdcfa9d3eb253c08dc2 in meta-openembedded.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 ...-Fixed-swig-host-contamination-issue.patch |  54 +++++
 ...te-ax_prog_cc_for_build.m4-to-latest.patch | 196 ++++++++++++++++++
 meta/recipes-security/audit/audit/auditd      | 153 ++++++++++++++
 meta/recipes-security/audit/audit_4.1.4.bb    | 107 ++++++++++
 4 files changed, 510 insertions(+)
 create mode 100644 meta/recipes-security/audit/audit/0001-Fixed-swig-host-=
contamination-issue.patch
 create mode 100644 meta/recipes-security/audit/audit/0001-m4-update-ax_pro=
g_cc_for_build.m4-to-latest.patch
 create mode 100644 meta/recipes-security/audit/audit/auditd
 create mode 100644 meta/recipes-security/audit/audit_4.1.4.bb

diff --git a/meta/recipes-security/audit/audit/0001-Fixed-swig-host-contami=
nation-issue.patch b/meta/recipes-security/audit/audit/0001-Fixed-swig-host=
-contamination-issue.patch
new file mode 100644
index 0000000000..087b31cc21
--- /dev/null
+++ b/meta/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-=
issue.patch
@@ -0,0 +1,54 @@
+From 14e49fe508a150d99ac18e35887b7d75e84c47d8 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Sun, 19 Jul 2015 02:42:58 +0900
+Subject: [PATCH] Fixed swig host contamination issue
+
+The audit build uses swig to generate a python wrapper.
+Unfortunately, the swig info file references host include
+directories.  Some of these were previously noticed and
+eliminated, but the one fixed here was not.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
+Signed-off-by: Joe Slater <jslater@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bindings/swig/python3/Makefile.am | 3 ++-
+ bindings/swig/src/auditswig.i     | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Mak=
efile.am
+index f8f6db18..171e96a6 100644
+--- a/bindings/swig/python3/Makefile.am
++++ b/bindings/swig/python3/Makefile.am
+@@ -23,6 +23,7 @@
+ CONFIG_CLEAN_FILES =3D *.loT *.rej *.orig
+ AM_CFLAGS =3D -fPIC -DPIC -fno-strict-aliasing $(PYTHON3_CFLAGS)
+ AM_CPPFLAGS =3D -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLU=
DES)
++STDINC ?=3D /usr/include
+ LIBS =3D $(top_builddir)/lib/libaudit.la
+ SWIG_FLAGS =3D -python
+ SWIG_INCLUDES =3D -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INC=
LUDES)
+@@ -34,7 +35,7 @@ _audit_la_DEPENDENCIES =3D${top_srcdir}/lib/audit_loggin=
g.h ${top_builddir}/lib/li
+ _audit_la_LIBADD =3D ${top_builddir}/lib/libaudit.la $(PYTHON3_LIBS)
+ nodist__audit_la_SOURCES  =3D audit_wrap.c
+ audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i=20
+-	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/aud=
itswig.i=20
++	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} -I$(STDINC) ${srcdir=
}/../src/auditswig.i
+=20
+ CLEANFILES =3D audit.py* audit_wrap.c *~
+=20
+diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
+index 2760e516..5d0ea8b6 100644
+--- a/bindings/swig/src/auditswig.i
++++ b/bindings/swig/src/auditswig.i
+@@ -52,7 +52,7 @@ typedef unsigned uid_t;
+  */
+ %ignore audit_rule_data::buf;
+=20
+-%include "/usr/include/linux/audit.h"
++%include "../lib/audit.h"
+ #define __extension__ /*nothing*/
+ %include <stdint.i>
+ %include "../lib/audit-records.h"
diff --git a/meta/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_fo=
r_build.m4-to-latest.patch b/meta/recipes-security/audit/audit/0001-m4-upda=
te-ax_prog_cc_for_build.m4-to-latest.patch
new file mode 100644
index 0000000000..cf322b8e1a
--- /dev/null
+++ b/meta/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_for_build=
.m4-to-latest.patch
@@ -0,0 +1,196 @@
+From 3da79b330527b5f9d6e6243c8ba12968810965a3 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 10 Apr 2026 14:53:41 +0200
+Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to latest
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+After the autoconf update to 2.73 this was using -std=3Dgnu23
+even on hosts with gcc-13 which doesn't support it:
+
+ac_cv_prog_ac_ct_CC_FOR_BUILD=3D'gcc '
+ac_cv_prog_cc_c23=3D-std=3Dgnu23
+ac_cv_prog_cc_g=3Dyes
+ac_cv_prog_cc_stdc=3D-std=3Dgnu23
+
+Leading to:
+gcc  -std=3Dgnu23 -DHAVE_CONFIG_H -I. -I../../sources/audit-4.1.4/lib -I..=
  -I. -I../../sources/audit-4.1.4 -I../../sources/audit-4.1.4/auparse -I../=
../sources/audit-4.1.4/common -isystem/audit/4.1.4/recipe-sysroot-native/us=
r/include '-DTABLE_H=3D"fieldtab.h"' -isystem/audit/4.1.4/recipe-sysroot-na=
tive/usr/include -O2 -pipe -c -o gen_fieldtabs_h-gen_tables.o `test -f 'gen=
_tables.c' || echo '../../sources/audit-4.1.4/lib/'`gen_tables.c
+gcc: error: unrecognized command-line option =E2?~-std=3Dgnu23=E2?T; did y=
ou mean =E2?~-std=3Dgnu2x=E2?T?
+
+Needs the updated ac_cv_prog_cc_c23 from:
+https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96721f5=
16fef4226e5eca8da341159765
+
+Upstream-Status: Submitted [https://github.com/linux-audit/audit-userspace=
/pull/524]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 100 +++++++++++++++++++++++++++----------
+ 1 file changed, 75 insertions(+), 25 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 77fd346a..4d1de993 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -1,5 +1,5 @@
+ # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+-#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.htm=
l
++#   https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.ht=
ml
+ # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ #
+ # SYNOPSIS
+@@ -32,28 +32,32 @@
+ #   and this notice are preserved. This file is offered as-is, without an=
y
+ #   warranty.
+=20
+-#serial 8
++#serial 26
+=20
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+ AC_REQUIRE([AC_PROG_CC])dnl
+ AC_REQUIRE([AC_PROG_CPP])dnl
+-AC_REQUIRE([AC_EXEEXT])dnl
+-AC_REQUIRE([AC_CANONICAL_HOST])dnl
++AC_REQUIRE([AC_CANONICAL_BUILD])dnl
+=20
+ dnl Use the standard macros, but make them use other variable names
+ dnl
+ pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
+ pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
+-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
+-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+ pushdef([ac_objext], ac_build_objext)dnl
+ pushdef([CC], CC_FOR_BUILD)dnl
+ pushdef([CPP], CPP_FOR_BUILD)dnl
++pushdef([GCC], GCC_FOR_BUILD)dnl
+ pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
+ pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
+ pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
+@@ -67,27 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
+ pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
+ pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
+ pushdef([ac_cv_host_os], ac_cv_build_os)dnl
+-pushdef([ac_cpp], ac_build_cpp)dnl
+-pushdef([ac_compile], ac_build_compile)dnl
+-pushdef([ac_link], ac_build_link)dnl
++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
++pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencie=
s_compiler_type)dnl
++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
++pushdef([cross_compiling], cross_compiling_build)dnl
++dnl
++dnl These variables are problematic to rename by M4 macros, so we save
++dnl their values in alternative names, and restore the values later.
++dnl
++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
++dnl variables. It's not a good idea to rename ac_cv_exeext and
++dnl ac_cv_objext either as they're related.
++dnl Renaming ac_exeext and ac_objext is safe though.
++dnl
++ac_cv_host_exeext=3D$ac_cv_exeext
++AS_VAR_SET_IF([ac_cv_build_exeext],
++  [ac_cv_exeext=3D$ac_cv_build_exeext],
++  [AS_UNSET([ac_cv_exeext])])
++ac_cv_host_objext=3D$ac_cv_objext
++AS_VAR_SET_IF([ac_cv_build_objext],
++  [ac_cv_objext=3D$ac_cv_build_objext],
++  [AS_UNSET([ac_cv_objext])])
++dnl
++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
++dnl AC_PROG_CC) indirectly.
++dnl
++ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu
++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
++  [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],
++  [AS_UNSET([ac_cv_c_compiler_gnu])])
++
++cross_compiling_build=3Dno
+=20
+-save_cross_compiling=3D$cross_compiling
+-save_ac_tool_prefix=3D$ac_tool_prefix
+-cross_compiling=3Dno
+-ac_tool_prefix=3D
++ac_build_tool_prefix=3D
++AS_IF([test -n "$build"],      [ac_build_tool_prefix=3D"$build-"],
++      [test -n "$build_alias"],[ac_build_tool_prefix=3D"$build_alias-"])
+=20
++AC_LANG_PUSH([C])
+ AC_PROG_CC
++_AC_COMPILER_EXEEXT
++_AC_COMPILER_OBJEXT
+ AC_PROG_CPP
+-AC_EXEEXT
+=20
+-ac_tool_prefix=3D$save_ac_tool_prefix
+-cross_compiling=3D$save_cross_compiling
++BUILD_EXEEXT=3D$ac_cv_exeext
++BUILD_OBJEXT=3D$ac_cv_objext
+=20
+ dnl Restore the old definitions
+ dnl
+-popdef([ac_link])dnl
+-popdef([ac_compile])dnl
+-popdef([ac_cpp])dnl
++popdef([cross_compiling])dnl
++popdef([am_cv_prog_cc_c_o])dnl
++popdef([am_cv_CC_dependencies_compiler_type])dnl
++popdef([ac_tool_prefix])dnl
+ popdef([ac_cv_host_os])dnl
+ popdef([ac_cv_host_vendor])dnl
+ popdef([ac_cv_host_cpu])dnl
+@@ -101,24 +136,39 @@ popdef([host])dnl
+ popdef([LDFLAGS])dnl
+ popdef([CPPFLAGS])dnl
+ popdef([CFLAGS])dnl
++popdef([GCC])dnl
+ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
+-popdef([ac_cv_objext])dnl
+-popdef([ac_cv_exeext])dnl
++popdef([ac_prog_cc_stdc])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_stdc])dnl
++popdef([ac_cv_prog_cc_c23])dnl
++popdef([ac_cv_prog_cc_c11])dnl
++popdef([ac_cv_prog_cc_c99])dnl
++popdef([ac_cv_prog_cc_c89])dnl
+ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
++dnl
++ac_cv_exeext=3D$ac_cv_host_exeext
++EXEEXT=3D$ac_cv_host_exeext
++ac_cv_objext=3D$ac_cv_host_objext
++OBJEXT=3D$ac_cv_host_objext
++ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
++ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
++
++dnl restore global variables ac_ext, ac_cpp, ac_compile,
++dnl ac_link, ac_compiler_gnu (dependent on the current
++dnl language after popping):
++AC_LANG_POP([C])
+=20
+ dnl Finally, set Makefile variables
+ dnl
+-BUILD_EXEEXT=3D$ac_build_exeext
+-BUILD_OBJEXT=3D$ac_build_objext
+-AC_SUBST(BUILD_EXEEXT)dnl
+-AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([BUILD_EXEEXT])dnl
++AC_SUBST([BUILD_OBJEXT])dnl
+ AC_SUBST([CFLAGS_FOR_BUILD])dnl
+ AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
+ AC_SUBST([LDFLAGS_FOR_BUILD])dnl
diff --git a/meta/recipes-security/audit/audit/auditd b/meta/recipes-securi=
ty/audit/audit/auditd
new file mode 100644
index 0000000000..6aa7f94751
--- /dev/null
+++ b/meta/recipes-security/audit/audit/auditd
@@ -0,0 +1,153 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          auditd
+# Required-Start:    $local_fs
+# Required-Stop:     $local_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Audit Daemon
+# Description:       Collects audit information from Linux 2.6 Kernels.
+### END INIT INFO
+
+# Author: Philipp Matthias Hahn <pmhahn@debian.org>
+# Based on Debians /etc/init.d/skeleton and Auditds init.d/auditd.init
+
+# June, 2012: Adopted for yocto <amy.fong@windriver.com>
+
+# PATH should only include /usr/* if it runs after the mountnfs.sh script
+PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
+DESC=3D"audit daemon"
+NAME=3Dauditd
+DAEMON=3D/sbin/auditd
+PIDFILE=3D/var/run/"$NAME".pid
+SCRIPTNAME=3D/etc/init.d/"$NAME"
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r /etc/default/"$NAME" ] && . /etc/default/"$NAME"
+
+. /etc/default/rcS
+
+. /etc/init.d/functions
+
+#
+# Function that starts the daemon/service
+#
+do_start()
+{
+	# Return
+	#   0 if daemon has been started
+	#   1 if daemon was already running
+	#   2 if daemon could not be started
+	start-stop-daemon -S --quiet --pidfile "$PIDFILE" --exec "$DAEMON" --test=
 > /dev/null \
+		|| return 1
+	start-stop-daemon -S --quiet --pidfile "$PIDFILE" --exec "$DAEMON" -- \
+		$EXTRAOPTIONS \
+		|| return 2
+	if [ -f /etc/audit/audit.rules ]
+	then
+		/sbin/auditctl -R /etc/audit/audit.rules >/dev/null
+	fi
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop()
+{
+	# Return
+	#   0 if daemon has been stopped
+	#   1 if daemon was already stopped
+	#   2 if daemon could not be stopped
+	#   other if a failure occurred
+	start-stop-daemon -K --quiet --pidfile "$PIDFILE" --name "$NAME"
+	RETVAL=3D"$?"
+	[ "$RETVAL" =3D 2 ] && return 2
+	# Many daemons don't delete their pidfiles when they exit.
+	rm -f "$PIDFILE"
+	rm -f /var/run/audit_events
+	# Remove watches so shutdown works cleanly
+	case "$AUDITD_CLEAN_STOP" in
+		no|NO) ;;
+		*) /sbin/auditctl -D >/dev/null ;;
+	esac
+	return "$RETVAL"
+}
+
+#
+# Function that sends a SIGHUP to the daemon/service
+#
+do_reload() {
+	start-stop-daemon -K --signal HUP --quiet --pidfile $PIDFILE --name $NAME
+	return 0
+}
+
+if [ ! -e /var/log/audit ]; then
+	mkdir -p /var/log/audit
+	[ -x /sbin/restorecon ] && /sbin/restorecon -F $(readlink -f /var/log/aud=
it)
+fi
+
+case "$1" in
+  start)
+	[ "$VERBOSE" !=3D no ] && echo "Starting $DESC" "$NAME"
+	do_start
+	case "$?" in
+		0|1) [ "$VERBOSE" !=3D no ] && echo 0 ;;
+		2) [ "$VERBOSE" !=3D no ] && echo 1 ;;
+	esac
+	;;
+  stop)
+	[ "$VERBOSE" !=3D no ] && echo "Stopping $DESC" "$NAME"
+	do_stop
+	case "$?" in
+		0|1) [ "$VERBOSE" !=3D no ] && echo 0 ;;
+		2) [ "$VERBOSE" !=3D no ] && echo 1 ;;
+	esac
+	;;
+  reload|force-reload)
+	echo "Reloading $DESC" "$NAME"
+	do_reload
+	echo $?
+	;;
+  restart)
+	echo "Restarting $DESC" "$NAME"
+	do_stop
+	case "$?" in
+	  0|1)
+		do_start
+		case "$?" in
+			0) echo 0 ;;
+			1) echo 1 ;; # Old process is still running
+			*) echo 1 ;; # Failed to start
+		esac
+		;;
+	  *)
+		# Failed to stop
+		echo 1
+		;;
+	esac
+	;;
+  rotate)
+	echo "Rotating $DESC logs" "$NAME"
+	start-stop-daemon -K --signal USR1 --quiet --pidfile "$PIDFILE" --name "$=
NAME"
+	echo $?
+	;;
+  status)
+	pidofproc "$DAEMON" >/dev/null
+	status=3D$?
+	if [ $status -eq 0 ]; then
+		echo "$NAME is running."
+	else
+		echo "$NAME is not running."
+	fi
+	exit $status
+	;;
+  *)
+	echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload|rotate|s=
tatus}" >&2
+	exit 3
+	;;
+esac
+
+:
diff --git a/meta/recipes-security/audit/audit_4.1.4.bb b/meta/recipes-secu=
rity/audit/audit_4.1.4.bb
new file mode 100644
index 0000000000..363746ccf0
--- /dev/null
+++ b/meta/recipes-security/audit/audit_4.1.4.bb
@@ -0,0 +1,107 @@
+SUMMARY =3D "User space tools for kernel auditing"
+DESCRIPTION =3D "The audit package contains the user space utilities for \
+storing and searching the audit records generated by the audit subsystem \
+in the Linux kernel."
+HOMEPAGE =3D "http://people.redhat.com/sgrubb/audit/"
+SECTION =3D "base"
+LICENSE =3D "GPL-2.0-or-later AND LGPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f"
+
+SRC_URI =3D "git://github.com/linux-audit/${BPN}-userspace.git;branch=3Dma=
ster;protocol=3Dhttps;tag=3Dv${PV} \
+           file://0001-Fixed-swig-host-contamination-issue.patch \
+           file://0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch \
+           file://auditd \
+          "
+
+SRCREV =3D "07eea50408d28c953d4048dfef3da6556ce4b569"
+
+inherit autotools python3targetconfig update-rc.d systemd
+
+UPDATERCPN =3D "auditd"
+INITSCRIPT_NAME =3D "auditd"
+INITSCRIPT_PARAMS =3D "defaults"
+
+SYSTEMD_PACKAGES =3D "auditd"
+SYSTEMD_SERVICE:auditd =3D "auditd.service audit-rules.service"
+
+DEPENDS =3D "python3 libcap-ng linux-libc-headers swig-native python3-setu=
ptools-native coreutils-native"
+
+EXTRA_OECONF =3D " \
+        --with-libcap-ng \
+        --with-python3 \
+        --with-arm \
+        --with-aarch64 \
+        --with-riscv \
+        --without-golang \
+        --disable-gssapi-krb5 \
+        --disable-zos-remote \
+        --sbindir=3D${base_sbindir} \
+        --runstatedir=3D/run \
+        "
+
+EXTRA_OEMAKE =3D " \
+        PYTHON=3Dpython3 \
+        pythondir=3D${PYTHON_SITEPACKAGES_DIR} \
+        pyexecdir=3D${PYTHON_SITEPACKAGES_DIR} \
+        STDINC=3D'${STAGING_INCDIR}' \
+        "
+
+SUMMARY:audispd-plugins =3D "Plugins for the audit event dispatcher"
+DESCRIPTION:audispd-plugins =3D "The audispd-plugins package provides plug=
ins for the real-time \
+interface to the audit system, audispd. These plugins can do things \
+like relay events to remote machines or analyze events for suspicious \
+behavior."
+
+PACKAGES =3D+ "audispd-plugins"
+PACKAGES +=3D "auditd ${PN}-python"
+
+FILES:${PN} =3D "${sysconfdir}/libaudit.conf ${libdir}/libau*.so.*"
+FILES:auditd =3D "${bindir}/* ${base_sbindir}/* ${sysconfdir}/* \
+                ${datadir}/audit-rules/* ${libexecdir}/* \
+                ${nonarch_libdir}/tmpfiles.d/*.conf"
+FILES:audispd-plugins =3D "${sysconfdir}/audit/audisp-remote.conf \
+        ${sysconfdir}/audit/plugins.d/au-remote.conf \
+        ${sysconfdir}/audit/plugins.d/syslog.conf \
+        ${base_sbindir}/audisp-remote \
+        ${base_sbindir}/audisp-syslog \
+        ${localstatedir}/spool/audit \
+        "
+FILES:${PN}-dbg +=3D "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
+FILES:${PN}-python =3D "${libdir}/python${PYTHON_BASEVERSION}"
+
+CONFFILES:auditd =3D "${sysconfdir}/audit/audit.rules"
+
+do_configure:prepend() {
+    sed -e 's|buf\[];|buf[0];|g'  ${STAGING_INCDIR}/linux/audit.h > ${S}/l=
ib/audit.h
+    sed -i -e 's|#include <linux/audit.h>|#include "audit.h"|g' ${S}/lib/l=
ibaudit.h
+}
+
+do_install:append() {
+    sed -i -e 's|#include "audit.h"|#include <linux/audit.h>|g' ${D}${incl=
udedir}/libaudit.h
+
+    # Install default rules
+    install -d -m 750 ${D}/etc/audit
+    install -d -m 750 ${D}/etc/audit/rules.d
+
+    install -m 0640 ${S}/rules/10-base-config.rules ${D}/etc/audit/rules.d=
/audit.rules
+
+    # Based on the audit.spec "Copy default rules into place on new instal=
lation"
+    install -m 0640 ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audi=
t.rules
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false'=
, d)}; then
+        install -D -m 0755 ${UNPACKDIR}/auditd ${D}/etc/init.d/auditd
+    fi
+
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
+        rm -rf ${D}${nonarch_libdir}/systemd
+        rm -rf ${D}${nonarch_libdir}/tmpfiles.d
+
+        # Remove empty directory when enable multilib
+        rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}
+    fi
+
+    # Create /var/spool/audit directory for audisp-remote
+    install -d -m 0700 ${D}${localstatedir}/spool/audit
+}
+
+CVE_PRODUCT =3D "linux:audit"
--=20
2.53.0


