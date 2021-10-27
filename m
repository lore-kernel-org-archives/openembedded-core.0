Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7542CC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.9294.1635325661745789297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fFQzWxSR;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i9so2900065wrc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GhnNrli//9MtywRSg1bZWoZNIH+dnBA3sy2VcsYVpQk=;
        b=fFQzWxSRB+7c3vj2LQxfxkzU+kVEhiBMBJmRUOgYL8jweXwHvHId84yEcbQjDRwbHp
         rz5CbKEzX39UtpN/+QqMy1A3dSPLCI6aygcnBEi2ylVfuiZstA1/P2wKMGKWLTIlDeQf
         sC6r2JmKSSN6jdP7+gU64Z567G4q46LuztRnA1/cBCT1ArQZJYNVt9eYGNR3FZZGClbJ
         fSHbYRzOKrI6g7tNmKd1Yq54sYGRra6cdr6Nl/5gWOlI2tyShqBUwGpwAseydq0xew6y
         PW4wO+Say0f05uD1uA8pu4QT1nL9QnnIG4PZlW9q/IIYycDG9AkpOV90YPq28HkhN3vW
         aDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GhnNrli//9MtywRSg1bZWoZNIH+dnBA3sy2VcsYVpQk=;
        b=eEp/8EIwbIiAP8v4V36dfYIoP+rbWCzTlhiuAOL6+9OjYqLGJfLKjesE9yqnvlyPqh
         MirHavdxp7eSOBWqnHg4qi4Br9sVhe+zKzLwu1BhtfWrc6agE8gXE56cFpsvCr8Owlg3
         zZ5QjwU5rv0vnuDrASjFCZRvg3IA1aC5fRd20IcJuRM8SeufzbIcNjjNp3uvrFvWbMJl
         kxy5NeEBz7WSfTTWttvhVbnAAnNNzRA2QFxCBME36l/4PH6rdlijDfsjZh6R6ptC4G1o
         zP0EqzznEsXYcrhnFd24V+i4XbgWMPQM6fYNrJB4ooFMfupWNVanzObghNgVBeNNA2S7
         QliA==
X-Gm-Message-State: AOAM5328MzQXgooJTtsYyB50/p5hDD7/2CSRaJro7jgILhrl+DqxbYyY
	VAzt3U9uiUsCQf9HMPDbd0Rqxg6RgCA=
X-Google-Smtp-Source: 
 ABdhPJzzGQjXd7EGPvwqHhAJuUiNNhvikjE7kFtMfAhHjq11gB9KZf8VcR3W/+Ln4CFedTc6ARTrhA==
X-Received: by 2002:adf:ca09:: with SMTP id o9mr37960083wrh.303.1635325660357;
        Wed, 27 Oct 2021 02:07:40 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/30] json-c: correct upstream version check
Date: Wed, 27 Oct 2021 11:07:09 +0200
Message-Id: <20211027090736.2546759-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157479

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/json-c/json-c_0.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
index 863463ca51..a4673a2f0e 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
 
 SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
 
-UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
-- 
2.20.1


