Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C06AC3DA71
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:05 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.15119.1671202684272441997
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=U16Ji26S;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so6323800pjp.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4GNpn3MzXL44afJTVA4xXGBFzp/+nsnVfue6IeqC3Y=;
        b=U16Ji26SCtCLG7g+9gVCm33nP7/Zw8JoO7XKsiy8cKTfim+TXpwSOTHKc2n5Y+8KVi
         gbkfw5tMw5ITTduwsfdPx6oITWgPNvxI+Y09tfUhXpoOSD6HekurUUS+IDINYdqfwrYr
         ITMHeAAFB3YrQJehuArexMve4c33h4i9m73KDfMcZgyynEYG4P8Bs8Z/LVtWErXVZt2Z
         iKNkwjaOLa0HtizIjDrlmdpaCKqFb02IQUBnknhUPoruFftK5b0tl1sSm7ZesnBsNQPn
         S4/uwkOgKAf4NmNyb8Yi9tkkJ94a/mt68hWGFLRSuWT6y3Y82S7lccGPEakvngnoqNcF
         bLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4GNpn3MzXL44afJTVA4xXGBFzp/+nsnVfue6IeqC3Y=;
        b=Rbcr3j6Dk5QrK+JVUO4WdG+iaIiu1pKvXWM+9dq/Jl2qFc85iXV6t05BZz2Jwew3JV
         wXETk5arA6ImkDbyRpvWum+L6Vqs6cXx2sdIACv+EQEKhwsbqI1xq2uGyabFZn+0h0iK
         W1/0zoS5mNyTeYSptGXlvyOdJHgqTS3+qInZclsdzMoHS2gmA8utZbkhM8VW5kXpI1ou
         ER/8uPVFm9Y0WApo7Rt1JLmUq3ii+NVu0jzwgQSXshQMhYMulQAit5lZaPU15zCe8rBS
         hSIxvHq7XIIs47oy8M+zFhcWvqfLkwX3EK2mzJZl1BWJhfkzmRuzqfTzuiSnkhd0OmU/
         9t8Q==
X-Gm-Message-State: ANoB5pl+4T+PPWwYtZNOF5FH8SPCzUWE85tve8wYMoJKIZzSq9IZ8Kpn
	9Aal8cZ4wsvGXQdLmpPygGT7AcmBzPu3PX5hf+Q=
X-Google-Smtp-Source: AA0mqf4vwLtNJMmKyId+pyRiHAMHl7tyTa6vaD3Xa8SL+Cfmsh/Uc9LhxDKiQSi/B62nXj4/7jAfpg==
X-Received: by 2002:a17:90a:7d0f:b0:219:aa6:87f with SMTP id g15-20020a17090a7d0f00b002190aa6087fmr33851280pjl.20.1671202682986;
        Fri, 16 Dec 2022 06:58:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/13] rpm: Fix rpm CVE CVE-2021-3521
Date: Fri, 16 Dec 2022 04:57:41 -1000
Message-Id: <ddb4f775a86855e4ddc6c0d0d1f24a55e0ecbfe0.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174746

From: Riyaz Khan <Riyaz.Khan@kpit.com>

Links:
Dependent Patches:
CVE-2021-3521-01
https://github.com/rpm-software-management/rpm/commit/b5e8bc74b2b05aa557f663fe227b94d2bc64fbd8
CVE-2021-3521-02
https://github.com/rpm-software-management/rpm/commit/9f03f42e2614a68f589f9db8fe76287146522c0c
CVE-2021-3521-03
https://github.com/rpm-software-management/rpm/commit/5ff86764b17f31535cb247543a90dd739076ec38
CVE-2021-3521
https://github.com/rpm-software-management/rpm/commit/bd36c5dc9fb6d90c46fbfed8c2d67516fc571ec8

Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rpm/files/CVE-2021-3521-01.patch          |  60 ++++
 .../rpm/files/CVE-2021-3521-02.patch          |  55 +++
 .../rpm/files/CVE-2021-3521-03.patch          |  34 ++
 .../rpm/files/CVE-2021-3521.patch             | 330 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   4 +
 5 files changed, 483 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521-01.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521-02.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521-03.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521.patch

diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3521-01.patch b/meta/recipes-devtools/rpm/files/CVE-2021-3521-01.patch
new file mode 100644
index 0000000000..0882d6f310
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-3521-01.patch
@@ -0,0 +1,60 @@
+From b5e8bc74b2b05aa557f663fe227b94d2bc64fbd8 Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 30 Sep 2021 09:51:10 +0300
+Subject: [PATCH] Process MPI's from all kinds of signatures
+
+No immediate effect but needed by the following commits.
+
+Dependent patch:
+CVE: CVE-2021-3521
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/b5e8bc74b2b05aa557f663fe227b94d2bc64fbd8]
+Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
+
+---
+ rpmio/rpmpgp.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
+index ee5c81e246..340de5fc9a 100644
+--- a/rpmio/rpmpgp.c
++++ b/rpmio/rpmpgp.c
+@@ -511,7 +511,7 @@  pgpDigAlg pgpDigAlgFree(pgpDigAlg alg)
+     return NULL;
+ }
+ 
+-static int pgpPrtSigParams(pgpTag tag, uint8_t pubkey_algo, uint8_t sigtype,
++static int pgpPrtSigParams(pgpTag tag, uint8_t pubkey_algo,
+ 		const uint8_t *p, const uint8_t *h, size_t hlen,
+ 		pgpDigParams sigp)
+ {
+@@ -524,10 +524,8 @@ static int pgpPrtSigParams(pgpTag tag, uint8_t pubkey_algo, uint8_t sigtype,
+ 	int mpil = pgpMpiLen(p);
+ 	if (p + mpil > pend)
+ 	    break;
+-	if (sigtype == PGPSIGTYPE_BINARY || sigtype == PGPSIGTYPE_TEXT) {
+-	    if (sigalg->setmpi(sigalg, i, p))
+-		break;
+-	}
++        if (sigalg->setmpi(sigalg, i, p))
++           break;
+ 	p += mpil;
+     }
+ 
+@@ -600,7 +598,7 @@ static int pgpPrtSig(pgpTag tag, const uint8_t *h, size_t hlen,
+ 	}
+ 
+ 	p = ((uint8_t *)v) + sizeof(*v);
+-	rc = pgpPrtSigParams(tag, v->pubkey_algo, v->sigtype, p, h, hlen, _digp);
++	rc = pgpPrtSigParams(tag, v->pubkey_algo, p, h, hlen, _digp);
+     }	break;
+     case 4:
+     {   pgpPktSigV4 v = (pgpPktSigV4)h;
+@@ -658,7 +656,7 @@ static int pgpPrtSig(pgpTag tag, const uint8_t *h, size_t hlen,
+ 	if (p > (h + hlen))
+ 	    return 1;
+ 
+-	rc = pgpPrtSigParams(tag, v->pubkey_algo, v->sigtype, p, h, hlen, _digp);
++	rc = pgpPrtSigParams(tag, v->pubkey_algo, p, h, hlen, _digp);
+     }	break;
+     default:
+ 	rpmlog(RPMLOG_WARNING, _("Unsupported version of key: V%d\n"), version);
diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3521-02.patch b/meta/recipes-devtools/rpm/files/CVE-2021-3521-02.patch
new file mode 100644
index 0000000000..c5f88a8c72
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-3521-02.patch
@@ -0,0 +1,55 @@
+From 9f03f42e2614a68f589f9db8fe76287146522c0c Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 30 Sep 2021 09:56:20 +0300
+Subject: [PATCH] Refactor pgpDigParams construction to helper function
+
+No functional changes, just to reduce code duplication and needed by
+the following commits.
+
+Dependent patch:
+CVE: CVE-2021-3521
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/9f03f42e2614a68f589f9db8fe76287146522c0c]
+Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
+
+---
+ rpmio/rpmpgp.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
+index 340de5fc9a..aad7c275c9 100644
+--- a/rpmio/rpmpgp.c
++++ b/rpmio/rpmpgp.c
+@@ -1055,6 +1055,13 @@ unsigned int pgpDigParamsAlgo(pgpDigParams digp, unsigned int algotype)
+     return algo;
+ }
+ 
++static pgpDigParams pgpDigParamsNew(uint8_t tag)
++{
++    pgpDigParams digp = xcalloc(1, sizeof(*digp));
++    digp->tag = tag;
++    return digp;
++}
++
+ int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
+ 		 pgpDigParams * ret)
+ {
+@@ -1072,8 +1079,7 @@ int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
+ 	    if (pkttype && pkt.tag != pkttype) {
+ 		break;
+ 	    } else {
+-		digp = xcalloc(1, sizeof(*digp));
+-		digp->tag = pkt.tag;
++		digp = pgpDigParamsNew(pkt.tag);
+ 	    }
+ 	}
+ 
+@@ -1121,8 +1127,7 @@ int pgpPrtParamsSubkeys(const uint8_t *pkts, size_t pktlen,
+ 		digps = xrealloc(digps, alloced * sizeof(*digps));
+ 	    }
+ 
+-	    digps[count] = xcalloc(1, sizeof(**digps));
+-	    digps[count]->tag = PGPTAG_PUBLIC_SUBKEY;
++	    digps[count] = pgpDigParamsNew(PGPTAG_PUBLIC_SUBKEY);
+ 	    /* Copy UID from main key to subkey */
+ 	    digps[count]->userid = xstrdup(mainkey->userid);
+ 
diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3521-03.patch b/meta/recipes-devtools/rpm/files/CVE-2021-3521-03.patch
new file mode 100644
index 0000000000..fd31f11beb
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-3521-03.patch
@@ -0,0 +1,34 @@
+From 5ff86764b17f31535cb247543a90dd739076ec38 Mon Sep 17 00:00:00 2001
+From: Demi Marie Obenour <demi@invisiblethingslab.com>
+Date: Thu, 6 May 2021 18:34:45 -0400
+Subject: [PATCH] Do not allow extra packets to follow a signature
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+According to RFC 4880 § 11.4, a detached signature is “simply a
+Signature packet”.  Therefore, extra packets following a detached
+signature are not allowed.
+
+Dependent patch:
+CVE: CVE-2021-3521
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/5ff86764b17f31535cb247543a90dd739076ec38]
+Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
+
+---
+ rpmio/rpmpgp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
+index f1a99e7169..5b346a8253 100644
+--- a/rpmio/rpmpgp.c
++++ b/rpmio/rpmpgp.c
+@@ -1068,6 +1068,8 @@ int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
+ 	    break;
+ 
+ 	p += (pkt.body - pkt.head) + pkt.blen;
++	if (pkttype == PGPTAG_SIGNATURE)
++	    break;
+     }
+ 
+     rc = (digp && (p == pend)) ? 0 : -1;
diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/CVE-2021-3521.patch
new file mode 100644
index 0000000000..cb9e9842fe
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-3521.patch
@@ -0,0 +1,330 @@
+From bd36c5dc9fb6d90c46fbfed8c2d67516fc571ec8 Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 30 Sep 2021 09:59:30 +0300
+Subject: [PATCH] Validate and require subkey binding signatures on PGP public
+ keys
+
+All subkeys must be followed by a binding signature by the primary key
+as per the OpenPGP RFC, enforce the presence and validity in the parser.
+
+The implementation is as kludgey as they come to work around our
+simple-minded parser structure without touching API, to maximise
+backportability. Store all the raw packets internally as we decode them
+to be able to access previous elements at will, needed to validate ordering
+and access the actual data. Add testcases for manipulated keys whose
+import previously would succeed.
+
+Depends on the two previous commits:
+7b399fcb8f52566e6f3b4327197a85facd08db91 and
+236b802a4aa48711823a191d1b7f753c82a89ec5
+
+CVE: CVE-2021-3521
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/bd36c5dc9fb6d90c46fbfed8c2d67516fc571ec8]
+Comment: Hunk refreshed
+Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
+
+Fixes CVE-2021-3521.
+---
+ rpmio/rpmpgp.c                                | 98 +++++++++++++++++--
+ tests/Makefile.am                             |  3 +
+ tests/data/keys/CVE-2021-3521-badbind.asc     | 25 +++++
+ .../data/keys/CVE-2021-3521-nosubsig-last.asc | 25 +++++
+ tests/data/keys/CVE-2021-3521-nosubsig.asc    | 37 +++++++
+ tests/rpmsigdig.at                            | 28 ++++++
+ 6 files changed, 209 insertions(+), 7 deletions(-)
+ create mode 100644 tests/data/keys/CVE-2021-3521-badbind.asc
+ create mode 100644 tests/data/keys/CVE-2021-3521-nosubsig-last.asc
+ create mode 100644 tests/data/keys/CVE-2021-3521-nosubsig.asc
+
+diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
+index aad7c275c9..d70802ae86 100644
+--- a/rpmio/rpmpgp.c
++++ b/rpmio/rpmpgp.c
+@@ -1004,37 +1004,121 @@  static pgpDigParams pgpDigParamsNew(uint8_t tag)
+     return digp;
+ }
+ 
++static int hashKey(DIGEST_CTX hash, const struct pgpPkt *pkt, int exptag)
++{
++    int rc = -1;
++    if (pkt->tag == exptag) {
++	uint8_t head[] = {
++	    0x99,
++	    (pkt->blen >> 8),
++	    (pkt->blen     ),
++	};
++
++	rpmDigestUpdate(hash, head, 3);
++	rpmDigestUpdate(hash, pkt->body, pkt->blen);
++	rc = 0;
++    }
++    return rc;
++}
++
++static int pgpVerifySelf(pgpDigParams key, pgpDigParams selfsig,
++			const struct pgpPkt *all, int i)
++{
++    int rc = -1;
++    DIGEST_CTX hash = NULL;
++
++    switch (selfsig->sigtype) {
++    case PGPSIGTYPE_SUBKEY_BINDING:
++	hash = rpmDigestInit(selfsig->hash_algo, 0);
++	if (hash) {
++	    rc = hashKey(hash, &all[0], PGPTAG_PUBLIC_KEY);
++	    if (!rc)
++		rc = hashKey(hash, &all[i-1], PGPTAG_PUBLIC_SUBKEY);
++	}
++	break;
++    default:
++	/* ignore types we can't handle */
++	rc = 0;
++	break;
++    }
++
++    if (hash && rc == 0)
++	rc = pgpVerifySignature(key, selfsig, hash);
++
++    rpmDigestFinal(hash, NULL, NULL, 0);
++
++    return rc;
++}
++
+ int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
+ 		 pgpDigParams * ret)
+ {
+     const uint8_t *p = pkts;
+     const uint8_t *pend = pkts + pktlen;
+     pgpDigParams digp = NULL;
+-    struct pgpPkt pkt;
++    pgpDigParams selfsig = NULL;
++    int i = 0;
++    int alloced = 16; /* plenty for normal cases */
++    struct pgpPkt *all = xmalloc(alloced * sizeof(*all));
+     int rc = -1; /* assume failure */
++    int expect = 0;
++    int prevtag = 0;
+ 
+     while (p < pend) {
+-	if (decodePkt(p, (pend - p), &pkt))
++	struct pgpPkt *pkt = &all[i];
++	if (decodePkt(p, (pend - p), pkt))
+ 	    break;
+ 
+ 	if (digp == NULL) {
+-	    if (pkttype && pkt.tag != pkttype) {
++	    if (pkttype && pkt->tag != pkttype) {
+ 		break;
+ 	    } else {
+-		digp = pgpDigParamsNew(pkt.tag);
++		digp = pgpDigParamsNew(pkt->tag);
+ 	    }
+ 	}
+ 
+-	if (pgpPrtPkt(&pkt, digp))
++	if (expect) {
++	    if (pkt->tag != expect)
++		break;
++	    selfsig = pgpDigParamsNew(pkt->tag);
++	}
++
++	if (pgpPrtPkt(pkt, selfsig ? selfsig : digp))
+ 	    break;
+ 
+-	p += (pkt.body - pkt.head) + pkt.blen;
++	if (selfsig) {
++	    /* subkeys must be followed by binding signature */
++	    if (prevtag == PGPTAG_PUBLIC_SUBKEY) {
++		if (selfsig->sigtype != PGPSIGTYPE_SUBKEY_BINDING)
++		    break;
++	    }
++
++	    int xx = pgpVerifySelf(digp, selfsig, all, i);
++
++	    selfsig = pgpDigParamsFree(selfsig);
++	    if (xx)
++		break;
++	    expect = 0;
++	}
++
++	if (pkt->tag == PGPTAG_PUBLIC_SUBKEY)
++	    expect = PGPTAG_SIGNATURE;
++	prevtag = pkt->tag;
++
++	i++;
++	p += (pkt->body - pkt->head) + pkt->blen;
+ 	if (pkttype == PGPTAG_SIGNATURE)
+ 	    break;
++
++	if (alloced <= i) {
++	    alloced *= 2;
++	    all = xrealloc(all, alloced * sizeof(*all));
++	}
+     }
+ 
+-    rc = (digp && (p == pend)) ? 0 : -1;
++    rc = (digp && (p == pend) && expect == 0) ? 0 : -1;
+ 
++    free(all);
+     if (ret && rc == 0) {
+ 	*ret = digp;
+     } else {
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index b4a2e2e1ce..bc535d2833 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -87,6 +87,9 @@ EXTRA_DIST += data/SPECS/hello-config-buildid.spec
+ EXTRA_DIST += data/SPECS/hello-cd.spec
+ EXTRA_DIST += data/keys/rpm.org-rsa-2048-test.pub
+ EXTRA_DIST += data/keys/rpm.org-rsa-2048-test.secret
++EXTRA_DIST += data/keys/CVE-2021-3521-badbind.asc
++EXTRA_DIST += data/keys/CVE-2021-3521-nosubsig.asc
++EXTRA_DIST += data/keys/CVE-2021-3521-nosubsig-last.asc
+ EXTRA_DIST += data/macros.testfile
+
+ # testsuite voodoo
+diff --git a/tests/data/keys/CVE-2021-3521-badbind.asc b/tests/data/keys/CVE-2021-3521-badbind.asc
+new file mode 100644
+index 0000000000..aea00f9d7a
+--- /dev/null
++++ b/tests/data/keys/CVE-2021-3521-badbind.asc
+@@ -0,0 +1,25 @@
++-----BEGIN PGP PUBLIC KEY BLOCK-----
++Version: rpm-4.17.90 (NSS-3)
++
++mQENBFjmORgBCAC7TMEk6wnjSs8Dr4yqSScWdU2pjcqrkTxuzdWvowcIUPZI0w/g
++HkRqGd4apjvY2V15kjL10gk3QhFP3pZ/9p7zh8o8NHX7aGdSGDK7NOq1eFaErPRY
++91LW9RiZ0lbOjXEzIL0KHxUiTQEmdXJT43DJMFPyW9fkCWg0OltiX618FUdWWfI8
++eySdLur1utnqBvdEbCUvWK2RX3vQZQdvEBODnNk2pxqTyV0w6VPQ96W++lF/5Aas
++7rUv3HIyIXxIggc8FRrnH+y9XvvHDonhTIlGnYZN4ubm9i4y3gOkrZlGTrEw7elQ
++1QeMyG2QQEbze8YjpTm4iLABCBrRfPRaQpwrABEBAAG0IXJwbS5vcmcgUlNBIHRl
++c3RrZXkgPHJzYUBycG0ub3JnPokBNwQTAQgAIQUCWOY5GAIbAwULCQgHAgYVCAkK
++CwIEFgIDAQIeAQIXgAAKCRBDRFkeGWTF/MxxCACnjqFL+MmPh9W9JQKT2DcLbBzf
++Cqo6wcEBoCOcwgRSk8dSikhARoteoa55JRJhuMyeKhhEAogE9HRmCPFdjezFTwgB
++BDVBpO2dZ023mLXDVCYX3S8pShOgCP6Tn4wqCnYeAdLcGg106N4xcmgtcssJE+Pr
++XzTZksbZsrTVEmL/Ym+R5w5jBfFnGk7Yw7ndwfQsfNXQb5AZynClFxnX546lcyZX
++fEx3/e6ezw57WNOUK6WT+8b+EGovPkbetK/rGxNXuWaP6X4A/QUm8O98nCuHYFQq
+++mvNdsCBqGf7mhaRGtpHk/JgCn5rFvArMDqLVrR9hX0LdCSsH7EGE+bR3r7wuQEN
++BFjmORgBCACk+vDZrIXQuFXEYToZVwb2attzbbJJCqD71vmZTLsW0QxuPKRgbcYY
++zp4K4lVBnHhFrF8MOUOxJ7kQWIJZMZFt+BDcptCYurbD2H4W2xvnWViiC+LzCMzz
++iMJT6165uefL4JHTDPxC2fFiM9yrc72LmylJNkM/vepT128J5Qv0gRUaQbHiQuS6
++Dm/+WRnUfx3i89SV4mnBxb/Ta93GVqoOciWwzWSnwEnWYAvOb95JL4U7c5J5f/+c
++KnQDHsW7sIiIdscsWzvgf6qs2Ra1Zrt7Fdk4+ZS2f/adagLhDO1C24sXf5XfMk5m
++L0OGwZSr9m5s17VXxfspgU5ugc8kBJfzABEBAAE=
++=WCfs
++-----END PGP PUBLIC KEY BLOCK-----
++
+diff --git a/tests/data/keys/CVE-2021-3521-nosubsig-last.asc b/tests/data/keys/CVE-2021-3521-nosubsig-last.asc
+new file mode 100644
+index 0000000000..aea00f9d7a
+--- /dev/null
++++ b/tests/data/keys/CVE-2021-3521-nosubsig-last.asc
+@@ -0,0 +1,25 @@
++-----BEGIN PGP PUBLIC KEY BLOCK-----
++Version: rpm-4.17.90 (NSS-3)
++
++mQENBFjmORgBCAC7TMEk6wnjSs8Dr4yqSScWdU2pjcqrkTxuzdWvowcIUPZI0w/g
++HkRqGd4apjvY2V15kjL10gk3QhFP3pZ/9p7zh8o8NHX7aGdSGDK7NOq1eFaErPRY
++91LW9RiZ0lbOjXEzIL0KHxUiTQEmdXJT43DJMFPyW9fkCWg0OltiX618FUdWWfI8
++eySdLur1utnqBvdEbCUvWK2RX3vQZQdvEBODnNk2pxqTyV0w6VPQ96W++lF/5Aas
++7rUv3HIyIXxIggc8FRrnH+y9XvvHDonhTIlGnYZN4ubm9i4y3gOkrZlGTrEw7elQ
++1QeMyG2QQEbze8YjpTm4iLABCBrRfPRaQpwrABEBAAG0IXJwbS5vcmcgUlNBIHRl
++c3RrZXkgPHJzYUBycG0ub3JnPokBNwQTAQgAIQUCWOY5GAIbAwULCQgHAgYVCAkK
++CwIEFgIDAQIeAQIXgAAKCRBDRFkeGWTF/MxxCACnjqFL+MmPh9W9JQKT2DcLbBzf
++Cqo6wcEBoCOcwgRSk8dSikhARoteoa55JRJhuMyeKhhEAogE9HRmCPFdjezFTwgB
++BDVBpO2dZ023mLXDVCYX3S8pShOgCP6Tn4wqCnYeAdLcGg106N4xcmgtcssJE+Pr
++XzTZksbZsrTVEmL/Ym+R5w5jBfFnGk7Yw7ndwfQsfNXQb5AZynClFxnX546lcyZX
++fEx3/e6ezw57WNOUK6WT+8b+EGovPkbetK/rGxNXuWaP6X4A/QUm8O98nCuHYFQq
+++mvNdsCBqGf7mhaRGtpHk/JgCn5rFvArMDqLVrR9hX0LdCSsH7EGE+bR3r7wuQEN
++BFjmORgBCACk+vDZrIXQuFXEYToZVwb2attzbbJJCqD71vmZTLsW0QxuPKRgbcYY
++zp4K4lVBnHhFrF8MOUOxJ7kQWIJZMZFt+BDcptCYurbD2H4W2xvnWViiC+LzCMzz
++iMJT6165uefL4JHTDPxC2fFiM9yrc72LmylJNkM/vepT128J5Qv0gRUaQbHiQuS6
++Dm/+WRnUfx3i89SV4mnBxb/Ta93GVqoOciWwzWSnwEnWYAvOb95JL4U7c5J5f/+c
++KnQDHsW7sIiIdscsWzvgf6qs2Ra1Zrt7Fdk4+ZS2f/adagLhDO1C24sXf5XfMk5m
++L0OGwZSr9m5s17VXxfspgU5ugc8kBJfzABEBAAE=
++=WCfs
++-----END PGP PUBLIC KEY BLOCK-----
++
+diff --git a/tests/data/keys/CVE-2021-3521-nosubsig.asc b/tests/data/keys/CVE-2021-3521-nosubsig.asc
+new file mode 100644
+index 0000000000..3a2e7417f8
+--- /dev/null
++++ b/tests/data/keys/CVE-2021-3521-nosubsig.asc
+@@ -0,0 +1,37 @@
++-----BEGIN PGP PUBLIC KEY BLOCK-----
++Version: rpm-4.17.90 (NSS-3)
++
++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
++E4XX4jtDmdZPreZALsiB
++=rRop
++-----END PGP PUBLIC KEY BLOCK-----
++
+diff --git a/tests/rpmsigdig.at b/tests/rpmsigdig.at
+index 0f8f2b4884..c8b9f139e1 100644
+--- a/tests/rpmsigdig.at
++++ b/tests/rpmsigdig.at
+@@ -240,6 +240,34 @@ gpg(185e6146f00650f8) = 4:185e6146f00650f8-58e63918
+ [])
+ AT_CLEANUP
+ 
++AT_SETUP([rpmkeys --import invalid keys])
++AT_KEYWORDS([rpmkeys import])
++RPMDB_INIT
++
++AT_CHECK([
++runroot rpmkeys --import /data/keys/CVE-2021-3521-badbind.asc
++],
++[1],
++[],
++[error: /data/keys/CVE-2021-3521-badbind.asc: key 1 import failed.]
++)
++AT_CHECK([
++runroot rpmkeys --import /data/keys/CVE-2021-3521-nosubsig.asc
++],
++[1],
++[],
++[error: /data/keys/CVE-2021-3521-nosubsig.asc: key 1 import failed.]
++)
++
++AT_CHECK([
++runroot rpmkeys --import /data/keys/CVE-2021-3521-nosubsig-last.asc
++],
++[1],
++[],
++[error: /data/keys/CVE-2021-3521-nosubsig-last.asc: key 1 import failed.]
++)
++AT_CLEANUP
++
+ # ------------------------------
+ # Test pre-built package verification
+ AT_SETUP([rpmkeys -K <signed> 1])
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 376021d913..4d605c8501 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -47,6 +47,10 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x;protoc
            file://0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch \
            file://CVE-2021-3421.patch \
            file://CVE-2021-20266.patch \
+           file://CVE-2021-3521-01.patch \
+           file://CVE-2021-3521-02.patch \
+           file://CVE-2021-3521-03.patch \
+           file://CVE-2021-3521.patch \
            "
 
 PE = "1"
-- 
2.25.1


