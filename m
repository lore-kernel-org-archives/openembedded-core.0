Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AAEC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:35:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5974.1753792516649001767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 05:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CA321516
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 05:35:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CDAAB3F673
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 05:35:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] ccache: enable ccache for all recipes if it is in HOSTTOOLS
Date: Tue, 29 Jul 2025 13:35:10 +0100
Message-ID: <20250729123510.1094823-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221077

At the moment we don't allow ccache for native recipes to avoid the
dependency loop of native recipes needing ccache-native which then
depends on itself.

One way to avoid this dependency loop is to just provide a host ccache,
so enable ccache globally if ccache is in HOSTTOOLS.  This isn't set
out of the box, but does work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/ccache.bbclass | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 7daaa7e3aa2..5ce23e50f34 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -12,17 +12,22 @@
 #
 # - Disable ccache for a recipe
 #   Add the following line to the recipe if it can't be built with ccach=
e:
-#   CCACHE_DISABLE =3D '1'
+#   CCACHE_DISABLE =3D "1"
 #
 # - Share ccache files between different builds
 #   Set CCACHE_TOP_DIR to a shared dir
-#   CCACHE_TOP_DIR =3D /path/to/shared_ccache/
+#   CCACHE_TOP_DIR =3D "/path/to/shared_ccache/"
 #
-# - TO debug ccahe
+# - To debug ccache
 #   export CCACHE_DEBUG =3D "1"
 #   export CCACHE_LOGFILE =3D "${CCACHE_DIR}/logfile.log"
 #   And also set PARALLEL_MAKE =3D "-j 1" to get make the log in order
 #
+# By default this class will only use ccache for target builds, and buil=
d
+# our own ccache-native.  It is possible to use a host-provided ccache t=
hat
+# can then be used by native recipes too by setting:
+#   ASSUME_PROVIDED +=3D "ccache-native"
+#   HOSTTOOLS +=3D "ccache"
=20
 # Set it to a shared location for different builds, so that cache files =
can
 # be shared between different builds.
@@ -46,7 +51,8 @@ python() {
     Enable ccache for the recipe
     """
     pn =3D d.getVar('PN')
-    if (pn in d.getVar('CCACHE_NATIVE_RECIPES_ALLOWED') or
+    if ("ccache" in d.getVar("HOSTTOOLS").split() or
+        pn in d.getVar('CCACHE_NATIVE_RECIPES_ALLOWED') or
         not (bb.data.inherits_class("native", d) or
         bb.utils.to_boolean(d.getVar('CCACHE_DISABLE')))):
         d.appendVar('DEPENDS', ' ccache-native')
--=20
2.43.0


