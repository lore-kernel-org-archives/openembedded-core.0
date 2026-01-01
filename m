Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2E0EED609
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 13:14:02 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103993.1767273235724786851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 05:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FhRzcLwn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260101131352ccf7732ad4000207aa-5lh4sv@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260101131352ccf7732ad4000207aa
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 14:13:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=18DzUy3JIx/fUKpGReHvp8VC+ZM0FiJ7iIU/CCA6Gqw=;
 b=FhRzcLwna7zRc3j5cJo7g+hYG59HaPegUDG7UInFjLo2LMpbUv5fXLzw/YY6EZLoT0oDGA
 4ls2U5tGdbaHEuPdIjs2JtdHCOR2Vc2CBCZ0RxxmMLIKEt68EZWA3IgYi80gFTJWbmR3sN8O
 WzBiKFlbMBfFWScOOyMCt6F5R5JjV1ZEo5E3oPOo1wBFjdfzONjvRuN+Hn6S5ZdckMXMBWgN
 Wj6VDOw5jr6YKEaAzB/EwOGQHwmTUQ/CqC7+Z19Ml1QqiK23csHvRU6C05Mw2JskxLU413id
 QGjAATgIF6+RrD3olXXbKrCJTfDtplKz6dFezlAMHid9hBfmt4V/KZGw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] dropbear: upgrade 2025.88 -> 2025.89
Date: Thu,  1 Jan 2026 14:13:48 +0100
Message-Id: <20260101131348.69745-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 13:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228820

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2025-14282 and CVE-2019-6111.

Release notes:
* https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.89

Drop patch included in this release and refresh other patches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-Fix-proxycmd-without-netcat.patch    | 74 -------------------
 ...1-urandom-xauth-changes-to-options.h.patch |  2 +-
 ...ropbear_2025.88.bb => dropbear_2025.89.bb} |  3 +-
 3 files changed, 2 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
 rename meta/recipes-core/dropbear/{dropbear_2025.88.bb => dropbear_2025.89.bb} (97%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch b/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
deleted file mode 100644
index 967b66322f..0000000000
--- a/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 5cc0127000db5f7567b54d0495fb91a8e452fe09 Mon Sep 17 00:00:00 2001
-From: Konstantin Demin <rockdrilla@gmail.com>
-Date: Fri, 9 May 2025 22:39:35 +0300
-Subject: [PATCH] Fix proxycmd without netcat
-
-fixes e5a0ef27c2 "Execute multihop commands directly, no shell"
-
-Signed-off-by: Konstantin Demin <rockdrilla@gmail.com>
-
-Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/5cc0127000db5f7567b54d0495fb91a8e452fe09]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/cli-main.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/cli-main.c b/src/cli-main.c
-index 2fafa88..0a052a3 100644
---- a/src/cli-main.c
-+++ b/src/cli-main.c
-@@ -77,7 +77,11 @@ int main(int argc, char ** argv) {
- 	}
- 
- #if DROPBEAR_CLI_PROXYCMD
--	if (cli_opts.proxycmd || cli_opts.proxyexec) {
-+	if (cli_opts.proxycmd
-+#if DROPBEAR_CLI_MULTIHOP
-+		|| cli_opts.proxyexec
-+#endif
-+	) {
- 		cli_proxy_cmd(&sock_in, &sock_out, &proxy_cmd_pid);
- 		if (signal(SIGINT, kill_proxy_sighandler) == SIG_ERR ||
- 			signal(SIGTERM, kill_proxy_sighandler) == SIG_ERR ||
-@@ -110,11 +114,13 @@ static void shell_proxy_cmd(const void *user_data_cmd) {
- 	dropbear_exit("Failed to run '%s'\n", cmd);
- }
- 
-+#if DROPBEAR_CLI_MULTIHOP
- static void exec_proxy_cmd(const void *unused) {
- 	(void)unused;
- 	run_command(cli_opts.proxyexec[0], cli_opts.proxyexec, ses.maxfd);
- 	dropbear_exit("Failed to run '%s'\n", cli_opts.proxyexec[0]);
- }
-+#endif
- 
- static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
- 	char * cmd_arg = NULL;
-@@ -145,9 +151,11 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
- 		cmd_arg = m_malloc(shell_cmdlen);
- 		snprintf(cmd_arg, shell_cmdlen, "exec %s", cli_opts.proxycmd);
- 		exec_fn = shell_proxy_cmd;
-+#if DROPBEAR_CLI_MULTIHOP
- 	} else {
- 		/* No shell */
- 		exec_fn = exec_proxy_cmd;
-+#endif
- 	}
- 
- 	ret = spawn_command(exec_fn, cmd_arg, sock_out, sock_in, NULL, pid_out);
-@@ -159,6 +167,7 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
- cleanup:
- 	m_free(cli_opts.proxycmd);
- 	m_free(cmd_arg);
-+#if DROPBEAR_CLI_MULTIHOP
- 	if (cli_opts.proxyexec) {
- 		char **a = NULL;
- 		for (a = cli_opts.proxyexec; *a; a++) {
-@@ -166,6 +175,7 @@ cleanup:
- 		}
- 		m_free(cli_opts.proxyexec);
- 	}
-+#endif
- }
- 
- static void kill_proxy_sighandler(int UNUSED(signo)) {
diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 0687e5dab1..a662230b88 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -12,7 +12,7 @@ diff --git a/src/default_options.h b/src/default_options.h
 index 6e970bb..ccc8b47 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -317,7 +317,7 @@ group1 in Dropbear server too */
+@@ -323,7 +323,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
diff --git a/meta/recipes-core/dropbear/dropbear_2025.88.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
similarity index 97%
rename from meta/recipes-core/dropbear/dropbear_2025.88.bb
rename to meta/recipes-core/dropbear/dropbear_2025.89.bb
index 72a886d907..957a0901fb 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.88.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -19,11 +19,10 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear@.service \
            file://dropbear.socket \
            file://dropbear.default \
-           file://0001-Fix-proxycmd-without-netcat.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4"
+SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \

