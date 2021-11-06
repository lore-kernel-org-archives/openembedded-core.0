Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A6CC433F5
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 15:37:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.20351.1636213019911772650
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 08:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bEXpZLRR;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id v20so12921157plo.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wzKulPSmmSw4bhqpxqI8rEg4YwEO/TfS8A1oXx/jOu0=;
        b=bEXpZLRRS9+FGkfBmPJals+BYGExguzmIXXA5iI0CA6weXQHpkRsw8/qweJlPCxGjj
         gHaPmsD9dRoyFocxlab7hk8EwZTgh82U1MDBb4SfayLNGS78+97FHGCio2iA5AU7dziA
         vzxfVSF6NH3G2yNKWB1jtwDu2WRweKpE0QX6qgG8hDImzkXZ1ELe2UekwtNEXuYeL6BK
         n8Ris5DIGf4IhBipF90w4+MjGte5WyYrxANC75S4ih87b+GIABN0USGJo76fnx5NVt53
         SvivnUJTUQHsSKGVhFm4twfjX7kMJPRQp3kwhSsgP7q6oLszDem+gyp3zJcOosnXzScN
         G7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wzKulPSmmSw4bhqpxqI8rEg4YwEO/TfS8A1oXx/jOu0=;
        b=79an5iQhA1UxdmsQrCikKjOr/25geZM+6y1Zkr7phqYpoCAGvbqbtABS0l8LJ084U4
         XAQB63bz4LCk2nS2A0aRYOESzT21RQNarjJusnU3Mtx/Ze4HWStzymbvqAyu6qE/seby
         795+PYdU8qrCAHy6ZV9qdx13Ctdfc2o8fA7NrWpy5TlXPUcw1nuNXrDPD0mHYsjNLpO+
         jiySK1nV0N4g6Mc4CJ6ufSXAF/CQfqIpqIc42zPVX2gL50u+xH2bhvDJ2XyUogZE6FAc
         OGRvQM7GpUIAKYlsm43v7W0CnbaarfPNCbZtpKT8OgxJpLKGJC5H2bb09P/egBJDjesZ
         lXwg==
X-Gm-Message-State: AOAM531xLn6GJA1YiB3iqq1mGX306AjGsXPWFJJChZs/E5iocmFXgwIF
	c3FvR8nTUD9qjrwrrXlBpCJO3JuQxEM=
X-Google-Smtp-Source: 
 ABdhPJwRMNhf1FkslgIKz99H9TM7HR7JTG3muDxbDzkzxG7vwKXI/Iqt39l+gNsdhvaZl7fNkT3EQA==
X-Received: by 2002:a17:90b:4c85:: with SMTP id
 my5mr37623113pjb.26.1636213019087;
        Sat, 06 Nov 2021 08:36:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 e6sm8309213pgf.59.2021.11.06.08.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 08:36:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [master-next][PATCH] librsvg: Disable 64bit atomics on riscv32/mipsel
 in crossbeam
Date: Sat,  6 Nov 2021 08:36:56 -0700
Message-Id: <20211106153656.1236560-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 15:37:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157940

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.52.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.3.bb
index 6c4850271de..f1d1a8f9f49 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.3.bb
@@ -39,7 +39,9 @@ export RUST_TARGET_PATH
 export RUST_TARGET = "${HOST_SYS}"
 
 RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
+RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
+RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
 
 # rust-cross writes the target linker binary into target json definition without any flags.
 # This breaks here because the linker isn't going to work without at least knowing where
-- 
2.33.1


