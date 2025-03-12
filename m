Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B026AC28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 18:38:56 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.2746.1741804727690973624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 11:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=L//ipove;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202503121838452997692fa556e117d3-fc4jjh@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202503121838452997692fa556e117d3
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Mar 2025 19:38:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+TNq+oKMCFZWI2zyVjPA2CKo3UI1HNqh5EZZfei6+2A=;
 b=L//ipove33Ri4B3pWLPmFeP1UCU6QLItfcSHBPLapM28uWbJkYny4XqzL9ptJUc4DJgq66
 QuTju3aanYW+bFenZHKOz6FPsiwD3DhNCL6OM467ikRi5tSjREtobeLxy3wcnr+E6xFFV0+U
 lEOY3k7paNGMSLRjGT7Q6KB2E9b76RP+0xGRXkqjzmwqu1Aut2jl2mEN6buijUPsoPfJ5U3t
 PI3TKX85v+BoT06wtcwjIEFvlPRTTWfZK/xUlcasJiiExZhMpGS2Iy0efEa2m6Ya8pWMi0a+
 Lke26G7VsoWHJnyVVfAjD14S/DrHiPFsqwK/lBSkF2ttFjX5vJGl8sgw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 2/2] openssh: patch CVE-2025-26465
Date: Wed, 12 Mar 2025 19:37:53 +0100
Message-Id: <20250312183753.1638055-2-peter.marko@siemens.com>
In-Reply-To: <20250312183753.1638055-1-peter.marko@siemens.com>
References: <20250312183753.1638055-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 18:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212665

From: Peter Marko <peter.marko@siemens.com>

Pick commit:
https://github.com/openssh/openssh-portable/commit/0832aac79517611dd4de93ad0a83577994d9c907

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssh/openssh/CVE-2025-26465.patch      | 166 ++++++++++++++++++
 .../openssh/openssh_9.8p1.bb                  |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
