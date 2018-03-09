Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 28D607892F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651884"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:01 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:45 +0200
Message-Id: <20180309185614.31113-7-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/36] openssl: drop openssl-1.0.2a-x32-asm.patch
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:01 -0000

The patch was applied in a completely incorrect spot (due to fuzz),
no one noticed or complained. Meanwhile upstream says the issue
has been resolved differently:
https://rt.openssl.org/Ticket/Display.html?id=3759&user=guest&pass=guest

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../openssl-1.0.2n/openssl-1.0.2a-x32-asm.patch    | 46 ----------------------
 .../recipes-connectivity/openssl/openssl_1.0.2n.bb |  1 -
 2 files changed, 47 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-1.0.2a-x32-asm.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-1.0.2a-x32-asm.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-1.0.2a-x32-asm.patch
deleted file mode 100644
index 1e5bfa17d67..00000000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-1.0.2a-x32-asm.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-https://rt.openssl.org/Ticket/Display.html?id=3759&user=guest&pass=guest
-
-From 6257d59b3a68d2feb9d64317a1c556dc3813ee61 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Sat, 21 Mar 2015 06:01:25 -0400
-Subject: [PATCH] crypto: use bigint in x86-64 perl
-
-Upstream-Status: Pending
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
-
-When building on x32 systems where the default type is 32bit, make sure
-we can transparently represent 64bit integers.  Otherwise we end up with
-build errors like:
-/usr/bin/perl asm/ghash-x86_64.pl elf > ghash-x86_64.s
-Integer overflow in hexadecimal number at asm/../../perlasm/x86_64-xlate.pl line 201, <> line 890.
-...
-ghash-x86_64.s: Assembler messages:
-ghash-x86_64.s:890: Error: junk '.15473355479995e+19' after expression
-
-We don't enable this globally as there are some cases where we'd get
-32bit values interpreted as unsigned when we need them as signed.
-
-Reported-by: Bertrand Jacquin <bertrand@jacquin.bzh>
-URL: https://bugs.gentoo.org/542618
----
- crypto/perlasm/x86_64-xlate.pl | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/crypto/perlasm/x86_64-xlate.pl b/crypto/perlasm/x86_64-xlate.pl
-index aae8288..0bf9774 100755
---- a/crypto/perlasm/x86_64-xlate.pl
-+++ b/crypto/perlasm/x86_64-xlate.pl
-@@ -195,6 +195,10 @@ my %globals;
-     sub out {
-     	my $self = shift;
- 
-+	# When building on x32 ABIs, the expanded hex value might be too
-+	# big to fit into 32bits.  Enable transparent 64bit support here
-+	# so we can safely print it out.
-+	use bigint;
- 	if ($gas) {
- 	    # Solaris /usr/ccs/bin/as can't handle multiplications
- 	    # in $self->{value}
--- 
-2.3.3
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
index 32444c60925..75e44bae9ff 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
@@ -34,7 +34,6 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
            file://openssl-fix-des.pod-error.patch \
            file://Makefiles-ptest.patch \
            file://ptest-deps.patch \
-           file://openssl-1.0.2a-x32-asm.patch \
            file://ptest_makefile_deps.patch \
            file://configure-musl-target.patch \
            file://parallel.patch \
-- 
2.16.1


