Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1D7F327A5
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 05:42:56 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11229.1776750173195731534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 22:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BqZhw/oX;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso13725405e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 22:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776750171; x=1777354971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq3DmmGMZHCekH2bL/Hy3KpUMhPujSR9aWaYKP6wdnI=;
        b=BqZhw/oXXqtoMzgBNMw9N7E+qVtCpAB7deqYV6IoxRV3AA6QLRk79AYzDHqSI9xqd/
         MltU/22Wr2+dDvCMsKVOTumR6KzZri419Zy8CvJgvWm76+TVdgwvCv5pDe5796MDynfB
         u/vPHujwI2mNgZ0bvlKN84RGcRL7bDzAHHh7LwntdUhuNVOjaU5yRyaRGc/An/0vD3w5
         YyN3yKDIFhzoWlfdcF4qwTeSfwUO+szbATtyGeuW31sef2rV+FtiCVAjqP51CHGlRIqf
         AIYhXg/dOL7291pVlBYoaKqmTFCLksELc74Hdov88bCe/KsxZvLQ4++I5AQZYaAzgUui
         idHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750172; x=1777354972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mq3DmmGMZHCekH2bL/Hy3KpUMhPujSR9aWaYKP6wdnI=;
        b=HqNyj1HTaNl0Dapz4sMnO+uEu2IqVcF26cWVq3k+SqMXsvOYu5JiN91B3TDWvaLqDp
         qlCUzMXuGOQW7NgmGVAlFNdXnOYAOjZGrgfO3xCMeWg6aT3o5wLl11KWe+c/er4VS6VM
         wlZaPP6lSaQEknogjOBtRcA0ShzHlEu1CEK5IfjDZlfESbOf/zDwO53fjOctmodTRMsg
         cVgftqnmDqH7ila1L2y+xlY+xvWcxDy59/wScf1agaIegc0UsnG77Ki6Io+OV5yQ5+Hc
         JXjpjvzGYH/y7UNh+yiw+fKs3AX/B71gAxO7G0YavUYjebzbkmbGVReeV7SROrfollBt
         uLjA==
X-Gm-Message-State: AOJu0YxnOcAsWfPXFXZGMLE8xeDINYCjOpXd6vB6y6McBMGoy8Wt9dPB
	OLGZztIhpk0T1MUfmCIG4EuMBIuiiVN4MB+7g1cYyWCIVd1Y7RrzgEALgqyMDw==
X-Gm-Gg: AeBDieunAYI5NnNToKGrHMaxlqbMgzQzFMq1YfFeIEQg3JnuLq46qYSRqt9brC48kAl
	enB1i6JzB/rXHTeIDpnDaZHQIr/hlqG/z6+asoMnAyaDtaa5IGosNleVRXkX9I9hCyNNFJK+asm
	vhFN5/CYLiRp5AytCAJIc2Z9jGnEniYdOSbY0SFfIJaQr0/6xrMYZgmL4tz3elCfdPXPWthkA+D
	BWtJXR1HJzlrFe04k8VkTTlG8Y3HP+IJk1qm8autR5eCnm10UrEGn5uUgGivb9K4qHErtKeLdXG
	D7B/oC4oBj0LZiO10DN7xTaVbADQtkeeCOJRa3ImKQk6lUwjcC2gCKQGcYj7vL/Vihj/2bcLcXi
	4ET+KHeycRJdmKp1F31yPxu1S3t9VYqecVp3BIjD7HURacloiKc/pUMGwM2Si0wdVRG4PuYRnR8
	z8xglxEYbm5rfAWBquSmrVl1GYW4oo+HpOQuAZ6THyB1QYnz6rjziOL9WytaCJFGoonnEeJNGbt
	ZZDjKAoWSM0x2iv5mytiFmshbzAFBQ=
X-Received: by 2002:a05:600c:34c3:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-488fb792dd0mr230517065e9.23.1776750171492;
        Mon, 20 Apr 2026 22:42:51 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc10777csm392753205e9.8.2026.04.20.22.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:42:51 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 5/6] elfutils: don't add -Werror to avoid discarded-qualifiers
Date: Tue, 21 Apr 2026 07:42:39 +0200
Message-ID: <20260421054240.3264-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421054240.3264-1-martin.jansa@gmail.com>
References: <20260421054240.3264-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 05:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235595

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

