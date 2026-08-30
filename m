Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09ED3C61DB9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 20:00:38 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15331.1788120030741831868
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 13:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B1+pzTla;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so19277231cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788120030; x=1788724830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=clKXSHsp1FE/M/MK/7TsfDTlmf9wHBxFvUyNkD/JPdc=;
        b=B1+pzTlajhsnPjgpE24ttXJ0QL0aqbDDh4khrkvvQqnWpKCLc6Ec9iXMAtRtPPaEj1
         D6s/gjCqtQsqc4r2Vfbc5qGdofpgbfiXoCOGeSROnOBAaDImGrK/zR4kiv9mu6FsFtQp
         WUNNpghcuZUE4bUdR3Q+DB8DYCqXpGiCKjRobbUaflXXMXlMusp5vmmNGRaIufYL0Dsz
         pV4MHZe3AryJz4eQk1FAiqxtgzISVFCPlz/1XLhsoVr3Eryx0jrZDYqADXbKbwV82jxO
         i3mj0KhaUOSOPEYGCz+EO/FUWN0R1jmEW7Ze1iGweKRrFKo8Enjobq4pLJIwSvtn0dm+
         et6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788120030; x=1788724830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clKXSHsp1FE/M/MK/7TsfDTlmf9wHBxFvUyNkD/JPdc=;
        b=VuLj+iaOOPQb/aypI3lLPoJ0bghhXHikqPV2J1ZDheB+WCif7mr8eSfeGVNH7i0BBg
         vTKHSf4Fla47IGBgirhwMww2ohvBnmJm5wBQr8abvBcNaFVV2tFwCmwebs1ARGm7pQf4
         vBAm1LFbmAfB5anEZP/UlSpJcU1RMsmtYMjGbViXxNhdUFalI/a2LUgziH80rSnwvD1I
         wvy5lwtzUy0/+gl145+36mJSgvmIUFHYsH4zO5OVB+iVoPRLRxfQ/rgYIQcWxOI2LmUJ
         i+W1usgLO+yMh8mt6VTzvytaAVYxQGx0tJDzS8nSGJ6zRZ/Pv4pypzZXTxBadCyJJz3R
         x+nw==
X-Gm-Message-State: AFuF++lmf1Wp3lr6h2xy/WcdNQnzo/F8Q56yg5E8R3+kFnY/HfygHB/7
	NojTbQG1/Xrcp7fJXGLqYerQKmXrMakpqSmM4GHzBw+TQLgxOUa33zbpNCP78wSI
X-Gm-Gg: AR+sD11KopBiPQQxKo6/QzdQAXSIyEx03SC47jU+WDWI7m2qpcrHDL8iu/E30e4zYDs
	kAdozrTV0oCIFcr+vndZWPWdB35GaAv+vk040wa7a9t4qYsPKtqoluNEiJyEH0I0h3NsiT565Uv
	KrxDr3tZk8iHMmBnkyNNc4+c7FzdIFR738Ay5AhCU4/t2aKJE1pTOMRfl+HDtN+VjsMmRf9wRiw
	qTXfe5pscIVa4zY1WIW1ufqWj7cWeKuIAYaCTkvqHlhWZjQS8fQJeTnRRIjDrI7lre48XOX1Mk9
	a5Hw+H6xnR17+YmukSezKTAIsf1g5ZYDX3oE9ApXVgGROr+HeGGVi/to20ytNRIRUc54u4uq912
	yfk1M7zr+n3Qi79WRLZw4igmVlS4r1Fe/mJu3kLnaq4CTe2EOEd4y6M7ik4E76bQdvtGkuT0YBo
	rqZHD3LgHZFmPqPHh4JBpHhsIcXW8G5SglMa5UgLENrC6HzyJjpLvEBji1j2MLvo4O4iRc7siCL
	qODfXrkQl9nlIH6Whv3O8/krqY6Yw==
X-Received: by 2002:a05:622a:10a:b0:52f:b36a:b943 with SMTP id d75a77b69052e-52fb96910cfmr254789051cf.33.1788120029467;
        Sun, 30 Aug 2026 13:00:29 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe7fbe06sm58212701cf.17.2026.08.30.13.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:00:27 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Harish Sadineni <Harish.Sadineni@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] populate_sdk_base: add a kernel-src SDK feature
Date: Sun, 30 Aug 2026 16:00:25 -0400
Message-ID: <20260830200025.4037481-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 20:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244698

An SDK cannot currently be asked to ship the kernel source, so
kmod.KernelModuleTest skips wherever it runs: it guards on
ensure_target_package("kernel-devsrc") and nothing installs that.
Adding kernel-src to SDK_FEATURES pulls kernel-devsrc into
TOOLCHAIN_TARGET_TASK, alongside the existing go and rust entries.

kernel-devsrc inherits module-base precisely to avoid being multilib
extended, so it is named directly rather than through
multilib_pkg_extend.

[YOCTO #16239]

Suggested-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index f32e9add019a..2c6dd1828c9c 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -79,6 +79,7 @@ TOOLCHAIN_TARGET_TASK ?= " \
     ${@oe.utils.multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
     ${@bb.utils.contains('SDK_FEATURES', 'go', oe.utils.multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
     ${@bb.utils.contains('SDK_FEATURES', 'rust', oe.utils.multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
+    ${@bb.utils.contains('SDK_FEATURES', 'kernel-src', 'kernel-devsrc', '', d)} \
     target-sdk-provides-dummy \
 "
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""

