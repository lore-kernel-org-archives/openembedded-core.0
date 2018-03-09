Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE3378948
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651955"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:13 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:53 +0200
Message-Id: <20180309185614.31113-15-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 15/36] qemu: drop already applied glibc-2.25.patch
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Due to patch fuzz it was applied again in a different place.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu/glibc-2.25.patch | 74 ------------------------
 meta/recipes-devtools/qemu/qemu_2.11.1.bb        |  1 -
 2 files changed, 75 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/glibc-2.25.patch

diff --git a/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
deleted file mode 100644
index 25569449e42..00000000000
--- a/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From: Christopher Covington
-Date: Wed, 28 Dec 2016 15:04:33 -0500
-Subject: [Qemu-devel] [PATCH v3] build: include sys/sysmacros.h for major() and minor()a
-
-The definition of the major() and minor() macros are moving within glibc to
-<sys/sysmacros.h>. Include this header when it is available to avoid the
-following sorts of build-stopping messages:
-
-qga/commands-posix.c: In function ‘dev_major_minor’:
-qga/commands-posix.c:656:13: error: In the GNU C Library, "major" is defined
- by <sys/sysmacros.h>. For historical compatibility, it is
- currently defined by <sys/types.h> as well, but we plan to
- remove this soon. To use "major", include <sys/sysmacros.h>
- directly. If you did not intend to use a system-defined macro
- "major", you should undefine it after including <sys/types.h>. [-Werror]
-         *devmajor = major(st.st_rdev);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~
-
-qga/commands-posix.c:657:13: error: In the GNU C Library, "minor" is defined
- by <sys/sysmacros.h>. For historical compatibility, it is
- currently defined by <sys/types.h> as well, but we plan to
- remove this soon. To use "minor", include <sys/sysmacros.h>
- directly. If you did not intend to use a system-defined macro
- "minor", you should undefine it after including <sys/types.h>. [-Werror]
-         *devminor = minor(st.st_rdev);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~
-
-The additional include allows the build to complete on Fedora 26 (Rawhide)
-with glibc version 2.24.90.
-
-Signed-off-by: Christopher Covington <address@hidden>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Submitted https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg03548.html
-
-diff -uNr qemu-2.8.0.orig/configure qemu-2.8.0/configure
---- qemu-2.8.0.orig/configure  2017-02-21 19:05:13.180094708 +0100
-+++ qemu-2.8.0/configure       2017-02-21 19:08:53.114087084 +0100
-@@ -4727,6 +4727,20 @@
- then
- fi
- 
- ##########################################
-+# check for sysmacros.h
-+
-+have_sysmacros=no
-+cat > $TMPC << EOF
-+#include <sys/sysmacros.h>
-+int main(void) {
-+    return makedev(0, 0);
-+}
-+EOF
-+if compile_prog "" "" ; then
-+    have_sysmacros=yes
-+fi
-+
-+##########################################
- # End of CC checks
- # After here, no more $cc or $ld runs
- 
-diff -uNr qemu-2.8.0.orig/configure qemu-2.8.0/configure
---- qemu-2.8.0.orig/configure  2017-02-21 19:05:13.180094708 +0100
-+++ qemu-2.8.0/configure       2017-02-21 19:08:53.114087084 +0100
-@@ -5695,6 +5709,10 @@
-   echo "CONFIG_AF_VSOCK=y" >> $config_host_mak
- fi
- 
-+if test "$have_sysmacros" = "yes" ; then
-+  echo "CONFIG_SYSMACROS=y" >> $config_host_mak
-+fi
-+
- # Hold two types of flag:
- #   CONFIG_THREAD_SETNAME_BYTHREAD  - we've got a way of setting the name on
- #                                     a thread we have a handle to
diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
index f0e20cc1253..90eeee95c5f 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://no-valgrind.patch \
            file://pathlimit.patch \
            file://qemu-2.5.0-cflags.patch \
-           file://glibc-2.25.patch \
            file://chardev-connect-socket-to-a-spawned-command.patch \
            file://apic-fixup-fallthrough-to-PIC.patch \
            file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
-- 
2.16.1


