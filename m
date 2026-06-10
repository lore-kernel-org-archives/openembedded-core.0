Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95774CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:05:24 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16957.1781085920217419919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 03:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=G2ZVJYkq;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=17223; q=dns/txt;
  s=iport01; t=1781085920; x=1782295520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n/xQgYYKOAL2eKw0OGmM60vKjcIJ60oW38Xsl6u8gTA=;
  b=G2ZVJYkq3LXoKAQNrlVqnmOjifChSBB0Nmf9o2lfK8AX7fCk/2HSVJcR
   aozqq0QGWAgzLZPpi4005teuJTT1p35x+y536tZN55ZSk7/dr1l7tjXKl
   yeDVBwkqOCr+cqfY5NWz+Byxgi5lQcFYADnto35gK3hkLmdgijBCqrORF
   /nk6Q0MyH5eXOgVxH3wpiL4PST973NN0TOrBf89VW/5MNtDhfIG/CrsQC
   E8YySUxEf1Q2Sh9j0CaRxnYZvN3+gpo6gdSDfnQY/WFMWHKwFZZXMVOc8
   f8KfTXBY/RcDafqh/9ZnZrgKbKSXrt4DhdbRRR+0ewjrPkdkq1qFqzHM7
   g==;
X-CSE-ConnectionGUID: Z7E2/IQMS6y4Wyx5HEFr6w==
X-CSE-MsgGUID: JxGlmxBMTfizrZ8XNiYgMA==
X-IPAS-Result: =?us-ascii?q?A0BIAgBwNSlq/43/Ja1aHgEBCxIMggULgld0X0JJlksDk?=
 =?us-ascii?q?UqMURSBag8BAQEPRA0EAQGFBgKNOgImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBAJgwIBgnMCA?=
 =?us-ascii?q?RGzAIF5M4EBgygBMQUJAgJAAVDbKwELFAEFgTOFP4geWxgBhHwnGxuBcoEVg?=
 =?us-ascii?q?2iBBYFcBYEgCgsLBYZdBIIigQyBXR6CQIw0SIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EMGwcFgUqBN2iBAoUQIx8DOYEVgXqBKGdpFTA1bAMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPm4HjDoXD4FFAWsHATAwIA0BCiEUbxdvKUWSYwcKkBaCIYE1n1oKK?=
 =?us-ascii?q?IN0jCGVOhozhASmZ5kHglmLMZVnC12EaIFoPIFZcBWDIglKGQ+OLQsLg2CEU?=
 =?us-ascii?q?ENRwmckNQIJMgEBBwIHDgMLgWiQAQEmB4FOAQE?=
IronPort-Data: A9a23:RZ2yJKm1cHEwqQBU+2LQy17o5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDWyDPfaJa2ahf98kPN/j9EgA7ZXSmtNhHgVlqiw9EltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKsvrb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fb9H17wwIFhrz
 qIJdA8cfk2jqsysnq3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYz/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKJKofVGpgLzxfwS
 mTu3XTWBhQKHvmjxzuX6ED8tsnOrCzecddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:428y26HXenGzqCmMpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:hTNPTG+5/GYTae+cjVSVv3xLN5piU0T49ynBf3CpGTtJZZOPF0DFrQ==
X-Talos-MUID: 9a23:gbZnqQrNZWlgYvc+UucezxNyG8Nt846LNE4Mg4806/miNB1/Hh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="483775699"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 10:05:19 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id EA92E18000180;
	Wed, 10 Jun 2026 10:05:18 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 97F6CCC1611; Wed, 10 Jun 2026 03:05:18 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 2/5] bind: Fix CVE-2026-5950
Date: Wed, 10 Jun 2026 03:04:01 -0700
Message-Id: <20260610100404.2993940-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260610100404.2993940-1-asparmar@cisco.com>
References: <20260610100404.2993940-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238343

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream 9.18 backport [1] for CVE-2026-5950. The public ISC
advisory [2] describes the vulnerability and identifies the fixed BIND
release.

The upstream fix is split across a reproducer, a counter refactor, and
the functional resend-loop fix. Apply them in the same order so the
final fix lands on top of the counter handling it depends on:

