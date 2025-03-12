Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5D7C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:07 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.4747.1741809358057089480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=buNzO5hM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fe9759e5c1so525973a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809357; x=1742414157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=de21rvAWYLs8cgOvqriPIg8jh/QKgimgPxYKpGje06g=;
        b=buNzO5hMmS8Xqsy5RueVukLEEHwliHJ9lDHCNu3OtPFbJdBWyrl7k/808WgQEGX+mW
         77f1ia2sVI1YkZRHVFNnt0H4aVbmtYxJ/yhAk4kjNSSh8nzhKApeJzwXycBDOl4yfaq+
         VriUvNmnomYPcm1suB6xTW149bTqXAJ2KXFY7vXsTJ2v1LoT2dpUwYnl97v/tw3zDYCP
         vN/L+nn0TzDwNbnhFk8/aczptNfc87lWh0dPY95W9jgA+SiXbXuzoDgAv62MiGbmg5jA
         /LxapeJ87i8h8p4nQfCfbKWc/qFxouSadMsm0FtP53+Hzds56zxAFXYa0i4R+KiCBj6l
         +dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809357; x=1742414157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=de21rvAWYLs8cgOvqriPIg8jh/QKgimgPxYKpGje06g=;
        b=LK3Wxd4W2QeJufyav7R7o40DNyxRIsA9QRVsNOGQ1uGb5X22OFvuqw3rxUC9Wzt2gB
         D17A63mnfWZpvEUBie8s+3WlzEhYFbUdjGZxvBiXjjYRMb/9UugdRLAIhD/bt4bAYZIW
         oCVOyg+nvoTArzO3WLMWcW+kgwr6bhWdMzW8WKXWz/4o5rv1Y/PmaPV6w1sXRWxHxBrD
         BDIrDY2TLUaprKUGcdnQU+xgEjnr/f4SeAAuogs94KS/0PTirBJAsyh4YRieMP+LX9jn
         TYSUxXQRp2jG8MJCMMrTiJ4rHY+TrzxchwjiZf+WZCO1zMSzP0+zIkuu7kvXd2zrMPLq
         HwpA==
X-Gm-Message-State: AOJu0YwP+v59nKZXaKEmQlZ/Bjp5dGjfeMc4DLRGO3u2K8ew41UJCu+l
	0MlJU40s4GGX0RQmfvDnwQOwKkBRDuHl8st1uNFNdKO8ib7EySJd/9n7luGPFWobg5+cz39Znz2
	w
X-Gm-Gg: ASbGncvRG8XnI89hrjzuAQisrlPr97392eJGBGNHmfmF+0ZGmDAV66FYALT2BACd28d
	euqGxsQrVRJveE5Xic6sjn+5rOrgF5CS57/ovnM6E0eXcMtxjJy2PZdLLu4i2Omhacpb0Xg6U/n
	VnrTj+xEGJrFhjYS/hNUDOuu16J2ebVxumP3Dpu1+7ZeTyAJ8wc+Ksm20ykwZ318EFvDFtbnrIf
	+B0k1+p3j8Lq56NAhiZQUMv6p22ie9C7VSOVFR7X+saQ4ugKAmA1T80VoEpxQ7yjmyP+GTU0YgB
	YdR/7rCE2CxL4IsC7DZtT3/HF/dBVZlYcEbxnp+Y9E5yhA==
X-Google-Smtp-Source: AGHT+IGcYJ6zRPeWFIOyHvcWvIrf9c788841o0vXDesW9p3Viq4ENcygHqgjsBGxc9H+dyS5nI5X9w==
X-Received: by 2002:a05:6300:4046:b0:1f5:8754:324d with SMTP id adf61e73a8af0-1f58cad4b02mr12793361637.9.1741809357281;
        Wed, 12 Mar 2025 12:55:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.55.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:55:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/28] openssh: fix CVE-2025-26465
Date: Wed, 12 Mar 2025 12:55:22 -0700
Message-ID: <60b5df194a5bea491489fdae2f32e33ffd21c9c7.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212695

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was found in OpenSSH when the VerifyHostKeyDNS option is enabled.
A machine-in-the-middle attack can be performed by a malicious machine impersonating
a legit server. This issue occurs due to how OpenSSH mishandles error codes in specific
conditions when verifying the host key. For an attack to be considered successful,
the attacker needs to manage to exhaust the client's memory resource first, turning
the attack complexity high.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2025-26465.patch      | 169 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
new file mode 100644
index 0000000000..0a3cf1496b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
@@ -0,0 +1,169 @@
+From 0832aac79517611dd4de93ad0a83577994d9c907 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 18 Feb 2025 08:02:48 +0000
+Subject: [PATCH] upstream: Fix cases where error codes were not correctly set
+
+Reported by the Qualys Security Advisory team. ok markus@
+
+OpenBSD-Commit-ID: 7bcd4ffe0fa1e27ff98d451fb9c22f5fae6e610d
+
+CVE: CVE-2025-26465
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/0832aac79517611dd4de93ad0a83577994d9c907]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ krl.c           | 4 +++-
+ ssh-agent.c     | 5 +++++
+ ssh-sk-client.c | 4 +++-
+ sshconnect2.c   | 5 ++++-
+ sshsig.c        | 1 +
+ 5 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/krl.c b/krl.c
+index e2efdf0..0d0f695 100644
+--- a/krl.c
++++ b/krl.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: krl.c,v 1.59 2023/07/17 05:22:30 djm Exp $ */
++/* $OpenBSD: krl.c,v 1.60 2025/02/18 08:02:48 djm Exp $ */
+ /*
+  * Copyright (c) 2012 Damien Miller <djm@mindrot.org>
+  *
+@@ -674,6 +674,7 @@ revoked_certs_generate(struct revoked_certs *rc, struct sshbuf *buf)
+			break;
+		case KRL_SECTION_CERT_SERIAL_BITMAP:
+			if (rs->lo - bitmap_start > INT_MAX) {
++				r = SSH_ERR_INVALID_FORMAT;
+				error_f("insane bitmap gap");
+				goto out;
+			}
+@@ -1059,6 +1060,7 @@ ssh_krl_from_blob(struct sshbuf *buf, struct ssh_krl **krlp)
+	}
+
+	if ((krl = ssh_krl_init()) == NULL) {
++		r = SSH_ERR_ALLOC_FAIL;
+		error_f("alloc failed");
+		goto out;
+	}
+diff --git a/ssh-agent.c b/ssh-agent.c
+index b6a3f48..2d2c6fc 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1204,6 +1204,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+	    "restrict-destination-v00@openssh.com") == 0) {
+		if (*dcsp != NULL) {
+			error_f("%s already set", ext_name);
++			r = SSH_ERR_INVALID_FORMAT;
+			goto out;
+		}
+		if ((r = sshbuf_froms(m, &b)) != 0) {
+@@ -1213,6 +1214,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+		while (sshbuf_len(b) != 0) {
+			if (*ndcsp >= AGENT_MAX_DEST_CONSTRAINTS) {
+				error_f("too many %s constraints", ext_name);
++				r = SSH_ERR_INVALID_FORMAT;
+				goto out;
+			}
+			*dcsp = xrecallocarray(*dcsp, *ndcsp, *ndcsp + 1,
+@@ -1230,6 +1232,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+		}
+		if (*certs != NULL) {
+			error_f("%s already set", ext_name);
++			r = SSH_ERR_INVALID_FORMAT;
+			goto out;
+		}
+		if ((r = sshbuf_get_u8(m, &v)) != 0 ||
+@@ -1241,6 +1244,7 @@ parse_key_constraint_extension(struct sshbuf *m, char **sk_providerp,
+		while (sshbuf_len(b) != 0) {
+			if (*ncerts >= AGENT_MAX_EXT_CERTS) {
+				error_f("too many %s constraints", ext_name);
++				r = SSH_ERR_INVALID_FORMAT;
+				goto out;
+			}
+			*certs = xrecallocarray(*certs, *ncerts, *ncerts + 1,
+@@ -1737,6 +1741,7 @@ process_ext_session_bind(SocketEntry *e)
+	/* record new key/sid */
+	if (e->nsession_ids >= AGENT_MAX_SESSION_IDS) {
+		error_f("too many session IDs recorded");
++		r = -1;
+		goto out;
+	}
+	e->session_ids = xrecallocarray(e->session_ids, e->nsession_ids,
+diff --git a/ssh-sk-client.c b/ssh-sk-client.c
+index 321fe53..06fad22 100644
+--- a/ssh-sk-client.c
++++ b/ssh-sk-client.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-sk-client.c,v 1.12 2022/01/14 03:34:00 djm Exp $ */
++/* $OpenBSD: ssh-sk-client.c,v 1.13 2025/02/18 08:02:48 djm Exp $ */
+ /*
+  * Copyright (c) 2019 Google LLC
+  *
+@@ -439,6 +439,7 @@ sshsk_load_resident(const char *provider_path, const char *device,
+		}
+		if ((srk = calloc(1, sizeof(*srk))) == NULL) {
+			error_f("calloc failed");
++			r = SSH_ERR_ALLOC_FAIL;
+			goto out;
+		}
+		srk->key = key;
+@@ -450,6 +451,7 @@ sshsk_load_resident(const char *provider_path, const char *device,
+		if ((tmp = recallocarray(srks, nsrks, nsrks + 1,
+		    sizeof(*srks))) == NULL) {
+			error_f("recallocarray keys failed");
++			r = SSH_ERR_ALLOC_FAIL;
+			goto out;
+		}
+		debug_f("srks[%zu]: %s %s uidlen %zu", nsrks,
+diff --git a/sshconnect2.c b/sshconnect2.c
+index fab1e36..a5f92f0 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -101,7 +101,7 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+	    options.required_rsa_size)) != 0)
+		fatal_r(r, "Bad server host key");
+	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
+-	    xxx_conn_info) == -1)
++	    xxx_conn_info) != 0)
+		fatal("Host key verification failed.");
+	return 0;
+ }
+@@ -709,6 +709,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+
+	if ((pktype = sshkey_type_from_name(pkalg)) == KEY_UNSPEC) {
+		debug_f("server sent unknown pkalg %s", pkalg);
++		r = SSH_ERR_INVALID_FORMAT;
+		goto done;
+	}
+	if ((r = sshkey_from_blob(pkblob, blen, &key)) != 0) {
+@@ -719,6 +720,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+		error("input_userauth_pk_ok: type mismatch "
+		    "for decoded key (received %d, expected %d)",
+		    key->type, pktype);
++		r = SSH_ERR_INVALID_FORMAT;
+		goto done;
+	}
+
+@@ -738,6 +740,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct ssh *ssh)
+		    SSH_FP_DEFAULT);
+		error_f("server replied with unknown key: %s %s",
+		    sshkey_type(key), fp == NULL ? "<ERROR>" : fp);
++		r = SSH_ERR_INVALID_FORMAT;
+		goto done;
+	}
+	ident = format_identity(id);
+diff --git a/sshsig.c b/sshsig.c
+index d50d65f..1b7f40d 100644
+--- a/sshsig.c
++++ b/sshsig.c
+@@ -874,6 +874,7 @@ cert_filter_principals(const char *path, u_long linenum,
+	}
+	if ((principals = sshbuf_dup_string(nprincipals)) == NULL) {
+		error_f("buffer error");
++		r = SSH_ERR_ALLOC_FAIL;
+		goto out;
+	}
+	/* success */
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index ea5face097..6ae4c81a42 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2024-39894.patch \
            file://0001-Fix-missing-header-for-systemd-notification.patch \
            file://CVE-2025-26466.patch \
+           file://CVE-2025-26465.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.43.0


