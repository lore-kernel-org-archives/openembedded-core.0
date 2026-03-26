Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7983410A62EF
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48778.1774535429316588750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZKGQp+mD;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so9894755e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535427; x=1775140227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjp4NjiSAkuwpRGyecde1/mi0jhSg3WY2+9qb9X7FNE=;
        b=ZKGQp+mD47nV2XTjD2+yW403M6vR9y9qrKRE0kJPHttoihWMqz1WZaJfQQi0LuQaEB
         Fv5nqrG15sxk0Ud3RhgA3gwE3i0+8XAIlM/U9HUvW4J963HZPBJ/Y36JIqI5UqtcBzMP
         eKAqt7Z5LC9CZnju1KZC/FmvxuwjU6NRn6ltlIaATn6QSklJ/ijzsmI6wDxl5qxgcFmo
         TPWA4BIDAmmhUhVoLvk1TpPLr+bLCaN2QCNQ2mk0NkoD8M8IwFTMSGiu7GbTjTS35xX4
         sZ3o3mUm7j1/3OPaeCSOvIYd+r4c/3qGSzHbsB+M3BHDB1W8CJwtWJ+ktdpRfb543pXg
         AVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535427; x=1775140227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjp4NjiSAkuwpRGyecde1/mi0jhSg3WY2+9qb9X7FNE=;
        b=lrKTrGJU8f+y8ElXkMzWCeICHqTRfUlDwOfHzLzDGiIbM2/AJtoJ6oJbk87YJt268x
         erVC3IQ5VaybDXMN/aY0gx6/ADz+HwbqP+VKyJJrtHJ+HhNWbVyGPnEkYalqBt1XBVMc
         2ZdD4lEX7rhboi31nQxCcSm2ktfjc0mQMIOtbelmB5lSmMCL9TJuKlGCW5gMKRVaQJ86
         2SxKLf31kRBdRswIW449OkPRGLseF9JiujzD1B5wUgufVrJvEm62yID2WRWJ1TT8mf/b
         W9JvopKM98MgmavvSV/Eu+OW+hIficfm5Gd4HtvPRqm4ojMweAAVDrtW3i53cO8kwVsK
         4iGw==
X-Gm-Message-State: AOJu0YzEjw5U6Adgkciq3XzdU3qnPKn3jbTAJy2OO0ycwaqwR0eKJonX
	a14u+3y+0vj2MtHtzAPrHW9Zh4CFJvDcNfnXj0VpkRn1LwZR0+zfRRV1Rr9BUw==
X-Gm-Gg: ATEYQzx1Btj4n3y+wwXgcY6BpxRu5SB4KYdIHDlW1LZ25GkM0Y+I/SEnJxoH6BH8GxR
	gfYRrSEd7wZnxOVbiVLXz7BKCEvek8Ac3Bkf78yPuiokSZbbfTNDLzGh1qyVsTckQtD+x965LOE
	7glsiMXl9PDwDrt6FfdAt4/gFEN4I3Bf8tq0mhPpByX0IGP6aogqcbFnSigDxhd7NL17vnnAHKy
	gJFAWrCNbhsUP+yrOnZ007x1KOSy2hnUru2bWsHl7nVIcO/y+dAkkAgsd23EXDihS6nKC66uttE
	UoWxMQykiWKf2MwJss3gkg+r4KGpa8Se1UFlJ0msmluPXnsmLISGH/ULQsrYcdWuFV+HwrfGAIL
	FZGbp+gV9lce1HcrnGLxASmYNT9RCu/kfo39LAM5+eREoIiT1RZctAzxPS3AKl8QXyFRS4bZ1x/
	Gcqr19HqnH6PHkKw==
X-Received: by 2002:a05:600c:154b:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-487243fdc55mr19823005e9.6.1774535427315;
        Thu, 26 Mar 2026 07:30:27 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:26 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 01/12] python3: Add warning comment before PACKAGECONFIG[freethreading]
Date: Thu, 26 Mar 2026 15:30:09 +0100
Message-ID: <20260326143020.2083293-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <18A06529173E9998.57592@lists.openembedded.org>
References: <18A06529173E9998.57592@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234004

The warning comment is really needed. While Python 3.14 supports
free-threading officially, the ecosystem around it does not yet.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/python/python3_3.14.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 7a1ad1e386..c23605f59c 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -112,7 +112,14 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+
+# Some LLVM/CLANG subprojects (e.g. lldb) and many Python modules
+# do not build when free-threading is enabled. Also, the support
+# for free-threading in many Python modules is not yet production level,
+# although they may build fine.
+# This is highly experimental. Do not enable it!
 PACKAGECONFIG[freethreading] = "--disable-gil,--enable-gil"
+
 PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
 PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
-- 
2.53.0


