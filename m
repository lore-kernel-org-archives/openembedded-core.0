Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TGAWa-0005pp-NX
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 17:24:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2012 08:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,476,1344236400"; d="scan'208";a="148436300"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.39])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2012 08:11:54 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 18:12:28 +0300
Message-Id: <1348499548-10451-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] eglibc: Fix for dynamic linker broken offset
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
X-List-Received-Date: Mon, 24 Sep 2012 15:24:45 -0000

Solution provided by Donn Seeley in bug 1443:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=1443

worked when testing with core-image-sato-sdk for qemuarm.

[YOCTO #2577]

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch      |   56 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch b/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
new file mode 100644
index 0000000..d81e3c2
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Pending
+
+Quote from bug 1443 which explains what the patch does : 
+
+  We build some random program and link it with -lust.  When we run it,
+  it dies with a SIGSEGV before reaching main().
+  
+  Libust.so depends on liburcu-bp.so from the usermode-rcu package.
+  Although libust.so is not prelinked, liburcu-bp.so IS prelinked; this
+  is critical.
+  
+  Libust.so uses a TLS / __thread variable that is defined in liburcu-
+  bp.so.  There are special ARM-specific relocation types that allow two
+  shared libraries to share thread-specific data.  This is critical too.
+  
+  One more critical issue: although liburcu-bp.so is prelinked, we can't
+  load it at its prelinked address, because we also link against
+  librt.so, and librt.so uses that address.
+  
+  The dynamic linker is forced to relink liburcu-bp.so at a different
+  address.  In the course of relinking, it processes the special ARM
+  relocation record mentioned above.  The prelinker has already filled
+  in the information, which is a short offset into a table of thread-
+  specific data that is allocated per-thread for each library that uses
+  TLS.  Because the normal behavior of a relocation is to add the symbol
+  value to an addend stored at the address being relocated, we end up
+  adding the short offset to itself, doubling it.
+  
+  Now we have an awkward situation.  The libust.so library doesn't know
+  about the addend, so its TLS data for this element is correct.  The
+  liburcu-bp.so library has a different offset for the element.  When we
+  go to initialize the element for the first time in liburcu-bp.so, we
+  write the address of the result at the doubled (broken) offset.
+  Later, when we refer to the address from libust.so, we check the value
+  at the correct offset, but it's NULL, so we eat hot SIGSEGV.
+
+Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+---
+ .../libc/ports/sysdeps/arm/dl-machine.h            |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+ndex 8d905e8..dcfa71e 100644
+--- libc.orig/ports/sysdeps/arm/dl-machine.h
++++ libc/ports/sysdeps/arm/dl-machine.h
+@@ -503,7 +503,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
+ 
+ 	case R_ARM_TLS_DTPOFF32:
+ 	  if (sym != NULL)
+-	    *reloc_addr += sym->st_value;
++	    *reloc_addr = sym->st_value;
+ 	  break;
+ 
+ 	case R_ARM_TLS_TPOFF32:
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 78dc44a..b1f03c7 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r9"
+PR = "r10"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
@@ -29,6 +29,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://0001-eglibc-menuconfig-support.patch \
            file://0002-eglibc-menuconfig-hex-string-options.patch \
            file://0003-eglibc-menuconfig-build-instructions.patch \
+           file://0001-R_ARM_TLS_DTPOFF32.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.9.5



