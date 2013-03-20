Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIFJt-0001UI-G0
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 10:28:31 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id CDF99D20D2;
	Wed, 20 Mar 2013 10:11:42 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 10:11:36 +0100
Message-Id: <1363770696-2908-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <51493825.5050802@linux.intel.com>
References: <51493825.5050802@linux.intel.com>
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
X-List-Received-Date: Wed, 20 Mar 2013 09:28:32 -0000

Elfutils contains libraries which are often used by other
applications/libraries. But sometimes there are also conflicting
packages needed - for example libdw-dev conflicts with libdwarf-dev
because both provide /usr/include/dwarf.h header file.

This change makes it more in line with Debian based systems. It also
allows to have libdwarf-dev installed in image without having to go into
ugly hacks or rewriting 3rdparty software.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index e8d58fb..dfed235 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -68,7 +68,7 @@ EXTRA_OEMAKE_class-nativesdk = ""
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-PACKAGES =+ "${PN}-binutils"
+PACKAGES =+ "${PN}-binutils libelf libasm libdw libdw-dev libasm-dev libelf-dev"
 FILES_${PN}-binutils = "\
     ${bindir}/eu-addr2line \
     ${bindir}/eu-ld \
@@ -77,11 +77,16 @@ FILES_${PN}-binutils = "\
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
1.8.1.2



