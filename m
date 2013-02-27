Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UAil2-0005ON-8N
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:18:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Feb 2013 07:01:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,747,1355126400"; d="scan'208";a="262130997"
Received: from unknown (HELO localhost) ([10.255.12.236])
	by azsmga001.ch.intel.com with ESMTP; 27 Feb 2013 07:00:52 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 09:00:49 -0600
Message-Id: <4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1361976853.git.tom.zanussi@linux.intel.com>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/3] libaudit: new package
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
X-List-Received-Date: Wed, 27 Feb 2013 15:18:17 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Add libaudit, used by system call auditing applications.  From the
sources:

 "The audit package contains the user space utilities for storing and
 searching the audit records generate by the audit subsystem in the
 Linux 2.6 kernel."

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../libaudit/libaudit/build-lib-only.patch         |  33 ++
 .../libaudit/libaudit/fix-host-gen.patch           | 461 +++++++++++++++++++++
 meta/recipes-support/libaudit/libaudit_2.2.2.bb    |  25 ++
 3 files changed, 519 insertions(+)
 create mode 100644 meta/recipes-support/libaudit/libaudit/build-lib-only.patch
 create mode 100644 meta/recipes-support/libaudit/libaudit/fix-host-gen.patch
 create mode 100644 meta/recipes-support/libaudit/libaudit_2.2.2.bb

