Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3A90060248
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 21:36:34 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v143so219221qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 14:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=vTMV8KmFqAtGpNNVtOtZ8d975J3T78kXFNs0Wr/k/98=;
	b=QUb8+4eluwbPz8ADla5/xUkmImljMgmBt6CThLuq5yVKg4AoQDxU0UEK6PrZx624Hy
	2Pb32JDpmX8RX1cTgwReUx52nmXdvNx6nAPbbDSz1RezdhQZEuhvl8M3gQw+eIFHykpm
	aU8T1aRczkC4yVdijsSbt1dBy385ReoUFNbh2e41EPYmOBVCMkGV15mGQFlvs7nUbGQA
	vuLpHEH/houibSbg+1ORZhj5MwqQJKG5zKC5eA2GsyqHfWMDTP2Rg0kcb2HRE8KYCaDX
	ag60KLoEVH7HSNuN6GsR+x43VTFuajPYAITUt0bLOyrVCJ1GbRtXBV/Mf/sOZXbL2z9v
	uKZQ==
X-Gm-Message-State: AIVw113vp+SxbqBxPJZX1dSPGFFUKDIKquhq7s+Ps2sHzqIlyoHMY3pp
	2fOMIQddvvOCLPwF
X-Received: by 10.55.119.131 with SMTP id s125mr28532423qkc.255.1499290595354; 
	Wed, 05 Jul 2017 14:36:35 -0700 (PDT)
Received: from localhost.localdomain ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id k23sm104091qke.41.2017.07.05.14.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Jul 2017 14:36:34 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 05 Jul 2017 18:36:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  5 Jul 2017 18:36:27 -0300
Message-Id: <20170705213627.23967-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: etnaviv: fix shader miscompilation with more than 16 labels
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
X-List-Received-Date: Wed, 05 Jul 2017 21:36:35 -0000

The labels array may change its virtual address on a reallocation, so
it is invalid to cache pointers into the array. Rather than using the
pointer directly, remember the array index.

Fixes miscompilation of shaders in glmark2 ideas, leading to GPU hangs.

This is a backport from 17.1.5.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

NOTE: The patch requires mesa 17.1.4 upgrade not yet merged.

 .../files/etnaviv_fix-shader-miscompilation.patch  | 220 +++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_17.1.4.bb          |   1 +
 2 files changed, 221 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/etnaviv_fix-shader-miscompilation.patch

