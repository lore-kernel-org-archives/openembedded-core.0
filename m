Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=AM1EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RLINx-0004z3-U1
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 18:44:31 +0100
Received: from mail110-am1-R.bigfish.com (10.3.201.248) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.22; Tue, 1 Nov 2011 17:38:06 +0000
Received: from mail110-am1 (localhost.localdomain [127.0.0.1])	by
	mail110-am1-R.bigfish.com (Postfix) with ESMTP id DCA0FDC849A	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 17:38:13 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzbb2dKzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail110-am1 (localhost.localdomain [127.0.0.1]) by mail110-am1
	(MessageSwitch) id 1320169056425485_10082;
	Tue,  1 Nov 2011 17:37:36 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.242])	by
	mail110-am1.bigfish.com (Postfix) with ESMTP id 5976BEE004E	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 17:37:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 1 Nov 2011 17:37:25 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Tue, 1 Nov 2011 12:37:37 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pA1Hbbkn028436	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 12:37:37 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Nov 2011 12:37:36 -0500
Message-ID: <1320169056-19008-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <CAEsOVNdEAk3PCiiNO=+aw6XPNOHseR_qn7JFNe0GBYikqymFpQ@mail.gmail.com>
References: <CAEsOVNdEAk3PCiiNO=+aw6XPNOHseR_qn7JFNe0GBYikqymFpQ@mail.gmail.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] dtc: update to latest git version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2011 17:44:32 -0000
Content-Type: text/plain

Also remove patches that are no longer needed, as well as use the
installation that is provided by the Makefile. Put all the extra
stuff in a new dtc-misc package

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-kernel/dtc/dtc.inc                    |   12 ++--
 .../dtc/fix_for_compilation_with_gcc_4.6.0.patch   |   51 --------------------
 meta/recipes-kernel/dtc/dtc/remove_space_opt.patch |   18 -------
 meta/recipes-kernel/dtc/dtc_git.bb                 |   10 +---
 4 files changed, 9 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch
 delete mode 100644 meta/recipes-kernel/dtc/dtc/remove_space_opt.patch

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index eae46ac..0f45d5f 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -6,13 +6,13 @@ DEPENDS = "flex-native bison-native"
 
 inherit autotools
 
-do_install() {
-	install -m 0755 -d ${D}${bindir}
-	install -m 755 dtc ${D}${bindir}/dtc
-}
 SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
-	file://fix_for_compilation_with_gcc_4.6.0.patch"
+	  "
 
-INC_PR = "r0"
+EXTRA_OEMAKE='PREFIX="${prefix}"'
+INC_PR = "r1"
 
 S = "${WORKDIR}/git"
+
+PACKAGES =+ "${PN}-misc"
+FILES_${PN}-misc = "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}/dtdiff"
diff --git a/meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch b/meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch
deleted file mode 100644
index b34894d..0000000
--- a/meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Upstream-Status: Pending
-
-Fix following compilation errors with gcc 4.6.0
-| dtc.c: In function 'main':
-| dtc.c:100:17: error: variable 'check' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-| 
-| make: *** [dtc.o] Error 1
-| make: *** Waiting for unfinished jobs....
-| flattree.c: In function 'flat_read_mem_reserve':
-| flattree.c:700:14: error: variable 'p' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-| 
-| make: *** [flattree.o] Error 1
-| ERROR: oe_runmake failed
-
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
-
-Index: git/dtc.c
-===================================================================
---- git.orig/dtc.c
-+++ git/dtc.c
-@@ -97,7 +97,7 @@ int main(int argc, char *argv[])
- 	const char *inform = "dts";
- 	const char *outform = "dts";
- 	const char *outname = "-";
--	int force = 0, check = 0;
-+	int force = 0, __attribute__((__unused__)) check = 0;
- 	const char *arg;
- 	int opt;
- 	FILE *outf = NULL;
-Index: git/flattree.c
-===================================================================
---- git.orig/flattree.c
-+++ git/flattree.c
-@@ -697,7 +697,6 @@ static struct reserve_info *flat_read_me
- {
- 	struct reserve_info *reservelist = NULL;
- 	struct reserve_info *new;
--	const char *p;
- 	struct fdt_reserve_entry re;
- 
- 	/*
-@@ -706,7 +705,6 @@ static struct reserve_info *flat_read_me
- 	 *
- 	 * First pass, count entries.
- 	 */
--	p = inb->ptr;
- 	while (1) {
- 		flat_read_chunk(inb, &re, sizeof(re));
- 		re.address  = fdt64_to_cpu(re.address);
diff --git a/meta/recipes-kernel/dtc/dtc/remove_space_opt.patch b/meta/recipes-kernel/dtc/dtc/remove_space_opt.patch
deleted file mode 100644
index 8c26dec..0000000
--- a/meta/recipes-kernel/dtc/dtc/remove_space_opt.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Remove the -Os flag
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
- CPPFLAGS = -I libfdt
- WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
- 	-Wstrict-prototypes -Wmissing-prototypes
--CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
-+CFLAGS = -g -fPIC -Werror $(WARNINGS)
- 
- BISON = bison
- LEX = flex
diff --git a/meta/recipes-kernel/dtc/dtc_git.bb b/meta/recipes-kernel/dtc/dtc_git.bb
index e010488..c205de7 100644
--- a/meta/recipes-kernel/dtc/dtc_git.bb
+++ b/meta/recipes-kernel/dtc/dtc_git.bb
@@ -3,14 +3,10 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "73dca9ae0b9abe6924ba640164ecce9f8df69c5a"
+SRCREV = "033089f29099bdfd5c2d6986cdb9fd07b16cfde0"
 PV = "1.3.0+git${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/git"
 
-SRC_URI_PATCH = " file://remove_space_opt.patch"
-SRC_URI_PATCH_virtclass-native = ""
-SRC_URI += "${SRC_URI_PATCH}"
-
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.1




