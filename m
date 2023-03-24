Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C64C761AF
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:24:47 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.104939.1679671480917221105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v3 6/6] webkitgtk: add missing dependencies
Date: Fri, 24 Mar 2023 16:22:38 +0100
Message-ID: <20230324152238.194877-6-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324152238.194877-1-kubiznak@2n.com>
References: <20230324152238.194877-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179067

When gobject-introspection feature is disabled, gettext and
glib-2.0-native dependencies are not pulled in, which causes failures
in do_compile due to missing xgettext and gdbus-codegen.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.38.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
index e52920883a..b49ecf2a31 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            "
 SRC_URI[sha256sum] = "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
 
-inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
+inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen gettext
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
@@ -38,6 +38,7 @@ DEPENDS += " \
           libnotify \
           gstreamer1.0 \
           gstreamer1.0-plugins-base \
+          glib-2.0-native \
           "
 
 PACKAGECONFIG_SOUP ?= "soup3"
-- 
2.30.2


