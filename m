Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BFBC43217
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.6547.1635842589837405499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DvJQlsVe;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id b12so27581234wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g9H9paA9pTmvi/kN6MHTOEw1rh6592nQdjcHDNYMTUA=;
        b=DvJQlsVeME4SEoQXLq0bjDZUyGFtmBzbNyxFWfAz8XcJwREPuHjcblczo/d8OZsRC6
         JACjgKfFqL8sqXcckXPBkPmCAX1ljz6bK/vt4+tFcwMvP8HhMRagRiKJ6vdodZaMXiWG
         5pEpYCzvmPQRXQOAlzvYoLIVbhgghXVTem/PsjRqzzBNvRGyMNDFLxQ8Hfk4oh0RFiIG
         ba0aMT4gVoaVpPcgf+REoJzRKvIlwPLxvSdxuabKJtITAR3L2pU9rtuzHIiogSIj6zxP
         AmDidoL1J5elCOhIyipF/b30lna6DU/TWJ3PNG2Lq+zN4SWFR6IswT4fW8l+eiDaTuno
         M+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g9H9paA9pTmvi/kN6MHTOEw1rh6592nQdjcHDNYMTUA=;
        b=WDmBZhBAdynLJiUEfLK6ddKnnR+JdWZDq1rBle5ghZbdDiIDcVdGYV0xiuZVX2Z8hW
         +GsktJa8QiF/BHiJhe2yGmPfGIZaho7ilGseJW6RBahAGf0Zd41NasjauIA34Pq836S5
         ov69d7QbyzVgHT67IRphNIVJkOr4DGDozt3gxYpjB2pQiU2XkvJ9HT1ZGR70uuG1D9T2
         U7fRE69yHfEroEx0uTwHu/fRsqKR9yZzngBRBA3ldu1jn3xUIcp7spF+UwM0dB/DnnuG
         meiYBlW2LDCCB3ZGQ+I7DK/9RSL+Ou7bgVnqqOid5IMkKv71+5cKmZ9b2XhliRhyXyoc
         sRbQ==
X-Gm-Message-State: AOAM531Dee0dHDiqNYeddVWllTYZ84bqQ8PJu63CZk7KExkKODxjNfNt
	LjRJ9gAvBNfPJeJ1IUmTC9eU8F3n/r0=
X-Google-Smtp-Source: 
 ABdhPJyPSjR6SLEfRGA08LvYhObnQtVaMK2v8snARx910HU01kjbOEvjJC3UWSJ8oDq3iTmcXVP8/Q==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr45901939wrq.6.1635842588453;
        Tue, 02 Nov 2021 01:43:08 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/33] python3-dbusmock: upgrade 0.24.0 -> 0.24.1
Date: Tue,  2 Nov 2021 09:42:36 +0100
Message-Id: <20211102084303.2974802-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157744

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-dbusmock_0.24.0.bb => python3-dbusmock_0.24.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.24.0.bb => python3-dbusmock_0.24.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.24.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.24.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.24.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.24.1.bb
index 271a2b105f..cf272328b3 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.24.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.24.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "0be0d51dba4aee050bb2cd9074a377bf9308306df1eb7918038c6ffe7153c272"
+SRC_URI[sha256sum] = "56d660bd5f5d0edfe8b0eedfbb9b0814a134eb94b46fca16c379dca68be5724f"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.20.1


