Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DAF7A6FC4C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 10:16:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8FAG1Vi029653
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 03:16:02 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Sep 2014 03:16:01 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Sep 2014 06:16:00 -0400
Message-ID: <1410776160-23885-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] libgcrypt: Fix ARM assembly when building __PIC__
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
X-List-Received-Date: Mon, 15 Sep 2014 10:16:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

libgcrypt.so.20 contains .text relocations, backport a patch
to fix it.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...ibgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch |  169 ++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb  |    2 +
 2 files changed, 171 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch

diff --git a/meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch b/meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch
new file mode 100644
index 0000000..3400872
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch
@@ -0,0 +1,169 @@
+Fix ARM assembly when building __PIC__
+
+* cipher/camellia-arm.S (GET_DATA_POINTER): New.
+(_gcry_camellia_arm_encrypt_block): Use GET_DATA_POINTER.
+(_gcry_camellia_arm_decrypt_block): Ditto.
+* cipher/cast5-arm.S (GET_DATA_POINTER): New.
+(_gcry_cast5_arm_encrypt_block, _gcry_cast5_arm_decrypt_block)
+(_gcry_cast5_arm_enc_blk2, _gcry_cast5_arm_dec_blk2): Use
+GET_DATA_POINTER.
+* cipher/rijndael-arm.S (GET_DATA_POINTER): New.
+(_gcry_aes_arm_encrypt_block, _gcry_aes_arm_decrypt_block): Use
+GET_DATA_POINTER.
+--
+
+Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ cipher/camellia-arm.S |   17 +++++++++++++++--
+ cipher/cast5-arm.S    |   21 +++++++++++++++++----
+ cipher/rijndael-arm.S |   17 +++++++++++++++--
+ 3 files changed, 47 insertions(+), 8 deletions(-)
+
+diff --git a/cipher/camellia-arm.S b/cipher/camellia-arm.S
+index c30d194..cdeaf8b 100644
+--- a/cipher/camellia-arm.S
++++ b/cipher/camellia-arm.S
+@@ -28,6 +28,19 @@
+ .syntax unified
+ .arm
+ 
++#ifdef __PIC__
++#  define GET_DATA_POINTER(reg, name, rtmp) \
++		ldr reg, 1f; \
++		ldr rtmp, 2f; \
++		b 3f; \
++	1:	.word _GLOBAL_OFFSET_TABLE_-(3f+8); \
++	2:	.word name(GOT); \
++	3:	add reg, pc, reg; \
++		ldr reg, [reg, rtmp];
++#else
++#  define GET_DATA_POINTER(reg, name, rtmp) ldr reg, =name
++#endif
++
+ /* struct camellia_ctx: */
+ #define key_table 0
+ 
+@@ -261,7 +274,7 @@ _gcry_camellia_arm_encrypt_block:
+ 	 */
+ 	push {%r1, %r4-%r11, %ip, %lr};
+ 
+-	ldr RTAB1, =.Lcamellia_sp1110;
++	GET_DATA_POINTER(RTAB1, .Lcamellia_sp1110, RTAB3);
+ 	mov RMASK, #0xff;
+ 	add RTAB3, RTAB1, #(2 * 4);
+ 	push {%r3};
+@@ -309,7 +322,7 @@ _gcry_camellia_arm_decrypt_block:
+ 	 */
+ 	push {%r1, %r4-%r11, %ip, %lr};
+ 
+-	ldr RTAB1, =.Lcamellia_sp1110;
++	GET_DATA_POINTER(RTAB1, .Lcamellia_sp1110, RTAB3);
+ 	mov RMASK, #0xff;
+ 	add RTAB3, RTAB1, #(2 * 4);
+ 	mov RMASK, RMASK, lsl#4 /* byte mask */
+diff --git a/cipher/cast5-arm.S b/cipher/cast5-arm.S
+index ce7fa93..db96db4 100644
+--- a/cipher/cast5-arm.S
++++ b/cipher/cast5-arm.S
+@@ -30,6 +30,19 @@
+ 
+ .extern _gcry_cast5_s1to4;
+ 
++#ifdef __PIC__
++#  define GET_DATA_POINTER(reg, name, rtmp) \
++		ldr reg, 1f; \
++		ldr rtmp, 2f; \
++		b 3f; \
++	1:	.word _GLOBAL_OFFSET_TABLE_-(3f+8); \
++	2:	.word name(GOT); \
++	3:	add reg, pc, reg; \
++		ldr reg, [reg, rtmp];
++#else
++#  define GET_DATA_POINTER(reg, name, rtmp) ldr reg, =name
++#endif
++
+ /* structure of crypto context */
+ #define Km 0
+ #define Kr (Km + (16 * 4))
+@@ -260,7 +273,7 @@ _gcry_cast5_arm_encrypt_block:
+ 	 */
+ 	push {%r1, %r4-%r11, %ip, %lr};
+ 
+-	ldr Rs1, =_gcry_cast5_s1to4;
++	GET_DATA_POINTER(Rs1, _gcry_cast5_s1to4, Rs2);
+ 	mov RMASK, #(0xff << 2);
+ 	add Rs2, Rs1, #(0x100*4);
+ 	add Rs3, Rs1, #(0x100*4*2);
+@@ -306,7 +319,7 @@ _gcry_cast5_arm_decrypt_block:
+ 	 */
+ 	push {%r1, %r4-%r11, %ip, %lr};
+ 
+-	ldr Rs1, =_gcry_cast5_s1to4;
++	GET_DATA_POINTER(Rs1, _gcry_cast5_s1to4, Rs2);
+ 	mov RMASK, #(0xff << 2);
+ 	add Rs2, Rs1, #(0x100 * 4);
+ 	add Rs3, Rs1, #(0x100 * 4 * 2);
+@@ -500,7 +513,7 @@ _gcry_cast5_arm_enc_blk2:
+ 	 */
+ 	push {%lr};
+ 
+-	ldr Rs1, =_gcry_cast5_s1to4;
++	GET_DATA_POINTER(Rs1, _gcry_cast5_s1to4, Rs2);
+ 	mov RMASK, #(0xff << 2);
+ 	add Rs2, Rs1, #(0x100 * 4);
+ 
+@@ -631,7 +644,7 @@ _gcry_cast5_arm_dec_blk2:
+ 	 *	[RR0, RL0], [RR1, RL1]: dst
+ 	 */
+ 
+-	ldr Rs1, =_gcry_cast5_s1to4;
++	GET_DATA_POINTER(Rs1, _gcry_cast5_s1to4, Rs2);
+ 	mov RMASK, #(0xff << 2);
+ 	add Rs2, Rs1, #(0x100 * 4);
+ 
+diff --git a/cipher/rijndael-arm.S b/cipher/rijndael-arm.S
+index 22c350c..421c3b4 100644
+--- a/cipher/rijndael-arm.S
++++ b/cipher/rijndael-arm.S
+@@ -28,6 +28,19 @@
+ .syntax unified
+ .arm
+ 
++#ifdef __PIC__
++#  define GET_DATA_POINTER(reg, name, rtmp) \
++		ldr reg, 1f; \
++		ldr rtmp, 2f; \
++		b 3f; \
++	1:	.word _GLOBAL_OFFSET_TABLE_-(3f+8); \
++	2:	.word name(GOT); \
++	3:	add reg, pc, reg; \
++		ldr reg, [reg, rtmp];
++#else
++#  define GET_DATA_POINTER(reg, name, rtmp) ldr reg, =name
++#endif
++
+ /* register macros */
+ #define CTX	%r0
+ #define RTAB	%lr
+@@ -249,7 +262,7 @@ _gcry_aes_arm_encrypt_block:
+ 2:
+ 	sub	%sp, #16;
+ 
+-	ldr	RTAB, =.LtableE0;
++	GET_DATA_POINTER(RTAB, .LtableE0, RMASK);
+
+ 	str	%r1, [%sp, #4];		/* dst */
+ 	mov	RMASK, #0xff;
+@@ -503,7 +516,7 @@ _gcry_aes_arm_decrypt_block:
+ 2:
+ 	sub	%sp, #16;
+ 
+-	ldr	RTAB, =.LtableD0;
++	GET_DATA_POINTER(RTAB, .LtableD0, RMASK);
+ 
+ 	mov	RMASK, #0xff;
+ 	str	%r1, [%sp, #4];		/* dst */
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb
index 1657ea4..903ed66 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb
@@ -1,4 +1,6 @@
 require libgcrypt.inc
 
+SRC_URI += "file://libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch"
+
 SRC_URI[md5sum] = "d155aa1b06fa879175922ba28f6a6509"
 SRC_URI[sha256sum] = "7c1007197bef49c3b8740cf6af8b4eb4eb74c7a69796ebcf555d928c287255de"
-- 
1.7.1


