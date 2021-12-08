Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43DEC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:09 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.3066.1639000808747335733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MvFzf5Sv;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id d9so6508125wrw.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bRWzP5kWwWYLLmS01eoNgC+iUhQJoevGyXVIVtle5G0=;
        b=MvFzf5SvLECM0VjlOqS7Tz165M8rijMkZCC22m2OAqDulOUMibmacxg+7in5gZOqFY
         TmfcScXYHmaipnW9rZoqbQH2w5/8aSYgueqnchZF3dafPXaBtg0f3MhRZ8Zge2hYgFtg
         6n19f5iED3UPfFrUwwrgQTxYBRLLZUv36m4LRBcYmpjIH+a6wAhE5tmZFKTbhnsRR4Mv
         xq9YJZ9XBjsQbzsvERey+okoPaluuQ5/Oro1JD3WhRNYMP1hM8we3MngBT4AY7oQuNhN
         lZNbyas7Vt4oCdOmhM+AJ3WDLibNeYUWxdACbsvbty60FUcL62t3yG7Whg4S4kSy7R/O
         rFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bRWzP5kWwWYLLmS01eoNgC+iUhQJoevGyXVIVtle5G0=;
        b=IahDM9s5vbHrPpS1TTFHOQ8u9bhfTLV1xiQ4Ym10GwqiiDPjvZxYY/wc8/o1jpjAvw
         +1dtkfd2OIix3H4MRALf3aCUsy7Uurp1+SLaR2EyJxGPbLr6MudkuhEOvNwMRG7d56Sv
         XYv8pbH/faTeRBwpSynAmRX8NXsY++pBilBVwyllHiyc+UEV7075uRC5THgnWr1CIHn2
         omAmIwKG/uZj0TM/gsGk4U93y8YDqfelF/mPWtDGOWJ+q+WC6i2gtHmRU1wycabphBwg
         2Yu42+u/28KRCmlhRGGZL2xozon+5CKXFoOFixJhkcFjTYn5IWiD7L0a2VzmngYDQqdc
         XCMA==
X-Gm-Message-State: AOAM530RzKbOiG2zG1aica5ou50o0H8x8SymjKnFE20YVcIY645+Jvkl
	Ldm/THdCdhfGWLHTEylsoYCkKT69mm4BaQ==
X-Google-Smtp-Source: 
 ABdhPJz70Nd/L9bfKcTikEcnfPTfo9ebGahGQJXZJcuOufk0iJagUgnvvhVjUWETqtxLY3lxfCnl4Q==
X-Received: by 2002:a5d:6d8b:: with SMTP id l11mr1548970wrs.458.1639000807367;
        Wed, 08 Dec 2021 14:00:07 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/29] python3-pbr: upgrade 5.7.0 -> 5.8.0
Date: Wed,  8 Dec 2021 22:59:33 +0100
Message-Id: <20211208215947.1979470-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159381

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3-pbr_5.7.0.bb | 4 ----
 meta/recipes-devtools/python/python3-pbr_5.8.0.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.7.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.8.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.7.0.bb b/meta/recipes-devtools/python/python3-pbr_5.7.0.bb
deleted file mode 100644
index 12aeb7e8fa..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.7.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[sha256sum] = "4651ca1445e80f2781827305de3d76b3ce53195f2227762684eb08f17bc473b7"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.8.0.bb b/meta/recipes-devtools/python/python3-pbr_5.8.0.bb
new file mode 100644
index 0000000000..b74fc16754
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.8.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[sha256sum] = "672d8ebee84921862110f23fcec2acea191ef58543d34dfe9ef3d9f13c31cddf"
-- 
2.20.1


