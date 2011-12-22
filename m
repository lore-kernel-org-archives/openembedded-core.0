Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rdi73-000233-Hg
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:51:09 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so4959318yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 04:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=mfojxmInT0LIn5kXgrgMQacwed/Dh2WWkt822Xvy48I=;
	b=f79a4qrwRq/CrzPA28L+B0hEGLSMWBodcQ2ZxrHc6tgbBikZf1Y3Xft+DzvmHDcjnu
	X4R5fnd7c16XZlMpPjAS1y3RsKV1qY6iBoYmoxPNnqBtw1bK3omdVJPkgb3Sidb5JmyZ
	zOODl7lAoVPFxLHsOCf/CZSNDSK3/Ynk9r1Ak=
Received: by 10.236.78.6 with SMTP id f6mr14911997yhe.109.1324557845159;
	Thu, 22 Dec 2011 04:44:05 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i32sm23456497anm.6.2011.12.22.04.44.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 04:44:03 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 12:43:28 +0000
Message-Id: <202dd8f1a99c360bc88bd540c89d33185ec0346b.1324557763.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
Subject: [PATCH v2 8/9] udev: run depmod if modules.dep doesn't exist
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
X-List-Received-Date: Thu, 22 Dec 2011 12:51:09 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev/init   |    5 +++++
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index e053017..9b9e74d 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -51,6 +51,11 @@ if [ "$DEVCACHE" != "" ]; then
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



