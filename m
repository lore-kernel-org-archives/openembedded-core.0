Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A59C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 16:47:53 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.2024.1711039668234399850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 09:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J66RdeyT;
 spf=pass (domain: konsulko.com, ip: 209.85.210.194, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-6e6c8823519so1158303b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711039667; x=1711644467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3lHlKdpAwsC9udW80qafvyvRxQ/wZf8sZsBcVtoeJpI=;
        b=J66RdeyTAq+YYIvIlp/KSGu5FyA8e1cCujQeTYoummRIiCxRm/TLRLlRmyzHnX6ml4
         SdJ/BU2jnpHTWTjXnzb+kizIRlor6PQaYQYdP/XeRxTpoKGpAqKYIMvsySSseyvs9W4Q
         hX8uRn2ojR1X2xJndGOq1gK1voZF9OPtuIlCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711039667; x=1711644467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lHlKdpAwsC9udW80qafvyvRxQ/wZf8sZsBcVtoeJpI=;
        b=IV2EuHrkin0EG4rOu1vkg+hZvzaBIENzBf4T7D+jrS4uvJusb7OvQ7IOpowa5KlUNd
         zLVAunRN901Su87+I99xzKC3i9wpzMYsecCDrucvUOG7ZB8OsScJnZfZR38pxsOBhkrw
         JkInktomVDBqv2kn0QGaMFPGTmWguEhMsLdHBbpC0B+JPiJvVqVklxqFRMxz7Ll9W2qG
         qV4ZCchGl7vyta+HNZoTK+jHJsD8+ix4A0AbWg09ZbgJ53XWjXTKKwK3LC0e3ra1eVIj
         DAVYzXiw3A8RnjgiziNWncxv6WvYtwYOd4Mwzp2/cjXUK19RluU95BXwxspGR9AOxeCQ
         A9wQ==
X-Gm-Message-State: AOJu0Yzf99P2b1fi/T45u1lf2Uq/pfp/5KWh9Li2qMGkZmTaGbSmFWi6
	Lw6APmMUXVJgg+MW1D7alOYCdNYBmXX2H7FwSz+JwKyT7mJDm5a+8ETbN3KFCsHaPyyXICdViwZ
	oqz2samhR
X-Google-Smtp-Source: AGHT+IHKqgEMf3V5M1nTXdt+0WBakUyPW1WTO52+qpBU1ngvDxFvgmlRgGaCgfdKL9Z0lo6fds0sWQ==
X-Received: by 2002:a05:6a00:194d:b0:6e7:8dd:ed9a with SMTP id s13-20020a056a00194d00b006e708dded9amr11300173pfk.24.1711039666858;
        Thu, 21 Mar 2024 09:47:46 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:a6c9:844b:4ad3:946e])
        by smtp.gmail.com with ESMTPSA id x14-20020a62fb0e000000b006e641fee598sm43190pfm.141.2024.03.21.09.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 09:47:46 -0700 (PDT)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] opkg: retry opkg_lock
Date: Thu, 21 Mar 2024 09:47:44 -0700
Message-Id: <20240321164744.3007283-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 16:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197418

When systemd is enabled, we can get into a race condition
between run-postinsts and systemctl restarting services.

If we fail to create the lock file (or fd), then
sleep 10 seconds and retry up to 5 times.

[YOCTO #15428]

Patch submitted upstream to opkg:
https://lists.yoctoproject.org/g/opkg/message/60

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...kg_lock-retry-if-we-fail-to-get-lock.patch | 59 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.3.bb      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg_lock-retry-if-we-fail-to-get-lock.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_lock-retry-if-we-fail-to-get-lock.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg_lock-retry-if-we-fail-to-get-lock.patch
new file mode 100644
index 00000000000..863667fe400
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_lock-retry-if-we-fail-to-get-lock.patch
@@ -0,0 +1,59 @@
+From cdc7d347f41a7095ba0e29515951a1394c632479 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Wed, 20 Mar 2024 23:00:31 -0700
+Subject: [opkg][PATCH] opkg_lock: retry if we fail to get lock
+To: opkg@lists.yoctoproject.org
+
+When systemd is enabled, we can get into a race condition
+between run-postinsts and systemctl restarting services.
+
+If we fail to create the lock file (or fd), then
+sleep 10 seconds and retry up to 5 times.
+
+[YOCTO #15428]
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/60]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ libopkg/opkg_conf.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
+index 4dc777b..03bb40a 100644
+--- a/libopkg/opkg_conf.c
++++ b/libopkg/opkg_conf.c
+@@ -660,14 +660,24 @@ int opkg_lock()
+         return -1;
+     }
+ 
+-    r = lockf(lock_fd, F_TLOCK, (off_t) 0);
++    int retry = 5;
++    do {
++        r = lockf(lock_fd, F_TLOCK, (off_t) 0);
++        if (r == -1) {
++            opkg_perror(INFO, "Could not lock %s, retry %d", opkg_config->lock_file, retry);
++            r = close(lock_fd);
++	    if (r == -1)
++                opkg_perror(ERROR, "Couldn't close descriptor %d (%s)", lock_fd,
++                            opkg_config->lock_file);
++	    retry--;
++            sleep(10);
++        }
++    }
++    while (retry > 0 && r == -1);
++
+     if (r == -1) {
+         opkg_perror(ERROR, "Could not lock %s", opkg_config->lock_file);
+-        r = close(lock_fd);
+-        if (r == -1)
+-            opkg_perror(ERROR, "Couldn't close descriptor %d (%s)", lock_fd,
+-                        opkg_config->lock_file);
+-        lock_fd = -1;
++	lock_fd = -1;
+         return -1;
+     }
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.3.bb b/meta/recipes-devtools/opkg/opkg_0.6.3.bb
index 9592ffc5d6d..b4c7c114bcb 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0001-libopkg-Use-libgen.h-to-provide-basename-API.patch \
+	   file://0001-opkg_lock-retry-if-we-fail-to-get-lock.patch \
            file://run-ptest \
            "
 
-- 
2.34.1


