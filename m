Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 198CC737AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 18:13:00 +0000 (UTC)
Received: by oiyy130 with SMTP id y130so249098oiy.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 11:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xbFG526MsmNYmjjsd0iDAGzITOKakqu0TFQQIVpb3SI=;
	b=C2SMOPPdGZ01vPFgdEflHpTsJ9Az4q0uqBSqqtXauUgWHriK1Sq9VZEa3tpSoPgNzq
	Nv3pWYurmj5dHuKiCqysvqhbuWCIkfWvZtEwRD7Y8RPVCBGJOZjuhp32PDCaGhKRsT3D
	eBxdfJgbQ8kjIYcQcX1OuHC3J+RhAK9A3Wu6IqI+203Y9oVPCCDFpv+QqS013KT/a3yo
	vYZ/Ii/JH2XC/JMpF9v6CrCk0UYCNM/fvPWYLH1fV38NB3S2BZU1VQWpmGMBtHZCA4iS
	pGPGvjBliZ1+LaMMdMy44YUf4dRBITvYe9riMdBuYnkq+hFn9leiIEeCLcMv82DiA8xa
	pjiw==
X-Received: by 10.182.213.37 with SMTP id np5mr1304529obc.42.1434478381869;
	Tue, 16 Jun 2015 11:13:01 -0700 (PDT)
Received: from george-i7.localdomain (mail.novatech-llc.com. [64.126.95.172])
	by mx.google.com with ESMTPSA id
	v145sm837203oie.17.2015.06.16.11.13.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jun 2015 11:13:01 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 13:12:34 -0500
Message-Id: <1434478354-13409-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.3
Cc: martin.stolpe@gmail.com
Subject: [PATCH][fido] binutils: fix native builds when host has gcc5
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
X-List-Received-Date: Tue, 16 Jun 2015 18:13:01 -0000

Cherry pick upstream commit to fix -Werror=logical-not-parentheses error
when building with native gcc5.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.24.inc   |  1 +
 ...86.c-Werror-logical-not-parentheses-error.patch | 76 ++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc b/meta/recipes-devtools/binutils/binutils-2.24.inc
index 63c9287..2fb56eb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.24.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
@@ -40,6 +40,7 @@ SRC_URI = "\
      file://binutils_CVE-2014-8503.patch \
      file://binutils_CVE-2014-8504.patch \
      file://binutils_CVE-2014-8737.patch \
+     file://Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch \
      "
 
 SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
diff --git a/meta/recipes-devtools/binutils/binutils/Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch b/meta/recipes-devtools/binutils/binutils/Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch
new file mode 100644
index 0000000..0511c39
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch
@@ -0,0 +1,76 @@
+From 360ddc990a941bc506576f45a3858d38f508410b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 12 Sep 2014 09:46:30 +0930
+Subject: [PATCH] Fix tc-i386.c -Werror=logical-not-parentheses error
+
+	* config/tc-i386.c (match_template): Remove redundant "!!" testing
+	single-bit bitfields.
+	(build_modrm_byte): Don't compare single-bit bitfields to "1".
+
+Upstream commit:
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=ac4eb736520174305bf6e691827f7473b858cff1
+
+Manually resolved gas/ChangeLog conflict by placing the change at the
+top of the file.
+gas/config/tc-i386.c patched with offset
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+---
+ gas/ChangeLog        |  6 ++++++
+ gas/config/tc-i386.c | 12 ++++++------
+ 2 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/gas/ChangeLog b/gas/ChangeLog
+index 7fafa26..c6e60c9 100644
+--- a/gas/ChangeLog
++++ b/gas/ChangeLog
+@@ -1,3 +1,9 @@
++2014-09-12  Alan Modra  <amodra@gmail.com>
++
++	* config/tc-i386.c (match_template): Remove redundant "!!" testing
++	single-bit bitfields.
++	(build_modrm_byte): Don't compare single-bit bitfields to "1".
++
+ 2013-11-18  H.J. Lu  <hongjiu.lu@intel.com>
+ 
+ 	* config/tc-i386.c (lex_got): Add a dummy "int bnd_prefix"
+diff --git a/gas/config/tc-i386.c b/gas/config/tc-i386.c
+index 3c423da..4464091 100644
+--- a/gas/config/tc-i386.c
++++ b/gas/config/tc-i386.c
+@@ -4672,9 +4672,9 @@ match_template (void)
+ 	       && !operand_types[0].bitfield.regymm
+ 	       && !operand_types[0].bitfield.regzmm)
+ 	      || (!operand_types[t->operands > 1].bitfield.regmmx
+-		  && !!operand_types[t->operands > 1].bitfield.regxmm
+-		  && !!operand_types[t->operands > 1].bitfield.regymm
+-		  && !!operand_types[t->operands > 1].bitfield.regzmm))
++		  && operand_types[t->operands > 1].bitfield.regxmm
++		  && operand_types[t->operands > 1].bitfield.regymm
++		  && operand_types[t->operands > 1].bitfield.regzmm))
+ 	  && (t->base_opcode != 0x0fc7
+ 	      || t->extension_opcode != 1 /* cmpxchg8b */))
+ 	continue;
+@@ -4689,7 +4689,7 @@ match_template (void)
+ 	       && ((!operand_types[0].bitfield.regmmx
+ 		    && !operand_types[0].bitfield.regxmm)
+ 		   || (!operand_types[t->operands > 1].bitfield.regmmx
+-		       && !!operand_types[t->operands > 1].bitfield.regxmm)))
++		       && operand_types[t->operands > 1].bitfield.regxmm)))
+ 	continue;
+ 
+       /* Do not verify operands when there are none.  */
+@@ -6139,8 +6139,8 @@ build_modrm_byte (void)
+ 	      op = i.tm.operand_types[vvvv];
+ 	      op.bitfield.regmem = 0;
+ 	      if ((dest + 1) >= i.operands
+-		  || (op.bitfield.reg32 != 1
+-		      && !op.bitfield.reg64 != 1
++		  || (!op.bitfield.reg32
++		      && op.bitfield.reg64
+ 		      && !operand_type_equal (&op, &regxmm)
+ 		      && !operand_type_equal (&op, &regymm)
+ 		      && !operand_type_equal (&op, &regzmm)
+-- 
+2.4.3
+
-- 
2.4.3


