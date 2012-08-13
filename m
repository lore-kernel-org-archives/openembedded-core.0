Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T12Ac-0004sA-Mc
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 23:27:30 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 976AC3042D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:15:27 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 14:14:44 -0700
Message-Id: <e1609123a6ca6aef18e48afe0ce61325da910fc1.1344892361.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 976AC3042D.1A295
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 03/32] libxml-parser-perl_2.41.bb: fix MakeMaker issues with using wrong CC/LD/etc
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
X-List-Received-Date: Mon, 13 Aug 2012 21:27:31 -0000

From: Matthew McClintock <msm@freescale.com>

MakeMaker has a bug where it does not propagate CC/LD/etc information
down to subproject it generates Makefiles for... this recipe has has an
Expat subproject which has issues building if we are using sstate-cache
and it will reference the old sysroots and be unable to build properly.
There is an upstream MakeMaker bug for this issue but we can work around
it by fixing up the Makefiles for now

See:
https://rt.cpan.org/Public/Bug/Display.html?id=28632

Signed-off-by: Matthew McClintock <msm@freescale.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../perl/libxml-parser-perl_2.41.bb                |   11 +++++++++--
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
1.7.9.5



