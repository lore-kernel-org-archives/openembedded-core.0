Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9869CC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 07:34:33 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.6355.1705563269232529361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 23:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N+QUkPxI;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6daf9d5f111so9737473b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 23:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705563268; x=1706168068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7J8dJCaYoDxnGoWrvUpqO4Xr3jvGevzXZE51W+YAEp0=;
        b=N+QUkPxIJJpXaWHLharSB3EynaYN8/MiPSzFGai/bFZiRX5DhMGR2KlOvuieath/Lc
         B+RCMMBtUJqkyuGMH4TUqq/BlgYAUPH2nT6wd8eTHsbV9RXoKLsLdhEX361AV/sAauaI
         hr09nqiCUtTetcx9WFwjE8yIN0JKIV7nwXO8H3nsLZCodvT5VqnMKms3mSSG82AM9Hkx
         kLFNu7i/cX1xhGgeCsFcA1Kt71DTmZjrnywkVMOAOJg3Wt1VAPFRABpr8BngkQs8piix
         W3YWCg0+/iO7V5zCfyfRVsxBJ/C+tOARXwtb2XD/gdw0lkRuOzHNovNqPv19/+i4UIK4
         uhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705563268; x=1706168068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7J8dJCaYoDxnGoWrvUpqO4Xr3jvGevzXZE51W+YAEp0=;
        b=eDRF8w9RqvVLjfZkcAIVGKw6WdYNVaV5T2QNVzgy3v2ADbnSRaZy/Wc2UySloMOMZc
         Di9IvyGGaXC26rdxasERe02EEPmE3iOfUqOt4G9wyl4t6XBTtKbBroHRw2eVC/vpJtV7
         xdmvlZIStSOxNYYUBIr2pzHQZNR/Kh3v+HjX+dIkdP13W8YrnMjljT9a9D8RBT5/6oPN
         wJbbfLTLcv6d5iN8JFSdQwVS7YoX3TFLGjFpbjJNZIwM2Y64zXorP5XaLLgn4Z4aIOoK
         WxGZe4NQCWomOsOt/odD8WCcRo2al6N2Q/70Qsk7c1UEJrJXW4nZ0rrtddaz8TCGPokc
         c/lw==
X-Gm-Message-State: AOJu0YyBVX1FdtFtREiTqPuo5gXhSBSfbmimCYf0NVmYM/IhyzaEUqMO
	6QRAbdijjNP3A0qVJP/A1uNpvXWRfj+iqVEmndOB6fiSlxxDTefAiFPKvXUrFIU=
X-Google-Smtp-Source: AGHT+IHNbWZ35fPlqZNFP+XmZ2+HwHSyBMycEqf8q7gLcBmXkEMjjFzsqSeaDwQRBY2zm/HgrgLGYg==
X-Received: by 2002:a62:6141:0:b0:6d9:ac6f:20b4 with SMTP id v62-20020a626141000000b006d9ac6f20b4mr401325pfb.42.1705563267677;
        Wed, 17 Jan 2024 23:34:27 -0800 (PST)
Received: from LL-2917.kpit.com ([2402:a00:404:fd88:e531:5bb4:c102:5e3e])
        by smtp.gmail.com with ESMTPSA id ka7-20020a056a00938700b006db0907e696sm2612837pfb.6.2024.01.17.23.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 23:34:27 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][dunfell][PATCH] openssh: Fix CVE-2023-51385
Date: Thu, 18 Jan 2024 13:04:08 +0530
Message-Id: <20240118073408.1092886-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 07:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193964

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

OS command injection might occur if a user name or host name has shell
metacharacters, and this name is referenced by an expansion token in
certain situations. For example, an untrusted Git repository can have a
submodule with shell metacharacters in a user name or host name.

This patch fixes the above issue

Link: http://archive.ubuntu.com/ubuntu/pool/main/o/openssh/openssh_8.2p1-4ubuntu0.11.debian.tar.xz
Link: https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../openssh/openssh/CVE-2023-51385.patch      | 95 +++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch
new file mode 100644
index 0000000000..0ba8c312d0
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch
@@ -0,0 +1,95 @@
+From 7ef3787c84b6b524501211b11a26c742f829af1a Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 18 Dec 2023 14:47:44 +0000
+Subject: [PATCH] upstream: ban user/hostnames with most shell metacharacters
+
+This makes ssh(1) refuse user or host names provided on the
+commandline that contain most shell metacharacters.
+
+Some programs that invoke ssh(1) using untrusted data do not filter
+metacharacters in arguments they supply. This could create
+interactions with user-specified ProxyCommand and other directives
+that allow shell injection attacks to occur.
+
+It's a mistake to invoke ssh(1) with arbitrary untrusted arguments,
+but getting this stuff right can be tricky, so this should prevent
+most obvious ways of creating risky situations. It however is not
+and cannot be perfect: ssh(1) has no practical way of interpreting
+what shell quoting rules are in use and how they interact with the
+user's specified ProxyCommand.
+
+To allow configurations that use strange user or hostnames to
+continue to work, this strictness is applied only to names coming
+from the commandline. Names specified using User or Hostname
+directives in ssh_config(5) are not affected.
+
+feedback/ok millert@ markus@ dtucker@ deraadt@
+
+OpenBSD-Commit-ID: 3b487348b5964f3e77b6b4d3da4c3b439e94b2d9
+
+CVE: CVE-2023-51385
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: Hunks refreshed to apply cleanly
+
+---
+ ssh.c | 41 ++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 40 insertions(+), 1 deletion(-)
+
+diff --git a/ssh.c b/ssh.c
+index 35c48e62d18..48d93ddf2a9 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -583,6 +583,41 @@ set_addrinfo_port(struct addrinfo *addrs
+ 	}
+ }
+ 
++static int
++valid_hostname(const char *s)
++{
++	size_t i;
++
++	if (*s == '-')
++		return 0;
++	for (i = 0; s[i] != 0; i++) {
++		if (strchr("'`\"$\\;&<>|(){}", s[i]) != NULL ||
++		    isspace((u_char)s[i]) || iscntrl((u_char)s[i]))
++			return 0;
++	}
++	return 1;
++}
++
++static int
++valid_ruser(const char *s)
++{
++	size_t i;
++
++	if (*s == '-')
++		return 0;
++	for (i = 0; s[i] != 0; i++) {
++		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
++			return 0;
++		/* Disallow '-' after whitespace */
++		if (isspace((u_char)s[i]) && s[i + 1] == '-')
++			return 0;
++		/* Disallow \ in last position */
++		if (s[i] == '\\' && s[i + 1] == '\0')
++			return 0;
++	}
++	return 1;
++}
++
+ /*
+  * Main program for the ssh client.
+  */
+@@ -1069,6 +1104,10 @@ main(int ac, char **av)
+ 	if (!host)
+ 		usage();
+ 
++	if (!valid_hostname(host))
++		fatal("hostname contains invalid characters");
++	if (options.user != NULL && !valid_ruser(options.user))
++		fatal("remote username contains invalid characters");
+ 	host_arg = xstrdup(host);
+ 
+ 	/* Initialize the command to execute on remote host. */
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index eb3089cd8a..9d6cf7da6c 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-38408-11.patch \
            file://CVE-2023-38408-12.patch \
            file://CVE-2023-48795.patch \
+           file://CVE-2023-51385.patch \
            "
 SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
-- 
2.25.1


