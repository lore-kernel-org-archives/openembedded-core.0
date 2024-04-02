Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F6DCD1288
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 00:21:07 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.1045.1712017263885652555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 17:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HNjLnzjb;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7cc01644f51so264025139f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 17:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712017263; x=1712622063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0r3nKQ94H17sYgp+iRQ+qEjvkxEIEyXzvEY1Emk6BRA=;
        b=HNjLnzjbF7cpGGc/clsxij5EZeaaxmQZh/0GqU1gRww0i1VqgmKJ2d5T2JFBcG1mS1
         jd8XXC+W0ePY71yNT3FOlniJj8p6e2ketoQUz9r7KdLHSglaEFHPPywTTbZajmSRhmsF
         TistDDOdbXx8nCdjC4BwOf8ozH87HmPsjrTUm0fZhNx5SyJf6z7jTdrmVq0xb7FzMMVj
         xiNDBvVPgVlSBivybmU0fmMWPFSVkx2BLkbMpX+iafK/CRDvkohhSNDfzTAKSC1Ky2Qk
         AlBogrTVesL6QfwGN0n3W/UoJ3JASYvCUekmmAJwaWxG+QJEyK8FyC1tn6DYbl95lh16
         G3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712017263; x=1712622063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0r3nKQ94H17sYgp+iRQ+qEjvkxEIEyXzvEY1Emk6BRA=;
        b=V9tQ/jM016s0lLS7XHGMuyFPNVTAkTR7uiPKOKO8GSao4ORtQpTCw88ekEDPtfh82i
         ztkVC7KgZbDBASR/ahhA6sPOyMl9IgAOGSPtnvnsIUfWgh8TFaNLL9/x2rMXtacynUCO
         EYDQP9PVmbnIvMsZDPM3T4MvRRAykd3NO3/SJ9NjeJZ8zJXiB4YT8LEpCyYuPcQdmkN6
         20pq2sexUwefeNdRCMRrZGFp6pBdKMHacjQJ4PmM96yDMCtIBntnDJxcRWrI5CXtWZsu
         MHJOnvJrAc+m21m5HFHlOZqVL6/3A+fpsqLMfvwHXnNKAdH40W+CO+xVuNXD8iy6xo7G
         4iSg==
X-Gm-Message-State: AOJu0YzpgACMGWbYG2Fd8h7lYVQDubfs8HkgO6KjB24Sm5UBGyJJb8JR
	JuwtpjO6Kvi2EkFTjRrulEIMdph4UTtIWxoa2n4B5mbo2ffTwHsbMAciUCg7sbs=
X-Google-Smtp-Source: AGHT+IEfVR/8SjEJT/s/3W88aqykjS+WWNiHfg4Y3ZyQ9zuUoeVh71mgZW4UwjtbtnVE8+Dmy8XHYQ==
X-Received: by 2002:a05:6602:214b:b0:7d0:89d3:bbe5 with SMTP id y11-20020a056602214b00b007d089d3bbe5mr12272494ioy.1.1712017262792;
        Mon, 01 Apr 2024 17:21:02 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id u18-20020a5d83d2000000b007d0648c020asm2949087ior.49.2024.04.01.17.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 17:21:02 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v7 1/3] nfs-utils: clean up startup
Date: Mon,  1 Apr 2024 18:20:54 -0600
Message-ID: <20240402002058.3910908-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 00:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197858

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


