Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA8B76BD15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:50:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAM7o0Gf017451
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2018 23:50:10 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 21 Nov 2018 23:49:49 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2018 23:49:49 -0800
Message-ID: <20181122074949.71132-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] mdadm: Upgrade to 4.1
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
X-List-Received-Date: Thu, 22 Nov 2018 07:50:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mingli Yu <Mingli.Yu@windriver.com>

* Remove 5 backported patches
* Refresh patches to remove fuzz warnings

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../files/0001-Disable-gcc8-warnings.patch    | 74 +++++++++---------
 ...-corosync-and-dlm-header-files-check.patch | 21 +-----
 ...for-implicit-fallthrough-warning-sup.patch | 11 +--
 ...smacros.h-for-major-minor-defintions.patch | 10 +--
 ...-Wimplicit-fallthrough-0-in-Makefile.patch | 37 ---------
 ...h-Undefine-dprintf-before-redefining.patch | 12 +--
 ...tead-of-memcpy-on-overlapping-region.patch | 31 --------
 ...y-enough-length-when-write-to-buffer.patch | 75 -------------------
 ...-with-strncpy-at-some-places-to-avoi.patch | 59 ---------------
 ...-type-conversion-to-avoid-truncation.patch | 33 --------
 ...omment-to-indicate-valid-fallthrough.patch | 36 ++++-----
 .../mdadm/files/gcc-4.9.patch                 | 19 +++--
 .../files/mdadm-3.3.2_x32_abi_time_t.patch    | 22 ++++--
 .../files/mdadm-fix-ptest-build-errors.patch  | 10 +--
 .../mdadm/{mdadm_4.0.bb => mdadm_4.1.bb}      |  9 +--
 15 files changed, 105 insertions(+), 354 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch
 rename meta/recipes-extended/mdadm/{mdadm_4.0.bb => mdadm_4.1.bb} (83%)

diff --git a/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch b/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
index 739652cd55..361d53ca6c 100644
--- a/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
@@ -1,4 +1,4 @@
-From b83218de2623c0bbe9af355a81ae8385d7f30cfc Mon Sep 17 00:00:00 2001
+From a6c991750ae6ebd87a0b9b243bec7fd8e5a064c5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 May 2018 12:56:41 -0700
 Subject: [PATCH] Disable gcc8 warnings
@@ -23,28 +23,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  mdopen.c      | 4 ++++
  super-ddf.c   | 4 ++++
  super-intel.c | 6 ++++++
- super1.c      | 5 +++++
  super0.c      | 2 +-
- 6 files changed, 22 insertions(+), 1 deletion(-)
+ super1.c      | 5 +++++
+ 6 files changed, 23 insertions(+), 2 deletions(-)
 
-diff --git a/super0.c b/super0.c
-index f5b4507..264b598 100644
---- a/super0.c
-+++ b/super0.c
-@@ -231,7 +231,7 @@
- 	     d++) {
- 		mdp_disk_t *dp;
- 		char *dv;
--		char nb[11];
-+		char nb[12];
- 		int wonly, failfast;
- 		if (d>=0) dp = &sb->disks[d];
- 		else dp = &sb->this_disk;
 diff --git a/Monitor.c b/Monitor.c
-index 802a9d9..23b246b 100644
+index 036103f..08cbd0a 100644
 --- a/Monitor.c
 +++ b/Monitor.c
-@@ -441,7 +441,8 @@ static void alert(char *event, char *dev, char *disc, struct alert_info *info)
+@@ -445,7 +445,8 @@ static void alert(char *event, char *dev, char *disc, struct alert_info *info)
  			       event, dev);
  	}
  }
@@ -54,16 +41,16 @@ index 802a9d9..23b246b 100644
  static int check_array(struct state *st, struct mdstat_ent *mdstat,
  		       int test, struct alert_info *ainfo,
  		       int increments, char *prefer)
