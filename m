Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5963CC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.9427.1633945279066551433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ctWH2o9p;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id t2so54133161wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+uiZbehFZ98jWzgnJaVzw9PXPmoU2INFXEiUy9BlEGY=;
        b=ctWH2o9pWucRuBr5famoZPHb3alK1Wu7BX/UB5uYNx0N6k/P/nkCcNQn9lmDcIOAdp
         l+APAy28q1aOjqNUbolAmXODcKnh4zqpL03jjTsw55DNavDYT/9EdGT5kInLjKrCc0vf
         rqEBq+eFuNSiA8LgkCisVlf1xEb1HIr66/ThOsP7AHdPOOtR63B3P0uFlOu5kNx3bAMY
         hUFYRtm5eUzLF5cdYTwLH1sMlzlhyx/62Iql+VykHx0Xx+zObBXm5d1VLaHKFy/QTdEA
         a1Pzg/rxlYs01RKzOvxCTe5IbH0WuHgMytHP8V13dMY5g/ZFFzwKxuQeeiUurhh9j3fg
         wLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+uiZbehFZ98jWzgnJaVzw9PXPmoU2INFXEiUy9BlEGY=;
        b=xyxEjIXl0fDFJflzIU51NfswAHtUXQbOwa6GKfliz5x6ZnG+IAJXGOn8QoDHjcDaP3
         CKjyKzt06tb3QyRL+d+4xjV24jtW1zZyTrkv5s4P06w7gKEguEm7lg3Somyy8I04dFHs
         OfT7Qs9odDRrzpWxUMH17uSLcmxg7ORqr+kVq9lcVFpTaXpbCGZ5njaalY1yYnaBP1oY
         /XCmXCF0jaQnVkpQLumgatzOy8C4KD5wEo4W1Z9EfkyQh93+eZe37GzD+Qb1JbXJjVl4
         BJpO58L9GmAj5NNGhx+eJwTFGDmHbyD+6VV5vkscCFEaM6SgGfdiA40opL/LN+QzXQ1R
         PrgA==
X-Gm-Message-State: AOAM5313BUxao2uqpUj21RaLYBxpZOHmjg2aOPh6MYkZqadg1o8lJO73
	iZ1Zj43FVLrmMLJQJ0t73J0jWS4+Aio=
X-Google-Smtp-Source: 
 ABdhPJxZP7OyRUhaxhDPFyC3RtUGTETB9l4o5ChLg/10zoXsQIST9nvKFRyqzx6mXFALsMuZiWin9g==
X-Received: by 2002:a05:600c:4fcc:: with SMTP id
 o12mr4308265wmq.110.1633945277575;
        Mon, 11 Oct 2021 02:41:17 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/25] webkitgtk: trim down DEPENDS
Date: Mon, 11 Oct 2021 11:40:56 +0200
Message-Id: <20211011094059.4184654-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156835

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.32.3.bb | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
index 1f3f7a9c00a..db2357002c8 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
@@ -30,12 +30,20 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libgcrypt \
-           gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
-	   pango icu bison-native gawk intltool-native libwebp \
-	   atk udev harfbuzz jpeg libpng librsvg libtheora libvorbis \
-	   ruby-native libnotify gstreamer1.0-plugins-bad \
-	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
+DEPENDS = " \
+          ruby-native \
+          cairo \
+          harfbuzz \
+          jpeg \
+          atk \
+          libwebp \
+          gtk+3 \
+          libsoup-2.4 \
+          libxslt \
+          libtasn1 \
+          libnotify \
+          gstreamer1.0 \
+          gstreamer1.0-plugins-base \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
-- 
2.20.1


