Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF914C4167E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.4298.1667832957086602835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VSvWc9h0;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id bs21so16622275wrb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyVxmvGbYBV5rW0pb4e2uEmKmWX0LZqIRSJelz9ruFU=;
        b=VSvWc9h0uepN+MDgWnXW2dyc5YYasZ+yJU1uAWY9AWETCJa7sONF0ZK0/o6Gd1Setp
         FGIAlA8adYltNLxPednA85O30TkKB+kVeiJq1xVqpG/r0EGrX17zXTQcusqh7jCKLsRH
         jlDlBYl1ZeebLnORisowu0sC6ozmXmnno9OGPksI5zfq41za2f94wgiXdSeJhmW/5Ba7
         MNxRJ/ahEFvzs8+nCYMTZdw+WXM/DFSVjnZnhwG+dPFwcw8ycrbC/U4Zyq0cyBd4e6XU
         oYpSjtB9pxj7m4tq/EK+BdJCSC0yAP75155TCeTYh8PRqPSV5e2J3w0j4E7LSsLLTmD5
         pFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyVxmvGbYBV5rW0pb4e2uEmKmWX0LZqIRSJelz9ruFU=;
        b=G4ecJXjYyCDGKj68R8+iTgTPZrIXxHWLzqIyMfax7n6Cz94nwFOiVi+fBd3h7J4yvj
         Dmho3auXJWjz2jGz+F7A4sFN9Ke7isRHy2/RueB/PBg37r1xz4HPuW3vzV/g07FWakee
         /PV73fa3v1NycWcCZkEUwpbcA34mHYqJH2nWshsxjnKmH6ncUKgFuqrXcqMVttluVFFy
         tZrPaBsnNiGQmy1iUUhQ8nUcSDQmJc7IsBVNKTRUATbQniX84jIZ2R0XJ1qudWePYyQV
         2OsYkGH2n3LVxeq27g6e6BurSBRMoTqVYLAreFigPSeXitzPx+31z9tY7WTvpvok3qxy
         gaoA==
X-Gm-Message-State: ACrzQf0O8Nv395Vc7bPOZj1Xa/A6Ech4NlX1G8SZJi63XY3BkViaiXWt
	mM+kFW1ITRxFzaW9EfOWSbOvwmdwNlE=
X-Google-Smtp-Source: AMsMyM6UxNS+4p/ft6Ywz/VHYVEMA/9/fvCVtEI3tn18SehqZ6DNzH79oXoM0/wGLlo49SGVctQezg==
X-Received: by 2002:a5d:5c0f:0:b0:236:c429:361a with SMTP id cc15-20020a5d5c0f000000b00236c429361amr28304689wrb.475.1667832955604;
        Mon, 07 Nov 2022 06:55:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/48] pango: upgrade 1.50.10 -> 1.50.11
Date: Mon,  7 Nov 2022 15:54:59 +0100
Message-Id: <20221107145508.1051404-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172889

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../pango/{pango_1.50.10.bb => pango_1.50.11.bb}          | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.10.bb => pango_1.50.11.bb} (84%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.10.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
similarity index 84%
rename from meta/recipes-graphics/pango/pango_1.50.10.bb
rename to meta/recipes-graphics/pango/pango_1.50.11.bb
index 95209889a8..f545689811 100644
--- a/meta/recipes-graphics/pango/pango_1.50.10.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Skip-running-test-layout-test.patch \
 "
 
-SRC_URI[archive.sha256sum] = "7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccdf1de43e4437332eabed64966"
+SRC_URI[archive.sha256sum] = "8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
@@ -41,6 +41,12 @@ do_configure:prepend() {
     chmod +x ${S}/tests/*.py
 }
 
+# https://gitlab.gnome.org/GNOME/pango/-/issues/713
+do_install:append() {
+    mkdir -p ${D}/${libexecdir}/installed-tests/pango/nofonts/
+    install ${S}/tests/nofonts/fonts.conf ${D}/${libexecdir}/installed-tests/pango/nofonts/
+}
+
 LEAD_SONAME = "libpango-1.0*"
 
 FILES:${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
-- 
2.30.2


