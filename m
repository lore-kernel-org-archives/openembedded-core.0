Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C236C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 09:02:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13935.1704272522560213033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 01:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kqxtjiEb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1732c19743=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4038di1g000895
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jan 2024 01:02:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=nC0LR
	cSR7Tsz7hhQu7nOJyPIAuRGpJLDNhuiFSM3q0k=; b=kqxtjiEbzSkc+ChwlBgJt
	7Ye0R1TZ4BnEVyVZNdy/dycUBNU/lW8rRKytDXXUeQ9zKMmshysrjAOOIADeHgmm
	BRhJAnjanui9APJoRV5IAShLeWcR3nP37nJxkNhhKh1WffThHndUaC3giJQI6T5E
	sB1eCjfmDRIqf4R54/412cI5gIhLrOhotuUh/BcXQuGUAtKgvX8WNMqfNZx1eqkZ
	kBH66/9RA8BaIi8xKFkY4ZfAT1DCmF1W+fami2jTq2k3TON2+AhohMqoSRpcu+d8
	p3SpfK3yOq2vwWSIQ9ZSpESN2zB238yo18TkswzhcyTzvqCoKaOazdB5JN6LnWu8
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vafc4bwug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 01:02:02 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 01:02:05 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] dropbear: fix CVE-2023-48795
Date: Wed, 3 Jan 2024 09:00:49 +0000
Message-ID: <20240103090049.2048094-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: XpXQhbDMC5wXAq6dSKc6pZCHm-4BNNZ6
X-Proofpoint-ORIG-GUID: XpXQhbDMC5wXAq6dSKc6pZCHm-4BNNZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 09:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193277

From: Meenali Gupta <meenali.gupta@windriver.com>

A flaw was found in the SSH channel integrity.
By manipulating sequence numbers during the handshake,
an attacker can remove the initial messages on the secure
channel without causing a MAC failure. For example, an attacker
could disable the ping extension and thus disable the new
countermeasure in OpenSSH 9.5 against keystroke timing attacks.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2023-48795.patch    | 235 ++++++++++++++++++
 2 files changed, 236 insertions(+)
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
index 0000000000..d3f7c014ef
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch
@@ -0,0 +1,235 @@
+From 768546edcf45794538f81c096f5544a5d35e336f Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 20 Nov 2023 14:02:47 +0800
+Subject: [PATCH] Implement Strict KEX mode
+
+As specified by OpenSSH with kex-strict-c-v00@openssh.com and
+kex-strict-s-v00@openssh.com.
+
+CVE: CVE-2023-48795
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/6e43be5c7b99dbee49dc72b6f989f29fdd7e9356]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ cli-session.c    | 11 +++++++++++
+ common-algo.c    |  6 ++++++
+ common-kex.c     | 24 ++++++++++++++++++++++++
+ kex.h            |  3 +++
+ process-packet.c | 35 +++++++++++++++++++----------------
+ ssh.h            |  4 ++++
+ svr-session.c    |  3 +++
+ 7 files changed, 70 insertions(+), 16 deletions(-)
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
+	}
+
+	chaninitialise(cli_chantypes);
++	cli_algos_initialise();
+
+	/* Set up cli_ses vars */
+	cli_session_init(proxy_cmd_pid);
+@@ -487,3 +489,12 @@ void cli_dropbear_log(int priority, const char* format, va_list param) {
+	fflush(stderr);
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
+	/* Set unusable by svr_algos_initialise() */
+	{SSH_EXT_INFO_C, 0, NULL, 1, NULL},
+ #endif
++#endif
++#if DROPBEAR_CLIENT
++	{SSH_STRICT_KEX_C, 0, NULL, 1, NULL},
++#endif
++#if DROPBEAR_SERVER
++	{SSH_STRICT_KEX_S, 0, NULL, 1, NULL},
+ #endif
+	{NULL, 0, NULL, 0, NULL}
+ };
+diff --git a/common-kex.c b/common-kex.c
+index ac88442..e6825e1 100644
+--- a/common-kex.c
++++ b/common-kex.c
+@@ -183,6 +183,10 @@ void send_msg_newkeys() {
+	gen_new_keys();
+	switch_keys();
+
++	if (ses.kexstate.strict_kex) {
++		ses.transseq = 0;
++	}
++
+	TRACE(("leave send_msg_newkeys"))
+ }
+
+@@ -194,6 +198,10 @@ void recv_msg_newkeys() {
+	ses.kexstate.recvnewkeys = 1;
+	switch_keys();
+
++	if (ses.kexstate.strict_kex) {
++		ses.recvseq = 0;
++	}
++
+	TRACE(("leave recv_msg_newkeys"))
+ }
+
+@@ -550,6 +558,10 @@ void recv_msg_kexinit() {
+
+	ses.kexstate.recvkexinit = 1;
+
++        if (ses.kexstate.strict_kex && !ses.kexstate.donefirstkex && ses.recvseq != 1) {
++		dropbear_exit("First packet wasn't kexinit");
++	}
++
+	TRACE(("leave recv_msg_kexinit"))
+ }
+
+@@ -859,6 +871,18 @@ static void read_kex_algos() {
+	}
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
+	algo = buf_match_algo(ses.payload, sshkex, kexguess2, &goodguess);
+	allgood &= goodguess;
+	if (algo == NULL || algo->data == NULL) {
+diff --git a/kex.h b/kex.h
+index 77cf21a..7fcc3c2 100644
+--- a/kex.h
++++ b/kex.h
+@@ -83,6 +83,9 @@ struct KEXState {
+
+	unsigned our_first_follows_matches : 1;
+
++	/* Boolean indicating that strict kex mode is in use */
++	unsigned int strict_kex;
++
+	time_t lastkextime; /* time of the last kex */
+	unsigned int datatrans; /* data transmitted since last kex */
+	unsigned int datarecv; /* data received since last kex */
+diff --git a/process-packet.c b/process-packet.c
+index 9454160..0270f71 100644
+--- a/process-packet.c
++++ b/process-packet.c
+@@ -44,6 +44,7 @@ void process_packet() {
+
+	unsigned char type;
+	unsigned int i;
++	unsigned int first_strict_kex = ses.kexstate.strict_kex && !ses.kexstate.donefirstkex;
+	time_t now;
+
+	TRACE2(("enter process_packet"))
+@@ -54,22 +55,23 @@ void process_packet() {
+	now = monotonic_now();
+	ses.last_packet_time_keepalive_recv = now;
+
+-	/* These packets we can receive at any time */
+-	switch(type) {
+-
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
+	}
+
+	/* Ignore these packet types so that keepalives don't interfere with
+@@ -98,7 +100,8 @@ void process_packet() {
+			if (type >= 1 && type <= 49
+				&& type != SSH_MSG_SERVICE_REQUEST
+				&& type != SSH_MSG_SERVICE_ACCEPT
+-				&& type != SSH_MSG_KEXINIT)
++				&& type != SSH_MSG_KEXINIT
++				&& !first_strict_kex)
+			{
+				TRACE(("unknown allowed packet during kexinit"))
+				recv_unimplemented();
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
+			algo->usable = 0;
+		}
+ #endif
++		if (strcmp(algo->name, SSH_STRICT_KEX_C) == 0) {
++			algo->usable = 0;
++		}
+	}
+ }
+
+--
+2.40.0
-- 
2.40.0


