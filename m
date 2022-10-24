Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C49FA373D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:07:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.20309.1666624068833266066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 08:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44A0B152B;
	Mon, 24 Oct 2022 08:07:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CEAD3F792;
	Mon, 24 Oct 2022 08:07:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] libx11: apply the fix for CVE-2022-3554
Date: Mon, 24 Oct 2022 16:07:43 +0100
Message-Id: <20221024150745.3917987-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172102

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ak-in-XRegisterIMInstantiateCallback.patch | 57 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.8.1.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memo=
ry-leak-in-XRegisterIMInstantiateCallback.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak=
-in-XRegisterIMInstantiateCallback.patch b/meta/recipes-graphics/xorg-lib=
/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch
new file mode 100644
index 00000000000..722116c07e8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRe=
gisterIMInstantiateCallback.patch
@@ -0,0 +1,57 @@
+CVE: CVE-2022-3554
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 1d11822601fd24a396b354fa616b04ed3df8b4ef Mon Sep 17 00:00:00 2001
+From: "Thomas E. Dickey" <dickey@invisible-island.net>
+Date: Tue, 4 Oct 2022 18:26:17 -0400
+Subject: [PATCH] fix a memory leak in XRegisterIMInstantiateCallback
+
+Analysis:
+
+    _XimRegisterIMInstantiateCallback() opens an XIM and closes it using
+    the internal function pointers, but the internal close function does
+    not free the pointer to the XIM (this would be done in XCloseIM()).
+
+Report/patch:
+
+    Date: Mon, 03 Oct 2022 18:47:32 +0800
+    From: Po Lu <luangruo@yahoo.com>
+    To: xorg-devel@lists.x.org
+    Subject: Re: Yet another leak in Xlib
+
+    For reference, here's how I'm calling XRegisterIMInstantiateCallback=
:
+
+    XSetLocaleModifiers ("");
+    XRegisterIMInstantiateCallback (compositor.display,
+                                    XrmGetDatabase (compositor.display),
+                                    (char *) compositor.resource_name,
+                                    (char *) compositor.app_name,
+                                    IMInstantiateCallback, NULL);
+
+    and XMODIFIERS is:
+
+        @im=3Dibus
+
+Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
+---
+ modules/im/ximcp/imInsClbk.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/modules/im/ximcp/imInsClbk.c b/modules/im/ximcp/imInsClbk.c
+index 95b379cb..c10e347f 100644
+--- a/modules/im/ximcp/imInsClbk.c
++++ b/modules/im/ximcp/imInsClbk.c
+@@ -212,6 +212,9 @@ _XimRegisterIMInstantiateCallback(
+     if( xim ) {
+ 	lock =3D True;
+ 	xim->methods->close( (XIM)xim );
++	/* XIMs must be freed manually after being opened; close just
++	   does the protocol to deinitialize the IM.  */
++	XFree( xim );
+ 	lock =3D False;
+ 	icb->call =3D True;
+ 	callback( display, client_data, NULL );
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.8.1.bb
index 1dcc3abee96..9ff196c897f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
@@ -15,6 +15,7 @@ PE =3D "1"
 SRC_URI =3D "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
=20
 SRC_URI +=3D "file://disable_tests.patch \
+            file://0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallb=
ack.patch \
            "
 SRC_URI[sha256sum] =3D "1bc41aa1bbe01401f330d76dfa19f386b79c51881c7bbfee=
9eb4e27f22f2d9f7"
=20
--=20
2.34.1


