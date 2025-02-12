Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F01C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 19:16:09 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.24850.1739387766624286866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 11:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lTGv8tRY;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6f9e78593b8so644097b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 11:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387765; x=1739992565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mOJmaQsBFSYoIVWr7zdsv4qM4d0FMXLFrxkio0XVYNs=;
        b=lTGv8tRYPbaYJStDqJuJXgNHb4S5GZfJ3/JxMHVkOVeB2e13J9yQwr6Eesjx5vEp5G
         Q9l8qptRuKfoTJnSpaqWSKU7Rc4XuYtZki+KszlSu9RUYS2jGuhYNbhdleO6zawTZp2F
         ZWofTQIFKkY684oEaODlpE7DARyUfexyFxXhSIVQLYI484MuFs/6F6A3Ifx5WLfVxgf5
         z1Qsur0QpPl5/h1Wxxr22oS8a+grbcNBM5wzg1tJCKCnP20pGlutcdEC7qcts7KH0b3p
         JDtm1j3Y6t3rLbdo4PBs9z/4GXRZI2XRRhk74q5r6sNY5E3Vnq8fqzRbl1lj1WLDP1yY
         zWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387765; x=1739992565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOJmaQsBFSYoIVWr7zdsv4qM4d0FMXLFrxkio0XVYNs=;
        b=YPX6bS6ytKzzuNAF0EX7r/0a8/Ti+r+ScZfJxZrQFa3UJUwC2cWKuq8q4ieclQzhp+
         LWT2CT/X6PzSgKQp01yyOIS/ph2YVxGhNy2NLKIM1SZni+cZiHicGEAArsWq9Q60H82y
         ctRm0LBcAONJtJiJhi1RlnwxgiJXRWE5Kr/J92blYZAysgG4sH7TYKfVmw7s9Qv+Wjho
         kmEjt7qx7BM4fZx7Zm9s2U2d8DxB561945gR9jx+7k4LfRmA9SkMcrCT8J5J+Gx6lHm1
         EdJB7g+RgoRvjseglzn3zo5pKbq2SDq750wg0irINjjAwgvG+h4kOGdAxthcCK6gqF29
         4s2w==
X-Gm-Message-State: AOJu0YwR69ugONo3jluOLM8w5McwN8dScRYC2tn2b8otF2uarRRK9wyT
	ZX8jjlTYZJiP+NScObPsuT4lDMo8AhNIkWylOkwXaiydumdpcvM0OiyWLQ==
X-Gm-Gg: ASbGncsf1BezdHk9FTs3faCDR2KIdlAkJLc70xzsvKQVgl9LPdlXXNRO0RagjBewyCF
	PzhZw84H8spQwgkZcJewBzmt9t63TD7ADaFIAO675Dwd5c66blbO9mudsbFvWpeMrQI3l+Jz2wp
	cPyPOuWCGso+RCzh4kDxQNLzC+bwX4XgxjnELdOArl257NodCg0piIg0FOdW07klM2GZiaRYYkz
	LkB/ErZ4agRMQKrlw0pSM6GinrAM17rZbxC/nUM2B5GdJfvc+NMwHTo3TG10/L0xWFxDZ7UlUc1
	p39oMdUSJch+3y9IoLnjKOT5k37sKF4XVYByexsw
X-Google-Smtp-Source: AGHT+IFGpYJ7SpfGPEA8dJ5qv8x2DU8aX3guorC8ikqKo6ZikgSTEdR6Jj7wu9T1ZSSTIs+zz/NeFw==
X-Received: by 2002:a05:690c:2b8c:b0:6f9:d772:3dfa with SMTP id 00721157ae682-6fb339132e1mr2477947b3.0.1739387765442;
        Wed, 12 Feb 2025 11:16:05 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fce16d1sm28115017b3.23.2025.02.12.11.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:16:04 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 1/4] nfs-utils: clean up startup
Date: Wed, 12 Feb 2025 13:12:29 -0600
Message-ID: <20250212191518.1968329-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 19:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211273

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Change the sysvinit script to start at the S runlevel, this matches
Debian, and prevents systemd from generating a unit file for it.
Also have the nfsd systemd service request the nfsd kernel filesystem
mountpoint. This avoids startup failures in unpriviled containers
or other setups that don't support the filesystem.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon | 8 ++++----
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb  | 9 ++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
index 992267d5a16..4f07324a21f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
@@ -1,9 +1,9 @@
 #!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          nfs-common
-# Required-Start:    $portmap hwclock
-# Required-Stop:     $portmap hwclock
-# Default-Start:     2 3 4 5
+# Required-Start:    $portmap $time
+# Required-Stop:     $portmap $time
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
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index ff02a3aea01..df9c95a71ff 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -133,15 +133,14 @@ do_install:append () {
 	install -m 0644 ${UNPACKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
 	install -m 0644 ${UNPACKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
 	install -m 0644 ${UNPACKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${UNPACKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 		-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
 		${D}${systemd_system_unitdir}/*.service
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -m 0644 ${UNPACKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
-		install -d ${D}${systemd_system_unitdir}/sysinit.target.wants/
-		ln -sf ../proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/proc-fs-nfsd.mount
-	fi
+	# Add compatibility symlinks for the sysvinit scripts
+	ln -s nfs-server.service ${D}${systemd_system_unitdir}/nfsserver.service
+	ln -s /dev/null ${D}${systemd_system_unitdir}/nfscommon.service
 
 	# kernel code as of 3.8 hard-codes this path as a default
 	install -d ${D}/var/lib/nfs/v4recovery
-- 
2.47.0


