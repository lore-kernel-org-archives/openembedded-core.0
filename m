Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA51C001DF
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 12:28:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.31008.1690547336204182554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 05:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LSKPfB3D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7573811ac6=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SCNXGI013617
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 05:28:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=zNFtH
	IWmvQMg303r+8Lym9achgQ8yjijmiX9qYbwuRQ=; b=LSKPfB3D/IR9qORGB53Ed
	XzfOd/FiC5eRomMm68ctsCK6KlSGAfz+QyV96FQShdMiGtTze+SF8u6OyxOw5CCK
	EGX1s66F3Yw+64UW4pYAGTbPA9o+F/MmOymdCDvMyjCEYP5McYq8OjGTJMkhV665
	u/YE1HlUSlU6yqcuEMwkQhOC5wgV05dPChC247od1xS4Ny3twBqkX4Z5xY+YqYqW
	2+BAzudI7wXs2AXH1Hup7E02MSxjNDdlJEtI4Lp3au9/RFm3KUOUAlAb3zFGiES2
	DRmp63FtkqFV7zVzBjCxG/b+FmWa8aBP2+EySMhqPW8KTPVRFo7+b28Cln6mlFca
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad05fs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 05:28:55 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 05:28:53 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] openssh: fix CVE-2023-38408
Date: Fri, 28 Jul 2023 12:28:40 +0000
Message-ID: <20230728122840.3789776-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: BoQdG7Z1STHYViGQR68hn-u0bnKGT5aW
X-Proofpoint-GUID: BoQdG7Z1STHYViGQR68hn-u0bnKGT5aW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2307280115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 12:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185026

The PKCS#11 feature in ssh-agent in OpenSSH before 9.3p2 has an
insufficiently trustworthy search path, leading to remote code
execution if an agent is forwarded to an attacker-controlled system.
(Code in /usr/lib is not necessarily safe for loading into ssh-agent.)
NOTE: this issue exists because of an incomplete fix for CVE-2016-10009.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-38408

Upstream patches:
https://github.com/openssh/openssh-portable/commit/892506b13654301f69f9545f48213fc210e5c5cc
https://github.com/openssh/openssh-portable/commit/1f2731f5d7a8f8a8385c6031667ed29072c0d92a
https://github.com/openssh/openssh-portable/commit/29ef8a04866ca14688d5b7fed7b8b9deab851f77
https://github.com/openssh/openssh-portable/commit/099cdf59ce1e72f55d421c8445bf6321b3004755

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssh/openssh/CVE-2023-38408-0001.patch | 585 ++++++++++++++++++
 .../openssh/openssh/CVE-2023-38408-0002.patch | 173 ++++++
 .../openssh/openssh/CVE-2023-38408-0003.patch |  36 ++
 .../openssh/openssh/CVE-2023-38408-0004.patch | 114 ++++
 .../openssh/openssh_8.9p1.bb                  |   4 +
 5 files changed, 912 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0001.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0002.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0003.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0004.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0001.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0001.patch