diff --git a/meta/recipes-support/libaudit/libaudit/build-lib-only.patch b/meta/recipes-support/libaudit/libaudit/build-lib-only.patch
new file mode 100644
index 0000000..1f2570d
--- /dev/null
+++ b/meta/recipes-support/libaudit/libaudit/build-lib-only.patch
@@ -0,0 +1,33 @@
+Currently we need only the libaudit shared library, which is a
+dependency for certain other packages such as 'perf-trace' and
+'perf-script'.  We don't need all the other tools, daemons, or plugins
+that come with the audit code.
+
+Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Index: audit-2.2.2/Makefile.in
+===================================================================
+--- audit-2.2.2.orig/Makefile.in
++++ audit-2.2.2/Makefile.in
+@@ -112,8 +112,7 @@ AM_RECURSIVE_TARGETS = $(RECURSIVE_TARGE
+ 	distdir dist dist-all distcheck
+ ETAGS = etags
+ CTAGS = ctags
+-DIST_SUBDIRS = lib auparse src/mt src/libev src audisp tools bindings \
+-	init.d docs swig
++DIST_SUBDIRS = lib
+ DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
+ distdir = $(PACKAGE)-$(VERSION)
+ top_distdir = $(distdir)
+@@ -287,8 +286,7 @@ target_vendor = @target_vendor@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-SUBDIRS = lib auparse src/mt src/libev src audisp tools bindings \
+-	init.d docs $(am__append_1)
++SUBDIRS = lib
+ EXTRA_DIST = ChangeLog AUTHORS NEWS README INSTALL audit.spec \
+ 	contrib/capp.rules contrib/nispom.rules contrib/lspp.rules \
+ 	contrib/stig.rules contrib/skeleton.c contrib/avc_snap \
diff --git a/meta/recipes-support/libaudit/libaudit/fix-host-gen.patch b/meta/recipes-support/libaudit/libaudit/fix-host-gen.patch
new file mode 100644
index 0000000..34d2fc9
--- /dev/null
+++ b/meta/recipes-support/libaudit/libaudit/fix-host-gen.patch
@@ -0,0 +1,461 @@
+There are a whole set of gen_xxx programs that are run on the build
+host to generate various tables and related structs and code.  These
+Makefile.in changes allow those programs to be built for the host
+rather than the target and avoid producing 'unable to execute' errors,
+as they do without these changes.
+
+Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Index: audit-2.2.2/lib/Makefile.in
+===================================================================
+--- audit-2.2.2.orig/lib/Makefile.in
++++ audit-2.2.2/lib/Makefile.in
+@@ -144,8 +144,8 @@ am_gen_actiontabs_h_OBJECTS = gen_action
+ gen_actiontabs_h_OBJECTS = $(am_gen_actiontabs_h_OBJECTS)
+ gen_actiontabs_h_LDADD = $(LDADD)
+ gen_actiontabs_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(gen_actiontabs_h_CFLAGS) \
+-	$(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) $(gen_actiontabs_h_CFLAGS) \
++	$(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) -o $@
+ am__gen_alpha_tables_h_SOURCES_DIST = gen_tables.c gen_tables.h \
+ 	alpha_table.h
+ @USE_ALPHA_TRUE@am_gen_alpha_tables_h_OBJECTS =  \
+@@ -153,9 +153,9 @@ am__gen_alpha_tables_h_SOURCES_DIST = ge
+ gen_alpha_tables_h_OBJECTS = $(am_gen_alpha_tables_h_OBJECTS)
+ gen_alpha_tables_h_LDADD = $(LDADD)
+ gen_alpha_tables_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) \
+-	$(gen_alpha_tables_h_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
+-	$(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) \
++	$(gen_alpha_tables_h_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) \
++	$(BUILD_LDFLAGS) -o $@
+ am__gen_armeb_tables_h_SOURCES_DIST = gen_tables.c gen_tables.h \
+ 	armeb_table.h
+ @USE_ARMEB_TRUE@am_gen_armeb_tables_h_OBJECTS =  \
+@@ -163,97 +163,97 @@ am__gen_armeb_tables_h_SOURCES_DIST = ge
+ gen_armeb_tables_h_OBJECTS = $(am_gen_armeb_tables_h_OBJECTS)
+ gen_armeb_tables_h_LDADD = $(LDADD)
+ gen_armeb_tables_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) \
+-	$(gen_armeb_tables_h_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
+-	$(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) \
++	$(gen_armeb_tables_h_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) \
++	$(BUILD_LDFLAGS) -o $@
+ am_gen_errtabs_h_OBJECTS = gen_errtabs_h-gen_tables.$(OBJEXT)
+ gen_errtabs_h_OBJECTS = $(am_gen_errtabs_h_OBJECTS)
+ gen_errtabs_h_LDADD = $(LDADD)
+ gen_errtabs_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(gen_errtabs_h_CFLAGS) \
+-	$(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) $(gen_errtabs_h_CFLAGS) \
++	$(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) -o $@
+ am_gen_fieldtabs_h_OBJECTS = gen_fieldtabs_h-gen_tables.$(OBJEXT)
+ gen_fieldtabs_h_OBJECTS = $(am_gen_fieldtabs_h_OBJECTS)
+ gen_fieldtabs_h_LDADD = $(LDADD)
+ gen_fieldtabs_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(gen_fieldtabs_h_CFLAGS) \
+-	$(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) $(gen_fieldtabs_h_CFLAGS) \
++	$(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) -o $@
+ am_gen_flagtabs_h_OBJECTS = gen_flagtabs_h-gen_tables.$(OBJEXT)
+ gen_flagtabs_h_OBJECTS = $(am_gen_flagtabs_h_OBJECTS)
+ gen_flagtabs_h_LDADD = $(LDADD)
+ gen_flagtabs_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(gen_flagtabs_h_CFLAGS) \
+-	$(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) $(gen_flagtabs_h_CFLAGS) \
++	$(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) -o $@
+ am_gen_ftypetabs_h_OBJECTS = gen_ftypetabs_h-gen_tables.$(OBJEXT)
+ gen_ftypetabs_h_OBJECTS = $(am_gen_ftypetabs_h_OBJECTS)
+ gen_ftypetabs_h_LDADD = $(LDADD)
+ gen_ftypetabs_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(gen_ftypetabs_h_CFLAGS) \
+-	$(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) $(gen_ftypetabs_h_CFLAGS) \
++	$(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) -o $@
+ am_gen_i386_tables_h_OBJECTS = gen_i386_tables_h-gen_tables.$(OBJEXT)
+ gen_i386_tables_h_OBJECTS = $(am_gen_i386_tables_h_OBJECTS)
+ gen_i386_tables_h_LDADD = $(LDADD)
+ gen_i386_tables_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) \
+-	$(gen_i386_tables_h_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) \
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) \
++	$(gen_i386_tables_h_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) \
+ 	-o $@
+ am_gen_ia64_tables_h_OBJECTS = gen_ia64_tables_h-gen_tables.$(OBJEXT)
+ gen_ia64_tables_h_OBJECTS = $(am_gen_ia64_tables_h_OBJECTS)
+ gen_ia64_tables_h_LDADD = $(LDADD)
+ gen_ia64_tables_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) \
+-	$(gen_ia64_tables_h_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) \
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) \
++	$(gen_ia64_tables_h_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) \
+ 	-o $@
+ am_gen_machinetabs_h_OBJECTS = gen_machinetabs_h-gen_tables.$(OBJEXT)
+ gen_machinetabs_h_OBJECTS = $(am_gen_machinetabs_h_OBJECTS)
+ gen_machinetabs_h_LDADD = $(LDADD)
+ gen_machinetabs_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) \
+-	$(gen_machinetabs_h_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) \
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) \
++	$(gen_machinetabs_h_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) \
+ 	-o $@
+ am_gen_msg_typetabs_h_OBJECTS =  \
+ 	gen_msg_typetabs_h-gen_tables.$(OBJEXT)
+ gen_msg_typetabs_h_OBJECTS = $(am_gen_msg_typetabs_h_OBJECTS)
+ gen_msg_typetabs_h_LDADD = $(LDADD)
+ gen_msg_typetabs_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) \
+-	$(gen_msg_typetabs_h_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
+-	$(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) \
++	$(gen_msg_typetabs_h_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) \
++	$(BUILD_LDFLAGS) -o $@
+ am_gen_optabs_h_OBJECTS = gen_optabs_h-gen_tables.$(OBJEXT)
+ gen_optabs_h_OBJECTS = $(am_gen_optabs_h_OBJECTS)
+ gen_optabs_h_LDADD = $(LDADD)
+ gen_optabs_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(gen_optabs_h_CFLAGS) \
+-	$(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) $(gen_optabs_h_CFLAGS) \
++	$(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) -o $@
+ am_gen_ppc_tables_h_OBJECTS = gen_ppc_tables_h-gen_tables.$(OBJEXT)
+ gen_ppc_tables_h_OBJECTS = $(am_gen_ppc_tables_h_OBJECTS)
+ gen_ppc_tables_h_LDADD = $(LDADD)
+ gen_ppc_tables_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(gen_ppc_tables_h_CFLAGS) \
+-	$(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) $(gen_ppc_tables_h_CFLAGS) \
++	$(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) -o $@
+ am_gen_s390_tables_h_OBJECTS = gen_s390_tables_h-gen_tables.$(OBJEXT)
+ gen_s390_tables_h_OBJECTS = $(am_gen_s390_tables_h_OBJECTS)
+ gen_s390_tables_h_LDADD = $(LDADD)
+ gen_s390_tables_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) \
+-	$(gen_s390_tables_h_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) \
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) \
++	$(gen_s390_tables_h_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) $(BUILD_LDFLAGS) \
+ 	-o $@
+ am_gen_s390x_tables_h_OBJECTS =  \
+ 	gen_s390x_tables_h-gen_tables.$(OBJEXT)
+ gen_s390x_tables_h_OBJECTS = $(am_gen_s390x_tables_h_OBJECTS)
+ gen_s390x_tables_h_LDADD = $(LDADD)
+ gen_s390x_tables_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) \
+-	$(gen_s390x_tables_h_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
+-	$(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) \
++	$(gen_s390x_tables_h_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) \
++	$(BUILD_LDFLAGS) -o $@
+ am_gen_x86_64_tables_h_OBJECTS =  \
+ 	gen_x86_64_tables_h-gen_tables.$(OBJEXT)
+ gen_x86_64_tables_h_OBJECTS = $(am_gen_x86_64_tables_h_OBJECTS)
+ gen_x86_64_tables_h_LDADD = $(LDADD)
+ gen_x86_64_tables_h_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+-	$(LIBTOOLFLAGS) --mode=link $(CCLD) \
+-	$(gen_x86_64_tables_h_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
+-	$(LDFLAGS) -o $@
++	$(LIBTOOLFLAGS) --mode=link $(BUILD_CC) \
++	$(gen_x86_64_tables_h_CFLAGS) $(BUILD_CFLAGS) $(AM_LDFLAGS) \
++	$(BUILD_LDFLAGS) -o $@
+ DEFAULT_INCLUDES = -I.@am__isrc@ -I$(top_builddir)
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+@@ -601,52 +601,52 @@ clean-noinstPROGRAMS:
+ 	rm -f $$list
+ gen_actiontabs_h$(EXEEXT): $(gen_actiontabs_h_OBJECTS) $(gen_actiontabs_h_DEPENDENCIES) $(EXTRA_gen_actiontabs_h_DEPENDENCIES) 
+ 	@rm -f gen_actiontabs_h$(EXEEXT)
+-	$(gen_actiontabs_h_LINK) $(gen_actiontabs_h_OBJECTS) $(gen_actiontabs_h_LDADD) $(LIBS)
++	$(gen_actiontabs_h_LINK) $(gen_actiontabs_h_OBJECTS) $(gen_actiontabs_h_LDADD) $(BUILD_LIBS)
+ gen_alpha_tables_h$(EXEEXT): $(gen_alpha_tables_h_OBJECTS) $(gen_alpha_tables_h_DEPENDENCIES) $(EXTRA_gen_alpha_tables_h_DEPENDENCIES) 
+ 	@rm -f gen_alpha_tables_h$(EXEEXT)
+-	$(gen_alpha_tables_h_LINK) $(gen_alpha_tables_h_OBJECTS) $(gen_alpha_tables_h_LDADD) $(LIBS)
++	$(gen_alpha_tables_h_LINK) $(gen_alpha_tables_h_OBJECTS) $(gen_alpha_tables_h_LDADD) $(BUILD_LIBS)
+ gen_armeb_tables_h$(EXEEXT): $(gen_armeb_tables_h_OBJECTS) $(gen_armeb_tables_h_DEPENDENCIES) $(EXTRA_gen_armeb_tables_h_DEPENDENCIES) 
+ 	@rm -f gen_armeb_tables_h$(EXEEXT)
+-	$(gen_armeb_tables_h_LINK) $(gen_armeb_tables_h_OBJECTS) $(gen_armeb_tables_h_LDADD) $(LIBS)
++	$(gen_armeb_tables_h_LINK) $(gen_armeb_tables_h_OBJECTS) $(gen_armeb_tables_h_LDADD) $(BUILD_LIBS)
+ gen_errtabs_h$(EXEEXT): $(gen_errtabs_h_OBJECTS) $(gen_errtabs_h_DEPENDENCIES) $(EXTRA_gen_errtabs_h_DEPENDENCIES) 
+ 	@rm -f gen_errtabs_h$(EXEEXT)
+-	$(gen_errtabs_h_LINK) $(gen_errtabs_h_OBJECTS) $(gen_errtabs_h_LDADD) $(LIBS)
++	$(gen_errtabs_h_LINK) $(gen_errtabs_h_OBJECTS) $(gen_errtabs_h_LDADD) $(BUILD_LIBS)
+ gen_fieldtabs_h$(EXEEXT): $(gen_fieldtabs_h_OBJECTS) $(gen_fieldtabs_h_DEPENDENCIES) $(EXTRA_gen_fieldtabs_h_DEPENDENCIES) 
+ 	@rm -f gen_fieldtabs_h$(EXEEXT)
+-	$(gen_fieldtabs_h_LINK) $(gen_fieldtabs_h_OBJECTS) $(gen_fieldtabs_h_LDADD) $(LIBS)
++	$(gen_fieldtabs_h_LINK) $(gen_fieldtabs_h_OBJECTS) $(gen_fieldtabs_h_LDADD) $(BUILD_LIBS)
+ gen_flagtabs_h$(EXEEXT): $(gen_flagtabs_h_OBJECTS) $(gen_flagtabs_h_DEPENDENCIES) $(EXTRA_gen_flagtabs_h_DEPENDENCIES) 
+ 	@rm -f gen_flagtabs_h$(EXEEXT)
+-	$(gen_flagtabs_h_LINK) $(gen_flagtabs_h_OBJECTS) $(gen_flagtabs_h_LDADD) $(LIBS)
++	$(gen_flagtabs_h_LINK) $(gen_flagtabs_h_OBJECTS) $(gen_flagtabs_h_LDADD) $(BUILD_LIBS)
+ gen_ftypetabs_h$(EXEEXT): $(gen_ftypetabs_h_OBJECTS) $(gen_ftypetabs_h_DEPENDENCIES) $(EXTRA_gen_ftypetabs_h_DEPENDENCIES) 
+ 	@rm -f gen_ftypetabs_h$(EXEEXT)
+-	$(gen_ftypetabs_h_LINK) $(gen_ftypetabs_h_OBJECTS) $(gen_ftypetabs_h_LDADD) $(LIBS)
++	$(gen_ftypetabs_h_LINK) $(gen_ftypetabs_h_OBJECTS) $(gen_ftypetabs_h_LDADD) $(BUILD_LIBS)
+ gen_i386_tables_h$(EXEEXT): $(gen_i386_tables_h_OBJECTS) $(gen_i386_tables_h_DEPENDENCIES) $(EXTRA_gen_i386_tables_h_DEPENDENCIES) 
+ 	@rm -f gen_i386_tables_h$(EXEEXT)
+-	$(gen_i386_tables_h_LINK) $(gen_i386_tables_h_OBJECTS) $(gen_i386_tables_h_LDADD) $(LIBS)
++	$(gen_i386_tables_h_LINK) $(gen_i386_tables_h_OBJECTS) $(gen_i386_tables_h_LDADD) $(BUILD_LIBS)
+ gen_ia64_tables_h$(EXEEXT): $(gen_ia64_tables_h_OBJECTS) $(gen_ia64_tables_h_DEPENDENCIES) $(EXTRA_gen_ia64_tables_h_DEPENDENCIES) 
+ 	@rm -f gen_ia64_tables_h$(EXEEXT)
+-	$(gen_ia64_tables_h_LINK) $(gen_ia64_tables_h_OBJECTS) $(gen_ia64_tables_h_LDADD) $(LIBS)
++	$(gen_ia64_tables_h_LINK) $(gen_ia64_tables_h_OBJECTS) $(gen_ia64_tables_h_LDADD) $(BUILD_LIBS)
+ gen_machinetabs_h$(EXEEXT): $(gen_machinetabs_h_OBJECTS) $(gen_machinetabs_h_DEPENDENCIES) $(EXTRA_gen_machinetabs_h_DEPENDENCIES) 
+ 	@rm -f gen_machinetabs_h$(EXEEXT)
+-	$(gen_machinetabs_h_LINK) $(gen_machinetabs_h_OBJECTS) $(gen_machinetabs_h_LDADD) $(LIBS)
++	$(gen_machinetabs_h_LINK) $(gen_machinetabs_h_OBJECTS) $(gen_machinetabs_h_LDADD) $(BUILD_LIBS)
+ gen_msg_typetabs_h$(EXEEXT): $(gen_msg_typetabs_h_OBJECTS) $(gen_msg_typetabs_h_DEPENDENCIES) $(EXTRA_gen_msg_typetabs_h_DEPENDENCIES) 
+ 	@rm -f gen_msg_typetabs_h$(EXEEXT)
+-	$(gen_msg_typetabs_h_LINK) $(gen_msg_typetabs_h_OBJECTS) $(gen_msg_typetabs_h_LDADD) $(LIBS)
++	$(gen_msg_typetabs_h_LINK) $(gen_msg_typetabs_h_OBJECTS) $(gen_msg_typetabs_h_LDADD) $(BUILD_LIBS)
+ gen_optabs_h$(EXEEXT): $(gen_optabs_h_OBJECTS) $(gen_optabs_h_DEPENDENCIES) $(EXTRA_gen_optabs_h_DEPENDENCIES) 
+ 	@rm -f gen_optabs_h$(EXEEXT)
+-	$(gen_optabs_h_LINK) $(gen_optabs_h_OBJECTS) $(gen_optabs_h_LDADD) $(LIBS)
++	$(gen_optabs_h_LINK) $(gen_optabs_h_OBJECTS) $(gen_optabs_h_LDADD) $(BUILD_LIBS)
+ gen_ppc_tables_h$(EXEEXT): $(gen_ppc_tables_h_OBJECTS) $(gen_ppc_tables_h_DEPENDENCIES) $(EXTRA_gen_ppc_tables_h_DEPENDENCIES) 
+ 	@rm -f gen_ppc_tables_h$(EXEEXT)
+-	$(gen_ppc_tables_h_LINK) $(gen_ppc_tables_h_OBJECTS) $(gen_ppc_tables_h_LDADD) $(LIBS)
++	$(gen_ppc_tables_h_LINK) $(gen_ppc_tables_h_OBJECTS) $(gen_ppc_tables_h_LDADD) $(BUILD_LIBS)
+ gen_s390_tables_h$(EXEEXT): $(gen_s390_tables_h_OBJECTS) $(gen_s390_tables_h_DEPENDENCIES) $(EXTRA_gen_s390_tables_h_DEPENDENCIES) 
+ 	@rm -f gen_s390_tables_h$(EXEEXT)
+-	$(gen_s390_tables_h_LINK) $(gen_s390_tables_h_OBJECTS) $(gen_s390_tables_h_LDADD) $(LIBS)
++	$(gen_s390_tables_h_LINK) $(gen_s390_tables_h_OBJECTS) $(gen_s390_tables_h_LDADD) $(BUILD_LIBS)
+ gen_s390x_tables_h$(EXEEXT): $(gen_s390x_tables_h_OBJECTS) $(gen_s390x_tables_h_DEPENDENCIES) $(EXTRA_gen_s390x_tables_h_DEPENDENCIES) 
+ 	@rm -f gen_s390x_tables_h$(EXEEXT)
+-	$(gen_s390x_tables_h_LINK) $(gen_s390x_tables_h_OBJECTS) $(gen_s390x_tables_h_LDADD) $(LIBS)
++	$(gen_s390x_tables_h_LINK) $(gen_s390x_tables_h_OBJECTS) $(gen_s390x_tables_h_LDADD) $(BUILD_LIBS)
+ gen_x86_64_tables_h$(EXEEXT): $(gen_x86_64_tables_h_OBJECTS) $(gen_x86_64_tables_h_DEPENDENCIES) $(EXTRA_gen_x86_64_tables_h_DEPENDENCIES) 
+ 	@rm -f gen_x86_64_tables_h$(EXEEXT)
+-	$(gen_x86_64_tables_h_LINK) $(gen_x86_64_tables_h_OBJECTS) $(gen_x86_64_tables_h_LDADD) $(LIBS)
++	$(gen_x86_64_tables_h_LINK) $(gen_x86_64_tables_h_OBJECTS) $(gen_x86_64_tables_h_LDADD) $(BUILD_LIBS)
+ 
+ mostlyclean-compile:
+ 	-rm -f *.$(OBJEXT)
+@@ -699,11 +699,11 @@ distclean-compile:
+ @am__fastdepCC_FALSE@	$(LTCOMPILE) -c -o $@ $<
+ 
+ gen_actiontabs_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_actiontabs_h_CFLAGS) $(CFLAGS) -MT gen_actiontabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_actiontabs_h-gen_tables.Tpo -c -o gen_actiontabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_actiontabs_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_actiontabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_actiontabs_h-gen_tables.Tpo -c -o gen_actiontabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_actiontabs_h-gen_tables.Tpo $(DEPDIR)/gen_actiontabs_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_actiontabs_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_actiontabs_h_CFLAGS) $(CFLAGS) -c -o gen_actiontabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_actiontabs_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_actiontabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_actiontabs_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_actiontabs_h_CFLAGS) $(CFLAGS) -MT gen_actiontabs_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_actiontabs_h-gen_tables.Tpo -c -o gen_actiontabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -713,11 +713,11 @@ gen_actiontabs_h-gen_tables.obj: gen_tab
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_actiontabs_h_CFLAGS) $(CFLAGS) -c -o gen_actiontabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_alpha_tables_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_alpha_tables_h_CFLAGS) $(CFLAGS) -MT gen_alpha_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_alpha_tables_h-gen_tables.Tpo -c -o gen_alpha_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_alpha_tables_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_alpha_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_alpha_tables_h-gen_tables.Tpo -c -o gen_alpha_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_alpha_tables_h-gen_tables.Tpo $(DEPDIR)/gen_alpha_tables_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_alpha_tables_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_alpha_tables_h_CFLAGS) $(CFLAGS) -c -o gen_alpha_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_alpha_tables_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_alpha_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_alpha_tables_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_alpha_tables_h_CFLAGS) $(CFLAGS) -MT gen_alpha_tables_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_alpha_tables_h-gen_tables.Tpo -c -o gen_alpha_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -727,11 +727,11 @@ gen_alpha_tables_h-gen_tables.obj: gen_t
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_alpha_tables_h_CFLAGS) $(CFLAGS) -c -o gen_alpha_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_armeb_tables_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_armeb_tables_h_CFLAGS) $(CFLAGS) -MT gen_armeb_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_armeb_tables_h-gen_tables.Tpo -c -o gen_armeb_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_armeb_tables_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_armeb_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_armeb_tables_h-gen_tables.Tpo -c -o gen_armeb_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_armeb_tables_h-gen_tables.Tpo $(DEPDIR)/gen_armeb_tables_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_armeb_tables_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_armeb_tables_h_CFLAGS) $(CFLAGS) -c -o gen_armeb_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_armeb_tables_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_armeb_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_armeb_tables_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_armeb_tables_h_CFLAGS) $(CFLAGS) -MT gen_armeb_tables_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_armeb_tables_h-gen_tables.Tpo -c -o gen_armeb_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -741,11 +741,11 @@ gen_armeb_tables_h-gen_tables.obj: gen_t
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_armeb_tables_h_CFLAGS) $(CFLAGS) -c -o gen_armeb_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_errtabs_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_errtabs_h_CFLAGS) $(CFLAGS) -MT gen_errtabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_errtabs_h-gen_tables.Tpo -c -o gen_errtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_errtabs_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_errtabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_errtabs_h-gen_tables.Tpo -c -o gen_errtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_errtabs_h-gen_tables.Tpo $(DEPDIR)/gen_errtabs_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_errtabs_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_errtabs_h_CFLAGS) $(CFLAGS) -c -o gen_errtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_errtabs_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_errtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_errtabs_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_errtabs_h_CFLAGS) $(CFLAGS) -MT gen_errtabs_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_errtabs_h-gen_tables.Tpo -c -o gen_errtabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -755,11 +755,11 @@ gen_errtabs_h-gen_tables.obj: gen_tables
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_errtabs_h_CFLAGS) $(CFLAGS) -c -o gen_errtabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_fieldtabs_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_fieldtabs_h_CFLAGS) $(CFLAGS) -MT gen_fieldtabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_fieldtabs_h-gen_tables.Tpo -c -o gen_fieldtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_fieldtabs_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_fieldtabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_fieldtabs_h-gen_tables.Tpo -c -o gen_fieldtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_fieldtabs_h-gen_tables.Tpo $(DEPDIR)/gen_fieldtabs_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_fieldtabs_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_fieldtabs_h_CFLAGS) $(CFLAGS) -c -o gen_fieldtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_fieldtabs_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_fieldtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_fieldtabs_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_fieldtabs_h_CFLAGS) $(CFLAGS) -MT gen_fieldtabs_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_fieldtabs_h-gen_tables.Tpo -c -o gen_fieldtabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -769,11 +769,11 @@ gen_fieldtabs_h-gen_tables.obj: gen_tabl
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_fieldtabs_h_CFLAGS) $(CFLAGS) -c -o gen_fieldtabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_flagtabs_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_flagtabs_h_CFLAGS) $(CFLAGS) -MT gen_flagtabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_flagtabs_h-gen_tables.Tpo -c -o gen_flagtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_flagtabs_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_flagtabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_flagtabs_h-gen_tables.Tpo -c -o gen_flagtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_flagtabs_h-gen_tables.Tpo $(DEPDIR)/gen_flagtabs_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_flagtabs_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_flagtabs_h_CFLAGS) $(CFLAGS) -c -o gen_flagtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_flagtabs_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_flagtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_flagtabs_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_flagtabs_h_CFLAGS) $(CFLAGS) -MT gen_flagtabs_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_flagtabs_h-gen_tables.Tpo -c -o gen_flagtabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -783,11 +783,11 @@ gen_flagtabs_h-gen_tables.obj: gen_table
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_flagtabs_h_CFLAGS) $(CFLAGS) -c -o gen_flagtabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_ftypetabs_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ftypetabs_h_CFLAGS) $(CFLAGS) -MT gen_ftypetabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_ftypetabs_h-gen_tables.Tpo -c -o gen_ftypetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_ftypetabs_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_ftypetabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_ftypetabs_h-gen_tables.Tpo -c -o gen_ftypetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_ftypetabs_h-gen_tables.Tpo $(DEPDIR)/gen_ftypetabs_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_ftypetabs_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ftypetabs_h_CFLAGS) $(CFLAGS) -c -o gen_ftypetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_ftypetabs_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_ftypetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_ftypetabs_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ftypetabs_h_CFLAGS) $(CFLAGS) -MT gen_ftypetabs_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_ftypetabs_h-gen_tables.Tpo -c -o gen_ftypetabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -797,11 +797,11 @@ gen_ftypetabs_h-gen_tables.obj: gen_tabl
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ftypetabs_h_CFLAGS) $(CFLAGS) -c -o gen_ftypetabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_i386_tables_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_i386_tables_h_CFLAGS) $(CFLAGS) -MT gen_i386_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_i386_tables_h-gen_tables.Tpo -c -o gen_i386_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_i386_tables_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_i386_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_i386_tables_h-gen_tables.Tpo -c -o gen_i386_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_i386_tables_h-gen_tables.Tpo $(DEPDIR)/gen_i386_tables_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_i386_tables_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_i386_tables_h_CFLAGS) $(CFLAGS) -c -o gen_i386_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_i386_tables_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_i386_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_i386_tables_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_i386_tables_h_CFLAGS) $(CFLAGS) -MT gen_i386_tables_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_i386_tables_h-gen_tables.Tpo -c -o gen_i386_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -811,11 +811,11 @@ gen_i386_tables_h-gen_tables.obj: gen_ta
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_i386_tables_h_CFLAGS) $(CFLAGS) -c -o gen_i386_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_ia64_tables_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ia64_tables_h_CFLAGS) $(CFLAGS) -MT gen_ia64_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_ia64_tables_h-gen_tables.Tpo -c -o gen_ia64_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_ia64_tables_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_ia64_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_ia64_tables_h-gen_tables.Tpo -c -o gen_ia64_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_ia64_tables_h-gen_tables.Tpo $(DEPDIR)/gen_ia64_tables_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_ia64_tables_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ia64_tables_h_CFLAGS) $(CFLAGS) -c -o gen_ia64_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_ia64_tables_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_ia64_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_ia64_tables_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ia64_tables_h_CFLAGS) $(CFLAGS) -MT gen_ia64_tables_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_ia64_tables_h-gen_tables.Tpo -c -o gen_ia64_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -825,11 +825,11 @@ gen_ia64_tables_h-gen_tables.obj: gen_ta
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ia64_tables_h_CFLAGS) $(CFLAGS) -c -o gen_ia64_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_machinetabs_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_machinetabs_h_CFLAGS) $(CFLAGS) -MT gen_machinetabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_machinetabs_h-gen_tables.Tpo -c -o gen_machinetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_machinetabs_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_machinetabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_machinetabs_h-gen_tables.Tpo -c -o gen_machinetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_machinetabs_h-gen_tables.Tpo $(DEPDIR)/gen_machinetabs_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_machinetabs_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_machinetabs_h_CFLAGS) $(CFLAGS) -c -o gen_machinetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_machinetabs_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_machinetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_machinetabs_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_machinetabs_h_CFLAGS) $(CFLAGS) -MT gen_machinetabs_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_machinetabs_h-gen_tables.Tpo -c -o gen_machinetabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -839,11 +839,11 @@ gen_machinetabs_h-gen_tables.obj: gen_ta
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_machinetabs_h_CFLAGS) $(CFLAGS) -c -o gen_machinetabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_msg_typetabs_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_msg_typetabs_h_CFLAGS) $(CFLAGS) -MT gen_msg_typetabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_msg_typetabs_h-gen_tables.Tpo -c -o gen_msg_typetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_msg_typetabs_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_msg_typetabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_msg_typetabs_h-gen_tables.Tpo -c -o gen_msg_typetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_msg_typetabs_h-gen_tables.Tpo $(DEPDIR)/gen_msg_typetabs_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_msg_typetabs_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_msg_typetabs_h_CFLAGS) $(CFLAGS) -c -o gen_msg_typetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_msg_typetabs_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_msg_typetabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_msg_typetabs_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_msg_typetabs_h_CFLAGS) $(CFLAGS) -MT gen_msg_typetabs_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_msg_typetabs_h-gen_tables.Tpo -c -o gen_msg_typetabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -853,11 +853,11 @@ gen_msg_typetabs_h-gen_tables.obj: gen_t
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_msg_typetabs_h_CFLAGS) $(CFLAGS) -c -o gen_msg_typetabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_optabs_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_optabs_h_CFLAGS) $(CFLAGS) -MT gen_optabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_optabs_h-gen_tables.Tpo -c -o gen_optabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_optabs_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_optabs_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_optabs_h-gen_tables.Tpo -c -o gen_optabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_optabs_h-gen_tables.Tpo $(DEPDIR)/gen_optabs_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_optabs_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_optabs_h_CFLAGS) $(CFLAGS) -c -o gen_optabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_optabs_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_optabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_optabs_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_optabs_h_CFLAGS) $(CFLAGS) -MT gen_optabs_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_optabs_h-gen_tables.Tpo -c -o gen_optabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -867,11 +867,11 @@ gen_optabs_h-gen_tables.obj: gen_tables.
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_optabs_h_CFLAGS) $(CFLAGS) -c -o gen_optabs_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_ppc_tables_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ppc_tables_h_CFLAGS) $(CFLAGS) -MT gen_ppc_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_ppc_tables_h-gen_tables.Tpo -c -o gen_ppc_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_ppc_tables_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_ppc_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_ppc_tables_h-gen_tables.Tpo -c -o gen_ppc_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_ppc_tables_h-gen_tables.Tpo $(DEPDIR)/gen_ppc_tables_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_ppc_tables_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ppc_tables_h_CFLAGS) $(CFLAGS) -c -o gen_ppc_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_ppc_tables_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_ppc_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_ppc_tables_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ppc_tables_h_CFLAGS) $(CFLAGS) -MT gen_ppc_tables_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_ppc_tables_h-gen_tables.Tpo -c -o gen_ppc_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -881,11 +881,11 @@ gen_ppc_tables_h-gen_tables.obj: gen_tab
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_ppc_tables_h_CFLAGS) $(CFLAGS) -c -o gen_ppc_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_s390_tables_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_s390_tables_h_CFLAGS) $(CFLAGS) -MT gen_s390_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_s390_tables_h-gen_tables.Tpo -c -o gen_s390_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_s390_tables_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_s390_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_s390_tables_h-gen_tables.Tpo -c -o gen_s390_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_s390_tables_h-gen_tables.Tpo $(DEPDIR)/gen_s390_tables_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_s390_tables_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_s390_tables_h_CFLAGS) $(CFLAGS) -c -o gen_s390_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_s390_tables_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_s390_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_s390_tables_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_s390_tables_h_CFLAGS) $(CFLAGS) -MT gen_s390_tables_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_s390_tables_h-gen_tables.Tpo -c -o gen_s390_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -895,11 +895,11 @@ gen_s390_tables_h-gen_tables.obj: gen_ta
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_s390_tables_h_CFLAGS) $(CFLAGS) -c -o gen_s390_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_s390x_tables_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_s390x_tables_h_CFLAGS) $(CFLAGS) -MT gen_s390x_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_s390x_tables_h-gen_tables.Tpo -c -o gen_s390x_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_s390x_tables_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_s390x_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_s390x_tables_h-gen_tables.Tpo -c -o gen_s390x_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_s390x_tables_h-gen_tables.Tpo $(DEPDIR)/gen_s390x_tables_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_s390x_tables_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_s390x_tables_h_CFLAGS) $(CFLAGS) -c -o gen_s390x_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_s390x_tables_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_s390x_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_s390x_tables_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_s390x_tables_h_CFLAGS) $(CFLAGS) -MT gen_s390x_tables_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_s390x_tables_h-gen_tables.Tpo -c -o gen_s390x_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+@@ -909,11 +909,11 @@ gen_s390x_tables_h-gen_tables.obj: gen_t
+ @am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_s390x_tables_h_CFLAGS) $(CFLAGS) -c -o gen_s390x_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
+ 
+ gen_x86_64_tables_h-gen_tables.o: gen_tables.c
+-@am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_x86_64_tables_h_CFLAGS) $(CFLAGS) -MT gen_x86_64_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_x86_64_tables_h-gen_tables.Tpo -c -o gen_x86_64_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_TRUE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_x86_64_tables_h_CFLAGS) $(BUILD_CFLAGS) -MT gen_x86_64_tables_h-gen_tables.o -MD -MP -MF $(DEPDIR)/gen_x86_64_tables_h-gen_tables.Tpo -c -o gen_x86_64_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ @am__fastdepCC_TRUE@	$(am__mv) $(DEPDIR)/gen_x86_64_tables_h-gen_tables.Tpo $(DEPDIR)/gen_x86_64_tables_h-gen_tables.Po
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='gen_tables.c' object='gen_x86_64_tables_h-gen_tables.o' libtool=no @AMDEPBACKSLASH@
+ @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
+-@am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_x86_64_tables_h_CFLAGS) $(CFLAGS) -c -o gen_x86_64_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
++@am__fastdepCC_FALSE@	$(BUILD_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(BUILD_CPPFLAGS) $(gen_x86_64_tables_h_CFLAGS) $(BUILD_CFLAGS) -c -o gen_x86_64_tables_h-gen_tables.o `test -f 'gen_tables.c' || echo '$(srcdir)/'`gen_tables.c
+ 
+ gen_x86_64_tables_h-gen_tables.obj: gen_tables.c
+ @am__fastdepCC_TRUE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(gen_x86_64_tables_h_CFLAGS) $(CFLAGS) -MT gen_x86_64_tables_h-gen_tables.obj -MD -MP -MF $(DEPDIR)/gen_x86_64_tables_h-gen_tables.Tpo -c -o gen_x86_64_tables_h-gen_tables.obj `if test -f 'gen_tables.c'; then $(CYGPATH_W) 'gen_tables.c'; else $(CYGPATH_W) '$(srcdir)/gen_tables.c'; fi`
diff --git a/meta/recipes-support/libaudit/libaudit_2.2.2.bb b/meta/recipes-support/libaudit/libaudit_2.2.2.bb
new file mode 100644
index 0000000..e28b619
--- /dev/null
+++ b/meta/recipes-support/libaudit/libaudit_2.2.2.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "libaudit is the dynamic library needed for applications to use the audit framework."
+SECTION = "libs"
+AUTHOR = "Steve Grubb <sgrubb@redhat.com>"
+HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+PR = "r0"
+
+SRC_URI = "http://people.redhat.com/sgrubb/audit/audit-${PV}.tar.gz \
+           file://build-lib-only.patch \
+           file://fix-host-gen.patch \
+          "
+
+SRC_URI[md5sum] = "6641fde111cf5dfda6d4282ab8410df5"
+SRC_URI[sha256sum] = "8bc2b45a5f08f5df6cebcd5543f24b7e68e28b64da4b23f08de2c6616384302b"
+
+S = "${WORKDIR}/audit-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-dependency-tracking --disable-listener"
+
+do_configure() {
+	       oe_runconf
+}
-- 
1.7.11.4



