Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7DE678237
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 21:14:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7MLElvf013640
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 14:14:48 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 14:14:47 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Aug 2017 14:14:46 -0700
Message-ID: <20170822211446.65099-2-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170822211446.65099-1-jslater@windriver.com>
References: <20170822211446.65099-1-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ghostscript: CVE-2017-9727, -9835, -11714
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
X-List-Received-Date: Tue, 22 Aug 2017 21:14:47 -0000
Content-Type: text/plain

CVE-2017-9727: make bounds check in gx_ttfReader__Read more robust
CVE-2017-9835: bounds check the array allocations methods
CVE-2017-11714: prevent trying to reloc a freed object

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ghostscript/ghostscript/CVE-2017-11714.patch   |  61 ++++++++++
 .../ghostscript/ghostscript/CVE-2017-9727.patch    |  35 ++++++
 .../ghostscript/ghostscript/CVE-2017-9835.patch    | 125 +++++++++++++++++++++
 .../ghostscript/ghostscript_9.21.bb                |   3 +
 4 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch
new file mode 100644
index 0000000..84983c5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch
@@ -0,0 +1,61 @@
+From 671fd59eb657743aa86fbc1895cb15872a317caa Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Thu, 6 Jul 2017 14:54:02 +0100
+Subject: [PATCH] Bug 698158: prevent trying to reloc a freed object
+
+In the token reader, we pass the scanner state structure around as a
+t_struct ref on the Postscript operand stack.
+
+But we explicitly free the scanner state when we're done, which leaves a
+dangling reference on the operand stack and, unless that reference gets
+overwritten before the next garbager run, we can end up with the garbager
+trying to deal with an already freed object - that can cause a crash, or
+memory corruption.
+---
+ psi/ztoken.c |   14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+--- end of original header
+
+CVE: CVE-2017-11714
+
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/psi/ztoken.c b/psi/ztoken.c
+index 4dba7c5..af1ceeb 100644
+--- a/psi/ztoken.c
++++ b/psi/ztoken.c
+@@ -107,6 +107,12 @@ token_continue(i_ctx_t *i_ctx_p, scanner_state * pstate, bool save)
+     int code;
+     ref token;
+ 
++    /* Since we might free pstate below, and we're dealing with
++     * gc memory referenced by the stack, we need to explicitly
++     * remove the reference to pstate from the stack, otherwise
++     * the garbager will fall over
++     */
++    make_null(osp);
+     /* Note that gs_scan_token may change osp! */
+     pop(1);                     /* remove the file or scanner state */
+ again:
+@@ -183,8 +189,14 @@ ztokenexec_continue(i_ctx_t *i_ctx_p)
+ static int
+ tokenexec_continue(i_ctx_t *i_ctx_p, scanner_state * pstate, bool save)
+ {
+-    os_ptr op;
++    os_ptr op = osp;
+     int code;
++    /* Since we might free pstate below, and we're dealing with
++     * gc memory referenced by the stack, we need to explicitly
++     * remove the reference to pstate from the stack, otherwise
++     * the garbager will fall over
++     */
++    make_null(osp);
+     /* Note that gs_scan_token may change osp! */
+     pop(1);
+ again:
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch
new file mode 100644
index 0000000..a2f7bfa
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch
@@ -0,0 +1,35 @@
+From 937ccd17ac65935633b2ebc06cb7089b91e17e6b Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Thu, 15 Jun 2017 09:05:20 +0100
+Subject: [PATCH] Bug 698056: make bounds check in gx_ttfReader__Read more
+ robust
+
+---
+ base/gxttfb.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- end of original header
+
+CVE: CVE-2017-9727
+
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/base/gxttfb.c b/base/gxttfb.c
+index 0e9a444..e1561af 100644
+--- a/base/gxttfb.c
++++ b/base/gxttfb.c
+@@ -79,7 +79,8 @@ static void gx_ttfReader__Read(ttfReader *self, void *p, int n)
+     if (!r->error) {
+         if (r->extra_glyph_index != -1) {
+             q = r->glyph_data.bits.data + r->pos;
+-            r->error = (r->glyph_data.bits.size - r->pos < n ?
++            r->error = ((r->pos >= r->glyph_data.bits.size ||
++                        r->glyph_data.bits.size - r->pos < n) ?
+                             gs_note_error(gs_error_invalidfont) : 0);
+             if (r->error == 0)
+                 memcpy(p, q, n);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch
new file mode 100644
index 0000000..7c65690
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch
@@ -0,0 +1,125 @@
+From cfde94be1d4286bc47633c6e6eaf4e659bd78066 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 7 Jun 2017 14:55:12 +0100
+Subject: [PATCH] Bug 697985: bounds check the array allocations methods
+
+The clump allocator has four allocation functions that use 'number of elements'
+and 'size of elements' parameters (rather than a simple 'number of bytes').
+
+Those need specific bounds checking.
+---
+ base/gsalloc.c |   42 ++++++++++++++++++++++++++++--------------
+ 1 file changed, 28 insertions(+), 14 deletions(-)
+
+--- end of original header
+
+CVE: CVE-2017-9835
+
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/base/gsalloc.c b/base/gsalloc.c
+index 741ba00..10c04dd 100644
+--- a/base/gsalloc.c
++++ b/base/gsalloc.c
+@@ -1248,19 +1248,32 @@ i_alloc_struct_immovable(gs_memory_t * mem, gs_memory_type_ptr_t pstype,
+     alloc_trace("|+<.", imem, cname, pstype, size, obj);
+     return obj;
+ }
++
++static inline bool
++alloc_array_check_size(ulong num_elements, ulong elt_size, ulong *lsize)
++{
++    int64_t s = (int64_t)num_elements * elt_size;
++    if (s > max_uint) {
++        return false;
++    }
++    *lsize = (ulong)s;
++    return true;
++}
++
+ static byte *
+ i_alloc_byte_array(gs_memory_t * mem, uint num_elements, uint elt_size,
+                    client_name_t cname)
+ {
+     gs_ref_memory_t * const imem = (gs_ref_memory_t *)mem;
+     obj_header_t *obj;
+-
++    ulong lsize;
+ #ifdef MEMENTO
+     if (Memento_failThisEvent())
+         return NULL;
+ #endif
+-
+-    obj = alloc_obj(imem, (ulong) num_elements * elt_size,
++    if (alloc_array_check_size(num_elements, elt_size, &lsize) == false)
++        return NULL;
++    obj = alloc_obj(imem, lsize,
+                     &st_bytes, ALLOC_DIRECT, cname);
+ 
+     if_debug6m('A', mem, "[a%d:+b.]%s -bytes-*(%lu=%u*%u) = 0x%lx\n",
+@@ -1275,13 +1288,14 @@ i_alloc_byte_array_immovable(gs_memory_t * mem, uint num_elements,
+ {
+     gs_ref_memory_t * const imem = (gs_ref_memory_t *)mem;
+     obj_header_t *obj;
+-
++    ulong lsize;
+ #ifdef MEMENTO
+     if (Memento_failThisEvent())
+         return NULL;
+ #endif
+-
+-    obj = alloc_obj(imem, (ulong) num_elements * elt_size,
++    if (alloc_array_check_size(num_elements, elt_size, &lsize) == false)
++        return NULL;
++    obj = alloc_obj(imem, lsize,
+                     &st_bytes, ALLOC_IMMOVABLE | ALLOC_DIRECT,
+                     cname);
+ 
+@@ -1297,7 +1311,7 @@ i_alloc_struct_array(gs_memory_t * mem, uint num_elements,
+ {
+     gs_ref_memory_t * const imem = (gs_ref_memory_t *)mem;
+     obj_header_t *obj;
+-
++    ulong lsize;
+ #ifdef MEMENTO
+     if (Memento_failThisEvent())
+         return NULL;
+@@ -1311,9 +1325,9 @@ i_alloc_struct_array(gs_memory_t * mem, uint num_elements,
+         return NULL;		/* fail */
+     }
+ #endif
+-    obj = alloc_obj(imem,
+-                    (ulong) num_elements * pstype->ssize,
+-                    pstype, ALLOC_DIRECT, cname);
++    if (alloc_array_check_size(num_elements, pstype->ssize, &lsize) == false)
++        return NULL;
++    obj = alloc_obj(imem, lsize, pstype, ALLOC_DIRECT, cname);
+     if_debug7m('A', mem, "[a%d:+<.]%s %s*(%lu=%u*%u) = 0x%lx\n",
+                alloc_trace_space(imem), client_name_string(cname),
+                struct_type_name_string(pstype),
+@@ -1327,16 +1341,16 @@ i_alloc_struct_array_immovable(gs_memory_t * mem, uint num_elements,
+ {
+     gs_ref_memory_t * const imem = (gs_ref_memory_t *)mem;
+     obj_header_t *obj;
+-
++    ulong lsize;
+ #ifdef MEMENTO
+     if (Memento_failThisEvent())
+         return NULL;
+ #endif
+ 
+     ALLOC_CHECK_SIZE(mem,pstype);
+-    obj = alloc_obj(imem,
+-                    (ulong) num_elements * pstype->ssize,
+-                    pstype, ALLOC_IMMOVABLE | ALLOC_DIRECT, cname);
++    if (alloc_array_check_size(num_elements, pstype->ssize, &lsize) == false)
++        return NULL;
++    obj = alloc_obj(imem, lsize, pstype, ALLOC_IMMOVABLE | ALLOC_DIRECT, cname);
+     if_debug7m('A', mem, "[a%d|+<.]%s %s*(%lu=%u*%u) = 0x%lx\n",
+                alloc_trace_space(imem), client_name_string(cname),
+                struct_type_name_string(pstype),
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
index 93589cc..bf985c4 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
@@ -41,6 +41,9 @@ SRC_URI = "${SRC_URI_BASE} \
            file://CVE-2017-9612.patch \
            file://CVE-2017-9739.patch \
            file://CVE-2017-9726.patch \
+           file://CVE-2017-9727.patch \
+           file://CVE-2017-9835.patch \
+           file://CVE-2017-11714.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.7.4


