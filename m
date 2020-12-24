Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.12173.1608823872316012055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 07:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VetdwwZ1;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id y5so2291141iow.5
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 07:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CsubklV1Rsb1ioBKYUIAfm5eORozomE2xYdTsU2jYa4=;
        b=VetdwwZ1Rc+KCZ6yWHpkPkXuvhnGMTQwPlHBmZ3YV5ql+U5tMMCfen9T7iz4+ToNmj
         0MptZdkJsJI7i5DbqWZmgbj1anP9HHfQ/y6svwhGaXImGZVqQHuqpQTaqAEhH/2wCanP
         xdVMjCaTh+e95FYWspzVosaLDJ+59jkh6jJ/aD/JewanttnzDtzhFIPBU5upO1kBoLld
         PXSwaIjvxcPlo+uj68sl8qi3suybjjQ7GFRlRulA6CpdhDm54mQKXOON+K4m+ukHwF6P
         Kqsqe2C3n4+gPVA82eO7S+ziPrsjDBeC7glCL5fW2AU1VfCWcTi9oMDOwbLGzF5GXNvq
         3T4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CsubklV1Rsb1ioBKYUIAfm5eORozomE2xYdTsU2jYa4=;
        b=ML9uQKAtBHliXruxVMH2zs5AZCSl33rPNiTPFde2hxfYNEKyDcWpxD0AQhhRMsEDsj
         B52Y3sGsW1SK9arE3xk9fWFu1HhwiQM/8GnU1BrG0LmrJoQk/lwMXue6Ul8tOz97occn
         zF+guUaraa6wSRTauXI9pn10DE3MVDSda2WbQ/R9+Lll+NqHJ74WWFSs6J9KWSuC4BCt
         DmXIOqvtYbV79+eGDqxgBCTRCqYTg2yJ4wOFHw56cTAYOF1jrwSTKwgdT7v/425ZNhVH
         cU1y9Zcvj3O+alXaw2RSuowB+/jtrSqPxx6YhNN+Uw33Tq0mo972ebv/1H+FI5jJXOMt
         8UEQ==
X-Gm-Message-State: AOAM531tjq4hLt4palbhDI4tnJ00//TCM29SRPL5aruY6Y/V2tBqE7Lk
	SoVad+eVs0y9HUAGEj4MFqa+1PntcPGRSg==
X-Google-Smtp-Source: ABdhPJwXf770apkH+Nz0b0hu9opkZGR1UrTF7ZyVNDQ+FjMLqqf8HfNqacAvPV6TgPfgDhtmjaKyEA==
X-Received: by 2002:a02:cba7:: with SMTP id v7mr26674254jap.133.1608823871340;
        Thu, 24 Dec 2020 07:31:11 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id f6sm26448064ioh.2.2020.12.24.07.31.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 07:31:10 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][PATCH 2/3] psplash: fix working on first boot (sysvinit)
Date: Thu, 24 Dec 2020 10:31:04 -0500
Message-Id: <20201224153105.21211-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
In-Reply-To: <20201224153105.21211-1-twoerner@gmail.com>
References: <20201224153105.21211-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The psplash program has a mechanism for showing updates graphically in the
form of a progress bar. The program is told when and how much to fill the
progress bar via text messages sent through a fifo. If the fifo doesn't exist
when the psplash program starts, it tries to create it. If the fifo doesn't
exist or can't be created, the psplash program will refuse to run.

In various circumstances when a system is booted for the very first time,
the filesystem is mounted, initially, read-only. As a result the psplash
program is not able to run. On systems where the root filesystem is not
meant to be read-only, it will eventually be mounted read-write. Therefore the
psplash program can run on shutdown, and all subsequent boots. Only the first
boot is affected.

If a fifo is created and included in the filesystem as part of the recipe,
then filesystems that are meant to be read-only will have psplash work, as
well as the cases where (on first boot) a read-write filesystem is initially
mounted read-only.

NOTE: this is only an issue with sysvinit, and non-qemu machines.
systemd-based systems don't suffer from this first-boot issue, and neither
do the qemu machines.

NOTE 2: when psplash is done, it removes the fifo. Therefore the fifo used
for communicating with psplash doesn't hang around unnecessarily in the
filesystem.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/psplash/psplash_git.bb        | 8 +++++++-
 meta/recipes-core/sysvinit/sysvinit/rc          | 1 -
 meta/recipes-core/sysvinit/sysvinit/rcS-default | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 44f0007daf..0a19a664c0 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
 SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
-DEPENDS = "gdk-pixbuf-native"
+DEPENDS = "gdk-pixbuf-native coreutils-native"
 
 SRCREV = "0a902f7cd875ccf018456451be369f05fa55f962"
 PV = "0.1+git${SRCPV}"
@@ -102,6 +102,10 @@ do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
 		install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
+
+		# make fifo for psplash
+		install -d ${D}/mnt
+		mkfifo ${D}/mnt/psplash_fifo
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
@@ -122,3 +126,5 @@ SYSTEMD_SERVICE_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'pspl
 
 INITSCRIPT_NAME = "psplash.sh"
 INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
+
+FILES_${PN} += "/mnt"
diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index c9f6558115..8e76f987c1 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -175,6 +175,5 @@ startup() {
 if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; then
     if type psplash-write >/dev/null 2>&1; then
         psplash-write "QUIT" || true
-    	umount -l /mnt/.psplash
     fi
 fi
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index c576ff0678..76af22b359 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -31,4 +31,4 @@ ROOTFS_READ_ONLY=no
 # need to have specific behavior depending on init system
 INIT_SYSTEM=sysvinit
 # set the psplash fifo directory
-PSPLASH_FIFO_DIR=/mnt/.psplash
+PSPLASH_FIFO_DIR=/mnt
-- 
2.30.0.rc0

