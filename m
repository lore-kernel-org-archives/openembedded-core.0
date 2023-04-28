Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374B2C77B7E
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.14787.1682671714702451387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Vf+WPfd+;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-2f40b891420so9227479f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671713; x=1685263713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+Fw8TUijwc1bcCjGIGvLGAQHmGWPKU7z2E7BmQoj/Q=;
        b=Vf+WPfd+nJY65TSiAcBhbZtxCoEkmhSdTDH6XDIuBG6iAMEhBPOTe5s05A8Lk6R0c8
         M9+tLhib/BaAzkom4CEm7IBvOKRNq6lmGbHFJhkZOO5VsUbnzAo3GYTJwVoZK4uW3Wb6
         /MeMp++ua2ibw7IzhIiE+e0PecRz8PeE/9yR2K0WdJMYrBvqdR11WyqdkguM/fSp/7HK
         H8u3Gs8vd3sLpl+y97lCjwLGQteHn4jhUrG+JfsZsd+FbX7NNqYDaBUL/Q7EAM3OLgDY
         6dteAuawOVMH1V8mg/dIHVMP9aVqOZ4hiVqr2hUhy6WYvLgVQZkXiBOrSH29uy48hKCL
         kmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671713; x=1685263713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+Fw8TUijwc1bcCjGIGvLGAQHmGWPKU7z2E7BmQoj/Q=;
        b=TdMPN+thuwUG8QPWkQ8JdJXXLWnFo7smNe54rYCoYUOp6lfUoawS7xoVnZ/a1rXret
         ewQjaEqs6+DgSix1lJ6Ii2rGuzbQK/eKyq6hZUIacBiyQfat2/5k0QaAGw28VKFFHdWM
         Kv+oKBTfTFQoVnsFs9CjTWJ0XIJ0XXYBeSvHIR9+ykUMvjiCBlRW5jKYkwRXDGTWzx7H
         VXa9IY6MLZBjHF8SKENNUCxwKRPeNocY3/PYFAJQFX4gL/zWkUUz3rHrCOXUH9J8Z5BC
         LOragirrwNt7HaAtkJ9kFYLtHuX1hBqdahZk7CLN4GWoDa7bJqZYv0bZMFfEByQKMVNp
         22Eg==
X-Gm-Message-State: AC+VfDy3phzfEx8Vh2ADGplWT7yJsVS04MeKBSUFwZzHzYBBljxvh3RT
	YrUCFnGcHQcK4AdDgzy0mlg/+HkQWK4=
X-Google-Smtp-Source: ACHHUZ6+WkHLPjc8IY8l2xPDUwoCfZsvOYOm+Cbk2hD/4zfgZzFO79yB+3mfhdooqLWtYZMgUCuLRg==
X-Received: by 2002:a5d:4b02:0:b0:2fa:26cc:71f0 with SMTP id v2-20020a5d4b02000000b002fa26cc71f0mr3396172wrq.10.1682671713113;
        Fri, 28 Apr 2023 01:48:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 11/11] insane.bbclass: enable 32 bit time API check (as a warning) on affected architectures
Date: Fri, 28 Apr 2023 10:43:52 +0200
Message-Id: <20230428084352.836515-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180522

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

---
v2: downgrade to a warning from an error
---
 meta/classes-global/insane.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 8788f58fc5b..6479fc0964b 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -34,6 +34,7 @@ WARN_QA ?= " libdir xorg-driver-abi buildpaths \
             missing-update-alternatives native-last missing-ptest \
             license-exists license-no-generic license-syntax license-format \
             license-incompatible license-file-missing obsolete-license \
+            32bit-time \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -44,7 +45,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz patch-status-core\
+            patch-fuzz patch-status-core \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
@@ -512,6 +513,11 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
     """
     Check that ELF files do not use any 32 bit time APIs from glibc.
     """
+    thirtytwo_bit_time_archs = set(('arm','armeb','mipsarcho32','powerpc','x86'))
+    overrides = set(d.getVar('OVERRIDES').split(':'))
+    if not(thirtytwo_bit_time_archs & overrides):
+        return
+
     import re
     # This list is manually constructed by searching the image folder of the
     # glibc recipe for __USE_TIME_BITS64.  There is no good way to do this
-- 
2.30.2


