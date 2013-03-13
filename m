Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UFgmP-00012D-Pm
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 09:11:40 +0100
Received: from mail8-co9-R.bigfish.com (10.236.132.236) by
	CO9EHSOBE040.bigfish.com (10.236.130.103) with Microsoft SMTP Server id
	14.1.225.23; Wed, 13 Mar 2013 07:39:36 +0000
Received: from mail8-co9 (localhost [127.0.0.1])	by mail8-co9-R.bigfish.com
	(Postfix) with ESMTP id 4F5F6C801F5	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 07:39:36 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz177df4h17326ah8275dh8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail8-co9 (localhost.localdomain [127.0.0.1]) by mail8-co9
	(MessageSwitch) id 1363160374188570_31346;
	Wed, 13 Mar 2013 07:39:34 +0000 (UTC)
Received: from CO9EHSMHS007.bigfish.com (unknown [10.236.132.253])	by
	mail8-co9.bigfish.com (Postfix) with ESMTP id 22919680050	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 07:39:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS007.bigfish.com
	(10.236.130.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 13 Mar 2013 07:39:33 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 13 Mar 2013 07:39:32 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r2D7dTPI009053;
	Wed, 13 Mar 2013 00:39:30 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Mar 2013 15:43:04 +0800
Message-ID: <1363160584-9136-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: binutils: fix ineffectual zero of cache and array bounds issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 08:11:48 -0000
X-List-Received-Date: Wed, 13 Mar 2013 08:11:48 -0000
Content-Type: text/plain

binutils build fails on Fedora18+:
1. binutils-2.23.1/bfd/elf32-xtensa.c:6078:36: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
       memset (sec_cache, 0, sizeof (sec_cache));
                                    ^
2. binutils-2.23.1/bfd/elf32-xtensa.c:6120:32: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
   memset (sec_cache, 0, sizeof (sec_cache));
                                ^
3. binutils-2.23.1/opcodes/arc-dis.c:430:13: error: argument to 'sizeof' in '__builtin_strncat' call is the same expression as the destination; did you mean to provide an explicit length? [-Werror=sizeof-pointer-memaccess]
       sizeof (state->commentBuffer));
              ^
4. binutils-2.23.1/opcodes/rl78-dis.c:230:13: error: array subscript is above array bounds [-Werror=array-bounds]
      if (oper->use_es && indirect_type (oper->type))
              ^

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/recipes-devtools/binutils/binutils-2.23.1.inc |  5 +-
 .../binutils-fix-ineffectual-zero-of-cache.patch   | 60 ++++++++++++++++++++++
 .../binutils-replace-strncat-with-strcat.patch     | 26 ++++++++++
 .../binutils-fix-over-array-bounds-issue.patch     | 20 ++++++++
 4 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-fix-ineffectual-zero-of-cache.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-replace-strncat-with-strcat.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-fix-over-array-bounds-issue.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1.inc b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
index 15811d7..4523407 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -28,6 +28,7 @@ SRC_URI = "\
      file://binutils-armv5e.patch \
      file://mips64-default-ld-emulation.patch \
      ${BACKPORT} \
+     file://binutils-fix-over-array-bounds-issue.patch \
      "
 
 BACKPORT = "\
@@ -44,6 +45,8 @@ BACKPORT = "\
      file://backport/0026-ld-testsuite.patch \
      file://backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch \
      file://backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch \
