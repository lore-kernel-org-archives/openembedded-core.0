Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.11820.1608743194982966563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 09:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iDXhqWp6;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id z3so11687569qtw.9
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 09:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2CtbfcHFTKY4qVFdd5NabTqdiKij2dd2j1xjZOTf5QI=;
        b=iDXhqWp60uVCAn0MS8/maxBBgT9cZZfTX8OpCkcPTdymSW3EqETH1dEW3M1ipd9hod
         8bUYoIVporAwY1rV+BPp5gy08WdLY1g3huw6RKZAIoKp5bXPwU35LkiHD3tp0xFBtKZN
         SAFjRV5YgpgAsoHO0hRu8ZPhuU6zg6f8sfTkG93vlWm7SvzVzXy9Q7wSUFdX6gWgs/FQ
         rjgj2u3Eq8w9iBc4SRn/ZMrlJPvSQXEgdbbO4+WmmWxjFmeOyqNxp6qD2wQrwEIdvoCt
         am4wKZYt/9YOAlqoa9Pu/qmEubTOIEPWocXey0b0dgch8oYqGNTw0ZjK/dqg+vFoEZAq
         Rikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2CtbfcHFTKY4qVFdd5NabTqdiKij2dd2j1xjZOTf5QI=;
        b=FKVtB0+CZT10joleImLbEsAlHEoMyrsZEoL8G3qLfN2piIJMQKc++QTf6L9cIoNqfz
         ph7doCkxcnmc5Yibb0kTs62l+lBrD0wzA+apuEBu/yKGf3h+OGnqQ/2RrYPQ24iVcSJP
         cZgv7ogz69NnY7w5wcEHSDgp+qMMWOlyap5Vda+v86gaDbVR+j1ZzJgFzBnzn46ovZJC
         sH4pLmBfh4BZAJ0sQA3K9SmPpgH0YlIQrbXFBXH6BtxrsvUajookhjFm9WBPrnwBDFqZ
         N2tinNTYSE4Max7WY+vVXMGl7ZzdcOC3JW3OLvzF/ESZJ8TdHrHR5yayYPnhck9sWmIz
         xW7w==
X-Gm-Message-State: AOAM531i7g0SFSmhQFVF2DLuTT2vSkDktOfjHAJK1mV3L6Ti3mJ1F+6f
	Xz6mEXvwTzb7n4Mrgo96sPv8v9lA/0pGXQ==
X-Google-Smtp-Source: ABdhPJxoySv5YOcGlsQ7QODXkcbqEXKzC0516YkewiruWW8iCXOltougbVEsg4obShaLBln+vj0ooQ==
X-Received: by 2002:ac8:5ccc:: with SMTP id s12mr26376581qta.309.1608743193743;
        Wed, 23 Dec 2020 09:06:33 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id r8sm15172613qtj.94.2020.12.23.09.06.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 09:06:32 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][PATCH 2/3] psplash: work on first boot (sysvinit)
Date: Wed, 23 Dec 2020 12:06:20 -0500
Message-Id: <20201223170621.35727-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
In-Reply-To: <20201223170621.35727-1-twoerner@gmail.com>
References: <20201223170621.35727-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The psplash program has a mechanism for showing progress/updates. This
is done via a pipe. On images that are R/O or images that are assembled
via wic, the pipe is being setup in a location that is R/O on first boot,
therefore the pipe can not be created. If the psplash program is not able
to create the pipe, the app will not run. This situation is "fixed" on
non-R/O images when the first bootup is complete. Therefore the psplash
program is able to run for the first shutdown, and all subsequent bootups
and shutdowns as well, but not on the very first boot.

If the directory in which the psplash pipe is to be created already exists in
the filesystem and that location is not R/O on first boot, then the psplash
program can run on first boot (and subsequent boots and shutdowns).

NOTE: this is only an issue with sysvinit and most non-qemu machines. A
systemd image, and images run on qemu machines, are able to run psplash on
the first and subsequent boots.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/psplash/psplash_git.bb        | 3 +++
 meta/recipes-core/sysvinit/sysvinit/rc          | 1 +
 meta/recipes-core/sysvinit/sysvinit/rcS-default | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 44f0007daf..d70a8aa34e 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -102,6 +102,7 @@ do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
 		install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
+		install -d ${D}/.psplash
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
@@ -122,3 +123,5 @@ SYSTEMD_SERVICE_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'pspl
 
 INITSCRIPT_NAME = "psplash.sh"
 INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
+
+FILES_${PN} += "/.psplash"
diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 1c956a3a56..61946e56eb 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -177,5 +177,6 @@ if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; th
     if type psplash-write >/dev/null 2>&1; then
         psplash-write "QUIT" || true
         umount -l $PSPLASH_FIFO_DIR
+        rmdir $PSPLASH_FIFO_DIR
     fi
 fi
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index 70ab25710e..4330cb853e 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -31,4 +31,4 @@ ROOTFS_READ_ONLY=no
 # need to have specific behavior depending on init system
 INIT_SYSTEM=sysvinit
 # set psplash fifo directory
-PSPLASH_FIFO_DIR=/mnt/.psplash
+PSPLASH_FIFO_DIR=/.psplash
-- 
2.30.0.rc0

