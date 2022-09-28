Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C933EC04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 12:10:48 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.7001.1664367046327967887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 05:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=KrGX2y22;
 spf=pass (domain: qtec.com, ip: 209.85.218.48, mailfrom: daniel@qtec.com)
Received: by mail-ej1-f48.google.com with SMTP id sd10so26734853ejc.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 05:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ZeMJItz3mL8euSrrgzAU4/h2wNvmQal+3MDyGcJJoYc=;
        b=KrGX2y22eM1lVWrbql87F7huDh774fj0zX7syfIVbcE+ZFWoQ9za04c5rEg+jpqiaF
         XNq4C3lbYe8i/FmqV2DRNE/swR01arPN25tAXKCZAFeJHdD4d7BsqBNw/qFF1OwUjNwf
         k/rgyxk1IlpgxQdkhd4IqJaNUBaz6Rs6xm0a3sWQ39xXZdam05ifeu4Rfmn707EImXzD
         RpDdRfH2hzUP7+37KnJoQYuwFiLkgdIuwN4gz2sNvK/oUpCRrFf/m8Qcy7uWbsqwIG9p
         1Y9Oj3GsLvv3B1l7JNjBWA36kL1S2RVMJJS/aiE/qo4QPjoK8IBz6qICz5KlJvOHpqiQ
         Iecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ZeMJItz3mL8euSrrgzAU4/h2wNvmQal+3MDyGcJJoYc=;
        b=b8YkWkM65GySlwfu6jPFDzzZXfqvyQumkuaEM9OBYiwnOGUz7mccxnIOAWlvzFMoao
         +0QSfG6ybvab2GlRNeDesfGRG3lEzid/i52Kid6zsVOSodyxIFowmJT/sqyhyH8ewRo3
         ZTQHBojXDjZK6zP86Vb/UOH3hP5DRSWQISbXL321caHji/nXlIu7FTFFAILYecQnOkX7
         WGLCvDIoncIXCEMnln/32oFwBDxp+U9eAD60RiYlFYBkMtiwquP5Od+tM7G+zBb3NFHH
         hccsQ0dDBGFRTr1kYzvCFKlzmRGj8JnjhVzxZhic3jncCZSRRVlxb/xoyXmNIawrQdcl
         GxZw==
X-Gm-Message-State: ACrzQf3YCKt80DOHByVkHsB4z09edL4YWnVOOOIS0zgxaA9i84me6ETb
	zpy9oE3SCr+awelveLIErO0L9/01Cv0OKTUZKgbfEbxtBa6rjjYt+S+Fz57OxmDx+0Ief++CTxx
	MK78GAChKcuw+s4uHWX/5TB8GFvSPntwsnE/W/TyFMbhjjOEUGjWGfhJpig4HeqS/chfx6nIMOT
	butLGiG1z4k0b+
X-Google-Smtp-Source: 
 AMsMyM408ZX9YEdg3HJZpTHRkjgwmIYtX2ev2ow2HpDpr8ojG8HBAjos5/0yqF8VbQJUFfopMIM1jA==
X-Received: by 2002:a17:907:ea5:b0:782:4c82:d0a2 with SMTP id
 ho37-20020a1709070ea500b007824c82d0a2mr27571394ejc.171.1664367043994;
        Wed, 28 Sep 2022 05:10:43 -0700 (PDT)
Received: from datops.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net.
 [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 m17-20020a170906581100b0073a644ef803sm2324346ejq.101.2022.09.28.05.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 05:10:43 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] gtk-icon-cache: Fix GTKIC_CMD if-else condition
Date: Wed, 28 Sep 2022 14:10:41 +0200
Message-Id: <20220928121041.10149-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 12:10:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171148

GTKIC_CMD variable gets the wrong assignation leading into a post
install script error. Fix if-else condition in GTKIC_CMD variable
to assign gtk4-update-icon-cache when GTKIC_VERSION is 4 but
gtk-update-icon-cache when is 3.

Also, rename gtk-update-icon-cache-3.0.0 to gtk-update-icon-cache-3.0
to match the gtk-update-icon-cache binary name deployed in
meta/recipes-gnome/gtk+/gtk+3.inc.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta/classes-recipe/gtk-icon-cache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass b/meta/classes-recipe/gtk-icon-cache.bbclass
index 17c7eb7a33..9ecb49916c 100644
--- a/meta/classes-recipe/gtk-icon-cache.bbclass
+++ b/meta/classes-recipe/gtk-icon-cache.bbclass
@@ -9,7 +9,7 @@ FILES:${PN} += "${datadir}/icons/hicolor"
 GTKIC_VERSION ??= '3'

 GTKPN = "${@ 'gtk4' if d.getVar('GTKIC_VERSION') == '4' else 'gtk+3' }"
-GTKIC_CMD = "${@ 'gtk-update-icon-cache-3.0.0' if d.getVar('GTKIC_VERSION') == '4' else 'gtk4-update-icon-cache' }"
+GTKIC_CMD = "${@ 'gtk4-update-icon-cache' if d.getVar('GTKIC_VERSION') == '4' else 'gtk-update-icon-cache-3.0' }"

 #gtk+3/gtk4 require GTK3DISTROFEATURES, DEPENDS on it make all the
 #recipes inherit this class require GTK3DISTROFEATURES
--
2.35.1


