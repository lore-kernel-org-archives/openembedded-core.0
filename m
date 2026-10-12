Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90408CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 04:38:46 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6728.1791779914401365166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 21:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aLDvloru;
 spf=pass (domain: mvista.com, ip: 74.125.82.172, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2506559eec.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 21:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791779914; x=1792384714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXRrmLZgQ6UJuAPtwchEVbi4dmDQVTyQuBq74S2FkOI=;
        b=aLDvloru/hwsXJPqDREm7NqPkm0Rivlousv8c3nausZqcpZfGAh5K2gBKSDKxa2wL9
         iuk10GiW/ua7QbfQxkX2vqQ1GpigoXYb4iKvj3eRg1vLV8Gei3DxDyLlb/XSRqkCUxCr
         9Yb33aXyNFzzzvrLLxQs7CnO38hZ30cn8VdL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779914; x=1792384714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXRrmLZgQ6UJuAPtwchEVbi4dmDQVTyQuBq74S2FkOI=;
        b=Jfth6j/fhGg9ZLzv4A+EFL894XVH2U8WW5RPhwbJmiRrATdAbkOMk9edoExR/7FQ3Z
         fKoLj0aNZhysjF2+kzP6A5HPvNT3FgUoHkB/hTw4irmPYhvWgoO7ssFh5QXTlhJsgqWz
         8h0CkG8NI3LJLZgZw5dyrOrJpdR43V7sb/e47fLV2BVAiSh9exHQsSVtbap1fJvjGhYa
         nPbytyBSZI95eL++vMQSf6boqPYVzFNhbGP2RxdbcsVqcKL+hSPgpIsnD7H6fq6UKdTJ
         JACXam80vlp//GSwkPl1njjOqHWeAYafoLMm96xReSuZxdE9Anv04uco6T4AFYFzAGTm
         lp3Q==
X-Gm-Message-State: AFq9FYJqkpRRhXSneztY+24ysINMVQZZOmVwHtpWDQoZvZXfSTLepOuB
	TmcvDuZID8nWVU/vVmktU96ZgAV5tgfhJgr3XNi7+F4kX5EYhysHSfzS09dqgFnqzIo7tJywc9j
	+GwCf
X-Gm-Gg: AYBFou2isZ4mLLVO51Jw9sxHetYR0rGFpae2ZWPKCMK8ZezNBsxzeonU6Xfl3LxZVCc
	uBk7s7hJDcJEkcmliuXnJ5JXIu5m4hIzqIXrLLbIx9M1g2NCNZs7f2SBV5Rp+Ddcwy5HX2OwA1O
	o6269Ie/MgARSkDACCvfGFFHsg4ydKPqw8F1UN34TJGNsaaRbpbgjNYY5jyu5mi2+SCBwsiNfYw
	hKWha2IEHyuZ52+KdUKygH8t3fil15CL4uZXpdeaRondzMF/iRS2/cF/NUb/0UwLHmmif4E4Dpl
	LzHLugoXsSXx3SnCNU0qWI6KqTSFN3aLsQ0uozHWCL+y9VpP33WRWlaOVPRl82UD5vpIJ9I/yxc
	/JPuDilO+a8nyxihB+AU/k2lwOXWV+zFV0BXsnc4gcth7UzQJhNjCkN/3tlmiERkYGnwq81Gny4
	akHdEsxZOUhqvAO30cbBRlFckNPxnTiyOJwPpXYf5WZxrVhUOf39DHlbLUi5qg7CuRmDj2QpkC+
	QvKgixtfeM=
X-Received: by 2002:a05:693c:42d3:b0:35b:17b9:ebc8 with SMTP id 5a478bee46e88-35b17b9f562mr1136035eec.19.1791779913496;
        Sun, 11 Oct 2026 21:38:33 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm32823983eec.17.2026.10.11.21.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:38:33 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2 2/6] bind: fix for CVE-2026-10822
