Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A682C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:47 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.9296.1635325666209384785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pHhmEWcV;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id o14so2832309wra.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VkgNtmLo8YwDUsewQv+LGXcNAOT0fPgN6qm7tbYVAWg=;
        b=pHhmEWcVu9kt73WmAPU9U91qCTolSBGT8y+kRKLaFOWGVV9Wy4wJf/tBkTpYRapufS
         Dy0Zr4y++9nDLgwsjZe1R9GF84q/ez/0b4AzIqcAUuvsZXdet5uTbvlgz+0krtiP5lmI
         xtkLekgzTCQ7XpDIf1S+216U28iCTWE/z1mw+7C0mIEJQIu7GDx44jbiwQNJM98/CIjA
         fClg3IslvdY5CCcX9+x9TDwWOP/ZAGIxp4QDGhwik0YMLWDx/Pbw6oPIjtttXXW86Ob6
         Kh40PnF7XeT5MAS+QkqRlJ2jMPkjHsz9om0uiidXrTNoUTmJvOyA78FxNzzvOnrqmpvC
         OXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VkgNtmLo8YwDUsewQv+LGXcNAOT0fPgN6qm7tbYVAWg=;
        b=ZqUUL3fFFnQypSmjR0koXpsDgWEugafbz5OElSguRzkEcGWqcbnp0UtQFbQH8+thBX
         OiCI8OZWgZlKHgXJ7/FVqwM5Mgj2kOqbJ8F0sQzdYGhpx2RWqtdMOVn1cJHX7eEVcpc2
         6spkSdrn6ssWLehoQB7aLlCOQqi+Vk2wuIEumCQE+rvkg3zk1RtmEX8rLuoS3u8uTVaK
         gCBQY+PSIrVeDVI4EfaHyOtpOoc/4d9ZSBMANt1F4iYscwmcfwzIRBoUccwXCGjOR98Y
         GkOATq/SAY9n83pnu4boT5j20afCqtfNxqDGNmWRFVOvptOxSdGe24/6TpudS+acCHpk
         XAig==
X-Gm-Message-State: AOAM531IG3dOeHi9lNabYEEqRvG3WC2OYrnhbaDgHB4TvG73F755vipn
	cYi2sloc9J1gfdupnv5tA87YooxTQco=
X-Google-Smtp-Source: 
 ABdhPJyNWJHVG9BuEe8tOxjwRZfQeuMMuIgFP5/PzwtDccB0wDmsHPgK0xifCywuLlrh4le7S781zw==
X-Received: by 2002:adf:e306:: with SMTP id b6mr38345247wrj.244.1635325664765;
        Wed, 27 Oct 2021 02:07:44 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/30] piglit: upgrade to latest revision
Date: Wed, 27 Oct 2021 11:07:16 +0200
Message-Id: <20211027090736.2546759-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157486

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 4b515cc537..0a3de466c7 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "014c9d09115e15f5a074457a753bf3a43173ef7f"
+SRCREV = "83bc56abf2686e2cd9024a152e121ca4aa524985"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1


