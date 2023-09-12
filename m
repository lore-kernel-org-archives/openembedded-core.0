Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB4FCA0EE1
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:48 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.25662.1694526821377182679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qnDGDBr6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bf7a6509deso38285785ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526820; x=1695131620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6wDLAhcGh2jl64kkRRArnOPH/i2k71290bgX8NLiLs=;
        b=qnDGDBr6XaRM/Ixn4FWzAELioHl9s+YkYb75IDn1S5ISwyS4SKLD0ul8WdNhlYmrqy
         tdf6ydxbb0Np3FraKdfwURA2f8uVtUwJPMiPFhtNpaRDaePzacrfEaLC5WvfwSJyoMxg
         mDt1iGwqEDtVxu3g7jH+WcXx7PnVq91hMOkKr5HJk3JWVT0C2ziNaaC1yyRNQz4fF4sS
         arqCWnmiPJlw3ZwBe/VeIUSolnyZuMCu8iJzam+tCCMdYHjc/LxAYEYqbamDZKwRGmr5
         T/lINGpwDRCFiDadHb3cq4b7DmHciFCCtX+dI5pVKweKlvKizxtNmkaqFLvWUBM+xcvb
         +D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526820; x=1695131620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6wDLAhcGh2jl64kkRRArnOPH/i2k71290bgX8NLiLs=;
        b=DHRHelfP5OFoLh6fhT4qc6H6p3RRDh2KdpjnvPsIAZ2skYFTtYynJ3fwWCpl6ywqrG
         bETBkeb3dL2xS9PL18rI7VcaLacMSw03yLJb3h0K0YrWyPDZ3BuSpmCVjL6aGkuJcC/f
         +sMg+E4WvVzoGkc97RxFxlbpjBBy07TjbbAHf/B3VB1xPDFXKclla9m1XBEZhd95WdwO
         UELWdWZyWYlthtmEioTD5E/ad+N3Go4tCET7F9xOFdDxMBWTo/3FgnC14TbOACNkiyjS
         vf+FtBTKV9wfA1yYM7YaLbKPmAS7oXT8sjJaaJpMcdqioJnOCF9zTowAnaIsTIcPPENO
         2QqQ==
X-Gm-Message-State: AOJu0YzUIVYB9dAk00SBBpcrmFj1DW9uIaFNHt+oedwWekQvl9MY7IaR
	GauS1h4XFJtOeTtHq/Be6K//q1qn0cSqa3WWkUQ=
X-Google-Smtp-Source: AGHT+IEZVpRcDrvRJTPEVlEohXa9s5PUBRn791qJ1jw6jQ37dYJJaBX6e85+w/bRauIB414QJ3BPOQ==
X-Received: by 2002:a17:902:cec4:b0:1c0:e6e1:4a11 with SMTP id d4-20020a170902cec400b001c0e6e14a11mr13392915plg.54.1694526819110;
        Tue, 12 Sep 2023 06:53:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/14] openssh: Securiry fix for CVE-2023-38408
Date: Tue, 12 Sep 2023 03:53:11 -1000
Message-Id: <9242b8218858d2bebb3235929fea7e7235cd40f3.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187517

From: Shubham Kulkarni <skulkarni@mvista.com>

The PKCS#11 feature in ssh-agent in OpenSSH before 9.3p2 has an
insufficiently trustworthy search path, leading to remote code
execution if an agent is forwarded to an attacker-controlled system.
(Code in /usr/lib is not necessarily safe for loading into ssh-agent.)
NOTE: this issue exists because of an incomplete fix for CVE-2016-10009.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-38408

Upstream patches:
https://github.com/openssh/openssh-portable/commit/dee22129, https://github.com/openssh/openssh-portable/commit/099cdf59,
https://github.com/openssh/openssh-portable/commit/29ef8a04, https://github.com/openssh/openssh-portable/commit/892506b1,
https://github.com/openssh/openssh-portable/commit/0c111eb8, https://github.com/openssh/openssh-portable/commit/52a03e9f,
https://github.com/openssh/openssh-portable/commit/1fe16fd6, https://github.com/openssh/openssh-portable/commit/e0e8bee8,
https://github.com/openssh/openssh-portable/commit/8afaa7d7, https://github.com/openssh/openssh-portable/commit/1a4b9275,
https://github.com/openssh/openssh-portable/commit/4c1e3ce8, https://github.com/openssh/openssh-portable/commit/1f2731f5.

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2023-38408-01.patch   | 189 ++++++
 .../openssh/openssh/CVE-2023-38408-02.patch   | 581 ++++++++++++++++++
 .../openssh/openssh/CVE-2023-38408-03.patch   | 171 ++++++
 .../openssh/openssh/CVE-2023-38408-04.patch   |  34 +
 .../openssh/openssh/CVE-2023-38408-05.patch   | 194 ++++++
 .../openssh/openssh/CVE-2023-38408-06.patch   |  73 +++
 .../openssh/openssh/CVE-2023-38408-07.patch   | 125 ++++
 .../openssh/openssh/CVE-2023-38408-08.patch   | 315 ++++++++++
 .../openssh/openssh/CVE-2023-38408-09.patch   |  38 ++
 .../openssh/openssh/CVE-2023-38408-10.patch   |  39 ++
 .../openssh/openssh/CVE-2023-38408-11.patch   | 307 +++++++++
 .../openssh/openssh/CVE-2023-38408-12.patch   | 120 ++++
 .../openssh/openssh_8.2p1.bb                  |  12 +
 13 files changed, 2198 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-01.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-02.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-03.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-04.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-05.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-06.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-07.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-08.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-09.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-10.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-11.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-12.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-01.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-01.patch
