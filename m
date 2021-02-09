Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.15559.1612897045982381732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 10:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iOYB5XgP;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id l18so2219876pji.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 10:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTTor+f8ObTkzAMsZVdW6eQj1jvYJWjLEQOx6xvnKmQ=;
        b=iOYB5XgPE45M6WKAuM/8MuyHYrHik1T/6d8vXKZP8GYDhWB1Trthwgei25shhmLg4L
         RZXTJSjPIVTHPHRuNwkXwDxj+BseQo0AMJJytqYMGjfC9Nv2lIahPRdOgyOXgpORKxFP
         k7XTxJNpTNNvNKfT79E6f7kpQYd807/OiaMkQs5P/REUpWg+f6Z5dQcgVA7kkOXIKSoN
         Et58kAU0ARXbcg5vAaQh+s6XwMDdg0lW7XzNe0PfGM2liU8Yf8k5yA6Ue3enVHWDqsIt
         kGjFO61GSKYjjmFXzswhBZ018sMTIEZlU4zb3C5DLfBgfzcKXJr9YO9Bqn7YIjliAHrv
         79FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTTor+f8ObTkzAMsZVdW6eQj1jvYJWjLEQOx6xvnKmQ=;
        b=f/Nfj0qKP8vts7FdIJgyr2day53lw4t5mIths6a7XKeXF2IMLG80Y+TN/DmOObl21N
         3dVB4is3jGGvu4A19qpy/PKWMgctA42HFoaLRsN7SlIAaCgDxL2FHxo27+uSIjTObQlq
         ouGHyUpeVvRFOvURSQDh1N912VAfmVCUFg0BWfxmPE2RpsmZk23FZtgiFmgJ/D2qNqDE
         pKpsC03KNnMoNqume2QbsaLiR0r1fqXp8ZNn6HANtRNXAFSxOydSbY9DQ3wVluSTOEsJ
         Y7y2p98BUowjeqgk+YnApSFjSyUb4GxHFfiT/BMcuAt4bRuEA5p1vs6CDj8e7PBtBRz2
         YplA==
X-Gm-Message-State: AOAM531ZQMNTd2QCCwcDaLfDJoTcMF0LGvD7ozUezFGYGrabrPpRjVmJ
	hYQJ+UDvM5CJ5jq1RfdKDATBagWvqCyczg==
X-Google-Smtp-Source: ABdhPJxaTsyrgE/AxgoYauaaESBF9FFYiLH6MsBWFnPOANV6lm19BfWPlxuyxXjn9AGKiyjCAckLug==
X-Received: by 2002:a17:90a:4209:: with SMTP id o9mr5664707pjg.75.1612897045405;
        Tue, 09 Feb 2021 10:57:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ca6])
        by smtp.gmail.com with ESMTPSA id x20sm12458415pfn.14.2021.02.09.10.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 10:57:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tcf-agent: Fix build on riscv32
Date: Tue,  9 Feb 2021 10:57:22 -0800
Message-Id: <20210209185722.2861342-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LCL_STOP_SERVICES needs tcf/cpudefs-mdep.h ported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index ed14fe66b1..c1b05691b8 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -48,6 +48,7 @@ CFLAGS_append_libc-musl = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_powerpc64 = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_powerpc64le = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_riscv64 = " ${LCL_STOP_SERVICES}"
+CFLAGS_append_riscv32 = " ${LCL_STOP_SERVICES}"
 
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
-- 
2.30.0

