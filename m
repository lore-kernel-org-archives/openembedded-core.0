Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DCEC4167B
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.4140.1667832946133567471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pxRouofR;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id w14so16582658wru.8
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HnZkW3R7Swsiq44iHlYBOjtpNp4rgOWeX8FptQLw9I=;
        b=pxRouofRnhlAcYV6FDqvFyl7MbDxDj3BNbx6RZOIA00s+aS+rPc2PWMeBr5eZmBZYW
         jRUaeH58yBLWWrSnWfk/mDDokWvv/4unLgOKCVdIwl5DX+OqVnYA3ol2D12ThRmveNP6
         yy5juav/CDlIbA+Akszg+NlvZ/5A/HmDYL1I1h24k8EiFqd1F13rGKV2IpZnH+Inz3IH
         cN6sxRcE6gBrsNGcWlttULUMw6MjZ00js7XCIc2ZlsR78ubish3Sg8UY5YNAYglQSZoQ
         EQr0iCwuxBOgbVLHBLSj0CHCAjpzv8buJlx2KQXWjXnaQtBGpnSL64oEAFF8kNwG3oGS
         J+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HnZkW3R7Swsiq44iHlYBOjtpNp4rgOWeX8FptQLw9I=;
        b=JIjDVg55FR7JboR2wuYy9xjVLb0edvqoduAye82hxdnftO4qjWjJjuWBxwVaaOt4yy
         S2F1G6FZLwNlyOWNXi5qxQ7GWE4PmDeCSVP4CS2h8RwWTbD2Y7Zed4c+x55fGpaBs8S7
         sTzimPAH9oDif3Ol8Y4XmSItmqGVByXQxQJepXq+QVnMhHHUc/QG4SHGz8mcLQY0MEXW
         urH+VZbgljzAxPUmoPNYexPTtRoUUR7Q3fQXGoeZSLpao+94d3mv5Aq2eibZqnIj02Ui
         PoqKZq5vKcN6Go5UJrlhxxVc5IkgJoanXUw11qcHXnYbTC5ZQ0ZUCGjU/fPeWIe/1vMl
         SOJA==
X-Gm-Message-State: ACrzQf02f9wSrAWlY900oEsw/z51DSd6YDhWo8DdQ+SZM9Ps3FL0tsMk
	WSly635neMFW05AyM4xBGPrkRiE4h3w=
X-Google-Smtp-Source: AMsMyM4tNQtH1kQHRW/yi1Di6zpWyiK3Jbzm9pGsKrLKGBjZ3JS2apKciZgqZM0B7qq5JcxBRe+Cug==
X-Received: by 2002:a05:6000:1d93:b0:22e:5d8a:c8f8 with SMTP id bk19-20020a0560001d9300b0022e5d8ac8f8mr32062784wrb.324.1667832944277;
        Mon, 07 Nov 2022 06:55:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/48] diffoscope: upgrade 221 -> 224
Date: Mon,  7 Nov 2022 15:54:50 +0100
Message-Id: <20221107145508.1051404-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172880

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_221.bb => diffoscope_224.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_221.bb => diffoscope_224.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_221.bb b/meta/recipes-support/diffoscope/diffoscope_224.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_221.bb
rename to meta/recipes-support/diffoscope/diffoscope_224.bb
index c801200d7c..5d634b8073 100644
--- a/meta/recipes-support/diffoscope/diffoscope_221.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_224.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7b1724e9b1e5ac6597cac07d0acd2661db1bcf0d6a9b2e87be21b5e3806be9f8"
+SRC_URI[sha256sum] = "1920ebdca40e85f019a84e0220e4a79f00ffdafc0f78e1f1e2219123d5c08dfb"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


