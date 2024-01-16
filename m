Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3141C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 23:30:47 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.34203.1705447839080296566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 15:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QaZPDN4+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20240116233035baec47a4cfdb412f34-1ngihn@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240116233035baec47a4cfdb412f34
        for <openembedded-core@lists.openembedded.org>;
        Wed, 17 Jan 2024 00:30:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=miioVMdKv7hNiLPdYttStWOREwqMKBZuowHMJYHHDoA=;
 b=QaZPDN4+y+P/Q5dv4U9Shgwwz7puAZGu4YYrELNCzKUJv0cRhN/Wb2aBVzUiNXIq9XFKgt
 VF9sGEo26CWrZFWhDRrbvvQ+/uDfv1mJCSCumuucrRQ7DFh5O3jxHZK1gdw+EAU7A8FBozwh
 2P4y/oXxNCfMwc4RhELbi6LG9haaU=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] dropbear: backport patch for CVE-2023-48795
Date: Wed, 17 Jan 2024 00:29:46 +0100
Message-Id: <20240116232946.323478-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 23:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193880

From: Peter Marko <peter.marko@siemens.com>

Documentation for this patch is under
https://github.com/mkj/dropbear/commit/66bc1fcdee594c6cb1139df0ef8a6c9c5fc3fde3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2023-48795.patch    | 234 ++++++++++++++++++
 2 files changed, 235 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index e61930f7db..a32242949b 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -30,6 +30,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
 	   file://CVE-2021-36369.patch \
 	   file://CVE-2023-36328.patch \
+	   file://CVE-2023-48795.patch \
 	   "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch b/meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch
