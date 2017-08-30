Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D974578343
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 00:48:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7U0n0Oe002559
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 17:49:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 Aug 2017 17:49:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Aug 2017 17:48:57 -0700
Message-ID: <6041037c68eda7d2ce7d31ee5c81d6d193bc6cf0.1504054080.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1504054080.git.liezhi.yang@windriver.com>
References: <cover.1504054080.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libpcre2: Fix CVE-2017-7186
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
X-List-Received-Date: Wed, 30 Aug 2017 00:49:00 -0000
Content-Type: text/plain

A fuzz on libpcre1 through the pcretest utility revealed an invalid read in the
library. For who is interested in a detailed description of the bug, will
follow a feedback from upstream:

This was a genuine bug in the 32-bit library. Thanks for finding it. The crash
was caused by trying to find a Unicode property for a code value greater than
0x10ffff, the Unicode maximum, when running in non-UTF mode (where character
values can be up to 0xffffffff).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libpcre/libpcre2/libpcre2-CVE-2017-7186.patch  | 96 ++++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre2_10.23.bb     |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch b/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch
new file mode 100644
index 0000000..bfa3bfe
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch
@@ -0,0 +1,96 @@
+libpcre2-10.23: Fix CVE-2017-7186
+
+A fuzz on libpcre1 through the pcretest utility revealed an invalid read in the
+library. For who is interested in a detailed description of the bug, will
+follow a feedback from upstream:
+
+This was a genuine bug in the 32-bit library. Thanks for finding it. The crash
+was caused by trying to find a Unicode property for a code value greater than
+0x10ffff, the Unicode maximum, when running in non-UTF mode (where character
+values can be up to 0xffffffff).
+
+The complete ASan output:
+
+# pcretest -32 -d $FILE
+==14788==ERROR: AddressSanitizer: SEGV on unknown address 0x7f1bbffed4df (pc 0x7f1bbee3fe6b bp 0x7fff8b50d8c0 sp 0x7fff8b50d3a0 T0)
+==14788==The signal is caused by a READ memory access.
+    #0 0x7f1bbee3fe6a in match /tmp/portage/dev-libs/libpcre-8.40/work/pcre-8.40/pcre_exec.c:5473:18
+    #1 0x7f1bbee09226 in pcre32_exec /tmp/portage/dev-libs/libpcre-8.40/work/pcre-8.40/pcre_exec.c:6936:8
+    #2 0x527d6c in main /tmp/portage/dev-libs/libpcre-8.40/work/pcre-8.40/pcretest.c:5218:9
+    #3 0x7f1bbddd678f in __libc_start_main /tmp/portage/sys-libs/glibc-2.23-r3/work/glibc-2.23/csu/../csu/libc-start.c:289
+    #4 0x41b438 in _init (/usr/bin/pcretest+0x41b438)
+
+AddressSanitizer can not provide additional info.
+SUMMARY: AddressSanitizer: SEGV /tmp/portage/dev-libs/libpcre-8.40/work/pcre-8.40/pcre_exec.c:5473:18 in match
+==14788==ABORTING
+
+Upstream-Status: Backport [https://vcs.pcre.org/pcre2/code/trunk/src/pcre2_ucd.c?view=patch&r1=316&r2=670&sortby=date \
+                        https://vcs.pcre.org/pcre2/code/trunk/src/pcre2_internal.h?view=patch&r1=600&r2=670&sortby=date]
+CVE: CVE-2017-7186
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+--- trunk/src/pcre2_ucd.c  2015/07/17 15:44:51 316
++++ trunk/src/pcre2_ucd.c  2017/02/24 18:25:32 670
+@@ -41,6 +41,20 @@
+ 
+ const char *PRIV(unicode_version) = "8.0.0";
+ 
++/* If the 32-bit library is run in non-32-bit mode, character values
++greater than 0x10ffff may be encountered. For these we set up a
++special record. */
++
++#if PCRE2_CODE_UNIT_WIDTH == 32
++const ucd_record PRIV(dummy_ucd_record)[] = {{
++  ucp_Common,    /* script */
++  ucp_Cn,        /* type unassigned */
++  ucp_gbOther,   /* grapheme break property */
++  0,             /* case set */
++  0,             /* other case */
++  }};
++#endif
++
+ /* When recompiling tables with a new Unicode version, please check the
+ types in this structure definition from pcre2_internal.h (the actual
+ field names will be different):
+--- trunk/src/pcre2_internal.h 2016/11/19 12:46:24 600
++++ trunk/src/pcre2_internal.h 2017/02/24 18:25:32 670
+@@ -1774,10 +1774,17 @@
+ /* UCD access macros */
+ 
+ #define UCD_BLOCK_SIZE 128
+-#define GET_UCD(ch) (PRIV(ucd_records) + \
++#define REAL_GET_UCD(ch) (PRIV(ucd_records) + \
+         PRIV(ucd_stage2)[PRIV(ucd_stage1)[(int)(ch) / UCD_BLOCK_SIZE] * \
+         UCD_BLOCK_SIZE + (int)(ch) % UCD_BLOCK_SIZE])
+ 
++#if PCRE2_CODE_UNIT_WIDTH == 32
++#define GET_UCD(ch) ((ch > MAX_UTF_CODE_POINT)? \
++  PRIV(dummy_ucd_record) : REAL_GET_UCD(ch))
++#else
++#define GET_UCD(ch) REAL_GET_UCD(ch)
++#endif
++
+ #define UCD_CHARTYPE(ch)    GET_UCD(ch)->chartype
+ #define UCD_SCRIPT(ch)      GET_UCD(ch)->script
+ #define UCD_CATEGORY(ch)    PRIV(ucp_gentype)[UCD_CHARTYPE(ch)]
+@@ -1834,6 +1841,9 @@
+ #define _pcre2_default_compile_context PCRE2_SUFFIX(_pcre2_default_compile_context_)
+ #define _pcre2_default_match_context   PCRE2_SUFFIX(_pcre2_default_match_context_)
+ #define _pcre2_default_tables          PCRE2_SUFFIX(_pcre2_default_tables_)
++#if PCRE2_CODE_UNIT_WIDTH == 32
++#define _pcre2_dummy_ucd_record        PCRE2_SUFFIX(_pcre2_dummy_ucd_record_)
++#endif
+ #define _pcre2_hspace_list             PCRE2_SUFFIX(_pcre2_hspace_list_)
+ #define _pcre2_vspace_list             PCRE2_SUFFIX(_pcre2_vspace_list_)
+ #define _pcre2_ucd_caseless_sets       PCRE2_SUFFIX(_pcre2_ucd_caseless_sets_)
+@@ -1858,6 +1868,9 @@
+ extern const uint32_t                  PRIV(vspace_list)[];
+ extern const uint32_t                  PRIV(ucd_caseless_sets)[];
+ extern const ucd_record                PRIV(ucd_records)[];
++#if PCRE2_CODE_UNIT_WIDTH == 32
++extern const ucd_record                PRIV(dummy_ucd_record)[];
++#endif
+ extern const uint8_t                   PRIV(ucd_stage1)[];
+ extern const uint16_t                  PRIV(ucd_stage2)[];
+ extern const uint32_t                  PRIV(ucp_gbtable)[];
diff --git a/meta/recipes-support/libpcre/libpcre2_10.23.bb b/meta/recipes-support/libpcre/libpcre2_10.23.bb
index 63f8d51..ca2b028 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.23.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.23.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=3de34df49e1fe3c3b59a08dff214488b"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://libpcre2-CVE-2017-8786.patch \
+           file://libpcre2-CVE-2017-7186.patch \
 "
 
 SRC_URI[md5sum] = "b2cd00ca7e24049040099b0a46bb3649"
-- 
2.10.2