- CVE-2026-5950_p1.patch [3] adds the BADCOOKIE resend-loop system-test
  reproducer.
- CVE-2026-5950_p2.patch [4] refactors query-counter increment handling
  so resend paths can update counters consistently.
- CVE-2026-5950_p3.patch [5] updates rctx_resend() to increment query
  counters, preventing the unbounded resend loop from bypassing the
  quota accounting.

Keep the patches split to preserve the upstream commit structure and to
make the SRC_URI ordering explicit.

[1] https://gitlab.com/isc-projects/bind9/-/commit/43d173797e3c781c7e38d879c3c765f01cc09c59
[2] https://kb.isc.org/docs/cve-2026-5950
[3] https://gitlab.com/isc-projects/bind9/-/commit/8344a38d6bc72d3872b552b4cae0e0d8be4c3d4a
[4] https://gitlab.com/isc-projects/bind9/-/commit/9ebfca2af824a60ea072292ffb1ab01ff87c7fa7
[5] https://gitlab.com/isc-projects/bind9/-/commit/d3ba533080e31de98986f3beff70d7c330ba9f89

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../bind/bind/CVE-2026-5950_p1.patch          | 245 ++++++++++++++++++
 .../bind/bind/CVE-2026-5950_p2.patch          | 100 +++++++
 .../bind/bind/CVE-2026-5950_p3.patch          |  67 +++++
 .../recipes-connectivity/bind/bind_9.18.44.bb |   3 +
 4 files changed, 415 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5950_p1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5950_p2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-5950_p3.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5950_p1.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5950_p1.patch
