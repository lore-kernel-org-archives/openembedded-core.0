Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJR5h-0006ir-UY for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 17:10:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FF0ocF021828
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 16:00:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20693-06 for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 16:00:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FF0efe021822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 16:00:42 +0100
Message-ID: <1334502042.16992.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Apr 2012 16:00:42 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] pseudo: Ensure the correct libraries are used at runtime
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
X-List-Received-Date: Sun, 15 Apr 2012 15:10:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There can be a conflict between the nativesdk libc and the host system's
libc. It is assumed the nativesdk version is of an equal or higher version.
This is a particular issue for pseudo if its loading a system binary
since the system's libc might be used of an older verison which would
then confuse libpseudo.so when loaded as a preload.

To avoid this, set LD_LIBRARY_PATH so the nativesdk libc is always
used.

Since we now use --without-rpath, we can remove the MAKEOPTS RPATH workaround.

[YOCTO #2299]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index d710058..6ac1301 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -13,10 +13,7 @@ FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/p
 FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
 PROVIDES += "virtual/fakeroot"
 
-# In the nativesdk case, we'll already search the searchpaths
-# pseudo tries to build in so override RPATH
 MAKEOPTS = ""
-MAKEOPTS_virtclass-nativesdk = "'RPATH='"
 
 inherit siteinfo
 
@@ -78,6 +75,8 @@ do_install_append_virtclass-nativesdk () {
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
 	fi
+
+	create_wrapper ${D}${bindir}/pseudo LD_LIBRARY_PATH=${base_libdir}:${libdir}
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
index 080b739..b16b2d9 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.3.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7857275..5771295 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,7 +2,7 @@ require pseudo.inc
 
 SRCREV = "f0375c9aaefbccfd41aebbf6d332bb4d9e8f980c"
 PV = "1.3+git${SRCPV}"
-PR = "r23"
+PR = "r24"
 
 DEFAULT_PREFERENCE = "-1"
 




