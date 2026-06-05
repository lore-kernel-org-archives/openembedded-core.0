Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF481CD6E7E
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:23 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6135.1780698862640048632
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JB2BZjXp;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b64c8311so27499115e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698861; x=1781303661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wkHdl9mvQRedNcraJeZixJKRViEfhwUojeNCz1SS1c=;
        b=JB2BZjXpLzRN9E/kXEhilnFDQRuTzMHAyF6d3YS+CvThU4cvcZ1wbW4Tr0EH/Dawmx
         xK6rqgSru8YsLBuO9g0A8KKGBNSfpfrVPa+4hc9wR/Txs77hK6I+XU/rLraE1xNJUOuM
         RY1L0KWFOHfyCYgwGM5pBFfuYv4ImW8ZroFjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698861; x=1781303661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1wkHdl9mvQRedNcraJeZixJKRViEfhwUojeNCz1SS1c=;
        b=SMbu8kfhQCsVX7CY0Zi+E+AKDi3PsZPz7GbJaGZEAVewYktmjkV0dvHElJIjlsAdXs
         eQ8Q5f+jmsAPdfT0OtBJ6QkIzO3KnvrC9zsokhHC0pO+XmwdtDKpYyLZRYc1Ue9T1S0R
         Ry2pv2akoz99zyUmJJN7hvoSXLfR7l13hWiplLLPv5f1nJrYgD7WENu9tx3uxf6nBVO4
         L2xLsQjSV8O4o2XIeVg8dXUkTRsPXz7JCgfPhxnlBl3vEQXvzK6wFlXVuv4nKVrTqOeT
         yYXMG9roH2+4F27Ml2H4w0njUpg5PspnLhCJRwDXUSZDAFT1xTXXlpaAsUw8JeCRZfEX
         x+lg==
X-Gm-Message-State: AOJu0YwQRi7uMHkBPIrX9IYkiWvOhmB1DdrrSt+9nXrakb+wxb0YgMN0
	Rbi4IhXQYoJL4x4TaSvubYmejiRScCzyPW+fVny3R8zMdopg/j9tq2iMIUBBNH0AXU6WNROjN56
	a0T/d
X-Gm-Gg: Acq92OGvGvdwu/Qx8IbzhhrCVGWxVljsDs8Tes139MKrelS6h7C5jJMXpDi17mYyIxJ
	HT93hCgpF6rNJT5+NOGeSL9bAdePTxNpMlOMTqgoFQypMbmSLMMZ1rJ5ZemFo2mZOfp+SUoAYdF
	YBmCSC9nwp/8HIDsZ0ucPD1tp0XxPF2PaovTj/cCGc+yF391UposLPKHeSgwtWSLwFaR7JyEGJY
	Mtb0m4Tmml1lqLAlvWB3j23dwERdjSg6Opt6Us35B3CLSilUMI2ID2ETC3Ngce7xiNtQMhAptLU
	HU25Fjm9NZpfEqVknluiPz1ZPwxOoJZqSyr1yeI301HsAPHHSriXX1O7mvLeldtxC9e8/FNxKPQ
	RCubYdx9BJi/vFgZR9EGx5YzkLxOFKtFMzpmcS3lWCpY0Blyzlh5seklq28AhtCDu+mFxNMXpKO
	IpE8VPqM8hMFFEwbDffXEu+I1+hCKI4ULUT5r1pfMA/ed24SL7I65pAO7sLxfTAi9m7t0bF9Iuk
	m0Ykqp9XP83EuIejYc1u2OvXJrr2iOjXTnGmSA=
X-Received: by 2002:a05:600c:4fce:b0:490:5cd8:d21c with SMTP id 5b1f17b1804b1-490c25b3556mr100448795e9.14.1780698860956;
        Fri, 05 Jun 2026 15:34:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/25] openssh: patch CVE-2026-35387
Date: Sat,  6 Jun 2026 00:33:59 +0200
Message-ID: <c8fb33de27b9e2be5aeaa4178ddc7b6e724f45ee.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238201

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch from [1] matching CVE description in [2] and change described
in release note [3].

[1] https://github.com/openssh/openssh-portable/commit/fd1c7e131f331942d20f42f31e79912d570081fa

[2] https://security-tracker.debian.org/tracker/CVE-2026-35387

