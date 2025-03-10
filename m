Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970C4C28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:36:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.37883.1741613793569312780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 06:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pjN+BFHH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223378e2b0dso59568985ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741613793; x=1742218593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Awc7dfy8s4Sb7BYiLaR37u6wO7XQlrmdmXKzoqyDnGM=;
        b=pjN+BFHHrXVaRmhK3l8SZ1JVtBwVTPKhkPUAwpL3nYEoT4g9EKi4vQb/cMSzkmEVKl
         2H1hUt/xtzdewOBKlvGKQLX5Fq2s4s02H6oRTQUKQ46k7TvNvRJByXdxlxSjuKhH5/jZ
         rK7/dMvMGvfBsdv3LDStawt99NhDZCIGGNn/PXutZxpQub/eMsGC9xunTMBQifL9kJ47
         KlkY4ss0UQ6eg6yBWsCA9x8NJQd68oCy3+WkMdGjL6pgg0EftEpJCCb27FXVs0w1jT/L
         G2in6EAL3qfw2e0zjU8MnIAuohG3M5aqxnykJYKDBep01JrtYlxDgxRZxk5gWgp9CEiZ
         R2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613793; x=1742218593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Awc7dfy8s4Sb7BYiLaR37u6wO7XQlrmdmXKzoqyDnGM=;
        b=U4/BE43iCSLNIDILLwNRbaWyl689+ri/4vboQJ+lYMQA90GT12MmDFM0wHJk7sCZb5
         yXnkqQNLg4tITD+U6lZlSbMEsbQ3tCR6RwfI9USkNcFMRV2ziifAy/WIJgeyFjT7zoVB
         Oprz67NPXfPkzRme8e+HLGrZTWr8kucbZGQSxcU3qKhEz0CeAWWcVkUdX+VFbwdqnNEi
         9FS8kTbOnt01emyBikFyOMip0N5c5T8Pr2nZWYfJnJ0g43SFQyGOTmsriToLNE+6vScJ
         mDT8+0qdbPz5M55zAfcdQ9qRqge0ZPRbxhMI3G7GDFrzRibDkl/QwqSOYXSt83DVR/54
         7VJw==
X-Gm-Message-State: AOJu0Yw3Bm4wsXx86+Gtn9oZpdqI1Mx61x38NNNXnlwYbPPs1yvZc3gf
	YgHJomn/ftX3buzQqrX9Ndo7N5IYtaRsQEJYvWmBfc7rfaskQ5l7gBtqd+8NWMR/7chudf/i7tH
	M
X-Gm-Gg: ASbGnctMLxo87zghvi8ys0coHpJtTB+OYhBPsIh1B3y5bls3SUs34g9go5wFhL6tcyf
	bXoBFGPThgSQC1cJ5uN51GJH3VUdJM87cbRX5SojjoT1BzfvUa9c2rEljFK6AWYNDCwBeNoFwXU
	IeOYZ8LXDJSpG08LCD4WL48/TIwHKoRHzLbHlZmX78TM6h3KhiUF/kNLNu+UGlvWiSkbDMIsrEc
	FYxkaGBkK1jkh2up/wYgbGnpxgL2kh6Hvs3D3rDkSiVj/v+NruDvfslErTATvvPmxJEm52wf5gf
	qjP8fN+j7ZBKyiw5fYeLsgcqSca9bSUa8ytG
X-Google-Smtp-Source: AGHT+IHDiBi1XV7UBz8KRVykPWHRI1tIL67BnlTVZaMwRchiUxAdC1B4TqStZmJNr8f/NBhW7ZArsQ==
X-Received: by 2002:a17:902:ce87:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22428ab58d8mr245273825ad.31.1741613792700;
        Mon, 10 Mar 2025 06:36:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2ea8:96c2:9f70:5c1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfbcsm77820095ad.21.2025.03.10.06.36.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:36:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/6] openssh: Fix CVE-2025-26465
