Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEB5CCA48A
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.30988.1654516894928751584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fLnO8Qh0;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso888738wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k8AXKRIKzeo1fl/MlElNTfjej566/wd8cfk3tKl55SY=;
        b=fLnO8Qh0VNEtUqIwm60LJo/E0FBWIMC+V84BEu5Xh0ALaBQ82hMs5xrqZnu1YnRT40
         PLuMf47ESady0yPXuCie/S/AjvBigYObOYiv7aofDfy0a4ep0V+4BdCWCLp5jQRpxqsh
         HJmTzgl3EYTpqHEqJM4v3gZSSh7hmAKD521Kv67NooxIsXIAWueki8rgpqUCkSDlbdhm
         HsrKvo8O3mgMGRp2NFfa7K8YCdZkfvzAg2AmSYzcLlu/czxUtiiVBZObUHrQcacP6tHM
         WlYF7+zMLPCLFYoNLjIA5k5aya2+dUyat6QsqGtgjOEXOQwUiYPQuRtb1pECmMxy3Rlc
         s3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k8AXKRIKzeo1fl/MlElNTfjej566/wd8cfk3tKl55SY=;
        b=m/60FMqmd0EYsPOa+S48otYRgalawt0bC7JFbzRNBRgoy3Mb9a3TBH0o3pduJRJmlH
         90tp6thdpReOX0WQ9I83Kb4jOME0qeO9/I9F+mrlpRnjjLo6s2kAOuJvy/DaFVhWnLrr
         Bg5sNyqG+Jbjip/DPzZRmzwAqJuuiQh5zquMAloo29aSy4z7gLABLb/kx1GxcHAGO0vi
         aYQM9P0FyGtsA5nE+LzjwbptzvBJFDL7z0TGFo2obxVr+sa4ukb9rW030865roNEsJit
         K3msVppMeKWc9Z0ZkgyEHQqVyDBrle/zqz+G2Tk6bVa0s9GDOmfxFENHiAVuChSExYjR
         mbbg==
X-Gm-Message-State: AOAM533XKiY/eEcmV+KCjinjiDnMzvq5MHzqgp3wRnp6T1DTkDh2FGbn
	1VQNSv2nlJt9Q/elsMOzBXoo6Z2+th+4Ew==
X-Google-Smtp-Source: 
 ABdhPJwTDSPnobJwvhnXgTTLLIRlBwuLArcIq6V0mM2S5t166OJE+Q8wagVXEImfHuMdagT0hgZHfA==
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr12116279wmd.118.1654516893506;
        Mon, 06 Jun 2022 05:01:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/21] less: mark upstream version as unknown
Date: Mon,  6 Jun 2022 14:01:08 +0200
Message-Id: <20220606120126.3381438-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166596

As we're ahead of the latest stable release (updated to a beta by mistake/
unclear upstream version policy), mark upstream version as unknown until a new
release happens.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/less/less_600.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/less/less_600.bb b/meta/recipes-extended/less/less_600.bb
index 9ebe39daab..f51083e1de 100644
--- a/meta/recipes-extended/less/less_600.bb
+++ b/meta/recipes-extended/less/less_600.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 SRC_URI[sha256sum] = "6633d6aa2b3cc717afb2c205778c7c42c4620f63b1d682f3d12c98af0be74d20"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 inherit autotools update-alternatives
 
-- 
2.30.2


