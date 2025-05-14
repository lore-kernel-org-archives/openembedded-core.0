Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AD7C3ABDD
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 19:15:33 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.110409.1747250130562986961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 12:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UxJeVtRz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202505141915287b22c7f7abbf4cd762-vcktoo@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202505141915287b22c7f7abbf4cd762
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 21:15:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dryLsQh9DGIK7dorZdHgd6Eib2SJOaIMSjyUbZjQG6E=;
 b=UxJeVtRzCXI0yOMZ8CYR37QWLyskD2mofZ100dZQ+FX2zHGi3Bhw80U3OYCK7PXSq41n83
 aRXN33rcnI+CgN7qYEJN8cJew0Jgl+pc2fXRid+WY69BD5UV9FmVzCsXevbZ93dxgQvYFJQz
 vB968H75je2K4erimWmgtpWg5Y4E5ihOVhKdCckwqIjnhXm8cT24619lX43JiCgunJyYB/3G
 zaaNemRdFNQJWjczpndf3VhKILwsXbUOFfm6bKf/IPcIz3buCVi0O7diLiRFvFLhO3g5bNEV
 dasZKvv4UHjGExhpxEChhqz2oqQkHyh3n2YcsRTW3jMHgX8bACuqb2jg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v3 2/2] dropbear: upgrade 2024.86 -> dropbear_2025.88
Date: Wed, 14 May 2025 21:14:38 +0200
Message-Id: <20250514191438.99369-2-peter.marko@siemens.com>
In-Reply-To: <20250514191438.99369-1-peter.marko@siemens.com>
References: <20250514183336.84167-1-peter.marko@siemens.com>
 <20250514191438.99369-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 19:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216549

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-47203

SHA1 algorithms were removed by default, so patch for disabling it was
removed together with its package option. Doing it with conditional
patch was anyway a bad design. If someone still needs it, it should be
done via sed command on the config file.

Refreshed remaining patches.

