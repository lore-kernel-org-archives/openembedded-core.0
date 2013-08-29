Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1306BCC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 02:35:05 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb10so267927pad.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 19:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rYtA/EdKIpOYXQusKTDPnDc1eL9MD/BK4J9+BI1DE78=;
	b=MTk6j1hsv5yduzI/YVtovq50dnss5yuVkL0wcjYcsmUs217Plvi9f3I/Olv7xVZmOF
	BwQTYR87ScoDs3WYXo5ncBmMIAGoOUklfBvN8RDfvm62jOKvg+0a7iiBQEXXwHLcYLMb
	UMf0PF/nJ/gZQtkpEyqtGolTOmJi+Nut6jnPXCLHuaHdou8BNTYT/cRKhSaL1rjTZNsa
	Oc5xBtinfO2szobKxjpEoVK2ZY5myVitfJTJIhRmr7btmNT5wMtFjQMx7JLVdX/JEdNl
	kX9AR3ckeYN+VKXWJK0Obfxs7rEKldrcTHrPJPyTyRC/Qo3Jt+/kgYpxoXfIJsMxkX0A
	wjDg==
X-Received: by 10.66.233.195 with SMTP id ty3mr1766372pac.70.1377743705911;
	Wed, 28 Aug 2013 19:35:05 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id lm2sm37296147pab.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 19:35:05 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 12:30:24 +1000
Message-Id: <1377743424-3112-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] systemd: use /bin/mkdir instead of host mkdir path
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
X-List-Received-Date: Thu, 29 Aug 2013 02:35:05 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...-Use-bin-mkdir-instead-of-host-mkdir-path.patch | 31 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_206.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch b/meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch
new file mode 100644
index 0000000..25988fc
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch
@@ -0,0 +1,31 @@
+From 5599ab4ae3fe74cdd9699f2874badf241f0148fe Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Wed, 28 Aug 2013 19:09:49 -0700
+Subject: [PATCH] Use /bin/mkdir instead of host mkdir path
+
+If the host system has /usr/bin/mkdir, autoconf would set MKDIR_P to
+/usr/bin/mkdir when it should be /bin/mkdir. As a result, the
+kmod-static-nodes service fails to start on the target because
+/usr/bin/mkdir doesn't exist. This has been observed when building
+systemd on Arch Linux host.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ units/kmod-static-nodes.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/units/kmod-static-nodes.service.in b/units/kmod-static-nodes.service.in
+index d8a8420..1daed5f 100644
+--- a/units/kmod-static-nodes.service.in
++++ b/units/kmod-static-nodes.service.in
+@@ -14,5 +14,5 @@ ConditionCapability=CAP_MKNOD
+ [Service]
+ Type=oneshot
+ RemainAfterExit=yes
+-ExecStartPre=@MKDIR_P@ /run/tmpfiles.d
++ExecStartPre=/bin/mkdir -p /run/tmpfiles.d
+ ExecStart=@KMOD@ static-nodes --format=tmpfiles --output=/run/tmpfiles.d/kmod.conf
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index f05aa1b..75bdc61 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -19,6 +19,7 @@ inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-altern
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0001-use-CAP_MKNOD-ConditionCapability.patch \
+           file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
            file://touchscreen.rules \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
-- 
1.8.3.4


