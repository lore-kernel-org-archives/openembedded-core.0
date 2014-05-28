Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.143])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4A86FB85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 13:24:51 +0000 (UTC)
Received: from BLUPR03CA033.namprd03.prod.outlook.com (10.141.30.26) by
	BY2PR03MB363.namprd03.prod.outlook.com (10.242.237.16) with Microsoft
	SMTP Server (TLS) id 15.0.949.11; Wed, 28 May 2014 13:24:49 +0000
Received: from BY2FFO11FD007.protection.gbl (2a01:111:f400:7c0c::103) by
	BLUPR03CA033.outlook.office365.com (2a01:111:e400:879::26) with
	Microsoft SMTP Server (TLS) id 15.0.949.11 via Frontend Transport;
	Wed, 28 May 2014 13:24:48 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD007.mail.protection.outlook.com (10.1.14.128) with Microsoft
	SMTP Server (TLS) id 15.0.949.9 via Frontend Transport;
	Wed, 28 May 2014 13:24:48 +0000
Received: from fsr-ub1264-102.ea.freescale.net
	(fsr-ub1264-102.ea.freescale.net [10.171.74.5])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s4SDOjgH010710;
	Wed, 28 May 2014 06:24:47 -0700
From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 16:24:41 +0300
Message-ID: <1401283484-28186-1-git-send-email-alexandru.sardan@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(377424004)(92566001)(44976005)(76482001)(92726001)(46102001)(81542001)(83322001)(77156001)(89996001)(575784001)(19580405001)(19580395003)(93916002)(83072002)(85852003)(81342001)(21056001)(77982001)(62966002)(104166001)(79102001)(4396001)(97736001)(87286001)(6806004)(99396002)(47776003)(50986999)(88136002)(20776003)(74662001)(31966008)(74502001)(77096999)(48376002)(102836001)(33646001)(50226001)(84676001)(64706001)(81156002)(87936001)(104016001)(26826002)(36756003)(86362001)(50466002)(69596002)(68736004)(80022001)(15975445006);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB363;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Forefront-PRVS: 0225B0D5BC
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=alexandru.sardan@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] gcc: add patch to fix errors with Decimal64 type
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 May 2014 13:24:55 -0000
Content-Type: text/plain

[OE-core bug #6270] - https://bugzilla.yoctoproject.org/show_bug.cgi?id=6270

Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
 ...-E500-SPE-errors-with-the-_Decimal64-type.patch |   98 ++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index a409430..9b4fc2c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -65,6 +65,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
 	   file://0050-Revert-Use-dbx_reg_number-for-spanning-registers.patch \
            file://0051-eabispe.patch \
+           file://0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch \
 	  "
 SRC_URI[md5sum] = "9709b49ae0e904cbb0a6a1b62853b556"
 SRC_URI[sha256sum] = "b9b047a97bade9c1c89970bc8e211ff57b7b8998a1730a80a653d329f8ed1257"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch b/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
new file mode 100644
index 0000000..ccfea9d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
@@ -0,0 +1,98 @@
+From e44a6d438db4848c2a555be773568a3cf7994206 Mon Sep 17 00:00:00 2001
+From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
+Date: Mon, 26 May 2014 12:11:13 +0300
+Subject: [PATCH] Fix E500 with SPE errors with the _Decimal64 type
+
+[gcc]
+2014-04-21 Michael Meissner  <meissner@linux.vnet.ibm.com>
+
+	PR target/60735
+	* config/rs6000/rs6000.md (mov<mode>_softfloat32, FMOVE64 case):
+	If mode is DDmode and TARGET_E500_DOUBLE allow move.
+
+	* config/rs6000/rs6000.c (rs6000_debug_reg_global): Print some
+	more debug information for E500 if -mdebug=reg.
+
+[gcc/testsuite]
+2014-04-21  Michael Meissner  <meissner@linux.vnet.ibm.com>
+
+	PR target/60735
+	* gcc.target/powerpc/pr60735.c: New test.  Insure _Decimal64 does
+	not cause errors if -mspe.
+
+Upstream status: Accepted
+
+This solves upstream bug 60735 
+(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60735).
+
+Patch taken from https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=209664
+---
+ gcc/config/rs6000/rs6000.c                 |   18 ++++++++++++++++++
+ gcc/config/rs6000/rs6000.md                |    3 ++-
+ gcc/testsuite/gcc.target/powerpc/pr60735.c |   11 +++++++++++
+ 3 files changed, 31 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/powerpc/pr60735.c
+
+diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
+index 494efc5..6dcf440 100644
+--- a/gcc/config/rs6000/rs6000.c
++++ b/gcc/config/rs6000/rs6000.c
+@@ -2283,6 +2283,24 @@ rs6000_debug_reg_global (void)
+   if (rs6000_float_gprs)
+     fprintf (stderr, DEBUG_FMT_S, "float_gprs", "true");
+ 
++  fprintf (stderr, DEBUG_FMT_S, "fprs",
++	   (TARGET_FPRS ? "true" : "false"));
++
++  fprintf (stderr, DEBUG_FMT_S, "single_float",
++	   (TARGET_SINGLE_FLOAT ? "true" : "false"));
++
++  fprintf (stderr, DEBUG_FMT_S, "double_float",
++	   (TARGET_DOUBLE_FLOAT ? "true" : "false"));
++
++  fprintf (stderr, DEBUG_FMT_S, "soft_float",
++	   (TARGET_SOFT_FLOAT ? "true" : "false"));
++
++  fprintf (stderr, DEBUG_FMT_S, "e500_single",
++	   (TARGET_E500_SINGLE ? "true" : "false"));
++
++  fprintf (stderr, DEBUG_FMT_S, "e500_double",
++	   (TARGET_E500_DOUBLE ? "true" : "false"));
++
+   if (TARGET_LINK_STACK)
+     fprintf (stderr, DEBUG_FMT_S, "link_stack", "true");
+ 
+diff --git a/gcc/config/rs6000/rs6000.md b/gcc/config/rs6000/rs6000.md
+index 64c9e7c..9cefe15 100644
+--- a/gcc/config/rs6000/rs6000.md
++++ b/gcc/config/rs6000/rs6000.md
+@@ -9395,7 +9395,8 @@
+ 	(match_operand:FMOVE64 1 "input_operand" "r,Y,r,G,H,F"))]
+   "! TARGET_POWERPC64 
+    && ((TARGET_FPRS && TARGET_SINGLE_FLOAT) 
+-       || TARGET_SOFT_FLOAT || TARGET_E500_SINGLE)
++       || TARGET_SOFT_FLOAT || TARGET_E500_SINGLE
++       || (<MODE>mode == DDmode && TARGET_E500_DOUBLE))
+    && (gpc_reg_operand (operands[0], <MODE>mode)
+        || gpc_reg_operand (operands[1], <MODE>mode))"
+   "#"
+diff --git a/gcc/testsuite/gcc.target/powerpc/pr60735.c b/gcc/testsuite/gcc.target/powerpc/pr60735.c
+new file mode 100644
+index 0000000..9bac30b
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/powerpc/pr60735.c
+@@ -0,0 +1,11 @@
++/* { dg-do compile } */
++/* { dg-options "-mcpu=8548 -mspe -mabi=spe -O2" } */
++/* { dg-skip-if "not an SPE target" { ! powerpc_spe_nocache } { "*" } { "" } } */
++
++/* In PR60735, the type _Decimal64 generated an insn not found message.  */
++
++void
++pr60735 (_Decimal64 *p, _Decimal64 *q)
++{
++  *p = *q;
++}
+-- 
+1.7.9.5
+
-- 
1.7.9.5


