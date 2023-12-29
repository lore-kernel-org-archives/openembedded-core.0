Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D571BC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 16:07:58 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.151594.1703866078353954651
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 08:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=orSJHjIu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6d9bec20980so1485430b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 08:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703866077; x=1704470877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WECzF0wDiIpZmJgbrk5lc1QwvyZ6Qb4xitrM1ZbLgTE=;
        b=orSJHjIu5M9EkP6kVtcvR81cYjhv2SWFYrumWBKNwRarRd/0FdJCM1m1O8Eaz92bUv
         oeA1/qKTFJbqKFUy68lgcBveCzWEc34IlPay3+NmoiZnOCWrT4ZuYt19/3ni4zZwqBvt
         9MhTTN5X0XuX13eU3c7DhmOcCzNHCiA+i0FMb8+1xFIoXgaQNPtQ2fMUExm648PX+OZ9
         GTiBU8obQsrIxkQGaD11iSG9+mjZr1b+wK7DcAr1+54+LaLy37Xos2p0KUXGV4HwCI8S
         QIHEbtihrBgdUaumIPky/M3t3mK1N4q9ZICiD2hj3AY6/yW06JImZ4qn3QRKUmEdh7HZ
         hv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703866077; x=1704470877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WECzF0wDiIpZmJgbrk5lc1QwvyZ6Qb4xitrM1ZbLgTE=;
        b=R2JZRHSO6H4ed4QRDMWLqST8rh4aXAd8ZBbxZwTvchfcCIvofJpEzmmi9YEIp/2pNg
         qevJVrIc/3xwPs6GJpitxbznS4DZDnS3wdhFC+WI9PrIe1L3dG5NSri4u+PZfqPhI5tF
         J6/0txOgiFomC7kkiMbO/aDA7+VHa3GDN6k0c2O18r1Y89qworro8v/8cetve/e1tJix
         /LP7CM7S8omXCtUNtsTxoVX/H7UMsKgygrRYQc4jJAZ0XQ5McUXYyGkPFJpno4/4mWTq
         ysTWs+bymKEsgW54QZaDcxPBjZs5ItstZUXRvoCy4D4uXmVz/mpoHlfpejVOnXoQm0TC
         6J6Q==
X-Gm-Message-State: AOJu0YwTusBuz7TcllNKQ9h3NOoz/uUrwYDI2UHLNRQAIfk+Id/Ah6jw
	dpuyZNjWqOv/Wce6SaCFJKQoD1L7QNPrPeWoFyq5rVKweu1FMQ==
X-Google-Smtp-Source: AGHT+IHis4Dx6iwlzWyRqXeKfzlfUAAaLU/4OWHZRs9qcmpNCrMOLGmZbHuDTgvKrVn2/HY3BdfzLA==
X-Received: by 2002:a05:6a00:3d53:b0:6da:1713:2012 with SMTP id lp19-20020a056a003d5300b006da17132012mr1956087pfb.27.1703866076933;
        Fri, 29 Dec 2023 08:07:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u25-20020aa78499000000b006d9b2682c91sm10028691pfn.113.2023.12.29.08.07.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 08:07:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] openssh: fix CVE-2023-51384
Date: Fri, 29 Dec 2023 06:07:45 -1000
Message-Id: <7a745dd1aa13fbf110cc4d86ddbc86617975d6ad.1703865952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703865952.git.steve@sakoman.com>
References: <cover.1703865952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 16:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193060

From: Archana Polampalli <archana.polampalli@windriver.com>

In ssh-agent in OpenSSH before 9.6, certain destination constraints can be
incompletely applied. When destination constraints are specified during
addition of PKCS#11-hosted private keys, these constraints are only applied
to the first key, even if a PKCS#11 token returns multiple keys.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-51384

