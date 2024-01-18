Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD504C4725D
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 02:15:01 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.2123.1705544099478288096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 18:14:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MmAHBc5i;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d5f38313f9so1906285ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 18:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705544098; x=1706148898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIIxRzHQ2qZRXxW73V6Lw7qTeXQoDqyBvaMDWDSIVdY=;
        b=MmAHBc5iMY7moH6DxwN1mdTP+LymKOfyMr8Ip9BGDv4IvsM60MTOQ/VaAsDtMKVCUj
         eM4sU2OAZ4g+1ApEmbCtUd6UGJYbndpjxLe39PtUZ85VEE9MnJshHB1AH/dua/DAkHZz
         rFu20+D8RyRj9659iiVPlc2723xvC3NQSIh50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705544098; x=1706148898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIIxRzHQ2qZRXxW73V6Lw7qTeXQoDqyBvaMDWDSIVdY=;
        b=aUGiOBRJ8pg6+AIOenoLMDxvSVeljJDo3EF+X9zzD/oA0MSc543uGEP/7xIQJXq/Bs
         UxQBifmxLsxddAyjAprxbeM+qo2rbUlv5JOEUcEYO6iL2r58J10p0STgVWnBmNQVOhI8
         1F5BHs6abV0ASAMM23wyj3/0OYRi9J2Qp/hbh67ZYpzqx7csu4kzcmSQVm0dPS0vuAxV
         pwBgVust40YeuJ2ow71Cr/t4nK8U9dYWuEC/SB3xHhEAcEUfhqvNnvRWKbzPO/YiOFKR
         xUqASnixzTy5UrThp5hpFdhTdoYoxH+8bvw9tQB0VWT0IcU7PvYvSvOzM4kHU8p9ZCPs
         1AYw==
X-Gm-Message-State: AOJu0YyIhvUzHVT1Zt0RNcFSRXFWw+xjo5nfBFO2UjP/Feq1FW1KBn4e
	IfAQwoXqybmQpgagEtdW6hhqMwx070lBZIH4fxw8UhG4jIywDwmEmzU8ooAxHvapx3byGjRm7Hv
	I
X-Google-Smtp-Source: AGHT+IFShDnYSV2cCmg2Cel9Cn9+B127LU2wWdjLowXCx42nyfVaoTpXz4qPYvoCllyebkrbo1HZdg==
X-Received: by 2002:a17:902:c389:b0:1d5:6114:b4e8 with SMTP id g9-20020a170902c38900b001d56114b4e8mr2666909plg.41.1705544098126;
        Wed, 17 Jan 2024 18:14:58 -0800 (PST)
Received: from MVIN00020.mvista.com ([122.174.86.95])
        by smtp.gmail.com with ESMTPSA id s16-20020a639250000000b005c200b11b77sm355240pgn.86.2024.01.17.18.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 18:14:57 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] openssh: Backport fix for CVE-2023-51385
Date: Thu, 18 Jan 2024 07:42:44 +0530
Message-Id: <20240118021244.5841-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193953

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openssh/openssh/CVE-2023-51385.patch      | 96 +++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch
new file mode 100644
index 0000000000..ae084053f8
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch
@@ -0,0 +1,96 @@
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
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a]
+CVE: CVE-2023-51385
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ ssh.c | 39 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 39 insertions(+)
+
+diff --git a/ssh.c b/ssh.c
+index 15aee56..2cf0b64 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -583,6 +583,41 @@ set_addrinfo_port(struct addrinfo *addrs, int port)
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
+@@ -1067,6 +1102,10 @@ main(int ac, char **av)
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
+-- 
+2.25.1
+
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


