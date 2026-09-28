Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04ABC9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 07:13:50 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51995.1790579623301999316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 00:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Nkk6s7Lr;
 spf=pass (domain: mvista.com, ip: 74.125.229.43, mailfrom: hprajapati@mvista.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340f56c44b0so937470eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 00:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790579623; x=1791184423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5kVV7WqFnJMxYlVc8f8NiZBfdtwJuff9S0G2pjJVU8=;
        b=Nkk6s7Lrg6/coUUowCTfA1Swbuwiz+MX5Kbx9sEif7/d9GXbvA1r0MxhYLHWV1fFq0
         Mtv/pu0DLK4ROUsXKbmjS5wR6mcwY2gO2ssHSp3SZD0Fst1ZRVNwj5PgT3ozs09JqaE4
         +bx8HZfUPy2yeq4IL/ZcycVAQYaTnV9U+qTvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790579623; x=1791184423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E5kVV7WqFnJMxYlVc8f8NiZBfdtwJuff9S0G2pjJVU8=;
        b=MDS6wrYcuxMhdpJkpCZalMCKNtfCz+Rx3ZpbohcjN75VH1EUuh7aEfl0s1TB6tPY/M
         BW1pWHKSasuVw8258AP94w1HGmjYkRVBghb1xX8a5Z3t/ybHJuH10UXsKIJpLmLUuurw
         n0HHJY3xPL6nRkrDRSHGruwGgvyyMUaCPTnfww1vlgTm5mVP2UCKbs8r379CufZkm2NM
         xLs5XpdsQ1ar4PgCTJJaslTc3mrczp9BTQr8ck1NRUtXhwxaXRi1/BSEWBT3h/Z8LcRO
         R2OJ0+iZ5Ae2q38jMEpc5JxcD++3ToazQwSGu5HZfbox1159OXGTgDVW6vlSuPlakdIv
         1drg==
X-Gm-Message-State: AFq9FYKlh0AVJdhD99bcDSMAAmB6SVlsrOambuYfg6kNO6XMe+3BAD8o
	VHPHWPpg94plSBWQz17JkgmHatMUFC2lrC9hAps3glJfVhWYdoP2aaboRlEi+DfCw5CxdG3qEnE
	P0fQZaDk=
X-Gm-Gg: AYBFou1GAJ53CfTe06ZbO/CRaJ1DGKxoyXn1G+JDtxGC3yF3wlQxE4Ym4kouvLO/8vS
	M3Mm1Zt6l8NBSiEbDzrqNH7L9ss10NQxscmUk/ETwrANDjVKW6m+NvEwYRs/11c+bHd8lX182Wk
	SzreYaDaXnIyh8ZMB41HDq3evNDed/QBq2iUco56isKekhZ5CmBNjC7TIeFpphdtsUG1xzPATlS
	/DePxZS4qT2jT9C6Di8LnnXauUjuU4/TaYVDc59WlY2phUgVj+K3XqaOLSqJ9RcumMgXuBTCMJ3
	azOt+XnTz4yP8fft0JOOSl1tfVUIBHMtXs1YHt0/wqtn+P5/kN+xKhSFWNl00eTS5FgsMge3tD+
	DKpYbGINBaKxNquEMuPR9mSJW8HUCQU92pI8MPgjbcJLR6Tpc2Pzl0RldQt9vccdivEJR7/EVVo
	6dTDCxt6rd41RUx83KGDk27w/2CSEo/TitiyW0Au/a4uj6LFomf+KS2urT7fC5brHsz32wGPANO
	YJgtwXVkHI=
X-Received: by 2002:a05:7300:640e:b0:33b:ebaa:e03b with SMTP id 5a478bee46e88-34271d8d7b6mr11104716eec.22.1790579622234;
        Mon, 28 Sep 2026 00:13:42 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm31166948eec.22.2026.09.28.00.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:13:41 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 5/6] bind: fix for CVE-2026-12617
