Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9237BC77B6F
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 11:08:24 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.67185.1680520095440183673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 04:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v5 4/6] gconf: add missing dependencies
Date: Mon, 3 Apr 2023 13:06:44 +0200
Message-ID: <20230403110646.2555294-4-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230403110646.2555294-1-kubiznak@2n.com>
References: <20230403110646.2555294-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 11:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179620

When gobject-introspection feature is disabled, glib-2.0-native
and gobject-introspection package dependencies are not pulled in
but gconf has a hard dependency on them (do_configure fails due to
missing introspection.m4 file and glib-gettextize).

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 776f6091aa..e712e4729c 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://gitlab.gnome.org/Archive/gconf"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
+DEPENDS = "glib-2.0 glib-2.0-native gobject-introspection dbus dbus-glib libxml2 intltool-native"
 
 inherit gnomebase gtk-doc gettext gobject-introspection gio-module-cache
 
-- 
2.30.2


