Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229BBC74A5B
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.16125.1678375211185558952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G7vJPbGw;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id e13so2226134wro.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcy4tVVdvQFbQTXQcWZgVkSYw055hrUyA96XZRWVcBA=;
        b=G7vJPbGwhWLR60zvt0IykZizrrXEH2Mez5o70o/Ap6oMunitYL8ZciwBwMY/cLNtLL
         Ujes/EK1D0i3aB4PM/PoDwHalOxaKpZ9P44Ek8LVPh3og2G5hMUOpGHp9F1I187hK7xz
         FsGiu39QIj+5nWY7XfbGdASNxKCsSdH64PIr7agDKp1Rs93U0896aVYEG1wVrp5244bD
         g8bET/ezJH3fxnB84+5eW3IQiuOCchHbqS6assdu9s4dpOHKflEFRlhKgNnyebP2y7v9
         3jV+/y3FJaZlChz6rzPkXDp9avXfZVTPuoW9n4NH/jGAG/hFYEXrutHI/zwtvnpzvxs/
         uoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcy4tVVdvQFbQTXQcWZgVkSYw055hrUyA96XZRWVcBA=;
        b=geYqfCwqA/zT2egBexCwwJDJiOwhZLWvq8r2d0SiLBYeUvatPO3YyoBNe5hq56ZQQK
         IQTYR6cWN/fy8Cuz1/fh8vPCgwZYylezM0v2qM9qNJ0ly7NQzlTnTGFXt2YzB6Ow2Lpy
         htuWVf+WuPZc9jSh3Vcx7/fpSbYBrKZD7kbohS5XdRrTAlphCD5R0tI0F6XgaBiS2ZNE
         9I5WE6WehqHIvsO8+rbrkTsTY2OX/JxQkVy4h2yRdEIflQDOYWeA9wMMqxihCKkHwm9n
         ZFQFpWNoqkKh5MEhHAHyCspFeOmXLdleV3JNh2kA9pVXOFXibQNQPJC44kXk6fM+8efH
         kGJA==
X-Gm-Message-State: AO0yUKXc0b5ImM70PTeOKReES97CveUkgB/D0FhrzIAVAans64CZpNau
	Bjkn70t0h751PAXoAARMdsdWmx0QjG8=
X-Google-Smtp-Source: AK7set8v5uM7D/lrtzoE10Afse/a4a7B7ilEfVY3VBUc3zAWRjpXXV/7peVVTYCvWntGmh3LxV0r5Q==
X-Received: by 2002:adf:f587:0:b0:2c7:deb:c61 with SMTP id f7-20020adff587000000b002c70deb0c61mr16103581wro.39.1678375217350;
        Thu, 09 Mar 2023 07:20:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/26] piglit: upgrade to latest revision
Date: Thu,  9 Mar 2023 16:19:57 +0100
Message-Id: <20230309151958.3619193-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178248

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index edbca69413..c5537154ae 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "590d81bb5fa219353104980108e9f1aa2b1d1b6b"
+SRCREV = "0f4a875b05feb44426a2d43146f5e3c6ea5f8038"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