Date: Mon, 12 Oct 2026 10:08:17 +0530
Message-ID: <20261012043822.12852-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261012043822.12852-1-hprajapati@mvista.com>
References: <20261012043822.12852-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 04:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247599

Pick patch from [1], [2], [3], [4] & [5] also mentioned at Debian report in [6]

[1] https://github.com/isc-projects/bind9/commit/d413c9ac2e29a728531354a69c8c8234c01b7d1e
[2] https://github.com/isc-projects/bind9/commit/a5f1a9d0d2ec021618924b14202ac96ead8299c1
[3] https://github.com/isc-projects/bind9/commit/e73b70a64453e7d97a11cb5f0afe8bb02d34aaf8
[4] https://github.com/isc-projects/bind9/commit/19ac8b8e46aeb0a15e217bc7bdf485b31b87d9b4
[5] https://github.com/isc-projects/bind9/commit/8e066d3fc369e3346f22bb5cfb67a7ab08a74034
[6] https://security-tracker.debian.org/tracker/CVE-2026-10822

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../bind/bind/CVE-2026-10822-01.patch         |  69 ++++++
 .../bind/bind/CVE-2026-10822-02.patch         |  33 +++
 .../bind/bind/CVE-2026-10822-03.patch         |  35 +++
 .../bind/bind/CVE-2026-10822-04.patch         |  53 +++++
 .../bind/bind/CVE-2026-10822-05.patch         | 223 ++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.18.49.bb |   5 +
 6 files changed, 418 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10822-01.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10822-02.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10822-03.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10822-04.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10822-05.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10822-01.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-01.patch
