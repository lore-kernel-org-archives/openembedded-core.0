Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668AECD1290
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 23:20:13 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.5775.1711668006300206150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 16:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W91DX7oy;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36867dfe940so4989065ab.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711668005; x=1712272805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r3nKQ94H17sYgp+iRQ+qEjvkxEIEyXzvEY1Emk6BRA=;
        b=W91DX7oyd79fhMtrf/N2vnP1fliryhyqlu3xgAmQXJ0t69tbr4j1WunwQWP0luNxDt
         H+dPJVWMmfYTozSED9JHnnxFLGV8qw2ax2EASNutFbWZc7oT3CRJE2RuQ5Al9g8C74Fj
         Q2VayMvk4Onul7aswBS9BgsLm9nzXl610RBpz3SyDliujlS/XmQIEDgbAw7F65BhV3iU
         3uXs0zAy+tYDvDr8NerlmDrU9sbVTmGDhVancwQijmFY0gud3L8YOzNSB0fPsE14VJ5X
         Spiyiw+dOi03ioQvVxygEONBjEkEOD/QOpLp4HkCGAOR7xbCCda5RHFwhB0rJrmFGZdY
         IasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711668005; x=1712272805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0r3nKQ94H17sYgp+iRQ+qEjvkxEIEyXzvEY1Emk6BRA=;
        b=vyXdAUAmgJfghUfipo0W3OlLb6e3LbV85CxJi+Hdp26v07T9JDZwghuQxLCu/lV+Il
         Or7PsbQiCt63IbCBlhvM6F4upJLEMDdXsoVzydiDoq1ZthmrFT9llu3K82PQpzHeg2w8
         4Ce8FWQkQNtLJvacJj8enANZKpFmPjfij7wdT8TvI3GqAAhp+WGWtByXJICBahx5rhNH
         NDPKhbZuJuSujxhQnAoh0MG/kBGCIqZP4MYb5jpX8r5YxfomIUHNcBVMRmRfxyYFUtYa
         D1GWS22gSsq5/+eaz60LanycSelFFaPmGkoPF+EvBz2aG5hYRu+CAyejsiuXAzq/i/kS
         mJxg==
X-Gm-Message-State: AOJu0YzRxy13EvlT6R8dpGswt2vRKvFRJ2C2HkBYewFSoLtiPMM9BQDq
	jyNvW4xxgkjcktYvipMXEBMzLECUOo5GLdfdjxgUVNSThB9iE6LXiTnSEzdyyGQ=
X-Google-Smtp-Source: AGHT+IEtVQtyUUPSoNVQDe1JRFX8ZrQ+jrdtRAjFttapO525weeCm7wgKRIKd9h8tUrmuu0JP2S4yQ==
X-Received: by 2002:a05:6e02:350c:b0:366:a7e1:7677 with SMTP id bu12-20020a056e02350c00b00366a7e17677mr694082ilb.3.1711668003683;
        Thu, 28 Mar 2024 16:20:03 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id j12-20020a056e02014c00b00368510c2d14sm713670ilr.34.2024.03.28.16.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 16:20:03 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v4 1/3] nfs-utils: clean up startup
Date: Thu, 28 Mar 2024 17:17:06 -0600
Message-ID: <20240328231950.818134-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328231950.818134-1-danismostlikely@gmail.com>
References: <20240328231950.818134-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 23:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197612

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


