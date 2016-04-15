Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2DE6FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 12:03:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2016 05:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,487,1455004800"; d="scan'208";a="85755499"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2016 05:03:28 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 15:03:17 +0300
Message-Id: <1460721797-329-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] bind: CVE-2016-2088
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
X-List-Received-Date: Fri, 15 Apr 2016 12:03:30 -0000

Duplicate EDNS COOKIE options in a response could trigger an
assertion failure: Fix with a backport.

bind as built with the oe-core recipe is not at risk: Only servers
which are built with DNS cookie support (--enable-sit) are vulnerable
to denial of service.

Fixes [YOCTO #9438]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../bind/bind/CVE-2016-2088.patch                  | 247 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |   1 +
 2 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
new file mode 100644
index 0000000..1b84d46
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
@@ -0,0 +1,247 @@
+CVE-2016-2088
+
+Backport commit d7ff9a1c41bf0ba9773cb3adb08b48b9fd57c956 from the
+v9_10_3_patch branch.
+
+https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-2088
+https://kb.isc.org/article/AA-01351
+
+CVE: CVE-2016-2088
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+Original commit message from Mark Andrews <marka@isc.org> below:
+
+4322.   [security]      Duplicate EDNS COOKIE options in a response could
+                        trigger an assertion failure. (CVE-2016-2088)
+                        [RT #41809]
+
+(cherry picked from commit 455c0848f80a8acda27aad1466c72987cafaa029)
+(cherry picked from commit 7cd300abd6ee8b8ee8730593daf742ba53f90bc3)
+---
+ CHANGES            |  4 ++++
+ bin/dig/dighost.c  |  9 +++++++++
+ bin/named/client.c | 33 +++++++++++++++++++++++----------
+ doc/arm/notes.xml  |  7 +++++++
+ lib/dns/resolver.c | 14 +++++++++++++-
+ 5 files changed, 56 insertions(+), 11 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index c5b5d2b..d2e3360 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,3 +1,7 @@
++4322.  [security]      Duplicate EDNS COOKIE options in a response could
++                       trigger an assertion failure. (CVE-2016-2088)
++                       [RT #41809]
++
+ 4319.  [security]      Fix resolver assertion failure due to improper
+                        DNAME handling when parsing fetch reply messages.
+                        (CVE-2016-1286) [RT #41753]
+diff --git a/bin/dig/dighost.c b/bin/dig/dighost.c
+index ca82f8e..340904f 100644
+--- a/bin/dig/dighost.c
++++ b/bin/dig/dighost.c
+@@ -3458,6 +3458,7 @@ process_opt(dig_lookup_t *l, dns_message_t *msg) {
+ 	isc_buffer_t optbuf;
+ 	isc_uint16_t optcode, optlen;
+ 	dns_rdataset_t *opt = msg->opt;
++	isc_boolean_t seen_cookie = ISC_FALSE;
+ 
+ 	result = dns_rdataset_first(opt);
+ 	if (result == ISC_R_SUCCESS) {
+@@ -3470,7 +3471,15 @@ process_opt(dig_lookup_t *l, dns_message_t *msg) {
+ 			optlen = isc_buffer_getuint16(&optbuf);
+ 			switch (optcode) {
+ 			case DNS_OPT_COOKIE:
++				/*
++				 * Only process the first cookie option.
++				 */
++				if (seen_cookie) {
++					isc_buffer_forward(&optbuf, optlen);
++					break;
++				}
+ 				process_sit(l, msg, &optbuf, optlen);
++				seen_cookie = ISC_TRUE;
+ 				break;
+ 			default:
+ 				isc_buffer_forward(&optbuf, optlen);
+diff --git a/bin/named/client.c b/bin/named/client.c
+index 683305c..0d7331a 100644
+--- a/bin/named/client.c
++++ b/bin/named/client.c
+@@ -120,7 +120,10 @@
+  */
+ #endif
+ 
+-#define SIT_SIZE 24U /* 8 + 4 + 4 + 8 */
++#define COOKIE_SIZE 24U /* 8 + 4 + 4 + 8 */
++
++#define WANTNSID(x) (((x)->attributes & NS_CLIENTATTR_WANTNSID) != 0)
++#define WANTEXPIRE(x) (((x)->attributes & NS_CLIENTATTR_WANTEXPIRE) != 0)
+ 
+ /*% nameserver client manager structure */
+ struct ns_clientmgr {
+@@ -1395,7 +1398,7 @@ ns_client_addopt(ns_client_t *client, dns_message_t *message,
+ {
+ 	char nsid[BUFSIZ], *nsidp;
+ #ifdef ISC_PLATFORM_USESIT
+-	unsigned char sit[SIT_SIZE];
++	unsigned char sit[COOKIE_SIZE];
+ #endif
+ 	isc_result_t result;
+ 	dns_view_t *view;
+@@ -1420,7 +1423,7 @@ ns_client_addopt(ns_client_t *client, dns_message_t *message,
+ 	flags = client->extflags & DNS_MESSAGEEXTFLAG_REPLYPRESERVE;
+ 
+ 	/* Set EDNS options if applicable */
+-	if ((client->attributes & NS_CLIENTATTR_WANTNSID) != 0 &&
++	if (WANTNSID(client) &&
+ 	    (ns_g_server->server_id != NULL ||
+ 	     ns_g_server->server_usehostname)) {
+ 		if (ns_g_server->server_usehostname) {
+@@ -1453,7 +1456,7 @@ ns_client_addopt(ns_client_t *client, dns_message_t *message,
+ 
+ 		INSIST(count < DNS_EDNSOPTIONS);
+ 		ednsopts[count].code = DNS_OPT_COOKIE;
+-		ednsopts[count].length = SIT_SIZE;
++		ednsopts[count].length = COOKIE_SIZE;
+ 		ednsopts[count].value = sit;
+ 		count++;
+ 	}
+@@ -1661,19 +1664,26 @@ compute_sit(ns_client_t *client, isc_uint32_t when, isc_uint32_t nonce,
+ 
+ static void
+ process_sit(ns_client_t *client, isc_buffer_t *buf, size_t optlen) {
+-	unsigned char dbuf[SIT_SIZE];
++	unsigned char dbuf[COOKIE_SIZE];
+ 	unsigned char *old;
+ 	isc_stdtime_t now;
+ 	isc_uint32_t when;
+ 	isc_uint32_t nonce;
+ 	isc_buffer_t db;
+ 
++	/*
++	 * If we have already seen a ECS option skip this ECS option.
++	 */
++	if ((client->attributes & NS_CLIENTATTR_WANTSIT) != 0) {
++		isc_buffer_forward(buf, optlen);
++		return;
++	}
+ 	client->attributes |= NS_CLIENTATTR_WANTSIT;
+ 
+ 	isc_stats_increment(ns_g_server->nsstats,
+ 			    dns_nsstatscounter_sitopt);
+ 
+-	if (optlen != SIT_SIZE) {
++	if (optlen != COOKIE_SIZE) {
+ 		/*
+ 		 * Not our token.
+ 		 */
+@@ -1717,14 +1727,13 @@ process_sit(ns_client_t *client, isc_buffer_t *buf, size_t optlen) {
+ 	isc_buffer_init(&db, dbuf, sizeof(dbuf));
+ 	compute_sit(client, when, nonce, &db);
+ 
+-	if (!isc_safe_memequal(old, dbuf, SIT_SIZE)) {
++	if (!isc_safe_memequal(old, dbuf, COOKIE_SIZE)) {
+ 		isc_stats_increment(ns_g_server->nsstats,
+ 				    dns_nsstatscounter_sitnomatch);
+ 		return;
+ 	}
+ 	isc_stats_increment(ns_g_server->nsstats,
+ 			    dns_nsstatscounter_sitmatch);
+-
+ 	client->attributes |= NS_CLIENTATTR_HAVESIT;
+ }
+ #endif
+@@ -1783,7 +1792,9 @@ process_opt(ns_client_t *client, dns_rdataset_t *opt) {
+ 			optlen = isc_buffer_getuint16(&optbuf);
+ 			switch (optcode) {
+ 			case DNS_OPT_NSID:
+-				isc_stats_increment(ns_g_server->nsstats,
++				if (!WANTNSID(client))
++					isc_stats_increment(
++						    ns_g_server->nsstats,
+ 						    dns_nsstatscounter_nsidopt);
+ 				client->attributes |= NS_CLIENTATTR_WANTNSID;
+ 				isc_buffer_forward(&optbuf, optlen);
+@@ -1794,7 +1805,9 @@ process_opt(ns_client_t *client, dns_rdataset_t *opt) {
+ 				break;
+ #endif
+ 			case DNS_OPT_EXPIRE:
+-				isc_stats_increment(ns_g_server->nsstats,
++				if (!WANTEXPIRE(client))
++					isc_stats_increment(
++						  ns_g_server->nsstats,
+ 						  dns_nsstatscounter_expireopt);
+ 				client->attributes |= NS_CLIENTATTR_WANTEXPIRE;
+ 				isc_buffer_forward(&optbuf, optlen);
+diff --git a/doc/arm/notes.xml b/doc/arm/notes.xml
+index ebf4f55..095eb5b 100644
+--- a/doc/arm/notes.xml
++++ b/doc/arm/notes.xml
+@@ -51,6 +51,13 @@
+     <title>Security Fixes</title>
+     <itemizedlist>
+       <listitem>
++       <para>
++         Duplicate EDNS COOKIE options in a response could trigger
++         an assertion failure. This flaw is disclosed in CVE-2016-2088.
++         [RT #41809]
++       </para>
++      </listitem>
++      <listitem>
+ 	<para>
+ 	  Specific APL data could trigger an INSIST.  This flaw
+ 	  was discovered by Brian Mitchell and is disclosed in
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index a797e3f..ba1ae23 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -7502,7 +7502,9 @@ process_opt(resquery_t *query, dns_rdataset_t *opt) {
+ 	unsigned char *sit;
+ 	dns_adbaddrinfo_t *addrinfo;
+ 	unsigned char cookie[8];
++	isc_boolean_t seen_cookie = ISC_FALSE;
+ #endif
++	isc_boolean_t seen_nsid = ISC_FALSE;
+ 
+ 	result = dns_rdataset_first(opt);
+ 	if (result == ISC_R_SUCCESS) {
+@@ -7516,14 +7518,23 @@ process_opt(resquery_t *query, dns_rdataset_t *opt) {
+ 			INSIST(optlen <= isc_buffer_remaininglength(&optbuf));
+ 			switch (optcode) {
+ 			case DNS_OPT_NSID:
+-				if (query->options & DNS_FETCHOPT_WANTNSID)
++				if (!seen_nsid &&
++				    query->options & DNS_FETCHOPT_WANTNSID)
+ 					log_nsid(&optbuf, optlen, query,
+ 						 ISC_LOG_DEBUG(3),
+ 						 query->fctx->res->mctx);
+ 				isc_buffer_forward(&optbuf, optlen);
++				seen_nsid = ISC_TRUE;
+ 				break;
+ #ifdef ISC_PLATFORM_USESIT
+ 			case DNS_OPT_COOKIE:
++				/*
++				 * Only process the first cookie option.
++				 */
++				if (seen_cookie) {
++					isc_buffer_forward(&optbuf, optlen);
++					break;
++				}
+ 				sit = isc_buffer_current(&optbuf);
+ 				compute_cc(query, cookie, sizeof(cookie));
+ 				INSIST(query->fctx->rmessage->sitbad == 0 &&
+@@ -7541,6 +7552,7 @@ process_opt(resquery_t *query, dns_rdataset_t *opt) {
+ 				isc_buffer_forward(&optbuf, optlen);
+ 				inc_stats(query->fctx->res,
+ 					  dns_resstatscounter_sitin);
++				seen_cookie = ISC_TRUE;
+ 				break;
+ #endif
+ 			default:
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
index 3ad14b2..1e3a20f 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
@@ -24,6 +24,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2016-1285.patch \
            file://CVE-2016-1286_1.patch \
            file://CVE-2016-1286_2.patch \
+           file://CVE-2016-2088.patch \
            "
 
 SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
-- 
2.1.4


