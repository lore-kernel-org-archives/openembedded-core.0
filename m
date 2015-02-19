Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 400177362D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 19:40:07 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1JJe8WR000975 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 13:40:08 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015021913400872-187882 ;
	Thu, 19 Feb 2015 13:40:08 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 13:39:37 -0600
Message-Id: <1424374778-23666-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.3.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/19/2015 01:40:08 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/19/2015 01:40:08 PM,
	Serialize complete at 02/19/2015 01:40:08 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-19_03:, , signatures=0
Subject: [PATCH v2 1/2] trace-cmd: Update to version 2.5.3
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
X-List-Received-Date: Thu, 19 Feb 2015 19:40:08 -0000

Updating adds new features including the very useful 'profile' option.

Changes include:

 - Remove addldflags.patch (already upstream in the new version).

 - Remove make-docs-optional.patch (docs are built in a separate target
   in the new version).

 - Update SRC_URI, SRCREV, PR, and PV in the .inc file and don't
   override them in the recipe.

 - Fix a typo in LIC_FILES_CHECKSUM so 'endline' is properly defined.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-kernel/trace-cmd/trace-cmd.inc        | 13 +++---
 .../trace-cmd/trace-cmd/addldflags.patch           | 51 ----------------------
 .../trace-cmd/trace-cmd/make-docs-optional.patch   | 36 ---------------
 .../{trace-cmd_2.3.2.bb => trace-cmd_git.bb}       |  8 +---
 4 files changed, 7 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
 rename meta/recipes-kernel/trace-cmd/{trace-cmd_2.3.2.bb => trace-cmd_git.bb} (74%)

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd.inc b/meta/recipes-kernel/trace-cmd/trace-cmd.inc
index fb8c5fa..d03c697 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd.inc
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd.inc
@@ -1,14 +1,13 @@
-SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
-PR = "r3"
-PV = "1.2+git${SRCPV}"
+SRCREV = "0813335d2e49291e7ab6a4365cec2baa05813eda"
+PR = "r4"
+PV = "2.5.3+git${SRCPV}"
 
-inherit pkgconfig pythonnative
+inherit pkgconfig
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/trace-cmd:"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
-           file://addldflags.patch \
-           file://make-docs-optional.patch \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git;branch=trace-cmd-stable-v2.5 \
            file://blktrace-api-compatibility.patch \
 "
+
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
deleted file mode 100644
index 14730db..0000000
--- a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-trace-cmd: Cross-compile fixes for LDFLAGS and include path
-
-Add ability for the Makefile to respect LDFLAGS.
-Also remove hardcoded /usr/local/include include path.
-
-Upstream-Status: Accepted [Post 1.2: 5f576e9af7ad706774d9764a9ae3989376797c0e]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-
----
- Makefile |    7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -202,12 +202,13 @@ export Q VERBOSE
- TRACECMD_VERSION = $(TC_VERSION).$(TC_PATCHLEVEL).$(TC_EXTRAVERSION)
- KERNELSHARK_VERSION = $(KS_VERSION).$(KS_PATCHLEVEL).$(KS_EXTRAVERSION)
- 
--INCLUDES = -I. -I/usr/local/include $(CONFIG_INCLUDES)
-+INCLUDES = -I. $(CONFIG_INCLUDES)
- 
- include features.mk
- 
- # Set compile option CFLAGS if not set elsewhere
- CFLAGS ?= -g -Wall
-+LDFLAGS ?=
- 
- ifndef NO_PTRACE
- ifneq ($(call try-cc,$(SOURCE_PTRACE),),y)
-@@ -251,7 +252,7 @@ do_fpic_compile =					\
- 
- do_app_build =						\
- 	($(print_app_build)				\
--	$(CC) $^ -rdynamic -o $@ $(CONFIG_LIBS) $(LIBS))
-+	$(CC) $^ -rdynamic -o $@ $(LDFLAGS) $(CONFIG_LIBS) $(LIBS))
- 
- do_compile_shared_library =			\
- 	($(print_shared_lib_compile)		\
-@@ -263,7 +264,7 @@ do_compile_plugin_obj =				\
- 
- do_plugin_build =				\
- 	($(print_plugin_build)			\
--	$(CC) $(CFLAGS) -shared -nostartfiles -o $@ $<)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -shared -nostartfiles -o $@ $<)
- 
- do_build_static_lib =				\
- 	($(print_static_lib_build)		\
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
deleted file mode 100644
index 8402426..0000000
--- a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Disable building docs until we have asciidocs available as a recipe.
-
-Upstream-Status: Inappropriate [Account for missing dependency, the lazy way]
-
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-
----
- Makefile |    8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -327,7 +327,9 @@ TARGETS = $(CMD_TARGETS) $(GUI_TARGETS)
- #    If you want kernelshark, then do:  make gui
- ###
- 
--all: all_cmd doc show_gui_make
-+# Make doc optional
-+#all: all_cmd doc show_gui_make
-+all: all_cmd show_gui_make
- 
- all_cmd: $(CMD_TARGETS)
- 
-@@ -503,7 +505,9 @@ install_python: $(PYTHON_SO_INSTALL) $(P
- install_cmd: all_cmd install_plugins install_python
- 	$(Q)$(call do_install,trace-cmd,$(bindir_SQ))
- 
--install: install_cmd install_doc
-+# Make doc optional
-+#install: install_cmd install_doc
-+install: install_cmd
- 	@echo "Note: to install the gui, type \"make install_gui\""
- 
- install_gui: install_cmd gui
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
similarity index 74%
rename from meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
rename to meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
index a4d5382..b1ac789 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
@@ -6,13 +6,7 @@ require trace-cmd.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://trace-input.c;beginline=5;endine=8;md5=dafd8a1cade30b847a8686dd3628cea4 \
-"
-SRCREV = "79e08f8edb38c4c5098486caaa87ca90ba00f547"
-
-PV = "2.3.2+git${SRCPV}"
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git;branch=trace-cmd-stable-v2.3 \
+                    file://trace-input.c;beginline=5;endline=8;md5=3ec82f43bbe0cfb5951ff414ef4d44d0 \
 "
 
 EXTRA_OEMAKE = "\
-- 
2.3.0


