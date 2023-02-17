Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423FAC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 07:48:32 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.2105.1676620106677393648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 23:48:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH] graphene: remove introspection from PACKAGECONFIG
Date: Fri, 17 Feb 2023 08:47:13 +0100
Message-ID: <20230217074713.1378843-1-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 07:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177305

Assignment of "introspection" as default PACKAGECONFIG value does not
reflect gobject-introspection being globally enabled or disabled.
As a result, graphene compilation used to fail when g-i was disabled.

Use standard means to enable or disable introspection based on machine
and distro features, as implemented by gobject-introspection class.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index 75c8258d99..120ee80b17 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -9,14 +9,15 @@ inherit gnomebase gobject-introspection gtk-doc
 
 SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da31dfde2928f279a"
 
-# gtk4 & mutter 41.0 requires graphene build with introspection
 # Disable neon support by default on ARM-32 platforms because of the
 # following upstream bug: https://github.com/ebassi/graphene/issues/215
-PACKAGECONFIG ?= "introspection ${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'neon', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'neon', '', d)}"
 
-PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
 PACKAGECONFIG[neon] = "-Darm_neon=true,-Darm_neon=false,"
 
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 
 EXTRA_OEMESON = "-Dinstalled_tests=false"
-- 
2.30.2


