Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AF0CD1284
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 01:24:33 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.7696.1711675465691071077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 18:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U3G0INrd;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7d031abe8f8so52510939f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 18:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711675464; x=1712280264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0r3nKQ94H17sYgp+iRQ+qEjvkxEIEyXzvEY1Emk6BRA=;
        b=U3G0INrdVqaWPHOHRdwpVOAYbLeieJ7D6aKzzdoJT0f2V0whfF00jKTHcS9S01h6B2
         J+Y0Q8FxYkmnUVwbfCkGXupwJcBKt5nqhLar4DzLTx15VY9B4RokpxJZjAC5VyEZj1YT
         Oy4uZEZ5Jd49O0e+fDCe9pSxv3RqCMWHSaxChfk4YY6xiNuYSZWYYLmwlhXYteStNine
         BLDSvsX1AlVz/LjMJKH5yUvSKui3Xa7QRbOoz7fkvz0tHtl4w0G/FX/kEtOK95Yb5LS6
         QQpujID1npQSoUk3GNexRAeXTFcixeUXlQhih4y04NkI1TEMjxpQpgz+xt5puKVUgFEo
         oX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711675464; x=1712280264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0r3nKQ94H17sYgp+iRQ+qEjvkxEIEyXzvEY1Emk6BRA=;
        b=kYjU776mDjN8qGnyK3oLq9w5ZgwYMvmgBkzMC4RBKUYRvt8/IpSXneppJDwJaZJUdH
         P0M7QGhkC8/9hcbY5np7e/BDv/oILjMAr/agcM6cfJg/n0U/z4/GwcRjHDhRLWM8ODDO
         sPGwQYuhdU8mFy3HNDkM2/tiAEv4K+ZKmueh9mJG552CUIXMVLRowhgxp4Fl5ZreCrqg
         dmdCSBSoHr2QVSlWbbIUA413nAq45Qg+a4C20x2KM3BhTqbEh+AyfRWI5pEuWszI+Ohd
         3nnxnr0nPNhzh7ZLh3wlnY1fxtIRqVB/K1//q2UZ+nlLRxe9vWVjrcZ/h88V1emcYqfV
         Za7g==
X-Gm-Message-State: AOJu0YzMCJDL+mVoq0lf1AYutpaJdUIir36ooXfumU4OVpKNoWDVtVuI
	9k5e6EsYf40kU2GwdgR+8CbCptUZuRhfTHR3gm2ViCdq1bi4bw/bAHXzVK/D8/A=
X-Google-Smtp-Source: AGHT+IGaM1OrtTZwWsJ2cMxes9btaYstsXXYn655ixCN0vPpKHufbMlCO87U5gNy+ADxe5LmwuA6vw==
X-Received: by 2002:a5d:848a:0:b0:7d0:785e:f1f7 with SMTP id t10-20020a5d848a000000b007d0785ef1f7mr3072910iom.2.1711675464618;
        Thu, 28 Mar 2024 18:24:24 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id t21-20020a028795000000b0047c0d5be2casm694756jai.24.2024.03.28.18.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 18:24:24 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v5 1/3] nfs-utils: clean up startup
Date: Thu, 28 Mar 2024 19:24:10 -0600
Message-ID: <20240329012413.892379-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 01:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197616

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


