Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCEFC433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 02:21:44 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.7053.1640917303402395686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 18:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 192.103.53.11,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BV2LgIB032245
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 18:21:42 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 30 Dec 2021 18:21:42 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 30 Dec 2021 18:21:41 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 30 Dec 2021 18:21:41 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V3][PATCH] rpm: fix CVE-2021-3521
Date: Fri, 31 Dec 2021 10:21:40 +0800
Message-ID: <20211231022140.33421-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 02:21:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160085

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../rpm/files/0001-CVE-2021-3521.patch        |  57 +++
 .../rpm/files/0002-CVE-2021-3521.patch        |  64 ++++
 .../rpm/files/0003-CVE-2021-3521.patch        | 329 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.17.0.bb       |   3 +
 4 files changed, 453 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
new file mode 100644
index 0000000000..b374583017
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
@@ -0,0 +1,57 @@
+From 9a6871126f472feea057d5f803505ec8cc78f083 Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 30 Sep 2021 09:56:20 +0300
+Subject: [PATCH 1/3] Refactor pgpDigParams construction to helper function
+
+No functional changes, just to reduce code duplication and needed by
+the following commits.
+
+CVE: CVE-2021-3521
+Upstream-Status: Backport[https://github.com/rpm-software-management/rpm/commit/9f03f42e2]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ rpmio/rpmpgp.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
+index d0688ebe9a..e472b5320f 100644
+--- a/rpmio/rpmpgp.c
++++ b/rpmio/rpmpgp.c
+@@ -1041,6 +1041,13 @@ unsigned int pgpDigParamsAlgo(pgpDigParams digp, unsigned int algotype)
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
+@@ -1058,8 +1065,7 @@ int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
+ 	    if (pkttype && pkt.tag != pkttype) {
+ 		break;
+ 	    } else {
+-		digp = xcalloc(1, sizeof(*digp));
+-		digp->tag = pkt.tag;
++		digp = pgpDigParamsNew(pkt.tag);
+ 	    }
+ 	}
+ 
+@@ -1105,8 +1111,7 @@ int pgpPrtParamsSubkeys(const uint8_t *pkts, size_t pktlen,
+ 		digps = xrealloc(digps, alloced * sizeof(*digps));
+ 	    }
+ 
+-	    digps[count] = xcalloc(1, sizeof(**digps));
+-	    digps[count]->tag = PGPTAG_PUBLIC_SUBKEY;
++	    digps[count] = pgpDigParamsNew(PGPTAG_PUBLIC_SUBKEY);
+ 	    /* Copy UID from main key to subkey */
+ 	    digps[count]->userid = xstrdup(mainkey->userid);
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
new file mode 100644
index 0000000000..b93a1d5404
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
@@ -0,0 +1,64 @@
+From c4b1bee51bbdd732b94b431a951481af99117703 Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 30 Sep 2021 09:51:10 +0300
+Subject: [PATCH 2/3] Process MPI's from all kinds of signatures
+
+No immediate effect but needed by the following commits.
+
+CVE: CVE-2021-3521
+Upstream-Status: Backport[https://github.com/rpm-software-management/rpm/commit/b5e8bc74b]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ rpmio/rpmpgp.c | 13 +++++--------
+ 1 file changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
+index 25f67048fd..509e777e6d 100644
+--- a/rpmio/rpmpgp.c
++++ b/rpmio/rpmpgp.c
+@@ -543,7 +543,7 @@ pgpDigAlg pgpDigAlgFree(pgpDigAlg alg)
+     return NULL;
+ }
+ 
+-static int pgpPrtSigParams(pgpTag tag, uint8_t pubkey_algo, uint8_t sigtype,
++static int pgpPrtSigParams(pgpTag tag, uint8_t pubkey_algo,
+ 		const uint8_t *p, const uint8_t *h, size_t hlen,
+ 		pgpDigParams sigp)
+ {
+@@ -556,10 +556,8 @@ static int pgpPrtSigParams(pgpTag tag, uint8_t pubkey_algo, uint8_t sigtype,
+ 	int mpil = pgpMpiLen(p);
+ 	if (pend - p < mpil)
+ 	    break;
+-	if (sigtype == PGPSIGTYPE_BINARY || sigtype == PGPSIGTYPE_TEXT) {
+-	    if (sigalg->setmpi(sigalg, i, p))
+-		break;
+-	}
++        if (sigalg->setmpi(sigalg, i, p))
++            break;
+ 	p += mpil;
+     }
+ 
+@@ -619,7 +617,7 @@ static int pgpPrtSig(pgpTag tag, const uint8_t *h, size_t hlen,
+ 	}
+ 
+ 	p = ((uint8_t *)v) + sizeof(*v);
+-	rc = pgpPrtSigParams(tag, v->pubkey_algo, v->sigtype, p, h, hlen, _digp);
++	rc = pgpPrtSigParams(tag, v->pubkey_algo, p, h, hlen, _digp);
+     }	break;
+     case 4:
+     {   pgpPktSigV4 v = (pgpPktSigV4)h;
+@@ -677,8 +675,7 @@ static int pgpPrtSig(pgpTag tag, const uint8_t *h, size_t hlen,
+ 	p += 2;
+ 	if (p > hend)
+ 	    return 1;
+-
+-	rc = pgpPrtSigParams(tag, v->pubkey_algo, v->sigtype, p, h, hlen, _digp);
++	rc = pgpPrtSigParams(tag, v->pubkey_algo, p, h, hlen, _digp);
+     }	break;
+     default:
+ 	rpmlog(RPMLOG_WARNING, _("Unsupported version of signature: V%d\n"), version);
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
new file mode 100644
index 0000000000..a5ec802501
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
@@ -0,0 +1,329 @@
+From 07676ca03ad8afcf1ca95a2353c83fbb1d970b9b Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 30 Sep 2021 09:59:30 +0300
+Subject: [PATCH 3/3] Validate and require subkey binding signatures on PGP
+ public keys
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
+Fixes CVE-2021-3521.
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/bd36c5dc9]
+CVE:CVE-2021-3521
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ rpmio/rpmpgp.c                                | 99 +++++++++++++++++--
+ tests/Makefile.am                             |  3 +
+ tests/data/keys/CVE-2021-3521-badbind.asc     | 25 +++++
+ .../data/keys/CVE-2021-3521-nosubsig-last.asc | 25 +++++
+ tests/data/keys/CVE-2021-3521-nosubsig.asc    | 37 +++++++
+ tests/rpmsigdig.at                            | 28 ++++++
+ 6 files changed, 209 insertions(+), 8 deletions(-)
+ create mode 100644 tests/data/keys/CVE-2021-3521-badbind.asc
+ create mode 100644 tests/data/keys/CVE-2021-3521-nosubsig-last.asc
+ create mode 100644 tests/data/keys/CVE-2021-3521-nosubsig.asc
+
+diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
+index 509e777e6d..371ad4d9b6 100644
+--- a/rpmio/rpmpgp.c
++++ b/rpmio/rpmpgp.c
+@@ -1061,33 +1061,116 @@ static pgpDigParams pgpDigParamsNew(uint8_t tag)
+     return digp;
+ }
+ 
++static int hashKey(DIGEST_CTX hash, const struct pgpPkt *pkt, int exptag)
++{
++    int rc = -1;
++    if (pkt->tag == exptag) {
++       uint8_t head[] = {
++           0x99,
++           (pkt->blen >> 8),
++           (pkt->blen     ),
++       };
++
++       rpmDigestUpdate(hash, head, 3);
++       rpmDigestUpdate(hash, pkt->body, pkt->blen);
++       rc = 0;
++    }
++    return rc;
++}
++
++static int pgpVerifySelf(pgpDigParams key, pgpDigParams selfsig,
++                       const struct pgpPkt *all, int i)
++{
++    int rc = -1;
++    DIGEST_CTX hash = NULL;
++
++    switch (selfsig->sigtype) {
++    case PGPSIGTYPE_SUBKEY_BINDING:
++       hash = rpmDigestInit(selfsig->hash_algo, 0);
++       if (hash) {
++           rc = hashKey(hash, &all[0], PGPTAG_PUBLIC_KEY);
++           if (!rc)
++               rc = hashKey(hash, &all[i-1], PGPTAG_PUBLIC_SUBKEY);
++       }
++       break;
++    default:
++       /* ignore types we can't handle */
++       rc = 0;
++       break;
++    }
++
++    if (hash && rc == 0)
++       rc = pgpVerifySignature(key, selfsig, hash);
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
++               if (pkttype && pkt->tag != pkttype) {
+ 		break;
+ 	    } else {
+-		digp = pgpDigParamsNew(pkt.tag);
++		digp = pgpDigParamsNew(pkt->tag);
+ 	    }
+ 	}
+ 
+-	if (pgpPrtPkt(&pkt, digp))
++        if (expect) {
++            if (pkt->tag != expect)
++                break;
++            selfsig = pgpDigParamsNew(pkt->tag);
++        }
++	if (pgpPrtPkt(pkt, selfsig ? selfsig : digp))
+ 	    break;
+ 
+-	p += (pkt.body - pkt.head) + pkt.blen;
+-	if (pkttype == PGPTAG_SIGNATURE)
+-	    break;
++	if (selfsig) {
++           /* subkeys must be followed by binding signature */
++           if (prevtag == PGPTAG_PUBLIC_SUBKEY) {
++               if (selfsig->sigtype != PGPSIGTYPE_SUBKEY_BINDING)
++                   break;
++           }
++
++           int xx = pgpVerifySelf(digp, selfsig, all, i);
++
++           selfsig = pgpDigParamsFree(selfsig);
++           if (xx)
++               break;
++           expect = 0;
++       }
++
++       if (pkt->tag == PGPTAG_PUBLIC_SUBKEY)
++           expect = PGPTAG_SIGNATURE;
++       prevtag = pkt->tag;
++
++       i++;
++       p += (pkt->body - pkt->head) + pkt->blen;
++       if (pkttype == PGPTAG_SIGNATURE)
++           break;
++
++       if (alloced <= i) {
++           alloced *= 2;
++           all = xrealloc(all, alloced * sizeof(*all));
++       }
++
+     }
+ 
+     rc = (digp && (p == pend)) ? 0 : -1;
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index a41ce10de8..7bb23247f1 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -107,6 +107,9 @@ EXTRA_DIST += data/SPECS/hello-config-buildid.spec
+ EXTRA_DIST += data/SPECS/hello-cd.spec
+ EXTRA_DIST += data/keys/rpm.org-rsa-2048-test.pub
+ EXTRA_DIST += data/keys/rpm.org-rsa-2048-test.secret
++EXTRA_DIST += data/keys/CVE-2021-3521-badbind.asc
++EXTRA_DIST += data/keys/CVE-2022-3521-nosubsig.asc
++EXTRA_DIST += data/keys/CVE-2022-3521-nosubsig-last.asc
+ EXTRA_DIST += data/macros.testfile
+ EXTRA_DIST += data/macros.debug
+ EXTRA_DIST += data/SOURCES/foo.c
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
++L0OGwZSr9m5s17VXxfspgU5ugc8kBJfzABEBAAG5AQ0EWOY5GAEIAKT68NmshdC4
++VcRhOhlXBvZq23NtskkKoPvW+ZlMuxbRDG48pGBtxhjOngriVUGceEWsXww5Q7En
++uRBYglkxkW34ENym0Ji6tsPYfhbbG+dZWKIL4vMIzPOIwlPrXrm558vgkdMM/ELZ
++8WIz3KtzvYubKUk2Qz+96lPXbwnlC/SBFRpBseJC5LoOb/5ZGdR/HeLz1JXiacHF
++v9Nr3cZWqg5yJbDNZKfASdZgC85v3kkvhTtzknl//5wqdAMexbuwiIh2xyxbO+B/
++qqzZFrVmu3sV2Tj5lLZ/9p1qAuEM7ULbixd/ld8yTmYvQ4bBlKv2bmzXtVfF+ymB
++Tm6BzyQEl/MAEQEAAYkBHwQYAQgACQUCWOY5GAIbDAAKCRBDRFkeGWTF/PANB/9j
++mifmj6z/EPe0PJFhrpISt9PjiUQCt0IPtiL5zKAkWjHePIzyi+0kCTBF6DDLFxos
++3vN4bWnVKT1kBhZAQlPqpJTg+m74JUYeDGCdNx9SK7oRllATqyu+5rncgxjWVPnQ
++zu/HRPlWJwcVFYEVXYL8xzfantwQTqefjmcRmBRdA2XJITK+hGWwAmrqAWx+q5xX
++Pa8wkNMxVzNS2rUKO9SoVuJ/wlUvfoShkJ/VJ5HDp3qzUqncADfdGN35TDzscngQ
++gHvnMwVBfYfSCABV1hNByoZcc/kxkrWMmsd/EnIyLd1Q1baKqc3cEDuC6E6/o4yJ
++E4XX4jtDmdZPreZALsiB
++=rRop
++-----END PGP PUBLIC KEY BLOCK-----
++
+diff --git a/tests/rpmsigdig.at b/tests/rpmsigdig.at
+index 8e7c759b8f..e2d30a7f1b 100644
+--- a/tests/rpmsigdig.at
++++ b/tests/rpmsigdig.at
+@@ -2,6 +2,34 @@
+ 
+ AT_BANNER([RPM signatures and digests])
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
+ AT_SETUP([rpmkeys -Kv <unsigned> 1])
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.17.0.bb b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
index beb03ba3dd..11d720cf87 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
@@ -39,6 +39,9 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protoc
            file://0001-tools-Add-error.h-for-non-glibc-case.patch \
            file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
+           file://0001-CVE-2021-3521.patch \
+           file://0002-CVE-2021-3521.patch \
+           file://0003-CVE-2021-3521.patch \
            "
 
 PE = "1"
-- 
2.17.1


