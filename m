Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1U0ZBS-0000tp-QP
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 16:02:58 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2013 06:47:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,569,1355126400"; d="scan'208";a="284193700"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2013 06:46:59 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 16:47:56 +0200
Message-Id: <1359557276-1123-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] e2fsprogs : upgrade to 1.42.6
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
X-List-Received-Date: Wed, 30 Jan 2013 15:02:58 -0000

 - removed the usage of the patches already contained in the new version
 - adapted patch remove.ldconfig.call.patch so that it applies on new version

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../acinclude.m4                                   |    0
 .../fallocate.patch                                |    0
 .../mkdir.patch                                    |    0
 .../remove.ldconfig.call.patch                     |   35 +++++++++++++-------
 .../{e2fsprogs_1.42.1.bb => e2fsprogs_1.42.6.bb}   |    9 +++--
 5 files changed, 27 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 => e2fsprogs-1.42.6}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 => e2fsprogs-1.42.6}/fallocate.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 => e2fsprogs-1.42.6}/mkdir.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 => e2fsprogs-1.42.6}/remove.ldconfig.call.patch (33%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.1.bb => e2fsprogs_1.42.6.bb} (90%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/acinclude.m4 b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/acinclude.m4
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/acinclude.m4
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/acinclude.m4
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/fallocate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/fallocate.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/fallocate.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/fallocate.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/mkdir.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/mkdir.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/mkdir.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/remove.ldconfig.call.patch
similarity index 33%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/remove.ldconfig.call.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/remove.ldconfig.call.patch
index 7be4c3e..f3e6eb7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/remove.ldconfig.call.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/remove.ldconfig.call.patch
@@ -1,7 +1,10 @@
-When /etc/ld.so.cache is writeable by user running bitbake then it
-creates invalid cache (in my case libstdc++.so cannot be found after
-building zlib(-native) and I have to call touch */libstdc++.so &&
-/sbin/ldconfig to fix it.
+From b139e03ac2f72e644e547c7ee9b1514383af4d97 Mon Sep 17 00:00:00 2001
+From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+Date: Wed, 30 Jan 2013 15:22:04 +0200
+Subject: [PATCH] When /etc/ld.so.cache is writeable by user running bitbake
+ then it creates invalid cache (in my case libstdc++.so
+ cannot be found after building zlib(-native) and I have to
+ call touch */libstdc++.so && /sbin/ldconfig to fix it.
 
 So remove ldconfig call from make install-libs
 
@@ -10,20 +13,25 @@ Patch authored by Martin Jansa.
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+---
+ lib/Makefile.elf-lib |    3 ---
+ 1 file changed, 3 deletions(-)
 
-diff -uNr e2fsprogs-1.42.orig/lib/Makefile.elf-lib e2fsprogs-1.42/lib/Makefile.elf-lib
---- e2fsprogs-1.42.orig/lib/Makefile.elf-lib	2010-06-14 05:07:36.000000000 +0200
-+++ e2fsprogs-1.42/lib/Makefile.elf-lib	2012-02-23 14:26:07.021272275 +0100
-@@ -52,8 +52,6 @@
- 		$(LN_S) -f $(ELF_INSTALL_DIR)/$(ELF_SONAME) \
- 			$(DESTDIR)$(libdir)/$(ELF_IMAGE).so; \
- 	fi			
+diff --git a/lib/Makefile.elf-lib b/lib/Makefile.elf-lib
+index 78479d3..4a4a5ac 100644
+--- a/lib/Makefile.elf-lib
++++ b/lib/Makefile.elf-lib
+@@ -50,8 +50,6 @@ install-shlibs install:: $(ELF_LIB) installdirs-elf-lib $(DEP_INSTALL_SYMLINK)
+ 	$(E) "	SYMLINK $(libdir)/$(ELF_IMAGE).so"
+ 	$(Q) $(INSTALL_SYMLINK) $(ELF_INSTALL_DIR)/$(ELF_SONAME) \
+ 		$(libdir)/$(ELF_IMAGE).so $(DESTDIR)
 -	$(E) "	LDCONFIG"
 -	$(Q) -$(LDCONFIG)
  
  install-strip: install
  	$(E) "	STRIP-LIB $(ELF_INSTALL_DIR)/$(ELF_LIB)"
-@@ -69,7 +67,6 @@
+@@ -67,7 +65,6 @@ uninstall-shlibs uninstall::
  	$(RM) -f $(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_LIB) \
  		$(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_SONAME) \
  		$(DESTDIR)$(libdir)/$(ELF_IMAGE).so
@@ -31,3 +39,6 @@ diff -uNr e2fsprogs-1.42.orig/lib/Makefile.elf-lib e2fsprogs-1.42/lib/Makefile.e
  
  clean::
  	$(RM) -rf elfshared
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb
similarity index 90%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb
index b0eee3b..e6d90a1 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb
@@ -1,14 +1,13 @@
 require e2fsprogs.inc
 
-PR = "r4"
+PR = "r0"
 
-SRC_URI += "file://fallocate.patch \
-            file://acinclude.m4 \
+SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
 "
 
-SRC_URI[md5sum] = "8ed1501ae6746e2e735bdd1407211dc9"
-SRC_URI[sha256sum] = "0f1fdc10c6289b6750714490837df9aab691f352d33f5ecb64507704df6ff991"
+SRC_URI[md5sum] = "9e444c240c1001b3292d108fbad0f49c"
+SRC_URI[sha256sum] = "726b5919edeaee5b077d7a5b602284f1453ea31cf499efa433af26c679b667a5"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
-- 
1.7.9.5



