Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlpdF-0007ts-E9
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:57:42 +0200
Received: by rex (Postfix, from userid 1000)
	id E6F9620E22; Tue, 26 Jul 2011 22:53:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 22:53:14 +0100
Message-Id: <7802b73e727799d20c3ce37775ef90e0aab59ab9.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
References: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/8] distcc: fix makefile parameter order
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
X-List-Received-Date: Tue, 26 Jul 2011 21:57:43 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

When linking with gcc, the parameter is read from left to write, if *.o
calls a function contained in libxxx, the parameter order should be

"gcc ... *.o -lxxx".

This commit fixes the problem in distcc.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |    3 ++-
 .../distcc/files/makefile-param-order.patch        |   20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/distcc/files/makefile-param-order.patch

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index ece1b02..e474cce 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -4,7 +4,7 @@ compilation of C/C++/ObjC code across machines on a network."
 SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r6"
+PR = "r7"
 
 DEPENDS = "avahi ${GTKDEP}"
 GTKDEP_libc-uclibc = ""
@@ -16,6 +16,7 @@ RRECOMMENDS_${PN} = "avahi-daemon"
 # http://0pointer.de/public/distcc-avahi.patch
 SRC_URI = "http://distcc.googlecode.com/files/${PN}-${PV}.tar.bz2 \
            file://distcc-avahi.patch \	  
+           file://makefile-param-order.patch \
 	   file://default \
 	   file://distccmon-gnome.desktop \
 	   file://distcc"
diff --git a/meta/recipes-devtools/distcc/files/makefile-param-order.patch b/meta/recipes-devtools/distcc/files/makefile-param-order.patch
new file mode 100644
index 0000000..fc57414
--- /dev/null
+++ b/meta/recipes-devtools/distcc/files/makefile-param-order.patch
@@ -0,0 +1,20 @@
+distcc: Put the "-lLIB" parameter in the end of the gcc command.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Pending
+
+diff -ruN distcc-2.18.3-orig/Makefile.in distcc-2.18.3/Makefile.in
+--- distcc-2.18.3-orig/Makefile.in	2011-07-25 16:43:21.000000000 +0800
++++ distcc-2.18.3/Makefile.in	2011-07-25 16:45:39.000000000 +0800
+@@ -378,8 +378,8 @@
+ 
+ distccmon-gnome@EXEEXT@: $(mon_obj) $(gnome_obj)
+ 	$(CC) -o $@ $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(LIBS)	\
+-		$(GNOME_CFLAGS) $(GNOME_LIBS)			\
+-		$(mon_obj) $(gnome_obj)
++		$(GNOME_CFLAGS) 				\
++		$(mon_obj) $(gnome_obj) $(GNOME_LIBS)
+ 
+ 
+ ## Dist targets
-- 
1.7.4.1



