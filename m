Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC04C3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 07:55:40 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.42181.1670313337214698624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 23:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=KLH5T9My;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670313337; x=1701849337;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e95XDkeP6SIqIJbyAgCoNIrTuWup7hBjUSNuRIg2me8=;
  b=KLH5T9My/L0BSwVdvCOHLCcM5URuul9P7mog63esDi2/wx5ECWcIs1uC
   Sz0SBZ3t4PQSjkj9GdDE+7hPPs9pz/0Cr+RGCQhcY0gX6t04CpYXzj5k7
   /GOTZ2xfcplSf25Rhn+tb1amZ+0txSBcL7KzSgvnChdbCCIc/5BaFK2mI
   0HfTAOUB4HUX3Io9rVyZhfQuGgf5RF0uEqivMSyXCv5DwDW1+3eBUj/NE
   buLywYCChBMZqNQCk2aCKLiCljSYGladt12oCDhtWWtNd0OItDUelqoB1
   oGICVrXs9zTlgvrRqTzShF/lJoG6oSZLWXwoO/q0vZl0fCyV+jCvkoPgH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="296253373"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="296253373"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 23:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="891284293"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="891284293"
Received: from andromeda01.png.intel.com (HELO cheeyang-Standard-PC-i440FX-PIIX-1996.png.intel.com) ([10.221.253.199])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2022 23:55:12 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][patch] dropbear: fix CVE-2021-36369
Date: Tue,  6 Dec 2022 15:55:12 +0800
Message-Id: <20221206075512.4097789-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 07:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174319

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2021-36369.patch    | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2021-36369.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 026292230c..0f5e9ba4ac 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -29,6 +29,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            file://CVE-2020-36254.patch \
+           file://CVE-2021-36369.patch \
            "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2021-36369.patch b/meta/recipes-core/dropbear/dropbear/CVE-2021-36369.patch
