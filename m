Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1D87D68C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 05:01:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4J51Rxe015739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 18 May 2019 22:01:27 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sat, 18 May 2019 22:01:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 19 May 2019 01:00:37 -0400
Message-ID: <1558242037-162349-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] virglrenderer: fix compiling failure with `-fvisibility=default'
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
X-List-Received-Date: Sun, 19 May 2019 05:01:28 -0000
Content-Type: text/plain

Extern global variable `util_cpu_caps' to multiple C source files is
not a good habit, it caused linking failure when making a shard object
in some cross compiling circumstance
...
|ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
when making a shared object
|ld: final link failed: bad value
...

Covert global variable to static and assign it only in one C source file,
provide get function for other C source files

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...util_cpu_caps-can-not-be-used-when-making.patch | 97 ++++++++++++++++++++++
 .../virglrenderer/virglrenderer_0.7.0.bb           |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-fix-symbol-util_cpu_caps-can-not-be-used-when-making.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-fix-symbol-util_cpu_caps-can-not-be-used-when-making.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-fix-symbol-util_cpu_caps-can-not-be-used-when-making.patch
new file mode 100644
index 0000000..e5dc8f9
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-fix-symbol-util_cpu_caps-can-not-be-used-when-making.patch
@@ -0,0 +1,97 @@
+From e991050fec102a5fde766226c7f49444c3860c49 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 19 May 2019 00:12:51 -0400
+Subject: [PATCH] fix symbol `util_cpu_caps' can not be used when making a
+ shared object
+
+Extern global variable `util_cpu_caps' to multiple C source files is
+not a good habit, it caused linking failure when making a shard object
+in some cross compiling circumstance
+...
+|ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
+R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
+when making a shared object
+|ld: final link failed: bad value
+...
+
+Covert global variable to static and assign it only in one C source file,
+provide get function for other C source files
+
+Upstream-Status: Submitted [virglrenderer-devel@lists.freedesktop.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/gallium/auxiliary/util/u_cpu_detect.c | 6 +++++-
+ src/gallium/auxiliary/util/u_cpu_detect.h | 3 +--
+ src/gallium/auxiliary/util/u_math.c       | 8 ++++----
+ 3 files changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/src/gallium/auxiliary/util/u_cpu_detect.c b/src/gallium/auxiliary/util/u_cpu_detect.c
+index 0b4b83a..be0cedd 100644
+--- a/src/gallium/auxiliary/util/u_cpu_detect.c
++++ b/src/gallium/auxiliary/util/u_cpu_detect.c
+@@ -78,7 +78,11 @@ DEBUG_GET_ONCE_BOOL_OPTION(dump_cpu, "GALLIUM_DUMP_CPU", FALSE)
+ #endif
+ 
+ 
+-struct util_cpu_caps util_cpu_caps;
++static struct util_cpu_caps util_cpu_caps;
++struct util_cpu_caps* get_util_cpu_caps(void)
++{
++    return &util_cpu_caps;
++}
+ 
+ #if defined(PIPE_ARCH_X86) || defined(PIPE_ARCH_X86_64)
+ static int has_cpuid(void);
+diff --git a/src/gallium/auxiliary/util/u_cpu_detect.h b/src/gallium/auxiliary/util/u_cpu_detect.h
+index 01f3896..58134ab 100644
+--- a/src/gallium/auxiliary/util/u_cpu_detect.h
++++ b/src/gallium/auxiliary/util/u_cpu_detect.h
+@@ -73,8 +73,7 @@ struct util_cpu_caps {
+    unsigned has_daz:1;
+ };
+ 
+-extern struct util_cpu_caps
+-util_cpu_caps;
++struct util_cpu_caps* get_util_cpu_caps(void);
+ 
+ void util_cpu_detect(void);
+ 
+diff --git a/src/gallium/auxiliary/util/u_math.c b/src/gallium/auxiliary/util/u_math.c
+index e574153..c08ed3b 100644
+--- a/src/gallium/auxiliary/util/u_math.c
++++ b/src/gallium/auxiliary/util/u_math.c
+@@ -90,7 +90,7 @@ util_fpstate_get(void)
+    unsigned mxcsr = 0;
+ 
+ #if defined(PIPE_ARCH_SSE)
+-   if (util_cpu_caps.has_sse) {
++   if (get_util_cpu_caps()->has_sse) {
+       mxcsr = _mm_getcsr();
+    }
+ #endif
+@@ -108,10 +108,10 @@ unsigned
+ util_fpstate_set_denorms_to_zero(unsigned current_mxcsr)
+ {
+ #if defined(PIPE_ARCH_SSE)
+-   if (util_cpu_caps.has_sse) {
++   if (get_util_cpu_caps()->has_sse) {
+       /* Enable flush to zero mode */
+       current_mxcsr |= _MM_FLUSH_ZERO_MASK;
+-      if (util_cpu_caps.has_daz) {
++      if (get_util_cpu_caps()->has_daz) {
+          /* Enable denormals are zero mode */
+          current_mxcsr |= _MM_DENORMALS_ZERO_MASK;
+       }
+@@ -130,7 +130,7 @@ void
+ util_fpstate_set(unsigned mxcsr)
+ {
+ #if defined(PIPE_ARCH_SSE)
+-   if (util_cpu_caps.has_sse) {
++   if (get_util_cpu_caps()->has_sse) {
+       _mm_setcsr(mxcsr);
+    }
+ #endif
+-- 
+2.8.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
index 225a0b8..441c692 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
@@ -9,6 +9,7 @@ SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
            file://0001-vtest-add-missing-includes.patch \
            file://0001-Makefile.am-explicitly-link-with-libdrm.patch \
+           file://0001-fix-symbol-util_cpu_caps-can-not-be-used-when-making.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


