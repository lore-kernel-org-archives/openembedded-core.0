Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD4AC6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:40 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.5365.1663078718947868124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=muYjSltp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id o23so10187037pji.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=cIFtsl5vG92zsg3L+2kKsxk/ipxoRLjd3oaRKVxX18I=;
        b=muYjSltpByGJ2ylK4uYr14/P/g816xuhz6C6bWb7htXYrrlkNRU+0BQ71esBAu3hUL
         CURrej1osE88oiONIj/KpbXbCNyY6bXyLT1g32nlAaLL1qHCTzKQwz8/4HEqnb1YQG+J
         y0YWzjkV5jqMyJOwn8goCsoTBHbPTv7MMrusnkz6n9CdIoz8S6nGTnSqEmah6Vvi1z4C
         GWaBWF8DvUEkCdx/F4PV5BvOKSrZMT5HlQOzqzjnjYyfif7hChiYO+e/vfAu1WUJCLWr
         +H0ueFj7lK/k5hdfH0YO3hr+ZPmeLPtrYjtqozB2Byj7KJiift7u840e9avkQ28k1WcJ
         SZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cIFtsl5vG92zsg3L+2kKsxk/ipxoRLjd3oaRKVxX18I=;
        b=WkX2PMuEdufHAjwz5/Fajv0o8D+5c12nqkOs7IkM8cByKcuO7UuKFD+t8FScklkOiD
         YjrIq+x9TzrrKKgs7kBKB7n6O3muhZYB+/al7MoOUEBJBpsmw0KejaQB+aV4Ac3fSlHq
         tnbdkbXHMe9FQBnLY+pzIZmZOtv7FZpeNNlMmtgs5xGtPqvBG7R1oHd8jHQNmkotLaIP
         +YbiP1jC8Qo1vvjJtgVIX3UJOPzkPsZxMGEiG2sS9hdq0qLMTQ0QZ/GfjAg9Q4gKg3hi
         qpFndlcn9XZBxI/WORI+NphaOFHDvpiZ0V4s7mqXjKQz8I0hku3n3U8pANPzy80tLSPW
         BVcA==
X-Gm-Message-State: ACgBeo3XHNhlGnxDPODVh9Q8lSZwlEnglr4fumdaCtK1fiYQ/3zCKiTh
	u2VBntHGJbpVCB0uIyZaruRi0pLI+tcapWhw
X-Google-Smtp-Source: 
 AA6agR4FnEGrX7vDXGfwKiHAmABRZaSO9hkGJKhfyrShRGVFM1TAdhpbtkSv8Qwc4Z6W072r0+6JJQ==
X-Received: by 2002:a17:90a:28a5:b0:200:43bc:5728 with SMTP id
 f34-20020a17090a28a500b0020043bc5728mr4214177pjd.188.1663078717920;
        Tue, 13 Sep 2022 07:18:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/16] rootfs-postcommands.bbclass: avoid moving
 ssh host keys if etc is writable
Date: Tue, 13 Sep 2022 04:17:52 -1000
Message-Id: 
 <31cff4d182faed31747d00cc82c1cf0a05a81431.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170590

From: Peter Bergin <peter@berginkonsult.se>

When using IMAGE_FEATURE read-only-rootfs ssh host keys are moved to volatile
storage. If the feature overlayfs-etc is used in addition to read-only-rootfs
/etc is writable and the move is not wanted. But in the case also the IMAGE_FEATURE
stateless-rootfs is used the keys will be moved as storage of keys should not
be wanted in a stateless-rootfs.

This change only takes effect in the case IMAGE_FEATURE contains read-only-rootfs.
In adddition the following cases are handled:

  IMAGE_FEATURES = "read-only-rootfs" --> ssh keys/config handled as ro root
  IMAGE_FEATURES = "read-only-rootfs overlayfs-etc" --> ssh keys/config handled as rw root
  IMAGE_FEATURES = "read-only-rootfs stateless-rootfs" --> ssh keys/config handled as ro root
  IMAGE_FEATURES = "read-only-rootfs overlayfs-etc stateless-rootfs" --> ssh keys/config handled as ro root

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2ad7aa1f2153955adc044ea4eb11c48086a01d1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass | 30 ++++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index a59d9b5878..5c0b3ec37c 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -14,7 +14,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
 
-# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
+# Tweak files in /etc if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
 
 # We also need to do the same for the kernel boot parameters,
@@ -103,20 +103,24 @@ read_only_rootfs_hook () {
 	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
 	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
 	# and the keys under /var/run/ssh.
-	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
-		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
-			echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
-		else
-			echo "SYSCONFDIR=\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
+	# If overlayfs-etc is used this is not done as /etc is treated as writable
+	# If stateless-rootfs is enabled this is always done as we don't want to save keys then
+	if ${@ 'true' if not bb.utils.contains('IMAGE_FEATURES', 'overlayfs-etc', True, False, d) or bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else 'false'}; then
+		if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
+			if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
+				echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
+				echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			else
+				echo "SYSCONFDIR=\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
+				echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			fi
 		fi
-	fi
 
-	# Also tweak the key location for dropbear in the same way.
-	if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
-		if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
-			echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+		# Also tweak the key location for dropbear in the same way.
+		if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
+			if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
+				echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+			fi
 		fi
 	fi
 
-- 
2.25.1


