Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A31C10A3D9E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 18:15:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54431.1774548901108282584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 11:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZAt1rB14;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fe655187so14832035e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774548899; x=1775153699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq3DmmGMZHCekH2bL/Hy3KpUMhPujSR9aWaYKP6wdnI=;
        b=ZAt1rB14Q2g7X/lLwgKzzhGD6HGJPw5Q0gHlOK4VZ76BlhtqzryinMnM+uJuZW0K9H
         7fI5XHGpo7p+69WgNkpn84KZ6NrC/F255MwNzCU2YDt25MJ48MTifjtzvB2AVS59Yxuc
         oyr3hN5tA02YWUkt7IvuwqSnLXlvkbjjFhmuUzSlJxyIqcqHNhW0vEKrCyp/y3/n0V45
         FNpWXZsw/BcE4AxVLZ71DeLYHv/d6nisY2ailzXibnH/1Fmu6RNDIusRQ2ZhN2nNfiuG
         MnV2CeNSE18JtdIWpPA5lroRsP0N0JBSQ1B9+FSk7eLK46GnPSOz69L3noZcTTK+sCu0
         vc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548899; x=1775153699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mq3DmmGMZHCekH2bL/Hy3KpUMhPujSR9aWaYKP6wdnI=;
        b=euiqxhbq82MdbyCg5kd51n5HdgFqgnLBR19sCaJBuoXwGoWlCxR0625lrx2mAbQGYd
         Dd22Z64Sspa9v/0rVHHGVuJlcDCkKncoFujb8lnySZyWnzRkaQhbAl/OVzEdtWNgDWDe
         S/lvCE9kEzwoqyH1bzvvKkjMieEDkzgF27ht/fVoeowJQyZMfCR/S7REGivC7Q29qie8
         6ecOEhl2ntIGXvgMRBlcz/0jnL5VWbmoTA98kb7d/IywENbd4MXoYLlIUE3Zr9KA56bE
         p5ukHWViih+BJCQX03xTegNv0JMFv7yr7r127gBCnnvfiYl7irNGVX8bJM7qpQMev9vT
         a+pQ==
X-Gm-Message-State: AOJu0Yz/biHlcuuHMMuFyZ51P8dE4FeeYwVJa7VCrEJyFzg8xMyPDZQ5
	21IZpVdmp0BJRQwaSw7na59Q0JYy+IpmSUEfOGtVolCY4WrrTDIWPOnDOEvVIShO
X-Gm-Gg: ATEYQzwBBFdJ75tflfheLqXQjJFrby6NRyDHpH3z7VE7pWrCcjTvNdfHo9GsWJvjy5S
	ksuqUG4vtDVL/K0XgU5BG5S8HPyKva1hqVKeZngtyIM/a10Qz+l+ge1Ij9n2hmYS5R6aQKu4QdY
	+HFk4zS0hDy322anSZvihLBapbl4KCNqJRh/pyOTsk66TBR63fCIcJO2bZf8UuLlwMwmu/4JWfC
	VzuIkw3WqN71D+yd+0zx2cvzUjnxmHw0ndg0Nfm9HtaNiXlZvpR6WfavFcrC7G8+hSZ/4rBr3FV
	28rSQJYE54dHwe9aTkFv36RHimc0pQu/IGpLvR9VsvqeLBHJ40DssmtQFWPI6nnU5m7GGJ6+VY2
	PwnU2gi7/2Jko2GUFHY4TVuuKwiqhhUTxbvzVzqq6aUC/+ri9XZfJoCITzkFg6IEojDVLkRlOwC
	7MLq4S/IeBk2nO/HH4fhPVDvsnog==
X-Received: by 2002:a05:600c:3f07:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48715fea9bbmr119789935e9.12.1774548899351;
        Thu, 26 Mar 2026 11:14:59 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487208ca5b0sm79515715e9.2.2026.03.26.11.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:14:58 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 5/6] elfutils: don't add -Werror to avoid discarded-qualifiers
Date: Thu, 26 Mar 2026 19:14:49 +0100
Message-ID: <20260326181450.1262870-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326181450.1262870-1-martin.jansa@gmail.com>
References: <20260326181450.1262870-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 18:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234039

From: Martin Jansa <martin.jansa@gmail.com>

With glibc-2.43 on host elfutils-native fails with:
elfutils-0.191/libcpu/riscv_disasm.c:1259:46: error: initialization discards âconstâ qualifier from pointer target type [-Werror=discarded-qualifiers]

elfutils-0.194 in master doesn't have this issue thanks to this patch avoiding -Werror from:
https://git.openembedded.org/openembedded-core/commit/?id=1d6ac3c811798732e6addc798656bbe104661d77

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 ...001-config-eu.am-do-not-force-Werror.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index 0fd6d31af1..5156e5c9f6 100644
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
index 0000000000..d4e141927f
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

