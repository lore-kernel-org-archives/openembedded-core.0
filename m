Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SpLRy-0000UO-Hn for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 17:37:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6CFPrEG020887
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 16:25:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20768-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 16:25:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6CFPjCn020881
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 16:25:46 +0100
Message-ID: <1342106747.22262.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2012 16:25:47 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] crosssdk/nativesdk: Ensure EXTRA_OECONF_FPU is unset
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
X-List-Received-Date: Thu, 12 Jul 2012 15:37:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If EXTRA_OECONF_FPU is left set, certain ARM variables related to hard-float
can get pulled in and trigger rebuilds of the crosssdk code. The best solution
is to simply force the variable to a known correct value for the SDK targets
currently supported in the same way as TARGET_FPU.

There is some slight rearrangement of the gcc code to ensure the variable is
always used to call the fpu function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 93aba70..f3a502a 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -28,3 +28,6 @@ baselib = "lib"
 
 do_populate_sysroot[stamp-extra-info] = ""
 do_package[stamp-extra-info] = ""
+
+# Need to force this to ensure consitency accross architectures
+EXTRA_OECONF_FPU = ""
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index a58fce2..7deaafc 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -36,6 +36,7 @@ TARGET_CC_ARCH = "${SDK_CC_ARCH}"
 TARGET_LD_ARCH = "${SDK_LD_ARCH}"
 TARGET_AS_ARCH = "${SDK_AS_ARCH}"
 TARGET_FPU = ""
+EXTRA_OECONF_FPU = ""
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 10cb512..93a6d78 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -22,7 +22,7 @@ EXTRA_OECONF = "--with-newlib \
 		--with-build-sysroot=${STAGING_DIR_TARGET} \
 		${EXTRA_OECONF_INITIAL} \
 		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
-		${@get_gcc_fpu_setting(bb, d)}"
+		${EXTRA_OECONF_FPU}"
 
 do_compile () {
     oe_runmake all-gcc all-target-libgcc
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index c940e54..e06926d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -23,7 +23,7 @@ EXTRA_OECONF = "--enable-shared \
 		--with-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
 		--with-build-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
 		${EXTRA_OECONF_INTERMEDIATE} \
-		${@get_gcc_fpu_setting(bb, d)} \
+		${EXTRA_OECONF_FPU} \
 		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}"
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"




