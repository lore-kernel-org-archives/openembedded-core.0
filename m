Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0787824A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 00:48:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7U0n03s003903
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 17:49:00 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 Aug 2017 17:48:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Aug 2017 17:48:56 -0700
Message-ID: <b880c92a7789b5b0d630252ee84d0cc0e10863e8.1504054080.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1504054080.git.liezhi.yang@windriver.com>
References: <cover.1504054080.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libpcre2: Fix CVE-2017-8786
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
X-List-Received-Date: Wed, 30 Aug 2017 00:48:59 -0000
Content-Type: text/plain

The pcre2test.c in PCRE2 10.23 allows remote attackers to cause a denial of
service (heap-based buffer overflow) or possibly have unspecified other impact
via a crafted regular expression.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libpcre/libpcre2/libpcre2-CVE-2017-8786.patch  | 93 ++++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre2_10.23.bb     |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch b/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch
new file mode 100644
index 0000000..eafafc1f
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch
@@ -0,0 +1,93 @@
+libpcre2-10.23: Fix CVE-2017-8786
+
+The pcre2test.c in PCRE2 10.23 allows remote attackers to cause a denial of
+service (heap-based buffer overflow) or possibly have unspecified other impact
+via a crafted regular expression.
+
+Upstream-Status: Backport [https://vcs.pcre.org/pcre2/code/trunk/src/pcre2test.c?r1=692&r2=697&view=patch]
+CVE: CVE-2017-8786
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+--- trunk/src/pcre2test.c  2017/03/21 16:18:54 692
++++ trunk/src/pcre2test.c  2017/03/21 18:36:13 697
+@@ -1017,9 +1017,9 @@
+   if (test_mode == PCRE8_MODE) \
+     r = pcre2_get_error_message_8(a,G(b,8),G(G(b,8),_size)); \
+   else if (test_mode == PCRE16_MODE) \
+-    r = pcre2_get_error_message_16(a,G(b,16),G(G(b,16),_size)); \
++    r = pcre2_get_error_message_16(a,G(b,16),G(G(b,16),_size/2)); \
+   else \
+-    r = pcre2_get_error_message_32(a,G(b,32),G(G(b,32),_size))
++    r = pcre2_get_error_message_32(a,G(b,32),G(G(b,32),_size/4))
+ 
+ #define PCRE2_GET_OVECTOR_COUNT(a,b) \
+   if (test_mode == PCRE8_MODE) \
+@@ -1399,6 +1399,9 @@
+ 
+ /* ----- Common macros for two-mode cases ----- */
+ 
++#define BYTEONE (BITONE/8)
++#define BYTETWO (BITTWO/8)
++
+ #define CASTFLD(t,a,b) \
+   ((test_mode == G(G(PCRE,BITONE),_MODE))? (t)(G(a,BITONE)->b) : \
+     (t)(G(a,BITTWO)->b))
+@@ -1481,9 +1484,9 @@
+ 
+ #define PCRE2_GET_ERROR_MESSAGE(r,a,b) \
+   if (test_mode == G(G(PCRE,BITONE),_MODE)) \
+-    r = G(pcre2_get_error_message_,BITONE)(a,G(b,BITONE),G(G(b,BITONE),_size)); \
++    r = G(pcre2_get_error_message_,BITONE)(a,G(b,BITONE),G(G(b,BITONE),_size/BYTEONE)); \
+   else \
+-    r = G(pcre2_get_error_message_,BITTWO)(a,G(b,BITTWO),G(G(b,BITTWO),_size))
++    r = G(pcre2_get_error_message_,BITTWO)(a,G(b,BITTWO),G(G(b,BITTWO),_size/BYTETWO))
+ 
+ #define PCRE2_GET_OVECTOR_COUNT(a,b) \
+   if (test_mode == G(G(PCRE,BITONE),_MODE)) \
+@@ -1904,7 +1907,7 @@
+ #define PCRE2_DFA_MATCH(a,b,c,d,e,f,g,h,i,j) \
+   a = pcre2_dfa_match_16(G(b,16),(PCRE2_SPTR16)c,d,e,f,G(g,16),h,i,j)
+ #define PCRE2_GET_ERROR_MESSAGE(r,a,b) \
+-  r = pcre2_get_error_message_16(a,G(b,16),G(G(b,16),_size))
++  r = pcre2_get_error_message_16(a,G(b,16),G(G(b,16),_size/2))
+ #define PCRE2_GET_OVECTOR_COUNT(a,b) a = pcre2_get_ovector_count_16(G(b,16))
+ #define PCRE2_GET_STARTCHAR(a,b) a = pcre2_get_startchar_16(G(b,16))
+ #define PCRE2_JIT_COMPILE(r,a,b) r = pcre2_jit_compile_16(G(a,16),b)
+@@ -2000,7 +2003,7 @@
+ #define PCRE2_DFA_MATCH(a,b,c,d,e,f,g,h,i,j) \
+   a = pcre2_dfa_match_32(G(b,32),(PCRE2_SPTR32)c,d,e,f,G(g,32),h,i,j)
+ #define PCRE2_GET_ERROR_MESSAGE(r,a,b) \
+-  r = pcre2_get_error_message_32(a,G(b,32),G(G(b,32),_size))
++  r = pcre2_get_error_message_32(a,G(b,32),G(G(b,32),_size/4))
+ #define PCRE2_GET_OVECTOR_COUNT(a,b) a = pcre2_get_ovector_count_32(G(b,32))
+ #define PCRE2_GET_STARTCHAR(a,b) a = pcre2_get_startchar_32(G(b,32))
+ #define PCRE2_JIT_COMPILE(r,a,b) r = pcre2_jit_compile_32(G(a,32),b)
+@@ -2889,7 +2892,7 @@
+   {
+   if (pbuffer32 != NULL) free(pbuffer32);
+   pbuffer32_size = 4*len + 4;
+-  if (pbuffer32_size < 256) pbuffer32_size = 256;
++  if (pbuffer32_size < 512) pbuffer32_size = 512;
+   pbuffer32 = (uint32_t *)malloc(pbuffer32_size);
+   if (pbuffer32 == NULL)
+     {
+@@ -7600,7 +7603,8 @@
+   int errcode;
+   char *endptr;
+ 
+-/* Ensure the relevant non-8-bit buffer is available. */
++/* Ensure the relevant non-8-bit buffer is available. Ensure that it is at 
++least 128 code units, because it is used for retrieving error messages. */
+ 
+ #ifdef SUPPORT_PCRE2_16
+   if (test_mode == PCRE16_MODE)
+@@ -7620,7 +7624,7 @@
+ #ifdef SUPPORT_PCRE2_32
+   if (test_mode == PCRE32_MODE)
+     {
+-    pbuffer32_size = 256;
++    pbuffer32_size = 512;
+     pbuffer32 = (uint32_t *)malloc(pbuffer32_size);
+     if (pbuffer32 == NULL)
+       {
diff --git a/meta/recipes-support/libpcre/libpcre2_10.23.bb b/meta/recipes-support/libpcre/libpcre2_10.23.bb
index 794d973..63f8d51 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.23.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.23.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=3de34df49e1fe3c3b59a08dff214488b"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
+           file://libpcre2-CVE-2017-8786.patch \
 "
 
 SRC_URI[md5sum] = "b2cd00ca7e24049040099b0a46bb3649"
-- 
2.10.2


