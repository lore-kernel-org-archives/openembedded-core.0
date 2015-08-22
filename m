Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 82F6F75794
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 15:58:40 +0000 (UTC)
Received: by iodv127 with SMTP id v127so110062506iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=49edM/BwUSSwU9gUMxNo6lI6AgnhH+ipN+va9HvQzdw=;
	b=RtFQCN7g6FF0J1xLnJb4khZyOPxVBDC3gAuHN4lmDlE2AomLBoq2rwZBDvxaLpKkHA
	kF+afbETl7Kog+crqyC9ssAasIv77O5iz8oSY42bMFGzXQTmkdjzvomVw/2Ok1/qy3/g
	tEqo0X5eQ588ObDO0X/SQFDyQPoSiph/m7n/sP1IW1CtVa6jPEy7tkd5DH1xXSEB7COR
	yGysFHhjBgLqqNzhRqr6cOXhpQXNSBFys5GPOFZrWxr4hKHz+CcGfXF0MkgcW9GK5Z/z
	t43KWZuHYYRI8v7ZQMGhHjnRW7jqDy3vta3jFwo8/wAmFy0O5JEHh838h3q62lguqXAg
	0goA==
X-Received: by 10.107.15.194 with SMTP id 63mr15277698iop.44.1440259120418;
	Sat, 22 Aug 2015 08:58:40 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id r8sm8726088ioi.10.2015.08.22.08.58.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Aug 2015 08:58:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Aug 2015 08:58:15 -0700
Message-Id: <1440259095-24566-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
References: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] mdadm: Upgrade mdadm_3.3.2.bb -> mdadm_3.3.4.bb
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
X-List-Received-Date: Sat, 22 Aug 2015 15:58:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upstreamed patch for gcc5 compatibility
Forward port x32 patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/mdadm/files/inline.patch     | 39 ----------------------
 .../mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch   | 23 ++++++-------
 .../mdadm/{mdadm_3.3.2.bb => mdadm_3.3.4.bb}       |  6 ++--
 3 files changed, 13 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/inline.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.3.2.bb => mdadm_3.3.4.bb} (92%)

diff --git a/meta/recipes-extended/mdadm/files/inline.patch b/meta/recipes-extended/mdadm/files/inline.patch
deleted file mode 100644
index 9009f06..0000000
--- a/meta/recipes-extended/mdadm/files/inline.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-with gnu11 turning on a default with gcc-5 we have to abide by new inline semantics
-using 'inline' and using is in same translation unit means an external definition has to exist
-same like "external inline" in gnu89, we simply make the functions static inline since they
-are just meant to be used in this file
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: mdadm-3.3.2/bitmap.c
-===================================================================
---- mdadm-3.3.2.orig/bitmap.c
-+++ mdadm-3.3.2/bitmap.c
-@@ -20,7 +20,7 @@
- 
- #include "mdadm.h"
- 
--inline void sb_le_to_cpu(bitmap_super_t *sb)
-+static inline void sb_le_to_cpu(bitmap_super_t *sb)
- {
- 	sb->magic = __le32_to_cpu(sb->magic);
- 	sb->version = __le32_to_cpu(sb->version);
-@@ -34,7 +34,7 @@ inline void sb_le_to_cpu(bitmap_super_t
- 	sb->write_behind = __le32_to_cpu(sb->write_behind);
- }
- 
--inline void sb_cpu_to_le(bitmap_super_t *sb)
-+static inline void sb_cpu_to_le(bitmap_super_t *sb)
- {
- 	sb_le_to_cpu(sb); /* these are really the same thing */
- }
-@@ -74,7 +74,7 @@ typedef struct bitmap_info_s {
- } bitmap_info_t;
- 
- /* count the dirty bits in the first num_bits of byte */
--inline int count_dirty_bits_byte(char byte, int num_bits)
-+static inline int count_dirty_bits_byte(char byte, int num_bits)
- {
- 	int num = 0;
- 
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
index 143a8d9..c656d07 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
@@ -5,22 +5,21 @@ Upstream-Status: Pending
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 
-diff --git a/monitor.c b/monitor.c
-index f81e707..19ea041 100644
---- a/monitor.c
-+++ b/monitor.c
-@@ -260,8 +260,13 @@ static int read_and_act(struct active_array *a)
+Index: mdadm-3.3.4/monitor.c
+===================================================================
+--- mdadm-3.3.4.orig/monitor.c
++++ mdadm-3.3.4/monitor.c
+@@ -257,9 +257,12 @@ static int read_and_act(struct active_ar
+ 			mdi->curr_state = read_dev_state(mdi->state_fd);
+ 		}
  	}
- 
+-
  	gettimeofday(&tv, NULL);
 +#if defined(__x86_64__) && defined(__ILP32__)
-+	dprintf("%s(%d): %lld.%06lld state:%s prev:%s action:%s prev: %s start:%llu\n",
++	dprintf("(%d): %lld.%06lld state:%s prev:%s action:%s prev: %s start:%llu\n",
 +#else
- 	dprintf("%s(%d): %ld.%06ld state:%s prev:%s action:%s prev: %s start:%llu\n",
--		__func__, a->info.container_member,
+ 	dprintf("(%d): %ld.%06ld state:%s prev:%s action:%s prev: %s start:%llu\n",
 +#endif
-+		__func__,
-+		a->info.container_member,
+ 		a->info.container_member,
  		tv.tv_sec, tv.tv_usec,
  		array_states[a->curr_state],
- 		array_states[a->prev_state],
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
similarity index 92%
rename from meta/recipes-extended/mdadm/mdadm_3.3.2.bb
rename to meta/recipes-extended/mdadm/mdadm_3.3.4.bb
index b2fbe4a..460a430 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
@@ -12,12 +12,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://mdadm-3.2.2_fix_for_x32.patch \
            file://gcc-4.9.patch \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
-           file://inline.patch \
            file://run-ptest \
 	  "
-
-SRC_URI[md5sum] = "44698d351501cac6a89072dc877eb220"
-SRC_URI[sha256sum] = "0f3a7e1a76b13892b79f9fceaf99ecb23513260389a768ac644ffa3ae06e5b8c"
+SRC_URI[md5sum] = "7ca8b114710f98f53f20c5787b674a09"
+SRC_URI[sha256sum] = "8ae5f45306b873190e91f410709b00e51997b633c072b33f8efd9f7df022ca68"
 
 CFLAGS += "-fno-strict-aliasing"
 
-- 
2.1.4