new file mode 100644
index 0000000000..2ee344cb27
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0001.patch
@@ -0,0 +1,585 @@
+From 099cdf59ce1e72f55d421c8445bf6321b3004755 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 14:03:45 +0000
+Subject: [PATCH 1/4] upstream: Separate ssh-pkcs11-helpers for each p11 module
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
+
+CVE: CVE-2023-38408
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ ssh-pkcs11-client.c | 378 +++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 285 insertions(+), 93 deletions(-)
+
+diff --git a/ssh-pkcs11-client.c b/ssh-pkcs11-client.c
+index cfd833d..7db6c6c 100644
+--- a/ssh-pkcs11-client.c
++++ b/ssh-pkcs11-client.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-pkcs11-client.c,v 1.17 2020/10/18 11:32:02 djm Exp $ */
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
++		fatal_f("inconsistent helper");
++	debug3_f("free helper for provider %s", helper->path);
++	for (i = 0; i < nhelpers; i++) {
++		if (helpers[i] == helper) {
++			if (found)
++				fatal_f("helper recorded more than once");
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
++		debug3_f("already terminated");
++	} else {
++		debug3_f("terminating helper for %s; "
++		    "remaining %zu RSA %zu ECDSA",
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
++	debug3_f("terminating %zu helpers", nhelpers);
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
++		fatal_f("no helper for PKCS11 key");
++	debug3_f("signing with PKCS11 provider %s", helper->path);
+	if (padding != RSA_PKCS1_PADDING)
+		goto fail;
+	key = sshkey_new(KEY_UNSPEC);
+@@ -144,10 +274,10 @@ rsa_encrypt(int flen, const u_char *from, u_char *to, RSA *rsa, int padding)
+	    (r = sshbuf_put_string(msg, from, flen)) != 0 ||
+	    (r = sshbuf_put_u32(msg, 0)) != 0)
+		fatal_fr(r, "compose");
+-	send_msg(msg);
++	send_msg(helper->fd, msg);
+	sshbuf_reset(msg);
+
+-	if (recv_msg(msg) == SSH2_AGENT_SIGN_RESPONSE) {
++	if (recv_msg(helper->fd, msg) == SSH2_AGENT_SIGN_RESPONSE) {
+		if ((r = sshbuf_get_string(msg, &signature, &slen)) != 0)
+			fatal_fr(r, "parse");
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
++		fatal_f("no helper for PKCS11 key");
++	debug3_f("free PKCS11 RSA key for provider %s", helper->path);
++	if (helper->rsa_finish != NULL)
++		helper->rsa_finish(rsa);
++	if (helper->nrsa == 0)
++		fatal_f("RSA refcount error");
++	helper->nrsa--;
++	debug3_f("provider %s remaining keys: %zu RSA %zu ECDSA",
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
++		fatal_f("no helper for PKCS11 key");
++	debug3_f("signing with PKCS11 provider %s", helper->path);
+	nid = sshkey_ecdsa_key_to_nid(ec);
+	if (nid < 0) {
+		error_f("couldn't get curve nid");
+@@ -203,10 +356,10 @@ ecdsa_do_sign(const unsigned char *dgst, int dgst_len, const BIGNUM *inv,
+	    (r = sshbuf_put_string(msg, dgst, dgst_len)) != 0 ||
+	    (r = sshbuf_put_u32(msg, 0)) != 0)
+		fatal_fr(r, "compose");
+-	send_msg(msg);
++	send_msg(helper->fd, msg);
+	sshbuf_reset(msg);
+
+-	if (recv_msg(msg) == SSH2_AGENT_SIGN_RESPONSE) {
++	if (recv_msg(helper->fd, msg) == SSH2_AGENT_SIGN_RESPONSE) {
+		if ((r = sshbuf_get_string(msg, &signature, &slen)) != 0)
+			fatal_fr(r, "parse");
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
++		fatal_f("no helper for PKCS11 key");
++	debug3_f("free PKCS11 ECDSA key for provider %s", helper->path);
++	if (helper->ec_finish != NULL)
++		helper->ec_finish(ec);
++	if (helper->nec == 0)
++		fatal_f("ECDSA refcount error");
++	helper->nec--;
++	debug3_f("provider %s remaining keys: %zu RSA %zu ECDSA",
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
++	debug3_f("wrap %s for provider %s", sshkey_type(k), helper->path);
++	if (k->type == KEY_RSA) {
++		RSA_set_method(k->rsa, helper->rsa_meth);
++		if (helper->nrsa++ >= INT_MAX)
++			fatal_f("RSA refcount error");
++	} else if (k->type == KEY_ECDSA) {
++		EC_KEY_set_method(k->ecdsa, helper->ec_meth);
++		if (helper->nec++ >= INT_MAX)
++			fatal_f("EC refcount error");
++	} else
+		fatal_f("unknown key type");
++	k->flags |= SSHKEY_FLAG_EXT;
++	debug3_f("provider %s remaining keys: %zu RSA %zu ECDSA",
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
+		fatal_f("RSA_meth_dup failed");
+-	if (!RSA_meth_set1_name(helper_rsa, "ssh-pkcs11-helper") ||
+-	    !RSA_meth_set_priv_enc(helper_rsa, rsa_encrypt))
++	helper->rsa_finish = RSA_meth_get_finish(rsa_meth);
++	if (!RSA_meth_set1_name(rsa_meth, "ssh-pkcs11-helper") ||
++	    !RSA_meth_set_priv_enc(rsa_meth, rsa_encrypt) ||
++	    !RSA_meth_set_finish(rsa_meth, rsa_finish))
+		fatal_f("failed to prepare method");
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
++		fatal_f("too many helpers");
++	debug3_f("start helper for %s", path);
+	if (socketpair(AF_UNIX, SOCK_STREAM, 0, pair) == -1) {
+-		error("socketpair: %s", strerror(errno));
+-		return (-1);
++		error_f("socketpair: %s", strerror(errno));
++		return NULL;
++	}
++	helper = xcalloc(1, sizeof(*helper));
++	if (pkcs11_start_helper_methods(helper) == -1) {
++		error_f("pkcs11_start_helper_methods failed");
++		goto fail;
+	}
+	if ((pid = fork()) == -1) {
+-		error("fork: %s", strerror(errno));
+-		return (-1);
++		error_f("fork: %s", strerror(errno));
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
+-		debug_f("starting %s %s", helper,
++		prog = getenv("SSH_PKCS11_HELPER");
++		if (prog == NULL || strlen(prog) == 0)
++			prog = _PATH_SSH_PKCS11_HELPER;
++		if (log_level_get() >= SYSLOG_LEVEL_DEBUG1)
++			verbosity = "-vvv";
++		debug_f("starting %s %s", prog,
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
++	debug3_f("helper %zu for \"%s\" on fd %d pid %ld", nhelpers,
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
+		fatal_f("sshbuf_new failed");
+@@ -332,10 +531,10 @@ pkcs11_add_provider(char *name, char *pin, struct sshkey ***keysp,
+	    (r = sshbuf_put_cstring(msg, name)) != 0 ||
+	    (r = sshbuf_put_cstring(msg, pin)) != 0)
+		fatal_fr(r, "compose");
+-	send_msg(msg);
++	send_msg(helper->fd, msg);
+	sshbuf_reset(msg);
+
+-	type = recv_msg(msg);
++	type = recv_msg(helper->fd, msg);
+	if (type == SSH2_AGENT_IDENTITIES_ANSWER) {
+		if ((r = sshbuf_get_u32(msg, &nkeys)) != 0)
+			fatal_fr(r, "parse nkeys");
+@@ -349,7 +548,7 @@ pkcs11_add_provider(char *name, char *pin, struct sshkey ***keysp,
+				fatal_fr(r, "parse key");
+			if ((r = sshkey_from_blob(blob, blen, &k)) != 0)
+				fatal_fr(r, "decode key");
+-			wrap_key(k);
++			wrap_key(helper, k);
+			(*keysp)[i] = k;
+			if (labelsp)
+				(*labelsp)[i] = label;
+@@ -370,22 +569,15 @@ pkcs11_add_provider(char *name, char *pin, struct sshkey ***keysp,
+ int
+ pkcs11_del_provider(char *name)
+ {
+-	int r, ret = -1;
+-	struct sshbuf *msg;
+-
+-	if ((msg = sshbuf_new()) == NULL)
+-		fatal_f("sshbuf_new failed");
+-	if ((r = sshbuf_put_u8(msg, SSH_AGENTC_REMOVE_SMARTCARD_KEY)) != 0 ||
+-	    (r = sshbuf_put_cstring(msg, name)) != 0 ||
+-	    (r = sshbuf_put_cstring(msg, "")) != 0)
+-		fatal_fr(r, "compose");
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
++	debug3_f("delete %s", name);
++	if ((helper = helper_by_provider(name)) != NULL)
++		helper_terminate(helper);
++	return 0;
+ }
+-
+ #endif /* ENABLE_PKCS11 */
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0002.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0002.patch
new file mode 100644
index 0000000000..81f4cc5fba
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0002.patch
@@ -0,0 +1,173 @@
+From 29ef8a04866ca14688d5b7fed7b8b9deab851f77 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 14:02:27 +0000
+Subject: [PATCH 2/4] upstream: Ensure FIDO/PKCS11 libraries contain expected
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
+
+CVE: CVE-2023-38408
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ misc.c       | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ misc.h       |  1 +
+ ssh-pkcs11.c |  4 +++
+ ssh-sk.c     |  6 ++--
+ 4 files changed, 86 insertions(+), 2 deletions(-)
+
+diff --git a/misc.c b/misc.c
+index 417498d..d0270e7 100644
+--- a/misc.c
++++ b/misc.c
+@@ -22,6 +22,7 @@
+
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
++#include <sys/mman.h>
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+@@ -35,6 +36,9 @@
+ #ifdef HAVE_POLL_H
+ #include <poll.h>
+ #endif
++#ifdef HAVE_NLIST_H
++#include <nlist.h>
++#endif
+ #include <signal.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+@@ -2784,3 +2788,76 @@ lookup_env_in_list(const char *env, char * const *envs, size_t nenvs)
+	}
+	return NULL;
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
++		error_f("nlist failed for %s", path);
++		goto out;
++	}
++	if (r != 0 || nl[0].n_value == 0 || nl[0].n_type == 0) {
++		error_f("library %s does not contain symbol %s", path, s);
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
++		error_f("open %s: %s", path, strerror(errno));
++		return -1;
++	}
++	if (fstat(fd, &st) != 0) {
++		error_f("fstat %s: %s", path, strerror(errno));
++		goto out;
++	}
++	if (!S_ISREG(st.st_mode)) {
++		error_f("%s is not a regular file", path);
++		goto out;
++	}
++	if (st.st_size < 0 ||
++	    (size_t)st.st_size < strlen(s) ||
++	    st.st_size >= INT_MAX/2) {
++		error_f("%s bad size %lld", path, (long long)st.st_size);
++		goto out;
++	}
++	sz = (size_t)st.st_size;
++	if ((m = mmap(NULL, sz, PROT_READ, MAP_PRIVATE, fd, 0)) == MAP_FAILED ||
++	    m == NULL) {
++		error_f("mmap %s: %s", path, strerror(errno));
++		goto out;
++	}
++	if (memmem(m, sz, s, strlen(s)) == NULL) {
++		error_f("%s does not contain expected string %s", path, s);
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
+index 2e1b5fe..3f48315 100644
+--- a/misc.h
++++ b/misc.h
+@@ -96,6 +96,7 @@ int	 parse_absolute_time(const char *, uint64_t *);
+ void	 format_absolute_time(uint64_t, char *, size_t);
+ int	 path_absolute(const char *);
+ int	 stdfd_devnull(int, int, int);
++int	 lib_contains_symbol(const char *, const char *);
+
+ void	 sock_set_v6only(int);
+
+diff --git a/ssh-pkcs11.c b/ssh-pkcs11.c
+index b2e2b32..5eb28e9 100644
+--- a/ssh-pkcs11.c
++++ b/ssh-pkcs11.c
+@@ -1532,6 +1532,10 @@ pkcs11_register_provider(char *provider_id, char *pin,
+		debug_f("provider already registered: %s", provider_id);
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
+index a1ff5cc..1042bf6 100644
+--- a/ssh-sk.c
++++ b/ssh-sk.c
+@@ -132,10 +132,12 @@ sshsk_open(const char *path)
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
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0003.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0003.patch
new file mode 100644
index 0000000000..f226f12edc
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0003.patch
@@ -0,0 +1,36 @@
+From 892506b13654301f69f9545f48213fc210e5c5cc Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 13:55:53 +0000
+Subject: [PATCH 3/4] upstream: terminate process if requested to load a
+ PKCS#11 provider that isn't a PKCS#11 provider; from / ok markus@
+
+OpenBSD-Commit-ID: 39532cf18b115881bb4cfaee32084497aadfa05c
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/892506b13654301f69f9545f48213fc210e5c5cc]
+
+CVE: CVE-2023-38408
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ ssh-pkcs11.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/ssh-pkcs11.c b/ssh-pkcs11.c
+index 5eb28e9..0aef379 100644
+--- a/ssh-pkcs11.c
++++ b/ssh-pkcs11.c
+@@ -1541,10 +1541,8 @@ pkcs11_register_provider(char *provider_id, char *pin,
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
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0004.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0004.patch
new file mode 100644
index 0000000000..1ff8505938
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0004.patch
@@ -0,0 +1,114 @@
+From 1f2731f5d7a8f8a8385c6031667ed29072c0d92a Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 19 Jul 2023 13:56:33 +0000
+Subject: [PATCH 4/4] upstream: Disallow remote addition of FIDO/PKCS11
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
+
+CVE: CVE-2023-38408
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ ssh-agent.1 | 21 +++++++++++++++++++++
+ ssh-agent.c | 21 ++++++++++++++++++++-
+ 2 files changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/ssh-agent.1 b/ssh-agent.1
+index ed8c870..15d0a47 100644
+--- a/ssh-agent.1
++++ b/ssh-agent.1
+@@ -102,6 +102,27 @@ The default is
+ Kill the current agent (given by the
+ .Ev SSH_AGENT_PID
+ environment variable).
++Currently two options are supported:
++.Cm allow-remote-pkcs11
++and
++.Cm no-restrict-websafe .
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
+ .It Fl P Ar allowed_providers
+ Specify a pattern-list of acceptable paths for PKCS#11 provider and FIDO
+ authenticator middleware shared libraries that may be used with the
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 03ae2b0..19eeaae 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -171,6 +171,12 @@ char socket_dir[PATH_MAX];
+ /* Pattern-list of allowed PKCS#11/Security key paths */
+ static char *allowed_providers;
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
+@@ -1239,6 +1245,12 @@ process_add_identity(SocketEntry *e)
+		if (strcasecmp(sk_provider, "internal") == 0) {
+			debug_f("internal provider");
+		} else {
++			if (e->nsession_ids != 0 && !remote_add_provider) {
++				verbose("failed add of SK provider \"%.100s\": "
++				    "remote addition of providers is disabled",
++				    sk_provider);
++				goto out;
++			}
+			if (realpath(sk_provider, canonical_provider) == NULL) {
+				verbose("failed provider \"%.100s\": "
+				    "realpath: %s", sk_provider,
+@@ -1402,6 +1414,11 @@ process_add_smartcard_key(SocketEntry *e)
+		error_f("failed to parse constraints");
+		goto send;
+	}
++	if (e->nsession_ids != 0 && !remote_add_provider) {
++		verbose("failed PKCS#11 add of \"%.100s\": remote addition of "
++		    "providers is disabled", provider);
++		goto send;
++	}
+	if (realpath(provider, canonical_provider) == NULL) {
+		verbose("failed PKCS#11 add of \"%.100s\": realpath: %s",
+		    provider, strerror(errno));
+@@ -2061,7 +2078,9 @@ main(int ac, char **av)
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
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index b403b355a6..da7ab7716c 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -28,6 +28,10 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-Default-to-not-using-sandbox-when-cross-compiling.patch \
            file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
            file://0001-upstream-include-destination-constraints-for-smartca.patch \
+           file://CVE-2023-38408-0001.patch \
+           file://CVE-2023-38408-0002.patch \
+           file://CVE-2023-38408-0003.patch \
+           file://CVE-2023-38408-0004.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.40.0


