Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4Fsv-00084I-0U for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 20:42:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MIUROJ005459
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 19:30:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04504-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 19:30:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MIUKHW005452
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 19:30:21 +0100
Message-ID: <1345660222.3907.126.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Aug 2012 19:30:22 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gmp-4.2.1: Set CC_FOR_BUILD to ensure the host system compiler is used, not the target one
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
X-List-Received-Date: Wed, 22 Aug 2012 18:42:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This addresses errors like:

| NOTE: make -j 16
| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86 `test -f 'gen-fac_ui.c' || echo './'`gen-fac_ui.c -o gen-fac_ui
| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86 `test -f 'gen-fib.c' || echo './'`gen-fib.c -o gen-fib
| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86 `test -f 'gen-bases.c' || echo './'`gen-bases.c -o gen-bases -lm
| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/qemux86 `test -f 'gen-psqr.c' || echo './'`gen-psqr.c -o gen-psqr -lm
| ./gen-fac_ui 32 0 >mpz/fac_ui.h || (rm -f mpz/fac_ui.h; exit 1)
| ./gen-bases header 32 0 >mp_bases.h || (rm -f mp_bases.h; exit 1)
| ./gen-bases table 32 0 >mpn/mp_bases.c || (rm -f mpn/mp_bases.c; exit 1)
| ./gen-fib header 32 0 >fib_table.h || (rm -f fib_table.h; exit 1)
| ./gen-bases: error while loading shared libraries: libgcc_s.so.1: cannot open shared object file: No such file or directory
| ./gen-bases: error while loading shared libraries: libgcc_s.so.1: cannot open shared object file: No such file or directory
| ./gen-fib table 32 0 >mpn/fib_table.c || (rm -f mpn/fib_table.c; exit 1)
| make: *** [mp_bases.h] Error 1

and matches the fix for the other gmp version.

[YOCTO #2992]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 49ee59b..1f86a65 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -16,4 +16,6 @@ SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
 SRC_URI[sha256sum] = "d07ffcb37eecec35c5ec72516d10b35fdf6e6fef1fcf1dcd37e30b8cbf8bf941"
 
+export CC_FOR_BUILD = "${BUILD_CC}"
+
 inherit autotools




