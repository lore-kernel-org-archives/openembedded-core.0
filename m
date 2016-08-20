Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 631AD731C4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 20:36:13 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id vy10so5378116pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 13:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z1JOABvy4KHzMxGRKBip2Er4mnnBlOx9noU42SbMFPY=;
	b=okKrn9JcB2NoAXrEZ5AA6LwEw0AVT9+PiPPVOaBZ/hsufHvmVwxTfTDbWWBB+NLGzg
	IO3uI1nn+DhatJRu5quALAi5gi3D3FHtg5mBSbkixAAeA9Ub+vDK87IbFCSIds0ATYds
	BukCLh+6Iq5AETE59mvswHNUffYGUhrzJD9D/dGGB2axXflWjUUDhRS1/d9GGT4sU4PX
	B9slN/Gx3qqmogCyH5PurQO7EL0RWkyAK7V+0LBX23/vyGd4A/zhqQSWahxMvaljkxTK
	jOGFBXhtNxHborUPet0m5wRalwDMyy3AEYW8UH9b+Y+XkMMhQKUGv8uG/sFRSObQvW8K
	HYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z1JOABvy4KHzMxGRKBip2Er4mnnBlOx9noU42SbMFPY=;
	b=YVFE/8GLj6YghJkvpd1PnB0Cv2K9AUuf+TC6M0K5nNCGCJCZchzwtC2ZATusnBRFle
	rGlafDVECHjZYL9NuYBev+ZXjhzCyLtUlf8SHChgfEWAwRUd+sRBUI+xGjkfRanSShYE
	LenRGG/w6EtGGjyMAtomO2CXjk1RHZlPKent+x2nMnbIomHesaehtvcQ+l1Ovmu46hYR
	AoxzyH19G+gmTJpLScBsqp7XEfyHFb3Iiz0ACV1vXmc0PpsREqwYusclDZg3C00S3f5g
	oJjV9QKfOMY0xJF9Z7TyheTvtnAGUzuyolYBd3uEUwCwX04XPQ/pkf2jUjUby2mBC4S8
	AtKA==
X-Gm-Message-State: AEkoous27qZlvMPBzyupYtVEDYtriUoSsotZ7gnW1y/slIY6ZIZZLPgdGEAdqE+bf+LDTQ==
X-Received: by 10.66.86.170 with SMTP id q10mr26554715paz.105.1471725374816;
	Sat, 20 Aug 2016 13:36:14 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	g13sm16047711pfb.7.2016.08.20.13.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Aug 2016 13:36:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2016 13:36:09 -0700
Message-Id: <20160820203609.5599-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH V2] xserver-xf86-config: pre-load int10 and exa modules
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
X-List-Received-Date: Sat, 20 Aug 2016 20:36:14 -0000

musl doesn't like lazy loading that xorg uses, therefore
load the needed modules explicitly

[YOCTO #10169]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemux86-64.conf                                    | 5 ++++-
 meta/conf/machine/qemux86.conf                                       | 5 ++++-
 .../xorg-xserver/xserver-xf86-config/10-preload-modules.conf         | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 489194a..ac2c039 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -22,7 +22,10 @@ XSERVER = "xserver-xorg \
            xf86-input-evdev \
            xf86-video-cirrus \
            xf86-video-fbdev \
-           xf86-video-vmware"
+           xf86-video-vmware \
+           xf86-video-modesetting \
+           xserver-xorg-module-libint10 \
+           "
 
 MACHINE_FEATURES += "x86"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 3cc8091..5d22e52 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -21,7 +21,10 @@ XSERVER = "xserver-xorg \
            xf86-input-evdev \
            xf86-video-cirrus \
            xf86-video-fbdev \
-           xf86-video-vmware"
+           xf86-video-vmware \
+           xf86-video-modesetting \
+           xserver-xorg-module-libint10 \
+           "
 
 MACHINE_FEATURES += "x86"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
index 7ceb6fd..72e4fbf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
@@ -3,7 +3,7 @@ Section "Module"
     Load "fb"
     Load "shadow"
     Load "shadowfb"
+    Load "int10"
     Load "vbe"
     Load "vgahw"
 EndSection
-
-- 
2.9.3


