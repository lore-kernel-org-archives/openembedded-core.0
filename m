Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.33])
	by mail.openembedded.org (Postfix) with ESMTP id A1B846E688
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:32:18 +0000 (UTC)
Received: from 1aqELZ-0004LC-Vx by out10c.electric.net with emc1-ok (Exim 4.85)
	(envelope-from <sona.sarmadi@enea.com>) id 1aqELa-0004Qh-U5
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2016 23:32:18 -0700
Received: by emcmailer; Tue, 12 Apr 2016 23:32:18 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10c.electric.net with smtp (Exim 4.85)
	(envelope-from <sona.sarmadi@enea.com>) id 1aqELZ-0004LC-Vx
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2016 23:32:17 -0700
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 13 Apr 2016 08:32:17 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Apr 2016 08:32:15 +0200
Message-ID: <1460529135-43932-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH v2] bind: CVE-2016-1285 CVE-2016-1286
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
X-List-Received-Date: Wed, 13 Apr 2016 06:32:23 -0000
Content-Type: text/plain

Fixes following vulnerabilities:
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
===========================================================
CVE-2016-1285: https://kb.isc.org/article/AA-01352
https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=patch;
h=70037e040e587329cec82123e12b9f4f7c945f67

CVE-2016-1286_1: https://kb.isc.org/article/AA-01353
https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=patch;
h=a3d327bf1ceaaeabb20223d8de85166e940b9f12

CVE-2016-1286_2: https://kb.isc.org/article/AA-01353
https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=patch;
h=7602be276a73a6eb5431c5acd9718e68a55e8b61

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../bind/bind/CVE-2016-1285.patch                  | 154 ++++++++++
 .../bind/bind/CVE-2016-1286_1.patch                |  79 ++++++
 .../bind/bind/CVE-2016-1286_2.patch                | 314 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |   3 +
 4 files changed, 550 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
