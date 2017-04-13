Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3711777D67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 05:21:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3D5LroI025984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 22:21:57 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 12 Apr 2017 22:21:52 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Apr 2017 13:20:24 +0800
Message-ID: <1492060825-30599-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492060825-30599-1-git-send-email-yi.zhao@windriver.com>
References: <1492060825-30599-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 1/2] bind: Security fix CVE-2016-8864
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
X-List-Received-Date: Thu, 13 Apr 2017 05:21:56 -0000
Content-Type: text/plain

CVE-2016-8864: named in ISC BIND 9.x before 9.9.9-P4, 9.10.x before
9.10.4-P4, and 9.11.x before 9.11.0-P1 allows remote attackers to cause
a denial of service (assertion failure and daemon exit) via a DNAME
record in the answer section of a response to a recursive query,
related to db.c and resolver.c.

External References:
https://nvd.nist.gov/vuln/detail/CVE-2016-8864

Patch from:
https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=commit;h=c1d0599a246f646d1c22018f8fa09459270a44b8

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../bind/bind/CVE-2016-8864.patch                  | 217 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
new file mode 100644
index 0000000..5bd0d7a
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
@@ -0,0 +1,217 @@
+From c1d0599a246f646d1c22018f8fa09459270a44b8 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Fri, 21 Oct 2016 14:55:10 +1100
+Subject: [PATCH] 4489. [security] It was possible to trigger assertions when
+ processing a response. (CVE-2016-8864) [RT #43465]
+
+(cherry picked from commit bd6f27f5c353133b563fe69100b2f168c129f3ca)
+
+Upstream-Status: Backport
+[https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=commit;h=c1d0599a246f646d1c22018f8fa09459270a44b8]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CHANGES            |  3 +++
+ lib/dns/resolver.c | 69 +++++++++++++++++++++++++++++++++++++-----------------
+ 2 files changed, 50 insertions(+), 22 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index 5c8c61a..41cfce5 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,3 +1,6 @@
++4489.	[security]	It was possible to trigger assertions when processing
++			a response. (CVE-2016-8864) [RT #43465]
++
+ 4467.   [security]      It was possible to trigger an assertion when
+                         rendering a message. (CVE-2016-2776) [RT #43139]
+ 
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index ba1ae23..13c8b44 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -612,7 +612,9 @@ valcreate(fetchctx_t *fctx, dns_adbaddrinfo_t *addrinfo, dns_name_t *name,
+ 	valarg->addrinfo = addrinfo;
+ 
+ 	if (!ISC_LIST_EMPTY(fctx->validators))
+-		INSIST((valoptions & DNS_VALIDATOR_DEFER) != 0);
++		valoptions |= DNS_VALIDATOR_DEFER;
++	else
++		valoptions &= ~DNS_VALIDATOR_DEFER;
+ 
+ 	result = dns_validator_create(fctx->res->view, name, type, rdataset,
+ 				      sigrdataset, fctx->rmessage,
+@@ -5526,13 +5528,6 @@ cache_name(fetchctx_t *fctx, dns_name_t *name, dns_adbaddrinfo_t *addrinfo,
+ 							   rdataset,
+ 							   sigrdataset,
+ 							   valoptions, task);
+-					/*
+-					 * Defer any further validations.
+-					 * This prevents multiple validators
+-					 * from manipulating fctx->rmessage
+-					 * simultaneously.
+-					 */
+-					valoptions |= DNS_VALIDATOR_DEFER;
+ 				}
+ 			} else if (CHAINING(rdataset)) {
+ 				if (rdataset->type == dns_rdatatype_cname)
+@@ -5647,6 +5642,11 @@ cache_name(fetchctx_t *fctx, dns_name_t *name, dns_adbaddrinfo_t *addrinfo,
+ 				       eresult == DNS_R_NCACHENXRRSET);
+ 			}
+ 			event->result = eresult;
++			if (adbp != NULL && *adbp != NULL) {
++				if (anodep != NULL && *anodep != NULL)
++					dns_db_detachnode(*adbp, anodep);
++				dns_db_detach(adbp);
++			}
+ 			dns_db_attach(fctx->cache, adbp);
+ 			dns_db_transfernode(fctx->cache, &node, anodep);
+ 			clone_results(fctx);
+@@ -5897,6 +5897,11 @@ ncache_message(fetchctx_t *fctx, dns_adbaddrinfo_t *addrinfo,
+ 		fctx->attributes |= FCTX_ATTR_HAVEANSWER;
+ 		if (event != NULL) {
+ 			event->result = eresult;
++			if (adbp != NULL && *adbp != NULL) {
++				if (anodep != NULL && *anodep != NULL)
++					dns_db_detachnode(*adbp, anodep);
++				dns_db_detach(adbp);
++			}
+ 			dns_db_attach(fctx->cache, adbp);
+ 			dns_db_transfernode(fctx->cache, &node, anodep);
+ 			clone_results(fctx);
+@@ -6718,13 +6723,15 @@ static isc_result_t
+ answer_response(fetchctx_t *fctx) {
+ 	isc_result_t result;
+ 	dns_message_t *message;
+-	dns_name_t *name, *dname, *qname, tname, *ns_name;
++	dns_name_t *name, *dname = NULL, *qname, *dqname, tname, *ns_name;
++	dns_name_t *cname = NULL;
+ 	dns_rdataset_t *rdataset, *ns_rdataset;
+ 	isc_boolean_t done, external, chaining, aa, found, want_chaining;
+-	isc_boolean_t have_answer, found_cname, found_type, wanted_chaining;
++	isc_boolean_t have_answer, found_cname, found_dname, found_type;
++	isc_boolean_t wanted_chaining;
+ 	unsigned int aflag;
+ 	dns_rdatatype_t type;
+-	dns_fixedname_t fdname, fqname;
++	dns_fixedname_t fdname, fqname, fqdname;
+ 	dns_view_t *view;
+ 
+ 	FCTXTRACE("answer_response");
+@@ -6738,6 +6745,7 @@ answer_response(fetchctx_t *fctx) {
+ 
+ 	done = ISC_FALSE;
+ 	found_cname = ISC_FALSE;
++	found_dname = ISC_FALSE;
+ 	found_type = ISC_FALSE;
+ 	chaining = ISC_FALSE;
+ 	have_answer = ISC_FALSE;
+@@ -6747,12 +6755,13 @@ answer_response(fetchctx_t *fctx) {
+ 		aa = ISC_TRUE;
+ 	else
+ 		aa = ISC_FALSE;
+-	qname = &fctx->name;
++	dqname = qname = &fctx->name;
+ 	type = fctx->type;
+ 	view = fctx->res->view;
++	dns_fixedname_init(&fqdname);
+ 	result = dns_message_firstname(message, DNS_SECTION_ANSWER);
+ 	while (!done && result == ISC_R_SUCCESS) {
+-		dns_namereln_t namereln;
++		dns_namereln_t namereln, dnamereln;
+ 		int order;
+ 		unsigned int nlabels;
+ 
+@@ -6760,6 +6769,8 @@ answer_response(fetchctx_t *fctx) {
+ 		dns_message_currentname(message, DNS_SECTION_ANSWER, &name);
+ 		external = ISC_TF(!dns_name_issubdomain(name, &fctx->domain));
+ 		namereln = dns_name_fullcompare(qname, name, &order, &nlabels);
++		dnamereln = dns_name_fullcompare(dqname, name, &order,
++						 &nlabels);
+ 		if (namereln == dns_namereln_equal) {
+ 			wanted_chaining = ISC_FALSE;
+ 			for (rdataset = ISC_LIST_HEAD(name->list);
+@@ -6854,7 +6865,7 @@ answer_response(fetchctx_t *fctx) {
+ 					}
+ 				} else if (rdataset->type == dns_rdatatype_rrsig
+ 					   && rdataset->covers ==
+-					   dns_rdatatype_cname
++					      dns_rdatatype_cname
+ 					   && !found_type) {
+ 					/*
+ 					 * We're looking for something else,
+@@ -6884,11 +6895,18 @@ answer_response(fetchctx_t *fctx) {
+ 						 * a CNAME or DNAME).
+ 						 */
+ 						INSIST(!external);
+-						if (aflag ==
+-						    DNS_RDATASETATTR_ANSWER) {
++						if ((rdataset->type !=
++						     dns_rdatatype_cname) ||
++						    !found_dname ||
++						    (aflag ==
++						     DNS_RDATASETATTR_ANSWER))
++						{
+ 							have_answer = ISC_TRUE;
++							if (rdataset->type ==
++							    dns_rdatatype_cname)
++								cname = name;
+ 							name->attributes |=
+-								DNS_NAMEATTR_ANSWER;
++							    DNS_NAMEATTR_ANSWER;
+ 						}
+ 						rdataset->attributes |= aflag;
+ 						if (aa)
+@@ -6982,11 +7000,11 @@ answer_response(fetchctx_t *fctx) {
+ 					return (DNS_R_FORMERR);
+ 				}
+ 
+-				if (namereln != dns_namereln_subdomain) {
++				if (dnamereln != dns_namereln_subdomain) {
+ 					char qbuf[DNS_NAME_FORMATSIZE];
+ 					char obuf[DNS_NAME_FORMATSIZE];
+ 
+-					dns_name_format(qname, qbuf,
++					dns_name_format(dqname, qbuf,
+ 							sizeof(qbuf));
+ 					dns_name_format(name, obuf,
+ 							sizeof(obuf));
+@@ -7001,7 +7019,7 @@ answer_response(fetchctx_t *fctx) {
+ 					want_chaining = ISC_TRUE;
+ 					POST(want_chaining);
+ 					aflag = DNS_RDATASETATTR_ANSWER;
+-					result = dname_target(rdataset, qname,
++					result = dname_target(rdataset, dqname,
+ 							      nlabels, &fdname);
+ 					if (result == ISC_R_NOSPACE) {
+ 						/*
+@@ -7018,10 +7036,13 @@ answer_response(fetchctx_t *fctx) {
+ 
+ 					dname = dns_fixedname_name(&fdname);
+ 					if (!is_answertarget_allowed(view,
+-							qname, rdataset->type,
+-							dname, &fctx->domain)) {
++						     dqname, rdataset->type,
++						     dname, &fctx->domain))
++					{
+ 						return (DNS_R_SERVFAIL);
+ 					}
++					dqname = dns_fixedname_name(&fqdname);
++					dns_name_copy(dname, dqname, NULL);
+ 				} else {
+ 					/*
+ 					 * We've found a signature that
+@@ -7046,6 +7067,10 @@ answer_response(fetchctx_t *fctx) {
+ 					INSIST(!external);
+ 					if (aflag == DNS_RDATASETATTR_ANSWER) {
+ 						have_answer = ISC_TRUE;
++						found_dname = ISC_TRUE;
++						if (cname != NULL)
++							cname->attributes &=
++							   ~DNS_NAMEATTR_ANSWER;
+ 						name->attributes |=
+ 							DNS_NAMEATTR_ANSWER;
+ 					}
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
index 4e2e856..fa45809 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
@@ -27,6 +27,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2016-2088.patch \
            file://CVE-2016-2775.patch \
            file://CVE-2016-2776.patch \
+           file://CVE-2016-8864.patch \
            "
 
 SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
-- 
2.7.4


