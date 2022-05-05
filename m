Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B47DC41535
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.7216.1651727152914044293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sm+WvwJz;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id m20so6526859ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sAcqKU5R+a/q9XLgpl/L535cuM4E+Q2JDqTEwNQI5ps=;
        b=Sm+WvwJzyF7prMroTM2FHzN9qydXkk0Z1vwC/2ZrOXz6t1zBUd7Ufb2SFItb7q7w0V
         M3CZEUuQFnsy/RmqLM8xKJ+dSS/4UV7+d9wN/QJJuOyBvCE+3D/dxMy4PP3vCREJA6H6
         bQ3W8fF0hyRmmySW+n6R2omqQJclIAE6wAr0hSLYrVBfIqMc1Sn7TUTrw15iUbtCCCJE
         qEEoIAhOPQNiVxaAqOEWC494KwehBmJd1rbHAh2WAdPWoyhYrU1fX2Qw7opWXB6XCxmv
         hXgE31gwsF7NU00uAnrY/itWSwZMBqo4R4oXUhrC9grYTa0PuEdZlcIAMOy0XdbmUE7B
         ySAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sAcqKU5R+a/q9XLgpl/L535cuM4E+Q2JDqTEwNQI5ps=;
        b=GjDro2aIVhtBe7DVOICGNfoyQPu4APATXpFQ64p3Cw+FAL91XQZxYvGQKw4B6kfY2+
         wvMs2i48JLRQyfU5DdwYBUn6GAfbCSHYO/KSTYIsD9KXZDRoHFVXR2xjoqHUN+qeSyf+
         GuOuxkjWgpDK18w6Vxnhx/DvYHJMvjHHXXP0/XKUbRSyf8bwSMtQOwWhkZkoZol58qzL
         nTPKFMrAxoB59jgkRJFXqQgpjCEp3yBEt24uTneO/bAJIw7rysR8a6kjEcbpsOecBtXt
         qmwt4oDPuHHRc113ghABXwV54P0dIVgkW7BRG0ub8qFbegYqSzt0OsWxYQlsRUVKgFNo
         EZgg==
X-Gm-Message-State: AOAM531nIsBhCFMvbw+jz7oxH+Rx/A/0MHY69oTzrSDkEkgV0su6LuxC
	JMujINCEMCP63wRe/2jp+/e5nT3TuRw=
X-Google-Smtp-Source: 
 ABdhPJzNmXlGuWe+1WtkiKAEim7Ve7tJiD+AvlNC+ooxOm9ndrxRHy+p9RPnn/AlyKnDrcGQt0bUGg==
X-Received: by 2002:a17:907:6e15:b0:6f3:ec49:5441 with SMTP id
 sd21-20020a1709076e1500b006f3ec495441mr24573654ejc.300.1651727161123;
        Wed, 04 May 2022 22:06:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/61] ell: upgrade 0.49 -> 0.50
Date: Thu,  5 May 2022 07:05:01 +0200
Message-Id: <20220505050544.651895-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165247

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ell/{ell_0.49.bb => ell_0.50.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.49.bb => ell_0.50.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.49.bb b/meta/recipes-core/ell/ell_0.50.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.49.bb
rename to meta/recipes-core/ell/ell_0.50.bb
index 9edd6fc92a..243ac01530 100644
--- a/meta/recipes-core/ell/ell_0.49.bb
+++ b/meta/recipes-core/ell/ell_0.50.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "a7ff8ecbc76b187d942dd22b61cb489711400897c790319ffb7e944791687c3f"
+SRC_URI[sha256sum] = "0fe51d51c6eddc2a2784092f1dfdd1143a5ef27f15c274ecfbadd680d3a72fd9"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.30.2


