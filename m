Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAB7C83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:05:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.43738.1753902343465292327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rigLZBMG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2405c0c431cso1553885ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902343; x=1754507143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmwFMbmN6y4yFpQZogvUI5WwMUsN2Lcyxg4jOXkf3K0=;
        b=rigLZBMGRrhpFibiALEzosKlvWEqaTTD9jhEea0T7bApExQjAVp+jAIMBCN/i7Mxnp
         DweWOeiODGWYy8PUXGrwimevdgo+1e1lnNXgLpB4P0PBpQJEWx8BNGBrBvP/8snrA7ZV
         nIUoycbAqYb/9u2fTvaOCipOKblcXYVihpnBFHGqZKPCvfqpeytuPuuBFnWOZI3DqIsz
         Eqr0376NQI+x0OVWj8RG5nlvG8e8Vi1zqmqHx3vkdHiUZqB7mbE34m3GgkzYpqG3guLQ
         8RUQkiGhykghs4AFhyJuikUJ4NnkyKTGToV4l4HXqDl8zYRA/Hmz6+g08onCfaA6cBu1
         wWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902343; x=1754507143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmwFMbmN6y4yFpQZogvUI5WwMUsN2Lcyxg4jOXkf3K0=;
        b=r8sa3GPZz6DWQvDCAQGMbp20Q+0IossO/lQC8Q70LfMsZcc3uPPIC3QKuv0cNfLxkq
         KNpNVkuLPhrEiroAs62dBDeztcorgWsgwVclLVTM1i5CNvmaiZd5vcHanIFHBIAGRpIc
         cLLIjn9g6Onu6EJctqQZtuo5sXkVXiUGyJuIDYsA5lUVwODBj9v/LyL2hZUnVzrh/k7O
         VnW8ZzIMEXrsnoczPoyN/CDJqmISLSn995WcvsNeUosnMUbXLI3GUUdYiTZcFPIvUfq8
         YACkPQdn3i0PPjgMFFmBsKhUnYly30HzqoqdY5sGB9+jHPnggdmY9/rxsPkUmG8ofXMF
         oGSQ==
X-Gm-Message-State: AOJu0YztKqHlPxjmejoC4bfdbIgELoJjG0RqWcTiB0SXnU5YunjgFOCX
	0R4XgVl+lgG6JQauvd/wSiLQXmlqYX8f3H6bKVuYu628F13jHzyr3sx62n258FlrBOM0KTqITAi
	OPS1s
X-Gm-Gg: ASbGnctCwGxqCXht9/NoV5GqWTZzC2Ms7Refx3HMUaUZZFWUuadHhu7/TReuU2mtv/t
	CQS7xGSo9dx6GMLx3IG65ozlrpoteudIVESn6TwBdmxki3Iwih91Cal3H8DTZMAoegjNUoqitO9
	/rYMu6gP6C3xGh5B+eURneVITlSTdTOA1ulTSKm2+rD7W+UgM7ClFXXEpEDBQHwu5gW9S0aFM5x
	nqvqYq567bNxf/7+11k0KL0lNGgmXEDBu8Tu/P5Lf7niSXBU2BLKdOxEDBNSWECeiUG6+q2zi+4
	abz4fGILH/xnNFDS9V4d1ez5fF9IggO0qUep3Z0oCCxBN32bMyEcQt+AofsRckfssUFDkQH2cn8
	MAC34XyAdviH6
X-Google-Smtp-Source: AGHT+IFO2av5deoJijaQFI7bwyVSWgnfz1YMMSnmllYAvhX8eOe+nuzLlxxvzmoegq+YWzzDbhoEIg==
X-Received: by 2002:a17:902:cf43:b0:23f:ecc1:ed75 with SMTP id d9443c01a7336-24096a4f6d8mr63448355ad.2.1753902342249;
        Wed, 30 Jul 2025 12:05:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] dropbear: patch CVE-2025-47203
Date: Wed, 30 Jul 2025 12:05:25 -0700
Message-ID: <91eeffaf14917c7c994a8de794b915231e69c5d6.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753902181.git.steve@sakoman.com>
References: <cover.1753902181.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221139

From: Peter Marko <peter.marko@siemens.com>

