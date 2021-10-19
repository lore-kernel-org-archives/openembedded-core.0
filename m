Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5429AC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.11533.1634657701254874658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lOEfY5eX;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id g2so12487523wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Add8KzA5F5FvEGXhOop411H7ERYYDo6MgrpHiC35z0Y=;
        b=lOEfY5eXskrzyJ6UlezFkP5b7hkP/3jYFqHQZrhXldIOoKhaQfBRkS29jTUWFm4Blz
         eIByRU+mk1kl0S25WhV3dh5j5tH95p+ANmvTN0snvx/2mAjeCgz6pviktwA9MduQbmET
         WA3srtJLbe+9LYrGwAhIiaoLfHiJZkxIftTB3Wwj5czzRWl5JK4QReUNhxdOlfL4Upej
         VokRCdoJmWZeMoAvoGgc/kDJ3td7Qb2Wubf6BLKrtnRScB/1S1RmxFguYMKrqJXs0hYv
         ZNRqgpAjWYS/a+kI7BNHkaTSH9L39cDq+35jdXbFrq/HgC8/9JjpK9YyOYQ4i1c+0Jm0
         nALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Add8KzA5F5FvEGXhOop411H7ERYYDo6MgrpHiC35z0Y=;
        b=gw9HNxrUFVtWxRGJEWUOqzkC3kOVOXvQwqgsNPqZEGmvY3aoUd3NqLpY2+MQ16tuCU
         HXsY3D46tZnjGQ0bUlwhVVb3dacuwLIdF5iNr1ybrU0iJBzYsXo+fXNRPZkaUxdrmy7G
         /sp9JyOVDwxPS4WOIZtr6DAsWr7B6HRNSdNV/z37etyf+xfGsznhxxti3zdM4lwMdRQf
         VPzTn8Me77V8OxLaX5/WbMl2TnNopJIQ9f87lv7d7iMcMgeMM63J+amq0blOobSmqFC2
         1vV0ThyIMvbEYH3/Sp0OAuNKiRE1LiMM7/d31SXDgsx3aTSPLurjGiLRR4S6xXqx3JGt
         tryg==
X-Gm-Message-State: AOAM531lxBBxEUriMMM8Pqz9RF/qk2HLj98h4YOJoDmmwUin9v8DHd1+
	ppTIAGTr14GJfcsxxEnsnBU7kntGqQA=
X-Google-Smtp-Source: 
 ABdhPJym6tH4+cASdYPwlJTBSiCNkpGaBTCJog8MwGjvqHryXxHCdoKsQMx7ZZuU6ZBFKDA339MOdg==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr6883412wmj.44.1634657699725;
        Tue, 19 Oct 2021 08:34:59 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 49/65] pango: upgrade 1.48.9 -> 1.48.10
Date: Tue, 19 Oct 2021 17:34:03 +0200
Message-Id: <20211019153419.3319802-49-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157168

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../pango/{pango_1.48.9.bb => pango_1.48.10.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.9.bb => pango_1.48.10.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.48.9.bb b/meta/recipes-graphics/pango/pango_1.48.10.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.9.bb
rename to meta/recipes-graphics/pango/pango_1.48.10.bb
index 54e169768c..40df7042e6 100644
--- a/meta/recipes-graphics/pango/pango_1.48.9.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.10.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "a913657d3fe5aa04c03958a3b5d3fc859e891b75cd81b873a819330f6c0872aa"
+SRC_URI[archive.sha256sum] = "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.20.1


