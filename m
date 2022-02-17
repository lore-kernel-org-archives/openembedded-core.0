Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14DAC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:13 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.1776.1645114212964575419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FGXXMq2h;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id s24so4118351edr.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iwGcT0aS7BWrg8MUg1uwZ/f8M85j5fDP3YSk7nwHwlw=;
        b=FGXXMq2hl9B/agD7I3LUGgHAaFCJj0bYs6lRZ6kRW6ejoTx7pYMxmbA28QPuNmUoWX
         tUTiYAIZSAc0DmKBAGpPiD2wbLFJvIdsVmAQ0Rt5w0tIgSHtEBwYRsSc1ezUcZQnjkLP
         YABkybYYxEC1FgqK9in909BDIJJpWioJZHKMvoVdl18YTMnRLGSLcRnyr9gqYysVwebs
         nG6OfBhIxXlMRyaw9ldGDABdVA2SB7LyYbaGSs+ojAYS55BKu4cdTRWAHE1QLDlqjTJI
         JAoctgdUmOgK84CfNnHcm0+PV0nPv/eWO555MZPsM1AM8LyKttn1KiyJpbyekcxNBd1l
         Khbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iwGcT0aS7BWrg8MUg1uwZ/f8M85j5fDP3YSk7nwHwlw=;
        b=vaBke18WfeJVdhx8A+NE6lxIF8Hc9jEB96eMNb6jZCwYgZFHqZqzaTcSmT6wFufhvw
         oCeLph9wVou2M23TPYOHpy1i3LoRf8gJvRCerY/rhZuRtkhV9xj421S+jlWbe9yb2p+A
         BN62bxdD1j+0TO9kcZEUUDG81Y220eoUiO9xXaIEBXIwRQJITe78Db8NZYeFV/2wT0Yj
         aFoGcfsUs6Ax6cvxyA4wgjh0omHrvom/j/IBZ22tB7lp4R/50KwQwtzvt4iKIf9a04mr
         zGTFr3lX+mNRNkebvPdyMcAmbRERo0IYmFIzLHXHzsUwlFE6Lwww5ZYfv2r4QAp23hWj
         s+6A==
X-Gm-Message-State: AOAM533mDqSvXRIlMBe5rUaJDghNOjpi0DZSDf9Gi3j8lf8dH+0QEkxQ
	WfQ05uI8zA35o2YPqZt3SdXpqJWyu+Q=
X-Google-Smtp-Source: 
 ABdhPJxnrMMc8asnmbEe8DUonKIJGF92DGfsMUoL7y9Kkujn4ujRXsoayiDYVeKq9QftLmkUWL3UiA==
X-Received: by 2002:a50:f689:0:b0:410:a334:2b9f with SMTP id
 d9-20020a50f689000000b00410a3342b9fmr3269875edn.251.1645114211591;
        Thu, 17 Feb 2022 08:10:11 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/28] piglit: upgrade to latest revision
Date: Thu, 17 Feb 2022 17:09:35 +0100
Message-Id: <20220217160939.1424397-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161841

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 807b2a2819..bc45558dda 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "f328af2ddd0d1bab0f3d149373a36657b252b337"
+SRCREV = "2f80c7cc9c02d37574dc8ba3140b7dd8eb3cbf82"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1


