Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sw8KU-0003Iv-O1
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 11:01:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2012 01:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190969699"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2012 01:49:48 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:49:33 +0300
Message-Id: <acf29e46f65edad2bf26c47356ec4f630fff9b56.1343723990.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343723990.git.laurentiu.palcu@intel.com>
References: <cover.1343723990.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1343723990.git.laurentiu.palcu@intel.com>
References: <cover.1343723990.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/6] eglibc: relocatable SDK changes
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
X-List-Received-Date: Tue, 31 Jul 2012 09:01:27 -0000

Modifying the dynamic loader path in all binaries by the SDK installer
would not be possible because we cannot know in advance the SDK target
location. Hence, the PT_INTERP section size has been set to 4096 (which
is the maximum path lengh in Linux).

Also, for the dynamic loader SYSDIRS and ld.so.cache paths, special
4096 bytes sections were allocated so that we can easily parse the ELF
binary at install time and modify the paths.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../eglibc/eglibc-2.15/relocatable_sdk.patch       |   81 +++++++++++++++
 .../eglibc/eglibc-2.16/relocatable_sdk.patch       |  108 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    6 +-
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    6 +-
 4 files changed, 197 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/relocatable_sdk.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/relocatable_sdk.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.15/relocatable_sdk.patch b/meta/recipes-core/eglibc/eglibc-2.15/relocatable_sdk.patch
