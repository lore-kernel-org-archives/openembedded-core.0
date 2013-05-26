Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id DA4A662249
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 10:59:42 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v14so4429588pde.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 03:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=BvGvusCNAVwO1mZuo67pVUnEOYFc8P6kmexiV+rjfpo=;
	b=rqHZUay5h5cPRYP8iAbufe7zQFIqr7YD9F8YvO2Xvgw+S9d2xVU5z9dTHRW5uoiTAl
	ss4pMWc1x5mwLapxQmz67lAx8IabduHo9hrKnGvtekaQtwodoPtVxPp+hCnzDIJDV+eO
	TkV3Ep9+sNyGo23QxIsa5WkjkmMls02Hmn33CxVgtwsiTDuKaz6qrtsXQq2uHoVFn97I
	smCzp0gtqUXtEc+5baiA2cIynQTNKCv0+LkFfA9L0zM4MMNiftSWpVdKf2YRHMpzjNE4
	zWLK7Z5wlrec6V4b/URtunrI2SqP7kKB545CGQhZmwxVgljjMc/vPFK/LqRq/+kigQQ6
	HLxA==
X-Received: by 10.68.135.231 with SMTP id pv7mr24763035pbb.108.1369565983758; 
	Sun, 26 May 2013 03:59:43 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	kv2sm24028601pbc.28.2013.05.26.03.59.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 03:59:42 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 21:13:04 +1000
Message-Id: <1369566786-20341-5-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1369566786-20341-1-git-send-email-net147@gmail.com>
References: <1369566786-20341-1-git-send-email-net147@gmail.com>
Subject: [PATCH 4/6] systemd: remove old /var/run workarounds
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
X-List-Received-Date: Sun, 26 May 2013 10:59:43 -0000

Do not clear /var/run on startup as it is a tmpfs.
Do not create empty /var/run/utmp on startup as it no longer seems
needed for systemd-update-utmp-runlevel.service to start properly.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd/var-run.conf | 4 ----
 meta/recipes-core/systemd/systemd_204.bb       | 3 ---
 2 files changed, 7 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/var-run.conf

diff --git a/meta/recipes-core/systemd/systemd/var-run.conf b/meta/recipes-core/systemd/systemd/var-run.conf
deleted file mode 100644
index c2c18e2..0000000
--- a/meta/recipes-core/systemd/systemd/var-run.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-# empty /var/run
-R	/var/run/*	-	-	-	-	-
-# systemd-update-utmp-runlevel.service fails to start without this
-f /var/run/utmp 0644 root root - -
diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_204.bb
index ec5be1f..9664e04 100644
--- a/meta/recipes-core/systemd/systemd_204.bb
+++ b/meta/recipes-core/systemd/systemd_204.bb
@@ -20,7 +20,6 @@ inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-altern
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://touchscreen.rules \
            file://modprobe.rules \
-           file://var-run.conf \
            ${UCLIBCPATCHES} \
            file://0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch \
            file://00-create-volatile.conf \
@@ -105,8 +104,6 @@ do_install() {
 
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 
-	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
-
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
 
 	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-- 
1.8.2.3


