Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCC2EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:33:23 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.7923.1687786400779421527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 06:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pxUSxdoX;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-991f956fb5aso14335266b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687786399; x=1690378399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZreLsgvNtw480fcNhxbgWplh0vR/VgsyPhM3641MPPA=;
        b=pxUSxdoXzDVVlX8qJ5h/j8QGQwKHl/51oq8QCHm8EmZp3DBF1phgoeGR8WHZgnotX7
         uNTZW+E/gtxP9+vxsRsBfmKWWNzhCSl4M4qjBP5ZicdrQE8i40m6R8jnrQqXoV3eNono
         RNlUjYDpGYMWJ2x2aizEITbJEfvLE5r78loG1e3P/7mXLjt2zFDrrENHvFF/UPiFgJIa
         EFZk9MDIZ1iK8foI+xu1wa2EDyaTjKG/fdnNNQyTTX4ZTagfIOMyCQdkiOcVSQvqRvSV
         FiDEtIzhIjbssf/xyEqQK05XgdlDoXkq6scwLEEOfr7y4tjvUPFGzy/A+XI0K1SD1hie
         twAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786399; x=1690378399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZreLsgvNtw480fcNhxbgWplh0vR/VgsyPhM3641MPPA=;
        b=Rjo9k5qCkVOU2LI3/PRzmub2AH/TDvDaCzw0oFO+scl+ctwZdbTIiOvcmbkJEOZbPG
         8yD2WmpgReTr5+Z/tpZKUG1izuVTSjRt7rCHRVASALUoqIKzb0ihAgu3sMPAJSqTqCyW
         T0B8vIXuy3qUMVpmaNS+mpqbkY4BHnS+BrV5xHDLo4axVSJQaaHyJmaKUtPbIycAxXPa
         gYA41WSro1YY6o0wThYtQZsYjxJsiZ5bB1aXhkiuh7zuK/l47QCCRbN0xQ7pswX4L6UI
         TfItcNrbjL+WE7Hu6o9RXj+vPCJV7mgyd8Q0t0oiWPT7kyD977+/LmdGHIvnWgjSGMmF
         Tkgg==
X-Gm-Message-State: AC+VfDyPUuKxJFOeb0fmG1pcNZrTpr/pKQy8cU6dSaAdzC+YamjuHh+/
	hJEzNz6kaCSpHr88LVAKRg/K971sQ14zYg==
X-Google-Smtp-Source: ACHHUZ4dX2MG1ZLfnmZlT0c1nDWwmc/4F4PlFbjPXsjDx3aKXsF/+ckjCZYwL3bkkH53tk65tXXZeQ==
X-Received: by 2002:a17:907:74b:b0:971:484:6391 with SMTP id xc11-20020a170907074b00b0097104846391mr19478092ejb.20.1687786398914;
        Mon, 26 Jun 2023 06:33:18 -0700 (PDT)
Received: from t14s-af.praguecc.cz ([193.85.242.128])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709060f4d00b0097073f1ed84sm3301988ejj.4.2023.06.26.06.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:33:18 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 1/4] runqemu: Stop using warn() since its been deprecated
Date: Mon, 26 Jun 2023 15:29:24 +0200
Message-ID: <20230626133213.47920-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626133213.47920-1-adrian.freihofer@siemens.com>
References: <20230626133213.47920-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 13:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183414

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

logger.warn() has been deprecated, logger.warning() should be used instead.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e1aa5a925c8..3f187ca793c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -648,10 +648,10 @@ to your build configuration.
                         elif fsflag == 'kernel-in-fs':
                             wic_fs = False
                         else:
-                            logger.warn('Unknown flag "%s:%s" in QB_FSINFO', fstype, fsflag)
+                            logger.warning('Unknown flag "%s:%s" in QB_FSINFO', fstype, fsflag)
                             continue
                     else:
-                        logger.warn('QB_FSINFO is not supported for image type "%s"', fstype)
+                        logger.warning('QB_FSINFO is not supported for image type "%s"', fstype)
                         continue
 
                     if fstype in self.fsinfo:
-- 
2.41.0