Date: Mon, 10 Mar 2025 06:36:19 -0700
Message-ID: <934c212859e12235599835e8cfd8857e4be44ff8.1741613667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741613667.git.steve@sakoman.com>
References: <cover.1741613667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 13:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212521

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/openssh/openssh-portable/commit/0832aac79517611dd4de93ad0a83577994d9c907

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2025-26465.patch      | 140 ++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
new file mode 100644
index 0000000000..ffc798a158
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
@@ -0,0 +1,140 @@
+From 0832aac79517611dd4de93ad0a83577994d9c907 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 18 Feb 2025 08:02:48 +0000
+Subject: [PATCH] upstream: Fix cases where error codes were not correctly set
+
+Reported by the Qualys Security Advisory team. ok markus@
+
+OpenBSD-Commit-ID: 7bcd4ffe0fa1e27ff98d451fb9c22f5fae6e610d
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/0832aac79517611dd4de93ad0a83577994d9c907]
+CVE: CVE-2025-26465
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ krl.c           | 2 ++
+ ssh-agent.c     | 3 +++
+ ssh-sk-client.c | 2 ++
+ sshconnect2.c   | 5 ++++-
+ sshsig.c        | 1 +
+ 5 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/krl.c b/krl.c
+index 17b88ed..aef2001 100644
+--- a/krl.c
++++ b/krl.c
+@@ -674,6 +674,7 @@ revoked_certs_generate(struct revoked_certs *rc, struct sshbuf *buf)
+ 			break;
+ 		case KRL_SECTION_CERT_SERIAL_BITMAP:
+ 			if (rs->lo - bitmap_start > INT_MAX) {
++				r = SSH_ERR_INVALID_FORMAT;
+ 				error_f("insane bitmap gap");
+ 				goto out;
+ 			}
+@@ -1008,6 +1009,7 @@ ssh_krl_from_blob(struct sshbuf *buf, struct ssh_krl **krlp,
+ 		goto out;
+ 
+ 	if ((krl = ssh_krl_init()) == NULL) {
++		r = SSH_ERR_ALLOC_FAIL;
+ 		error_f("alloc failed");
+ 		goto out;
+ 	}
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 4dbb4f3..6382ef4 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1198,6 +1198,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+ 	    "restrict-destination-v00@openssh.com") == 0) {
+ 		if (*dcsp != NULL) {
+ 			error_f("%s already set", ext_name);
++			r = SSH_ERR_INVALID_FORMAT;
+ 			goto out;
+ 		}
+ 		if ((r = sshbuf_froms(m, &b)) != 0) {
+@@ -1207,6 +1208,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+ 		while (sshbuf_len(b) != 0) {
+ 			if (*ndcsp >= AGENT_MAX_DEST_CONSTRAINTS) {
+ 				error_f("too many %s constraints", ext_name);
++				r = SSH_ERR_INVALID_FORMAT;
+ 				goto out;
+ 			}
+ 			*dcsp = xrecallocarray(*dcsp, *ndcsp, *ndcsp + 1,
+@@ -1663,6 +1665,7 @@ process_ext_session_bind(SocketEntry *e)
+ 	/* record new key/sid */
+ 	if (e->nsession_ids >= AGENT_MAX_SESSION_IDS) {
+ 		error_f("too many session IDs recorded");
++		r = -1;
+ 		goto out;
+ 	}
+ 	e->session_ids = xrecallocarray(e->session_ids, e->nsession_ids,
+diff --git a/ssh-sk-client.c b/ssh-sk-client.c
+index 321fe53..750accb 100644
+--- a/ssh-sk-client.c
++++ b/ssh-sk-client.c
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
+index 83ae4a4..6cfae2a 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -97,7 +97,7 @@ static int
+ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ {
+ 	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
+-	    xxx_conn_info) == -1)
++	    xxx_conn_info) != 0)
+ 		fatal("Host key verification failed.");
+ 	return 0;
+ }
+@@ -713,6 +713,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+ 
+ 	if ((pktype = sshkey_type_from_name(pkalg)) == KEY_UNSPEC) {
+ 		debug_f("server sent unknown pkalg %s", pkalg);
++		r = SSH_ERR_INVALID_FORMAT;
+ 		goto done;
+ 	}
+ 	if ((r = sshkey_from_blob(pkblob, blen, &key)) != 0) {
+@@ -723,6 +724,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+ 		error("input_userauth_pk_ok: type mismatch "
+ 		    "for decoded key (received %d, expected %d)",
+ 		    key->type, pktype);
++		r = SSH_ERR_INVALID_FORMAT;
+ 		goto done;
+ 	}
+ 
+@@ -742,6 +744,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+ 		    SSH_FP_DEFAULT);
+ 		error_f("server replied with unknown key: %s %s",
+ 		    sshkey_type(key), fp == NULL ? "<ERROR>" : fp);
++		r = SSH_ERR_INVALID_FORMAT;
+ 		goto done;
+ 	}
+ 	ident = format_identity(id);
+diff --git a/sshsig.c b/sshsig.c
+index 7736134..76d7c21 100644
+--- a/sshsig.c
++++ b/sshsig.c
+@@ -857,6 +857,7 @@ cert_filter_principals(const char *path, u_long linenum,
+ 	}
+ 	if ((principals = sshbuf_dup_string(nprincipals)) == NULL) {
+ 		error_f("buffer error");
++		r = SSH_ERR_ALLOC_FAIL;
+ 		goto out;
+ 	}
+ 	/* success */
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index d2c477a062..54b4d238eb 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-51384.patch \
            file://CVE-2023-51385.patch \
            file://CVE-2024-6387.patch \
+           file://CVE-2025-26465.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.43.0


