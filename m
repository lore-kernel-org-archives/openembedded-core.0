Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC87C3DA71
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:15 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.14916.1671202691847433743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=f86bqcci;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so8875567pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfPCxcsrb6Z3n71/Grod/lqHPgZJJ4Hn/29JX+YgF08=;
        b=f86bqcciL4dVaqn9SDjJgFML54iTGaYlCszlHALtDsD7C6ur2rSy236nXkkCrsF0vM
         vjjfuFme6LV7eRPqR/sAPLk1TGn/HKr8nxmJlKixTb8NIwleDE3beUgVi/AWgvYHwXKN
         u/F0W+nhM6fTpxkF4D8aIDPl3/KxfIpbp2HAprTavheq5gzWF52CHdesj0PCXjgIj82O
         RDEtf4kjtelCSMqnPHLoe3iUbsb1RVgkbCTt64qkLV7TaIq5asjko7Ig15IqXwIfIhbN
         ho1siAEDaoDNpwhuTtub7qnChgPOeN0Hx7JMZ8T14FjjWOIe9Bu9So2TNzJw8CAObbVo
         4ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfPCxcsrb6Z3n71/Grod/lqHPgZJJ4Hn/29JX+YgF08=;
        b=Haf1w/Ad0cC/ICB3+AcneotNCcGsJF6aWwjUE41TEEgrQdVIe4q7JIIe4adKnlLNSG
         V0cCsdkNM1Q0QYMxG9kbxMT1pzo6+KiXGzFsVbsrHsb25dp61I+zE5glokW0sy+XXT5V
         srxnyCWggv3FX2d36W3LCmxaW9GpYnAbjc2109O+x3s3hDMWOfFUu7mRHqOp7OUGx8WI
         5E2zF5J9l6m631COP6ElohhXKbZ5m611x6TtdtslNKV6uclBhlT1mZFthi2uvi6jF+RR
         4SaaAp5Llspe/rcVZHT0HKl5Qjzg9wLdtkFfIaB2hw1nKGi9NHGN2wOHSg3oHCRD+qYY
         MTSA==
X-Gm-Message-State: ANoB5pl1URL8nKGbZbxsv9cC508eNUBAtAukc4koCQHjlS19KAa+k1vh
	tj7WFdcppQPsc2F8ID8u/1IZ6xZNPIX0UwCEzms=
X-Google-Smtp-Source: AA0mqf6uAcNzC4f/OUayDV2vGuXu4WlM/JhzYtEuvfZJq3qBSnMFdLhJiWa25cvXiOoZMX7JO08T4w==
X-Received: by 2002:a17:90a:e391:b0:219:89c1:33ed with SMTP id b17-20020a17090ae39100b0021989c133edmr33299588pjz.46.1671202690805;
        Fri, 16 Dec 2022 06:58:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/13] dropbear: fix CVE-2021-36369
Date: Fri, 16 Dec 2022 04:57:45 -1000
Message-Id: <c0e44595555a81d1a1cd206c2235cbc419d02bd1.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174750

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 0000000000..5cabe8339d
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2021-36369.patch
@@ -0,0 +1,145 @@
+From e10dec82930863e487b22978d3df107274f366b2 Mon Sep 17 00:00:00 2001
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
+index 7cee164..7da1a04 100644
+--- a/cli-authpubkey.c
++++ b/cli-authpubkey.c
+@@ -174,6 +174,7 @@ static void send_msg_userauth_pubkey(sign_key *key, int type, int realsign) {
+ 		buf_putbytes(sigbuf, ses.writepayload->data, ses.writepayload->len);
+ 		cli_buf_put_sign(ses.writepayload, key, type, sigbuf);
+ 		buf_free(sigbuf); /* Nothing confidential in the buffer */
++		cli_ses.is_trivial_auth = 0;
+ 	}
+ 
+ 	encrypt_packet();
+diff --git a/cli-runopts.c b/cli-runopts.c
+index 7d1fffe..6bf8b8e 100644
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
+@@ -888,6 +889,7 @@ static void add_extendedopt(const char* origstr) {
+ #if DROPBEAR_CLI_ANYTCPFWD
+ 			"\tExitOnForwardFailure\n"
+ #endif
++			"\tDisableTrivialAuth\n"
+ #ifndef DISABLE_SYSLOG
+ 			"\tUseSyslog\n"
+ #endif
+@@ -915,5 +917,10 @@ static void add_extendedopt(const char* origstr) {
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
+index 56dd4af..73ef0db 100644
+--- a/cli-session.c
++++ b/cli-session.c
+@@ -164,6 +164,7 @@ static void cli_session_init(pid_t proxy_cmd_pid) {
+ 	/* Auth */
+ 	cli_ses.lastprivkey = NULL;
+ 	cli_ses.lastauthtype = 0;
++	cli_ses.is_trivial_auth = 1;
+ 
+ 	/* For printing "remote host closed" for the user */
+ 	ses.remoteclosed = cli_remoteclosed;
+diff --git a/runopts.h b/runopts.h
+index 31eae1f..8519626 100644
+--- a/runopts.h
++++ b/runopts.h
+@@ -154,6 +154,7 @@ typedef struct cli_runopts {
+ #if DROPBEAR_CLI_ANYTCPFWD
+ 	int exit_on_fwd_failure;
+ #endif
++	int disable_trivial_auth;
+ #if DROPBEAR_CLI_REMOTETCPFWD
+ 	m_list * remotefwds;
+ #endif
+diff --git a/session.h b/session.h
+index 0f77055..8676054 100644
+--- a/session.h
++++ b/session.h
+@@ -287,6 +287,7 @@ struct clientsession {
+ 
+ 	int lastauthtype; /* either AUTH_TYPE_PUBKEY or AUTH_TYPE_PASSWORD,
+ 						 for the last type of auth we tried */
++	int is_trivial_auth;
+ 	int ignore_next_auth_response;
+ #if DROPBEAR_CLI_INTERACT_AUTH
+ 	int auth_interact_failed; /* flag whether interactive auth can still
-- 
2.25.1


