Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rfzin-0007mv-Dc
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:34 +0100
Received: by ghrr17 with SMTP id r17so5465068ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=fCdlTkzeXdN2zRTHsR/audGfrJUj9X0i0BQmCdTYods=;
	b=h5RM/0kO0MsBg8gFUtqCZVu9rVjQStxqA7JzkTmEcHAHN9ilVzOPicJgYQPYDpaPLn
	FsqaSLiwtZiQ59vVQKwd0ylWOOMcjBkyPnKP1ea3pjiDLsTw8U5WFg7H3HMhPZ27Hx+Q
	JAooCAF20AeUVD2NYastfDv6Jhwz5gTZi2CD0=
Received: by 10.236.129.164 with SMTP id h24mr44160591yhi.78.1325102177708;
	Wed, 28 Dec 2011 11:56:17 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.56.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:56:16 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:31 +0000
Message-Id: <bfb5d454636d3dc5ce8defba1a20215e91083622.1325101674.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 10/16] udev: skip mounting /dev on tmpfs if it is on devtmpfs
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:35 -0000

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



