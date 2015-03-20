Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 947B06013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 10:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2KAcqE6030610 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 10:38:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id djJ-k_4T_KyH
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 10:38:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2KAcbR7030603
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 10:38:48 GMT
Message-ID: <1426847917.29168.69.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2015 10:38:37 +0000
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] gcc-cross-canadian: Enable stripping and packaging of binaries
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
X-List-Received-Date: Fri, 20 Mar 2015 10:38:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This seems to have been disabled since the dawn of time for now good reason.
Enable the .debug stripping and packaging allowing for a smaller SDK.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 0f79533..750a4f2 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -62,12 +62,10 @@ do_compile () {
 	oe_runmake all-host configure-target-libgcc
 }
 
-INHIBIT_PACKAGE_STRIP = "1"
-
 # Having anything auto depending on gcc-cross-sdk is a really bad idea...
 EXCLUDE_FROM_SHLIBS = "1"
 
-PACKAGES = "${PN} ${PN}-doc"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc"
 
 FILES_${PN} = "\
     ${exec_prefix}/bin/* \
@@ -86,6 +84,11 @@ FILES_${PN} = "\
 "
 INSANE_SKIP_${PN} += "dev-so"
 
+FILES_${PN}-dbg += " \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/.debug \
+"
+
 FILES_${PN}-doc = "\
     ${infodir} \
     ${mandir} \