diff --git a/meta/recipes-graphics/mesa/files/etnaviv_fix-shader-miscompilation.patch b/meta/recipes-graphics/mesa/files/etnaviv_fix-shader-miscompilation.patch
new file mode 100644
index 0000000000..0354e2a57f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/etnaviv_fix-shader-miscompilation.patch
@@ -0,0 +1,220 @@
+From ec43605189907fa327a4a7f457aa3c822cfdea5d Mon Sep 17 00:00:00 2001
+From: Lucas Stach <l.stach@pengutronix.de>
+Date: Mon, 26 Jun 2017 18:24:31 +0200
+Subject: etnaviv: fix shader miscompilation with more than 16 labels
+
+The labels array may change its virtual address on a reallocation, so
+it is invalid to cache pointers into the array. Rather than using the
+pointer directly, remember the array index.
+
+Fixes miscompilation of shaders in glmark2 ideas, leading to GPU hangs.
+
+Fixes: c9e8b49b (etnaviv: gallium driver for Vivante GPUs)
+Cc: mesa-stable@lists.freedesktop.org
+Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
+Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>
+
+Upstream-Status: Backport [17.1.5]
+
+diff --git a/src/gallium/drivers/etnaviv/etnaviv_compiler.c b/src/gallium/drivers/etnaviv/etnaviv_compiler.c
+index eafb511..af0f76b 100644
+--- a/src/gallium/drivers/etnaviv/etnaviv_compiler.c
++++ b/src/gallium/drivers/etnaviv/etnaviv_compiler.c
+@@ -119,10 +119,10 @@ enum etna_compile_frame_type {
+  */
+ struct etna_compile_frame {
+    enum etna_compile_frame_type type;
+-   struct etna_compile_label *lbl_else;
+-   struct etna_compile_label *lbl_endif;
+-   struct etna_compile_label *lbl_loop_bgn;
+-   struct etna_compile_label *lbl_loop_end;
++   int lbl_else_idx;
++   int lbl_endif_idx;
++   int lbl_loop_bgn_idx;
++   int lbl_loop_end_idx;
+ };
+ 
+ struct etna_compile_file {
+@@ -178,7 +178,7 @@ struct etna_compile {
+    /* Fields for handling nested conditionals */
+    struct etna_compile_frame frame_stack[ETNA_MAX_DEPTH];
+    int frame_sp;
+-   struct etna_compile_label *lbl_usage[ETNA_MAX_INSTRUCTIONS];
++   int lbl_usage[ETNA_MAX_INSTRUCTIONS];
+ 
+    unsigned labels_count, labels_sz;
+    struct etna_compile_label *labels;
+@@ -990,7 +990,7 @@ etna_src_uniforms_conflict(struct etna_inst_src a, struct etna_inst_src b)
+ }
+ 
+ /* create a new label */
+-static struct etna_compile_label *
++static unsigned int
+ alloc_new_label(struct etna_compile *c)
+ {
+    struct etna_compile_label label = {
+@@ -999,7 +999,7 @@ alloc_new_label(struct etna_compile *c)
+ 
+    array_insert(c->labels, label);
+ 
+-   return &c->labels[c->labels_count - 1];
++   return c->labels_count - 1;
+ }
+ 
+ /* place label at current instruction pointer */
+@@ -1015,10 +1015,10 @@ label_place(struct etna_compile *c, struct etna_compile_label *label)
+  * as the value becomes known.
+  */
+ static void
+-label_mark_use(struct etna_compile *c, struct etna_compile_label *label)
++label_mark_use(struct etna_compile *c, int lbl_idx)
+ {
+    assert(c->inst_ptr < ETNA_MAX_INSTRUCTIONS);
+-   c->lbl_usage[c->inst_ptr] = label;
++   c->lbl_usage[c->inst_ptr] = lbl_idx;
+ }
+ 
+ /* walk the frame stack and return first frame with matching type */
+@@ -1099,8 +1099,8 @@ trans_if(const struct instr_translater *t, struct etna_compile *c,
+    /* push IF to stack */
+    f->type = ETNA_COMPILE_FRAME_IF;
+    /* create "else" label */
+-   f->lbl_else = alloc_new_label(c);
+-   f->lbl_endif = NULL;
++   f->lbl_else_idx = alloc_new_label(c);
++   f->lbl_endif_idx = -1;
+ 
+    /* We need to avoid the emit_inst() below becoming two instructions */
+    if (etna_src_uniforms_conflict(src[0], imm_0))
+@@ -1108,7 +1108,7 @@ trans_if(const struct instr_translater *t, struct etna_compile *c,
+ 
+    /* mark position in instruction stream of label reference so that it can be
+     * filled in in next pass */
+-   label_mark_use(c, f->lbl_else);
++   label_mark_use(c, f->lbl_else_idx);
+ 
+    /* create conditional branch to label if src0 EQ 0 */
+    emit_inst(c, &(struct etna_inst){
+@@ -1129,8 +1129,8 @@ trans_else(const struct instr_translater *t, struct etna_compile *c,
+    assert(f->type == ETNA_COMPILE_FRAME_IF);
+ 
+    /* create "endif" label, and branch to endif label */
+-   f->lbl_endif = alloc_new_label(c);
+-   label_mark_use(c, f->lbl_endif);
++   f->lbl_endif_idx = alloc_new_label(c);
++   label_mark_use(c, f->lbl_endif_idx);
+    emit_inst(c, &(struct etna_inst) {
+       .opcode = INST_OPCODE_BRANCH,
+       .cond = INST_CONDITION_TRUE,
+@@ -1138,7 +1138,7 @@ trans_else(const struct instr_translater *t, struct etna_compile *c,
+    });
+ 
+    /* mark "else" label at this position in instruction stream */
+-   label_place(c, f->lbl_else);
++   label_place(c, &c->labels[f->lbl_else_idx]);
+ }
+ 
+ static void
+@@ -1151,10 +1151,10 @@ trans_endif(const struct instr_translater *t, struct etna_compile *c,
+ 
+    /* assign "endif" or "else" (if no ELSE) label to current position in
+     * instruction stream, pop IF */
+-   if (f->lbl_endif != NULL)
+-      label_place(c, f->lbl_endif);
++   if (f->lbl_endif_idx != -1)
++      label_place(c, &c->labels[f->lbl_endif_idx]);
+    else
+-      label_place(c, f->lbl_else);
++      label_place(c, &c->labels[f->lbl_else_idx]);
+ }
+ 
+ static void
+@@ -1166,10 +1166,10 @@ trans_loop_bgn(const struct instr_translater *t, struct etna_compile *c,
+ 
+    /* push LOOP to stack */
+    f->type = ETNA_COMPILE_FRAME_LOOP;
+-   f->lbl_loop_bgn = alloc_new_label(c);
+-   f->lbl_loop_end = alloc_new_label(c);
++   f->lbl_loop_bgn_idx = alloc_new_label(c);
++   f->lbl_loop_end_idx = alloc_new_label(c);
+ 
+-   label_place(c, f->lbl_loop_bgn);
++   label_place(c, &c->labels[f->lbl_loop_bgn_idx]);
+ 
+    c->num_loops++;
+ }
+@@ -1185,7 +1185,7 @@ trans_loop_end(const struct instr_translater *t, struct etna_compile *c,
+ 
+    /* mark position in instruction stream of label reference so that it can be
+     * filled in in next pass */
+-   label_mark_use(c, f->lbl_loop_bgn);
++   label_mark_use(c, f->lbl_loop_bgn_idx);
+ 
+    /* create branch to loop_bgn label */
+    emit_inst(c, &(struct etna_inst) {
+@@ -1195,7 +1195,7 @@ trans_loop_end(const struct instr_translater *t, struct etna_compile *c,
+       /* imm is filled in later */
+    });
+ 
+-   label_place(c, f->lbl_loop_end);
++   label_place(c, &c->labels[f->lbl_loop_end_idx]);
+ }
+ 
+ static void
+@@ -1207,7 +1207,7 @@ trans_brk(const struct instr_translater *t, struct etna_compile *c,
+ 
+    /* mark position in instruction stream of label reference so that it can be
+     * filled in in next pass */
+-   label_mark_use(c, f->lbl_loop_end);
++   label_mark_use(c, f->lbl_loop_end_idx);
+ 
+    /* create branch to loop_end label */
+    emit_inst(c, &(struct etna_inst) {
+@@ -1227,7 +1227,7 @@ trans_cont(const struct instr_translater *t, struct etna_compile *c,
+ 
+    /* mark position in instruction stream of label reference so that it can be
+     * filled in in next pass */
+-   label_mark_use(c, f->lbl_loop_bgn);
++   label_mark_use(c, f->lbl_loop_bgn_idx);
+ 
+    /* create branch to loop_end label */
+    emit_inst(c, &(struct etna_inst) {
+@@ -1998,8 +1998,9 @@ static void
+ etna_compile_fill_in_labels(struct etna_compile *c)
+ {
+    for (int idx = 0; idx < c->inst_ptr; ++idx) {
+-      if (c->lbl_usage[idx])
+-         etna_assemble_set_imm(&c->code[idx * 4], c->lbl_usage[idx]->inst_idx);
++      if (c->lbl_usage[idx] != -1)
++         etna_assemble_set_imm(&c->code[idx * 4],
++                               c->labels[c->lbl_usage[idx]].inst_idx);
+    }
+ }
+ 
+@@ -2301,6 +2302,8 @@ etna_compile_shader(struct etna_shader_variant *v)
+    if (!c)
+       return false;
+ 
++   memset(&c->lbl_usage, -1, ARRAY_SIZE(c->lbl_usage));
++
+    const struct tgsi_token *tokens = v->shader->tokens;
+ 
+    c->specs = specs;
+@@ -2430,12 +2433,13 @@ etna_compile_shader(struct etna_shader_variant *v)
+    etna_compile_add_z_div_if_needed(c);
+    etna_compile_frag_rb_swap(c);
+    etna_compile_add_nop_if_needed(c);
+-   etna_compile_fill_in_labels(c);
+ 
+    ret = etna_compile_check_limits(c);
+    if (!ret)
+       goto out;
+ 
++   etna_compile_fill_in_labels(c);
++
+    /* fill in output structure */
+    v->processor = c->info.processor;
+    v->code_size = c->inst_ptr * 4;
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.4.bb b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
index 2a1ecd3124..3289cd63a9 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
@@ -3,6 +3,7 @@ require ${BPN}.inc
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
            file://disable-asm-on-non-gcc.patch \
+           file://etnaviv_fix-shader-miscompilation.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
            file://0002-hardware-gloat.patch \
 "
-- 
2.13.2


