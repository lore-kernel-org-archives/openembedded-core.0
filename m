Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2BD7C322
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 07:24:47 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v5so13819152lfe.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 23:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vHOSnfs1J8Dz1l6Wu5yYqzohBL+ZILU0kDNZxhm/a7A=;
	b=iDUgzum9Bqt9Q4CYWRGtBKnvuZECslGDsOOQ2prHGPx7SKjhf16j70U5nuXsfzfYZg
	fyMgCCQsUlbr+rKklJryJVuG4WMRWnaUmv3u2FAofW5j9g7ImiYf7MqwbKgp5W1DjQt3
	563uNc6W6nQ8ddIuWYUkIyR41Y8R++qXJCDwxw7NohYUdPEMhOVIWWb1LdGK4gtr0o3P
	vIvDymQO5UUbrWC4fbr20YUaxftF2GgKARENK8lX6mxHXRoCIaN0M1hPtLnu+Vgr2NXu
	i6TCPcDDVtJeG9CNThvtLuzs21QTnLauhM21Ra5O6yztdiPkVaxZLXRGrXllIkdvFzd7
	gQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vHOSnfs1J8Dz1l6Wu5yYqzohBL+ZILU0kDNZxhm/a7A=;
	b=mb64oiZ6TSKZgnRDZE0Uxnmc7JE+6che49A1qr5zZFgOMY6AwnuqxLoat1pNOq57s/
	SQG6qR+ntmYgf4+Y5BDZaD3GgzdLJOJgTpcFW6v6CxqzlMV10uoD+nH7s1kTjp2tDU2N
	bPPUxXqGEnJwrJVr5YeO1zLWBXYR0ARvq4xeNLfHUgt34y0KMpmjZHmhOK/HwAlmo51A
	MR+Uv3TX0bmNfnrU5lZk0fF5CvnZmWZtLwhRrwSg04I2ABLNY15BZG0YVgxvuOg79rlD
	FSNitd0sMIDM64GsE/WLrMqBLSINkWIeuv+ZfMLka9oJmoWcMg0LtwyQUayXOpa0sFZf
	UqzQ==
X-Gm-Message-State: AJcUukeNoMo55Vl0ngK5endiXTFeLROIPHtjSoz8b+hOlTcg2g//Onq8
	QO0sG9qxQ8htMkZABCaY+2MhzFdUZ08=
X-Google-Smtp-Source: ALg8bN4gUc6esALUhWzm92R/2sub4dlkQxM9O1ZAczMhaKDqfURaG2BzLhGSOBUjuQafUz7p3axMsw==
X-Received: by 2002:a19:9508:: with SMTP id x8mr18830469lfd.112.1548746688360; 
	Mon, 28 Jan 2019 23:24:48 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	u26-v6sm3356434lji.22.2019.01.28.23.24.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 23:24:47 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 08:24:41 +0100
Message-Id: <20190129072442.32343-3-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129072442.32343-1-jonas@norrbonn.se>
References: <20190129072442.32343-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH 3/4] base-files: filesystems serves no real purpose
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
X-List-Received-Date: Tue, 29 Jan 2019 07:24:48 -0000
Content-Transfer-Encoding: 8bit

mount can generally figure out the filesystem type from the superblock;
otherwise, /proc/filesystems is a more correct fallback than
/etc/filesystems and presumably always available.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 meta/recipes-core/base-files/base-files/filesystems | 8 --------
 meta/recipes-core/base-files/base-files_3.0.14.bb   | 2 --
 2 files changed, 10 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/filesystems

diff --git a/meta/recipes-core/base-files/base-files/filesystems b/meta/recipes-core/base-files/base-files/filesystems
deleted file mode 100644
index 7e6c41c38f..0000000000
--- a/meta/recipes-core/base-files/base-files/filesystems
+++ /dev/null
@@ -1,8 +0,0 @@
-ext4
-ext3
-ext2
-vfat
-fat
-btrfs
-minix
-*
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index f42a4ef7c4..a1639db830 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -18,7 +18,6 @@ SRC_URI = "file://rotation \
            file://profile \
            file://shells \
            file://fstab \
-           file://filesystems \
            file://issue.net \
            file://issue \
            file://usbd \
@@ -123,7 +122,6 @@ do_install () {
 	fi
 
 	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
-	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
 	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
 	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
 	sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
-- 
2.19.1