new file mode 100644
index 0000000000..c899056337
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-01.patch
@@ -0,0 +1,189 @@
+From f6213e03887237714eb5bcfc9089c707069f87c5 Mon Sep 17 00:00:00 2001
+From: Damien Miller <djm@mindrot.org>
+Date: Fri, 1 Oct 2021 16:35:49 +1000
+Subject: [PATCH 01/12] make OPENSSL_HAS_ECC checks more thorough
+
+ok dtucker
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/dee22129bbc61e25b1003adfa2bc584c5406ef2d]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-pkcs11-client.c | 16 ++++++++--------
+ ssh-pkcs11.c        | 26 +++++++++++++-------------
+ 2 files changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/ssh-pkcs11-client.c b/ssh-pkcs11-client.c
+index 8a0ffef..41114c7 100644
+--- a/ssh-pkcs11-client.c
++++ b/ssh-pkcs11-client.c
+@@ -163,7 +163,7 @@ rsa_encrypt(int flen, const u_char *from, u_char *to, RSA *rsa, int padding)
+	return (ret);
+ }
+
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+ static ECDSA_SIG *
+ ecdsa_do_sign(const unsigned char *dgst, int dgst_len, const BIGNUM *inv,
+     const BIGNUM *rp, EC_KEY *ec)
+@@ -220,12 +220,12 @@ ecdsa_do_sign(const unsigned char *dgst, int dgst_len, const BIGNUM *inv,
+	sshbuf_free(msg);
+	return (ret);
+ }
+-#endif /* HAVE_EC_KEY_METHOD_NEW */
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+
+ static RSA_METHOD	*helper_rsa;
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+ static EC_KEY_METHOD	*helper_ecdsa;
+-#endif /* HAVE_EC_KEY_METHOD_NEW */
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+
+ /* redirect private key crypto operations to the ssh-pkcs11-helper */
+ static void
+@@ -233,10 +233,10 @@ wrap_key(struct sshkey *k)
+ {
+	if (k->type == KEY_RSA)
+		RSA_set_method(k->rsa, helper_rsa);
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+	else if (k->type == KEY_ECDSA)
+		EC_KEY_set_method(k->ecdsa, helper_ecdsa);
+-#endif /* HAVE_EC_KEY_METHOD_NEW */
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+	else
+		fatal("%s: unknown key type", __func__);
+ }
+@@ -247,7 +247,7 @@ pkcs11_start_helper_methods(void)
+	if (helper_rsa != NULL)
+		return (0);
+
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+	int (*orig_sign)(int, const unsigned char *, int, unsigned char *,
+	    unsigned int *, const BIGNUM *, const BIGNUM *, EC_KEY *) = NULL;
+	if (helper_ecdsa != NULL)
+@@ -257,7 +257,7 @@ pkcs11_start_helper_methods(void)
+		return (-1);
+	EC_KEY_METHOD_get_sign(helper_ecdsa, &orig_sign, NULL, NULL);
+	EC_KEY_METHOD_set_sign(helper_ecdsa, orig_sign, NULL, ecdsa_do_sign);
+-#endif /* HAVE_EC_KEY_METHOD_NEW */
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+
+	if ((helper_rsa = RSA_meth_dup(RSA_get_default_method())) == NULL)
+		fatal("%s: RSA_meth_dup failed", __func__);
+diff --git a/ssh-pkcs11.c b/ssh-pkcs11.c
+index a302c79..b56a41b 100644
+--- a/ssh-pkcs11.c
++++ b/ssh-pkcs11.c
+@@ -78,7 +78,7 @@ struct pkcs11_key {
+
+ int pkcs11_interactive = 0;
+
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+ static void
+ ossl_error(const char *msg)
+ {
+@@ -89,7 +89,7 @@ ossl_error(const char *msg)
+		error("%s: libcrypto error: %.100s", __func__,
+		    ERR_error_string(e, NULL));
+ }
+-#endif /* HAVE_EC_KEY_METHOD_NEW */
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+
+ int
+ pkcs11_init(int interactive)
+@@ -190,10 +190,10 @@ pkcs11_del_provider(char *provider_id)
+
+ static RSA_METHOD *rsa_method;
+ static int rsa_idx = 0;
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+ static EC_KEY_METHOD *ec_key_method;
+ static int ec_key_idx = 0;
+-#endif
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+
+ /* release a wrapped object */
+ static void
+@@ -492,7 +492,7 @@ pkcs11_rsa_wrap(struct pkcs11_provider *provider, CK_ULONG slotidx,
+	return (0);
+ }
+
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+ /* openssl callback doing the actual signing operation */
+ static ECDSA_SIG *
+ ecdsa_do_sign(const unsigned char *dgst, int dgst_len, const BIGNUM *inv,
+@@ -604,7 +604,7 @@ pkcs11_ecdsa_wrap(struct pkcs11_provider *provider, CK_ULONG slotidx,
+
+	return (0);
+ }
+-#endif /* HAVE_EC_KEY_METHOD_NEW */
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+
+ /* remove trailing spaces */
+ static void
+@@ -679,7 +679,7 @@ pkcs11_key_included(struct sshkey ***keysp, int *nkeys, struct sshkey *key)
+	return (0);
+ }
+
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+ static struct sshkey *
+ pkcs11_fetch_ecdsa_pubkey(struct pkcs11_provider *p, CK_ULONG slotidx,
+     CK_OBJECT_HANDLE *obj)
+@@ -802,7 +802,7 @@ fail:
+
+	return (key);
+ }
+-#endif /* HAVE_EC_KEY_METHOD_NEW */
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+
+ static struct sshkey *
+ pkcs11_fetch_rsa_pubkey(struct pkcs11_provider *p, CK_ULONG slotidx,
+@@ -910,7 +910,7 @@ pkcs11_fetch_x509_pubkey(struct pkcs11_provider *p, CK_ULONG slotidx,
+ #endif
+	struct sshkey		*key = NULL;
+	int			 i;
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+	int			 nid;
+ #endif
+	const u_char		*cp;
+@@ -999,7 +999,7 @@ pkcs11_fetch_x509_pubkey(struct pkcs11_provider *p, CK_ULONG slotidx,
+		key->type = KEY_RSA;
+		key->flags |= SSHKEY_FLAG_EXT;
+		rsa = NULL;	/* now owned by key */
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+	} else if (EVP_PKEY_base_id(evp) == EVP_PKEY_EC) {
+		if (EVP_PKEY_get0_EC_KEY(evp) == NULL) {
+			error("invalid x509; no ec key");
+@@ -1030,7 +1030,7 @@ pkcs11_fetch_x509_pubkey(struct pkcs11_provider *p, CK_ULONG slotidx,
+		key->type = KEY_ECDSA;
+		key->flags |= SSHKEY_FLAG_EXT;
+		ec = NULL;	/* now owned by key */
+-#endif /* HAVE_EC_KEY_METHOD_NEW */
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+	} else {
+		error("unknown certificate key type");
+		goto out;
+@@ -1237,11 +1237,11 @@ pkcs11_fetch_keys(struct pkcs11_provider *p, CK_ULONG slotidx,
+		case CKK_RSA:
+			key = pkcs11_fetch_rsa_pubkey(p, slotidx, &obj);
+			break;
+-#ifdef HAVE_EC_KEY_METHOD_NEW
++#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+		case CKK_ECDSA:
+			key = pkcs11_fetch_ecdsa_pubkey(p, slotidx, &obj);
+			break;
+-#endif /* HAVE_EC_KEY_METHOD_NEW */
++#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+		default:
+			/* XXX print key type? */
+			key = NULL;
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-02.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-02.patch
new file mode 100644
index 0000000000..25ba921869
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-02.patch
@@ -0,0 +1,581 @@
+From 92cebfbcc221c9ef3f6bbb78da3d7699c0ae56be Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 14:03:45 +0000
+Subject: [PATCH 02/12] upstream: Separate ssh-pkcs11-helpers for each p11
+ module
+
+Make ssh-pkcs11-client start an independent helper for each provider,
+providing better isolation between modules and reliability if a single
+module misbehaves.
+
+This also implements reference counting of PKCS#11-hosted keys,
+allowing ssh-pkcs11-helper subprocesses to be automatically reaped
+when no remaining keys reference them. This fixes some bugs we have
+that make PKCS11 keys unusable after they have been deleted, e.g.
+https://bugzilla.mindrot.org/show_bug.cgi?id=3125
+
+ok markus@
+
+OpenBSD-Commit-ID: 0ce188b14fe271ab0568f4500070d96c5657244e
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/099cdf59ce1e72f55d421c8445bf6321b3004755]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-pkcs11-client.c | 372 +++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 282 insertions(+), 90 deletions(-)
+
+diff --git a/ssh-pkcs11-client.c b/ssh-pkcs11-client.c
+index 41114c7..4f3c6ed 100644
+--- a/ssh-pkcs11-client.c
++++ b/ssh-pkcs11-client.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-pkcs11-client.c,v 1.16 2020/01/25 00:03:36 djm Exp $ */
++/* $OpenBSD: ssh-pkcs11-client.c,v 1.18 2023/07/19 14:03:45 djm Exp $ */
+ /*
+  * Copyright (c) 2010 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2014 Pedro Martelletto. All rights reserved.
+@@ -30,12 +30,11 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <limits.h>
+
+ #include <openssl/ecdsa.h>
+ #include <openssl/rsa.h>
+
+-#include "openbsd-compat/openssl-compat.h"
+-
+ #include "pathnames.h"
+ #include "xmalloc.h"
+ #include "sshbuf.h"
+@@ -47,18 +46,140 @@
+ #include "ssh-pkcs11.h"
+ #include "ssherr.h"
+
++#include "openbsd-compat/openssl-compat.h"
++
+ /* borrows code from sftp-server and ssh-agent */
+
+-static int fd = -1;
+-static pid_t pid = -1;
++/*
++ * Maintain a list of ssh-pkcs11-helper subprocesses. These may be looked up
++ * by provider path or their unique EC/RSA METHOD pointers.
++ */
++struct helper {
++	char *path;
++	pid_t pid;
++	int fd;
++	RSA_METHOD *rsa_meth;
++	EC_KEY_METHOD *ec_meth;
++	int (*rsa_finish)(RSA *rsa);
++	void (*ec_finish)(EC_KEY *key);
++	size_t nrsa, nec; /* number of active keys of each type */
++};
++static struct helper **helpers;
++static size_t nhelpers;
++
++static struct helper *
++helper_by_provider(const char *path)
++{
++	size_t i;
++
++	for (i = 0; i < nhelpers; i++) {
++		if (helpers[i] == NULL || helpers[i]->path == NULL ||
++		    helpers[i]->fd == -1)
++			continue;
++		if (strcmp(helpers[i]->path, path) == 0)
++			return helpers[i];
++	}
++	return NULL;
++}
++
++static struct helper *
++helper_by_rsa(const RSA *rsa)
++{
++	size_t i;
++	const RSA_METHOD *meth;
++
++	if ((meth = RSA_get_method(rsa)) == NULL)
++		return NULL;
++	for (i = 0; i < nhelpers; i++) {
++		if (helpers[i] != NULL && helpers[i]->rsa_meth == meth)
++			return helpers[i];
++	}
++	return NULL;
++
++}
++
++static struct helper *
++helper_by_ec(const EC_KEY *ec)
++{
++	size_t i;
++	const EC_KEY_METHOD *meth;
++
++	if ((meth = EC_KEY_get_method(ec)) == NULL)
++		return NULL;
++	for (i = 0; i < nhelpers; i++) {
++		if (helpers[i] != NULL && helpers[i]->ec_meth == meth)
++			return helpers[i];
++	}
++	return NULL;
++
++}
++
++static void
++helper_free(struct helper *helper)
++{
++	size_t i;
++	int found = 0;
++
++	if (helper == NULL)
++		return;
++	if (helper->path == NULL || helper->ec_meth == NULL ||
++	    helper->rsa_meth == NULL)
++		fatal("%s: inconsistent helper", __func__);
++	debug3("%s: free helper for provider %s", __func__ , helper->path);
++	for (i = 0; i < nhelpers; i++) {
++		if (helpers[i] == helper) {
++			if (found)
++				fatal("%s: helper recorded more than once", __func__);
++			found = 1;
++		}
++		else if (found)
++			helpers[i - 1] = helpers[i];
++	}
++	if (found) {
++		helpers = xrecallocarray(helpers, nhelpers,
++		    nhelpers - 1, sizeof(*helpers));
++		nhelpers--;
++	}
++	free(helper->path);
++	EC_KEY_METHOD_free(helper->ec_meth);
++	RSA_meth_free(helper->rsa_meth);
++	free(helper);
++}
++
++static void
++helper_terminate(struct helper *helper)
++{
++	if (helper == NULL) {
++		return;
++	} else if (helper->fd == -1) {
++		debug3("%s: already terminated", __func__);
++	} else {
++		debug3("terminating helper for %s; "
++		    "remaining %zu RSA %zu ECDSA", __func__,
++		    helper->path, helper->nrsa, helper->nec);
++		close(helper->fd);
++		/* XXX waitpid() */
++		helper->fd = -1;
++		helper->pid = -1;
++	}
++	/*
++	 * Don't delete the helper entry until there are no remaining keys
++	 * that reference it. Otherwise, any signing operation would call
++	 * a free'd METHOD pointer and that would be bad.
++	 */
++	if (helper->nrsa == 0 && helper->nec == 0)
++		helper_free(helper);
++}
+
+ static void
+-send_msg(struct sshbuf *m)
++send_msg(int fd, struct sshbuf *m)
+ {
+	u_char buf[4];
+	size_t mlen = sshbuf_len(m);
+	int r;
+
++	if (fd == -1)
++		return;
+	POKE_U32(buf, mlen);
+	if (atomicio(vwrite, fd, buf, 4) != 4 ||
+	    atomicio(vwrite, fd, sshbuf_mutable_ptr(m),
+@@ -69,12 +190,15 @@ send_msg(struct sshbuf *m)
+ }
+
+ static int
+-recv_msg(struct sshbuf *m)
++recv_msg(int fd, struct sshbuf *m)
+ {
+	u_int l, len;
+	u_char c, buf[1024];
+	int r;
+
++	sshbuf_reset(m);
++	if (fd == -1)
++		return 0; /* XXX */
+	if ((len = atomicio(read, fd, buf, 4)) != 4) {
+		error("read from helper failed: %u", len);
+		return (0); /* XXX */
+@@ -83,7 +207,6 @@ recv_msg(struct sshbuf *m)
+	if (len > 256 * 1024)
+		fatal("response too long: %u", len);
+	/* read len bytes into m */
+-	sshbuf_reset(m);
+	while (len > 0) {
+		l = len;
+		if (l > sizeof(buf))
+@@ -104,14 +227,17 @@ recv_msg(struct sshbuf *m)
+ int
+ pkcs11_init(int interactive)
+ {
+-	return (0);
++	return 0;
+ }
+
+ void
+ pkcs11_terminate(void)
+ {
+-	if (fd >= 0)
+-		close(fd);
++	size_t i;
++
++	debug3("%s: terminating %zu helpers", __func__, nhelpers);
++	for (i = 0; i < nhelpers; i++)
++		helper_terminate(helpers[i]);
+ }
+
+ static int
+@@ -122,7 +248,11 @@ rsa_encrypt(int flen, const u_char *from, u_char *to, RSA *rsa, int padding)
+	u_char *blob = NULL, *signature = NULL;
+	size_t blen, slen = 0;
+	int r, ret = -1;
++	struct helper *helper;
+
++	if ((helper = helper_by_rsa(rsa)) == NULL || helper->fd == -1)
++		fatal("%s: no helper for PKCS11 key", __func__);
++	debug3("%s: signing with PKCS11 provider %s", __func__, helper->path);
+	if (padding != RSA_PKCS1_PADDING)
+		goto fail;
+	key = sshkey_new(KEY_UNSPEC);
+@@ -144,10 +274,10 @@ rsa_encrypt(int flen, const u_char *from, u_char *to, RSA *rsa, int padding)
+	    (r = sshbuf_put_string(msg, from, flen)) != 0 ||
+	    (r = sshbuf_put_u32(msg, 0)) != 0)
+		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+-	send_msg(msg);
++	send_msg(helper->fd, msg);
+	sshbuf_reset(msg);
+
+-	if (recv_msg(msg) == SSH2_AGENT_SIGN_RESPONSE) {
++	if (recv_msg(helper->fd, msg) == SSH2_AGENT_SIGN_RESPONSE) {
+		if ((r = sshbuf_get_string(msg, &signature, &slen)) != 0)
+			fatal("%s: buffer error: %s", __func__, ssh_err(r));
+		if (slen <= (size_t)RSA_size(rsa)) {
+@@ -163,7 +293,26 @@ rsa_encrypt(int flen, const u_char *from, u_char *to, RSA *rsa, int padding)
+	return (ret);
+ }
+
+-#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
++static int
++rsa_finish(RSA *rsa)
++{
++	struct helper *helper;
++
++	if ((helper = helper_by_rsa(rsa)) == NULL)
++		fatal("%s: no helper for PKCS11 key", __func__);
++	debug3("%s: free PKCS11 RSA key for provider %s", __func__, helper->path);
++	if (helper->rsa_finish != NULL)
++		helper->rsa_finish(rsa);
++	if (helper->nrsa == 0)
++		fatal("%s: RSA refcount error", __func__);
++	helper->nrsa--;
++	debug3("%s: provider %s remaining keys: %zu RSA %zu ECDSA", __func__,
++	    helper->path, helper->nrsa, helper->nec);
++	if (helper->nrsa == 0 && helper->nec == 0)
++		helper_terminate(helper);
++	return 1;
++}
++
+ static ECDSA_SIG *
+ ecdsa_do_sign(const unsigned char *dgst, int dgst_len, const BIGNUM *inv,
+     const BIGNUM *rp, EC_KEY *ec)
+@@ -175,7 +324,11 @@ ecdsa_do_sign(const unsigned char *dgst, int dgst_len, const BIGNUM *inv,
+	u_char *blob = NULL, *signature = NULL;
+	size_t blen, slen = 0;
+	int r, nid;
++	struct helper *helper;
+
++	if ((helper = helper_by_ec(ec)) == NULL || helper->fd == -1)
++		fatal("%s: no helper for PKCS11 key", __func__);
++	debug3("%s: signing with PKCS11 provider %s", __func__, helper->path);
+	nid = sshkey_ecdsa_key_to_nid(ec);
+	if (nid < 0) {
+		error("%s: couldn't get curve nid", __func__);
+@@ -203,10 +356,10 @@ ecdsa_do_sign(const unsigned char *dgst, int dgst_len, const BIGNUM *inv,
+	    (r = sshbuf_put_string(msg, dgst, dgst_len)) != 0 ||
+	    (r = sshbuf_put_u32(msg, 0)) != 0)
+		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+-	send_msg(msg);
++	send_msg(helper->fd, msg);
+	sshbuf_reset(msg);
+
+-	if (recv_msg(msg) == SSH2_AGENT_SIGN_RESPONSE) {
++	if (recv_msg(helper->fd, msg) == SSH2_AGENT_SIGN_RESPONSE) {
+		if ((r = sshbuf_get_string(msg, &signature, &slen)) != 0)
+			fatal("%s: buffer error: %s", __func__, ssh_err(r));
+		cp = signature;
+@@ -220,75 +373,110 @@ ecdsa_do_sign(const unsigned char *dgst, int dgst_len, const BIGNUM *inv,
+	sshbuf_free(msg);
+	return (ret);
+ }
+-#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+
+-static RSA_METHOD	*helper_rsa;
+-#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+-static EC_KEY_METHOD	*helper_ecdsa;
+-#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
++static void
++ecdsa_do_finish(EC_KEY *ec)
++{
++	struct helper *helper;
++
++	if ((helper = helper_by_ec(ec)) == NULL)
++		fatal("%s: no helper for PKCS11 key", __func__);
++	debug3("%s: free PKCS11 ECDSA key for provider %s", __func__, helper->path);
++	if (helper->ec_finish != NULL)
++		helper->ec_finish(ec);
++	if (helper->nec == 0)
++		fatal("%s: ECDSA refcount error", __func__);
++	helper->nec--;
++	debug3("%s: provider %s remaining keys: %zu RSA %zu ECDSA", __func__,
++	    helper->path, helper->nrsa, helper->nec);
++	if (helper->nrsa == 0 && helper->nec == 0)
++		helper_terminate(helper);
++}
+
+ /* redirect private key crypto operations to the ssh-pkcs11-helper */
+ static void
+-wrap_key(struct sshkey *k)
++wrap_key(struct helper *helper, struct sshkey *k)
+ {
+-	if (k->type == KEY_RSA)
+-		RSA_set_method(k->rsa, helper_rsa);
+-#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+-	else if (k->type == KEY_ECDSA)
+-		EC_KEY_set_method(k->ecdsa, helper_ecdsa);
+-#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+-	else
++	debug3("%s: wrap %s for provider %s", __func__, sshkey_type(k), helper->path);
++	if (k->type == KEY_RSA) {
++		RSA_set_method(k->rsa, helper->rsa_meth);
++		if (helper->nrsa++ >= INT_MAX)
++			fatal("%s: RSA refcount error", __func__);
++	} else if (k->type == KEY_ECDSA) {
++		EC_KEY_set_method(k->ecdsa, helper->ec_meth);
++		if (helper->nec++ >= INT_MAX)
++			fatal("%s: EC refcount error", __func__);
++	} else
+		fatal("%s: unknown key type", __func__);
++	k->flags |= SSHKEY_FLAG_EXT;
++	debug3("%s: provider %s remaining keys: %zu RSA %zu ECDSA", __func__,
++	    helper->path, helper->nrsa, helper->nec);
+ }
+
+ static int
+-pkcs11_start_helper_methods(void)
++pkcs11_start_helper_methods(struct helper *helper)
+ {
+-	if (helper_rsa != NULL)
+-		return (0);
+-
+-#if defined(OPENSSL_HAS_ECC) && defined(HAVE_EC_KEY_METHOD_NEW)
+-	int (*orig_sign)(int, const unsigned char *, int, unsigned char *,
++	int (*ec_init)(EC_KEY *key);
++	int (*ec_copy)(EC_KEY *dest, const EC_KEY *src);
++	int (*ec_set_group)(EC_KEY *key, const EC_GROUP *grp);
++	int (*ec_set_private)(EC_KEY *key, const BIGNUM *priv_key);
++	int (*ec_set_public)(EC_KEY *key, const EC_POINT *pub_key);
++	int (*ec_sign)(int, const unsigned char *, int, unsigned char *,
+	    unsigned int *, const BIGNUM *, const BIGNUM *, EC_KEY *) = NULL;
+-	if (helper_ecdsa != NULL)
+-		return (0);
+-	helper_ecdsa = EC_KEY_METHOD_new(EC_KEY_OpenSSL());
+-	if (helper_ecdsa == NULL)
+-		return (-1);
+-	EC_KEY_METHOD_get_sign(helper_ecdsa, &orig_sign, NULL, NULL);
+-	EC_KEY_METHOD_set_sign(helper_ecdsa, orig_sign, NULL, ecdsa_do_sign);
+-#endif /* OPENSSL_HAS_ECC && HAVE_EC_KEY_METHOD_NEW */
+-
+-	if ((helper_rsa = RSA_meth_dup(RSA_get_default_method())) == NULL)
++	RSA_METHOD *rsa_meth;
++	EC_KEY_METHOD *ec_meth;
++
++	if ((ec_meth = EC_KEY_METHOD_new(EC_KEY_OpenSSL())) == NULL)
++		return -1;
++	EC_KEY_METHOD_get_sign(ec_meth, &ec_sign, NULL, NULL);
++	EC_KEY_METHOD_set_sign(ec_meth, ec_sign, NULL, ecdsa_do_sign);
++	EC_KEY_METHOD_get_init(ec_meth, &ec_init, &helper->ec_finish,
++	    &ec_copy, &ec_set_group, &ec_set_private, &ec_set_public);
++	EC_KEY_METHOD_set_init(ec_meth, ec_init, ecdsa_do_finish,
++	    ec_copy, ec_set_group, ec_set_private, ec_set_public);
++
++	if ((rsa_meth = RSA_meth_dup(RSA_get_default_method())) == NULL)
+		fatal("%s: RSA_meth_dup failed", __func__);
+-	if (!RSA_meth_set1_name(helper_rsa, "ssh-pkcs11-helper") ||
+-	    !RSA_meth_set_priv_enc(helper_rsa, rsa_encrypt))
++	helper->rsa_finish = RSA_meth_get_finish(rsa_meth);
++	if (!RSA_meth_set1_name(rsa_meth, "ssh-pkcs11-helper") ||
++	    !RSA_meth_set_priv_enc(rsa_meth, rsa_encrypt) ||
++	    !RSA_meth_set_finish(rsa_meth, rsa_finish))
+		fatal("%s: failed to prepare method", __func__);
+
+-	return (0);
++	helper->ec_meth = ec_meth;
++	helper->rsa_meth = rsa_meth;
++	return 0;
+ }
+
+-static int
+-pkcs11_start_helper(void)
++static struct helper *
++pkcs11_start_helper(const char *path)
+ {
+	int pair[2];
+-	char *helper, *verbosity = NULL;
+-
+-	if (log_level_get() >= SYSLOG_LEVEL_DEBUG1)
+-		verbosity = "-vvv";
+-
+-	if (pkcs11_start_helper_methods() == -1) {
+-		error("pkcs11_start_helper_methods failed");
+-		return (-1);
+-	}
++	char *prog, *verbosity = NULL;
++	struct helper *helper;
++	pid_t pid;
+
++	if (nhelpers >= INT_MAX)
++		fatal("%s: too many helpers", __func__);
++	debug3("%s: start helper for %s", __func__, path);
+	if (socketpair(AF_UNIX, SOCK_STREAM, 0, pair) == -1) {
+		error("socketpair: %s", strerror(errno));
+-		return (-1);
++		return NULL;
++	}
++	helper = xcalloc(1, sizeof(*helper));
++	if (pkcs11_start_helper_methods(helper) == -1) {
++		error("pkcs11_start_helper_methods failed");
++		goto fail;
+	}
+	if ((pid = fork()) == -1) {
+		error("fork: %s", strerror(errno));
+-		return (-1);
++ fail:
++		close(pair[0]);
++		close(pair[1]);
++		RSA_meth_free(helper->rsa_meth);
++		EC_KEY_METHOD_free(helper->ec_meth);
++		free(helper);
++		return NULL;
+	} else if (pid == 0) {
+		if ((dup2(pair[1], STDIN_FILENO) == -1) ||
+		    (dup2(pair[1], STDOUT_FILENO) == -1)) {
+@@ -297,18 +485,27 @@ pkcs11_start_helper(void)
+		}
+		close(pair[0]);
+		close(pair[1]);
+-		helper = getenv("SSH_PKCS11_HELPER");
+-		if (helper == NULL || strlen(helper) == 0)
+-			helper = _PATH_SSH_PKCS11_HELPER;
++		prog = getenv("SSH_PKCS11_HELPER");
++		if (prog == NULL || strlen(prog) == 0)
++			prog = _PATH_SSH_PKCS11_HELPER;
++		if (log_level_get() >= SYSLOG_LEVEL_DEBUG1)
++			verbosity = "-vvv";
+		debug("%s: starting %s %s", __func__, helper,
+		    verbosity == NULL ? "" : verbosity);
+-		execlp(helper, helper, verbosity, (char *)NULL);
+-		fprintf(stderr, "exec: %s: %s\n", helper, strerror(errno));
++		execlp(prog, prog, verbosity, (char *)NULL);
++		fprintf(stderr, "exec: %s: %s\n", prog, strerror(errno));
+		_exit(1);
+	}
+	close(pair[1]);
+-	fd = pair[0];
+-	return (0);
++	helper->fd = pair[0];
++	helper->path = xstrdup(path);
++	helper->pid = pid;
++	debug3("%s: helper %zu for \"%s\" on fd %d pid %ld", __func__, nhelpers,
++	    helper->path, helper->fd, (long)helper->pid);
++	helpers = xrecallocarray(helpers, nhelpers,
++	    nhelpers + 1, sizeof(*helpers));
++	helpers[nhelpers++] = helper;
++	return helper;
+ }
+
+ int
+@@ -322,9 +519,11 @@ pkcs11_add_provider(char *name, char *pin, struct sshkey ***keysp,
+	size_t blen;
+	u_int nkeys, i;
+	struct sshbuf *msg;
++	struct helper *helper;
+
+-	if (fd < 0 && pkcs11_start_helper() < 0)
+-		return (-1);
++	if ((helper = helper_by_provider(name)) == NULL &&
++	    (helper = pkcs11_start_helper(name)) == NULL)
++		return -1;
+
+	if ((msg = sshbuf_new()) == NULL)
+		fatal("%s: sshbuf_new failed", __func__);
+@@ -332,10 +531,10 @@ pkcs11_add_provider(char *name, char *pin, struct sshkey ***keysp,
+	    (r = sshbuf_put_cstring(msg, name)) != 0 ||
+	    (r = sshbuf_put_cstring(msg, pin)) != 0)
+		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+-	send_msg(msg);
++	send_msg(helper->fd, msg);
+	sshbuf_reset(msg);
+
+-	type = recv_msg(msg);
++	type = recv_msg(helper->fd, msg);
+	if (type == SSH2_AGENT_IDENTITIES_ANSWER) {
+		if ((r = sshbuf_get_u32(msg, &nkeys)) != 0)
+			fatal("%s: buffer error: %s", __func__, ssh_err(r));
+@@ -350,7 +549,7 @@ pkcs11_add_provider(char *name, char *pin, struct sshkey ***keysp,
+				    __func__, ssh_err(r));
+			if ((r = sshkey_from_blob(blob, blen, &k)) != 0)
+				fatal("%s: bad key: %s", __func__, ssh_err(r));
+-			wrap_key(k);
++			wrap_key(helper, k);
+			(*keysp)[i] = k;
+			if (labelsp)
+				(*labelsp)[i] = label;
+@@ -371,22 +570,15 @@ pkcs11_add_provider(char *name, char *pin, struct sshkey ***keysp,
+ int
+ pkcs11_del_provider(char *name)
+ {
+-	int r, ret = -1;
+-	struct sshbuf *msg;
+-
+-	if ((msg = sshbuf_new()) == NULL)
+-		fatal("%s: sshbuf_new failed", __func__);
+-	if ((r = sshbuf_put_u8(msg, SSH_AGENTC_REMOVE_SMARTCARD_KEY)) != 0 ||
+-	    (r = sshbuf_put_cstring(msg, name)) != 0 ||
+-	    (r = sshbuf_put_cstring(msg, "")) != 0)
+-		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+-	send_msg(msg);
+-	sshbuf_reset(msg);
+-
+-	if (recv_msg(msg) == SSH_AGENT_SUCCESS)
+-		ret = 0;
+-	sshbuf_free(msg);
+-	return (ret);
++	struct helper *helper;
++
++	/*
++	 * ssh-agent deletes keys before calling this, so the helper entry
++	 * should be gone before we get here.
++	 */
++	debug3("%s: delete %s", __func__, name);
++	if ((helper = helper_by_provider(name)) != NULL)
++		helper_terminate(helper);
++	return 0;
+ }
+-
+ #endif /* ENABLE_PKCS11 */
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-03.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-03.patch
new file mode 100644
index 0000000000..e16e5e245e
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-03.patch
@@ -0,0 +1,171 @@
+From 2f1be98e83feb90665b9292eff8bb734537fd491 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 14:02:27 +0000
+Subject: [PATCH 03/12] upstream: Ensure FIDO/PKCS11 libraries contain expected
+ symbols
+
+This checks via nlist(3) that candidate provider libraries contain one
+of the symbols that we will require prior to dlopen(), which can cause
+a number of side effects, including execution of constructors.
+
+Feedback deraadt; ok markus
+
+OpenBSD-Commit-ID: 1508a5fbd74e329e69a55b56c453c292029aefbe
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/29ef8a04866ca14688d5b7fed7b8b9deab851f77]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ misc.c       | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ misc.h       |  1 +
+ ssh-pkcs11.c |  4 +++
+ ssh-sk.c     |  6 ++--
+ 4 files changed, 86 insertions(+), 2 deletions(-)
+
+diff --git a/misc.c b/misc.c
+index 3a31d5c..8a107e4 100644
+--- a/misc.c
++++ b/misc.c
+@@ -28,6 +28,7 @@
+
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
++#include <sys/mman.h>
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+@@ -41,6 +42,9 @@
+ #ifdef HAVE_POLL_H
+ #include <poll.h>
+ #endif
++#ifdef HAVE_NLIST_H
++#include <nlist.h>
++#endif
+ #include <signal.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+@@ -2266,3 +2270,76 @@ ssh_signal(int signum, sshsig_t handler)
+	}
+	return osa.sa_handler;
+ }
++
++
++/*
++ * Returns zero if the library at 'path' contains symbol 's', nonzero
++ * otherwise.
++ */
++int
++lib_contains_symbol(const char *path, const char *s)
++{
++#ifdef HAVE_NLIST_H
++	struct nlist nl[2];
++	int ret = -1, r;
++
++	memset(nl, 0, sizeof(nl));
++	nl[0].n_name = xstrdup(s);
++	nl[1].n_name = NULL;
++	if ((r = nlist(path, nl)) == -1) {
++		error("%s: nlist failed for %s", __func__, path);
++		goto out;
++	}
++	if (r != 0 || nl[0].n_value == 0 || nl[0].n_type == 0) {
++		error("%s: library %s does not contain symbol %s", __func__, path, s);
++		goto out;
++	}
++	/* success */
++	ret = 0;
++ out:
++	free(nl[0].n_name);
++	return ret;
++#else /* HAVE_NLIST_H */
++	int fd, ret = -1;
++	struct stat st;
++	void *m = NULL;
++	size_t sz = 0;
++
++	memset(&st, 0, sizeof(st));
++	if ((fd = open(path, O_RDONLY)) < 0) {
++		error("%s: open %s: %s", __func__, path, strerror(errno));
++		return -1;
++	}
++	if (fstat(fd, &st) != 0) {
++		error("%s: fstat %s: %s", __func__, path, strerror(errno));
++		goto out;
++	}
++	if (!S_ISREG(st.st_mode)) {
++		error("%s: %s is not a regular file", __func__, path);
++		goto out;
++	}
++	if (st.st_size < 0 ||
++	    (size_t)st.st_size < strlen(s) ||
++	    st.st_size >= INT_MAX/2) {
++		error("%s: %s bad size %lld", __func__, path, (long long)st.st_size);
++		goto out;
++	}
++	sz = (size_t)st.st_size;
++	if ((m = mmap(NULL, sz, PROT_READ, MAP_PRIVATE, fd, 0)) == MAP_FAILED ||
++	    m == NULL) {
++		error("%s: mmap %s: %s", __func__, path, strerror(errno));
++		goto out;
++	}
++	if (memmem(m, sz, s, strlen(s)) == NULL) {
++		error("%s: %s does not contain expected string %s", __func__, path, s);
++		goto out;
++	}
++	/* success */
++	ret = 0;
++ out:
++	if (m != NULL && m != MAP_FAILED)
++		munmap(m, sz);
++	close(fd);
++	return ret;
++#endif /* HAVE_NLIST_H */
++}
+diff --git a/misc.h b/misc.h
+index 4a05db2..3f9f4db 100644
+--- a/misc.h
++++ b/misc.h
+@@ -86,6 +86,7 @@ const char *atoi_err(const char *, int *);
+ int	 parse_absolute_time(const char *, uint64_t *);
+ void	 format_absolute_time(uint64_t, char *, size_t);
+ int	 path_absolute(const char *);
++int	 lib_contains_symbol(const char *, const char *);
+
+ void	 sock_set_v6only(int);
+
+diff --git a/ssh-pkcs11.c b/ssh-pkcs11.c
+index b56a41b..639a6f7 100644
+--- a/ssh-pkcs11.c
++++ b/ssh-pkcs11.c
+@@ -1499,6 +1499,10 @@ pkcs11_register_provider(char *provider_id, char *pin,
+		    __func__, provider_id);
+		goto fail;
+	}
++	if (lib_contains_symbol(provider_id, "C_GetFunctionList") != 0) {
++		error("provider %s is not a PKCS11 library", provider_id);
++		goto fail;
++	}
+	/* open shared pkcs11-library */
+	if ((handle = dlopen(provider_id, RTLD_NOW)) == NULL) {
+		error("dlopen %s failed: %s", provider_id, dlerror());
+diff --git a/ssh-sk.c b/ssh-sk.c
+index 5ff9381..9df12cc 100644
+--- a/ssh-sk.c
++++ b/ssh-sk.c
+@@ -119,10 +119,12 @@ sshsk_open(const char *path)
+ #endif
+		return ret;
+	}
+-	if ((ret->dlhandle = dlopen(path, RTLD_NOW)) == NULL) {
+-		error("Provider \"%s\" dlopen failed: %s", path, dlerror());
++	if (lib_contains_symbol(path, "sk_api_version") != 0) {
++		error("provider %s is not an OpenSSH FIDO library", path);
+		goto fail;
+	}
++	if ((ret->dlhandle = dlopen(path, RTLD_NOW)) == NULL)
++		fatal("Provider \"%s\" dlopen failed: %s", path, dlerror());
+	if ((ret->sk_api_version = dlsym(ret->dlhandle,
+	    "sk_api_version")) == NULL) {
+		error("Provider \"%s\" dlsym(sk_api_version) failed: %s",
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-04.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-04.patch
new file mode 100644
index 0000000000..5e8040c9bf
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-04.patch
@@ -0,0 +1,34 @@
+From 0862f338941bfdfb2cadee87de6d5fdca1b8f457 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 13:55:53 +0000
+Subject: [PATCH 04/12] upstream: terminate process if requested to load a
+ PKCS#11 provider that isn't a PKCS#11 provider; from / ok markus@
+
+OpenBSD-Commit-ID: 39532cf18b115881bb4cfaee32084497aadfa05c
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/892506b13654301f69f9545f48213fc210e5c5cc]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-pkcs11.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/ssh-pkcs11.c b/ssh-pkcs11.c
+index 639a6f7..7530acc 100644
+--- a/ssh-pkcs11.c
++++ b/ssh-pkcs11.c
+@@ -1508,10 +1508,8 @@ pkcs11_register_provider(char *provider_id, char *pin,
+		error("dlopen %s failed: %s", provider_id, dlerror());
+		goto fail;
+	}
+-	if ((getfunctionlist = dlsym(handle, "C_GetFunctionList")) == NULL) {
+-		error("dlsym(C_GetFunctionList) failed: %s", dlerror());
+-		goto fail;
+-	}
++	if ((getfunctionlist = dlsym(handle, "C_GetFunctionList")) == NULL)
++		fatal("dlsym(C_GetFunctionList) failed: %s", dlerror());
+	p = xcalloc(1, sizeof(*p));
+	p->name = xstrdup(provider_id);
+	p->handle = handle;
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-05.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-05.patch
new file mode 100644
index 0000000000..0ddbdc68d4
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-05.patch
@@ -0,0 +1,194 @@
+From a6cee3905edf070c0de135d3f2ee5b74da1dbd28 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 26 May 2020 01:26:58 +0000
+Subject: [PATCH 05/12] upstream: Restrict ssh-agent from signing web
+ challenges for FIDO
+
+keys.
+
+When signing messages in ssh-agent using a FIDO key that has an
+application string that does not start with "ssh:", ensure that the
+message being signed is one of the forms expected for the SSH protocol
+(currently pubkey authentication and sshsig signatures).
+
+This prevents ssh-agent forwarding on a host that has FIDO keys
+attached granting the ability for the remote side to sign challenges
+for web authentication using those keys too.
+
+Note that the converse case of web browsers signing SSH challenges is
+already precluded because no web RP can have the "ssh:" prefix in the
+application string that we require.
+
+ok markus@
+
+OpenBSD-Commit-ID: 9ab6012574ed0352d2f097d307f4a988222d1b19
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/0c111eb84efba7c2a38b2cc3278901a0123161b9]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-agent.c | 110 +++++++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 100 insertions(+), 10 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index ceb348c..1794f35 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-agent.c,v 1.255 2020/02/06 22:30:54 naddy Exp $ */
++/* $OpenBSD: ssh-agent.c,v 1.258 2020/05/26 01:26:58 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -77,6 +77,7 @@
+
+ #include "xmalloc.h"
+ #include "ssh.h"
++#include "ssh2.h"
+ #include "sshbuf.h"
+ #include "sshkey.h"
+ #include "authfd.h"
+@@ -167,6 +168,9 @@ static long lifetime = 0;
+
+ static int fingerprint_hash = SSH_FP_HASH_DEFAULT;
+
++/* Refuse signing of non-SSH messages for web-origin FIDO keys */
++static int restrict_websafe = 1;
++
+ static void
+ close_socket(SocketEntry *e)
+ {
+@@ -282,6 +286,80 @@ agent_decode_alg(struct sshkey *key, u_int flags)
+	return NULL;
+ }
+
++/*
++ * This function inspects a message to be signed by a FIDO key that has a
++ * web-like application string (i.e. one that does not begin with "ssh:".
++ * It checks that the message is one of those expected for SSH operations
++ * (pubkey userauth, sshsig, CA key signing) to exclude signing challenges
++ * for the web.
++ */
++static int
++check_websafe_message_contents(struct sshkey *key,
++    const u_char *msg, size_t len)
++{
++	int matched = 0;
++	struct sshbuf *b;
++	u_char m, n;
++	char *cp1 = NULL, *cp2 = NULL;
++	int r;
++	struct sshkey *mkey = NULL;
++
++	if ((b = sshbuf_from(msg, len)) == NULL)
++		fatal("%s: sshbuf_new", __func__);
++
++	/* SSH userauth request */
++	if ((r = sshbuf_get_string_direct(b, NULL, NULL)) == 0 && /* sess_id */
++	    (r = sshbuf_get_u8(b, &m)) == 0 && /* SSH2_MSG_USERAUTH_REQUEST */
++	    (r = sshbuf_get_cstring(b, NULL, NULL)) == 0 && /* server user */
++	    (r = sshbuf_get_cstring(b, &cp1, NULL)) == 0 && /* service */
++	    (r = sshbuf_get_cstring(b, &cp2, NULL)) == 0 && /* method */
++	    (r = sshbuf_get_u8(b, &n)) == 0 && /* sig-follows */
++	    (r = sshbuf_get_cstring(b, NULL, NULL)) == 0 && /* alg */
++	    (r = sshkey_froms(b, &mkey)) == 0 && /* key */
++	    sshbuf_len(b) == 0) {
++		debug("%s: parsed userauth", __func__);
++		if (m == SSH2_MSG_USERAUTH_REQUEST && n == 1 &&
++		    strcmp(cp1, "ssh-connection") == 0 &&
++		    strcmp(cp2, "publickey") == 0 &&
++		    sshkey_equal(key, mkey)) {
++			debug("%s: well formed userauth", __func__);
++			matched = 1;
++		}
++	}
++	free(cp1);
++	free(cp2);
++	sshkey_free(mkey);
++	sshbuf_free(b);
++	if (matched)
++		return 1;
++
++	if ((b = sshbuf_from(msg, len)) == NULL)
++		fatal("%s: sshbuf_new", __func__);
++	cp1 = cp2 = NULL;
++	mkey = NULL;
++
++	/* SSHSIG */
++	if ((r = sshbuf_cmp(b, 0, "SSHSIG", 6)) == 0 &&
++	    (r = sshbuf_consume(b, 6)) == 0 &&
++	    (r = sshbuf_get_cstring(b, NULL, NULL)) == 0 && /* namespace */
++	    (r = sshbuf_get_string_direct(b, NULL, NULL)) == 0 && /* reserved */
++	    (r = sshbuf_get_cstring(b, NULL, NULL)) == 0 && /* hashalg */
++	    (r = sshbuf_get_string_direct(b, NULL, NULL)) == 0 && /* H(msg) */
++	    sshbuf_len(b) == 0) {
++		debug("%s: parsed sshsig", __func__);
++		matched = 1;
++	}
++
++	sshbuf_free(b);
++	if (matched)
++		return 1;
++
++	/* XXX CA signature operation */
++
++	error("web-origin key attempting to sign non-SSH message");
++	return 0;
++}
++
+ /* ssh2 only */
+ static void
+ process_sign_request2(SocketEntry *e)
+@@ -314,14 +392,20 @@ process_sign_request2(SocketEntry *e)
+		verbose("%s: user refused key", __func__);
+		goto send;
+	}
+-	if (sshkey_is_sk(id->key) &&
+-	    (id->key->sk_flags & SSH_SK_USER_PRESENCE_REQD)) {
+-		if ((fp = sshkey_fingerprint(key, SSH_FP_HASH_DEFAULT,
+-		    SSH_FP_DEFAULT)) == NULL)
+-			fatal("%s: fingerprint failed", __func__);
+-		notifier = notify_start(0,
+-		    "Confirm user presence for key %s %s",
+-		    sshkey_type(id->key), fp);
++	if (sshkey_is_sk(id->key)) {
++		if (strncmp(id->key->sk_application, "ssh:", 4) != 0 &&
++		    !check_websafe_message_contents(key, data, dlen)) {
++			/* error already logged */
++			goto send;
++		}
++		if ((id->key->sk_flags & SSH_SK_USER_PRESENCE_REQD)) {
++			if ((fp = sshkey_fingerprint(key, SSH_FP_HASH_DEFAULT,
++			    SSH_FP_DEFAULT)) == NULL)
++				fatal("%s: fingerprint failed", __func__);
++			notifier = notify_start(0,
++			    "Confirm user presence for key %s %s",
++			    sshkey_type(id->key), fp);
++		}
+	}
+	if ((r = sshkey_sign(id->key, &signature, &slen,
+	    data, dlen, agent_decode_alg(key, flags),
+@@ -1214,7 +1298,7 @@ main(int ac, char **av)
+	__progname = ssh_get_progname(av[0]);
+	seed_rng();
+
+-	while ((ch = getopt(ac, av, "cDdksE:a:P:t:")) != -1) {
++	while ((ch = getopt(ac, av, "cDdksE:a:O:P:t:")) != -1) {
+		switch (ch) {
+		case 'E':
+			fingerprint_hash = ssh_digest_alg_by_name(optarg);
+@@ -1229,6 +1313,12 @@ main(int ac, char **av)
+		case 'k':
+			k_flag++;
+			break;
++		case 'O':
++			if (strcmp(optarg, "no-restrict-websafe") == 0)
++				restrict_websafe  = 0;
++			else
++				fatal("Unknown -O option");
++			break;
+		case 'P':
+			if (provider_whitelist != NULL)
+				fatal("-P option already specified");
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-06.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-06.patch
new file mode 100644
index 0000000000..ac494aab0b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-06.patch
@@ -0,0 +1,73 @@
+From a5d845b7b42861d18f43e83de9f24c7374d1b458 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 18 Sep 2020 08:16:38 +0000
+Subject: [PATCH 06/12] upstream: handle multiple messages in a single read()
+
+PR#183 by Dennis Kaarsemaker; feedback and ok markus@
+
+OpenBSD-Commit-ID: 8570bb4d02d00cf70b98590716ea6a7d1cce68d1
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/52a03e9fca2d74eef953ddd4709250f365ca3975]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-agent.c | 19 +++++++++++++------
+ 1 file changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 1794f35..78f7268 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-agent.c,v 1.258 2020/05/26 01:26:58 djm Exp $ */
++/* $OpenBSD: ssh-agent.c,v 1.264 2020/09/18 08:16:38 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -853,8 +853,10 @@ send:
+ }
+ #endif /* ENABLE_PKCS11 */
+
+-/* dispatch incoming messages */
+-
++/*
++ * dispatch incoming message.
++ * returns 1 on success, 0 for incomplete messages or -1 on error.
++ */
+ static int
+ process_message(u_int socknum)
+ {
+@@ -908,7 +910,7 @@ process_message(u_int socknum)
+			/* send a fail message for all other request types */
+			send_status(e, 0);
+		}
+-		return 0;
++		return 1;
+	}
+
+	switch (type) {
+@@ -952,7 +954,7 @@ process_message(u_int socknum)
+		send_status(e, 0);
+		break;
+	}
+-	return 0;
++	return 1;
+ }
+
+ static void
+@@ -1043,7 +1045,12 @@ handle_conn_read(u_int socknum)
+	if ((r = sshbuf_put(sockets[socknum].input, buf, len)) != 0)
+		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+	explicit_bzero(buf, sizeof(buf));
+-	process_message(socknum);
++	for (;;) {
++		if ((r = process_message(socknum)) == -1)
++			return -1;
++		else if (r == 0)
++			break;
++	}
+	return 0;
+ }
+
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-07.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-07.patch
new file mode 100644
index 0000000000..0dcf23ae17
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-07.patch
@@ -0,0 +1,125 @@
+From 653cc18c922fc387b3d3aa1b081c5e5283cce28a Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 26 Jan 2021 00:47:47 +0000
+Subject: [PATCH 07/12] upstream: use recallocarray to allocate the agent
+ sockets table;
+
+also clear socket entries that are being marked as unused.
+
+spinkle in some debug2() spam to make it easier to watch an agent
+do its thing.
+
+ok markus
+
+OpenBSD-Commit-ID: 74582c8e82e96afea46f6c7b6813a429cbc75922
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/1fe16fd61bb53944ec510882acc0491abd66ff76]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-agent.c | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 78f7268..2635bc5 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-agent.c,v 1.264 2020/09/18 08:16:38 djm Exp $ */
++/* $OpenBSD: ssh-agent.c,v 1.269 2021/01/26 00:47:47 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -175,11 +175,12 @@ static void
+ close_socket(SocketEntry *e)
+ {
+	close(e->fd);
+-	e->fd = -1;
+-	e->type = AUTH_UNUSED;
+	sshbuf_free(e->input);
+	sshbuf_free(e->output);
+	sshbuf_free(e->request);
++	memset(e, '\0', sizeof(*e));
++	e->fd = -1;
++	e->type = AUTH_UNUSED;
+ }
+
+ static void
+@@ -249,6 +250,8 @@ process_request_identities(SocketEntry *e)
+	struct sshbuf *msg;
+	int r;
+
++	debug2("%s: entering", __func__);
++
+	if ((msg = sshbuf_new()) == NULL)
+		fatal("%s: sshbuf_new failed", __func__);
+	if ((r = sshbuf_put_u8(msg, SSH2_AGENT_IDENTITIES_ANSWER)) != 0 ||
+@@ -441,6 +444,7 @@ process_remove_identity(SocketEntry *e)
+	struct sshkey *key = NULL;
+	Identity *id;
+
++	debug2("%s: entering", __func__);
+	if ((r = sshkey_froms(e->request, &key)) != 0) {
+		error("%s: get key: %s", __func__, ssh_err(r));
+		goto done;
+@@ -467,6 +471,7 @@ process_remove_all_identities(SocketEntry *e)
+ {
+	Identity *id;
+
++	debug2("%s: entering", __func__);
+	/* Loop over all identities and clear the keys. */
+	for (id = TAILQ_FIRST(&idtab->idlist); id;
+	    id = TAILQ_FIRST(&idtab->idlist)) {
+@@ -520,6 +525,7 @@ process_add_identity(SocketEntry *e)
+	u_char ctype;
+	int r = SSH_ERR_INTERNAL_ERROR;
+
++	debug2("%s: entering", __func__);
+	if ((r = sshkey_private_deserialize(e->request, &k)) != 0 ||
+	    k == NULL ||
+	    (r = sshbuf_get_cstring(e->request, &comment, NULL)) != 0) {
+@@ -667,6 +673,7 @@ process_lock_agent(SocketEntry *e, int lock)
+	static u_int fail_count = 0;
+	size_t pwlen;
+
++	debug2("%s: entering", __func__);
+	/*
+	 * This is deliberately fatal: the user has requested that we lock,
+	 * but we can't parse their request properly. The only safe thing to
+@@ -738,6 +745,7 @@ process_add_smartcard_key(SocketEntry *e)
+	struct sshkey **keys = NULL, *k;
+	Identity *id;
+
++	debug2("%s: entering", __func__);
+	if ((r = sshbuf_get_cstring(e->request, &provider, NULL)) != 0 ||
+	    (r = sshbuf_get_cstring(e->request, &pin, NULL)) != 0) {
+		error("%s: buffer error: %s", __func__, ssh_err(r));
+@@ -818,6 +826,7 @@ process_remove_smartcard_key(SocketEntry *e)
+	int r, success = 0;
+	Identity *id, *nxt;
+
++	debug2("%s: entering", __func__);
+	if ((r = sshbuf_get_cstring(e->request, &provider, NULL)) != 0 ||
+	    (r = sshbuf_get_cstring(e->request, &pin, NULL)) != 0) {
+		error("%s: buffer error: %s", __func__, ssh_err(r));
+@@ -962,6 +971,8 @@ new_socket(sock_type type, int fd)
+ {
+	u_int i, old_alloc, new_alloc;
+
++	debug("%s: type = %s", __func__, type == AUTH_CONNECTION ? "CONNECTION" :
++	    (type == AUTH_SOCKET ? "SOCKET" : "UNKNOWN"));
+	set_nonblock(fd);
+
+	if (fd > max_fd)
+@@ -981,7 +992,8 @@ new_socket(sock_type type, int fd)
+		}
+	old_alloc = sockets_alloc;
+	new_alloc = sockets_alloc + 10;
+-	sockets = xreallocarray(sockets, new_alloc, sizeof(sockets[0]));
++	sockets = xrecallocarray(sockets, old_alloc, new_alloc,
++	    sizeof(sockets[0]));
+	for (i = old_alloc; i < new_alloc; i++)
+		sockets[i].type = AUTH_UNUSED;
+	sockets_alloc = new_alloc;
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-08.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-08.patch
new file mode 100644
index 0000000000..141c8113bf
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-08.patch
@@ -0,0 +1,315 @@
+From c30158ea225cf8ad67c3dcc88fa9e4afbf8959a7 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 26 Jan 2021 00:53:31 +0000
+Subject: [PATCH 08/12] upstream: more ssh-agent refactoring
+
+Allow confirm_key() to accept an additional reason suffix
+
+Factor publickey userauth parsing out into its own function and allow
+it to optionally return things it parsed out of the message to its
+caller.
+
+feedback/ok markus@
+
+OpenBSD-Commit-ID: 29006515617d1aa2d8b85cd2bf667e849146477e
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/e0e8bee8024fa9e31974244d14f03d799e5c0775]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-agent.c | 197 ++++++++++++++++++++++++++++++++++------------------
+ 1 file changed, 130 insertions(+), 67 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 2635bc5..7ad323c 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-agent.c,v 1.269 2021/01/26 00:47:47 djm Exp $ */
++/* $OpenBSD: ssh-agent.c,v 1.270 2021/01/26 00:53:31 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -216,15 +216,16 @@ lookup_identity(struct sshkey *key)
+
+ /* Check confirmation of keysign request */
+ static int
+-confirm_key(Identity *id)
++confirm_key(Identity *id, const char *extra)
+ {
+	char *p;
+	int ret = -1;
+
+	p = sshkey_fingerprint(id->key, fingerprint_hash, SSH_FP_DEFAULT);
+	if (p != NULL &&
+-	    ask_permission("Allow use of key %s?\nKey fingerprint %s.",
+-	    id->comment, p))
++	    ask_permission("Allow use of key %s?\nKey fingerprint %s.%s%s",
++	    id->comment, p,
++	    extra == NULL ? "" : "\n", extra == NULL ? "" : extra))
+		ret = 0;
+	free(p);
+
+@@ -290,74 +291,133 @@ agent_decode_alg(struct sshkey *key, u_int flags)
+ }
+
+ /*
+- * This function inspects a message to be signed by a FIDO key that has a
+- * web-like application string (i.e. one that does not begin with "ssh:".
+- * It checks that the message is one of those expected for SSH operations
+- * (pubkey userauth, sshsig, CA key signing) to exclude signing challenges
+- * for the web.
++ * Attempt to parse the contents of a buffer as a SSH publickey userauth
++ * request, checking its contents for consistency and matching the embedded
++ * key against the one that is being used for signing.
++ * Note: does not modify msg buffer.
++ * Optionally extract the username and session ID from the request.
+  */
+ static int
+-check_websafe_message_contents(struct sshkey *key,
+-    const u_char *msg, size_t len)
++parse_userauth_request(struct sshbuf *msg, const struct sshkey *expected_key,
++    char **userp, struct sshbuf **sess_idp)
+ {
+-	int matched = 0;
+-	struct sshbuf *b;
+-	u_char m, n;
+-	char *cp1 = NULL, *cp2 = NULL;
++	struct sshbuf *b = NULL, *sess_id = NULL;
++	char *user = NULL, *service = NULL, *method = NULL, *pkalg = NULL;
+	int r;
++	u_char t, sig_follows;
+	struct sshkey *mkey = NULL;
+
+-	if ((b = sshbuf_from(msg, len)) == NULL)
+-		fatal("%s: sshbuf_new", __func__);
++	if (userp != NULL)
++		*userp = NULL;
++	if (sess_idp != NULL)
++		*sess_idp = NULL;
++	if ((b = sshbuf_fromb(msg)) == NULL)
++		fatal("%s: sshbuf_fromb", __func__);
+
+	/* SSH userauth request */
+-	if ((r = sshbuf_get_string_direct(b, NULL, NULL)) == 0 && /* sess_id */
+-	    (r = sshbuf_get_u8(b, &m)) == 0 && /* SSH2_MSG_USERAUTH_REQUEST */
+-	    (r = sshbuf_get_cstring(b, NULL, NULL)) == 0 && /* server user */
+-	    (r = sshbuf_get_cstring(b, &cp1, NULL)) == 0 && /* service */
+-	    (r = sshbuf_get_cstring(b, &cp2, NULL)) == 0 && /* method */
+-	    (r = sshbuf_get_u8(b, &n)) == 0 && /* sig-follows */
+-	    (r = sshbuf_get_cstring(b, NULL, NULL)) == 0 && /* alg */
+-	    (r = sshkey_froms(b, &mkey)) == 0 && /* key */
+-	    sshbuf_len(b) == 0) {
+-		debug("%s: parsed userauth", __func__);
+-		if (m == SSH2_MSG_USERAUTH_REQUEST && n == 1 &&
+-		    strcmp(cp1, "ssh-connection") == 0 &&
+-		    strcmp(cp2, "publickey") == 0 &&
+-		    sshkey_equal(key, mkey)) {
+-			debug("%s: well formed userauth", __func__);
+-			matched = 1;
+-		}
++	if ((r = sshbuf_froms(b, &sess_id)) != 0)
++		goto out;
++	if (sshbuf_len(sess_id) == 0) {
++		r = SSH_ERR_INVALID_FORMAT;
++		goto out;
+	}
+-	free(cp1);
+-	free(cp2);
+-	sshkey_free(mkey);
++	if ((r = sshbuf_get_u8(b, &t)) != 0 || /* SSH2_MSG_USERAUTH_REQUEST */
++	    (r = sshbuf_get_cstring(b, &user, NULL)) != 0 || /* server user */
++	    (r = sshbuf_get_cstring(b, &service, NULL)) != 0 || /* service */
++	    (r = sshbuf_get_cstring(b, &method, NULL)) != 0 || /* method */
++	    (r = sshbuf_get_u8(b, &sig_follows)) != 0 || /* sig-follows */
++	    (r = sshbuf_get_cstring(b, &pkalg, NULL)) != 0 || /* alg */
++	    (r = sshkey_froms(b, &mkey)) != 0) /* key */
++		goto out;
++	if (t != SSH2_MSG_USERAUTH_REQUEST ||
++	    sig_follows != 1 ||
++	    strcmp(service, "ssh-connection") != 0 ||
++	    !sshkey_equal(expected_key, mkey) ||
++	    sshkey_type_from_name(pkalg) != expected_key->type) {
++		r = SSH_ERR_INVALID_FORMAT;
++		goto out;
++	}
++	if (strcmp(method, "publickey") != 0) {
++		r = SSH_ERR_INVALID_FORMAT;
++		goto out;
++	}
++	if (sshbuf_len(b) != 0) {
++		r = SSH_ERR_INVALID_FORMAT;
++		goto out;
++	}
++	/* success */
++	r = 0;
++	debug("%s: well formed userauth", __func__);
++	if (userp != NULL) {
++		*userp = user;
++		user = NULL;
++	}
++	if (sess_idp != NULL) {
++		*sess_idp = sess_id;
++		sess_id = NULL;
++	}
++ out:
+	sshbuf_free(b);
+-	if (matched)
+-		return 1;
++	sshbuf_free(sess_id);
++	free(user);
++	free(service);
++	free(method);
++	free(pkalg);
++	sshkey_free(mkey);
++	return r;
++}
+
+-	if ((b = sshbuf_from(msg, len)) == NULL)
+-		fatal("%s: sshbuf_new", __func__);
+-	cp1 = cp2 = NULL;
+-	mkey = NULL;
+-
+-	/* SSHSIG */
+-	if ((r = sshbuf_cmp(b, 0, "SSHSIG", 6)) == 0 &&
+-	    (r = sshbuf_consume(b, 6)) == 0 &&
+-	    (r = sshbuf_get_cstring(b, NULL, NULL)) == 0 && /* namespace */
+-	    (r = sshbuf_get_string_direct(b, NULL, NULL)) == 0 && /* reserved */
+-	    (r = sshbuf_get_cstring(b, NULL, NULL)) == 0 && /* hashalg */
+-	    (r = sshbuf_get_string_direct(b, NULL, NULL)) == 0 && /* H(msg) */
+-	    sshbuf_len(b) == 0) {
+-		debug("%s: parsed sshsig", __func__);
+-		matched = 1;
+-	}
++/*
++ * Attempt to parse the contents of a buffer as a SSHSIG signature request.
++ * Note: does not modify buffer.
++ */
++static int
++parse_sshsig_request(struct sshbuf *msg)
++{
++	int r;
++	struct sshbuf *b;
+
++	if ((b = sshbuf_fromb(msg)) == NULL)
++		fatal("%s: sshbuf_fromb", __func__);
++
++	if ((r = sshbuf_cmp(b, 0, "SSHSIG", 6)) != 0 ||
++	    (r = sshbuf_consume(b, 6)) != 0 ||
++	    (r = sshbuf_get_cstring(b, NULL, NULL)) != 0 || /* namespace */
++	    (r = sshbuf_get_string_direct(b, NULL, NULL)) != 0 || /* reserved */
++	    (r = sshbuf_get_cstring(b, NULL, NULL)) != 0 || /* hashalg */
++	    (r = sshbuf_get_string_direct(b, NULL, NULL)) != 0) /* H(msg) */
++		goto out;
++	if (sshbuf_len(b) != 0) {
++		r = SSH_ERR_INVALID_FORMAT;
++		goto out;
++	}
++	/* success */
++	r = 0;
++ out:
+	sshbuf_free(b);
+-	if (matched)
++	return r;
++}
++
++/*
++ * This function inspects a message to be signed by a FIDO key that has a
++ * web-like application string (i.e. one that does not begin with "ssh:".
++ * It checks that the message is one of those expected for SSH operations
++ * (pubkey userauth, sshsig, CA key signing) to exclude signing challenges
++ * for the web.
++ */
++static int
++check_websafe_message_contents(struct sshkey *key, struct sshbuf *data)
++{
++	if (parse_userauth_request(data, key, NULL, NULL) == 0) {
++		debug("%s: signed data matches public key userauth request", __func__);
+		return 1;
++	}
++	if (parse_sshsig_request(data) == 0) {
++		debug("%s: signed data matches SSHSIG signature request", __func__);
++		return 1;
++	}
+
+-	/* XXX CA signature operation */
++	/* XXX check CA signature operation */
+
+	error("web-origin key attempting to sign non-SSH message");
+	return 0;
+@@ -367,21 +427,22 @@ check_websafe_message_contents(struct sshkey *key,
+ static void
+ process_sign_request2(SocketEntry *e)
+ {
+-	const u_char *data;
+	u_char *signature = NULL;
+-	size_t dlen, slen = 0;
++	size_t i, slen = 0;
+	u_int compat = 0, flags;
+	int r, ok = -1;
+	char *fp = NULL;
+-	struct sshbuf *msg;
++	struct sshbuf *msg = NULL, *data = NULL;
+	struct sshkey *key = NULL;
+	struct identity *id;
+	struct notifier_ctx *notifier = NULL;
+
+-	if ((msg = sshbuf_new()) == NULL)
++	debug("%s: entering", __func__);
++
++	if ((msg = sshbuf_new()) == NULL | (data = sshbuf_new()) == NULL)
+		fatal("%s: sshbuf_new failed", __func__);
+	if ((r = sshkey_froms(e->request, &key)) != 0 ||
+-	    (r = sshbuf_get_string_direct(e->request, &data, &dlen)) != 0 ||
++	    (r = sshbuf_get_stringb(e->request, data)) != 0 ||
+	    (r = sshbuf_get_u32(e->request, &flags)) != 0) {
+		error("%s: couldn't parse request: %s", __func__, ssh_err(r));
+		goto send;
+@@ -391,13 +452,13 @@ process_sign_request2(SocketEntry *e)
+		verbose("%s: %s key not found", __func__, sshkey_type(key));
+		goto send;
+	}
+-	if (id->confirm && confirm_key(id) != 0) {
++	if (id->confirm && confirm_key(id, NULL) != 0) {
+		verbose("%s: user refused key", __func__);
+		goto send;
+	}
+	if (sshkey_is_sk(id->key)) {
+		if (strncmp(id->key->sk_application, "ssh:", 4) != 0 &&
+-		    !check_websafe_message_contents(key, data, dlen)) {
++		    !check_websafe_message_contents(key, data)) {
+			/* error already logged */
+			goto send;
+		}
+@@ -411,7 +472,7 @@ process_sign_request2(SocketEntry *e)
+		}
+	}
+	if ((r = sshkey_sign(id->key, &signature, &slen,
+-	    data, dlen, agent_decode_alg(key, flags),
++	    sshbuf_ptr(data), sshbuf_len(data), agent_decode_alg(key, flags),
+	    id->sk_provider, compat)) != 0) {
+		error("%s: sshkey_sign: %s", __func__, ssh_err(r));
+		goto send;
+@@ -420,8 +481,7 @@ process_sign_request2(SocketEntry *e)
+	ok = 0;
+  send:
+	notify_complete(notifier);
+-	sshkey_free(key);
+-	free(fp);
++
+	if (ok == 0) {
+		if ((r = sshbuf_put_u8(msg, SSH2_AGENT_SIGN_RESPONSE)) != 0 ||
+		    (r = sshbuf_put_string(msg, signature, slen)) != 0)
+@@ -432,7 +492,10 @@ process_sign_request2(SocketEntry *e)
+	if ((r = sshbuf_put_stringb(e->output, msg)) != 0)
+		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+
++	sshbuf_free(data);
+	sshbuf_free(msg);
++	sshkey_free(key);
++	free(fp);
+	free(signature);
+ }
+
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-09.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-09.patch
new file mode 100644
index 0000000000..b519ccce42
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-09.patch
@@ -0,0 +1,38 @@
+From 7adba46611e5d076d7d12d9f4162dd4cabd5ff50 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 29 Jan 2021 06:28:10 +0000
+Subject: [PATCH 09/12] upstream: give typedef'd struct a struct name; makes
+ the fuzzer I'm
+
+writing a bit easier
+
+OpenBSD-Commit-ID: 1052ab521505a4d8384d67acb3974ef81b8896cb
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/8afaa7d7918419d3da6c0477b83db2159879cb33]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-agent.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 7ad323c..c99927c 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-agent.c,v 1.270 2021/01/26 00:53:31 djm Exp $ */
++/* $OpenBSD: ssh-agent.c,v 1.274 2021/01/29 06:28:10 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -108,7 +108,7 @@ typedef enum {
+	AUTH_CONNECTION
+ } sock_type;
+
+-typedef struct {
++typedef struct socket_entry {
+	int fd;
+	sock_type type;
+	struct sshbuf *input;
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-10.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-10.patch
new file mode 100644
index 0000000000..27b2eadfae
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-10.patch
@@ -0,0 +1,39 @@
+From 343e2a2c0ef754a7a86118016b248f7a73f8d510 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 29 Jan 2021 06:29:46 +0000
+Subject: [PATCH 10/12] upstream: fix the values of enum sock_type
+
+OpenBSD-Commit-ID: 18d048f4dbfbb159ff500cfc2700b8fb1407facd
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/1a4b92758690faa12f49079dd3b72567f909466d]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-agent.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index c99927c..7f1e14b 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-agent.c,v 1.274 2021/01/29 06:28:10 djm Exp $ */
++/* $OpenBSD: ssh-agent.c,v 1.275 2021/01/29 06:29:46 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -103,9 +103,9 @@
+ #define AGENT_RBUF_LEN	(4096)
+
+ typedef enum {
+-	AUTH_UNUSED,
+-	AUTH_SOCKET,
+-	AUTH_CONNECTION
++	AUTH_UNUSED = 0,
++	AUTH_SOCKET = 1,
++	AUTH_CONNECTION = 2,
+ } sock_type;
+
+ typedef struct socket_entry {
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-11.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-11.patch
new file mode 100644
index 0000000000..c300393ebf
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-11.patch
@@ -0,0 +1,307 @@
+From 2b3b369c8cf71f9ef5942a5e074e6f86e7ca1e0c Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 19 Dec 2021 22:09:23 +0000
+Subject: [PATCH 11/12] upstream: ssh-agent side of binding
+
+record session ID/hostkey/forwarding status for each active socket.
+
+Attempt to parse data-to-be-signed at signature request time and extract
+session ID from the blob if it is a pubkey userauth request.
+
+ok markus@
+
+OpenBSD-Commit-ID: a80fd41e292b18b67508362129e9fed549abd318
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/4c1e3ce85e183a9d0c955c88589fed18e4d6a058]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ authfd.h    |   3 +
+ ssh-agent.c | 175 +++++++++++++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 170 insertions(+), 8 deletions(-)
+
+diff --git a/authfd.h b/authfd.h
+index c3bf625..9cc9807 100644
+--- a/authfd.h
++++ b/authfd.h
+@@ -76,6 +76,9 @@ int	ssh_agent_sign(int sock, const struct sshkey *key,
+ #define SSH2_AGENTC_ADD_ID_CONSTRAINED		25
+ #define SSH_AGENTC_ADD_SMARTCARD_KEY_CONSTRAINED 26
+
++/* generic extension mechanism */
++#define SSH_AGENTC_EXTENSION			27
++
+ #define	SSH_AGENT_CONSTRAIN_LIFETIME		1
+ #define	SSH_AGENT_CONSTRAIN_CONFIRM		2
+ #define	SSH_AGENT_CONSTRAIN_MAXSIGN		3
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 7f1e14b..01c7f2b 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-agent.c,v 1.275 2021/01/29 06:29:46 djm Exp $ */
++/* $OpenBSD: ssh-agent.c,v 1.280 2021/12/19 22:09:23 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -98,9 +98,15 @@
+ #endif
+
+ /* Maximum accepted message length */
+-#define AGENT_MAX_LEN	(256*1024)
++#define AGENT_MAX_LEN		(256*1024)
+ /* Maximum bytes to read from client socket */
+-#define AGENT_RBUF_LEN	(4096)
++#define AGENT_RBUF_LEN		(4096)
++/* Maximum number of recorded session IDs/hostkeys per connection */
++#define AGENT_MAX_SESSION_IDS		16
++/* Maximum size of session ID */
++#define AGENT_MAX_SID_LEN		128
++
++/* XXX store hostkey_sid in a refcounted tree */
+
+ typedef enum {
+	AUTH_UNUSED = 0,
+@@ -108,12 +114,20 @@ typedef enum {
+	AUTH_CONNECTION = 2,
+ } sock_type;
+
++struct hostkey_sid {
++	struct sshkey *key;
++	struct sshbuf *sid;
++	int forwarded;
++};
++
+ typedef struct socket_entry {
+	int fd;
+	sock_type type;
+	struct sshbuf *input;
+	struct sshbuf *output;
+	struct sshbuf *request;
++	size_t nsession_ids;
++	struct hostkey_sid *session_ids;
+ } SocketEntry;
+
+ u_int sockets_alloc = 0;
+@@ -174,10 +188,17 @@ static int restrict_websafe = 1;
+ static void
+ close_socket(SocketEntry *e)
+ {
++	size_t i;
++
+	close(e->fd);
+	sshbuf_free(e->input);
+	sshbuf_free(e->output);
+	sshbuf_free(e->request);
++	for (i = 0; i < e->nsession_ids; i++) {
++		sshkey_free(e->session_ids[i].key);
++		sshbuf_free(e->session_ids[i].sid);
++	}
++	free(e->session_ids);
+	memset(e, '\0', sizeof(*e));
+	e->fd = -1;
+	e->type = AUTH_UNUSED;
+@@ -423,6 +444,18 @@ check_websafe_message_contents(struct sshkey *key, struct sshbuf *data)
+	return 0;
+ }
+
++static int
++buf_equal(const struct sshbuf *a, const struct sshbuf *b)
++{
++	if (sshbuf_ptr(a) == NULL || sshbuf_ptr(b) == NULL)
++		return SSH_ERR_INVALID_ARGUMENT;
++	if (sshbuf_len(a) != sshbuf_len(b))
++		return SSH_ERR_INVALID_FORMAT;
++	if (timingsafe_bcmp(sshbuf_ptr(a), sshbuf_ptr(b), sshbuf_len(a)) != 0)
++		return SSH_ERR_INVALID_FORMAT;
++	return 0;
++}
++
+ /* ssh2 only */
+ static void
+ process_sign_request2(SocketEntry *e)
+@@ -431,8 +464,8 @@ process_sign_request2(SocketEntry *e)
+	size_t i, slen = 0;
+	u_int compat = 0, flags;
+	int r, ok = -1;
+-	char *fp = NULL;
+-	struct sshbuf *msg = NULL, *data = NULL;
++	char *fp = NULL, *user = NULL, *sig_dest = NULL;
++	struct sshbuf *msg = NULL, *data = NULL, *sid = NULL;
+	struct sshkey *key = NULL;
+	struct identity *id;
+	struct notifier_ctx *notifier = NULL;
+@@ -452,7 +485,33 @@ process_sign_request2(SocketEntry *e)
+		verbose("%s: %s key not found", __func__, sshkey_type(key));
+		goto send;
+	}
+-	if (id->confirm && confirm_key(id, NULL) != 0) {
++	/*
++	 * If session IDs were recorded for this socket, then use them to
++	 * annotate the confirmation messages with the host keys.
++	 */
++	if (e->nsession_ids > 0 &&
++	    parse_userauth_request(data, key, &user, &sid) == 0) {
++		/*
++		 * session ID from userauth request should match the final
++		 * ID in the list recorded in the socket, unless the ssh
++		 * client at that point lacks the binding extension (or if
++		 * an attacker is trying to steal use of the agent).
++		 */
++		i = e->nsession_ids - 1;
++		if (buf_equal(sid, e->session_ids[i].sid) == 0) {
++			if ((fp = sshkey_fingerprint(e->session_ids[i].key,
++			    SSH_FP_HASH_DEFAULT, SSH_FP_DEFAULT)) == NULL)
++				fatal("%s: fingerprint failed", __func__);
++			debug3("%s: destination %s %s (slot %zu)", __func__,
++			    sshkey_type(e->session_ids[i].key), fp, i);
++			xasprintf(&sig_dest, "public key request for "
++			    "target user \"%s\" to %s %s", user,
++			    sshkey_type(e->session_ids[i].key), fp);
++			free(fp);
++			fp = NULL;
++		}
++	}//
++	if (id->confirm && confirm_key(id, sig_dest) != 0) {
+		verbose("%s: user refused key", __func__);
+		goto send;
+	}
+@@ -467,8 +526,10 @@ process_sign_request2(SocketEntry *e)
+			    SSH_FP_DEFAULT)) == NULL)
+				fatal("%s: fingerprint failed", __func__);
+			notifier = notify_start(0,
+-			    "Confirm user presence for key %s %s",
+-			    sshkey_type(id->key), fp);
++			    "Confirm user presence for key %s %s%s%s",
++			    sshkey_type(id->key), fp,
++			    sig_dest == NULL ? "" : "\n",
++			    sig_dest == NULL ? "" : sig_dest);
+		}
+	}
+	if ((r = sshkey_sign(id->key, &signature, &slen,
+@@ -492,11 +553,14 @@ process_sign_request2(SocketEntry *e)
+	if ((r = sshbuf_put_stringb(e->output, msg)) != 0)
+		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+
++	sshbuf_free(sid);
+	sshbuf_free(data);
+	sshbuf_free(msg);
+	sshkey_free(key);
+	free(fp);
+	free(signature);
++	free(sig_dest);
++	free(user);
+ }
+
+ /* shared */
+@@ -925,6 +989,98 @@ send:
+ }
+ #endif /* ENABLE_PKCS11 */
+
++static int
++process_ext_session_bind(SocketEntry *e)
++{
++	int r, sid_match, key_match;
++	struct sshkey *key = NULL;
++	struct sshbuf *sid = NULL, *sig = NULL;
++	char *fp = NULL;
++	u_char fwd;
++	size_t i;
++
++	debug2("%s: entering", __func__);
++	if ((r = sshkey_froms(e->request, &key)) != 0 ||
++	    (r = sshbuf_froms(e->request, &sid)) != 0 ||
++	    (r = sshbuf_froms(e->request, &sig)) != 0 ||
++	    (r = sshbuf_get_u8(e->request, &fwd)) != 0) {
++		error("%s: parse: %s", __func__, ssh_err(r));
++		goto out;
++	}
++	if ((fp = sshkey_fingerprint(key, SSH_FP_HASH_DEFAULT,
++	    SSH_FP_DEFAULT)) == NULL)
++		fatal("%s: fingerprint failed", __func__);
++	/* check signature with hostkey on session ID */
++	if ((r = sshkey_verify(key, sshbuf_ptr(sig), sshbuf_len(sig),
++	    sshbuf_ptr(sid), sshbuf_len(sid), NULL, 0, NULL)) != 0) {
++		error("%s: sshkey_verify for %s %s: %s", __func__, sshkey_type(key), fp, ssh_err(r));
++		goto out;
++	}
++	/* check whether sid/key already recorded */
++	for (i = 0; i < e->nsession_ids; i++) {
++		sid_match = buf_equal(sid, e->session_ids[i].sid) == 0;
++		key_match = sshkey_equal(key, e->session_ids[i].key);
++		if (sid_match && key_match) {
++			debug("%s: session ID already recorded for %s %s", __func__,
++			    sshkey_type(key), fp);
++			r = 0;
++			goto out;
++		} else if (sid_match) {
++			error("%s: session ID recorded against different key "
++			    "for %s %s", __func__, sshkey_type(key), fp);
++			r = -1;
++			goto out;
++		}
++		/*
++		 * new sid with previously-seen key can happen, e.g. multiple
++		 * connections to the same host.
++		 */
++	}
++	/* record new key/sid */
++	if (e->nsession_ids >= AGENT_MAX_SESSION_IDS) {
++		error("%s: too many session IDs recorded", __func__);
++		goto out;
++	}
++	e->session_ids = xrecallocarray(e->session_ids, e->nsession_ids,
++	    e->nsession_ids + 1, sizeof(*e->session_ids));
++	i = e->nsession_ids++;
++	debug("%s: recorded %s %s (slot %zu of %d)", __func__, sshkey_type(key), fp, i,
++	    AGENT_MAX_SESSION_IDS);
++	e->session_ids[i].key = key;
++	e->session_ids[i].forwarded = fwd != 0;
++	key = NULL; /* transferred */
++	/* can't transfer sid; it's refcounted and scoped to request's life */
++	if ((e->session_ids[i].sid = sshbuf_new()) == NULL)
++		fatal("%s: sshbuf_new", __func__);
++	if ((r = sshbuf_putb(e->session_ids[i].sid, sid)) != 0)
++		fatal("%s: sshbuf_putb session ID: %s", __func__, ssh_err(r));
++	/* success */
++	r = 0;
++ out:
++	sshkey_free(key);
++	sshbuf_free(sid);
++	sshbuf_free(sig);
++	return r == 0 ? 1 : 0;
++}
++
++static void
++process_extension(SocketEntry *e)
++{
++	int r, success = 0;
++	char *name;
++
++	debug2("%s: entering", __func__);
++	if ((r = sshbuf_get_cstring(e->request, &name, NULL)) != 0) {
++		error("%s: parse: %s", __func__, ssh_err(r));
++		goto send;
++	}
++	if (strcmp(name, "session-bind@openssh.com") == 0)
++		success = process_ext_session_bind(e);
++	else
++		debug("%s: unsupported extension \"%s\"", __func__, name);
++send:
++	send_status(e, success);
++}
+ /*
+  * dispatch incoming message.
+  * returns 1 on success, 0 for incomplete messages or -1 on error.
+@@ -1019,6 +1175,9 @@ process_message(u_int socknum)
+		process_remove_smartcard_key(e);
+		break;
+ #endif /* ENABLE_PKCS11 */
++	case SSH_AGENTC_EXTENSION:
++		process_extension(e);
++		break;
+	default:
+		/* Unknown message.  Respond with failure. */
+		error("Unknown message %d", type);
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-12.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-12.patch
new file mode 100644
index 0000000000..934775bdec
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-12.patch
@@ -0,0 +1,120 @@
+From 4fe3d0fbd3d6dc1f19354e0d73a3231c461ed044 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 13:56:33 +0000
+Subject: [PATCH 12/12] upstream: Disallow remote addition of FIDO/PKCS11
+ provider libraries to ssh-agent by default.
+
+The old behaviour of allowing remote clients from loading providers
+can be restored using `ssh-agent -O allow-remote-pkcs11`.
+
+Detection of local/remote clients requires a ssh(1) that supports
+the `session-bind@openssh.com` extension. Forwarding access to a
+ssh-agent socket using non-OpenSSH tools may circumvent this control.
+
+ok markus@
+
+OpenBSD-Commit-ID: 4c2bdf79b214ae7e60cc8c39a45501344fa7bd7c
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/1f2731f5d7a8f8a8385c6031667ed29072c0d92a]
+CVE: CVE-2023-38408
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ ssh-agent.1 | 20 ++++++++++++++++++++
+ ssh-agent.c | 26 ++++++++++++++++++++++++--
+ 2 files changed, 44 insertions(+), 2 deletions(-)
+
+diff --git a/ssh-agent.1 b/ssh-agent.1
+index fff0db6..a0f1e21 100644
+--- a/ssh-agent.1
++++ b/ssh-agent.1
+@@ -97,6 +97,26 @@ The default is
+ Kill the current agent (given by the
+ .Ev SSH_AGENT_PID
+ environment variable).
++Currently two options are supported:
++.Cm allow-remote-pkcs11
++and
++.Pp
++The
++.Cm allow-remote-pkcs11
++option allows clients of a forwarded
++.Nm
++to load PKCS#11 or FIDO provider libraries.
++By default only local clients may perform this operation.
++Note that signalling that a
++.Nm
++client remote is performed by
++.Xr ssh 1 ,
++and use of other tools to forward access to the agent socket may circumvent
++this restriction.
++.Pp
++The
++.Cm no-restrict-websafe ,
++instructs
+ .It Fl P Ar provider_whitelist
+ Specify a pattern-list of acceptable paths for PKCS#11 and FIDO authenticator
+ shared libraries that may be used with the
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 01c7f2b..40c1b6b 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-agent.c,v 1.280 2021/12/19 22:09:23 djm Exp $ */
++/* $OpenBSD: ssh-agent.c,v 1.300 2023/07/19 13:56:33 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -167,6 +167,12 @@ char socket_dir[PATH_MAX];
+ /* PKCS#11/Security key path whitelist */
+ static char *provider_whitelist;
+
++/*
++ * Allows PKCS11 providers or SK keys that use non-internal providers to
++ * be added over a remote connection (identified by session-bind@openssh.com).
++ */
++static int remote_add_provider;
++
+ /* locking */
+ #define LOCK_SIZE	32
+ #define LOCK_SALT_SIZE	16
+@@ -736,6 +742,15 @@ process_add_identity(SocketEntry *e)
+		if (strcasecmp(sk_provider, "internal") == 0) {
+			debug("%s: internal provider", __func__);
+		} else {
++			if (e->nsession_ids != 0 && !remote_add_provider) {
++				verbose("failed add of SK provider \"%.100s\": "
++				    "remote addition of providers is disabled",
++				    sk_provider);
++				free(sk_provider);
++				free(comment);
++				sshkey_free(k);
++				goto send;
++			}
+			if (realpath(sk_provider, canonical_provider) == NULL) {
+				verbose("failed provider \"%.100s\": "
+				    "realpath: %s", sk_provider,
+@@ -901,6 +916,11 @@ process_add_smartcard_key(SocketEntry *e)
+			goto send;
+		}
+	}
++	if (e->nsession_ids != 0 && !remote_add_provider) {
++		verbose("failed PKCS#11 add of \"%.100s\": remote addition of "
++		    "providers is disabled", provider);
++		goto send;
++	}
+	if (realpath(provider, canonical_provider) == NULL) {
+		verbose("failed PKCS#11 add of \"%.100s\": realpath: %s",
+		    provider, strerror(errno));
+@@ -1556,7 +1576,9 @@ main(int ac, char **av)
+			break;
+		case 'O':
+			if (strcmp(optarg, "no-restrict-websafe") == 0)
+-				restrict_websafe  = 0;
++				restrict_websafe = 0;
++			else if (strcmp(optarg, "allow-remote-pkcs11") == 0)
++				remote_add_provider = 1;
+			else
+				fatal("Unknown -O option");
+			break;
+--
+2.41.0
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index 79dba121ff..bc4b922301 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -27,6 +27,18 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2020-14145.patch \
            file://CVE-2021-28041.patch \
            file://CVE-2021-41617.patch \
+           file://CVE-2023-38408-01.patch \
+           file://CVE-2023-38408-02.patch \
+           file://CVE-2023-38408-03.patch \
+           file://CVE-2023-38408-04.patch \
+           file://CVE-2023-38408-05.patch \
+           file://CVE-2023-38408-06.patch \
+           file://CVE-2023-38408-07.patch \
+           file://CVE-2023-38408-08.patch \
+           file://CVE-2023-38408-09.patch \
+           file://CVE-2023-38408-10.patch \
+           file://CVE-2023-38408-11.patch \
+           file://CVE-2023-38408-12.patch \
            "
 SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
-- 
2.34.1


