Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RisKL-0006B9-C0
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 19:46:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2012 10:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109151075"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 10:38:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 10:38:36 -0800
Message-Id: <7eb99149075cc2c701979fd186a5760e29819ab3.1325788605.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325788605.git.sgw@linux.intel.com>
References: <cover.1325788605.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325788605.git.sgw@linux.intel.com>
References: <cover.1325788605.git.sgw@linux.intel.com>
Subject: [PATCH 1/2] util-linux: Update patch for non-GPLv3
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
X-List-Received-Date: Thu, 05 Jan 2012 18:46:14 -0000

Rebase the disable-lscpu patch for the updated source base,
we only need to modify Makefile.am, since automake will regenerate
the Makefile.in.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../util-linux-2.20.1/remove-lscpu.patch           |   94 +------------------
 1 files changed, 5 insertions(+), 89 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux-2.20.1/remove-lscpu.patch
index afa50f4..434e28d 100644
--- a/meta/recipes-core/util-linux/util-linux-2.20.1/remove-lscpu.patch
+++ b/meta/recipes-core/util-linux/util-linux-2.20.1/remove-lscpu.patch
@@ -6,104 +6,20 @@ Take out lscpu stuff from the code
 Saul Wold <saul.wold@intel.com>
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: util-linux-2.19.1/sys-utils/Makefile.am
+Index: util-linux-2.20.1/sys-utils/Makefile.am
 ===================================================================
---- util-linux-2.19.1.orig/sys-utils/Makefile.am	2011-04-05 03:43:02.000000000 -0700
-+++ util-linux-2.19.1/sys-utils/Makefile.am	2011-06-29 12:08:24.187440334 -0700
-@@ -17,12 +17,6 @@
+--- util-linux-2.20.1.orig/sys-utils/Makefile.am
++++ util-linux-2.20.1/sys-utils/Makefile.am
+@@ -17,12 +17,6 @@ usrsbin_exec_PROGRAMS += ldattach tunelp
  dist_man_MANS += dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
  		ldattach.8 tunelp.8 rtcwake.8 fsfreeze.8 fstrim.8
  
 -if HAVE_CPU_SET_T
 -usrbin_exec_PROGRAMS += lscpu
--lscpu_SOURCES = lscpu.c $(top_srcdir)/lib/cpuset.c
+-lscpu_SOURCES = lscpu.c $(top_srcdir)/lib/cpuset.c $(top_srcdir)/lib/strutils.c
 -dist_man_MANS += lscpu.1
 -endif
 -
  endif
  
  cytune_SOURCES = cytune.c cyclades.h
