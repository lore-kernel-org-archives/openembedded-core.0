Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.32990.1585212873535323349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A1WjtSSH;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id w25so4040829wmi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iHGJzgcBDGgxc/10WS8s64OZ8XBVilIgJ4RaaQCjKLs=;
        b=A1WjtSSHO7tUgs7CWmPIgFHmUreUEGHCQfaDusV5lLSKK4NKL7dIlKezbtLGzoIOKA
         7H19H4o4QqD9HN36gkUZpZlJYUjRmzOsBpJp9em97PgfG7bART2j71/kXZud2eIpZbdY
         qbrG2bj+mBUeZEf3Nb75V2YPLlXrbGhEH8Yaemx5K0POO7x/nY57k8Vk+NDM7erqvfir
         CxBDM4ijnfviDlG+n6TTrAMhT+fXyoMlqQH3lcOdtNYj81mRRo+pYxmmFVVkvIH47+wN
         YN/Ar4tN2B8hmQfXz7/Elr1cxkyn8wiPpSEcHvBNShnJowlFauMPyF3YX9/UhmXxkHTs
         1W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iHGJzgcBDGgxc/10WS8s64OZ8XBVilIgJ4RaaQCjKLs=;
        b=Z2B9nEeX7u8hMxNYqYsGVfmxlEdi9iUQQg6ifdjGcUwQr2+AJxtHp6aBktTxGKOHew
         qaZ/DCZZ3exAaIMOIPMHiANHjEwJ4ppks69xtBOkrFG3VNILmpFdmPZoYLkne4DuzCka
         VLyctKhRTx/EEhmz9xO27WJ+YMEw5bRcR2NIukm5aCxq489MGSWkCpiXmJ/Z+uIPfX86
         qPg7lXkBcHk6eX+UrOSDe7Sxv+lGWN0jFAfr78AMTvGD+xUn5l7JfeXpiJ5HvdMg0wMy
         ExkduNMC5wXugrUdJyBvwFk4oWRZq5AhydQIzaX3AibsLnVNVOVkdS3N1IqqCkUtf9fB
         Zg/A==
X-Gm-Message-State: ANhLgQ2/YGvMRGnZaALHfGwAnvZb7/++K2PAlTb/z32oWdUStO8Hb+rS
	SCDBD8vGmRZFRsmdmEZ/KddWemHV
X-Google-Smtp-Source: ADFU+vtEjVfXxviymm4Mge03pCgEX6gHvMbm8N62Xy4ekmmTw4LORGcq8Tmp2jH7D6C3o2PouCK8Bg==
X-Received: by 2002:a1c:2c85:: with SMTP id s127mr2031229wms.18.1585212871900;
        Thu, 26 Mar 2020 01:54:31 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:31 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 02/13] systemd: Package udev rules explicitly
Date: Thu, 26 Mar 2020 08:54:15 +0000
Message-Id: <20200326085426.117209-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

udev is packaged before systemd so any wildcard inclusions in FILES will
override later specifics. List all udev rules explicitly so that the
systemd specific rules, packaged alongside systemd, appear in the
correct package.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index f0cf102dc250..809dbcb9a69b 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -599,7 +599,33 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/scsi_id \
                ${rootlibexecdir}/udev/v4l_id \
                ${rootlibexecdir}/udev/keymaps \
-               ${rootlibexecdir}/udev/rules.d/*.rules \
+               ${rootlibexecdir}/udev/rules.d/50-udev-default.rules \
+               ${rootlibexecdir}/udev/rules.d/60-autosuspend-chromiumos.rules \
+               ${rootlibexecdir}/udev/rules.d/60-block.rules \
+               ${rootlibexecdir}/udev/rules.d/60-cdrom_id.rules \
+               ${rootlibexecdir}/udev/rules.d/60-drm.rules \
+               ${rootlibexecdir}/udev/rules.d/60-evdev.rules \
+               ${rootlibexecdir}/udev/rules.d/60-fido-id.rules \
+               ${rootlibexecdir}/udev/rules.d/60-input-id.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
+               ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
+               ${rootlibexecdir}/udev/rules.d/60-serial.rules \
+               ${rootlibexecdir}/udev/rules.d/61-autosuspend-manual.rules \
+               ${rootlibexecdir}/udev/rules.d/64-btrfs.rules \
+               ${rootlibexecdir}/udev/rules.d/70-joystick.rules \
+               ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
+               ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
+               ${rootlibexecdir}/udev/rules.d/70-touchpad.rules \
+               ${rootlibexecdir}/udev/rules.d/75-net-description.rules \
+               ${rootlibexecdir}/udev/rules.d/75-probe_mtd.rules \
+               ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
+               ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
+               ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
+               ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_unitdir}/system/*udev* \
-- 
2.17.1

