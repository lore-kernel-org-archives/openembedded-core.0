Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 124C76A364
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 10:59:43 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id g10so5645449pdj.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=PSefQilRxC2X9JLd9D8l+Ote9E1EvevfxpXixHPiwnM=;
	b=oz0FUkohYw84Z/LaCbWDpK41w/8jdr5R998XfbjcNC1TTWUm3CJuUYLBEPGQwaeGes
	WyGF3uxzIzOmwpGwYvxrYXuQlfogR7utUfxfjnYCwvyyZqysYL6IPxEjw+iKUxRhRVaI
	MKeFYtMcCZvHx2M6Pj7u6lPhtPBC2HlLo1Yl3Tg85rVjwCS4B0oMCt8VDssXtRoVzB/S
	b8utYbBBnmlPw1hkiyUE2lhphp6ykKGpdFZLguTCbMht8qzKU2AU+8KqGBrhKJV6gt67
	x/tir8akaHvNOgqoLsxxQOOsL3tG9oXyicTZ07K5O09VDYCmhmhCcnrGMi7wrflp34EH
	UpTw==
X-Received: by 10.66.164.3 with SMTP id ym3mr25547375pab.106.1369565984437;
	Sun, 26 May 2013 03:59:44 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	yj2sm24006095pbb.40.2013.05.26.03.59.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 03:59:43 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 21:13:02 +1000
Message-Id: <1369566786-20341-3-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1369566786-20341-1-git-send-email-net147@gmail.com>
References: <1369566786-20341-1-git-send-email-net147@gmail.com>
Subject: [PATCH 2/6] systemd: do not create /var/volatile/run and /var/volatile/lock
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

The directories are not needed anymore.

Previously:
/var/run  -> /var/volatile/run
/var/lock -> /var/volatile/lock

Now:
/var/run  -> /run
/var/lock -> /run/lock

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 2 --
 meta/recipes-core/systemd/systemd/init                    | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index 6163a9c..9ffa88e 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -4,6 +4,4 @@
 
 
 d		/var/volatile/log		-	-	-	-
-d		/var/volatile/lock		-	-	-	-
-d		/var/volatile/run		-	-	-	-
 d		/var/volatile/tmp		-	-	-	-
diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/systemd/systemd/init
index ac56cca..a42e732 100644
--- a/meta/recipes-core/systemd/systemd/init
+++ b/meta/recipes-core/systemd/systemd/init
@@ -42,7 +42,6 @@ case "$1" in
     [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
     mount -a -t tmpfs 2>/dev/null
-    mkdir -p /var/volatile/run
     if [ ! -e /run ]; then
         ln -s /var/run /run
     fi
-- 
1.8.2.3


