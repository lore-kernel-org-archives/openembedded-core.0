Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EAED6C2B9
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 00:23:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2016.1732062173838638916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 16:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D796C40C2B;
	Wed, 20 Nov 2024 00:22:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ND4IMFGQTK0R; Wed, 20 Nov 2024 00:22:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BA75340C16;
	Wed, 20 Nov 2024 00:22:51 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id CBE8D1640DA;
	Tue, 19 Nov 2024 19:22:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] yocto-check-layer: expand to cover all required QA checks
Date: Tue, 19 Nov 2024 19:22:42 -0500
Message-Id: <20241120002242.28351-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 00:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207407

From: Denys Dmytriyenko <denys@konsulko.com>

insane.bbclass now defines CHECKLAYER_REQUIRED_TESTS list with required
QA checks that are becoming mandatory for Yocto Project Compatible layers=
.

Update yocto-check-layer.bbclass in order to catch when packages from suc=
h
layers try to skip any of the required QA checks.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../yocto-check-layer.bbclass                 | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)
 rename meta/{classes =3D> classes-global}/yocto-check-layer.bbclass (27%=
)

diff --git a/meta/classes/yocto-check-layer.bbclass b/meta/classes-global=
/yocto-check-layer.bbclass
similarity index 27%
rename from meta/classes/yocto-check-layer.bbclass
rename to meta/classes-global/yocto-check-layer.bbclass
index 404f5fd9f2..1cdab49661 100644
--- a/meta/classes/yocto-check-layer.bbclass
+++ b/meta/classes-global/yocto-check-layer.bbclass
@@ -5,18 +5,24 @@
 #
=20
 #
-# This class is used by yocto-check-layer script for additional per-reci=
pe tests
-# The first test ensures that the layer has no recipes skipping 'install=
ed-vs-shipped' QA checks
+# This class is used by yocto-check-layer script to ensure that packages
+# from Yocto Project Compatible layers don't skip required QA checks lis=
ted
+# in CHECKLAYER_REQUIRED_TESTS defined by insane.bbclass
+#
+# It adds an anonymous python function with extra processing to all reci=
pes,
+# globally inheriting this class isn't advisable - yocto-check-layer scr=
ipt
+# handles that during its signature dump
 #
-
-WARN_QA:remove =3D "installed-vs-shipped"
-ERROR_QA:append =3D " installed-vs-shipped"
=20
 python () {
+    required_tests =3D set((d.getVar('CHECKLAYER_REQUIRED_TESTS') or '')=
.split())
     packages =3D set((d.getVar('PACKAGES') or '').split())
     for package in packages:
         skip =3D set((d.getVar('INSANE_SKIP') or "").split() +
                    (d.getVar('INSANE_SKIP:' + package) or "").split())
-        if 'installed-vs-shipped' in skip:
-            oe.qa.handle_error("installed-vs-shipped", 'Package %s is sk=
ipping "installed-vs-shipped" QA test.' % package, d)
+        skip_required =3D skip & required_tests
+        if skip_required:
+            oe.qa.write_error(" ".join(skip_required), 'Package %s is sk=
ipping required QA tests.' % package, d)
+            bb.error("QA Issue: %s [%s]" % ('Package %s is skipping requ=
ired QA tests.' % package, " ".join(skip_required)))
+            d.setVar("QA_ERRORS_FOUND", "True")
 }
--=20
2.35.3


