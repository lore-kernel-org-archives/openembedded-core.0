Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.17499.1585329928073491184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OV8Rt9E2;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id w10so12403991wrm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fGGuEF9EOKWsIgsrRe2AP3N3H2MGo/hwbcA4cql9ShU=;
        b=OV8Rt9E2MK7hh5iwPR+um3toidRIa/2kuuEPYs8ZMgsPWgDk5PiPOFhttvWkQsFOGV
         TIb5qbRdFdl33YSN4hCzYHFSVQAeyvSJVUV1FOXRmxFtaYFi07i/qrnrapKCAU71uIPi
         Z8Po6RKRKHfrJx/gzoGaPCH14i3fmNpmRIOUh8STX64ZlHbY0KEi0tzh/UJectOzXHKe
         kjyKcLKd7GjtieVtrxQWw5w8Zhf0Oe+cl0QNKbGWIJjoH3FXUDEhi6Ab+x1ylEV3hCKl
         Dc9wC+cb68JKxiUFq/Xk0yrNg05cdpvkOXTkG29rZvufBmQlY1W50SfqxqAY/Rc41sa8
         WOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fGGuEF9EOKWsIgsrRe2AP3N3H2MGo/hwbcA4cql9ShU=;
        b=JGO2vyiIYC6Bff+En0utLj8510ookcoOWiwSQgIZS37+PBxOlO6UeQsRu7Wzmyj+oL
         nkUX/7q/xsb/1Oc6iVOprk+jJhLyrSAPKO+GxSV1eopgLfz4RMAMqv9C/pMAR9rlJamW
         L1sVq23/AIjrNb4ewVl+iWnjW1stN6TwbdiZCdoiWr7etCBwFI5o2ARzKWKsNmm71bh8
         FystwcIuyzcamv3a88sNLhtrZwARFdQuK1HkZKqbXQwhXxAnzOdvQovXxktUXvfy20yL
         KfautSklo0SIcWimKMyPqVIUxzXVcqjVxWDWUVkgc1pXphqKyfiibrQQHPkOSeAvYsIZ
         DTVw==
X-Gm-Message-State: ANhLgQ3IyOzx+kk6UNBMzqajxYH66wU8oLtwAffZ2K+WYHZ3fjV4UHPQ
	ZmonDPw/V55mi+OgKu5fwMQaQQ7H
X-Google-Smtp-Source: ADFU+vvL/BewV5UJQU2cItPM/7SlB78mFDHcS4M3CkfCeKAx3l5ZiGvf+3UQOfnd7Q5RvpdcLO0HTg==
X-Received: by 2002:adf:dfce:: with SMTP id q14mr501076wrn.326.1585329926427;
        Fri, 27 Mar 2020 10:25:26 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:25 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 02/13] systemd: Package udev rules explicitly
Date: Fri, 27 Mar 2020 17:25:09 +0000
Message-Id: <20200327172520.62888-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

udev is packaged before systemd so any wildcard inclusions in FILES will
override later specifics. List all udev rules explicitly so that the
systemd specific rules, packaged alongside systemd, appear in the
correct package.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3: None
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

