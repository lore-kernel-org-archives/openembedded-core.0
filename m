Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rfzit-0007mv-Us
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:40 +0100
Received: by mail-gy0-f175.google.com with SMTP id r17so5465068ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=DjSNBc1qI5hJBtM+TQU7tLHCi8SlAgVr7Vsr1riP9Kc=;
	b=x+Df73shQrE9nkcWCvO50anFpxFFLadO5E4/ywfgLsIfUPIE/cQ2qSWWh3kifSe/Q/
	mb8W53znKElc9rVSMsBYZZ9ozphFXH5b1nTN/Cv078IXQeuZ0pQJ/Q1Me+znMnTEL8H+
	xUSjJ2szH+YSi3WJ7TTMYo/2q6xN9PdGN0+O8=
Received: by 10.236.123.108 with SMTP id u72mr44309119yhh.45.1325102188114;
	Wed, 28 Dec 2011 11:56:28 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.56.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:56:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:35 +0000
Message-Id: <a4ffb960e298bf423adcda013c5b58c1db2f6b48.1325101675.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 14/16] udev: run depmod if modules.dep doesn't exist
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:40 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev/init   |    5 +++++
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 322e7e7..8d89d51 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -52,6 +52,11 @@ if [ "$DEVCACHE" != "" ]; then
 	fi
 fi
 
+if [ -x /sbin/depmod ] && [ ! -e "/lib/modules/$(uname -r)"/modules.dep ]; then
+	mkdir -p /lib/modules/$(uname -r)
+	depmod -ae
+fi
+
 # make_extra_nodes
 kill_udevd > "/dev/null" 2>&1
 
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 6d71f4d..b993a13 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.2.5



