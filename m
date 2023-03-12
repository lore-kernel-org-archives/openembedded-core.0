Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD19C7618D
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:51:03 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.67840.1678632660722832281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L089oOzz;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id cn21so8835657edb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678632659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2JulSsT0PkuDB3bP33TEJAHOSVx6nPyWIVUQptsZ5U=;
        b=L089oOzzLbI7+AdYi+EnvfrtR0v0PsivLtKlHi50QAaSgEqc9jQXQKyqVcwvj5nSsu
         sk7LNP9nl/ao86TyTQ+xsfA+II1hiR1r9oRFUVNSe7Jkjb9Rc5/A+xjmntNH0ZokfHTE
         Z/0P5upZhfa8toTdiKDBnJyvXUt5EaL3xgFqMfJb7ac7q1IQyCs5LI1KbOtZw0oVO2Rp
         /3RZs7yuScFHKTQhuNya18QWOqQuNgWNvha9Rd11lOkmsfxeGQLsG8ANQoyPwM/im4Yv
         r5dPGxkBqkHy67V6nHQdzeg0W5T+4H2dmpZpeVo1fP4um9lMAQ1KXT0Kh2b+6KRHGMjg
         pjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678632659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2JulSsT0PkuDB3bP33TEJAHOSVx6nPyWIVUQptsZ5U=;
        b=b4XU3VYtJD7qVHqeZVb5ODxgUCdWLUi65F/xGABuSZIjwPSbgN/fcdZ4gdcQeYbJZx
         b/AyVo0hj6TNe0DutT2m/rijXCe8tYq7Jg1gCgcxDKy8VCti1CHamjFKU6MjOcGMUcKZ
         5C72bbHvGQlh/n9qhXyu+OrF8TqQPPtJOjAhg+u8ORglPcLd8rdzpQ7SrL6zsk/oO/99
         fGo09elAJnJNVcwDx8ED8QK7UHz5vuhfK3PpBbDsrEs0rGOj96euc594XWfsoXBRdpCP
         6A5CAcVL+GRXD8Nbr3beWwK4pjFhgnGHVyweCV/qHXfYy29HpKuF3Awb2rZ40ZG/6eOq
         Bfdw==
X-Gm-Message-State: AO0yUKUeL/Day9ZcgwM2QMO3uR6g5+yXw7DfcwBgrU9hAUILHYKUVlx5
	iQS9JBq5XlINZMCC8mlo0RyBG+2pgnI=
X-Google-Smtp-Source: AK7set/+2GF54akPo1JuehIjPqSMx+A9npuUDofXOaFGDDgjow+j7jL7CJlG69Y1ojyVndwtjJ73qQ==
X-Received: by 2002:a05:6402:502:b0:4fb:78a0:eabe with SMTP id m2-20020a056402050200b004fb78a0eabemr2540081edv.14.1678632659085;
        Sun, 12 Mar 2023 07:50:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004fa19f5ba99sm2012255edj.79.2023.03.12.07.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:50:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/7] mesa: allow mesa-native/nativesdk only subject to opengl/vulkan DISTRO_FEATURE
Date: Sun, 12 Mar 2023 15:50:49 +0100
Message-Id: <20230312145053.1427377-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230312145053.1427377-1-alex@linutronix.de>
References: <20230312145053.1427377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178394

This prevents accidental builds of it when native/nativesdk opengl
is not actually enabled (which may cause undesirable lengthening
of dependency chains or build failures because those dependencies
don't enable options required for mesa).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c0b8f65625..775aab9297 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -51,7 +51,7 @@ inherit meson pkgconfig python3native gettext features_check
 
 BBCLASSEXTEND = "native nativesdk"
 
-ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
+ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-- 
2.30.2


