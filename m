Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
 by mx.groups.io with SMTP id smtpd.web08.8842.1624633235786589788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 08:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@synopsys.com header.s=mail header.b=SdM467fp;
 spf=pass (domain: synopsys.com, ip: 149.117.87.133, mailfrom: alexey.brodkin@synopsys.com)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 57D9CC0B9A;
	Fri, 25 Jun 2021 15:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1624633234; bh=8GMTcNbEfDjDLlQYFQLTegKn3AoW0EoX7YYbl42rmek=;
	h=From:To:Cc:Subject:Date:From;
	b=SdM467fpMW5o4vom3SAlll7AXMG4qD7PqZXXCeMkVQF4nfXEpEDYD+c+BUokX6WeN
	 Mt25TioeeSslClqpb2xeEMu56VSSyzMi0LWFUKOWE4MKMBCsBhuNgsA8ep9rGERPkF
	 y8/5XAMxWkQY+zxYz1KUUWGHcTP4+3+MTHsktg0hQ6DDZEEZ1Od5ngfm4Q6/dnMqk8
	 6m2lV+vAxTXRPk4GCWYmtityzMOI29P5Ec5nrl/aXxZNH55Z4DaZ1oO+Nhx4omKA1Y
	 i10NyGFC2hF2GoD4lcm6G21UqAL+lVYbGoOspesClXyqejX4VqU+AMdIX4XV8bkF8r
	 q8hLI0QexsoVg==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 28D9CA0063;
	Fri, 25 Jun 2021 15:00:32 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: "Alexey Brodkin" <abrodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] dpkg: Add ARC support
Date: Fri, 25 Jun 2021 08:00:24 -0700
Message-Id: <20210625150024.13548-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2

This back-ports ARC support which was added after the most recent
tag 1.20.9 was cut. So on the next version bump this change to be
reverted.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 .../dpkg/0014-arch-Add-support-for-ARCv2-CPU.patch | 68 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.20.9.bb          |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-support-for-ARCv2-CPU.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-support-for-ARCv2-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-support-for-ARCv2-CPU.patch
new file mode 100644
index 0000000000..ece18a33ac
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-support-for-ARCv2-CPU.patch
@@ -0,0 +1,68 @@
+From c6acfba64b470c7e919fd5bd29124d7228492537 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Fri, 28 May 2021 04:07:49 +0200
+Subject: [PATCH] arch: Add support for ARCv2 CPU
+
+This is based on the ARCv2 32-bit little-endian hard-float ISA.
+
+Closes: #980963
+
+Upstream-Status: Backport [https://salsa.debian.org/dpkg-team/dpkg/-/commit/0d134cdcb0dcc6b21fa7926964c1426a5821181d]
+
+Based-on-patch-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
+Signed-off-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
+---
+ data/cputable                  | 1 +
+ scripts/Dpkg/Shlibs/Objdump.pm | 1 +
+ scripts/t/Dpkg_Arch.t          | 4 ++--
+ 3 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/data/cputable b/data/cputable
+index 9f2a8e0e4..277bed88f 100644
+--- a/data/cputable
++++ b/data/cputable
+@@ -20,6 +20,7 @@ i386		i686		(i[34567]86|pentium)	32	little
+ ia64		ia64		ia64			64	little
+ alpha		alpha		alpha.*			64	little
+ amd64		x86_64		(amd64|x86_64)		64	little
++arc		arc		arc			32	little
+ armeb		armeb		arm.*b			32	big
+ arm		arm		arm.*			32	little
+ arm64		aarch64		aarch64			64	little
+diff --git a/scripts/Dpkg/Shlibs/Objdump.pm b/scripts/Dpkg/Shlibs/Objdump.pm
+index 4cee866e7..93319d1eb 100644
+--- a/scripts/Dpkg/Shlibs/Objdump.pm
++++ b/scripts/Dpkg/Shlibs/Objdump.pm
+@@ -100,6 +100,7 @@ use constant {
+     ELF_MACH_OR1K           => 92,
+     ELF_MACH_XTENSA         => 94,
+     ELF_MACH_MICROBLAZE     => 189,
++    ELF_MACH_ARCV2          => 195,
+     ELF_MACH_AVR_OLD        => 0x1057,
+     ELF_MACH_OR1K_OLD       => 0x8472,
+     ELF_MACH_ALPHA          => 0x9026,
+diff --git a/scripts/t/Dpkg_Arch.t b/scripts/t/Dpkg_Arch.t
+index a3a9e6fee..f0bba272a 100644
+--- a/scripts/t/Dpkg_Arch.t
++++ b/scripts/t/Dpkg_Arch.t
+@@ -16,7 +16,7 @@
+ use strict;
+ use warnings;
+ 
+-use Test::More tests => 16836;
++use Test::More tests => 18407;
+ 
+ use_ok('Dpkg::Arch', qw(debarch_to_debtuple debarch_to_multiarch
+                         debarch_eq debarch_is debarch_is_wildcard
+@@ -174,7 +174,7 @@ is(gnutriplet_to_debarch(undef), undef, 'undef gnutriplet');
+ is(gnutriplet_to_debarch('unknown-unknown-unknown'), undef, 'unknown gnutriplet');
+ is(gnutriplet_to_debarch('x86_64-linux-gnu'), 'amd64', 'known gnutriplet');
+ 
+-is(scalar get_valid_arches(), 539, 'expected amount of known architectures');
++is(scalar get_valid_arches(), 554, 'expected amount of known architectures');
+ 
+ {
+     local $ENV{CC} = 'false';
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
index 60ae3ff736..18ca0e310b 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.20.
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            file://0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch \
+           file://0014-arch-Add-support-for-ARCv2-CPU.patch \
            "
 
 SRC_URI_append_class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
-- 
2.16.2

