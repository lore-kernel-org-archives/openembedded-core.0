Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1C75870CD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 22:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EMAELL004141 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 23:10:14 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eM66g8xGUQBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 23:10:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EMA9KR004137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 23:10:10 +0100
Message-ID: <1408054209.21596.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 23:10:09 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] lttng-tools/lttng-ust: Drop old 2.3.1 versions
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
X-List-Received-Date: Thu, 14 Aug 2014 22:10:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
deleted file mode 100644
index db8b65b..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Linux Trace Toolkit Control"
-DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
-to extract program execution details from the Linux operating system \
-and interpret them."
-
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
-                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
-
-DEPENDS = "liburcu popt lttng-ust"
-RDEPENDS_${PN}-ptest += "make"
-
-SRCREV = "5d985544a7ad54afa0514ea7f522a89d8d844860"
-PV = "v2.3.1"
-
-SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.3 \
-           file://runtest.patch \
-           file://run-ptest \
-           file://Fix-alignment-problems-on-targets-not-supporting-una.patch \
-	  "
-
-S = "${WORKDIR}/git"
-
-inherit autotools-brokensep ptest
-
-export KERNELDIR="${STAGING_KERNEL_DIR}"
-
-FILES_${PN} += "${libdir}/lttng/libexec/*"
-FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
-
-# Since files are installed into ${libdir}/lttng/libexec we match 
-# the libexec insane test so skip it.
-INSANE_SKIP_${PN} = "libexec"
-INSANE_SKIP_${PN}-dbg = "libexec"
-
-
-do_install_ptest () {
-	chmod +x ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
-	for i in `find ${D}/${libdir}/${PN}/ptest -perm /u+x -type f`; do
-		sed -e "s:\$TESTDIR.*/src/bin/lttng/\$LTTNG_BIN:\$LTTNG_BIN:g" \
-		  -e "s:\$TESTDIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
-		  -e "s:\$DIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
-		  -e "s:\$TESTDIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:g" \
-		  -e "s:\$DIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:g" \
-		  -e "s:\$TESTDIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
-		  -e "s:\$DIR/../src/bin/lttng-sessiond/lttng-sessiond:\$SESSIOND_BIN:g" \
-		  -e "s:\$DIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
-		  -e "s:\$DIR/../bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
-		  -i $i
-	done
-
-	sed -e "s:src/bin/lttng-sessiond:$bindir:g" \
-	    -e "s:src/bin/lttng-consumerd:${libexecdir}/libexec/:g" \
-	-i ${D}/${libdir}/${PN}/ptest/tests/regression/run-report.py
-	sed -e "s:src/bin:bin:g" \
-	-i ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
-
-}
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
deleted file mode 100644
index 44e3e2b..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.x"
-DESCRIPTION = "The LTTng UST 2.x package contains the userspace tracer library to trace userspace codes."
-HOMEPAGE = "http://lttng.org/ust"
-BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
-
-LICENSE = "LGPLv2.1+ & BSD & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
-                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
-                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
-
-inherit autotools lib_package
-
-DEPENDS = "liburcu util-linux"
-RDEPENDS_${PN} = "python"
-
-# For backwards compatibility after rename
-RPROVIDES_${PN} = "lttng2-ust"
-RREPLACES_${PN} = "lttng2-ust"
-RCONFLICTS_${PN} = "lttng2-ust"
-
-SRCREV = "535d0408caee93577c2b4d8ad3cd672fa97eac1d"
-PV = "2.3.1"
-PE = "2"
-
-SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.3 \
-	   "
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend () {
-	( cd ${S}; ${S}/bootstrap )
-}



