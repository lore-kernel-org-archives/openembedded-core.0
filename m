Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248F6C87FCA
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 13:23:39 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.25829.1754832207866238732
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 06:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=hoK5EAcl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025081013232202aa12c8e7e4a844da-evdiir@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025081013232202aa12c8e7e4a844da
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 Aug 2025 15:23:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KZWwVZDVry0C9ZCRhs5jkulNREK5fXhP1ZTmNzxEq98=;
 b=hoK5EAcl3wR5tWGrBlv5Lplq19gVP9Xpwv8JJboXF5lvk4d4SDXtKM/HiNq5c/BTeQkvU6
 7cWSPJ/f00frZJRxw6Qj1o6itHviGcNuv1C9ikyMQnq8wG/btva70R3tK0blR6k5/SGG6PQS
 FvaMmF+QbA9t8gQ0szO49DPkcXetCuwVqi68t7SXl1rWqxUBMZ2v1fOD8RY5MeRfSQwVJJ0b
 lXlNlTdIwxmQbEPC7I5QJnY5P3pegXQ1+UMuGb2bigUoW5IY1PND9Oj/64l5n6gpPEgkaK/I
 vKIiDlefNCogpHLgkhqY20UCW8MMcOJhpCD6Vgh+2LVhKe1lpW1iMqTQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] dropbear: patch CVE-2025-47203
Date: Sun, 10 Aug 2025 15:22:18 +0200
Message-Id: <20250810132218.861383-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 13:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221701

From: Peter Marko <peter.marko@siemens.com>

Pick patch per Debian security page [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-47203

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../dropbear/dropbear/CVE-2025-47203.patch    | 373 ++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2024.86.bb |   1 +
 2 files changed, 374 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch b/meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch
new file mode 100644
index 0000000000..9ce0f10588
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch
@@ -0,0 +1,373 @@
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
+ src/cli-main.c    |  59 +++++++++++++++++---------
+ src/cli-runopts.c | 104 ++++++++++++++++++++++++++++------------------
+ src/dbutil.c      |   9 +++-
+ src/dbutil.h      |   1 +
+ src/runopts.h     |   5 +++
+ 5 files changed, 117 insertions(+), 61 deletions(-)
+
+diff --git a/src/cli-main.c b/src/cli-main.c
+index 065fd76..2fafa88 100644
+--- a/src/cli-main.c
++++ b/src/cli-main.c
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
+diff --git a/src/cli-runopts.c b/src/cli-runopts.c
+index b664293..a21b7a2 100644
+--- a/src/cli-runopts.c
++++ b/src/cli-runopts.c
+@@ -556,62 +556,88 @@ void loadidentityfile(const char* filename, int warnfail) {
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
+ 	if (cli_opts.batch_mode) {
+-		total += m_snprintf(args+total, len-total, "-o BatchMode=yes ");
++		args[pos] = m_strdup("-o");
++		pos++;
++		args[pos] = m_strdup("BatchMode=yes");
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
+@@ -626,7 +652,7 @@ static char* multihop_passthrough_args(void) {
+  * etc for as many hosts as we want.
+  *
+  * Note that "-J" arguments aren't actually used, instead
+- * below sets cli_opts.proxycmd directly.
++ * below sets cli_opts.proxyexec directly.
+  *
+  * Ports for hosts can be specified as host/port.
+  */
+@@ -634,7 +660,7 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
+ 	char *userhostarg = NULL;
+ 	char *hostbuf = NULL;
+ 	char *last_hop = NULL;
+-	char *remainder = NULL;
++	char *prior_hops = NULL;
+ 
+ 	/* both scp and rsync parse a user@host argument
+ 	 * and turn it into "-l user host". This breaks
+@@ -652,6 +678,8 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
+ 	}
+ 	userhostarg = hostbuf;
+ 
++	/* Split off any last hostname and use that as remotehost/remoteport.
++	 * That is used for authorized_keys checking etc */
+ 	last_hop = strrchr(userhostarg, ',');
+ 	if (last_hop) {
+ 		if (last_hop == userhostarg) {
+@@ -659,32 +687,28 @@ static void parse_multihop_hostname(const char* orighostarg, const char* argv0)
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
++	/* Construct any multihop proxy command. Use proxyexec to
++	 * avoid worrying about shell escaping. */
++	if (prior_hops) {
++		cli_opts.proxyexec = multihop_args(argv0, prior_hops);
++		/* Any -J argument has been copied to proxyexec */
++		if (cli_opts.proxycmd) {
++			m_free(cli_opts.proxycmd);
++		}
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
+ #endif /* DROPBEAR_CLI_MULTIHOP */
+diff --git a/src/dbutil.c b/src/dbutil.c
+index 2b44921..a70025e 100644
+--- a/src/dbutil.c
++++ b/src/dbutil.c
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
+diff --git a/src/dbutil.h b/src/dbutil.h
+index 05fc50c..bfbed73 100644
+--- a/src/dbutil.h
++++ b/src/dbutil.h
+@@ -63,6 +63,7 @@ char * stripcontrol(const char * text);
+ int spawn_command(void(*exec_fn)(const void *user_data), const void *exec_data,
+ 		int *writefd, int *readfd, int *errfd, pid_t *pid);
+ void run_shell_command(const char* cmd, unsigned int maxfd, char* usershell);
++void run_command(const char* argv0, char** args, unsigned int maxfd);
+ #if ENABLE_CONNECT_UNIX
+ int connect_unix(const char* addr);
+ #endif
+diff --git a/src/runopts.h b/src/runopts.h
+index c4061a0..f255882 100644
+--- a/src/runopts.h
++++ b/src/runopts.h
+@@ -197,7 +197,12 @@ typedef struct cli_runopts {
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
+ 	const char *bind_arg;
+ 	char *bind_address;
diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2024.86.bb
index be246a0ccd..10b7cb5c03 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.86.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
+           file://CVE-2025-47203.patch \
            "
 
 SRC_URI[sha256sum] = "e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e"

