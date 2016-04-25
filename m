Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D74E97001D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 01:10:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3P1Ahgi019287
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 18:10:43 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 24 Apr 2016 18:10:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Apr 2016 18:10:36 -0700
Message-ID: <24bd8345fd6ee1e13b4a32000380d8459f2ba41d.1461546574.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461546574.git.liezhi.yang@windriver.com>
References: <cover.1461546574.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] bind: CVE-2016-1285 CVE-2016-1286
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2016 01:10:44 -0000
Content-Type: text/plain

From: Sona Sarmadi <sona.sarmadi@enea.com>

CVE-2016-1285 bind: malformed packet sent to rndc can trigger assertion failure
CVE-2016-1286 bind: malformed signature records for DNAME records can
trigger assertion failure

[YOCTO #9400]

External References:
https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2016-1285
https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2016-1286
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-1285
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-1286

References to the Upstream commits and Security Advisories:

CVE-2016-1285: https://kb.isc.org/article/AA-01352
https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=patch;
h=e7e15d1302b26a96fa0a5307d6f2cb0d8ad4ea63

CVE-2016-1286: https://kb.isc.org/article/AA-01353
https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=patch;
h=456e1eadd2a3a2fb9617e60d4db90ef4ba7c6ba3

https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=patch;
h=499952eb459c9a41d2092f1d98899c131f9103b2

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../bind/bind/CVE-2016-1285.patch                  | 138 +++++++++
 .../bind/bind/CVE-2016-1286_1.patch                |  79 +++++
 .../bind/bind/CVE-2016-1286_2.patch                | 318 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   3 +
 4 files changed, 538 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
new file mode 100644
index 0000000..f73f642
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
@@ -0,0 +1,138 @@
+From e7e15d1302b26a96fa0a5307d6f2cb0d8ad4ea63 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Thu, 18 Feb 2016 12:11:27 +1100
+Subject: [PATCH] 4318. [security] Malformed control messages can
+trigger assertions in named and rndc. (CVE-2016-1285) [RT #41666]
+
+(cherry picked from commit a2b15b3305acd52179e6f3dc7d073b07fbc40b8e)
+
+Hand applied Changelog changes.
+
+CVE: CVE-2016-1285
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/bin/named/control.c b/bin/named/control.c
+--- a/bin/named/control.c	2015-08-15 02:28:49.000000000 +0200
++++ b/bin/named/control.c	2016-04-11 09:38:20.940827528 +0200
+@@ -69,7 +69,7 @@
+ #endif
+ 
+ 	data = isccc_alist_lookup(message, "_data");
+-	if (data == NULL) {
++	if (!isccc_alist_alistp(data)) {
+ 		/*
+ 		 * No data section.
+ 		 */
+diff -ruN a/bin/named/controlconf.c b/bin/named/controlconf.c
+--- a/bin/named/controlconf.c	2015-08-15 02:28:49.000000000 +0200
++++ b/bin/named/controlconf.c	2016-04-11 09:38:20.944827355 +0200
+@@ -402,7 +402,7 @@
+ 	 * Limit exposure to replay attacks.
+ 	 */
+ 	_ctrl = isccc_alist_lookup(request, "_ctrl");
+-	if (_ctrl == NULL) {
++	if (!isccc_alist_alistp(_ctrl)) {
+ 		log_invalid(&conn->ccmsg, ISC_R_FAILURE);
+ 		goto cleanup_request;
+ 	}
+diff -ruN a/bin/rndc/rndc.c b/bin/rndc/rndc.c
+--- a/bin/rndc/rndc.c	2015-08-15 02:28:49.000000000 +0200
++++ b/bin/rndc/rndc.c	2016-04-11 09:38:20.944827355 +0200
+@@ -254,8 +254,8 @@
+ 	   isccc_cc_fromwire(&source, &response, algorithm, &secret));
+ 
+ 	data = isccc_alist_lookup(response, "_data");
+-	if (data == NULL)
+-		fatal("no data section in response");
++	if (!isccc_alist_alistp(data))
++		fatal("bad or missing data section in response");
+ 	result = isccc_cc_lookupstring(data, "err", &errormsg);
+ 	if (result == ISC_R_SUCCESS) {
+ 		failed = ISC_TRUE;
+@@ -320,8 +320,8 @@
+ 	   isccc_cc_fromwire(&source, &response, algorithm, &secret));
+ 
+ 	_ctrl = isccc_alist_lookup(response, "_ctrl");
+-	if (_ctrl == NULL)
+-		fatal("_ctrl section missing");
++	if (!isccc_alist_alistp(_ctrl))
++		fatal("bad or missing ctrl section in response");
+ 	nonce = 0;
+ 	if (isccc_cc_lookupuint32(_ctrl, "_nonce", &nonce) != ISC_R_SUCCESS)
+ 		nonce = 0;
+diff -ruN a/CHANGES b/CHANGES
+--- a/CHANGES	2016-04-11 09:36:08.546578759 +0200
++++ b/CHANGES	2016-04-11 09:39:59.356552273 +0200
+@@ -1,3 +1,6 @@
++4318.  [security]      Malformed control messages can trigger assertions
++                       in named and rndc. (CVE-2016-1285) [RT #41666]
++
+ 4146.  [bug]           Address reference leak that could prevent a clean
+                        shutdown. [RT #37125]
+ 
+diff -ruN a/lib/isccc/cc.c b/lib/isccc/cc.c
+--- a/lib/isccc/cc.c	2015-08-15 02:28:49.000000000 +0200
++++ b/lib/isccc/cc.c	2016-04-11 09:38:20.944827355 +0200
+@@ -403,13 +403,13 @@
+ 	 * Extract digest.
+ 	 */
+ 	_auth = isccc_alist_lookup(alist, "_auth");
+-	if (_auth == NULL)
++	if (!isccc_alist_alistp(_auth))
+ 		return (ISC_R_FAILURE);
+ 	if (algorithm == ISCCC_ALG_HMACMD5)
+ 		hmac = isccc_alist_lookup(_auth, "hmd5");
+ 	else
+ 		hmac = isccc_alist_lookup(_auth, "hsha");
+-	if (hmac == NULL)
++	if (!isccc_sexpr_binaryp(hmac))
+ 		return (ISC_R_FAILURE);
+ 	/*
+ 	 * Compute digest.
+@@ -728,7 +728,7 @@
+ 	REQUIRE(ackp != NULL && *ackp == NULL);
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+-	if (_ctrl == NULL ||
++	if (!isccc_alist_alistp(_ctrl) ||
+ 	    isccc_cc_lookupuint32(_ctrl, "_ser", &serial) != ISC_R_SUCCESS ||
+ 	    isccc_cc_lookupuint32(_ctrl, "_tim", &t) != ISC_R_SUCCESS)
+ 		return (ISC_R_FAILURE);
+@@ -773,7 +773,7 @@
+ 	isccc_sexpr_t *_ctrl;
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+-	if (_ctrl == NULL)
++	if (!isccc_alist_alistp(_ctrl))
+ 		return (ISC_FALSE);
+ 	if (isccc_cc_lookupstring(_ctrl, "_ack", NULL) == ISC_R_SUCCESS)
+ 		return (ISC_TRUE);
+@@ -786,7 +786,7 @@
+ 	isccc_sexpr_t *_ctrl;
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+-	if (_ctrl == NULL)
++	if (!isccc_alist_alistp(_ctrl))
+ 		return (ISC_FALSE);
+ 	if (isccc_cc_lookupstring(_ctrl, "_rpl", NULL) == ISC_R_SUCCESS)
+ 		return (ISC_TRUE);
+@@ -806,7 +806,7 @@
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+ 	_data = isccc_alist_lookup(message, "_data");
+-	if (_ctrl == NULL || _data == NULL ||
++	if (!isccc_alist_alistp(_ctrl) || !isccc_alist_alistp(_data) ||
+ 	    isccc_cc_lookupuint32(_ctrl, "_ser", &serial) != ISC_R_SUCCESS ||
+ 	    isccc_cc_lookupstring(_data, "type", &type) != ISC_R_SUCCESS)
+ 		return (ISC_R_FAILURE);
+@@ -995,7 +995,7 @@
+ 	isccc_sexpr_t *_ctrl;
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+-	if (_ctrl == NULL ||
++	if (!isccc_alist_alistp(_ctrl) ||
+ 	    isccc_cc_lookupstring(_ctrl, "_ser", &_ser) != ISC_R_SUCCESS ||
+ 	    isccc_cc_lookupstring(_ctrl, "_tim", &_tim) != ISC_R_SUCCESS)
+ 		return (ISC_R_FAILURE);
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
new file mode 100644
index 0000000..5002147
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
@@ -0,0 +1,79 @@
+From 456e1eadd2a3a2fb9617e60d4db90ef4ba7c6ba3 Mon Sep 17 00:00:00 2001
+From: Mukund Sivaraman <muks@isc.org>
+Date: Mon, 22 Feb 2016 12:22:43 +0530
+Subject: [PATCH] Fix resolver assertion failure due to improper DNAME handling
+ (CVE-2016-1286) (#41753)
+
+(cherry picked from commit 5995fec51cc8bb7e53804e4936e60aa1537f3673)
+
+Hand applied Changelog changes.
+
+CVE: CVE-2016-1286
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/CHANGES b/CHANGES
+--- a/CHANGES	2016-04-11 09:46:42.075057394 +0200
++++ b/CHANGES	2016-04-11 09:44:21.857148819 +0200
+@@ -1,3 +1,7 @@
++4319.  [security]      Fix resolver assertion failure due to improper
++                       DNAME handling when parsing fetch reply messages.
++                       (CVE-2016-1286) [RT #41753]
++
+ 4318.  [security]      Malformed control messages can trigger assertions
+                        in named and rndc. (CVE-2016-1285) [RT #41666]
+ 
+diff -ruN a/lib/dns/resolver.c b/lib/dns/resolver.c
+--- a/lib/dns/resolver.c	2016-04-11 09:36:08.550578585 +0200
++++ b/lib/dns/resolver.c	2016-04-11 09:43:23.091701714 +0200
+@@ -6634,21 +6634,26 @@
+ 				isc_boolean_t found_dname = ISC_FALSE;
+ 				dns_name_t *dname_name;
+ 
++				/*
++				 * Only pass DNAME or RRSIG(DNAME).
++				 */
++				if (rdataset->type != dns_rdatatype_dname &&
++				    (rdataset->type != dns_rdatatype_rrsig ||
++				     rdataset->covers != dns_rdatatype_dname))
++					continue;
++
++				/*
++				 * If we're not chaining, then the DNAME and
++				 * its signature should not be external.
++				 */
++				if (!chaining && external) {
++					log_formerr(fctx, "external DNAME");
++					return (DNS_R_FORMERR);
++				}
++
+ 				found = ISC_FALSE;
+ 				aflag = 0;
+ 				if (rdataset->type == dns_rdatatype_dname) {
+-					/*
+-					 * We're looking for something else,
+-					 * but we found a DNAME.
+-					 *
+-					 * If we're not chaining, then the
+-					 * DNAME should not be external.
+-					 */
+-					if (!chaining && external) {
+-						log_formerr(fctx,
+-							    "external DNAME");
+-						return (DNS_R_FORMERR);
+-					}
+ 					found = ISC_TRUE;
+ 					want_chaining = ISC_TRUE;
+ 					POST(want_chaining);
+@@ -6677,9 +6682,7 @@
+ 							&fctx->domain)) {
+ 						return (DNS_R_SERVFAIL);
+ 					}
+-				} else if (rdataset->type == dns_rdatatype_rrsig
+-					   && rdataset->covers ==
+-					   dns_rdatatype_dname) {
++				} else {
+ 					/*
+ 					 * We've found a signature that
+ 					 * covers the DNAME.
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
new file mode 100644
index 0000000..3ca76b9
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
@@ -0,0 +1,318 @@
+From 499952eb459c9a41d2092f1d98899c131f9103b2 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Mon, 29 Feb 2016 07:16:48 +1100
+Subject: [PATCH] Part 2 of: 4319.[security] Fix resolver assertion
+failure due to improper DNAME handling when parsing fetch reply messages.
+(CVE-2016-1286) [RT #41753]
+
+(cherry picked from commit 2de89ee9de8c8da9dc153a754b02dcdbb7fe2374)
+
+CVE: CVE-2016-1286 [part 2]
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/dns/resolver.c | 192 ++++++++++++++++++++++++++---------------------------
+ 1 file changed, 93 insertions(+), 99 deletions(-)
+
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 23d636b..fbc0af0 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -6088,14 +6088,11 @@ cname_target(dns_rdataset_t *rdataset, dns_name_t *tname) {
+ }
+ 
+ static inline isc_result_t
+-dname_target(fetchctx_t *fctx, dns_rdataset_t *rdataset, dns_name_t *qname,
+-	     dns_name_t *oname, dns_fixedname_t *fixeddname)
++dname_target(dns_rdataset_t *rdataset, dns_name_t *qname,
++	     unsigned int nlabels, dns_fixedname_t *fixeddname)
+ {
+ 	isc_result_t result;
+ 	dns_rdata_t rdata = DNS_RDATA_INIT;
+-	unsigned int nlabels;
+-	int order;
+-	dns_namereln_t namereln;
+ 	dns_rdata_dname_t dname;
+ 	dns_fixedname_t prefix;
+ 
+@@ -6110,21 +6107,6 @@ dname_target(fetchctx_t *fctx, dns_rdataset_t *rdataset, dns_name_t *qname,
+ 	if (result != ISC_R_SUCCESS)
+ 		return (result);
+ 
+-	/*
+-	 * Get the prefix of qname.
+-	 */
+-	namereln = dns_name_fullcompare(qname, oname, &order, &nlabels);
+-	if (namereln != dns_namereln_subdomain) {
+-		char qbuf[DNS_NAME_FORMATSIZE];
+-		char obuf[DNS_NAME_FORMATSIZE];
+-
+-		dns_rdata_freestruct(&dname);
+-		dns_name_format(qname, qbuf, sizeof(qbuf));
+-		dns_name_format(oname, obuf, sizeof(obuf));
+-		log_formerr(fctx, "unrelated DNAME in answer: "
+-				   "%s is not in %s", qbuf, obuf);
+-		return (DNS_R_FORMERR);
+-	}
+ 	dns_fixedname_init(&prefix);
+ 	dns_name_split(qname, nlabels, dns_fixedname_name(&prefix), NULL);
+ 	dns_fixedname_init(fixeddname);
+@@ -6750,13 +6732,13 @@ static isc_result_t
+ answer_response(fetchctx_t *fctx) {
+ 	isc_result_t result;
+ 	dns_message_t *message;
+-	dns_name_t *name, *qname, tname, *ns_name;
++	dns_name_t *name, *dname, *qname, tname, *ns_name;
+ 	dns_rdataset_t *rdataset, *ns_rdataset;
+ 	isc_boolean_t done, external, chaining, aa, found, want_chaining;
+ 	isc_boolean_t have_answer, found_cname, found_type, wanted_chaining;
+ 	unsigned int aflag;
+ 	dns_rdatatype_t type;
+-	dns_fixedname_t dname, fqname;
++	dns_fixedname_t fdname, fqname;
+ 	dns_view_t *view;
+ 
+ 	FCTXTRACE("answer_response");
+@@ -6784,10 +6766,15 @@ answer_response(fetchctx_t *fctx) {
+ 	view = fctx->res->view;
+ 	result = dns_message_firstname(message, DNS_SECTION_ANSWER);
+ 	while (!done && result == ISC_R_SUCCESS) {
++		dns_namereln_t namereln;
++		int order;
++		unsigned int nlabels;
++
+ 		name = NULL;
+ 		dns_message_currentname(message, DNS_SECTION_ANSWER, &name);
+ 		external = ISC_TF(!dns_name_issubdomain(name, &fctx->domain));
+-		if (dns_name_equal(name, qname)) {
++		namereln = dns_name_fullcompare(qname, name, &order, &nlabels);
++		if (namereln == dns_namereln_equal) {
+ 			wanted_chaining = ISC_FALSE;
+ 			for (rdataset = ISC_LIST_HEAD(name->list);
+ 			     rdataset != NULL;
+@@ -6912,10 +6899,11 @@ answer_response(fetchctx_t *fctx) {
+ 						 */
+ 						INSIST(!external);
+ 						if (aflag ==
+-						    DNS_RDATASETATTR_ANSWER)
++						    DNS_RDATASETATTR_ANSWER) {
+ 							have_answer = ISC_TRUE;
+-						name->attributes |=
+-							DNS_NAMEATTR_ANSWER;
++							name->attributes |=
++								DNS_NAMEATTR_ANSWER;
++						}
+ 						rdataset->attributes |= aflag;
+ 						if (aa)
+ 							rdataset->trust =
+@@ -6970,6 +6958,8 @@ answer_response(fetchctx_t *fctx) {
+ 			if (wanted_chaining)
+ 				chaining = ISC_TRUE;
+ 		} else {
++			dns_rdataset_t *dnameset = NULL;
++
+ 			/*
+ 			 * Look for a DNAME (or its SIG).  Anything else is
+ 			 * ignored.
+@@ -6977,10 +6967,8 @@ answer_response(fetchctx_t *fctx) {
+ 			wanted_chaining = ISC_FALSE;
+ 			for (rdataset = ISC_LIST_HEAD(name->list);
+ 			     rdataset != NULL;
+-			     rdataset = ISC_LIST_NEXT(rdataset, link)) {
+-				isc_boolean_t found_dname = ISC_FALSE;
+-				dns_name_t *dname_name;
+-
++			     rdataset = ISC_LIST_NEXT(rdataset, link))
++			{
+ 				/*
+ 				 * Only pass DNAME or RRSIG(DNAME).
+ 				 */
+@@ -6994,20 +6982,41 @@ answer_response(fetchctx_t *fctx) {
+ 				 * its signature should not be external.
+ 				 */
+ 				if (!chaining && external) {
+-					log_formerr(fctx, "external DNAME");
++					char qbuf[DNS_NAME_FORMATSIZE];
++					char obuf[DNS_NAME_FORMATSIZE];
++
++					dns_name_format(name, qbuf,
++							sizeof(qbuf));
++					dns_name_format(&fctx->domain, obuf,
++							sizeof(obuf));
++					log_formerr(fctx, "external DNAME or "
++						    "RRSIG covering DNAME "
++						    "in answer: %s is "
++						    "not in %s", qbuf, obuf);
++					return (DNS_R_FORMERR);
++				}
++
++				if (namereln != dns_namereln_subdomain) {
++					char qbuf[DNS_NAME_FORMATSIZE];
++					char obuf[DNS_NAME_FORMATSIZE];
++
++					dns_name_format(qname, qbuf,
++							sizeof(qbuf));
++					dns_name_format(name, obuf,
++							sizeof(obuf));
++					log_formerr(fctx, "unrelated DNAME "
++						    "in answer: %s is "
++						    "not in %s", qbuf, obuf);
+ 					return (DNS_R_FORMERR);
+ 				}
+ 
+-				found = ISC_FALSE;
+ 				aflag = 0;
+ 				if (rdataset->type == dns_rdatatype_dname) {
+-					found = ISC_TRUE;
+ 					want_chaining = ISC_TRUE;
+ 					POST(want_chaining);
+ 					aflag = DNS_RDATASETATTR_ANSWER;
+-					result = dname_target(fctx, rdataset,
+-							      qname, name,
+-							      &dname);
++					result = dname_target(rdataset, qname,
++							      nlabels, &fdname);
+ 					if (result == ISC_R_NOSPACE) {
+ 						/*
+ 						 * We can't construct the
+@@ -7019,14 +7028,12 @@ answer_response(fetchctx_t *fctx) {
+ 					} else if (result != ISC_R_SUCCESS)
+ 						return (result);
+ 					else
+-						found_dname = ISC_TRUE;
++						dnameset = rdataset;
+ 
+-					dname_name = dns_fixedname_name(&dname);
++					dname = dns_fixedname_name(&fdname);
+ 					if (!is_answertarget_allowed(view,
+-							qname,
+-							rdataset->type,
+-							dname_name,
+-							&fctx->domain)) {
++							qname, rdataset->type,
++							dname, &fctx->domain)) {
+ 						return (DNS_R_SERVFAIL);
+ 					}
+ 				} else {
+@@ -7034,73 +7041,60 @@ answer_response(fetchctx_t *fctx) {
+ 					 * We've found a signature that
+ 					 * covers the DNAME.
+ 					 */
+-					found = ISC_TRUE;
+ 					aflag = DNS_RDATASETATTR_ANSWERSIG;
+ 				}
+ 
+-				if (found) {
++				/*
++				 * We've found an answer to our
++				 * question.
++				 */
++				name->attributes |= DNS_NAMEATTR_CACHE;
++				rdataset->attributes |= DNS_RDATASETATTR_CACHE;
++				rdataset->trust = dns_trust_answer;
++				if (!chaining) {
+ 					/*
+-					 * We've found an answer to our
+-					 * question.
++					 * This data is "the" answer to
++					 * our question only if we're
++					 * not chaining.
+ 					 */
+-					name->attributes |=
+-						DNS_NAMEATTR_CACHE;
+-					rdataset->attributes |=
+-						DNS_RDATASETATTR_CACHE;
+-					rdataset->trust = dns_trust_answer;
+-					if (!chaining) {
+-						/*
+-						 * This data is "the" answer
+-						 * to our question only if
+-						 * we're not chaining.
+-						 */
+-						INSIST(!external);
+-						if (aflag ==
+-						    DNS_RDATASETATTR_ANSWER)
+-							have_answer = ISC_TRUE;
++					INSIST(!external);
++					if (aflag == DNS_RDATASETATTR_ANSWER) {
++						have_answer = ISC_TRUE;
+ 						name->attributes |=
+ 							DNS_NAMEATTR_ANSWER;
+-						rdataset->attributes |= aflag;
+-						if (aa)
+-							rdataset->trust =
+-							  dns_trust_authanswer;
+-					} else if (external) {
+-						rdataset->attributes |=
+-						    DNS_RDATASETATTR_EXTERNAL;
+-					}
+-
+-					/*
+-					 * DNAME chaining.
+-					 */
+-					if (found_dname) {
+-						/*
+-						 * Copy the dname into the
+-						 * qname fixed name.
+-						 *
+-						 * Although we check for
+-						 * failure of the copy
+-						 * operation, in practice it
+-						 * should never fail since
+-						 * we already know that the
+-						 * result fits in a fixedname.
+-						 */
+-						dns_fixedname_init(&fqname);
+-						result = dns_name_copy(
+-						  dns_fixedname_name(&dname),
+-						  dns_fixedname_name(&fqname),
+-						  NULL);
+-						if (result != ISC_R_SUCCESS)
+-							return (result);
+-						wanted_chaining = ISC_TRUE;
+-						name->attributes |=
+-							DNS_NAMEATTR_CHAINING;
+-						rdataset->attributes |=
+-						    DNS_RDATASETATTR_CHAINING;
+-						qname = dns_fixedname_name(
+-								   &fqname);
+ 					}
++					rdataset->attributes |= aflag;
++					if (aa)
++						rdataset->trust =
++						  dns_trust_authanswer;
++				} else if (external) {
++					rdataset->attributes |=
++					    DNS_RDATASETATTR_EXTERNAL;
+ 				}
+ 			}
++
++			/*
++			 * DNAME chaining.
++			 */
++			if (dnameset != NULL) {
++				/*
++				 * Copy the dname into the qname fixed name.
++				 *
++				 * Although we check for failure of the copy
++				 * operation, in practice it should never fail
++				 * since we already know that the  result fits
++				 * in a fixedname.
++				 */
++				dns_fixedname_init(&fqname);
++				qname = dns_fixedname_name(&fqname);
++				result = dns_name_copy(dname, qname, NULL);
++				if (result != ISC_R_SUCCESS)
++					return (result);
++				wanted_chaining = ISC_TRUE;
++				name->attributes |= DNS_NAMEATTR_CHAINING;
++				dnameset->attributes |=
++					    DNS_RDATASETATTR_CHAINING;
++			}
+ 			if (wanted_chaining)
+ 				chaining = ISC_TRUE;
+ 		}
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
index 19f87d7..f1951a0 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
@@ -25,6 +25,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2015-8705.patch \
            file://CVE-2015-8000.patch \
            file://CVE-2015-8461.patch \
+           file://CVE-2016-1285.patch \
+           file://CVE-2016-1286_1.patch \
+           file://CVE-2016-1286_2.patch \
            "
 
 SRC_URI[md5sum] = "8b1f5064837756c938eadc1537dec5c7"
-- 
2.8.0


