Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086F8C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 20:44:36 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web12.17193.1639082675508211654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 12:44:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O8YxSJi8;
 spf=pass (domain: gmail.com, ip: 209.85.210.51,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so7485168otu.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 12:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SwJQyEeBKZmC7meU3jU6rQLOe8yyP/GMlySVUBvxN4Q=;
        b=O8YxSJi8C8djzZDtKTJowo//SHUWqoIt+W+7YT8p5l/IVxwWYX4TKP4ZIC/sFCfWBK
         9Y51VSP/DYBgne1TdRTC/FPQzSc6+Q1jRx9rPc/N3pA/anQjMriE7aNGAKHdV9dqW4fk
         j/ZDtnfVc8S9RX6aEWlR8IncGKQ9UjMK2F6h9xdUBoBo6n5KqHtxGs/epA8ygQgF0Nh2
         pKu6YQtF/Fs74KASQ3Vo+ZEdBKen8Vgwvg6o7LrHrJ9x96txbLEX3uSpOFUshq3XMKt8
         lkqdilAogLbxoc8EuYU3ogokl63hh6jsdbhMn/DOdJv3fxynbUnNzoad5Dj5T6ZV0VrW
         TRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SwJQyEeBKZmC7meU3jU6rQLOe8yyP/GMlySVUBvxN4Q=;
        b=To4LZbsTXhz44ys+8WKIYvKXcLqi8gz3u64HDnK6fsU3ZvOWy5lRktwcGuodr5XxZ3
         NHPAMbLEfzh9LOc3BDV+/bSJzbP3FQ2ThJ7fJHHJ2SxddAvZmMev8IGoSj41UhYanBcg
         iNLdMtE0KgCuA4CB0uAsAJHOdAYxt0ej92X0WNxtJTPf4LvaBgEX6d2Sz6jUt3i8iITJ
         B5MoTAQcFFM3EjvTVP6I11G9IXI1Q/RekvajoD4VEgw8pdLDcsGwSjoE0VulLouvGPNa
         sJ/QQAMfywty72X/pE4Tt/fYx4Jf/tb2+ZisYK6tHuVd4NaB0lLWoEn4H79UyaokjMOB
         OgUw==
X-Gm-Message-State: AOAM532wY5Rset0T4QiwnirBur8A5UUW6DG1c6UmB2FM2ZUgone/OEKN
	0bF6QfD9gstyjEemQYtuJfg4MWvCr2k=
X-Google-Smtp-Source: 
 ABdhPJxzTtGw0sDwznNnsLv5k/Ii32205hLyXEigRpSoSTY+/11zQR4uRGh2S/tCN9YX3hTUuttyAA==
X-Received: by 2002:a9d:5c04:: with SMTP id o4mr7736585otk.339.1639082674640;
        Thu, 09 Dec 2021 12:44:34 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 k24sm155785otl.31.2021.12.09.12.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 12:44:34 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] epiphany: Add packageconfig for libsoup2
Date: Thu,  9 Dec 2021 14:44:32 -0600
Message-Id: <20211209204432.3924129-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 20:44:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159478

Adds a PACKAGECONFIG option to use libsoup2 instead of libsoup3.
Including libsoup2 and libsoup3 in the same process can cause strange
runtime failures, and the latest release of each major version will
cause the process to exit if either if both are detected on process
startup.

The default is changed from libsoup3 back to libsoup2 to follow
webkitgtk.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-gnome/epiphany/epiphany_41.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
index 09210b68aa..bc13f10b35 100644
--- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
@@ -17,6 +17,7 @@ DEPENDS = " \
           libhandy \
           libportal \
           glib-2.0-native \
+          ${@bb.utils.contains("PACKAGECONFIG", "soup2", "libsoup-2.4", "libsoup", d)} \
           "
 
 GNOMEBASEBUILDCLASS = "meson"
@@ -30,10 +31,11 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            "
 SRC_URI[archive.sha256sum] = "b39d1825492595b0b74c5d6a6686a857f9419dfa4c02f8013c297bc870e26dd0"
 
-EXTRA_OEMESON += "-Dsoup2=disabled"
+PACKAGECONFIG ??= "soup2"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
+PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,,"
 
 FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.33.0