new file mode 100644
index 0000000000..6800672ab0
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch
@@ -0,0 +1,234 @@
+From 6e43be5c7b99dbee49dc72b6f989f29fdd7e9356 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 20 Nov 2023 14:02:47 +0800
+Subject: [PATCH] Implement Strict KEX mode
+
+As specified by OpenSSH with kex-strict-c-v00@openssh.com and
+kex-strict-s-v00@openssh.com.
+
+CVE: CVE-2023-48795
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/6e43be5c7b99dbee49dc72b6f989f29fdd7e9356]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cli-session.c    | 11 +++++++++++
+ common-algo.c    |  6 ++++++
+ common-kex.c     | 26 +++++++++++++++++++++++++-
+ kex.h            |  3 +++
+ process-packet.c | 34 +++++++++++++++++++---------------
+ ssh.h            |  4 ++++
+ svr-session.c    |  3 +++
+ 7 files changed, 71 insertions(+), 16 deletions(-)
+
+diff --git a/cli-session.c b/src/cli-session.c
+index 5981b2470..d261c8f82 100644
+--- a/cli-session.c
++++ b/cli-session.c
+@@ -46,6 +46,7 @@ static void cli_finished(void) ATTRIB_NORETURN;
+ static void recv_msg_service_accept(void);
+ static void cli_session_cleanup(void);
+ static void recv_msg_global_request_cli(void);
++static void cli_algos_initialise(void);
+ 
+ struct clientsession cli_ses; /* GLOBAL */
+ 
+@@ -114,6 +115,7 @@ void cli_session(int sock_in, int sock_out, struct dropbear_progress_connection
+ 	}
+ 
+ 	chaninitialise(cli_chantypes);
++	cli_algos_initialise();
+ 
+ 	/* Set up cli_ses vars */
+ 	cli_session_init(proxy_cmd_pid);
+@@ -473,3 +475,12 @@ void cli_dropbear_log(int priority, const char* format, va_list param) {
+ 	fflush(stderr);
+ }
+ 
++static void cli_algos_initialise(void) {
++	algo_type *algo;
++	for (algo = sshkex; algo->name; algo++) {
++		if (strcmp(algo->name, SSH_STRICT_KEX_S) == 0) {
++			algo->usable = 0;
++		}
++	}
++}
++
+diff --git a/common-algo.c b/src/common-algo.c
+index 378f0ca8e..f9d46ebb6 100644
+--- a/common-algo.c
++++ b/common-algo.c
+@@ -332,6 +332,12 @@ algo_type sshkex[] = {
+ 	/* Set unusable by svr_algos_initialise() */
+ 	{SSH_EXT_INFO_C, 0, NULL, 1, NULL},
+ #endif
++#endif
++#if DROPBEAR_CLIENT
++	{SSH_STRICT_KEX_C, 0, NULL, 1, NULL},
++#endif
++#if DROPBEAR_SERVER
++	{SSH_STRICT_KEX_S, 0, NULL, 1, NULL},
+ #endif
+ 	{NULL, 0, NULL, 0, NULL}
+ };
+diff --git a/common-kex.c b/src/common-kex.c
+index ac8844246..8e33b12a6 100644
+--- a/common-kex.c
++++ b/common-kex.c
+@@ -183,6 +183,10 @@ void send_msg_newkeys() {
+ 	gen_new_keys();
+ 	switch_keys();
+ 
++	if (ses.kexstate.strict_kex) {
++		ses.transseq = 0;
++	}
++
+ 	TRACE(("leave send_msg_newkeys"))
+ }
+ 
+@@ -193,7 +197,11 @@ void recv_msg_newkeys() {
+ 
+ 	ses.kexstate.recvnewkeys = 1;
+ 	switch_keys();
+-	
++
++	if (ses.kexstate.strict_kex) {
++		ses.recvseq = 0;
++	}
++
+ 	TRACE(("leave recv_msg_newkeys"))
+ }
+ 
+@@ -551,6 +559,10 @@ void recv_msg_kexinit() {
+ 
+ 	ses.kexstate.recvkexinit = 1;
+ 
++	if (ses.kexstate.strict_kex && !ses.kexstate.donefirstkex && ses.recvseq != 1) {
++		dropbear_exit("First packet wasn't kexinit");
++	}
++
+ 	TRACE(("leave recv_msg_kexinit"))
+ }
+ 
+@@ -861,6 +873,18 @@ static void read_kex_algos() {
+ 	}
+ #endif
+ 
++	if (!ses.kexstate.donefirstkex) {
++		const char* strict_name;
++		if (IS_DROPBEAR_CLIENT) {
++			strict_name = SSH_STRICT_KEX_S;
++		} else {
++			strict_name = SSH_STRICT_KEX_C;
++		}
++		if (buf_has_algo(ses.payload, strict_name) == DROPBEAR_SUCCESS) {
++			ses.kexstate.strict_kex = 1;
++		}
++	}
++
+ 	algo = buf_match_algo(ses.payload, sshkex, kexguess2, &goodguess);
+ 	allgood &= goodguess;
+ 	if (algo == NULL || algo->data == NULL) {
+diff --git a/kex.h b/src/kex.h
+index 77cf21a37..7fcc3c252 100644
+--- a/kex.h
++++ b/kex.h
+@@ -83,6 +83,9 @@ struct KEXState {
+ 
+ 	unsigned our_first_follows_matches : 1;
+ 
++	/* Boolean indicating that strict kex mode is in use */
++	unsigned int strict_kex;
++
+ 	time_t lastkextime; /* time of the last kex */
+ 	unsigned int datatrans; /* data transmitted since last kex */
+ 	unsigned int datarecv; /* data received since last kex */
+diff --git a/process-packet.c b/src/process-packet.c
+index 945416023..133a152d0 100644
+--- a/process-packet.c
++++ b/process-packet.c
+@@ -44,6 +44,7 @@ void process_packet() {
+ 
+ 	unsigned char type;
+ 	unsigned int i;
++	unsigned int first_strict_kex = ses.kexstate.strict_kex && !ses.kexstate.donefirstkex;
+ 	time_t now;
+ 
+ 	TRACE2(("enter process_packet"))
+@@ -54,22 +55,24 @@ void process_packet() {
+ 	now = monotonic_now();
+ 	ses.last_packet_time_keepalive_recv = now;
+ 
+-	/* These packets we can receive at any time */
+-	switch(type) {
+ 
+-		case SSH_MSG_IGNORE:
+-			goto out;
+-		case SSH_MSG_DEBUG:
+-			goto out;
++	if (type == SSH_MSG_DISCONNECT) {
++		/* Allowed at any time */
++		dropbear_close("Disconnect received");
++	}
+ 
+-		case SSH_MSG_UNIMPLEMENTED:
+-			/* debugging XXX */
+-			TRACE(("SSH_MSG_UNIMPLEMENTED"))
+-			goto out;
+-			
+-		case SSH_MSG_DISCONNECT:
+-			/* TODO cleanup? */
+-			dropbear_close("Disconnect received");
++	/* These packets may be received at any time,
++	   except during first kex with strict kex */
++	if (!first_strict_kex) {
++		switch(type) {
++			case SSH_MSG_IGNORE:
++				goto out;
++			case SSH_MSG_DEBUG:
++				goto out;
++			case SSH_MSG_UNIMPLEMENTED:
++				TRACE(("SSH_MSG_UNIMPLEMENTED"))
++				goto out;
++		}
+ 	}
+ 
+ 	/* Ignore these packet types so that keepalives don't interfere with
+@@ -98,7 +101,8 @@ void process_packet() {
+ 			if (type >= 1 && type <= 49
+ 				&& type != SSH_MSG_SERVICE_REQUEST
+ 				&& type != SSH_MSG_SERVICE_ACCEPT
+-				&& type != SSH_MSG_KEXINIT)
++				&& type != SSH_MSG_KEXINIT
++				&& !first_strict_kex)
+ 			{
+ 				TRACE(("unknown allowed packet during kexinit"))
+ 				recv_unimplemented();
+diff --git a/ssh.h b/src/ssh.h
+index 1b4fec65f..ef3efdca0 100644
+--- a/ssh.h
++++ b/ssh.h
+@@ -100,6 +100,10 @@
+ #define SSH_EXT_INFO_C "ext-info-c"
+ #define SSH_SERVER_SIG_ALGS "server-sig-algs"
+ 
++/* OpenSSH strict KEX feature */
++#define SSH_STRICT_KEX_S "kex-strict-s-v00@openssh.com"
++#define SSH_STRICT_KEX_C "kex-strict-c-v00@openssh.com"
++
+ /* service types */
+ #define SSH_SERVICE_USERAUTH "ssh-userauth"
+ #define SSH_SERVICE_USERAUTH_LEN 12
+diff --git a/svr-session.c b/src/svr-session.c
+index 769f0731d..a538e2c5c 100644
+--- a/svr-session.c
++++ b/svr-session.c
+@@ -342,6 +342,9 @@ static void svr_algos_initialise(void) {
+ 			algo->usable = 0;
+ 		}
+ #endif
++		if (strcmp(algo->name, SSH_STRICT_KEX_C) == 0) {
++			algo->usable = 0;
++		}
+ 	}
+ }
+ 
-- 
2.30.2


