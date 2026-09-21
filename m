Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0D2C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:02:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46651.1789988550127990210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gba2wTQV;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00DDF1570
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 04:02:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 294F63F86C
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988549; bh=k6iDpQrVC2jXu8o6H86lj8jGONNs84BLvbSEYPsFbsg=;
	h=From:To:Subject:Date:From;
	b=gba2wTQV6UliDrG3WaJgWr2cg3sCKkKVj+Nm9rZi5sseTeO5g2o1ClCLmf1TxTBFD
	 XTaCJXURD3Z4eBgU7or96U7adMaJcA+YZ/B6C0WxgYhOMGGSPzWusuW7Z5f0Tt7eR8
	 HxLdhNMzpNwGkdpojitb0DpJeYruuLrSvj4yDOnQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: fix check for working assembler --gdwarf-4 option
Date: Mon, 21 Sep 2026 12:02:25 +0100
Message-ID: <20260921110225.1030155-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 11:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246325

The test never worked on 32-bit arm platforms, which unlike most other
platforms don't have an explicit 'ret' instruction.

This fixes the configure script from:

  checking assembler for --gdwarf-5 option... yes
  checking assembler for --gdwarf-4 not refusing compiler generated .debu=
g_line... yes
  checking assembler for --gdwarf-4 with the APP marker... no
  checking whether -gdwarf-5 is supported... yes

to:

  checking assembler for --gdwarf-5 option... yes
  checking assembler for --gdwarf-4 not refusing compiler generated .debu=
g_line... yes
  checking assembler for --gdwarf-4 with the APP marker... yes
  checking assembler for working --gdwarf-4/--gdwarf-5 for all sources...=
 yes
  checking whether -gdwarf-5 is supported... yes

This means the bulk of the DWARF information in 32-bit arm binaries is
now DWARF v5 (as it is with most other platforms) instead of DWARF v3.

For example, from master:

$ readelf -w busybox.suid | grep 'DWARF Version' | sort | uniq -c
     76   DWARF Version:               3
      5   DWARF Version:               5

But with this fix:

$ readelf -w busybox.suid | grep 'DWARF Version' | sort | uniq -c
      1   DWARF Version:               3
     80   DWARF Version:               5

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |  1 +
 ...or-working-assembler-gdwarf-4-option.patch | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-Fix-check-for-work=
ing-assembler-gdwarf-4-option.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-16.2.inc
index 790bf7b651e..818dea8ac5a 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -73,6 +73,7 @@ SRC_URI =3D "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
+           file://0001-Fix-check-for-working-assembler-gdwarf-4-option.p=
atch \
 "
=20
 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0001-Fix-check-for-working-ass=
embler-gdwarf-4-option.patch b/meta/recipes-devtools/gcc/gcc/0001-Fix-che=
ck-for-working-assembler-gdwarf-4-option.patch
new file mode 100644
index 00000000000..e558c911cf1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-Fix-check-for-working-assembler-=
gdwarf-4-option.patch
@@ -0,0 +1,50 @@
+From 333f149e218bc2b5e4f601443fcc8fe572d048b1 Mon Sep 17 00:00:00 2001
+From: Christophe Lyon <christophe.lyon@arm.com>
+Date: Fri, 18 Sep 2026 15:58:02 +0200
+Subject: [PATCH] Fix check for working assembler --gdwarf-4 option
+
+The code fragment used to check for --gdwarf-4 option with the APP
+marker ends with a hard-coded 'ret' instruction, which is not supported
+by all architectures (e.g. arm).  Replace it with $insn.
+
+gcc/ChangeLog:
+
+	* configure.ac: Replace 'ret' with '$insn'.
+	* configure: Regenerate.
+
+Upstream-Status: Backport [gcc 316c6dddbb4858c2c34b58b3bddc6b85923d2799]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ gcc/configure    | 2 +-
+ gcc/configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/configure b/gcc/configure
+index 4a90e86ed9f..4c45f8e7376 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -32340,7 +32340,7 @@ foo:
+ 	.file 1 \"foo.c\"
+ 	$insn
+ 	.file 2 \"foo.h\"
+-	ret
++	$insn
+ "
+    dwarf4_success=3Dno
+    { $as_echo "$as_me:${as_lineno-$LINENO}: checking assembler for --gd=
warf-4 with the APP marker" >&5
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index abf5e4f4e7e..ca6d098b501 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -5914,7 +5914,7 @@ foo:
+ 	.file 1 \"foo.c\"
+ 	$insn
+ 	.file 2 \"foo.h\"
+-	ret
++	$insn
+ "
+    dwarf4_success=3Dno
+    gcc_GAS_CHECK_FEATURE([--gdwarf-4 with the APP marker],
+--=20
+2.43.0
+
--=20
2.43.0


