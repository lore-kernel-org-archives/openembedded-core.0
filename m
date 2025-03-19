Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B2AC35FFC
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:10:41 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.8622.1742393439561575666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 07:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wOmBRmbY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2239c066347so149291755ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742393439; x=1742998239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQzsZjWANE5Tx79I4lc00hLdqbDmomA2+lI0I5GHyLg=;
        b=wOmBRmbY5tI0J7jc35DxvrNCIkI+B/VwEp+fj3f352HLolbbt7EPL1SoZPOBHYmjUZ
         SCJXh7LUjlXyvUg6Fx35dVT/scPHZl1VPzDTiP1cihlmxwimlNyC/O+1Ruv6QT66/FzL
         v4ouv1b3y4d1astkFl/5fjvPk88K0Wy+KfoHBpiyVVoypJQkz9skvg0Y2qjkDd8m5DCE
         3h8iZ9qZ4NP8SgzyMn3//aiw2k45f2pwRAGpmkohMTnUGLdcXcTdxaIqNyxwIXk7eZXH
         8uBkKdkwkZRqJtQbStRVGVoVIrilYzyTLLoQA+Ip5KKP130tDnAc9TmaFQQsEId5EY/o
         q2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742393439; x=1742998239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQzsZjWANE5Tx79I4lc00hLdqbDmomA2+lI0I5GHyLg=;
        b=hZFFVXc72uDZa/J2akxDwfVPsgUJkB/egAKW7w+aQqtxiiTlo8CMwPtjPYB1XaBF5V
         K/4qsp9qPIQeF7LPVgYnBz82LvrhVItdI4ZGlj1dfbzYpQ/oZFBrsTd7RIF689VTry4Z
         W2BAxAmuWWQ0YzWA5KgwnoaOQyV1QIjKMZIXdu0hH16qq2l0ZVRCp+2Ukn5AptlOLCcC
         Vr9JyKPJCu1P/jMeOCRlov4p+Cdxt2ZkXoczsycnWFS1soGXm6Me4fzG0R1vhONt17Zo
         1ABz+40mV4HOgFXa/xCWYuQsr2Veo3fx8+YUIybm/EFW5qviOMRap8HxCyqedUdfm1k0
         Lxfw==
X-Gm-Message-State: AOJu0YzL/eof7UirYXQeYa6rzsW2P0AYWOzd4UQdCJBGAKT/TbyWhzI1
	nHzcy3QSpUh/NfHz6Zef/ho0tQ/2l71tzwjx+hPFYTkJHpxQ+ZBo7Ddne3vt/bit79ReqM26fyu
	z
X-Gm-Gg: ASbGncv42XCJeB0SYlAA56OX3pcpY4T41f1MFreDTUrsgSqLcSrmu9S+H4GTDCKI6I2
	wn8CRBFij9CmKVbX14kYvmwCwNySBoUsNpJQertRjoX6tufwDBArxyzMcQOW6JQYp4GpFZsl0J1
	VqJySZFcelAHxNAU059oAd1qLLzL0dB7mBqq7c9Td8ltm6Q77M6YS/JBEutziRDAkYeX1Ez+RgC
	wb5t8bArUyEpD7jgcjy+bhfWZt2yjE0TdmtUlFfG0atu3Cqqp0YY3hYeWaIHWcGQ9PY79nNT0Ui
	EsnM7I96X/U5pzRFoGja0v31zf43lNyMlRRqxs5l1o7Bqhk=
X-Google-Smtp-Source: AGHT+IHSekAWiJR446FAxjgB6jJvdLt2F0SW6ublJAdHB8xZqdh6Q+xJd9Giur2I6cbbFMFw9r7LeA==
X-Received: by 2002:a05:6a00:1390:b0:736:a682:deb8 with SMTP id d2e1a72fcca58-7376d617eb8mr4988856b3a.8.1742393438502;
        Wed, 19 Mar 2025 07:10:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b10e1sm11557214b3a.165.2025.03.19.07.10.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:10:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 2/4] openssh: patch CVE-2025-26465
Date: Wed, 19 Mar 2025 07:10:16 -0700
Message-ID: <0d77609f814dec344535c5674f71a043a4e718e5.1742392880.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742392880.git.steve@sakoman.com>
References: <cover.1742392880.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213336

From: Peter Marko <peter.marko@siemens.com>

Pick commit:
https://github.com/openssh/openssh-portable/commit/0832aac79517611dd4de93ad0a83577994d9c907

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
 
-- 
2.43.0


