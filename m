Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc5K6-0004a2-3u
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 02:41:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Jun 2011 17:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="20618842"
Received: from swold-mobl.jf.intel.com ([10.24.82.35])
	by azsmga001.ch.intel.com with ESMTP; 29 Jun 2011 17:37:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 17:37:39 -0700
Message-Id: <978517f69975dee91ad4382986f0f0c10955bffa.1309393926.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309393926.git.sgw@linux.intel.com>
References: <cover.1309393926.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] util-linux: Rebase remove-lscpu patch from non-gplv3
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
X-List-Received-Date: Thu, 30 Jun 2011 00:41:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../util-linux-2.19.1/remove-lscpu.patch           |  120 ++++++++++---------
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 2 files changed, 64 insertions(+), 58 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux-2.19.1/remove-lscpu.patch
index c726cf1..afa50f4 100644
--- a/meta/recipes-core/util-linux/util-linux-2.19.1/remove-lscpu.patch
+++ b/meta/recipes-core/util-linux/util-linux-2.19.1/remove-lscpu.patch
@@ -6,84 +6,90 @@ Take out lscpu stuff from the code
 Saul Wold <saul.wold@intel.com>
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: util-linux-ng-2.17.2/sys-utils/Makefile.am
+Index: util-linux-2.19.1/sys-utils/Makefile.am
 ===================================================================
---- util-linux-ng-2.17.2.orig/sys-utils/Makefile.am
-+++ util-linux-ng-2.17.2/sys-utils/Makefile.am
-@@ -11,11 +11,11 @@ dist_man_MANS = flock.1 ipcrm.1 ipcs.1 i
- if LINUX
- bin_PROGRAMS += dmesg
- sbin_PROGRAMS += ctrlaltdel
--usrbin_exec_PROGRAMS += cytune setarch lscpu
-+usrbin_exec_PROGRAMS += cytune setarch
- usrsbin_exec_PROGRAMS += ldattach tunelp rtcwake
- 
+--- util-linux-2.19.1.orig/sys-utils/Makefile.am	2011-04-05 03:43:02.000000000 -0700
++++ util-linux-2.19.1/sys-utils/Makefile.am	2011-06-29 12:08:24.187440334 -0700
+@@ -17,12 +17,6 @@
  dist_man_MANS += dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
--		ldattach.8 lscpu.1 tunelp.8 rtcwake.8
-+		ldattach.8 tunelp.8 rtcwake.8
+ 		ldattach.8 tunelp.8 rtcwake.8 fsfreeze.8 fstrim.8
+ 
+-if HAVE_CPU_SET_T
+-usrbin_exec_PROGRAMS += lscpu
+-lscpu_SOURCES = lscpu.c $(top_srcdir)/lib/cpuset.c
+-dist_man_MANS += lscpu.1
+-endif
+-
  endif
  
  cytune_SOURCES = cytune.c cyclades.h
-Index: util-linux-ng-2.17.2/sys-utils/Makefile.in
+Index: util-linux-2.19.1/sys-utils/Makefile.in
 ===================================================================
