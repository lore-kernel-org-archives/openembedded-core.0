Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59619C76195
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.16131.1678375216219097959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f5D0ljOD;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id f11so2225118wrv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLZSZj/fyMOV7q4ezNW7X7/GdLXLpqGvOC2BXTn99Ms=;
        b=f5D0ljODc5aEUpKF+6id+0BJCJuhEGlDuEaCotJTDmx9FnB28W4pGK5SwbDbvMZZZM
         1sboSajlALZX0/b1zM2MhwNhOvNCgLwk0zYeSMwE+ACuZDJMfN1Dy8j6nMIbAyOL/Dns
         fAwHql49dvKYCRhDlHVK/GyyCtSgcyOsm25dkTdNIIcKrGoUz0lldt96kLsjJJ+jpNO+
         xpl9n0uk9nQgfBrKuKZ4IU4tNkME/3jWpBeUR/hKHhca20wSwAWvuXHIzaOUORv/jlAn
         cIW4+Ks8QCGfznucCEiY8DJww+m8nAeHFTPDyP7au3gABX55iJFm9p/NgQFsNbxzjgn2
         rP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLZSZj/fyMOV7q4ezNW7X7/GdLXLpqGvOC2BXTn99Ms=;
        b=WsPZYwedZw/CRXLAsOed19TV2f+OYWgD5fGmjNQcG25bDVFpWN0P9fC1QfudiI7bUI
         iVKbq0G3sFLHHAA2W9zC0kfF03qEwe2ZB2Kh7bkF9r7B63pIOBsBUmEfVwqlyKKCBIXg
         +hE9m/nu6zhg8oTIhVXXL9ozfNJEJYzK/BV/Uz/81om5BSHTWgeByEhZVrZhM1oE02zd
         6zhpNx/T+tGbacNM0Qm7+pohHLqm12Ey7zXkrMbIpUStFGNZzGdvtlv7Tv0xaNjqVSFV
         aSrHIwmec3137o9Mitpy89pEwVUqQZGv+bJugWl6JF2nFZFlJINZ4cZrFIqbBOTWZTwF
         qcJQ==
X-Gm-Message-State: AO0yUKXP0Lvu8QUh401tmUGWxs0JFS43VqqRHBViWeb8Z3pecsj1k/LW
	rtOnkkAcdZt8Tbi7HdcCs8WLeHeOpGo=
X-Google-Smtp-Source: AK7set/WGOq+JQfIl96IzZnLfDIUhihAhw/nKiOqYddnFsf3/P1ZaSQnXyk2HdbKTutNW57ulxZe4w==
X-Received: by 2002:adf:e30f:0:b0:2c8:309d:77b0 with SMTP id b15-20020adfe30f000000b002c8309d77b0mr14678106wrj.0.1678375214793;
        Thu, 09 Mar 2023 07:20:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/26] libnotify: upgrade 0.8.1 -> 0.8.2
Date: Thu,  9 Mar 2023 16:19:52 +0100
Message-Id: <20230309151958.3619193-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178245

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libnotify/{libnotify_0.8.1.bb => libnotify_0.8.2.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.1.bb => libnotify_0.8.2.bb} (87%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
similarity index 87%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.1.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
index 3bdc70d224..bbfc217df1 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
@@ -15,14 +15,13 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gtk+3"
 
 GNOMEBASEBUILDCLASS = "meson"
-GTKDOC_MESON_OPTION = "gtk_doc"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
-inherit gnomebase gtk-doc features_check gobject-introspection
+inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "d033e6d4d6ccbf46a436c31628a4b661b36dca1f5d4174fe0173e274f4e62557"
+SRC_URI[archive.sha256sum] = "c5f4ed3d1f86e5b118c76415aacb861873ed3e6f0c6b3181b828cf584fc5c616"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.30.2


