Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD30C3527A
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.7376.1651727161627440239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TLpqyTfu;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ks9so141970ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POobVjNRfo1arPGxPrhquvdyOJnxoPa/qXYiFBo/Er0=;
        b=TLpqyTfuxv78ff+korS8L8Sw7B270PEORetaz1FKatPmmGfICgGC59LkS89pMu3oi6
         zIp9Y4x8e/hUBzOxrJSWv3266Jcg5cBhhpTIk8WrZsyWWawoIxgBL2uFxq42l0lhBzPw
         FJaWdvWWbqV4h563ruT6/ZeL1FrjvnlbFNQQydcZHtxgufn56NdFHEui3e+jJ1CrWuN8
         zI5celufyqj2uqZoRaBbs8t0EF1IJ2nGFLRrlbkR2jAPawJXR9objCQ/Ikd4/ROZze5r
         Jtgu9Oq+yf6oOFLa9vrK/ihdnOHQKuobjpc6WIzK+Y6SjRU6O0oF5floxvlDnjRwAmBw
         fisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=POobVjNRfo1arPGxPrhquvdyOJnxoPa/qXYiFBo/Er0=;
        b=jZkdmurpONvjIaOYwwl2dvyMwUIWxwI6AUOvpPKyvNUsiutF4N9/3FcuLGJy0bWfFk
         bvGRkeEKkZ+/iUITnKp8pxUyG6fpoZVJaSCj+XCA43Be26aQxBrYDYmXZBSkN3qoSaRO
         eUXWKarnAqrBfSoPvBrwV8p0jQbJMikdDbKuwYMxO5WX5tP7pX0lR1hZUwwmAYbfV/lo
         lpAQDQyyRRppuf53k1QN+fsvRojPri2hUw7BuOrthAEuZzrHe+Pn+x5baa2dDNvkB4QT
         MquaXA9mtSmDkSCMEzGleYWlYso9arTlIL8J/ydOx7Eayrpg70+AyZhEVg+CXJA0Y+j9
         UhQQ==
X-Gm-Message-State: AOAM5333MNlMe6lIi+zjY9SWd+fyrprJKm9dSBt7U34sMuukVsoEeWkW
	FIrzcAJWTQSJd/AaEqmTweIJIx2VdVc=
X-Google-Smtp-Source: 
 ABdhPJyicWY8e4fSNkU7yUjwFz06lJzFtCe2Mj9jhQWxdZq+LONP+YIRDNGkheNgCdI9uDMKXZzANg==
X-Received: by 2002:a17:907:1c89:b0:6f4:4089:8256 with SMTP id
 nb9-20020a1709071c8900b006f440898256mr17722169ejc.60.1651727160169;
        Wed, 04 May 2022 22:06:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/61] dnf: upgrade 4.11.1 -> 4.12.0
Date: Thu,  5 May 2022 07:05:00 +0200
Message-Id: <20220505050544.651895-17-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165246

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/dnf/{dnf_4.11.1.bb => dnf_4.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.11.1.bb => dnf_4.12.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.11.1.bb b/meta/recipes-devtools/dnf/dnf_4.12.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.11.1.bb
rename to meta/recipes-devtools/dnf/dnf_4.12.0.bb
index 00eed0ce96..d621e72d4e 100644
--- a/meta/recipes-devtools/dnf/dnf_4.11.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.12.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "fba1e2ec93f3d045a874567fd7ecafd606346509"
+SRCREV = "956b5c74bab2affde27f404e7aee98c10818b188"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