Added patch to fix regression of the CVE fix.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: Added patch to fix regression of the CVE fix.
v3: no change

 .../0001-Fix-proxycmd-without-netcat.patch    | 74 +++++++++++++++++++
 ...1-urandom-xauth-changes-to-options.h.patch |  2 +-
 .../dropbear-disable-weak-ciphers.patch       | 28 -------
 ...ropbear_2024.86.bb => dropbear_2025.88.bb} |  7 +-
 4 files changed, 78 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
 rename meta/recipes-core/dropbear/{dropbear_2024.86.bb => dropbear_2025.88.bb} (93%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch b/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
new file mode 100644
index 0000000000..967b66322f
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-netcat.patch
@@ -0,0 +1,74 @@
+From 5cc0127000db5f7567b54d0495fb91a8e452fe09 Mon Sep 17 00:00:00 2001
+From: Konstantin Demin <rockdrilla@gmail.com>
+Date: Fri, 9 May 2025 22:39:35 +0300
+Subject: [PATCH] Fix proxycmd without netcat
+
+fixes e5a0ef27c2 "Execute multihop commands directly, no shell"
+
+Signed-off-by: Konstantin Demin <rockdrilla@gmail.com>
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/5cc0127000db5f7567b54d0495fb91a8e452fe09]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/cli-main.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/cli-main.c b/src/cli-main.c
+index 2fafa88..0a052a3 100644
+--- a/src/cli-main.c
++++ b/src/cli-main.c
+@@ -77,7 +77,11 @@ int main(int argc, char ** argv) {
+ 	}
+ 
+ #if DROPBEAR_CLI_PROXYCMD
+-	if (cli_opts.proxycmd || cli_opts.proxyexec) {
++	if (cli_opts.proxycmd
++#if DROPBEAR_CLI_MULTIHOP
++		|| cli_opts.proxyexec
++#endif
++	) {
+ 		cli_proxy_cmd(&sock_in, &sock_out, &proxy_cmd_pid);
+ 		if (signal(SIGINT, kill_proxy_sighandler) == SIG_ERR ||
+ 			signal(SIGTERM, kill_proxy_sighandler) == SIG_ERR ||
+@@ -110,11 +114,13 @@ static void shell_proxy_cmd(const void *user_data_cmd) {
+ 	dropbear_exit("Failed to run '%s'\n", cmd);
+ }
+ 
++#if DROPBEAR_CLI_MULTIHOP
+ static void exec_proxy_cmd(const void *unused) {
+ 	(void)unused;
+ 	run_command(cli_opts.proxyexec[0], cli_opts.proxyexec, ses.maxfd);
+ 	dropbear_exit("Failed to run '%s'\n", cli_opts.proxyexec[0]);
+ }
++#endif
+ 
+ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
+ 	char * cmd_arg = NULL;
+@@ -145,9 +151,11 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
+ 		cmd_arg = m_malloc(shell_cmdlen);
+ 		snprintf(cmd_arg, shell_cmdlen, "exec %s", cli_opts.proxycmd);
+ 		exec_fn = shell_proxy_cmd;
++#if DROPBEAR_CLI_MULTIHOP
+ 	} else {
+ 		/* No shell */
+ 		exec_fn = exec_proxy_cmd;
++#endif
+ 	}
+ 
+ 	ret = spawn_command(exec_fn, cmd_arg, sock_out, sock_in, NULL, pid_out);
+@@ -159,6 +167,7 @@ static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) {
+ cleanup:
+ 	m_free(cli_opts.proxycmd);
+ 	m_free(cmd_arg);
++#if DROPBEAR_CLI_MULTIHOP
+ 	if (cli_opts.proxyexec) {
+ 		char **a = NULL;
+ 		for (a = cli_opts.proxyexec; *a; a++) {
+@@ -166,6 +175,7 @@ cleanup:
+ 		}
+ 		m_free(cli_opts.proxyexec);
+ 	}
++#endif
+ }
+ 
+ static void kill_proxy_sighandler(int UNUSED(signo)) {
diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 9c1dd3f606..0687e5dab1 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -12,7 +12,7 @@ diff --git a/src/default_options.h b/src/default_options.h
 index 6e970bb..ccc8b47 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -311,7 +311,7 @@ group1 in Dropbear server too */
+@@ -317,7 +317,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
deleted file mode 100644
index a20781d31d..0000000000
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c8a0c8e87b772576f3a431c3b4cacaf5aa001dcc Mon Sep 17 00:00:00 2001
-From: Joseph Reynolds <joseph.reynolds1@ibm.com>
-Date: Thu, 20 Jun 2019 16:29:15 -0500
-Subject: [PATCH] dropbear: new feature: disable-weak-ciphers
-
-This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers
-in the dropbear ssh server and client since they're considered weak ciphers
-and we want to support the stong algorithms.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
----
- src/default_options.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/default_options.h b/src/default_options.h
-index 12768d1..2b07497 100644
---- a/src/default_options.h
-+++ b/src/default_options.h
-@@ -197,7 +197,7 @@ IMPORTANT: Some options will require "make clean" after changes */
-  * Small systems should generally include either curve25519 or ecdh for performance.
-  * curve25519 is less widely supported but is faster
-  */
--#define DROPBEAR_DH_GROUP14_SHA1 1
-+#define DROPBEAR_DH_GROUP14_SHA1 0
- #define DROPBEAR_DH_GROUP14_SHA256 1
- #define DROPBEAR_DH_GROUP16 0
- #define DROPBEAR_CURVE25519 1
diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2025.88.bb
similarity index 93%
rename from meta/recipes-core/dropbear/dropbear_2024.86.bb
rename to meta/recipes-core/dropbear/dropbear_2025.88.bb
index 38faaebc2a..f203763b17 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.88.bb
@@ -19,11 +19,11 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear@.service \
            file://dropbear.socket \
            file://dropbear.default \
+           file://0001-Fix-proxycmd-without-netcat.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            "
 
-SRC_URI[sha256sum] = "e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e"
+SRC_URI[sha256sum] = "783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
@@ -48,10 +48,9 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 
-PACKAGECONFIG ?= "disable-weak-ciphers ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
-PACKAGECONFIG[disable-weak-ciphers] = ""
 PACKAGECONFIG[enable-x11-forwarding] = ""
 
 # This option appends to CFLAGS and LDFLAGS from OE

