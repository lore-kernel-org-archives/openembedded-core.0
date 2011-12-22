Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rdi6u-000233-E3
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:51:00 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so4959318yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 04:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=fCdlTkzeXdN2zRTHsR/audGfrJUj9X0i0BQmCdTYods=;
	b=bf+ivHhBva7455Sr5zdY2puEgackmi8LlSzok5WP0/7Y0A4tK2M0p7fhInc12T3SHj
	lfcEW13kWKdEvg9iwtR0bhcRLARJos4ORh3rfghgOWwLNPz/R7hps07EEihUhCxjBOAL
	h5HwcNq7C6USO782uptJNUwxtRgDPlYybwOBE=
Received: by 10.236.115.40 with SMTP id d28mr14565983yhh.37.1324557836050;
	Thu, 22 Dec 2011 04:43:56 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i32sm23456497anm.6.2011.12.22.04.43.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 04:43:55 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 12:43:25 +0000
Message-Id: <26589d5508f7d1864ec0a115761e606e29f9a140.1324557763.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
Subject: [PATCH v2 5/9] udev: skip mounting /dev on tmpfs if it is on devtmpfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 12:51:00 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev/init   |    2 +-
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index edc3c9a..d0d7e5d 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -28,7 +28,7 @@ export ACTION=add
 echo -n "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
-LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
+LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
 	mount -n -o mode=0755 -t tmpfs none "/dev"
 	mkdir -m 0755 /dev/pts
 	mkdir -m 1777 /dev/shm
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 3e4e402..f952c90 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.2.5



