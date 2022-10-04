Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B29AC4321E
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:28 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.12233.1664898683745004841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=V4ouJtP8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 8-20020a17090a0b8800b00205d8564b11so13439195pjr.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=/lEi8flLZBYS/754zt9cNro9GPznMpl1CIScyN43jhk=;
        b=V4ouJtP8XRWwBjIbJHK7o6F2WFJ5exdL19IeLNXoJb+mLHjrQYsZBU54TJBMvG8So2
         5l/UkV+GPPDQcokz3LcifN7sAApsWHT6bJUwklWRDkIxT68/Ub4h+SzQuKy/cna8nlho
         SZZW/Zc2u0AtvW56VQsNVj3L6Btlsw+SH2NAmbEG1S1QixCDw0dUhh4yc9Bx/bKOTAkZ
         6Na7wqXC5fhT5DHnVVuW6Pkz9Rp0Lwq4JQg7OVyIcuk8jlbO+8yDYZnVRqeZu5otXDst
         g9g3dsrPLLVlhvO3CfRSg0UFbbUwhO80S5j9CnITWPMRY0gN6KVBhF6rqlSa76iScfMg
         rQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/lEi8flLZBYS/754zt9cNro9GPznMpl1CIScyN43jhk=;
        b=jc1l7IEMm4g11ms5TS67GCa6X6gSS3mTy22YnfYVRhzBQxza5FQ+87vCYtklftnxPF
         0i6Ydfwp2VVbWkm9OH8XfOKO9BiZDptUqW9oUqvpWHMp1+MbwaZzkXb4GXdVcnNIQNSl
         M+DkbmNPja+kl2Ocu0z2urBmhSaKIbuhabVUzx9tafsRmlR0ayAPrgI60m5Sl8kbKG6p
         R1Evl9lA+2vNtjJFza9mHrMY42Lxc9BPOX5cpX/eTn9stVk3k/jGqaXgtty7MeZx4AOr
         IsxD7EzWnmdPx/APc+p0d+cMfzPCArWuc6M3KTWNFzNrLGwmDC5f1fyzUJhOky+YICIv
         6vxw==
X-Gm-Message-State: ACrzQf0D7v2kkSjShyjnMuQw8Ysnom5o0mtBfrXIvsM54xblZormuP8P
	nd7turFf1TAt5IjWVCefZQRF1ILVCFWw1wd6
X-Google-Smtp-Source: 
 AMsMyM4TmM1LMFCSnB2O5ulb65NVWKh+wss1H6MZWr49iQmqC6Paef0MX/7OTdV4oi33sQm7UXbcYQ==
X-Received: by 2002:a17:90b:4d8a:b0:205:a847:d8ba with SMTP id
 oj10-20020a17090b4d8a00b00205a847d8bamr359663pjb.93.1664898682474;
        Tue, 04 Oct 2022 08:51:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/18] rpm: update 4.17.0 -> 4.17.1
Date: Tue,  4 Oct 2022 05:50:36 -1000
Message-Id: 
 <49a875322110e5c9d90d99473a0e3f874e42739c.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171414

From: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: 826eb17fe741d38be24d31f3bba35074e404a414)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rpm/files/0001-CVE-2021-3521.patch        |  57 ---
 ...lib-rpm-as-the-installation-path-for.patch |  14 +-
 ...-linux-gnux32-variant-to-triplet-han.patch |  31 ++
 .../rpm/files/0002-CVE-2021-3521.patch        |  64 ----
 .../rpm/files/0003-CVE-2021-3521.patch        | 329 ------------------
 .../rpm/{rpm_4.17.0.bb => rpm_4.17.1.bb}      |   6 +-
 6 files changed, 40 insertions(+), 461 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
 rename meta/recipes-devtools/rpm/{rpm_4.17.0.bb => rpm_4.17.1.bb} (97%)

