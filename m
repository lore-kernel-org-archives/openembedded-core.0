Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7551AC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.9295.1635325662508927989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VsHXMPrF;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id e12so2893859wra.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L0NL5OclHp9YxPbfBqqzZ9G0ZvxetRND5TgZl0aNnsQ=;
        b=VsHXMPrFoRo7N9ancEiD7NXYujPsC9gF0F9kqVeLZyXTUPPd4iKGQrYKu4QQFKv/bz
         TaI5G2S1fEXC4ddhsx9kTFfqR/l3YGOH7eaget9dJGnouVwLTc2x75flgbsMeKH9rVNp
         u3OvAGrkOS82ujgQ88hURh2hcf8Fp7z/CCMsJ+9/8Oel+HcEq2/nBubt7xdNj9Gf1IkU
         cZYF8gfmlbLvkxSYTkC+dkU/SH8G/pJTabX1zvTjEcGzN2VhTfgafk7lNtn05i/Ba+mf
         Nn0RnQIUJ6lbDEqFFAoeh6abREA64NPEcAVg/jEc7p2gUCEsk7if86w7Jk/23lasqrmJ
         FXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L0NL5OclHp9YxPbfBqqzZ9G0ZvxetRND5TgZl0aNnsQ=;
        b=hJcL3Wnj9KqNwMDiqUWSdcMTdmQPjprEFhh/gC+ptyt7P/Sf0hLoMTxdDoWHjdpcyY
         p/r3tZYZmn60TuyhA7Saafx8GOEnPSRmKuvcyYSUH1WFLJKHN7G6ruHJ3H61RlZPNZMV
         gY2Zx8iHQ5gDOUZpnDvp7cOy6y4/NM5YJTQ+8KP6Vyb4TozVLK6S/NjUMrL0ru22f71s
         V7BX/iT8xvdOqo9sB3ZjuKDPzMMmmtn5CfdLVmGb6IgErESc4/x2ihcVZ47NvuhUZtdC
         4za+2pyk8Z1I30k4A+H+TNrqk/6R5Yu9kB4DZseaqRaCa3rs0nK+Fi7pQVgjMjTGmIlJ
         ZPdw==
X-Gm-Message-State: AOAM532WvDhbVxY0rpJffCegWglWX8yPht583LYpzWfSp4Yuz/cnc676
	jmEp9R4GH+X5roxmWoHqoCk/9QpQeBI=
X-Google-Smtp-Source: 
 ABdhPJy6spQbg5MC5bJQGXQvJic1K8IdwLbojJQtfm/LA2eTo5nrMxXRKvZ+5PrPCGE3XEc/CcI6IQ==
X-Received: by 2002:adf:a31d:: with SMTP id
 c29mr38862729wrb.381.1635325661010;
        Wed, 27 Oct 2021 02:07:41 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/30] createrepo-c: upgrade 0.17.6 -> 0.17.7
Date: Wed, 27 Oct 2021 11:07:10 +0200
Message-Id: <20211027090736.2546759-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157480

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.17.6.bb => createrepo-c_0.17.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.6.bb => createrepo-c_0.17.7.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.6.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.6.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
index f9fa8f52d3..739a2dcf7d 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.6.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "d764fe9b386aa8da1aca58b9bc3dc061f52e8f28"
+SRCREV = "c4e6808c710ec68e56bd93b0366f3b6cbeee3167"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


