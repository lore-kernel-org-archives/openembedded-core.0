Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE4875CC1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 05:43:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t635h1bU027359
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jul 2015 22:43:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Jul 2015 22:43:00 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 13:42:31 +0800
Message-ID: <1435902151-4217-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mklibs-native: two fixes
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
X-List-Received-Date: Fri, 03 Jul 2015 05:43:05 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

1. Show GNU unique symbols as provided symbols
2. Remove dependency on dpkg
Both have been submitted to mklibs maillist:
https://lists.debian.org/debian-boot/2015/07/msg00018.html
https://lists.debian.org/debian-boot/2015/07/msg00004.html

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../mklibs/files/fix_cross_compile.patch           | 81 ++++++++++++++++++++++
 ...ow-GNU-unique-symbols-as-provided-symbols.patch | 34 +++++++++
 .../mklibs/mklibs-native_0.1.40.bb                 |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
 create mode 100644 meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch

diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
new file mode 100644
index 0000000..7eb8659
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
@@ -0,0 +1,81 @@
+Remove dependency on dpkg
+
+Upstream-Status Submitted
+
+Asking the host OS whether it supports multiarch is not useful
+in a cross-compilation environment, or if the user has specified
+a libdir explicitly. So this patch, based on the work of Mentor
+Graphics, removes mklibs's dependency on dpkg package.
+
+Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
+ src/mklibs | 30 +++++++++++++++++++-----------
+ 1 file changed, 19 insertions(+), 11 deletions(-)
+
+diff --git a/src/mklibs b/src/mklibs
+index d9b784b..c5614ea 100755
+--- a/src/mklibs
++++ b/src/mklibs
+@@ -261,6 +261,11 @@ def extract_soname(so_file):
+     return ""
+ 
+ def multiarch(paths):
++    # Asking the host OS whether it supports multiarch is not useful
++    # in a cross-compilation environment, or if the user has specified
++    # a libdir explicitly.
++    if sysroot != "" or libdir != "":
++        return paths
+     devnull = open('/dev/null', 'w')
+     dpkg_architecture = subprocess.Popen(
+         ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
+@@ -340,7 +345,7 @@ lib_path = []
+ dest_path = "DEST"
+ ldlib = "LDLIB"
+ include_default_lib_path = "yes"
+-default_lib_path = multiarch(["/lib/", "/usr/lib/", "/usr/X11R6/lib/"])
++default_lib_path = ["/lib/", "/usr/lib/", "/usr/X11R6/lib/"]
+ libc_extras_dir = "/usr/lib/libc_pic"
+ libc_extras_dir_default = True
+ libdir = "lib"
+@@ -386,7 +391,7 @@ for opt, arg in optlist:
+     elif opt == "--libdir":
+         libdir = arg
+     elif opt in ("--help", "-h"):
+-	usage(0)
++        usage(0)
+         sys.exit(0)
+     elif opt in ("--version", "-V"):
+         version(vers)
+@@ -395,6 +400,7 @@ for opt, arg in optlist:
+         print "WARNING: unknown option: " + opt + "\targ: " + arg
+ 
+ if include_default_lib_path == "yes":
++    default_lib_path = multiarch(default_lib_path)
+     lib_path.extend([a.replace("/lib/", "/" + libdir + "/") for a in default_lib_path])
+ 
+ if libc_extras_dir_default:
+@@ -661,16 +669,16 @@ ld_path_name = os.path.dirname(ldlib)
+ ld_full_path = "../" + ldlib
+ ld_file = find_lib(ld_file_name)
+ 
+-if ld_path_name != "/lib":
+-    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
+-        os.remove(dest_path + "/" + ld_file_name)
++#if ld_path_name != "/lib":
++#    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
++#        os.remove(dest_path + "/" + ld_file_name)
+ 
+-if not os.path.exists(dest_path + "/../" + ld_path_name):
+-    os.mkdir(dest_path + "/../" + ld_path_name)
++#if not os.path.exists(dest_path + "/../" + ld_path_name):
++#    os.mkdir(dest_path + "/../" + ld_path_name)
+ 
+-if not os.access(dest_path + "/" + ld_full_path, os.F_OK):
+-    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " + ld_full_path)
++if not os.access(dest_path + "/" + ld_file_name, os.F_OK):
++    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " + ld_file_name)
+     command(target + "objcopy", "--strip-unneeded -R .note -R .comment",
+-            ld_file, dest_path + "/" + ld_full_path)
++            ld_file, dest_path + "/" + ld_file_name)
+ 
+-os.chmod(dest_path + "/" + ld_full_path, 0755)
++os.chmod(dest_path + "/" + ld_file_name, 0755)
diff --git a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
new file mode 100644
index 0000000..3f14ca1
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
@@ -0,0 +1,34 @@
+From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 2001
+From: Yuanjie Huang <yuanjie.huang@windriver.com>
+Date: Wed, 15 Apr 2015 14:00:06 +0800
+Subject: [PATCH] Show GNU unique symbols as provided symbols
+
+Upstream-Status Submitted
+
+GNU Unique symbol is a GNU extension employed by new version of GCC
+by default. Even Standard C++ library in GCC 4.9 provides some symbols,
+such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type instead
+of ELF standard weak binding.
+This patch adds support of this new binding type to mklibs-readelf.
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ src/mklibs-readelf/main.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
+index 56d93f8..0134530 100644
+--- a/src/mklibs-readelf/main.cpp
++++ b/src/mklibs-readelf/main.cpp
+@@ -88,7 +88,7 @@ static void process_symbols_provided (const Elf::section_type<Elf::section_type_
+     uint8_t type = symbol->get_type ();
+     const std::string &name = symbol->get_name_string ();
+ 
+-    if (bind != STB_GLOBAL && bind != STB_WEAK)
++    if (bind != STB_GLOBAL && bind != STB_WEAK && bind != STB_GNU_UNIQUE)
+       continue;
+     if (shndx == SHN_UNDEF || shndx == SHN_ABS)
+       continue;
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
index 0bb5f21..d6905ac 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.x
 	file://fix_STT_GNU_IFUNC.patch\
 	file://sysrooted-ldso.patch \
 	file://avoid-failure-on-symbol-provided-by-application.patch \
+	file://show-GNU-unique-symbols-as-provided-symbols.patch \
+	file://fix_cross_compile.patch \
 "
 
 SRC_URI[md5sum] = "e1dafe5f962caa9dc5f2651c0723812a"
-- 
1.9.1


