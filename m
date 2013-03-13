Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UFjb3-0005Iw-Lz
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 12:11:55 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E20EAD22B2;
	Wed, 13 Mar 2013 11:55:10 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 11:55:07 +0100
Message-Id: <1363172107-11549-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] elfutils: split libraries into separate packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 11:11:57 -0000

Elfutils contains libraries which are often used by other
applications/libraries. But sometimes there are also conflicting
packages needed - for example libdw-dev conflicts with libdwarf-dev
because both provide /usr/include/dwarf.h header file.

This change makes it more in line with Debian based systems. It also
allows to have libdwarf-dev installed in image without having to go into
ugly hacks or rewriting 3rdparty software.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 45931b0..8bd32f8 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -66,7 +66,7 @@ EXTRA_OEMAKE_class-nativesdk = ""
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-PACKAGES =+ "${PN}-binutils"
+PACKAGES =+ "${PN}-binutils libelf libasm libdw libdw-dev libasm-dev libelf-dev"
 FILES_${PN}-binutils = "\
     ${bindir}/eu-addr2line \
     ${bindir}/eu-ld \
@@ -75,11 +75,16 @@ FILES_${PN}-binutils = "\
     ${bindir}/eu-size \
     ${bindir}/eu-strip"
 
+FILES_libelf = "${libdir}/libelf-${PV}.so ${libdir}/libelf.so.*"
+FILES_libasm = "${libdir}/libasm-${PV}.so ${libdir}/libasm.so.*"
+FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils/lib*"
+FILES_libelf-dev = "${libdir}/libelf.so ${includedir}"
+FILES_libasm-dev = "${libdir}/libasm.so ${includedir}/elfutils/libasm.h"
+FILES_libdw-dev  = "${libdir}/libdw.so  ${includedir}/dwarf.h ${includedir}/elfutils/libdw*.h"
 # Some packages have the version preceeding the .so instead properly
 # versioned .so.<version>, so we need to reorder and repackage.
-FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
-FILES_SOLIBSDEV = "${libdir}/libasm.so ${libdir}/libdw.so ${libdir}/libelf.so"
+#FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
+#FILES_SOLIBSDEV = "${libdir}/libasm.so ${libdir}/libdw.so ${libdir}/libelf.so"
 
 # The package contains symlinks that trip up insane
-INSANE_SKIP_${PN} = "dev-so"
-
+INSANE_SKIP_libdw = "dev-so"
-- 
1.8.0