---- util-linux-ng-2.17.2.orig/sys-utils/Makefile.in
-+++ util-linux-ng-2.17.2/sys-utils/Makefile.in
-@@ -47,10 +47,10 @@ usrsbin_exec_PROGRAMS = readprofile$(EXE
- 	$(am__EXEEXT_10)
- @LINUX_TRUE@am__append_1 = dmesg
- @LINUX_TRUE@am__append_2 = ctrlaltdel
--@LINUX_TRUE@am__append_3 = cytune setarch lscpu
-+@LINUX_TRUE@am__append_3 = cytune setarch
- @LINUX_TRUE@am__append_4 = ldattach tunelp rtcwake
+--- util-linux-2.19.1.orig/sys-utils/Makefile.in	2011-05-02 02:49:19.000000000 -0700
++++ util-linux-2.19.1/sys-utils/Makefile.in	2011-06-29 12:10:47.647440371 -0700
+@@ -51,8 +51,6 @@
  @LINUX_TRUE@am__append_5 = dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
--@LINUX_TRUE@		ldattach.8 lscpu.1 tunelp.8 rtcwake.8
-+@LINUX_TRUE@		ldattach.8 tunelp.8 rtcwake.8
+ @LINUX_TRUE@		ldattach.8 tunelp.8 rtcwake.8 fsfreeze.8 fstrim.8
  
- @BUILD_FALLOCATE_TRUE@am__append_6 = fallocate
- @BUILD_FALLOCATE_TRUE@am__append_7 = fallocate.1
-@@ -100,7 +100,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" 
+-@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@am__append_6 = lscpu
+-@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@am__append_7 = lscpu.1
+ @BUILD_FALLOCATE_TRUE@am__append_8 = fallocate
+ @BUILD_FALLOCATE_TRUE@am__append_9 = fallocate.1
+ @BUILD_PIVOT_ROOT_TRUE@am__append_10 = pivot_root
+@@ -98,7 +96,6 @@
  @BUILD_PIVOT_ROOT_TRUE@am__EXEEXT_4 = pivot_root$(EXEEXT)
  @BUILD_SWITCH_ROOT_TRUE@am__EXEEXT_5 = switch_root$(EXEEXT)
- @LINUX_TRUE@am__EXEEXT_6 = cytune$(EXEEXT) setarch$(EXEEXT) \
--@LINUX_TRUE@	lscpu$(EXEEXT)
-+@LINUX_TRUE@
- @BUILD_FALLOCATE_TRUE@am__EXEEXT_7 = fallocate$(EXEEXT)
- @BUILD_UNSHARE_TRUE@am__EXEEXT_8 = unshare$(EXEEXT)
- @LINUX_TRUE@am__EXEEXT_9 = ldattach$(EXEEXT) tunelp$(EXEEXT) \
-@@ -141,9 +141,6 @@ ipcs_LDADD = $(LDADD)
+ @LINUX_TRUE@am__EXEEXT_6 = cytune$(EXEEXT) setarch$(EXEEXT)
+-@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@am__EXEEXT_7 = lscpu$(EXEEXT)
+ @BUILD_FALLOCATE_TRUE@am__EXEEXT_8 = fallocate$(EXEEXT)
+ @BUILD_UNSHARE_TRUE@am__EXEEXT_9 = unshare$(EXEEXT)
+ @LINUX_TRUE@am__EXEEXT_10 = ldattach$(EXEEXT) tunelp$(EXEEXT) \
+@@ -146,11 +143,6 @@
  ldattach_SOURCES = ldattach.c
  ldattach_OBJECTS = ldattach.$(OBJEXT)
  ldattach_LDADD = $(LDADD)
--lscpu_SOURCES = lscpu.c
--lscpu_OBJECTS = lscpu.$(OBJEXT)
+-am__lscpu_SOURCES_DIST = lscpu.c $(top_srcdir)/lib/cpuset.c
+-@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@am_lscpu_OBJECTS = lscpu.$(OBJEXT) \
+-@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@	cpuset.$(OBJEXT)
+-lscpu_OBJECTS = $(am_lscpu_OBJECTS)
 -lscpu_LDADD = $(LDADD)
  pivot_root_SOURCES = pivot_root.c
  pivot_root_OBJECTS = pivot_root.$(OBJEXT)
  pivot_root_LDADD = $(LDADD)
-@@ -201,11 +198,11 @@ AM_V_GEN = $(am__v_GEN_$(V))
- am__v_GEN_ = $(am__v_GEN_$(AM_DEFAULT_VERBOSITY))
+@@ -206,13 +198,13 @@
  am__v_GEN_0 = @echo "  GEN   " $@;
- SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) dmesg.c fallocate.c \
--	flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c lscpu.c pivot_root.c \
-+	flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c pivot_root.c \
- 	rdev.c readprofile.c renice.c rtcwake.c setarch.c setsid.c \
- 	switch_root.c $(tunelp_SOURCES) unshare.c
- DIST_SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) dmesg.c \
--	fallocate.c flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c lscpu.c \
-+	fallocate.c flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c \
- 	pivot_root.c rdev.c readprofile.c renice.c rtcwake.c setarch.c \
- 	setsid.c switch_root.c $(tunelp_SOURCES) unshare.c
- INFO_DEPS = $(srcdir)/ipc.info
-@@ -248,7 +245,7 @@ NROFF = nroff
+ SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) $(dmesg_SOURCES) \
+ 	$(fallocate_SOURCES) flock.c fsfreeze.c $(fstrim_SOURCES) \
+-	ipcmk.c ipcrm.c ipcs.c ldattach.c $(lscpu_SOURCES) \
++	ipcmk.c ipcrm.c ipcs.c ldattach.c \
+ 	pivot_root.c readprofile.c renice.c $(rtcwake_SOURCES) \
+ 	setarch.c setsid.c switch_root.c $(tunelp_SOURCES) unshare.c
+ DIST_SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) $(dmesg_SOURCES) \
+ 	$(am__fallocate_SOURCES_DIST) flock.c fsfreeze.c \
+ 	$(fstrim_SOURCES) ipcmk.c ipcrm.c ipcs.c ldattach.c \
+-	$(am__lscpu_SOURCES_DIST) pivot_root.c readprofile.c renice.c \
++	pivot_root.c readprofile.c renice.c \
+ 	$(rtcwake_SOURCES) setarch.c setsid.c switch_root.c \
+ 	$(tunelp_SOURCES) unshare.c
+ am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
+@@ -242,7 +234,7 @@
  MANS = $(dist_man_MANS) $(man_MANS)
  am__dist_noinst_DATA_DIST = flock.1 ipcrm.1 ipcs.1 ipcmk.1 renice.1 \
  	setsid.1 readprofile.1 dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
