Return-Path: <mbullock@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61581C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 13:16:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.7614.1719494162140033138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 06:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=AGcWnQkv;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.128.54, mailfrom: mbullock@thegoodpenguin.co.uk)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4256742f67fso3143715e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1719494160; x=1720098960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WNDzUk5Vz2LYjoIag/wLTPRvDajCOikht+nY3vlztpk=;
        b=AGcWnQkvfKwr+F9q1ZN4xomgpySOcSaMaTfXkELBlKpDfVby87BHR/qmXljuHLlh6S
         +dzsrMD9iSQyT9fz6wcEUpbrLwe0wkQMhfshfxC73uyedKoE96X8OHfUQHI2DkXhxq0K
         LSAIp3ORIqbe+BfB17Y6LFey0Fyhd8FM3z278BKFnZt3wNVdGwX3L+yOPjW1QNIOXH8k
         tXxHMVJNDR+jkJsp4o+HGU6quSwVI/wvcNtj5VTtbq3F6cOw8+iHGNETg7EWZlFj+WbU
         CVL8TzLzF7LGaXUOzzdPtQSLv42MlC6gnKOJNvzTIRN2jv6IXQg4I67W1vu5g1zWsjJ1
         cWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719494160; x=1720098960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNDzUk5Vz2LYjoIag/wLTPRvDajCOikht+nY3vlztpk=;
        b=vqDwq/tsqnfNvRT25mTtF6LgreMz6l0ijsc0ygeTOr8h+YZ08rSQFCxkX71XSCeZ76
         +o9AYPGKmNKN7C2QvkRpZcMKT6qNd296/V+lW1TJeJXEtwuamZchOHh5p+Jg2m50h1QZ
         3hGc7rWH1uwBqZNlUQfIu4mncWvB3EuPmjsUm+rh0naLgL3rbM52Tc0+B1QaDxNEhG8J
         9BqP/MOcd2TYYYjuU/ixoiJ0DN3k6Zdz4fd9MaBxnXA03GhaJ48QcMqbQrud7H56Gwgh
         OjrmMCgxUC/0PWSNbhjqEYzzQnBH5Wxx9c9REHXTbXu+8L2T9l3tTgFmhhA8mmu6hGx7
         aHCA==
X-Gm-Message-State: AOJu0Ywr02XVbrajt2KXdSTMq5bYMoZS3rEHQhK2ml3/1AIfENRHJo89
	U/clR1kKks6aOJtOV97gfrvY03Ue1P+pQaWD1AOym8UNAWfRB0zZKD+kmJQF8Ni0+myP1CqtDA0
	m
X-Google-Smtp-Source: AGHT+IE/7zGMde2/rha1bDQRSzEydJ4VVlgfImnVPOu/pSRNwMckPpqNheoJL8Ar1tiy+SBF77fHaw==
X-Received: by 2002:a05:600c:4189:b0:425:64c4:e016 with SMTP id 5b1f17b1804b1-42564c4e12emr14901965e9.12.1719494160097;
        Thu, 27 Jun 2024 06:16:00 -0700 (PDT)
Received: from mib-penguin.. ([87.114.84.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bc60f9sm26944415e9.46.2024.06.27.06.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:15:59 -0700 (PDT)
From: Matthew Bullock <mbullock@thegoodpenguin.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Matthew Bullock <mbullock@thegoodpenguin.co.uk>
Subject: [PATCH] openssh: allow configuration of hostkey type
Date: Thu, 27 Jun 2024 14:15:56 +0100
Message-ID: <20240627131557.2047296-1-mbullock@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 13:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201202

Allow selection of host key types used by openssh via PACKAGECONFIG.
Any combination of hostkey-rsa, hostkey-ecdsa and hostkey-ed25519 can be
specified. Default to just generating ecdsa keys.

The current default generates all three keys. This can take a
significant amount of time on first boot. Having all three keys does not
significantly increase compatability. Also RSA keys are being deprecated
as they are no longer considered secure. Using just an ecdsa key reduces
key generation time by roughly 75%.

Signed-off-by: Matthew Bullock <mbullock@thegoodpenguin.co.uk>
---
 .../openssh/openssh_9.7p1.bb                  | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index ab453f7bbe..0bc14c5553 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -56,7 +56,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 # systemd-sshd-socket-mode means installing sshd.socket
 # and systemd-sshd-service-mode corresponding to sshd.service
-PACKAGECONFIG ??= "systemd-sshd-socket-mode"
+PACKAGECONFIG ??= "systemd-sshd-socket-mode hostkey-ecdsa"
 PACKAGECONFIG[fido2] = "--with-security-key-builtin,--disable-security-key,libfido2"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
@@ -64,6 +64,9 @@ PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
 PACKAGECONFIG[systemd-sshd-socket-mode] = ""
 PACKAGECONFIG[systemd-sshd-service-mode] = ""
+PACKAGECONFIG[hostkey-rsa] = ""
+PACKAGECONFIG[hostkey-ecdsa] = ""
+PACKAGECONFIG[hostkey-ed25519] = ""
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
@@ -127,13 +130,31 @@ do_install:append () {
 	install -m 644 ${UNPACKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
 	install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
 
+        # Enable specific ssh host keys
+	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)}; then
+	    echo "HostKey /etc/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config
+        fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)}; then
+	    echo "HostKey /etc/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config
+        fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',d)}; then
+	    echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config
+        fi
+
 	# Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
 	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
-	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
-	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
-	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)}; then
+	    echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
+        fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)}; then
+	    echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
+        fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',d)}; then
+	    echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
+        fi
 
 	install -d ${D}${systemd_system_unitdir}
 	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true','false',d)}; then
-- 
2.43.0


