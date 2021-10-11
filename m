Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59667C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.9541.1633945279744411668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bryhBmij;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id e12so54130458wra.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sIK3mUYu/qkzD5kMytFboyp5WtVrf2NVlEwC4+QARGo=;
        b=bryhBmijRMmsvw5IAcL+RCipFzS0KarjMygBzCc+r+6LtlkOm3OP94J23oXDwbCkv+
         UxXNIlFiBDYg10rHZYaNKJ7yn8610ankfrvC/0W8e5Q9pjlNDd55Q3JHXnwzryM70VM6
         8gLT33Lmp3dUe+hZ4n3ISTZYgv+LoCzvFrWLZBEfeNnKXbPoFgXbvX8mRftoFEWBgl6s
         9jtw0OZlAcrJ1lc0XeAgPa8avDQt5oXTAur6lqf6LG13jUeWcfxKhaBOwV7ZWng1IYI1
         QEZEh1sUS7TNpU6oqJTXDshn5L/dBj85+NShZM8v4Lh3/eBnZZD2VZNoHjhU/j1+QHCd
         2B0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sIK3mUYu/qkzD5kMytFboyp5WtVrf2NVlEwC4+QARGo=;
        b=KNwj03nYdzZTUEKg+nRq8U9iAGcvg4vqtX0/Vuf6jvaGn5FPU4jkVfhzBLHIIS4+mm
         6tQIzOHiU5fQhQwWekY+heZJJypLQ7FWHaWVYNFmxaqZpR1SxERUCEx4K1NsDzb7jqbI
         gsBvbiqPpzg6fKyXUqN4gRA4vp6DZWZ5rg/vDABQmVHaSOcKsECTefjHOrIdLtvZ41Pu
         E5EoJkN0vI0s1VQN0tmDxtZUU7ZJ780AM8s0Xq3U34QIDSojPraU2VyOCN2k/TntkQHj
         QfrlxnH2p3W2Sw/PXyTXc7kKoKNDp3JmOJ2DBn2vBBWfPgzxBJdgDniVY55ozdcQUvO/
         jz2w==
X-Gm-Message-State: AOAM5317toBW6MQcsO8TEub+A8IwyTzLzD1yIyvbw/ru/oABzkvr9Oml
	9E5RPJXc/suJsOROKue3UbIB6hfrn2c=
X-Google-Smtp-Source: 
 ABdhPJz+OroKkZxgxzYD/ySlFQvEJJFDZe7Wh1rq5t6DID/K45dnU28Rl4wnFC4yxyoBzBJ9apz8PQ==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr6810103wrs.370.1633945278182;
        Mon, 11 Oct 2021 02:41:18 -0700 (PDT)
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
Subject: [PATCH 23/25] epiphany: trim down DEPENDS
Date: Mon, 11 Oct 2021 11:40:57 +0200
Message-Id: <20211011094059.4184654-23-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/156836

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/epiphany/epiphany_40.3.bb | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_40.3.bb b/meta/recipes-gnome/epiphany/epiphany_40.3.bb
index c5dc0baefac..e74b75c802a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_40.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_40.3.bb
@@ -6,10 +6,18 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/epiphany"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr gnutls \
-	   gsettings-desktop-schemas libxml2-native \
-	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal \
-	   libarchive"
+DEPENDS = " \
+          webkitgtk \
+          gcr \
+          gsettings-desktop-schemas \
+          nettle \
+          json-glib \
+          libarchive \
+          libdazzle \
+          libhandy \
+          libportal \
+          glib-2.0-native \
+          "
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings features_check gettext mime-xdg
-- 
2.20.1


