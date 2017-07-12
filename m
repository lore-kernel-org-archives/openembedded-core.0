Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8959F77FEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 01:33:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6C1XKNI010373
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 18:33:20 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Jul 2017 18:33:18 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 09:25:05 +0800
Message-ID: <31a9ebfca3a5be885c18c5826e4a48c48287aa74.1499822461.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1499822461.git.kai.kang@windriver.com>
References: <cover.1499822461.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: 9.10..3-P3 -> 9.10.5-P3
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
X-List-Received-Date: Wed, 12 Jul 2017 01:33:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade bind from 9.10.3-P3 to 9.10.5-P3

* Update md5sum of LIC_FILES_CHKSUM that it update year in file COPYRIGHT
* Remvoe mips1-not-support-opcode.diff which has been merged
* Remove CVE patches that there are backported from upstream
* Use python3 for build and make sure install .py files to right directory

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...0001-build-use-pkg-config-to-find-libxml2.patch |   10 +-
 .../bind/bind/CVE-2016-1285.patch                  |  154 ---
 .../bind/bind/CVE-2016-1286_1.patch                |   79 --
 .../bind/bind/CVE-2016-1286_2.patch                |  317 ------
 .../bind/bind/CVE-2016-2088.patch                  |  247 -----
 .../bind/bind/CVE-2016-2775.patch                  |   90 --
 .../bind/bind/CVE-2016-2776.patch                  |  123 ---
 .../bind/bind/CVE-2016-6170.patch                  | 1090 --------------------
 .../bind/bind/CVE-2016-8864.patch                  |  219 ----
 .../bind/bind/bind-confgen-build-unix.o-once.patch |   10 +-
 .../bind/bind/mips1-not-support-opcode.diff        |  104 --
 .../use-python3-and-fix-install-lib-path.patch     |   36 +
 .../bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb}  |   25 +-
 13 files changed, 61 insertions(+), 2443 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
 create mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
 rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb} (85%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
index 805cbb3..1e23c0f 100644
--- a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
@@ -7,15 +7,19 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 Update context for version 9.10.3-P2.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Update context for version 9.10.5-P3.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  configure.in | 23 +++--------------------
  1 file changed, 3 insertions(+), 20 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 0db826d..75819eb 100644
+index 4da73a4..6f2a754 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -2107,26 +2107,9 @@ case "$use_libxml2" in
+@@ -2282,26 +2282,9 @@ case "$use_libxml2" in
  		DST_LIBXML2_INC=""
  		;;
  	auto|yes)
@@ -25,7 +29,7 @@ index 0db826d..75819eb 100644
 -			libxml2_cflags=`xml2-config --cflags`
 -			;;
 -		*)
