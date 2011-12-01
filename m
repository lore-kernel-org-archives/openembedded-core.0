Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVuwI-0006cp-3r
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 01:55:50 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 16:49:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,274,1320652800"; d="scan'208";a="42717475"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Nov 2011 16:49:08 -0800
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 16:48:57 -0800
Message-Id: <2111fbc50c779862c199eeaabd2cf6480967def5.1322700459.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322700459.git.darren@dvhart.com>
References: <cover.1322700459.git.darren@dvhart.com>
In-Reply-To: <cover.1322700459.git.darren@dvhart.com>
References: <cover.1322700459.git.darren@dvhart.com>
Subject: [PATCH 1/1] trace-cmd: Update to 1.2 (includes kernelshark)
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
X-List-Received-Date: Thu, 01 Dec 2011 00:55:50 -0000

From: Darren Hart <dvhart@linux.intel.com>

Update the trace-cmd and kernelshark recipes to version 1.2. Rename the recipes
to the more descriptive trace-cmd_1.2.bb and kernelshark_1.2.bb respectively.

Update addldflags.patch for 1.2 and current Upstream-Status.

Add make-docs-optional.patch to avoid building the new doc target which
requires asciidocs. We should add asciidocs and properly package the
docs, but for now it's more important to get the sources current.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../{kernelshark_git.bb => kernelshark_1.2.bb}     |    9 +++--
 .../trace-cmd/trace-cmd/addldflags.patch           |   28 ++++++++++-----
 .../trace-cmd/trace-cmd/make-docs-optional.patch   |   36 ++++++++++++++++++++
 .../{trace-cmd_git.bb => trace-cmd_1.2.bb}         |    9 +++--
 4 files changed, 64 insertions(+), 18 deletions(-)
 rename meta/recipes-kernel/trace-cmd/{kernelshark_git.bb => kernelshark_1.2.bb} (81%)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
 rename meta/recipes-kernel/trace-cmd/{trace-cmd_git.bb => trace-cmd_1.2.bb} (76%)

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
similarity index 81%
rename from meta/recipes-kernel/trace-cmd/kernelshark_git.bb
rename to meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index 733bddc..aa070a9 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -3,9 +3,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://kernel-shark.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
 
-SRCREV = "6c696cec3f264a9399241b6e648f58bc97117d49"
-PR = r1
-PV = "1.0.5+git${SRCPV}"
+SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
+PR = "r0"
+PV = "1.2+git${SRCPV}"
 
 DEPENDS = "gtk+"
 RDEPENDS_${PN} = "trace-cmd"
@@ -13,7 +13,8 @@ RDEPENDS_${PN} = "trace-cmd"
 inherit pkgconfig
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
-           file://addldflags.patch"
+           file://addldflags.patch \
+           file://make-docs-optional.patch"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
index 8e8f578..68a5ed4 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
@@ -1,29 +1,37 @@
-Upstream-Status: Pending
+trace-cmd: Cross-compile fixes for LDFLAGS and include path
 
 Add ability for the Makefile to respect LDFLAGS.
-
 Also remove hardcoded /usr/local/include include path.
 
-RP 7/5/2011
+Upstream-Status: Submitted [LKML]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+
+---
+ Makefile |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
 
 Index: git/Makefile
 ===================================================================
---- git.orig/Makefile	2011-07-05 11:58:11.699910550 +0100
-+++ git/Makefile	2011-07-05 23:30:12.319920617 +0100
-@@ -189,10 +189,11 @@
+--- git.orig/Makefile
++++ git/Makefile
+@@ -202,12 +202,13 @@ export Q VERBOSE
  TRACECMD_VERSION = $(TC_VERSION).$(TC_PATCHLEVEL).$(TC_EXTRAVERSION)
  KERNELSHARK_VERSION = $(KS_VERSION).$(KS_PATCHLEVEL).$(KS_EXTRAVERSION)
  
 -INCLUDES = -I. -I/usr/local/include $(CONFIG_INCLUDES)
 +INCLUDES = -I. $(CONFIG_INCLUDES)
  
+ include features.mk
+ 
  # Set compile option CFLAGS if not set elsewhere
  CFLAGS ?= -g -Wall
 +LDFLAGS ?=
  
- # Append required CFLAGS
- override CFLAGS += $(CONFIG_FLAGS) $(INCLUDES) $(PLUGIN_DIR_SQ)
-@@ -225,7 +226,7 @@
+ ifndef NO_PTRACE
+ ifneq ($(call try-cc,$(SOURCE_PTRACE),),y)
+@@ -251,7 +252,7 @@ do_fpic_compile =					\
  
  do_app_build =						\
  	($(print_app_build)				\
@@ -32,7 +40,7 @@ Index: git/Makefile
  
  do_compile_shared_library =			\
  	($(print_shared_lib_compile)		\
-@@ -237,7 +238,7 @@
+@@ -263,7 +264,7 @@ do_compile_plugin_obj =				\
  
  do_plugin_build =				\
  	($(print_plugin_build)			\
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
new file mode 100644
index 0000000..8402426
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
@@ -0,0 +1,36 @@
+Disable building docs until we have asciidocs available as a recipe.
+
+Upstream-Status: Inappropriate [Account for missing dependency, the lazy way]
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+
+---
+ Makefile |    8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -327,7 +327,9 @@ TARGETS = $(CMD_TARGETS) $(GUI_TARGETS)
+ #    If you want kernelshark, then do:  make gui
+ ###
+ 
+-all: all_cmd doc show_gui_make
++# Make doc optional
++#all: all_cmd doc show_gui_make
++all: all_cmd show_gui_make
+ 
+ all_cmd: $(CMD_TARGETS)
+ 
+@@ -503,7 +505,9 @@ install_python: $(PYTHON_SO_INSTALL) $(P
+ install_cmd: all_cmd install_plugins install_python
+ 	$(Q)$(call do_install,trace-cmd,$(bindir_SQ))
+ 
+-install: install_cmd install_doc
++# Make doc optional
++#install: install_cmd install_doc
++install: install_cmd
+ 	@echo "Note: to install the gui, type \"make install_gui\""
+ 
+ install_gui: install_cmd gui
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
similarity index 76%
rename from meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
rename to meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index 1278dc7..1b9231b 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -3,14 +3,15 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
 
-SRCREV = "6c696cec3f264a9399241b6e648f58bc97117d49"
-PR = "r2"
-PV = "1.0.5+git${SRCPV}"
+SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
+PR = "r0"
+PV = "1.2+git${SRCPV}"
 
 inherit pkgconfig
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
-           file://addldflags.patch"
+           file://addldflags.patch \
+           file://make-docs-optional.patch"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'prefix=${prefix}'"
-- 
1.7.6.4



