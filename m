Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA21FC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:46:42 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.10084.1672832792306327768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k=20-=202N?= <kubiznak@2n.com>
Subject: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_ENABLED
Date: Wed, 4 Jan 2023 12:45:54 +0100
Message-ID: <20230104114555.575278-1-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail05w.axis.com
 (10.20.40.11)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175465

From: Petr Kubizňák - 2N <kubiznak@2n.com>

When GI_DATA_ENABLED is 'False' (e.g. because
'gobject-introspection-data' is not in DISTRO_FEATURES),
gobject-introspection should not be added to DEPENDS.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/classes-recipe/gobject-introspection.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/classes-recipe/gobject-introspection.bbclass
index 0c7b7d200a..10cf79508f 100644
--- a/meta/classes-recipe/gobject-introspection.bbclass
+++ b/meta/classes-recipe/gobject-introspection.bbclass
@@ -35,7 +35,8 @@ EXTRA_OEMESON:prepend:class-nativesdk = "${@['', '${GIRMESONBUILD}'][d.getVar('G
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native"
+DEPENDS:append:class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'gobject-introspection', '', d)}"
+DEPENDS:append:class-target = " gobject-introspection-native qemu-native"
 
 # Even though introspection is disabled on -native, gobject-introspection package is still
 # needed for m4 macros.
@@ -46,10 +47,12 @@ DEPENDS:append:class-nativesdk = " gobject-introspection-native"
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