new file mode 100644
index 0000000..2149bd1
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
@@ -0,0 +1,154 @@
+From 70037e040e587329cec82123e12b9f4f7c945f67 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Thu, 18 Feb 2016 12:11:27 +1100
+Subject: [PATCH] 4318.   [security]      Malformed control messages can
+ trigger assertions                         in named and rndc. (CVE-2016-1285)
+ [RT #41666]
+
+(cherry picked from commit a2b15b3305acd52179e6f3dc7d073b07fbc40b8e)
+
+CVE: CVE-2016-1285
+Upstream-Status: Backport
+[Removed doc/arm/notes.xml changes from upstream patch]
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ CHANGES                 |  3 +++
+ bin/named/control.c     |  2 +-
+ bin/named/controlconf.c |  2 +-
+ bin/rndc/rndc.c         |  8 ++++----
+ doc/arm/notes.xml       | 11 +++++++++++
+ lib/isccc/cc.c          | 14 +++++++-------
+ 6 files changed, 27 insertions(+), 13 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index b9bd9ef..2c727d5 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,3 +1,6 @@
++4318.	[security]	Malformed control messages can trigger assertions
++			in named and rndc. (CVE-2016-1285) [RT #41666]
++
+ 	--- 9.10.3-P3 released ---
+ 
+ 4288.	[bug]		Fixed a regression in resolver.c:possibly_mark()
+diff --git a/bin/named/control.c b/bin/named/control.c
+index 8554335..81340ca 100644
+--- a/bin/named/control.c
++++ b/bin/named/control.c
+@@ -69,7 +69,7 @@ ns_control_docommand(isccc_sexpr_t *message, isc_buffer_t *text) {
+ #endif
+ 
+ 	data = isccc_alist_lookup(message, "_data");
+-	if (data == NULL) {
++	if (!isccc_alist_alistp(data)) {
+ 		/*
+ 		 * No data section.
+ 		 */
+diff --git a/bin/named/controlconf.c b/bin/named/controlconf.c
+index 765afdd..a39ab8b 100644
+--- a/bin/named/controlconf.c
++++ b/bin/named/controlconf.c
+@@ -402,7 +402,7 @@ control_recvmessage(isc_task_t *task, isc_event_t *event) {
+ 	 * Limit exposure to replay attacks.
+ 	 */
+ 	_ctrl = isccc_alist_lookup(request, "_ctrl");
+-	if (_ctrl == NULL) {
++	if (!isccc_alist_alistp(_ctrl)) {
+ 		log_invalid(&conn->ccmsg, ISC_R_FAILURE);
+ 		goto cleanup_request;
+ 	}
+diff --git a/bin/rndc/rndc.c b/bin/rndc/rndc.c
+index cb17050..b6e05c8 100644
+--- a/bin/rndc/rndc.c
++++ b/bin/rndc/rndc.c
+@@ -255,8 +255,8 @@ rndc_recvdone(isc_task_t *task, isc_event_t *event) {
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
+@@ -321,8 +321,8 @@ rndc_recvnonce(isc_task_t *task, isc_event_t *event) {
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
+diff --git a/lib/isccc/cc.c b/lib/isccc/cc.c
+index 47a3b74..2bb961e 100644
+--- a/lib/isccc/cc.c
++++ b/lib/isccc/cc.c
+@@ -403,13 +403,13 @@ verify(isccc_sexpr_t *alist, unsigned char *data, unsigned int length,
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
+@@ -728,7 +728,7 @@ isccc_cc_createack(isccc_sexpr_t *message, isc_boolean_t ok,
+ 	REQUIRE(ackp != NULL && *ackp == NULL);
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+-	if (_ctrl == NULL ||
++	if (!isccc_alist_alistp(_ctrl) ||
+ 	    isccc_cc_lookupuint32(_ctrl, "_ser", &serial) != ISC_R_SUCCESS ||
+ 	    isccc_cc_lookupuint32(_ctrl, "_tim", &t) != ISC_R_SUCCESS)
+ 		return (ISC_R_FAILURE);
+@@ -773,7 +773,7 @@ isccc_cc_isack(isccc_sexpr_t *message)
+ 	isccc_sexpr_t *_ctrl;
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+-	if (_ctrl == NULL)
++	if (!isccc_alist_alistp(_ctrl))
+ 		return (ISC_FALSE);
+ 	if (isccc_cc_lookupstring(_ctrl, "_ack", NULL) == ISC_R_SUCCESS)
+ 		return (ISC_TRUE);
+@@ -786,7 +786,7 @@ isccc_cc_isreply(isccc_sexpr_t *message)
+ 	isccc_sexpr_t *_ctrl;
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+-	if (_ctrl == NULL)
++	if (!isccc_alist_alistp(_ctrl))
+ 		return (ISC_FALSE);
+ 	if (isccc_cc_lookupstring(_ctrl, "_rpl", NULL) == ISC_R_SUCCESS)
+ 		return (ISC_TRUE);
+@@ -806,7 +806,7 @@ isccc_cc_createresponse(isccc_sexpr_t *message, isccc_time_t now,
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+ 	_data = isccc_alist_lookup(message, "_data");
+-	if (_ctrl == NULL || _data == NULL ||
++	if (!isccc_alist_alistp(_ctrl) || !isccc_alist_alistp(_data) ||
+ 	    isccc_cc_lookupuint32(_ctrl, "_ser", &serial) != ISC_R_SUCCESS ||
+ 	    isccc_cc_lookupstring(_data, "type", &type) != ISC_R_SUCCESS)
+ 		return (ISC_R_FAILURE);
+@@ -995,7 +995,7 @@ isccc_cc_checkdup(isccc_symtab_t *symtab, isccc_sexpr_t *message,
+ 	isccc_sexpr_t *_ctrl;
+ 
+ 	_ctrl = isccc_alist_lookup(message, "_ctrl");
+-	if (_ctrl == NULL ||
++	if (!isccc_alist_alistp(_ctrl) ||
+ 	    isccc_cc_lookupstring(_ctrl, "_ser", &_ser) != ISC_R_SUCCESS ||
+ 	    isccc_cc_lookupstring(_ctrl, "_tim", &_tim) != ISC_R_SUCCESS)
+ 		return (ISC_R_FAILURE);
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
new file mode 100644
index 0000000..ae5cc48
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
@@ -0,0 +1,79 @@
+From a3d327bf1ceaaeabb20223d8de85166e940b9f12 Mon Sep 17 00:00:00 2001
+From: Mukund Sivaraman <muks@isc.org>
+Date: Mon, 22 Feb 2016 12:22:43 +0530
+Subject: [PATCH] Fix resolver assertion failure due to improper DNAME handling
+ (CVE-2016-1286) (#41753)
+
+(cherry picked from commit 5995fec51cc8bb7e53804e4936e60aa1537f3673)
+
+CVE: CVE-2016-1286
+Upstream-Status: Backport
+
+[Removed doc/arm/notes.xml changes from upstream patch.]
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/CHANGES b/CHANGES
+--- a/CHANGES	2016-04-13 07:28:44.940873629 +0200
++++ b/CHANGES	2016-04-13 07:38:38.923167851 +0200
+@@ -1,3 +1,7 @@
++4319.  [security]      Fix resolver assertion failure due to improper
++                       DNAME handling when parsing fetch reply messages.
++                       (CVE-2016-1286) [RT #41753]
++
+ 4318.	[security]	Malformed control messages can trigger assertions
+ 			in named and rndc. (CVE-2016-1285) [RT #41666]
+ 
+diff -ruN a/lib/dns/resolver.c b/lib/dns/resolver.c
+--- a/lib/dns/resolver.c	2016-04-13 07:28:43.088953790 +0200
++++ b/lib/dns/resolver.c	2016-04-13 07:38:20.411968925 +0200
+@@ -6967,21 +6967,26 @@
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
+@@ -7010,9 +7015,7 @@
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
index 0000000..a31ea81
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
@@ -0,0 +1,314 @@
+From 7602be276a73a6eb5431c5acd9718e68a55e8b61 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Mon, 29 Feb 2016 07:16:48 +1100
+Subject: [PATCH] Part 2 of: 4319.   [security]      Fix resolver assertion
+ failure due to improper                         DNAME handling when parsing
+ fetch reply messages.                         (CVE-2016-1286) [RT #41753]
+
+(cherry picked from commit 2de89ee9de8c8da9dc153a754b02dcdbb7fe2374)
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/dns/resolver.c | 192 ++++++++++++++++++++++++++---------------------------
+ 1 file changed, 93 insertions(+), 99 deletions(-)
+
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 70aba87..41e9df4 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -6074,14 +6074,11 @@ cname_target(dns_rdataset_t *rdataset, dns_name_t *tname) {
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
+@@ -6096,21 +6093,6 @@ dname_target(fetchctx_t *fctx, dns_rdataset_t *rdataset, dns_name_t *qname,
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
+@@ -6736,13 +6718,13 @@ static isc_result_t
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
+@@ -6770,10 +6752,15 @@ answer_response(fetchctx_t *fctx) {
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
+@@ -6898,10 +6885,11 @@ answer_response(fetchctx_t *fctx) {
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
+@@ -6956,6 +6944,8 @@ answer_response(fetchctx_t *fctx) {
+ 			if (wanted_chaining)
+ 				chaining = ISC_TRUE;
+ 		} else {
++			dns_rdataset_t *dnameset = NULL;
++
+ 			/*
+ 			 * Look for a DNAME (or its SIG).  Anything else is
+ 			 * ignored.
+@@ -6963,10 +6953,8 @@ answer_response(fetchctx_t *fctx) {
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
+@@ -6980,20 +6968,41 @@ answer_response(fetchctx_t *fctx) {
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
+@@ -7005,14 +7014,12 @@ answer_response(fetchctx_t *fctx) {
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
+@@ -7020,73 +7027,60 @@ answer_response(fetchctx_t *fctx) {
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
diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
index fa057d5..3ad14b2 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
@@ -21,6 +21,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
+           file://CVE-2016-1285.patch \
+           file://CVE-2016-1286_1.patch \
+           file://CVE-2016-1286_2.patch \
            "
 
 SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
-- 
1.9.1


