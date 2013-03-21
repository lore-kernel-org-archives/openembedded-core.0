Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UIi6O-0006N0-NX
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:12:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4s0B009104; Thu, 21 Mar 2013 16:04:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3-3-nyGE8O4U; Thu, 21 Mar 2013 16:04:56 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4nxJ009087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Mar 2013 16:04:50 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UIhpn-0006MS-U0; Thu, 21 Mar 2013 15:55:19 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 15:55:11 +0000
Message-Id: <1363881315-24352-12-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/16] mtdev: Fix case where ${B} != ${S}
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
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000

Add patch to allow out of tree builds to work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/mtdev/fixsepbuild.patch                |   24 ++++++++++++++++++++
 meta/recipes-graphics/wayland/mtdev_1.1.2.bb       |    3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch

diff --git a/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch b/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch
new file mode 100644
index 0000000..00a5c27
--- /dev/null
+++ b/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch
@@ -0,0 +1,24 @@
+Fix separate build directory builds to avoid the error:
+
+| make[2]: Entering directory `/media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/build/test'
+| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/media/build1/poky/build/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I/media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/mtdev-1.1.2/test -I.. -I/media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/mtdev-1.1.2/include/    -O2 -pipe -g -feliminate-unused-debug-types -c /media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/mtdev-1.1.2/test/mtdev-matching.c
+| /media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/mtdev-1.1.2/test/mtdev-matching.c:29:23: fatal error: src/match.h: No such file or directory
+| compilation terminated.
+
+Upstream-Status: Pending
+
+RP 2013/03/21
+
+Index: mtdev/test/Makefile.am
+===================================================================
+--- mtdev/test.orig/Makefile.am	2010-12-22 18:10:41.000000000 +0000
++++ mtdev/test/Makefile.am	2013-03-21 11:47:21.557160981 +0000
+@@ -1,7 +1,7 @@
+ noinst_PROGRAMS = mtdev-mapgen mtdev-matching mtdev-kernel
+ bin_PROGRAMS = mtdev-test
+ 
+-INCLUDES=-I$(top_srcdir)/include/
++INCLUDES=-I$(top_srcdir)/include/ -I$(top_srcdir)
+ 
+ mtdev_mapgen_SOURCES = mtdev-mapgen.c
+ 
diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.2.bb b/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
index 95d99ee..6918f3e 100644
--- a/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
@@ -13,7 +13,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
 
-SRC_URI = "http://bitmath.org/code/mtdev/mtdev-1.1.2.tar.bz2"
+SRC_URI = "http://bitmath.org/code/mtdev/mtdev-1.1.2.tar.bz2 \
+           file://fixsepbuild.patch"
 SRC_URI[md5sum] = "d9c7700918fc392e29da7477ae20c5c2"
 SRC_URI[sha256sum] = "698dd11ca08b3a73ad33d8a5076f6d9e018d97afad3eba36f540b8ea7b775a30"
 
-- 
1.7.10.4



