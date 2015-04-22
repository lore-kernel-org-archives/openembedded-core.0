Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8125B71E68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:50:07 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so35183873igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=CHvGl29Omu56HZr4kWzZ6Ounf5h3NUM2N/7dN5hwZuE=;
	b=KPbyua+s2UL+2g/LYTCfBP3QNpx9PwUmSSf3iNoC845Hfhe6BedZvHM1yrf+VKYIS4
	hVSM1eEMYQKznqVOy2DIUWRQPg2WX9SkJ2iU4l2Zpikd71RftUFy9FbzMw64rJTP5K/I
	1LY+P/duNh22cGzCnIKgSPcBHTki/QMriz9FjQYD42AE6NrlZwRu0XHNJIL2IxNJYQFx
	FFdpVBf7RZLmFEjAZbuJgpBBoxCm61aO72Z/NU+N7SsEUq9FyUzWcvDI/JFdP7F9PM20
	ahvM0Urp/bDWgmBzdxP/vVOx3eU+uL8LKXsvqOv8b5u4NQSS19Pq5QXfzP6/jSKqEN/U
	fqNg==
X-Received: by 10.107.170.77 with SMTP id t74mr34685035ioe.85.1429689008055;
	Wed, 22 Apr 2015 00:50:08 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id l1sm2686434ioe.32.2015.04.22.00.50.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Apr 2015 00:50:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 07:49:55 +0000
Message-Id: <aa1bcbe6c48eae4d7e3a669b17dc56768d9e5431.1429688786.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
References: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429688786.git.raj.khem@gmail.com>
References: <cover.1429688786.git.raj.khem@gmail.com>
Subject: [PATCH 06/10] mdadm: Fix inline semantics
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
X-List-Received-Date: Wed, 22 Apr 2015 07:50:07 -0000

With gcc-5 defaulting to gnu11 C we need to follow
c99 inline semantics

Change-Id: I397520c36c81634556b3f3782aebc532e4a79aed
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/mdadm/files/inline.patch | 39 ++++++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/inline.patch

diff --git a/meta/recipes-extended/mdadm/files/inline.patch b/meta/recipes-extended/mdadm/files/inline.patch
new file mode 100644
index 0000000..9009f06
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/inline.patch
@@ -0,0 +1,39 @@
+with gnu11 turning on a default with gcc-5 we have to abide by new inline semantics
+using 'inline' and using is in same translation unit means an external definition has to exist
+same like "external inline" in gnu89, we simply make the functions static inline since they
+are just meant to be used in this file
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: mdadm-3.3.2/bitmap.c
+===================================================================
+--- mdadm-3.3.2.orig/bitmap.c
++++ mdadm-3.3.2/bitmap.c
+@@ -20,7 +20,7 @@
+ 
+ #include "mdadm.h"
+ 
+-inline void sb_le_to_cpu(bitmap_super_t *sb)
++static inline void sb_le_to_cpu(bitmap_super_t *sb)
+ {
+ 	sb->magic = __le32_to_cpu(sb->magic);
+ 	sb->version = __le32_to_cpu(sb->version);
+@@ -34,7 +34,7 @@ inline void sb_le_to_cpu(bitmap_super_t
+ 	sb->write_behind = __le32_to_cpu(sb->write_behind);
+ }
+ 
+-inline void sb_cpu_to_le(bitmap_super_t *sb)
++static inline void sb_cpu_to_le(bitmap_super_t *sb)
+ {
+ 	sb_le_to_cpu(sb); /* these are really the same thing */
+ }
+@@ -74,7 +74,7 @@ typedef struct bitmap_info_s {
+ } bitmap_info_t;
+ 
+ /* count the dirty bits in the first num_bits of byte */
+-inline int count_dirty_bits_byte(char byte, int num_bits)
++static inline int count_dirty_bits_byte(char byte, int num_bits)
+ {
+ 	int num = 0;
+ 
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
index 0742d73..87e06f5 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://mdadm-3.2.2_fix_for_x32.patch \
            file://gcc-4.9.patch \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
+           file://inline.patch \
            file://run-ptest \
 	  "
 
-- 
2.1.4


