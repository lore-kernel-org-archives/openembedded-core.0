Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768F7C433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.8680.1637163337661377694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PtnDQry6;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d24so5576712wra.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U3TXO4/EYhPjQj9fzw1QsvD2Al7pKce3fEa00NmLUQ8=;
        b=PtnDQry6YY4v0PUSEZ3qKwf1eHt/K6TF4fNDKknnBVhmsMeW9iTSBiM2govbG32Pdr
         8IbVmUo6YJp/SKVgpwaQTIsqzyBgJvcYKhdp9W4FJryY2TgUotffxY+yO6ZxWkNSIId7
         +rQHzpg2sSCJhMt2MmnAiNyDuXkDBQb7vc5XMP2z+VxgPidTLlGfF5JKANDXJdHlg6/r
         MBJLgjGwTY4jSWAU3cCzfsgh1T0SSFFcdCZh97/WnDapFpTh1RDWAFobMkb9HcsnCcOi
         jpqv054oGbQhbsls1Kob3vnlu8/C2qNYzJ8KD9cKUHF6QuNsAOWIvr2sTMc5iQY+bjIf
         by2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U3TXO4/EYhPjQj9fzw1QsvD2Al7pKce3fEa00NmLUQ8=;
        b=D92Q4d1WuXk9mSstemHaufXlX8+vNOYPed30z8mQ89ppGbf7PcRuWBjs25C4dqZKvo
         X0S94pl1bKtuC7yCYIOeq4nbIwQMnsEOS6+In2gbf6JPTRu9SJyHyNQ+Mb47WrkWghX6
         aSpTVuZSemCCic+oMUxPa0MwUpboJzIOn0SunLcUDmBfmMb4ySJ7/e10n5WKforARkJO
         1HfUdal+epV0ywtxUh0MLc+G+Gm2cnIIBZF6YaTuvFU7eHimJZJst2SJbtz5Ic5UNShG
         kzFfdniE4oAl/GfbXWAvHWeqhFv4iqphM98CXKfrnC6R7rku9x1IKjdFh6lvz6QXItdR
         1yNQ==
X-Gm-Message-State: AOAM531OHTOtBMaJ5I4gpgWFTHUkVH0lVAOT1rWmZr5jVrn61Nhuexdz
	dRjqwEWb/K9sCVihNXN4jrUYZ+ixjPM=
X-Google-Smtp-Source: 
 ABdhPJyrYFmZP3S1x7VPBFguVGwYT9823cu0cvrwIU1K7qvZn9CAB6lslsB4wU9mrTpKMVff1T/UTQ==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr20970964wrd.105.1637163336303;
        Wed, 17 Nov 2021 07:35:36 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/36] piglit: upgrade to latest revision
Date: Wed, 17 Nov 2021 16:35:04 +0100
Message-Id: <20211117153525.257146-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158410

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 0a3de466c7..e9213e09a9 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "83bc56abf2686e2cd9024a152e121ca4aa524985"
+SRCREV = "0ef03f824d1833a853d1a20b4be121089bb9246c"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1