[3] https://www.openssh.org/releasenotes.html#10.3p1

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-35387.patch      | 205 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
new file mode 100644
index 00000000000..c4806bd9935
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
@@ -0,0 +1,205 @@
+From faaf123656513f16994853379c388ad8cc850f8c Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:48:13 +0000
+Subject: [PATCH] upstream: correctly match ECDSA signature algorithms against
+
+algorithm allowlists: HostKeyAlgorithms, PubkeyAcceptedAlgorithms and
+HostbasedAcceptedAlgorithms.
+
+Previously, if any ECDSA type (say "ecdsa-sha2-nistp521") was
+present in one of these lists, then all ECDSA algorithms would
+be permitted.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
+
+CVE: CVE-2026-35387
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fd1c7e131f331942d20f42f31e79912d570081fa]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ auth2-hostbased.c  |  9 +++++----
+ auth2-pubkey.c     |  9 +++++----
+ auth2-pubkeyfile.c | 26 +++++++++++++++-----------
+ sshconnect2.c      | 28 ++++++++++++++++++----------
+ 4 files changed, 43 insertions(+), 29 deletions(-)
+
+diff --git a/auth2-hostbased.c b/auth2-hostbased.c
+index 06bb464ff..02eeed3f0 100644
+--- a/auth2-hostbased.c
++++ b/auth2-hostbased.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: auth2-hostbased.c,v 1.52 2023/03/05 05:34:09 dtucker Exp $ */
++/* $OpenBSD: auth2-hostbased.c,v 1.57 2026/04/02 07:48:13 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  *
+@@ -95,9 +95,10 @@ userauth_hostbased(struct ssh *ssh, const char *method)
+ 		error_f("cannot decode key: %s", pkalg);
+ 		goto done;
+ 	}
+-	if (key->type != pktype) {
+-		error_f("type mismatch for decoded key "
+-		    "(received %d, expected %d)", key->type, pktype);
++	if (key->type != pktype || (sshkey_type_plain(pktype) == KEY_ECDSA &&
++	    sshkey_ecdsa_nid_from_name(pkalg) != key->ecdsa_nid)) {
++		error_f("key type mismatch for decoded key "
++		    "(received %s, expected %s)", sshkey_ssh_name(key), pkalg);
+ 		goto done;
+ 	}
+ 	if (match_pattern_list(pkalg, options.hostbased_accepted_algos, 0) != 1) {
+diff --git a/auth2-pubkey.c b/auth2-pubkey.c
+index 3f49e1df3..1e07ff74e 100644
+--- a/auth2-pubkey.c
++++ b/auth2-pubkey.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: auth2-pubkey.c,v 1.119 2023/07/27 22:25:17 djm Exp $ */
++/* $OpenBSD: auth2-pubkey.c,v 1.126 2026/04/02 07:48:13 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2010 Damien Miller.  All rights reserved.
+@@ -148,9 +148,10 @@ userauth_pubkey(struct ssh *ssh, const char *method)
+ 		error_f("cannot decode key: %s", pkalg);
+ 		goto done;
+ 	}
+-	if (key->type != pktype) {
+-		error_f("type mismatch for decoded key "
+-		    "(received %d, expected %d)", key->type, pktype);
++	if (key->type != pktype || (sshkey_type_plain(pktype) == KEY_ECDSA &&
++	    sshkey_ecdsa_nid_from_name(pkalg) != key->ecdsa_nid)) {
++		error_f("key type mismatch for decoded key "
++		    "(received %s, expected %s)", sshkey_ssh_name(key), pkalg);
+ 		goto done;
+ 	}
+ 	if (auth2_key_already_used(authctxt, key)) {
+diff --git a/auth2-pubkeyfile.c b/auth2-pubkeyfile.c
+index 31e7481fb..869c8e055 100644
+--- a/auth2-pubkeyfile.c
++++ b/auth2-pubkeyfile.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: auth2-pubkeyfile.c,v 1.4 2023/03/05 05:34:09 dtucker Exp $ */
++/* $OpenBSD: auth2-pubkeyfile.c,v 1.8 2026/04/02 07:48:13 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2010 Damien Miller.  All rights reserved.
+@@ -50,6 +50,7 @@
+ #include "authfile.h"
+ #include "match.h"
+ #include "ssherr.h"
++#include "xmalloc.h"
+ 
+ int
+ auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
+@@ -146,20 +147,23 @@ auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
+ static int
+ match_principals_option(const char *principal_list, struct sshkey_cert *cert)
+ {
+-	char *result;
++	char *list, *olist, *entry;
+ 	u_int i;
+ 
+-	/* XXX percent_expand() sequences for authorized_principals? */
+-
+-	for (i = 0; i < cert->nprincipals; i++) {
+-		if ((result = match_list(cert->principals[i],
+-		    principal_list, NULL)) != NULL) {
+-			debug3("matched principal from key options \"%.100s\"",
+-			    result);
+-			free(result);
+-			return 1;
++	olist = list = xstrdup(principal_list);
++	for (;;) {
++		if ((entry = strsep(&list, ",")) == NULL || *entry == '\0')
++			break;
++		for (i = 0; i < cert->nprincipals; i++) {
++			if (strcmp(entry, cert->principals[i]) == 0) {
++				debug3("matched principal from key i"
++				    "options \"%.100s\"", entry);
++				free(olist);
++				return 1;
++			}
+ 		}
+ 	}
++	free(olist);
+ 	return 0;
+ }
+ 
+diff --git a/sshconnect2.c b/sshconnect2.c
+index a5f92f04c..a296c9b8c 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: sshconnect2.c,v 1.371 2023/12/18 14:45:49 djm Exp $ */
++/* $OpenBSD: sshconnect2.c,v 1.385 2026/04/02 07:48:13 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2008 Damien Miller.  All rights reserved.
+@@ -91,6 +91,7 @@ extern Options options;
+ static char *xxx_host;
+ static struct sockaddr *xxx_hostaddr;
+ static const struct ssh_conn_info *xxx_conn_info;
++static int key_type_allowed(struct sshkey *, const char *);
+ 
+ static int
+ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+@@ -100,6 +101,10 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ 	if ((r = sshkey_check_rsa_length(hostkey,
+ 	    options.required_rsa_size)) != 0)
+ 		fatal_r(r, "Bad server host key");
++	if (!key_type_allowed(hostkey, options.hostkeyalgorithms)) {
++		fatal("Server host key %s not in HostKeyAlgorithms",
++		    sshkey_ssh_name(hostkey));
++	}
+ 	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
+ 	    xxx_conn_info) != 0)
+ 		fatal("Host key verification failed.");
+@@ -1608,34 +1613,37 @@ load_identity_file(Identity *id)
+ }
+ 
+ static int
+-key_type_allowed_by_config(struct sshkey *key)
++key_type_allowed(struct sshkey *key, const char *allowlist)
+ {
+-	if (match_pattern_list(sshkey_ssh_name(key),
+-	    options.pubkey_accepted_algos, 0) == 1)
++	if (match_pattern_list(sshkey_ssh_name(key), allowlist, 0) == 1)
+ 		return 1;
+ 
+ 	/* RSA keys/certs might be allowed by alternate signature types */
+ 	switch (key->type) {
+ 	case KEY_RSA:
+-		if (match_pattern_list("rsa-sha2-512",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		if (match_pattern_list("rsa-sha2-512", allowlist, 0) == 1)
+ 			return 1;
+-		if (match_pattern_list("rsa-sha2-256",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		if (match_pattern_list("rsa-sha2-256", allowlist, 0) == 1)
+ 			return 1;
+ 		break;
+ 	case KEY_RSA_CERT:
+ 		if (match_pattern_list("rsa-sha2-512-cert-v01@openssh.com",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		    allowlist, 0) == 1)
+ 			return 1;
+ 		if (match_pattern_list("rsa-sha2-256-cert-v01@openssh.com",
+-		    options.pubkey_accepted_algos, 0) == 1)
++		    allowlist, 0) == 1)
+ 			return 1;
+ 		break;
+ 	}
+ 	return 0;
+ }
+ 
++static int
++key_type_allowed_by_config(struct sshkey *key)
++{
++	return key_type_allowed(key, options.pubkey_accepted_algos);
++}
++
+ /* obtain a list of keys from the agent */
+ static int
+ get_agent_identities(struct ssh *ssh, int *agent_fdp,
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 3a9010a7a4d..9267bbd2c94 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-61985.patch \
            file://CVE-2025-61984.patch \
            file://CVE-2026-35385.patch \
+           file://CVE-2026-35387.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

