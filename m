Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1Sd7Kw-0001Ex-J4
	for Openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 00:07:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q58Lul8i021791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 8 Jun 2012 14:56:47 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 8 Jun 2012 14:56:46 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jun 2012 16:57:56 -0500
Message-ID: <1339192676-9335-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] v86d: Fix cross link using host-cross ar
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
X-List-Received-Date: Fri, 08 Jun 2012 22:07:19 -0000
Content-Type: text/plain

If building on 32bit host and creating 64bit libraries, the target
package builds should not invoke the 32bit hosts's ar.  Specifically
you will get an error message like:

x86_64-linux-gcc  -m64 --sysroot=/opt/qemux86-64/tmp/sysroots/qemux86-64 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Llibs/x86emu v86_x86emu.o v86_mem.o v86_common.o  v86.o -lx86emu -o v86d
libs/x86emu/libx86emu.a: could not read symbols: Archive has no index; run ranlib to add one
collect2: error: ld returned 1 exit status

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-bsp/v86d/v86d/ar-from-env.patch |   33 ++++++++++++++++++++++++++
 meta/recipes-bsp/v86d/v86d_0.1.10.bb         |    5 ++-
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/v86d/v86d/ar-from-env.patch

diff --git a/meta/recipes-bsp/v86d/v86d/ar-from-env.patch b/meta/recipes-bsp/v86d/v86d/ar-from-env.patch
new file mode 100644
index 0000000..1dcbc71
--- /dev/null
+++ b/meta/recipes-bsp/v86d/v86d/ar-from-env.patch
@@ -0,0 +1,33 @@
+Fix cross link using host-cross ar
+
+If building on 32bit host and creating 64bit libraries, the target
+package builds should not invoke the 32bit hosts's ar.  Specifically
+you will get an error message like:
+
+x86_64-linux-gcc  -m64 --sysroot=/opt/qemux86-64/tmp/sysroots/qemux86-64 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Llibs/x86emu v86_x86emu.o v86_mem.o v86_common.o  v86.o -lx86emu -o v86d
+libs/x86emu/libx86emu.a: could not read symbols: Archive has no index; run ranlib to add one
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+---
+ libs/x86emu/Makefile |    6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+--- a/libs/x86emu/Makefile
++++ b/libs/x86emu/Makefile
+@@ -1,7 +1,11 @@
+ OBJS = decode.o fpu.o ops.o ops2.o prim_ops.o sys.o
+ 
++ifeq ($(AR),)
++	AR = ar
++endif
++
+ libx86emu.a: $(OBJS)
+-	ar rv $@ $+
++	$(AR) rv $@ $+
+ 
+ %.o: %.c
+ 	$(CC) -c $(CFLAGS) -o $@ $<
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 70db6ad..ce1fe7a 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
 DEPENDS = "virtual/kernel"
 RRECOMMENDS_${PN} = "kernel-module-uvesafb"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://dev.gentoo.org/~spock/projects/uvesafb/archive/v86d-${PV}.tar.bz2 \
-           file://fbsetup"
+           file://fbsetup \
+           file://ar-from-env.patch"
 
 SRC_URI[md5sum] = "51c792ba7b874ad8c43f0d3da4cfabe0"
 SRC_URI[sha256sum] = "634964ae18ef68c8493add2ce150e3b4502badeb0d9194b4bd81241d25e6735c"
-- 
1.7.1



