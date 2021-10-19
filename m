Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3BBC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:45 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11593.1634657683308609508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XTbw9mUs;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 d198-20020a1c1dcf000000b00322f53b9b89so3676912wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BXV2YrsvJ1Le4BG2V0IpaQt3Sj01hUuEe+mMK+qPNF4=;
        b=XTbw9mUsFVujVvcBEJfyPkyHXzZf14FfpnGUSyZX69ZiE+zkj2k0ia1gRT7uBJqNwo
         VYso+33dn1+mSdbu20IQAsu4HEBY6rMBLiLr7eLqmb4Arjf6B1fvbKtOGbM8Jim0CHrt
         2fa1EQBLzA2E76HXZUo2RxhhdfAI4vM8h1SLtbkM3nsGpbntAjDTsw1iA0yZUJyviMZt
         iWEVeAq3SOTmVtk7aM7jdCU7sCvxivOYg9HYkjU+cz3yd/yRCtSqQgaCep9uzswP7QKA
         vVZg95+YATMbk2/R5sSdNfIb2Zg68LbwksjXR6o3YVaj2aNmtu8M4clUIQROlFG7pTY0
         admA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXV2YrsvJ1Le4BG2V0IpaQt3Sj01hUuEe+mMK+qPNF4=;
        b=ov32lGF0F8IH1nNcfR4nyCVz4InGqQ/Z1RJrboSf2H/wcMJSldHBjuZ+lmVrUOtJ9P
         7xoFonpzYnCY6u9ui83vd2mngeW/9ZoCMuxsl1lNLel1Q2uUHI29NrB1gDHutxeWcK6V
         QJs7DfJ5TXCviOR70YwKmc16/WMK1z2h22ZG3TDu5v0RGTvGtdIyI+fLRI5LgncB+ThH
         rMLndLXNoYhEcghhNzBa1FYB7+IexoKv8LbzkPWM7CTuFW/dLyLN2SepHG45VNHmd8ke
         SMPT3wKH0GGb+a7fV4+u8vjgE9418ZOS9hVdqbrylMSRnjSao1fM18KszWV0qG4E45B6
         KJ3A==
X-Gm-Message-State: AOAM533VClXxnDOiTLPwn50axzuadZJRxYNJFql06YjwvqDwiiMODBa+
	DW6S4DRW8N/YQszP/2ZmJGefS5d/jSY=
X-Google-Smtp-Source: 
 ABdhPJyOQ1GnWexZPzFoTUPqrlWulFQ9dl7zvpuQao5BCy/sd+zHza9rDQE9Wme8y79WQSlSNDF3cA==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr6851168wmq.184.1634657681768;
        Tue, 19 Oct 2021 08:34:41 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/65] openssh: upgrade 8.7p1 -> 8.8p1
Date: Tue, 19 Oct 2021 17:33:39 +0200
Message-Id: <20211019153419.3319802-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157144

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../openssh/{openssh_8.7p1.bb => openssh_8.8p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.7p1.bb => openssh_8.8p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb b/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_8.7p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.8p1.bb
index 07cd6b74cd..ee86bb92ab 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] = "7ca34b8bb24ae9e50f33792b7091b3841d7e1b440ff57bc9fabddf01e2ed1e24"
+SRC_URI[sha256sum] = "4590890ea9bb9ace4f71ae331785a3a5823232435161960ed5fc86588f331fe9"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_WHITELIST += "CVE-2007-2768"
-- 
2.20.1


