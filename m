Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7430C04FE1
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.20167.1687728169496867383
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RRy+PUIq;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-307d58b3efbso2120276f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728168; x=1690320168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9pmaS/HTvzf0OGm9eUX0oepe+AZ5qywU8jrUsbxsus=;
        b=RRy+PUIqDCcS7B9YwnEY2XivvrrvEh2tbhi2+kIb3N2WZN7A5uBFe2uuHY0K3Z+fF2
         2cWrqq4YYwcEE/6YZCkoCCVOE+T7FAdQNHHS5XOL5KCuQwHFfUVnMxpBJN0yzZomHYca
         hRIK3uqbo/lFQK9SWrcX2seO5Ib10TpuMgh7VskaNyhoCm/O2/uFyq2W1iKHChFgGLqu
         vwKTepVruuSXPcMU29ciwjXKgmMx/9kkKYOUBemQIKHPsQrMVySWakxvTJ7XYROFsT69
         u/4Ho/yQSOSxm7MD3pZADM2bDQrqJ56lNIDvdUhxEoUQnbrJ8mBkl3PmOEJEUszlPPDl
         +qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728168; x=1690320168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9pmaS/HTvzf0OGm9eUX0oepe+AZ5qywU8jrUsbxsus=;
        b=Hs/azRg4InxvKpFH+7X597NT1f4fcF+3grIcw5t/ipYR8xzqi3G57lwQuTm0BSxgwa
         889Ri7x+eJ2d6bCDo3z3iCkLfJscZR/20ybNXRe7mjcn6a3cbSWYfqtE65+2F8aguQQ9
         jEzdQR3psQvslRTzLcrbBSDQRMRBDwH+59R8AJc/kO5+hRPBCAdyuqvBhsFHP3g6tyRV
         Cg/u7r/IjMjqKGrnjctbh2wg+PscS39HM4Zg/wX0g+n8v5LQjm9vlNoBE1+d7qTQe+0z
         HmgMgjmQUM2kZx6pt6QHQK2WNg33rl6snB5NO7AhtMlIke0bsEa9D6BHKbupYOmgkIDr
         ovSw==
X-Gm-Message-State: AC+VfDxa8DZfPeTywfMvanyxLPSjyot2RmsnfUKlr06wbdxCmXSvPFT1
	nf9wTONTP0xtJZ2EmNrRdiuu6lRfXCt3nQ==
X-Google-Smtp-Source: ACHHUZ52yxBdOcnxK07LbO3pVCf73apair5K3YVtRjw8QbV3Gpmjz+y2F/D1/ya//FU5h9hKAclHgQ==
X-Received: by 2002:a5d:4442:0:b0:309:32d1:59d8 with SMTP id x2-20020a5d4442000000b0030932d159d8mr16774424wrr.64.1687728167566;
        Sun, 25 Jun 2023 14:22:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/21] rust-common.bbclass: move musl-specific linking fix from rust-source.inc
Date: Sun, 25 Jun 2023 23:22:26 +0200
Message-Id: <20230625212241.915739-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183381

This needs to be done for any item that is linked under rustc,
and not just rust itself. Latest python-cryptography exposes the issue.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/rust-common.bbclass    | 4 ++++
 meta/recipes-devtools/rust/rust-source.inc | 5 -----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index e0cedd7aa26..878272721cb 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -158,6 +158,10 @@ WRAPPER_TARGET_CXX = "${CXX}"
 WRAPPER_TARGET_CCLD = "${CCLD}"
 WRAPPER_TARGET_LDFLAGS = "${LDFLAGS}"
 WRAPPER_TARGET_EXTRALD = ""
+# see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+# we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
+# when building MACHINE=qemux86 for musl
+WRAPPER_TARGET_EXTRALD:libc-musl = "-lssp_nonshared"
 WRAPPER_TARGET_AR = "${AR}"
 
 # compiler is used by gcc-rs
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index fbe2492fb4f..a0a788f3601 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -16,8 +16,3 @@ export TARGET_VENDOR
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
-
-# see recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
-# we need to link with ssp_nonshared on musl to avoid "undefined reference to `__stack_chk_fail_local'"
-# when building MACHINE=qemux86 for musl
-WRAPPER_TARGET_EXTRALD:libc-musl = "-lssp_nonshared"
-- 
2.30.2