+     file://backport/binutils-fix-ineffectual-zero-of-cache.patch \
+     file://backport/binutils-replace-strncat-with-strcat.patch  \
 "
 SRC_URI[md5sum] = "33adb18c3048d057ac58d07a3f1adb38"
 SRC_URI[sha256sum] = "2ab2e5b03e086d12c6295f831adad46b3e1410a3a234933a2e8fac66cb2e7a19"
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-fix-ineffectual-zero-of-cache.patch b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-fix-ineffectual-zero-of-cache.patch
new file mode 100644
index 0000000..a4aebf3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-fix-ineffectual-zero-of-cache.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Backport
+
+* elf32-xtensa.c 
+  * (free_section_cache): Renamed from clear_section_cache.
+  * (section_cache_section): Remove ineffectual zero of cache.
+   Call init_section_cache instead.
+
+binutils build might fail on recent Linux distros:
+binutils-2.23.1/bfd/elf32-xtensa.c:6078:36: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
+       memset (sec_cache, 0, sizeof (sec_cache));
+                                    ^
+binutils-2.23.1/bfd/elf32-xtensa.c:6120:32: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
+   memset (sec_cache, 0, sizeof (sec_cache));
+
+The original commit is http://sourceware.org/cgi-bin/cvsweb.cgi/src/bfd/elf32-xtensa.c.diff?r1=1.135&r2=1.136&cvsroot=src
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+--- binutils-2.23.1/bfd/elf32-xtensa.c.org	2013-03-12 03:04:29.000000000 -0500
++++ binutils-2.23.1/bfd/elf32-xtensa.c	2013-03-12 03:06:37.000000000 -0500
+@@ -6067,7 +6067,7 @@
+ 
+ 
+ static void
+-clear_section_cache (section_cache_t *sec_cache)
++free_section_cache (section_cache_t *sec_cache)
+ {
+   if (sec_cache->sec)
+     {
+@@ -6075,7 +6075,6 @@
+       release_internal_relocs (sec_cache->sec, sec_cache->relocs);
+       if (sec_cache->ptbl)
+ 	free (sec_cache->ptbl);
+-      memset (sec_cache, 0, sizeof (sec_cache));
+     }
+ }
+ 
+@@ -6116,8 +6115,8 @@
+     goto err;
+ 
+   /* Fill in the new section cache.  */
+-  clear_section_cache (sec_cache);
+-  memset (sec_cache, 0, sizeof (sec_cache));
++  free_section_cache (sec_cache);
++  init_section_cache (sec_cache);
+ 
+   sec_cache->sec = sec;
+   sec_cache->contents = contents;
+@@ -8272,8 +8271,9 @@
+ #endif /* DEBUG */
+ 
+ error_return:
+-  if (prop_table) free (prop_table);
+-  clear_section_cache (&target_sec_cache);
++  if (prop_table)
++    free (prop_table);
++  free_section_cache (&target_sec_cache);
+ 
+   release_contents (sec, contents);
+   release_internal_relocs (sec, internal_relocs);
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-replace-strncat-with-strcat.patch b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-replace-strncat-with-strcat.patch
new file mode 100644
index 0000000..bc8f92b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-replace-strncat-with-strcat.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Backport
+
+* arc-dis.c (write_comments_): Don't use strncat due to
+  the size of state->commentBuffer pointer isn't predictable.
+
+binutils build will fail on Fedora18+. 
+binutils-2.23.1/opcodes/arc-dis.c:430:13: error: argument to 'sizeof' in '__builtin_strncat' call is the same expression as the destination; did you mean to provide an explicit length? [-Werror=sizeof-pointer-memaccess]
+       sizeof (state->commentBuffer));
+              ^
+
+The original commit is http://sourceware.org/cgi-bin/cvsweb.cgi/src/opcodes/arc-dis.c.diff?r1=1.17&r2=1.18&cvsroot=src
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+--- binutils-2.23.1/opcodes/arc-dis.c.orig	2013-03-13 00:10:27.978498158 -0500
++++ binutils-2.23.1/opcodes/arc-dis.c	2013-03-13 00:11:28.297499381 -0500
+@@ -426,8 +426,7 @@
+ 	    strcpy (state->commentBuffer, comment_prefix);
+ 	  else
+ 	    strcat (state->commentBuffer, ", ");
+-	  strncat (state->commentBuffer, state->comm[i],
+-		   sizeof (state->commentBuffer));
++	  strcat (state->commentBuffer, state->comm[i]);
+ 	}
+     }
+ }
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1/binutils-fix-over-array-bounds-issue.patch b/meta/recipes-devtools/binutils/binutils-2.23.1/binutils-fix-over-array-bounds-issue.patch
new file mode 100644
index 0000000..aacbfef
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.23.1/binutils-fix-over-array-bounds-issue.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Pending
+
+binutils build fails on Fedora18+ due to over array bounds issue: 
+binutils-2.23.1/opcodes/rl78-dis.c:230:13: error: array subscript is above array bounds [-Werror=array-bounds]
+      if (oper->use_es && indirect_type (oper->type))
+              ^
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+--- binutils-2.23.1/opcodes/rl78-dis.c.orig	2013-03-12 22:17:47.664361066 -0500
++++ binutils-2.23.1/opcodes/rl78-dis.c	2013-03-12 23:39:51.383460914 -0500
+@@ -221,7 +221,7 @@
+ 
+ 	    case '0':
+ 	    case '1':
+-	      oper = opcode.op + *s - '0';
++	      oper = &opcode.op[*s - '0'];
+ 	      if (do_bang)
+ 		PC ('!');
+ 
-- 
1.8.1.2




