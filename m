Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE960C43219
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.3086.1639000812173549366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qg0cMdSP;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id c4so6465350wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=22+TTr0dJRUUN4almXO1aRIJfQ+qK+/13NyQZac2lw4=;
        b=qg0cMdSPuV/QShA30pQUMZutW3KkER1b2UFDzqVveDVxlawinLYyx70VmUyE3T2ayB
         Hpq6e4dftL6qpAzTvpXGmtRONQQ4SStZS2Lz/xqR1Mz24gmGyZzAzcVQ8XlymK4jAD4J
         9DwA5lCL0LVaVyXRN65qaTLvNWsNAZUOUlRmq6mP9TYox2hYlcINMHPCGRj4o/GT7Bzz
         vOqgycY/k0M2pb3jqhznrm1LaOAp6hHHtry/THU7iXaMP2l8AFT5d+aaHR6yOdgnqVz/
         O36sAikKcoNHDwq5u9Q/EK4taFPdowqbaxcq/oOUoxQCyqOY2SYKf0p/8kY0oVbRFfOx
         MTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=22+TTr0dJRUUN4almXO1aRIJfQ+qK+/13NyQZac2lw4=;
        b=4JEkHk4dHr+d6SOLmqGdpuTI3/8v5AMOdNOLBy45RBjiMO0lxBdIwMGV6ZH6vqijfB
         b0xBf+AFAQ0JYzmkD3N6X6JXpR4qOwuIrlIoqN1fuTPbBpqxzylw1sH+5gPkvn7BPq1k
         lx51GixvuVZKF1LJoTuKwO3U2AuQ0+ome+advAFFbc8d1Lco1CDND2+AjTqjRMDHwF7r
         vJherU32iZxiNfqPpUMDjqofCRVIS30KtOlBC1xW6z278nUFIC+lvo+jz+F+OOeaIfLK
         mZ/ASuTF0wedVNDs0qRjOTmOw+v+BhVUozz3WTiTpaniPnXD6/r/hOQjl1uOjwXLttcc
         9BOw==
X-Gm-Message-State: AOAM53194TqZJ48cAnRG/c3VBO8VkTXZnf0dqF2axdytWa4j+W/7xrjM
	N+0jVvpp2jZDTB8l8FUCs00FEIXJrl/zgA==
X-Google-Smtp-Source: 
 ABdhPJz+fxkhUh+wB9z/5Ftov1WUH5lAdOQZdiWTdDVlH2c6PPCiqbqYXmMbmUXd8zKd88jU8YhKkA==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr1619021wrr.177.1639000810805;
        Wed, 08 Dec 2021 14:00:10 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/29] mesa: upgrade 21.3.0 -> 21.3.1
Date: Wed,  8 Dec 2021 22:59:38 +0100
Message-Id: <20211208215947.1979470-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159386

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mesa/{mesa-gl_21.3.0.bb => mesa-gl_21.3.1.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.3.0.bb => mesa_21.3.1.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.3.0.bb => mesa-gl_21.3.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.3.0.bb => mesa_21.3.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.3.0.bb b/meta/recipes-graphics/mesa/mesa-gl_21.3.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.3.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.3.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e601eac581..c894c2dab5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
            "
 
-SRC_URI[sha256sum] = "a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1"
+SRC_URI[sha256sum] = "2b0dc2540cb192525741d00f706dbc4586349185dafc65729c7fda0800cc474d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.3.0.bb b/meta/recipes-graphics/mesa/mesa_21.3.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.3.0.bb
rename to meta/recipes-graphics/mesa/mesa_21.3.1.bb
-- 
2.20.1


