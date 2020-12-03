Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web12.8163.1606991718701301883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 02:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 35D2160199;
	Thu,  3 Dec 2020 10:35:16 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
From: "Jack Mitchell" <ml@embed.me.uk>
To: openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Kai <kai.kang@windriver.com>,
	Jack Mitchell <ml@embed.me.uk>
Subject: [PATCH 1/3] Revert "connman: set service to conflict with systemd-networkd"
Date: Thu,  3 Dec 2020 10:35:00 +0000
Message-Id: <20201203103502.192240-1-ml@embed.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Without further examples of how this is failing revert as using both
together is a valid use case, for example connman handling Wifi/AP
and systemd-networkd handling more complex routing such as for
containers and ethernet switches.

This reverts commit 5303420ead25817f5caec276b79eec7ee797271a.

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
---
 ...stop-systemd-networkd-when-using-con.patch | 29 -------------------
 .../connman/connman_1.38.bb                   |  1 -
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-connma=
n.service-stop-systemd-networkd-when-using-con.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.servi=
ce-stop-systemd-networkd-when-using-con.patch b/meta/recipes-connectivity=
/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-co=
n.patch
deleted file mode 100644
index dd012750a4..0000000000
--- a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop=
-systemd-networkd-when-using-con.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9fea099d0a3ece37d80ad70d32ebb8a93f8f3280 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 30 Oct 2020 13:48:45 +0800
-Subject: [PATCH] connman.service: stop systemd-networkd when using connm=
an
-
-Stop systemd-networkd service when we use connman as network manager.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/connman.service.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/connman.service.in b/src/connman.service.in
-index 79e75d6..014eafe 100644
---- a/src/connman.service.in
-+++ b/src/connman.service.in
-@@ -6,6 +6,7 @@ RequiresMountsFor=3D@localstatedir@/lib/connman
- After=3Ddbus.service network-pre.target systemd-sysusers.service
- Before=3Dnetwork.target multi-user.target shutdown.target
- Wants=3Dnetwork.target
-+Conflicts=3Dsystemd-networkd.service systemd-networkd.socket
- Conflicts=3Dsystemd-resolved.service
-=20
- [Service]
---=20
-2.17.1
-
diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/rec=
ipes-connectivity/connman/connman_1.38.bb
index 45c2934dec..027c41e9af 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.38.bb
@@ -3,7 +3,6 @@ require connman.inc
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-plugin.h-Change-visibility-to-default-for-debug-s=
ymb.patch \
            file://0001-connman.service-stop-systemd-resolved-when-we-use=
-co.patch \
-           file://0001-connman.service-stop-systemd-networkd-when-using-=
con.patch \
            file://connman \
            file://no-version-scripts.patch \
            "
--=20
2.29.2

