Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA88BC61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 20:33:33 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4874.1788205821627176164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 12:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Lydrb/Gt;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c2a818fc4so38553111cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788205820; x=1788810620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T0JZVbld/8nqDd7hmGip6IEZCbsaxy+9Ij78AvBrP4I=;
        b=Lydrb/GtWncusu0fyAzcsZzSfRuOROw3z3B8U+/pJiqme41TpytaOvNhbSlv29WSYI
         v0//1xyqINLiYg/xziG1OKT22ovLerhfvnlhe1cCgZRYymxYA6vR0dqLk4bSR2TUIJEM
         Bzlhghwn0RwnjS7c/Yaet3K3nKc2uNfrvLG4bgIeU+LYeiAru6IIRpWqb2Hec6SyFuur
         RIBx0LAO3X9kd0/j5ryMxY3gak8ZdVxN6hqlHfuK7G38MDvz8Ii6lVV74brV9VfXg4Gu
         ub6nNinEuRODovKWNQBOP8w2vrRaaMjiTXa+/GZBdA5FrT7+2iSvgU5PFy/LNtgDV/Se
         Da6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205820; x=1788810620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T0JZVbld/8nqDd7hmGip6IEZCbsaxy+9Ij78AvBrP4I=;
        b=ZeBEt95VQrvr/l4Q3pLWU9O1G2tVHSKgvmH7i0E/u2bqpoXW/ytItVA7e7+A3LMPC6
         FXPYTAg6u2IQDGWszyUCEBhC/EvKEMfDQ6a5Dr0KoS+Dq6xC7Ev0elRpJeBz2FIh1/Nm
         Vv2VR8NMFXXi/CUY5akH+H0zKVjYV2h9G+4fTXy+RsoMBD1ZmS+VzjnDyNLoV3NErAE7
         jN+q/JJLeaV85leM/zZZfRgOGNg54iS8+eekvZyKHbg6Q2vL7vIm6n4fUGKaXjEjFwVD
         QhTbkAfKzqnCf8+9P2vZ2el86jocoM3AIC/UC/H/O1k+hCYckeznc1JKNaBHspvCrb4o
         BaOw==
X-Gm-Message-State: AFuF++nbK2mBdnBWVxBmc0yg9Q4whXbXsHepIsHQBZMViDFMsap5Ih0A
	lB4/pTbw6EdftB0gkT4A3wJTRaucg9+rGmiU+qNNYPkZ1lHplu8gL9zsV/BsBI3GMucb7AiF5sE
	YSwwb
X-Gm-Gg: AR+sD10GMkScXml3hkdRmYWx4ih9BEI4bdRkfuUuYrD2tQgvAcSV0ZFTj7f7LgCQotr
	QXa6xNBX1bk7luvbXEFnoSFPm7yJ6gepfYRP7zMEaf3tIWFQQrvBs1WfeZp97/6mWTovvMneskG
	/YGJy2FFhEQ/ktmNi9vvkOLDKopX2eTBNCqIqS7XnryitBYifJIBK4ESAl1Oh4uhLW90iJ0aqkX
	gSFgb3dPtNvjOQHkwXRFgGBojO3JaJNoet5NJfHP/mnRtZjlGxMmYPH8C531ozTlqA0FmcP76PR
	ZijHmBu2H2/9KrpKeohGiGhgW1f/LQpbc0l0VqcY9sFidRnR3gsFoa0CTxpykb6hI4rJygGCl1/
	R297dKoUqFsDcQkwkLjObmOoxDwx60ZIciNqc9JU7NlZGgl9ugSJs6BAkPQaT9Z+ODCRX3q6QDJ
	WuGfVyyCEMhqO/4ui3qWzND+B6CrO2uwZA5iEYgCGGPTptAiwAd3F0K6yqDk2StPU=
X-Received: by 2002:a05:622a:4cc3:b0:530:9bb:54ae with SMTP id d75a77b69052e-53009bb5729mr167617241cf.15.1788205820172;
        Mon, 31 Aug 2026 12:50:20 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe7f9fedsm78236101cf.14.2026.08.31.12.50.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:50:19 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu: backport RISC-V TLB page flushing patches
Date: Mon, 31 Aug 2026 15:50:17 -0400
Message-ID: <20260831195017.1782550-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 20:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244776

