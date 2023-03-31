Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63256C761AF
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 11:49:28 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.52613.1680263366705705710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 04:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v4 05/10] avahi: add missing dependencies
Date: Fri, 31 Mar 2023 13:46:29 +0200
Message-ID: <20230331114634.3578244-5-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331114634.3578244-1-kubiznak@2n.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 11:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179435

When gobject-introspection feature is disabled, glib-2.0-native
and gobject-introspection package dependencies are not pulled in
but avahi has a hard dependency on them (do_configure fails due
to missing introspection.m4 file, do_compile fails due to missing
glib-mkenums).

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index a830385352..bf6835e0d6 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,7 +35,7 @@ SRC_URI[sha256sum] = "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de79
 # Issue only affects Debian/SUSE, not us
 CVE_CHECK_IGNORE += "CVE-2021-26720"
 
-DEPENDS = "expat libcap libdaemon glib-2.0"
+DEPENDS = "expat libcap libdaemon glib-2.0 glib-2.0-native gobject-introspection"
 
 # For gtk related PACKAGECONFIGs: gtk, gtk3
 AVAHI_GTK ?= ""
-- 
2.30.2