new file mode 100644
index 0000000000..3b603e41fd
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5950_p1.patch
@@ -0,0 +1,245 @@
+From 59bf865e9691f3a047e24bda071498a48e2a5220 Mon Sep 17 00:00:00 2001
+From: Matthijs Mekking <matthijs@isc.org>
+Date: Thu, 9 Apr 2026 11:32:07 +0200
+Subject: [PATCH] Add reproducer for BADCOOKIE resend loop
+
+Run malicious server: resend_loop/ans3/ans.py
+
+Start BIND: ns4
+
+Send single query to test.example
+
+The resolver will repeatedly resend queries until the fetch timeout
+expires, resulting in resulting in thousands of qrysent while the quota
+counter remains 0.
+
+CVE: CVE-2026-5950
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/8344a38d6bc72d3872b552b4cae0e0d8be4c3d4a]
+
+(cherry picked from commit 7eeb463bc58cbd71419aaf189d7829f2dfd8d055)
+(cherry picked from commit 8344a38d6bc72d3872b552b4cae0e0d8be4c3d4a)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ bin/tests/system/resend_loop/ans3/ans.py      | 128 ++++++++++++++++++
+ .../system/resend_loop/ns4/named.conf.j2      |  16 +++
+ bin/tests/system/resend_loop/ns4/root.hint    |  14 ++
+ .../system/resend_loop/tests_resend_loop.py   |  28 ++++
+ 4 files changed, 186 insertions(+)
+ create mode 100644 bin/tests/system/resend_loop/ans3/ans.py
+ create mode 100644 bin/tests/system/resend_loop/ns4/named.conf.j2
+ create mode 100644 bin/tests/system/resend_loop/ns4/root.hint
+ create mode 100644 bin/tests/system/resend_loop/tests_resend_loop.py
+
+diff --git a/bin/tests/system/resend_loop/ans3/ans.py b/bin/tests/system/resend_loop/ans3/ans.py
+new file mode 100644
+index 0000000000..90a3f2f9cc
+--- /dev/null
++++ b/bin/tests/system/resend_loop/ans3/ans.py
+@@ -0,0 +1,128 @@
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
++from collections.abc import AsyncGenerator
++
++import dns.edns
++import dns.name
++import dns.rcode
++import dns.rdatatype
++import dns.rrset
++
++from isctest.asyncserver import (
++    AsyncDnsServer,
++    DnsResponseSend,
++    QueryContext,
++    ResponseHandler,
++)
++
++
++def _get_cookie(qctx: QueryContext):
++    for o in qctx.query.options:
++        if o.otype == dns.edns.OptionType.COOKIE:
++            cookie = o
++            try:
++                if len(cookie.server) == 0:
++                    cookie.server = b"\x11\x22\x33\x44\x55\x66\x77\x88"
++            except AttributeError:  # dnspython<2.7.0 compat
++                if len(o.data) == 8:
++                    cookie.data *= 2
++
++            return cookie
++
++    return None
++
++
++class PrimeHandler(ResponseHandler):
++    """
++    Specifically handle priming query for "." NS (type 2)
++    """
++
++    def match(self, qctx: QueryContext) -> bool:
++        return len(qctx.qname.labels) == 0 and qctx.qtype == dns.rdatatype.NS
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[DnsResponseSend, None]:
++
++        ns_rrset = dns.rrset.from_text(
++            ".", dns.rdatatype.NS, qctx.qclass, "a.root-servers.nil."
++        )
++        a_rrset = dns.rrset.from_text(
++            "a.root-servers.nil.", dns.rdatatype.A, qctx.qclass, "10.53.0.3"
++        )
++
++        response = qctx.prepare_new_response(with_zone_data=False)
++        response.set_rcode(dns.rcode.NOERROR)
++        response.answer.append(ns_rrset)
++        response.additional.append(a_rrset)
++
++        yield DnsResponseSend(response, authoritative=True)
++
++
++class CookieHandler(ResponseHandler):
++    def match(self, qctx: QueryContext) -> bool:
++        example = dns.name.from_text("example")
++        return qctx.qname.is_subdomain(example)
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[DnsResponseSend, None]:
++
++        qctx.prepare_new_response()
++
++        # Check for client cookie
++        cookie = _get_cookie(qctx)
++
++        # If missing cookie entirely, just return SERVFAIL
++        if cookie is None:
++            qctx.response.set_rcode(dns.rcode.SERVFAIL)
++            yield DnsResponseSend(qctx.response, authoritative=True)
++
++        # If there is a client cookie, mock BADCOOKIE to trigger
++        # the resend loop logic.
++        qctx.response.use_edns(options=[cookie])
++        qctx.response.set_rcode(dns.rcode.BADCOOKIE)
++        yield DnsResponseSend(qctx.response, authoritative=True)
++
++
++class NoErrorHandler(ResponseHandler):
++    """
++    If the query is NOT a subdomain of example, respond with standard NOERROR empty answer
++    """
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[DnsResponseSend, None]:
++
++        qctx.prepare_new_response()
++        qctx.response.set_rcode(dns.rcode.NOERROR)
++        yield DnsResponseSend(qctx.response, authoritative=True)
++
++
++def resend_server() -> AsyncDnsServer:
++    server = AsyncDnsServer(default_aa=True, default_rcode=dns.rcode.NOERROR)
++    server.install_response_handlers(
++        [
++            PrimeHandler(),
++            CookieHandler(),
++            NoErrorHandler(),
++        ]
++    )
++    return server
++
++
++def main() -> None:
++    resend_server().run()
++
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/resend_loop/ns4/named.conf.j2 b/bin/tests/system/resend_loop/ns4/named.conf.j2
+new file mode 100644
+index 0000000000..360bc12e17
+--- /dev/null
++++ b/bin/tests/system/resend_loop/ns4/named.conf.j2
+@@ -0,0 +1,16 @@
++options {
++	query-source address 10.53.0.4;
++	notify-source 10.53.0.4;
++	transfer-source 10.53.0.4;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.4; };
++	listen-on-v6 { none; };
++	recursion yes;
++	dnssec-validation no;
++};
++
++zone "." IN {
++	type hint;
++	file "root.hint";
++};
+diff --git a/bin/tests/system/resend_loop/ns4/root.hint b/bin/tests/system/resend_loop/ns4/root.hint
+new file mode 100644
+index 0000000000..3889a8b353
+--- /dev/null
++++ b/bin/tests/system/resend_loop/ns4/root.hint
+@@ -0,0 +1,14 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++$TTL 999999
++.			 IN NS	a.root-servers.nil.
++a.root-servers.nil.	 IN A	10.53.0.3
+diff --git a/bin/tests/system/resend_loop/tests_resend_loop.py b/bin/tests/system/resend_loop/tests_resend_loop.py
+new file mode 100644
+index 0000000000..f7ed4d3da6
+--- /dev/null
++++ b/bin/tests/system/resend_loop/tests_resend_loop.py
+@@ -0,0 +1,28 @@
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
++import dns.message
++
++import isctest
++
++
++def test_resend_loop_badcookie(ns4):
++    expected_log = "exceeded max queries resolving 'test.example/A'"
++
++    msg = dns.message.make_query("test.example", "A")
++    with ns4.watch_log_from_here() as watcher:
++        res = isctest.query.udp(msg, ns4.ip)
++        watcher.wait_for_line(expected_log)
++
++    isctest.check.servfail(res)
++
++    prohibited_log = "query failed (timed out) for test.example/IN/A"
++    assert prohibited_log not in ns4.log
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5950_p2.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5950_p2.patch
new file mode 100644
index 0000000000..3921c363f6
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5950_p2.patch
@@ -0,0 +1,100 @@
+From f090a1d0cf3599380c750557caff25e0379fb4d6 Mon Sep 17 00:00:00 2001
+From: Colin Vidal <colin@isc.org>
+Date: Tue, 7 Apr 2026 22:18:10 +0200
+Subject: [PATCH] Refactor incrementing query counters
+
+Move the logic incrementing the query counter and the global query
+counter into a dedicated helper function.
+
+CVE: CVE-2026-5950
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/9ebfca2af824a60ea072292ffb1ab01ff87c7fa7]
+
+(cherry picked from commit 05d6da2de54c093689e675e81ae898ee41220666)
+(cherry picked from commit 9ebfca2af824a60ea072292ffb1ab01ff87c7fa7)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/dns/resolver.c | 59 ++++++++++++++++++++++++++++------------------
+ 1 file changed, 36 insertions(+), 23 deletions(-)
+
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 1bacec6470..079aa79ea0 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -4203,6 +4203,39 @@ fctx_nextaddress(fetchctx_t *fctx) {
+ 	return addrinfo;
+ }
+ 
++static isc_result_t
++incr_query_counters(fetchctx_t *fctx) {
++	isc_result_t result;
++
++	result = isc_counter_increment(fctx->qc);
++#if WANT_QUERYTRACE
++	FCTXTRACE5("query", "max-recursion-queries, querycount=",
++		   isc_counter_used(fctx->qc));
++#endif
++	if (result != ISC_R_SUCCESS) {
++		isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
++			      DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
++			      "exceeded max queries resolving '%s' "
++			      "(max-recursion-queries, querycount=%u)",
++			      fctx->info, isc_counter_used(fctx->qc));
++	} else if (fctx->gqc != NULL) {
++		result = isc_counter_increment(fctx->gqc);
++#if WANT_QUERYTRACE
++		FCTXTRACE5("query", "max-query-count, querycount=",
++			   isc_counter_used(fctx->gqc));
++#endif
++		if (result != ISC_R_SUCCESS) {
++			isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
++				      DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
++				      "exceeded global max queries resolving "
++				      "'%s' (max-query-count, querycount=%u)",
++				      fctx->info, isc_counter_used(fctx->gqc));
++		}
++	}
++
++	return result;
++}
++
+ static void
+ fctx_try(fetchctx_t *fctx, bool retrying, bool badcache) {
+ 	isc_result_t result;
+@@ -4357,31 +4390,11 @@ fctx_try(fetchctx_t *fctx, bool retrying, bool badcache) {
+ 		return;
+ 	}
+ 
+-	result = isc_counter_increment(fctx->qc);
+-	if (result != ISC_R_SUCCESS) {
+-		isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
+-			      DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
+-			      "exceeded max queries resolving '%s' "
+-			      "(max-recursion-queries, querycount=%u)",
+-			      fctx->info, isc_counter_used(fctx->qc));
+-		fctx_done_detach(&fctx, DNS_R_SERVFAIL);
+-		return;
+-	}
+-
+-	if (fctx->gqc != NULL) {
+-		result = isc_counter_increment(fctx->gqc);
+-		if (result != ISC_R_SUCCESS) {
+-			isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
+-				      DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
+-				      "exceeded global max queries resolving "
+-				      "'%s' (max-query-count, querycount=%u)",
+-				      fctx->info, isc_counter_used(fctx->gqc));
+-			fctx_done_detach(&fctx, DNS_R_SERVFAIL);
+-			return;
+-		}
+-	}
++	CHECK(incr_query_counters(fctx));
+ 
+ 	result = fctx_query(fctx, addrinfo, fctx->options);
++
++cleanup:
+ 	if (result != ISC_R_SUCCESS) {
+ 		fctx_done_detach(&fctx, result);
+ 	} else if (retrying) {
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-5950_p3.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-5950_p3.patch
new file mode 100644
index 0000000000..9163c956ea
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-5950_p3.patch
@@ -0,0 +1,67 @@
+From 3346293873d9ae59b5e57abc41142485f8dcdc9a Mon Sep 17 00:00:00 2001
+From: Colin Vidal <colin@isc.org>
+Date: Tue, 7 Apr 2026 22:18:58 +0200
+Subject: [PATCH] rctx_resend() increment query counters
+
+Calls to `rctx_resend()` are done internally within the resolver, in
+flow which are not supposed to happens more than once. For instance,
+if some query fails, and a specific flag "F" wasn't set, then set the
+flag and try again. This wouldn't occur more than once because if the
+query fails the next attempt, the flag "F" would be set already, so the
+resolver would move to the next server (or give up).
+
+However, a subtle bug missing checking a flag, for instance, could lead
+to an unbounded loop re-trying to query the same server. This is now
+impossible as `rctx_resend()` also increment the query counters (so if
+such case occurs, it would stop once the maximum limit is reached).
+
+The dns_resstatscounter_retry are also only incremented if the
+`fctx_query()` succeeds, similar to as is done in `fctx_try()`.
+
+CVE: CVE-2026-5950
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/d3ba533080e31de98986f3beff70d7c330ba9f89]
+
+(cherry picked from commit f3e74304889a2e8b69c8e88fc9a383589decda32)
+(cherry picked from commit d3ba533080e31de98986f3beff70d7c330ba9f89)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/dns/resolver.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 079aa79ea0..cc40f862d1 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -10089,9 +10089,9 @@ rctx_nextserver(respctx_t *rctx, dns_message_t *message,
+  * rctx_resend():
+  *
+  * Resend the query, probably with the options changed. Calls
+- * fctx_query(), passing rctx->retryopts (which is based on
+- * query->options, but may have been updated since the last time
+- * fctx_query() was called).
++ * fctx_query(), unless query counter limits are hit, passing
++ * rctx->retryopts (which is based on query->options, but may have
++ * been updated since the last time fctx_query() was called).
+  */
+ static void
+ rctx_resend(respctx_t *rctx, dns_adbaddrinfo_t *addrinfo) {
+@@ -10099,8 +10099,15 @@ rctx_resend(respctx_t *rctx, dns_adbaddrinfo_t *addrinfo) {
+ 	isc_result_t result;
+ 
+ 	FCTXTRACE("resend");
+-	inc_stats(fctx->res, dns_resstatscounter_retry);
++
++	CHECK(incr_query_counters(fctx));
++
+ 	result = fctx_query(fctx, addrinfo, rctx->retryopts);
++	if (result == ISC_R_SUCCESS) {
++		inc_stats(fctx->res, dns_resstatscounter_retry);
++	}
++
++cleanup:
+ 	if (result != ISC_R_SUCCESS) {
+ 		fctx_done_detach(&rctx->fctx, result);
+ 	}
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipes-connectivity/bind/bind_9.18.44.bb
index 9c8b73dccc..d55e0e0c4d 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
@@ -23,6 +23,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2026-1519_p2.patch \
            file://CVE-2026-1519_p3.patch \
            file://CVE-2026-1519_p4.patch \
+           file://CVE-2026-5950_p1.patch \
+           file://CVE-2026-5950_p2.patch \
+           file://CVE-2026-5950_p3.patch \
            "
 
 SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
-- 
2.35.6