--	ldattach.8 lscpu.1 tunelp.8 rtcwake.8 fallocate.1 pivot_root.8 \
-+	ldattach.8 tunelp.8 rtcwake.8 fallocate.1 pivot_root.8 \
- 	switch_root.8 unshare.1 arch.1 rdev.8
+-	ldattach.8 tunelp.8 rtcwake.8 fsfreeze.8 fstrim.8 lscpu.1 \
++	ldattach.8 tunelp.8 rtcwake.8 fsfreeze.8 fstrim.8 \
+ 	fallocate.1 pivot_root.8 switch_root.8 unshare.1 arch.1
  DATA = $(dist_noinst_DATA)
  ETAGS = etags
-@@ -678,9 +675,6 @@ ipcs$(EXEEXT): $(ipcs_OBJECTS) $(ipcs_DE
+@@ -438,7 +430,6 @@
+ 	readprofile.1 $(am__append_5) $(am__append_7) $(am__append_9) \
+ 	$(am__append_11) $(am__append_13) $(am__append_15) \
+ 	$(am__append_17)
+-@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@lscpu_SOURCES = lscpu.c $(top_srcdir)/lib/cpuset.c
+ cytune_SOURCES = cytune.c cyclades.h
+ tunelp_SOURCES = tunelp.c lp.h
+ fstrim_SOURCES = fstrim.c $(top_srcdir)/lib/strutils.c
+@@ -693,9 +684,6 @@
  ldattach$(EXEEXT): $(ldattach_OBJECTS) $(ldattach_DEPENDENCIES) 
  	@rm -f ldattach$(EXEEXT)
  	$(AM_V_CCLD)$(LINK) $(ldattach_OBJECTS) $(ldattach_LDADD) $(LIBS)
@@ -93,11 +99,11 @@ Index: util-linux-ng-2.17.2/sys-utils/Makefile.in
  pivot_root$(EXEEXT): $(pivot_root_OBJECTS) $(pivot_root_DEPENDENCIES) 
  	@rm -f pivot_root$(EXEEXT)
  	$(AM_V_CCLD)$(LINK) $(pivot_root_OBJECTS) $(pivot_root_LDADD) $(LIBS)
-@@ -728,7 +722,6 @@ distclean-compile:
+@@ -743,7 +731,6 @@
  @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcrm.Po@am__quote@
  @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcs.Po@am__quote@
  @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ldattach.Po@am__quote@
 -@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/lscpu.Po@am__quote@
  @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/pivot_root.Po@am__quote@
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/rdev.Po@am__quote@
  @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/readprofile.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/renice.Po@am__quote@
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 132f28b..0fd67d1 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r1"
+PR = "r2"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.3.4



