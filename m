Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F97EE14B9
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:57:02 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.4119.1694019412514265703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=G4Fo6wmo;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so1365281fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019410; x=1694624210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7S6YnXiFLREBBCuCCz30lPbY2Xq1AJy8Jzad59s+BA=;
        b=G4Fo6wmow92uzkx8R8qc0MDbGVLoJso5PTTTo66zSrPDkPkHkJ/x2C1tTmq81iq2uM
         Ar8XMmzlU8vyITXGYRRa+53zPV2oguTZsH77z95NuJ1kG3pDd8jpOV/olm4pvO8QKHf8
         QoID6GSuOIwp3OZgZMC/ILmxYzIE0x2RgBZlWM54H1OceSzMCpd5+HzFTicQ/HH3AQKs
         MDW7hsEI5ZE8WxFtWT4rib0N+vRKZIh2+PykdQJiep7u5poRK4qHLgi6WTQ7H7ZF8Xxt
         LpYsvEi3q5f1hJVtIdjdmKRxJ7EFNDxVCg5AGhlyu3BAFeLuP0kGoKjJBF9YfXkGd8rk
         Ohbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019410; x=1694624210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7S6YnXiFLREBBCuCCz30lPbY2Xq1AJy8Jzad59s+BA=;
        b=IMeHj3yHyzMyfnrxJLiK4KPT2CT4roCvdXv2TUsbOw1JLACHGcz6ZMhWeZMq0cR/CQ
         oFGnWd4IdLD6LNgiT6mQVGbwNS2m6FPMs1fuRktGu50AiFdcFFnuB8f5MiGLfDDhqk6L
         WN6MzyyZU6CpN6Wkwn4jSlcZCix90iNtPu1NU390djFYJShnQaJfTK7EFaWgQWpur9iv
         2KwugrahMMByG5a0fZbjWZnUvWU+7xxOiym08Z2HhzwC974TYz/GiWr5e8oIspKRjvJ1
         tcIn2YFqP4zZV01ckp9T/pggRbVf5GYxar7D5TnYmlBdVErVLcSS4oCM37BHBihNhkcb
         th2g==
X-Gm-Message-State: AOJu0Yxi17TxNu3Vz+HY11CtRy61e9YNQ568gZ1KMxgeeICBOglH+mqA
	UhD6A56B1QK336x4F1xyWbFLR3WO4Vg=
X-Google-Smtp-Source: AGHT+IHEpYV8wVZigKRgxdYWzIVBG0cY8nGldclqNInRfJdqI8dgP1cILMCK9wpk3cSJQr/yLb7LOQ==
X-Received: by 2002:a2e:b6ce:0:b0:2bc:bcc6:d4ad with SMTP id m14-20020a2eb6ce000000b002bcbcc6d4admr2922622ljo.21.1694019410418;
        Wed, 06 Sep 2023 09:56:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/17] useradd.bbclass: list all needed items for package_setscene task
Date: Wed,  6 Sep 2023 18:56:31 +0200
Message-Id: <20230906165633.2382629-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187337

Latest shadow-native links with additional libraries;
I was unable to find a way to resolve those in setscene context
where tasks do not contain such dependencies.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/useradd.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4d3bd9a5f56..a35785c9c23 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -179,7 +179,13 @@ SSTATEPREINSTFUNCS:append:class-target = " useradd_sysroot_sstate"
 
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
 do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
-USERADDSETSCENEDEPS:class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS:class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene \
+                                    pseudo-native:do_populate_sysroot_setscene \
+                                    shadow-native:do_populate_sysroot_setscene \
+                                    attr-native:do_populate_sysroot_setscene \
+                                    libbsd-native:do_populate_sysroot_setscene \
+                                    libmd-native:do_populate_sysroot_setscene \
+                                    ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
 USERADDSETSCENEDEPS = ""
 
 # Recipe parse-time sanity checks
-- 
2.30.2


