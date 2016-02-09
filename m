Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C53056FFD8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:45:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 09 Feb 2016 09:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,421,1449561600"; d="scan'208";a="899484638"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2016 09:45:48 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 8E9986A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 10:33:38 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 19:48:49 +0200
Message-Id: <1455040131-22507-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] mdadm: update to version 3.4
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
X-List-Received-Date: Tue, 09 Feb 2016 17:45:47 -0000

3.3.4 -> 3.4

a) Removed the following upstreamed patches:
        1. mdadm-fix-ptest-build-errors.patch
        2. 0001-Define-_POSIX_C_SOURCE-if-undefined.patch

b) Added following patches to fix uclibc,musl and x32 build failures
        1. 0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
        2. 0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
        3. 0001-Fix-some-type-comparison-problems.patch
        4. 0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-Define-_POSIX_C_SOURCE-if-undefined.patch | 59 ----------------------
 .../0001-Fix-some-type-comparison-problems.patch   | 50 ++++++++++++++++++
 ...th-of-corosync-and-dlm-header-files-check.patch | 33 ++++++++++++
 ...dadm.h-bswap-is-already-defined-in-uclibc.patch | 55 ++++++++++++++++++++
 ...il.c-include-poll.h-instead-of-sys-poll.h.patch | 45 +++++++++++++++++
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |  2 +-
 .../mdadm/files/mdadm-fix-ptest-build-errors.patch | 50 ------------------
 .../mdadm/{mdadm_3.3.4.bb => mdadm_3.4.bb}         | 18 ++++---
 8 files changed, 194 insertions(+), 118 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Define-_POSIX_C_SOURCE-if-undefined.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.3.4.bb => mdadm_3.4.bb} (74%)

