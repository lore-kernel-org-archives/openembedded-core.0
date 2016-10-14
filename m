Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 198E771AE9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 05:11:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="11931566"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Oct 2016 13:11:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 16E7D4670060
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 13:11:14 +0800 (CST)
Received: from z195002c2.g01.fujitsu.local (10.167.226.109) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 14 Oct 2016 13:11:13 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2016 10:11:04 -0400
Message-ID: <1476454264-6428-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 16E7D4670060.A695C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] fix two CVEs for bind
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
X-List-Received-Date: Fri, 14 Oct 2016 05:11:29 -0000
Content-Type: text/plain

Add two CVE patches from upstream
git: https://www.isc.org/git/

1.CVE-2016-2775.patch
2.CVE-2016-2776.patch

Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../bind/bind/CVE-2016-2775.patch                  |  90 +++++++++++++++
 .../bind/bind/CVE-2016-2776.patch                  | 123 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |   2 +
 3 files changed, 215 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
new file mode 100644
index 0000000..5393063
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
@@ -0,0 +1,90 @@
+From 9d8aba8a7778721ae2cee6e4670a8e6be6590b05 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Wed, 12 Oct 2016 19:52:59 +0900
+Subject: [PATCH]
+4406.   [security]      getrrsetbyname with a non absolute name could
+                        trigger an infinite recursion bug in lwresd
+                        and named with lwres configured if when combined
+                        with a search list entry the resulting name is
+                        too long. (CVE-2016-2775) [RT #42694]
+
+Backport commit 38cc2d14e218e536e0102fa70deef99461354232 from the
+v9.11.0_patch branch.
+
+CVE: CVE-2016-2775
+Upstream-Status: Backport
+
+Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
+
+---
+ CHANGES                          |  6 ++++++
+ bin/named/lwdgrbn.c              | 16 ++++++++++------
+ bin/tests/system/lwresd/lwtest.c |  9 ++++++++-
+ 3 files changed, 24 insertions(+), 7 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index d2e3360..d0a9d12 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,3 +1,9 @@
++4406.   [security]      getrrsetbyname with a non absolute name could
++                        trigger an infinite recursion bug in lwresd
++                        and named with lwres configured if when combined
++                        with a search list entry the resulting name is
++                        too long. (CVE-2016-2775) [RT #42694]
++
+ 4322.  [security]      Duplicate EDNS COOKIE options in a response could
+                        trigger an assertion failure. (CVE-2016-2088)
+                        [RT #41809]
+diff --git a/bin/named/lwdgrbn.c b/bin/named/lwdgrbn.c
+index 3e7b15b..e1e9adc 100644
+--- a/bin/named/lwdgrbn.c
++++ b/bin/named/lwdgrbn.c
+@@ -403,14 +403,18 @@ start_lookup(ns_lwdclient_t *client) {
+ 	INSIST(client->lookup == NULL);
+ 
+ 	dns_fixedname_init(&absname);
+-	result = ns_lwsearchctx_current(&client->searchctx,
+-					dns_fixedname_name(&absname));
++
+ 	/*
+-	 * This will return failure if relative name + suffix is too long.
+-	 * In this case, just go on to the next entry in the search path.
++         * Perform search across all search domains until success
++         * is returned. Return in case of failure.
+ 	 */
+-	if (result != ISC_R_SUCCESS)
+-		start_lookup(client);
++        while (ns_lwsearchctx_current(&client->searchctx,
++                        dns_fixedname_name(&absname)) != ISC_R_SUCCESS) {
++                if (ns_lwsearchctx_next(&client->searchctx) != ISC_R_SUCCESS) {
++                        ns_lwdclient_errorpktsend(client, LWRES_R_FAILURE);
++                        return;
++                }
++        }
+ 
+ 	result = dns_lookup_create(cm->mctx,
+ 				   dns_fixedname_name(&absname),
+diff --git a/bin/tests/system/lwresd/lwtest.c b/bin/tests/system/lwresd/lwtest.c
+index ad9b551..3eb4a66 100644
+--- a/bin/tests/system/lwresd/lwtest.c
++++ b/bin/tests/system/lwresd/lwtest.c
+@@ -768,7 +768,14 @@ main(void) {
+ 	test_getrrsetbyname("e.example1.", 1, 2, 1, 1, 1);
+ 	test_getrrsetbyname("e.example1.", 1, 46, 2, 0, 1);
+ 	test_getrrsetbyname("", 1, 1, 0, 0, 0);
+-
++        test_getrrsetbyname("123456789.123456789.123456789.123456789."
++                            "123456789.123456789.123456789.123456789."
++                            "123456789.123456789.123456789.123456789."
++                            "123456789.123456789.123456789.123456789."
++                            "123456789.123456789.123456789.123456789."
++                            "123456789.123456789.123456789.123456789."
++                            "123456789", 1, 1, 0, 0, 0);
++ 
+ 	if (fails == 0)
+ 		printf("I:ok\n");
+ 	return (fails);
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch b/meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
new file mode 100644
index 0000000..738bf60
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
@@ -0,0 +1,123 @@
+From 1171111657081970585f9f0e03b476358c33a6c0 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Wed, 12 Oct 2016 20:36:52 +0900
+Subject: [PATCH] 
+4467.   [security]      It was possible to trigger an assertion when 
+                        rendering a message. (CVE-2016-2776) [RT #43139]
+
+Backport commit 2bd0922cf995b9ac205fc83baf7e220b95c6bf12 from the
+v9.11.0_patch branch.
+
+CVE: CVE-2016-2776
+Upstream-Status: Backport
+
+Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
+
+---
+ CHANGES           |  3 +++
+ lib/dns/message.c | 42 +++++++++++++++++++++++++++++++-----------
+ 2 files changed, 34 insertions(+), 11 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index d0a9d12..5c8c61a 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,3 +1,6 @@
++4467.   [security]      It was possible to trigger an assertion when
++                        rendering a message. (CVE-2016-2776) [RT #43139]
++
+ 4406.   [security]      getrrsetbyname with a non absolute name could
+                         trigger an infinite recursion bug in lwresd
+                         and named with lwres configured if when combined
+diff --git a/lib/dns/message.c b/lib/dns/message.c
+index 6b5b4bb..b74dc81 100644
+--- a/lib/dns/message.c
++++ b/lib/dns/message.c
+@@ -1754,7 +1754,7 @@ dns_message_renderbegin(dns_message_t *msg, dns_compress_t *cctx,
+ 	if (r.length < DNS_MESSAGE_HEADERLEN)
+ 		return (ISC_R_NOSPACE);
+ 
+-	if (r.length < msg->reserved)
++        if (r.length - DNS_MESSAGE_HEADERLEN < msg->reserved)
+ 		return (ISC_R_NOSPACE);
+ 
+ 	/*
+@@ -1895,8 +1895,29 @@ norender_rdataset(const dns_rdataset_t *rdataset, unsigned int options,
+ 
+ 	return (ISC_TRUE);
+ }
+-
+ #endif
++
++static isc_result_t
++renderset(dns_rdataset_t *rdataset, dns_name_t *owner_name,
++         dns_compress_t *cctx, isc_buffer_t *target,
++         unsigned int reserved, unsigned int options, unsigned int *countp)
++{
++       isc_result_t result;
++
++       /*
++        * Shrink the space in the buffer by the reserved amount.
++        */
++       if (target->length - target->used < reserved)
++               return (ISC_R_NOSPACE);
++
++       target->length -= reserved;
++       result = dns_rdataset_towire(rdataset, owner_name,
++                                    cctx, target, options, countp);
++       target->length += reserved;
++
++       return (result);
++}
++
+ isc_result_t
+ dns_message_rendersection(dns_message_t *msg, dns_section_t sectionid,
+ 			  unsigned int options)
+@@ -1939,6 +1960,8 @@ dns_message_rendersection(dns_message_t *msg, dns_section_t sectionid,
+ 	/*
+ 	 * Shrink the space in the buffer by the reserved amount.
+ 	 */
++        if (msg->buffer->length - msg->buffer->used < msg->reserved)
++                return (ISC_R_NOSPACE);
+ 	msg->buffer->length -= msg->reserved;
+ 
+ 	total = 0;
+@@ -2214,9 +2237,8 @@ dns_message_renderend(dns_message_t *msg) {
+ 		 * Render.
+ 		 */
+ 		count = 0;
+-		result = dns_rdataset_towire(msg->opt, dns_rootname,
+-					     msg->cctx, msg->buffer, 0,
+-					     &count);
++                result = renderset(msg->opt, dns_rootname, msg->cctx,
++                                   msg->buffer, msg->reserved, 0, &count);
+ 		msg->counts[DNS_SECTION_ADDITIONAL] += count;
+ 		if (result != ISC_R_SUCCESS)
+ 			return (result);
+@@ -2232,9 +2254,8 @@ dns_message_renderend(dns_message_t *msg) {
+ 		if (result != ISC_R_SUCCESS)
+ 			return (result);
+ 		count = 0;
+-		result = dns_rdataset_towire(msg->tsig, msg->tsigname,
+-					     msg->cctx, msg->buffer, 0,
+-					     &count);
++                result = renderset(msg->tsig, msg->tsigname, msg->cctx,
++                                   msg->buffer, msg->reserved, 0, &count);
+ 		msg->counts[DNS_SECTION_ADDITIONAL] += count;
+ 		if (result != ISC_R_SUCCESS)
+ 			return (result);
+@@ -2255,9 +2276,8 @@ dns_message_renderend(dns_message_t *msg) {
+ 		 * the owner name of a SIG(0) is irrelevant, and will not
+ 		 * be set in a message being rendered.
+ 		 */
+-		result = dns_rdataset_towire(msg->sig0, dns_rootname,
+-					     msg->cctx, msg->buffer, 0,
+-					     &count);
++                result = renderset(msg->sig0, dns_rootname, msg->cctx,
++                                   msg->buffer, msg->reserved, 0, &count);
+ 		msg->counts[DNS_SECTION_ADDITIONAL] += count;
+ 		if (result != ISC_R_SUCCESS)
+ 			return (result);
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
index a99f0dd..4e2e856 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
@@ -25,6 +25,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2016-1286_1.patch \
            file://CVE-2016-1286_2.patch \
            file://CVE-2016-2088.patch \
+           file://CVE-2016-2775.patch \
+           file://CVE-2016-2776.patch \
            "
 
 SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
-- 
2.7.4




