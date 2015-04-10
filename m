Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id C17D36E277
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 17:45:32 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so29363926pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 10:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YHplpQctPWZvC4az0Tjtc5aB2B5F2t0SPh8QRmVXvXE=;
	b=Est7OJPR83Qk5bbKnH7UMdt9PLp7nv3ynPyrvy9wK+X19xELjIag6t0JUacYBgSqPs
	vH2oiYUvpq+X46DsiG9wJoY8BfkULS3jO+BlqC9rS4JGaPBPkGMQgZvXST4NTA2R/VYG
	FL9f+sKWBtPZHPRqyDvPiTZEFI4ISKiu7jDqkmVG7MkRnTdBfBRlsF+oeet3hoa/W5vs
	FrY5a1toDwmBpM/bsYRFjXFEzkQjTBiNX2G0n8H4bx76PP25KT6jrgQDSSZ1PfwdZtHL
	XxShlOh0fC+ov6HMzETdvY9/627EzDmF0BvNYdck5hZ0QoxVW/QBhaY6ZZnOiFjQHuXw
	3p6g==
X-Received: by 10.66.129.174 with SMTP id nx14mr4623899pab.12.1428687932755;
	Fri, 10 Apr 2015 10:45:32 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id yy2sm2894820pbb.6.2015.04.10.10.45.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 10:45:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 10:45:20 -0700
Message-Id: <1428687920-21172-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] crypto: use bigint in x86-64 perl
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
X-List-Received-Date: Fri, 10 Apr 2015 17:45:36 -0000

From: Armin Kuster <akuster@mvista.com>

on some hosts openssl fails to build with this error:

ghash-x86_64.s: Assembler messages:
ghash-x86_64.s:890: Error: junk '.15473355479995e+19' after expression

backported fix from community.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssl/crypto_use_bigint_in_x86-64_perl.patch | 35 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch b/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
new file mode 100644
index 0000000..c397af2
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
@@ -0,0 +1,35 @@
+Upsteram Status: Backport
+
+When building on x32 systems where the default type is 32bit, make sure
+we can transparently represent 64bit integers.  Otherwise we end up with
+build errors like:
+/usr/bin/perl asm/ghash-x86_64.pl elf > ghash-x86_64.s
+Integer overflow in hexadecimal number at asm/../../perlasm/x86_64-xlate.pl line 201, <> line 890.
+...
+ghash-x86_64.s: Assembler messages:
+ghash-x86_64.s:890: Error: junk '.15473355479995e+19' after expression
+
+We don't enable this globally as there are some cases where we'd get
+32bit values interpreted as unsigned when we need them as signed.
+
+Reported-by: Bertrand Jacquin <bertrand@jacquin.bzh>
+URL: https://bugs.gentoo.org/542618
+
+Signed-off-By: Armin Kuster <akuster@mvista.com>
+
+Index: openssl-1.0.2a/crypto/perlasm/x86_64-xlate.pl
+===================================================================
+--- openssl-1.0.2a.orig/crypto/perlasm/x86_64-xlate.pl
++++ openssl-1.0.2a/crypto/perlasm/x86_64-xlate.pl
+@@ -194,7 +194,10 @@ my %globals;
+     }
+     sub out {
+     	my $self = shift;
+-
++	# When building on x32 ABIs, the expanded hex value might be too
++	# big to fit into 32bits. Enable transparent 64bit support here
++	# so we can safely print it out.
++	use bigint;
+ 	if ($gas) {
+ 	    # Solaris /usr/ccs/bin/as can't handle multiplications
+ 	    # in $self->{value}
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
index 74d6938..9a218be 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://configure-targets.patch \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
             file://run-ptest \
+            file://crypto_use_bigint_in_x86-64_perl.patch \
            "
 
 SRC_URI[md5sum] = "a06c547dac9044161a477211049f60ef"
-- 
2.3.5


