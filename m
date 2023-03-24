Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9595EC77B60
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:24:47 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.104276.1679671479008757001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v3 2/6] graphene: add gobject-types PACKAGECONFIG
Date: Fri, 24 Mar 2023 16:22:34 +0100
Message-ID: <20230324152238.194877-2-kubiznak@2n.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179063

Add an option to enable/disable build of graphene-gobject. When
enabled, add glib dependency (not pulled in implicitly if
the gobject-introspection feature is disabled).

Default is to enable gobject-types so that graphene-gobject is built
(dependency of gtk4).

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index 120ee80b17..9f5b4d0e2d 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -11,8 +11,9 @@ SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da3
 
 # Disable neon support by default on ARM-32 platforms because of the
 # following upstream bug: https://github.com/ebassi/graphene/issues/215
-PACKAGECONFIG ?= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'neon', '', d)}"
+PACKAGECONFIG ?= "gobject-types ${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'neon', '', d)}"
 
+PACKAGECONFIG[gobject-types] = "-Dgobject_types=true,-Dgobject_types=false,glib-2.0"
 PACKAGECONFIG[neon] = "-Darm_neon=true,-Darm_neon=false,"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.30.2


