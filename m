Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85789C76196
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:24:47 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.104275.1679671478962836792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v3 1/6] gobject-introspection: reduce dependencies
Date: Fri, 24 Mar 2023 16:22:33 +0100
Message-ID: <20230324152238.194877-1-kubiznak@2n.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179062

When GI_DATA_ENABLED is 'False' (e.g. because
'gobject-introspection-data' is not in DISTRO_FEATURES),
gobject-introspection, gobject-introspection-native and qemu-native
should not be added to DEPENDS. This is to reduce dependency chain
when g-i is disabled.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/classes-recipe/gobject-introspection.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/classes-recipe/gobject-introspection.bbclass
index 0c7b7d200a..98edb93761 100644
--- a/meta/classes-recipe/gobject-introspection.bbclass
+++ b/meta/classes-recipe/gobject-introspection.bbclass
@@ -35,7 +35,7 @@ EXTRA_OEMESON:prepend:class-nativesdk = "${@['', '${GIRMESONBUILD}'][d.getVar('G
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native"
+DEPENDS:append:class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'gobject-introspection gobject-introspection-native qemu-native', '', d)}"
 
 # Even though introspection is disabled on -native, gobject-introspection package is still
 # needed for m4 macros.
@@ -46,10 +46,12 @@ DEPENDS:append:class-nativesdk = " gobject-introspection-native"
 export XDG_DATA_DIRS = "${STAGING_DATADIR}:${STAGING_LIBDIR}"
 
 do_configure:prepend:class-target () {
-    # introspection.m4 pre-packaged with upstream tarballs does not yet
-    # have our fixes
-    mkdir -p ${S}/m4
-    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
+    if [ "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '1', '0', d)}" = "1" ] ; then
+        # introspection.m4 pre-packaged with upstream tarballs does not yet
+        # have our fixes
+        mkdir -p ${S}/m4
+        cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
+    fi
 }
 
 # .typelib files are needed at runtime and so they go to the main package (so
-- 
2.30.2


