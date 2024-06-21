Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136B8C2D0CE
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:09 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.70017.1718966582602587535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HBwwX/MK;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f7b785a01so199242666b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966581; x=1719571381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+SFWFP0bs4k37NSJzArOsCmHYshl8faQMbXjRSd3J8=;
        b=HBwwX/MKSto9tuGqsKrZrTklz+VfHQI10gzHqy8Rdc9fn81VToqS49aoxnwDPTIP35
         0k0EyBuVwGDtpaxFp8YwlR/3S7iqGsEtbJ1n38mXe5Vyf9S/KqqW3Je+vHy3SkLte+Wd
         1usgNlEEvIxUH1aRTowshU0kA+/61xlWdxo3YllzNl0RBnfQQ9Rfes/AkH8hFRVUgJaZ
         dEvsafnZ8s17w5tnuMkX/poguS4KCrgjCZx3ICkwezs2uPnf2h/MtGJwj2JISIZMGd+i
         0RzXKMQGvPRVQ+/pt/Wl7daS8k1fsXbf2KhmeXv4PKqDTYr34WcY72Cq+1rd3mk6l/7D
         Nm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966581; x=1719571381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+SFWFP0bs4k37NSJzArOsCmHYshl8faQMbXjRSd3J8=;
        b=dg+YF1xhW1sVevS1/csjK1VxiUSaErsrshTgMofHhonU3AvZh4IjiyXZ0RF2a82Osv
         JZ7ZDp4itu+z5IbbMbAoH8iss02sTl/q6gzlctt1DwcZyEDlN8KDy8OqGmVovxBIRAg8
         B0BNdLQhrcy7qqiBOO/7qFjiWcmAoqapiFXe27GoEhSFeo8p86RlLIfn3GFk4DOVDQIZ
         DAOrPhy3fN4kjmTriMWbqhEnN+lgLJwCgTfwA/ih5LdQ+QNxytpHUJmc+DzCNbX8Vf9C
         /sYCo7WtV1yO03w/ZZO+69/y3xjdrNwGDG4qlzex+GUOrw4z8L1aDU04IlcRhbNxcU1G
         SzTQ==
X-Gm-Message-State: AOJu0Yw4faF8lRh1t9QFUbFhKVqxE8bWvBKo15CS0IHSWTNuTdATSswA
	2PzoOLWxZQ3sQL7lYL4Rt7No9aPR2mUlmP4TWHmj5XmHD6xzV1EfgBQ6yQ==
X-Google-Smtp-Source: AGHT+IHEH425iXoxZvd6mFkA8LhHkWa718C+LAYyt2R86wdL4HArvq8mRr4mDI6Z7KaC1pARwPtx/Q==
X-Received: by 2002:a17:906:ef8f:b0:a6f:523a:8e93 with SMTP id a640c23a62f3a-a6fab7cd45dmr387675166b.71.1718966580943;
        Fri, 21 Jun 2024 03:43:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:43:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/11] libva: rename libva-initial recipe on recipe version upgrades
Date: Fri, 21 Jun 2024 12:34:10 +0200
Message-Id: <20240621103414.2842509-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201012

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/libva/libva-initial_2.20.0.bb | 1 +
 meta/recipes-graphics/libva/libva_2.20.0.bb         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.20.0.bb b/meta/recipes-graphics/libva/libva-initial_2.20.0.bb
index 453096822fa..4533ed9eacb 100644
--- a/meta/recipes-graphics/libva/libva-initial_2.20.0.bb
+++ b/meta/recipes-graphics/libva/libva-initial_2.20.0.bb
@@ -6,3 +6,4 @@ do_install:append () {
 	rm -f ${D}${libdir}/*.so*
 }
 
+RECIPE_NO_UPDATE_REASON = "Upgrades are handled in base libva recipe"
diff --git a/meta/recipes-graphics/libva/libva_2.20.0.bb b/meta/recipes-graphics/libva/libva_2.20.0.bb
index 63dc5af8f29..172d8fec15d 100644
--- a/meta/recipes-graphics/libva/libva_2.20.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.20.0.bb
@@ -13,3 +13,6 @@ RDEPENDS:${PN}-glx =+ "${PN}-x11"
 FILES:${PN}-x11 =+ "${libdir}/libva-x11*${SOLIBS}"
 FILES:${PN}-glx =+ "${libdir}/libva-glx*${SOLIBS}"
 FILES:${PN}-wayland =+ "${libdir}/libva-wayland*${SOLIBS}"
+
+inherit recipe-upgrade-additional-rename
+RECIPE_UPGRADE_ADDITIONAL_RENAME = "libva-initial_{pv}.bb"
-- 
2.39.2


