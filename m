Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPDQi-0002UV-QO
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 14:43:17 +0200
Received: by bwz5 with SMTP id 5so7309265bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 05:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=aXawao4h3c9/HT+5qHjzDmOOna5nd1sbF05kG/cN/2I=;
	b=qMLijY0s1zu0OhCQF62K9PdI5pOI1JnJNACpRwb3ZKGXtV8F3fu4xkKCEMYU5pn1MX
	5zmWzOVVNAdenwt9QkSt46xzne5TYzJyyT/8eo2KAjSweNvO22LS68wNjARpmTw1PGy2
	+qkqncj1oHycsp5zRdVgrgric/9yQBzY9c1GQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=QG8KeodHbDX9gxHoH4Cm1Qzb8xhpp0JKmJ+AI8HS3TRFqdiv/SlXNcfyGif9P3lkwq
	ki4bgwq0KITm7jc1QEUA7XcG5cHqSV28RxMDgJsQ2OAOO7FtwPQ1jflTigm9KobfzkX7
	lHaSeJ53fp1kW0kejUH9EC2Ov40pbEuNobMxE=
Received: by 10.204.154.194 with SMTP id p2mr4104832bkw.58.1306327214236;
	Wed, 25 May 2011 05:40:14 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm74795fak.3.2011.05.25.05.40.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 05:40:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 14:40:05 +0200
Message-Id: <1306327205-4325-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH] python-2.6.6: py_package_preprocess should change Makefile only in PKGD not D
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
X-List-Received-Date: Wed, 25 May 2011 12:43:17 -0000

* PACKAGEFUNCS ?= "perform_packagecopy \
                ${PACKAGE_PREPROCESS_FUNCS} \
  our py_package_preprocess is called after perform_packagecopy which does copy D to PKGD
  so we change it to target version in D (image/) before populating sysroot (sysroot-destdir/)
  while keeping Makefile.sysroot version in PKGD which was created before calling
  py_package_preprocess, so both package for runtime and sysroot end wrong

* I haven't seen this problem on faster builder, I guess because do_package and do_populate_sysroot
  can run in paralell and I was lucky that do_populate_sysroot finished before py_package_preprocess
  was started, but if you build python step by step -c package first you should see it every time

