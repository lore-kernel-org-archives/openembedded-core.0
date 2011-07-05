Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWy-0006xy-RO
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:49 +0200
Received: by rex (Postfix, from userid 1000)
	id 5D5FD31339; Tue,  5 Jul 2011 23:51:26 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:16 +0100
Message-Id: <b85047e1047e45c2126f2267fe412e9a08d8044a.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 15/17] kernelshark/trace-cmd: Clean up QA warnings including fising LDFLAGS issues
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
X-List-Received-Date: Tue, 05 Jul 2011 22:55:49 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/trace-cmd/kernelshark_git.bb   |   10 ++++-
 .../trace-cmd/trace-cmd/addldflags.patch           |   43 ++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb     |    5 +-
 3 files changed, 54 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
index 6b4692e..733bddc 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://kernel-shark.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
 
 SRCREV = "6c696cec3f264a9399241b6e648f58bc97117d49"
-PR = r0
+PR = r1
 PV = "1.0.5+git${SRCPV}"
 
 DEPENDS = "gtk+"
@@ -12,11 +12,17 @@ RDEPENDS_${PN} = "trace-cmd"
 
 inherit pkgconfig
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
+           file://addldflags.patch"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
 
+FILES_${PN} += "${datadir}/trace-cmd/plugins/*.so"
+FILES_${PN}-dbg += "${datadir}/trace-cmd/plugins/.debug/"
+
+FILESPATH = "${FILE_DIRNAME}/trace-cmd"
+
 do_install() {
 	oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}" DESTDIR="${D}" install_gui
 }
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
new file mode 100644
index 0000000..8e8f578
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Pending
+
+Add ability for the Makefile to respect LDFLAGS.
+
+Also remove hardcoded /usr/local/include include path.
+
+RP 7/5/2011
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile	2011-07-05 11:58:11.699910550 +0100
++++ git/Makefile	2011-07-05 23:30:12.319920617 +0100
+@@ -189,10 +189,11 @@
+ TRACECMD_VERSION = $(TC_VERSION).$(TC_PATCHLEVEL).$(TC_EXTRAVERSION)
+ KERNELSHARK_VERSION = $(KS_VERSION).$(KS_PATCHLEVEL).$(KS_EXTRAVERSION)
+ 
+-INCLUDES = -I. -I/usr/local/include $(CONFIG_INCLUDES)
++INCLUDES = -I. $(CONFIG_INCLUDES)
+ 
+ # Set compile option CFLAGS if not set elsewhere
+ CFLAGS ?= -g -Wall
++LDFLAGS ?=
+ 
+ # Append required CFLAGS
+ override CFLAGS += $(CONFIG_FLAGS) $(INCLUDES) $(PLUGIN_DIR_SQ)
+@@ -225,7 +226,7 @@
+ 
+ do_app_build =						\
+ 	($(print_app_build)				\
+-	$(CC) $^ -rdynamic -o $@ $(CONFIG_LIBS) $(LIBS))
++	$(CC) $^ -rdynamic -o $@ $(LDFLAGS) $(CONFIG_LIBS) $(LIBS))
+ 
+ do_compile_shared_library =			\
+ 	($(print_shared_lib_compile)		\
+@@ -237,7 +238,7 @@
+ 
+ do_plugin_build =				\
+ 	($(print_plugin_build)			\
+-	$(CC) $(CFLAGS) -shared -nostartfiles -o $@ $<)
++	$(CC) $(CFLAGS) $(LDFLAGS) -shared -nostartfiles -o $@ $<)
+ 
+ do_build_static_lib =				\
+ 	($(print_static_lib_build)		\
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
index 5cf433a..1278dc7 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
@@ -4,12 +4,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
 
 SRCREV = "6c696cec3f264a9399241b6e648f58bc97117d49"
-PR = "r1"
+PR = "r2"
 PV = "1.0.5+git${SRCPV}"
 
 inherit pkgconfig
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
+           file://addldflags.patch"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'prefix=${prefix}'"
-- 
1.7.4.1



