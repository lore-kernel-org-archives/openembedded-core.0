Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D97D637B7
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:34 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.22178.1731530553048967005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ktacy7gI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso73229515ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530551; x=1732135351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tF+toVNy2BNfzg7bwjGcNl4sMjZvIkS36Q0bB6GHxxg=;
        b=ktacy7gIjYFGQTBvm4XEzD+VjjEam4h119JPdaf3k17uSuJTTFyOOPh2SFuEHSl58F
         qGLOpcEjnbyuOQVQoMkZhFAmshF0r8rIoo7SGOlF2ARFKr+/AEvTsMsJibfUxoQtV6RB
         9PllYcav+dxsot4nSt8TxO9bC7SY3d5t/l9lr3PPOUJV20mqm/D+PSPx+XYJ+/fZpM0S
         Du8VlT4XzSnRbYKRkzWwbXI1T0Q5bAX+6ALy2QkuvCxmc5NHCSXQocDldRBN09NNbplP
         6a+0Jt9QOwxwfSK5+L8tIjYWfLVKSi+Csil20b9g/1VafR/lebagjaWr5CcBcGexA4P0
         N/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530551; x=1732135351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF+toVNy2BNfzg7bwjGcNl4sMjZvIkS36Q0bB6GHxxg=;
        b=bXZCvo9lNLDoIzFDqitsooRjI0G/jA/SwI7z5Uv3kIwDLLQi69s1cv1M7u8nKa0h8S
         FS1u2DNetYLWXb+IBZNNVs3/w4sZ0EZTRIY/YBlZ2IYpZBA8H3YAKFOTOwWZ27xo5AhS
         BStxSsEV10StnBfcdn/7rLr1/TtR6QrcN0Y1PbwgqIvRFxZi2/V1MGfbO6VFgTWb5j/9
         bqdnnxc1nsAmEJJj7F//uuPjLY0kwj0Oy7ZrDe2gllw5jZo6lFyBgW6EsvN1OFRQYtYW
         IM6p/3SAdKkfrmsXImzAxHfsFMr2EiaNV+HLqIpBiH9Uam6wCTUKsVkXWo13H9gLKTLe
         ladw==
X-Gm-Message-State: AOJu0Yyo63GTWbUiKgBCD8S6hYLOaqtSakfieTIPmfhMh6EOwQZ64a/x
	nZ8+pNB/7jNS3qEy0sOsuXDXlDbrOgKC3+6J0HROIahlE52BjLLvQVjJe+4KuGOV2Ex3EbU3E/V
	E
X-Google-Smtp-Source: AGHT+IGv/y6G1DP/dr3KoSBetexg14zVPRXd2TpQ6pJtUxS9qJT/oiabYYPzSii8MEVDjiDnp4BJhQ==
X-Received: by 2002:a17:903:234c:b0:20b:6188:fc5e with SMTP id d9443c01a7336-21183d66a42mr302908945ad.28.1731530551396;
        Wed, 13 Nov 2024 12:42:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/9] dropbear: backport patch for CVE-2023-48795
Date: Wed, 13 Nov 2024 12:42:16 -0800
Message-Id: <2ab0b4212aee85c77c3667ccfaedbe9540e78e3f.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731530398.git.steve@sakoman.com>
References: <cover.1731530398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207125

From: Peter Marko <peter.marko@siemens.com>

Documentation for this patch is under
https://github.com/mkj/dropbear/commit/66bc1fcdee594c6cb1139df0ef8a6c9c5fc3fde3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dropbear/dropbear/CVE-2023-48795.patch    | 234 ++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |   1 +
 2 files changed, 235 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch b/meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch
new file mode 100644
index 0000000000..64b0405473
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
+diff --git a/cli-session.c b/cli-session.c
+index 5981b24..d261c8f 100644
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
+@@ -117,6 +118,7 @@ void cli_session(int sock_in, int sock_out, struct dropbear_progress_connection
+ 	}
+ 
+ 	chaninitialise(cli_chantypes);
++	cli_algos_initialise();
+ 
+ 	/* Set up cli_ses vars */
+ 	cli_session_init(proxy_cmd_pid);
+@@ -487,3 +489,12 @@ void cli_dropbear_log(int priority, const char* format, va_list param) {
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
+diff --git a/common-algo.c b/common-algo.c
+index 378f0ca..f9d46eb 100644
+--- a/common-algo.c
++++ b/common-algo.c
+@@ -307,6 +307,12 @@ algo_type sshkex[] = {
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
+diff --git a/common-kex.c b/common-kex.c
+index ac88442..8e33b12 100644
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
+@@ -550,6 +558,10 @@ void recv_msg_kexinit() {
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
+@@ -859,6 +871,18 @@ static void read_kex_algos() {
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
+diff --git a/kex.h b/kex.h
+index 77cf21a..7fcc3c2 100644
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
+diff --git a/process-packet.c b/process-packet.c
+index 9454160..133a152 100644
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
+diff --git a/ssh.h b/ssh.h
+index 1b4fec6..ef3efdc 100644
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
+diff --git a/svr-session.c b/svr-session.c
+index 769f073..a538e2c 100644
+--- a/svr-session.c
++++ b/svr-session.c
+@@ -370,6 +370,9 @@ static void svr_algos_initialise(void) {
+ 			algo->usable = 0;
+ 		}
+ #endif
++		if (strcmp(algo->name, SSH_STRICT_KEX_C) == 0) {
++			algo->usable = 0;
++		}
+ 	}
+ }
+ 
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index 528eff1a10..686cb8a809 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            file://CVE-2023-36328.patch \
+           file://CVE-2023-48795.patch \
            "
 
 SRC_URI[sha256sum] = "bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b"
-- 
2.34.1