-Index: util-linux-2.19.1/sys-utils/Makefile.in
-===================================================================
---- util-linux-2.19.1.orig/sys-utils/Makefile.in	2011-05-02 02:49:19.000000000 -0700
-+++ util-linux-2.19.1/sys-utils/Makefile.in	2011-06-29 12:10:47.647440371 -0700
-@@ -51,8 +51,6 @@
- @LINUX_TRUE@am__append_5 = dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
- @LINUX_TRUE@		ldattach.8 tunelp.8 rtcwake.8 fsfreeze.8 fstrim.8
- 
--@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@am__append_6 = lscpu
--@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@am__append_7 = lscpu.1
- @BUILD_FALLOCATE_TRUE@am__append_8 = fallocate
- @BUILD_FALLOCATE_TRUE@am__append_9 = fallocate.1
- @BUILD_PIVOT_ROOT_TRUE@am__append_10 = pivot_root
-@@ -98,7 +96,6 @@
- @BUILD_PIVOT_ROOT_TRUE@am__EXEEXT_4 = pivot_root$(EXEEXT)
- @BUILD_SWITCH_ROOT_TRUE@am__EXEEXT_5 = switch_root$(EXEEXT)
- @LINUX_TRUE@am__EXEEXT_6 = cytune$(EXEEXT) setarch$(EXEEXT)
--@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@am__EXEEXT_7 = lscpu$(EXEEXT)
- @BUILD_FALLOCATE_TRUE@am__EXEEXT_8 = fallocate$(EXEEXT)
- @BUILD_UNSHARE_TRUE@am__EXEEXT_9 = unshare$(EXEEXT)
- @LINUX_TRUE@am__EXEEXT_10 = ldattach$(EXEEXT) tunelp$(EXEEXT) \
-@@ -146,11 +143,6 @@
- ldattach_SOURCES = ldattach.c
- ldattach_OBJECTS = ldattach.$(OBJEXT)
- ldattach_LDADD = $(LDADD)
--am__lscpu_SOURCES_DIST = lscpu.c $(top_srcdir)/lib/cpuset.c
--@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@am_lscpu_OBJECTS = lscpu.$(OBJEXT) \
--@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@	cpuset.$(OBJEXT)
--lscpu_OBJECTS = $(am_lscpu_OBJECTS)
--lscpu_LDADD = $(LDADD)
- pivot_root_SOURCES = pivot_root.c
- pivot_root_OBJECTS = pivot_root.$(OBJEXT)
- pivot_root_LDADD = $(LDADD)
-@@ -206,13 +198,13 @@
- am__v_GEN_0 = @echo "  GEN   " $@;
- SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) $(dmesg_SOURCES) \
- 	$(fallocate_SOURCES) flock.c fsfreeze.c $(fstrim_SOURCES) \
--	ipcmk.c ipcrm.c ipcs.c ldattach.c $(lscpu_SOURCES) \
-+	ipcmk.c ipcrm.c ipcs.c ldattach.c \
- 	pivot_root.c readprofile.c renice.c $(rtcwake_SOURCES) \
- 	setarch.c setsid.c switch_root.c $(tunelp_SOURCES) unshare.c
- DIST_SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) $(dmesg_SOURCES) \
- 	$(am__fallocate_SOURCES_DIST) flock.c fsfreeze.c \
- 	$(fstrim_SOURCES) ipcmk.c ipcrm.c ipcs.c ldattach.c \
--	$(am__lscpu_SOURCES_DIST) pivot_root.c readprofile.c renice.c \
-+	pivot_root.c readprofile.c renice.c \
- 	$(rtcwake_SOURCES) setarch.c setsid.c switch_root.c \
- 	$(tunelp_SOURCES) unshare.c
- am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
-@@ -242,7 +234,7 @@
- MANS = $(dist_man_MANS) $(man_MANS)
- am__dist_noinst_DATA_DIST = flock.1 ipcrm.1 ipcs.1 ipcmk.1 renice.1 \
- 	setsid.1 readprofile.1 dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
--	ldattach.8 tunelp.8 rtcwake.8 fsfreeze.8 fstrim.8 lscpu.1 \
-+	ldattach.8 tunelp.8 rtcwake.8 fsfreeze.8 fstrim.8 \
- 	fallocate.1 pivot_root.8 switch_root.8 unshare.1 arch.1
- DATA = $(dist_noinst_DATA)
- ETAGS = etags
-@@ -438,7 +430,6 @@
- 	readprofile.1 $(am__append_5) $(am__append_7) $(am__append_9) \
- 	$(am__append_11) $(am__append_13) $(am__append_15) \
- 	$(am__append_17)
--@HAVE_CPU_SET_T_TRUE@@LINUX_TRUE@lscpu_SOURCES = lscpu.c $(top_srcdir)/lib/cpuset.c
- cytune_SOURCES = cytune.c cyclades.h
- tunelp_SOURCES = tunelp.c lp.h
- fstrim_SOURCES = fstrim.c $(top_srcdir)/lib/strutils.c
-@@ -693,9 +684,6 @@
- ldattach$(EXEEXT): $(ldattach_OBJECTS) $(ldattach_DEPENDENCIES) 
- 	@rm -f ldattach$(EXEEXT)
- 	$(AM_V_CCLD)$(LINK) $(ldattach_OBJECTS) $(ldattach_LDADD) $(LIBS)
--lscpu$(EXEEXT): $(lscpu_OBJECTS) $(lscpu_DEPENDENCIES) 
--	@rm -f lscpu$(EXEEXT)
--	$(AM_V_CCLD)$(LINK) $(lscpu_OBJECTS) $(lscpu_LDADD) $(LIBS)
- pivot_root$(EXEEXT): $(pivot_root_OBJECTS) $(pivot_root_DEPENDENCIES) 
- 	@rm -f pivot_root$(EXEEXT)
- 	$(AM_V_CCLD)$(LINK) $(pivot_root_OBJECTS) $(pivot_root_LDADD) $(LIBS)
-@@ -743,7 +731,6 @@
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcrm.Po@am__quote@
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcs.Po@am__quote@
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ldattach.Po@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/lscpu.Po@am__quote@
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/pivot_root.Po@am__quote@
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/readprofile.Po@am__quote@
- @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/renice.Po@am__quote@
-- 
1.7.6.4



