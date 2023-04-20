Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEEBC77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:00:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6047.1681992048464466101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 05:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C9121480;
	Thu, 20 Apr 2023 05:01:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEE503F587;
	Thu, 20 Apr 2023 05:00:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][mickledore] xserver-xorg: backport fix for CVE-2023-1393
Date: Thu, 20 Apr 2023 13:00:43 +0100
Message-Id: <20230420120043.1604184-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 12:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180250

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...posite-Fix-use-after-free-of-the-COW.patch | 46 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.7.bb       |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-=
composite-Fix-use-after-free-of-the-COW.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composi=
te-Fix-use-after-free-of-the-COW.patch b/meta/recipes-graphics/xorg-xserv=
er/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
new file mode 100644
index 00000000000..fc426daba51
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-=
use-after-free-of-the-COW.patch
@@ -0,0 +1,46 @@
+From 26ef545b3502f61ca722a7a3373507e88ef64110 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 13 Mar 2023 11:08:47 +0100
+Subject: [PATCH] composite: Fix use-after-free of the COW
+
+ZDI-CAN-19866/CVE-2023-1393
+
+If a client explicitly destroys the compositor overlay window (aka COW),
+we would leave a dangling pointer to that window in the CompScreen
+structure, which will trigger a use-after-free later.
+
+Make sure to clear the CompScreen pointer to the COW when the latter get=
s
+destroyed explicitly by the client.
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+
+CVE: CVE-2023-1393
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ composite/compwindow.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/composite/compwindow.c b/composite/compwindow.c
+index 4e2494b86..b30da589e 100644
+--- a/composite/compwindow.c
++++ b/composite/compwindow.c
+@@ -620,6 +620,11 @@ compDestroyWindow(WindowPtr pWin)
+     ret =3D (*pScreen->DestroyWindow) (pWin);
+     cs->DestroyWindow =3D pScreen->DestroyWindow;
+     pScreen->DestroyWindow =3D compDestroyWindow;
++
++    /* Did we just destroy the overlay window? */
++    if (pWin =3D=3D cs->pOverlayWin)
++        cs->pOverlayWin =3D NULL;
++
+ /*    compCheckTree (pWin->drawable.pScreen); can't check -- tree isn't=
 good*/
+     return ret;
+ }
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb b/=
meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
index 212c7d39c23..f0771cc86ec 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
@@ -1,7 +1,8 @@
 require xserver-xorg.inc
=20
 SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-h=
ardwar.patch \
-           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch =
\
+            file://0001-composite-Fix-use-after-free-of-the-COW.patch \
            "
 SRC_URI[sha256sum] =3D "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742=
d6532e92795877bb"
=20
--=20
2.34.1


