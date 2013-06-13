Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6768E6A687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 05:51:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5D5psLq000179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 22:51:54 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 12 Jun 2013 22:51:53 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2013 13:51:51 +0800
Message-ID: <27d898b05cc7499875d67839e3544f1c6568668c.1371102447.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371102447.git.rongqing.li@windriver.com>
References: <cover.1371102447.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: backport six CVE patches
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
X-List-Received-Date: Thu, 13 Jun 2013 05:51:54 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch |  119 +++++++++++++++++
 .../bind/bind-9.8.1/bind-CVE-2011-4313.patch       |   89 ++++++++++++
 .../bind/bind-9.8.1/bind-CVE-2012-1667.patch       |   92 +++++++++++++
 .../bind/bind-9.8.1/bind-CVE-2012-3817.patch       |   40 ++++++
 .../bind/bind-9.8.1/bind-CVE-2013-2266.patch       |   41 ++++++
 .../bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch   |  141 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |    6 +
 7 files changed, 528 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch b/meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch
new file mode 100644
index 0000000..0abb475
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch
@@ -0,0 +1,119 @@
+bind_Fix_for_CVE-2012-5166
+
+Upstream-Status: Backport
+
+Reference:http://launchpadlibrarian.net/119212498/bind9_1%3A9.7.3.dfsOBg
+-1ubuntu2.6_1%3A9.7.3.dfsg-1ubuntu2.7.diff.gz
+
+ISC BIND 9.x before 9.7.6-P4, 9.8.x before 9.8.3-P4, 9.9.x before
+9.9.1-P4, and 9.4-ESV and 9.6-ESV before 9.6-ESV-R7-P4 allows
+remote attackers to cause a denial of service (named daemon hang)
+via unspecified combinations of resource records.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-5166
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+diff -urpN a/bin/named/query.c b/bin/named/query.c
+--- a/bin/named/query.c	2012-10-22 13:24:27.000000000 +0800
++++ b/bin/named/query.c	2012-10-22 13:17:04.000000000 +0800
+@@ -1137,13 +1137,6 @@ query_isduplicate(ns_client_t *client, d
+ 		mname = NULL;
+ 	}
+ 
+-	/*
+-	 * If the dns_name_t we're looking up is already in the message,
+-	 * we don't want to trigger the caller's name replacement logic.
+-	 */
+-	if (name == mname)
+-		mname = NULL;
+-
+ 	*mnamep = mname;
+ 
+ 	CTRACE("query_isduplicate: false: done");
+@@ -1341,6 +1334,7 @@ query_addadditional(void *arg, dns_name_
+ 	if (dns_rdataset_isassociated(rdataset) &&
+ 	    !query_isduplicate(client, fname, type, &mname)) {
+ 		if (mname != NULL) {
++			INSIST(mname != fname);
+ 			query_releasename(client, &fname);
+ 			fname = mname;
+ 		} else
+@@ -1401,11 +1395,13 @@ query_addadditional(void *arg, dns_name_
+ 			mname = NULL;
+ 			if (!query_isduplicate(client, fname,
+ 					       dns_rdatatype_a, &mname)) {
+-				if (mname != NULL) {
+-					query_releasename(client, &fname);
+-					fname = mname;
+-				} else
+-					need_addname = ISC_TRUE;
++				if (mname != fname) {
++					if (mname != NULL) {
++						query_releasename(client, &fname);
++						fname = mname;
++					} else
++						need_addname = ISC_TRUE;
++				}
+ 				ISC_LIST_APPEND(fname->list, rdataset, link);
+ 				added_something = ISC_TRUE;
+ 				if (sigrdataset != NULL &&
+@@ -1444,11 +1440,13 @@ query_addadditional(void *arg, dns_name_
+ 			mname = NULL;
+ 			if (!query_isduplicate(client, fname,
+ 					       dns_rdatatype_aaaa, &mname)) {
+-				if (mname != NULL) {
+-					query_releasename(client, &fname);
+-					fname = mname;
+-				} else
+-					need_addname = ISC_TRUE;
++				if (mname != fname) {
++					if (mname != NULL) {
++						query_releasename(client, &fname);
++						fname = mname;
++					} else
++						need_addname = ISC_TRUE;
++				}
+ 				ISC_LIST_APPEND(fname->list, rdataset, link);
+ 				added_something = ISC_TRUE;
+ 				if (sigrdataset != NULL &&
+@@ -1960,22 +1958,24 @@ query_addadditional2(void *arg, dns_name
+ 		    crdataset->type == dns_rdatatype_aaaa) {
+ 			if (!query_isduplicate(client, fname, crdataset->type,
+ 					       &mname)) {
+-				if (mname != NULL) {
+-					/*
+-					 * A different type of this name is
+-					 * already stored in the additional
+-					 * section.  We'll reuse the name.
+-					 * Note that this should happen at most
+-					 * once.  Otherwise, fname->link could
+-					 * leak below.
+-					 */
+-					INSIST(mname0 == NULL);
+-
+-					query_releasename(client, &fname);
+-					fname = mname;
+-					mname0 = mname;
+-				} else
+-					need_addname = ISC_TRUE;
++				if (mname != fname) {
++					if (mname != NULL) {
++						/*
++						 * A different type of this name is
++						 * already stored in the additional
++						 * section.  We'll reuse the name.
++						 * Note that this should happen at most
++						 * once.  Otherwise, fname->link could
++						 * leak below.
++						 */
++						INSIST(mname0 == NULL);
++
++						query_releasename(client, &fname);
++						fname = mname;
++						mname0 = mname;
++					} else
++						need_addname = ISC_TRUE;
++				}
+ 				ISC_LIST_UNLINK(cfname.list, crdataset, link);
+ 				ISC_LIST_APPEND(fname->list, crdataset, link);
+ 				added_something = ISC_TRUE;
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch b/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch
new file mode 100644
index 0000000..19d8df1
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch
@@ -0,0 +1,89 @@
+The patch to fix CVE-2011-4313
+
+Upstream-Status: Backport
+
+Reference: https://www.redhat.com/security/data/cve/CVE-2011-4313.html
+
+query.c in ISC BIND 9.0.x through 9.6.x, 9.4-ESV through 9.4-ESV-R5, 9.6-ESV
+through 9.6-ESV-R5, 9.7.0 through 9.7.4, 9.8.0 through 9.8.1, and 9.9.0a1
+through 9.9.0b1 allows remote attackers to cause a denial of service
+(assertion failure and named exit) via unknown vectors related to recursive DNS
+queries, error logging, and the caching of an invalid record by the resolver.
+
+Signed-off-by Ming Liu <ming.liu@windriver.com>
+---
+ bin/named/query.c |   19 ++++++++-----------
+ lib/dns/rbtdb.c   |    4 ++--
+ 2 files changed, 10 insertions(+), 13 deletions(-)
+
+--- a/bin/named/query.c
++++ b/bin/named/query.c
+@@ -1393,11 +1393,9 @@ query_addadditional(void *arg, dns_name_
+ 			goto addname;
+ 		if (result == DNS_R_NCACHENXRRSET) {
+ 			dns_rdataset_disassociate(rdataset);
+-			/*
+-			 * Negative cache entries don't have sigrdatasets.
+-			 */
+-			INSIST(sigrdataset == NULL ||
+-			       ! dns_rdataset_isassociated(sigrdataset));
++			if (sigrdataset != NULL &&
++			    dns_rdataset_isassociated(sigrdataset))
++				dns_rdataset_disassociate(sigrdataset);
+ 		}
+ 		if (result == ISC_R_SUCCESS) {
+ 			mname = NULL;
+@@ -1438,8 +1436,9 @@ query_addadditional(void *arg, dns_name_
+ 			goto addname;
+ 		if (result == DNS_R_NCACHENXRRSET) {
+ 			dns_rdataset_disassociate(rdataset);
+-			INSIST(sigrdataset == NULL ||
+-			       ! dns_rdataset_isassociated(sigrdataset));
++			if (sigrdataset != NULL &&
++			    dns_rdataset_isassociated(sigrdataset))
++				dns_rdataset_disassociate(sigrdataset);
+ 		}
+ 		if (result == ISC_R_SUCCESS) {
+ 			mname = NULL;
+@@ -1889,10 +1888,8 @@ query_addadditional2(void *arg, dns_name
+ 		goto setcache;
+ 	if (result == DNS_R_NCACHENXRRSET) {
+ 		dns_rdataset_disassociate(rdataset);
+-		/*
+-		 * Negative cache entries don't have sigrdatasets.
+-		 */
+-		INSIST(! dns_rdataset_isassociated(sigrdataset));
++		if (dns_rdataset_isassociated(sigrdataset))
++			dns_rdataset_disassociate(sigrdataset);
+ 	}
+ 	if (result == ISC_R_SUCCESS) {
+ 		/* Remember the result as a cache */
+--- a/lib/dns/rbtdb.c
++++ b/lib/dns/rbtdb.c
+@@ -5053,7 +5053,7 @@ cache_find(dns_db_t *db, dns_name_t *nam
+ 			      rdataset);
+ 		if (need_headerupdate(found, search.now))
+ 			update = found;
+-		if (foundsig != NULL) {
++		if (!NEGATIVE(found) && foundsig != NULL) {
+ 			bind_rdataset(search.rbtdb, node, foundsig, search.now,
+ 				      sigrdataset);
+ 			if (need_headerupdate(foundsig, search.now))
+@@ -5596,7 +5596,7 @@ zone_findrdataset(dns_db_t *db, dns_dbno
+ 	}
+ 	if (found != NULL) {
+ 		bind_rdataset(rbtdb, rbtnode, found, now, rdataset);
+-		if (foundsig != NULL)
++		if (!NEGATIVE(found) && foundsig != NULL)
+ 			bind_rdataset(rbtdb, rbtnode, foundsig, now,
+ 				      sigrdataset);
+ 	}
+@@ -5685,7 +5685,7 @@ cache_findrdataset(dns_db_t *db, dns_dbn
+ 	}
+ 	if (found != NULL) {
+ 		bind_rdataset(rbtdb, rbtnode, found, now, rdataset);
+-		if (foundsig != NULL)
++		if (!NEGATIVE(found) && foundsig != NULL)
+ 			bind_rdataset(rbtdb, rbtnode, foundsig, now,
+ 				      sigrdataset);
+ 	}
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch b/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch
new file mode 100644
index 0000000..c441eab
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch
@@ -0,0 +1,92 @@
+bind CVE-2012-1667
+
+Upstream-Status: Backport
+
+ISC BIND 9.x before 9.7.6-P1, 9.8.x before 9.8.3-P1, 9.9.x before 9.9.1-P1,
+and 9.4-ESV and 9.6-ESV before 9.6-ESV-R7-P1 does not properly handle resource
+records with a zero-length RDATA section, which allows remote DNS servers to
+cause a denial of service (daemon crash or data corruption) or obtain
+sensitive information from process memory via a crafted record.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-1667
+
+The cve patch comes from bind97-9.7.0-10.P2.el5_8.1.src.rpm package.
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ lib/dns/rdata.c     |    8 ++++----
+ lib/dns/rdataslab.c |   11 ++++++++---
+ 2 files changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/lib/dns/rdata.c b/lib/dns/rdata.c
+index 063b1f6..9337a80 100644
+--- a/lib/dns/rdata.c
++++ b/lib/dns/rdata.c
+@@ -325,8 +325,8 @@ dns_rdata_compare(const dns_rdata_t *rdata1, const dns_rdata_t *rdata2) {
+ 
+ 	REQUIRE(rdata1 != NULL);
+ 	REQUIRE(rdata2 != NULL);
+-	REQUIRE(rdata1->data != NULL);
+-	REQUIRE(rdata2->data != NULL);
++	REQUIRE(rdata1->length == 0 || rdata1->data != NULL);
++	REQUIRE(rdata2->length == 0 || rdata2->data != NULL);
+ 	REQUIRE(DNS_RDATA_VALIDFLAGS(rdata1));
+ 	REQUIRE(DNS_RDATA_VALIDFLAGS(rdata2));
+ 
+@@ -356,8 +356,8 @@ dns_rdata_casecompare(const dns_rdata_t *rdata1, const dns_rdata_t *rdata2) {
+ 
+ 	REQUIRE(rdata1 != NULL);
+ 	REQUIRE(rdata2 != NULL);
+-	REQUIRE(rdata1->data != NULL);
+-	REQUIRE(rdata2->data != NULL);
++	REQUIRE(rdata1->length == 0 || rdata1->data != NULL);
++	REQUIRE(rdata2->length == 0 || rdata2->data != NULL);
+ 	REQUIRE(DNS_RDATA_VALIDFLAGS(rdata1));
+ 	REQUIRE(DNS_RDATA_VALIDFLAGS(rdata2));
+ 
+diff --git a/lib/dns/rdataslab.c b/lib/dns/rdataslab.c
+index a41f16f..ed13b30 100644
+--- a/lib/dns/rdataslab.c
++++ b/lib/dns/rdataslab.c
+@@ -125,6 +125,11 @@ isc_result_t
+ dns_rdataslab_fromrdataset(dns_rdataset_t *rdataset, isc_mem_t *mctx,
+ 			   isc_region_t *region, unsigned int reservelen)
+ {
++	/*
++	 * Use &removed as a sentinal pointer for duplicate
++	 * rdata as rdata.data == NULL is valid.
++	 */
++	static unsigned char removed;
+ 	struct xrdata  *x;
+ 	unsigned char  *rawbuf;
+ #if DNS_RDATASET_FIXED
+@@ -168,6 +173,7 @@ dns_rdataslab_fromrdataset(dns_rdataset_t *rdataset, isc_mem_t *mctx,
+ 		INSIST(result == ISC_R_SUCCESS);
+ 		dns_rdata_init(&x[i].rdata);
+ 		dns_rdataset_current(rdataset, &x[i].rdata);
++		INSIST(x[i].rdata.data != &removed);
+ #if DNS_RDATASET_FIXED
+ 		x[i].order = i;
+ #endif
+@@ -200,8 +206,7 @@ dns_rdataslab_fromrdataset(dns_rdataset_t *rdataset, isc_mem_t *mctx,
+ 	 */
+ 	for (i = 1; i < nalloc; i++) {
+ 		if (compare_rdata(&x[i-1].rdata, &x[i].rdata) == 0) {
+-			x[i-1].rdata.data = NULL;
+-			x[i-1].rdata.length = 0;
++			x[i-1].rdata.data = &removed;
+ #if DNS_RDATASET_FIXED
+ 			/*
+ 			 * Preserve the least order so A, B, A -> A, B
+@@ -291,7 +296,7 @@ dns_rdataslab_fromrdataset(dns_rdataset_t *rdataset, isc_mem_t *mctx,
+ #endif
+ 
+ 	for (i = 0; i < nalloc; i++) {
+-		if (x[i].rdata.data == NULL)
++		if (x[i].rdata.data == &removed)
+ 			continue;
+ #if DNS_RDATASET_FIXED
+ 		offsettable[x[i].order] = rawbuf - offsetbase;
+-- 
+1.7.0.5
+
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch b/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch
new file mode 100644
index 0000000..1e159bd
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch
@@ -0,0 +1,40 @@
+bind: fix for CVE-2012-3817
+
+Upstream-Status: Backport
+
+ISC BIND 9.4.x, 9.5.x, 9.6.x, and 9.7.x before 9.7.6-P2; 9.8.x before 9.8.3-P2;
+9.9.x before 9.9.1-P2; and 9.6-ESV before 9.6-ESV-R7-P2, when DNSSEC validation
+is enabled, does not properly initialize the failing-query cache, which allows
+remote attackers to cause a denial of service (assertion failure and daemon exit)
+by sending many queries.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-3817
+
+This patch is back-ported from bind-9.3.6-20.P1.el5_8.2.src.rpm package.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ resolver.c |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -8318,6 +8318,7 @@ dns_resolver_addbadcache(dns_resolver_t 
+ 			goto cleanup;
+ 		bad->type = type;
+ 		bad->hashval = hashval;
++		bad->expire = *expire;
+ 		isc_buffer_init(&buffer, bad + 1, name->length);
+ 		dns_name_init(&bad->name, NULL);
+ 		dns_name_copy(name, &bad->name, &buffer);
+@@ -8329,8 +8330,8 @@ dns_resolver_addbadcache(dns_resolver_t 
+ 		if (resolver->badcount < resolver->badhash * 2 &&
+ 		    resolver->badhash > DNS_BADCACHE_SIZE)
+ 			resizehash(resolver, &now, ISC_FALSE);
+-	}
+-	bad->expire = *expire;
++	} else
++		bad->expire = *expire;
+  cleanup:
+ 	UNLOCK(&resolver->lock);
+ }
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch b/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch
new file mode 100644
index 0000000..7ec6deb
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch
@@ -0,0 +1,41 @@
+bind: fix for CVE-2013-2266
+
+Upstream-Status: Backport
+
+libdns in ISC BIND 9.7.x and 9.8.x before 9.8.4-P2, 9.8.5 before 9.8.5b2,
+9.9.x before 9.9.2-P2, and 9.9.3 before 9.9.3b2 on UNIX platforms allows
+remote attackers to cause a denial of service (memory consumption) via a
+crafted regular expression, as demonstrated by a memory-exhaustion attack
+against a machine running a named process.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-2266
+
+Signed-off-by Ming Liu <ming.liu@windriver.com>
+---
+ config.h.in  |    3 ---
+ configure.in |    2 +-
+ 2 files changed, 1 insertion(+), 4 deletions(-)
+
+--- a/config.h.in
++++ b/config.h.in
+@@ -277,9 +277,6 @@ int sigwait(const unsigned int *set, int
+ /* Define if your OpenSSL version supports GOST. */
+ #undef HAVE_OPENSSL_GOST
+ 
+-/* Define to 1 if you have the <regex.h> header file. */
+-#undef HAVE_REGEX_H
+-
+ /* Define to 1 if you have the `setegid' function. */
+ #undef HAVE_SETEGID
+ 
+--- a/configure.in
++++ b/configure.in
+@@ -279,7 +279,7 @@ esac
+ 
+ AC_HEADER_STDC
+ 
+-AC_CHECK_HEADERS(fcntl.h regex.h sys/time.h unistd.h sys/sockio.h sys/select.h sys/param.h sys/sysctl.h net/if6.h,,,
++AC_CHECK_HEADERS(fcntl.h sys/time.h unistd.h sys/sockio.h sys/select.h sys/param.h sys/sysctl.h net/if6.h,,,
+ [$ac_includes_default
+ #ifdef HAVE_SYS_PARAM_H
+ # include <sys/param.h>
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch b/meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch
new file mode 100644
index 0000000..5dd6f69
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch
@@ -0,0 +1,141 @@
+bind_Fix_for_CVE-2012-4244
+
+Upstream-Status: Backport
+
+Reference:https://bugzilla.novell.com/attachment.cgi?id=505661&action=edit
+
+ISC BIND 9.x before 9.7.6-P3, 9.8.x before 9.8.3-P3, 9.9.x before 9.9.1-P3,
+ and 9.4-ESV and 9.6-ESV before 9.6-ESV-R7-P3 allows remote attackers to
+cause a denial of service (assertion failure and named daemon exit) via
+a query for a long resource record.
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+
+diff -urpN a/lib/dns/include/dns/rdata.h b/lib/dns/include/dns/rdata.h
+--- a/lib/dns/include/dns/rdata.h	2012-10-08 12:19:42.000000000 +0800
++++ b/lib/dns/include/dns/rdata.h	2012-10-08 11:26:43.000000000 +0800
+@@ -147,6 +147,17 @@ struct dns_rdata {
+ 	(((rdata)->flags & ~(DNS_RDATA_UPDATE|DNS_RDATA_OFFLINE)) == 0)
+ 
+ /*
++ * The maximum length of a RDATA that can be sent on the wire.
++ * Max packet size (65535) less header (12), less name (1), type (2),
++ * class (2), ttl(4), length (2).
++ *
++ * None of the defined types that support name compression can exceed
++ * this and all new types are to be sent uncompressed.
++ */
++
++#define DNS_RDATA_MAXLENGTH    65512U
++
++/*
+  * Flags affecting rdata formatting style.  Flags 0xFFFF0000
+  * are used by masterfile-level formatting and defined elsewhere.
+  * See additional comments at dns_rdata_tofmttext().
+diff -urpN a/lib/dns/master.c b/lib/dns/master.c
+--- a/lib/dns/master.c	2012-10-08 12:19:42.000000000 +0800
++++ b/lib/dns/master.c	2012-10-08 11:27:06.000000000 +0800
+@@ -75,7 +75,7 @@
+ /*%
+  * max message size - header - root - type - class - ttl - rdlen
+  */
+-#define MINTSIZ (65535 - 12 - 1 - 2 - 2 - 4 - 2)
++#define MINTSIZ DNS_RDATA_MAXLENGTH 
+ /*%
+  * Size for tokens in the presentation format,
+  * The largest tokens are the base64 blocks in KEY and CERT records,
+diff -urpN a/lib/dns/rdata.c b/lib/dns/rdata.c
+--- a/lib/dns/rdata.c	2012-10-08 12:19:42.000000000 +0800
++++ b/lib/dns/rdata.c	2012-10-08 11:27:27.000000000 +0800
+@@ -425,6 +425,7 @@ dns_rdata_fromwire(dns_rdata_t *rdata, d
+ 	isc_buffer_t st;
+ 	isc_boolean_t use_default = ISC_FALSE;
+ 	isc_uint32_t activelength;
++	size_t length;
+ 
+ 	REQUIRE(dctx != NULL);
+ 	if (rdata != NULL) {
+@@ -455,6 +456,14 @@ dns_rdata_fromwire(dns_rdata_t *rdata, d
+ 	}
+ 
+ 	/*
++	 * Reject any rdata that expands out to more than DNS_RDATA_MAXLENGTH
++	 * as we cannot transmit it.
++	 */
++	length = isc_buffer_usedlength(target) - isc_buffer_usedlength(&st);
++	if (result == ISC_R_SUCCESS && length > DNS_RDATA_MAXLENGTH)
++		result = DNS_R_FORMERR;
++
++	/*
+ 	 * We should have consumed all of our buffer.
+ 	 */
+ 	if (result == ISC_R_SUCCESS && !buffer_empty(source))
+@@ -462,8 +471,7 @@ dns_rdata_fromwire(dns_rdata_t *rdata, d
+ 
+ 	if (rdata != NULL && result == ISC_R_SUCCESS) {
+ 		region.base = isc_buffer_used(&st);
+-		region.length = isc_buffer_usedlength(target) -
+-				isc_buffer_usedlength(&st);
++		region.length = length;
+ 		dns_rdata_fromregion(rdata, rdclass, type, &region);
+ 	}
+ 
+@@ -598,6 +606,7 @@ dns_rdata_fromtext(dns_rdata_t *rdata, d
+ 	unsigned long line;
+ 	void (*callback)(dns_rdatacallbacks_t *, const char *, ...);
+ 	isc_result_t tresult;
++	size_t length;
+ 
+ 	REQUIRE(origin == NULL || dns_name_isabsolute(origin) == ISC_TRUE);
+ 	if (rdata != NULL) {
+@@ -670,10 +679,13 @@ dns_rdata_fromtext(dns_rdata_t *rdata, d
+ 		}
+ 	} while (1);
+ 
++	length = isc_buffer_usedlength(target) - isc_buffer_usedlength(&st);
++	if (result == ISC_R_SUCCESS && length > DNS_RDATA_MAXLENGTH)
++		result = ISC_R_NOSPACE;
++
+ 	if (rdata != NULL && result == ISC_R_SUCCESS) {
+ 		region.base = isc_buffer_used(&st);
+-		region.length = isc_buffer_usedlength(target) -
+-				isc_buffer_usedlength(&st);
++		region.length = length;
+ 		dns_rdata_fromregion(rdata, rdclass, type, &region);
+ 	}
+ 	if (result != ISC_R_SUCCESS) {
+@@ -781,6 +793,7 @@ dns_rdata_fromstruct(dns_rdata_t *rdata,
+ 	isc_buffer_t st;
+ 	isc_region_t region;
+ 	isc_boolean_t use_default = ISC_FALSE;
++	size_t length;
+ 
+ 	REQUIRE(source != NULL);
+ 	if (rdata != NULL) {
+@@ -795,10 +808,13 @@ dns_rdata_fromstruct(dns_rdata_t *rdata,
+ 	if (use_default)
+ 		(void)NULL;
+ 
++	length = isc_buffer_usedlength(target) - isc_buffer_usedlength(&st);
++	if (result == ISC_R_SUCCESS && length > DNS_RDATA_MAXLENGTH)
++		result = ISC_R_NOSPACE;
++
+ 	if (rdata != NULL && result == ISC_R_SUCCESS) {
+ 		region.base = isc_buffer_used(&st);
+-		region.length = isc_buffer_usedlength(target) -
+-				isc_buffer_usedlength(&st);
++		region.length = length;
+ 		dns_rdata_fromregion(rdata, rdclass, type, &region);
+ 	}
+ 	if (result != ISC_R_SUCCESS)
+diff -urpN a/lib/dns/rdataslab.c b/lib/dns/rdataslab.c
+--- a/lib/dns/rdataslab.c	2012-10-08 12:19:42.000000000 +0800
++++ b/lib/dns/rdataslab.c	2012-10-08 11:27:54.000000000 +0800
+@@ -304,6 +304,7 @@ dns_rdataslab_fromrdataset(dns_rdataset_
+ 		length = x[i].rdata.length;
+ 		if (rdataset->type == dns_rdatatype_rrsig)
+ 			length++;
++		INSIST(length <= 0xffff);
+ 		*rawbuf++ = (length & 0xff00) >> 8;
+ 		*rawbuf++ = (length & 0x00ff);
+ #if DNS_RDATASET_FIXED
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index b807dbf..3c5d600 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -12,6 +12,12 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
            file://cross-build-fix.patch \
            file://make-etc-initd-bind-stop-work.patch \
+           file://bind-9.8.1-CVE-2012-5166.patch \
+           file://bind-CVE-2011-4313.patch \
+           file://bind-CVE-2012-1667.patch \
+           file://bind-CVE-2012-3817.patch \
+           file://bind-CVE-2013-2266.patch \
+           file://bind-Fix-CVE-2012-4244.patch \
 	   "
 
 SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
-- 
1.7.10.4


