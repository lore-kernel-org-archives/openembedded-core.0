Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rd56W-0005Cd-W2
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 20:12:01 +0100
Received: by mail-yw0-f47.google.com with SMTP id o47so4599160yho.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 11:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=QxQiktrj2Yl2+Vb6yTs8bXmZ7/5HrcB2ma+uLG+mRl0=;
	b=egyN5fqTo97pJIj+U0GmB+0zBhZjt+sgLBjfh8+bEsjE0uEnFlj1W9F+VtIT1dH3YV
	jiGPQZiIesNXB9ZaBHFCXlMl8BKI09NFAGyGvtwZnxAzHo0tvPvtA1HaqPybgq1tJURY
	Xv7yp0qMXHuMoar/tmo2GHYkmo3ZjRagD2Nw8=
Received: by 10.236.124.15 with SMTP id w15mr5865930yhh.120.1324407899007;
	Tue, 20 Dec 2011 11:04:59 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o50sm4771379yhl.9.2011.12.20.11.04.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 11:04:57 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2011 19:04:14 +0000
Message-Id: <c5a8e20c987231c95d948c1ac73f72d287ad2a8d.1324407759.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324407759.git.otavio@ossystems.com.br>
References: <cover.1324407759.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324407759.git.otavio@ossystems.com.br>
References: <cover.1324407759.git.otavio@ossystems.com.br>
Subject: [PATCH 8/9] udev: run depmod if modules.dep doesn't exist
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
X-List-Received-Date: Tue, 20 Dec 2011 19:12:01 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev/init   |    5 +++++
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 7bc6488..511031c 100644
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