diff --git a/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
deleted file mode 100644
index 044b4dd2a0..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 9a6871126f472feea057d5f803505ec8cc78f083 Mon Sep 17 00:00:00 2001
-From: Panu Matilainen <pmatilai@redhat.com>
-Date: Thu, 30 Sep 2021 09:56:20 +0300
-Subject: [PATCH 1/3] Refactor pgpDigParams construction to helper function
-
-No functional changes, just to reduce code duplication and needed by
-the following commits.
-
-CVE: CVE-2021-3521
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/9f03f42e2]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- rpmio/rpmpgp.c | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
-index d0688ebe9a..e472b5320f 100644
---- a/rpmio/rpmpgp.c
-+++ b/rpmio/rpmpgp.c
-@@ -1041,6 +1041,13 @@ unsigned int pgpDigParamsAlgo(pgpDigParams digp, unsigned int algotype)
-     return algo;
- }
- 
-+static pgpDigParams pgpDigParamsNew(uint8_t tag)
-+{
-+    pgpDigParams digp = xcalloc(1, sizeof(*digp));
-+    digp->tag = tag;
-+    return digp;
-+}
-+
- int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
- 		 pgpDigParams * ret)
- {
-@@ -1058,8 +1065,7 @@ int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
- 	    if (pkttype && pkt.tag != pkttype) {
- 		break;
- 	    } else {
--		digp = xcalloc(1, sizeof(*digp));
--		digp->tag = pkt.tag;
-+		digp = pgpDigParamsNew(pkt.tag);
- 	    }
- 	}
- 
-@@ -1105,8 +1111,7 @@ int pgpPrtParamsSubkeys(const uint8_t *pkts, size_t pktlen,
- 		digps = xrealloc(digps, alloced * sizeof(*digps));
- 	    }
- 
--	    digps[count] = xcalloc(1, sizeof(**digps));
--	    digps[count]->tag = PGPTAG_PUBLIC_SUBKEY;
-+	    digps[count] = pgpDigParamsNew(PGPTAG_PUBLIC_SUBKEY);
- 	    /* Copy UID from main key to subkey */
- 	    digps[count]->userid = xstrdup(mainkey->userid);
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 6d236ac400..c6cf9d4c88 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From 8d013fe154a162305f76141151baf767dd04b598 Mon Sep 17 00:00:00 2001
+From 4ab6a4c5bbad65c3401016bb26b87214cdd0c59b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index eb7d6941b..10a889b5d 100644
+index 372875fc4..1b7add9ee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -871,7 +871,7 @@ else
+@@ -884,7 +884,7 @@ else
      usrprefix=$prefix
  fi
  
@@ -27,10 +27,10 @@ index eb7d6941b..10a889b5d 100644
  
  AC_SUBST(OBJDUMP)
 diff --git a/macros.in b/macros.in
-index a1f795e5f..689e784ef 100644
+index d53ab5ed5..9d10441c8 100644
 --- a/macros.in
 +++ b/macros.in
-@@ -933,7 +933,7 @@ package or when debugging this package.\
+@@ -911,7 +911,7 @@ package or when debugging this package.\
  %_sharedstatedir	%{_prefix}/com
  %_localstatedir		%{_prefix}/var
  %_lib			lib
@@ -40,7 +40,7 @@ index a1f795e5f..689e784ef 100644
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
 diff --git a/rpm.am b/rpm.am
-index 7b57f433b..9bbb9ee96 100644
+index ebe4e40d1..e6920e258 100644
 --- a/rpm.am
 +++ b/rpm.am
 @@ -1,10 +1,10 @@
