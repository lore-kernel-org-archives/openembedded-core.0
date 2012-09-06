Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9eXS-0005Ju-1j for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 18:02:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q86FoH4k019255;
	Thu, 6 Sep 2012 16:50:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04992-03; Thu,  6 Sep 2012 16:50:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q86FoAmf019249
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 6 Sep 2012 16:50:11 +0100
Message-ID: <1346946610.7493.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Sep 2012 16:50:10 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gcc-cross-initial: Reinstate limits.h generation fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 16:02:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The removal of gcc-cross-intermediate inadvertently reintroduced a
problem with the limits.h file being incorrectly/inconsistently
generated.

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b0faebd1f07e1616004bd19664395932e7c2c48f
reverted part of:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=c8815d2f21849deb9359706f54dc71490773415e

This reintroduces the protected sysroot ensuring the limits.h file is
always correctly generated. To reproduce the bug, build gcc-cross, then
rebuild gcc-cross-initial and it will reference the limits.h file from
gcc-cross in the sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index be47f85..ff6556c 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -19,7 +19,7 @@ EXTRA_OECONF = "--with-newlib \
                 ${OPTSPACE} \
 		--program-prefix=${TARGET_PREFIX} \
 		--with-sysroot=${STAGING_DIR_TARGET} \
-		--with-build-sysroot=${STAGING_DIR_TARGET} \
+		--with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
 		${EXTRA_OECONF_INITIAL} \
 		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
 		${EXTRA_OECONF_FPU}"