new file mode 100644
index 0000000000..a0bb5d7cd4
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
@@ -0,0 +1,166 @@
+From 0832aac79517611dd4de93ad0a83577994d9c907 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 18 Feb 2025 08:02:48 +0000
+Subject: [PATCH 2/2] upstream: Fix cases where error codes were not correctly
+ set
+
+Reported by the Qualys Security Advisory team. ok markus@
+
+OpenBSD-Commit-ID: 7bcd4ffe0fa1e27ff98d451fb9c22f5fae6e610d
+
+CVE: CVE-2025-26465
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/0832aac79517611dd4de93ad0a83577994d9c907]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ krl.c           | 4 +++-
+ ssh-agent.c     | 5 +++++
+ ssh-sk-client.c | 4 +++-
+ sshconnect2.c   | 5 ++++-
+ sshsig.c        | 1 +
+ 5 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/krl.c b/krl.c
+index e2efdf066..0d0f69534 100644
+--- a/krl.c
++++ b/krl.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: krl.c,v 1.59 2023/07/17 05:22:30 djm Exp $ */
++/* $OpenBSD: krl.c,v 1.60 2025/02/18 08:02:48 djm Exp $ */
+ /*
+  * Copyright (c) 2012 Damien Miller <djm@mindrot.org>
+  *
+@@ -674,6 +674,7 @@ revoked_certs_generate(struct revoked_certs *rc, struct sshbuf *buf)
+ 			break;
+ 		case KRL_SECTION_CERT_SERIAL_BITMAP:
+ 			if (rs->lo - bitmap_start > INT_MAX) {
++				r = SSH_ERR_INVALID_FORMAT;
+ 				error_f("insane bitmap gap");
+ 				goto out;
+ 			}
+@@ -1059,6 +1060,7 @@ ssh_krl_from_blob(struct sshbuf *buf, struct ssh_krl **krlp)
+ 	}
+ 
+ 	if ((krl = ssh_krl_init()) == NULL) {
++		r = SSH_ERR_ALLOC_FAIL;
+ 		error_f("alloc failed");
+ 		goto out;
+ 	}
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 48973b2c1..c27c5a956 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1208,6 +1208,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+ 	    "restrict-destination-v00@openssh.com") == 0) {
+ 		if (*dcsp != NULL) {
+ 			error_f("%s already set", ext_name);
++			r = SSH_ERR_INVALID_FORMAT;
+ 			goto out;
+ 		}
+ 		if ((r = sshbuf_froms(m, &b)) != 0) {
+@@ -1217,6 +1218,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+ 		while (sshbuf_len(b) != 0) {
+ 			if (*ndcsp >= AGENT_MAX_DEST_CONSTRAINTS) {
+ 				error_f("too many %s constraints", ext_name);
++				r = SSH_ERR_INVALID_FORMAT;
+ 				goto out;
+ 			}
+ 			*dcsp = xrecallocarray(*dcsp, *ndcsp, *ndcsp + 1,
+@@ -1234,6 +1236,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+ 		}
+ 		if (*certs != NULL) {
+ 			error_f("%s already set", ext_name);
++			r = SSH_ERR_INVALID_FORMAT;
+ 			goto out;
+ 		}
+ 		if ((r = sshbuf_get_u8(m, &v)) != 0 ||
+@@ -1245,6 +1248,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+ 		while (sshbuf_len(b) != 0) {
+ 			if (*ncerts >= AGENT_MAX_EXT_CERTS) {
+ 				error_f("too many %s constraints", ext_name);
++				r = SSH_ERR_INVALID_FORMAT;
+ 				goto out;
+ 			}
+ 			*certs = xrecallocarray(*certs, *ncerts, *ncerts + 1,
+@@ -1741,6 +1745,7 @@ process_ext_session_bind(SocketEntry *e)
+ 	/* record new key/sid */
+ 	if (e->nsession_ids >= AGENT_MAX_SESSION_IDS) {
+ 		error_f("too many session IDs recorded");
++		r = -1;
+ 		goto out;
+ 	}
+ 	e->session_ids = xrecallocarray(e->session_ids, e->nsession_ids,
+diff --git a/ssh-sk-client.c b/ssh-sk-client.c
+index 321fe53a2..06fad2213 100644
+--- a/ssh-sk-client.c
++++ b/ssh-sk-client.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-sk-client.c,v 1.12 2022/01/14 03:34:00 djm Exp $ */
++/* $OpenBSD: ssh-sk-client.c,v 1.13 2025/02/18 08:02:48 djm Exp $ */
+ /*
+  * Copyright (c) 2019 Google LLC
+  *
+@@ -439,6 +439,7 @@ sshsk_load_resident(const char *provider_path, const char *device,
+ 		}
+ 		if ((srk = calloc(1, sizeof(*srk))) == NULL) {
+ 			error_f("calloc failed");
++			r = SSH_ERR_ALLOC_FAIL;
+ 			goto out;
+ 		}
+ 		srk->key = key;
+@@ -450,6 +451,7 @@ sshsk_load_resident(const char *provider_path, const char *device,
+ 		if ((tmp = recallocarray(srks, nsrks, nsrks + 1,
+ 		    sizeof(*srks))) == NULL) {
+ 			error_f("recallocarray keys failed");
++			r = SSH_ERR_ALLOC_FAIL;
+ 			goto out;
+ 		}
+ 		debug_f("srks[%zu]: %s %s uidlen %zu", nsrks,
+diff --git a/sshconnect2.c b/sshconnect2.c
+index a69c4da18..1ee6000ab 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -99,7 +99,7 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ 	    options.required_rsa_size)) != 0)
+ 		fatal_r(r, "Bad server host key");
+ 	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
+-	    xxx_conn_info) == -1)
++	    xxx_conn_info) != 0)
+ 		fatal("Host key verification failed.");
+ 	return 0;
+ }
+@@ -698,6 +698,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+ 
+ 	if ((pktype = sshkey_type_from_name(pkalg)) == KEY_UNSPEC) {
+ 		debug_f("server sent unknown pkalg %s", pkalg);
++		r = SSH_ERR_INVALID_FORMAT;
+ 		goto done;
+ 	}
+ 	if ((r = sshkey_from_blob(pkblob, blen, &key)) != 0) {
+@@ -708,6 +709,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+ 		error("input_userauth_pk_ok: type mismatch "
+ 		    "for decoded key (received %d, expected %d)",
+ 		    key->type, pktype);
++		r = SSH_ERR_INVALID_FORMAT;
+ 		goto done;
+ 	}
+ 
+@@ -727,6 +729,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+ 		    SSH_FP_DEFAULT);
+ 		error_f("server replied with unknown key: %s %s",
+ 		    sshkey_type(key), fp == NULL ? "<ERROR>" : fp);
++		r = SSH_ERR_INVALID_FORMAT;
+ 		goto done;
+ 	}
+ 	ident = format_identity(id);
+diff --git a/sshsig.c b/sshsig.c
+index 6e03c0b06..3da005d62 100644
+--- a/sshsig.c
++++ b/sshsig.c
+@@ -874,6 +874,7 @@ cert_filter_principals(const char *path, u_long linenum,
+ 	}
+ 	if ((principals = sshbuf_dup_string(nprincipals)) == NULL) {
+ 		error_f("buffer error");
++		r = SSH_ERR_ALLOC_FAIL;
+ 		goto out;
+ 	}
+ 	/* success */
diff --git a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
index 3d6cb9f245..066ff70258 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            file://CVE-2025-26466.patch \
+           file://CVE-2025-26465.patch \
            "
 SRC_URI[sha256sum] = "dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3"
 