new file mode 100644
index 0000000000..5ff11abdd6
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2021-36369.patch
@@ -0,0 +1,145 @@
+From e9b15a8b1035b62413b2b881315c6bffd02205d4 Mon Sep 17 00:00:00 2001
+From: Manfred Kaiser <37737811+manfred-kaiser@users.noreply.github.com>
+Date: Thu, 19 Aug 2021 17:37:14 +0200
+Subject: [PATCH] added option to disable trivial auth methods (#128)
+
+* added option to disable trivial auth methods
+
+* rename argument to match with other ssh clients
+
+* fixed trivial auth detection for pubkeys
+
+[https://github.com/mkj/dropbear/pull/128]
+Upstream-Status: Backport
+CVE: CVE-2021-36369
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ cli-auth.c         | 3 +++
+ cli-authinteract.c | 1 +
+ cli-authpasswd.c   | 2 +-
+ cli-authpubkey.c   | 1 +
+ cli-runopts.c      | 7 +++++++
+ cli-session.c      | 1 +
+ runopts.h          | 1 +
+ session.h          | 1 +
+ 8 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/cli-auth.c b/cli-auth.c
+index 2e509e5..6f04495 100644
+--- a/cli-auth.c
++++ b/cli-auth.c
+@@ -267,6 +267,9 @@ void recv_msg_userauth_success() {
+ 	if DROPBEAR_CLI_IMMEDIATE_AUTH is set */
+ 
+ 	TRACE(("received msg_userauth_success"))
++	if (cli_opts.disable_trivial_auth && cli_ses.is_trivial_auth) {
++		dropbear_exit("trivial authentication not allowed");
++	}
+ 	/* Note: in delayed-zlib mode, setting authdone here 
+ 	 * will enable compression in the transport layer */
+ 	ses.authstate.authdone = 1;
+diff --git a/cli-authinteract.c b/cli-authinteract.c
+index e1cc9a1..f7128ee 100644
+--- a/cli-authinteract.c
++++ b/cli-authinteract.c
+@@ -114,6 +114,7 @@ void recv_msg_userauth_info_request() {
+ 	m_free(instruction);
+ 
+ 	for (i = 0; i < num_prompts; i++) {
++		cli_ses.is_trivial_auth = 0;
+ 		unsigned int response_len = 0;
+ 		prompt = buf_getstring(ses.payload, NULL);
+ 		cleantext(prompt);
+diff --git a/cli-authpasswd.c b/cli-authpasswd.c
+index 00fdd8b..a24d43e 100644
+--- a/cli-authpasswd.c
++++ b/cli-authpasswd.c
+@@ -155,7 +155,7 @@ void cli_auth_password() {
+ 
+ 	encrypt_packet();
+ 	m_burn(password, strlen(password));
+-
++	cli_ses.is_trivial_auth = 0;
+ 	TRACE(("leave cli_auth_password"))
+ }
+ #endif	/* DROPBEAR_CLI_PASSWORD_AUTH */
+diff --git a/cli-authpubkey.c b/cli-authpubkey.c
+index 42c4e3f..fa01807 100644
+--- a/cli-authpubkey.c
++++ b/cli-authpubkey.c
+@@ -176,6 +176,7 @@ static void send_msg_userauth_pubkey(sign_key *key, enum signature_type sigtype,
+ 		buf_putbytes(sigbuf, ses.writepayload->data, ses.writepayload->len);
+ 		cli_buf_put_sign(ses.writepayload, key, sigtype, sigbuf);
+ 		buf_free(sigbuf); /* Nothing confidential in the buffer */
++		cli_ses.is_trivial_auth = 0;
+ 	}
+ 
+ 	encrypt_packet();
+diff --git a/cli-runopts.c b/cli-runopts.c
+index 3654b9a..255b47e 100644
+--- a/cli-runopts.c
++++ b/cli-runopts.c
+@@ -152,6 +152,7 @@ void cli_getopts(int argc, char ** argv) {
+ #if DROPBEAR_CLI_ANYTCPFWD
+ 	cli_opts.exit_on_fwd_failure = 0;
+ #endif
++	cli_opts.disable_trivial_auth = 0;
+ #if DROPBEAR_CLI_LOCALTCPFWD
+ 	cli_opts.localfwds = list_new();
+ 	opts.listen_fwd_all = 0;
+@@ -889,6 +890,7 @@ static void add_extendedopt(const char* origstr) {
+ #if DROPBEAR_CLI_ANYTCPFWD
+ 			"\tExitOnForwardFailure\n"
+ #endif
++			"\tDisableTrivialAuth\n"
+ #ifndef DISABLE_SYSLOG
+ 			"\tUseSyslog\n"
+ #endif
+@@ -916,5 +918,10 @@ static void add_extendedopt(const char* origstr) {
+ 		return;
+ 	}
+ 
++	if (match_extendedopt(&optstr, "DisableTrivialAuth") == DROPBEAR_SUCCESS) {
++		cli_opts.disable_trivial_auth = parse_flag_value(optstr);
++		return;
++	}
++
+ 	dropbear_log(LOG_WARNING, "Ignoring unknown configuration option '%s'", origstr);
+ }
+diff --git a/cli-session.c b/cli-session.c
+index 5e5af22..afb54a1 100644
+--- a/cli-session.c
++++ b/cli-session.c
+@@ -165,6 +165,7 @@ static void cli_session_init(pid_t proxy_cmd_pid) {
+ 	/* Auth */
+ 	cli_ses.lastprivkey = NULL;
+ 	cli_ses.lastauthtype = 0;
++	cli_ses.is_trivial_auth = 1;
+ 
+ 	/* For printing "remote host closed" for the user */
+ 	ses.remoteclosed = cli_remoteclosed;
+diff --git a/runopts.h b/runopts.h
+index 6a4a94c..01201d2 100644
+--- a/runopts.h
++++ b/runopts.h
+@@ -159,6 +159,7 @@ typedef struct cli_runopts {
+ #if DROPBEAR_CLI_ANYTCPFWD
+ 	int exit_on_fwd_failure;
+ #endif
++	int disable_trivial_auth;
+ #if DROPBEAR_CLI_REMOTETCPFWD
+ 	m_list * remotefwds;
+ #endif
+diff --git a/session.h b/session.h
+index fb5b8cb..6706592 100644
+--- a/session.h
++++ b/session.h
+@@ -316,6 +316,7 @@ struct clientsession {
+ 
+ 	int lastauthtype; /* either AUTH_TYPE_PUBKEY or AUTH_TYPE_PASSWORD,
+ 						 for the last type of auth we tried */
++	int is_trivial_auth;
+ 	int ignore_next_auth_response;
+ #if DROPBEAR_CLI_INTERACT_AUTH
+ 	int auth_interact_failed; /* flag whether interactive auth can still
-- 
2.25.1


