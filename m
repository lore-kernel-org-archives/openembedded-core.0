Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f170.google.com (mail-gg0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id E2692600AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 16:26:48 +0000 (UTC)
Received: by mail-gg0-f170.google.com with SMTP id l4so163820ggi.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=O9rac3asWASfu3oNO7zK/DT/mf1sHWSWpYBj/3Uh36k=;
	b=jSFs/sc1RQTc9/U7jROsTNXDok7r0JWLhItLtZ7GU8TQ7uL2Hl/Q6IWCnUDoLM+HWM
	hc0AFOwC5MiUrj1KbjDcyn8jamC2H5tOHf8H6uj/AZGSA0YKIAZOmF7BCzcHNh5dC3Ee
	b6mxnI1Iox9oit7auZ1CmjHziyYnmWyhwoK6Y2dFXD0NEynj56ivzvbMd1ddw4BRTssA
	OBZq6fI+fzoDzLjs2xFwwpyDesmx87w7g6FpdM2zlcG65Vas989v3Fupw4ch/No7arSP
	GB7H10pYIGqJ0ZkVr3RZ614RjJIIIhewbppnzzPGfb/or1Ln4cyVWGpjAP0JGhddTsT8
	dhcg==
X-Received: by 10.236.87.1 with SMTP id x1mr34144515yhe.51.1389716809461;
	Tue, 14 Jan 2014 08:26:49 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id o27sm1675536yhb.19.2014.01.14.08.26.47
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 14 Jan 2014 08:26:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 14:26:31 -0200
Message-Id: <1389716791-22080-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [for-dora][PATCH] gcc-4.8: Backport PR c++/57532 fix from 4.8.2
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
X-List-Received-Date: Tue, 14 Jan 2014 16:26:49 -0000

Bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57532

Log:
r200836 | jason | 2013-07-09 14:52:17 -0300 (Tue, 09 Jul 2013) | 3 lines

        PR c++/57532
        * parser.c (cp_parser_ref_qualifier_opt): Don't tentatively parse
        a ref-qualifier in C++98 mode.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
 .../gcc/gcc-4.8/0048-PR57532.patch                 |   36 ++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0048-PR57532.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 8d50bf7..b34c7ae 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -77,6 +77,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
 	   file://0046-libatomic-deptracking.patch \
 	   file://0047-repomembug.patch \
+	   file://0048-PR57532.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0048-PR57532.patch b/meta/recipes-devtools/gcc/gcc-4.8/0048-PR57532.patch
new file mode 100644
index 0000000..4a05d33
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0048-PR57532.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Backport
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+r200836 | jason | 2013-07-09 14:52:17 -0300 (Tue, 09 Jul 2013) | 3 lines
+
+        PR c++/57532
+        * parser.c (cp_parser_ref_qualifier_opt): Don't tentatively parse
+        a ref-qualifier in C++98 mode.
+
+Index: gcc/testsuite/g++.dg/parse/ref-qual2.C
+===================================================================
+--- a/gcc/testsuite/g++.dg/parse/ref-qual2.C	(revision 0)
++++ b/gcc/testsuite/g++.dg/parse/ref-qual2.C	(revision 200836)
+@@ -0,0 +1,6 @@
++// PR c++/57532
++
++int main()
++{
++    return (int() & int());
++}
+Index: gcc/cp/parser.c
+===================================================================
+--- a/gcc/cp/parser.c	(revision 200835)
++++ b/gcc/cp/parser.c	(revision 200836)
+@@ -16986,6 +16986,11 @@
+ {
+   cp_ref_qualifier ref_qual = REF_QUAL_NONE;
+   cp_token *token = cp_lexer_peek_token (parser->lexer);
++
++  /* Don't try to parse bitwise '&' as a ref-qualifier (c++/57532).  */
++  if (cxx_dialect < cxx11 && cp_parser_parsing_tentatively (parser))
++    return ref_qual;
++
+   switch (token->type)
+     {
+     case CPP_AND:
-- 
1.7.10.4