CVE patch [1] as mentioned in [2] relies on several patches not yet
available in version 2020.81 we have in kirkstone.
The good folks from Debian did the hard work identifying them as they
have the same version in bullseye release.
The commits were picked from [3] and they have their references to
dropbear upstream commits.

[1] https://github.com/mkj/dropbear/commit/e5a0ef27c227f7ae69d9a9fec98a056494409b9b
[2] https://security-tracker.debian.org/tracker/CVE-2025-47203
[3] https://salsa.debian.org/debian/dropbear/-/commit/7f48e75892c40cfc6336137d62581d2c4ca7d84c

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dropbear/dropbear.inc       |   3 +
 ..._snprintf-that-won-t-return-negative.patch |  48 +++
 ...-length-paths-and-commands-in-multih.patch | 126 +++++++
 .../dropbear/dropbear/CVE-2025-47203.patch    | 344 ++++++++++++++++++
 4 files changed, 521 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Add-m_snprintf-that-won-t-return-negative.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index a32242949b..94059df258 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -31,6 +31,9 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
 	   file://CVE-2021-36369.patch \
 	   file://CVE-2023-36328.patch \
 	   file://CVE-2023-48795.patch \
+           file://0001-Add-m_snprintf-that-won-t-return-negative.patch \
+           file://0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch \
+           file://CVE-2025-47203.patch \
 	   "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
