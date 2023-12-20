Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658DEC41535
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 03:30:44 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.14242.1703043034932013940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 19:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Y0RX+7rI;
 spf=pass (domain: mvista.com, ip: 209.85.215.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5c690c3d113so4004414a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703043033; x=1703647833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y99sDSWY+Ik3fpOLS8LbIoFwPkc2HKKEF6fPQNZzsEA=;
        b=Y0RX+7rIyCU5HkVpidODN3JOkwiIdY6eysVOSb8v+ptfLRdCMV7eM8B+Kt2mU2nybk
         2VTK/CZbcO3NBoKctmbpJYb+oK/xohYT7sRfRHlQXIN8qDZ2qsmomLotJOa42YfxATlB
         XZM9EOLvEW2pfQGzh8BDStoDEDi/QRqKSQyCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703043033; x=1703647833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y99sDSWY+Ik3fpOLS8LbIoFwPkc2HKKEF6fPQNZzsEA=;
        b=oXpKI2yQou9XvkjZwCCmN3vx2gIOLAaQml0SEyA9C/SDiLE6xWdlodsaNL16GdUpMq
         S10LryMSOM8PnongicplfUTEPSTi95wJ/0OXUrgBKyD+4EWqMF4mVZjdHzhr/clkAifc
         RQ87Jejc4lXGJ0rpl1evTkjFqflu/Bjpd4+ynKgfCGJdBAiINLDZ8LzT2YH+CKKM+9NZ
         a+jEGUY1dqCQwRWZCAZaQtOSLRj9YP2iROreQq30WRcAYeBTU8uqQDzCo1EtLpYmBtPy
         DyM/+F/mW51AhBsudMuiEccoZ0D96/8XEUdzpwis8//hPklTRv4htIxISZ30L10Q2uu1
         PL0w==
X-Gm-Message-State: AOJu0YymKmy0QIzIPZ9+4mCDLo9E748P3WrVYP3nYFgKQq8HXk6+lXjD
	32/St+eq3sGAyQNKtSP74bcHiASjbH8b5yhNPYY=
X-Google-Smtp-Source: AGHT+IGKlzYwHAvP9cm9PKQNh/Ih4xq0gWSzj+mVZYFpBu7PIa6OBjoCJoZE8fSqjhsuUYgQowoyZw==
X-Received: by 2002:a05:6a20:b714:b0:194:d290:a4f0 with SMTP id fg20-20020a056a20b71400b00194d290a4f0mr329834pzb.111.1703043033039;
        Tue, 19 Dec 2023 19:30:33 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.5.216])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006d9137418a9sm2935276pfl.172.2023.12.19.19.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 19:30:32 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] openssh: backport Debian patch for CVE-2023-48795
Date: Wed, 20 Dec 2023 08:58:23 +0530
Message-Id: <20231220032823.39779-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 03:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192769

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 fix-authorized-principals-command
 CVE-2023-48795

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/openssh/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://github.com/openssh/openssh-portable/commit/fcd78e31cdd45a7e69ccfe6d8a3b1037dc1de290
&
https://github.com/openssh/openssh-portable/commit/1edb00c58f8a6875fad6a497aa2bacf37f9e6cd5]

Reference: https://ubuntu.com/security/CVE-2023-48795

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openssh/openssh/CVE-2023-48795.patch      | 476 ++++++++++++++++++
 .../fix-authorized-principals-command.patch   |  30 ++
 .../openssh/openssh_8.9p1.bb                  |   2 +
 3 files changed, 508 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/fix-authorized-principals-command.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
