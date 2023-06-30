Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3744C001B3
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.3834.1688092165133038583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WohMBv6w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-66c729f5618so1274423b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092164; x=1690684164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Dk9Dh734j6iFpU1322yp4MXgSxUSe63hu5Wy+a9T/I=;
        b=WohMBv6wTEyIccK+1LmOm716J+hoD6ywF7nkYEvuVkf1zHcX42SImGOYptNrXcaGIb
         jN6FCUFeVbuZT6fSPIByBFSdEvQpLNJPB1FYOC5ZOEsfsbkVzigB+A38lMhCyg+AV78s
         OF8SS+pkVqU1e2AcdAZp309OLj8MsVbDEFCy4eVphpztqdnL0O5difLRZZx017sH9p5D
         hTEE3PtuMZ11/cB6iuLyUC2y3jqOvOWzCLmL2xVKy60bE2tGInoVsro8ocspWrQH9tcS
         ybBVRETCOkQ3+XT5KbIvgp0fzi5YZTJ/48Wc7QJmrAMpYcJt7bWrRCpC9p4U/O58Dstf
         Hx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092164; x=1690684164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Dk9Dh734j6iFpU1322yp4MXgSxUSe63hu5Wy+a9T/I=;
        b=H6iK3HmFJQIJt5BZvdIHpFmb2nycpMygGwLVukiK6lyVcDQWHP9ZsojLLaBIYGB+R6
         yVjElBhykPIqPwf0M41RPO7TDYvAhJ8ZszjzaQD56HBs8SOCWzg4ysuFOD7oiq7SaDcS
         fwPGhjCFlffeZPGpJ6xLoxywrfSrmrLQDa6BwmJslXQnr5t0a4k6fpyCNAxA/LDq/I6u
         prFPW0LCrb7AUjD76BAYEXgXg48euVd24qN5xwMTgzLBxl4egYOsyxd642co/fbSrlNL
         V9WqXwVcinUHwse4n0k1np9fM8EOLhdgJ0pNU6JJQiEfpPIJQiYwxlJg4CaVaNuyYPcg
         N0Vw==
X-Gm-Message-State: AC+VfDzfbLg2i18Qr6wkZFNpJTsdta6BEmrSBP79xcTeQpFMwc4/U/3H
	hjtrNHXc9oKdqvoNnHcTjbi1iuIRNX3sVqzuYe6Xmw==
X-Google-Smtp-Source: ACHHUZ6F9WgAHptCojIQUFnbigaR3lRBAfbVNgzqMloEGI0AS6xsV/FzOeJ8NDhx0XgHEIu2degXUg==
X-Received: by 2002:a05:6a20:4419:b0:12c:567b:2787 with SMTP id ce25-20020a056a20441900b0012c567b2787mr1818337pzb.19.1688092164062;
        Thu, 29 Jun 2023 19:29:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/30] systemd: fix a dead link under /var/log
Date: Thu, 29 Jun 2023 16:28:43 -1000
Message-Id: <7702dc8fc6c9b34647067ffabbc0e24d6109abe7.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183647

From: Changqing Li <changqing.li@windriver.com>

Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
install README.logs under systemd doc dir.

But for OE, systemd doc dir is splited into package systemd-doc, when it
is not installed on the target, there will be an dead link:
Eg:
root@intel-x86-64:/var/log# ls -l README
lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory

Meantime, relative path for a symlink also will meet issue like
"No such file or directory"

Since OE have set ForwardToSyslog=yes, this README is not needed.
So remove this symlink from package systemd

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...on-t-create-symlink-README-in-this-f.patch | 42 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_253.1.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch
new file mode 100644
index 0000000000..a2644bba8e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch
@@ -0,0 +1,42 @@
+From b17826490c1db2051dda23550ebdcd7f10e23479 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 28 Jun 2023 13:49:41 +0800
+Subject: [PATCH 1/2] legacy.conf.in: Don't create symlink README in this file
+
+Commit 6fe23ff31c0 changed README to an symlink to README.logs, and
+install README.logs under systemd doc dir.
+
+But for OE, systemd doc dir is splited into package systemd-doc, when it
+is not installed on the target, there will be an dead link:
+Eg:
+root@intel-x86-64:/var/log# ls -l README
+lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
+root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
+ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory
+
+So remove this symlink from package systemd
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tmpfiles.d/legacy.conf.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
+index 4f2c0d7c43..62e2ae0986 100644
+--- a/tmpfiles.d/legacy.conf.in
++++ b/tmpfiles.d/legacy.conf.in
+@@ -12,9 +12,6 @@
+ 
+ d /run/lock 0755 root root -
+ L /var/lock - - - - ../run/lock
+-{% if CREATE_LOG_DIRS %}
+-L /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
+-{% endif %}
+ 
+ # /run/lock/subsys is used for serializing SysV service execution, and
+ # hence without use on SysV-less systems.
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core/systemd/systemd_253.1.bb
index f306765168..59a0ab757f 100644
--- a/meta/recipes-core/systemd/systemd_253.1.bb
+++ b/meta/recipes-core/systemd/systemd_253.1.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
            file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


