Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37873FC981D
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:46:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38746.1774824398859442289
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dx/+wVm2;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so37229765e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824397; x=1775429197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Dd+FrHpCNy79P3B933WiRSDFENewdEom0cBtxoJ3g=;
        b=dx/+wVm2WbF3milBBeD3w/OFdy8NhdR23rzHEyuacymtwimpJSUGE3i8FRdbgKVBgE
         SQQ8tUPG+bxNjmzwmCG1s9G8vuNHRiRkrZ0nfhgkTbheXkBuNA677gmqlAc+Wnr9Vzi3
         4yg3F2kvZcEM3yGg7PCSKxO6mtktBAUyRSBXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824397; x=1775429197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a8Dd+FrHpCNy79P3B933WiRSDFENewdEom0cBtxoJ3g=;
        b=Ssz7Xonr2FCQ3iZitIAUJHl8Kp041P1bwIYoHQ2GpsuipMtVMAlj8ZPwbp8ueah5Kd
         Jr6I3LSyzvI2zUJE1dKnmuhVSuZ8mCPhOQn403uxy6dK/etwnCim9JNxL+4om+DVaU4c
         knOC5h7ZYy0JDl4y3OG3c3cyy1DVQ6nawd7QSjd3rsQ4IjNKX9CqQV/Clb+Tn2xJv0Sk
         u/pxNg46nq6hQ1CilHIvuAgWPQ4JG3PlnY8+WbRp1svdGcTTzzcqIfa4YCCqghOra3Fr
         ML5PRNS+KAT2ZmW+7qQizNTknJq4WrY+FUVCdGFn2wJ/zu4tlz4hBiHV1G7pZ5hHaOaB
         1fNA==
X-Gm-Message-State: AOJu0YzPws4bSL9gF+FQAw/lMTocQ3tm9igvsFHv01c5VJTXDB6nBQUr
	odup25Z+jHirNXFaU2S9D0gg0VLAztobXJY35hdKlZNR2tHAuKoy1DPQ6EsNk96XXLG8E0u1rch
	59RTrrrU=
X-Gm-Gg: ATEYQzz7X6NzowkeWYdCms7sfLN96puN4+/1dvnRo8JPqYlKtuILyuSyeFAeGGq5wa9
	buRvf0a/VTFteRB3tqCOJ7ucfLRXCp8KJ36rOBC+yk/2CUkcKz3Ls1IPImYJx7RgH9mujOWi1fe
	P4f0dOxhstPvovpq4egGhiC91+/BaiHZNVjvVTfOtNqu67J+mQQigCi0Iu8yM4sN4ro/8bDLe7p
	YhLGGTujphbxoYr8ur1yNj6bFNGkiJDZBU2Wn+TSSdadxzJ0F8CLh/A9uGLSsPvQOMmrm2xfaTC
	2KrIknTgrTJ8X3wqJ5UScKedz8peuptRO6VtSLRU7+XHYH9swt6jCrrkkY1BAe/kkp1wYzpO7z0
	mjVUoIzSjT9ljyp2AibTdjW/NX3lVR6F5l0SNKXGrD2/ZOHButhARNA8NF9lAa1E8u736z8Z9xN
	IRg3m004YM6tLGec4uPyLWVonqRUqROVTG7GjET6wWwdqM02BadWjJyHFYsg7Tkoten+BJubEsE
	/3ldIlX0PeLLyQj7xdOgICWLzQ=
X-Received: by 2002:a05:600c:3b04:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-48727eddef6mr168335975e9.22.1774824396961;
        Sun, 29 Mar 2026 15:46:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061eeeasm133760375e9.2.2026.03.29.15.46.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:46:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/11] elfutils: don't add -Werror to avoid discarded-qualifiers
Date: Mon, 30 Mar 2026 00:46:15 +0200
Message-ID: <4ad061a46e26b12c1f2352274fe7c9a829fe9756.1774824253.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
References: <cover.1774824253.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234190

From: Martin Jansa <martin.jansa@gmail.com>

With glibc-2.43 on host elfutils-native fails with:
elfutils-0.191/libcpu/riscv_disasm.c:1259:46: error: initialization discards âconstâ qualifier from pointer target type [-Werror=discarded-qualifiers]

elfutils-0.194 in master doesn't have this issue thanks to this patch avoiding -Werror from:
https://git.openembedded.org/openembedded-core/commit/?id=1d6ac3c811798732e6addc798656bbe104661d77

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 ...001-config-eu.am-do-not-force-Werror.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index 0fd6d31af19..5156e5c9f6d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-debuginfod-Remove-unused-variable.patch \
            file://0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch \
+           file://0001-config-eu.am-do-not-force-Werror.patch \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1365.patch \
            file://CVE-2025-1372.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
new file mode 100644
index 00000000000..d4e141927f1
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
@@ -0,0 +1,34 @@
+From e169c3fc734be1783b3e1a4768dbec05fb64cb4f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 22 Nov 2024 12:50:48 +0100
+Subject: [PATCH] config/eu.am: do not force -Werror
+
+This is undesirable when compiler versions may not be the same
+as what upstream is using for their own testing.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ config/eu.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/config/eu.am b/config/eu.am
+index 0b7dab5..5e7a03f 100644
+--- a/config/eu.am
++++ b/config/eu.am
+@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+ 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+ 	    $(USE_AFTER_FREE3_WARNING) \
+-	    $(if $($(*F)_no_Werror),,-Werror) \
+ 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+ 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
+@@ -109,7 +108,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
+ 	   $(TRAMPOLINES_WARNING) \
+ 	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+-	   $(if $($(*F)_no_Werror),,-Werror) \
+ 	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+ 	   $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \

