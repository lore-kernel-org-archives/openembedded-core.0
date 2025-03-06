Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1203C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:07:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.9412.1741255635680257351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bvh5W+oV;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22337bc9ac3so7596545ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 02:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741255635; x=1741860435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uoTi49vPSNsErBMHsdpfb77U2idK4JPem+M1gx2nxRg=;
        b=bvh5W+oVuTdKWGIUWQaFFRf7jX3uQv1bRSIzaaDzEDEXmQFdpUfH6tUeH5+7LGA3/6
         MxUPVhPRI0ln624/m5IsattyI8uPfXsOE+mqmb4OuIprJLr/gME4z7+6n4Dym1wyD7U0
         6RobGA3EMttaBt9BXGhRAV8o538PqrrmpvdZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741255635; x=1741860435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoTi49vPSNsErBMHsdpfb77U2idK4JPem+M1gx2nxRg=;
        b=AAjFVcGdxhpVPfeyfz90DBfh8vs9F7A+iyR0RD6w8nZSnMCTxnLSyeOJGsRaDxlIYu
         49mid42MJA/4USyPJiCJn4qQIsmZ3cMxHz6yDj+d5fHMaYT/am2lXkKbUP/PNLeQADBe
         OO6UGBaywAN2ReidvuBHBD1JfdYdZA+HGp5VZSOyihpznjhvMNufo6WYISrTH7b81PPF
         WWKgi8SNEZboqcCo9YUJilObWU5uUs3bVaK5X7mEo9o6VlwTYOKTNtoir/4yyyB1TZXm
         sb2h70/PAxPjx4dEBL50NpakAQNqTqSyKp8Tk9lMiqZHP2KkNey10EP+yvYZFXguG/+G
         VhAw==
X-Gm-Message-State: AOJu0YxmHl4KCqbHRW/SpgFJnnJfLNlEQsNOEnwxMP/+d0qB6jdi10qP
	k2CMzkAkeLKHVIX/RMtFm2Ad2URzb8iJFGV6HXIKniY4NH9sjTw46hLQHPUh8lbu0CLGFoU6dpL
	yYpM=
X-Gm-Gg: ASbGncukPSCxduxbz52awAjNkqVCnPN3UDLlUUeR/elXMbAssJkp0/zAGqif6LUOYre
	yThXfYxX3R9a6KGmBkc9RaPqEGjJQOmtkEmmxGaAnkuwPChk8YqdQ9dA0gIE/p6d+fWAVqqY7el
	LThCrpWYuobOjqF9i02N9Rn1YM0JbOiyt3cj5GknifLwrgKHsTbdnwkWXgCXWWVsH9lkSABo06q
	TFVp1uvu+97dDB45uys4DGu8bhFBbc4C5bWntN7HCZx9pzmXxPh92Un2KIeZdg69C4VHJZjEtn2
	E3fidUDfOSvD8foKxZivo9OCp7ZX9e+Qn5cU0TdCptTqdv4FyD9vq6Sw
X-Google-Smtp-Source: AGHT+IGis36DGQYE5Z76DjqZNw0lNfgUV7w8+1U2UxaAoipYUt0X1vGDzyBTXzy2eznplt/xGLjxFg==
X-Received: by 2002:a05:6a00:a1d:b0:736:4644:86e6 with SMTP id d2e1a72fcca58-73682be280fmr9771005b3a.12.1741255634512;
        Thu, 06 Mar 2025 02:07:14 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.208.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698450490sm943475b3a.81.2025.03.06.02.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:07:13 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] openssh: Fix CVE-2025-26465
Date: Thu,  6 Mar 2025 15:37:02 +0530
Message-Id: <20250306100702.156308-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 10:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212379

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/openssh/openssh-portable/commit/0832aac79517611dd4de93ad0a83577994d9c907

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