new file mode 100644
index 0000000000..6b2f927779
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-48795.patch
@@ -0,0 +1,476 @@
+(modified to not remove ssh_packet_read_expect() and to add to
+KexAlgorithms in sshd.c and sshconnect2.c as this version pre-dates
+kex_proposal_populate_entries())
+
+Backport of:
+
+From 1edb00c58f8a6875fad6a497aa2bacf37f9e6cd5 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 18 Dec 2023 14:45:17 +0000
+Subject: [PATCH] upstream: implement "strict key exchange" in ssh and sshd
+
+This adds a protocol extension to improve the integrity of the SSH
+transport protocol, particular in and around the initial key exchange
+(KEX) phase.
+
+Full details of the extension are in the PROTOCOL file.
+
+with markus@
+
+OpenBSD-Commit-ID: 2a66ac962f0a630d7945fee54004ed9e9c439f14
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/openssh/tree/debian/patches/CVE-2023-48795.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/openssh/openssh-portable/commit/1edb00c58f8a6875fad6a497aa2bacf37f9e6cd5]
+CVE: CVE-2023-48795
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ PROTOCOL      | 26 +++++++++++++++++
+ kex.c         | 72 +++++++++++++++++++++++++++++++----------------
+ kex.h         |  1 +
+ packet.c      | 78 ++++++++++++++++++++++++++++++++++++++-------------
+ sshconnect2.c | 14 +++------
+ sshd.c        |  7 +++--
+ 6 files changed, 142 insertions(+), 56 deletions(-)
+
+diff --git a/PROTOCOL b/PROTOCOL
+index e6a7d60..971f01e 100644
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
+diff --git a/kex.c b/kex.c
+index 0bcd27d..e7b2d4d 100644
+--- a/kex.c
++++ b/kex.c
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
+ 	return 1;
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
+ 	size_t len;
+ 
+ 	if (a == NULL || *a == '\0')
+@@ -199,10 +211,8 @@ kex_names_cat(const char *a, const char *b)
+ 	}
+ 	strlcpy(ret, a, len);
+ 	for ((p = strsep(&cp, ",")); p && *p != '\0'; (p = strsep(&cp, ","))) {
+-		if ((m = match_list(ret, p, NULL)) != NULL) {
+-			free(m);
++		if (has_any_alg(ret, p))
+ 			continue; /* Algorithm already present */
+-		}
+ 		if (strlcat(ret, ",", len) >= len ||
+ 		    strlcat(ret, p, len) >= len) {
+ 			free(tmp);
+@@ -410,7 +420,12 @@ kex_protocol_error(int type, u_int32_t seq, struct ssh *ssh)
+ {
+ 	int r;
+ 
+-	error("kex protocol error: type %d seq %u", type, seq);
++	/* If in strict mode, any unexpected message is an error */
++	if ((ssh->kex->flags & KEX_INITIAL) && ssh->kex->kex_strict) {
++		ssh_packet_disconnect(ssh, "strict KEX violation: "
++		    "unexpected packet type %u (seqnr %u)", type, seq);
++	}
++	error_f("type %u seq %u", type, seq);
+ 	if ((r = sshpkt_start(ssh, SSH2_MSG_UNIMPLEMENTED)) != 0 ||
+ 	    (r = sshpkt_put_u32(ssh, seq)) != 0 ||
+ 	    (r = sshpkt_send(ssh)) != 0)
+@@ -485,6 +500,11 @@ kex_input_ext_info(int type, u_int32_t seq, struct ssh *ssh)
+ 	ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, &kex_protocol_error);
+ 	if ((r = sshpkt_get_u32(ssh, &ninfo)) != 0)
+ 		return r;
++	if (ninfo >= 1024) {
++		error("SSH2_MSG_EXT_INFO with too many entries, expected "
++		    "<=1024, received %u", ninfo);
++		return dispatch_protocol_error(type, seq, ssh);
++	}
+ 	for (i = 0; i < ninfo; i++) {
+ 		if ((r = sshpkt_get_cstring(ssh, &name, NULL)) != 0)
+ 			return r;
+@@ -600,7 +620,7 @@ kex_input_kexinit(int type, u_int32_t seq, struct ssh *ssh)
+ 		error_f("no kex");
+ 		return SSH_ERR_INTERNAL_ERROR;
+ 	}
+-	ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, NULL);
++	ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, &kex_protocol_error);
+ 	ptr = sshpkt_ptr(ssh, &dlen);
+ 	if ((r = sshbuf_put(kex->peer, ptr, dlen)) != 0)
+ 		return r;
+@@ -636,7 +656,7 @@ kex_input_kexinit(int type, u_int32_t seq, struct ssh *ssh)
+ 	if (!(kex->flags & KEX_INIT_SENT))
+ 		if ((r = kex_send_kexinit(ssh)) != 0)
+ 			return r;
+-	if ((r = kex_choose_conf(ssh)) != 0)
++	if ((r = kex_choose_conf(ssh, seq)) != 0)
+ 		return r;
+ 
+ 	if (kex->kex_type < KEX_MAX && kex->kex[kex->kex_type] != NULL)
+@@ -900,20 +920,14 @@ proposals_match(char *my[PROPOSAL_MAX], char *peer[PROPOSAL_MAX])
+ 	return (1);
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
+ 	struct kex *kex = ssh->kex;
+ 	struct newkeys *newkeys;
+@@ -938,13 +952,23 @@ kex_choose_conf(struct ssh *ssh)
+ 		sprop=peer;
+ 	}
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
+ 	}
+ 
+ 	/* Check whether client supports rsa-sha2 algorithms */
+diff --git a/kex.h b/kex.h
+index c353295..d97323e 100644
+--- a/kex.h
++++ b/kex.h
+@@ -148,6 +148,7 @@ struct kex {
+ 	u_int	kex_type;
+ 	char	*server_sig_algs;
+ 	int	ext_info_c;
++	int	kex_strict;
+ 	struct sshbuf *my;
+ 	struct sshbuf *peer;
+ 	struct sshbuf *client_version;
+diff --git a/packet.c b/packet.c
+index bde6c10..28f3729 100644
+--- a/packet.c
++++ b/packet.c
+@@ -1205,8 +1205,13 @@ ssh_packet_send2_wrapped(struct ssh *ssh)
+ 	sshbuf_dump(state->output, stderr);
+ #endif
+ 	/* increment sequence number for outgoing packets */
+-	if (++state->p_send.seqnr == 0)
++	if (++state->p_send.seqnr == 0) {
++		if ((ssh->kex->flags & KEX_INITIAL) != 0) {
++			ssh_packet_disconnect(ssh, "outgoing sequence number "
++			    "wrapped during initial key exchange");
++		}
+ 		logit("outgoing seqnr wraps around");
++	}
+ 	if (++state->p_send.packets == 0)
+ 		if (!(ssh->compat & SSH_BUG_NOREKEY))
+ 			return SSH_ERR_NEED_REKEY;
+@@ -1214,6 +1219,11 @@ ssh_packet_send2_wrapped(struct ssh *ssh)
+ 	state->p_send.bytes += len;
+ 	sshbuf_reset(state->outgoing_packet);
+ 
++	if (type == SSH2_MSG_NEWKEYS && ssh->kex->kex_strict) {
++		debug_f("resetting send seqnr %u", state->p_send.seqnr);
++		state->p_send.seqnr = 0;
++	}
++
+ 	if (type == SSH2_MSG_NEWKEYS)
+ 		r = ssh_set_newkeys(ssh, MODE_OUT);
+ 	else if (type == SSH2_MSG_USERAUTH_SUCCESS && state->server_side)
+@@ -1342,8 +1352,7 @@ ssh_packet_read_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ 	/* Stay in the loop until we have received a complete packet. */
+ 	for (;;) {
+ 		/* Try to read a packet from the buffer. */
+-		r = ssh_packet_read_poll_seqnr(ssh, typep, seqnr_p);
+-		if (r != 0)
++		if ((r = ssh_packet_read_poll_seqnr(ssh, typep, seqnr_p)) != 0)
+ 			break;
+ 		/* If we got a packet, return it. */
+ 		if (*typep != SSH_MSG_NONE)
+@@ -1627,10 +1636,16 @@ ssh_packet_read_poll2(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ 		if ((r = sshbuf_consume(state->input, mac->mac_len)) != 0)
+ 			goto out;
+ 	}
++
+ 	if (seqnr_p != NULL)
+ 		*seqnr_p = state->p_read.seqnr;
+-	if (++state->p_read.seqnr == 0)
++	if (++state->p_read.seqnr == 0) {
++		if ((ssh->kex->flags & KEX_INITIAL) != 0) {
++			ssh_packet_disconnect(ssh, "incoming sequence number "
++			    "wrapped during initial key exchange");
++		}
+ 		logit("incoming seqnr wraps around");
++	}
+ 	if (++state->p_read.packets == 0)
+ 		if (!(ssh->compat & SSH_BUG_NOREKEY))
+ 			return SSH_ERR_NEED_REKEY;
+@@ -1696,6 +1711,10 @@ ssh_packet_read_poll2(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ #endif
+ 	/* reset for next packet */
+ 	state->packlen = 0;
++	if (*typep == SSH2_MSG_NEWKEYS && ssh->kex->kex_strict) {
++		debug_f("resetting read seqnr %u", state->p_read.seqnr);
++		state->p_read.seqnr = 0;
++	}
+ 
+ 	if ((r = ssh_packet_check_rekey(ssh)) != 0)
+ 		return r;
+@@ -1716,10 +1735,39 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ 		r = ssh_packet_read_poll2(ssh, typep, seqnr_p);
+ 		if (r != 0)
+ 			return r;
+-		if (*typep) {
+-			state->keep_alive_timeouts = 0;
+-			DBG(debug("received packet type %d", *typep));
++		if (*typep == 0) {
++			/* no message ready */
++			return 0;
++		}
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
+ 		}
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
+ 		switch (*typep) {
+ 		case SSH2_MSG_IGNORE:
+ 			debug3("Received SSH2_MSG_IGNORE");
+@@ -1734,19 +1782,6 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ 			debug("Remote: %.900s", msg);
+ 			free(msg);
+ 			break;
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
+ 		case SSH2_MSG_UNIMPLEMENTED:
+ 			if ((r = sshpkt_get_u32(ssh, &seqnr)) != 0)
+ 				return r;
+@@ -2211,6 +2246,7 @@ kex_to_blob(struct sshbuf *m, struct kex *kex)
+ 	    (r = sshbuf_put_u32(m, kex->hostkey_type)) != 0 ||
+ 	    (r = sshbuf_put_u32(m, kex->hostkey_nid)) != 0 ||
+ 	    (r = sshbuf_put_u32(m, kex->kex_type)) != 0 ||
++	    (r = sshbuf_put_u32(m, kex->kex_strict)) != 0 ||
+ 	    (r = sshbuf_put_stringb(m, kex->my)) != 0 ||
+ 	    (r = sshbuf_put_stringb(m, kex->peer)) != 0 ||
+ 	    (r = sshbuf_put_stringb(m, kex->client_version)) != 0 ||
+@@ -2373,6 +2409,7 @@ kex_from_blob(struct sshbuf *m, struct kex **kexp)
+ 	    (r = sshbuf_get_u32(m, (u_int *)&kex->hostkey_type)) != 0 ||
+ 	    (r = sshbuf_get_u32(m, (u_int *)&kex->hostkey_nid)) != 0 ||
+ 	    (r = sshbuf_get_u32(m, &kex->kex_type)) != 0 ||
++	    (r = sshbuf_get_u32(m, &kex->kex_strict)) != 0 ||
+ 	    (r = sshbuf_get_stringb(m, kex->my)) != 0 ||
+ 	    (r = sshbuf_get_stringb(m, kex->peer)) != 0 ||
+ 	    (r = sshbuf_get_stringb(m, kex->client_version)) != 0 ||
+@@ -2701,6 +2738,7 @@ sshpkt_disconnect(struct ssh *ssh, const char *fmt,...)
+ 	vsnprintf(buf, sizeof(buf), fmt, args);
+ 	va_end(args);
+ 
++	debug2_f("sending SSH2_MSG_DISCONNECT: %s", buf);
+ 	if ((r = sshpkt_start(ssh, SSH2_MSG_DISCONNECT)) != 0 ||
+ 	    (r = sshpkt_put_u32(ssh, SSH2_DISCONNECT_PROTOCOL_ERROR)) != 0 ||
+ 	    (r = sshpkt_put_cstring(ssh, buf)) != 0 ||
+diff --git a/sshconnect2.c b/sshconnect2.c
+index b25225e..83ae4a4 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -241,7 +241,8 @@ ssh_kex2(struct ssh *ssh, char *host, struct sockaddr *hostaddr, u_short port,
+ 		fatal_fr(r, "kex_assemble_namelist");
+ 	free(all_key);
+ 
+-	if ((s = kex_names_cat(options.kex_algorithms, "ext-info-c")) == NULL)
++	if ((s = kex_names_cat(options.kex_algorithms,
++	    "ext-info-c,kex-strict-c-v00@openssh.com")) == NULL)
+ 		fatal_f("kex_names_cat");
+ 	myproposal[PROPOSAL_KEX_ALGS] = compat_kex_proposal(ssh, s);
+ 	myproposal[PROPOSAL_ENC_ALGS_CTOS] =
+@@ -363,7 +364,6 @@ struct cauthmethod {
+ };
+ 
+ static int input_userauth_service_accept(int, u_int32_t, struct ssh *);
+-static int input_userauth_ext_info(int, u_int32_t, struct ssh *);
+ static int input_userauth_success(int, u_int32_t, struct ssh *);
+ static int input_userauth_failure(int, u_int32_t, struct ssh *);
+ static int input_userauth_banner(int, u_int32_t, struct ssh *);
+@@ -477,7 +477,7 @@ ssh_userauth2(struct ssh *ssh, const char *local_user,
+ 
+ 	ssh->authctxt = &authctxt;
+ 	ssh_dispatch_init(ssh, &input_userauth_error);
+-	ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, &input_userauth_ext_info);
++	ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, kex_input_ext_info);
+ 	ssh_dispatch_set(ssh, SSH2_MSG_SERVICE_ACCEPT, &input_userauth_service_accept);
+ 	ssh_dispatch_run_fatal(ssh, DISPATCH_BLOCK, &authctxt.success);	/* loop until success */
+ 	pubkey_cleanup(ssh);
+@@ -529,13 +529,6 @@ input_userauth_service_accept(int type, u_int32_t seq, struct ssh *ssh)
+ 	return r;
+ }
+ 
+-/* ARGSUSED */
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
+ 	free(authctxt->methoddata);
+ 	authctxt->methoddata = NULL;
+ 	authctxt->success = 1;			/* break out */
++	ssh_dispatch_set(ssh, SSH2_MSG_EXT_INFO, dispatch_protocol_error);
+ 	return 0;
+ }
+ 
+diff --git a/sshd.c b/sshd.c
+index ef18ba4..652bdc3 100644
+--- a/sshd.c
++++ b/sshd.c
+@@ -2354,11 +2354,13 @@ static void
+ do_ssh2_kex(struct ssh *ssh)
+ {
+ 	char *myproposal[PROPOSAL_MAX] = { KEX_SERVER };
++	char *s;
+ 	struct kex *kex;
+ 	int r;
+ 
+-	myproposal[PROPOSAL_KEX_ALGS] = compat_kex_proposal(ssh,
+-	    options.kex_algorithms);
++	if ((s = kex_names_cat(options.kex_algorithms, "kex-strict-s-v00@openssh.com")) == NULL)
++		fatal_f("kex_names_cat");
++	myproposal[PROPOSAL_KEX_ALGS] = compat_kex_proposal(ssh, s);
+ 	myproposal[PROPOSAL_ENC_ALGS_CTOS] = compat_cipher_proposal(ssh,
+ 	    options.ciphers);
+ 	myproposal[PROPOSAL_ENC_ALGS_STOC] = compat_cipher_proposal(ssh,
+@@ -2411,6 +2413,7 @@ do_ssh2_kex(struct ssh *ssh)
+ 	    (r = ssh_packet_write_wait(ssh)) != 0)
+ 		fatal_fr(r, "send test");
+ #endif
++	free(s);
+ 	debug("KEX done");
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh/fix-authorized-principals-command.patch b/meta/recipes-connectivity/openssh/openssh/fix-authorized-principals-command.patch
new file mode 100644
index 0000000000..3790774f15
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/fix-authorized-principals-command.patch
@@ -0,0 +1,30 @@
+From fcd78e31cdd45a7e69ccfe6d8a3b1037dc1de290 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 24 May 2023 23:01:06 +0000
+Subject: [PATCH] upstream: fix AuthorizedPrincipalsCommand when
+ AuthorizedKeysCommand
+Description: Fix the wrong code as the Subject suggests
+ I added that description to mention, that the file header change was
+ incompatible with the proposed code below and failed to apply,
+ therefore I dropped that chunk of the code.
+Origin: backport, https://github.com/openssh/openssh-portable/commit/fcd78e31cdd45a7e69ccfe6d8a3b1037dc1de290
+Bug: https://bugzilla.mindrot.org/show_bug.cgi?id=3574
+Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/2031942
+Last-Update: 2023-09-01
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/openssh/tree/debian/patches/fix-authorized-principals-command.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/openssh/openssh-portable/commit/fcd78e31cdd45a7e69ccfe6d8a3b1037dc1de290]
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+--- a/servconf.c
++++ b/servconf.c
+@@ -2372,7 +2372,7 @@ process_server_config_line_depth(ServerO
+ 			fatal("%.200s line %d: %s must be an absolute path",
+ 			    filename, linenum, keyword);
+ 		}
+-		if (*activep && options->authorized_keys_command == NULL)
++		if (*activep && *charptr == NULL)
+ 			*charptr = xstrdup(str + len);
+ 		argv_consume(&ac);
+ 		break;
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 32761b8bb8..7ad9bced1b 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -32,6 +32,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-38408-0002.patch \
            file://CVE-2023-38408-0003.patch \
            file://CVE-2023-38408-0004.patch \
+           file://fix-authorized-principals-command.patch \
+           file://CVE-2023-48795.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.25.1


