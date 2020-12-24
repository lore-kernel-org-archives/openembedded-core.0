Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web08.8090.1608795843773554283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 23:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B06tc/tx;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id 75so1291544ilv.13
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 23:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NPLRsCdfNiF6CYrj/AHFcQqmKCOBu+rpxRuGJrlrtN4=;
        b=B06tc/txwAE4p2QigPsVlM2prgHujx3s3nwXxbXwjS1DNvs23hZMe1DkMSDbCqlIS1
         ZDJYc8srQxJF5zVy93amX7wSikkL9zKJ8lTqe298MFgsqT7VBFrSBKAcUicxsum1xOhI
         CQrV6v6u2nKAmX/3AL6V2/kLZ0l9F0tmofkp36UMSwZ4W305WO0aqAgwTsyK3dNlXcdH
         yMvlLZ4bUNnWxBKFmYGW1OVHipEZt8YX0khVOV4BWnck9kW0sr7gWW3M1xkzGFxhUkux
         DCKFkLDfsKluX06H2cIm6oJ9CvXQ3d2LtVUKI7u/UPRzAAPZywvS2WIST5vkYHpVCVMd
         vRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NPLRsCdfNiF6CYrj/AHFcQqmKCOBu+rpxRuGJrlrtN4=;
        b=PbKfTWqkGDGLlh441JRWVffMgIArC+JkxBcYYWwQMaQSwYhBE9xQqSCYRXzwb7GY5X
         ot40xjHuSbgxVHJeMyH32IxPmyAsZfG9+LYfPtix3aim/+QFsRfhmZ8LwgbPvWNj6nTU
         jLCu6FeMaBRDzzyxCQfA7k9qIYjdU4SzXb3LDQU80UF5AxCjgodETG7KLVAi/aqzX+Cm
         bUXw7rvOb4W/9aMuaHK/z1h/+x9HvSnca6av9pIP9jqBPvJa0Ff0J0TaF4rhOIWpOb09
         Kfj+WOjY+qW6FBmubhA0OnXj8ftSfTtL1txRwfLnuU3Qrvm2cwGsniZuT5rc/r1njBrP
         S5kQ==
X-Gm-Message-State: AOAM530AdeXoY47CboRmj9wm2zkNSLaH7qel1ICn6iwddEMj+YBml2LM
	V0x/TG5qdVhRJsfrWczOAZ8v89KbhoukTA==
X-Google-Smtp-Source: ABdhPJwYqFsUykxxQzi/xBzaJUKofESRQqKuh8EdM0iZwFbT37hSd7SRyAYY0TbpLbG66pGVStu5+w==
X-Received: by 2002:a92:410b:: with SMTP id o11mr30510166ila.306.1608795842981;
        Wed, 23 Dec 2020 23:44:02 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id e1sm26181020iod.17.2020.12.23.23.44.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 23:44:02 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][PATCH 2/3] psplash: add fifo to initial image (sysvinit)
Date: Thu, 24 Dec 2020 02:43:53 -0500
Message-Id: <20201224074354.18751-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
In-Reply-To: <20201224074354.18751-1-twoerner@gmail.com>
References: <20201224074354.18751-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Have the fifo used by psplash available in the image on first boot. This
avoids the issue in some scenarios where the fifo can't be created until very
late in the bootup.

The fifo is removed when psplash is done, and created again every time it
runs.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/psplash/files/psplash-init    | 7 +------
 meta/recipes-core/psplash/psplash_git.bb        | 9 ++++++---
 meta/recipes-core/sysvinit/sysvinit/rc          | 4 +---
 meta/recipes-core/sysvinit/sysvinit/rcS-default | 2 +-
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index 68dd708123..31142dfe04 100755
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -8,6 +8,7 @@
 ### END INIT INFO
 
 . /etc/default/rcS
+export PSPLASH_FIFO_DIR
 
 if [ ! -e /dev/fb0 ]; then
     echo "Framebuffer /dev/fb0 not detected"
@@ -25,12 +26,6 @@ for x in $CMDLINE; do
         esac
 done
 
-export PSPLASH_FIFO_DIR
-[ -d $PSPLASH_FIFO_DIR ] || mkdir -p $PSPLASH_FIFO_DIR
-if ! mountpoint -q $PSPLASH_FIFO_DIR; then
-	mount tmpfs -t tmpfs $PSPLASH_FIFO_DIR -o,size=40k
-fi
-
 rotation=0
 if [ -e /etc/rotation ]; then
 	read rotation < /etc/rotation
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index bb57d25c76..6a9cb9e64d 100644
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
@@ -102,7 +102,10 @@ do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
 		install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
-		install -d ${D}/mnt/.psplash
+
+		# make the psplash fifo
+		install -d ${D}/mnt
+		mkfifo ${D}/mnt/psplash_fifo
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
@@ -124,4 +127,4 @@ SYSTEMD_SERVICE_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'pspl
 INITSCRIPT_NAME = "psplash.sh"
 INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
 
-FILES_${PN} += "/mnt/.psplash"
+FILES_${PN} += "/mnt"
diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 15ff660965..c4a2f50f88 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -160,7 +160,7 @@ startup() {
 			#
 			[ -f $previous_start ] && [ ! -f $stop ] && continue
 		fi
-		psplash-write "MSG $(basename $i .sh | cut -c 4-)"
+		psplash-write "MSG $(basename $i .sh | cut -c 4-)" || true
 		case "$runlevel" in
 			0|6)
 				startup $i stop
@@ -176,7 +176,5 @@ startup() {
 if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; then
     if type psplash-write >/dev/null 2>&1; then
         psplash-write "QUIT" || true
-        umount -l $PSPLASH_FIFO_DIR
-        rmdir $PSPLASH_FIFO_DIR
     fi
 fi
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index 70ab25710e..e4e5782de5 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -31,4 +31,4 @@ ROOTFS_READ_ONLY=no
 # need to have specific behavior depending on init system
 INIT_SYSTEM=sysvinit
 # set psplash fifo directory
-PSPLASH_FIFO_DIR=/mnt/.psplash
+PSPLASH_FIFO_DIR=/mnt
-- 
2.30.0.rc0

