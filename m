Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0014E79AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 18:09:17 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id 134-v6so14907499itz.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 11:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7dHolaHftc8qbjyWG4Z5/B7QYfsvU77vyGxHPJ2qPfk=;
	b=d+/S4sAzsiS4qwL9/z1pCmWr7LRUy4yJAwTcrf7hZV4bIfQsWybHTtzXp8Cnl1Oegf
	6U7Mn3RweIgeXH8bVTWhrLmHLZg/gWOu5TskI/EFkQoU4rxKnbTA5DCi4eWr4eMUh8j8
	q/Il9MrFekqDkQup/V24kdLWKWKZj0a2+YnF+unlSmdzMqC+0yZODPxEZgAHKJT0bF4c
	F2tAE6QhUkHmnIQCQbrW1VtgKH2JMJN2WUSVNuSiY777PjQruiZZyRHvJwMuRViQNNjj
	XA5/p88z0aKHYx6BiL1A3lMlWodrEZtungPfMk5QGo875BDwb4yuh1a4M6uiUoxR0MtY
	b5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7dHolaHftc8qbjyWG4Z5/B7QYfsvU77vyGxHPJ2qPfk=;
	b=nkKv/jzYteBY4lWTAgdp94d6DwIFPZRjM+KRErNtfViRD3MrN8MUsf1X6IjShwgEBw
	JT5Y7ELAwU8APv/rA671EYjxe9yKW5mlpuxBjjvUeSmCU5NE/7OfC0wsmwBgTgaXxcki
	hAOSkt0PDueqML3+SbseFeQpzDoOOJGdSBXUYhS1a/qMbW1uEMTNIoboo/bSnSsqdxhf
	kAdfvZ3T4wPYtvNSZ0TaUPM2L6/aXVR++UkE2259ZkF1mF+3r0p9/skWwfyj3g1p8QI1
	tsOZ2y8r4hMyQgQePFV8dJH1oZV8hQCPyL+sfuC/M8fzHICK/iLOyBzyCsW0Z7i+04kK
	jhNQ==
X-Gm-Message-State: ABuFfohsG1y/8HTjOVtJrkyVdIxKd7BdO3Mx/WBhBy0pANjD/jaaz3lL
	A3/HS4z+7Vu9U8FP+POUffIQJs3X
X-Google-Smtp-Source: ACcGV63WwVH7v5w5hjw/cMSlvfAS0F2vmXL43bXwdFQ7z+vRWvmiLqWyVPByTPmkrHveLUSkRIsQbQ==
X-Received: by 2002:a24:78c8:: with SMTP id
	p191-v6mr2175227itc.129.1539281358801; 
	Thu, 11 Oct 2018 11:09:18 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	x21-v6sm10530386ita.6.2018.10.11.11.09.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Oct 2018 11:09:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 13:09:04 -0500
Message-Id: <20181011180904.20169-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] initscripts: read-only-rootfs-hook: Use overlay if available
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
X-List-Received-Date: Thu, 11 Oct 2018 18:09:18 -0000

Copying files from the read-only /var/lib to tmpfs can be slow and waste
memory. If the kernel supports the overlay file system, use it to mount
a writable tmpfs on top of the read-only /var/lib and avoid the file
copy.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index 1a0328d63e4..bd445ddb070 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -31,8 +31,13 @@ if [ "$1" = "start" ] ; then
 	if [ `is_on_read_only_partition /var/lib` = "yes" ]; then
 		grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
 		mkdir -p /var/volatile/lib
-		cp -a /var/lib/* /var/volatile/lib
-		mount --bind /var/volatile/lib /var/lib
+		mkdir -p /var/volatile/.lib-work
+		# Try to mount using overlay, which is much faster than copying
+		# files. If that fails, fallback to the slower copy
+		if ! mount -t overlay overlay -olowerdir=/var/lib,upperdir=/var/volatile/lib,workdir=/var/volatile/.lib-work /var/lib > /dev/null 2>&1; then
+			cp -a /var/lib/* /var/volatile/lib
+			mount --bind /var/volatile/lib /var/lib
+		fi
 	fi
 fi
 
-- 
2.17.1


