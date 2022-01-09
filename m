Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DBBC433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:28:00 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.24205.1641767279192372654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QHKaibTd;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id s1so23382259wra.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/X+yzNMyhPPeuq/YVN3JoKvjkVkaWKAXKiox/dbbeAg=;
        b=QHKaibTdupI9rc+R02ixxz+xJ/tu/L2apc62NWdCqQrIwlvWIIm14iv55ku/V+8J/c
         hwbOMuN/p+p/O6AXjMP6u4CvVQlxNKNMopKRzpo60B+6aXVfLhTdCU9JlT8WDYLdTooP
         iKfu80ifoyvSFt5LBeP+6NTEkBUM7S037o4QRV2HEhHWJR9PG2JxXFxNZ2qJe6KhNVWd
         o4j2vddCIoo7uICTeb0FJsu+uabu5kkha/YcwKXU3QYz7woAkvmnIe7bqPR/H3mEIuI7
         wfY/xzVbe8tgHfTzpa5RKXmWax4BkVuW+0ceOxTlJFSa7PcTZtEKJb7rFhUETPbPzAOo
         t6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/X+yzNMyhPPeuq/YVN3JoKvjkVkaWKAXKiox/dbbeAg=;
        b=TfVz7obIAkCzFOQ+ejQNrImvxRcQBhwiNaTHinhhMd+tklyHJzxwXuBn7X7ySFADl5
         eU1tHa23svlxgcBqqTSl2XhFIxJT4r57vnGYsGQXtfZWO73zs41SSjevpaK7mx/2CvdW
         dTcQ0sgGlXcC8l1/OSiHX/3VVuXWFFIvneBRKLa7041gFm90BIFSBte4ubD37goh1D9A
         rUekJMf/cWJ8HecHUpl4OCAyqc14VgAViZ61bf60jq0HDJ7iPX09NFTNNeRM4jQUWYlI
         xrfbJrQhJu/0vHQ5Fpi0PKn/d6F9QrCIx0jHWSChHPXKD8V5/ishXHjxg6lwVPovxVN3
         b0+A==
X-Gm-Message-State: AOAM530qoXKxzqtp8fJ/5cvlA5vmOJYNUGr+SYZ19bfiX96/axTbJn2a
	wt6jt+IPrq1EQg27a970mdHEctpt89s=
X-Google-Smtp-Source: 
 ABdhPJwEha5X4SkMf1r40BgEP5S8eFVjMzM2/uu7OHj4QQr0uTFnw54m4NrA2TEO6ep6yQEI5o6E4Q==
X-Received: by 2002:a05:6000:104c:: with SMTP id
 c12mr60705183wrx.419.1641767277833;
        Sun, 09 Jan 2022 14:27:57 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/14] epiphany: make libportal optional,
 and move it to meta-oe
Date: Sun,  9 Jan 2022 23:27:28 +0100
Message-Id: <20220109222732.2252416-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:28:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160313

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 meta/recipes-gnome/epiphany/epiphany_41.0.bb  |  2 +-
 meta/recipes-gnome/libportal/libportal_0.5.bb | 17 -----------------
 3 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100644 meta/recipes-gnome/libportal/libportal_0.5.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0af6974a3d..ab7915482a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -369,7 +369,6 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
index 8f3bd87340..a64cdefd86 100644
--- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
@@ -15,7 +15,6 @@ DEPENDS = " \
           libarchive \
           libdazzle \
           libhandy \
-          libportal \
           glib-2.0-native \
           "
 
@@ -37,6 +36,7 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
 PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
+PACKAGECONFIG[libportal] = "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
 
 FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
diff --git a/meta/recipes-gnome/libportal/libportal_0.5.bb b/meta/recipes-gnome/libportal/libportal_0.5.bb
deleted file mode 100644
index 67f63fea68..0000000000
--- a/meta/recipes-gnome/libportal/libportal_0.5.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
-DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
-with a familiar GObject API along side the D-Bus API"
-HOMEPAGE = "https://github.com/flatpak/libportal"
-BUGTRACKER = "https://github.com/flatpak/libportal/issues"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
-
-SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=master"
-SRCREV = "467a397fd7996557f837cdc26ac07c01c62810e5"
-S = "${WORKDIR}/git"
-
-inherit meson gtk-doc gobject-introspection
-
-DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
-
-EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
-- 
2.20.1


