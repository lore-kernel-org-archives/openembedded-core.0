Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2331CCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:43 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.3123.1760733576527625863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pxQeNIkD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so2429476b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733576; x=1761338376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zDgawpPAavs3NmSyipQJwxq4H7zzxmRbs1axoU6Z+g=;
        b=pxQeNIkDzCNSjteOEK92NxxsszJZqMje5VH7N1+2hM6G7+GwWRJkOtr7JeL4bYda06
         f6WKrCoXDlNXCMRskK+4yHwk34FkmSaa+X10fbSaALfokkSOHXTNrXJ06me7wZnlpbkl
         4rTVlxZQpf5ceyccES8iOy03A32zfCEjDPbKHno9G58qm04MklwM0MQUFU0PTJ1sX/fV
         v4pFzONkbQwJpToPlZjV0KoyGHVwwSl23C7lregghCotexrlBnHFEV0emr2xbpfi6kpN
         7Uy6V9DoIh257tYSdj5bPK2t9G6KQUK/Svhhtfzk0bHeRXQWt9a0MjmUx4Fq4/6fQp81
         pQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733576; x=1761338376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zDgawpPAavs3NmSyipQJwxq4H7zzxmRbs1axoU6Z+g=;
        b=vTKbCbXdwmp+JGaSQcwv9Edfhcxuo0yufT5Yxa1zSPs6hcvnZExahvbzrJM9Rejj5N
         oudC3GQ2Rjv1jnD9AfbtoJ2RwxwxanJYC2trnYLJ/fBOABNwhmIoeONEGdMVs5jwMtvT
         3W//55AwS2ikGYy2XGSJzE0IF3R1qtyQ6q4UsJbaRfvzkleyNhWyn8FVRtNv9hk1B2Wi
         Fh5czgowSAlR1y0Mg9B75RSVPBEImaN4lDOIP+7wbJKhtpcMBXznMQBxB0AFY/EMYRdg
         ySTyWqxvMz7832U+MOh9gos6ObeebkYPhcKZbq52vrcGelEa+cCJkIprtYuCsJh+cceq
         ZiiQ==
X-Gm-Message-State: AOJu0YwnuOlr33t6KdAFOeT1vCSAa1YauJJZbwNSGmvp0AAhEJnT2kAn
	ckPFYWpwqRd0yy6QBE94h4PYRPgP9A9fscIaNP92Qe4ns1IvXJxhyZvv+Vfo5LWefaxIQWqwwCa
	bh9zgQ2o=
X-Gm-Gg: ASbGncuyQ7czQrI8lK2Pb5m+ijSigUOd+ubD3F4OSmJFowdDKohTaVtjwotM4+mPuPX
	ZuRuno1OJPiT1AivjKrm/Ztig9k6ya4pcGfN+zsqQ6BjsOzc0MhuX/tGjY7v19oBt0/qofeyAlR
	5qw1yAI65PjFJ0t222A/A7dZCu+r+RNvrOgme/2FJmabsMpLzVxD2Kfg+38sGdS/rNxQkDyKfDp
	G2AoriwWuffZWh+iVa6RZqGLada7w85EPMqdClNgzPwGFN7hs0RJ7oUlvngVLw7aNgo7Q31DrgK
	ROjCRmvvCCi/mhbZMShBxsnGrYb9fIZHlX4PzvH6mJJXALUYHicNghdbWmgh6FmFLKUm7SOzD7R
	lqMrT8zC4qiPln52v72SycnEzJ71xL7HlDaz2AIIQkvcnTqJ6uMWLMHfuzqWwjfXGVA==
X-Google-Smtp-Source: AGHT+IHNobb8DW+i11th+FOSlM4IqG76bP/S4f+d/T2IKqv55vP3Ahid40iURn9Wxt/JqT4jLOmTsg==
X-Received: by 2002:a05:6a00:2d01:b0:774:615b:c8ad with SMTP id d2e1a72fcca58-7a220a4a54bmr5713507b3a.9.1760733575664;
        Fri, 17 Oct 2025 13:39:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/26] openssh: fix CVE-2025-61984
Date: Fri, 17 Oct 2025 13:38:51 -0700
Message-ID: <717d4c7609cdce2cc3a65b7ba69c316fa86a9333.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225042

From: David Nyström <david.nystrom@est.tech>

ssh in OpenSSH before 10.1 allows control characters in usernames that
originate from certain possibly untrusted sources, potentially leading
to code execution when a ProxyCommand is used. The untrusted sources
are the command line and %-sequence expansion of a configuration file.

Note:
openssh does not support variable expansion until 10.0, so backport
adapts for this.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-61984

Upstream patch:
https://github.com/openssh/openssh-portable/commit/35d5917652106aede47621bb3f64044604164043

