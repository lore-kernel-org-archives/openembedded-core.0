Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBAC606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 01:48:00 +0000 (UTC)
Received: by pfdd184 with SMTP id d184so3236204pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 17:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Wyr2MFjNmSdnU71HcjfRodi2h4enHwBoY3CIaQ3LS3A=;
	b=SdoaYB2sHWOKlTg++I6ncXZVRr4edVqjjOTh220040p1SMZp8sImTOHwPsiKm3R68d
	Bdayt0u3aEqCOXJukeuKDDO9taA+oTFbO8WxdesBs1bhjuMvBFKHhQD0cRI1CpPlg6Ie
	+ITBmSSE7ZMGzm3fqJ0WOZBlUG7vsIkMY+48ojYWQXGaez/qcHuX4KKeLvvXOuTtXkat
	jWqnAFR1FXw2jZbQXHJxWVBXVZArVJFCH6MYZplVS1W5I/EBd1uCIYprQJDyuOe9ypU7
	ClwZnX76HXqJD+rg6iDn54ghuoE3J7lByztD4nUtx7k6WH879/LbBpBvlsvvfhcES0sT
	DT+A==
X-Received: by 10.98.86.132 with SMTP id h4mr1240285pfj.121.1449539281753;
	Mon, 07 Dec 2015 17:48:01 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	cc16sm605285pac.44.2015.12.07.17.48.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Dec 2015 17:48:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 17:47:55 -0800
Message-Id: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [jethro][fido][PATCH 1/4] openssl: fix for CVE-2015-3193
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
X-List-Received-Date: Tue, 08 Dec 2015 01:48:02 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
new file mode 100644
index 0000000..125016a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
@@ -0,0 +1,101 @@
+From d73cc256c8e256c32ed959456101b73ba9842f72 Mon Sep 17 00:00:00 2001
+From: Andy Polyakov <appro@openssl.org>
+Date: Tue, 1 Dec 2015 09:00:32 +0100
+Subject: [PATCH] bn/asm/x86_64-mont5.pl: fix carry propagating bug
+ (CVE-2015-3193).
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+(cherry picked from commit e7c078db57908cbf16074c68034977565ffaf107)
+
+Upstream-Status: Backport
+
+This patch was imported from 
+https://git.openssl.org/?p=openssl.git;a=commit;h=d73cc256c8e256c32ed959456101b73ba9842f72
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ crypto/bn/asm/x86_64-mont5.pl | 22 +++++++++++++++++++---
+ crypto/bn/bntest.c            | 18 ++++++++++++++++++
+ 2 files changed, 37 insertions(+), 3 deletions(-)
+
+Index: openssl-1.0.2d/crypto/bn/asm/x86_64-mont5.pl
+===================================================================
+--- openssl-1.0.2d.orig/crypto/bn/asm/x86_64-mont5.pl
++++ openssl-1.0.2d/crypto/bn/asm/x86_64-mont5.pl
+@@ -1779,6 +1779,15 @@ sqr8x_reduction:
+ .align	32
+ .L8x_tail_done:
+ 	add	(%rdx),%r8		# can this overflow?
++	adc	\$0,%r9
++	adc	\$0,%r10
++	adc	\$0,%r11
++	adc	\$0,%r12
++	adc	\$0,%r13
++	adc	\$0,%r14
++	adc	\$0,%r15		# can't overflow, because we
++					# started with "overhung" part
++					# of multiplication
+ 	xor	%rax,%rax
+ 
+ 	neg	$carry
+@@ -3125,6 +3134,15 @@ sqrx8x_reduction:
+ .align	32
+ .Lsqrx8x_tail_done:
+ 	add	24+8(%rsp),%r8		# can this overflow?
++	adc	\$0,%r9
++	adc	\$0,%r10
++	adc	\$0,%r11
++	adc	\$0,%r12
++	adc	\$0,%r13
++	adc	\$0,%r14
++	adc	\$0,%r15		# can't overflow, because we
++					# started with "overhung" part
++					# of multiplication
+ 	mov	$carry,%rax		# xor	%rax,%rax
+ 
+ 	sub	16+8(%rsp),$carry	# mov 16(%rsp),%cf
+@@ -3168,13 +3186,11 @@ my ($rptr,$nptr)=("%rdx","%rbp");
+ my @ri=map("%r$_",(10..13));
+ my @ni=map("%r$_",(14..15));
+ $code.=<<___;
+-	xor	%rbx,%rbx
++	xor	%ebx,%ebx
+ 	sub	%r15,%rsi		# compare top-most words
+ 	adc	%rbx,%rbx
+ 	mov	%rcx,%r10		# -$num
+-	.byte	0x67
+ 	or	%rbx,%rax
+-	.byte	0x67
+ 	mov	%rcx,%r9		# -$num
+ 	xor	\$1,%rax
+ 	sar	\$3+2,%rcx		# cf=0
+Index: openssl-1.0.2d/crypto/bn/bntest.c
+===================================================================
+--- openssl-1.0.2d.orig/crypto/bn/bntest.c
++++ openssl-1.0.2d/crypto/bn/bntest.c
+@@ -1027,6 +1027,24 @@ int test_mod_exp_mont_consttime(BIO *bp,
+             return 0;
+         }
+     }
++
++    /* Regression test for carry propagation bug in sqr8x_reduction */
++    BN_hex2bn(&a, "050505050505");
++    BN_hex2bn(&b, "02");
++    BN_hex2bn(&c,
++        "4141414141414141414141274141414141414141414141414141414141414141"
++        "4141414141414141414141414141414141414141414141414141414141414141"
++        "4141414141414141414141800000000000000000000000000000000000000000"
++        "0000000000000000000000000000000000000000000000000000000000000000"
++        "0000000000000000000000000000000000000000000000000000000000000000"
++        "0000000000000000000000000000000000000000000000000000000001");
++    BN_mod_exp(d, a, b, c, ctx);
++    BN_mul(e, a, a, ctx);
++    if (BN_cmp(d, e)) {
++        fprintf(stderr, "BN_mod_exp and BN_mul produce different results!\n");
++        return 0;
++    }
++
+     BN_free(a);
+     BN_free(b);
+     BN_free(c);
-- 
2.3.5


