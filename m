Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rfzir-0007ai-Be
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:38 +0100
Received: by mail-gx0-f175.google.com with SMTP id h1so8399593ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=j5p9DUliZgHa7EYp45LDqN/Qq57KESmucEUSULKs26g=;
	b=wgVC3hIeZkUJBvxsTc3NGwxbDh58pyCe9PHxzsgTgn/XCL4QRERtj1hQqviDRD+ftn
	ElTGfRHKcs+LXiEhMX1zfvT2pCt2XExV0XXcaTK4uGlggmfeu+YjHvL0f12ivmKm6/EF
	iNi+o7U+CLzx/w8ZJ2kft8mjXmczHZTcPqg28=
Received: by 10.101.24.2 with SMTP id b2mr4295162anj.27.1325102185842;
	Wed, 28 Dec 2011 11:56:25 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.56.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:56:24 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:34 +0000
Message-Id: <45824881586c4b8e313fda0a91a74a7dfc429e85.1325101675.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 13/16] udev: use 'echo' instead of 'echo -n' in init script
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:38 -0000

Avoid using two stage progress output to avoid text garbage during
parallel boot.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev/init   |    3 +--
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 5468bd9..322e7e7 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -26,7 +26,7 @@ kill_udevd() {
 
 export ACTION=add
 # propagate /dev from /sys
-echo -n "Starting udev"
+echo "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
 LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
@@ -68,5 +68,4 @@ else
 	/sbin/udevadm settle
 fi
 
-echo
 exit 0
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index c89eab4..6d71f4d 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.2.5