Signed-off-by: David Nyström <david.nystrom@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2025-61984.patch      | 125 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
new file mode 100644
index 0000000000..f705410b24
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
@@ -0,0 +1,125 @@
+From d45e13c956b296bf933901c4da2b61eb2ccd7582 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 00:29:09 +0000
+Subject: [PATCH] upstream: Improve rules for %-expansion of username.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Usernames passed on the commandline will no longer be subject to
+% expansion. Some tools invoke ssh with connection information
+(i.e. usernames and host names) supplied from untrusted sources.
+These may contain % expansion sequences which could yield
+unexpected results.
+
+Since openssh-9.6, all usernames have been subject to validity
+checking. This change tightens the validity checks by refusing
+usernames that include control characters (again, these can cause
+surprises when supplied adversarially).
+
+This change also relaxes the validity checks in one small way:
+usernames supplied via the configuration file as literals (i.e.
+include no % expansion characters) are not subject to these
+validity checks. This allows usernames that contain arbitrary
+characters to be used, but only via configuration files. This
+is done on the basis that ssh's configuration is trusted.
+
+Pointed out by David Leadbeater, ok deraadt@
+
+OpenBSD-Commit-ID: e2f0c871fbe664aba30607321575e7c7fc798362
+
+Slightly modified since variable expansion of user names was
+first released in 10.0, commit bd30cf784d6e8"
+
+Upstream-Status: Backport [Upstream commit https://github.com/openssh/openssh-portable/commit/35d5917652106aede47621bb3f64044604164043]
+CVE: CVE-2025-61984
+Signed-off-by: David Nyström <david.nystrom@est.tech>
+---
+ ssh.c | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+index 48d93ddf2..9c49f98a8 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -649,6 +649,8 @@ valid_ruser(const char *s)
+ 	if (*s == '-')
+ 		return 0;
+ 	for (i = 0; s[i] != 0; i++) {
++		if (iscntrl((u_char)s[i]))
++			return 0;
+ 		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
+ 			return 0;
+ 		/* Disallow '-' after whitespace */
+@@ -671,6 +673,7 @@ main(int ac, char **av)
+ 	int i, r, opt, exit_status, use_syslog, direct, timeout_ms;
+ 	int was_addr, config_test = 0, opt_terminated = 0, want_final_pass = 0;
+ 	char *p, *cp, *line, *argv0, *logfile;
++	int user_on_commandline = 0, user_was_default = 0;
+ 	char cname[NI_MAXHOST], thishost[NI_MAXHOST];
+ 	struct stat st;
+ 	struct passwd *pw;
+@@ -1016,8 +1019,10 @@ main(int ac, char **av)
+ 			}
+ 			break;
+ 		case 'l':
+-			if (options.user == NULL)
++			if (options.user == NULL) {
+ 				options.user = optarg;
++				user_on_commandline = 1;
++			}
+ 			break;
+ 
+ 		case 'L':
+@@ -1120,6 +1125,7 @@ main(int ac, char **av)
+ 			if (options.user == NULL) {
+ 				options.user = tuser;
+ 				tuser = NULL;
++				user_on_commandline = 1;
+ 			}
+ 			free(tuser);
+ 			if (options.port == -1 && tport != -1)
+@@ -1134,6 +1140,7 @@ main(int ac, char **av)
+ 				if (options.user == NULL) {
+ 					options.user = p;
+ 					p = NULL;
++					user_on_commandline = 1;
+ 				}
+ 				*cp++ = '\0';
+ 				host = xstrdup(cp);
+@@ -1288,8 +1295,10 @@ main(int ac, char **av)
+ 	if (fill_default_options(&options) != 0)
+ 		cleanup_exit(255);
+ 
+-	if (options.user == NULL)
++	if (options.user == NULL) {
++		user_was_default = 1;
+ 		options.user = xstrdup(pw->pw_name);
++	}
+ 
+ 	/*
+ 	 * If ProxyJump option specified, then construct a ProxyCommand now.
+@@ -1430,11 +1439,22 @@ main(int ac, char **av)
+ 	    options.host_key_alias : options.host_arg);
+ 	cinfo->host_arg = xstrdup(options.host_arg);
+ 	cinfo->remhost = xstrdup(host);
+-	cinfo->remuser = xstrdup(options.user);
+ 	cinfo->homedir = xstrdup(pw->pw_dir);
+ 	cinfo->locuser = xstrdup(pw->pw_name);
+ 	cinfo->jmphost = xstrdup(options.jump_host == NULL ?
+ 	    "" : options.jump_host);
++
++	/*
++	 * Usernames specified on the commandline must be validated.
++	 * Conversely, usernames from getpwnam(3) or specified as literals
++	 * via configuration (i.e. not expanded) are not subject to validation.
++	 */
++	if (user_on_commandline && !valid_ruser(options.user))
++		fatal("remote username contains invalid characters");
++
++	/* Store it and calculate hash. */
++	cinfo->remuser = xstrdup(options.user);
++
+ 	cinfo->conn_hash_hex = ssh_connection_hash(cinfo->thishost,
+ 	    cinfo->remhost, cinfo->portstr, cinfo->remuser, cinfo->jmphost);
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index bdb8a1599b..1cdd888ccb 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
+           file://CVE-2025-61984.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.43.0


