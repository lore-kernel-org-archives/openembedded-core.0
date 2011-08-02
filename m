Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qo5Z1-0001mA-DC
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 05:22:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2011 20:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,304,1309762800"; d="scan'208";a="36903600"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2011 20:18:17 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 11:20:17 +0800
Message-Id: <2ded904a3352ce17d7486b1c1fd6b21e79a89bed.1312254789.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <405488d8e6aba944a745f7cf807e20b8ac87872d.1312254789.git.lianhao.lu@intel.com>
References: <405488d8e6aba944a745f7cf807e20b8ac87872d.1312254789.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1312254789.git.lianhao.lu@intel.com>
References: <cover.1312254789.git.lianhao.lu@intel.com>
Subject: [PATCH 3/3] eglibc: Setting KNOWN_INTERPRETER_NAMES for ldconfig.
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
X-List-Received-Date: Tue, 02 Aug 2011 03:22:39 -0000

[YOCTO #1236] Part of the bug fixing. Set the correct ld.so names for
ldconfig to deal with the multilib configuration.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../eglibc/eglibc-2.13/multilib_readlib.patch      |   20 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    8 +++++++-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch b/meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
new file mode 100644
index 0000000..3ebcc6b
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Replace the OECORE_KNOWN_INTERPRETER_NAMES with the value of 
+variable EGLIBC_KNOWN_INTERPRETER_NAMES.
+
+Lianhao Lu, 08/01/2011
+
+--- libc/elf/readlib.c.orgin	2011-08-01 15:24:59.054350012 +0800
++++ libc/elf/readlib.c	2011-08-01 18:10:59.777675546 +0800
+@@ -49,9 +49,7 @@
+ static struct known_names interpreters[] =
+ {
+   { "/lib/" LD_SO, FLAG_ELF_LIBC6 },
+-#ifdef SYSDEP_KNOWN_INTERPRETER_NAMES
+-  SYSDEP_KNOWN_INTERPRETER_NAMES
+-#endif
++  OECORE_KNOWN_INTERPRETER_NAMES
+ };
+ 
+ static struct known_names known_libs[] =
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index b1bfbf1..60f6a74 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r10"
+PR = "r11"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -16,6 +16,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://etc/ld.so.conf \
            file://generate-supported.mk \
            file://glibc_bug_fix_12454.patch \
+           file://multilib_readlib.patch \
 	   "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
@@ -81,6 +82,7 @@ do_move_ports() {
 
 do_patch_append() {
 	bb.build.exec_func('do_fix_ia_headers', d)
+	bb.build.exec_func('do_fix_readlib_c', d)
 }
 
 # We need to ensure that all of the i386 and x86_64 headers are identical
@@ -170,6 +172,10 @@ do_fix_ia_headers() {
 	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/user.h ${S}/sysdeps/unix/sysv/linux/i386/sys/user.h
 }
 
+do_fix_readlib_c () {
+	sed -i -e 's#OECORE_KNOWN_INTERPRETER_NAMES#${EGLIBC_KNOWN_INTERPRETER_NAMES}#' ${S}/elf/readlib.c
+}
+
 do_configure () {
 # override this function to avoid the autoconf/automake/aclocal/autoheader
 # calls for now
-- 
1.7.0.4



