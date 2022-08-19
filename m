Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B741FC28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.464.1660894083026496777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W4yBXkvY;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id z16so4160174wrh.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=F/3C5TT5KSXzkEh6u7jkk5cR/kdYDil10xohvh/FHiM=;
        b=W4yBXkvYt29dDuqOBZ39pCfjZnEKm7CTufbrh5OCQykmx+upP2Ph28Keg9lIXXIHGd
         5zRVVSlQZHKitNasWYwnBU6Tav3VywytLLPnppIAJ+VyWXCBF3/9pxy/kxEVoJ2ouSl1
         PvRdSb8xJMSq/3Mt0EntVydAx1kNs3DpDf7KuhfCBwbIz13lYha2JCCvJqSviG+pW6Pz
         VhKIkbsnZKP6xWWCNpbEGh1eNaRwslMBBUzEW962qxx5wi1d1MMr+5BmclbJ50MyGDBT
         dZ4F7TtFxtLjPheQ7/Rqj9lGp/isCO2uK9uqzOQlq56D11lLZ3bNTRcWYPj2/qmA8f53
         K4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=F/3C5TT5KSXzkEh6u7jkk5cR/kdYDil10xohvh/FHiM=;
        b=2JKrZb7j48RHQb26n3Bb9/P9S7mxi/cDHqpeMMk1rDBA7wcCyZZ47waylJVn1rCgNC
         LtjPQsyTmwFLVNHiQ0U+orU6BVrndkmiZU+DNvbUHcLOLqWgaHqu982QV/TF+6zORf8E
         P+82VJohKeB6ITk0oFoe9NqBXpPPW2RhxEPFs0wfUbUgPi9lYAJ9XE12u+mfZLB0Rmz2
         XUeDf9Scl+5gleaGlgXzKae47RUPr8egJiTFZvwSABkFlOSlSXqyNg4viVq8wKOF0w1N
         k7N5RZpC0xhWJQhpdbM0U0LApDxD7XGSY/S7pveOX/hs/8pe9U44GG3kPob5j4xzc+js
         /72w==
X-Gm-Message-State: ACgBeo3BsBTntdkXid9WuEuIqYPGebb737A7GSN7vcy9SuNrVF2Z0tQu
	gol41BsZPqhw+BfdX9Z35Os8NYjnuSg=
X-Google-Smtp-Source: 
 AA6agR62LoAbook99rEESyUSekSjTbhu1Sip3GJiLFTM40UPAnW83uq13vSWnPwKLJeBRZv0HCDP1w==
X-Received: by 2002:a5d:6348:0:b0:225:2ec7:81d9 with SMTP id
 b8-20020a5d6348000000b002252ec781d9mr3480960wrw.693.1660894081451;
        Fri, 19 Aug 2022 00:28:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/42] libjpeg-turbo: upgrade 2.1.3 -> 2.1.4
Date: Fri, 19 Aug 2022 09:27:03 +0200
Message-Id: <20220819072727.2236928-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169589

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../jpeg/{libjpeg-turbo_2.1.3.bb => libjpeg-turbo_2.1.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.3.bb => libjpeg-turbo_2.1.4.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
index fdc035d5f7..1708fa97f0 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "467b310903832b033fe56cd37720d1b73a6a3bd0171dbf6ff0b620385f4f76d0"
+SRC_URI[sha256sum] = "d3ed26a1131a13686dfca4935e520eb7c90ae76fbc45d98bb50a8dc86230342b"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.30.2