new file mode 100644
index 0000000000..ab39a0e402
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-01.patch
@@ -0,0 +1,69 @@
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 19 May 2026 10:44:04 +1000
+Subject: Check that dns_name_fromwire honours the active region
+
+When reading DNS records from the wire the active region of the
+source buffer is set to the end of the current record. dns_name_fromwire
+should fail if it attempts to read past this setting.
+
+(cherry picked from commit 3ed821d68b15fe4e6288e3054397d6bce7e65968)
+
+Origin: https://github.com/isc-projects/bind9/commit/d413c9ac2e29a728531354a69c8c8234c01b7d1e
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-10822
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-10822
+
+CVE: CVE-2026-10822
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/d413c9ac2e29a728531354a69c8c8234c01b7d1e]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tests/dns/name_test.c | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/tests/dns/name_test.c b/tests/dns/name_test.c
+index fb34dca..95f6598 100644
+--- a/tests/dns/name_test.c
++++ b/tests/dns/name_test.c
+@@ -335,6 +335,35 @@ ISC_RUN_TEST_IMPL(fromregion) {
+ 	assert_false(dns_name_isabsolute(&name));
+ }
+ 
++ISC_RUN_TEST_IMPL(fromwire) {
++	dns_decompress_t dctx;
++	dns_fixedname_t fixed;
++	dns_name_t *name = dns_fixedname_initname(&fixed);
++	isc_buffer_t b;
++	unsigned char source[] = { 0x03, 'o', 'n', 'e',	 0x00, 0x03,
++				   't',	 'w', 'o', 0x00, 0x05, 't',
++				   'h',	 'r', 'e', 'e',	 0x00 };
++	isc_result_t result;
++
++	isc_buffer_init(&b, source, sizeof(source));
++	isc_buffer_add(&b, sizeof(source));
++	isc_buffer_setactive(&b, 10); /* names 'one.' and 'two.' */
++
++	/*
++	 * We should only be able to read two names from the buffer
++	 * as the active region has been set to cover only the first
++	 * two.
++	 */
++	dns_decompress_init(&dctx, -1, DNS_DECOMPRESS_STRICT);
++	dns_decompress_setmethods(&dctx, DNS_COMPRESS_NONE);
++	result = dns_name_fromwire(name, &b, &dctx, 0, NULL);
++	assert_int_equal(result, ISC_R_SUCCESS);
++	result = dns_name_fromwire(name, &b, &dctx, 0, NULL);
++	assert_int_equal(result, ISC_R_SUCCESS);
++	result = dns_name_fromwire(name, &b, &dctx, 0, NULL);
++	assert_int_not_equal(result, ISC_R_SUCCESS);
++}
++
+ /* is trust-anchor-telemetry test */
+ ISC_RUN_TEST_IMPL(istat) {
+ 	dns_fixedname_t fixed;
+@@ -778,6 +807,7 @@ ISC_TEST_LIST_START
+ ISC_TEST_ENTRY(fullcompare)
+ ISC_TEST_ENTRY(compression)
+ ISC_TEST_ENTRY(fromregion)
++ISC_TEST_ENTRY(fromwire)
+ ISC_TEST_ENTRY(istat)
+ ISC_TEST_ENTRY(init)
+ ISC_TEST_ENTRY(invalidate)
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10822-02.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-02.patch
new file mode 100644
index 0000000000..9e2eb1d903
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-02.patch
@@ -0,0 +1,33 @@
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 19 May 2026 15:00:17 +1000
+Subject: Fix the yaml query zone name code in dnstap-read
+
+When the buffer to read the query zone name was constructed
+isc_buffer_setactive was not called.  This is now needed as
+dns_name_fromwire is being corrected to check the active region.
+
+(cherry picked from commit a25522c28c46655a81d2bf1d96374c81d834b157)
+
+Origin: https://github.com/isc-projects/bind9/commit/a5f1a9d0d2ec021618924b14202ac96ead8299c1
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-10822
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-10822
+
+CVE: CVE-2026-10822
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/a5f1a9d0d2ec021618924b14202ac96ead8299c1]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ bin/tools/dnstap-read.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bin/tools/dnstap-read.c b/bin/tools/dnstap-read.c
+index a1d0243..bb78ae1 100644
+--- a/bin/tools/dnstap-read.c
++++ b/bin/tools/dnstap-read.c
+@@ -298,6 +298,7 @@ print_yaml(dns_dtdata_t *dt) {
+ 
+ 		isc_buffer_init(&b, m->query_zone.data, m->query_zone.len);
+ 		isc_buffer_add(&b, m->query_zone.len);
++		isc_buffer_setactive(&b, m->query_zone.len);
+ 
+ 		dns_decompress_init(&dctx, -1, DNS_DECOMPRESS_NONE);
+ 		result = dns_name_fromwire(name, &b, &dctx, 0, NULL);
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10822-03.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-03.patch
new file mode 100644
index 0000000000..cbd22a8492
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-03.patch
@@ -0,0 +1,35 @@
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 19 May 2026 11:12:46 +1000
+Subject: Fix dns_name_fromwire to honour the active region
+
+dns_name_fromwire was not honouring the source buffer's active
+region when reading names from the wire.  This allowed malformed
+records to be accepted when they shouldn't have been.  This has
+been corrected.
+
+(cherry picked from commit 7c4f07a7ef6b571073327b02209df7f75b9363ff)
+
+Origin: https://github.com/isc-projects/bind9/commit/e73b70a64453e7d97a11cb5f0afe8bb02d34aaf8
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-10822
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-10822
+
+CVE: CVE-2026-10822
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/e73b70a64453e7d97a11cb5f0afe8bb02d34aaf8]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/dns/name.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/dns/name.c b/lib/dns/name.c
+index cc0e30e..2ce868a 100644
+--- a/lib/dns/name.c
++++ b/lib/dns/name.c
+@@ -1833,7 +1833,7 @@ dns_name_fromwire(dns_name_t *const name, isc_buffer_t *const source,
+ 	 * The amount of the source we consumed is set once.
+ 	 */
+ 	const uint8_t *const source_buf = isc_buffer_base(source);
+-	const uint8_t *const source_max = isc_buffer_used(source);
++	const uint8_t *const source_max = isc_buffer_active(source);
+ 	const uint8_t *const start = isc_buffer_current(source);
+ 	const uint8_t *marker = start;
+ 	const uint8_t *cursor = start;
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10822-04.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-04.patch
new file mode 100644
index 0000000000..27e1aa89c7
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-04.patch
@@ -0,0 +1,53 @@
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 19 May 2026 12:03:23 +1000
+Subject: Check that a short PRIVATEDNS record is rejected
+
+A bug in dns_name_fromwire meant that short PRIVATEDNS key
+records where being accepted.  Test that this is no longer
+the case.
+
+(cherry picked from commit f48d48027384d8c2210b5ce9e3eac7af101ead3d)
+
+Origin: https://github.com/isc-projects/bind9/commit/19ac8b8e46aeb0a15e217bc7bdf485b31b87d9b4
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-10822
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-10822
+
+CVE: CVE-2026-10822
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/19ac8b8e46aeb0a15e217bc7bdf485b31b87d9b4]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tests/dns/rdata_test.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/tests/dns/rdata_test.c b/tests/dns/rdata_test.c
+index 6354819..7f0df6e 100644
+--- a/tests/dns/rdata_test.c
++++ b/tests/dns/rdata_test.c
+@@ -2199,6 +2199,27 @@ ISC_RUN_TEST_IMPL(key) {
+ 
+ 	check_rdata(NULL, wire_ok, NULL, false, dns_rdataclass_in,
+ 		    dns_rdatatype_key, sizeof(dns_rdata_key_t));
++
++	/*
++	 * A valid PRIVATEDNS record with an active region shorter than the
++	 * actual record length.  A bug in dns_name_fromwire meant that this
++	 * was previously accepted.
++	 */
++	dns_decompress_t dctx;
++	unsigned char key[] = { 0x00, 0x00, 0x00, 253, 0x07, 'e', 'x',
++				'a',  'm',  'p',  'l', 'e',  0x00 };
++	unsigned char buf[sizeof(key)];
++	isc_buffer_t source, target;
++	isc_result_t result;
++
++	isc_buffer_init(&source, key, sizeof(key));
++	isc_buffer_add(&source, sizeof(key));
++	isc_buffer_setactive(&source, sizeof(key) - 1);
++	isc_buffer_init(&target, buf, sizeof(buf));
++	dns_decompress_init(&dctx, -1, DNS_DECOMPRESS_ANY);
++	result = dns_rdata_fromwire(NULL, dns_rdataclass_in, dns_rdatatype_key,
++				    &source, &dctx, 0, &target);
++	assert_int_not_equal(result, ISC_R_SUCCESS);
+ }
+ 
+ /*
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10822-05.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-05.patch
new file mode 100644
index 0000000000..a4f2b04b9b
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10822-05.patch
@@ -0,0 +1,223 @@
+From: Mark Andrews <marka@isc.org>
+Date: Fri, 5 Jun 2026 09:18:30 +1000
+Subject: POC for PRIVATEDNS DNSKEY overrun not being detected
+
+Construct a DNS message where a PRIVATEDNS DNSKEY identifier
+overruns the record boundary by 3 byte so that the label ends
+at the end of the compression pointer for the next record. The
+next type is less than 256 so the next octet is 00 terminating
+the identifier name.  The transfered zone is then written to
+disk using master-format text triggering the assertion when the
+truncated identier is discovered.
+
+Note this test will produce a false result in versions of
+BIND that do not check the PRIVATEDNS identifier as it looks
+for the error message when the transfer is aborted.
+
+(cherry picked from commit 9ce3bce8bc8b4e9c6a9b1e84b5849c33eb27830e)
+
+Origin: https://github.com/isc-projects/bind9/commit/8e066d3fc369e3346f22bb5cfb67a7ab08a74034
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-10822
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-10822
+
+CVE: CVE-2026-10822
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/8e066d3fc369e3346f22bb5cfb67a7ab08a74034]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ bin/tests/system/xfer/ans9/ans.py       | 142 ++++++++++++++++++++++++++++++++
+ bin/tests/system/xfer/ns6/named.conf.in |   9 ++
+ bin/tests/system/xfer/tests.sh          |  16 ++++
+ 3 files changed, 167 insertions(+)
+ create mode 100644 bin/tests/system/xfer/ans9/ans.py
+
+diff --git a/bin/tests/system/xfer/ans9/ans.py b/bin/tests/system/xfer/ans9/ans.py
+new file mode 100644
+index 0000000..a9e7395
+--- /dev/null
++++ b/bin/tests/system/xfer/ans9/ans.py
+@@ -0,0 +1,142 @@
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
++import dns.name
++import dns.rcode
++import dns.rdatatype
++import dns.rrset
++
++from isctest.asyncserver import (
++    ControllableAsyncDnsServer,
++    DnsResponseSend,
++    DomainHandler,
++    QueryContext,
++    ResponseAction,
++    ToggleResponsesCommand,
++)
++
++
++class AXFRServer(DomainHandler):
++    """
++    Yield SOA and AXFR responses. Every new AXFR response increments the SOA
++    version.
++    """
++
++    domains = ["xfr-and-reconfig", "private-dns-overrun"]
++
++    def __init__(self) -> None:
++        super().__init__()
++        self.soa_version = 0
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[ResponseAction, None]:
++        # This is oversimplified because I am lazy - we are appending the SOA
++        # RRset to the ANSWER section for _every_ QTYPE.  named is only
++        # expected to send a SOA query over UDP and then an AXFR query over
++        # TCP.  Responses to both of those start with a SOA RRset in the ANSWER
++        # section :-)
++        soa_message = qctx.response
++        soa_rrset = dns.rrset.from_text(
++            qctx.qname,
++            300,
++            qctx.qclass,
++            dns.rdatatype.SOA,
++            f". . {self.soa_version} 0 0 0 0",
++        )
++        soa_message.answer.append(soa_rrset)
++
++        yield DnsResponseSend(soa_message)
++
++        if qctx.qtype == dns.rdatatype.SOA:
++            # If QTYPE=SOA, the SOA record is the complete response.
++            return
++
++        if qctx.qtype != dns.rdatatype.AXFR:
++            # If QTYPE=AXFR, we will continue cramming RRsets into the ANSWER
++            # section of a subsequent DNS message below.
++            #
++            # If QTYPE was not SOA or AXFR, abort.  Yeah, we just sent a broken
++            # response by yielding DnsResponseSend() with a SOA RRset in the
++            # ANSWER section above.  We will have to carry that burden for the
++            # rest of our lives.
++            return
++
++        # Send just the obligatory NS RRset at zone apex in the next message.
++        # This is stupidly inefficient, but makes looping below simpler as we
++        # will already have been done with the mandatory stuff by then.
++        ns_message = qctx.prepare_new_response()
++        ns_rrset = dns.rrset.from_text(
++            qctx.qname, 300, qctx.qclass, dns.rdatatype.NS, "."
++        )
++        ns_message.answer.append(ns_rrset)
++
++        yield DnsResponseSend(ns_message)
++
++        # Generate the AXFR with a txt rrset.
++        txt_message = qctx.prepare_new_response()
++        txt_rrset = dns.rrset.from_text(
++            qctx.qname,
++            300,
++            qctx.qclass,
++            dns.rdatatype.TXT,
++            "foo bar",
++        )
++        txt_message.answer.append(txt_rrset)
++
++        yield DnsResponseSend(txt_message)
++
++        if qctx.qname == dns.name.from_text("private-dns-overrun"):
++            # A message where the malformed DNSKEY algorithm identifier
++            # finishes on a 00 byte in the next record. Assumes the
++            # next record starts with a compression pointer which is
++            # followed by the type which starts with 00.
++
++            # Generate malformed PRIVATE DNS DNSKEY
++            dnskey_message = qctx.prepare_new_response()
++            dnskey_rrset = dns.rrset.from_text(
++                qctx.qname,
++                300,
++                qctx.qclass,
++                dns.rdatatype.DNSKEY,
++                "\\# 12 00 00 00 fd 09 00 00 00 00 00 00 00",
++            )
++            dnskey_message.answer.append(dnskey_rrset)
++            # Generate well formed PRIVATE DNS DNSKEY
++            dnskey_rrset = dns.rrset.from_text(
++                qctx.qname,
++                300,
++                qctx.qclass,
++                dns.rdatatype.DNSKEY,
++                "\\# 12 00 00 00 fd 06 00 00 00 00 00 00 00",
++            )
++            dnskey_message.answer.append(dnskey_rrset)
++
++            yield DnsResponseSend(dnskey_message)
++
++        # Finish the AXFR transaction by sending the second SOA RRset.
++        yield DnsResponseSend(soa_message)
++
++        # This makes sure that the next SOA request causes a new zone transfer
++        self.soa_version += 1
++
++
++if __name__ == "__main__":
++    server = ControllableAsyncDnsServer(
++        default_aa=True, default_rcode=dns.rcode.NOERROR
++    )
++    server.install_control_command(ToggleResponsesCommand())
++    server.install_response_handler(AXFRServer())
++    server.run()
+diff --git a/bin/tests/system/xfer/ns6/named.conf.in b/bin/tests/system/xfer/ns6/named.conf.in
+index 142383c..6380944 100644
+--- a/bin/tests/system/xfer/ns6/named.conf.in
++++ b/bin/tests/system/xfer/ns6/named.conf.in
+@@ -83,3 +83,12 @@ zone "ixfr-too-big" {
+ 	primaries { 10.53.0.1; };
+ 	file "ixfr-too-big.bk";
+ };
++
++# GL#6004
++zone "private-dns-overrun" {
++	type secondary;
++	primaries { 10.53.0.9; };
++	file "private-dns-overrun.bk";
++	masterfile-format text; # force bug to be exercised
++	request-ixfr no; # ans9 supports only axfr
++};
+diff --git a/bin/tests/system/xfer/tests.sh b/bin/tests/system/xfer/tests.sh
+index a2c0adb..e08be17 100755
+--- a/bin/tests/system/xfer/tests.sh
++++ b/bin/tests/system/xfer/tests.sh
+@@ -622,5 +622,21 @@ if [ $tmp -eq 0 ]; then
+ fi
+ status=$((status + tmp))
+ 
++# def test_malformed_private_dns_identifier_overrun(ns6):
++#    isctest.log.info(
++#        "Check that a malformed PRIVATEDNS DNSKEY which overruns the record is rejected"
++#    )
++#    with ns6.watch_log_from_start(timeout=60) as watcher_transfer_completed:
++#        watcher_transfer_completed.wait_for_line(
++#            "zone private-dns-overrun/IN: zone transfer finished: unexpected end of input"
++#        )
++n=$((n + 1))
++echo_i "Check that a malformed PRIVATEDNS DNSKEY which overruns the record is rejected ($n)"
++tmp=0
++nextpartreset ns6/named.run
++retry 60 wait_for_message "zone private-dns-overrun/IN: zone transfer finished: unexpected end of input" || tmp=1
++if test $tmp != 0; then echo_i "failed"; fi
++status=$((status + tmp))
++
+ echo_i "exit status: $status"
+ [ $status -eq 0 ] || exit 1
diff --git a/meta/recipes-connectivity/bind/bind_9.18.49.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
index 161736f9b1..42007383c4 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.49.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -21,6 +21,11 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2026-10723-01.patch \
            file://CVE-2026-10723-02.patch \
            file://CVE-2026-10723-03.patch \
+           file://CVE-2026-10822-01.patch \
+           file://CVE-2026-10822-02.patch \
+           file://CVE-2026-10822-03.patch \
+           file://CVE-2026-10822-04.patch \
+           file://CVE-2026-10822-05.patch \
            "
 
 SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
-- 
2.50.1


