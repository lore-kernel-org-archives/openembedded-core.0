Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C46EE748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:55 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.62155.1696176046241851159
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sqgT3rQm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c364fb8a4cso142607945ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176045; x=1696780845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/G31LnxHUpRIjgzK9GptikI6Q80zIHlv7AUMy+5j6bw=;
        b=sqgT3rQmvv+y50As+B6Xqfi2/OBCRc2DVaoCopLPqH+9S2BlPv6YeRqtywNxMJrxPu
         1Uk227xXiWWh//veISjcrMc45F+ug9OcUvAGVMPoNGSELWYJJZn/NdkWwa0VHXccJQIM
         nybLbP7CW2wa+JuN/ExWYvFRZdYoTPB7Q2Q4f30902QqY8XXowQG9Ob2KwUDTbWW9t9F
         sAjb8pNNYcYwwJAIUfS9FEFV9efbyR4LLxVsB2bbuzXcUvEbswmjRyC+WUWTyeJTyo6U
         nonfu5CuZv0lz91947t10z1U4F0c5E9N/GoLFxB9jm5B/f2vfFfpCuFfLtuKTGd3ePCm
         r9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176045; x=1696780845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G31LnxHUpRIjgzK9GptikI6Q80zIHlv7AUMy+5j6bw=;
        b=lSSvu3p4WxE3Kcp+L04MrYhfDH94FrGj8GE27ZsbbrrlAOYRAAbd3MHoMOIqosC5bh
         ArfMTibQ+POH1IIv3ieAoz5IOFxdW92G+q82/00J+TnsSztRj3f9tH31Bejh724ZNN3p
         OC2fM+CaRD2eMGtfq5RSb/QmRotlScxOZ7STvc9MRULAw4txNrOgiCwd7GKPwr2MGh8P
         RBA3v87pijPy2Gp7BKr1hHMPAbSm2Uymhr/qvDY+4G+MLmP83VR4TZmtnZ23W4IX/mr8
         iSFEjz5u/KcBiF+PQJo0qb4I6fAcQvOcACUkd/FgZYc8PS9r3BUv+FELMEaIzgx7rJMa
         hSAw==
X-Gm-Message-State: AOJu0Yyol6Drhk4Oq2CVm78H6PYfwRaGG/bbCG75nSMORxygGlFFOjWn
	ITYsVN2+cCveAf2n7snCOb2bR1kr7KYh8xwEe4KsKQ==
X-Google-Smtp-Source: AGHT+IExnYy/sSE/keEtx2oOQrPCZSYQNurSBs9QtzdpwI90TxExaxaAfzFK9pzZvHY3rGoDFv9BGQ==
X-Received: by 2002:a17:902:ea8b:b0:1c2:82e:32de with SMTP id x11-20020a170902ea8b00b001c2082e32demr9526490plb.0.1696176045411;
        Sun, 01 Oct 2023 09:00:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/23] buildtools-tarball: Add libacl
Date: Sun,  1 Oct 2023 06:00:02 -1000
Message-Id: <1a0622be3804598895a35c31bd44866c8647967f.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188504

From: Joshua Watt <JPEWhacker@gmail.com>

Hash equivalence need to include the ACLs in the output hash, and libacl
is used to do that so include the library in the buildtools-tarball.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d152dfe784f231fa369d59f9bce8195ad09c5482)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 70d740b4e0..6b679489fd 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -30,6 +30,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-mtools \
     nativesdk-zstd \
     nativesdk-lz4 \
+    nativesdk-libacl \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.34.1


