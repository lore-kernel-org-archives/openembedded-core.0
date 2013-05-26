Return-Path: <net147@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 66E0C6A49C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 10:59:49 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so5826327pbb.19
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8mUkjqQeEWFrJjc5DGjdy85j+10s/LKR42LDWap03mY=;
	b=da9lBPdS2FL2bMOujiNvxR1/CcFT3rpw3DDK56YLBMwLptRuPgQza9UBg2NpJU5/WV
	VwgZA+oBz2WtcsVdDKhL9eqFkvRVnFz+0yv7EgNSasZprPQqUAWQAHC0vurC/3uhmaxA
	rL6kZbXuZrtpSzh48OluXMRGgVls/aiwmXMgrwjPG0r5X7ErTD1Ph/VdcvUgyB5v8tum
	KRRINCBbThqcEqoY1ZEXBLpJSeCc6GGcpOXhepYg3Hkc3sA8VmpvLhyr42e1Cvu4hJ60
	ikVcbgvedshBx3937Q+LxwRF6ElPOcgmHz1+LqUqSXxuZwx5eDVNUblb6Ajy9iBu2KI4
	QeUA==
X-Received: by 10.66.13.169 with SMTP id i9mr15645041pac.212.1369565990783;
	Sun, 26 May 2013 03:59:50 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id w8sm24059682pbo.9.2013.05.26.03.59.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 03:59:49 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 21:13:05 +1000
Message-Id: <1369566786-20341-6-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1369566786-20341-1-git-send-email-net147@gmail.com>
References: <1369566786-20341-1-git-send-email-net147@gmail.com>
Subject: [PATCH 5/6] udev: do not create /var/volatile/run in init script
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
X-List-Received-Date: Sun, 26 May 2013 10:59:49 -0000

Previously in udev init, /var/volatile/run had to be created after
mounting all tmpfs filesystems so that udevd can write to /var/run
(a symbolic link to /var/volatile/run). This is because udev is
started before populate-volatile.sh.

Now that /var/run is a symbolic link to /run (a tmpfs filesystem),
/var/volatile/run doesn't need to be created anymore.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/udev/udev/init | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index cd87f50..95f9c03 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -50,7 +50,6 @@ case "$1" in
     [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
     mount -a -t tmpfs 2>/dev/null
-    mkdir -p /var/volatile/run
     mkdir -p /var/volatile/tmp
 
     # cache handling
-- 
1.8.2.3


