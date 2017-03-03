Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6BE77697
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23Bt1Qh007593; Fri, 3 Mar 2017 11:55:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uxQajSoNEl3P; Fri,  3 Mar 2017 11:55:01 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23Bsv2Y007588
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Mar 2017 11:54:58 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cjlnV-00065v-7v; Fri, 03 Mar 2017 11:54:57 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 11:54:56 +0000
Message-Id: <1488542096-23389-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gcc-runtime: Add libmpx supprt for x86
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
X-List-Received-Date: Fri, 03 Mar 2017 11:55:03 -0000

Enabling building the Intel Memory Protection Extension library for x86.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 745cf74..614b070 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -24,8 +24,8 @@ RUNTIMELIBITM_microblaze = ""
 RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
 "
+RUNTIMETARGET_append_x86 = " libmpx"
 
-#  ?
 # libiberty
 # libmudflap
 # libgfortran needs separate recipe due to libquadmath dependency
@@ -139,6 +139,11 @@ PACKAGES = "\
     libitm-dev \
     libitm-staticdev \
 "
+PACKAGES_append_x86 = "\
+    libmpx \
+    libmpx-dev \
+    libmpx-staticdev \
+"
 
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
@@ -243,6 +248,19 @@ SUMMARY_libitm-dev = "GNU transactional memory support library - development fil
 FILES_libitm-staticdev = "${libdir}/libitm.a"
 SUMMARY_libitm-staticdev = "GNU transactional memory support library - static development files"
 
+
+FILES_libmpx = "${libdir}/libmpx.so.* ${libdir}/libmpxwrappers.so.*"
+SUMMARY_libmpx = "Intel Memory Protection Extension library"
+FILES_libmpx-dev = "\
+    ${libdir}/libmpxwrappers.so \
+    ${libdir}/libmpx.so \
+    ${libdir}/libmpx.la \
+    ${libdir}/libmpx.spec \
+"
+SUMMARY_libmpx-dev = "Intel Memory Protection Extension library - development files"
+FILES_libmpx-staticdev = "${libdir}/libmpx.a ${libdir}/libmpxwrappers.a"
+SUMMARY_libmpx-staticdev = "Intel Memory Protection Extension library - static development files"
+
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-- 
2.7.4