diff --git a/meta/recipes-core/dropbear/dropbear/0001-Add-m_snprintf-that-won-t-return-negative.patch b/meta/recipes-core/dropbear/dropbear/0001-Add-m_snprintf-that-won-t-return-negative.patch
new file mode 100644
index 0000000000..ec75fcbc61
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-Add-m_snprintf-that-won-t-return-negative.patch
@@ -0,0 +1,48 @@
+From ac2433cb8daa1279d14f8b2cd4c7e1f3405787d4 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Fri, 1 Apr 2022 12:10:48 +0800
+Subject: [PATCH] Add m_snprintf() that won't return negative
+
+Origin: https://github.com/mkj/dropbear/commit/ac2433cb8daa1279d14f8b2cd4c7e1f3405787d4
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/ac2433cb8daa1279d14f8b2cd4c7e1f3405787d4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ dbutil.c | 13 +++++++++++++
+ dbutil.h |  2 ++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/dbutil.c b/dbutil.c
+index 5af6330..d4c3298 100644
+--- a/dbutil.c
++++ b/dbutil.c
+@@ -691,3 +691,16 @@ void fsync_parent_dir(const char* fn) {
+ 	m_free(fn_dir);
+ #endif
+ }
++
++int m_snprintf(char *str, size_t size, const char *format, ...) {
++	va_list param;
++	int ret;
++
++	va_start(param, format);
++	ret = vsnprintf(str, size, format, param);
++	va_end(param);
++	if (ret < 0) {
++		dropbear_exit("snprintf failed");
++	}
++	return ret;
++}
+diff --git a/dbutil.h b/dbutil.h
+index 2a1c82c..71cffe8 100644
+--- a/dbutil.h
++++ b/dbutil.h
+@@ -70,6 +70,8 @@ void m_close(int fd);
+ void setnonblocking(int fd);
+ void disallow_core(void);
+ int m_str_to_uint(const char* str, unsigned int *val);
++/* The same as snprintf() but exits rather than returning negative */
++int m_snprintf(char *str, size_t size, const char *format, ...);
+ 
+ /* Used to force mp_ints to be initialised */
+ #define DEF_MP_INT(X) mp_int X = {0, 0, 0, NULL}
diff --git a/meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch b/meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch
new file mode 100644
index 0000000000..dbc457209d
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch
@@ -0,0 +1,126 @@
+From fe15c36664a984de9e1b2386ac52d4b8577cac93 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 1 Apr 2024 11:50:26 +0800
+Subject: [PATCH] Handle arbitrary length paths and commands in
+ multihop_passthrough_args()
+
+Origin: https://github.com/mkj/dropbear/commit/7894254afa9b1d3a836911b7ccea1fe18391b881
+Origin: https://github.com/mkj/dropbear/commit/2f1177e55f33afd676e08c9449ab7ab517fc3b30
+Origin: https://github.com/mkj/dropbear/commit/697b1f86c0b2b0caf12e9e32bab29161093ab5d4
+Origin: https://github.com/mkj/dropbear/commit/dd03da772bfad6174425066ff9752b60e25ed183
+Origin: https://github.com/mkj/dropbear/commit/d59436a4d56de58b856142a5d489a4a8fc7382ed
+
+Upstream-Status: Backport [see commits above]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cli-runopts.c | 63 +++++++++++++++++++++------------------------------
+ 1 file changed, 26 insertions(+), 37 deletions(-)
+
+diff --git a/cli-runopts.c b/cli-runopts.c
+index 255b47e..9798f62 100644
+--- a/cli-runopts.c
++++ b/cli-runopts.c
+@@ -523,61 +523,50 @@ static void loadidentityfile(const char* filename, int warnfail) {
+ 
+ #if DROPBEAR_CLI_MULTIHOP
+ 
+-static char*
+-multihop_passthrough_args() {
+-	char *ret;
+-	int total;
+-	unsigned int len = 0;
++/* Fill out -i, -y, -W options that make sense for all
++ * the intermediate processes */
++static char* multihop_passthrough_args(void) {
++	char *args = NULL;
++	unsigned int len, total;
++#if DROPBEAR_CLI_PUBKEY_AUTH
+ 	m_list_elem *iter;
+-	/* Fill out -i, -y, -W options that make sense for all
+-	 * the intermediate processes */
++#endif
++	/* Sufficient space for non-string args */
++	len = 100;
++
++	/* String arguments have arbitrary length, so determine space required */
+ #if DROPBEAR_CLI_PUBKEY_AUTH
+ 	for (iter = cli_opts.privkeys->first; iter; iter = iter->next)
+ 	{
+ 		sign_key * key = (sign_key*)iter->item;
+-		len += 3 + strlen(key->filename);
++		len += 4 + strlen(key->filename);
+ 	}
+-#endif /* DROPBEAR_CLI_PUBKEY_AUTH */
++#endif
+ 
+-	len += 30; /* space for -W <size>, terminator. */
+-	ret = m_malloc(len);
++	args = m_malloc(len);
+ 	total = 0;
+ 
+-	if (cli_opts.no_hostkey_check)
+-	{
+-		int written = snprintf(ret+total, len-total, "-y -y ");
+-		total += written;
+-	}
+-	else if (cli_opts.always_accept_key)
+-	{
+-		int written = snprintf(ret+total, len-total, "-y ");
+-		total += written;
++	/* Create new argument string */
++
++	if (cli_opts.no_hostkey_check) {
++		total += m_snprintf(args+total, len-total, "-y -y ");
++	} else if (cli_opts.always_accept_key) {
++		total += m_snprintf(args+total, len-total, "-y ");
+ 	}
+ 
+-	if (opts.recv_window != DEFAULT_RECV_WINDOW)
+-	{
+-		int written = snprintf(ret+total, len-total, "-W %u ", opts.recv_window);
+-		total += written;
++	if (opts.recv_window != DEFAULT_RECV_WINDOW) {
++		total += m_snprintf(args+total, len-total, "-W %u ", opts.recv_window);
+ 	}
+ 
+ #if DROPBEAR_CLI_PUBKEY_AUTH
+ 	for (iter = cli_opts.privkeys->first; iter; iter = iter->next)
+ 	{
+ 		sign_key * key = (sign_key*)iter->item;
+-		const size_t size = len - total;
+-		int written = snprintf(ret+total, size, "-i %s ", key->filename);
+-		dropbear_assert((unsigned int)written < size);
+-		total += written;
++		total += m_snprintf(args+total, len-total, "-i %s ", key->filename);
+ 	}
+ #endif /* DROPBEAR_CLI_PUBKEY_AUTH */
+ 
+-	/* if args were passed, total will be not zero, and it will have a space at the end, so remove that */
+-	if (total > 0) 
+-	{
+-		total--;
+-	}
+-
+-	return ret;
++	return args;
+ }
+ 
+ /* Sets up 'onion-forwarding' connections. This will spawn
+@@ -608,7 +597,7 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
+ 			&& strchr(cli_opts.username, '@')) {
+ 		unsigned int len = strlen(orighostarg) + strlen(cli_opts.username) + 2;
+ 		hostbuf = m_malloc(len);
+-		snprintf(hostbuf, len, "%s@%s", cli_opts.username, orighostarg);
++		m_snprintf(hostbuf, len, "%s@%s", cli_opts.username, orighostarg);
+ 	} else {
+ 		hostbuf = m_strdup(orighostarg);
+ 	}
+@@ -642,7 +631,7 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
+ 			+ strlen(passthrough_args)
+ 			+ 30;
+ 		cli_opts.proxycmd = m_malloc(cmd_len);
+-		snprintf(cli_opts.proxycmd, cmd_len, "%s -B %s:%s %s %s", 
++		m_snprintf(cli_opts.proxycmd, cmd_len, "%s -B %s:%s %s %s",
+ 				argv0, cli_opts.remotehost, cli_opts.remoteport, 
+ 				passthrough_args, remainder);
+ #ifndef DISABLE_ZLIB
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch b/meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch
new file mode 100644
index 0000000000..3a51927cfe
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch
@@ -0,0 +1,344 @@
+From e5a0ef27c227f7ae69d9a9fec98a056494409b9b Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 5 May 2025 23:14:19 +0800
+Subject: [PATCH] Execute multihop commands directly, no shell
+
+This avoids problems with shell escaping if arguments contain special
+characters.
+
+Origin: https://github.com/mkj/dropbear/commit/e5a0ef27c227f7ae69d9a9fec98a056494409b9b
+Bug: https://www.openwall.com/lists/oss-security/2025/05/13/1
+Bug-Debian: https://deb.freexian.com/extended-lts/tracker/CVE-2025-47203
+
+CVE: CVE-2025-47203
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/e5a0ef27c227f7ae69d9a9fec98a056494409b9b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cli-main.c    | 60 ++++++++++++++++++++++++++++--------------
+ cli-runopts.c | 84 +++++++++++++++++++++++++++++++++++------------------------
+ dbutil.c      |  9 +++++--
+ dbutil.h      |  1 +
+ runopts.h     |  5 ++++
+ 5 files changed, 104 insertions(+), 55 deletions(-)
+
+diff --git a/cli-main.c b/cli-main.c
+index 7f455d1..53c55c1 100644
+--- a/cli-main.c
++++ b/cli-main.c
+@@ -73,9 +73,8 @@ int main(int argc, char ** argv) {
+ 
+ 	pid_t proxy_cmd_pid = 0;
+ #if DROPBEAR_CLI_PROXYCMD
+-	if (cli_opts.proxycmd) {
++	if (cli_opts.proxycmd || cli_opts.proxyexec) {
+ 		cli_proxy_cmd(&sock_in, &sock_out, &proxy_cmd_pid);
+-		m_free(cli_opts.proxycmd);
+ 		if (signal(SIGINT, kill_proxy_sighandler) == SIG_ERR ||
+ 			signal(SIGTERM, kill_proxy_sighandler) == SIG_ERR ||
+ 			signal(SIGHUP, kill_proxy_sighandler) == SIG_ERR) {
+@@ -96,7 +95,8 @@ int main(int argc, char ** argv) {
+ }
+ #endif /* DBMULTI stuff */
+ 
+-static void exec_proxy_cmd(const void *user_data_cmd) {
++#if DROPBEAR_CLI_PROXYCMD
++static void shell_proxy_cmd(const void *user_data_cmd) {
+ 	const char *cmd = user_data_cmd;
+ 	char *usershell;
+ 
+@@ -105,40 +105,62 @@ static void exec_proxy_cmd(const void *user_data_cmd) {
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
+-
+-	/* So that spawn_command knows which shell to run */
+-	fill_passwd(cli_opts.own_user);
+-
+-	ex_cmdlen = strlen(cli_opts.proxycmd) + 6; /* "exec " + command + '\0' */
+-	ex_cmd = m_malloc(ex_cmdlen);
+-	snprintf(ex_cmd, ex_cmdlen, "exec %s", cli_opts.proxycmd);
++	if (cli_opts.proxycmd) {
++		/* Normal proxycommand */
++		size_t shell_cmdlen;
++		/* So that spawn_command knows which shell to run */
++		fill_passwd(cli_opts.own_user);
++
++		shell_cmdlen = strlen(cli_opts.proxycmd) + 6; /* "exec " + command + '\0' */
++		cmd_arg = m_malloc(shell_cmdlen);
++		snprintf(cmd_arg, shell_cmdlen, "exec %s", cli_opts.proxycmd);
++		exec_fn = shell_proxy_cmd;
++	} else {
++		/* No shell */
++		exec_fn = exec_proxy_cmd;
++	}
+ 
+-	ret = spawn_command(exec_proxy_cmd, ex_cmd,
+-			sock_out, sock_in, NULL, pid_out);
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
+index 9798f62..0f3dcd0 100644
+--- a/cli-runopts.c
++++ b/cli-runopts.c
+@@ -525,47 +525,69 @@ static void loadidentityfile(const char* filename, int warnfail) {
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
+@@ -585,7 +607,7 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
+ 	char *userhostarg = NULL;
+ 	char *hostbuf = NULL;
+ 	char *last_hop = NULL;
+-	char *remainder = NULL;
++	char *prior_hops = NULL;
+ 
+ 	/* both scp and rsync parse a user@host argument
+ 	 * and turn it into "-l user host". This breaks
+@@ -603,6 +625,8 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
+ 	}
+ 	userhostarg = hostbuf;
+ 
++	/* Split off any last hostname and use that as remotehost/remoteport.
++	 * That is used for authorized_keys checking etc */
+ 	last_hop = strrchr(userhostarg, ',');
+ 	if (last_hop) {
+ 		if (last_hop == userhostarg) {
+@@ -610,36 +634,28 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
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
++	/* Construct any multihop proxy command. Use proxyexec to
++	 * avoid worrying about shell escaping. */
++	if (prior_hops) {
++		cli_opts.proxyexec = multihop_args(argv0, prior_hops);
++		/* Any -J argument has been copied to proxyexec */
+ 		if (cli_opts.proxycmd) {
+ 			dropbear_exit("-J can't be used with multihop mode");
+ 		}
+-		if (cli_opts.remoteport == NULL) {
+-			cli_opts.remoteport = "22";
+-		}
+-		cmd_len = strlen(argv0) + strlen(remainder) 
+-			+ strlen(cli_opts.remotehost) + strlen(cli_opts.remoteport)
+-			+ strlen(passthrough_args)
+-			+ 30;
+-		cli_opts.proxycmd = m_malloc(cmd_len);
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
+index d4c3298..a51c1f9 100644
+--- a/dbutil.c
++++ b/dbutil.c
+@@ -347,7 +347,6 @@ int spawn_command(void(*exec_fn)(const void *user_data), const void *exec_data,
+ void run_shell_command(const char* cmd, unsigned int maxfd, char* usershell) {
+ 	char * argv[4];
+ 	char * baseshell = NULL;
+-	unsigned int i;
+ 
+ 	baseshell = basename(usershell);
+ 
+@@ -369,6 +368,12 @@ void run_shell_command(const char* cmd, unsigned int maxfd, char* usershell) {
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
+@@ -380,7 +385,7 @@ void run_shell_command(const char* cmd, unsigned int maxfd, char* usershell) {
+ 		m_close(i);
+ 	}
+ 
+-	execv(usershell, argv);
++	execv(argv0, args);
+ }
+ 
+ #if DEBUG_TRACE
+diff --git a/dbutil.h b/dbutil.h
+index 71cffe8..5d86485 100644
+--- a/dbutil.h
++++ b/dbutil.h
+@@ -60,6 +60,7 @@ char * stripcontrol(const char * text);
+ int spawn_command(void(*exec_fn)(const void *user_data), const void *exec_data,
+ 		int *writefd, int *readfd, int *errfd, pid_t *pid);
+ void run_shell_command(const char* cmd, unsigned int maxfd, char* usershell);
++void run_command(const char* argv0, char** args, unsigned int maxfd);
+ #if ENABLE_CONNECT_UNIX
+ int connect_unix(const char* addr);
+ #endif
+diff --git a/runopts.h b/runopts.h
+index 01201d2..b49dc13 100644
+--- a/runopts.h
++++ b/runopts.h
+@@ -179,7 +179,12 @@ typedef struct cli_runopts {
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
-- 
2.43.0


