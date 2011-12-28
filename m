Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rfzin-0007l1-DN
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:33 +0100
Received: by mail-gy0-f175.google.com with SMTP id r17so5465014ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ZIBEHwoszrutgyP5SLqGdIjrNGd/+FUDzTISBL+rS3c=;
	b=VGN7S4N+SG2KiEKkRvfKQXeEFDktLhOYsrujP6Ht1MTjAlz45+ZMVzRotkrXEsI2T+
	YztUAUjJlf6ECJbwWxZmAEeCLAguZd3rXKrHQS4tIY+XM9gZsPFRB8MzEHRAaOR9S17D
	knH5SXZ6mLZdkCujFabHWhLo/O8SSqiTemJDw=
Received: by 10.236.185.8 with SMTP id t8mr5283911yhm.30.1325102180057;
	Wed, 28 Dec 2011 11:56:20 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.56.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:56:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:32 +0000
Message-Id: <595333f997b8f8f2ecfbb361ad8a7ccfb33a993e.1325101674.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 11/16] udev: ensure /dev/pts and /dev/shm does exists
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:34 -0000

---
 meta/recipes-core/udev/udev/init |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index d0d7e5d..c2b491e 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -30,9 +30,10 @@ echo -n "Starting udev"
 # mount the tmpfs on /dev, if not already done
 LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
 	mount -n -o mode=0755 -t tmpfs none "/dev"
-	mkdir -m 0755 /dev/pts
-	mkdir -m 1777 /dev/shm
 }
+mkdir -p -m 0755 /dev/pts
+mkdir -p -m 1777 /dev/shm
+
 
 if [ -e /etc/dev.tar ]; then
 	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
-- 
1.7.2.5



