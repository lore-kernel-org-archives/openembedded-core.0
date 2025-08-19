Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36784CA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:15 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.3386.1755634086358259809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OiShb33p;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e39ec6e05so3769069b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634086; x=1756238886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOiDQ3rnYZ1G8MooTuTCI3cbJd5pvfCkr8ke7GaZ3fI=;
        b=OiShb33pgUg9T0K5NJdORizS56oQyEaHk2s8RhiWV5U/I5RZKLvZZHA3Q+PD1N56gC
         1TocX5LO64/2xEJxQqMQ2/iALd84p6p/BSQgRNOviNV9yxNlqgY+2N7CJ9+n+sXLkJNx
         G8E3XsTwXuWCJ/RA3zLaceOgySDJ4DwCAB9Q5Hl4uSJt+KAgG8VaPQo1XV3T9G5J16tu
         OtWWEUeSWczd59Vz0Ev0sn0oOSqhkrMPMSnAbGssgUZpjqWcAWUl1oZ/liJMWB7HjKRf
         nvk8tcxY3D8KjaZet6s8moZmrVj9Jj1ugYw1JbAZO1yWAEcAcVYddl13ttlmwobIKihk
         C89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634086; x=1756238886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOiDQ3rnYZ1G8MooTuTCI3cbJd5pvfCkr8ke7GaZ3fI=;
        b=fUSVBChK0i0URkKlMnWOfRgOaErq/kdum0m8S+n1GYebvYM+lRNBqW1LJA+wcH0Nqi
         epB1wxvhwaIQ1Qmk9MWVGFDGLrBUYlVKg0PZFdNJ6K5z6T161RzW+mh4ZhTF/cUKOWJa
         MgnpvPQG61wmwVCXxYgMCU/wRCRH8d4G/BaTj02Uui1Bt7cKnIwrCNhF7OfUmNJ1LPqR
         BmEsByU9wjtaWGJBkRaJ7nZT7/tMiZ4CTN8/oNKp6zTDuzGJAR4i8Dl5Q5VlisNUundU
         XBxjeTyWshj1a9E6MGtdZGz2EZEdeGVO38Uekjtoq2zNgylwv0PPfFNNcFbo9u9BWozd
         humA==
X-Gm-Message-State: AOJu0YzL3Htb2+1Qxk9oPIooPeg9DDCyd4kVaiA7G7SwuLNfvqgnuBFa
	k7nuii0UtBeOYCgGDhzFZrZEUUsZ1uUcQMLqvnBZkKDhU6jxbvyg+qkBL+1SwoYqsdPTprRXhX5
	K5mlS
X-Gm-Gg: ASbGncv4cJgbE7NJRBbxVr7YEjddIl1EOATZ/93GXTE/a45BzkPOGEEpz5r1MpZXrjt
	1k/oy3teGksvG9oY45n10vYU8ZIRva+r7oFOLvGo4CjIOQQvHw+JiyyvEDmQcPu/j0xPBY/xd1m
	G/toHBkOw0SYePqQb+TaGhHSYyMvFN1Qn9BxPM96gXfXmFYmkKfNAmbxhq2t+/NO6qye6bAu1c2
	d57o0xahBAWte0LNRWUSkMYudRx8D/1aAiV+q08f7nIOGRpnjhYmqkN/aw0B7czFY6x5ij8MTRp
	BTqjM3t/u3ofY9cPsRlUUQpRLmSuFMi4PqY0VtSyoZ4h1hJWpUHI+3odEbmJ/FuSSmH8UfH1XXW
	MfADZ9ikzvNmbgw==
X-Google-Smtp-Source: AGHT+IHfqJdKPu+Gpe1Dz8ymAllGSG9PmM3u36+ORWZAk/6lrpdKeVXvFi0bPkQVQNq7mVA1kmpTMw==
X-Received: by 2002:aa7:88c8:0:b0:74c:efae:fd8f with SMTP id d2e1a72fcca58-76e8dd44ae3mr507722b3a.15.1755634085080;
        Tue, 19 Aug 2025 13:08:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/10] dropbear: patch CVE-2025-47203
Date: Tue, 19 Aug 2025 13:07:45 -0700
Message-ID: <6d287785611c344aa0c97048c3bfc280b1787ff5.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222129

From: Peter Marko <peter.marko@siemens.com>

