Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E667AC77B78
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.3963.1682502645317407950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lbirwr4m;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f1cfed93e2so41137275e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502643; x=1685094643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHZfHLmsYtvAY+N7U+CR30dcvB38iFTzZ4YDYun4JeM=;
        b=lbirwr4mKBxVjMiL4KwnEO+0nWQCKTifWTVHHNt0CU31dYCH9+LeRcg4kDCqr8Urzx
         O8Qug7jb2kT2xF/NXwYpTm+cjvNxlx2o0XRNUzp2Mtj//bhmE9ATjMSbATEzGKeVc4zL
         l7qsXM8J/gXCwwAUCldrz2B2dX+sYOwdGv70RuNczdmZE54fFUYiOnd/Zyv4cYKsF1Lm
         UXLQtfVfGuWEiwU5QwVvcdSPaLI8Rc6oSsTNS6/ltLGSy5+zPsDsklD3FWYXb8cWfaHQ
         7+zVmdTCTCcai7zbhilH88rRnvpukl+Q6X0vSIFsTnYaI+U0PfgIo8flW8MsqkZ0r6hs
         /OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502643; x=1685094643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHZfHLmsYtvAY+N7U+CR30dcvB38iFTzZ4YDYun4JeM=;
        b=UoMd/nJl/4oNKVTBdqLCuTgRPhh2h2WC2xtBuE0HMl1/bpq+sB6fFzvYNUaD0lzrFz
         o4bCVTEj2nMCx0Y/Go+B0FUEHCXyZErD+J2/fqbgiLi1y6QMOyaYq2V8Ccp7GM9wycRw
         Ec9af6ja0/wxBlp2vVSqUWDhNc5tG4HsO7Ga6Ode1uTNRuWh7t09ZreDlJDr5YTI9UzX
         DlcodXncLQOoQn8oVCwpnJ34Z+76VG6xvvuF5vQ9WARy24IUVBW+LCCGDlp3w6UWRuLX
         8L/gq/MhzrgxEgHy9nS4ksn0gt50r1zSwiNkEJY6DpeF3iD4bzg9uDDdXwFZmRqnLTP7
         balQ==
X-Gm-Message-State: AAQBX9cwH1lTKNxY5VZNyysryXf3g09mC3Jf1N71TRWzbTnTeJVhz52z
	dxCxmBkJLsU5fck8j5ZQvoECuw9fYBI=
X-Google-Smtp-Source: AKy350advO+g9n52c9HxTUSUDp5k4jpQYAHDcWzWhNrNemnaXZgbeC3GORISfuxeGId9SX7LbPM6Gg==
X-Received: by 2002:a7b:cb57:0:b0:3f2:51e7:f110 with SMTP id v23-20020a7bcb57000000b003f251e7f110mr5803790wmj.32.1682502643497;
        Wed, 26 Apr 2023 02:50:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/11] time64.inc: add glibc-testsuite to 'special cases'
Date: Wed, 26 Apr 2023 11:50:27 +0200
Message-Id: <20230426095036.2632847-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180420

It builds glibc source like other glibc recipes do,
and so the same problems occur.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/time64.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 2e7278292c6..73adebd39db 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -10,6 +10,7 @@ TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLI
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
+GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
 # pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
 # both 32 and 64 bit file APIs.  But it does not handle the time side?
 # Needs further investigation
-- 
2.30.2


