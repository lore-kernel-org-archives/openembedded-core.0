Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F343FC47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 18:58:04 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.54144.1705863483413806037
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 10:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=27lhDGjj;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bbb4806f67so2366609b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 10:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705863482; x=1706468282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mamYm2I8/RACumHcCq3ratN0+0f6QsHReTPbuJGugmI=;
        b=27lhDGjjhCUEmdUmfqi0RYQerwa2W1hqoAgTcuetK+taRxgOxfBBLbDqUqK7+l/k5C
         Pmuvb6X6RSRfsgRAb+eKs7gNkvyuaKj0f2lnoLWzI9NmzomhF7UrB2Isl+4ErpaQpnCq
         sZ2KElTMxgce3C8m7Tx/WZ6HBTBvYIwzPt0pbI0gYsqplgR/iJ7Q2TsTkcp1YzjbJqOQ
         qUDNFLCkNfd4Nkcp4fqyJypXbRnGOTEKsdWi9GkXidOTySihQhdCbhM5x8sIO3YYxr05
         oFhnQU0pa53QLfAfYarXEYegBvaZE7DHw62/43HNB03Pg3StcpPpG1pS3sH/P+NSEaZ7
         15BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705863482; x=1706468282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mamYm2I8/RACumHcCq3ratN0+0f6QsHReTPbuJGugmI=;
        b=h3cJQkmzBzRrgm86bfZShrSF7SrU1xlN9ZaTIH5nVMfBZ4rL7midLriLe/r8ambbtB
         x1994BAVm3tJBHxQQ/p3VR//LU+vNGoUDkyWKhtzGsFtHXxaT2yA3QNktgpEBMK5Ba6C
         wS8TsDsftLN412LwUF4BSA1Lf5nEr1LuPCwz6kAN04pTTWprcxl/XksnVAYo00KB0TRs
         yNA3RZp7kaQMDw5ijeGQJK0U5dpg+TcOhvo7qyCmXRCA9X3RsjiHmfuQei8nzUvf1a+P
         l9I7ld4/aS9FY+aHgiIzneeqZOcdCiVFOo6AEEM7+HV7I4/cQTyJVwaSKleYZWVXLWMK
         HtaA==
X-Gm-Message-State: AOJu0YzmTmZIyaYVD6wPtgl34jcYeBXCUKORtLJIWPrd0bQZKKYAYryr
	sTkGgJBxOTrg7MwYtfyB8z/Vxqmjrf7MvK6eU2azGazhOBfaZmG1cUNP2j/vi22FQxpnNbUHKHz
	ctfXu7w==
X-Google-Smtp-Source: AGHT+IFdi54ZJIv2rpwMd+R9Dg7Pluir7TvcKHHLvnFEUXQX304Odp4YcGY6FdGtWbINFG3WL2LulQ==
X-Received: by 2002:a05:6808:10cb:b0:3bd:56ce:89e3 with SMTP id s11-20020a05680810cb00b003bd56ce89e3mr4059376ois.60.1705863481894;
        Sun, 21 Jan 2024 10:58:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id t187-20020a6281c4000000b006d99125b114sm8675277pfd.65.2024.01.21.10.58.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 10:58:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/6] dropbear: backport patch for CVE-2023-48795
Date: Sun, 21 Jan 2024 08:57:50 -1000
Message-Id: <626711a95f387090a4705401d2f9406909821f95.1705863274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705863274.git.steve@sakoman.com>
References: <cover.1705863274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 18:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194095

From: Peter Marko <peter.marko@siemens.com>

Documentation for this patch is under
https://github.com/mkj/dropbear/commit/66bc1fcdee594c6cb1139df0ef8a6c9c5fc3fde3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


