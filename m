Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQpho-0007Yv-G5 for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 01:19:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAH0DT5Q009925
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 00:13:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09233-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 00:13:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAH0DKnv009919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 00:13:22 GMT
Message-ID: <1321488805.18905.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 00:13:25 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libtool-cross: Upbreak and actually use more of it
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
X-List-Received-Date: Thu, 17 Nov 2011 00:19:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We should be using libtool-cross for cross compiling but
were not. This patch sets datadir so libtoolize ends up
containing correct paths. It then installs libtoolize.

The path ltmain.sh was installed to was incorrect and this is fixed.

We also now install all the libtool m4 macros.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
index 596528a..4e6e3f2 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
@@ -1,10 +1,13 @@
 require libtool-${PV}.inc
 
-PR = "r5"
+PR = "r7"
 PACKAGES = ""
 SRC_URI += "file://prefix.patch"
 SRC_URI += "file://fixinstall.patch"
 
+target_datadir := "${datadir}"
+datadir = "${STAGING_DIR_TARGET}${target_datadir}"
+
 do_configure_prepend () {
 	# Remove any existing libtool m4 since old stale versions would break
 	# any upgrade
@@ -13,20 +16,21 @@ do_configure_prepend () {
 }
 
 do_install () {
-	install -d ${D}${bindir}/
-	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
-	install -d ${D}${datadir}/libtool/
-	install -d ${D}${datadir}/aclocal/
-	install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/
-	install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/
-	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/
-	install -c -m 0644 ${S}/libltdl/m4/libtool.m4 ${D}${datadir}/aclocal/
-	install -c -m 0644 ${S}/libltdl/m4/ltdl.m4 ${D}${datadir}/aclocal/
+	install -d ${D}${bindir_crossscripts}/
+	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
+	install -d ${D}${bindir_crossscripts}/
+	install -m 0755 libtoolize ${D}${bindir_crossscripts}/
+	install -d ${D}${target_datadir}/libtool/config/
+	install -d ${D}${target_datadir}/aclocal/
+	install -c ${S}/libltdl/config/config.guess ${D}${target_datadir}/libtool/
+	install -c ${S}/libltdl/config/config.sub ${D}${target_datadir}/libtool/
+	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${target_datadir}/libtool/config/
+	install -c -m 0644 ${S}/libltdl/m4/*.m4 ${D}${target_datadir}/aclocal/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "libtoolcross_sysroot_preprocess"
 
 libtoolcross_sysroot_preprocess () {
-	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-	install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${bindir_crossscripts}/${HOST_SYS}-libtool
+	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
+	sysroot_stage_dir ${D}${target_datadir} ${SYSROOT_DESTDIR}${target_datadir}
 }




