Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.12145.1608823871208457204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 07:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sm31kmDC;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id w17so2249949ilj.8
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 07:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dgolytvhzkG3EP27R4dhTKfwQaIXEVUR+eVplefJRy4=;
        b=sm31kmDCocbkYq6gviWgfJOuA8vz1jczZuMAKMO2VsJMDrxapOqcNbRBA9HK/ISex3
         p8pxSYMg7EMBuzX0RJ3nIl1tcrGhO8cVmYc/IFqqXnbpK+VLhTjTsXbT41bzLJY0QGzp
         7E10N0APujoAsutwcgNmVZj43oiQ9xXdObo5i703dLopCEtHy8ELeHTfkyZWPmMPEPBe
         CkIlHGkG9ahpUyAmKhWWDgbgimHqmcvTyWqP+VEP+xRPLQ9JXu4CPkqxh9r5pUsm810S
         zpGKn9nZJWwBzbtnCEzkwEEZV8c4ORpYyJ3AwyFOUhYAq1bCHiFAu4pFzN/l9jfEn4Sm
         eg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dgolytvhzkG3EP27R4dhTKfwQaIXEVUR+eVplefJRy4=;
        b=CIi3LEu2z3BysDkJ9OM4UDQWbWRWtebCaNHyf6XafTC5Bc8fm+EEWlMRb5s9ehyi/c
         iREMtn8pk3TBXEdskHnXOlehHFakP4yybzQFD1KJ/VXV1fDDJLn8h1NO/Oc/53k+3Ltb
         4idAxfWrgDlGKev63t3MVGZPSNYyfjoH4Mhn4qt6iGJxl2FKa8k/7oZYDdTh75q9JwY/
         gpB3NjcZ9vckyg8TaGRKQQQZYYusefA8DcN1OkJHDi8xmoK0mqzHvZRAn1RF1XsQgC43
         qEGSsUERL1kpApX1xA788vxr9Ks4oExYKk8xzu68p3h4Aq1P9t6usIGhKsz5J9Imp4Hz
         Q3nQ==
X-Gm-Message-State: AOAM531Vr6obdRpFuDUO9jx+lr7PHbQTLNIDOBcTuazDbcq3VAjPgcLC
	kMw6VB++/Ij8bqwMpbUhCHQKj1opLT8P0Q==
X-Google-Smtp-Source: ABdhPJyo40ibO/vXKbH/lrqdLtEN1CMXYqVLHpRXFXuyxtGwPE0MjLucgPL4Jh2Ad5GiZvvPJlJulA==
X-Received: by 2002:a92:c0d0:: with SMTP id t16mr30440827ilf.21.1608823870225;
        Thu, 24 Dec 2020 07:31:10 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id f6sm26448064ioh.2.2020.12.24.07.31.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 07:31:09 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][PATCH 1/3] PSPLASH_FIFO_DIR: refactor
Date: Thu, 24 Dec 2020 10:31:03 -0500
Message-Id: <20201224153105.21211-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the psplash fifo directory to /etc/default/rcS and have the
pieces of code that need it source it from there rather than duplicating the
definition in multiple places throughout the code.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/psplash/files/psplash-init    | 4 +++-
 meta/recipes-core/sysvinit/sysvinit/rc          | 5 +++--
 meta/recipes-core/sysvinit/sysvinit/rcS-default | 2 ++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index f58e043733..e0f80bcdc0 100755
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -7,6 +7,9 @@
 # Default-Stop:
 ### END INIT INFO
 
+. /etc/default/rcS
+export PSPLASH_FIFO_DIR
+
 if [ ! -e /dev/fb0 ]; then
     echo "Framebuffer /dev/fb0 not detected"
     echo "Boot splashscreen disabled"
@@ -23,7 +26,6 @@ for x in $CMDLINE; do
         esac
 done
 
-export PSPLASH_FIFO_DIR=/mnt/.psplash
 [ -d $PSPLASH_FIFO_DIR ] || mkdir -p $PSPLASH_FIFO_DIR
 if ! mountpoint -q $PSPLASH_FIFO_DIR; then
 	mount tmpfs -t tmpfs $PSPLASH_FIFO_DIR -o,size=40k
diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index d0d3149821..c9f6558115 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -17,6 +17,7 @@
 
 . /etc/default/rcS
 export VERBOSE
+export PSPLASH_FIFO_DIR
 
 startup_progress() {
     step=$(($step + $step_change))
@@ -27,7 +28,7 @@ startup_progress() {
     fi
     #echo "PROGRESS is $progress $runlevel $first_step + ($step of $num_steps) $step_change $progress_size"
     if type psplash-write >/dev/null 2>&1; then
-        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
+        psplash-write "PROGRESS $progress" || true
     fi
 }
 
@@ -173,7 +174,7 @@ startup() {
 #Uncomment to cause psplash to exit manually, otherwise it exits when it sees a VC switch
 if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; then
     if type psplash-write >/dev/null 2>&1; then
-        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "QUIT" || true
+        psplash-write "QUIT" || true
     	umount -l /mnt/.psplash
     fi
 fi
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index e608a77c75..c576ff0678 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -30,3 +30,5 @@ ROOTFS_READ_ONLY=no
 # rcS is also used when using busybox init and shares initscripts, some initscripts
 # need to have specific behavior depending on init system
 INIT_SYSTEM=sysvinit
+# set the psplash fifo directory
+PSPLASH_FIFO_DIR=/mnt/.psplash
-- 
2.30.0.rc0

