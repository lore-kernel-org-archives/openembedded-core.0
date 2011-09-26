Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8Hde-0005z3-4R for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 22:18:54 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QKJnrq012520 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 21:19:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hQbhLkDDc5L0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 21:19:49 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QKJjsZ012516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 21:19:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 21:13:21 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317068008.26109.94.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] gcc: Fix two QA issues
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
X-List-Received-Date: Mon, 26 Sep 2011 20:18:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

a) There is a QA warning from a .so being present in a main package.
   In the case of the plugin library for gcc, this is allowed.
b) Remove the unwanted libiberty.a file with the strange path. We
   don't need/want this and this removes an unpackaged file warning.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
index 8dd4ef7..e2095e3 100644
--- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
@@ -19,6 +19,8 @@ FILES_${PN} = "\
     ${prefix}/${TARGET_SYS}/lib/* \
     ${prefix}/${TARGET_SYS}/usr/include/* \
     "
+INSANE_SKIP_${PN} += "dev-so"
+
 FILES_${PN}-doc = "\
     ${infodir} \
     ${mandir} \
@@ -40,6 +42,8 @@ do_install () {
 
 	# We use libiberty from binutils
 	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
+	# Not sure where the strange paths come from
+	rm -f ${D}${libdir}/../lib/libiberty.a
 	rm -f ${D}${libdir}/libiberty.a
 
 	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index a0e5da4..f0f1a04 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -24,6 +24,8 @@ FILES_${PN} = "\
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
 "
+INSANE_SKIP_${PN} += "dev-so"
+
 FILES_${PN}-dbg += "\
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
 "




