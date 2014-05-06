Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EAAA665F94
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 13:52:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s46DqKlE011358 for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 14:52:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aukOB6asco3o
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 14:52:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s46DqHi8011355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 14:52:18 +0100
Message-ID: <1399384331.12731.154.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 06 May 2014 14:52:11 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Handle uclibc linker relocation for multilib support
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
X-List-Received-Date: Tue, 06 May 2014 13:52:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need to handle the UCLIBC_* linker variables in the same way
as we do the GLIBC_* ones to allow uclibc multilib to work properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 0e8fffc..5755da8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -29,11 +29,11 @@ Upstream-Status: Inappropriate [OE configuration]
  gcc/config/sparc/linux64.h   |    4 ++--
  11 files changed, 22 insertions(+), 22 deletions(-)
 
-diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
-index 84e0596..3a59d71 100644
---- a/gcc/config/alpha/linux-elf.h
-+++ b/gcc/config/alpha/linux-elf.h
-@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-4.8.2/gcc/config/alpha/linux-elf.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/alpha/linux-elf.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/alpha/linux-elf.h	2014-05-06 10:34:51.073657377 +0000
+@@ -23,8 +23,8 @@
  #define EXTRA_SPECS \
  { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
  
@@ -44,10 +44,10 @@ index 84e0596..3a59d71 100644
  #if DEFAULT_LIBC == LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 4a425c8..80f454d 100644
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
+Index: gcc-4.8.2/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/arm/linux-eabi.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/arm/linux-eabi.h	2014-05-06 10:34:51.077657377 +0000
 @@ -68,8 +68,8 @@
     GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
  
@@ -59,10 +59,10 @@ index 4a425c8..80f454d 100644
  #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
  
  #define GLIBC_DYNAMIC_LINKER \
-diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index 753dc3a..d593967 100644
---- a/gcc/config/arm/linux-elf.h
-+++ b/gcc/config/arm/linux-elf.h
+Index: gcc-4.8.2/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/arm/linux-elf.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/arm/linux-elf.h	2014-05-06 10:34:51.077657377 +0000
 @@ -57,7 +57,7 @@
  
  #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
@@ -72,21 +72,21 @@ index 753dc3a..d593967 100644
  
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
-diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
-index 3c95ee0..33b8acd 100644
---- a/gcc/config/i386/linux.h
-+++ b/gcc/config/i386/linux.h
-@@ -20,4 +20,4 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-4.8.2/gcc/config/i386/linux.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/i386/linux.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/i386/linux.h	2014-05-06 10:34:51.077657377 +0000
+@@ -20,4 +20,4 @@
  <http://www.gnu.org/licenses/>.  */
  
  #define GNU_USER_LINK_EMULATION "elf_i386"
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
 +#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
-diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
-index b793e08..da788b8 100644
---- a/gcc/config/i386/linux64.h
-+++ b/gcc/config/i386/linux64.h
-@@ -27,6 +27,6 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+Index: gcc-4.8.2/gcc/config/i386/linux64.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/i386/linux64.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/i386/linux64.h	2014-05-06 10:34:51.077657377 +0000
+@@ -27,6 +27,6 @@
  #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
  #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
  
@@ -96,21 +96,21 @@ index b793e08..da788b8 100644
 +#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
 +#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
 +#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
-diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index 9b4c68d..7ee5ba8 100644
---- a/gcc/config/mips/linux.h
-+++ b/gcc/config/mips/linux.h
-@@ -17,4 +17,4 @@ You should have received a copy of the GNU General Public License
+Index: gcc-4.8.2/gcc/config/mips/linux.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/mips/linux.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/mips/linux.h	2014-05-06 10:34:51.077657377 +0000
+@@ -17,4 +17,4 @@
  along with GCC; see the file COPYING3.  If not see
  <http://www.gnu.org/licenses/>.  */
  
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
 +#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
-diff --git a/gcc/config/mips/linux64.h b/gcc/config/mips/linux64.h
-index dbba47a..c7ed573 100644
---- a/gcc/config/mips/linux64.h
-+++ b/gcc/config/mips/linux64.h
-@@ -22,10 +22,10 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-4.8.2/gcc/config/mips/linux64.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/mips/linux64.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/mips/linux64.h	2014-05-06 10:34:51.077657377 +0000
+@@ -22,10 +22,10 @@
  #define GNU_USER_LINK_EMULATION64 "elf64%{EB:b}%{EL:l}tsmip"
  #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
  
@@ -125,11 +125,11 @@ index dbba47a..c7ed573 100644
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
    CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
-diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index dc6f67f..bc60769 100644
---- a/gcc/config/rs6000/linux64.h
-+++ b/gcc/config/rs6000/linux64.h
-@@ -360,10 +360,10 @@ extern int dot_symbols;
+Index: gcc-4.8.2/gcc/config/rs6000/linux64.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/rs6000/linux64.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/rs6000/linux64.h	2014-05-06 10:34:51.077657377 +0000
+@@ -350,10 +350,10 @@
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
  
@@ -144,11 +144,11 @@ index dc6f67f..bc60769 100644
  #if DEFAULT_LIBC == LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
-diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index 9e8f32d..86bf81e 100644
---- a/gcc/config/sh/linux.h
-+++ b/gcc/config/sh/linux.h
-@@ -43,7 +43,7 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-4.8.2/gcc/config/sh/linux.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/sh/linux.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/sh/linux.h	2014-05-06 10:34:51.077657377 +0000
+@@ -43,7 +43,7 @@
  
  #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
  
@@ -157,11 +157,11 @@ index 9e8f32d..86bf81e 100644
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
-diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 49283d3..6f0b03a 100644
---- a/gcc/config/sparc/linux.h
-+++ b/gcc/config/sparc/linux.h
-@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
+Index: gcc-4.8.2/gcc/config/sparc/linux.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/sparc/linux.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/sparc/linux.h	2014-05-06 10:34:51.077657377 +0000
+@@ -83,7 +83,7 @@
     When the -shared link option is used a final link is not being
     done.  */
  
@@ -170,11 +170,11 @@ index 49283d3..6f0b03a 100644
  
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
-diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index 7d48e96..b01993f 100644
---- a/gcc/config/sparc/linux64.h
-+++ b/gcc/config/sparc/linux64.h
-@@ -92,8 +92,8 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-4.8.2/gcc/config/sparc/linux64.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/sparc/linux64.h	2014-05-06 10:34:51.081657377 +0000
++++ gcc-4.8.2/gcc/config/sparc/linux64.h	2014-05-06 10:34:51.077657377 +0000
+@@ -92,8 +92,8 @@
     When the -shared link option is used a final link is not being
     done.  */
  
@@ -185,6 +185,22 @@ index 7d48e96..b01993f 100644
  
  #ifdef SPARC_BI_ARCH
  
--- 
-1.7.10.4
-
+Index: gcc-4.8.2/gcc/config/linux.h
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/linux.h	2013-01-10 20:38:27.000000000 +0000
++++ gcc-4.8.2/gcc/config/linux.h	2014-05-06 10:36:26.549656893 +0000
+@@ -73,10 +73,10 @@
+    GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
+    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
+    supporting both 32-bit and 64-bit compilation.  */
+-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
+ #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
+ #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
+ #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 1eafeb4..81d664a 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -26,7 +26,8 @@ python gcc_multilib_setup() {
 
     bb.utils.remove(build_conf_dir, True)
     ml_globs = ('%s/*/t-linux64' % src_conf_dir,
-                '%s/*/linux64.h' % src_conf_dir)
+                '%s/*/linux64.h' % src_conf_dir,
+                '%s/linux.h' % src_conf_dir)
 
     # copy the target multilib config files to ${B}
     for ml_glob in ml_globs:
@@ -93,6 +94,14 @@ python gcc_multilib_setup() {
                         r'\1' + wrap_libdir(libdirx32) + r'\3'),
                     (r'^(#define\s*GLIBC_DYNAMIC_LINKERN32\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdirn32) + r'\3'),
+                    (r'^(#define\s*UCLIBC_DYNAMIC_LINKER32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir32) + r'\3'),
+                    (r'^(#define\s*UCLIBC_DYNAMIC_LINKER64\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir64) + r'\3'),
+                    (r'^(#define\s*UCLIBC_DYNAMIC_LINKERN32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdirn32) + r'\3'),
+                    (r'^(#define\s*UCLIBC_DYNAMIC_LINKER\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir32) + r'\3'),
                 ]
 
                 for (i, line) in enumerate(filelines):



