Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 12E3876B49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:47 +0000 (UTC)
Received: by iodb91 with SMTP id b91so161612577iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FxfcxTRFZEj+q/RWp4KrbSO3agZZ/2LrSRYerbVxWWc=;
	b=wjfIKsFr2rzEkKz2uzZ8ixtL3e9dzWEXNCh6XjjiNPGQ1WP5TCrizzEFqBSi2VkN04
	0r9bqPneI39+UWBLJ64BKqtRD+urN39DPcLY1iUN/p4Uj+ve51ESQ+3Dm5z9TxNPmfcn
	bvo3acLBmps79GKBUdq2p4vgM7Xu4O+HzGwjk894jOjOoInYbHp1HqhbAVx+G2pfi9Va
	uulPhKY0dwMjSAeLcVcKDtOH35oMXGBx5uA26o9TsRLCHyJgKHeFT/KOpp1eJvLdiz3o
	054MXzXUUfutPttewPdsDiFpjTuz6sBTsC2veBiqfOBlWE3fdGs/rC++JGRLWo1L1GWx
	ajQw==
X-Received: by 10.107.19.202 with SMTP id 71mr18868241iot.94.1440446627933;
	Mon, 24 Aug 2015 13:03:47 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:32 -0700
Message-Id: <442633a834cbcf4f50fb3d735319edde4190e3fa.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 14/17] liburcu: Fix atomic function parameter types in calls
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:48 -0000

__sync_val_compare_and_swap family specifically asks for proper types of
pointer type parameters, gcc does not notice it but clang does and sends
out errors calling it out.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cify-complete-types-for-atomic-function-c.patch | 158 +++++++++++++++++++++
 meta/recipes-support/liburcu/liburcu_0.8.7.bb      |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch

diff --git a/meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch b/meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch
new file mode 100644
index 0000000..5ad0bbd
--- /dev/null
+++ b/meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch
@@ -0,0 +1,158 @@
+From 6af790818d074c103c4797f1ce764896f183e028 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Aug 2015 21:35:03 -0700
+Subject: [PATCH] uatomic: Specify complete types for atomic function calls
+
+This was unearthed by clang compiler where it complained about parameter
+mismatch, gcc doesnt notice this
+
+urcu/uatomic/generic.h:190:10: error: address argument to atomic builtin
+must be a pointer to integer or pointer ('void *' invalid)
+                return __sync_add_and_fetch_4(addr, val);
+
+Fixed all instances thusly
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ urcu/uatomic/generic.h | 40 ++++++++++++++++++++--------------------
+ 1 file changed, 20 insertions(+), 20 deletions(-)
+
+diff --git a/urcu/uatomic/generic.h b/urcu/uatomic/generic.h
+index 37f59cc..0046ffd 100644
+--- a/urcu/uatomic/generic.h
++++ b/urcu/uatomic/generic.h
+@@ -65,17 +65,17 @@ unsigned long _uatomic_cmpxchg(void *addr, unsigned long old,
+ 	switch (len) {
+ #ifdef UATOMIC_HAS_ATOMIC_BYTE
+ 	case 1:
+-		return __sync_val_compare_and_swap_1(addr, old, _new);
++		return __sync_val_compare_and_swap_1((unsigned char *)addr, old, _new);
+ #endif
+ #ifdef UATOMIC_HAS_ATOMIC_SHORT
+ 	case 2:
+-		return __sync_val_compare_and_swap_2(addr, old, _new);
++		return __sync_val_compare_and_swap_2((unsigned short int *)addr, old, _new);
+ #endif
+ 	case 4:
+-		return __sync_val_compare_and_swap_4(addr, old, _new);
++		return __sync_val_compare_and_swap_4((unsigned int *)addr, old, _new);
+ #if (CAA_BITS_PER_LONG == 64)
+ 	case 8:
+-		return __sync_val_compare_and_swap_8(addr, old, _new);
++		return __sync_val_compare_and_swap_8((unsigned long *)addr, old, _new);
+ #endif
+ 	}
+ 	_uatomic_link_error();
+@@ -100,20 +100,20 @@ void _uatomic_and(void *addr, unsigned long val,
+ 	switch (len) {
+ #ifdef UATOMIC_HAS_ATOMIC_BYTE
+ 	case 1:
+-		__sync_and_and_fetch_1(addr, val);
++		__sync_and_and_fetch_1((unsigned char *)addr, val);
+ 		return;
+ #endif
+ #ifdef UATOMIC_HAS_ATOMIC_SHORT
+ 	case 2:
+-		__sync_and_and_fetch_2(addr, val);
++		__sync_and_and_fetch_2((unsigned short int *)addr, val);
+ 		return;
+ #endif
+ 	case 4:
+-		__sync_and_and_fetch_4(addr, val);
++		__sync_and_and_fetch_4((unsigned int *)addr, val);
+ 		return;
+ #if (CAA_BITS_PER_LONG == 64)
+ 	case 8:
+-		__sync_and_and_fetch_8(addr, val);
++		__sync_and_and_fetch_8((unsigned long *)addr, val);
+ 		return;
+ #endif
+ 	}
+@@ -139,20 +139,20 @@ void _uatomic_or(void *addr, unsigned long val,
+ 	switch (len) {
+ #ifdef UATOMIC_HAS_ATOMIC_BYTE
+ 	case 1:
+-		__sync_or_and_fetch_1(addr, val);
++		__sync_or_and_fetch_1((unsigned char *)addr, val);
+ 		return;
+ #endif
+ #ifdef UATOMIC_HAS_ATOMIC_SHORT
+ 	case 2:
+-		__sync_or_and_fetch_2(addr, val);
++		__sync_or_and_fetch_2((unsigned short int *)addr, val);
+ 		return;
+ #endif
+ 	case 4:
+-		__sync_or_and_fetch_4(addr, val);
++		__sync_or_and_fetch_4((unsigned int *)addr, val);
+ 		return;
+ #if (CAA_BITS_PER_LONG == 64)
+ 	case 8:
+-		__sync_or_and_fetch_8(addr, val);
++		__sync_or_and_fetch_8((unsigned long *)addr, val);
+ 		return;
+ #endif
+ 	}
+@@ -180,17 +180,17 @@ unsigned long _uatomic_add_return(void *addr, unsigned long val,
+ 	switch (len) {
+ #ifdef UATOMIC_HAS_ATOMIC_BYTE
+ 	case 1:
+-		return __sync_add_and_fetch_1(addr, val);
++		return __sync_add_and_fetch_1((unsigned char *)addr, val);
+ #endif
+ #ifdef UATOMIC_HAS_ATOMIC_SHORT
+ 	case 2:
+-		return __sync_add_and_fetch_2(addr, val);
++		return __sync_add_and_fetch_2((unsigned short int *)addr, val);
+ #endif
+ 	case 4:
+-		return __sync_add_and_fetch_4(addr, val);
++		return __sync_add_and_fetch_4((unsigned int *)addr, val);
+ #if (CAA_BITS_PER_LONG == 64)
+ 	case 8:
+-		return __sync_add_and_fetch_8(addr, val);
++		return __sync_add_and_fetch_8((unsigned long *)addr, val);
+ #endif
+ 	}
+ 	_uatomic_link_error();
+@@ -218,7 +218,7 @@ unsigned long _uatomic_exchange(void *addr, unsigned long val, int len)
+ 
+ 		do {
+ 			old = uatomic_read((unsigned char *)addr);
+-		} while (!__sync_bool_compare_and_swap_1(addr, old, val));
++		} while (!__sync_bool_compare_and_swap_1((unsigned char *)addr, old, val));
+ 
+ 		return old;
+ 	}
+@@ -230,7 +230,7 @@ unsigned long _uatomic_exchange(void *addr, unsigned long val, int len)
+ 
+ 		do {
+ 			old = uatomic_read((unsigned short *)addr);
+-		} while (!__sync_bool_compare_and_swap_2(addr, old, val));
++		} while (!__sync_bool_compare_and_swap_2((unsigned short int *)addr, old, val));
+ 
+ 		return old;
+ 	}
+@@ -241,7 +241,7 @@ unsigned long _uatomic_exchange(void *addr, unsigned long val, int len)
+ 
+ 		do {
+ 			old = uatomic_read((unsigned int *)addr);
+-		} while (!__sync_bool_compare_and_swap_4(addr, old, val));
++		} while (!__sync_bool_compare_and_swap_4((unsigned int *)addr, old, val));
+ 
+ 		return old;
+ 	}
+@@ -252,7 +252,7 @@ unsigned long _uatomic_exchange(void *addr, unsigned long val, int len)
+ 
+ 		do {
+ 			old = uatomic_read((unsigned long *)addr);
+-		} while (!__sync_bool_compare_and_swap_8(addr, old, val));
++		} while (!__sync_bool_compare_and_swap_8((unsigned long *)addr, old, val));
+ 
+ 		return old;
+ 	}
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/liburcu/liburcu_0.8.7.bb b/meta/recipes-support/liburcu/liburcu_0.8.7.bb
index 71cb149..a7f4f51 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.7.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.7.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
            file://Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch \
            file://aarch64.patch \
+           file://0001-uatomic-Specify-complete-types-for-atomic-function-c.patch \
           "
 
 SRC_URI[md5sum] = "7a6ee17871d31226db3f618e28351d22"
-- 
2.1.4