* here is proof that with PKGD it works better:
  $ bitbake -c cleanall python
  $ bitbake -c install python
  $ grep LIBDIR= \
    ./packages-split/python-distutils/usr/lib/python2.6/config/Makefile \
    ./package/usr/lib/python2.6/config/Makefile \
    ./sysroot-destdir/usr/lib/python2.6/config/Makefile \
    ./image/usr/lib/python2.6/config/Makefile \
    ./Python-2.6.6/Makefile \
    ~/shr-core/tmp/sysroots/om-gta02/usr/lib/python2.6/config/Makefile
  grep: ./packages-split/python-distutils/usr/lib/python2.6/config/Makefile: No such file or directory
  grep: ./package/usr/lib/python2.6/config/Makefile: No such file or directory
  grep: ./sysroot-destdir/usr/lib/python2.6/config/Makefile: No such file or directory
  ./image/usr/lib/python2.6/config/Makefile:LIBDIR=               /OE/shr-core/tmp/sysroots/om-gta02/usr/lib
  ./Python-2.6.6/Makefile:LIBDIR=         /usr/lib
  /OE/shr-core/tmp/sysroots/om-gta02/usr/lib/python2.6/config/Makefile:LIBDIR=            /OE/shr-core/tmp/sysroots/om-gta02/usr/lib

  $ bitbake -c package python
  $ grep LIBDIR= \
    ./packages-split/python-distutils/usr/lib/python2.6/config/Makefile \
    ./package/usr/lib/python2.6/config/Makefile \
    ./sysroot-destdir/usr/lib/python2.6/config/Makefile \
    ./image/usr/lib/python2.6/config/Makefile \
    ./Python-2.6.6/Makefile \
    ~/shr-core/tmp/sysroots/om-gta02/usr/lib/python2.6/config/Makefile
  ./packages-split/python-distutils/usr/lib/python2.6/config/Makefile:LIBDIR=             /usr/lib
  ./package/usr/lib/python2.6/config/Makefile:LIBDIR=             /usr/lib
  grep: ./sysroot-destdir/usr/lib/python2.6/config/Makefile: No such file or directory
  ./image/usr/lib/python2.6/config/Makefile:LIBDIR=               /OE/shr-core/tmp/sysroots/om-gta02/usr/lib
  ./Python-2.6.6/Makefile:LIBDIR=         /usr/lib
  /OE/shr-core/tmp/sysroots/om-gta02/usr/lib/python2.6/config/Makefile:LIBDIR=            /OE/shr-core/tmp/sysroots/om-gta02/usr/lib

  $ bitbake -c package python
  $ grep LIBDIR= \
    ./packages-split/python-distutils/usr/lib/python2.6/config/Makefile \
    ./package/usr/lib/python2.6/config/Makefile \
    ./sysroot-destdir/usr/lib/python2.6/config/Makefile \
    ./image/usr/lib/python2.6/config/Makefile \
    ./Python-2.6.6/Makefile \
    ~/shr-core/tmp/sysroots/om-gta02/usr/lib/python2.6/config/Makefile
  ./packages-split/python-distutils/usr/lib/python2.6/config/Makefile:LIBDIR=             /usr/lib
  ./package/usr/lib/python2.6/config/Makefile:LIBDIR=             /usr/lib
  ./sysroot-destdir/usr/lib/python2.6/config/Makefile:LIBDIR=             /OE/shr-core/tmp/sysroots/om-gta02/usr/lib
  ./image/usr/lib/python2.6/config/Makefile:LIBDIR=               /OE/shr-core/tmp/sysroots/om-gta02/usr/lib
  ./Python-2.6.6/Makefile:LIBDIR=         /usr/lib
  /OE/shr-core/tmp/sysroots/om-gta02/usr/lib/python2.6/config/Makefile:LIBDIR=            /OE/shr-core/tmp/sysroots/om-gta02/usr/lib

* without this patch we have /usr/lib/ in image/sysroot-destdir and SYSROOT_LIBDIR in package/packages-split
  $ grep LIBDIR= \
    ./packages-split/python-distutils/usr/lib/python2.6/config/Makefile \
    ./package/usr/lib/python2.6/config/Makefile \
    ./sysroot-destdir/usr/lib/python2.6/config/Makefile \
    ./image/usr/lib/python2.6/config/Makefile \
    ./Python-2.6.6/Makefile \
    ~/shr-core/tmp/sysroots/om-gta02/usr/lib/python2.6/config/Makefile
  ./packages-split/python-distutils/usr/lib/python2.6/config/Makefile:LIBDIR=             /OE/shr-core/tmp/sysroots/om-gta02/usr/lib
  ./package/usr/lib/python2.6/config/Makefile:LIBDIR=             /OE/shr-core/tmp/sysroots/om-gta02/usr/lib
  ./sysroot-destdir/usr/lib/python2.6/config/Makefile:LIBDIR=             /usr/lib
  ./image/usr/lib/python2.6/config/Makefile:LIBDIR=               /usr/lib
  ./Python-2.6.6/Makefile:LIBDIR=         /usr/lib
  /OE/shr-core/tmp/sysroots/om-gta02/usr/lib/python2.6/config/Makefile:LIBDIR=            /usr/lib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python_2.6.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 65875ff..24f1d33 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -96,7 +96,7 @@ PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
 py_package_preprocess () {
 	# copy back the old Makefile to fix target package
-	install -m 0644 Makefile.orig ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+	install -m 0644 Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
-- 
1.7.5.rc3



