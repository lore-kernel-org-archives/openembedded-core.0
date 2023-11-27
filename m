Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955E0C07E98
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.91947.1701080285198674559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JKS5wOw7;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a00cbb83c80so555000166b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080283; x=1701685083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKOEzLJoLtD573/RUjwMirBKxFVj9HGHTzNrBSduCqk=;
        b=JKS5wOw775YZuj1eWlU/xhNcdK3UutGN3+AV5WKPKpeC2i5DlbEZC89vwrrP33C8D9
         WCTlcdcW2LOukc5zogvo2bDk0u76xu/ySzGGwxmOk2s0R5Bx/kCiXjW7bJZu00J5uYIw
         AldFnj9WVKa/ndOs3RIVyu1XfBIZZq5IlPwOPlTSIZe86baVwxhMygwhqAdVde/9klyk
         AYlDWMdCyTEjWR6ZHxhHAzAu7kFV5qrudjcX9ioP5KMIfAFhwSHjhPzsW8JM8GpLWewP
         zzkzedh/ZeFduzTZlinKUcciaBC8cLPCdrp4Wlr2jaTnUDn7j5fT1QpcBDDdWm5NLYwM
         ekNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080283; x=1701685083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKOEzLJoLtD573/RUjwMirBKxFVj9HGHTzNrBSduCqk=;
        b=F+CUISSM7CYAchgHLrhtOR4RpR5gnIgPbrxUGN6G4eHl3iAMMWeUptB3jj9yd1wr1s
         hZf344F854+2WakrhYdWlhIOxQ4mA/sjlJF2QX68whTbgogRTiKeqYgLRfXOdaJ931VG
         X3NW4+lUvQ38Gj0GHvCvDwEyeGPKxrCXpmr67iIVOaz/YTphDsJdXWBArdixbAIgXoHg
         qapgzwUxUE69AaNeidC1V0YR7Fyad9kfyW86SDG5zBaq8FBClcfONKMqnK5UKDHuanSt
         R7xjvCikpGS+rK5yWt6a9C4L9/yUaAQd1rciHbbyOa3zbb8cbKzt3YkGeP94+2j0SYs8
         LV2Q==
X-Gm-Message-State: AOJu0YzewDR6j3UUR3FxH3o919q/mj3q9mnQq/ArhmSfF8UWuw/LFQcL
	fW3njV+vkmuf5wU4XC/kbfgYqQfzolc=
X-Google-Smtp-Source: AGHT+IFRXwaM/crBRSbHTs3Y5V74YXUvvOoljqliPTFJyW4jj3WNolpunpekG04ouhsGvujYmX78+w==
X-Received: by 2002:a17:906:51d2:b0:a0e:313a:ebf9 with SMTP id v18-20020a17090651d200b00a0e313aebf9mr2694116ejk.66.1701080283404;
        Mon, 27 Nov 2023 02:18:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/19] desktop-file-utils: upgrade 0.26 -> 0.27
Date: Mon, 27 Nov 2023 11:17:39 +0100
Message-Id: <20231127101751.3187950-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191274

Convert to meson.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ktop-file-utils_0.26.bb => desktop-file-utils_0.27.bb} | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.26.bb => desktop-file-utils_0.27.bb} (76%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
similarity index 76%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
index f6d1146e892..55c88afcc9c 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
@@ -8,18 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "29739e005f5887cf41639b8450f3c23f"
-SRC_URI[sha256sum] = "b26dbde79ea72c8c84fb7f9d870ffd857381d049a86d25e0038c4cef4c747309"
+SRC_URI[sha256sum] = "a0817df39ce385b6621880407c56f1f298168c040c2032cedf88d5b76affe836"
 
 DEPENDS = "glib-2.0"
 
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "ac_cv_prog_EMACS=no"
+inherit meson pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
 
 do_install:append() {
         rm -rf ${D}${datadir}/emacs
 }
-
-- 
2.39.2