--			if test "$use_libxml2" = "yes" ; then
+-			if test "yes" = "$use_libxml2" ; then
 -				AC_MSG_RESULT(no)
 -				AC_MSG_ERROR(required libxml2 version not available)
 -			else
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
deleted file mode 100644
index 2149bd1..0000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From 70037e040e587329cec82123e12b9f4f7c945f67 Mon Sep 17 00:00:00 2001
-From: Mark Andrews <marka@isc.org>
-Date: Thu, 18 Feb 2016 12:11:27 +1100
-Subject: [PATCH] 4318.   [security]      Malformed control messages can
- trigger assertions                         in named and rndc. (CVE-2016-1285)
- [RT #41666]
-
-(cherry picked from commit a2b15b3305acd52179e6f3dc7d073b07fbc40b8e)
-
-CVE: CVE-2016-1285
-Upstream-Status: Backport
-[Removed doc/arm/notes.xml changes from upstream patch]
-
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
- CHANGES                 |  3 +++
- bin/named/control.c     |  2 +-
- bin/named/controlconf.c |  2 +-
- bin/rndc/rndc.c         |  8 ++++----
- doc/arm/notes.xml       | 11 +++++++++++
- lib/isccc/cc.c          | 14 +++++++-------
- 6 files changed, 27 insertions(+), 13 deletions(-)
-
-diff --git a/CHANGES b/CHANGES
-index b9bd9ef..2c727d5 100644
---- a/CHANGES
-+++ b/CHANGES
-@@ -1,3 +1,6 @@
-+4318.	[security]	Malformed control messages can trigger assertions
-+			in named and rndc. (CVE-2016-1285) [RT #41666]
-+
- 	--- 9.10.3-P3 released ---
- 
- 4288.	[bug]		Fixed a regression in resolver.c:possibly_mark()
-diff --git a/bin/named/control.c b/bin/named/control.c
-index 8554335..81340ca 100644
---- a/bin/named/control.c
-+++ b/bin/named/control.c
-@@ -69,7 +69,7 @@ ns_control_docommand(isccc_sexpr_t *message, isc_buffer_t *text) {
- #endif
- 
- 	data = isccc_alist_lookup(message, "_data");
--	if (data == NULL) {
-+	if (!isccc_alist_alistp(data)) {
- 		/*
- 		 * No data section.
- 		 */
-diff --git a/bin/named/controlconf.c b/bin/named/controlconf.c
-index 765afdd..a39ab8b 100644
---- a/bin/named/controlconf.c
-+++ b/bin/named/controlconf.c
-@@ -402,7 +402,7 @@ control_recvmessage(isc_task_t *task, isc_event_t *event) {
- 	 * Limit exposure to replay attacks.
- 	 */
- 	_ctrl = isccc_alist_lookup(request, "_ctrl");
--	if (_ctrl == NULL) {
-+	if (!isccc_alist_alistp(_ctrl)) {
- 		log_invalid(&conn->ccmsg, ISC_R_FAILURE);
- 		goto cleanup_request;
- 	}
-diff --git a/bin/rndc/rndc.c b/bin/rndc/rndc.c
-index cb17050..b6e05c8 100644
---- a/bin/rndc/rndc.c
-+++ b/bin/rndc/rndc.c
-@@ -255,8 +255,8 @@ rndc_recvdone(isc_task_t *task, isc_event_t *event) {
- 	   isccc_cc_fromwire(&source, &response, algorithm, &secret));
- 
- 	data = isccc_alist_lookup(response, "_data");
--	if (data == NULL)
--		fatal("no data section in response");
-+	if (!isccc_alist_alistp(data))
-+		fatal("bad or missing data section in response");
- 	result = isccc_cc_lookupstring(data, "err", &errormsg);
- 	if (result == ISC_R_SUCCESS) {
- 		failed = ISC_TRUE;
-@@ -321,8 +321,8 @@ rndc_recvnonce(isc_task_t *task, isc_event_t *event) {
- 	   isccc_cc_fromwire(&source, &response, algorithm, &secret));
- 
- 	_ctrl = isccc_alist_lookup(response, "_ctrl");
--	if (_ctrl == NULL)
--		fatal("_ctrl section missing");
-+	if (!isccc_alist_alistp(_ctrl))
-+		fatal("bad or missing ctrl section in response");
- 	nonce = 0;
- 	if (isccc_cc_lookupuint32(_ctrl, "_nonce", &nonce) != ISC_R_SUCCESS)
- 		nonce = 0;
-diff --git a/lib/isccc/cc.c b/lib/isccc/cc.c
-index 47a3b74..2bb961e 100644
---- a/lib/isccc/cc.c
-+++ b/lib/isccc/cc.c
-@@ -403,13 +403,13 @@ verify(isccc_sexpr_t *alist, unsigned char *data, unsigned int length,
- 	 * Extract digest.
- 	 */
- 	_auth = isccc_alist_lookup(alist, "_auth");
--	if (_auth == NULL)
-+	if (!isccc_alist_alistp(_auth))
- 		return (ISC_R_FAILURE);
- 	if (algorithm == ISCCC_ALG_HMACMD5)
- 		hmac = isccc_alist_lookup(_auth, "hmd5");
- 	else
- 		hmac = isccc_alist_lookup(_auth, "hsha");
--	if (hmac == NULL)
-+	if (!isccc_sexpr_binaryp(hmac))
- 		return (ISC_R_FAILURE);
- 	/*
- 	 * Compute digest.
-@@ -728,7 +728,7 @@ isccc_cc_createack(isccc_sexpr_t *message, isc_boolean_t ok,
- 	REQUIRE(ackp != NULL && *ackp == NULL);
- 
- 	_ctrl = isccc_alist_lookup(message, "_ctrl");
--	if (_ctrl == NULL ||
-+	if (!isccc_alist_alistp(_ctrl) ||
- 	    isccc_cc_lookupuint32(_ctrl, "_ser", &serial) != ISC_R_SUCCESS ||
- 	    isccc_cc_lookupuint32(_ctrl, "_tim", &t) != ISC_R_SUCCESS)
- 		return (ISC_R_FAILURE);
-@@ -773,7 +773,7 @@ isccc_cc_isack(isccc_sexpr_t *message)
- 	isccc_sexpr_t *_ctrl;
- 
- 	_ctrl = isccc_alist_lookup(message, "_ctrl");
--	if (_ctrl == NULL)
-+	if (!isccc_alist_alistp(_ctrl))
- 		return (ISC_FALSE);
- 	if (isccc_cc_lookupstring(_ctrl, "_ack", NULL) == ISC_R_SUCCESS)
- 		return (ISC_TRUE);
-@@ -786,7 +786,7 @@ isccc_cc_isreply(isccc_sexpr_t *message)
- 	isccc_sexpr_t *_ctrl;
- 
- 	_ctrl = isccc_alist_lookup(message, "_ctrl");
--	if (_ctrl == NULL)
-+	if (!isccc_alist_alistp(_ctrl))
- 		return (ISC_FALSE);
- 	if (isccc_cc_lookupstring(_ctrl, "_rpl", NULL) == ISC_R_SUCCESS)
- 		return (ISC_TRUE);
-@@ -806,7 +806,7 @@ isccc_cc_createresponse(isccc_sexpr_t *message, isccc_time_t now,
- 
- 	_ctrl = isccc_alist_lookup(message, "_ctrl");
- 	_data = isccc_alist_lookup(message, "_data");
--	if (_ctrl == NULL || _data == NULL ||
-+	if (!isccc_alist_alistp(_ctrl) || !isccc_alist_alistp(_data) ||
- 	    isccc_cc_lookupuint32(_ctrl, "_ser", &serial) != ISC_R_SUCCESS ||
- 	    isccc_cc_lookupstring(_data, "type", &type) != ISC_R_SUCCESS)
- 		return (ISC_R_FAILURE);
-@@ -995,7 +995,7 @@ isccc_cc_checkdup(isccc_symtab_t *symtab, isccc_sexpr_t *message,
- 	isccc_sexpr_t *_ctrl;
- 
- 	_ctrl = isccc_alist_lookup(message, "_ctrl");
--	if (_ctrl == NULL ||
-+	if (!isccc_alist_alistp(_ctrl) ||
- 	    isccc_cc_lookupstring(_ctrl, "_ser", &_ser) != ISC_R_SUCCESS ||
- 	    isccc_cc_lookupstring(_ctrl, "_tim", &_tim) != ISC_R_SUCCESS)
- 		return (ISC_R_FAILURE);
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
deleted file mode 100644
index ae5cc48..0000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From a3d327bf1ceaaeabb20223d8de85166e940b9f12 Mon Sep 17 00:00:00 2001
-From: Mukund Sivaraman <muks@isc.org>
-Date: Mon, 22 Feb 2016 12:22:43 +0530
-Subject: [PATCH] Fix resolver assertion failure due to improper DNAME handling
- (CVE-2016-1286) (#41753)
-
-(cherry picked from commit 5995fec51cc8bb7e53804e4936e60aa1537f3673)
-
-CVE: CVE-2016-1286
-Upstream-Status: Backport
-
-[Removed doc/arm/notes.xml changes from upstream patch.]
-
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
-diff -ruN a/CHANGES b/CHANGES
---- a/CHANGES	2016-04-13 07:28:44.940873629 +0200
-+++ b/CHANGES	2016-04-13 07:38:38.923167851 +0200
-@@ -1,3 +1,7 @@
-+4319.  [security]      Fix resolver assertion failure due to improper
-+                       DNAME handling when parsing fetch reply messages.
-+                       (CVE-2016-1286) [RT #41753]
-+
- 4318.	[security]	Malformed control messages can trigger assertions
- 			in named and rndc. (CVE-2016-1285) [RT #41666]
- 
-diff -ruN a/lib/dns/resolver.c b/lib/dns/resolver.c
---- a/lib/dns/resolver.c	2016-04-13 07:28:43.088953790 +0200
-+++ b/lib/dns/resolver.c	2016-04-13 07:38:20.411968925 +0200
-@@ -6967,21 +6967,26 @@
- 				isc_boolean_t found_dname = ISC_FALSE;
- 				dns_name_t *dname_name;
- 
-+				/*
-+				 * Only pass DNAME or RRSIG(DNAME).
-+				 */
-+				if (rdataset->type != dns_rdatatype_dname &&
-+				    (rdataset->type != dns_rdatatype_rrsig ||
-+				     rdataset->covers != dns_rdatatype_dname))
-+					continue;
-+
-+				/*
-+				 * If we're not chaining, then the DNAME and
-+				 * its signature should not be external.
-+				 */
-+				if (!chaining && external) {
-+					log_formerr(fctx, "external DNAME");
-+					return (DNS_R_FORMERR);
-+				}
-+
- 				found = ISC_FALSE;
- 				aflag = 0;
- 				if (rdataset->type == dns_rdatatype_dname) {
--					/*
--					 * We're looking for something else,
--					 * but we found a DNAME.
--					 *
--					 * If we're not chaining, then the
--					 * DNAME should not be external.
--					 */
--					if (!chaining && external) {
--						log_formerr(fctx,
--							    "external DNAME");
--						return (DNS_R_FORMERR);
--					}
- 					found = ISC_TRUE;
- 					want_chaining = ISC_TRUE;
- 					POST(want_chaining);
-@@ -7010,9 +7015,7 @@
- 							&fctx->domain)) {
- 						return (DNS_R_SERVFAIL);
- 					}
--				} else if (rdataset->type == dns_rdatatype_rrsig
--					   && rdataset->covers ==
--					   dns_rdatatype_dname) {
-+				} else {
- 					/*
- 					 * We've found a signature that
- 					 * covers the DNAME.
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
deleted file mode 100644
index 5f5cb0d..0000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
+++ /dev/null
@@ -1,317 +0,0 @@
-From 7602be276a73a6eb5431c5acd9718e68a55e8b61 Mon Sep 17 00:00:00 2001
-From: Mark Andrews <marka@isc.org>
-Date: Mon, 29 Feb 2016 07:16:48 +1100
-Subject: [PATCH] Part 2 of: 4319.   [security]      Fix resolver assertion
- failure due to improper                         DNAME handling when parsing
- fetch reply messages.                         (CVE-2016-1286) [RT #41753]
-
-CVE: CVE-2016-1286
-Upstream-Status: Backport
-
-(cherry picked from commit 2de89ee9de8c8da9dc153a754b02dcdbb7fe2374)
-Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
----
- lib/dns/resolver.c | 192 ++++++++++++++++++++++++++---------------------------
- 1 file changed, 93 insertions(+), 99 deletions(-)
-
-diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
-index 70aba87..41e9df4 100644
---- a/lib/dns/resolver.c
-+++ b/lib/dns/resolver.c
-@@ -6074,14 +6074,11 @@ cname_target(dns_rdataset_t *rdataset, dns_name_t *tname) {
- }
- 
- static inline isc_result_t
--dname_target(fetchctx_t *fctx, dns_rdataset_t *rdataset, dns_name_t *qname,
--	     dns_name_t *oname, dns_fixedname_t *fixeddname)
-+dname_target(dns_rdataset_t *rdataset, dns_name_t *qname,
-+	     unsigned int nlabels, dns_fixedname_t *fixeddname)
- {
- 	isc_result_t result;
- 	dns_rdata_t rdata = DNS_RDATA_INIT;
--	unsigned int nlabels;
--	int order;
--	dns_namereln_t namereln;
- 	dns_rdata_dname_t dname;
- 	dns_fixedname_t prefix;
- 
-@@ -6096,21 +6093,6 @@ dname_target(fetchctx_t *fctx, dns_rdataset_t *rdataset, dns_name_t *qname,
- 	if (result != ISC_R_SUCCESS)
- 		return (result);
- 
--	/*
--	 * Get the prefix of qname.
--	 */
--	namereln = dns_name_fullcompare(qname, oname, &order, &nlabels);
--	if (namereln != dns_namereln_subdomain) {
--		char qbuf[DNS_NAME_FORMATSIZE];
--		char obuf[DNS_NAME_FORMATSIZE];
--
--		dns_rdata_freestruct(&dname);
--		dns_name_format(qname, qbuf, sizeof(qbuf));
--		dns_name_format(oname, obuf, sizeof(obuf));
--		log_formerr(fctx, "unrelated DNAME in answer: "
--				   "%s is not in %s", qbuf, obuf);
--		return (DNS_R_FORMERR);
--	}
- 	dns_fixedname_init(&prefix);
- 	dns_name_split(qname, nlabels, dns_fixedname_name(&prefix), NULL);
- 	dns_fixedname_init(fixeddname);
-@@ -6736,13 +6718,13 @@ static isc_result_t
- answer_response(fetchctx_t *fctx) {
- 	isc_result_t result;
- 	dns_message_t *message;
--	dns_name_t *name, *qname, tname, *ns_name;
-+	dns_name_t *name, *dname, *qname, tname, *ns_name;
- 	dns_rdataset_t *rdataset, *ns_rdataset;
- 	isc_boolean_t done, external, chaining, aa, found, want_chaining;
- 	isc_boolean_t have_answer, found_cname, found_type, wanted_chaining;
- 	unsigned int aflag;
- 	dns_rdatatype_t type;
--	dns_fixedname_t dname, fqname;
-+	dns_fixedname_t fdname, fqname;
- 	dns_view_t *view;
- 
- 	FCTXTRACE("answer_response");
-@@ -6770,10 +6752,15 @@ answer_response(fetchctx_t *fctx) {
- 	view = fctx->res->view;
- 	result = dns_message_firstname(message, DNS_SECTION_ANSWER);
- 	while (!done && result == ISC_R_SUCCESS) {
-+		dns_namereln_t namereln;
-+		int order;
-+		unsigned int nlabels;
-+
- 		name = NULL;
- 		dns_message_currentname(message, DNS_SECTION_ANSWER, &name);
- 		external = ISC_TF(!dns_name_issubdomain(name, &fctx->domain));
--		if (dns_name_equal(name, qname)) {
-+		namereln = dns_name_fullcompare(qname, name, &order, &nlabels);
-+		if (namereln == dns_namereln_equal) {
- 			wanted_chaining = ISC_FALSE;
- 			for (rdataset = ISC_LIST_HEAD(name->list);
- 			     rdataset != NULL;
-@@ -6898,10 +6885,11 @@ answer_response(fetchctx_t *fctx) {
- 						 */
- 						INSIST(!external);
- 						if (aflag ==
--						    DNS_RDATASETATTR_ANSWER)
-+						    DNS_RDATASETATTR_ANSWER) {
- 							have_answer = ISC_TRUE;
--						name->attributes |=
--							DNS_NAMEATTR_ANSWER;
-+							name->attributes |=
-+								DNS_NAMEATTR_ANSWER;
-+						}
- 						rdataset->attributes |= aflag;
- 						if (aa)
- 							rdataset->trust =
-@@ -6956,6 +6944,8 @@ answer_response(fetchctx_t *fctx) {
- 			if (wanted_chaining)
- 				chaining = ISC_TRUE;
- 		} else {
-+			dns_rdataset_t *dnameset = NULL;
-+
- 			/*
- 			 * Look for a DNAME (or its SIG).  Anything else is
- 			 * ignored.
-@@ -6963,10 +6953,8 @@ answer_response(fetchctx_t *fctx) {
- 			wanted_chaining = ISC_FALSE;
- 			for (rdataset = ISC_LIST_HEAD(name->list);
- 			     rdataset != NULL;
--			     rdataset = ISC_LIST_NEXT(rdataset, link)) {
--				isc_boolean_t found_dname = ISC_FALSE;
--				dns_name_t *dname_name;
--
-+			     rdataset = ISC_LIST_NEXT(rdataset, link))
-+			{
- 				/*
- 				 * Only pass DNAME or RRSIG(DNAME).
- 				 */
-@@ -6980,20 +6968,41 @@ answer_response(fetchctx_t *fctx) {
- 				 * its signature should not be external.
- 				 */
- 				if (!chaining && external) {
--					log_formerr(fctx, "external DNAME");
-+					char qbuf[DNS_NAME_FORMATSIZE];
-+					char obuf[DNS_NAME_FORMATSIZE];
-+
-+					dns_name_format(name, qbuf,
-+							sizeof(qbuf));
-+					dns_name_format(&fctx->domain, obuf,
-+							sizeof(obuf));
-+					log_formerr(fctx, "external DNAME or "
-+						    "RRSIG covering DNAME "
-+						    "in answer: %s is "
-+						    "not in %s", qbuf, obuf);
-+					return (DNS_R_FORMERR);
-+				}
-+
-+				if (namereln != dns_namereln_subdomain) {
-+					char qbuf[DNS_NAME_FORMATSIZE];
-+					char obuf[DNS_NAME_FORMATSIZE];
-+
-+					dns_name_format(qname, qbuf,
-+							sizeof(qbuf));
-+					dns_name_format(name, obuf,
-+							sizeof(obuf));
-+					log_formerr(fctx, "unrelated DNAME "
-+						    "in answer: %s is "
-+						    "not in %s", qbuf, obuf);
- 					return (DNS_R_FORMERR);
- 				}
- 
--				found = ISC_FALSE;
- 				aflag = 0;
- 				if (rdataset->type == dns_rdatatype_dname) {
--					found = ISC_TRUE;
- 					want_chaining = ISC_TRUE;
- 					POST(want_chaining);
- 					aflag = DNS_RDATASETATTR_ANSWER;
--					result = dname_target(fctx, rdataset,
--							      qname, name,
--							      &dname);
-+					result = dname_target(rdataset, qname,
-+							      nlabels, &fdname);
- 					if (result == ISC_R_NOSPACE) {
- 						/*
- 						 * We can't construct the
-@@ -7005,14 +7014,12 @@ answer_response(fetchctx_t *fctx) {
- 					} else if (result != ISC_R_SUCCESS)
- 						return (result);
- 					else
--						found_dname = ISC_TRUE;
-+						dnameset = rdataset;
- 
--					dname_name = dns_fixedname_name(&dname);
-+					dname = dns_fixedname_name(&fdname);
- 					if (!is_answertarget_allowed(view,
--							qname,
--							rdataset->type,
--							dname_name,
--							&fctx->domain)) {
-+							qname, rdataset->type,
-+							dname, &fctx->domain)) {
- 						return (DNS_R_SERVFAIL);
- 					}
- 				} else {
-@@ -7020,73 +7027,60 @@ answer_response(fetchctx_t *fctx) {
- 					 * We've found a signature that
- 					 * covers the DNAME.
- 					 */
--					found = ISC_TRUE;
- 					aflag = DNS_RDATASETATTR_ANSWERSIG;
- 				}
- 
--				if (found) {
-+				/*
-+				 * We've found an answer to our
-+				 * question.
-+				 */
-+				name->attributes |= DNS_NAMEATTR_CACHE;
-+				rdataset->attributes |= DNS_RDATASETATTR_CACHE;
-+				rdataset->trust = dns_trust_answer;
-+				if (!chaining) {
- 					/*
--					 * We've found an answer to our
--					 * question.
-+					 * This data is "the" answer to
-+					 * our question only if we're
-+					 * not chaining.
- 					 */
--					name->attributes |=
--						DNS_NAMEATTR_CACHE;
--					rdataset->attributes |=
--						DNS_RDATASETATTR_CACHE;
--					rdataset->trust = dns_trust_answer;
--					if (!chaining) {
--						/*
--						 * This data is "the" answer
--						 * to our question only if
--						 * we're not chaining.
--						 */
--						INSIST(!external);
--						if (aflag ==
--						    DNS_RDATASETATTR_ANSWER)
--							have_answer = ISC_TRUE;
-+					INSIST(!external);
-+					if (aflag == DNS_RDATASETATTR_ANSWER) {
-+						have_answer = ISC_TRUE;
- 						name->attributes |=
- 							DNS_NAMEATTR_ANSWER;
--						rdataset->attributes |= aflag;
--						if (aa)
--							rdataset->trust =
--							  dns_trust_authanswer;
--					} else if (external) {
--						rdataset->attributes |=
--						    DNS_RDATASETATTR_EXTERNAL;
--					}
--
--					/*
--					 * DNAME chaining.
--					 */
--					if (found_dname) {
--						/*
--						 * Copy the dname into the
--						 * qname fixed name.
--						 *
--						 * Although we check for
--						 * failure of the copy
--						 * operation, in practice it
--						 * should never fail since
--						 * we already know that the
--						 * result fits in a fixedname.
--						 */
--						dns_fixedname_init(&fqname);
--						result = dns_name_copy(
--						  dns_fixedname_name(&dname),
--						  dns_fixedname_name(&fqname),
--						  NULL);
--						if (result != ISC_R_SUCCESS)
--							return (result);
--						wanted_chaining = ISC_TRUE;
--						name->attributes |=
--							DNS_NAMEATTR_CHAINING;
--						rdataset->attributes |=
--						    DNS_RDATASETATTR_CHAINING;
--						qname = dns_fixedname_name(
--								   &fqname);
- 					}
-+					rdataset->attributes |= aflag;
-+					if (aa)
-+						rdataset->trust =
-+						  dns_trust_authanswer;
-+				} else if (external) {
-+					rdataset->attributes |=
-+					    DNS_RDATASETATTR_EXTERNAL;
- 				}
- 			}
-+
-+			/*
-+			 * DNAME chaining.
-+			 */
-+			if (dnameset != NULL) {
-+				/*
-+				 * Copy the dname into the qname fixed name.
-+				 *
-+				 * Although we check for failure of the copy
-+				 * operation, in practice it should never fail
-+				 * since we already know that the  result fits
-+				 * in a fixedname.
-+				 */
-+				dns_fixedname_init(&fqname);
-+				qname = dns_fixedname_name(&fqname);
-+				result = dns_name_copy(dname, qname, NULL);
-+				if (result != ISC_R_SUCCESS)
-+					return (result);
-+				wanted_chaining = ISC_TRUE;
-+				name->attributes |= DNS_NAMEATTR_CHAINING;
-+				dnameset->attributes |=
-+					    DNS_RDATASETATTR_CHAINING;
-+			}
- 			if (wanted_chaining)
- 				chaining = ISC_TRUE;
- 		}
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
deleted file mode 100644
index 1b84d46..0000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
+++ /dev/null
@@ -1,247 +0,0 @@
-CVE-2016-2088
-
-Backport commit d7ff9a1c41bf0ba9773cb3adb08b48b9fd57c956 from the
-v9_10_3_patch branch.
-
-https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-2088
-https://kb.isc.org/article/AA-01351
-
-CVE: CVE-2016-2088
-Upstream-Status: Backport
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-
-Original commit message from Mark Andrews <marka@isc.org> below:
-
-4322.   [security]      Duplicate EDNS COOKIE options in a response could
-                        trigger an assertion failure. (CVE-2016-2088)
-                        [RT #41809]
-
-(cherry picked from commit 455c0848f80a8acda27aad1466c72987cafaa029)
-(cherry picked from commit 7cd300abd6ee8b8ee8730593daf742ba53f90bc3)
----
- CHANGES            |  4 ++++
- bin/dig/dighost.c  |  9 +++++++++
- bin/named/client.c | 33 +++++++++++++++++++++++----------
- doc/arm/notes.xml  |  7 +++++++
- lib/dns/resolver.c | 14 +++++++++++++-
- 5 files changed, 56 insertions(+), 11 deletions(-)
-
-diff --git a/CHANGES b/CHANGES
-index c5b5d2b..d2e3360 100644
---- a/CHANGES
-+++ b/CHANGES
-@@ -1,3 +1,7 @@
-+4322.  [security]      Duplicate EDNS COOKIE options in a response could
-+                       trigger an assertion failure. (CVE-2016-2088)
-+                       [RT #41809]
-+
- 4319.  [security]      Fix resolver assertion failure due to improper
-                        DNAME handling when parsing fetch reply messages.
-                        (CVE-2016-1286) [RT #41753]
-diff --git a/bin/dig/dighost.c b/bin/dig/dighost.c
-index ca82f8e..340904f 100644
---- a/bin/dig/dighost.c
-+++ b/bin/dig/dighost.c
-@@ -3458,6 +3458,7 @@ process_opt(dig_lookup_t *l, dns_message_t *msg) {
- 	isc_buffer_t optbuf;
- 	isc_uint16_t optcode, optlen;
- 	dns_rdataset_t *opt = msg->opt;
-+	isc_boolean_t seen_cookie = ISC_FALSE;
- 
- 	result = dns_rdataset_first(opt);
- 	if (result == ISC_R_SUCCESS) {
-@@ -3470,7 +3471,15 @@ process_opt(dig_lookup_t *l, dns_message_t *msg) {
- 			optlen = isc_buffer_getuint16(&optbuf);
- 			switch (optcode) {
- 			case DNS_OPT_COOKIE:
-+				/*
-+				 * Only process the first cookie option.
-+				 */
-+				if (seen_cookie) {
-+					isc_buffer_forward(&optbuf, optlen);
-+					break;
-+				}
- 				process_sit(l, msg, &optbuf, optlen);
-+				seen_cookie = ISC_TRUE;
- 				break;
- 			default:
- 				isc_buffer_forward(&optbuf, optlen);
-diff --git a/bin/named/client.c b/bin/named/client.c
-index 683305c..0d7331a 100644
---- a/bin/named/client.c
-+++ b/bin/named/client.c
-@@ -120,7 +120,10 @@
-  */
- #endif
- 
--#define SIT_SIZE 24U /* 8 + 4 + 4 + 8 */
-+#define COOKIE_SIZE 24U /* 8 + 4 + 4 + 8 */
-+
-+#define WANTNSID(x) (((x)->attributes & NS_CLIENTATTR_WANTNSID) != 0)
-+#define WANTEXPIRE(x) (((x)->attributes & NS_CLIENTATTR_WANTEXPIRE) != 0)
- 
- /*% nameserver client manager structure */
- struct ns_clientmgr {
-@@ -1395,7 +1398,7 @@ ns_client_addopt(ns_client_t *client, dns_message_t *message,
- {
- 	char nsid[BUFSIZ], *nsidp;
- #ifdef ISC_PLATFORM_USESIT
--	unsigned char sit[SIT_SIZE];
-+	unsigned char sit[COOKIE_SIZE];
- #endif
- 	isc_result_t result;
- 	dns_view_t *view;
-@@ -1420,7 +1423,7 @@ ns_client_addopt(ns_client_t *client, dns_message_t *message,
- 	flags = client->extflags & DNS_MESSAGEEXTFLAG_REPLYPRESERVE;
- 
- 	/* Set EDNS options if applicable */
--	if ((client->attributes & NS_CLIENTATTR_WANTNSID) != 0 &&
-+	if (WANTNSID(client) &&
- 	    (ns_g_server->server_id != NULL ||
- 	     ns_g_server->server_usehostname)) {
- 		if (ns_g_server->server_usehostname) {
-@@ -1453,7 +1456,7 @@ ns_client_addopt(ns_client_t *client, dns_message_t *message,
- 
- 		INSIST(count < DNS_EDNSOPTIONS);
- 		ednsopts[count].code = DNS_OPT_COOKIE;
--		ednsopts[count].length = SIT_SIZE;
-+		ednsopts[count].length = COOKIE_SIZE;
- 		ednsopts[count].value = sit;
- 		count++;
- 	}
-@@ -1661,19 +1664,26 @@ compute_sit(ns_client_t *client, isc_uint32_t when, isc_uint32_t nonce,
- 
- static void
- process_sit(ns_client_t *client, isc_buffer_t *buf, size_t optlen) {
--	unsigned char dbuf[SIT_SIZE];
-+	unsigned char dbuf[COOKIE_SIZE];
- 	unsigned char *old;
- 	isc_stdtime_t now;
- 	isc_uint32_t when;
- 	isc_uint32_t nonce;
- 	isc_buffer_t db;
- 
-+	/*
-+	 * If we have already seen a ECS option skip this ECS option.
-+	 */
-+	if ((client->attributes & NS_CLIENTATTR_WANTSIT) != 0) {
-+		isc_buffer_forward(buf, optlen);
-+		return;
-+	}
- 	client->attributes |= NS_CLIENTATTR_WANTSIT;
- 
- 	isc_stats_increment(ns_g_server->nsstats,
- 			    dns_nsstatscounter_sitopt);
- 
--	if (optlen != SIT_SIZE) {
-+	if (optlen != COOKIE_SIZE) {
- 		/*
- 		 * Not our token.
- 		 */
-@@ -1717,14 +1727,13 @@ process_sit(ns_client_t *client, isc_buffer_t *buf, size_t optlen) {
- 	isc_buffer_init(&db, dbuf, sizeof(dbuf));
- 	compute_sit(client, when, nonce, &db);
- 
--	if (!isc_safe_memequal(old, dbuf, SIT_SIZE)) {
-+	if (!isc_safe_memequal(old, dbuf, COOKIE_SIZE)) {
- 		isc_stats_increment(ns_g_server->nsstats,
- 				    dns_nsstatscounter_sitnomatch);
- 		return;
- 	}
- 	isc_stats_increment(ns_g_server->nsstats,
- 			    dns_nsstatscounter_sitmatch);
--
- 	client->attributes |= NS_CLIENTATTR_HAVESIT;
- }
- #endif
-@@ -1783,7 +1792,9 @@ process_opt(ns_client_t *client, dns_rdataset_t *opt) {
- 			optlen = isc_buffer_getuint16(&optbuf);
- 			switch (optcode) {
- 			case DNS_OPT_NSID:
--				isc_stats_increment(ns_g_server->nsstats,
-+				if (!WANTNSID(client))
-+					isc_stats_increment(
-+						    ns_g_server->nsstats,
- 						    dns_nsstatscounter_nsidopt);
- 				client->attributes |= NS_CLIENTATTR_WANTNSID;
- 				isc_buffer_forward(&optbuf, optlen);
-@@ -1794,7 +1805,9 @@ process_opt(ns_client_t *client, dns_rdataset_t *opt) {
- 				break;
- #endif
- 			case DNS_OPT_EXPIRE:
--				isc_stats_increment(ns_g_server->nsstats,
-+				if (!WANTEXPIRE(client))
-+					isc_stats_increment(
-+						  ns_g_server->nsstats,
- 						  dns_nsstatscounter_expireopt);
- 				client->attributes |= NS_CLIENTATTR_WANTEXPIRE;
- 				isc_buffer_forward(&optbuf, optlen);
-diff --git a/doc/arm/notes.xml b/doc/arm/notes.xml
-index ebf4f55..095eb5b 100644
---- a/doc/arm/notes.xml
-+++ b/doc/arm/notes.xml
-@@ -51,6 +51,13 @@
-     <title>Security Fixes</title>
-     <itemizedlist>
-       <listitem>
-+       <para>
-+         Duplicate EDNS COOKIE options in a response could trigger
-+         an assertion failure. This flaw is disclosed in CVE-2016-2088.
-+         [RT #41809]
-+       </para>
-+      </listitem>
-+      <listitem>
- 	<para>
- 	  Specific APL data could trigger an INSIST.  This flaw
- 	  was discovered by Brian Mitchell and is disclosed in
-diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
-index a797e3f..ba1ae23 100644
---- a/lib/dns/resolver.c
-+++ b/lib/dns/resolver.c
-@@ -7502,7 +7502,9 @@ process_opt(resquery_t *query, dns_rdataset_t *opt) {
- 	unsigned char *sit;
- 	dns_adbaddrinfo_t *addrinfo;
- 	unsigned char cookie[8];
-+	isc_boolean_t seen_cookie = ISC_FALSE;
- #endif
-+	isc_boolean_t seen_nsid = ISC_FALSE;
- 
- 	result = dns_rdataset_first(opt);
- 	if (result == ISC_R_SUCCESS) {
-@@ -7516,14 +7518,23 @@ process_opt(resquery_t *query, dns_rdataset_t *opt) {
- 			INSIST(optlen <= isc_buffer_remaininglength(&optbuf));
- 			switch (optcode) {
- 			case DNS_OPT_NSID:
--				if (query->options & DNS_FETCHOPT_WANTNSID)
-+				if (!seen_nsid &&
-+				    query->options & DNS_FETCHOPT_WANTNSID)
- 					log_nsid(&optbuf, optlen, query,
- 						 ISC_LOG_DEBUG(3),
- 						 query->fctx->res->mctx);
- 				isc_buffer_forward(&optbuf, optlen);
-+				seen_nsid = ISC_TRUE;
- 				break;
- #ifdef ISC_PLATFORM_USESIT
- 			case DNS_OPT_COOKIE:
-+				/*
-+				 * Only process the first cookie option.
-+				 */
-+				if (seen_cookie) {
-+					isc_buffer_forward(&optbuf, optlen);
-+					break;
-+				}
- 				sit = isc_buffer_current(&optbuf);
- 				compute_cc(query, cookie, sizeof(cookie));
- 				INSIST(query->fctx->rmessage->sitbad == 0 &&
-@@ -7541,6 +7552,7 @@ process_opt(resquery_t *query, dns_rdataset_t *opt) {
- 				isc_buffer_forward(&optbuf, optlen);
- 				inc_stats(query->fctx->res,
- 					  dns_resstatscounter_sitin);
-+				seen_cookie = ISC_TRUE;
- 				break;
- #endif
- 			default:
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
deleted file mode 100644
index 5393063..0000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 9d8aba8a7778721ae2cee6e4670a8e6be6590b05 Mon Sep 17 00:00:00 2001
-From: Mark Andrews <marka@isc.org>
-Date: Wed, 12 Oct 2016 19:52:59 +0900
-Subject: [PATCH]
-4406.   [security]      getrrsetbyname with a non absolute name could
-                        trigger an infinite recursion bug in lwresd
-                        and named with lwres configured if when combined
-                        with a search list entry the resulting name is
-                        too long. (CVE-2016-2775) [RT #42694]
-
-Backport commit 38cc2d14e218e536e0102fa70deef99461354232 from the
-v9.11.0_patch branch.
-
-CVE: CVE-2016-2775
-Upstream-Status: Backport
-
-Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
-
----
- CHANGES                          |  6 ++++++
- bin/named/lwdgrbn.c              | 16 ++++++++++------
- bin/tests/system/lwresd/lwtest.c |  9 ++++++++-
- 3 files changed, 24 insertions(+), 7 deletions(-)
-
-diff --git a/CHANGES b/CHANGES
-index d2e3360..d0a9d12 100644
---- a/CHANGES
-+++ b/CHANGES
-@@ -1,3 +1,9 @@
-+4406.   [security]      getrrsetbyname with a non absolute name could
-+                        trigger an infinite recursion bug in lwresd
-+                        and named with lwres configured if when combined
-+                        with a search list entry the resulting name is
-+                        too long. (CVE-2016-2775) [RT #42694]
-+
- 4322.  [security]      Duplicate EDNS COOKIE options in a response could
-                        trigger an assertion failure. (CVE-2016-2088)
-                        [RT #41809]
-diff --git a/bin/named/lwdgrbn.c b/bin/named/lwdgrbn.c
-index 3e7b15b..e1e9adc 100644
---- a/bin/named/lwdgrbn.c
-+++ b/bin/named/lwdgrbn.c
-@@ -403,14 +403,18 @@ start_lookup(ns_lwdclient_t *client) {
- 	INSIST(client->lookup == NULL);
- 
- 	dns_fixedname_init(&absname);
--	result = ns_lwsearchctx_current(&client->searchctx,
--					dns_fixedname_name(&absname));
-+
- 	/*
--	 * This will return failure if relative name + suffix is too long.
--	 * In this case, just go on to the next entry in the search path.
-+         * Perform search across all search domains until success
-+         * is returned. Return in case of failure.
- 	 */
--	if (result != ISC_R_SUCCESS)
--		start_lookup(client);
-+        while (ns_lwsearchctx_current(&client->searchctx,
-+                        dns_fixedname_name(&absname)) != ISC_R_SUCCESS) {
-+                if (ns_lwsearchctx_next(&client->searchctx) != ISC_R_SUCCESS) {
-+                        ns_lwdclient_errorpktsend(client, LWRES_R_FAILURE);
-+                        return;
-+                }
-+        }
- 
- 	result = dns_lookup_create(cm->mctx,
- 				   dns_fixedname_name(&absname),
-diff --git a/bin/tests/system/lwresd/lwtest.c b/bin/tests/system/lwresd/lwtest.c
-index ad9b551..3eb4a66 100644
---- a/bin/tests/system/lwresd/lwtest.c
-+++ b/bin/tests/system/lwresd/lwtest.c
-@@ -768,7 +768,14 @@ main(void) {
- 	test_getrrsetbyname("e.example1.", 1, 2, 1, 1, 1);
- 	test_getrrsetbyname("e.example1.", 1, 46, 2, 0, 1);
- 	test_getrrsetbyname("", 1, 1, 0, 0, 0);
--
-+        test_getrrsetbyname("123456789.123456789.123456789.123456789."
-+                            "123456789.123456789.123456789.123456789."
-+                            "123456789.123456789.123456789.123456789."
-+                            "123456789.123456789.123456789.123456789."
-+                            "123456789.123456789.123456789.123456789."
-+                            "123456789.123456789.123456789.123456789."
-+                            "123456789", 1, 1, 0, 0, 0);
-+ 
- 	if (fails == 0)
- 		printf("I:ok\n");
- 	return (fails);
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
deleted file mode 100644
index 738bf60..0000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 1171111657081970585f9f0e03b476358c33a6c0 Mon Sep 17 00:00:00 2001
-From: Mark Andrews <marka@isc.org>
-Date: Wed, 12 Oct 2016 20:36:52 +0900
-Subject: [PATCH] 
-4467.   [security]      It was possible to trigger an assertion when 
-                        rendering a message. (CVE-2016-2776) [RT #43139]
-
-Backport commit 2bd0922cf995b9ac205fc83baf7e220b95c6bf12 from the
-v9.11.0_patch branch.
-
-CVE: CVE-2016-2776
-Upstream-Status: Backport
-
-Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
-
----
- CHANGES           |  3 +++
- lib/dns/message.c | 42 +++++++++++++++++++++++++++++++-----------
- 2 files changed, 34 insertions(+), 11 deletions(-)
-
-diff --git a/CHANGES b/CHANGES
-index d0a9d12..5c8c61a 100644
---- a/CHANGES
-+++ b/CHANGES
-@@ -1,3 +1,6 @@
-+4467.   [security]      It was possible to trigger an assertion when
-+                        rendering a message. (CVE-2016-2776) [RT #43139]
-+
- 4406.   [security]      getrrsetbyname with a non absolute name could
-                         trigger an infinite recursion bug in lwresd
-                         and named with lwres configured if when combined
-diff --git a/lib/dns/message.c b/lib/dns/message.c
-index 6b5b4bb..b74dc81 100644
---- a/lib/dns/message.c
-+++ b/lib/dns/message.c
-@@ -1754,7 +1754,7 @@ dns_message_renderbegin(dns_message_t *msg, dns_compress_t *cctx,
- 	if (r.length < DNS_MESSAGE_HEADERLEN)
- 		return (ISC_R_NOSPACE);
- 
--	if (r.length < msg->reserved)
-+        if (r.length - DNS_MESSAGE_HEADERLEN < msg->reserved)
- 		return (ISC_R_NOSPACE);
- 
- 	/*
-@@ -1895,8 +1895,29 @@ norender_rdataset(const dns_rdataset_t *rdataset, unsigned int options,
- 
- 	return (ISC_TRUE);
- }
--
- #endif
-+
-+static isc_result_t
-+renderset(dns_rdataset_t *rdataset, dns_name_t *owner_name,
-+         dns_compress_t *cctx, isc_buffer_t *target,
-+         unsigned int reserved, unsigned int options, unsigned int *countp)
-+{
-+       isc_result_t result;
-+
-+       /*
-+        * Shrink the space in the buffer by the reserved amount.
-+        */
-+       if (target->length - target->used < reserved)
-+               return (ISC_R_NOSPACE);
-+
-+       target->length -= reserved;
-+       result = dns_rdataset_towire(rdataset, owner_name,
-+                                    cctx, target, options, countp);
-+       target->length += reserved;
-+
-+       return (result);
-+}
-+
- isc_result_t
- dns_message_rendersection(dns_message_t *msg, dns_section_t sectionid,
- 			  unsigned int options)
-@@ -1939,6 +1960,8 @@ dns_message_rendersection(dns_message_t *msg, dns_section_t sectionid,
- 	/*
- 	 * Shrink the space in the buffer by the reserved amount.
- 	 */
-+        if (msg->buffer->length - msg->buffer->used < msg->reserved)
-+                return (ISC_R_NOSPACE);
- 	msg->buffer->length -= msg->reserved;
- 
- 	total = 0;
-@@ -2214,9 +2237,8 @@ dns_message_renderend(dns_message_t *msg) {
- 		 * Render.
- 		 */
- 		count = 0;
--		result = dns_rdataset_towire(msg->opt, dns_rootname,
--					     msg->cctx, msg->buffer, 0,
--					     &count);
-+                result = renderset(msg->opt, dns_rootname, msg->cctx,
-+                                   msg->buffer, msg->reserved, 0, &count);
- 		msg->counts[DNS_SECTION_ADDITIONAL] += count;
- 		if (result != ISC_R_SUCCESS)
- 			return (result);
-@@ -2232,9 +2254,8 @@ dns_message_renderend(dns_message_t *msg) {
- 		if (result != ISC_R_SUCCESS)
- 			return (result);
- 		count = 0;
--		result = dns_rdataset_towire(msg->tsig, msg->tsigname,
--					     msg->cctx, msg->buffer, 0,
--					     &count);
-+                result = renderset(msg->tsig, msg->tsigname, msg->cctx,
-+                                   msg->buffer, msg->reserved, 0, &count);
- 		msg->counts[DNS_SECTION_ADDITIONAL] += count;
- 		if (result != ISC_R_SUCCESS)
- 			return (result);
-@@ -2255,9 +2276,8 @@ dns_message_renderend(dns_message_t *msg) {
- 		 * the owner name of a SIG(0) is irrelevant, and will not
- 		 * be set in a message being rendered.
- 		 */
--		result = dns_rdataset_towire(msg->sig0, dns_rootname,
--					     msg->cctx, msg->buffer, 0,
--					     &count);
-+                result = renderset(msg->sig0, dns_rootname, msg->cctx,
-+                                   msg->buffer, msg->reserved, 0, &count);
- 		msg->counts[DNS_SECTION_ADDITIONAL] += count;
- 		if (result != ISC_R_SUCCESS)
- 			return (result);
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch
deleted file mode 100644
index 75bc211..0000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch
+++ /dev/null
@@ -1,1090 +0,0 @@
-From 1bbcfe2fc84f57b1e4e075fb3bc2a1dd0a3a851f Mon Sep 17 00:00:00 2001
-From: Mark Andrews <marka@isc.org>
-Date: Wed, 2 Nov 2016 17:31:27 +1100
-Subject: [PATCH] 4504. [security] Allow the maximum number of records in a
- zone to be specified. This provides a control for issues raised in
- CVE-2016-6170. [RT #42143]
-
-(cherry picked from commit 5f8412a4cb5ee14a0e8cddd4107854b40ee3291e)
-
-Upstream-Status: Backport
-[https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=commit;h=1bbcfe2fc84f57b1e4e075fb3bc2a1dd0a3a851f]
-
-CVE: CVE-2016-6170
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- CHANGES                                          |   4 +
- bin/named/config.c                               |   1 +
- bin/named/named.conf.docbook                     |   3 +
- bin/named/update.c                               |  16 +++
- bin/named/zoneconf.c                             |   7 ++
- bin/tests/system/nsupdate/clean.sh               |   1 +
- bin/tests/system/nsupdate/ns3/named.conf         |   7 ++
- bin/tests/system/nsupdate/ns3/too-big.test.db.in |  10 ++
- bin/tests/system/nsupdate/setup.sh               |   2 +
- bin/tests/system/nsupdate/tests.sh               |  15 +++
- bin/tests/system/xfer/clean.sh                   |   1 +
- bin/tests/system/xfer/ns1/axfr-too-big.db        |  10 ++
- bin/tests/system/xfer/ns1/ixfr-too-big.db.in     |  13 +++
- bin/tests/system/xfer/ns1/named.conf             |  11 ++
- bin/tests/system/xfer/ns6/named.conf             |  14 +++
- bin/tests/system/xfer/setup.sh                   |   2 +
- bin/tests/system/xfer/tests.sh                   |  26 +++++
- doc/arm/Bv9ARM-book.xml                          |  21 ++++
- doc/arm/notes.xml                                |   9 ++
- lib/bind9/check.c                                |   2 +
- lib/dns/db.c                                     |  13 +++
- lib/dns/ecdb.c                                   |   3 +-
- lib/dns/include/dns/db.h                         |  20 ++++
- lib/dns/include/dns/rdataslab.h                  |  13 +++
- lib/dns/include/dns/result.h                     |   6 +-
- lib/dns/include/dns/zone.h                       |  28 ++++-
- lib/dns/rbtdb.c                                  | 127 +++++++++++++++++++++--
- lib/dns/rdataslab.c                              |  13 +++
- lib/dns/result.c                                 |   9 +-
- lib/dns/sdb.c                                    |   3 +-
- lib/dns/sdlz.c                                   |   3 +-
- lib/dns/xfrin.c                                  |  22 +++-
- lib/dns/zone.c                                   |  23 +++-
- lib/isccfg/namedconf.c                           |   1 +
- 34 files changed, 444 insertions(+), 15 deletions(-)
- create mode 100644 bin/tests/system/nsupdate/ns3/too-big.test.db.in
- create mode 100644 bin/tests/system/xfer/ns1/axfr-too-big.db
- create mode 100644 bin/tests/system/xfer/ns1/ixfr-too-big.db.in
-
-diff --git a/CHANGES b/CHANGES
-index 41cfce5..97d2e60 100644
---- a/CHANGES
-+++ b/CHANGES
-@@ -1,3 +1,7 @@
-+4504.	[security]	Allow the maximum number of records in a zone to
-+			be specified.  This provides a control for issues
-+			raised in CVE-2016-6170. [RT #42143]
-+
- 4489.	[security]	It was possible to trigger assertions when processing
- 			a response. (CVE-2016-8864) [RT #43465]
- 
-diff --git a/bin/named/config.c b/bin/named/config.c
-index f06348c..c24e334 100644
---- a/bin/named/config.c
-+++ b/bin/named/config.c
-@@ -209,6 +209,7 @@ options {\n\
- 	max-transfer-time-out 120;\n\
- 	max-transfer-idle-in 60;\n\
- 	max-transfer-idle-out 60;\n\
-+	max-records 0;\n\
- 	max-retry-time 1209600; /* 2 weeks */\n\
- 	min-retry-time 500;\n\
- 	max-refresh-time 2419200; /* 4 weeks */\n\
-diff --git a/bin/named/named.conf.docbook b/bin/named/named.conf.docbook
-index 4c99a61..c2d173a 100644
---- a/bin/named/named.conf.docbook
-+++ b/bin/named/named.conf.docbook
-@@ -338,6 +338,7 @@ options {
- 	};
- 
- 	max-journal-size <replaceable>size_no_default</replaceable>;
-+	max-records <replaceable>integer</replaceable>;
- 	max-transfer-time-in <replaceable>integer</replaceable>;
- 	max-transfer-time-out <replaceable>integer</replaceable>;
- 	max-transfer-idle-in <replaceable>integer</replaceable>;
-@@ -527,6 +528,7 @@ view <replaceable>string</replaceable> <replaceable>optional_class</replaceable>
- 	};
- 
- 	max-journal-size <replaceable>size_no_default</replaceable>;
-+	max-records <replaceable>integer</replaceable>;
- 	max-transfer-time-in <replaceable>integer</replaceable>;
- 	max-transfer-time-out <replaceable>integer</replaceable>;
- 	max-transfer-idle-in <replaceable>integer</replaceable>;
-@@ -624,6 +626,7 @@ zone <replaceable>string</replaceable> <replaceable>optional_class</replaceable>
- 	};
- 
- 	max-journal-size <replaceable>size_no_default</replaceable>;
-+	max-records <replaceable>integer</replaceable>;
- 	max-transfer-time-in <replaceable>integer</replaceable>;
- 	max-transfer-time-out <replaceable>integer</replaceable>;
- 	max-transfer-idle-in <replaceable>integer</replaceable>;
-diff --git a/bin/named/update.c b/bin/named/update.c
-index 83b1a05..cc2a611 100644
---- a/bin/named/update.c
-+++ b/bin/named/update.c
-@@ -2455,6 +2455,8 @@ update_action(isc_task_t *task, isc_event_t *event) {
- 	isc_boolean_t had_dnskey;
- 	dns_rdatatype_t privatetype = dns_zone_getprivatetype(zone);
- 	dns_ttl_t maxttl = 0;
-+	isc_uint32_t maxrecords;
-+	isc_uint64_t records;
- 
- 	INSIST(event->ev_type == DNS_EVENT_UPDATE);
- 
-@@ -3138,6 +3140,20 @@ update_action(isc_task_t *task, isc_event_t *event) {
- 			}
- 		}
- 
-+		maxrecords = dns_zone_getmaxrecords(zone);
-+		if (maxrecords != 0U) {
-+			result = dns_db_getsize(db, ver, &records, NULL);
-+			if (result == ISC_R_SUCCESS && records > maxrecords) {
-+				update_log(client, zone, ISC_LOG_ERROR,
-+					   "records in zone (%"
-+					   ISC_PRINT_QUADFORMAT
-+					   "u) exceeds max-records (%u)",
-+					   records, maxrecords);
-+				result = DNS_R_TOOMANYRECORDS;
-+				goto failure;
-+			}
-+		}
-+
- 		journalfile = dns_zone_getjournal(zone);
- 		if (journalfile != NULL) {
- 			update_log(client, zone, LOGLEVEL_DEBUG,
-diff --git a/bin/named/zoneconf.c b/bin/named/zoneconf.c
-index 4ee3dfe..14dd8ce 100644
---- a/bin/named/zoneconf.c
-+++ b/bin/named/zoneconf.c
-@@ -978,6 +978,13 @@ ns_zone_configure(const cfg_obj_t *config, const cfg_obj_t *vconfig,
- 			dns_zone_setmaxttl(raw, maxttl);
- 	}
- 
-+	obj = NULL;
-+	result = ns_config_get(maps, "max-records", &obj);
-+	INSIST(result == ISC_R_SUCCESS && obj != NULL);
-+	dns_zone_setmaxrecords(mayberaw, cfg_obj_asuint32(obj));
-+	if (zone != mayberaw)
-+		dns_zone_setmaxrecords(zone, 0);
-+
- 	if (raw != NULL && filename != NULL) {
- #define SIGNED ".signed"
- 		size_t signedlen = strlen(filename) + sizeof(SIGNED);
-diff --git a/bin/tests/system/nsupdate/clean.sh b/bin/tests/system/nsupdate/clean.sh
-index aaefc02..ea25545 100644
---- a/bin/tests/system/nsupdate/clean.sh
-+++ b/bin/tests/system/nsupdate/clean.sh
-@@ -32,6 +32,7 @@ rm -f ns3/example.db.jnl ns3/example.db
- rm -f ns3/nsec3param.test.db.signed.jnl ns3/nsec3param.test.db ns3/nsec3param.test.db.signed ns3/dsset-nsec3param.test.
- rm -f ns3/dnskey.test.db.signed.jnl ns3/dnskey.test.db ns3/dnskey.test.db.signed ns3/dsset-dnskey.test.
- rm -f ns3/K*
-+rm -f ns3/too-big.test.db
- rm -f dig.out.*
- rm -f jp.out.ns3.*
- rm -f Kxxx.*
-diff --git a/bin/tests/system/nsupdate/ns3/named.conf b/bin/tests/system/nsupdate/ns3/named.conf
-index 2abd522..68ff27a 100644
---- a/bin/tests/system/nsupdate/ns3/named.conf
-+++ b/bin/tests/system/nsupdate/ns3/named.conf
-@@ -60,3 +60,10 @@ zone "dnskey.test" {
- 	allow-update { any; };
- 	file "dnskey.test.db.signed";
- };
-+
-+zone "too-big.test" {
-+	type master;
-+	allow-update { any; };
-+	max-records 3;
-+	file "too-big.test.db";
-+};
-diff --git a/bin/tests/system/nsupdate/ns3/too-big.test.db.in b/bin/tests/system/nsupdate/ns3/too-big.test.db.in
-new file mode 100644
-index 0000000..7ff1e4a
---- /dev/null
-+++ b/bin/tests/system/nsupdate/ns3/too-big.test.db.in
-@@ -0,0 +1,10 @@
-+; Copyright (C) 2016  Internet Systems Consortium, Inc. ("ISC")
-+;
-+; This Source Code Form is subject to the terms of the Mozilla Public
-+; License, v. 2.0. If a copy of the MPL was not distributed with this
-+; file, You can obtain one at http://mozilla.org/MPL/2.0/.
-+
-+$TTL 10
-+too-big.test. IN SOA too-big.test. hostmaster.too-big.test. 1 3600 900 2419200 3600
-+too-big.test. IN NS too-big.test.
-+too-big.test. IN A 10.53.0.3
-diff --git a/bin/tests/system/nsupdate/setup.sh b/bin/tests/system/nsupdate/setup.sh
-index 828255e..43c4094 100644
---- a/bin/tests/system/nsupdate/setup.sh
-+++ b/bin/tests/system/nsupdate/setup.sh
-@@ -27,12 +27,14 @@ test -r $RANDFILE || $GENRANDOM 400 $RANDFILE
- rm -f ns1/*.jnl ns1/example.db ns2/*.jnl ns2/example.bk
- rm -f ns2/update.bk ns2/update.alt.bk
- rm -f ns3/example.db.jnl
-+rm -f ns3/too-big.test.db.jnl
- 
- cp -f ns1/example1.db ns1/example.db
- sed 's/example.nil/other.nil/g' ns1/example1.db > ns1/other.db
- sed 's/example.nil/unixtime.nil/g' ns1/example1.db > ns1/unixtime.db
- sed 's/example.nil/keytests.nil/g' ns1/example1.db > ns1/keytests.db
- cp -f ns3/example.db.in ns3/example.db
-+cp -f ns3/too-big.test.db.in ns3/too-big.test.db
- 
- # update_test.pl has its own zone file because it
- # requires a specific NS record set.
-diff --git a/bin/tests/system/nsupdate/tests.sh b/bin/tests/system/nsupdate/tests.sh
-index 78d501e..0a6bbd3 100755
---- a/bin/tests/system/nsupdate/tests.sh
-+++ b/bin/tests/system/nsupdate/tests.sh
-@@ -581,5 +581,20 @@ if [ $ret -ne 0 ]; then
-     status=1
- fi
- 
-+n=`expr $n + 1`
-+echo "I:check that adding too many records is blocked ($n)"
-+ret=0
-+$NSUPDATE -v << EOF > nsupdate.out-$n 2>&1 && ret=1
-+server 10.53.0.3 5300
-+zone too-big.test.
-+update add r1.too-big.test 3600 IN TXT r1.too-big.test
-+send
-+EOF
-+grep "update failed: SERVFAIL" nsupdate.out-$n > /dev/null || ret=1
-+DIG +tcp @10.53.0.3 -p 5300 r1.too-big.test TXT > dig.out.ns3.test$n
-+grep "status: NXDOMAIN" dig.out.ns3.test$n > /dev/null || ret=1
-+grep "records in zone (4) exceeds max-records (3)" ns3/named.run > /dev/null || ret=1
-+[ $ret = 0 ] || { echo I:failed; status=1; }
-+
- echo "I:exit status: $status"
- exit $status
-diff --git a/bin/tests/system/xfer/clean.sh b/bin/tests/system/xfer/clean.sh
-index 48aa159..da62a33 100644
---- a/bin/tests/system/xfer/clean.sh
-+++ b/bin/tests/system/xfer/clean.sh
-@@ -36,3 +36,4 @@ rm -f ns7/*.db ns7/*.bk ns7/*.jnl
- rm -f */named.memstats
- rm -f */named.run
- rm -f */ans.run
-+rm -f ns1/ixfr-too-big.db ns1/ixfr-too-big.db.jnl
-diff --git a/bin/tests/system/xfer/ns1/axfr-too-big.db b/bin/tests/system/xfer/ns1/axfr-too-big.db
-new file mode 100644
-index 0000000..d43760d
---- /dev/null
-+++ b/bin/tests/system/xfer/ns1/axfr-too-big.db
-@@ -0,0 +1,10 @@
-+; Copyright (C) 2016  Internet Systems Consortium, Inc. ("ISC")
-+;
-+; This Source Code Form is subject to the terms of the Mozilla Public
-+; License, v. 2.0. If a copy of the MPL was not distributed with this
-+; file, You can obtain one at http://mozilla.org/MPL/2.0/.
-+
-+$TTL	3600
-+@	IN	SOA	. . 0 0 0 0 0
-+@	IN	NS	.
-+$GENERATE 1-29	host$	A	1.2.3.$
-diff --git a/bin/tests/system/xfer/ns1/ixfr-too-big.db.in b/bin/tests/system/xfer/ns1/ixfr-too-big.db.in
-new file mode 100644
-index 0000000..318bb77
---- /dev/null
-+++ b/bin/tests/system/xfer/ns1/ixfr-too-big.db.in
-@@ -0,0 +1,13 @@
-+; Copyright (C) 2016  Internet Systems Consortium, Inc. ("ISC")
-+;
-+; This Source Code Form is subject to the terms of the Mozilla Public
-+; License, v. 2.0. If a copy of the MPL was not distributed with this
-+; file, You can obtain one at http://mozilla.org/MPL/2.0/.
-+
-+$TTL	3600
-+@	IN	SOA	. . 0 0 0 0 0
-+@	IN	NS	ns1
-+@	IN	NS	ns6
-+ns1	IN	A	10.53.0.1
-+ns6	IN	A	10.53.0.6
-+$GENERATE 1-25	host$	A	1.2.3.$
-diff --git a/bin/tests/system/xfer/ns1/named.conf b/bin/tests/system/xfer/ns1/named.conf
-index 07dad85..1d29292 100644
---- a/bin/tests/system/xfer/ns1/named.conf
-+++ b/bin/tests/system/xfer/ns1/named.conf
-@@ -44,3 +44,14 @@ zone "slave" {
- 	type master;
- 	file "slave.db";
- };
-+
-+zone "axfr-too-big" {
-+        type master;
-+        file "axfr-too-big.db";
-+};
-+
-+zone "ixfr-too-big" {
-+        type master;
-+	allow-update { any; };
-+        file "ixfr-too-big.db";
-+};
-diff --git a/bin/tests/system/xfer/ns6/named.conf b/bin/tests/system/xfer/ns6/named.conf
-index c9421b1..a12a92c 100644
---- a/bin/tests/system/xfer/ns6/named.conf
-+++ b/bin/tests/system/xfer/ns6/named.conf
-@@ -52,3 +52,17 @@ zone "slave" {
- 	masters { 10.53.0.1; };
- 	file "slave.bk";
- };
-+
-+zone "axfr-too-big" {
-+	type slave;
-+	max-records 30;
-+	masters { 10.53.0.1; };
-+	file "axfr-too-big.bk";
-+};
-+
-+zone "ixfr-too-big" {
-+	type slave;
-+	max-records 30;
-+	masters { 10.53.0.1; };
-+	file "ixfr-too-big.bk";
-+};
-diff --git a/bin/tests/system/xfer/setup.sh b/bin/tests/system/xfer/setup.sh
-index 56ca901..c55abf8 100644
---- a/bin/tests/system/xfer/setup.sh
-+++ b/bin/tests/system/xfer/setup.sh
-@@ -33,3 +33,5 @@ cp -f ns4/named.conf.base ns4/named.conf
- 
- cp ns2/slave.db.in ns2/slave.db
- touch -t 200101010000 ns2/slave.db
-+
-+cp -f ns1/ixfr-too-big.db.in ns1/ixfr-too-big.db
-diff --git a/bin/tests/system/xfer/tests.sh b/bin/tests/system/xfer/tests.sh
-index 67b2a1a..fe33f0a 100644
---- a/bin/tests/system/xfer/tests.sh
-+++ b/bin/tests/system/xfer/tests.sh
-@@ -368,5 +368,31 @@ $DIGCMD nil. TXT | grep 'incorrect key AXFR' >/dev/null && {
-     status=1
- }
- 
-+n=`expr $n + 1`
-+echo "I:test that a zone with too many records is rejected (AXFR) ($n)"
-+tmp=0
-+grep "'axfr-too-big/IN'.*: too many records" ns6/named.run >/dev/null || tmp=1
-+if test $tmp != 0 ; then echo "I:failed"; fi
-+status=`expr $status + $tmp`
-+
-+n=`expr $n + 1`
-+echo "I:test that a zone with too many records is rejected (IXFR) ($n)"
-+tmp=0
-+grep "'ixfr-too-big./IN.*: too many records" ns6/named.run >/dev/null && tmp=1
-+$NSUPDATE << EOF
-+zone ixfr-too-big
-+server 10.53.0.1 5300
-+update add the-31st-record.ixfr-too-big 0 TXT this is it
-+send
-+EOF
-+for i in 1 2 3 4 5 6 7 8
-+do
-+    grep "'ixfr-too-big/IN'.*: too many records" ns6/named.run >/dev/null && break
-+    sleep 1
-+done
-+grep "'ixfr-too-big/IN'.*: too many records" ns6/named.run >/dev/null || tmp=1
-+if test $tmp != 0 ; then echo "I:failed"; fi
-+status=`expr $status + $tmp`
-+
- echo "I:exit status: $status"
- exit $status
-diff --git a/doc/arm/Bv9ARM-book.xml b/doc/arm/Bv9ARM-book.xml
-index 848b582..0369505 100644
---- a/doc/arm/Bv9ARM-book.xml
-+++ b/doc/arm/Bv9ARM-book.xml
-@@ -4858,6 +4858,7 @@ badresp:1,adberr:0,findfail:0,valfail:0]
-     <optional> use-queryport-pool <replaceable>yes_or_no</replaceable>; </optional>
-     <optional> queryport-pool-ports <replaceable>number</replaceable>; </optional>
-     <optional> queryport-pool-updateinterval <replaceable>number</replaceable>; </optional>
-+    <optional> max-records <replaceable>number</replaceable>; </optional>
-     <optional> max-transfer-time-in <replaceable>number</replaceable>; </optional>
-     <optional> max-transfer-time-out <replaceable>number</replaceable>; </optional>
-     <optional> max-transfer-idle-in <replaceable>number</replaceable>; </optional>
-@@ -8164,6 +8165,16 @@ avoid-v6-udp-ports { 40000; range 50000 60000; };
- 	    </varlistentry>
- 
- 	    <varlistentry>
-+	      <term><command>max-records</command></term>
-+	      <listitem>
-+		<para>
-+		  The maximum number of records permitted in a zone.
-+		  The default is zero which means unlimited.
-+	 	</para>
-+	      </listitem>
-+	    </varlistentry>
-+
-+	    <varlistentry>
- 	      <term><command>host-statistics-max</command></term>
- 	      <listitem>
- 		<para>
-@@ -12056,6 +12067,16 @@ zone <replaceable>zone_name</replaceable> <optional><replaceable>class</replacea
- 	      </varlistentry>
- 
- 	      <varlistentry>
-+		<term><command>max-records</command></term>
-+		<listitem>
-+		  <para>
-+		    See the description of
-+		    <command>max-records</command> in <xref linkend="server_resource_limits"/>.
-+		  </para>
-+		</listitem>
-+	      </varlistentry>
-+
-+	      <varlistentry>
- 		<term><command>max-transfer-time-in</command></term>
- 		<listitem>
- 		  <para>
-diff --git a/doc/arm/notes.xml b/doc/arm/notes.xml
-index 095eb5b..36495e7 100644
---- a/doc/arm/notes.xml
-+++ b/doc/arm/notes.xml
-@@ -52,6 +52,15 @@
-     <itemizedlist>
-       <listitem>
-        <para>
-+	  Added the ability to specify the maximum number of records
-+	  permitted in a zone (max-records #;).  This provides a mechanism
-+	  to block overly large zone transfers, which is a potential risk
-+	  with slave zones from other parties, as described in CVE-2016-6170.
-+	  [RT #42143]
-+	</para>
-+      </listitem>
-+      <listitem>
-+	<para>
-          Duplicate EDNS COOKIE options in a response could trigger
-          an assertion failure. This flaw is disclosed in CVE-2016-2088.
-          [RT #41809]
-diff --git a/lib/bind9/check.c b/lib/bind9/check.c
-index b8c05dd..edb7534 100644
---- a/lib/bind9/check.c
-+++ b/lib/bind9/check.c
-@@ -1510,6 +1510,8 @@ check_zoneconf(const cfg_obj_t *zconfig, const cfg_obj_t *voptions,
- 	  REDIRECTZONE },
- 	{ "masters", SLAVEZONE | STUBZONE | REDIRECTZONE },
- 	{ "max-ixfr-log-size", MASTERZONE | SLAVEZONE | STREDIRECTZONE },
-+	{ "max-records", MASTERZONE | SLAVEZONE | STUBZONE | STREDIRECTZONE |
-+          STATICSTUBZONE | REDIRECTZONE },
- 	{ "max-refresh-time", SLAVEZONE | STUBZONE | STREDIRECTZONE },
- 	{ "max-retry-time", SLAVEZONE | STUBZONE | STREDIRECTZONE },
- 	{ "max-transfer-idle-in", SLAVEZONE | STUBZONE | STREDIRECTZONE },
-diff --git a/lib/dns/db.c b/lib/dns/db.c
-index 7e4f357..ced94a5 100644
---- a/lib/dns/db.c
-+++ b/lib/dns/db.c
-@@ -999,6 +999,19 @@ dns_db_getnsec3parameters(dns_db_t *db, dns_dbversion_t *version,
- }
- 
- isc_result_t
-+dns_db_getsize(dns_db_t *db, dns_dbversion_t *version, isc_uint64_t *records,
-+	       isc_uint64_t *bytes)
-+{
-+	REQUIRE(DNS_DB_VALID(db));
-+	REQUIRE(dns_db_iszone(db) == ISC_TRUE);
-+
-+	if (db->methods->getsize != NULL)
-+		return ((db->methods->getsize)(db, version, records, bytes));
-+
-+	return (ISC_R_NOTFOUND);
-+}
-+
-+isc_result_t
- dns_db_setsigningtime(dns_db_t *db, dns_rdataset_t *rdataset,
- 		      isc_stdtime_t resign)
- {
-diff --git a/lib/dns/ecdb.c b/lib/dns/ecdb.c
-index 553a339..b5d04d2 100644
---- a/lib/dns/ecdb.c
-+++ b/lib/dns/ecdb.c
-@@ -587,7 +587,8 @@ static dns_dbmethods_t ecdb_methods = {
- 	NULL,			/* findnodeext */
- 	NULL,			/* findext */
- 	NULL,			/* setcachestats */
--	NULL			/* hashsize */
-+	NULL,			/* hashsize */
-+	NULL			/* getsize */
- };
- 
- static isc_result_t
-diff --git a/lib/dns/include/dns/db.h b/lib/dns/include/dns/db.h
-index a4a4482..aff42d6 100644
---- a/lib/dns/include/dns/db.h
-+++ b/lib/dns/include/dns/db.h
-@@ -195,6 +195,8 @@ typedef struct dns_dbmethods {
- 				   dns_rdataset_t *sigrdataset);
- 	isc_result_t	(*setcachestats)(dns_db_t *db, isc_stats_t *stats);
- 	unsigned int	(*hashsize)(dns_db_t *db);
-+	isc_result_t	(*getsize)(dns_db_t *db, dns_dbversion_t *version,
-+				   isc_uint64_t *records, isc_uint64_t *bytes);
- } dns_dbmethods_t;
- 
- typedef isc_result_t
-@@ -1485,6 +1487,24 @@ dns_db_getnsec3parameters(dns_db_t *db, dns_dbversion_t *version,
-  */
- 
- isc_result_t
-+dns_db_getsize(dns_db_t *db, dns_dbversion_t *version, isc_uint64_t *records,
-+               isc_uint64_t *bytes);
-+/*%<
-+ * Get the number of records in the given version of the database as well
-+ * as the number bytes used to store those records.
-+ *
-+ * Requires:
-+ * \li	'db' is a valid zone database.
-+ * \li	'version' is NULL or a valid version.
-+ * \li	'records' is NULL or a pointer to return the record count in.
-+ * \li	'bytes' is NULL or a pointer to return the byte count in.
-+ *
-+ * Returns:
-+ * \li	#ISC_R_SUCCESS
-+ * \li	#ISC_R_NOTIMPLEMENTED
-+ */
-+
-+isc_result_t
- dns_db_findnsec3node(dns_db_t *db, dns_name_t *name,
- 		     isc_boolean_t create, dns_dbnode_t **nodep);
- /*%<
-diff --git a/lib/dns/include/dns/rdataslab.h b/lib/dns/include/dns/rdataslab.h
-index 3ac44b8..2e1e759 100644
---- a/lib/dns/include/dns/rdataslab.h
-+++ b/lib/dns/include/dns/rdataslab.h
-@@ -104,6 +104,7 @@ dns_rdataslab_tordataset(unsigned char *slab, unsigned int reservelen,
-  * Ensures:
-  *\li	'rdataset' is associated and points to a valid rdataest.
-  */
-+
- unsigned int
- dns_rdataslab_size(unsigned char *slab, unsigned int reservelen);
- /*%<
-@@ -116,6 +117,18 @@ dns_rdataslab_size(unsigned char *slab, unsigned int reservelen);
-  *\li	The number of bytes in the slab, including the reservelen.
-  */
- 
-+unsigned int
-+dns_rdataslab_count(unsigned char *slab, unsigned int reservelen);
-+/*%<
-+ * Return the number of records in the rdataslab
-+ *
-+ * Requires:
-+ *\li	'slab' points to a slab.
-+ *
-+ * Returns:
-+ *\li	The number of records in the slab.
-+ */
-+
- isc_result_t
- dns_rdataslab_merge(unsigned char *oslab, unsigned char *nslab,
- 		    unsigned int reservelen, isc_mem_t *mctx,
-diff --git a/lib/dns/include/dns/result.h b/lib/dns/include/dns/result.h
-index 7d11c2b..93d1fd5 100644
---- a/lib/dns/include/dns/result.h
-+++ b/lib/dns/include/dns/result.h
-@@ -157,8 +157,12 @@
- #define DNS_R_BADCDS			(ISC_RESULTCLASS_DNS + 111)
- #define DNS_R_BADCDNSKEY		(ISC_RESULTCLASS_DNS + 112)
- #define DNS_R_OPTERR			(ISC_RESULTCLASS_DNS + 113)
-+#define DNS_R_BADDNSTAP			(ISC_RESULTCLASS_DNS + 114)
-+#define DNS_R_BADTSIG			(ISC_RESULTCLASS_DNS + 115)
-+#define DNS_R_BADSIG0			(ISC_RESULTCLASS_DNS + 116)
-+#define DNS_R_TOOMANYRECORDS		(ISC_RESULTCLASS_DNS + 117)
- 
--#define DNS_R_NRESULTS			114	/*%< Number of results */
-+#define DNS_R_NRESULTS			118	/*%< Number of results */
- 
- /*
-  * DNS wire format rcodes.
-diff --git a/lib/dns/include/dns/zone.h b/lib/dns/include/dns/zone.h
-index a9367f1..227540b 100644
---- a/lib/dns/include/dns/zone.h
-+++ b/lib/dns/include/dns/zone.h
-@@ -296,6 +296,32 @@ dns_zone_getfile(dns_zone_t *zone);
-  */
- 
- void
-+dns_zone_setmaxrecords(dns_zone_t *zone, isc_uint32_t records);
-+/*%<
-+ * 	Sets the maximim number of records permitted in a zone.
-+ *	0 implies unlimited.
-+ *
-+ * Requires:
-+ *\li	'zone' to be valid initialised zone.
-+ *
-+ * Returns:
-+ *\li	void
-+ */
-+
-+isc_uint32_t
-+dns_zone_getmaxrecords(dns_zone_t *zone);
-+/*%<
-+ * 	Gets the maximim number of records permitted in a zone.
-+ *	0 implies unlimited.
-+ *
-+ * Requires:
-+ *\li	'zone' to be valid initialised zone.
-+ *
-+ * Returns:
-+ *\li	isc_uint32_t maxrecords.
-+ */
-+
-+void
- dns_zone_setmaxttl(dns_zone_t *zone, isc_uint32_t maxttl);
- /*%<
-  * 	Sets the max ttl of the zone.
-@@ -316,7 +342,7 @@ dns_zone_getmaxttl(dns_zone_t *zone);
-  *\li	'zone' to be valid initialised zone.
-  *
-  * Returns:
-- *\li	isc_uint32_t maxttl.
-+ *\li	dns_ttl_t maxttl.
-  */
- 
- isc_result_t
-diff --git a/lib/dns/rbtdb.c b/lib/dns/rbtdb.c
-index 62becfc..72d722f 100644
---- a/lib/dns/rbtdb.c
-+++ b/lib/dns/rbtdb.c
-@@ -209,6 +209,7 @@ typedef isc_uint64_t                    rbtdb_serial_t;
- #define free_rbtdb_callback free_rbtdb_callback64
- #define free_rdataset free_rdataset64
- #define getnsec3parameters getnsec3parameters64
-+#define getsize getsize64
- #define getoriginnode getoriginnode64
- #define getrrsetstats getrrsetstats64
- #define getsigningtime getsigningtime64
-@@ -589,6 +590,13 @@ typedef struct rbtdb_version {
- 	isc_uint16_t			iterations;
- 	isc_uint8_t			salt_length;
- 	unsigned char			salt[DNS_NSEC3_SALTSIZE];
-+
-+	/*
-+	 * records and bytes are covered by rwlock.
-+	 */
-+	isc_rwlock_t                    rwlock;
-+	isc_uint64_t			records;
-+	isc_uint64_t			bytes;
- } rbtdb_version_t;
- 
- typedef ISC_LIST(rbtdb_version_t)       rbtdb_versionlist_t;
-@@ -1130,6 +1138,7 @@ free_rbtdb(dns_rbtdb_t *rbtdb, isc_boolean_t log, isc_event_t *event) {
- 		INSIST(refs == 0);
- 		UNLINK(rbtdb->open_versions, rbtdb->current_version, link);
- 		isc_refcount_destroy(&rbtdb->current_version->references);
-+		isc_rwlock_destroy(&rbtdb->current_version->rwlock);
- 		isc_mem_put(rbtdb->common.mctx, rbtdb->current_version,
- 			    sizeof(rbtdb_version_t));
- 	}
-@@ -1383,6 +1392,7 @@ allocate_version(isc_mem_t *mctx, rbtdb_serial_t serial,
- 
- static isc_result_t
- newversion(dns_db_t *db, dns_dbversion_t **versionp) {
-+	isc_result_t result;
- 	dns_rbtdb_t *rbtdb = (dns_rbtdb_t *)db;
- 	rbtdb_version_t *version;
- 
-@@ -1415,13 +1425,28 @@ newversion(dns_db_t *db, dns_dbversion_t **versionp) {
- 			version->salt_length = 0;
- 			memset(version->salt, 0, sizeof(version->salt));
- 		}
--		rbtdb->next_serial++;
--		rbtdb->future_version = version;
--	}
-+		result = isc_rwlock_init(&version->rwlock, 0, 0);
-+		if (result != ISC_R_SUCCESS) {
-+			isc_refcount_destroy(&version->references);
-+			isc_mem_put(rbtdb->common.mctx, version,
-+				    sizeof(*version));
-+			version = NULL;
-+		} else {
-+			RWLOCK(&rbtdb->current_version->rwlock,
-+			       isc_rwlocktype_read);
-+			version->records = rbtdb->current_version->records;
-+			version->bytes = rbtdb->current_version->bytes;
-+			RWUNLOCK(&rbtdb->current_version->rwlock,
-+				 isc_rwlocktype_read);
-+			rbtdb->next_serial++;
-+			rbtdb->future_version = version;
-+		}
-+	} else
-+		result = ISC_R_NOMEMORY;
- 	RBTDB_UNLOCK(&rbtdb->lock, isc_rwlocktype_write);
- 
- 	if (version == NULL)
--		return (ISC_R_NOMEMORY);
-+		return (result);
- 
- 	*versionp = version;
- 
-@@ -2681,6 +2706,7 @@ closeversion(dns_db_t *db, dns_dbversion_t **versionp, isc_boolean_t commit) {
- 
- 	if (cleanup_version != NULL) {
- 		INSIST(EMPTY(cleanup_version->changed_list));
-+		isc_rwlock_destroy(&cleanup_version->rwlock);
- 		isc_mem_put(rbtdb->common.mctx, cleanup_version,
- 			    sizeof(*cleanup_version));
- 	}
-@@ -6254,6 +6280,26 @@ add32(dns_rbtdb_t *rbtdb, dns_rbtnode_t *rbtnode, rbtdb_version_t *rbtversion,
- 		else
- 			rbtnode->data = newheader;
- 		newheader->next = topheader->next;
-+		if (rbtversion != NULL)
-+			RWLOCK(&rbtversion->rwlock, isc_rwlocktype_write);
-+		if (rbtversion != NULL && !header_nx) {
-+			rbtversion->records -=
-+				dns_rdataslab_count((unsigned char *)header,
-+						    sizeof(*header));
-+			rbtversion->bytes -=
-+				dns_rdataslab_size((unsigned char *)header,
-+						   sizeof(*header));
-+		}
-+		if (rbtversion != NULL && !newheader_nx) {
-+			rbtversion->records +=
-+				dns_rdataslab_count((unsigned char *)newheader,
-+						    sizeof(*newheader));
-+			rbtversion->bytes +=
-+				dns_rdataslab_size((unsigned char *)newheader,
-+						   sizeof(*newheader));
-+		}
-+		if (rbtversion != NULL)
-+			RWUNLOCK(&rbtversion->rwlock, isc_rwlocktype_write);
- 		if (loading) {
- 			/*
- 			 * There are no other references to 'header' when
-@@ -6355,6 +6401,16 @@ add32(dns_rbtdb_t *rbtdb, dns_rbtnode_t *rbtnode, rbtdb_version_t *rbtversion,
- 			newheader->down = NULL;
- 			rbtnode->data = newheader;
- 		}
-+		if (rbtversion != NULL && !newheader_nx) {
-+			RWLOCK(&rbtversion->rwlock, isc_rwlocktype_write);
-+			rbtversion->records +=
-+				dns_rdataslab_count((unsigned char *)newheader,
-+						    sizeof(*newheader));
-+			rbtversion->bytes +=
-+				dns_rdataslab_size((unsigned char *)newheader,
-+						   sizeof(*newheader));
-+			RWUNLOCK(&rbtversion->rwlock, isc_rwlocktype_write);
-+		}
- 		idx = newheader->node->locknum;
- 		if (IS_CACHE(rbtdb)) {
- 			ISC_LIST_PREPEND(rbtdb->rdatasets[idx],
-@@ -6811,6 +6867,12 @@ subtractrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
- 			 */
- 			newheader->additional_auth = NULL;
- 			newheader->additional_glue = NULL;
-+			rbtversion->records +=
-+				dns_rdataslab_count((unsigned char *)newheader,
-+						    sizeof(*newheader));
-+			rbtversion->bytes +=
-+				dns_rdataslab_size((unsigned char *)newheader,
-+						   sizeof(*newheader));
- 		} else if (result == DNS_R_NXRRSET) {
- 			/*
- 			 * This subtraction would remove all of the rdata;
-@@ -6846,6 +6908,12 @@ subtractrdataset(dns_db_t *db, dns_dbnode_t *node, dns_dbversion_t *version,
- 		 * topheader.
- 		 */
- 		INSIST(rbtversion->serial >= topheader->serial);
-+		rbtversion->records -=
-+				dns_rdataslab_count((unsigned char *)header,
-+						    sizeof(*header));
-+		rbtversion->bytes -=
-+				dns_rdataslab_size((unsigned char *)header,
-+						   sizeof(*header));
- 		if (topheader_prev != NULL)
- 			topheader_prev->next = newheader;
- 		else
-@@ -7172,6 +7240,7 @@ rbt_datafixer(dns_rbtnode_t *rbtnode, void *base, size_t filesize,
- 	unsigned char *limit = ((unsigned char *) base) + filesize;
- 	unsigned char *p;
- 	size_t size;
-+	unsigned int count;
- 
- 	REQUIRE(rbtnode != NULL);
- 
-@@ -7179,6 +7248,9 @@ rbt_datafixer(dns_rbtnode_t *rbtnode, void *base, size_t filesize,
- 		p = (unsigned char *) header;
- 
- 		size = dns_rdataslab_size(p, sizeof(*header));
-+		count = dns_rdataslab_count(p, sizeof(*header));;
-+		rbtdb->current_version->records += count;
-+		rbtdb->current_version->bytes += size;
- 		isc_crc64_update(crc, p, size);
- #ifdef DEBUG
- 		hexdump("hashing header", p, sizeof(rdatasetheader_t));
-@@ -7777,6 +7849,33 @@ getnsec3parameters(dns_db_t *db, dns_dbversion_t *version, dns_hash_t *hash,
- }
- 
- static isc_result_t
-+getsize(dns_db_t *db, dns_dbversion_t *version, isc_uint64_t *records,
-+        isc_uint64_t *bytes)
-+{
-+	dns_rbtdb_t *rbtdb;
-+	isc_result_t result = ISC_R_SUCCESS;
-+	rbtdb_version_t *rbtversion = version;
-+
-+	rbtdb = (dns_rbtdb_t *)db;
-+
-+	REQUIRE(VALID_RBTDB(rbtdb));
-+	INSIST(rbtversion == NULL || rbtversion->rbtdb == rbtdb);
-+
-+	if (rbtversion == NULL)
-+		rbtversion = rbtdb->current_version;
-+
-+	RWLOCK(&rbtversion->rwlock, isc_rwlocktype_read);
-+	if (records != NULL)
-+		*records = rbtversion->records;
-+
-+	if (bytes != NULL)
-+		*bytes = rbtversion->bytes;
-+	RWUNLOCK(&rbtversion->rwlock, isc_rwlocktype_read);
-+
-+	return (result);
-+}
-+
-+static isc_result_t
- setsigningtime(dns_db_t *db, dns_rdataset_t *rdataset, isc_stdtime_t resign) {
- 	dns_rbtdb_t *rbtdb = (dns_rbtdb_t *)db;
- 	isc_stdtime_t oldresign;
-@@ -7972,7 +8071,8 @@ static dns_dbmethods_t zone_methods = {
- 	NULL,
- 	NULL,
- 	NULL,
--	hashsize
-+	hashsize,
-+	getsize
- };
- 
- static dns_dbmethods_t cache_methods = {
-@@ -8018,7 +8118,8 @@ static dns_dbmethods_t cache_methods = {
- 	NULL,
- 	NULL,
- 	setcachestats,
--	hashsize
-+	hashsize,
-+	NULL
- };
- 
- isc_result_t
-@@ -8310,6 +8411,20 @@ dns_rbtdb_create
- 	rbtdb->current_version->salt_length = 0;
- 	memset(rbtdb->current_version->salt, 0,
- 	       sizeof(rbtdb->current_version->salt));
-+	result = isc_rwlock_init(&rbtdb->current_version->rwlock, 0, 0);
-+	if (result != ISC_R_SUCCESS) {
-+		isc_refcount_destroy(&rbtdb->current_version->references);
-+		isc_mem_put(mctx, rbtdb->current_version,
-+			    sizeof(*rbtdb->current_version));
-+		rbtdb->current_version = NULL;
-+		isc_refcount_decrement(&rbtdb->references, NULL);
-+		isc_refcount_destroy(&rbtdb->references);
-+		free_rbtdb(rbtdb, ISC_FALSE, NULL);
-+		return (result);
-+	}
-+
-+	rbtdb->current_version->records = 0;
-+	rbtdb->current_version->bytes = 0;
- 	rbtdb->future_version = NULL;
- 	ISC_LIST_INIT(rbtdb->open_versions);
- 	/*
-diff --git a/lib/dns/rdataslab.c b/lib/dns/rdataslab.c
-index e29dc84..63e3728 100644
---- a/lib/dns/rdataslab.c
-+++ b/lib/dns/rdataslab.c
-@@ -523,6 +523,19 @@ dns_rdataslab_size(unsigned char *slab, unsigned int reservelen) {
- 	return ((unsigned int)(current - slab));
- }
- 
-+unsigned int
-+dns_rdataslab_count(unsigned char *slab, unsigned int reservelen) {
-+	unsigned int count;
-+	unsigned char *current;
-+
-+	REQUIRE(slab != NULL);
-+
-+	current = slab + reservelen;
-+	count = *current++ * 256;
-+	count += *current++;
-+	return (count);
-+}
-+
- /*
-  * Make the dns_rdata_t 'rdata' refer to the slab item
-  * beginning at '*current', which is part of a slab of type
-diff --git a/lib/dns/result.c b/lib/dns/result.c
-index 7be4f57..a621909 100644
---- a/lib/dns/result.c
-+++ b/lib/dns/result.c
-@@ -167,11 +167,16 @@ static const char *text[DNS_R_NRESULTS] = {
- 	"covered by negative trust anchor",    /*%< 110 DNS_R_NTACOVERED */
- 	"bad CDS",			       /*%< 111 DNS_R_BADCSD */
- 	"bad CDNSKEY",			       /*%< 112 DNS_R_BADCDNSKEY */
--	"malformed OPT option"		       /*%< 113 DNS_R_OPTERR */
-+	"malformed OPT option",		       /*%< 113 DNS_R_OPTERR */
-+	"malformed DNSTAP data",	       /*%< 114 DNS_R_BADDNSTAP */
-+
-+	"TSIG in wrong location",	       /*%< 115 DNS_R_BADTSIG */
-+	"SIG(0) in wrong location",	       /*%< 116 DNS_R_BADSIG0 */
-+	"too many records",	               /*%< 117 DNS_R_TOOMANYRECORDS */
- };
- 
- static const char *rcode_text[DNS_R_NRCODERESULTS] = {
--	"NOERROR",				/*%< 0 DNS_R_NOEROR */
-+	"NOERROR",				/*%< 0 DNS_R_NOERROR */
- 	"FORMERR",				/*%< 1 DNS_R_FORMERR */
- 	"SERVFAIL",				/*%< 2 DNS_R_SERVFAIL */
- 	"NXDOMAIN",				/*%< 3 DNS_R_NXDOMAIN */
-diff --git a/lib/dns/sdb.c b/lib/dns/sdb.c
-index abfeeb0..19397e0 100644
---- a/lib/dns/sdb.c
-+++ b/lib/dns/sdb.c
-@@ -1298,7 +1298,8 @@ static dns_dbmethods_t sdb_methods = {
- 	findnodeext,
- 	findext,
- 	NULL,			/* setcachestats */
--	NULL			/* hashsize */
-+	NULL,			/* hashsize */
-+	NULL			/* getsize */
- };
- 
- static isc_result_t
-diff --git a/lib/dns/sdlz.c b/lib/dns/sdlz.c
-index b1198a4..0e3163d 100644
---- a/lib/dns/sdlz.c
-+++ b/lib/dns/sdlz.c
-@@ -1269,7 +1269,8 @@ static dns_dbmethods_t sdlzdb_methods = {
- 	findnodeext,
- 	findext,
- 	NULL,			/* setcachestats */
--	NULL			/* hashsize */
-+	NULL,			/* hashsize */
-+	NULL			/* getsize */
- };
- 
- /*
-diff --git a/lib/dns/xfrin.c b/lib/dns/xfrin.c
-index 2a6c1b4..ac566e1 100644
---- a/lib/dns/xfrin.c
-+++ b/lib/dns/xfrin.c
-@@ -149,6 +149,9 @@ struct dns_xfrin_ctx {
- 	unsigned int		nrecs;		/*%< Number of records recvd */
- 	isc_uint64_t		nbytes;		/*%< Number of bytes received */
- 
-+	unsigned int		maxrecords;	/*%< The maximum number of
-+						     records set for the zone */
-+
- 	isc_time_t		start;		/*%< Start time of the transfer */
- 	isc_time_t		end;		/*%< End time of the transfer */
- 
-@@ -309,10 +312,18 @@ axfr_putdata(dns_xfrin_ctx_t *xfr, dns_diffop_t op,
- static isc_result_t
- axfr_apply(dns_xfrin_ctx_t *xfr) {
- 	isc_result_t result;
-+	isc_uint64_t records;
- 
- 	CHECK(dns_diff_load(&xfr->diff, xfr->axfr.add, xfr->axfr.add_private));
- 	xfr->difflen = 0;
- 	dns_diff_clear(&xfr->diff);
-+	if (xfr->maxrecords != 0U) {
-+		result = dns_db_getsize(xfr->db, xfr->ver, &records, NULL);
-+		if (result == ISC_R_SUCCESS && records > xfr->maxrecords) {
-+			result = DNS_R_TOOMANYRECORDS;
-+			goto failure;
-+		}
-+	}
- 	result = ISC_R_SUCCESS;
-  failure:
- 	return (result);
-@@ -396,6 +407,7 @@ ixfr_putdata(dns_xfrin_ctx_t *xfr, dns_diffop_t op,
- static isc_result_t
- ixfr_apply(dns_xfrin_ctx_t *xfr) {
- 	isc_result_t result;
-+	isc_uint64_t records;
- 
- 	if (xfr->ver == NULL) {
- 		CHECK(dns_db_newversion(xfr->db, &xfr->ver));
-@@ -403,6 +415,13 @@ ixfr_apply(dns_xfrin_ctx_t *xfr) {
- 			CHECK(dns_journal_begin_transaction(xfr->ixfr.journal));
- 	}
- 	CHECK(dns_diff_apply(&xfr->diff, xfr->db, xfr->ver));
-+	if (xfr->maxrecords != 0U) {
-+		result = dns_db_getsize(xfr->db, xfr->ver, &records, NULL);
-+		if (result == ISC_R_SUCCESS && records > xfr->maxrecords) {
-+			result = DNS_R_TOOMANYRECORDS;
-+			goto failure;
-+		}
-+	}
- 	if (xfr->ixfr.journal != NULL) {
- 		result = dns_journal_writediff(xfr->ixfr.journal, &xfr->diff);
- 		if (result != ISC_R_SUCCESS)
-@@ -759,7 +778,7 @@ xfrin_reset(dns_xfrin_ctx_t *xfr) {
- 
- static void
- xfrin_fail(dns_xfrin_ctx_t *xfr, isc_result_t result, const char *msg) {
--	if (result != DNS_R_UPTODATE) {
-+	if (result != DNS_R_UPTODATE && result != DNS_R_TOOMANYRECORDS) {
- 		xfrin_log(xfr, ISC_LOG_ERROR, "%s: %s",
- 			  msg, isc_result_totext(result));
- 		if (xfr->is_ixfr)
-@@ -852,6 +871,7 @@ xfrin_create(isc_mem_t *mctx,
- 	xfr->nmsg = 0;
- 	xfr->nrecs = 0;
- 	xfr->nbytes = 0;
-+	xfr->maxrecords = dns_zone_getmaxrecords(zone);
- 	isc_time_now(&xfr->start);
- 
- 	xfr->tsigkey = NULL;
-diff --git a/lib/dns/zone.c b/lib/dns/zone.c
-index 90e558d..2b0d8e4 100644
---- a/lib/dns/zone.c
-+++ b/lib/dns/zone.c
-@@ -253,6 +253,8 @@ struct dns_zone {
- 	isc_uint32_t		maxretry;
- 	isc_uint32_t		minretry;
- 
-+	isc_uint32_t		maxrecords;
-+
- 	isc_sockaddr_t		*masters;
- 	isc_dscp_t		*masterdscps;
- 	dns_name_t		**masterkeynames;
-@@ -10088,6 +10090,20 @@ dns_zone_setmaxretrytime(dns_zone_t *zone, isc_uint32_t val) {
- 	zone->maxretry = val;
- }
- 
-+isc_uint32_t
-+dns_zone_getmaxrecords(dns_zone_t *zone) {
-+        REQUIRE(DNS_ZONE_VALID(zone));
-+
-+	return (zone->maxrecords);
-+}
-+
-+void
-+dns_zone_setmaxrecords(dns_zone_t *zone, isc_uint32_t val) {
-+        REQUIRE(DNS_ZONE_VALID(zone));
-+
-+	zone->maxrecords = val;
-+}
-+
- static isc_boolean_t
- notify_isqueued(dns_zone_t *zone, unsigned int flags, dns_name_t *name,
- 		isc_sockaddr_t *addr, dns_tsigkey_t *key)
-@@ -14431,7 +14447,7 @@ zone_xfrdone(dns_zone_t *zone, isc_result_t result) {
- 	DNS_ZONE_CLRFLAG(zone, DNS_ZONEFLG_SOABEFOREAXFR);
- 
- 	TIME_NOW(&now);
--	switch (result) {
-+	switch (xfrresult) {
- 	case ISC_R_SUCCESS:
- 		DNS_ZONE_SETFLAG(zone, DNS_ZONEFLG_NEEDNOTIFY);
- 		/*FALLTHROUGH*/
-@@ -14558,6 +14574,11 @@ zone_xfrdone(dns_zone_t *zone, isc_result_t result) {
- 		DNS_ZONE_SETFLAG(zone, DNS_ZONEFLAG_NOIXFR);
- 		goto same_master;
- 
-+	case DNS_R_TOOMANYRECORDS:
-+		DNS_ZONE_JITTER_ADD(&now, zone->refresh, &zone->refreshtime);
-+		inc_stats(zone, dns_zonestatscounter_xfrfail);
-+		break;
-+
- 	default:
- 	next_master:
- 		/*
-diff --git a/lib/isccfg/namedconf.c b/lib/isccfg/namedconf.c
-index 780ab46..e7ff1cc 100644
---- a/lib/isccfg/namedconf.c
-+++ b/lib/isccfg/namedconf.c
-@@ -1679,6 +1679,7 @@ zone_clauses[] = {
- 	{ "masterfile-format", &cfg_type_masterformat, 0 },
- 	{ "max-ixfr-log-size", &cfg_type_size, CFG_CLAUSEFLAG_OBSOLETE },
- 	{ "max-journal-size", &cfg_type_sizenodefault, 0 },
-+	{ "max-records", &cfg_type_uint32, 0 },
- 	{ "max-refresh-time", &cfg_type_uint32, 0 },
- 	{ "max-retry-time", &cfg_type_uint32, 0 },
- 	{ "max-transfer-idle-in", &cfg_type_uint32, 0 },
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
deleted file mode 100644
index b52d680..0000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From c1d0599a246f646d1c22018f8fa09459270a44b8 Mon Sep 17 00:00:00 2001
-From: Mark Andrews <marka@isc.org>
-Date: Fri, 21 Oct 2016 14:55:10 +1100
-Subject: [PATCH] 4489. [security] It was possible to trigger assertions when
- processing a response. (CVE-2016-8864) [RT #43465]
-
-(cherry picked from commit bd6f27f5c353133b563fe69100b2f168c129f3ca)
-
-Upstream-Status: Backport
-[https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=commit;h=c1d0599a246f646d1c22018f8fa09459270a44b8]
-
-CVE: CVE-2016-8864
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- CHANGES            |  3 +++
- lib/dns/resolver.c | 69 +++++++++++++++++++++++++++++++++++++-----------------
- 2 files changed, 50 insertions(+), 22 deletions(-)
-
-diff --git a/CHANGES b/CHANGES
-index 5c8c61a..41cfce5 100644
---- a/CHANGES
-+++ b/CHANGES
-@@ -1,3 +1,6 @@
-+4489.	[security]	It was possible to trigger assertions when processing
-+			a response. (CVE-2016-8864) [RT #43465]
-+
- 4467.   [security]      It was possible to trigger an assertion when
-                         rendering a message. (CVE-2016-2776) [RT #43139]
- 
-diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
-index ba1ae23..13c8b44 100644
---- a/lib/dns/resolver.c
-+++ b/lib/dns/resolver.c
-@@ -612,7 +612,9 @@ valcreate(fetchctx_t *fctx, dns_adbaddrinfo_t *addrinfo, dns_name_t *name,
- 	valarg->addrinfo = addrinfo;
- 
- 	if (!ISC_LIST_EMPTY(fctx->validators))
--		INSIST((valoptions & DNS_VALIDATOR_DEFER) != 0);
-+		valoptions |= DNS_VALIDATOR_DEFER;
-+	else
-+		valoptions &= ~DNS_VALIDATOR_DEFER;
- 
- 	result = dns_validator_create(fctx->res->view, name, type, rdataset,
- 				      sigrdataset, fctx->rmessage,
-@@ -5526,13 +5528,6 @@ cache_name(fetchctx_t *fctx, dns_name_t *name, dns_adbaddrinfo_t *addrinfo,
- 							   rdataset,
- 							   sigrdataset,
- 							   valoptions, task);
--					/*
--					 * Defer any further validations.
--					 * This prevents multiple validators
--					 * from manipulating fctx->rmessage
--					 * simultaneously.
--					 */
--					valoptions |= DNS_VALIDATOR_DEFER;
- 				}
- 			} else if (CHAINING(rdataset)) {
- 				if (rdataset->type == dns_rdatatype_cname)
-@@ -5647,6 +5642,11 @@ cache_name(fetchctx_t *fctx, dns_name_t *name, dns_adbaddrinfo_t *addrinfo,
- 				       eresult == DNS_R_NCACHENXRRSET);
- 			}
- 			event->result = eresult;
-+			if (adbp != NULL && *adbp != NULL) {
-+				if (anodep != NULL && *anodep != NULL)
-+					dns_db_detachnode(*adbp, anodep);
-+				dns_db_detach(adbp);
-+			}
- 			dns_db_attach(fctx->cache, adbp);
- 			dns_db_transfernode(fctx->cache, &node, anodep);
- 			clone_results(fctx);
-@@ -5897,6 +5897,11 @@ ncache_message(fetchctx_t *fctx, dns_adbaddrinfo_t *addrinfo,
- 		fctx->attributes |= FCTX_ATTR_HAVEANSWER;
- 		if (event != NULL) {
- 			event->result = eresult;
-+			if (adbp != NULL && *adbp != NULL) {
-+				if (anodep != NULL && *anodep != NULL)
-+					dns_db_detachnode(*adbp, anodep);
-+				dns_db_detach(adbp);
-+			}
- 			dns_db_attach(fctx->cache, adbp);
- 			dns_db_transfernode(fctx->cache, &node, anodep);
- 			clone_results(fctx);
-@@ -6718,13 +6723,15 @@ static isc_result_t
- answer_response(fetchctx_t *fctx) {
- 	isc_result_t result;
- 	dns_message_t *message;
--	dns_name_t *name, *dname, *qname, tname, *ns_name;
-+	dns_name_t *name, *dname = NULL, *qname, *dqname, tname, *ns_name;
-+	dns_name_t *cname = NULL;
- 	dns_rdataset_t *rdataset, *ns_rdataset;
- 	isc_boolean_t done, external, chaining, aa, found, want_chaining;
--	isc_boolean_t have_answer, found_cname, found_type, wanted_chaining;
-+	isc_boolean_t have_answer, found_cname, found_dname, found_type;
-+	isc_boolean_t wanted_chaining;
- 	unsigned int aflag;
- 	dns_rdatatype_t type;
--	dns_fixedname_t fdname, fqname;
-+	dns_fixedname_t fdname, fqname, fqdname;
- 	dns_view_t *view;
- 
- 	FCTXTRACE("answer_response");
-@@ -6738,6 +6745,7 @@ answer_response(fetchctx_t *fctx) {
- 
- 	done = ISC_FALSE;
- 	found_cname = ISC_FALSE;
-+	found_dname = ISC_FALSE;
- 	found_type = ISC_FALSE;
- 	chaining = ISC_FALSE;
- 	have_answer = ISC_FALSE;
-@@ -6747,12 +6755,13 @@ answer_response(fetchctx_t *fctx) {
- 		aa = ISC_TRUE;
- 	else
- 		aa = ISC_FALSE;
--	qname = &fctx->name;
-+	dqname = qname = &fctx->name;
- 	type = fctx->type;
- 	view = fctx->res->view;
-+	dns_fixedname_init(&fqdname);
- 	result = dns_message_firstname(message, DNS_SECTION_ANSWER);
- 	while (!done && result == ISC_R_SUCCESS) {
--		dns_namereln_t namereln;
-+		dns_namereln_t namereln, dnamereln;
- 		int order;
- 		unsigned int nlabels;
- 
-@@ -6760,6 +6769,8 @@ answer_response(fetchctx_t *fctx) {
- 		dns_message_currentname(message, DNS_SECTION_ANSWER, &name);
- 		external = ISC_TF(!dns_name_issubdomain(name, &fctx->domain));
- 		namereln = dns_name_fullcompare(qname, name, &order, &nlabels);
-+		dnamereln = dns_name_fullcompare(dqname, name, &order,
-+						 &nlabels);
- 		if (namereln == dns_namereln_equal) {
- 			wanted_chaining = ISC_FALSE;
- 			for (rdataset = ISC_LIST_HEAD(name->list);
-@@ -6854,7 +6865,7 @@ answer_response(fetchctx_t *fctx) {
- 					}
- 				} else if (rdataset->type == dns_rdatatype_rrsig
- 					   && rdataset->covers ==
--					   dns_rdatatype_cname
-+					      dns_rdatatype_cname
- 					   && !found_type) {
- 					/*
- 					 * We're looking for something else,
-@@ -6884,11 +6895,18 @@ answer_response(fetchctx_t *fctx) {
- 						 * a CNAME or DNAME).
- 						 */
- 						INSIST(!external);
--						if (aflag ==
--						    DNS_RDATASETATTR_ANSWER) {
-+						if ((rdataset->type !=
-+						     dns_rdatatype_cname) ||
-+						    !found_dname ||
-+						    (aflag ==
-+						     DNS_RDATASETATTR_ANSWER))
-+						{
- 							have_answer = ISC_TRUE;
-+							if (rdataset->type ==
-+							    dns_rdatatype_cname)
-+								cname = name;
- 							name->attributes |=
--								DNS_NAMEATTR_ANSWER;
-+							    DNS_NAMEATTR_ANSWER;
- 						}
- 						rdataset->attributes |= aflag;
- 						if (aa)
-@@ -6982,11 +7000,11 @@ answer_response(fetchctx_t *fctx) {
- 					return (DNS_R_FORMERR);
- 				}
- 
--				if (namereln != dns_namereln_subdomain) {
-+				if (dnamereln != dns_namereln_subdomain) {
- 					char qbuf[DNS_NAME_FORMATSIZE];
- 					char obuf[DNS_NAME_FORMATSIZE];
- 
--					dns_name_format(qname, qbuf,
-+					dns_name_format(dqname, qbuf,
- 							sizeof(qbuf));
- 					dns_name_format(name, obuf,
- 							sizeof(obuf));
-@@ -7001,7 +7019,7 @@ answer_response(fetchctx_t *fctx) {
- 					want_chaining = ISC_TRUE;
- 					POST(want_chaining);
- 					aflag = DNS_RDATASETATTR_ANSWER;
--					result = dname_target(rdataset, qname,
-+					result = dname_target(rdataset, dqname,
- 							      nlabels, &fdname);
- 					if (result == ISC_R_NOSPACE) {
- 						/*
-@@ -7018,10 +7036,13 @@ answer_response(fetchctx_t *fctx) {
- 
- 					dname = dns_fixedname_name(&fdname);
- 					if (!is_answertarget_allowed(view,
--							qname, rdataset->type,
--							dname, &fctx->domain)) {
-+						     dqname, rdataset->type,
-+						     dname, &fctx->domain))
-+					{
- 						return (DNS_R_SERVFAIL);
- 					}
-+					dqname = dns_fixedname_name(&fqdname);
-+					dns_name_copy(dname, dqname, NULL);
- 				} else {
- 					/*
- 					 * We've found a signature that
-@@ -7046,6 +7067,10 @@ answer_response(fetchctx_t *fctx) {
- 					INSIST(!external);
- 					if (aflag == DNS_RDATASETATTR_ANSWER) {
- 						have_answer = ISC_TRUE;
-+						found_dname = ISC_TRUE;
-+						if (cname != NULL)
-+							cname->attributes &=
-+							   ~DNS_NAMEATTR_ANSWER;
- 						name->attributes |=
- 							DNS_NAMEATTR_ANSWER;
- 					}
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch b/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
index 096d5d8..8bc4ea3 100644
--- a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
@@ -17,24 +17,28 @@ problem.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Update context(trailing whitespace) for version 9.10.5-P3.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  bin/confgen/Makefile.in |    4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/bin/confgen/Makefile.in b/bin/confgen/Makefile.in
-index 8b3e5aa..4868a24 100644
+index dca272f..02becce 100644
 --- a/bin/confgen/Makefile.in
 +++ b/bin/confgen/Makefile.in
 @@ -74,11 +74,11 @@ rndc-confgen.@O@: rndc-confgen.c
  ddns-confgen.@O@: ddns-confgen.c
  	${LIBTOOL_MODE_COMPILE} ${CC} ${ALL_CFLAGS} -c ${srcdir}/ddns-confgen.c
  
--rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS} 
+-rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS}
 +rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIBS} $(SUBDIRS)
  	export BASEOBJS="rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"; \
  	${FINALBUILDCMD}
  
--ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS} 
+-ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS}
 +ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIBS} $(SUBDIRS)
  	export BASEOBJS="ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"; \
  	${FINALBUILDCMD}
diff --git a/meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff b/meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
deleted file mode 100644
index 2930796..0000000
--- a/meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
+++ /dev/null
@@ -1,104 +0,0 @@
-bind: port a patch to fix a build failure
-
-mips1 does not support ll and sc instructions, and lead to below error, now
-we port a patch from debian to fix it
-[http://security.debian.org/debian-security/pool/updates/main/b/bind9/bind9_9.8.4.dfsg.P1-6+nmu2+deb7u1.diff.gz]
-
-| {standard input}: Assembler messages:
-| {standard input}:47: Error: Opcode not supported on this processor: mips1 (mips1) `ll $3,0($6)'
-| {standard input}:50: Error: Opcode not supported on this processor: mips1 (mips1) `sc $3,0($6)'
-
-Upstream-Status: Pending
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
---- bind9-9.8.4.dfsg.P1.orig/lib/isc/mips/include/isc/atomic.h
-+++ bind9-9.8.4.dfsg.P1/lib/isc/mips/include/isc/atomic.h
-@@ -31,18 +31,20 @@
- isc_atomic_xadd(isc_int32_t *p, int val) {
- 	isc_int32_t orig;
- 
--	/* add is a cheat, since MIPS has no mov instruction */
--	__asm__ volatile (
--	    "1:"
--	    "ll $3, %1\n"
--	    "add %0, $0, $3\n"
--	    "add $3, $3, %2\n"
--	    "sc $3, %1\n"
--	    "beq $3, 0, 1b"
--	    : "=&r"(orig)
--	    : "m"(*p), "r"(val)
--	    : "memory", "$3"
--		);
-+	__asm__ __volatile__ (
-+	"	.set	push		\n"
-+	"	.set	mips2		\n"
-+	"	.set	noreorder	\n"
-+	"	.set	noat		\n"
-+	"1:	ll	$1, %1		\n"
-+	"	addu	%0, $1, %2	\n"
-+	"	sc	%0, %1		\n"
-+	"	beqz	%0, 1b		\n"
-+	"	move	%0, $1		\n"
-+	"	.set	pop		\n"
-+	: "=&r" (orig), "+R" (*p)
-+	: "r" (val)
-+	: "memory");
- 
- 	return (orig);
- }
-@@ -52,16 +54,7 @@
-  */
- static inline void
- isc_atomic_store(isc_int32_t *p, isc_int32_t val) {
--	__asm__ volatile (
--	    "1:"
--	    "ll $3, %0\n"
--	    "add $3, $0, %1\n"
--	    "sc $3, %0\n"
--	    "beq $3, 0, 1b"
--	    :
--	    : "m"(*p), "r"(val)
--	    : "memory", "$3"
--		);
-+	*p = val;
- }
- 
- /*
-@@ -72,20 +65,23 @@
- static inline isc_int32_t
- isc_atomic_cmpxchg(isc_int32_t *p, int cmpval, int val) {
- 	isc_int32_t orig;
-+	isc_int32_t tmp;
- 
--	__asm__ volatile(
--	    "1:"
--	    "ll $3, %1\n"
--	    "add %0, $0, $3\n"
--	    "bne $3, %2, 2f\n"
--	    "add $3, $0, %3\n"
--	    "sc $3, %1\n"
--	    "beq $3, 0, 1b\n"
--	    "2:"
--	    : "=&r"(orig)
--	    : "m"(*p), "r"(cmpval), "r"(val)
--	    : "memory", "$3"
--		);
-+	__asm__ __volatile__ (
-+	"	.set	push		\n"
-+	"	.set	mips2		\n"
-+	"	.set	noreorder	\n"
-+	"	.set	noat		\n"
-+	"1:	ll	$1, %1		\n"
-+	"	bne	$1, %3, 2f	\n"
-+	"	move	%2, %4		\n"
-+	"	sc	%2, %1		\n"
-+	"	beqz	%2, 1b		\n"
-+	"2:	move	%0, $1		\n"
-+	"	.set	pop		\n"
-+	: "=&r"(orig), "+R" (*p), "=r" (tmp)
-+	: "r"(cmpval), "r"(val)
-+	: "memory");
- 
- 	return (orig);
- }
diff --git a/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch b/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
new file mode 100644
index 0000000..9829f15
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
@@ -0,0 +1,36 @@
+Use python3 rather default python which maybe links to python2 for oe. And add
+option for setup.py to install files to right directory.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/bin/python/Makefile.in b/bin/python/Makefile.in
+index a43a3c1..2e727f2 100644
+--- a/bin/python/Makefile.in
++++ b/bin/python/Makefile.in
+@@ -55,9 +55,9 @@ install:: ${TARGETS} installdirs
+ 	${INSTALL_DATA} ${srcdir}/dnssec-coverage.8 ${DESTDIR}${mandir}/man8
+ 	if test -n "${PYTHON}" ; then \
+ 		if test -n "${DESTDIR}" ; then \
+-			${PYTHON} ${srcdir}/setup.py install --root=${DESTDIR} --prefix=${prefix} ; \
++			${PYTHON} ${srcdir}/setup.py install --root=${DESTDIR} --prefix=${prefix} --install-lib=${PYTHON_SITEPACKAGES_DIR} ; \
+ 		else \
+-			${PYTHON} ${srcdir}/setup.py install --prefix=${prefix} ; \
++			${PYTHON} ${srcdir}/setup.py install --prefix=${prefix} --install-lib=${PYTHON_SITEPACKAGES_DIR} ; \
+ 		fi \
+ 	fi
+ 
+diff --git a/configure.in b/configure.in
+index 314bb90..867923e 100644
+--- a/configure.in
++++ b/configure.in
+@@ -227,7 +227,7 @@ AC_ARG_WITH(python,
+ [  --with-python=PATH      specify path to python interpreter],
+     use_python="$withval", use_python="unspec")
+ 
+-python="python python3 python3.5 python3.4 python3.3 python3.2 python2 python2.7"
++python="python3 python3.5 python3.4 python3.3 python3.2 python2 python2.7"
+ 
+ testargparse='try: import argparse
+ except: exit(1)'
diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
similarity index 85%
rename from meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
rename to meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
index 7eb79b0..e6e1e8d 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
@@ -3,14 +3,13 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0a95f52a0ab6c5f52dedc9a45e7abb3f"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
 
 DEPENDS = "openssl libcap"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
            file://make-etc-initd-bind-stop-work.patch \
-           file://mips1-not-support-opcode.diff \
            file://dont-test-on-host.patch \
            file://generate-rndc-key.sh \
            file://named.service \
@@ -21,21 +20,14 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
-           file://CVE-2016-1285.patch \
-           file://CVE-2016-1286_1.patch \
-           file://CVE-2016-1286_2.patch \
-           file://CVE-2016-2088.patch \
-           file://CVE-2016-2775.patch \
-           file://CVE-2016-2776.patch \
-           file://CVE-2016-8864.patch \
-           file://CVE-2016-6170.patch \
+           file://use-python3-and-fix-install-lib-path.patch \
            "
 
 UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
 
-SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
-SRC_URI[sha256sum] = "690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83"
+SRC_URI[md5sum] = "d79cafbd9ac76239ee532dd89d05cc83"
+SRC_URI[sha256sum] = "8d7e96b5b0bbac7b900d4c4bbb82e0956b4e509433c5fa392bb72a929b96606a"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
@@ -44,7 +36,10 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_LIBDIR}/.. \
                "
-inherit autotools update-rc.d systemd useradd pkgconfig
+
+inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
+
+export PYTHON_SITEPACKAGES_DIR
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
 PACKAGECONFIG ?= "readline"
@@ -70,7 +65,7 @@ RDEPENDS_${PN}-dev = ""
 PACKAGE_BEFORE_PN += "${PN}-utils"
 FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
-FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
+FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
 
 do_install_prepend() {
 	# clean host path in isc-config.sh before the hardlink created
@@ -107,6 +102,8 @@ do_install_append() {
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir}/tmpfiles.d/bind.conf
 	fi
+
+    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/isc/*.pyc
 }
 
 CONFFILES_${PN} = " \
-- 
2.10.1