Upstream patches:
https://github.com/openssh/openssh-portable/commit/881d9c6af9da4257c69c327c4e2f1508b2fa754b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2023-51384.patch      | 171 ++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-51384.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-51384.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51384.patch
new file mode 100644
index 0000000000..ead3256915
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51384.patch
@@ -0,0 +1,171 @@
+From 881d9c6af9da4257c69c327c4e2f1508b2fa754b Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 18 Dec 2023 14:46:12 +0000
+Subject: [PATCH] upstream: apply destination constraints to all p11 keys
+
+Previously applied only to the first key returned from each token.
+
+ok markus@
+
+OpenBSD-Commit-ID: 36df3afb8eb94eec6b2541f063d0d164ef8b488d
+
+CVE: CVE-2023-51384
+
+Upstream-Status: Backport
+https://github.com/openssh/openssh-portable/commit/881d9c6af9da4257c69c327c4e2f1508b2fa754b
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ ssh-agent.c | 102 +++++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 98 insertions(+), 4 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 19eeaae..4dbb4f3 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -249,6 +249,90 @@ free_dest_constraints(struct dest_constraint *dcs, size_t ndcs)
+	free(dcs);
+ }
+
++static void
++dup_dest_constraint_hop(const struct dest_constraint_hop *dch,
++    struct dest_constraint_hop *out)
++{
++	u_int i;
++	int r;
++
++	out->user = dch->user == NULL ? NULL : xstrdup(dch->user);
++	out->hostname = dch->hostname == NULL ? NULL : xstrdup(dch->hostname);
++	out->is_ca = dch->is_ca;
++	out->nkeys = dch->nkeys;
++	out->keys = out->nkeys == 0 ? NULL :
++	    xcalloc(out->nkeys, sizeof(*out->keys));
++	out->key_is_ca = out->nkeys == 0 ? NULL :
++	    xcalloc(out->nkeys, sizeof(*out->key_is_ca));
++	for (i = 0; i < dch->nkeys; i++) {
++		if (dch->keys[i] != NULL &&
++		    (r = sshkey_from_private(dch->keys[i],
++		    &(out->keys[i]))) != 0)
++			fatal_fr(r, "copy key");
++		out->key_is_ca[i] = dch->key_is_ca[i];
++	}
++}
++
++static struct dest_constraint *
++dup_dest_constraints(const struct dest_constraint *dcs, size_t ndcs)
++{
++	size_t i;
++	struct dest_constraint *ret;
++
++	if (ndcs == 0)
++		return NULL;
++	ret = xcalloc(ndcs, sizeof(*ret));
++	for (i = 0; i < ndcs; i++) {
++		dup_dest_constraint_hop(&dcs[i].from, &ret[i].from);
++		dup_dest_constraint_hop(&dcs[i].to, &ret[i].to);
++	}
++	return ret;
++}
++
++#ifdef DEBUG_CONSTRAINTS
++static void
++dump_dest_constraint_hop(const struct dest_constraint_hop *dch)
++{
++	u_int i;
++	char *fp;
++
++	debug_f("user %s hostname %s is_ca %d nkeys %u",
++	    dch->user == NULL ? "(null)" : dch->user,
++	    dch->hostname == NULL ? "(null)" : dch->hostname,
++	    dch->is_ca, dch->nkeys);
++	for (i = 0; i < dch->nkeys; i++) {
++		fp = NULL;
++		if (dch->keys[i] != NULL &&
++		    (fp = sshkey_fingerprint(dch->keys[i],
++		    SSH_FP_HASH_DEFAULT, SSH_FP_DEFAULT)) == NULL)
++			fatal_f("fingerprint failed");
++		debug_f("key %u/%u: %s%s%s key_is_ca %d", i, dch->nkeys,
++		    dch->keys[i] == NULL ? "" : sshkey_ssh_name(dch->keys[i]),
++		    dch->keys[i] == NULL ? "" : " ",
++		    dch->keys[i] == NULL ? "none" : fp,
++		    dch->key_is_ca[i]);
++		free(fp);
++	}
++}
++#endif /* DEBUG_CONSTRAINTS */
++
++static void
++dump_dest_constraints(const char *context,
++    const struct dest_constraint *dcs, size_t ndcs)
++{
++#ifdef DEBUG_CONSTRAINTS
++	size_t i;
++
++	debug_f("%s: %zu constraints", context, ndcs);
++	for (i = 0; i < ndcs; i++) {
++		debug_f("constraint %zu / %zu: from: ", i, ndcs);
++		dump_dest_constraint_hop(&dcs[i].from);
++		debug_f("constraint %zu / %zu: to: ", i, ndcs);
++		dump_dest_constraint_hop(&dcs[i].to);
++	}
++	debug_f("done for %s", context);
++#endif /* DEBUG_CONSTRAINTS */
++}
+ static void
+ free_identity(Identity *id)
+ {
+@@ -520,13 +604,22 @@ process_request_identities(SocketEntry *e)
+	Identity *id;
+	struct sshbuf *msg, *keys;
+	int r;
+-	u_int nentries = 0;
++	u_int i = 0, nentries = 0;
++	char *fp;
+
+	debug2_f("entering");
+
+	if ((msg = sshbuf_new()) == NULL || (keys = sshbuf_new()) == NULL)
+		fatal_f("sshbuf_new failed");
+	TAILQ_FOREACH(id, &idtab->idlist, next) {
++		if ((fp = sshkey_fingerprint(id->key, SSH_FP_HASH_DEFAULT,
++		    SSH_FP_DEFAULT)) == NULL)
++			fatal_f("fingerprint failed");
++		debug_f("key %u / %u: %s %s", i++, idtab->nentries,
++		    sshkey_ssh_name(id->key), fp);
++		dump_dest_constraints(__func__,
++		    id->dest_constraints, id->ndest_constraints);
++		free(fp);
+		/* identity not visible, don't include in response */
+		if (identity_permitted(id, e, NULL, NULL, NULL) != 0)
+			continue;
+@@ -1235,6 +1328,7 @@ process_add_identity(SocketEntry *e)
+		sshbuf_reset(e->request);
+		goto out;
+	}
++	dump_dest_constraints(__func__, dest_constraints, ndest_constraints);
+
+	if (sk_provider != NULL) {
+		if (!sshkey_is_sk(k)) {
+@@ -1414,6 +1508,7 @@ process_add_smartcard_key(SocketEntry *e)
+		error_f("failed to parse constraints");
+		goto send;
+	}
++	dump_dest_constraints(__func__, dest_constraints, ndest_constraints);
+	if (e->nsession_ids != 0 && !remote_add_provider) {
+		verbose("failed PKCS#11 add of \"%.100s\": remote addition of "
+		    "providers is disabled", provider);
+@@ -1449,10 +1544,9 @@ process_add_smartcard_key(SocketEntry *e)
+			}
+			id->death = death;
+			id->confirm = confirm;
+-			id->dest_constraints = dest_constraints;
++			id->dest_constraints = dup_dest_constraints(
++			    dest_constraints, ndest_constraints);
+			id->ndest_constraints = ndest_constraints;
+-			dest_constraints = NULL; /* transferred */
+-			ndest_constraints = 0;
+			TAILQ_INSERT_TAIL(&idtab->idlist, id, next);
+			idtab->nentries++;
+			success = 1;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 7ad9bced1b..3860899540 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-38408-0004.patch \
            file://fix-authorized-principals-command.patch \
            file://CVE-2023-48795.patch \
+           file://CVE-2023-51384.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.34.1


