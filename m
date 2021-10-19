Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F043C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.11482.1634657683756874105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dBcaXwVM;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id m42so12447992wms.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r8yoODok1Jo7gDRIw7JG8b0hTPy5T7sPL4+/cSoEA9s=;
        b=dBcaXwVMZzhb6Jr5uEBtyeZIJ7XE8ftWg+MH4DGmEuzQ95lHMyHRxZLjpHi3krib2y
         dsd3GvGUV1uzQFquDKw1EAVcGaO8dmDR7iLYDA/x/nYLeKZwjFGCL+2zBArKKVpBdHyx
         EQnZFU5Z1B4bfvkwX3W2XjHuku+DLtESRFNnNurgEUr3irxdrhzmb499jNBl2w7oHCzN
         wSJKunzx6Kik8CchFQVk69v5ZgVL1uVBscwn3Z/oNMDdbG22SJIxN/P7HA9v2jnwzI18
         hJx4oDPponrPza3NrdyIvUdH4x0839a2/Gdvjlc+HD834Ial3jKXe1/Wve/J2sqEHDPO
         AM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r8yoODok1Jo7gDRIw7JG8b0hTPy5T7sPL4+/cSoEA9s=;
        b=2XidlOp0H691JLBBB/8yscW2EBwbT8WLR7oJZKjvpY6lMWFaTwAQA276xqQmCS8hw+
         UJpZJK8lm40YKTvlp4oObezY66dmIl2HEF7hVswWyztzzH+RvNJYxEmBvjmBhOzT8jBf
         8buhGZy74ii1dV0IWY+sXa/OkX7iRI/rMWMnBTeip5E0s2lKp0P4lXtfXaiXPBjX8X7E
         U+0aZcX5xGf2yojUMv9AbAaEgJvB6xjmuCLNza6N1Rwfp+9qLGLVmn5ecSIj/YirXngX
         9x7Q6QebXwzC2FhPAActoArNaX+b1Iuw3LsJtfIG5jUJeXZNTKj1C3p1LwITQaq2paqh
         Q3fA==
X-Gm-Message-State: AOAM530kRNLwrAhEvqXS0u7dTVESSwz8APrwQtT3xylvLgJOagf10Ew3
	B1dTNjUJmbms8as7UM8VQ8tetZEhZ7A=
X-Google-Smtp-Source: 
 ABdhPJxL0RjvNs+2odoT4vmszt1xROL9YdXAJjeHf5Q6EoKRlWwg+uHJbPfWxVG1Mlh5HQFWNPG6Iw==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id
 g8mr6803010wmq.153.1634657682422;
        Tue, 19 Oct 2021 08:34:42 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/65] psplash: upgrade to latest revision
Date: Tue, 19 Oct 2021 17:33:40 +0200
Message-Id: <20211019153419.3319802-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157145

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 1be7ece79d..1d410bd548 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,9 +6,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "0a902f7cd875ccf018456451be369f05fa55f962"
+SRCREV = "f5203fdee61b90ef9552ca49c213fe16776b3e4b"
 PV = "0.1+git${SRCPV}"
-PR = "r15"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://psplash-init \
-- 
2.20.1


