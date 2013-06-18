Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74B346023F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 02:02:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5I22K7L014036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 19:02:20 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 19:02:20 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 22:02:17 -0400
Message-ID: <1fea294b2ea836672219aef14beecc67ed4cadef.1371519710.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371519710.git.wenzong.fan@windriver.com>
References: <cover.1371519710.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ghostscript: resolve the gconfig.h conflict
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
X-List-Received-Date: Tue, 18 Jun 2013 02:02:19 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Both base/lib.mak and psi/int.mak will create file gconfig.h:
    lib.mak: $(CP_) $(gconfig_h) $(GLGEN)gconfig.h
    int.mak: $(CP_) $(gconfig_h) $(PSGEN)gconfig.h

If $(GLGEN) is same with $(PSGEN), the $(GLGEN)gconfig.h will be
overridden by $(PSGEN)gconfig.h in a parallel build, and this
maybe cause build errors.

Upstream has fixed this issue, just portback its fixes from:
    http://downloads.ghostscript.com/public/ghostscript-9.06.tar.gz

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../resolve-the-gconfig.h-conflict.patch           |   84 ++++++++++++++++++++
 .../ghostscript/ghostscript_9.05.bb                |    1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/resolve-the-gconfig.h-conflict.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/resolve-the-gconfig.h-conflict.patch b/meta/recipes-extended/ghostscript/ghostscript/resolve-the-gconfig.h-conflict.patch
new file mode 100644
index 0000000..9e030e3
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/resolve-the-gconfig.h-conflict.patch
@@ -0,0 +1,84 @@
+Upstream-Status: Backport
+
+Resolve the gconfig.h conflict
+
+Both base/lib.mak and psi/int.mak will create file gconfig.h:
+    lib.mak: $(CP_) $(gconfig_h) $(GLGEN)gconfig.h
+    int.mak: $(CP_) $(gconfig_h) $(PSGEN)gconfig.h
+
+If $(GLGEN) is same with $(PSGEN), the $(GLGEN)gconfig.h will be
+overridden by $(PSGEN)gconfig.h in a parallel build, and this
+maybe cause build errors.
+
+Upstream has fixed this issue, just portback its fixes from:
+    http://downloads.ghostscript.com/public/ghostscript-9.06.tar.gz
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+---
+ base/gs.mak  |   13 +++++++++----
+ base/lib.mak |    1 -
+ psi/int.mak  |    1 -
+ 3 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/base/gs.mak b/base/gs.mak
+index b59e948..e934657 100644
+--- a/base/gs.mak
++++ b/base/gs.mak
+@@ -261,7 +261,8 @@ MKROMFS_XE=$(AUX)mkromfs$(XEAUX)
+ 
+ # Define the names of the generated header files.
+ # gconfig*.h and gconfx*.h are generated dynamically.
+-gconfig_h=$(GLGENDIR)$(D)gconfxx.h
++gconfig_h=$(GLGENDIR)$(D)gconfig.h
++gconfxx_h=$(GLGENDIR)$(D)gconfxx.h
+ gconfigf_h=$(GLGENDIR)$(D)gconfxc.h
+ gconfigd_h=$(GLGENDIR)$(D)gconfigd.h
+ 
+@@ -434,12 +435,16 @@ GCONFIG_EXTRAS=
+ ld_tr=$(GLGENDIR)$(D)ld.tr
+ $(ld_tr) : \
+   $(GS_MAK) $(TOP_MAKEFILES) $(GLSRCDIR)$(D)version.mak $(GENCONF_XE) $(ECHOGS_XE) $(devs_tr) $(DEVS_ALL) $(GLGENDIR)$(D)libcore.dev
+-	$(EXP)$(GENCONF_XE) $(devs_tr) -h $(gconfig_h) $(CONFILES) $(CONFLDTR) $(ld_tr)
+-	$(EXP)$(ECHOGS_XE) -a $(gconfig_h) $(GCONFIG_EXTRAS)
++	$(EXP)$(GENCONF_XE) $(devs_tr) -h $(gconfxx_h) $(CONFILES) $(CONFLDTR) $(ld_tr)
++	$(EXP)$(ECHOGS_XE) -a $(gconfxx_h) $(GCONFIG_EXTRAS)
+ 
+-$(gconfig_h) : $(ld_tr)
++$(gconfxx_h) : $(ld_tr)
+ 	$(NO_OP)
+ 	
++$(gconfig_h) : $(gconfxx_h)
++	$(RM_) $(gconfig_h)
++	$(CP_) $(gconfxx_h) $(gconfig_h)
++
+ # The line above is an empty command; don't delete.
+ 
+ # save our set of makefile variables that are defined in every build (paths, etc.)
+diff --git a/base/lib.mak b/base/lib.mak
+index 35328cb..df02e37 100644
+--- a/base/lib.mak
++++ b/base/lib.mak
+@@ -593,7 +593,6 @@ $(GLOBJ)gconfig.$(OBJ) : $(gconfig_h) $(GLSRC)gconf.c $(AK) $(gx_h)\
+  $(gscdefs_h) $(gconf_h)\
+  $(gxdevice_h) $(gxiclass_h) $(gxiodev_h) $(gxiparam_h) $(TOP_MAKEFILES)\
+  $(MAKEDDIRS)
+-	$(CP_) $(gconfig_h) $(GLGEN)gconfig.h || true
+ 	$(CP_) $(GLSRC)gconf.c $(GLGEN)gconfig.c || true
+ 	$(GLCC) $(GLO_)gconfig.$(OBJ) $(C_) $(GLGEN)gconfig.c
+ 
+diff --git a/psi/int.mak b/psi/int.mak
+index 1099c29..fab98e6 100644
+--- a/psi/int.mak
++++ b/psi/int.mak
+@@ -272,7 +272,6 @@ $(PSOBJ)iconfig.$(OBJ) : $(gconfig_h) $(PSSRC)iconf.c $(stdio__h)\
+  $(gconf_h) $(gconfigd_h) $(gsmemory_h) $(gstypes_h)\
+  $(iminst_h) $(iref_h) $(ivmspace_h) $(opdef_h) $(iplugin_h)
+ 	$(RM_) $(PSGEN)iconfig.c
+-	$(CP_) $(gconfig_h) $(PSGEN)gconfig.h || true
+ 	$(CP_) $(PSSRC)iconf.c $(PSGEN)iconfig.c || true
+ 	$(PSCC) $(PSO_)iconfig.$(OBJ) $(C_) $(PSGEN)iconfig.c
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
index 9ec5712..c0195c8 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SRC_URI_BASE} \
            file://objarch.h \
            file://ghostscript-9.02-parallel-make.patch \
            file://ghostscript-9.05-NOT-check-endian.patch \
+           file://resolve-the-gconfig.h-conflict.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
1.7.9.5


