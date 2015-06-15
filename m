Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1108A737AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 20:34:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jun 2015 13:34:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,620,1427785200"; d="scan'208";a="743920846"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2015 13:34:48 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 23:34:46 +0300
Message-Id: <1434400486-21168-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssl: fix building on x32 systems
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
X-List-Received-Date: Mon, 15 Jun 2015 20:34:50 -0000

Fix build on Fedora 21 i686.

When building on x32 systems where the default type is 32bit,
make sure that 64bit integers can be represented transparently.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../openssl/openssl/openssl-1.0.2a-x32-asm.patch   | 45 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.2a-x32-asm.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-1.0.2a-x32-asm.patch b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.2a-x32-asm.patch
new file mode 100644
index 0000000..f603399
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.2a-x32-asm.patch
@@ -0,0 +1,45 @@
+https://rt.openssl.org/Ticket/Display.html?id=3759&user=guest&pass=guest
+
+From 6257d59b3a68d2feb9d64317a1c556dc3813ee61 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sat, 21 Mar 2015 06:01:25 -0400
+Subject: [PATCH] crypto: use bigint in x86-64 perl
+
+Upstream-Status: Pending
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
+---
+ crypto/perlasm/x86_64-xlate.pl | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/crypto/perlasm/x86_64-xlate.pl b/crypto/perlasm/x86_64-xlate.pl
+index aae8288..0bf9774 100755
+--- a/crypto/perlasm/x86_64-xlate.pl
++++ b/crypto/perlasm/x86_64-xlate.pl
+@@ -195,6 +195,10 @@ my %globals;
+     sub out {
+     	my $self = shift;
+ 
++	# When building on x32 ABIs, the expanded hex value might be too
++	# big to fit into 32bits.  Enable transparent 64bit support here
++	# so we can safely print it out.
++	use bigint;
+ 	if ($gas) {
+ 	    # Solaris /usr/ccs/bin/as can't handle multiplications
+ 	    # in $self->{value}
+-- 
+2.3.3
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
index f4006f6..d7f0259 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
             file://run-ptest \
             file://crypto_use_bigint_in_x86-64_perl.patch \
             file://0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch \
+            file://openssl-1.0.2a-x32-asm.patch \
            "
 
 SRC_URI[md5sum] = "a06c547dac9044161a477211049f60ef"
-- 
2.1.4


