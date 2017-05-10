Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7B33F71AC0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 14:13:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 10 May 2017 07:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,319,1491289200"; d="scan'208";a="1167201659"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2017 07:13:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 17:13:23 +0300
Message-Id: <afd0b202d639dec70b5d9099736aa216f58e38c2.1494425038.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 05/10] bind: update to 9.10.5
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
X-List-Received-Date: Wed, 10 May 2017 14:13:26 -0000

This is needed to support openssl 1.1; updating to 9.11.x
should be done later by recipe maintainer.

Drop upstreamed patches.

Rebase bind-confgen-build-unix.o-once.patch and 0001-build-use-pkg-config-to-find-libxml2.patch

Add support for Python 3 bindings

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...0001-build-use-pkg-config-to-find-libxml2.patch |  14 +-
 ...=> 0001-confgen-don-t-build-unix.o-twice.patch} |  17 +-
 .../bind/bind/CVE-2016-1285.patch                  | 154 ----------
 .../bind/bind/CVE-2016-1286_1.patch                |  79 -----
 .../bind/bind/CVE-2016-1286_2.patch                | 317 ---------------------
 .../bind/bind/CVE-2016-2088.patch                  | 247 ----------------
 .../bind/bind/CVE-2016-2775.patch                  |  90 ------
 .../bind/bind/CVE-2016-2776.patch                  | 123 --------
 .../bind/bind/mips1-not-support-opcode.diff        | 104 -------
 .../bind/{bind_9.10.3-P3.bb => bind_9.10.5.bb}     |  24 +-
 10 files changed, 28 insertions(+), 1141 deletions(-)
 rename meta/recipes-connectivity/bind/bind/{bind-confgen-build-unix.o-once.patch => 0001-confgen-don-t-build-unix.o-twice.patch} (80%)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
 rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.10.5.bb} (83%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
index 805cbb3315a..e812296f64a 100644
--- a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
@@ -1,3 +1,8 @@
+From 8031da48a6a3cb01e907dd199ad4f34c90b22969 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 7 May 2015 15:30:53 +0100
+Subject: [PATCH 6/9] bind: update libxml2 detection patch
+
 xml2-config is disabled, so change the configure script to use pkgconfig to find
 libxml2.
 
@@ -7,15 +12,16 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 Update context for version 9.10.3-P2.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
  configure.in | 23 +++--------------------
  1 file changed, 3 insertions(+), 20 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 0db826d..75819eb 100644
+index cb66823..5112f3a 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -2107,26 +2107,9 @@ case "$use_libxml2" in
+@@ -2281,26 +2281,9 @@ case "$use_libxml2" in
  		DST_LIBXML2_INC=""
  		;;
  	auto|yes)
@@ -25,7 +31,7 @@ index 0db826d..75819eb 100644
 -			libxml2_cflags=`xml2-config --cflags`
 -			;;
 -		*)
--			if test "$use_libxml2" = "yes" ; then
+-			if test "yes" = "$use_libxml2" ; then
 -				AC_MSG_RESULT(no)
 -				AC_MSG_ERROR(required libxml2 version not available)
 -			else
@@ -46,5 +52,5 @@ index 0db826d..75819eb 100644
  		;;
  esac
 -- 
-2.1.4
+2.11.0
 
diff --git a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch b/meta/recipes-connectivity/bind/bind/0001-confgen-don-t-build-unix.o-twice.patch
similarity index 80%
rename from meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
rename to meta/recipes-connectivity/bind/bind/0001-confgen-don-t-build-unix.o-twice.patch
index 096d5d84fc9..82dfd775306 100644
--- a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-confgen-don-t-build-unix.o-twice.patch
@@ -1,6 +1,6 @@
-From 9b40619ff6fddfef2758ba797789f8487f412df3 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 16 Feb 2015 00:50:01 -0800
+From c9c7ac9c7e231f086bfa1e4c63fe1213cd2b2694 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 3 Apr 2017 14:29:18 +0300
 Subject: [PATCH] confgen: don't build unix.o twice
 
 Fixed:
@@ -17,28 +17,29 @@ problem.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- bin/confgen/Makefile.in |    4 ++--
+ bin/confgen/Makefile.in | 4 ++--
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
  
 -- 
-1.7.9.5
+2.11.0
 
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
deleted file mode 100644
index 2149bd180dc..00000000000
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
index ae5cc48d9cc..00000000000
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
index 5f5cb0d340f..00000000000
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
index 1b84d46b78d..00000000000
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
index 5393063c567..00000000000
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
index 738bf600589..00000000000
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
diff --git a/meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff b/meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
deleted file mode 100644
index 2930796b6af..00000000000
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
diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.5.bb
similarity index 83%
rename from meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
rename to meta/recipes-connectivity/bind/bind_9.10.5.bb
index 18249f2a83a..c8c5a9580b1 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.5.bb
@@ -3,39 +3,30 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0a95f52a0ab6c5f52dedc9a45e7abb3f"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
 
-DEPENDS = "openssl libcap"
+DEPENDS = "openssl libcap python3"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
            file://make-etc-initd-bind-stop-work.patch \
-           file://mips1-not-support-opcode.diff \
            file://dont-test-on-host.patch \
            file://generate-rndc-key.sh \
            file://named.service \
            file://bind9 \
            file://init.d-add-support-for-read-only-rootfs.patch \
-           file://bind-confgen-build-unix.o-once.patch \
+           file://0001-confgen-don-t-build-unix.o-twice.patch \
            file://0001-build-use-pkg-config-to-find-libxml2.patch \
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
            "
 
 UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
 
-SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
-SRC_URI[sha256sum] = "690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83"
+SRC_URI[md5sum] = "8359e000eaec76efd6dfa186c12c3b93"
+SRC_URI[sha256sum] = "71688d2e134e42205075eef93cc1b78b42a140a2d61bf8263afc9c92fc872b0e"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
@@ -43,8 +34,9 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --with-gssapi=no --with-ecdsa=yes \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_LIBDIR}/.. \
+                 --with-python=python3 \
                "
-inherit autotools update-rc.d systemd useradd pkgconfig
+inherit autotools update-rc.d systemd useradd pkgconfig python3native
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
 PACKAGECONFIG ?= "readline"
@@ -67,9 +59,11 @@ RDEPENDS_${PN} = "python3-core"
 RDEPENDS_${PN}-dev = ""
 
 PACKAGE_BEFORE_PN += "${PN}-utils"
+PACKAGES += "python3-${PN}"
 FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
+FILES_python3-${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
 do_install_prepend() {
 	# clean host path in isc-config.sh before the hardlink created
-- 
2.11.0