-@@ -683,6 +684,7 @@ static int check_array(struct state *st, struct mdstat_ent *mdstat,
- 		return 1;
- 	return 0;
+@@ -673,6 +674,7 @@ static int check_array(struct state *st, struct mdstat_ent *mdstat,
+ 	st->err++;
+ 	goto out;
  }
 +#pragma GCC diagnostic pop
  
  static int add_new_arrays(struct mdstat_ent *mdstat, struct state **statelist,
  			  int test, struct alert_info *info)
 diff --git a/mdopen.c b/mdopen.c
-index 685ca32..406aba4 100644
+index 98c54e4..4f72b69 100644
 --- a/mdopen.c
 +++ b/mdopen.c
 @@ -26,6 +26,9 @@
@@ -76,19 +63,19 @@ index 685ca32..406aba4 100644
  void make_parts(char *dev, int cnt)
  {
  	/* make 'cnt' partition devices for 'dev'
-@@ -99,6 +102,7 @@ void make_parts(char *dev, int cnt)
+@@ -101,6 +104,7 @@ void make_parts(char *dev, int cnt)
  	}
  	free(name);
  }
 +#pragma GCC diagnostic pop
  
- /*
-  * We need a new md device to assemble/build/create an array.
+ int create_named_array(char *devnm)
+ {
 diff --git a/super-ddf.c b/super-ddf.c
-index 1707ad1..e08d289 100644
+index 618542c..6ed4e7e 100644
 --- a/super-ddf.c
 +++ b/super-ddf.c
-@@ -2846,6 +2846,9 @@ static void _set_config_size(struct phys_disk_entry *pde, const struct dl *dl)
+@@ -2828,6 +2828,9 @@ static void _set_config_size(struct phys_disk_entry *pde, const struct dl *dl)
  		(unsigned long long)cfs, (unsigned long long)(dl->size-cfs));
  }
  
@@ -98,7 +85,7 @@ index 1707ad1..e08d289 100644
  /* Add a device to a container, either while creating it or while
   * expanding a pre-existing container
   */
-@@ -2981,6 +2984,7 @@ static int add_to_super_ddf(struct supertype *st,
+@@ -2964,6 +2967,7 @@ static int add_to_super_ddf(struct supertype *st,
  
  	return 0;
  }
@@ -107,10 +94,10 @@ index 1707ad1..e08d289 100644
  static int remove_from_super_ddf(struct supertype *st, mdu_disk_info_t *dk)
  {
 diff --git a/super-intel.c b/super-intel.c
-index 00a2925..44fbead 100644
+index 1bc4b80..39d0e92 100644
 --- a/super-intel.c
 +++ b/super-intel.c
-@@ -298,6 +298,11 @@ struct md_list {
+@@ -333,6 +333,11 @@ struct md_list {
  };
  
  #define pr_vrb(fmt, arg...) (void) (verbose && pr_err(fmt, ##arg))
@@ -122,16 +109,29 @@ index 00a2925..44fbead 100644
  
  static __u8 migr_type(struct imsm_dev *dev)
  {
-@@ -11618,3 +11623,4 @@ struct superswitch super_imsm = {
+@@ -12208,3 +12213,4 @@ struct superswitch super_imsm = {
+ 	.clear_bad_block  = imsm_clear_badblock,
  	.get_bad_blocks   = imsm_get_badblocks,
- #endif /* MDASSEMBLE */
  };
 +#pragma GCC diagnostic pop
+diff --git a/super0.c b/super0.c
+index 42989b9..f5e8031 100644
+--- a/super0.c
++++ b/super0.c
+@@ -229,7 +229,7 @@ static void examine_super0(struct supertype *st, char *homehost)
+ 	     d++) {
+ 		mdp_disk_t *dp;
+ 		char *dv;
+-		char nb[11];
++		char nb[12];
+ 		int wonly, failfast;
+ 		if (d>=0) dp = &sb->disks[d];
+ 		else dp = &sb->this_disk;
 diff --git a/super1.c b/super1.c
-index 87a74cb..71c515f 100644
+index 636a286..f894cbb 100644
 --- a/super1.c
 +++ b/super1.c
-@@ -1091,6 +1091,10 @@ static struct mdinfo *container_content1(struct supertype *st, char *subarray)
+@@ -1176,6 +1176,10 @@ static struct mdinfo *container_content1(struct supertype *st, char *subarray)
  	return info;
  }
  
@@ -140,9 +140,9 @@ index 87a74cb..71c515f 100644
 +# pragma GCC diagnostic ignored "-Wstringop-truncation"
 +#endif
  static int update_super1(struct supertype *st, struct mdinfo *info,
- 			 char *update,
- 			 char *devname, int verbose,
-@@ -1473,6 +1477,7 @@ static int init_super1(struct supertype *st, mdu_array_info_t *info,
+ 			 char *update, char *devname, int verbose,
+ 			 int uuid_set, char *homehost)
+@@ -1641,6 +1645,7 @@ static int init_super1(struct supertype *st, mdu_array_info_t *info,
  
  	return 1;
  }
diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
index a89161404d..298f276cd6 100644
--- a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
@@ -1,4 +1,4 @@
-From 1f5baf3ad95ae4c39efe4d8ad8b2e642b3a351da Mon Sep 17 00:00:00 2001
+From a9166bf422da1001bac9cc819386bf39b7cd1b73 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Tue, 9 Feb 2016 11:44:01 +0200
 Subject: [PATCH] Fix the path of corosync and dlm header files check
@@ -9,28 +9,18 @@ Fix it.
 Upstream-Status: Inappropriate [Yocto specific]
 
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-mdadm only works with corosync 2.x which provides header file corosync/cmap.h.
-If build mdadm with corosync 1.x, it fails with:
-
-| member.c:12:27: fatal error: corosync/cmap.h: No such file or directory
-|  #include <corosync/cmap.h>
-|                            ^
 
-Build with corosync only header file corosync/cmap.h exists.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index fd79cfb..34150a9 100644
+index 2767ac6..46bf57b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -80,8 +80,8 @@ MDMON_DIR = $(RUN_DIR)
- FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
+@@ -91,8 +91,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
  SYSTEMD_DIR=/lib/systemd/system
+ LIB_DIR=/usr/libexec/mdadm
  
 -COROSYNC:=$(shell [ -d /usr/include/corosync ] || echo -DNO_COROSYNC)
 -DLM:=$(shell [ -f /usr/include/libdlm.h ] || echo -DNO_DLM)
@@ -39,6 +29,3 @@ index fd79cfb..34150a9 100644
  
  DIRFLAGS = -DMAP_DIR=\"$(MAP_DIR)\" -DMAP_FILE=\"$(MAP_FILE)\"
  DIRFLAGS += -DMDMON_DIR=\"$(MDMON_DIR)\"
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch b/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
index a4b7b8acd3..72368cb17b 100644
--- a/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
@@ -1,4 +1,4 @@
-From a129ee6d80f3b2cda0d827c35fa81a517cf6d505 Mon Sep 17 00:00:00 2001
+From 37c35f94d9d95dbd2b5f8a919f5478be51453590 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Oct 2017 10:27:34 -0700
 Subject: [PATCH] Use CC to check for implicit-fallthrough warning support
@@ -8,16 +8,16 @@ its possible that build host gcc is version 7+ but the
 cross compile used for compiling mdadm is < version 7
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
-Upstream-Status: Pending
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index d207ee4..971f255 100644
+index 46bf57b..a075912 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -48,7 +48,7 @@ ifdef WARN_UNUSED
+@@ -53,7 +53,7 @@ ifdef WARN_UNUSED
  CWFLAGS += -Wp,-D_FORTIFY_SOURCE=2 -O3
  endif
  
@@ -26,6 +26,3 @@ index d207ee4..971f255 100644
  ifneq "$(FALLTHROUGH)"  "0"
  CWFLAGS += -Wimplicit-fallthrough=0
  endif
--- 
-2.14.2
-
diff --git a/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch b/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
index acd64ada22..bdedbb2d98 100644
--- a/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
+++ b/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
@@ -1,4 +1,4 @@
-From 943616e5dffb79f307e4bd9b249d316212998750 Mon Sep 17 00:00:00 2001
+From 714f2262960a7fe9e8f973629ed214023e144590 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 18 Dec 2016 08:30:51 +0000
 Subject: [PATCH] include <sys/sysmacros.h> for major/minor defintions
@@ -25,14 +25,13 @@ Fixes
 |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
+---
  mdadm.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/mdadm.h b/mdadm.h
-index 8c8f4d1..3ce13b5 100755
+index bb943bf..79c44c6 100644
 --- a/mdadm.h
 +++ b/mdadm.h
 @@ -34,6 +34,7 @@ extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
@@ -43,6 +42,3 @@ index 8c8f4d1..3ce13b5 100755
  #include	<sys/stat.h>
  #include	<stdint.h>
  #include	<stdlib.h>
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch
deleted file mode 100644
index ce15170c75..0000000000
--- a/meta/recipes-extended/mdadm/files/0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From aa09af0fe2ec0737fa04ffd00957532684e257b9 Mon Sep 17 00:00:00 2001
-From: Xiao Ni <xni@redhat.com>
-Date: Fri, 17 Mar 2017 19:55:42 +0800
-Subject: [PATCH 1/5] mdadm: Add Wimplicit-fallthrough=0 in Makefile
-
-There are many errors like 'error: this statement may fall through'.
-But the logic is right. So add the flag Wimplicit-fallthrough=0
-to disable the error messages. The method I use is from
-https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
-#index-Wimplicit-fallthrough-375
-
-Signed-off-by: Xiao Ni <xni@redhat.com>
-Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
----
-Upstream-Status: Backport
- Makefile | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 0f307ec..e1a7058 100644
---- a/Makefile
-+++ b/Makefile
-@@ -48,6 +48,11 @@ ifdef WARN_UNUSED
- CWFLAGS += -Wp,-D_FORTIFY_SOURCE=2 -O3
- endif
- 
-+FALLTHROUGH := $(shell gcc -v --help 2>&1 | grep "implicit-fallthrough" | wc -l)
-+ifneq "$(FALLTHROUGH)"  "0"
-+CWFLAGS += -Wimplicit-fallthrough=0
-+endif
-+
- ifdef DEBIAN
- CPPFLAGS += -DDEBIAN
- endif
--- 
-2.12.2
-
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch b/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
index 4cf809290d..e10905c63b 100644
--- a/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
@@ -1,4 +1,4 @@
-From 6d369e8f226594632ce4260129509daf7030de0a Mon Sep 17 00:00:00 2001
+From b431cb4e1ed060122fa300dc0008f74080d38f73 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 May 2016 22:03:57 +0000
 Subject: [PATCH] mdadm.h: Undefine dprintf before redefining
@@ -14,17 +14,16 @@ In file included from policy.c:25:
 /mnt/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/bits/stdio2.h:145:12: note: previous definition is here
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
+---
  mdadm.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/mdadm.h b/mdadm.h
-index 230e60f..8c8f4d1 100755
+index 387e681..bb943bf 100644
 --- a/mdadm.h
 +++ b/mdadm.h
-@@ -1554,11 +1554,13 @@ static inline char *to_subarray(struct mdstat_ent *ent, char *container)
+@@ -1649,11 +1649,13 @@ static inline char *to_subarray(struct mdstat_ent *ent, char *container)
  }
  
  #ifdef DEBUG
@@ -38,6 +37,3 @@ index 230e60f..8c8f4d1 100755
  #define dprintf(fmt, arg...) \
          ({ if (0) fprintf(stderr, "%s: %s: " fmt, Name, __func__, ##arg); 0; })
  #define dprintf_cont(fmt, arg...) \
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch b/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
deleted file mode 100644
index 44351b6569..0000000000
--- a/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ab18f04cf89ef4e8521c81c50477e1363b2d333b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 28 Apr 2018 09:46:12 -0700
-Subject: [PATCH] use memmove instead of memcpy on overlapping region
-
-Fixes
-super0.c:526:3: error: 'memcpy' accessing 3936 bytes at offsets 156 and 160 overlaps 3932 bytes at offset 160 [-Werror=restrict]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- super0.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/super0.c b/super0.c
-index f5b4507..264b598 100644
---- a/super0.c
-+++ b/super0.c
-@@ -523,7 +523,7 @@ static int update_super0(struct supertype *st, struct mdinfo *info,
- 		 * up 4 bytes before continuing
- 		 */
- 		__u32 *sb32 = (__u32*)sb;
--		memcpy(sb32+MD_SB_GENERIC_CONSTANT_WORDS+7,
-+		memmove(sb32+MD_SB_GENERIC_CONSTANT_WORDS+7,
- 		       sb32+MD_SB_GENERIC_CONSTANT_WORDS+7+1,
- 		       (MD_SB_WORDS - (MD_SB_GENERIC_CONSTANT_WORDS+7+1))*4);
- 		if (verbose >= 0)
--- 
-2.17.0
-
diff --git a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
deleted file mode 100644
index cbce053a3a..0000000000
--- a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From bb4df273041ba206008bdb0ada75ccd97c29f623 Mon Sep 17 00:00:00 2001
-From: Xiao Ni <xni@redhat.com>
-Date: Fri, 17 Mar 2017 19:55:43 +0800
-Subject: [PATCH 2/5] mdadm: Specify enough length when write to buffer
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In Detail.c the buffer path in function Detail is defined as path[200],
-in fact the max lenth of content which needs to write to the buffer is
-287. Because the length of dname of struct dirent is 255.
-During building it reports error:
-error: ‘%s’ directive writing up to 255 bytes into a region of size 189
-[-Werror=format-overflow=]
-
-In function examine_super0 there is a buffer nb with length 5.
-But it need to show a int type argument. The lenght of max
-number of int is 10. So the buffer length should be 11.
-
-In human_size function the length of buf is 30. During building
-there is a error:
-output between 20 and 47 bytes into a destination of size 30.
-Change the length to 47.
-
-Signed-off-by: Xiao Ni <xni@redhat.com>
-Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
----
-Upstream-Status: Backport
- Detail.c | 2 +-
- super0.c | 2 +-
- util.c   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Detail.c b/Detail.c
-index 509b0d4..cb33794 100644
---- a/Detail.c
-+++ b/Detail.c
-@@ -575,7 +575,7 @@ This is pretty boring
- 			printf("  Member Arrays :");
- 
- 			while (dir && (de = readdir(dir)) != NULL) {
--				char path[200];
-+				char path[287];
- 				char vbuf[1024];
- 				int nlen = strlen(sra->sys_name);
- 				dev_t devid;
-diff --git a/super0.c b/super0.c
-index 938cfd9..f5b4507 100644
---- a/super0.c
-+++ b/super0.c
-@@ -231,7 +231,7 @@ static void examine_super0(struct supertype *st, char *homehost)
- 	     d++) {
- 		mdp_disk_t *dp;
- 		char *dv;
--		char nb[5];
-+		char nb[11];
- 		int wonly, failfast;
- 		if (d>=0) dp = &sb->disks[d];
- 		else dp = &sb->this_disk;
-diff --git a/util.c b/util.c
-index f100972..32bd909 100644
---- a/util.c
-+++ b/util.c
-@@ -811,7 +811,7 @@ unsigned long calc_csum(void *super, int bytes)
- #ifndef MDASSEMBLE
- char *human_size(long long bytes)
- {
--	static char buf[30];
-+	static char buf[47];
- 
- 	/* We convert bytes to either centi-M{ega,ibi}bytes or
- 	 * centi-G{igi,ibi}bytes, with appropriate rounding,
--- 
-2.12.2
-
diff --git a/meta/recipes-extended/mdadm/files/0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch b/meta/recipes-extended/mdadm/files/0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch
deleted file mode 100644
index dcec84ffcd..0000000000
--- a/meta/recipes-extended/mdadm/files/0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From bc87af1314325b00c6ac002a60a2b0f0caa81e34 Mon Sep 17 00:00:00 2001
-From: Xiao Ni <xni@redhat.com>
-Date: Sat, 18 Mar 2017 10:33:44 +0800
-Subject: [PATCH 3/5] Replace snprintf with strncpy at some places to avoid
- truncation
-
-In gcc7 there are some building errors like:
-directive output may be truncated writing up to 31 bytes into a region of size 24
-snprintf(str, MPB_SIG_LEN, %s, mpb->sig);
-
-It just need to copy one string to target. So use strncpy to replace it.
-
-For this line code: snprintf(str, MPB_SIG_LEN, %s, mpb->sig);
-Because mpb->sig has the content of version after magic, so
-it's better to use strncpy to replace snprintf too.
-
-Signed-off-by: Xiao Ni <xni@redhat.com>
-Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
----
-Upstream-Status: Backport
- super-intel.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/super-intel.c b/super-intel.c
-index 57c7e75..5499098 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -1811,7 +1811,8 @@ static void examine_super_imsm(struct supertype *st, char *homehost)
- 	__u32 reserved = imsm_reserved_sectors(super, super->disks);
- 	struct dl *dl;
- 
--	snprintf(str, MPB_SIG_LEN, "%s", mpb->sig);
-+	strncpy(str, (char *)mpb->sig, MPB_SIG_LEN);
-+	str[MPB_SIG_LEN-1] = '\0';
- 	printf("          Magic : %s\n", str);
- 	snprintf(str, strlen(MPB_VERSION_RAID0), "%s", get_imsm_version(mpb));
- 	printf("        Version : %s\n", get_imsm_version(mpb));
-@@ -7142,14 +7143,16 @@ static int update_subarray_imsm(struct supertype *st, char *subarray,
- 
- 			u->type = update_rename_array;
- 			u->dev_idx = vol;
--			snprintf((char *) u->name, MAX_RAID_SERIAL_LEN, "%s", name);
-+			strncpy((char *) u->name, name, MAX_RAID_SERIAL_LEN);
-+			u->name[MAX_RAID_SERIAL_LEN-1] = '\0';
- 			append_metadata_update(st, u, sizeof(*u));
- 		} else {
- 			struct imsm_dev *dev;
- 			int i;
- 
- 			dev = get_imsm_dev(super, vol);
--			snprintf((char *) dev->volume, MAX_RAID_SERIAL_LEN, "%s", name);
-+			strncpy((char *) dev->volume, name, MAX_RAID_SERIAL_LEN);
-+			dev->volume[MAX_RAID_SERIAL_LEN-1] = '\0';
- 			for (i = 0; i < mpb->num_raid_devs; i++) {
- 				dev = get_imsm_dev(super, i);
- 				handle_missing(super, dev);
--- 
-2.12.2
-
diff --git a/meta/recipes-extended/mdadm/files/0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch b/meta/recipes-extended/mdadm/files/0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch
deleted file mode 100644
index 94fde42e99..0000000000
--- a/meta/recipes-extended/mdadm/files/0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5da889032e2d99751ed9fe60016146e9ae8114cd Mon Sep 17 00:00:00 2001
-From: Xiao Ni <xni@redhat.com>
-Date: Sat, 18 Mar 2017 10:33:45 +0800
-Subject: [PATCH 4/5] mdadm: Forced type conversion to avoid truncation
-
-Gcc reports it needs 19 bytes to right to disk->serial. Because the
-type of argument i is int. But the meaning of i is failed disk
-number. So it doesn't need to use 19 bytes.  Just add a type
-conversion to avoid this building error
-
-Signed-off-by: Xiao Ni <xni@redhat.com>
-Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
----
-Upstream-Status: Backport
- super-intel.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/super-intel.c b/super-intel.c
-index 5499098..4e466ff 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -5228,7 +5228,7 @@ static int init_super_imsm_volume(struct supertype *st, mdu_array_info_t *info,
- 			disk->status = CONFIGURED_DISK | FAILED_DISK;
- 			disk->scsi_id = __cpu_to_le32(~(__u32)0);
- 			snprintf((char *) disk->serial, MAX_RAID_SERIAL_LEN,
--				 "missing:%d", i);
-+				 "missing:%d", (__u8)i);
- 		}
- 		find_missing(super);
- 	} else {
--- 
-2.12.2
-
diff --git a/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch b/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
index 3d9d3b9044..d279fddfb6 100644
--- a/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
+++ b/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
@@ -1,7 +1,7 @@
-From 09014233bf10900f7bd8390b3b64ff82bca45222 Mon Sep 17 00:00:00 2001
+From 0c2c8ae6b3a1fb0f611f9795953a7a6ed06be38d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Apr 2017 12:04:15 -0700
-Subject: [PATCH 5/5] Add a comment to indicate valid fallthrough
+Subject: [PATCH] Add a comment to indicate valid fallthrough
 
 gcc7 warns about code with fallthroughs, this patch adds
 the comment to indicate a valid fallthrough, helps gcc7
@@ -10,9 +10,8 @@ compiler warnings
 This works in cross and native compilation case
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
 
+---
  Grow.c        | 4 ++++
  bitmap.c      | 8 ++++++++
  mdadm.c       | 2 ++
@@ -21,10 +20,10 @@ Upstream-Status: Submitted
  5 files changed, 16 insertions(+)
 
 diff --git a/Grow.c b/Grow.c
-index 455c5f9..27c73b1 100755
+index 4436a4d..b3116e2 100644
 --- a/Grow.c
 +++ b/Grow.c
-@@ -1257,6 +1257,7 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
+@@ -1447,6 +1447,7 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
  		switch (info->new_level) {
  		case 4:
  			delta_parity = 1;
@@ -32,7 +31,7 @@ index 455c5f9..27c73b1 100755
  		case 0:
  			re->level = 4;
  			re->before.layout = 0;
-@@ -1284,10 +1285,12 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
+@@ -1474,10 +1475,12 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
  
  	case 4:
  		info->array.layout = ALGORITHM_PARITY_N;
@@ -45,7 +44,7 @@ index 455c5f9..27c73b1 100755
  		case 4:
  			re->level = info->array.level;
  			re->before.data_disks = info->array.raid_disks - 1;
-@@ -1343,6 +1346,7 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
+@@ -1533,6 +1536,7 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
  		case 4:
  		case 5:
  			delta_parity = -1;
@@ -54,7 +53,7 @@ index 455c5f9..27c73b1 100755
  			re->level = 6;
  			re->before.data_disks = info->array.raid_disks - 2;
 diff --git a/bitmap.c b/bitmap.c
-index ccedfd3..a6ff091 100644
+index e38cb96..10af328 100644
 --- a/bitmap.c
 +++ b/bitmap.c
 @@ -82,13 +82,21 @@ static inline int count_dirty_bits_byte(char byte, int num_bits)
@@ -80,10 +79,10 @@ index ccedfd3..a6ff091 100644
  	}
  
 diff --git a/mdadm.c b/mdadm.c
-index c3a265b..2d06d3b 100644
+index 25a1abd..9843bc5 100644
 --- a/mdadm.c
 +++ b/mdadm.c
-@@ -148,6 +148,7 @@ int main(int argc, char *argv[])
+@@ -155,6 +155,7 @@ int main(int argc, char *argv[])
  			    mode == CREATE || mode == GROW ||
  			    mode == INCREMENTAL || mode == MANAGE)
  				break; /* b means bitmap */
@@ -91,7 +90,7 @@ index c3a265b..2d06d3b 100644
  		case Brief:
  			c.brief = 1;
  			continue;
-@@ -828,6 +829,7 @@ int main(int argc, char *argv[])
+@@ -839,6 +840,7 @@ int main(int argc, char *argv[])
  
  		case O(INCREMENTAL,NoDegraded):
  			pr_err("--no-degraded is deprecated in Incremental mode\n");
@@ -100,11 +99,11 @@ index c3a265b..2d06d3b 100644
  			c.runstop = -1; /* --stop isn't allowed for --assemble,
  					 * so we overload slightly */
 diff --git a/super-intel.c b/super-intel.c
-index 4e466ff..00a2925 100644
+index e726987..1bc4b80 100644
 --- a/super-intel.c
 +++ b/super-intel.c
-@@ -3271,6 +3271,7 @@ static void getinfo_super_imsm_volume(struct supertype *st, struct mdinfo *info,
- 						<< SECT_PER_MB_SHIFT;
+@@ -3425,6 +3425,7 @@ static void getinfo_super_imsm_volume(struct supertype *st, struct mdinfo *info,
+ 
  			}
  		}
 +		/* fallthrough */
@@ -112,10 +111,10 @@ index 4e466ff..00a2925 100644
  			/* we could emulate the checkpointing of
  			 * 'sync_action=check' migrations, but for now
 diff --git a/util.c b/util.c
-index 32bd909..f2a4d19 100644
+index c26cf5f..61cbe23 100644
 --- a/util.c
 +++ b/util.c
-@@ -335,6 +335,7 @@ unsigned long long parse_size(char *size)
+@@ -400,6 +400,7 @@ unsigned long long parse_size(char *size)
  		switch (*c) {
  		case 'K':
  			c++;
@@ -123,6 +122,3 @@ index 32bd909..f2a4d19 100644
  		default:
  			s *= 2;
  			break;
--- 
-2.12.2
-
diff --git a/meta/recipes-extended/mdadm/files/gcc-4.9.patch b/meta/recipes-extended/mdadm/files/gcc-4.9.patch
index df21399deb..473fd7821b 100644
--- a/meta/recipes-extended/mdadm/files/gcc-4.9.patch
+++ b/meta/recipes-extended/mdadm/files/gcc-4.9.patch
@@ -1,3 +1,8 @@
+From 8804bca3de1b79a7c579783b7e3a7603f43bbb48 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 May 2014 16:31:17 -0700
+Subject: [PATCH] mdadm: Fix build on gcc 4.9
+
 super-intel.c:5063:2: error: right-hand operand of comma expression has no effect [-Werror=unused-value]
   snprintf((char *) spare->sig, MAX_SIGNATURE_LENGTH,
   ^
@@ -7,11 +12,15 @@ make: *** [super-intel.o] Error 1
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: mdadm-4.0/super-intel.c
-===================================================================
---- mdadm-4.0.orig/super-intel.c
-+++ mdadm-4.0/super-intel.c
-@@ -5725,7 +5725,7 @@ static int write_super_imsm_spares(struc
+---
+ super-intel.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/super-intel.c b/super-intel.c
+index 6438987..e726987 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -5941,7 +5941,7 @@ static int write_super_imsm_spares(struct intel_super *super, int doclose)
  	spare->cache_size = mpb->cache_size;
  	spare->pwr_cycle_count = __cpu_to_le32(1);
  
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
index 00e6657e09..7a2c888701 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
@@ -1,3 +1,11 @@
+From e37f7f6a0f1ef1b594574d11a8b90b8c861d047b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Sun, 15 Mar 2015 09:02:14 +0000
+Subject: [PATCH] mdadm: Fix build in x32 ABI
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 When try to print time_t values as a long int it causes an error because time_t
 data type in x32 ABI is long long int.
 
@@ -5,11 +13,15 @@ Upstream-Status: Pending
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 
-Index: mdadm-4.0/monitor.c
-===================================================================
---- mdadm-4.0.orig/monitor.c
-+++ mdadm-4.0/monitor.c
-@@ -445,9 +445,12 @@ static int read_and_act(struct active_ar
+---
+ monitor.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/monitor.c b/monitor.c
+index 81537ed..7c33382 100644
+--- a/monitor.c
++++ b/monitor.c
+@@ -445,9 +445,12 @@ static int read_and_act(struct active_array *a, fd_set *fds)
  		if (FD_ISSET(mdi->bb_fd, fds))
  			check_for_cleared_bb(a, mdi);
  	}
diff --git a/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
index 267c007c21..8e2a8a9043 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
@@ -1,4 +1,4 @@
-From c65898b9da82df94e1bae7937e415a7eb80355d5 Mon Sep 17 00:00:00 2001
+From 911f6ea9be0c334885aeff66853b111cbd4066df Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Wed, 10 Feb 2016 17:28:05 +0200
 Subject: [PATCH] mdadm-fix-ptest-build-errors
@@ -16,15 +16,16 @@ builds fail with ptest enabled:
 Upstream-Status: Pending
 
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+
 ---
  restripe.c | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/restripe.c b/restripe.c
-index 56dca73..d24b2b4 100644
+index 31b07e8..592ba5d 100644
 --- a/restripe.c
 +++ b/restripe.c
-@@ -842,10 +842,14 @@ int test_stripes(int *source, unsigned long long *offsets,
+@@ -864,10 +864,14 @@ int test_stripes(int *source, unsigned long long *offsets,
  
  	while (length > 0) {
  		int disk;
@@ -40,6 +41,3 @@ index 56dca73..d24b2b4 100644
  		}
  		for (i = 0 ; i < data_disks ; i++) {
  			int disk = geo_map(i, start/chunk_size, raid_disks,
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
similarity index 83%
rename from meta/recipes-extended/mdadm/mdadm_4.0.bb
rename to meta/recipes-extended/mdadm/mdadm_4.1.bb
index 2c4d88a9e7..b9f55841cb 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -16,17 +16,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
            file://0001-include-sys-sysmacros.h-for-major-minor-defintions.patch \
-           file://0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch \
-           file://0002-mdadm-Specify-enough-length-when-write-to-buffer.patch \
-           file://0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch \
-           file://0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch \
            file://0005-Add-a-comment-to-indicate-valid-fallthrough.patch \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
-           file://0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch \
            file://0001-Disable-gcc8-warnings.patch \
            "
-SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
-SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"
+SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
+SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
 
 CFLAGS += "-fno-strict-aliasing"
 inherit autotools-brokensep
-- 
2.17.1