Based on Debian patch for this CVE, pick the same commits as mentioned
in kirkstone for this CVE except those already included in 2022.83.

https://salsa.debian.org/debian/dropbear/-/commit/7f48e75892c40cfc6336137d62581d2c4ca7d84c

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...iable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch |  27 ++
 ...-length-paths-and-commands-in-multih.patch |  63 +++
 ...and-also-forward-this-when-multihop-.patch |  81 ++++
 ...add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch |  29 ++
 .../dropbear/dropbear/CVE-2025-47203.patch    | 367 ++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |   5 +
 6 files changed, 572 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-add-o-BatchMode-and-also-forward-this-when-multihop-.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch

diff --git a/meta/recipes-core/dropbear/dropbear/0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch b/meta/recipes-core/dropbear/dropbear/0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch
new file mode 100644
index 0000000000..fbe200151e
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch
@@ -0,0 +1,27 @@
+From d59436a4d56de58b856142a5d489a4a8fc7382ed Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 8 Apr 2024 22:01:21 +0800
+Subject: [PATCH] Avoid unused variable with DROPBEAR_CLI_PUBKEY_AUTH 0
+
+Fixes PR #291
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/d59436a4d56de58b856142a5d489a4a8fc7382ed]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cli-runopts.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cli-runopts.c b/cli-runopts.c
+index b853a13..6668aee 100644
+--- a/cli-runopts.c
++++ b/cli-runopts.c
+@@ -533,7 +533,9 @@ static void loadidentityfile(const char* filename, int warnfail) {
+ static char* multihop_passthrough_args(void) {
+ 	char *args = NULL;
+ 	unsigned int len, total;
++#if DROPBEAR_CLI_PUBKEY_AUTH
+ 	m_list_elem *iter;
++#endif
+ 	/* Sufficient space for non-string args */
+ 	len = 100;
+ 
diff --git a/meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch b/meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch
new file mode 100644
index 0000000000..062f215398
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch
@@ -0,0 +1,63 @@
+From 697b1f86c0b2b0caf12e9e32bab29161093ab5d4 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 1 Apr 2024 11:50:26 +0800
+Subject: [PATCH] Handle arbitrary length paths and commands in
+ multihop_passthrough_args()
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/697b1f86c0b2b0caf12e9e32bab29161093ab5d4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cli-runopts.c | 30 +++++++++++++++++++++---------
+ 1 file changed, 21 insertions(+), 9 deletions(-)
+
+diff --git a/cli-runopts.c b/cli-runopts.c
+index 37ea61d..219fc53 100644
+--- a/cli-runopts.c
++++ b/cli-runopts.c
+@@ -528,15 +528,29 @@ static void loadidentityfile(const char* filename, int warnfail) {
+ 
+ #if DROPBEAR_CLI_MULTIHOP
+ 
+-static char*
+-multihop_passthrough_args() {
+-	char *ret, args[256];
++/* Fill out -i, -y, -W options that make sense for all
++ * the intermediate processes */
++static char* multihop_passthrough_args(void) {
++	char *args = NULL;
+ 	unsigned int len, total;
+ 	m_list_elem *iter;
+-	/* Fill out -i, -y, -W options that make sense for all
+-         * the intermediate processes */
++	/* Sufficient space for non-string args */
++	len = 100;
++
++	/* String arguments have arbitrary length, so determine space required */
++	if (cli_opts.proxycmd) {
++		len += strlen(cli_opts.proxycmd);
++	}
++	for (iter = cli_opts.privkeys->first; iter; iter = iter->next)
++	{
++		sign_key * key = (sign_key*)iter->item;
++		len += 4 + strlen(key->filename);
++	}
++
++	args = m_malloc(len);
+ 	total = 0;
+-	len = 255;
++
++	/* Create new argument string */
+ 
+ 	if (cli_opts.quiet) {
+ 		total += m_snprintf(args+total, len-total, "-q ");
+@@ -564,9 +578,7 @@ multihop_passthrough_args() {
+ 	}
+ #endif /* DROPBEAR_CLI_PUBKEY_AUTH */
+ 
+-	ret = m_malloc(total + 1);
+-	strcpy(ret,args);
+-	return ret;
++	return args;
+ }
+ 
+ /* Sets up 'onion-forwarding' connections. This will spawn
diff --git a/meta/recipes-core/dropbear/dropbear/0001-add-o-BatchMode-and-also-forward-this-when-multihop-.patch b/meta/recipes-core/dropbear/dropbear/0001-add-o-BatchMode-and-also-forward-this-when-multihop-.patch
new file mode 100644
index 0000000000..c15da6e099
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-add-o-BatchMode-and-also-forward-this-when-multihop-.patch
@@ -0,0 +1,81 @@
+From 2f1177e55f33afd676e08c9449ab7ab517fc3b30 Mon Sep 17 00:00:00 2001
+From: HansH111 <hans@atbas.org>
+Date: Sat, 24 Feb 2024 08:29:30 +0000
+Subject: [PATCH] add -o BatchMode and also forward this when multihop
+ destination is used
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/2f1177e55f33afd676e08c9449ab7ab517fc3b30]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cli-runopts.c | 33 +++++++++++----------------------
+ 1 file changed, 11 insertions(+), 22 deletions(-)
+
+diff --git a/cli-runopts.c b/cli-runopts.c
+index 38a73f7..37ea61d 100644
+--- a/cli-runopts.c
++++ b/cli-runopts.c
+@@ -530,53 +530,42 @@ static void loadidentityfile(const char* filename, int warnfail) {
+ 
+ static char*
+ multihop_passthrough_args() {
+-	char *ret;
++	char *ret, args[256];
+ 	unsigned int len, total;
+ 	m_list_elem *iter;
+ 	/* Fill out -i, -y, -W options that make sense for all
+-	 * the intermediate processes */
+-	len = 30; /* space for "-q -y -y -W <size>\0" */
+-#if DROPBEAR_CLI_PUBKEY_AUTH
+-	for (iter = cli_opts.privkeys->first; iter; iter = iter->next)
+-	{
+-		sign_key * key = (sign_key*)iter->item;
+-		len += 3 + strlen(key->filename);
+-	}
+-#endif /* DROPBEAR_CLI_PUBKEY_AUTH */
+-	if (cli_opts.proxycmd) {
+-		/* "-J 'cmd'" */
+-		len += 6 + strlen(cli_opts.proxycmd);
+-	}
+-
+-	ret = m_malloc(len);
++         * the intermediate processes */
+ 	total = 0;
++	len = 255;
+ 
+ 	if (cli_opts.quiet) {
+-		total += m_snprintf(ret+total, len-total, "-q ");
++		total += m_snprintf(args+total, len-total, "-q ");
+ 	}
+ 
+ 	if (cli_opts.no_hostkey_check) {
+-		total += m_snprintf(ret+total, len-total, "-y -y ");
++		total += m_snprintf(args+total, len-total, "-y -y ");
+ 	} else if (cli_opts.always_accept_key) {
+-		total += m_snprintf(ret+total, len-total, "-y ");
++		total += m_snprintf(args+total, len-total, "-y ");
+ 	}
+ 
+ 	if (cli_opts.proxycmd) {
+-		total += m_snprintf(ret+total, len-total, "-J '%s' ", cli_opts.proxycmd);
++		total += m_snprintf(args+total, len-total, "-J '%s' ", cli_opts.proxycmd);
+ 	}
+ 
+ 	if (opts.recv_window != DEFAULT_RECV_WINDOW) {
+-		total += m_snprintf(ret+total, len-total, "-W %u ", opts.recv_window);
++		total += m_snprintf(args+total, len-total, "-W %u ", opts.recv_window);
+ 	}
+ 
+ #if DROPBEAR_CLI_PUBKEY_AUTH
+ 	for (iter = cli_opts.privkeys->first; iter; iter = iter->next)
+ 	{
+ 		sign_key * key = (sign_key*)iter->item;
+-		total += m_snprintf(ret+total, len-total, "-i %s ", key->filename);
++		total += m_snprintf(args+total, len-total, "-i %s ", key->filename);
+ 	}
+ #endif /* DROPBEAR_CLI_PUBKEY_AUTH */
+ 
++	ret = m_malloc(total + 1);
++	strcpy(ret,args);
+ 	return ret;
+ }
+ 
diff --git a/meta/recipes-core/dropbear/dropbear/0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch b/meta/recipes-core/dropbear/dropbear/0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch
new file mode 100644
index 0000000000..da7de00389
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch
@@ -0,0 +1,29 @@
+From dd03da772bfad6174425066ff9752b60e25ed183 Mon Sep 17 00:00:00 2001
+From: Sergey Ponomarev <stokito@gmail.com>
+Date: Sun, 7 Apr 2024 21:16:50 +0300
+Subject: [PATCH] cli-runopts.c add missing DROPBEAR_CLI_PUBKEY_AUTH
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/dd03da772bfad6174425066ff9752b60e25ed183]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cli-runopts.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cli-runopts.c b/cli-runopts.c
+index 219fc53..b853a13 100644
+--- a/cli-runopts.c
++++ b/cli-runopts.c
+@@ -541,11 +541,13 @@ static char* multihop_passthrough_args(void) {
+ 	if (cli_opts.proxycmd) {
+ 		len += strlen(cli_opts.proxycmd);
+ 	}
++#if DROPBEAR_CLI_PUBKEY_AUTH
+ 	for (iter = cli_opts.privkeys->first; iter; iter = iter->next)
+ 	{
+ 		sign_key * key = (sign_key*)iter->item;
+ 		len += 4 + strlen(key->filename);
+ 	}
++#endif
+ 
+ 	args = m_malloc(len);
+ 	total = 0;
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch b/meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch
new file mode 100644
index 0000000000..513fbafce0
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch
@@ -0,0 +1,367 @@
+From e5a0ef27c227f7ae69d9a9fec98a056494409b9b Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 5 May 2025 23:14:19 +0800
+Subject: [PATCH] Execute multihop commands directly, no shell
+
+This avoids problems with shell escaping if arguments contain special
+characters.
+
+CVE: CVE-2025-47203
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/e5a0ef27c227f7ae69d9a9fec98a056494409b9b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cli-main.c    |  59 +++++++++++++++++++----------
+ cli-runopts.c | 100 +++++++++++++++++++++++++++++---------------------
+ dbutil.c      |   9 ++++-
+ dbutil.h      |   1 +
+ runopts.h     |   5 +++
+ 5 files changed, 112 insertions(+), 62 deletions(-)
+
+diff --git a/cli-main.c b/cli-main.c
+index 065fd76..2fafa88 100644
+--- a/cli-main.c
++++ b/cli-main.c
+@@ -77,9 +77,8 @@ int main(int argc, char ** argv) {
+ 	}
+ 
+ #if DROPBEAR_CLI_PROXYCMD
+-	if (cli_opts.proxycmd) {
++	if (cli_opts.proxycmd || cli_opts.proxyexec) {
+ 		cli_proxy_cmd(&sock_in, &sock_out, &proxy_cmd_pid);
+-		m_free(cli_opts.proxycmd);
+ 		if (signal(SIGINT, kill_proxy_sighandler) == SIG_ERR ||
+ 			signal(SIGTERM, kill_proxy_sighandler) == SIG_ERR ||
+ 			signal(SIGHUP, kill_proxy_sighandler) == SIG_ERR) {
+@@ -101,7 +100,8 @@ int main(int argc, char ** argv) {
+ }
+ #endif /* DBMULTI stuff */
+ 
+-static void exec_proxy_cmd(const void *user_data_cmd) {
++#if DROPBEAR_CLI_PROXYCMD
++static void shell_proxy_cmd(const void *user_data_cmd) {
+ 	const char *cmd = user_data_cmd;
+ 	char *usershell;
+ 
+@@ -110,41 +110,62 @@ static void exec_proxy_cmd(const void *user_data_cmd) {
+ 	dropbear_exit("Failed to run '%s'\n", cmd);
+ }
+ 
+-#if DROPBEAR_CLI_PROXYCMD
++static void exec_proxy_cmd(const void *unused) {
++	(void)unused;
++	run_command(cli_opts.proxyexec[0], cli_opts.proxyexec, ses.maxfd);
++	dropbear_exit("Failed to run '%s'\n", cli_opts.proxyexec[0]);
++}
++
+ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
+-	char * ex_cmd = NULL;
+-	size_t ex_cmdlen;
++	char * cmd_arg = NULL;
++	void (*exec_fn)(const void *user_data) = NULL;
+ 	int ret;
+ 
++	/* exactly one of cli_opts.proxycmd or cli_opts.proxyexec should be set */
++
+ 	/* File descriptor "-j &3" */
+-	if (*cli_opts.proxycmd == '&') {
++	if (cli_opts.proxycmd && *cli_opts.proxycmd == '&') {
+ 		char *p = cli_opts.proxycmd + 1;
+ 		int sock = strtoul(p, &p, 10);
+ 		/* must be a single number, and not stdin/stdout/stderr */
+ 		if (sock > 2 && sock < 1024 && *p == '\0') {
+ 			*sock_in = sock;
+ 			*sock_out = sock;
+-			return;
++			goto cleanup;
+ 		}
+ 	}
+ 
+-	/* Normal proxycommand */
++	if (cli_opts.proxycmd) {
++		/* Normal proxycommand */
++		size_t shell_cmdlen;
++		/* So that spawn_command knows which shell to run */
++		fill_passwd(cli_opts.own_user);
+ 
+-	/* So that spawn_command knows which shell to run */
+-	fill_passwd(cli_opts.own_user);
++		shell_cmdlen = strlen(cli_opts.proxycmd) + 6; /* "exec " + command + '\0' */
++		cmd_arg = m_malloc(shell_cmdlen);
++		snprintf(cmd_arg, shell_cmdlen, "exec %s", cli_opts.proxycmd);
++		exec_fn = shell_proxy_cmd;
++	} else {
++		/* No shell */
++		exec_fn = exec_proxy_cmd;
++	}
+ 
+-	ex_cmdlen = strlen(cli_opts.proxycmd) + 6; /* "exec " + command + '\0' */
+-	ex_cmd = m_malloc(ex_cmdlen);
+-	snprintf(ex_cmd, ex_cmdlen, "exec %s", cli_opts.proxycmd);
+-
+-	ret = spawn_command(exec_proxy_cmd, ex_cmd,
+-			sock_out, sock_in, NULL, pid_out);
+-	DEBUG1(("cmd: %s  pid=%d", ex_cmd,*pid_out))
+-	m_free(ex_cmd);
++	ret = spawn_command(exec_fn, cmd_arg, sock_out, sock_in, NULL, pid_out);
+ 	if (ret == DROPBEAR_FAILURE) {
+ 		dropbear_exit("Failed running proxy command");
+ 		*sock_in = *sock_out = -1;
+ 	}
++
++cleanup:
++	m_free(cli_opts.proxycmd);
++	m_free(cmd_arg);
++	if (cli_opts.proxyexec) {
++		char **a = NULL;
++		for (a = cli_opts.proxyexec; *a; a++) {
++			m_free_direct(*a);
++		}
++		m_free(cli_opts.proxyexec);
++	}
+ }
+ 
+ static void kill_proxy_sighandler(int UNUSED(signo)) {
+diff --git a/cli-runopts.c b/cli-runopts.c
+index 6668aee..b9add84 100644
+--- a/cli-runopts.c
++++ b/cli-runopts.c
+@@ -530,58 +530,81 @@ static void loadidentityfile(const char* filename, int warnfail) {
+ 
+ /* Fill out -i, -y, -W options that make sense for all
+  * the intermediate processes */
+-static char* multihop_passthrough_args(void) {
+-	char *args = NULL;
+-	unsigned int len, total;
++static char** multihop_args(const char* argv0, const char* prior_hops) {
++	/* null terminated array */
++	char **args = NULL;
++	size_t max_args = 14, pos = 0, len;
+ #if DROPBEAR_CLI_PUBKEY_AUTH
+ 	m_list_elem *iter;
+ #endif
+-	/* Sufficient space for non-string args */
+-	len = 100;
+ 
+-	/* String arguments have arbitrary length, so determine space required */
+-	if (cli_opts.proxycmd) {
+-		len += strlen(cli_opts.proxycmd);
+-	}
+ #if DROPBEAR_CLI_PUBKEY_AUTH
+ 	for (iter = cli_opts.privkeys->first; iter; iter = iter->next)
+ 	{
+-		sign_key * key = (sign_key*)iter->item;
+-		len += 4 + strlen(key->filename);
++		/* "-i file" for each */
++		max_args += 2;
+ 	}
+ #endif
+ 
+-	args = m_malloc(len);
+-	total = 0;
++	args = m_malloc(sizeof(char*) * max_args);
++	pos = 0;
+ 
+-	/* Create new argument string */
++	args[pos] = m_strdup(argv0);
++	pos++;
+ 
+ 	if (cli_opts.quiet) {
+-		total += m_snprintf(args+total, len-total, "-q ");
++		args[pos] = m_strdup("-q");
++		pos++;
+ 	}
+ 
+ 	if (cli_opts.no_hostkey_check) {
+-		total += m_snprintf(args+total, len-total, "-y -y ");
++		args[pos] = m_strdup("-y");
++		pos++;
++		args[pos] = m_strdup("-y");
++		pos++;
+ 	} else if (cli_opts.always_accept_key) {
+-		total += m_snprintf(args+total, len-total, "-y ");
++		args[pos] = m_strdup("-y");
++		pos++;
+ 	}
+ 
+ 	if (cli_opts.proxycmd) {
+-		total += m_snprintf(args+total, len-total, "-J '%s' ", cli_opts.proxycmd);
++		args[pos] = m_strdup("-J");
++		pos++;
++		args[pos] = m_strdup(cli_opts.proxycmd);
++		pos++;
+ 	}
+ 
+ 	if (opts.recv_window != DEFAULT_RECV_WINDOW) {
+-		total += m_snprintf(args+total, len-total, "-W %u ", opts.recv_window);
++		args[pos] = m_strdup("-W");
++		pos++;
++		args[pos] = m_malloc(11);
++		m_snprintf(args[pos], 11, "%u", opts.recv_window);
++		pos++;
+ 	}
+ 
+ #if DROPBEAR_CLI_PUBKEY_AUTH
+ 	for (iter = cli_opts.privkeys->first; iter; iter = iter->next)
+ 	{
+ 		sign_key * key = (sign_key*)iter->item;
+-		total += m_snprintf(args+total, len-total, "-i %s ", key->filename);
++		args[pos] = m_strdup("-i");
++		pos++;
++		args[pos] = m_strdup(key->filename);
++		pos++;
+ 	}
+ #endif /* DROPBEAR_CLI_PUBKEY_AUTH */
+ 
++	/* last hop */
++	args[pos] = m_strdup("-B");
++	pos++;
++	len = strlen(cli_opts.remotehost) + strlen(cli_opts.remoteport) + 2;
++	args[pos] = m_malloc(len);
++	snprintf(args[pos], len, "%s:%s", cli_opts.remotehost, cli_opts.remoteport);
++	pos++;
++
++	/* hostnames of prior hops */
++	args[pos] = m_strdup(prior_hops);
++	pos++;
++
+ 	return args;
+ }
+ 
+@@ -596,7 +619,7 @@ static char* multihop_passthrough_args(void) {
+  * etc for as many hosts as we want.
+  *
+  * Note that "-J" arguments aren't actually used, instead
+- * below sets cli_opts.proxycmd directly.
++ * below sets cli_opts.proxyexec directly.
+  *
+  * Ports for hosts can be specified as host/port.
+  */
+@@ -604,7 +627,7 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
+ 	char *userhostarg = NULL;
+ 	char *hostbuf = NULL;
+ 	char *last_hop = NULL;
+-	char *remainder = NULL;
++	char *prior_hops = NULL;
+ 
+ 	/* both scp and rsync parse a user@host argument
+ 	 * and turn it into "-l user host". This breaks
+@@ -622,6 +645,8 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
+ 	}
+ 	userhostarg = hostbuf;
+ 
++	/* Split off any last hostname and use that as remotehost/remoteport.
++	 * That is used for authorized_keys checking etc */
+ 	last_hop = strrchr(userhostarg, ',');
+ 	if (last_hop) {
+ 		if (last_hop == userhostarg) {
+@@ -629,35 +654,28 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
+ 		}
+ 		*last_hop = '\0';
+ 		last_hop++;
+-		remainder = userhostarg;
++		prior_hops = userhostarg;
+ 		userhostarg = last_hop;
+ 	}
+ 
++	/* Update cli_opts.remotehost and cli_opts.remoteport */
+ 	parse_hostname(userhostarg);
+ 
+-	if (last_hop) {
+-		/* Set up the proxycmd */
+-		unsigned int cmd_len = 0;
+-		char *passthrough_args = multihop_passthrough_args();
+-		if (cli_opts.remoteport == NULL) {
+-			cli_opts.remoteport = "22";
++	/* Construct any multihop proxy command. Use proxyexec to
++	 * avoid worrying about shell escaping. */
++	if (prior_hops) {
++		cli_opts.proxyexec = multihop_args(argv0, prior_hops);
++		/* Any -J argument has been copied to proxyexec */
++		if (cli_opts.proxycmd) {
++			m_free(cli_opts.proxycmd);
+ 		}
+-		cmd_len = strlen(argv0) + strlen(remainder)
+-			+ strlen(cli_opts.remotehost) + strlen(cli_opts.remoteport)
+-			+ strlen(passthrough_args)
+-			+ 30;
+-		/* replace proxycmd. old -J arguments have been copied
+-		   to passthrough_args */
+-		cli_opts.proxycmd = m_realloc(cli_opts.proxycmd, cmd_len);
+-		m_snprintf(cli_opts.proxycmd, cmd_len, "%s -B %s:%s %s %s",
+-				argv0, cli_opts.remotehost, cli_opts.remoteport,
+-				passthrough_args, remainder);
++
+ #ifndef DISABLE_ZLIB
+-		/* The stream will be incompressible since it's encrypted. */
++		/* This outer stream will be incompressible since it's encrypted. */
+ 		opts.compress_mode = DROPBEAR_COMPRESS_OFF;
+ #endif
+-		m_free(passthrough_args);
+ 	}
++
+ 	m_free(hostbuf);
+ }
+ #endif /* !DROPBEAR_CLI_MULTIHOP */
+diff --git a/dbutil.c b/dbutil.c
+index bd66454..910fa27 100644
+--- a/dbutil.c
++++ b/dbutil.c
+@@ -371,7 +371,6 @@ int spawn_command(void(*exec_fn)(const void *user_data), const void *exec_data,
+ void run_shell_command(const char* cmd, unsigned int maxfd, char* usershell) {
+ 	char * argv[4];
+ 	char * baseshell = NULL;
+-	unsigned int i;
+ 
+ 	baseshell = basename(usershell);
+ 
+@@ -393,6 +392,12 @@ void run_shell_command(const char* cmd, unsigned int maxfd, char* usershell) {
+ 		argv[1] = NULL;
+ 	}
+ 
++	run_command(usershell, argv, maxfd);
++}
++
++void run_command(const char* argv0, char** args, unsigned int maxfd) {
++	unsigned int i;
++
+ 	/* Re-enable SIGPIPE for the executed process */
+ 	if (signal(SIGPIPE, SIG_DFL) == SIG_ERR) {
+ 		dropbear_exit("signal() error");
+@@ -404,7 +409,7 @@ void run_shell_command(const char* cmd, unsigned int maxfd, char* usershell) {
+ 		m_close(i);
+ 	}
+ 
+-	execv(usershell, argv);
++	execv(argv0, args);
+ }
+ 
+ #if DEBUG_TRACE
+diff --git a/dbutil.h b/dbutil.h
+index 64af170..bfc1f1f 100644
+--- a/dbutil.h
++++ b/dbutil.h
+@@ -63,6 +63,7 @@ char * stripcontrol(const char * text);
+ int spawn_command(void(*exec_fn)(const void *user_data), const void *exec_data,
+ 		int *writefd, int *readfd, int *errfd, pid_t *pid);
+ void run_shell_command(const char* cmd, unsigned int maxfd, char* usershell);
++void run_command(const char* argv0, char** args, unsigned int maxfd);
+ #if ENABLE_CONNECT_UNIX
+ int connect_unix(const char* addr);
+ #endif
+diff --git a/runopts.h b/runopts.h
+index 1675836..11c3ef2 100644
+--- a/runopts.h
++++ b/runopts.h
+@@ -188,7 +188,12 @@ typedef struct cli_runopts {
+ 	unsigned int netcat_port;
+ #endif
+ #if DROPBEAR_CLI_PROXYCMD
++	/* A proxy command to run via the user's shell */
+ 	char *proxycmd;
++#endif
++#if DROPBEAR_CLI_MULTIHOP
++	/* Similar to proxycmd, but is arguments for execve(), not shell */
++	char **proxyexec;
+ #endif
+ 	char *bind_address;
+ 	char *bind_port;
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index 772e08eaed..2ed8d2c2a1 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -24,6 +24,11 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            file://CVE-2023-36328.patch \
            file://CVE-2023-48795.patch \
+           file://0001-add-o-BatchMode-and-also-forward-this-when-multihop-.patch \
+           file://0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch \
+           file://0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch \
+           file://0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch \
+           file://CVE-2025-47203.patch \
            "
 
 SRC_URI[sha256sum] = "bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b"
-- 
2.43.0


