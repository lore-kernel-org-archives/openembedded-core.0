Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83471C47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 07:08:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3784.1705475317912276508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 23:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L+nkxh92;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1746fad9ec=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40H4kelZ004837
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 23:08:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=EniS7
	PTBkBIIWbwQUN0VZtpaeJ91niZSASQDl6OF/Es=; b=L+nkxh92iAYsAFst87XGI
	zjoU1fdO78JpB1RUNwq5w6S9O6jX4WlNamOiF9+Wo5fjULgtl98o9ApZpCfUBdpk
	KG0QxivJGZhqg96h/oZMTTVeG6sQUOGgMODG/N0PWB2+6t/YakNpda+vnziqe6LH
	nQofn3Bmi1MtjmuHGVoAyUDoxn+jdY5ufWj1ZE0Bz9HvwWP5h8CYFPfQA5JZ7mwZ
	Zg8zdiSWsFtpP34UybjfoR4yZ8Nm8AdvDSq2SS+pkxR+0n/fIoA3M76n6l5FOJc8
	XaIBI8t91G9+ys1rSxp5noZHNp7gzzm9zze3h5T3KXwucBEJsokVkXBFBWvzzL2A
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwkkv6w-17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 23:08:37 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 23:08:47 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] openssh: fix CVE-2023-48795
Date: Wed, 17 Jan 2024 07:08:17 +0000
Message-ID: <20240117070817.1099249-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: hpoRLmJ-D7eu6VSbbSL-Lmf26-cCoDwR
X-Proofpoint-GUID: hpoRLmJ-D7eu6VSbbSL-Lmf26-cCoDwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_02,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401170047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193892

From: Meenali Gupta <meenali.gupta@windriver.com>

A flaw was found in the SSH channel integrity.By manipulating sequence
numbers during the handshake,an attacker can remove the initial messages
on the secure channel without causing a MAC failure. For example,an attacker
could disable the ping extension and thus disable the new countermeasure in
OpenSSH 9.5 against keystroke timing attacks.

This CVE fix included function kex_proposal_populate_entries in kex.c file which
is not present in 8.9p, so ignored this change.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../openssh/openssh/CVE-2023-48795.patch      | 503 ++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |   1 +
 2 files changed, 504 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
