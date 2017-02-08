Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E22DE71A99
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 23:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYa0Z000363; Wed, 8 Feb 2017 23:34:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LTUAS4lMbIvV; Wed,  8 Feb 2017 23:34:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYYcq000342
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Feb 2017 23:34:35 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cbbkw-0006QL-Er; Wed, 08 Feb 2017 23:34:34 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 23:34:25 +0000
Message-Id: <1486596869-24628-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/7] gcc-cross-initial: Remove unneeded temporary sysroot
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
X-List-Received-Date: Wed, 08 Feb 2017 23:34:38 -0000

We used to need to build gcc-cross-initial against a bare sysroot to avoid
contamination. With RSS, we no longer need to do this since the recipe sysroot
is already bare. We can therefore simply point at that and drop this code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross-initial.inc | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index dd35681..5c0208a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -24,7 +24,7 @@ EXTRA_OECONF = "\
     --enable-languages=c \
     --program-prefix=${TARGET_PREFIX} \
     --with-sysroot=/not/exist \
-    --with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
     ${EXTRA_OECONF_INITIAL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
     ${EXTRA_OECONF_GCC_FLOAT} \
@@ -33,17 +33,6 @@ EXTRA_OECONF = "\
 
 EXTRA_OECONF += "--with-native-system-header-dir=${SYSTEMHEADERS}"
 
-GCCCROSS_BUILDSYSROOT = "${B}/tmpsysroot"
-
-do_configure_prepend () {
-	sysr=${GCCCROSS_BUILDSYSROOT}${target_includedir}
-	mkdir -p $sysr
-	for t in linux asm asm-generic; do
-		rm -f $sysr/$t
-		ln -s ${STAGING_DIR_TARGET}${target_includedir}/$t $sysr/
-	done
-}
-
 do_compile () {
     oe_runmake all-gcc configure-target-libgcc
 }
-- 
2.7.4


