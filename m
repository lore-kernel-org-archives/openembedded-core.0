Return-Path: <gael.portay+rtone@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBB3D3E1A8
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 02:19:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.37573.1729304381682235707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 19:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eRhzB1l6;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gael.portay+rtone@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315b0bd4ddso3841675e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 19:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729304380; x=1729909180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WkLD5G1y7Wp/kQLj4/o3tY6uHlgb6F5RsFNAVHd1AoE=;
        b=eRhzB1l6Q6dI3EfmBjxf0BawFhlgRPIIXScqLkTTs/qqs8o4DExmwel2zkmNxOFEOq
         2UXNxMIssXUAQPqY5rVnUzRJ+bOqBzFSqqO3I9T6n76DjPip0XtUR6zKpeaQd7CNEy+O
         25loH4NZMRifDuAqS3vG2hLM9/2ot0zmP2OJaJhLASaR19hwV9rhYSQahE8XxaEAsRuG
         z8RxXK97dCNn9y1ea/hLbZJAKdQOFH1nFDcipLimQqXtaC9MbZwdrJFQbYrW7hYaDfRU
         YdNKcuqyaYD/vNZW2DF7FM1lL3g20Ds1S2EsD0j6XyGP+Yi+9b0BnZZFtDA1iwN8tKw5
         QyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729304380; x=1729909180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkLD5G1y7Wp/kQLj4/o3tY6uHlgb6F5RsFNAVHd1AoE=;
        b=e5eDQphHoceR1Jisn8AxVdUMGuZnkRclSOyBMMzOPO7UjNf3ZeSlcBTFIX3BUyC6xN
         FiI1F0Aa2WKx+F6kW4EYPwe33UVAbeWbW9OBAHMu88SNCmZkDeHOhs+sTr8MpPK9HXX8
         jUgMbiknQlVWuzv5Kqd2tWsZJxXHumtkfgPndclmJkDFwro3eUy77yw+If/sFFJBB3cI
         15oF8C/TF4Cy8Aa3QNuo+xkBFkmiNNo7tlaowqk+Tv5f6AH1LOcmGDJtwmldX7dZ+Mxn
         6sOs1UB49ETHSOB88QWfdSnoiQAP3vHkM5XafTnVM3wbpBWDnX5Zn3rh6LsaqT+5undc
         rJ2A==
X-Gm-Message-State: AOJu0YwPs0WN9fD6no+PVD7LtiFQ7cIRrwlppaU/+6GyZZ//eiNcH+M0
	7pzLZ3u92MQ8xAyk8gjg+jWxMkbEF4u/AldDHOrrON6oYKvhnLiWJVLVxEsQ
X-Google-Smtp-Source: AGHT+IEHdSJ7he0s3bIUbx2NGW0W+TFe268IW8zCbRbgITUh6ZB7K0M1DPxIucuOuP8i+pZR00S2yQ==
X-Received: by 2002:a05:600c:19c6:b0:42c:b870:c52e with SMTP id 5b1f17b1804b1-43161635203mr14998535e9.1.1729304379569;
        Fri, 18 Oct 2024 19:19:39 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed7a8sm3248007f8f.73.2024.10.18.19.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 19:19:38 -0700 (PDT)
Sender: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@gmail.com>
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Subject: [PATCH] classes: rootfs-postcommands: set better sane time to systemd
Date: Sat, 19 Oct 2024 04:19:35 +0200
Message-ID: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 02:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206078

When systemd is started, it sets the system clock to epoch to ensure the
system clock is reasonably initialized if no working RTC.

As init process, systemd sets epoch very early to the more recent
timestamp of[1]:
 - the build time of systemd (-Dtime-epoch)
 - the modification time ("mtime") of /var/lib/systemd/timesync/clock
   (systemd-timesyncd)
 - the modification time ("mtime") of /usr/lib/clock-epoch (systemd)

The first epoch timestamp is is hard-coded at build-time by the systemd
recipe (using either SOURCE_DATE_EPOCH, git-tag, or NEWS modification
time[2]).

The second epoch timestamp is maintained at run-time if the system runs
systemd-timesyncd.

This implements the third epoch timestamp at image build-time, from a
newly introduced rootfs post-process command that is very similar to
update_timestamp.

It touches the file /usr/lib/clock-epoch with the modification time set
to either the current timestamp (now) or to a reproducible timestamp if
REPRODUCIBLE_TIMESTAMP_ROOTFS is set.

Note: That newly introduced rootfs post-process command is automatically
set if systemd is set in the distro features.

[1]: https://github.com/systemd/systemd/commit/863098fdc9cd91e4f760085356ac02c4b7ba6df1
[2]: https://github.com/systemd/systemd/blob/v256/meson.build#L804-L825

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
---
Hello,

With this patch, one can have a better sane default time set by systemd
very very very early in the boot (i.e. even before systemd outputs its
version!).

	# dmesg
	(...)
	[    3.347641] Run /sbin/init as init process
	[    3.350435]   with arguments:
	[    3.350440]     /sbin/init
	[    3.350443]   with environment:
	[    3.350447]     HOME=/
	[    3.350451]     TERM=linux
	[    3.431275] EXT4-fs (mmcblk2p2): re-mounted. Opts: (null)
	[    3.523997] EXT4-fs (mmcblk2p4): recovery complete
	[    3.527828] EXT4-fs (mmcblk2p4): mounted filesystem with ordered data mode. Opts: (null)
	[    3.694440] systemd[1]: System time before build time, advancing clock.
	[    3.714755] systemd[1]: systemd 250.5+ running in system mode (+PAM -AUDIT -SELINUX -APPARMOR +IMA -SMACK -SECCOMP -GCRYPT -GNUTLS +OPENSSL +ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=hybrid)

Thus, one can do time-based related things offline or before the system
clock is set by the network (if trusting the time does not matter that
much for sure).

This happens if the system has no hardware clock or if it is way too far
in the past and if using an old versions of systemd; systemd v250.5 sets
the system time to April 28, 2022 5:53:22 PM (1651168402).

Also, please set REPRODUCIBLE_TIMESTAMP_ROOTFS to any appropriate value
if enabling reproducible-builds (the default). Otherwise, bitbake sets
the timestamp to Friday, March 9, 2018 12:34:56 PM (1520598896).

If you have a better idea on how to implement it, please tell; in the
meanwhile...

Kind Regards,
Gaël
 meta/classes-recipe/rootfs-postcommands.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 5f4d67f93c..cc74c75cfa 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -22,6 +22,9 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp "
 
+# Create /usr/lib/clock-epoch during image construction to give a reasonably sane default time setting to systemd
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "rootfs_systemd_timestamp ", "", d)}'
+
 # Tweak files in /etc if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook ", "",d)}'
 
@@ -402,6 +405,19 @@ rootfs_update_timestamp () {
 	bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted"
 }
 
+# Can be used to create /usr/lib/clock-epoch during image construction to give a reasonably
+# sane default time setting
+rootfs_systemd_timestamp () {
+	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" != "" ]; then
+		# Convert UTC into %4Y%2m%2d%2H%2M.%2S
+		sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M.%2S`
+	else
+		sformatted=`date -u +%4Y%2m%2d%2H%2M.%2S`
+	fi
+	touch -m -t "$sformatted" ${IMAGE_ROOTFS}/usr/lib/clock-epoch
+	bbnote "rootfs_systemd_timestamp: set /usr/lib/clock-epoch mtime to $sformatted"
+}
+
 # Prevent X from being started
 rootfs_no_x_startup () {
 	if [ -f ${IMAGE_ROOTFS}/etc/init.d/xserver-nodm ]; then
-- 
2.47.0


