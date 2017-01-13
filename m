Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 82B4271D5D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 12:57:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jan 2017 04:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1112084124"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 04:57:04 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 8655C6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 04:56:09 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 14:57:09 +0200
Message-Id: <1484312231-28167-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1484312231-28167-1-git-send-email-maxin.john@intel.com>
References: <1484312231-28167-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] mdadm: upgrade to version 4.0
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
X-List-Received-Date: Fri, 13 Jan 2017 12:57:06 -0000

3.4 -> 4.0

Removed the following upstreamed or backported patches:

 a) 0001-Fix-some-type-comparison-problems.patch
 b) 0001-Fix-typo-in-comparision.patch
 c) 0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
 d) 0001-raid6check-Fix-if-else-indentation.patch
 e) 0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
 f) mdadm-3.2.2_fix_for_x32.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-Fix-some-type-comparison-problems.patch   | 50 -------------
 .../mdadm/files/0001-Fix-typo-in-comparision.patch | 86 ----------------------
 ...dadm.h-bswap-is-already-defined-in-uclibc.patch | 55 --------------
 .../0001-raid6check-Fix-if-else-indentation.patch  | 37 ----------
 ...il.c-include-poll.h-instead-of-sys-poll.h.patch | 45 -----------
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      | 23 ------
 .../mdadm/{mdadm_3.4.bb => mdadm_4.0.bb}           | 10 +--
 7 files changed, 2 insertions(+), 304 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.4.bb => mdadm_4.0.bb} (81%)

diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch b/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
deleted file mode 100644
index f829467..0000000
--- a/meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 835baf02fd42012bbc0603dffb1f80c6ecf0fb9e Mon Sep 17 00:00:00 2001
-From: Xiao Ni <xni@redhat.com>
-Date: Mon, 8 Feb 2016 11:18:52 +0200
-Subject: [PATCH] Fix some type comparison problems
-
-As 26714713cd2bad9e0bf7f4669f6cc4659ceaab6c said, 32 bit signed
-timestamps will overflow in the year 2038. It already changed the
-utime and ctime in struct mdu_array_info_s from int to unsigned
-int. So we need to change the values that compared with them to
-unsigned int too.
-
-Upstream-Status: Backport
-
-Signed-off-by: : Xiao Ni <xni@redhat.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-
- Monitor.c | 2 +-
- util.c    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Monitor.c b/Monitor.c
-index f19c2e5..6df80f9 100644
---- a/Monitor.c
-+++ b/Monitor.c
-@@ -33,7 +33,7 @@
- struct state {
- 	char *devname;
- 	char devnm[32];	/* to sync with mdstat info */
--	long utime;
-+	unsigned int utime;
- 	int err;
- 	char *spare_group;
- 	int active, working, failed, spare, raid;
-diff --git a/util.c b/util.c
-index 3e6d293..96a806d 100644
---- a/util.c
-+++ b/util.c
-@@ -1267,7 +1267,7 @@ struct supertype *guess_super_type(int fd, enum guess_types guess_type)
- 	 */
- 	struct superswitch  *ss;
- 	struct supertype *st;
--	time_t besttime = 0;
-+	unsigned int besttime = 0;
- 	int bestsuper = -1;
- 	int i;
- 
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch b/meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch
deleted file mode 100644
index df70b1c..0000000
--- a/meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 18d360d74271a066a849bc1fba4f10dbb23ed251 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Sep 2015 08:17:42 +0000
-Subject: [PATCH] Fix typo in comparision
-
-error: comparison of array 'devnm' equal to a null pointer is always false
-
-User bitwise '&' operator as it is a mask
-
-Fixes
-error: use of logical '&&' with constant operand
-
-Remove extraneous parens
-
-error: equality comparison with extraneous parentheses
-
-Remove dead code
-
-restripe.c:465:21: error: explicitly assigning value of variable of type 'int' to itself
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- mdmon.h       | 2 +-
- mdopen.c      | 2 +-
- restripe.c    | 3 ---
- super-intel.c | 2 +-
- 4 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/mdmon.h b/mdmon.h
-index aa750c6..0b08c3d 100644
---- a/mdmon.h
-+++ b/mdmon.h
-@@ -101,7 +101,7 @@ static inline int is_resync_complete(struct mdinfo *array)
- 		break;
- 	case 10:
- 		l = array->array.layout;
--		ncopies = (l & 0xff) * ((l >> 8) && 0xff);
-+		ncopies = (l & 0xff) * ((l >> 8) & 0xff);
- 		sync_size = array->component_size * array->array.raid_disks;
- 		sync_size /= ncopies;
- 		break;
-diff --git a/mdopen.c b/mdopen.c
-index 28410f4..c5ee2a6 100644
---- a/mdopen.c
-+++ b/mdopen.c
-@@ -318,7 +318,7 @@ int create_mddev(char *dev, char *name, int autof, int trustworthy,
- 	else if (num < 0) {
- 		/* need to choose a free number. */
- 		char *_devnm = find_free_devnm(use_mdp);
--		if (devnm == NULL) {
-+		if (_devnm == NULL) {
- 			pr_err("No avail md devices - aborting\n");
- 			return -1;
- 		}
-diff --git a/restripe.c b/restripe.c
-index 4d92190..cfe9666 100644
---- a/restripe.c
-+++ b/restripe.c
-@@ -461,9 +461,6 @@ int raid6_check_disks(int data_disks, int start, int chunk_size,
- 			curr_broken_disk = diskD;
- 		}
- 
--		if((Px == 0) && (Qx == 0))
--			curr_broken_disk = curr_broken_disk;
--
- 		if(curr_broken_disk >= data_disks + 2)
- 			broken_status = 2;
- 
-diff --git a/super-intel.c b/super-intel.c
-index 3f812d6..1838012 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -10027,7 +10027,7 @@ enum imsm_reshape_type imsm_analyze_change(struct supertype *st,
- 				geo->size = max_size;
- 		}
- 
--		if ((direction == ROLLBACK_METADATA_CHANGES)) {
-+		if (direction == ROLLBACK_METADATA_CHANGES) {
- 			/* accept size for rollback only
- 			*/
- 		} else {
--- 
-2.5.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch b/meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
deleted file mode 100644
index 1395473..0000000
--- a/meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From cf14a9987ea1040457ce53bc2ab7d096818cb780 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Fri, 5 Feb 2016 18:06:32 +0200
-Subject: [PATCH] mdadm.h: bswap is already defined in uclibc
-
-Fixes this build error:
-
-| In file included from mdadm.c:28:0:
-| mdadm.h:142:0: error: "bswap_16" redefined [-Werror]
-|  #define bswap_16(x) (((x) & 0x00ffU) << 8 | \
-|  ^
-
-Upstream-Status: Submitted
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- mdadm.h | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/mdadm.h b/mdadm.h
-index dd02be7..230e60f 100755
---- a/mdadm.h
-+++ b/mdadm.h
-@@ -139,12 +139,20 @@ struct dlm_lksb {
-  * and there is no standard conversion function so... */
- /* And dietlibc doesn't think byteswap is ok, so.. */
- /*  #include <byteswap.h> */
-+
-+#ifndef bswap_16
- #define bswap_16(x) (((x) & 0x00ffU) << 8 | \
- 		     ((x) & 0xff00U) >> 8)
-+#endif
-+
-+#ifndef bswap_32
- #define bswap_32(x) (((x) & 0x000000ffU) << 24 | \
- 		     ((x) & 0xff000000U) >> 24 | \
- 		     ((x) & 0x0000ff00U) << 8  | \
- 		     ((x) & 0x00ff0000U) >> 8)
-+#endif
-+
-+#ifndef bswap_64
- #define bswap_64(x) (((x) & 0x00000000000000ffULL) << 56 | \
- 		     ((x) & 0xff00000000000000ULL) >> 56 | \
- 		     ((x) & 0x000000000000ff00ULL) << 40 | \
-@@ -153,6 +161,7 @@ struct dlm_lksb {
- 		     ((x) & 0x0000ff0000000000ULL) >> 24 | \
- 		     ((x) & 0x00000000ff000000ULL) << 8 | \
- 		     ((x) & 0x000000ff00000000ULL) >> 8)
-+#endif
- 
- #if !defined(__KLIBC__)
- #if BYTE_ORDER == LITTLE_ENDIAN
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch b/meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch
deleted file mode 100644
index 0b34b84..0000000
--- a/meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1b0aa1debf6fbe9923c9aac671d2894f76c32f9d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Apr 2016 16:38:13 +0000
-Subject: [PATCH] raid6check: Fix if-else indentation
-
-gcc 6 warns about ambiguity due to this indentation
-| raid6check.c: In function 'manual_repair':
-| raid6check.c:267:4: error: this 'else' clause does not guard... [-Werror=misleading-indentation]
-|     else
-|     ^~~~
-| raid6check.c:269:5: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'else'
-|      printf("Repairing D(%d) and P\n", failed_data);
-|      ^~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- raid6check.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/raid6check.c b/raid6check.c
-index ad7ffe7..409b1b6 100644
---- a/raid6check.c
-+++ b/raid6check.c
-@@ -266,7 +266,7 @@ int manual_repair(int chunk_size, int syndrome_disks,
- 				failed_data = failed_slot2;
- 			else
- 				failed_data = failed_slot1;
--				printf("Repairing D(%d) and P\n", failed_data);
-+			printf("Repairing D(%d) and P\n", failed_data);
- 			raid6_datap_recov(syndrome_disks+2, chunk_size,
- 					  failed_data, (uint8_t**)blocks, 1);
- 		} else {
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch b/meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
deleted file mode 100644
index d5cf003..0000000
--- a/meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2645673a7ea948a1297d5b8f0daab29b898f044f Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Fri, 5 Feb 2016 17:14:04 +0200
-Subject: [PATCH] util.c: include poll.h instead of sys/poll.h
-
-This fixes a compile warning when building with musl:
-
- In file included from util.c:27:0:
- |
- qemux86-64/usr/include/sys/poll.h:1:2:
- error: #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
- [-Werror=cpp]
- |  #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
- |   ^
-
-Upstream-Status: Accepted
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util.c b/util.c
-index 970d484..3e6d293 100644
---- a/util.c
-+++ b/util.c
-@@ -24,7 +24,6 @@
- 
- #include	"mdadm.h"
- #include	"md_p.h"
--#include	<sys/poll.h>
- #include	<sys/socket.h>
- #include	<sys/utsname.h>
- #include	<sys/wait.h>
-@@ -32,6 +31,7 @@
- #include	<sys/resource.h>
- #include	<sys/vfs.h>
- #include	<linux/magic.h>
-+#include	<poll.h>
- #include	<ctype.h>
- #include	<dirent.h>
- #include	<signal.h>
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
deleted file mode 100644
index 84c382d..0000000
--- a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Accepted
-
-By hardcoding CC's definition in the Makefile, all the gcc parameters 
-set by tune settings are lost. Causing compile failure with x32 toolchain
-
-As the bitbake defined CC is good, there is no need to redfine CC in the 
-make file, hence making the CC definition in the Makefile conditional.
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/07
-
-Index: mdadm-3.3/Makefile
-===================================================================
---- mdadm-3.3.orig/Makefile	2013-09-03 07:47:47.000000000 +0300
-+++ mdadm-3.3/Makefile	2013-10-16 16:44:23.542295487 +0300
-@@ -41,7 +41,7 @@
- 
- KLIBC_GCC = gcc -nostdinc -iwithprefix include -I$(KLIBC)/klibc/include -I$(KLIBC)/linux/include -I$(KLIBC)/klibc/arch/i386/include -I$(KLIBC)/klibc/include/bits32
- 
--CC = $(CROSS_COMPILE)gcc
-+CC ?= $(CROSS_COMPILE)gcc
- CXFLAGS ?= -ggdb
- CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter
- ifdef WARN_UNUSED
diff --git a/meta/recipes-extended/mdadm/mdadm_3.4.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
similarity index 81%
rename from meta/recipes-extended/mdadm/mdadm_3.4.bb
rename to meta/recipes-extended/mdadm/mdadm_4.0.bb
index 7bf15b5..c228899 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -9,22 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
-           file://mdadm-3.2.2_fix_for_x32.patch \
            file://gcc-4.9.patch \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
-           file://0001-Fix-typo-in-comparision.patch \
            file://mdadm-fix-ptest-build-errors.patch \
-           file://0001-util.c-include-poll.h-instead-of-sys-poll.h.patch \
-           file://0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch \
-           file://0001-Fix-some-type-comparison-problems.patch \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://run-ptest \
-           file://0001-raid6check-Fix-if-else-indentation.patch \
            file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
            file://0001-include-sys-sysmacros.h-for-major-minor-defintions.patch \
            "
-SRC_URI[md5sum] = "04b8b21f637540350f8517c7e68d3c63"
-SRC_URI[sha256sum] = "27d0be4627d38a12ddcd1c1c3721d649d4e89e1093914497e22b57245cda8808"
+SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
+SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"
 
 CFLAGS += "-fno-strict-aliasing"
 inherit autotools-brokensep
-- 
2.4.0