The QEMU TCG framework currently does an unconditional flush on TLBs
regardless of vaddr and asid values, adding a lot of overhead to RISC-V
runtimes. Backport some patches from the qemu-devel mailing list which
improve this part of the TCG logic. For more info:

https://lists.gnu.org/archive/html/qemu-devel/2026-08/msg08496.html

Here is an example of the kind of runtime speed-up these changes help
with (taken from the upstream link):

|============================================================================
|Testsuite summary for GNU coreutils 9.11
|============================================================================
|# TOTAL: 733
|# PASS:  561
|# SKIP:  172
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 1049
|END: /usr/lib/coreutils/ptest
|2026-08-31T17:23
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

versus:

|============================================================================
|Testsuite summary for GNU coreutils 9.11
|============================================================================
|# TOTAL: 733
|# PASS:  561
|# SKIP:  172
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0
|============================================================================
|make[1]: Leaving directory '/usr/lib/coreutils/ptest'
|DURATION: 646
|END: /usr/lib/coreutils/ptest
|2026-08-31T16:10
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemuriscv64:~#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  3 +
 ...ract-sfence_vma_allowed-from-helper_.patch | 56 +++++++++++++++++++
 ...rget-riscv-add-helper_tlb_flush_page.patch | 50 +++++++++++++++++
 ...-a-targeted-TLB-page-flush-for-sfenc.patch | 47 ++++++++++++++++
 4 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-riscv-extract-sfence_vma_allowed-from-helper_.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-target-riscv-add-helper_tlb_flush_page.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-target-riscv-use-a-targeted-TLB-page-flush-for-sfenc.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f19cf70dd6..8c93227eb3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            file://0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch \
+           file://0001-target-riscv-extract-sfence_vma_allowed-from-helper_.patch \
+           file://0002-target-riscv-add-helper_tlb_flush_page.patch \
+           file://0003-target-riscv-use-a-targeted-TLB-page-flush-for-sfenc.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-riscv-extract-sfence_vma_allowed-from-helper_.patch b/meta/recipes-devtools/qemu/qemu/0001-target-riscv-extract-sfence_vma_allowed-from-helper_.patch
new file mode 100644
index 0000000000..2ece946400
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-target-riscv-extract-sfence_vma_allowed-from-helper_.patch
@@ -0,0 +1,56 @@
+From 8507fd6795753697f557d11e144568f1bf8a00cb Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 24 Aug 2026 17:54:21 +0000
+Subject: [PATCH 1/3] target/riscv: extract sfence_vma_allowed() from
+ helper_tlb_flush()
+
+Create a new function to encapsulate the privilege/hypervisor checks
+performed inside helper_tlb_flush(). The idea is to pass GETPC() as an
+argument directly to it inside the helper_tlb_flush() function.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2026-08/msg08496.html]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ target/riscv/tcg/op_helper.c | 19 +++++++++++++------
+ 1 file changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
+index 3e94005d2b..8039df2b48 100644
+--- a/target/riscv/tcg/op_helper.c
++++ b/target/riscv/tcg/op_helper.c
+@@ -588,18 +588,25 @@ void helper_wrs_nto(CPURISCVState *env)
+     }
+ }
+ 
+-void helper_tlb_flush(CPURISCVState *env)
++static bool sfence_vma_allowed(CPURISCVState *env, uintptr_t ra)
+ {
+-    CPUState *cs = env_cpu(env);
+     if (!env->virt_enabled &&
+         (env->priv == PRV_U ||
+          (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)))) {
+-        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
++        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
++        return false;
+     } else if (env->virt_enabled &&
+                (env->priv == PRV_U || get_field(env->hstatus, HSTATUS_VTVM))) {
+-        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
+-    } else {
+-        tlb_flush(cs);
++        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
++        return false;
++    }
++    return true;
++}
++
++void helper_tlb_flush(CPURISCVState *env)
++{
++    if (sfence_vma_allowed(env, GETPC())) {
++        tlb_flush(env_cpu(env));
+     }
+ }
+ 
+-- 
+2.55.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-target-riscv-add-helper_tlb_flush_page.patch b/meta/recipes-devtools/qemu/qemu/0002-target-riscv-add-helper_tlb_flush_page.patch
new file mode 100644
index 0000000000..c272a80b08
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-target-riscv-add-helper_tlb_flush_page.patch
@@ -0,0 +1,50 @@
+From eb8773847363989d9396492a3c9bc517ca04959f Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 24 Aug 2026 17:54:45 +0000
+Subject: [PATCH 2/3] target/riscv: add helper_tlb_flush_page()
+
+Add a page-level counterpart to helper_tlb_flush(), and condition its
+internal call to tlb_flush_page() on return value from the new
+sfence_vma_allowed() function.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2026-08/msg08496.html]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ target/riscv/helper.h        | 1 +
+ target/riscv/tcg/op_helper.c | 7 +++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/target/riscv/helper.h b/target/riscv/helper.h
+index 4fc2d3a155..652f85a5c7 100644
+--- a/target/riscv/helper.h
++++ b/target/riscv/helper.h
+@@ -137,6 +137,7 @@ DEF_HELPER_1(ctr_clear, void, env)
+ DEF_HELPER_1(wfi, void, env)
+ DEF_HELPER_1(wrs_nto, void, env)
+ DEF_HELPER_1(tlb_flush, void, env)
++DEF_HELPER_2(tlb_flush_page, void, env, tl)
+ DEF_HELPER_1(tlb_flush_all, void, env)
+ DEF_HELPER_4(ctr_add_entry, void, env, tl, tl, tl)
+ /* Native Debug */
+diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
+index 8039df2b48..723a45d181 100644
+--- a/target/riscv/tcg/op_helper.c
++++ b/target/riscv/tcg/op_helper.c
+@@ -610,6 +610,13 @@ void helper_tlb_flush(CPURISCVState *env)
+     }
+ }
+ 
++void helper_tlb_flush_page(CPURISCVState *env, target_ulong addr)
++{
++    if (sfence_vma_allowed(env, GETPC())) {
++        tlb_flush_page(env_cpu(env), addr);
++    }
++}
++
+ void helper_tlb_flush_all(CPURISCVState *env)
+ {
+     CPUState *cs = env_cpu(env);
+-- 
+2.55.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-target-riscv-use-a-targeted-TLB-page-flush-for-sfenc.patch b/meta/recipes-devtools/qemu/qemu/0003-target-riscv-use-a-targeted-TLB-page-flush-for-sfenc.patch
new file mode 100644
index 0000000000..36796e34f4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-target-riscv-use-a-targeted-TLB-page-flush-for-sfenc.patch
@@ -0,0 +1,47 @@
+From 858d6d9a587e4ed44f92e017375c5265bc40934b Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 24 Aug 2026 17:55:00 +0000
+Subject: [PATCH 3/3] target/riscv: use a targeted TLB page flush for
+ sfence.vma with a vaddr operand
+
+sfence.vma unconditionally called helper_tlb_flush(), regardless of the
+rs1 (vaddr) and rs2 (asid) operands, forcing a page-table walk on the
+next access. Use helper_tlb_flush_page() whenever rs1 != 0, falling back
+to the existing full flush for rs1 == 0. This makes RISC-V behaviour
+more similar to ARM's equivalent (tlbi_aa64_vae1_write), which already
+does tlb_flush_page_by_mmuidx() instead of a full flush.
+
+Pass get_address(ctx, a->rs1, 0) to gen_helper_tlb_flush_page() rather
+than get_gpr(), so that the address being passed matches the current
+addr_xl width regardless of '-cpu' input. Otherwise, the raw register
+value can carry garbage above that width and never match the address the
+TLB entry was actually filled under, so the flush silently misses and a
+stale mapping survives.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2026-08/msg08496.html]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ target/riscv/tcg/insn_trans/trans_privileged.c.inc | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+index a8eaccef67..8655fa332e 100644
+--- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
++++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+@@ -155,7 +155,11 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
+ {
+ #ifndef CONFIG_USER_ONLY
+     decode_save_opc(ctx, 0);
+-    gen_helper_tlb_flush(tcg_env);
++    if (a->rs1 == 0) {
++        gen_helper_tlb_flush(tcg_env);
++    } else {
++        gen_helper_tlb_flush_page(tcg_env, get_address(ctx, a->rs1, 0));
++    }
+     return true;
+ #endif
+     return false;
+-- 
+2.55.0
+
-- 
2.55.0


