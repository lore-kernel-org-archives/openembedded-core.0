Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBC7C76196
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 09:36:55 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.97243.1679650612367403867
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 02:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v2 1/3] gobject-introspection: check for GI_DATA_ENABLED
Date: Fri, 24 Mar 2023 10:33:24 +0100
Message-ID: <20230324093326.3973899-2-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324093326.3973899-1-kubiznak@2n.com>
References: <175673>
 <20230324093326.3973899-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 09:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179023

When GI_DATA_ENABLED is 'False' (e.g. because
'gobject-introspection-data' is not in DISTRO_FEATURES),
gobject-introspection and gobject-introspection-native
should not be added to DEPENDS. This is to reduce dependency chain
when g-i is disabled.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/classes-recipe/gobject-introspection.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/classes-recipe/gobject-introspection.bbclass
index 0c7b7d200a..eb55e7c5e8 100644
--- a/meta/classes-recipe/gobject-introspection.bbclass
+++ b/meta/classes-recipe/gobject-introspection.bbclass
@@ -35,7 +35,8 @@ EXTRA_OEMESON:prepend:class-nativesdk = "${@['', '${GIRMESONBUILD}'][d.getVar('G
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native"
+DEPENDS:append:class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'gobject-introspection gobject-introspection-native', '', d)}"
+DEPENDS:append:class-target = " qemu-native"
 
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


