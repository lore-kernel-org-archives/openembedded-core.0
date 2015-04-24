Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 67AAB73D7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:41 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so36512510pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=CHvGl29Omu56HZr4kWzZ6Ounf5h3NUM2N/7dN5hwZuE=;
	b=VGnh8ojd/D+hkirSihlIUbr11UzrBjcV0DVFRQrqAjtLr/xt1SpcG9T8sBbQH51IfY
	smBsKCOmkJzROVWjeLiAwNI8nWQS4KylviF8SP1w4UqA2NVP1zmL1UnUYJM+XtouSmUw
	LM1e3D2QHL39QytRBSTi53qd8kj5XcQIHZfEhyoqyt/MWcB8lktzaxa95xRDCHb+8JsI
	AVll1g3MdN4PXGFKogJWCRXo837sMFBuIB3vafKwJVs7boIWg0sPhr2YYgwR17A1ysD1
	pGr0LKVKSZ+AovObOiSwncQn+7Km7sk1U7p5rNX6Em9eFe4vWy2WnMyv0MXL4+/Ml1JK
	SGsA==
X-Received: by 10.66.65.169 with SMTP id y9mr10838324pas.60.1429846543412;
	Thu, 23 Apr 2015 20:35:43 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:23 -0700
Message-Id: <5ee60bd6cc3eaf81b8fa2ee414b6803d1dbf5873.1429846255.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 05/14] mdadm: Fix inline semantics
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:43 -0000

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


