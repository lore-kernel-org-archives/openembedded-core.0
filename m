Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55266C3DA64
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 14:29:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.35413.1722176952452562892
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 07:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LT/MPh8A;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3687f8fcab5so716858f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722176950; x=1722781750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5IwnLKiAxhU8CLbasyWMCdwThcZogec8JA7tNlU3uI4=;
        b=LT/MPh8ADYyNoIdzYYgG6IBzbI5E9CbxPtt5znJM3bg/jRXUCOybLAUR2w5eApva6q
         rOkN4SgGsY5hvqzpNmdYV2pc/4ygYhE3dwFbOS+4t6nk3CwsLqd59Ms4UNAszTlffixO
         OIO2t05rQinmgkXvmDH213B33msi1cmeshW41Ao1mH28ghb7aVDQn04Fc7MNNOIFSsNC
         GCoWgId19TiqnXTNOHz5Uyje8lbYwmUWxKkEichdMxNEfgOy5lImWzpUKwWB0juK1Khn
         zVA8Z3pFIKoolRL6uvH533xR3s5yalGjlTTItTlZ7GhcZWpPFAtToCsn4UX2BaPGzZ6X
         Uagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722176950; x=1722781750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IwnLKiAxhU8CLbasyWMCdwThcZogec8JA7tNlU3uI4=;
        b=al8GZoz1jy9tOdwXd3VLXMSJ8DNrHhRyA7e55RUoxrftoinexOIY3iVqk8yMJs3yib
         rK9IkfI/6BxWYFDUFm5A4y9quh8Cc+/NecKZT5DmlaBdjsxAoVihCeidgDrhnrQG7+PU
         8TJCng+4JYhytnxTJEmzLfapqXUBtoiJZTP7Z3mxNS6osmxzIfBX4ToQJ+nmkSmo0uNb
         mgMnRO8MSXeZZEhnxwSRUB8VzJsS28B4dTI1bPhT/CgDowMKxiQTabsKhaYFcOqAop8w
         QtMuzroUjHyWxikbE+cGI1RXKgeDTMjQsr5okvLwu6TFgILW/3dBLrV81xCHk7XeT2uz
         GWgw==
X-Gm-Message-State: AOJu0Yz2cQhvgLCKXfAIqD1GhJufR2HcV7rEOgy8+bsywc20WN7ofLLP
	Aa/Ip5sHgY1OA0wiNEqX/vyZQLYLJE/6tcqF3EuIRJLWEI+z6CoT5wqkYQ==
X-Google-Smtp-Source: AGHT+IGUUMVEMoEMUw/8IM1AaH0adbNZZTfmI/kP1hbqw2ALBWdxbQIEQ6VrDvjTE0IqOWfCwRiLww==
X-Received: by 2002:a5d:5f51:0:b0:35f:1f8a:e69a with SMTP id ffacd0b85a97d-36b5d073f43mr5422599f8f.49.1722176949856;
        Sun, 28 Jul 2024 07:29:09 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36861b54sm9865670f8f.95.2024.07.28.07.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 07:29:09 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3] rpcbind: Fix boot time start failure
Date: Sun, 28 Jul 2024 16:29:06 +0200
Message-ID: <20240728142906.1297662-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 14:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202568

With commits 90bc1810 ("bitbake.conf: Add runtimedir") and
561e853e ("rpcbind: Specify state directory under /run") rpcbind
still can fail during startup with:

  rpcbind: /var/run/rpcbind.lock: Read-only file system

The lockfile is hardcoded as "/var/run/rpcbind.lock".
While it should use the same internal define "RPCBIND_STATEDIR"
as the paths for rpcbind.xdr and portmap.xdr, it's not necessary
to be patched because of the default value of ${runtimedir} and
the presence of the /var/run -> /run symlink.

Using --with-statedir=/run/rpcbind adds the line

  RequiresMountsFor=/run/rpcbind

to the service but it doesn't guarantee that /run is writable yet
when rpcbind.service starts. Add this guarantee by running
rpcbind.service with systemd-tmpfiles-setup.service and add the
tmpfiles.d entry for /run/rpcbind.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.systemd  |  3 +++
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles |  1 +
 meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb         | 10 ++++++++++
 3 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.systemd
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.systemd b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.systemd
new file mode 100644
index 0000000000..5765751326
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.systemd
@@ -0,0 +1,3 @@
+[Unit]
+# Make sure the runtime directory exists
+After=systemd-tmpfiles-setup.service
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
new file mode 100644
index 0000000000..fecee72c09
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
@@ -0,0 +1 @@
+d /run/rpcbind 0755 root root -
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index e751eb631c..aeca86e564 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
            file://rpcbind.conf \
+           file://rpcbind.tmpfiles \
+           file://rpcbind.systemd \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
@@ -49,7 +51,15 @@ do_install:append () {
 		${UNPACKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
 	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
 	install -m 0644 ${UNPACKDIR}/rpcbind.conf ${D}${sysconfdir}/rpcbind.conf
+
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	install -m 0644 ${UNPACKDIR}/rpcbind.tmpfiles ${D}${sysconfdir}/tmpfiles.d/rpcbind.conf
+
+	install -d ${D}${systemd_system_unitdir}/rpcbind.service.d
+	install -m 0644 ${UNPACKDIR}/rpcbind.systemd ${D}${systemd_system_unitdir}/rpcbind.service.d/rpcbind.conf
 }
 
+FILES:${PN} += "${systemd_system_unitdir}/rpcbind.service.d/rpcbind.conf"
+
 ALTERNATIVE:${PN} = "rpcinfo"
 ALTERNATIVE_LINK_NAME[rpcinfo] = "${bindir}/rpcinfo"
-- 
2.45.2


