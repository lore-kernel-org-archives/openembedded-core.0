Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 435 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 27 Jan 2018 04:29:39 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E005D78875
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 04:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 914E818583
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 05:22:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id zgxJnGJ6Vncp
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 05:21:28 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 16D8518605
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 04:53:08 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD2B21E082
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 04:53:07 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C23881E080
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 04:53:07 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 04:53:07 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id B43F420D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 04:53:07 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w0R3r65U007117
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 04:53:06 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w0R3r6XM007116
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Jan 2018 04:53:06 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Jan 2018 04:53:03 +0100
Message-Id: <20180127035303.7076-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] glibc: Adapt do_install_append_aarch64() for usrmerge
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
X-List-Received-Date: Sat, 27 Jan 2018 04:29:40 -0000

Change hardcoded /lib to ${nonarch_base_libdir} to correctly adapt the
code in do_install_append_aarch64() for when usrmerge is enabled in
DISTRO_FEATURES.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 817d850358..4d3dc679b4 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -114,15 +114,15 @@ do_install_append () {
 }
 
 do_install_append_aarch64 () {
-	if [ "${base_libdir}" != "/lib" ] ; then
+	if [ "${base_libdir}" != "${nonarch_base_libdir}" ]; then
 		# The aarch64 ABI says the dynamic linker -must- be /lib/ld-linux-aarch64[_be].so.1
-		install -d ${D}/lib
+		install -d ${D}${nonarch_base_libdir}
 		if [ -e ${D}${base_libdir}/ld-linux-aarch64.so.1 ]; then
-			ln -s ${@base_path_relative('/lib', '${base_libdir}')}/ld-linux-aarch64.so.1 \
-				${D}/lib/ld-linux-aarch64.so.1
+			ln -s ${@base_path_relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64.so.1 \
+				${D}${nonarch_base_libdir}/ld-linux-aarch64.so.1
 		elif [ -e ${D}${base_libdir}/ld-linux-aarch64_be.so.1 ]; then
-			ln -s ${@base_path_relative('/lib', '${base_libdir}')}/ld-linux-aarch64_be.so.1 \
-				${D}/lib/ld-linux-aarch64_be.so.1
+			ln -s ${@base_path_relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64_be.so.1 \
+				${D}${nonarch_base_libdir}/ld-linux-aarch64_be.so.1
 		fi
 	fi
 	do_install_armmultilib
-- 
2.12.0


