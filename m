Return-Path: <gael.portay+rtone@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C92D42BBF
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 19:22:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.94960.1731439342021094063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 11:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IDFPWnn+;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: gael.portay+rtone@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315b957ae8so1235245e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 11:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731439339; x=1732044139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pTpegVbmfMNFPCAokBFl7m9Uf0EjYJIsWtJ1g4M+4Aw=;
        b=IDFPWnn+92yKP0ZsxScZa/7/oLifpbhc882Yd2yg2iBIqC/k9h3W+Ex01lHuDP6xEY
         2VoVnCB1I06qicGsFYJ2xFqLwxj2e9/3u8s8aqogaYMStfJ24k/LhK9SnynJ3/ckT2bH
         0pFbI813/x7AcBUcilhlKwgIxYTstC7jB1LJHz/FY6lgVze9los5/FvP9wmRSvMUc/JN
         zF+pBH6poSNdwX+O9z7+AH1W6rMnaW6xA7gsGA1HYHrIVUmrSiMy8p+m6KtvjYduVNDh
         18zHx6P1R+SUiOmxlg6O97cAXnN1CCwNaGWaSVVesxIfhf/ODBqbJ546P8WwXpFL29yE
         Styg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439339; x=1732044139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTpegVbmfMNFPCAokBFl7m9Uf0EjYJIsWtJ1g4M+4Aw=;
        b=OFcBA4+fCvvVLuBtKdnDUmIGgp0InrVrw8ZiZllWkulLLR45+6nDsxDNGFQplqaHYF
         aVx1HXZujshsfbokoEqeXpV44DhFXwt0zXcBLW9f4lAvgeUPMsRea3VSU7vIZ3pspZnb
         nbHU/vGJ10+P8kLdpHzk5jK3WzluI/UFx/bs1nMmLj1mLgRkEYl+laPEy+g6sxLRXYW3
         53P+hn/VVpXA7p28FP/D9EqXvLR1f5pfWf/4/bRQj7FjY1VH/iaHpOucIVYAz4EB3XpA
         XarH/sY2VWsU+u1xMgjnQM+YaazZXwyLXIvFIgvwdtoNhUoXKfoJ38eYReble0w3CAE7
         XAKA==
X-Gm-Message-State: AOJu0YxoVMnl7DNE7rFZvYWSmlD9B0+uGrH0uZTpK7AlKvNdSAJrChOw
	GLdvdRSP4Y5VbyjbmPkMt2ByqmsiA1RI5/0JmR88sj6HXsm1fiPmUCTl/v8n
X-Google-Smtp-Source: AGHT+IEvfGUQQD76RtmoDHXWExs3fn5JC6ghxIUFb8XgPTWQ5eE7kuGeWVeFDaJn82DNKY8yChi9KQ==
X-Received: by 2002:a05:6000:18a9:b0:37e:d940:a9fe with SMTP id ffacd0b85a97d-381f1828b81mr5962011f8f.13.1731439339210;
        Tue, 12 Nov 2024 11:22:19 -0800 (PST)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97fe9bsm16003712f8f.35.2024.11.12.11.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 11:22:18 -0800 (PST)
Sender: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@gmail.com>
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	ChenQi <Qi.Chen@windriver.com>,
	=?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Subject: [OE-core][PATCH v2] systemd: set better sane time at startup
Date: Tue, 12 Nov 2024 20:22:14 +0100
Message-ID: <20241112192214.1644312-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207061

When systemd is started, it sets the system clock to epoch to ensure the
system clock is reasonably initialized if no working RTC.

As init process, systemd sets epoch very early to the more recent
timestamp of[1]:
 - the build time of systemd (-Dtime-epoch)
 - the modification time ("mtime") of /var/lib/systemd/timesync/clock
   (systemd-timesyncd)
 - the modification time ("mtime") of /usr/lib/clock-epoch (systemd)

The first epoch timestamp is hard-coded at build-time by the systemd
recipe (using either SOURCE_DATE_EPOCH, git-tag, or NEWS modification
time[2]).

The second epoch timestamp is maintained at run-time if the system runs
systemd-timesyncd.

This implements the third epoch timestamp at image build-time, by
touching the timestamp file /usr/lib/clock-epoch from the package
post-install script.

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
the timestamp to Friday, March 9, 2018 12:34:56 PM (1520598896, i.e.
REPRODUCIBLE_TIMESTAMP_ROOTFS[1]).

**Important**: It works on scarthgap and kirkstone; "all" image files
are timestamped to Tuesday, April 5, 2011 11:00:00 PM (1302044400, i.e.
SOURCE_DATE_EPOCH_FALLBACK[2]) on master branch; that branch appears to
not use REPRODUCIBLE_TIMESTAMP_ROOTFS anymore. Therefore, an update of
the SOURCE_DATE_EPOCH_FALLBACK value should work (I guess).

	root@qemux86-64:~# stat /usr/lib/clock-epoch /etc/timestamp
	  File: /usr/lib/clock-epoch
	  Size: 0         	Blocks: 0          IO Block: 1024   regular empty file
	Device: fd00h/64768d	Inode: 837         Links: 1
	Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
	Access: 2011-04-05 23:00:00.000000000 +0000
	Modify: 2011-04-05 23:00:00.000000000 +0000
	Change: 2011-04-05 23:00:00.000000000 +0000
	  File: /etc/timestamp
	  Size: 15        	Blocks: 2          IO Block: 1024   regular file
	Device: fd00h/64768d	Inode: 510         Links: 1
	Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
	Access: 2011-04-05 23:00:00.000000000 +0000
	Modify: 2011-04-05 23:00:00.000000000 +0000
	Change: 2011-04-05 23:00:00.000000000 +0000

	SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"

	Supports Unix timestamps in seconds, milliseconds, microseconds and nanoseconds.
	Assuming that this timestamp is in seconds:
	GMT: Tuesday, April 5, 2011 11:00:00 PM
	Your time zone: Wednesday, April 6, 2011 1:00:00 AM GMT+02:00 DST
	Relative: 14 years ago

[1]: https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n689
[2]: https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n688

Changes since v1:
 - use pkg_postinst() to touch file /usr/lib/clock-epoch instead of the
   rootfs post-command rootfs_systemd_timestamp()

Note: v1 is titled "classes: rootfs-postcommands: set better sane time
to systemd"

https://patchwork.yoctoproject.org/project/oe-core/patch/20241019021935.2105739-1-gael.portay+rtone@gmail.com/

Kind Regards,
Gaël
 meta/recipes-core/systemd/systemd_256.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_256.6.bb b/meta/recipes-core/systemd/systemd_256.6.bb
index 68f15ab065..f288bedc9e 100644
--- a/meta/recipes-core/systemd/systemd_256.6.bb
+++ b/meta/recipes-core/systemd/systemd_256.6.bb
@@ -867,6 +867,10 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+pkg_postinst:${PN}:append () {
+	touch $D${libdir}/clock-epoch
+}
+
 pkg_postinst:${PN}:libc-glibc () {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'false', d)}; then
 		sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-- 
2.47.0


