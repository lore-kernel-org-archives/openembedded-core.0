Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id EFC1D6A543
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 11:41:16 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r5DBfEP2004938; 
	Thu, 13 Jun 2013 06:41:16 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 16:41:20 +0500
Message-Id: <1371123680-19570-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] openssl: Add fix for cipher des-ede3-cfb1
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
X-List-Received-Date: Thu, 13 Jun 2013 11:41:17 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Add patch file for one of the ciphers used in openssl, namely the cipher
des-ede3-cfb1. Details of the bug, without this patch, can be found here.
http://rt.openssl.org/Ticket/Display.html?id=2867

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch  |   22 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |    1 +
 2 files changed, 23 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch
new file mode 100644
index 0000000..cce20c6
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Submitted
+
+This patch adds the fix for one of the ciphers used in openssl, namely
+the cipher des-ede3-cfb1. Complete bug log and patch is present here:
+http://rt.openssl.org/Ticket/Display.html?id=2867
+
+Signed-Off-By: Muhammad Shakeel <muhammad_shakeel@mentor.com>
+
+diff --git a/crypto/evp/e_des3.c b/crypto/evp/e_des3.c
+index 3232cfe..df84922 100644
+===================================================================
+--- a/crypto/evp/e_des3.c
++++ b/crypto/evp/e_des3.c
+@@ -173,7 +173,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPHER_CTX *ctx, unsigned char *out,
+     size_t n;
+     unsigned char c[1],d[1];
+ 
+-    for(n=0 ; n < inl ; ++n)
++    for(n=0 ; n < inl*8 ; ++n)
+ 	{
+ 	c[0]=(in[n/8]&(1 << (7-n%8))) ? 0x80 : 0;
+ 	DES_ede3_cfb_encrypt(c,d,1,1,
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 47c13a4..47b104d 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://configure-targets.patch \
             file://debian/debian-targets.patch \
             file://openssl_fix_for_x32.patch \
             file://find.pl \
+            file://fix-cipher-des-ede3-cfb1.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.7.9.5


