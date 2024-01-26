Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A70C48260
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:21:12 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.17136.1706278862639591412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e0r7KXT1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d8a66a2976so3484645ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706278862; x=1706883662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5cGfHxREbePcxWdvW5ZTwedQGQAx4O7GTWgduO5ipc=;
        b=e0r7KXT1Qtm01tbswQvImTnL2EXMvSJZEqM73XKrGUoJkL1m74kj9WaKa9EmEPzskg
         4U3q17yt4B03W8VlkQKOnpTfVAHbA0DVTBbI8eOgVcuJE4DLlNn8XNyAvip6UQWLskQ8
         xZVS3wy6t/iwj4rBUuBkAtdgR05o8YHzF/L73qx0KZmOM4r19LQQ/wnZZsHwSlPkiegA
         aWmHEEISxG3RFytCOTHGhrkm4ge4sYYeyrS6+U58GINEi6ptqMgZ5fhmWptCnj6Y3a/L
         /Yz/eeVZkoPX4dlj5D+rwdXjwIm/e1D8jhXnnEMYeeSn5AIxzVLE+L3KnJMODObGhz9j
         TpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278862; x=1706883662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5cGfHxREbePcxWdvW5ZTwedQGQAx4O7GTWgduO5ipc=;
        b=noHQ2YAXarLMSke5zQ99/dOP761F5b4y30JvgNWOLLsJy40YeWmNCQXps1TWOSiMpU
         2vBsq2gY5HfBiromdz0cWiw9Sq2U1T2Z6R5rWrdg3jbDcArf7U8l27l+gD/O+5RSHGl2
         ByeLDyqDvOIxiexL9LT2hf6E6F8SJsNIkGEcgJPReBcL7oeXjEJXcjx4CClgGFMosMX8
         3+ku8IAIEtrwI9iuQ10xgYkpZMjtQQVXxR3FOWSohshkLu3hZe0BDybkxfd5GZTMmauF
         HFx0B84kApafQEFUef3Ed5vr66Ypx0b8AvdJzsQs+E7/7a8yl5mI/gc6+Ppk0S/ZkFqY
         0UPw==
X-Gm-Message-State: AOJu0YzAjfkxqHQv2oQDG4Ev2b9BGaqTBIx9rL25pD4CQ9mMbyafD9ZA
	prir9PXfv42VSNYZnE3Bhb0UJIbp7TE4qDEtucBos5vb6SQn5Vl/I9Y5XEL6CVRvgw9Uh7VOmiq
	FMBM=
X-Google-Smtp-Source: AGHT+IG2tVEBdW5iJQruvk6rs7I3/ecCzOByJc1bN/0ozRgSjRczYQ3CzkHtKsHIqqx2D9Lpgp+rJQ==
X-Received: by 2002:a17:90a:9501:b0:28e:47dc:325e with SMTP id t1-20020a17090a950100b0028e47dc325emr1035443pjo.61.1706278861665;
        Fri, 26 Jan 2024 06:21:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id rr14-20020a17090b2b4e00b0029095a896c8sm1136458pjb.40.2024.01.26.06.21.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:21:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/8] openssh: Fix CVE-2023-51385
Date: Fri, 26 Jan 2024 04:20:34 -1000
Message-Id: <a0561ca36bd3be8f44d11908caaf8c9ce5f69032.1706278642.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706278642.git.steve@sakoman.com>
References: <cover.1706278642.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194375

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


