Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B8ECD37AA
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 20:42:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.31971.1694810563111725025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 13:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EeeAUR+l;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-403012f276dso27933935e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694810561; x=1695415361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+opBeylsxxjKlEummqEgBlMnk9IZpVyAaBZiyzWBm9s=;
        b=EeeAUR+ltiF0RgelGsc7KuKpyxSnT8jTXYtOldjMdRf8fJmwb6lScHo0I8cgWCP2W5
         BkniTg0XK+zbjcIxDs3uax7jpsGUipVE+MLH/tNLKodl5963kH/NK/Ico6w91SPpQAmS
         J9wtVPFCKAzq4T0IXAVghKGrzSbHBUfwIN/TcvYH8573RyB0K97FePRBHnTfoVgRRX5F
         4gt9inXQk/CM5ylzKkHEuecM35hEvRzieXrMMT/JIUHK5pv7OycSCBPJ5njdR7Z8RN+0
         kqg/fijBm/SxquTH3VQdyVXKe5zwqbWCLsnhps2BQomnmM9JEaU79fwQOJtCvRj7hgUB
         61lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694810561; x=1695415361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+opBeylsxxjKlEummqEgBlMnk9IZpVyAaBZiyzWBm9s=;
        b=SnV99hQ2osCuo75NpHOg6VWRzTtX+SMmte6M2E/rGkA1enB4AIdr45GM0CQd83WDRm
         p22uMKw0pkehKqtLKzaN3MrVVV+i9Rkl3LF/OfdgEpkMirWiMbSn3yhiG4ImVpNTGvIq
         JECwxqHImZcn5ZL/sKqRIijYpWUdvsYXLReb5I7HbVzjzgXRrBBIOwHGBayEQ1qd2fH3
         YwPW1jpBKsDbx6lXfr2zDzbgv/1D4ZNfdTam0OnC4uSD14mCoUKKQCs2F2/5w+gPKTkp
         az0b1NvMnj+QDjdS7u0JWR1AcNp86o56MAV+PjE/unsXgmW75k8fm7pleDw95R2uWmr9
         4FZg==
X-Gm-Message-State: AOJu0Yz7AtEr0zKnoAEq+BjlmpEneDb16O2oD0BQV/oJbjs5wn0jm5kK
	mkzYzV2uINEETK+DIikgi0uU4hVvdao=
X-Google-Smtp-Source: AGHT+IHqDKvPkOKuOcs33M2L0/NHPS4wxdjYQ5Cs9iC10zse6Q9+K4R+IiqnN2qQHPh5lDDDU39QZw==
X-Received: by 2002:adf:e748:0:b0:31f:e759:d68e with SMTP id c8-20020adfe748000000b0031fe759d68emr2276744wrn.58.1694810560882;
        Fri, 15 Sep 2023 13:42:40 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n18-20020aa7c792000000b005256d80cdaesm2651233eds.65.2023.09.15.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:42:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [mickledore][PATCH] gcc: backport a fix for ICE caused by CVE-2023-4039.patch
Date: Fri, 15 Sep 2023 22:42:34 +0200
Message-ID: <20230915204234.3547739-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 20:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187768

* see:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111418
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111411

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-12.3.inc        |   1 +
 ...ch64-Fix-loose-ldpstp-check-PR111411.patch | 117 ++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch

diff --git a/meta/recipes-devtools/gcc/gcc-12.3.inc b/meta/recipes-devtools/gcc/gcc-12.3.inc
index 5896f26e1a..5655b6f46d 100644
--- a/meta/recipes-devtools/gcc/gcc-12.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.3.inc
@@ -64,6 +64,7 @@ SRC_URI = "${BASEURI} \
            file://prefix-map-realpath.patch \
            file://hardcoded-paths.patch \
            file://CVE-2023-4039.patch \
+           file://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch \
 "
 SRC_URI[sha256sum] = "949a5d4f99e786421a93b532b22ffab5578de7321369975b91aec97adfda8c3b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch
new file mode 100644
index 0000000000..a408a98698
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch
@@ -0,0 +1,117 @@
+From adb60dc78e0da4877747f32347cee339364775be Mon Sep 17 00:00:00 2001
+From: Richard Sandiford <richard.sandiford@arm.com>
+Date: Fri, 15 Sep 2023 09:19:14 +0100
+Subject: [PATCH] aarch64: Fix loose ldpstp check [PR111411]
+
+aarch64_operands_ok_for_ldpstp contained the code:
+
+  /* One of the memory accesses must be a mempair operand.
+     If it is not the first one, they need to be swapped by the
+     peephole.  */
+  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
+       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
+    return false;
+
+But the requirement isn't just that one of the accesses must be a
+valid mempair operand.  It's that the lower access must be, since
+that's the access that will be used for the instruction operand.
+
+gcc/
+	PR target/111411
+	* config/aarch64/aarch64.cc (aarch64_operands_ok_for_ldpstp): Require
+	the lower memory access to a mem-pair operand.
+
+gcc/testsuite/
+	PR target/111411
+	* gcc.dg/rtl/aarch64/pr111411.c: New test.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=2d38f45bcca62ca0c7afef4b579f82c5c2a01610]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ gcc/config/aarch64/aarch64.cc               |  8 ++-
+ gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c | 57 +++++++++++++++++++++
+ 2 files changed, 60 insertions(+), 5 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
+
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc
+index 6118a3354ac..9b1f791ca8b 100644
+--- a/gcc/config/aarch64/aarch64.cc
++++ b/gcc/config/aarch64/aarch64.cc
+@@ -26154,11 +26154,9 @@ aarch64_operands_ok_for_ldpstp (rtx *operands, bool load,
+   gcc_assert (known_eq (GET_MODE_SIZE (GET_MODE (mem_1)),
+ 			GET_MODE_SIZE (GET_MODE (mem_2))));
+ 
+-  /* One of the memory accesses must be a mempair operand.
+-     If it is not the first one, they need to be swapped by the
+-     peephole.  */
+-  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
+-       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
++  /* The lower memory access must be a mem-pair operand.  */
++  rtx lower_mem = reversed ? mem_2 : mem_1;
++  if (!aarch64_mem_pair_operand (lower_mem, GET_MODE (lower_mem)))
+     return false;
+ 
+   if (REG_P (reg_1) && FP_REGNUM_P (REGNO (reg_1)))
+diff --git a/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c b/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
+new file mode 100644
+index 00000000000..ad07e9c6c89
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
+@@ -0,0 +1,57 @@
++/* { dg-do compile { target aarch64*-*-* } } */
++/* { dg-require-effective-target lp64 } */
++/* { dg-options "-O -fdisable-rtl-postreload -fpeephole2 -fno-schedule-fusion" } */
++
++extern int data[];
++
++void __RTL (startwith ("ira")) foo (void *ptr)
++{
++  (function "foo"
++    (param "ptr"
++      (DECL_RTL (reg/v:DI <0> [ ptr ]))
++      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
++    ) ;; param "ptr"
++    (insn-chain
++      (block 2
++	(edge-from entry (flags "FALLTHRU"))
++	(cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
++	(insn 4 (set (reg:DI <0>) (reg:DI x0)))
++	(insn 5 (set (reg:DI <1>)
++		     (plus:DI (reg:DI <0>) (const_int 768))))
++	(insn 6 (set (mem:SI (plus:DI (reg:DI <0>)
++				      (const_int 508)) [1 &data+508 S4 A4])
++		     (const_int 0)))
++	(insn 7 (set (mem:SI (plus:DI (reg:DI <1>)
++				      (const_int -256)) [1 &data+512 S4 A4])
++		     (const_int 0)))
++	(edge-to exit (flags "FALLTHRU"))
++      ) ;; block 2
++    ) ;; insn-chain
++  ) ;; function
++}
++
++void __RTL (startwith ("ira")) bar (void *ptr)
++{
++  (function "bar"
++    (param "ptr"
++      (DECL_RTL (reg/v:DI <0> [ ptr ]))
++      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
++    ) ;; param "ptr"
++    (insn-chain
++      (block 2
++	(edge-from entry (flags "FALLTHRU"))
++	(cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
++	(insn 4 (set (reg:DI <0>) (reg:DI x0)))
++	(insn 5 (set (reg:DI <1>)
++		     (plus:DI (reg:DI <0>) (const_int 768))))
++	(insn 6 (set (mem:SI (plus:DI (reg:DI <1>)
++				      (const_int -256)) [1 &data+512 S4 A4])
++		     (const_int 0)))
++	(insn 7 (set (mem:SI (plus:DI (reg:DI <0>)
++				      (const_int 508)) [1 &data+508 S4 A4])
++		     (const_int 0)))
++	(edge-to exit (flags "FALLTHRU"))
++      ) ;; block 2
++    ) ;; insn-chain
++  ) ;; function
++}
-- 
2.42.0