Date: Mon, 28 Sep 2026 12:41:10 +0530
Message-ID: <20260928071115.304055-5-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260928071115.304055-1-hprajapati@mvista.com>
References: <20260928071115.304055-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 07:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246735

Pick patch from [1] & [2] also mentioned at Debian report in [2]

[1] https://gitlab.isc.org/isc-projects/bind9/-/commit/c740c37689f234e21a9b0ef760471ef2cf1133f5
[2] https://gitlab.isc.org/isc-projects/bind9/-/commit/bb92832fb6ae899bee7206c2d8966258461c2f71
[3] https://security-tracker.debian.org/tracker/CVE-2026-12617

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../bind/bind/CVE-2026-12617-01.patch         | 283 +++++++++++++++++
 .../bind/bind/CVE-2026-12617-02.patch         | 292 ++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.18.49.bb |   2 +
 3 files changed, 577 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-12617-01.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-12617-02.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-12617-01.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-12617-01.patch
new file mode 100644
index 0000000000..35d357374b
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-12617-01.patch
@@ -0,0 +1,283 @@
+From: Colin Vidal <colin@isc.org>
+Date: Thu, 18 Jun 2026 18:17:05 +0200
+Subject: Do not assert in some CNAME/DNAME queries
+
+Fix a `named` crash because of a fail assertion for certains types of
+CNAME and DNAME queries:
+
+- If a client queries for a DNAME and A record to the resolver, and the
+  authoritative server responds positively to the A query but delay the
+  DNAME response and respond later negatively;
+
+- If a client queries for a CNAME and A record to the resolver, and the
+  authoritative server responds positively to the A query but delay the
+  CNAME response and respond later with a self-referential CNAME.
+
+The first scenario consists of sending two queries: `foo.test./DNAME`
+and `a.foo.test./A`. The authoritative server delays the answer for
+`foo.test./DNAME` but immediately answers the DNAME record for the
+second query: `foo.test. DNAME bar.test.`. The resolver caches it,
+follows the DNAME, and resolves `a.bar.test./A`. The authoritative
+server eventually answers negatively for `foo.test./DNAME`
+(NOERROR/NODATA, with only an SOA in the authority section). The
+resolver pulls out the previously cached rdataset (because it has a
+higher trust level than the received negative answer), and wrongly (this
+is the first bug) sets the result to `DNS_R_DNAME` instead of
+`ISC_R_SUCCESS`. The code in `ns/query.c` that handles the resolver
+result interprets this as "this is a non-DNAME query and we got a DNAME
+rdataset, so follow the chain". It goes into the `query_dname()`
+function, which asserts that the qname is a subdomain of the owner name
+in the rdataset. That assertion fails because the qname (`foo.test.`) is
+exactly equal to the owner name of the DNAME (`foo.test.`), rather than
+being a subdomain of it. `DNS_R_DNAME` must only be set when the qtype
+is something other than DNAME and the resolver has obtained a DNAME that
+needs to be followed.
+
+The second scenario consists of sending two queries:
+`cname.foo.test./CNAME` and `cname.foo.test./A`. The authoritative
+server delays the answer for `cname.foo.test./CNAME` but immediately
+answers the CNAME record for the second query: `cname.foo.test. CNAME
+cname.foo.test.`. Note that the CNAME is self-referential. The resolver
+caches it and sets the result code to `DNS_R_CNAME`. Then `ns/query.c`
+interprets this as "this is a non-CNAME query and we got a CNAME
+rdataset, so follow the chain" (which is correct in this case; however,
+because the CNAME rdataset is self-referential, the resolver responds
+with SERVFAIL, which is expected). The authoritative server eventually
+answers negatively for `cname.foo.test./CNAME`. The resolver then pulls
+out the previously cached CNAME rdataset (obtained from the A answer,
+even though it was self-referential, the resolver cached it) and wrongly
+sets the result to `DNS_R_CNAME` (this is the second bug). As noted
+above, `ns/query.c` interprets this as "this is a non-CNAME query and we
+got a CNAME rdataset, so follow the chain". The internals here are
+slightly more subtle: it first goes into `query_cname()` and sets the
+CNAME rdataset in the message answer section, then restarts the query to
+follow the CNAME. The restart retrieves the CNAME rdataset from the
+cache directly (without going to the resolver), and this time the query
+context result is `ISC_R_SUCCESS` (since it was found) and
+`qctx->rdataset` points to the same CNAME again (as it is
+self-referential), so it goes directly into the
+`query_prepresponse()/query_respond()` flow, which attempts to add the
+rdataset to the message answer again. However, this fails because the
+rdataset is already in the message, and the assertion which expects that
+operation to succeed fails (due to `qctx->rdataset` being set to `NULL`
+when ownership of the rdataset was transferred). `DNS_R_CNAME` must only
+be set when the qtype is something other than CNAME and the resolver has
+obtained a CNAME that needs to be followed.
+
+In both cases, the correct answer from the resolver should have been
+`ISC_R_SUCCESS` (instead of respectively `DNS_R_DNAME` and
+`DNS_R_CNAME`) becuase the rdataset that has been looked up was found.
+
+(cherry picked from commit 773d46d58c693047a5945c8fe40512edd0ac214e)
+
+Origin: https://gitlab.isc.org/isc-projects/bind9/-/commit/c740c37689f234e21a9b0ef760471ef2cf1133f5
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-12617
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-12617
+
+CVE: CVE-2026-12617
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/c740c37689f234e21a9b0ef760471ef2cf1133f5]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/dns/resolver.c | 137 +++++++++++++++++++++++------------------------------
+ 1 file changed, 60 insertions(+), 77 deletions(-)
+
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 9d46126..06c779e 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -692,10 +692,10 @@ fctx_destroy(fetchctx_t *fctx, bool exiting);
+ static void
+ send_shutdown_events(dns_resolver_t *res);
+ static isc_result_t
+-ncache_adderesult(dns_message_t *message, dns_db_t *cache, dns_dbnode_t *node,
+-		  dns_rdatatype_t covers, isc_stdtime_t now, dns_ttl_t minttl,
+-		  dns_ttl_t maxttl, bool optout, bool secure,
+-		  dns_rdataset_t *ardataset, isc_result_t *eresultp);
++ncache_adderesult(fetchctx_t *fctx, dns_message_t *message, dns_dbnode_t *node,
++		  dns_rdatatype_t covers, isc_stdtime_t now, dns_ttl_t maxttl,
++		  bool optout, bool secure, dns_rdataset_t *ardataset,
++		  isc_result_t *eresultp);
+ static void
+ validated(isc_task_t *task, isc_event_t *event);
+ static void
+@@ -5580,6 +5580,46 @@ has_000_label(dns_rdataset_t *nsecset) {
+ 	return false;
+ }
+ 
++/*
++ * After a (non-error) negative-cache add, 'rdataset' is bound to whatever
++ * rdataset the cache authoritatively holds for the queried name and type.
++ * Map that to the result code the fetch should report:
++ *
++ *   - A negative cache entry (the one we just added, or a pre-existing one):
++ *     DNS_R_NCACHENXDOMAIN or DNS_R_NCACHENXRRSET, depending on NXDOMAIN vs
++ *     NODATA.
++ *
++ *   - A positive rdataset that was already cached at higher trust, which
++ *     caused our negative entry to be discarded (e.g. a CNAME or DNAME cached
++ *     by a concurrent query): ISC_R_SUCCESS, because that cached positive
++ *     answer is what gets returned.  Note the specific case for CNAME and
++ *     DNAME *if* the query type is not the same as the rdataset type. There
++ *     is a chain to follow *only* if the query type doesn't ask for the CNAME
++ *     or the DNAME.
++ */
++static isc_result_t
++fctx_setresult(fetchctx_t *fctx, dns_rdataset_t *rdataset) {
++	isc_result_t result = ISC_R_SUCCESS;
++
++	if (NEGATIVE(rdataset)) {
++		result = NXDOMAIN(rdataset) ? DNS_R_NCACHENXDOMAIN
++					    : DNS_R_NCACHENXRRSET;
++	} else if (result == ISC_R_SUCCESS && rdataset->type != fctx->type) {
++		switch (rdataset->type) {
++		case dns_rdatatype_cname:
++			result = DNS_R_CNAME;
++			break;
++		case dns_rdatatype_dname:
++			result = DNS_R_DNAME;
++			break;
++		default:
++			break;
++		}
++	}
++
++	return result;
++}
++
+ /*
+  * The validator has finished.
+  */
+@@ -5853,8 +5893,7 @@ validated(isc_task_t *task, isc_event_t *event) {
+ 			ttl = 0;
+ 		}
+ 
+-		result = ncache_adderesult(message, fctx->cache, node, covers,
+-					   now, fctx->res->view->minncachettl,
++		result = ncache_adderesult(fctx, message, node, covers, now,
+ 					   ttl, vevent->optout, vevent->secure,
+ 					   ardataset, &eresult);
+ 		if (result != ISC_R_SUCCESS) {
+@@ -6098,23 +6137,7 @@ answer_response:
+ 		 */
+ 		INSIST(hevent->rdataset != NULL);
+ 		if (dns_rdataset_isassociated(hevent->rdataset)) {
+-			if (NEGATIVE(hevent->rdataset)) {
+-				INSIST(eresult == DNS_R_NCACHENXDOMAIN ||
+-				       eresult == DNS_R_NCACHENXRRSET);
+-			} else if (eresult == ISC_R_SUCCESS &&
+-				   hevent->rdataset->type != fctx->type)
+-			{
+-				switch (hevent->rdataset->type) {
+-				case dns_rdatatype_cname:
+-					eresult = DNS_R_CNAME;
+-					break;
+-				case dns_rdatatype_dname:
+-					eresult = DNS_R_DNAME;
+-					break;
+-				default:
+-					break;
+-				}
+-			}
++			eresult = fctx_setresult(fctx, hevent->rdataset);
+ 		}
+ 
+ 		hevent->result = eresult;
+@@ -6764,24 +6787,7 @@ cache_name(fetchctx_t *fctx, dns_name_t *name, dns_message_t *message,
+ 			 * event->result.
+ 			 */
+ 			if (dns_rdataset_isassociated(event->rdataset)) {
+-				if (NEGATIVE(event->rdataset)) {
+-					INSIST(eresult ==
+-						       DNS_R_NCACHENXDOMAIN ||
+-					       eresult == DNS_R_NCACHENXRRSET);
+-				} else if (eresult == ISC_R_SUCCESS &&
+-					   event->rdataset->type != fctx->type)
+-				{
+-					switch (event->rdataset->type) {
+-					case dns_rdatatype_cname:
+-						eresult = DNS_R_CNAME;
+-						break;
+-					case dns_rdatatype_dname:
+-						eresult = DNS_R_DNAME;
+-						break;
+-					default:
+-						break;
+-					}
+-				}
++				eresult = fctx_setresult(fctx, event->rdataset);
+ 			}
+ 			event->result = eresult;
+ 			if (adbp != NULL && *adbp != NULL) {
+@@ -6850,12 +6856,14 @@ cache_message(fetchctx_t *fctx, dns_message_t *message,
+  * eresult.
+  */
+ static isc_result_t
+-ncache_adderesult(dns_message_t *message, dns_db_t *cache, dns_dbnode_t *node,
+-		  dns_rdatatype_t covers, isc_stdtime_t now, dns_ttl_t minttl,
+-		  dns_ttl_t maxttl, bool optout, bool secure,
+-		  dns_rdataset_t *ardataset, isc_result_t *eresultp) {
++ncache_adderesult(fetchctx_t *fctx, dns_message_t *message, dns_dbnode_t *node,
++		  dns_rdatatype_t covers, isc_stdtime_t now, dns_ttl_t maxttl,
++		  bool optout, bool secure, dns_rdataset_t *ardataset,
++		  isc_result_t *eresultp) {
+ 	isc_result_t result;
+ 	dns_rdataset_t rdataset;
++	dns_db_t *cache = fctx->cache;
++	dns_ttl_t minttl = fctx->res->view->minncachettl;
+ 
+ 	if (ardataset == NULL) {
+ 		dns_rdataset_init(&rdataset);
+@@ -6871,37 +6879,13 @@ ncache_adderesult(dns_message_t *message, dns_db_t *cache, dns_dbnode_t *node,
+ 	}
+ 	if (result == DNS_R_UNCHANGED || result == ISC_R_SUCCESS) {
+ 		/*
+-		 * If the cache now contains a negative entry and we
+-		 * care about whether it is DNS_R_NCACHENXDOMAIN or
+-		 * DNS_R_NCACHENXRRSET then extract it.
++		 * The cache settled successfully (DNS_R_UNCHANGED means our
++		 * negative entry was discarded in favour of existing
++		 * higher-trust data).  Either way 'ardataset' is now bound to
++		 * the rdataset the cache holds for this name and type; derive
++		 * the result code from it.
+ 		 */
+-		if (NEGATIVE(ardataset)) {
+-			/*
+-			 * The cache data is a negative cache entry.
+-			 */
+-			if (NXDOMAIN(ardataset)) {
+-				*eresultp = DNS_R_NCACHENXDOMAIN;
+-			} else {
+-				*eresultp = DNS_R_NCACHENXRRSET;
+-			}
+-		} else {
+-			/*
+-			 * The attempt to add a negative cache entry
+-			 * was rejected.  Set *eresultp to reflect
+-			 * the type of the dataset being returned.
+-			 */
+-			switch (ardataset->type) {
+-			case dns_rdatatype_cname:
+-				*eresultp = DNS_R_CNAME;
+-				break;
+-			case dns_rdatatype_dname:
+-				*eresultp = DNS_R_DNAME;
+-				break;
+-			default:
+-				*eresultp = ISC_R_SUCCESS;
+-				break;
+-			}
+-		}
++		*eresultp = fctx_setresult(fctx, ardataset);
+ 		result = ISC_R_SUCCESS;
+ 	}
+ 	if (ardataset == &rdataset && dns_rdataset_isassociated(ardataset)) {
+@@ -7046,8 +7030,7 @@ ncache_message(fetchctx_t *fctx, dns_message_t *message,
+ 		ttl = 0;
+ 	}
+ 
+-	result = ncache_adderesult(message, fctx->cache, node, covers, now,
+-				   fctx->res->view->minncachettl, ttl, false,
++	result = ncache_adderesult(fctx, message, node, covers, now, ttl, false,
+ 				   false, ardataset, &eresult);
+ 	if (result != ISC_R_SUCCESS) {
+ 		goto unlock;
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-12617-02.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-12617-02.patch
new file mode 100644
index 0000000000..7dfaafb80d
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-12617-02.patch
@@ -0,0 +1,292 @@
+From: Colin Vidal <colin@isc.org>
+Date: Mon, 15 Jun 2026 11:34:08 +0200
+Subject: Reproducer for #5946 (assertion in some CNAME/DNAME queries)
+
+Add a system test reproducing the issue reported by #5946, which
+is also CVE-2026-12617. There are two scenarios:
+
+- A client send queries for a DNAME and A record to the resolver (ns3),
+  and the authoritative server (ans2) responds positively to the A query
+  but delay the DNAME response and respond later negatively;
+
+- A client send queries for a CNAME and A record to the resolver (ns3),
+  and the authoritative server (ans2) responds positively to the A query
+  but delay the CNAME response and respond later with a self-referential
+  CNAME.
+
+The test does not check the results of the queries, however, it expects
+the resolver to correctly handle those and do not assert.
+
+(cherry picked from commit e88271f2e584010157b068cc998dd76451273562)
+
+Origin: https://gitlab.isc.org/isc-projects/bind9/-/commit/bb92832fb6ae899bee7206c2d8966258461c2f71
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-12617
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-12617
+
+CVE: CVE-2026-12617
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/bb92832fb6ae899bee7206c2d8966258461c2f71]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ bin/tests/system/cname_dname_negcache/ans2/ans.py  | 98 ++++++++++++++++++++++
+ .../system/cname_dname_negcache/ns1/bar.test.db    |  5 ++
+ .../system/cname_dname_negcache/ns1/named.conf.j2  | 24 ++++++
+ bin/tests/system/cname_dname_negcache/ns1/root.db  |  6 ++
+ bin/tests/system/cname_dname_negcache/ns1/test.db  |  8 ++
+ .../system/cname_dname_negcache/ns3/named.conf.j2  | 11 +++
+ .../tests_cname_dname_negcache.py                  | 53 ++++++++++++
+ 7 files changed, 205 insertions(+)
+ create mode 100644 bin/tests/system/cname_dname_negcache/ans2/ans.py
+ create mode 100644 bin/tests/system/cname_dname_negcache/ns1/bar.test.db
+ create mode 100644 bin/tests/system/cname_dname_negcache/ns1/named.conf.j2
+ create mode 100644 bin/tests/system/cname_dname_negcache/ns1/root.db
+ create mode 100644 bin/tests/system/cname_dname_negcache/ns1/test.db
+ create mode 100644 bin/tests/system/cname_dname_negcache/ns3/named.conf.j2
+ create mode 100644 bin/tests/system/cname_dname_negcache/tests_cname_dname_negcache.py
+
+diff --git a/bin/tests/system/cname_dname_negcache/ans2/ans.py b/bin/tests/system/cname_dname_negcache/ans2/ans.py
+new file mode 100644
+index 0000000..eec5c90
+--- /dev/null
++++ b/bin/tests/system/cname_dname_negcache/ans2/ans.py
+@@ -0,0 +1,98 @@
++"""
++Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++
++SPDX-License-Identifier: MPL-2.0
++
++This Source Code Form is subject to the terms of the Mozilla Public
++License, v. 2.0.  If a copy of the MPL was not distributed with this
++file, you can obtain one at https://mozilla.org/MPL/2.0/.
++
++See the COPYRIGHT file distributed with this work for additional
++information regarding copyright ownership.
++"""
++
++from collections.abc import AsyncGenerator
++
++from dns import name, rcode, rdataclass, rdatatype, rrset
++
++from isctest.asyncserver import (
++    AsyncDnsServer,
++    DnsResponseSend,
++    QnameQtypeHandler,
++    QueryContext,
++    StaticResponseHandler,
++)
++
++
++def build_rrset(
++    qname: name.Name | str,
++    rtype: rdatatype.RdataType,
++    rdata: str,
++    ttl: int = 300,
++) -> rrset.RRset:
++    return rrset.from_text(qname, ttl, rdataclass.IN, rtype, rdata)
++
++
++class FooTestNsHandler(QnameQtypeHandler, StaticResponseHandler):
++    qnames = ["foo.test."]
++    qtypes = [rdatatype.NS]
++    answer = [build_rrset("foo.test.", rdatatype.NS, "ns.foo.test.")]
++    additional = [build_rrset("ns.foo.test.", rdatatype.A, "10.53.0.2")]
++
++
++class DelayedDnameNegHandler(QnameQtypeHandler, StaticResponseHandler):
++    qnames = ["foo.test."]
++    qtypes = [rdatatype.DNAME]
++    authority = [
++        build_rrset(
++            "foo.test.",
++            rdatatype.SOA,
++            "ns.test. op.ns.test. 2081509183 86400 3600 3600000 300",
++        )
++    ]
++    delay = 1
++
++
++class DnamePosHandler(QnameQtypeHandler, StaticResponseHandler):
++    qnames = ["a.foo.test."]
++    qtypes = [rdatatype.A]
++    answer = [
++        build_rrset("foo.test.", rdatatype.DNAME, "bar.test."),
++        build_rrset("a.foo.test.", rdatatype.CNAME, "a.bar.test."),
++    ]
++
++
++class CnameHandler(QnameQtypeHandler):
++    qnames = ["cname.foo.test."]
++    qtypes = [rdatatype.CNAME, rdatatype.A]
++    answer = [build_rrset("cname.foo.test.", rdatatype.CNAME, "cname.foo.test.")]
++    authority = [
++        build_rrset(
++            "cname.foo.test.",
++            rdatatype.SOA,
++            "ns.test. op.ns.test. 2081509183 86400 3600 3600000 300",
++        )
++    ]
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[DnsResponseSend, None]:
++        qctx.prepare_new_response(with_zone_data=False)
++        if qctx.qtype == rdatatype.CNAME:
++            qctx.response.authority.extend(self.authority)
++            yield DnsResponseSend(qctx.response, authoritative=True, delay=1)
++        else:
++            qctx.response.answer.extend(self.answer)
++            yield DnsResponseSend(qctx.response, authoritative=True)
++
++
++def main() -> None:
++    server = AsyncDnsServer(default_aa=True, default_rcode=rcode.NOERROR)
++    server.install_response_handlers(
++        FooTestNsHandler(), DelayedDnameNegHandler(), DnamePosHandler(), CnameHandler()
++    )
++    server.run()
++
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/cname_dname_negcache/ns1/bar.test.db b/bin/tests/system/cname_dname_negcache/ns1/bar.test.db
+new file mode 100644
+index 0000000..840b9c3
+--- /dev/null
++++ b/bin/tests/system/cname_dname_negcache/ns1/bar.test.db
+@@ -0,0 +1,5 @@
++$TTL 300
++bar.test.        IN SOA  ns.bar.test. hostmaster.bar.test. 1 600 600 1200 600
++bar.test.        NS      ns.bar.test.
++ns    		 A       10.53.0.1
++a      		 A       10.0.0.1
+diff --git a/bin/tests/system/cname_dname_negcache/ns1/named.conf.j2 b/bin/tests/system/cname_dname_negcache/ns1/named.conf.j2
+new file mode 100644
+index 0000000..d72dd11
+--- /dev/null
++++ b/bin/tests/system/cname_dname_negcache/ns1/named.conf.j2
+@@ -0,0 +1,24 @@
++options {
++    query-source address @ns.ip@;
++    port @PORT@;
++    pid-file "named.pid";
++    listen-on { @ns.ip@; };
++    listen-on-v6 { none; };
++    recursion no;
++    dnssec-validation no;
++};
++
++zone "." {
++	type primary;
++	file "root.db";
++};
++
++zone "test." {
++	type primary;
++	file "test.db";
++};
++
++zone "bar.test." {
++	type primary;
++	file "bar.test.db";
++};
+diff --git a/bin/tests/system/cname_dname_negcache/ns1/root.db b/bin/tests/system/cname_dname_negcache/ns1/root.db
+new file mode 100644
+index 0000000..c456c45
+--- /dev/null
++++ b/bin/tests/system/cname_dname_negcache/ns1/root.db
+@@ -0,0 +1,6 @@
++$TTL 300
++.        IN SOA  ns. hostmaster. 1 600 600 1200 600
++.	         	NS      a.root-servers.nil.
++a.root-servers.nil.    	A       10.53.0.1
++test    	 	NS      ns.test
++ns.test		 	A	 10.53.0.1
+diff --git a/bin/tests/system/cname_dname_negcache/ns1/test.db b/bin/tests/system/cname_dname_negcache/ns1/test.db
+new file mode 100644
+index 0000000..acb68e0
+--- /dev/null
++++ b/bin/tests/system/cname_dname_negcache/ns1/test.db
+@@ -0,0 +1,8 @@
++$TTL 300
++test.        IN SOA  ns.test. hostmaster.test. 1 600 600 1200 600
++test.	         NS      ns.test.
++ns    		 A       10.53.0.1
++bar    		 NS      ns.bar
++ns.bar		 A	 10.53.0.1
++foo		 NS	 ns.foo
++ns.foo		 A	 10.53.0.2
+diff --git a/bin/tests/system/cname_dname_negcache/ns3/named.conf.j2 b/bin/tests/system/cname_dname_negcache/ns3/named.conf.j2
+new file mode 100644
+index 0000000..197d727
+--- /dev/null
++++ b/bin/tests/system/cname_dname_negcache/ns3/named.conf.j2
+@@ -0,0 +1,11 @@
++options {
++    query-source address @ns.ip@;
++    port @PORT@;
++    pid-file "named.pid";
++    listen-on { @ns.ip@; };
++    listen-on-v6 { none; };
++    recursion yes;
++    dnssec-validation no;
++};
++
++{% include "_common/root.hint.conf" %}
+diff --git a/bin/tests/system/cname_dname_negcache/tests_cname_dname_negcache.py b/bin/tests/system/cname_dname_negcache/tests_cname_dname_negcache.py
+new file mode 100644
+index 0000000..5d21c5b
+--- /dev/null
++++ b/bin/tests/system/cname_dname_negcache/tests_cname_dname_negcache.py
+@@ -0,0 +1,53 @@
++# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++#
++# SPDX-License-Identifier: MPL-2.0
++#
++# This Source Code Form is subject to the terms of the Mozilla Public
++# License, v. 2.0.  If a copy of the MPL was not distributed with this
++# file, you can obtain one at https://mozilla.org/MPL/2.0/.
++#
++# See the COPYRIGHT file distributed with this work for additional
++# information regarding copyright ownership.
++
++from os import environ
++from re import compile as Re
++from socket import AF_INET, SOCK_DGRAM, socket
++
++import isctest
++
++
++def run_attack(ns, name1, type1, name2, type2):
++    msg1 = isctest.query.create(name1, type1, cd=True)
++    msg2 = isctest.query.create(name2, type2, cd=True)
++    port = int(environ["PORT"])
++
++    with socket(AF_INET, SOCK_DGRAM) as sock:
++        # The order the request does out doesn't matter. What is important is
++        # the first query starts recursion before the second query returns the
++        # answer, and the second query returns the answer before the first
++        # query returns the answer. (So, when the NOERROR/NODATA cames back
++        # from the first query, the cache is queried and we get the positive
++        # response cached from the second query attached to the fresp rdataset
++        # of the response of the first query.)
++        # Therefore, the logic is really baked into ans2, which has a 3 seconds
++        # delay to answer the first query.
++        sock.sendto(msg1.to_wire(), (ns.ip, port))
++        sock.sendto(msg2.to_wire(), (ns.ip, port))
++
++    # The second query come back immediately, the resolver caches the DNAME.
++    # The first query  come back after 3s (because of intentional ans2 latency
++    # on foo.test./DNAME answer) and should not crash the server.
++    with ns.watch_log_from_start(timeout=15) as watcher:
++        watcher.wait_for_sequence(
++            [
++                Re(r"foo\.test\..*IN\s+SOA\s+ns\.test\.\s+op\.ns\.test\."),
++            ]
++        )
++
++
++def test_dname_negcache(ns3):
++    run_attack(ns3, "foo.test.", "DNAME", "a.foo.test.", "A")
++
++
++def test_cname_negcache(ns3):
++    run_attack(ns3, "cname.foo.test.", "CNAME", "cname.foo.test.", "A")
diff --git a/meta/recipes-connectivity/bind/bind_9.18.49.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
index 8218772531..b048ba6559 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.49.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -33,6 +33,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2026-11721-01.patch \
            file://CVE-2026-11721-02.patch \
            file://CVE-2026-11721-03.patch \
+           file://CVE-2026-12617-01.patch \
+           file://CVE-2026-12617-02.patch \
            "
 
 SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
-- 
2.50.1


