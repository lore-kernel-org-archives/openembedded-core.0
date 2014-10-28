Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 19565601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 05:09:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9S59dCC028018
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 22:09:40 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 27 Oct 2014 22:09:38 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Oct 2014 13:09:41 +0800
Message-ID: <1414472981-28498-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] elfutils: fix elf_cvt_gnuhash
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
X-List-Received-Date: Tue, 28 Oct 2014 05:09:42 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The 'dest' and 'src' can be same, we need to save the value of src32[2]
before swaping it.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../elfutils/elfutils/Fix_elf_cvt_gunhash.patch    |   29 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    1 +
 meta/recipes-devtools/elfutils/elfutils_0.158.bb   |    1 +
 3 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch b/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
new file mode 100644
index 0000000..374cba5
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
@@ -0,0 +1,29 @@
+Fix elf_cvt_gunhash if dest and src are same.
+
+Upstream-status: Pending
+
+The 'dest' and 'src' can be same, we need to save the value of src32[2]
+before swaping it.
+
+Signed-off-by: Baoshan Pang <BaoShan.Pang@windriver.com>
+diff --git a/libelf/gnuhash_xlate.h b/libelf/gnuhash_xlate.h
+index 6faf113..04d9ca1 100644
+--- a/libelf/gnuhash_xlate.h
++++ b/libelf/gnuhash_xlate.h
+@@ -40,6 +40,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+      words.  We must detangle them here.   */
+   Elf32_Word *dest32 = dest;
+   const Elf32_Word *src32 = src;
++  Elf32_Word save_src32_2 = src32[2]; // dest could be equal to src
+ 
+   /* First four control words, 32 bits.  */
+   for (unsigned int cnt = 0; cnt < 4; ++cnt)
+@@ -50,7 +51,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+       len -= 4;
+     }
+ 
+-  Elf32_Word bitmask_words = encode ? src32[2] : dest32[2];
++  Elf32_Word bitmask_words = encode ? save_src32_2 : dest32[2];
+ 
+   /* Now the 64 bit words.  */
+   Elf64_Xword *dest64 = (Elf64_Xword *) &dest32[4];
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 1106242..ab95639 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -32,6 +32,7 @@ SRC_URI += "\
 	file://dso-link-change.patch \
 	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
 	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
+	file://Fix_elf_cvt_gunhash.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.158.bb b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
index ef3dd0b..42724a1 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.158.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
@@ -30,6 +30,7 @@ SRC_URI += "\
         file://dso-link-change.patch \
         file://m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch \
         file://fixheadercheck.patch \
+        file://Fix_elf_cvt_gunhash.patch \
 "
 
 # Only apply when building uclibc based target recipe
-- 
1.7.10.4