new file mode 100644
index 0000000..0ee25d6
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.15/relocatable_sdk.patch
@@ -0,0 +1,81 @@
+Upstream-Status: Inappropriate [SDK specific]
+
+This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
+and lengths as well as ld.so.cache path in the dynamic loader to specific
+sections in memory. The sections that contain paths have been allocated a 4096
+byte section, which is the maximum path length in linux. This will allow the
+relocating script to parse the ELF binary, detect the section and easily replace
+the strings in a certain path.
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: libc/elf/interp.c
+===================================================================
+--- libc.orig/elf/interp.c
++++ libc/elf/interp.c
+@@ -17,5 +17,5 @@
+    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+    02111-1307 USA.  */
+ 
+-const char __invoke_dynamic_linker__[] __attribute__ ((section (".interp")))
++const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
+   = RUNTIME_LINKER;
+Index: libc/elf/dl-load.c
+===================================================================
+--- libc.orig/elf/dl-load.c
++++ libc/elf/dl-load.c
+@@ -145,8 +145,8 @@ static size_t max_capstrlen attribute_re
+ /* Get the generated information about the trusted directories.  */
+ #include "trusted-dirs.h"
+ 
+-static const char system_dirs[] = SYSTEM_DIRS;
+-static const size_t system_dirs_len[] =
++static const char system_dirs[4096] __attribute__ ((section (".sysdirs"))) = SYSTEM_DIRS;
++volatile static const size_t system_dirs_len[] __attribute__ ((section (".sysdirslen"))) =
+ {
+   SYSTEM_DIRS_LEN
+ };
+Index: libc/elf/dl-cache.c
+===================================================================
+--- libc.orig/elf/dl-cache.c
++++ libc/elf/dl-cache.c
+@@ -134,6 +134,10 @@ do									      \
+ while (0)
+ 
+ 
++const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache"))) =
++		SYSCONFDIR "/ld.so.cache";
++
++
+ int
+ internal_function
+ _dl_cache_libcmp (const char *p1, const char *p2)
+Index: libc/elf/ldconfig.c
+===================================================================
+--- libc.orig/elf/ldconfig.c
++++ libc/elf/ldconfig.c
+@@ -167,6 +167,9 @@ static struct argp argp =
+   options, parse_opt, NULL, doc, NULL, more_help, NULL
+ };
+ 
++
++extern const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache")));
++
+ /* Check if string corresponds to an important hardware capability or
+    a platform.  */
+ static int
+Index: libc/sysdeps/generic/dl-cache.h
+===================================================================
+--- libc.orig/sysdeps/generic/dl-cache.h
++++ libc/sysdeps/generic/dl-cache.h
+@@ -28,10 +28,6 @@
+   ((flags) == 1 || (flags) == _DL_CACHE_DEFAULT_ID)
+ #endif
+ 
+-#ifndef LD_SO_CACHE
+-# define LD_SO_CACHE SYSCONFDIR "/ld.so.cache"
+-#endif
+-
+ #ifndef add_system_dir
+ # define add_system_dir(dir) add_dir (dir)
+ #endif
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/relocatable_sdk.patch b/meta/recipes-core/eglibc/eglibc-2.16/relocatable_sdk.patch
new file mode 100644
index 0000000..ca5f17b
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/relocatable_sdk.patch
@@ -0,0 +1,108 @@
+Upstream-Status: Inappropriate [SDK specific]
+
+This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
+and lengths as well as ld.so.cache path in the dynamic loader to specific
+sections in memory. The sections that contain paths have been allocated a 4096
+byte section, which is the maximum path length in linux. This will allow the
+relocating script to parse the ELF binary, detect the section and easily replace
+the strings in a certain path.
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: libc/elf/interp.c
+===================================================================
+--- libc.orig/elf/interp.c
++++ libc/elf/interp.c
+@@ -16,5 +16,5 @@
+    License along with the GNU C Library; if not, see
+    <http://www.gnu.org/licenses/>.  */
+ 
+-const char __invoke_dynamic_linker__[] __attribute__ ((section (".interp")))
++const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
+   = RUNTIME_LINKER;
+Index: libc/elf/dl-load.c
+===================================================================
+--- libc.orig/elf/dl-load.c
++++ libc/elf/dl-load.c
+@@ -144,8 +144,8 @@ static size_t max_capstrlen attribute_re
+ /* Get the generated information about the trusted directories.  */
+ #include "trusted-dirs.h"
+ 
+-static const char system_dirs[] = SYSTEM_DIRS;
+-static const size_t system_dirs_len[] =
++static const char system_dirs[4096] __attribute__ ((section (".sysdirs"))) = SYSTEM_DIRS;
++volatile static const size_t system_dirs_len[] __attribute__ ((section (".sysdirslen"))) =
+ {
+   SYSTEM_DIRS_LEN
+ };
+Index: libc/elf/dl-cache.c
+===================================================================
+--- libc.orig/elf/dl-cache.c
++++ libc/elf/dl-cache.c
+@@ -133,6 +133,10 @@ do									      \
+ while (0)
+ 
+ 
++const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache"))) =
++		SYSCONFDIR "/ld.so.cache";
++
++
+ int
+ internal_function
+ _dl_cache_libcmp (const char *p1, const char *p2)
+Index: libc/elf/ldconfig.c
+===================================================================
+--- libc.orig/elf/ldconfig.c
++++ libc/elf/ldconfig.c
+@@ -166,6 +166,9 @@ static struct argp argp =
+   options, parse_opt, NULL, doc, NULL, more_help, NULL
+ };
+ 
++
++extern const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache")));
++
+ /* Check if string corresponds to an important hardware capability or
+    a platform.  */
+ static int
+Index: libc/sysdeps/generic/dl-cache.h
+===================================================================
+--- libc.orig/sysdeps/generic/dl-cache.h
++++ libc/sysdeps/generic/dl-cache.h
+@@ -27,10 +27,6 @@
+   ((flags) == 1 || (flags) == _DL_CACHE_DEFAULT_ID)
+ #endif
+ 
+-#ifndef LD_SO_CACHE
+-# define LD_SO_CACHE SYSCONFDIR "/ld.so.cache"
+-#endif
+-
+ #ifndef add_system_dir
+ # define add_system_dir(dir) add_dir (dir)
+ #endif
+Index: libc/elf/rtld.c
+===================================================================
+--- libc.orig/elf/rtld.c
++++ libc/elf/rtld.c
+@@ -99,6 +99,7 @@ uintptr_t __pointer_chk_guard_local
+ strong_alias (__pointer_chk_guard_local, __pointer_chk_guard)
+ #endif
+ 
++extern const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache")));
+ 
+ /* List of auditing DSOs.  */
+ static struct audit_list
+@@ -1031,12 +1032,12 @@ of this helper program; chances are you
+   --list                list all dependencies and how they are resolved\n\
+   --verify              verify that given object really is a dynamically linked\n\
+ 			object we can handle\n\
+-  --inhibit-cache       Do not use " LD_SO_CACHE "\n\
++  --inhibit-cache       Do not use %s\n\
+   --library-path PATH   use given PATH instead of content of the environment\n\
+ 			variable LD_LIBRARY_PATH\n\
+   --inhibit-rpath LIST  ignore RUNPATH and RPATH information in object names\n\
+ 			in LIST\n\
+-  --audit LIST          use objects named in LIST as auditors\n");
++  --audit LIST          use objects named in LIST as auditors\n", LD_SO_CACHE);
+ 
+       ++_dl_skip_args;
+       --_dl_argc;
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index d9cb048..69db5c9 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "19294"
 
 DEPENDS += "gperf-native"
-PR = "r12"
+PR = "r13"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
@@ -33,7 +33,9 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
 
-SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch"
+SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch \
+            file://relocatable_sdk.patch \
+            "
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index f9a8f6d..b053a5b 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "19383"
 
 DEPENDS += "gperf-native"
-PR = "r4"
+PR = "r5"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
@@ -31,7 +31,9 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
 
-SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch"
+SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch \
+            file://relocatable_sdk.patch \
+            "
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
1.7.9.5