diff --git a/meta/recipes-extended/mdadm/files/0001-Define-_POSIX_C_SOURCE-if-undefined.patch b/meta/recipes-extended/mdadm/files/0001-Define-_POSIX_C_SOURCE-if-undefined.patch
deleted file mode 100644
index a461b76..0000000
--- a/meta/recipes-extended/mdadm/files/0001-Define-_POSIX_C_SOURCE-if-undefined.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From d74b02d4653d1ea26029c2528eb93d7268b83eb3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Jan 2016 07:28:33 +0000
-Subject: [PATCH] Define _POSIX_C_SOURCE if undefined
-
-typecast second argument of connect() API to use struct sockaddr*
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- config.c | 3 +++
- mdmon.c  | 2 +-
- msg.c    | 2 +-
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/config.c b/config.c
-index a882ed3..a675688 100644
---- a/config.c
-+++ b/config.c
-@@ -63,6 +63,9 @@
-  * but may not wrap over lines
-  *
-  */
-+#ifndef _POSIX_C_SOURCE
-+#define _POSIX_C_SOURCE 200809L
-+#endif
- 
- #ifndef CONFFILE
- #define CONFFILE "/etc/mdadm.conf"
-diff --git a/mdmon.c b/mdmon.c
-index ee12b7c..e4b73d9 100644
---- a/mdmon.c
-+++ b/mdmon.c
-@@ -235,7 +235,7 @@ static int make_control_sock(char *devname)
- 	addr.sun_family = PF_LOCAL;
- 	strcpy(addr.sun_path, path);
- 	umask(077); /* ensure no world write access */
--	if (bind(sfd, &addr, sizeof(addr)) < 0) {
-+	if (bind(sfd, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
- 		close(sfd);
- 		return -1;
- 	}
-diff --git a/msg.c b/msg.c
-index 754630b..45cd450 100644
---- a/msg.c
-+++ b/msg.c
-@@ -170,7 +170,7 @@ int connect_monitor(char *devname)
- 
- 	addr.sun_family = PF_LOCAL;
- 	strcpy(addr.sun_path, path);
--	if (connect(sfd, &addr, sizeof(addr)) < 0) {
-+	if (connect(sfd, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
- 		close(sfd);
- 		return -1;
- 	}
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch b/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
new file mode 100644
index 0000000..ee482b5
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
@@ -0,0 +1,50 @@
+From 835baf02fd42012bbc0603dffb1f80c6ecf0fb9e Mon Sep 17 00:00:00 2001
+From: Xiao Ni <xni@redhat.com>
+Date: Mon, 8 Feb 2016 11:18:52 +0200
+Subject: [PATCH] Fix some type comparison problems
+
+As 26714713cd2bad9e0bf7f4669f6cc4659ceaab6c said, 32 bit signed
+timestamps will overflow in the year 2038. It already changed the
+utime and ctime in struct mdu_array_info_s from int to unsigned
+int. So we need to change the values that compared with them to
+unsigned int too.
+
+Upstream-Status: Backport
+
+Signed-off-by : Xiao Ni <xni@redhat.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+
+ Monitor.c | 2 +-
+ util.c    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Monitor.c b/Monitor.c
+index f19c2e5..6df80f9 100644
+--- a/Monitor.c
++++ b/Monitor.c
+@@ -33,7 +33,7 @@
+ struct state {
+ 	char *devname;
+ 	char devnm[32];	/* to sync with mdstat info */
+-	long utime;
++	unsigned int utime;
+ 	int err;
+ 	char *spare_group;
+ 	int active, working, failed, spare, raid;
+diff --git a/util.c b/util.c
+index 3e6d293..96a806d 100644
+--- a/util.c
++++ b/util.c
+@@ -1267,7 +1267,7 @@ struct supertype *guess_super_type(int fd, enum guess_types guess_type)
+ 	 */
+ 	struct superswitch  *ss;
+ 	struct supertype *st;
+-	time_t besttime = 0;
++	unsigned int besttime = 0;
+ 	int bestsuper = -1;
+ 	int i;
+ 
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
new file mode 100644
index 0000000..deb7486
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
@@ -0,0 +1,33 @@
+From 1f5baf3ad95ae4c39efe4d8ad8b2e642b3a351da Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Tue, 9 Feb 2016 11:44:01 +0200
+Subject: [PATCH] Fix the path of corosync and dlm header files check
+
+Original Makefile will check headers on host instead of sysroot.
+Fix it.
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fd79cfb..34150a9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -80,8 +80,8 @@ MDMON_DIR = $(RUN_DIR)
+ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
+ SYSTEMD_DIR=/lib/systemd/system
+ 
+-COROSYNC:=$(shell [ -d /usr/include/corosync ] || echo -DNO_COROSYNC)
+-DLM:=$(shell [ -f /usr/include/libdlm.h ] || echo -DNO_DLM)
++COROSYNC:=$(shell [ -d $(SYSROOT)/usr/include/corosync ] || echo -DNO_COROSYNC)
++DLM:=$(shell [ -f $(SYSROOT)/usr/include/libdlm.h ] || echo -DNO_DLM)
+ 
+ DIRFLAGS = -DMAP_DIR=\"$(MAP_DIR)\" -DMAP_FILE=\"$(MAP_FILE)\"
+ DIRFLAGS += -DMDMON_DIR=\"$(MDMON_DIR)\"
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch b/meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
new file mode 100644
index 0000000..1395473
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
@@ -0,0 +1,55 @@
+From cf14a9987ea1040457ce53bc2ab7d096818cb780 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Fri, 5 Feb 2016 18:06:32 +0200
+Subject: [PATCH] mdadm.h: bswap is already defined in uclibc
+
+Fixes this build error:
+
+| In file included from mdadm.c:28:0:
+| mdadm.h:142:0: error: "bswap_16" redefined [-Werror]
+|  #define bswap_16(x) (((x) & 0x00ffU) << 8 | \
+|  ^
+
+Upstream-Status: Submitted
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ mdadm.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/mdadm.h b/mdadm.h
+index dd02be7..230e60f 100755
+--- a/mdadm.h
++++ b/mdadm.h
+@@ -139,12 +139,20 @@ struct dlm_lksb {
+  * and there is no standard conversion function so... */
+ /* And dietlibc doesn't think byteswap is ok, so.. */
+ /*  #include <byteswap.h> */
++
++#ifndef bswap_16
+ #define bswap_16(x) (((x) & 0x00ffU) << 8 | \
+ 		     ((x) & 0xff00U) >> 8)
++#endif
++
++#ifndef bswap_32
+ #define bswap_32(x) (((x) & 0x000000ffU) << 24 | \
+ 		     ((x) & 0xff000000U) >> 24 | \
+ 		     ((x) & 0x0000ff00U) << 8  | \
+ 		     ((x) & 0x00ff0000U) >> 8)
++#endif
++
++#ifndef bswap_64
+ #define bswap_64(x) (((x) & 0x00000000000000ffULL) << 56 | \
+ 		     ((x) & 0xff00000000000000ULL) >> 56 | \
+ 		     ((x) & 0x000000000000ff00ULL) << 40 | \
+@@ -153,6 +161,7 @@ struct dlm_lksb {
+ 		     ((x) & 0x0000ff0000000000ULL) >> 24 | \
+ 		     ((x) & 0x00000000ff000000ULL) << 8 | \
+ 		     ((x) & 0x000000ff00000000ULL) >> 8)
++#endif
+ 
+ #if !defined(__KLIBC__)
+ #if BYTE_ORDER == LITTLE_ENDIAN
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch b/meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 0000000..d5cf003
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,45 @@
+From 2645673a7ea948a1297d5b8f0daab29b898f044f Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Fri, 5 Feb 2016 17:14:04 +0200
+Subject: [PATCH] util.c: include poll.h instead of sys/poll.h
+
+This fixes a compile warning when building with musl:
+
+ In file included from util.c:27:0:
+ |
+ qemux86-64/usr/include/sys/poll.h:1:2:
+ error: #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+ [-Werror=cpp]
+ |  #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+ |   ^
+
+Upstream-Status: Accepted
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util.c b/util.c
+index 970d484..3e6d293 100644
+--- a/util.c
++++ b/util.c
+@@ -24,7 +24,6 @@
+ 
+ #include	"mdadm.h"
+ #include	"md_p.h"
+-#include	<sys/poll.h>
+ #include	<sys/socket.h>
+ #include	<sys/utsname.h>
+ #include	<sys/wait.h>
+@@ -32,6 +31,7 @@
+ #include	<sys/resource.h>
+ #include	<sys/vfs.h>
+ #include	<linux/magic.h>
++#include	<poll.h>
+ #include	<ctype.h>
+ #include	<dirent.h>
+ #include	<signal.h>
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
index 3b3db0a..40acc14 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
@@ -1,4 +1,4 @@
-Upstream-Status: pending
+Upstream-Status: Accepted
 
 By hardcoding CC's definition in the Makefile, all the gcc parameters 
 set by tune settings are lost. Causing compile failure with x32 toolchain
diff --git a/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
deleted file mode 100644
index f7c5514..0000000
--- a/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From f3acf8499a4cc400206c5c56f0a6c69192ed55de Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Sat, 7 Nov 2015 04:21:17 -0500
-Subject: [PATCH] mdadm: fix ptest build errors
-
-Check return value for posix_memalign() to fix ptest build error:
-
-  raid6check.c:352:2: error: ignoring return value of posix_memalign, \
-  declared with attribute warn_unused_result [-Werror=unused-result]
-
-Initialize *stripe_buf as NULL to fix ptest build error:
-
-  raid6check.c: In function 'check_stripes':
-  raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized \
-  in this function [-Werror=maybe-uninitialized]
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- raid6check.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/raid6check.c b/raid6check.c
-index cb8522e..9462bcf 100644
---- a/raid6check.c
-+++ b/raid6check.c
-@@ -312,7 +312,7 @@ int check_stripes(struct mdinfo *info, int *source, unsigned long long *offsets,
- 	/* read the data and p and q blocks, and check we got them right */
- 	int data_disks = raid_disks - 2;
- 	int syndrome_disks = data_disks + is_ddf(layout) * 2;
--	char *stripe_buf;
-+	char *stripe_buf = NULL;
- 
- 	/* stripes[] is indexed by raid_disk and holds chunks from each device */
- 	char **stripes = xmalloc(raid_disks * sizeof(char*));
-@@ -349,7 +349,9 @@ int check_stripes(struct mdinfo *info, int *source, unsigned long long *offsets,
- 	if (!tables_ready)
- 		make_tables();
- 
--	posix_memalign((void**)&stripe_buf, 4096, raid_disks * chunk_size);
-+	if (posix_memalign((void**)&stripe_buf, 4096, raid_disks * chunk_size) != 0)
-+		goto exitCheck;
-+
- 	block_index_for_slot += 2;
- 	blocks += 2;
- 	blocks_page += 2;
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.4.bb
similarity index 74%
rename from meta/recipes-extended/mdadm/mdadm_3.3.4.bb
rename to meta/recipes-extended/mdadm/mdadm_3.4.bb
index e004030..5fa827a 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.4.bb
@@ -13,12 +13,14 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://gcc-4.9.patch \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
            file://0001-Fix-typo-in-comparision.patch \
-           file://mdadm-fix-ptest-build-errors.patch \
-           file://0001-Define-_POSIX_C_SOURCE-if-undefined.patch \
+           file://0001-util.c-include-poll.h-instead-of-sys-poll.h.patch \
+           file://0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch \
+           file://0001-Fix-some-type-comparison-problems.patch \
+           file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://run-ptest \
 	  "
-SRC_URI[md5sum] = "7ca8b114710f98f53f20c5787b674a09"
-SRC_URI[sha256sum] = "8ae5f45306b873190e91f410709b00e51997b633c072b33f8efd9f7df022ca68"
+SRC_URI[md5sum] = "04b8b21f637540350f8517c7e68d3c63"
+SRC_URI[sha256sum] = "27d0be4627d38a12ddcd1c1c3721d649d4e89e1093914497e22b57245cda8808"
 
 CFLAGS += "-fno-strict-aliasing"
 inherit autotools-brokensep
@@ -28,12 +30,12 @@ EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
 # prevents 64-bit userland from seeing this definition, instead defaulting
 # to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
 # int-ll64.h included
-EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
-EXTRA_OEMAKE_append_mips64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
-EXTRA_OEMAKE_append_mips64n32 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
+CFLAGS_append_powerpc64 = ' -D__SANE_USERSPACE_TYPES__'
+CFLAGS_append_mips64 = ' -D__SANE_USERSPACE_TYPES__'
+CFLAGS_append_mips64n32 = ' -D__SANE_USERSPACE_TYPES__'
 
 do_compile() {
-	oe_runmake
+	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
 }
 
 do_install() {
-- 
2.4.0


