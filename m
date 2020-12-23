Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.11865.1608743193812488985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 09:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qLChu/n0;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id w79so15482858qkb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 09:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mv2nOl8H+HXq5bE+P2ZTnrcNGm8WhNLj+QHcmt9Ckic=;
        b=qLChu/n0V1GZzd+EAlTHOTukAMt7sa0avgOfcuwF4UnazZghM807FD4aNkFn8SBoxt
         sn6QSZnYbo1+LrtGNasfjK6fgvXXYlwftjokMooV8UIeymALnG88J5JgUp+cTuNl/a8q
         V9/BQkG8qH+xStwIOIGYQvYZW3dj1MeMR2bmX09ZMvGFghVghyTDcNWb0R0TFt9/PZD7
         VX6Y0PPCp8wIcn4vLHXpv65vm6/xl/1xvncJETWIKdp+VyRXxWUvptKDTAds6aJqZIqi
         91ZntOi1l5FuvAmH/izwQSc4OrQuFmWikPS8/tk+vuwZ8135LZnYg8G+SFURhVkV0lrz
         zEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mv2nOl8H+HXq5bE+P2ZTnrcNGm8WhNLj+QHcmt9Ckic=;
        b=IQWQAIVZfaA1bqDFlWHBwGhUZQjYvUOoAu25iPSUFnMEAZMKzpKiSt46rdZ+F19R/q
         oaLtUSPmOE/3rjHkSDGqPTBCYfkEIbJamTC3WWXlDRMjmqHoAiAUoKwft+XJpzpPGgGY
         89AHnmPvYxGGTow/I+gSKFNHCXaTrcqRJBMsO8Meb1s9HKCeNpOG0F3t+VQ8Fq1Tk3Fn
         ZBUf4MVTlw3BRQ7kwj9HRcVMO97wUPudSjKGjDoq2AbYyujwVvWa4UChEA2URDdEBuX4
         53Hr4K/Y5gIAMnldzMQd+8gbOjo6DaICT5In1i/IQmnb82Z67wKguwezVvPA7DN/zrl6
         uwHA==
X-Gm-Message-State: AOAM530x35CEL158XJXwBqFDzsLT7a/iNessWbnD2LRGkBFHZW7hTywz
	JomhbMVNV483VE3jkRChlNNszjMkseDNJw==
X-Google-Smtp-Source: ABdhPJzjY23gQCZtFf+tysW6MMWJbsrnvRr/swdUxokSv//nhJv462EMWFHCcRjRadlXogC8NYF7Lg==
X-Received: by 2002:a37:a058:: with SMTP id j85mr28395675qke.387.1608743192487;
        Wed, 23 Dec 2020 09:06:32 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id r8sm15172613qtj.94.2020.12.23.09.06.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 09:06:31 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][PATCH 1/3] PSPLASH_FIFO_DIR: refactor
Date: Wed, 23 Dec 2020 12:06:19 -0500
Message-Id: <20201223170621.35727-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the psplash fifo directory to /etc/default/rcS and have the
pieces that need it, source it from there rather than duplicating the location
in multiple places throughout the code.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/psplash/files/psplash-init    | 4 +++-
 meta/recipes-core/sysvinit/sysvinit/rc          | 9 +++++----
 meta/recipes-core/sysvinit/sysvinit/rcS-default | 2 ++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index f58e043733..68dd708123 100755
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -7,6 +7,8 @@
 # Default-Stop:
 ### END INIT INFO
 
+. /etc/default/rcS
+
 if [ ! -e /dev/fb0 ]; then
     echo "Framebuffer /dev/fb0 not detected"
     echo "Boot splashscreen disabled"
@@ -23,7 +25,7 @@ for x in $CMDLINE; do
         esac
 done
 
-export PSPLASH_FIFO_DIR=/mnt/.psplash
+export PSPLASH_FIFO_DIR
 [ -d $PSPLASH_FIFO_DIR ] || mkdir -p $PSPLASH_FIFO_DIR
 if ! mountpoint -q $PSPLASH_FIFO_DIR; then
 	mount tmpfs -t tmpfs $PSPLASH_FIFO_DIR -o,size=40k
diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 6995930ee9..1c956a3a56 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -17,6 +17,7 @@
 
 . /etc/default/rcS
 export VERBOSE
+export PSPLASH_FIFO_DIR
 
 startup_progress() {
     step=$(($step + $step_change))
@@ -27,8 +28,8 @@ startup_progress() {
     fi
     #echo "PROGRESS is $progress $runlevel $first_step + ($step of $num_steps) $step_change $progress_size"
     if type psplash-write >/dev/null 2>&1; then
-        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "MSG $(basename $1 .sh | cut -c 4-)" || true
-        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
+        psplash-write "MSG $(basename $1 .sh | cut -c 4-)" || true
+        psplash-write "PROGRESS $progress" || true
     fi
 }
 
@@ -174,7 +175,7 @@ startup() {
 #Uncomment to cause psplash to exit manually, otherwise it exits when it sees a VC switch
 if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; then
     if type psplash-write >/dev/null 2>&1; then
-        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "QUIT" || true
-    	umount -l /mnt/.psplash
+        psplash-write "QUIT" || true
+        umount -l $PSPLASH_FIFO_DIR
     fi
 fi
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index e608a77c75..70ab25710e 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -30,3 +30,5 @@ ROOTFS_READ_ONLY=no
 # rcS is also used when using busybox init and shares initscripts, some initscripts
 # need to have specific behavior depending on init system
 INIT_SYSTEM=sysvinit
+# set psplash fifo directory
+PSPLASH_FIFO_DIR=/mnt/.psplash
-- 
2.30.0.rc0

