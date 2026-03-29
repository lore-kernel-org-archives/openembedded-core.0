Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF400FC981E
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:19 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38380.1774823889774473304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lraR4YYB;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so240965f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823888; x=1775428688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Dd+FrHpCNy79P3B933WiRSDFENewdEom0cBtxoJ3g=;
        b=lraR4YYBPiPvu5jTEF6PDDnJXosfeiLFkBs0fVIFS8XAwcSt1D37dxqgZNFkr3ATXE
         +wbsKrD26Q6quFE7Yy/0JBMnGP5O6pgFixQh12uLoOQ9K6U1Z+R938URWdbmpqjHekCd
         /1QzKlwrkWqFte6g9Q1es9Fa5erfHxHQYBOOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823888; x=1775428688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a8Dd+FrHpCNy79P3B933WiRSDFENewdEom0cBtxoJ3g=;
        b=jz9UKb5uXdt4qynLS7YmOJF50rUmDpw8O1j3S+HAZLLdweLgWeSVsto2BQDVFA7W/7
         am4BFt4pwPiXonOwmvb+1K16YEpwpqyiv6X3kA5YcSxfXE0btvVSx/C26+fOpj7O736b
         iuj3kRzY2P8rJ4jhpUVBjzXOjxphrPm3tKEtmtNdo/sahkPsCYqVu0D4om2MD7Soq9xz
         zBxdddxu47Bar15ESC4pJF7ZeNij4qeXHmOnl7ec5v0Nug81JMNJ8tKOJHWF/lQoElin
         t5SzHv3/BeRxKH4JgcIr+nEd7v9RKpu74zSod9BIphexxtZC9cJYzbzuASwCn9AoLtMN
         gI8w==
X-Gm-Message-State: AOJu0Yxb6SFVIluTCIbtmexYx3p/+m4yjBQWcUEbspCaWR8cKoVnXMm4
	v7P6iPdmQ0fC4/ex0gRsFoF4JjLZ2c0GjZIYqYdpg8MkngjMRyR/DzI37tCE4Ti08npUd+yPGid
	IcAXs4Os=
X-Gm-Gg: ATEYQzxIQXY4Zss2b0i32egfTc46P1Thxa7P9GiVc3Ybtvd2idotp+d/iBQrnB9rp2C
	/X9v9iVu0lSgE07gKczHfyOxr7rDxRek4rjCLV8FuE6MigPUYjW6KqrGLGfRTwC+ZTfLhk4Sc0C
	VEPlsjqyOobPq3Wim2PtCjkvVR9/ToMhRdu+8lwozy51cBtKuTQbjueFdg8UhYsbTNZyzweZaOI
	W+vL+Sp+T8pavJYR2vzR0V4OZ3oQMgsHbBKMl4nAnf7bDKzw6/Kg2XXHooSU3HmlMFZ4wvHT+WN
	XV/jZZdL2/MNUt4R6bb4p3fDpY++BwWBtYM7KuT8mooBe+RmgPTKqradu/tlOQsczjIgH3gxexm
	22kjA91PsJ4RqcMrKaUPRhuydVt7BFWxz4z5nr4NVabYvXS2zWUonx+oHQ7U2ProNVPewTbPx8T
	iOVxL7pOiIWVbt+zeiT3qCZKCj7vpr+GwHlsbokZ/sckj8DI7xrupYWwp3v2SxrzuhlrkTae433
	Ewvz0neZcyNhbd2+zQsDLVKcG93ZaNLHLtHAw==
X-Received: by 2002:a05:6000:144f:b0:43c:ff58:35c3 with SMTP id ffacd0b85a97d-43cff583739mr2493753f8f.10.1774823887753;
        Sun, 29 Mar 2026 15:38:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/16] elfutils: don't add -Werror to avoid discarded-qualifiers
Date: Mon, 30 Mar 2026 00:37:40 +0200
Message-ID: <4ad061a46e26b12c1f2352274fe7c9a829fe9756.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234166

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

