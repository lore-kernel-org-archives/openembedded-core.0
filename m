Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350A6C54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 15:03:49 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.18761.1711638222043116051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 08:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hJgLavzg;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7c897ac777aso28578039f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711638221; x=1712243021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLZG7vGxI6Wr0c54z3XSsE1E5ls+ubxTEisK8pIrRhE=;
        b=hJgLavzgSPeNNtcZldMSjAYmBK+mht/x0ExUyEOjgWQ214EzIzTtUXU259leRVPepG
         k5fvBYwH6oJKsvb6gT6PGcWGSpV5jmkuVJpy32CuG5N0KyHpFNU3J3ELzb892PQXFGeU
         290ErlvyCA1P/3lBuPf9ckWEbcHue9yaTkT6lWXVQ4+EGDl7TQvyJ7s1sH4g/reEyghr
         zgjHWGiKo//h2moOr/tKBcld+soxUFqnsseQsTA4JVVTWklT/YT7ynvJS9HX03mffDyz
         RUbL3CVqJjHzNe+wX1biSrYUZQes2lfvMCbMSweLfTUaAD8LIASj/PDiSaNBE7jgomsi
         glpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638221; x=1712243021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLZG7vGxI6Wr0c54z3XSsE1E5ls+ubxTEisK8pIrRhE=;
        b=NcidhfGFttZ3msDis60CVxDSd7KfDZuxLAHKSiqeh/MHpVex2zclNhLCw+3Do1wWh6
         cBl8PSPSL5TLJPLuoYqduILs+5FmV4iNT5OgwAmT7enW4S8W5DhOGW/qhKQKxnC6LfXA
         SwhnZyMtImyot8dvn51TT520fW5+elGtVD6dggNW2IRspcuVXNFmR683tRIwStg6IoAE
         nVSEv8S6dwSZU5toAP5AVo+XQAcPeDWccU9+Gu5pQ/qzn82d7MA2TP8CUdlDlWRTJEig
         lJ7gJuMkjcJBoQC6TNFSnx4JApGEoANcDxfo4ybABLRE/xsEPa3jFoUTBwUxGhyfbjVm
         FY7A==
X-Gm-Message-State: AOJu0Yz7dBAfXYyo3TS4RaVreq/9Nsf8sF1o5d4w6LXJrtV7w3sghDCa
	Pb2kq2BMnIXVS9FVmohN65VQavPMaAI79rlDaNCNm4ojQIiBTRKqpPkptBca
X-Google-Smtp-Source: AGHT+IHcjfn8BKNW/1ayn2A+m6l31yIUrpGF0t2Ij0aEj1oUgCEgP6oKLLlkui/kkm2xtDMNMwf/pg==
X-Received: by 2002:a6b:6c0e:0:b0:7d0:8b9e:e27d with SMTP id a14-20020a6b6c0e000000b007d08b9ee27dmr2194836ioh.15.1711638220954;
        Thu, 28 Mar 2024 08:03:40 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id f27-20020a02cadb000000b0047ecf5bd069sm237659jap.39.2024.03.28.08.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 08:03:40 -0700 (PDT)
From: Daniel McGregor <danismostlikely@gmail.com>
X-Google-Original-From: Daniel McGregor <daniel.mcgregor@vecima.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 1/3] nfs-utils: clean up startup
Date: Thu, 28 Mar 2024 09:03:34 -0600
Message-ID: <20240328150337.501372-1-daniel.mcgregor@vecima.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 15:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197575

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


