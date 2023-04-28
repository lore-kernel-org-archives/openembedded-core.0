Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D4EC7EE29
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.14758.1682671709483134719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OLuBMiqs;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f195b164c4so53617165e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671708; x=1685263708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHZfHLmsYtvAY+N7U+CR30dcvB38iFTzZ4YDYun4JeM=;
        b=OLuBMiqszznJmYJrn1suMdyMIxPefrJmGu9g4IcQRv7lsP00Fwd+jdcNVdm3L3uHlf
         9s176nQ+/SqkePXhSYPDG3j40CH6cR2UslDSmi3hBFhDu5Y/FUFQNf8I/sLMtB6hA/H9
         xYbRLWKTsn1AUDWb4b0J09bFKT/mVjf5MkiT3leQnz6xtLJ6npxsmJrzoFYqYuHXiQDG
         FnppuKilnfpBX3fkROXB0lU0bMjSrsKZMnuUyEAFS8guSY2Ouirj9bUtg1wjX4BElSsq
         fJE6rKT5+uQ9oudJKPdHDxCnvhoNxhXyliNy5D4fGa/ijIdLlAUL+6Q1WtVmZWDZTzlI
         Le1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671708; x=1685263708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHZfHLmsYtvAY+N7U+CR30dcvB38iFTzZ4YDYun4JeM=;
        b=em10vil9pPJYaWPu58ypXKH6s6w4FK+vlnYCh/jl0vFm07dMBLBhejdi+uKo1EziqQ
         MAGLV85iFGoJYm5IBwe/GM38q6bxTPOdS6zbp5FnQrXXhSPSsewW1d/dEDQIwrC1WB68
         zbauoFkXp4HLtPgZHhLL5qyVOjMx5Ml2vdnqTNS9Xmpn7wA508xCyDl8fa5DbMEwKYR/
         Mkx/WP3+cV2MvwDwy6l9/b5MyqOw2C+fq4j+r+c08x3snobm4mO63bM+J/DCrychJWai
         QT1SxOD6RJVGnZdl/KDeV2lE0cl9kWd4zMd9ft8EJT7MFg4xetM+L3ZulHOG2tXgm3HJ
         cCiw==
X-Gm-Message-State: AC+VfDxG5G78eQ9V1Iy+HWV9saiM045OFEVpuSrQLSihkR2/4o56xTT1
	IZn0MfmpSo1Ne1xbSo15iQTrCjoKp+c=
X-Google-Smtp-Source: ACHHUZ5ANdC0J1+izbK4tIm2T5X3/jjFIwEaIP9Ze6H8VneLxZxyDd1XLKlybBGt9Awpwk7vEA6w6g==
X-Received: by 2002:a7b:c015:0:b0:3f1:662a:93d0 with SMTP id c21-20020a7bc015000000b003f1662a93d0mr3521310wmb.15.1682671707844;
        Fri, 28 Apr 2023 01:48:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 02/11] time64.inc: add glibc-testsuite to 'special cases'
Date: Fri, 28 Apr 2023 10:43:43 +0200
Message-Id: <20230428084352.836515-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180513

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


