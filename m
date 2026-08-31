Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7EEC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 20:33:23 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4871.1788205810686615215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 12:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=I0lOrRss;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9390dd46b45so212912885a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 12:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788205809; x=1788810609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T0JZVbld/8nqDd7hmGip6IEZCbsaxy+9Ij78AvBrP4I=;
        b=I0lOrRss52QnIL2gwvJ88JwwZ639wBOmJaw9DI4GCowEPah0kh2cKyT9jihWJJrDuQ
         1wfKW9d2xQb8UAa8R8KST7Z4I7wHdKFTMmKJtWmakUf35+w7PWf8kmzErBcHGdkfYwN/
         TAgEUy8tk3soDQM56HXzL6Ve0WMrRnK3QdTCIGqz6RNmzfv5Uo9tx9kuJ7095Z3YNILB
         xRI3A1sM6kb9PLvUgDmBgRn73cmQL+Qr98kVFRRGRv00xPKGucjbq5OkFG0TrcHVBlhg
         Y9H+J8kPQwBcYlzaWVlc0azo9Fd8VzpFPkL5ZTlGwNAuApHtbTXNgCVr94azhRWK5ELH
         pQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205809; x=1788810609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T0JZVbld/8nqDd7hmGip6IEZCbsaxy+9Ij78AvBrP4I=;
        b=rm8Ao5AS5w0GCJ/Qi+Ob6NpbIZOzZvmPkPanLeTXNW0z4t9OSrh34HsRCWvKz/ENsA
         3QYxph7C7Cf6j9QMpdH1OIjcdwLtYOL/pDNDjzUdwRbFBVC4EQWIM0sNm1jQEZ0L+Ebx
         5bIrTGPCa6OhZ4qI0K3SnTJa51UCgH816msoQjSB7c4ealvzyJQ1lY0MbjGIVuAKaly6
         VOPgVnl5sAn/HX4zsiZhDfUALGKOyvENiayM09CDa0voPBe7KEPhVwjfnoQocAIrgEZs
         Lzj1qsCCYIXIR6SOGG4hizzKUv5Ox1wFd30Ys9SmCt9z8Z7qXRFyytVKPqKOHg3vrEpK
         o8xg==
X-Gm-Message-State: AFuF++lP1vHfiQ1lokla0cVXiIakIVenuRCHWGYD+anOtK1R2/kA87X9
	3ER/hshPZfWDLIPSpKGAYTvKymsZsSuAkIay859sjI8H+Y8nScgcGK7ezb6ZM2ijhN1wvZdINgd
	l5zqhwRk=
X-Gm-Gg: AR+sD12I14q1yckAHz2dRwjDoUcSMJwjAPL0a0J+dQbY1Haxs6SLDKugJwnFPqWOZKw
	ntQCDZqmUZ+iPfjcb9CJ52uirpGI9i6JQE8xiT5kww6W9kwhyUDqxDPJ7e1XPFBc5mgX4zeeKZl
	EINExSb9EwhwDsieus0few29IVH7/qB9apJmpfF1qD9tamDvTd3huB2DIJ/J7jnmQ6SNHeufWDZ
	qNwL4NTD8ZGfWM0L8iZrCvJzIv1yuTbPUmnoEDziwvU5h4/mOGssS/3ppDQs6iKucVNeVl7XWHi
	QfPiMrwwGs5kCUxXDfjkfjOwRFXTmgMo/1VwGnBvpyQ6DysKaXUPvvJh738eNfPhRbX8a7F16Y5
	w26x9nBGk6iPthLHrQnpYTxxcO4Ez44zmNG3sLXWYTc4sW6sXZuAfU8clLF/p3bqsGL5X17z6hb
	22L0rPnl1JpRrswq7WCzotfZBuPeGYPAZJ/u2Ixc1MtXc7IIx3eKurb62nlW4uEWA=
X-Received: by 2002:a05:620a:26a2:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-939480b0dcemr564481085a.21.1788205809043;
        Mon, 31 Aug 2026 12:50:09 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917247209sm869686885a.17.2026.08.31.12.50.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:50:08 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu: backport RISC-V TLB page flushing patches
Date: Mon, 31 Aug 2026 15:50:06 -0400
Message-ID: <20260831195006.1782480-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 20:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244775

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