@@ -55,4 +55,4 @@ index 7b57f433b..9bbb9ee96 100644
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 11:0:2
+ rpm_version_info = 12:0:3
diff --git a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
new file mode 100644
index 0000000000..2174a79e75
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
@@ -0,0 +1,31 @@
+From 8f51462d41d8fe942d5d0a06f08d47f625141995 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 4 Aug 2022 12:15:08 +0200
+Subject: [PATCH] configure.ac: add linux-gnux32 variant to triplet handling
+
+x32 is a 64 bit x86 ABI with 32 bit pointers.
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2143]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 372875fc49..7d6a3d274e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -845,6 +845,10 @@ if echo "$host_os" | grep '.*-gnuabi64$' > /dev/null ; then
+ 	host_os=`echo "${host_os}" | sed 's/-gnuabi64$//'`
+ 	host_os_gnu=-gnuabi64
+ fi
++if echo "$host_os" | grep '.*-gnux32$' > /dev/null ; then
++	host_os=`echo "${host_os}" | sed 's/-gnux32$//'`
++	host_os_gnu=-gnux32
++fi
+ if echo "$host_os" | grep '.*-gnu$' > /dev/null ; then
+ 	host_os=`echo "${host_os}" | sed 's/-gnu$//'`
+ fi
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
deleted file mode 100644
index 683b57d455..0000000000
--- a/meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From c4b1bee51bbdd732b94b431a951481af99117703 Mon Sep 17 00:00:00 2001
-From: Panu Matilainen <pmatilai@redhat.com>
-Date: Thu, 30 Sep 2021 09:51:10 +0300
-Subject: [PATCH 2/3] Process MPI's from all kinds of signatures
-
-No immediate effect but needed by the following commits.
-
-CVE: CVE-2021-3521
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/b5e8bc74b]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- rpmio/rpmpgp.c | 13 +++++--------
- 1 file changed, 5 insertions(+), 8 deletions(-)
-
-diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
-index 25f67048fd..509e777e6d 100644
---- a/rpmio/rpmpgp.c
-+++ b/rpmio/rpmpgp.c
-@@ -543,7 +543,7 @@ pgpDigAlg pgpDigAlgFree(pgpDigAlg alg)
-     return NULL;
- }
- 
--static int pgpPrtSigParams(pgpTag tag, uint8_t pubkey_algo, uint8_t sigtype,
-+static int pgpPrtSigParams(pgpTag tag, uint8_t pubkey_algo,
- 		const uint8_t *p, const uint8_t *h, size_t hlen,
- 		pgpDigParams sigp)
- {
-@@ -556,10 +556,8 @@ static int pgpPrtSigParams(pgpTag tag, uint8_t pubkey_algo, uint8_t sigtype,
- 	int mpil = pgpMpiLen(p);
- 	if (pend - p < mpil)
- 	    break;
--	if (sigtype == PGPSIGTYPE_BINARY || sigtype == PGPSIGTYPE_TEXT) {
--	    if (sigalg->setmpi(sigalg, i, p))
--		break;
--	}
-+        if (sigalg->setmpi(sigalg, i, p))
-+            break;
- 	p += mpil;
-     }
- 
-@@ -619,7 +617,7 @@ static int pgpPrtSig(pgpTag tag, const uint8_t *h, size_t hlen,
- 	}
- 
- 	p = ((uint8_t *)v) + sizeof(*v);
--	rc = pgpPrtSigParams(tag, v->pubkey_algo, v->sigtype, p, h, hlen, _digp);
-+	rc = pgpPrtSigParams(tag, v->pubkey_algo, p, h, hlen, _digp);
-     }	break;
-     case 4:
-     {   pgpPktSigV4 v = (pgpPktSigV4)h;
-@@ -677,8 +675,7 @@ static int pgpPrtSig(pgpTag tag, const uint8_t *h, size_t hlen,
- 	p += 2;
- 	if (p > hend)
- 	    return 1;
--
--	rc = pgpPrtSigParams(tag, v->pubkey_algo, v->sigtype, p, h, hlen, _digp);
-+	rc = pgpPrtSigParams(tag, v->pubkey_algo, p, h, hlen, _digp);
-     }	break;
-     default:
- 	rpmlog(RPMLOG_WARNING, _("Unsupported version of signature: V%d\n"), version);
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch b/meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
deleted file mode 100644
index a5ec802501..0000000000
--- a/meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
+++ /dev/null
@@ -1,329 +0,0 @@
-From 07676ca03ad8afcf1ca95a2353c83fbb1d970b9b Mon Sep 17 00:00:00 2001
-From: Panu Matilainen <pmatilai@redhat.com>
-Date: Thu, 30 Sep 2021 09:59:30 +0300
-Subject: [PATCH 3/3] Validate and require subkey binding signatures on PGP
- public keys
-
-All subkeys must be followed by a binding signature by the primary key
-as per the OpenPGP RFC, enforce the presence and validity in the parser.
-
-The implementation is as kludgey as they come to work around our
-simple-minded parser structure without touching API, to maximise
-backportability. Store all the raw packets internally as we decode them
-to be able to access previous elements at will, needed to validate ordering
-and access the actual data. Add testcases for manipulated keys whose
-import previously would succeed.
-
-Depends on the two previous commits:
-7b399fcb8f52566e6f3b4327197a85facd08db91 and
-236b802a4aa48711823a191d1b7f753c82a89ec5
-
-Fixes CVE-2021-3521.
-
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/bd36c5dc9]
-CVE:CVE-2021-3521
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- rpmio/rpmpgp.c                                | 99 +++++++++++++++++--
- tests/Makefile.am                             |  3 +
- tests/data/keys/CVE-2021-3521-badbind.asc     | 25 +++++
- .../data/keys/CVE-2021-3521-nosubsig-last.asc | 25 +++++
- tests/data/keys/CVE-2021-3521-nosubsig.asc    | 37 +++++++
- tests/rpmsigdig.at                            | 28 ++++++
- 6 files changed, 209 insertions(+), 8 deletions(-)
- create mode 100644 tests/data/keys/CVE-2021-3521-badbind.asc
- create mode 100644 tests/data/keys/CVE-2021-3521-nosubsig-last.asc
- create mode 100644 tests/data/keys/CVE-2021-3521-nosubsig.asc
-
-diff --git a/rpmio/rpmpgp.c b/rpmio/rpmpgp.c
-index 509e777e6d..371ad4d9b6 100644
---- a/rpmio/rpmpgp.c
-+++ b/rpmio/rpmpgp.c
-@@ -1061,33 +1061,116 @@ static pgpDigParams pgpDigParamsNew(uint8_t tag)
-     return digp;
- }
- 
-+static int hashKey(DIGEST_CTX hash, const struct pgpPkt *pkt, int exptag)
-+{
-+    int rc = -1;
-+    if (pkt->tag == exptag) {
-+       uint8_t head[] = {
-+           0x99,
-+           (pkt->blen >> 8),
-+           (pkt->blen     ),
-+       };
-+
-+       rpmDigestUpdate(hash, head, 3);
-+       rpmDigestUpdate(hash, pkt->body, pkt->blen);
-+       rc = 0;
-+    }
-+    return rc;
-+}
-+
-+static int pgpVerifySelf(pgpDigParams key, pgpDigParams selfsig,
-+                       const struct pgpPkt *all, int i)
-+{
-+    int rc = -1;
-+    DIGEST_CTX hash = NULL;
-+
-+    switch (selfsig->sigtype) {
-+    case PGPSIGTYPE_SUBKEY_BINDING:
-+       hash = rpmDigestInit(selfsig->hash_algo, 0);
-+       if (hash) {
-+           rc = hashKey(hash, &all[0], PGPTAG_PUBLIC_KEY);
-+           if (!rc)
-+               rc = hashKey(hash, &all[i-1], PGPTAG_PUBLIC_SUBKEY);
-+       }
-+       break;
-+    default:
-+       /* ignore types we can't handle */
-+       rc = 0;
-+       break;
-+    }
-+
-+    if (hash && rc == 0)
-+       rc = pgpVerifySignature(key, selfsig, hash);
-+
-+    rpmDigestFinal(hash, NULL, NULL, 0);
-+
-+    return rc;
-+}
-+
- int pgpPrtParams(const uint8_t * pkts, size_t pktlen, unsigned int pkttype,
- 		 pgpDigParams * ret)
- {
-     const uint8_t *p = pkts;
-     const uint8_t *pend = pkts + pktlen;
-     pgpDigParams digp = NULL;
--    struct pgpPkt pkt;
-+    pgpDigParams selfsig = NULL;
-+    int i = 0;
-+    int alloced = 16; /* plenty for normal cases */
-+    struct pgpPkt *all = xmalloc(alloced * sizeof(*all));
-     int rc = -1; /* assume failure */
-+    int expect = 0;
-+    int prevtag = 0;
- 
-     while (p < pend) {
--	if (decodePkt(p, (pend - p), &pkt))
-+	struct pgpPkt *pkt = &all[i];
-+	if (decodePkt(p, (pend - p), pkt))
- 	    break;
- 
- 	if (digp == NULL) {
--	    if (pkttype && pkt.tag != pkttype) {
-+               if (pkttype && pkt->tag != pkttype) {
- 		break;
- 	    } else {
--		digp = pgpDigParamsNew(pkt.tag);
-+		digp = pgpDigParamsNew(pkt->tag);
- 	    }
- 	}
- 
--	if (pgpPrtPkt(&pkt, digp))
-+        if (expect) {
-+            if (pkt->tag != expect)
-+                break;
-+            selfsig = pgpDigParamsNew(pkt->tag);
-+        }
-+	if (pgpPrtPkt(pkt, selfsig ? selfsig : digp))
- 	    break;
- 
--	p += (pkt.body - pkt.head) + pkt.blen;
--	if (pkttype == PGPTAG_SIGNATURE)
--	    break;
-+	if (selfsig) {
-+           /* subkeys must be followed by binding signature */
-+           if (prevtag == PGPTAG_PUBLIC_SUBKEY) {
-+               if (selfsig->sigtype != PGPSIGTYPE_SUBKEY_BINDING)
-+                   break;
-+           }
-+
-+           int xx = pgpVerifySelf(digp, selfsig, all, i);
-+
-+           selfsig = pgpDigParamsFree(selfsig);
-+           if (xx)
-+               break;
-+           expect = 0;
-+       }
-+
-+       if (pkt->tag == PGPTAG_PUBLIC_SUBKEY)
-+           expect = PGPTAG_SIGNATURE;
-+       prevtag = pkt->tag;
-+
-+       i++;
-+       p += (pkt->body - pkt->head) + pkt->blen;
-+       if (pkttype == PGPTAG_SIGNATURE)
-+           break;
-+
-+       if (alloced <= i) {
-+           alloced *= 2;
-+           all = xrealloc(all, alloced * sizeof(*all));
-+       }
-+
-     }
- 
-     rc = (digp && (p == pend)) ? 0 : -1;
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index a41ce10de8..7bb23247f1 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -107,6 +107,9 @@ EXTRA_DIST += data/SPECS/hello-config-buildid.spec
- EXTRA_DIST += data/SPECS/hello-cd.spec
- EXTRA_DIST += data/keys/rpm.org-rsa-2048-test.pub
- EXTRA_DIST += data/keys/rpm.org-rsa-2048-test.secret
-+EXTRA_DIST += data/keys/CVE-2021-3521-badbind.asc
-+EXTRA_DIST += data/keys/CVE-2022-3521-nosubsig.asc
-+EXTRA_DIST += data/keys/CVE-2022-3521-nosubsig-last.asc
- EXTRA_DIST += data/macros.testfile
- EXTRA_DIST += data/macros.debug
- EXTRA_DIST += data/SOURCES/foo.c
-diff --git a/tests/data/keys/CVE-2021-3521-badbind.asc b/tests/data/keys/CVE-2021-3521-badbind.asc
-new file mode 100644
-index 0000000000..aea00f9d7a
---- /dev/null
-+++ b/tests/data/keys/CVE-2021-3521-badbind.asc
-@@ -0,0 +1,25 @@
-+-----BEGIN PGP PUBLIC KEY BLOCK-----
-+Version: rpm-4.17.90 (NSS-3)
-+
-+mQENBFjmORgBCAC7TMEk6wnjSs8Dr4yqSScWdU2pjcqrkTxuzdWvowcIUPZI0w/g
-+HkRqGd4apjvY2V15kjL10gk3QhFP3pZ/9p7zh8o8NHX7aGdSGDK7NOq1eFaErPRY
-+91LW9RiZ0lbOjXEzIL0KHxUiTQEmdXJT43DJMFPyW9fkCWg0OltiX618FUdWWfI8
-+eySdLur1utnqBvdEbCUvWK2RX3vQZQdvEBODnNk2pxqTyV0w6VPQ96W++lF/5Aas
-+7rUv3HIyIXxIggc8FRrnH+y9XvvHDonhTIlGnYZN4ubm9i4y3gOkrZlGTrEw7elQ
-+1QeMyG2QQEbze8YjpTm4iLABCBrRfPRaQpwrABEBAAG0IXJwbS5vcmcgUlNBIHRl
-+c3RrZXkgPHJzYUBycG0ub3JnPokBNwQTAQgAIQUCWOY5GAIbAwULCQgHAgYVCAkK
-+CwIEFgIDAQIeAQIXgAAKCRBDRFkeGWTF/MxxCACnjqFL+MmPh9W9JQKT2DcLbBzf
-+Cqo6wcEBoCOcwgRSk8dSikhARoteoa55JRJhuMyeKhhEAogE9HRmCPFdjezFTwgB
-+BDVBpO2dZ023mLXDVCYX3S8pShOgCP6Tn4wqCnYeAdLcGg106N4xcmgtcssJE+Pr
-+XzTZksbZsrTVEmL/Ym+R5w5jBfFnGk7Yw7ndwfQsfNXQb5AZynClFxnX546lcyZX
-+fEx3/e6ezw57WNOUK6WT+8b+EGovPkbetK/rGxNXuWaP6X4A/QUm8O98nCuHYFQq
-++mvNdsCBqGf7mhaRGtpHk/JgCn5rFvArMDqLVrR9hX0LdCSsH7EGE+bR3r7wuQEN
-+BFjmORgBCACk+vDZrIXQuFXEYToZVwb2attzbbJJCqD71vmZTLsW0QxuPKRgbcYY
-+zp4K4lVBnHhFrF8MOUOxJ7kQWIJZMZFt+BDcptCYurbD2H4W2xvnWViiC+LzCMzz
-+iMJT6165uefL4JHTDPxC2fFiM9yrc72LmylJNkM/vepT128J5Qv0gRUaQbHiQuS6
-+Dm/+WRnUfx3i89SV4mnBxb/Ta93GVqoOciWwzWSnwEnWYAvOb95JL4U7c5J5f/+c
-+KnQDHsW7sIiIdscsWzvgf6qs2Ra1Zrt7Fdk4+ZS2f/adagLhDO1C24sXf5XfMk5m
-+L0OGwZSr9m5s17VXxfspgU5ugc8kBJfzABEBAAE=
-+=WCfs
-+-----END PGP PUBLIC KEY BLOCK-----
-+
-diff --git a/tests/data/keys/CVE-2021-3521-nosubsig-last.asc b/tests/data/keys/CVE-2021-3521-nosubsig-last.asc
-new file mode 100644
-index 0000000000..aea00f9d7a
---- /dev/null
-+++ b/tests/data/keys/CVE-2021-3521-nosubsig-last.asc
-@@ -0,0 +1,25 @@
-+-----BEGIN PGP PUBLIC KEY BLOCK-----
-+Version: rpm-4.17.90 (NSS-3)
-+
-+mQENBFjmORgBCAC7TMEk6wnjSs8Dr4yqSScWdU2pjcqrkTxuzdWvowcIUPZI0w/g
-+HkRqGd4apjvY2V15kjL10gk3QhFP3pZ/9p7zh8o8NHX7aGdSGDK7NOq1eFaErPRY
-+91LW9RiZ0lbOjXEzIL0KHxUiTQEmdXJT43DJMFPyW9fkCWg0OltiX618FUdWWfI8
-+eySdLur1utnqBvdEbCUvWK2RX3vQZQdvEBODnNk2pxqTyV0w6VPQ96W++lF/5Aas
-+7rUv3HIyIXxIggc8FRrnH+y9XvvHDonhTIlGnYZN4ubm9i4y3gOkrZlGTrEw7elQ
-+1QeMyG2QQEbze8YjpTm4iLABCBrRfPRaQpwrABEBAAG0IXJwbS5vcmcgUlNBIHRl
-+c3RrZXkgPHJzYUBycG0ub3JnPokBNwQTAQgAIQUCWOY5GAIbAwULCQgHAgYVCAkK
-+CwIEFgIDAQIeAQIXgAAKCRBDRFkeGWTF/MxxCACnjqFL+MmPh9W9JQKT2DcLbBzf
-+Cqo6wcEBoCOcwgRSk8dSikhARoteoa55JRJhuMyeKhhEAogE9HRmCPFdjezFTwgB
-+BDVBpO2dZ023mLXDVCYX3S8pShOgCP6Tn4wqCnYeAdLcGg106N4xcmgtcssJE+Pr
-+XzTZksbZsrTVEmL/Ym+R5w5jBfFnGk7Yw7ndwfQsfNXQb5AZynClFxnX546lcyZX
-+fEx3/e6ezw57WNOUK6WT+8b+EGovPkbetK/rGxNXuWaP6X4A/QUm8O98nCuHYFQq
-++mvNdsCBqGf7mhaRGtpHk/JgCn5rFvArMDqLVrR9hX0LdCSsH7EGE+bR3r7wuQEN
-+BFjmORgBCACk+vDZrIXQuFXEYToZVwb2attzbbJJCqD71vmZTLsW0QxuPKRgbcYY
-+zp4K4lVBnHhFrF8MOUOxJ7kQWIJZMZFt+BDcptCYurbD2H4W2xvnWViiC+LzCMzz
-+iMJT6165uefL4JHTDPxC2fFiM9yrc72LmylJNkM/vepT128J5Qv0gRUaQbHiQuS6
-+Dm/+WRnUfx3i89SV4mnBxb/Ta93GVqoOciWwzWSnwEnWYAvOb95JL4U7c5J5f/+c
-+KnQDHsW7sIiIdscsWzvgf6qs2Ra1Zrt7Fdk4+ZS2f/adagLhDO1C24sXf5XfMk5m
-+L0OGwZSr9m5s17VXxfspgU5ugc8kBJfzABEBAAE=
-+=WCfs
-+-----END PGP PUBLIC KEY BLOCK-----
-+
-diff --git a/tests/data/keys/CVE-2021-3521-nosubsig.asc b/tests/data/keys/CVE-2021-3521-nosubsig.asc
-new file mode 100644
-index 0000000000..3a2e7417f8
---- /dev/null
-+++ b/tests/data/keys/CVE-2021-3521-nosubsig.asc
-@@ -0,0 +1,37 @@
-+-----BEGIN PGP PUBLIC KEY BLOCK-----
-+Version: rpm-4.17.90 (NSS-3)
-+
-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
-+E4XX4jtDmdZPreZALsiB
-+=rRop
-+-----END PGP PUBLIC KEY BLOCK-----
-+
-diff --git a/tests/rpmsigdig.at b/tests/rpmsigdig.at
-index 8e7c759b8f..e2d30a7f1b 100644
---- a/tests/rpmsigdig.at
-+++ b/tests/rpmsigdig.at
-@@ -2,6 +2,34 @@
- 
- AT_BANNER([RPM signatures and digests])
- 
-+AT_SETUP([rpmkeys --import invalid keys])
-+AT_KEYWORDS([rpmkeys import])
-+RPMDB_INIT
-+
-+AT_CHECK([
-+runroot rpmkeys --import /data/keys/CVE-2021-3521-badbind.asc
-+],
-+[1],
-+[],
-+[error: /data/keys/CVE-2021-3521-badbind.asc: key 1 import failed.]
-+)
-+AT_CHECK([
-+runroot rpmkeys --import /data/keys/CVE-2021-3521-nosubsig.asc
-+],
-+[1],
-+[],
-+[error: /data/keys/CVE-2021-3521-nosubsig.asc: key 1 import failed.]
-+)
-+
-+AT_CHECK([
-+runroot rpmkeys --import /data/keys/CVE-2021-3521-nosubsig-last.asc
-+],
-+[1],
-+[],
-+[error: /data/keys/CVE-2021-3521-nosubsig-last.asc: key 1 import failed.]
-+)
-+AT_CLEANUP
-+
- # ------------------------------
- # Test pre-built package verification
- AT_SETUP([rpmkeys -Kv <unsigned> 1])
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/rpm/rpm_4.17.0.bb b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
similarity index 97%
rename from meta/recipes-devtools/rpm/rpm_4.17.0.bb
rename to meta/recipes-devtools/rpm/rpm_4.17.1.bb
index c392ac0db4..9b6446f265 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
@@ -39,13 +39,11 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protoc
            file://0001-tools-Add-error.h-for-non-glibc-case.patch \
            file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
-           file://0001-CVE-2021-3521.patch \
-           file://0002-CVE-2021-3521.patch \
-           file://0003-CVE-2021-3521.patch \
+           file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
            "
 
 PE = "1"
-SRCREV = "3e74e8ba2dd5e76a5353d238dc7fc38651ce27b3"
+SRCREV = "5bef402da334595ed9302b8bca1acdf5e88bfe11"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


