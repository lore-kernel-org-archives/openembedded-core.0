Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8E6C3DA79
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.208341.1672329684574722833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o7Mi//Ph;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso11548041wmb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2qnjSxUYuEXg0dw78Bycu38ZOzjD1Ty8SMepQD8PUQ=;
        b=o7Mi//PhpMJH1JDq989G7H6Egh987WY8BqqpnAg0ZoJiBEUSbitHHlmNyzpnEFT2tq
         wTQgz2M6O+wCJ4ITWuL69h4uUMqX1ClRqiM5l8yhtM6HzAYQBZXx/4bFyH5georKXDiX
         NOf3ak+fEZUwWxd+s2i1N5Kv7/cmxN6qCd2JsP07FpbfRT1uAuvVUQXRoFonWZXqjHYG
         YliD3zBBUjh9BxkKahnvQdXtGWEtkc5FyARP8BsMQhsJwSh/ZiPFkjJki97h1VxD/eBr
         d2ZPXAxZ0kCU/RC/rEvXvpugZCnEy2V3S7SxCQJMqtDmUChHa/28gloNiiC3UsgO21P9
         MZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2qnjSxUYuEXg0dw78Bycu38ZOzjD1Ty8SMepQD8PUQ=;
        b=yAu8aP6ypOUNfpbdiTMbXyl89zVN/CeHRUGAKZnzEUKW+n8IEBAHThFNDfFzJ7ovKQ
         hUEFOSgyjSYJ7PUCIqYAVl16O4g7sk4tFMs4+khp+Q25RbnJiXPg2VVU1JkCO2t4Q6Ep
         1EDMg4/n+SmBUd+7F+6pJV8XSjabXuTgssQhQ8+xnTd9eZgNrsoQMb3nKdZtoFi2ejJi
         uiJ2pdR/TRRS9VzH6oAYY6XK6IMrsjPDwQHXGDVrANmuHRDZNV/mrb6O790a1a4Ut1Nd
         0HcmT7zc19ESHLA3xN03I9ZPgvieoLhlq6jaNqwzD2Q8cTyTtNVLorFd6ZWXmJoyut0g
         4M7w==
X-Gm-Message-State: AFqh2kpIVTSsDroCKP6wm9e4bEhjNP0kbEjkOCfUhshoIYfGiu3f3eQF
	hw+hEjK5XHbuQaFsE8ri3zu6KqjyZEI=
X-Google-Smtp-Source: AMrXdXtJ3BBML6MNO2bivA0NMETnqPFkIWwtoaaS00zkjBpXhfxpAVazeVYnJg5FkxqE8ux39EgkOQ==
X-Received: by 2002:a05:600c:510e:b0:3d3:4406:8a2e with SMTP id o14-20020a05600c510e00b003d344068a2emr23560562wms.15.1672329682847;
        Thu, 29 Dec 2022 08:01:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/10] epiphany: update 42.4 -> 43.0
Date: Thu, 29 Dec 2022 17:01:08 +0100
Message-Id: <20221229160110.255775-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175114

soup 2.x support has been removed upstream.
libportal is no longer optional.
epiphany now also needs some native executables from
gtk and desktop-file-utils.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../epiphany/{epiphany_42.4.bb => epiphany_43.0.bb}  | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.4.bb => epiphany_43.0.bb} (78%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.4.bb b/meta/recipes-gnome/epiphany/epiphany_43.0.bb
similarity index 78%
rename from meta/recipes-gnome/epiphany/epiphany_42.4.bb
rename to meta/recipes-gnome/epiphany/epiphany_43.0.bb
index 0cbe1c9c58..071be328f3 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_43.0.bb
@@ -15,8 +15,12 @@ DEPENDS = " \
           libarchive \
           libdazzle \
           libhandy \
+          libportal \
+          libsoup \
           glib-2.0-native \
           coreutils-native \
+          gtk+3-native \
+          desktop-file-utils-native \
           "
 
 GNOMEBASEBUILDCLASS = "meson"
@@ -28,16 +32,10 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "370938ad2920eeb28bc2435944776b7ba55a0e2ede65836f79818cfb7e8f0860"
-
-PACKAGECONFIG_SOUP ?= "soup3"
-PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
+SRC_URI[archive.sha256sum] = "b66d499f9ee72696d83cf844125377181a954554a4bb3785b73293380ac0c227"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
-PACKAGECONFIG[libportal] = "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
 
 FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.30.2