new file mode 100644
index 0000000000..b1b16d5641
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
@@ -0,0 +1,503 @@
+From 1edb00c58f8a6875fad6a497aa2bacf37f9e6cd5 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 18 Dec 2023 14:45:17 +0000
+Subject: [PATCH] upstream: implement "strict key exchange" in ssh and sshd
+ This adds a protocol extension to improve the integrity of the SSH transport
+ protocol, particular in and around the initial key exchange (KEX) phase.
+
+Full details of the extension are in the PROTOCOL file.
+
+with markus@
+
+OpenBSD-Commit-ID: 2a66ac962f0a630d7945fee54004ed9e9c439f14
+
+CVE: CVE-2023-48795
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/1edb00c58f8a6875fad6a497aa2bacf37f9e6cd5]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ PROTOCOL      |  28 +++++++++++++-
+ kex.c         |  71 +++++++++++++++++++++-------------
+ kex.h         |   3 +-
+ packet.c      | 103 +++++++++++++++++++++++++++++---------------------
+ packet.h      |   3 +-
+ sshconnect2.c |  12 ++----
+ 6 files changed, 137 insertions(+), 83 deletions(-)
+
+diff --git a/PROTOCOL b/PROTOCOL
+index e6a7d60..68912ce 100644
+--- a/PROTOCOL
++++ b/PROTOCOL
+@@ -102,6 +102,32 @@ OpenSSH supports the use of ECDH in Curve25519 for key exchange as
+ described at:
+ http://git.libssh.org/users/aris/libssh.git/plain/doc/curve25519-sha256@libssh.org.txt?h=curve25519
+
++1.9 transport: strict key exchange extension
++
++OpenSSH supports a number of transport-layer hardening measures under
++a "strict KEX" feature. This feature is signalled similarly to the
++RFC8308 ext-info feature: by including a additional algorithm in the
++initiial SSH2_MSG_KEXINIT kex_algorithms field. The client may append
++"kex-strict-c-v00@openssh.com" to its kex_algorithms and the server
++may append "kex-strict-s-v00@openssh.com". These pseudo-algorithms
++are only valid in the initial SSH2_MSG_KEXINIT and MUST be ignored
++if they are present in subsequent SSH2_MSG_KEXINIT packets.
++
++When an endpoint that supports this extension observes this algorithm
++name in a peer's KEXINIT packet, it MUST make the following changes to
++the the protocol:
++
++a) During initial KEX, terminate the connection if any unexpected or
++   out-of-sequence packet is received. This includes terminating the
++   connection if the first packet received is not SSH2_MSG_KEXINIT.
++   Unexpected packets for the purpose of strict KEX include messages
++   that are otherwise valid at any time during the connection such as
++   SSH2_MSG_DEBUG and SSH2_MSG_IGNORE.
++b) After sending or receiving a SSH2_MSG_NEWKEYS message, reset the
++   packet sequence number to zero. This behaviour persists for the
++   duration of the connection (i.e. not just the first
++   SSH2_MSG_NEWKEYS).
++
+ 2. Connection protocol changes
+
+ 2.1. connection: Channel write close extension "eow@openssh.com"
+@@ -612,4 +638,4 @@ master instance and later clients.
+ OpenSSH extends the usual agent protocol. These changes are documented
+ in the PROTOCOL.agent file.
+
+-$OpenBSD: PROTOCOL,v 1.43 2021/12/19 22:15:42 djm Exp $
++$OpenBSD: PROTOCOL,v 1.50 2023/12/18 14:45:17 djm Exp $
+diff --git a/kex.c b/kex.c
+index 0bcd27d..da16568 100644
+--- a/kex.c
++++ b/kex.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: kex.c,v 1.172 2022/02/01 23:32:51 djm Exp $ */
++/* $OpenBSD: kex.c,v 1.183 2023/12/18 14:45:17 djm Exp $ */
+ /*
+  * Copyright (c) 2000, 2001 Markus Friedl.  All rights reserved.
+  *
+@@ -63,7 +63,7 @@
+ #include "digest.h"
+
+ /* prototype */
+-static int kex_choose_conf(struct ssh *);
++static int kex_choose_conf(struct ssh *, uint32_t seq);
+ static int kex_input_newkeys(int, u_int32_t, struct ssh *);
+
+ static const char * const proposal_names[PROPOSAL_MAX] = {
+@@ -175,6 +175,18 @@ kex_names_valid(const char *names)
+	return 1;
+ }
+
++/* returns non-zero if proposal contains any algorithm from algs */
++static int
++has_any_alg(const char *proposal, const char *algs)
++{
++	char *cp;
++
++	if ((cp = match_list(proposal, algs, NULL)) == NULL)
++		return 0;
++	free(cp);
++	return 1;
++}
++
+ /*
+  * Concatenate algorithm names, avoiding duplicates in the process.
+  * Caller must free returned string.
+@@ -182,7 +194,7 @@ kex_names_valid(const char *names)
+ char *
+ kex_names_cat(const char *a, const char *b)
+ {
+-	char *ret = NULL, *tmp = NULL, *cp, *p, *m;
++	char *ret = NULL, *tmp = NULL, *cp, *p;
+	size_t len;
+
+	if (a == NULL || *a == '\0')
+@@ -199,10 +211,8 @@ kex_names_cat(const char *a, const char *b)
+	}
+	strlcpy(ret, a, len);
+	for ((p = strsep(&cp, ",")); p && *p != '\0'; (p = strsep(&cp, ","))) {
+-		if ((m = match_list(ret, p, NULL)) != NULL) {
+-			free(m);
++		if (has_any_alg(ret, p))
+			continue; /* Algorithm already present */
+-		}
+		if (strlcat(ret, ",", len) >= len ||
+		    strlcat(ret, p, len) >= len) {
+			free(tmp);
+@@ -410,7 +420,12 @@ kex_protocol_error(int type, u_int32_t seq, struct ssh *ssh)
+ {
+	int r;
+
+-	error("kex protocol error: type %d seq %u", type, seq);
++	/* If in strict mode, any unexpected message is an error */
++	if ((ssh->kex->flags & KEX_INITIAL) && ssh->kex->kex_strict) {
++		ssh_packet_disconnect(ssh, "strict KEX violation: "
++		    "unexpected packet type %u (seqnr %u)", type, seq);
++	}
++	error_f("type %u seq %u", type, seq);
+	if ((r = sshpkt_start(ssh, SSH2_MSG_UNIMPLEMENTED)) != 0 ||
+	    (r = sshpkt_put_u32(ssh, seq)) != 0 ||
+	    (r = sshpkt_send(ssh)) != 0)
+@@ -496,7 +511,7 @@ kex_input_ext_info(int type, u_int32_t seq, struct ssh *ssh)
+			/* Ensure no \0 lurking in value */
+			if (memchr(val, '\0', vlen) != NULL) {
+				error_f("nul byte in %s", name);
+-				return SSH_ERR_INVALID_FORMAT;
++				return dispatch_protocol_error(type, seq, ssh);
+			}
+			debug_f("%s=<%s>", name, val);
+			kex->server_sig_algs = val;
+@@ -600,7 +615,7 @@ kex_input_kexinit(int type, u_int32_t seq, struct ssh *ssh)
+		error_f("no kex");
+		return SSH_ERR_INTERNAL_ERROR;
+	}
+-	ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, NULL);
++	ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, &kex_protocol_error);
+	ptr = sshpkt_ptr(ssh, &dlen);
+	if ((r = sshbuf_put(kex->peer, ptr, dlen)) != 0)
+		return r;
+@@ -636,7 +651,7 @@ kex_input_kexinit(int type, u_int32_t seq, struct ssh *ssh)
+	if (!(kex->flags & KEX_INIT_SENT))
+		if ((r = kex_send_kexinit(ssh)) != 0)
+			return r;
+-	if ((r = kex_choose_conf(ssh)) != 0)
++	if ((r = kex_choose_conf(ssh, seq)) != 0)
+		return r;
+
+	if (kex->kex_type < KEX_MAX && kex->kex[kex->kex_type] != NULL)
+@@ -900,20 +915,14 @@ proposals_match(char *my[PROPOSAL_MAX], char *peer[PROPOSAL_MAX])
+	return (1);
+ }
+
+-/* returns non-zero if proposal contains any algorithm from algs */
+ static int
+-has_any_alg(const char *proposal, const char *algs)
++kexalgs_contains(char **peer, const char *ext)
+ {
+-	char *cp;
+-
+-	if ((cp = match_list(proposal, algs, NULL)) == NULL)
+-		return 0;
+-	free(cp);
+-	return 1;
++	return has_any_alg(peer[PROPOSAL_KEX_ALGS], ext);
+ }
+
+ static int
+-kex_choose_conf(struct ssh *ssh)
++kex_choose_conf(struct ssh *ssh, uint32_t seq)
+ {
+	struct kex *kex = ssh->kex;
+	struct newkeys *newkeys;
+@@ -938,13 +947,23 @@ kex_choose_conf(struct ssh *ssh)
+		sprop=peer;
+	}
+
+-	/* Check whether client supports ext_info_c */
+-	if (kex->server && (kex->flags & KEX_INITIAL)) {
+-		char *ext;
+-
+-		ext = match_list("ext-info-c", peer[PROPOSAL_KEX_ALGS], NULL);
+-		kex->ext_info_c = (ext != NULL);
+-		free(ext);
++	/* Check whether peer supports ext_info/kex_strict */
++	if ((kex->flags & KEX_INITIAL) != 0) {
++		if (kex->server) {
++			kex->ext_info_c = kexalgs_contains(peer, "ext-info-c");
++			kex->kex_strict = kexalgs_contains(peer,
++			    "kex-strict-c-v00@openssh.com");
++		} else {
++			kex->kex_strict = kexalgs_contains(peer,
++			    "kex-strict-s-v00@openssh.com");
++		}
++		if (kex->kex_strict) {
++			debug3_f("will use strict KEX ordering");
++			if (seq != 0)
++				ssh_packet_disconnect(ssh,
++				    "strict KEX violation: "
++				    "KEXINIT was not the first packet");
++		}
+	}
+
+	/* Check whether client supports rsa-sha2 algorithms */
+diff --git a/kex.h b/kex.h
+index c353295..c27f9d8 100644
+--- a/kex.h
++++ b/kex.h
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: kex.h,v 1.117 2022/01/06 21:55:23 djm Exp $ */
++/* $OpenBSD: kex.h,v 1.120 2023/12/18 14:45:17 djm Exp $ */
+
+ /*
+  * Copyright (c) 2000, 2001 Markus Friedl.  All rights reserved.
+@@ -148,6 +148,7 @@ struct kex {
+	u_int	kex_type;
+	char	*server_sig_algs;
+	int	ext_info_c;
++	int	kex_strict;
+	struct sshbuf *my;
+	struct sshbuf *peer;
+	struct sshbuf *client_version;
+diff --git a/packet.c b/packet.c
+index bde6c10..322a8c2 100644
+--- a/packet.c
++++ b/packet.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: packet.c,v 1.307 2022/01/22 00:49:34 djm Exp $ */
++/* $OpenBSD: packet.c,v 1.313 2023/12/18 14:45:17 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -1205,8 +1205,13 @@ ssh_packet_send2_wrapped(struct ssh *ssh)
+	sshbuf_dump(state->output, stderr);
+ #endif
+	/* increment sequence number for outgoing packets */
+-	if (++state->p_send.seqnr == 0)
++	if (++state->p_send.seqnr == 0) {
++		if ((ssh->kex->flags & KEX_INITIAL) != 0) {
++			ssh_packet_disconnect(ssh, "outgoing sequence number "
++			    "wrapped during initial key exchange");
++		}
+		logit("outgoing seqnr wraps around");
++	}
+	if (++state->p_send.packets == 0)
+		if (!(ssh->compat & SSH_BUG_NOREKEY))
+			return SSH_ERR_NEED_REKEY;
+@@ -1214,6 +1219,11 @@ ssh_packet_send2_wrapped(struct ssh *ssh)
+	state->p_send.bytes += len;
+	sshbuf_reset(state->outgoing_packet);
+
++	if (type == SSH2_MSG_NEWKEYS && ssh->kex->kex_strict) {
++		debug_f("resetting send seqnr %u", state->p_send.seqnr);
++		state->p_send.seqnr = 0;
++	}
++
+	if (type == SSH2_MSG_NEWKEYS)
+		r = ssh_set_newkeys(ssh, MODE_OUT);
+	else if (type == SSH2_MSG_USERAUTH_SUCCESS && state->server_side)
+@@ -1342,8 +1352,7 @@ ssh_packet_read_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+	/* Stay in the loop until we have received a complete packet. */
+	for (;;) {
+		/* Try to read a packet from the buffer. */
+-		r = ssh_packet_read_poll_seqnr(ssh, typep, seqnr_p);
+-		if (r != 0)
++		if ((r = ssh_packet_read_poll_seqnr(ssh, typep, seqnr_p)) != 0)
+			break;
+		/* If we got a packet, return it. */
+		if (*typep != SSH_MSG_NONE)
+@@ -1414,29 +1423,6 @@ ssh_packet_read(struct ssh *ssh)
+	return type;
+ }
+
+-/*
+- * Waits until a packet has been received, verifies that its type matches
+- * that given, and gives a fatal error and exits if there is a mismatch.
+- */
+-
+-int
+-ssh_packet_read_expect(struct ssh *ssh, u_int expected_type)
+-{
+-	int r;
+-	u_char type;
+-
+-	if ((r = ssh_packet_read_seqnr(ssh, &type, NULL)) != 0)
+-		return r;
+-	if (type != expected_type) {
+-		if ((r = sshpkt_disconnect(ssh,
+-		    "Protocol error: expected packet type %d, got %d",
+-		    expected_type, type)) != 0)
+-			return r;
+-		return SSH_ERR_PROTOCOL_ERROR;
+-	}
+-	return 0;
+-}
+-
+ static int
+ ssh_packet_read_poll2_mux(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ {
+@@ -1627,10 +1613,16 @@ ssh_packet_read_poll2(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+		if ((r = sshbuf_consume(state->input, mac->mac_len)) != 0)
+			goto out;
+	}
++
+	if (seqnr_p != NULL)
+		*seqnr_p = state->p_read.seqnr;
+-	if (++state->p_read.seqnr == 0)
++	if (++state->p_read.seqnr == 0) {
++		if ((ssh->kex->flags & KEX_INITIAL) != 0) {
++			ssh_packet_disconnect(ssh, "incoming sequence number "
++			    "wrapped during initial key exchange");
++		}
+		logit("incoming seqnr wraps around");
++	}
+	if (++state->p_read.packets == 0)
+		if (!(ssh->compat & SSH_BUG_NOREKEY))
+			return SSH_ERR_NEED_REKEY;
+@@ -1696,6 +1688,10 @@ ssh_packet_read_poll2(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ #endif
+	/* reset for next packet */
+	state->packlen = 0;
++	if (*typep == SSH2_MSG_NEWKEYS && ssh->kex->kex_strict) {
++		debug_f("resetting read seqnr %u", state->p_read.seqnr);
++		state->p_read.seqnr = 0;
++	}
+
+	if ((r = ssh_packet_check_rekey(ssh)) != 0)
+		return r;
+@@ -1716,10 +1712,39 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+		r = ssh_packet_read_poll2(ssh, typep, seqnr_p);
+		if (r != 0)
+			return r;
+-		if (*typep) {
+-			state->keep_alive_timeouts = 0;
+-			DBG(debug("received packet type %d", *typep));
++		if (*typep == 0) {
++			/* no message ready */
++			return 0;
+		}
++		state->keep_alive_timeouts = 0;
++		DBG(debug("received packet type %d", *typep));
++
++		/* Always process disconnect messages */
++		if (*typep == SSH2_MSG_DISCONNECT) {
++			if ((r = sshpkt_get_u32(ssh, &reason)) != 0 ||
++			    (r = sshpkt_get_string(ssh, &msg, NULL)) != 0)
++				return r;
++			/* Ignore normal client exit notifications */
++			do_log2(ssh->state->server_side &&
++			    reason == SSH2_DISCONNECT_BY_APPLICATION ?
++			    SYSLOG_LEVEL_INFO : SYSLOG_LEVEL_ERROR,
++			    "Received disconnect from %s port %d:"
++			    "%u: %.400s", ssh_remote_ipaddr(ssh),
++			    ssh_remote_port(ssh), reason, msg);
++			free(msg);
++			return SSH_ERR_DISCONNECTED;
++		}
++
++		/*
++		 * Do not implicitly handle any messages here during initial
++		 * KEX when in strict mode. They will be need to be allowed
++		 * explicitly by the KEX dispatch table or they will generate
++		 * protocol errors.
++		 */
++		if (ssh->kex != NULL &&
++		    (ssh->kex->flags & KEX_INITIAL) && ssh->kex->kex_strict)
++			return 0;
++		/* Implicitly handle transport-level messages */
+		switch (*typep) {
+		case SSH2_MSG_IGNORE:
+			debug3("Received SSH2_MSG_IGNORE");
+@@ -1734,19 +1759,6 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+			debug("Remote: %.900s", msg);
+			free(msg);
+			break;
+-		case SSH2_MSG_DISCONNECT:
+-			if ((r = sshpkt_get_u32(ssh, &reason)) != 0 ||
+-			    (r = sshpkt_get_string(ssh, &msg, NULL)) != 0)
+-				return r;
+-			/* Ignore normal client exit notifications */
+-			do_log2(ssh->state->server_side &&
+-			    reason == SSH2_DISCONNECT_BY_APPLICATION ?
+-			    SYSLOG_LEVEL_INFO : SYSLOG_LEVEL_ERROR,
+-			    "Received disconnect from %s port %d:"
+-			    "%u: %.400s", ssh_remote_ipaddr(ssh),
+-			    ssh_remote_port(ssh), reason, msg);
+-			free(msg);
+-			return SSH_ERR_DISCONNECTED;
+		case SSH2_MSG_UNIMPLEMENTED:
+			if ((r = sshpkt_get_u32(ssh, &seqnr)) != 0)
+				return r;
+@@ -2211,6 +2223,7 @@ kex_to_blob(struct sshbuf *m, struct kex *kex)
+	    (r = sshbuf_put_u32(m, kex->hostkey_type)) != 0 ||
+	    (r = sshbuf_put_u32(m, kex->hostkey_nid)) != 0 ||
+	    (r = sshbuf_put_u32(m, kex->kex_type)) != 0 ||
++	    (r = sshbuf_put_u32(m, kex->kex_strict)) != 0 ||
+	    (r = sshbuf_put_stringb(m, kex->my)) != 0 ||
+	    (r = sshbuf_put_stringb(m, kex->peer)) != 0 ||
+	    (r = sshbuf_put_stringb(m, kex->client_version)) != 0 ||
+@@ -2373,6 +2386,7 @@ kex_from_blob(struct sshbuf *m, struct kex **kexp)
+	    (r = sshbuf_get_u32(m, (u_int *)&kex->hostkey_type)) != 0 ||
+	    (r = sshbuf_get_u32(m, (u_int *)&kex->hostkey_nid)) != 0 ||
+	    (r = sshbuf_get_u32(m, &kex->kex_type)) != 0 ||
++	    (r = sshbuf_get_u32(m, &kex->kex_strict)) != 0 ||
+	    (r = sshbuf_get_stringb(m, kex->my)) != 0 ||
+	    (r = sshbuf_get_stringb(m, kex->peer)) != 0 ||
+	    (r = sshbuf_get_stringb(m, kex->client_version)) != 0 ||
+@@ -2701,6 +2715,7 @@ sshpkt_disconnect(struct ssh *ssh, const char *fmt,...)
+	vsnprintf(buf, sizeof(buf), fmt, args);
+	va_end(args);
+
++	debug2_f("sending SSH2_MSG_DISCONNECT: %s", buf);
+	if ((r = sshpkt_start(ssh, SSH2_MSG_DISCONNECT)) != 0 ||
+	    (r = sshpkt_put_u32(ssh, SSH2_DISCONNECT_PROTOCOL_ERROR)) != 0 ||
+	    (r = sshpkt_put_cstring(ssh, buf)) != 0 ||
+diff --git a/packet.h b/packet.h
+index 176488b..3e03f53 100644
+--- a/packet.h
++++ b/packet.h
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: packet.h,v 1.94 2022/01/22 00:49:34 djm Exp $ */
++/* $OpenBSD: packet.h,v 1.96 2023/12/18 14:45:17 djm Exp $ */
+
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+@@ -124,7 +124,6 @@ int	 ssh_packet_send2_wrapped(struct ssh *);
+ int	 ssh_packet_send2(struct ssh *);
+
+ int      ssh_packet_read(struct ssh *);
+-int	 ssh_packet_read_expect(struct ssh *, u_int type);
+ int      ssh_packet_read_poll(struct ssh *);
+ int ssh_packet_read_poll2(struct ssh *, u_char *, u_int32_t *seqnr_p);
+ int	 ssh_packet_process_incoming(struct ssh *, const char *buf, u_int len);
+diff --git a/sshconnect2.c b/sshconnect2.c
+index b25225e..1deaa5e 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: sshconnect2.c,v 1.356 2022/02/01 23:32:51 djm Exp $ */
++/* $OpenBSD: sshconnect2.c,v 1.370 2023/12/18 14:45:17 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2008 Damien Miller.  All rights reserved.
+@@ -363,7 +363,6 @@ struct cauthmethod {
+ };
+
+ static int input_userauth_service_accept(int, u_int32_t, struct ssh *);
+-static int input_userauth_ext_info(int, u_int32_t, struct ssh *);
+ static int input_userauth_success(int, u_int32_t, struct ssh *);
+ static int input_userauth_failure(int, u_int32_t, struct ssh *);
+ static int input_userauth_banner(int, u_int32_t, struct ssh *);
+@@ -477,7 +476,7 @@ ssh_userauth2(struct ssh *ssh, const char *local_user,
+
+	ssh->authctxt = &authctxt;
+	ssh_dispatch_init(ssh, &input_userauth_error);
+-	ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, &input_userauth_ext_info);
++	ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, kex_input_ext_info);
+	ssh_dispatch_set(ssh, SSH2_MSG_SERVICE_ACCEPT, &input_userauth_service_accept);
+	ssh_dispatch_run_fatal(ssh, DISPATCH_BLOCK, &authctxt.success);	/* loop until success */
+	pubkey_cleanup(ssh);
+@@ -530,12 +529,6 @@ input_userauth_service_accept(int type, u_int32_t seq, struct ssh *ssh)
+ }
+
+ /* ARGSUSED */
+-static int
+-input_userauth_ext_info(int type, u_int32_t seqnr, struct ssh *ssh)
+-{
+-	return kex_input_ext_info(type, seqnr, ssh);
+-}
+-
+ void
+ userauth(struct ssh *ssh, char *authlist)
+ {
+@@ -617,6 +610,7 @@ input_userauth_success(int type, u_int32_t seq, struct ssh *ssh)
+	free(authctxt->methoddata);
+	authctxt->methoddata = NULL;
+	authctxt->success = 1;			/* break out */
++	ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, dispatch_protocol_error);
+	return 0;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 3f3cd2a908..91f04bf08b 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-38408-0002.patch \
            file://CVE-2023-38408-0003.patch \
            file://CVE-2023-38408-0004.patch \
+           file://CVE-2023-48795.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.40.0


