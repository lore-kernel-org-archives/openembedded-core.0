Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SmsDV-0004Hi-R6
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 21:59:58 +0200
Received: from mail4-co1-R.bigfish.com (10.243.78.254) by
	CO1EHSOBE012.bigfish.com (10.243.66.75) with Microsoft SMTP Server id
	14.1.225.23; Thu, 5 Jul 2012 19:16:35 +0000
Received: from mail4-co1 (localhost [127.0.0.1])	by mail4-co1-R.bigfish.com
	(Postfix) with ESMTP id 18B41C0025B	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:16:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail4-co1 (localhost.localdomain [127.0.0.1]) by mail4-co1
	(MessageSwitch) id 1341515792262203_13137;
	Thu,  5 Jul 2012 19:16:32 +0000 (UTC)
Received: from CO1EHSMHS006.bigfish.com (unknown [10.243.78.250])	by
	mail4-co1.bigfish.com (Postfix) with ESMTP id C8336AC0052	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:16:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS006.bigfish.com
	(10.243.66.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 5 Jul 2012 19:16:31 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Thu, 5 Jul 2012 14:18:35 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q65JIZ2V029521
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jul 2012 12:18:36
	-0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2012 14:18:35 -0500
Message-ID: <1341515915-28529-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] libxml-parser-perl_2.41.bb: fix MakeMaker issues with using wrong CC/LD/etc
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
X-List-Received-Date: Thu, 05 Jul 2012 19:59:58 -0000
Content-Type: text/plain

MakeMaker has a bug where it does not propagate CC/LD/etc information
down to subproject it generates Makefiles for... this recipe has has an
Expat subproject which has issues building if we are using sstate-cache
and it will reference the old sysroots and be unable to build properly.
There is an upstream MakeMaker bug for this issue but we can work around
it by fixing up the Makefiles for now

See:
https://rt.cpan.org/Public/Bug/Display.html?id=28632

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: -add '-i' to second sed argument that was missed
    -change sed delimeter to : instead of / to avoid escaping
     the bash variables

 meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
index be41578..33b4d83 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e
 
 DEPENDS += "expat expat-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
 SRC_URI[md5sum] = "c320d2ffa459e6cdc6f9f59c1185855e"
@@ -13,10 +13,17 @@ SRC_URI[sha256sum] = "b48197cd2265a26c5f016489f11a7b450d8833cb8b3d6a46ee15975740
 
 S = "${WORKDIR}/XML-Parser-${PV}"
 
-EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR} CC=${CC} LD=${LD} FULL_AR=${AR}"
 
 inherit cpan
 
+# fix up sub MakeMaker project as arguments don't get propagated though
+# see https://rt.cpan.org/Public/Bug/Display.html?id=28632
+do_configure_append() {
+	sed 's:--sysroot=.*\(\s\|$\):--sysroot=${STAGING_DIR_TARGET} :g' -i Makefile Expat/Makefile
+	sed 's:^FULL_AR = .*:FULL_AR = ${AR}:g' -i Expat/Makefile
+}
+
 do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
 	cpan_do_compile
-- 
1.7.10




