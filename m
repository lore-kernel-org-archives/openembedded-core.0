Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4C2D6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 05:58:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5L5w2Qr020888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 22:58:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 20 Jun 2018 22:58:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2018 14:00:23 +0800
Message-ID: <78647e28ffe6dd23802762a4a7fde54df7039c4b.1529478911.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1529478911.git.Qi.Chen@windriver.com>
References: <cover.1529478911.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] avahi: fix error at boot time for avahi-daemon.service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 05:58:01 -0000
Content-Type: text/plain

The following error messages appear now and then at boot time.

  avahi-daemon/chroot.c: open() failed: No such file or directory
  Failed to open /etc/resolv.conf: Invalid argument

The problem is about /etc/resolv.conf. In Yocto's systemd based
systems, it's a symlink to /etc/resolv-conf.systemd which in turn
is a symlink to /run/systemd/resolve/resolv.conf. The systemd-resolved
service handles creation of /run/systemd/resolve/resolv.conf file.

So if avahi-daemon is started before systemd-resolved, the error messages
appear.

Fix this problem by making avahi-daemon start after systemd-resolved.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.7.bb       |  1 +
 .../0001-Fix-opening-etc-resolv.conf-error.patch   | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
index b695be9..3d5f334 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
@@ -3,6 +3,7 @@ require avahi.inc
 SRC_URI += "file://00avahi-autoipd \
            file://99avahi-autoipd \
            file://initscript.patch \
+           file://0001-Fix-opening-etc-resolv.conf-error.patch \
            "
 
 inherit update-rc.d systemd useradd
diff --git a/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch b/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch
new file mode 100644
index 0000000..11e7e8a
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-error.patch
@@ -0,0 +1,40 @@
+From 78967814f5c37ed67f4cf64d70c9f76a03ee89bc Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 20 Jun 2018 13:57:35 +0800
+Subject: [PATCH] Fix opening /etc/resolv.conf error
+
+Fix to start avahi-daemon after systemd-resolved.service. This is because
+/etc/resolv.conf is a link to /etc/resolv-conf.systemd which in turn is
+a symlink to /run/systemd/resolve/resolv.conf. And /run/systemd/resolve/resolv.conf
+is created by systemd-resolved.service by default in current OE's systemd
+based systems.
+
+This fixes errro like below.
+
+  Failed to open /etc/resolv.conf: Invalid argument
+
+In fact, handling of /etc/resolv.conf is quite distro specific. So this patch
+is marked as OE specific.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ avahi-daemon/avahi-daemon.service.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/avahi-daemon/avahi-daemon.service.in b/avahi-daemon/avahi-daemon.service.in
+index 548c834..63e28e4 100644
+--- a/avahi-daemon/avahi-daemon.service.in
++++ b/avahi-daemon/avahi-daemon.service.in
+@@ -18,6 +18,7 @@
+ [Unit]
+ Description=Avahi mDNS/DNS-SD Stack
+ Requires=avahi-daemon.socket
++After=systemd-resolved.service
+ 
+ [Service]
+ Type=dbus
+-- 
+2.11.0
+
-- 
1.9.1


