Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rve7z-0001D8-6h for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 01:14:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1A06AXU023983
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:06:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22429-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:06:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1A063HH023977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:06:04 GMT
Message-ID: <1328832372.10451.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 00:06:12 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gcc-4.6: Some small performance tweaks
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
X-List-Received-Date: Fri, 10 Feb 2012 00:14:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

a) Use the system zlib to avoid building it for each gcc.
b) -initial and -intermediate don't need plugins or lto-plugin
   so disable them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 758c93e..ece378d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -23,7 +23,7 @@ BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
 DEPENDS =+ "mpfr gmp libmpc"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
 
 LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
 
@@ -86,16 +86,12 @@ B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
 FORTRAN = ""
 JAVA = ""
 
-#EXTRA_OECONF_BASE = "  --enable-cheaders=c_std \
-#			--enable-libssp \
-#			--disable-bootstrap \
-#			--disable-libgomp \
-#			--disable-libmudflap"
 EXTRA_OECONF_BASE = " --enable-lto \
 			--enable-libssp \
 			--disable-bootstrap \
 			--disable-libgomp \
 			--disable-libmudflap \
+			--with-system-zlib \
 			--with-linker-hash-style=${LINKER_HASH_STYLE} \
 			--enable-cheaders=c_global "
 
@@ -103,11 +99,17 @@ EXTRA_OECONF_INITIAL = "--disable-libmudflap \
 			--disable-libgomp \
 			--disable-libssp \
 			--disable-libquadmath \
+			--with-system-zlib \
+			--disable-lto \
+			--disable-plugin \
 			--enable-decimal-float=no"
 
 EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
 				--disable-libgomp \
 				--disable-libquadmath \
+				--with-system-zlib \
+				--disable-lto \
+				--disable-plugin \
 				--disable-libssp"
 
 EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "




