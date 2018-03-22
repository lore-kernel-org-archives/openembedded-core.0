Return-Path: <maxin.john@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 85C8F65CC6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 08:49:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 01:49:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,343,1517904000"; d="scan'208";a="39611007"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2018 01:49:26 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id E034B580382
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 01:49:25 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 10:53:07 +0200
Message-Id: <1521708787-30071-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [morty][PATCH] grub-efi: fix build failure
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
X-List-Received-Date: Thu, 22 Mar 2018 08:49:25 -0000

grub-efi build fails with the following error on Fedora 26:

| ../grub-2.00/util/raid.c: In function 'grub_util_raid_getmembers':
| ../grub-2.00/util/raid.c:91:13: error: In the GNU C Library, "makedev"
is defined
|  by <sys/sysmacros.h>. For historical compatibility, it is
|  currently defined by <sys/types.h> as well, but we plan to
|  remove this soon. To use "makedev", include <sys/sysmacros.h>
|  directly. If you did not intend to use a system-defined macro
|  "makedev", you should undefine it after including <sys/types.h>.
[-Werror]
|         makedev (disk.major, disk.minor));
|              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Resolve the build error by backporting the fix from upstream.

[YOCTO #12595]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...ix-check-for-sys-sysmacros.h-under-glibc-.patch | 48 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-configure-fix-check-for-sys-sysmacros.h-under-glibc-.patch

diff --git a/meta/recipes-bsp/grub/files/0001-configure-fix-check-for-sys-sysmacros.h-under-glibc-.patch b/meta/recipes-bsp/grub/files/0001-configure-fix-check-for-sys-sysmacros.h-under-glibc-.patch
new file mode 100644
index 0000000..23717e3
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-configure-fix-check-for-sys-sysmacros.h-under-glibc-.patch
@@ -0,0 +1,48 @@
+From 07662af7aed55bcec448bc2a6610de1f0cb62100 Mon Sep 17 00:00:00 2001
+From: Andrei Borzenkov <arvidjaar@gmail.com>
+Date: Thu, 22 Dec 2016 22:48:25 +0300
+Subject: [PATCH] configure: fix check for sys/sysmacros.h under glibc 2.25+
+
+glibc 2.25 still includes sys/sysmacros.h in sys/types.h but also emits
+deprecation warning. So test for sys/types.h succeeds in configure but later
+compilation fails because we use -Werror by default.
+
+While this is fixed in current autoconf GIT, we really cannot force everyone
+to use bleeding edge (that is not even released right now). So run test under
+-Werror as well to force proper detection.
+
+This should have no impact on autoconf 2.70+ as AC_HEADER_MAJOR in this version
+simply checks for header existence.
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/grub.git/commit/?id=07662af7aed55bcec448bc2a6610de1f0cb62100]
+
+Reported and tested by Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Andrei Borzenkov <arvidjaar@gmail.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index dc56564..4e980c5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -389,7 +389,14 @@ fi
+ # Check for functions and headers.
+ AC_CHECK_FUNCS(posix_memalign memalign getextmntent)
+ AC_CHECK_HEADERS(sys/param.h sys/mount.h sys/mnttab.h limits.h)
++
++# glibc 2.25 still includes sys/sysmacros.h in sys/types.h but emits deprecation
++# warning which causes compilation failure later with -Werror. So use -Werror here
++# as well to force proper sys/sysmacros.h detection.
++SAVED_CFLAGS="$CFLAGS"
++CFLAGS="$HOST_CFLAGS -Werror"
+ AC_HEADER_MAJOR
++CFLAGS="$SAVED_CFLAGS"
+ 
+ AC_CHECK_MEMBERS([struct statfs.f_fstypename],,,[$ac_includes_default
+ #include <sys/param.h>
+-- 
+2.4.0
+
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 5a0dc95..013fe42 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -6,6 +6,7 @@ PR = "r3"
 
 SRC_URI += " \
            file://cfg \
+           file://0001-configure-fix-check-for-sys-sysmacros.h-under-glibc-.patch \
           "
 
 S = "${WORKDIR}/grub-${PV}"
-- 
2.4.0


