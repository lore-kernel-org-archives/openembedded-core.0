Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 12B4271FFB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2014 16:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989765"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:30 -0800
Message-Id: <4765e77590197cc926c5ecbe9045159309fb2863.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 05/19] libgcrypt: Ugrade to 1.6.2
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:55 -0000

Remove backported patch

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...ibgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch | 169 ---------------------
 meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb  |   6 -
 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb  |   4 +
 3 files changed, 4 insertions(+), 175 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb

diff --git a/meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch b/meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch
deleted file mode 100644
index 3400872..0000000
--- a/meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-Fix ARM assembly when building __PIC__
-
-* cipher/camellia-arm.S (GET_DATA_POINTER): New.
-(_gcry_camellia_arm_encrypt_block): Use GET_DATA_POINTER.
-(_gcry_camellia_arm_decrypt_block): Ditto.
-* cipher/cast5-arm.S (GET_DATA_POINTER): New.
-(_gcry_cast5_arm_encrypt_block, _gcry_cast5_arm_decrypt_block)
-(_gcry_cast5_arm_enc_blk2, _gcry_cast5_arm_dec_blk2): Use
-GET_DATA_POINTER.
-* cipher/rijndael-arm.S (GET_DATA_POINTER): New.
-(_gcry_aes_arm_encrypt_block, _gcry_aes_arm_decrypt_block): Use
-GET_DATA_POINTER.
---
-
-Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
-
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- cipher/camellia-arm.S |   17 +++++++++++++++--
- cipher/cast5-arm.S    |   21 +++++++++++++++++----
- cipher/rijndael-arm.S |   17 +++++++++++++++--
- 3 files changed, 47 insertions(+), 8 deletions(-)
-
-diff --git a/cipher/camellia-arm.S b/cipher/camellia-arm.S
-index c30d194..cdeaf8b 100644
---- a/cipher/camellia-arm.S
-+++ b/cipher/camellia-arm.S
-@@ -28,6 +28,19 @@
- .syntax unified
- .arm
- 
-+#ifdef __PIC__
-+#  define GET_DATA_POINTER(reg, name, rtmp) \
-+		ldr reg, 1f; \
-+		ldr rtmp, 2f; \
-+		b 3f; \
-+	1:	.word _GLOBAL_OFFSET_TABLE_-(3f+8); \
-+	2:	.word name(GOT); \
-+	3:	add reg, pc, reg; \
-+		ldr reg, [reg, rtmp];
-+#else
-+#  define GET_DATA_POINTER(reg, name, rtmp) ldr reg, =name
-+#endif
-+
- /* struct camellia_ctx: */
- #define key_table 0
- 
-@@ -261,7 +274,7 @@ _gcry_camellia_arm_encrypt_block:
- 	 */
- 	push {%r1, %r4-%r11, %ip, %lr};
- 
--	ldr RTAB1, =.Lcamellia_sp1110;
-+	GET_DATA_POINTER(RTAB1, .Lcamellia_sp1110, RTAB3);
- 	mov RMASK, #0xff;
- 	add RTAB3, RTAB1, #(2 * 4);
- 	push {%r3};
-@@ -309,7 +322,7 @@ _gcry_camellia_arm_decrypt_block:
- 	 */
- 	push {%r1, %r4-%r11, %ip, %lr};
- 
--	ldr RTAB1, =.Lcamellia_sp1110;
-+	GET_DATA_POINTER(RTAB1, .Lcamellia_sp1110, RTAB3);
- 	mov RMASK, #0xff;
- 	add RTAB3, RTAB1, #(2 * 4);
- 	mov RMASK, RMASK, lsl#4 /* byte mask */
-diff --git a/cipher/cast5-arm.S b/cipher/cast5-arm.S
-index ce7fa93..db96db4 100644
---- a/cipher/cast5-arm.S
-+++ b/cipher/cast5-arm.S
-@@ -30,6 +30,19 @@
- 
- .extern _gcry_cast5_s1to4;
- 
-+#ifdef __PIC__
-+#  define GET_DATA_POINTER(reg, name, rtmp) \
-+		ldr reg, 1f; \
-+		ldr rtmp, 2f; \
-+		b 3f; \
-+	1:	.word _GLOBAL_OFFSET_TABLE_-(3f+8); \
-+	2:	.word name(GOT); \
-+	3:	add reg, pc, reg; \
-+		ldr reg, [reg, rtmp];
-+#else
-+#  define GET_DATA_POINTER(reg, name, rtmp) ldr reg, =name
-+#endif
-+
- /* structure of crypto context */
- #define Km 0
- #define Kr (Km + (16 * 4))
-@@ -260,7 +273,7 @@ _gcry_cast5_arm_encrypt_block:
- 	 */
- 	push {%r1, %r4-%r11, %ip, %lr};
- 
--	ldr Rs1, =_gcry_cast5_s1to4;
-+	GET_DATA_POINTER(Rs1, _gcry_cast5_s1to4, Rs2);
- 	mov RMASK, #(0xff << 2);
- 	add Rs2, Rs1, #(0x100*4);
- 	add Rs3, Rs1, #(0x100*4*2);
-@@ -306,7 +319,7 @@ _gcry_cast5_arm_decrypt_block:
- 	 */
- 	push {%r1, %r4-%r11, %ip, %lr};
- 
--	ldr Rs1, =_gcry_cast5_s1to4;
-+	GET_DATA_POINTER(Rs1, _gcry_cast5_s1to4, Rs2);
- 	mov RMASK, #(0xff << 2);
- 	add Rs2, Rs1, #(0x100 * 4);
- 	add Rs3, Rs1, #(0x100 * 4 * 2);
-@@ -500,7 +513,7 @@ _gcry_cast5_arm_enc_blk2:
- 	 */
- 	push {%lr};
- 
--	ldr Rs1, =_gcry_cast5_s1to4;
-+	GET_DATA_POINTER(Rs1, _gcry_cast5_s1to4, Rs2);
- 	mov RMASK, #(0xff << 2);
- 	add Rs2, Rs1, #(0x100 * 4);
- 
-@@ -631,7 +644,7 @@ _gcry_cast5_arm_dec_blk2:
- 	 *	[RR0, RL0], [RR1, RL1]: dst
- 	 */
- 
--	ldr Rs1, =_gcry_cast5_s1to4;
-+	GET_DATA_POINTER(Rs1, _gcry_cast5_s1to4, Rs2);
- 	mov RMASK, #(0xff << 2);
- 	add Rs2, Rs1, #(0x100 * 4);
- 
-diff --git a/cipher/rijndael-arm.S b/cipher/rijndael-arm.S
-index 22c350c..421c3b4 100644
---- a/cipher/rijndael-arm.S
-+++ b/cipher/rijndael-arm.S
-@@ -28,6 +28,19 @@
- .syntax unified
- .arm
- 
-+#ifdef __PIC__
-+#  define GET_DATA_POINTER(reg, name, rtmp) \
-+		ldr reg, 1f; \
-+		ldr rtmp, 2f; \
-+		b 3f; \
-+	1:	.word _GLOBAL_OFFSET_TABLE_-(3f+8); \
-+	2:	.word name(GOT); \
-+	3:	add reg, pc, reg; \
-+		ldr reg, [reg, rtmp];
-+#else
-+#  define GET_DATA_POINTER(reg, name, rtmp) ldr reg, =name
-+#endif
-+
- /* register macros */
- #define CTX	%r0
- #define RTAB	%lr
-@@ -249,7 +262,7 @@ _gcry_aes_arm_encrypt_block:
- 2:
- 	sub	%sp, #16;
- 
--	ldr	RTAB, =.LtableE0;
-+	GET_DATA_POINTER(RTAB, .LtableE0, RMASK);
-
- 	str	%r1, [%sp, #4];		/* dst */
- 	mov	RMASK, #0xff;
-@@ -503,7 +516,7 @@ _gcry_aes_arm_decrypt_block:
- 2:
- 	sub	%sp, #16;
- 
--	ldr	RTAB, =.LtableD0;
-+	GET_DATA_POINTER(RTAB, .LtableD0, RMASK);
- 
- 	mov	RMASK, #0xff;
- 	str	%r1, [%sp, #4];		/* dst */
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb
deleted file mode 100644
index 903ed66..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libgcrypt.inc
-
-SRC_URI += "file://libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch"
-
-SRC_URI[md5sum] = "d155aa1b06fa879175922ba28f6a6509"
-SRC_URI[sha256sum] = "7c1007197bef49c3b8740cf6af8b4eb4eb74c7a69796ebcf555d928c287255de"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb
new file mode 100644
index 0000000..c49c0e7
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb
@@ -0,0 +1,4 @@
+require libgcrypt.inc
+
+SRC_URI[md5sum] = "d19adc062edff0ebc7e887212733ef1f"
+SRC_URI[sha256sum] = "936921644b9c81e2395e18a554a9a5f9252aae3976f8afc3e4229ee9d785e627"
-- 
1.8.3.1


