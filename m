Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED4BCD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 22:26:06 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.5523.1712010361765059893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 15:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mNtw9KQT;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3688b72d08cso16108455ab.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712010361; x=1712615161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0r3nKQ94H17sYgp+iRQ+qEjvkxEIEyXzvEY1Emk6BRA=;
        b=mNtw9KQT/UMhGk5bRLN92f/YUGS6lRYDHsE5DZpEmVNwocPAkikiwNgTMIbjQPydH5
         46LV7hztycnJzT2SM3tdxulunhtIvxRlR1k2ul94MIB1oD1GJIIRC0gMNeciPXLn4Gd5
         Fft0d3yP3SYonUNs2JyTUbYs0T5PHOCs421EeFbdSUniu8lQJGmOGv1lNDSfegQ9pijB
         +ZiMonS1cYeHDxWz19THx+ELcZOnnn1cLa56cN7uJkaGvhuRBl8KbGt3g53D4GWk47yj
         arlvuwVsq7TtHjKf+YfWVi8tY8na04rVChHPE59tkRTERpn+fZD++4or1/yRgfQxUCHs
         mmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712010361; x=1712615161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0r3nKQ94H17sYgp+iRQ+qEjvkxEIEyXzvEY1Emk6BRA=;
        b=jHhH1/38Xauk+jbyeL6GkQxJjs1/QNFjUEvQsDd+GCoj730JU0ZQJ8BfERvGQSABvn
         aMnnmI9hag9FVI3SmVsKjDBrtQSyFKRI076ngkiaYUpGwQNGt1JUoosaig/TXxw45P9k
         y7Lxg47ut/+LsauGOJPIQdnSD+EN/KchsjHmf/pSqfSXgiRBffjLBRwPIm8I6w19Tpes
         JlLOoJfc6gNvFWXsTZxYw5DGstdC8Sb2bBHXA/UqvoQwYyCIbGACkWwhm59LCNGvlADA
         eO/gNGXvO1opzweZRjbTydwlSqHS4k3BZ1SXC4lfYRp3A0MgPHCkzSYDoue+o41mf6lC
         v6Gw==
X-Gm-Message-State: AOJu0Yx+PSJS/mRisySUSFZRb05jlhoOZ8Fm63zqISD+EXSwSwuEIejM
	u3hoBtSfYFsq7pr6fQW6qlZAjH3mtEr5XBn7BYXie7k5p9UnBTcMC7MXxpjbHXU=
X-Google-Smtp-Source: AGHT+IFpnzuUDDkSIc7WDNqrG8sKSNSbPR5O321NK5TqL2lzdYFLtWGDog9KHDubQnBSqP4TF8GoSA==
X-Received: by 2002:a92:cd8e:0:b0:368:96a2:f759 with SMTP id r14-20020a92cd8e000000b0036896a2f759mr13290050ilb.13.1712010360774;
        Mon, 01 Apr 2024 15:26:00 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id r27-20020a056638045b00b0047c083553fasm2843653jap.67.2024.04.01.15.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 15:26:00 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v6 1/3] nfs-utils: clean up startup
Date: Mon,  1 Apr 2024 16:25:53 -0600
Message-ID: <20240401222556.1944101-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 22:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197854

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Change the sysvinit script to start at the S runlevel, this matches
Debian, and prevents systemd from generating a unit file for it.
Also have the nfsd systemd service request the nfsd kernel filesystem
mountpoint. This avoids startup failures in unpriviled containers
or other setups that don't support the filesystem.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon | 4 ++--
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb  | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
index 992267d5a16..4c1ad17c3c6 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
@@ -3,7 +3,7 @@
 # Provides:          nfs-common
 # Required-Start:    $portmap hwclock
 # Required-Stop:     $portmap hwclock
-# Default-Start:     2 3 4 5
+# Default-Start:     S
 # Default-Stop:      0 1 6
 # Short-Description: NFS support for both client and server
 # Description:       NFS is a popular protocol for file sharing across
@@ -20,7 +20,7 @@
 . /etc/init.d/functions
 
 test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
-test -z "$STATD_PID" && STATD_PID=/var/run/rpc.statd.pid
+test -z "$STATD_PID" && STATD_PID=/run/rpc.statd.pid
 #
 # The default state directory is /var/lib/nfs
 test -n "$NFS_STATEDIR" || NFS_STATEDIR=/var/lib/nfs
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
index 2f2644f9a83..527fcd609c1 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
@@ -132,15 +132,14 @@ do_install:append () {
 	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
 	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
 	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 		-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
 		${D}${systemd_system_unitdir}/*.service
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
-		install -d ${D}${systemd_system_unitdir}/sysinit.target.wants/
-		ln -sf ../proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/proc-fs-nfsd.mount
-	fi
+	# Add compatibility symlinks for the sysvinit scripts
+	ln -s nfs-server.service ${D}${systemd_system_unitdir}/nfsserver.service
+	ln -s /dev/null ${D}${systemd_system_unitdir}/nfscommon.service
 
 	# kernel code as of 3.8 hard-codes this path as a default
 	install -d ${D}/var/lib/nfs/v4recovery
-- 
2.41.0


