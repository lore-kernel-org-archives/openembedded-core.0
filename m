Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 88D8F6AF4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 06:28:08 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id lj1so2818506pab.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 23:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=zoItj3Vi/2AAqLWgj8wTkNftftsrvvBNQFI+QeyHoSA=;
	b=D1Gg6eWmJs3Dq92yeijKiIES6SEXVy4c9reYVFVSAiQGi74W2Z2yav0XSt8ZdmFQsl
	/v4NcoUxjSDPdP5zi8nhnd9sddq/meo8GL+9/zZSr6l3vuGGMBNV/7xLJ/WC5Tlu/cd4
	72xhEwtMiEGyr9E0QcBkHw3B2pZ4oiF8Ti/hO5deIIj0aFJm5SiZheb0Hyal1x4SMjTw
	1PadzZc92axdP9LvrYjVP4Ja9VNrCg3yyrWbI/4AWcXEvIiBNBOG2lb2fkVvuDyCVQAi
	GKcsqhrxlUL86cquJdSYtvXNljccvwz2kkD/5Kd+fxjdskQzfpg71E22051blop+R+M2
	U+cg==
X-Received: by 10.68.164.225 with SMTP id yt1mr10220418pbb.195.1374128888927; 
	Wed, 17 Jul 2013 23:28:08 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	bs3sm11791044pbc.42.2013.07.17.23.28.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Jul 2013 23:28:08 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 16:43:45 +1000
Message-Id: <1374129825-8580-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] systemd: remove unneeded modprobe.rules
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
X-List-Received-Date: Thu, 18 Jul 2013 06:28:08 -0000

systemd already handles loading kernel modules for new hardware.
This also allows blacklisting modules to work properly when creating
a .conf file in /etc/modprobe.d containing "blacklist module_name".

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd/modprobe.rules | 17 -----------------
 meta/recipes-core/systemd/systemd_204.bb         |  1 -
 2 files changed, 18 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules

diff --git a/meta/recipes-core/systemd/systemd/modprobe.rules b/meta/recipes-core/systemd/systemd/modprobe.rules
deleted file mode 100644
index d4a096b..0000000
--- a/meta/recipes-core/systemd/systemd/modprobe.rules
+++ /dev/null
@@ -1,17 +0,0 @@
-# There are a number of modifiers that are allowed to be used in some
-# of the different fields. They provide the following subsitutions:
-#
-# %n the "kernel number" of the device.
-#    For example, 'sda3' has a "kernel number" of '3'
-# %e the smallest number for that name which does not matches an existing node
-# %k the kernel name for the device
-# %M the kernel major number for the device
-# %m the kernel minor number for the device
-# %b the bus id for the device
-# %c the string returned by the PROGRAM
-# %s{filename} the content of a sysfs attribute
-# %% the '%' char itself
-#
-
-# Try and modprobe for drivers for new hardware
-ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_204.bb
index b8b1290..6261367 100644
--- a/meta/recipes-core/systemd/systemd_204.bb
+++ b/meta/recipes-core/systemd/systemd_204.bb
@@ -19,7 +19,6 @@ inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-altern
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://touchscreen.rules \
-           file://modprobe.rules \
            ${UCLIBCPATCHES} \
            file://0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch \
            file://install-quotaon-once.patch \
-- 
1.8.3.2


