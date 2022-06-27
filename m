Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6A6CCA473
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 09:50:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.39709.1656323400081173890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 02:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aOG9l43v;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so7145730wma.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ws2we7WXHw9YXmipGiJTV44N3mYJD27bhJZ854/388=;
        b=aOG9l43vIQ368nMjXAgyprPJBKd998CSMy0GRNRhbqhB1FY5d/Qc/fXp8pxF768okx
         CC23mz7Fr194g/mKCIlfwJBswPARro6VSRRdFieGlkRRL5QCrxFzf/1SKkPc/HjgOKXH
         yFGdT42GjuBYlYnQnseTkpBTXVOL4EpoZsW32HpzDZ4CvDVibXaJMJWZVfxUSAHyJl+1
         47qAWQPWNe2Erpb1O+voi5qOrST32KWYIttXu461MvnxVOCHyV5RSvLEagx8iwEdMUEI
         EmZAnb9XC/nKslvmJE2xMt+GIq/ZtzcE9FTWopecxl8EEZO5O45ST9WTFwQGc5twn8k4
         xSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ws2we7WXHw9YXmipGiJTV44N3mYJD27bhJZ854/388=;
        b=pEZ8jXvdAmR0rXMG3yNvVc7rXVnFiWgU+jPEHrQwiHQBadUsx2/Cl4o6z4nOPej5IU
         LXwwj4ob1bRYaWp/6KTE1D6zSee0j1D35LNoqaqo6ESamrjLoDlkSsyDpaIqYwGWBjOA
         I3KjU/uvkhguEAxdlmpYwfZS0vZ6CjHFNhNJjsA35NMqevSIZtMPffBOBAWznCbEukDL
         oiC/9UB0HAX/FfSJtxz5jEiXVdyozyHax97lx+wQtS8JkJuCitaa6kWkODWr5SaV/tff
         VlsHzajHFqPfcMlA+eeBKKpMUUFc9LUbe7zJZrdroB4aSVHPxTZtI29i05r+F9Nq5wAM
         YoQg==
X-Gm-Message-State: AJIora+tZb+BCR4G/30orhvQf959pzwc6WsHZC8N2shhcumKwh0dpGPt
	wsvf8Qtq2X3noBp4A75kpzkLDjjcWh68mxte
X-Google-Smtp-Source: 
 AGRyM1vcg0mFipOmjP+nYMBxwf8vOMpu9Ham6VZf+iBquyAuS9w+r9yVd47j/wImxBfnDunYouLKIA==
X-Received: by 2002:a05:600c:5014:b0:3a0:4867:d234 with SMTP id
 n20-20020a05600c501400b003a04867d234mr7324708wmr.35.1656323398562;
        Mon, 27 Jun 2022 02:49:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b0039c7dbafa7asm17249081wms.19.2022.06.27.02.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:49:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] pango: exclude 1.9x versions which are 2.x pre-releases.
Date: Mon, 27 Jun 2022 11:49:51 +0200
Message-Id: <20220627094951.1882744-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627094951.1882744-1-alex@linutronix.de>
References: <20220627094951.1882744-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 09:50:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167316

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/pango/pango_1.50.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/pango/pango_1.50.7.bb b/meta/recipes-graphics/pango/pango_1.50.7.bb
index 727c170288..01a11a1dac 100644
--- a/meta/recipes-graphics/pango/pango_1.50.7.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.7.bb
@@ -15,6 +15,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gi-docgen ptest-gnome upstream-version-is-even gobject-introspection
 
+UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
+
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-- 
2.30.2


