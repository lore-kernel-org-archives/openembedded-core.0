Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FE6C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:27:52 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.44921.1669904867136998578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FV16ORlH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id r7so1990812pfl.11
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHzt6t6dRVOknRXv1GLxo6hHl5KcIYdTwDbOPch4alY=;
        b=FV16ORlHTERxUn5itYwQNceI8C39FagVN/+l3YkcEisZ9XTsOVNIdRKxXtP226IgkL
         w3csT3IA0YEJSdpmOyp2Ddvpw9e9y7haiUDmddrPwj8FeYIJr6NxfQOkGCfmTTTzcZIJ
         SQ9wgy8sQlB5u1YGBk2Evfc7Ttzv0msYaCishYjwA1jaNb3QeGbfIP4Fu8G0AQ4HGyME
         4jr8G6PWYM2zydOKYO1/iXLOMnAe90QM04mTomV950sbxjgQL4Jawyx26AjikoG3Vlsd
         gSCnqluih/thdXbXbSdGl04rWn3mteQps6ROVZarzsjxvzuFsMyd29D19uj3CbtCByNX
         6GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHzt6t6dRVOknRXv1GLxo6hHl5KcIYdTwDbOPch4alY=;
        b=yz+5Ty/qhYshT8bU66o11YxVl0A0dDTV4qlRuM3JIcKcSamsj5veqO22LciH6RPuKP
         ek7FoqR8pJoEcTBTDf+w3mwpOOlDezNjRM6X+Xn+epHZeYtiqDDFcgGar7Exs6KlKMlr
         hYo76E9hmXG1KXYQyXpAz2P6lUqxhbpzQoFBHRR5d1vwcWUhzBmSnEM4FBDZ4Jwr6zRb
         GFL/C/6HcsJA02Z3d79zNna1+7bEFmkQfQ+NfO0dl8MbBvICmuo7qOku5SEt8waKNTnE
         VbV9pCBJOsOHshjpU+28/OiK7+P5xs8eewsUd0y1VHucjq5cywvomw0ZDk4/mgROwRmZ
         MAnA==
X-Gm-Message-State: ANoB5plVkvQtOD6Afj1fDZkT2oIVEzOe+9fZMQtWrEtmZR8l54Ng7qxm
	/Uyzrj9SJVgQbXeIRQ9CGXUrocePvO2c9kWDne0=
X-Google-Smtp-Source: AA0mqf5fHpdv2FiK4aLNo87LnrSQ8/uKRj7I77quYG+f3tqKxo04vFrpXLRtLfl8CqkoVcX6R1xwVA==
X-Received: by 2002:a62:1413:0:b0:574:e84e:d7a1 with SMTP id 19-20020a621413000000b00574e84ed7a1mr26328077pfu.83.1669904866009;
        Thu, 01 Dec 2022 06:27:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/23] dropbear: fix CVE-2021-36369
Date: Thu,  1 Dec 2022 04:27:03 -1000
Message-Id: <212dd2ce833aaf7f19111e95fbc22fc8c6d63db4.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174095

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dropbear/dropbear.inc       |   4 +-
 .../dropbear/dropbear/CVE-2021-36369.patch    | 145 ++++++++++++++++++
 2 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2021-36369.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 2d6e64cf8d..f3f085b616 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -27,7 +27,9 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.socket \
            file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
+           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
+	   file://CVE-2021-36369.patch \
+	   "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
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


