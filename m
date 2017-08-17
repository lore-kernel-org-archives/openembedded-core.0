Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4C0783FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 05:43:26 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id v189so35616870pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 22:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Q0ODo4nfc0AnByn4ODBEdAfiUrW3Z3bIjKI07EASHqI=;
	b=WdFKREXfRwKOIHfz55i1wDAANUY835mXDZzMu6txGjnMC3IdkhrZDo7P84+Th5Vswc
	5yPXY79kAzA092oJHx1wrMOJQJUbN/R3Bm5eG4rne5RwU6cIe483EEF12m/r3U88t9ZR
	qEFJK/FTkUtOupxtYBgJe13s9M4jxe6827p/YevUR9IZsbhCMLXA8U6o8frclNnLfCEI
	5tqmYxfFVUjk/WKvw2tRBVga3brGvRZzKgKLh1Czsa2YQ8D0VtfFb3N5XT0xyYQvnMo0
	+6qRumTv4NOoBBRmGSzRJ8zASMgWxWxWoEXbBv2xEHmyRmv/LbmdiA4jiyOToSLQ5hL9
	wj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q0ODo4nfc0AnByn4ODBEdAfiUrW3Z3bIjKI07EASHqI=;
	b=AiXcFPbe6ewdTKJEpNN3tggnoVAYwkPLK7aVpgIfaw41BLcIFrKIQM3a+6UWRM4lBj
	ixK5kbgJNYBluOXL9zLNp+C8YnOq3UOW6wmgm6GgWdJqDW7ynz8mnE/j3rZ482ffClHj
	GdZtZlJPcSbmzB0h3KErtSnSpfb33BJEhmc/5k/JfVSB/dN/Ja/r12KuLvGgCLmLhTOl
	IUvceDdMC6fxqXPtxvonyRQD2Gkyxeb/TWeAXIwrmpgPO2cUxjGsGCY+20pBvpytgYMr
	H3Nk2S9obuAqzTBZBYIMya1RvA9V+zAzsM6U2iqlJyu29HpESmAD0F6oCXs0yL3ZpNcF
	U9vQ==
X-Gm-Message-State: AHYfb5j/3ZT7jdJuvTkE9oP6MkwJk5d2lIHWMZZR6EJ0CA7f0rMgFmnm
	EDHWeOhOXKZigpNX
X-Received: by 10.98.245.20 with SMTP id n20mr4019097pfh.46.1502948607655;
	Wed, 16 Aug 2017 22:43:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	v11sm6355263pfl.101.2017.08.16.22.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Aug 2017 22:43:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 22:43:17 -0700
Message-Id: <20170817054317.25113-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH V2] rootfs-postcommands.bbclass: Filter out dangling symlinks in ssh_allow_empty_password()
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
X-List-Received-Date: Thu, 17 Aug 2017 05:43:26 -0000

In images built with pam in DISTRO_FEATURES, we end up with dangling symlinks
if su is not packaged into image

$ ls /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-image-minimal/1.0-r0/rootfs/etc/pam.d/su-l -l
lrwxrwxrwx 1 kraj users 2 Aug  9 07:56 /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-image-minimal/1.0-r0/rootfs/etc/pam.d/su-l -> su

This causes image do_rootfs to fail

| sed: can't read /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-image-minimal/1.0-r0/rootfs/etc/pam.d/s
u-l: No such file or directory
| WARNING: /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-image-minimal/1.0-r0/temp/run.ssh_allow_empty_
password.19238:1 exit 2 from 'sed -i 's/nullok_secure/nullok/' /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi
/core-image-minimal/1.0-r0/rootfs/etc/pam.d/*'

Therefore we need to filter out dangling symlinks before sed'ing
things out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 78f7c55933..576e4733eb 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -158,7 +158,10 @@ ssh_allow_empty_password () {
 	fi
 
 	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/pam.d ] ; then
-		sed -i 's/nullok_secure/nullok/' ${IMAGE_ROOTFS}${sysconfdir}/pam.d/*
+		for f in `find ${IMAGE_ROOTFS}${sysconfdir}/pam.d/* -type f -exec test -e {} \; -print`
+		do
+			sed -i 's/nullok_secure/nullok/' $f
+		done
 	fi
 }
 
-- 
2.14.1


