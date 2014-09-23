Return-Path: <ting.liu@freescale.com>
X-Greylist: delayed 913 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Sep 2014 09:40:31 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0145.outbound.protection.outlook.com [157.56.110.145])
	by mail.openembedded.org (Postfix) with ESMTP id DCBFB617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 09:40:31 +0000 (UTC)
Received: from BN3PR0301CA0013.namprd03.prod.outlook.com (25.160.180.151) by
	BL2PR03MB147.namprd03.prod.outlook.com (10.255.230.19) with Microsoft
	SMTP Server (TLS) id 15.0.1034.13; Tue, 23 Sep 2014 09:25:17 +0000
Received: from BY2FFO11FD022.protection.gbl (2a01:111:f400:7c0c::197) by
	BN3PR0301CA0013.outlook.office365.com (2a01:111:e400:4000::23) with
	Microsoft SMTP Server (TLS) id 15.0.1034.13 via Frontend Transport;
	Tue, 23 Sep 2014 09:25:17 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD022.mail.protection.outlook.com (10.1.15.211) with Microsoft
	SMTP
	Server (TLS) id 15.0.1029.15 via Frontend Transport; Tue, 23 Sep 2014
	09:25:16 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s8N9PAMu013848; Tue, 23 Sep 2014 02:25:11 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 17:20:16 +0800
Message-ID: <1411464016-8068-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.8.3.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(229853001)(80022003)(79102003)(50466002)(95666004)(74502003)(106466001)(26826002)(2351001)(107046002)(102836001)(83322001)(77156001)(19580405001)(48376002)(83072002)(99396002)(19580395003)(85852003)(46102003)(77982003)(104166001)(10300001)(81342003)(74662003)(120916001)(33646002)(31966008)(81542003)(84676001)(105606002)(62966002)(15202345003)(92566001)(92726001)(88136002)(86152002)(76482002)(89996001)(36756003)(20776003)(47776003)(64706001)(85306004)(110136001)(44976005)(6806004)(104016003)(21056001)(90102001)(50986999)(68736004)(87286001)(87936001)(93916002)(86362001)(4396001)(97736003)(15975445006)(50226001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB147;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB147;
X-Forefront-PRVS: 0343AC1D30
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] valgrind: pass -maltivec only if it supported
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
X-List-Received-Date: Tue, 23 Sep 2014 09:40:41 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

none/tests/ppc64/Makefile.am (and ppc32, too) passes the flag -maltivec
unconditionally. Build will fail if Altivec not supported. add the flag
only if HAS_ALTIVEC defined.

Reference:
see https://bugs.kde.org/show_bug.cgi?id=338731

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 .../pass-maltivec-only-if-it-supported.patch       | 68 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
new file mode 100644
index 0000000..3781466
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
@@ -0,0 +1,68 @@
+Upstream-status: pending
+
+pass -maltivec only if it supported
+
+none/tests/ppc64/Makefile.am (and ppc32, too) passes the flag -maltivec 
+unconditionally. Build will fail if Altivec not supported. add the flag 
+only if HAS_ALTIVEC defined.
+
+Reference:
+see https://bugs.kde.org/show_bug.cgi?id=338731
+
+Index: none/tests/ppc32/Makefile.am
+===================================================================
+--- a/none/tests/ppc32/Makefile.am	(revision 14477)
++++ b/none/tests/ppc32/Makefile.am	(working copy)
+@@ -72,8 +72,10 @@
+ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+ 
+ if HAS_ALTIVEC
++BUILD_FLAG_ALTIVEC = -maltivec
+ ALTIVEC_FLAG = -DHAS_ALTIVEC
+ else
++BUILD_FLAG_ALTIVEC =
+ ALTIVEC_FLAG =
+ endif
+ 
+@@ -101,11 +103,11 @@
+ ISA_2_07_FLAG =
+ endif
+ 
+-jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec \
+-			@FLAG_M32@ $(ALTIVEC_FLAG)
++jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
++			@FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
+ 
+-testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -maltivec -mabi=altivec -DALTIVEC \
+-			-DGCC_COMPILER @FLAG_M32@
++testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -mabi=altivec -DALTIVEC \
++			-DGCC_COMPILER @FLAG_M32@  $(BUILD_FLAG_ALTIVEC)
+ 
+ test_isa_2_06_part1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(VSX_FLAG) \
+ 			@FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
+Index: none/tests/ppc64/Makefile.am
+===================================================================
+--- a/none/tests/ppc64/Makefile.am	(revision 14477)
++++ b/none/tests/ppc64/Makefile.am	(working copy)
+@@ -50,8 +50,10 @@
+ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+ 
+ if HAS_ALTIVEC
++BUILD_FLAG_ALTIVEC = -maltivec
+ ALTIVEC_FLAG = -DHAS_ALTIVEC
+ else
++BUILD_FLAG_ALTIVEC =
+ ALTIVEC_FLAG =
+ endif
+ 
+@@ -88,8 +90,8 @@
+ test_isa_2_06_part3_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(VSX_FLAG) \
+ 			@FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
+ 
+-jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec \
+-			@FLAG_M64@ $(ALTIVEC_FLAG)
++jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
++			@FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
+ 
+ test_dfp1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(DFP_FLAG) \
+ 			@FLAG_M64@ $(BUILD_FLAGS_DFP)
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index c415e77..58bb9eb 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://force-nostabs.patch \
            file://remove-arm-variant-specific.patch \
            file://remove-ppc-tests-failing-build.patch \
+           file://pass-maltivec-only-if-it-supported.patch \
            file://add-ptest.patch \
            file://run-ptest \
           "
-- 
1.8.3.2


