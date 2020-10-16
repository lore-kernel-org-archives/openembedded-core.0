Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.12033.1602842444641282088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AnOGd+fv;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id p5so2296660ejj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Ixh3uofbFCDHU+/jcYVo5QKzEl4IKUw/sPiWvgF6+w=;
        b=AnOGd+fvotSCFtEPxp0Dp7+toq7pOumbysc8WxCzgSH9ZpPFDlBLjXykHAmALsnTaH
         hmuTAaGFVVGURj7fK/pVI6AYxohFDzXvYmKPzAAFLO8WZ57YOLYxjRV3CGUZWo4OrjXS
         ut0AaX5AuDKChOfuSrzR9moa0kfWHIyxV8g6AqRi7A9kEtiS85OokuNIPixuww118V0b
         nD2FyQX2GJvYtb0Y1fr4tlbHXn5nwIBqg9ZDhsqeAgXwvFK1Ih54NOUnEqF/mRaZlEEN
         rswBSjQ6n2oSDB8T/tNYSMgH280nVgekprSse1gXIw8Dm5OR9MMR6N9EJxCyB2C83IKo
         P+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Ixh3uofbFCDHU+/jcYVo5QKzEl4IKUw/sPiWvgF6+w=;
        b=MHT0DzBZ1X91YYDqzTKIflt48XH2J4+8JOBQaDQLEXMuF6VS9yhB9gZ1/geWkmFLZA
         HTLKutjuOGv3Vno8Zd6JZOqKy4HyHqbXvG7GJwHstkIik8jm/jXWVwWvP7cPYQ4DhRJP
         FpY/LwZRe68uRhM1bRpOARSSRjkL4NqnMXOJ501B46PMWBje3CoFjq4RL/RraIZ7ui7p
         U25d789H3UHoP1jD9mEEbuMYoXiwXy+iL2BC+D5cSPKaxyn5tWpLtaVduJMOKcQg2S+R
         mfQQTTMiIZssJnszXb1S7xoyXm6vIvxRpgGcAMUkx3zyUBjbOHMXsFLTZS9fmS66D0St
         edkg==
X-Gm-Message-State: AOAM530qr5n7mLToW3FMWzKkjb89Yeg77unJWcUji4QPTdMJiepDjRw7
	qXZvKD/kbh8tI03ux+wnqWpyj18FO0I=
X-Google-Smtp-Source: ABdhPJy6gmE2H+x19WPFAIlR6r5Z0btiy3SfM8byUzPCF1OHZ21HOsK7f8AWH6Vx2FvZRRPkR3wgLQ==
X-Received: by 2002:a17:906:453:: with SMTP id e19mr2965138eja.391.1602842442828;
        Fri, 16 Oct 2020 03:00:42 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i23sm1200199eja.66.2020.10.16.03.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 03:00:42 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] tune-riscv.inc: use nf suffix also for TUNE_PKGARCH
Date: Fri, 16 Oct 2020 12:00:40 +0200
Message-Id: <20201016100040.352314-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* broken since introduction:
  commit 5263b2ebc57fe289d64c74bfb10da39ed7c98828
  Author: Alistair Francis <alistair.francis@wdc.com>
  Date:   Thu Dec 19 13:24:10 2019 -0800

    tune-riscv: Add support for no float

* fixes:
  scripts/tune/log.fake-riscv.riscv32nf:    Error, the PACKAGE_ARCHS variable (all any noarch riscv32nf fake_riscv) for DEFAULTTUNE (riscv32nf) does not contain TUNE_PKGARCH (riscv32).
  scripts/tune/log.fake-riscv.riscv64nf:    Error, the PACKAGE_ARCHS variable (all any noarch riscv64nf fake_riscv) for DEFAULTTUNE (riscv64nf) does not contain TUNE_PKGARCH (riscv64).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
RFC because I'm not sure what the original intention was and
I'm not using any of these tune files (haven't even run another
tune/test.sh with them).

 meta/conf/machine/include/riscv/tune-riscv.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 741eeb34db..028548bf56 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -24,10 +24,10 @@ PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
 # No float
 TUNE_FEATURES_tune-riscv64nf = "${TUNE_FEATURES_tune-riscv64} riscv64nf"
 TUNE_ARCH_tune-riscv64nf = "riscv64"
-TUNE_PKGARCH_tune-riscv64nf = "riscv64"
+TUNE_PKGARCH_tune-riscv64nf = "riscv64nf"
 PACKAGE_EXTRA_ARCHS_tune-riscv64nf = "riscv64nf"
 
 TUNE_FEATURES_tune-riscv32nf = "${TUNE_FEATURES_tune-riscv32} riscv32nf"
 TUNE_ARCH_tune-riscv32nf = "riscv32"
-TUNE_PKGARCH_tune-riscv32nf = "riscv32"
+TUNE_PKGARCH_tune-riscv32nf = "riscv32nf"
 PACKAGE_EXTRA_ARCHS_tune-riscv32nf = "riscv32nf"
