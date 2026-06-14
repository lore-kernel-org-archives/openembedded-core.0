Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCCCCD98D6
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105065.1781424274026544469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c+Y7LhDm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490be03d47bso23103925e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424272; x=1782029072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAfonMlB6H7jstXSXHXMW2xNN51mTtzL82e37JxUKNc=;
        b=c+Y7LhDmHij0ttk/DUWRn1lPszJnu/8bzgHqSdx8wY2lRrGu/Cm6AWQPTL0vXrPPA+
         l2fSGYqq+iBr0BQJykiDUlY+FRcFrZG64erfh4w2G0nvJ4x68yYZTE7jKKMcTUO0HXOr
         mHHW8fhboHQKVvKKxQaY983Wctqb7MDoUhcek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424272; x=1782029072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KAfonMlB6H7jstXSXHXMW2xNN51mTtzL82e37JxUKNc=;
        b=a23KmbaYiFsh2aULyucIVBDsgTdshGQ+3TksGV5T7kbc1ehrw76+UgMIXQ7cABfCwo
         jD3CwHRzBE5GPBxygEKkW2JrC0Vz8o3PxZNtamrGszAhiyEsyqGje/VBixDsi+ZzxxQw
         V/bfZtcIUY4p5ztJt6BGmjWapMpvP6e5DJHZWCYqDYTwS4F2oJk7P6HupUaK6cxEduGU
         qqrDYPJHUlxjNF0Y71Lsi/YJcMSdADEbpffiCl+ub+aGl7fejwPxHIb5Q8hcAxOMnCUT
         LlMfATvR2k1p5dosQSNopYJOfU8A1AUqFqMn854xgwObLyrNz+Nd8EKP3XS0Ply3leEd
         xwnA==
X-Gm-Message-State: AOJu0YzMBiFrucwg0AGbfUlhHTYoX/AyhfgR4Lw41XNexOBVvfKutGlb
	GlPWnoz0ZT3CYUZZCx1eLJGTNx/sgtSeumKTTOYTwXzUNqsbAAokOtQx09QMCLI7AvSuBc6LCSD
	OJ7l3
X-Gm-Gg: Acq92OGBM2hgroYeNZboNUQDklA5/DpxVQTeURZHo1QU6qnQvXmVeO7rNc2A5nq8g4e
	n6QKXPxY+ykmhu55PHReoVj2KwqZUKlgaBhdY6RWf5mAKazkmqVcS09Y5fMix6abUPa7MorAAr9
	l+Ae7F7iwSEHKyTCFA2i2Moy7x+IWNbfpUVVh6MheTtvKj33Duq/KUn1tZ7v9DqB3pPwllsvYky
	K5zdWRneI6q0T6pOtjBBpoY5pgISAa2jyQyJgYVapAkZuN3Ynk2+yvCTK4nNAky0n/xmUd/8wyj
	GB1JJl9CdLO1rXajwlxtkyRLJV0+ercQl5UwqsYs4ulPvFCETW+ekdZV7gGyHrQivLrxV93ihVW
	APcijVFc5bMGPzKvPE6n/BEWjIKR4bRvqZno1qI8ilm/xlDF1+DxZk/3a2wZdyURMbrA/nZWlwK
	CPU7+EKZapxZjaiiDIbzgjVXZ3ouiW9Ft+hxXrDC8Tq47zEMnLir59/JMJ+ikf+EA=
X-Received: by 2002:a05:600c:4b89:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-490ec4fed56mr68773215e9.22.1781424272221;
        Sun, 14 Jun 2026 01:04:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 55/56] xserver-xorg: upgrade 21.1.22 -> 21.1.23
Date: Sun, 14 Jun 2026 09:03:06 +0100
Message-ID: <20260614080307.4017177-55-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238739

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.22.bb => xserver-xorg_21.1.23.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.22.bb => xserver-xorg_21.1.23.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 7d151aaa63f..4a5bf4ba437 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From 6d23037f48f3d534286fc2bda927c9b6ee5d1445 Mon Sep 17 00:00:00 2001
+From fec2a3c8922ee7526d59e9fa2c6ad0943018b7b0 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
index 6a9826d959a..d3c00e087e5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3"
+SRC_URI[sha256sum] = "e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.

