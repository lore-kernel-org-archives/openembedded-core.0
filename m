Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840C4C433F5
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.2131.1633893020271477586
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PNAtNcsX;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id e3so15015519wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mQ6eS3W6vkUh4lriVzkiYXyASL7H7DmMEqVPol4y9V0=;
        b=PNAtNcsXC0lC7C4AmMK91L+S8CccMVxyfYIQwORM9h3JtCJVBEkukulDbnyhF1Rqv3
         /n8v1FSutgUZisO5m2TGFd8sis61OM4nyCOIqHuieeFXkMxK5SSdzea0acMHUKvxm8xh
         w26sSxRPeKNga3Ta13wZ/baoe9bic384fOnR4RBlPojs8AZExstjUtFBZ2rFgGjaxu8E
         2RmUUkz14QJplIHqk4k2eARvh+Dx0CzUUmWXOHLoWqqKz2e2PhQBd7MjUBQmbTUPDa5O
         KXfxF27T36DFfgMfz6O4a5glLSOwVtHSjeT56a5IASeKFms8UpHQPMdXrKiGfe+grEYd
         4KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mQ6eS3W6vkUh4lriVzkiYXyASL7H7DmMEqVPol4y9V0=;
        b=1kLIwQOs5CXHLmk3j7U7OUklVviC0Ugac76RspZDzJIVDrmnEK/qfCblmBMCeTYF2J
         6JuoHD7mdNBC0+4zM2YFIWAO1dvOw4OudTUARae09y6uQTHaYsVliqOVli7mJ/9XGjX9
         QwCerOCeNqG6/iVeJ0eGBshtpivHoAr0gOhtWXwgmzGFw3p/bDWpBOWI0ONzjnRHLsBF
         ST8/NqNh1mk2BiT1qkRfHz11K1buewPer3CAZStVuuzJ/zUPvZecVHswvsQsq2Ehc/4D
         RoarxDVEmhtd8t8qfHyQPby+eNYWz+su3FIXW5mGiimswr2DTKCUf2e+toYdGEDRebbJ
         Ngpg==
X-Gm-Message-State: AOAM5318LhIk6L8BxTkINLIHR1OGwWWs9FNce79q1bT3ulrgbUX8pJRb
	k7AvZLKD3+iJGQFPeZo3IUY+NPEH0z0=
X-Google-Smtp-Source: 
 ABdhPJxo1JlsQ789kDuUgpuSy1qNNwWvTohXBTp6tlyLj50QAYhp6LFqPuSeXWJvYFQMt2E+EA0BEQ==
X-Received: by 2002:a5d:6305:: with SMTP id i5mr19709705wru.33.1633893018939;
        Sun, 10 Oct 2021 12:10:18 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/13] rust: do not write ar into target json definitions
Date: Sun, 10 Oct 2021 21:10:07 +0200
Message-Id: <20211010191008.4122049-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010191008.4122049-1-alex@linutronix.de>
References: <20211010191008.4122049-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156805

latest rust does not use it and prints a ton of warnings
because of it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/rust-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 153fa3aa975..797284316e2 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -321,7 +321,6 @@ def rust_gen_target(d, thing, wd, features, cpu, arch):
     tspec['vendor'] = "unknown"
     tspec['target-family'] = "unix"
     tspec['linker'] = "{}{}gcc".format(d.getVar('CCACHE'), prefix)
-    tspec['ar'] = "{}ar".format(prefix)
     tspec['cpu'] = cpu
     if features != "":
         tspec['features'] = features
-- 
2.20.1


