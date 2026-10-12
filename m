Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811E2CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 04:38:46 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6727.1791779912419854449
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 21:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YRrmmW1j;
 spf=pass (domain: mvista.com, ip: 74.125.82.174, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso3819515eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 21:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791779912; x=1792384712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=19KaB6o5J4ZFlkGRXJnYd33SeWh2JmbzHCC9LjXtXAM=;
        b=YRrmmW1jLjJ92l5QMX6TgBOIRov3ZKcV5PPZVhPh5nV5HXYskxtbHICVkhi3RCn9/M
         ScWtbHMdJfO9p+MhUu4hUnUegigFbyTnycppVO5Eh0jMoJbuw2EYfzwo1yGmFNR7+4Jp
         ZryZJi1rQclqrw2B9yDLVoms/fEuZTIzx4EGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779912; x=1792384712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19KaB6o5J4ZFlkGRXJnYd33SeWh2JmbzHCC9LjXtXAM=;
        b=OPcDTVBd5gpybNOWQXMhJL/Xw6WWvwou21KNYshHx97VVquOlj4PdtSkMGUvTsiAek
         HVxlZ4b4h9vyqEY4KozkW+2C3sgkSfTCIkxSAFhFLF3BwVuaPSRyltSdVs0sTUz58Ph4
         Zn7Tx7u0A+z48M2mi0j1EjxMFV3iVclc6t/HypyROwowHPNeXMCru/ANu87LYaY4oRn/
         pSZ/VhLEpLFuXjEY8nrQNst/JmDReV3v1h5DxgtB2sQbQubl3Ky0CMB8WCft2fBA0YRC
         Z0vob5phc77Q9xl1O6+Snup70UKTohmOifxFkKbpzPL+5FIFCZLkm4z8hF/TU6lK09zx
         Ip5A==
X-Gm-Message-State: AFq9FYKIr03T0mfIxJA1BFgFi6kYkRGQKFP7G622YcxXIFtKoJdwysk1
	jl+MOysMMHfXtb+4pIlm2hGAcisehhShlqbTVNGNKt379i5dBa6NPYje5CCqICBCgZrDPCMkOWA
	B4Mi1
X-Gm-Gg: AYBFou0KO2P0dMvOPh6SUf7F88UjKvgCZ8p1iJFy98JD57jPYWTw/S0mxhivsXj55qs
	32JL8Rj0LaIi4biuPhsRiCo/pRdrrk9FI+CwoRD61J/4Lxb5t5DyswkfnxZZzq5vpgteTWDK24w
	7TiCDYEBZ00106XAHMKMQrsjGAEmGaUi2Y9z09JOEUsuYzYHjL3c8ZyEjidQCJDoltHQkWe3m1X
	MLaKXpouXpczzZ0zdXbUN12Aa1coqgFBrtLC79ZFlTaAhDNB9l2fbrSOsxy6S6gYFp+ZzGLNPIm
	Ytg015yWRgo1zc8nRQ2PQI0YfS/Ypxm5RUhbhyMTrl/KGWPO5uia87nOLiTKLoDVhVtEqxs/3JQ
	zP7td/UeGTICsGwwQH3FY3qxGryqKhZJ3Qn9muL2koer7dHUtLOZxHsA3wOWkiKF1+dtjResUMs
	KNUUgLtUy5lEAfdjpGZso2/M7zbuWkQgnn4i5j2VQzvwSViI4K/axluaMgPMFoKRL9/q5mS0Xbe
	4RWEh8QheY=
X-Received: by 2002:a05:7301:7d06:b0:351:4d03:c6a with SMTP id 5a478bee46e88-3537df51463mr10451360eec.12.1791779911199;
        Sun, 11 Oct 2026 21:38:31 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm32823983eec.17.2026.10.11.21.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:38:30 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2 1/6] bind: fix for CVE-2026-10723
Date: Mon, 12 Oct 2026 10:08:16 +0530
Message-ID: <20261012043822.12852-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 04:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247598

Pick patch from [1], [2] & [3] also mentioned at Debian report in [4]

[1] https://github.com/isc-projects/bind9/commit/c9cb6a5e24e43489cf3fd4d4cc2193b6a74499cb
[2] https://github.com/isc-projects/bind9/commit/35e3d49d2222c13786a06021c7ed583d2a656e51
[3] https://github.com/isc-projects/bind9/commit/833dd3b230b92596074e8da15b12298f46c939f2
[4] https://security-tracker.debian.org/tracker/CVE-2026-10723

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../bind/bind/CVE-2026-10723-01.patch         |  70 +++
 .../bind/bind/CVE-2026-10723-02.patch         | 496 ++++++++++++++++++
 .../bind/bind/CVE-2026-10723-03.patch         | 310 +++++++++++
 .../recipes-connectivity/bind/bind_9.18.49.bb |   3 +
 4 files changed, 879 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10723-01.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10723-03.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10723-01.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-01.patch
new file mode 100644
index 0000000000..e1c82392f2
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-01.patch
@@ -0,0 +1,70 @@
+From: Evan Hunt <each@isc.org>
+Date: Thu, 21 May 2026 14:41:55 -0700
+Subject: Check NSEC3 signer matches the owning zone
+
+When validating NSEC3 records, reject any signature whose signer field
+does not match the zone owning the NSEC3.
+
+This ensures that a child zone cannot impersonate its parent and forge
+NXDOMAIN responses for sibling domains.
+
+Fixes: isc-projects/bind9#5874
+(cherry picked from commit 6e5066bb1f0f12d090e8707adb7d6ccf74f8012b)
+
+Origin: https://github.com/isc-projects/bind9/commit/c9cb6a5e24e43489cf3fd4d4cc2193b6a74499cb
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-10723
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-10723
+
+CVE: CVE-2026-10723
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/c9cb6a5e24e43489cf3fd4d4cc2193b6a74499cb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/dns/dnssec.c | 19 +++++++++++++++++--
+ lib/isc/result.c |  2 +-
+ 2 files changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/lib/dns/dnssec.c b/lib/dns/dnssec.c
+index c7e9224..1725de3 100644
+--- a/lib/dns/dnssec.c
++++ b/lib/dns/dnssec.c
+@@ -404,10 +404,25 @@ dns_dnssec_verify(const dns_name_t *name, dns_rdataset_t *set, dst_key_t *key,
+ 	}
+ 
+ 	/*
+-	 * NS, SOA and DNSKEY records are signed by their owner.
+-	 * DS records are signed by the parent.
++	 * NS, SOA and DNSKEY records are signed by their owners.
++	 * NSEC3 records are signed by the apex, exactly one level up
++	 * from their owner names.
++	 * DS records are signed by the parent zone.
+ 	 */
+ 	switch (set->type) {
++	case dns_rdatatype_nsec3: {
++		dns_name_t apex = DNS_NAME_INITEMPTY;
++		labels = dns_name_countlabels(name);
++		if (labels <= 1) {
++			inc_stat(dns_dnssecstats_fail);
++			return DNS_R_INVALIDNSEC3;
++		}
++		dns_name_split(name, labels - 1, NULL, &apex);
++		if (!dns_name_equal(&apex, &sig.signer)) {
++			inc_stat(dns_dnssecstats_fail);
++			return DNS_R_SIGINVALID;
++		}
++	} break;
+ 	case dns_rdatatype_ns:
+ 	case dns_rdatatype_soa:
+ 	case dns_rdatatype_dnskey:
+diff --git a/lib/isc/result.c b/lib/isc/result.c
+index dbd0431..f78e689 100644
+--- a/lib/isc/result.c
++++ b/lib/isc/result.c
+@@ -198,7 +198,7 @@ static const char *description[ISC_R_NRESULTS] = {
+ 	[DNS_R_COVERINGNSEC] = "covering NSEC record returned",
+ 	[DNS_R_MXISADDRESS] = "MX is an address",
+ 	[DNS_R_DUPLICATE] = "duplicate query",
+-	[DNS_R_INVALIDNSEC3] = "invalid NSEC3 owner name (wildcard)",
++	[DNS_R_INVALIDNSEC3] = "invalid NSEC3 owner name",
+ 	[DNS_R_NOTPRIMARY] = "not primary",
+ 	[DNS_R_BROKENCHAIN] = "broken trust chain",
+ 	[DNS_R_EXPIRED] = "expired",
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch
new file mode 100644
index 0000000000..b2ecf1a669
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch
@@ -0,0 +1,496 @@
+From: Alessio Podda <alessio@isc.org>
+Date: Wed, 3 Jun 2026 10:42:43 +0200
+Subject: Reproducer for #5874 NSEC3 impersonation
+
+LLM generated.
+
+(cherry picked from commit f3e2eb333be3ac636f745aa13cfb8d9ee8af87d8)
+
+Origin: https://github.com/isc-projects/bind9/commit/35e3d49d2222c13786a06021c7ed583d2a656e51
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-10723
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-10723
+
+CVE: CVE-2026-10723
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/35e3d49d2222c13786a06021c7ed583d2a656e51]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .../ans1/ans.py}                                   |   8 +-
+ .../repro_5874_nsec3_parent/ns2/named.conf.j2      |  35 +++
+ bin/tests/system/repro_5874_nsec3_parent/server.py | 249 +++++++++++++++++++++
+ .../tests_repro_5874_nsec3_parent.py               | 144 ++++++++++++
+ 4 files changed, 433 insertions(+), 3 deletions(-)
+ copy bin/tests/system/{glue/setup.sh => repro_5874_nsec3_parent/ans1/ans.py} (83%)
+ create mode 100644 bin/tests/system/repro_5874_nsec3_parent/ns2/named.conf.j2
+ create mode 100644 bin/tests/system/repro_5874_nsec3_parent/server.py
+ create mode 100644 bin/tests/system/repro_5874_nsec3_parent/tests_repro_5874_nsec3_parent.py
+
+diff --git a/bin/tests/system/glue/setup.sh b/bin/tests/system/repro_5874_nsec3_parent/ans1/ans.py
+similarity index 83%
+copy from bin/tests/system/glue/setup.sh
+copy to bin/tests/system/repro_5874_nsec3_parent/ans1/ans.py
+index 82240a7..614f26a 100644
+--- a/bin/tests/system/glue/setup.sh
++++ b/bin/tests/system/repro_5874_nsec3_parent/ans1/ans.py
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/usr/bin/python3
+ 
+ # Copyright (C) Internet Systems Consortium, Inc. ("ISC")
+ #
+@@ -11,6 +11,8 @@
+ # See the COPYRIGHT file distributed with this work for additional
+ # information regarding copyright ownership.
+ 
+-. ../conf.sh
++from server import main
+ 
+-copy_setports ns1/named.conf.in ns1/named.conf
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/repro_5874_nsec3_parent/ns2/named.conf.j2 b/bin/tests/system/repro_5874_nsec3_parent/ns2/named.conf.j2
+new file mode 100644
+index 0000000..9358866
+--- /dev/null
++++ b/bin/tests/system/repro_5874_nsec3_parent/ns2/named.conf.j2
+@@ -0,0 +1,35 @@
++// validating resolver
++
++options {
++	query-source address 10.53.0.2;
++	notify-source 10.53.0.2;
++	transfer-source 10.53.0.2;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.2; };
++	listen-on-v6 { none; };
++	recursion yes;
++	dnssec-validation yes;
++	trust-anchor-telemetry no;
++	resolver-query-timeout 5000;
++};
++
++controls {
++	inet 10.53.0.2 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
++};
++
++include "../../_common/rndc.key";
++
++zone "." {
++	type hint;
++	file "../../_common/root.hint";
++};
++
++zone "tld.test" {
++	type static-stub;
++	server-addresses { 10.53.0.1; };
++};
++
++trust-anchors {
++	tld.test. static-key 257 3 13 "@TLD_DNSKEY@";
++};
+diff --git a/bin/tests/system/repro_5874_nsec3_parent/server.py b/bin/tests/system/repro_5874_nsec3_parent/server.py
+new file mode 100644
+index 0000000..c6856bb
+--- /dev/null
++++ b/bin/tests/system/repro_5874_nsec3_parent/server.py
+@@ -0,0 +1,249 @@
++#!/usr/bin/python3
++
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
++from dataclasses import dataclass
++from pathlib import Path
++
++import json
++
++from cryptography.hazmat.primitives import serialization
++
++import dns.dnssec
++import dns.flags
++import dns.message
++import dns.name
++import dns.rdata
++import dns.rdataclass
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
++TTL = 300
++TLD = "tld.test."
++APEX_HASH = "1B40241KFORIOG780N4IKSCRLVETPCTQ"
++ATTACKER = f"{APEX_HASH.lower()}.{TLD}"
++VICTIM = f"victim.{TLD}"
++AUTH_IP = "10.53.0.1"
++
++
++@dataclass(frozen=True)
++class Key:
++    zone: dns.name.Name
++    private_key: object
++    dnskey: dns.rdata.Rdata
++    ds: dns.rdata.Rdata
++
++
++def name(text: str) -> dns.name.Name:
++    return dns.name.from_text(text)
++
++
++def load_keys() -> dict[str, Key]:
++    path = Path(__file__).resolve().parent / "keys.json"
++    with path.open(encoding="utf-8") as keys_file:
++        raw_keys = json.load(keys_file)
++
++    keys = {}
++    for zone, raw_key in raw_keys.items():
++        private_key = serialization.load_pem_private_key(
++            raw_key["private_pem"].encode("ascii"),
++            password=None,
++        )
++        dnskey = dns.rdata.from_text(
++            dns.rdataclass.IN, dns.rdatatype.DNSKEY, raw_key["dnskey"]
++        )
++        ds = dns.rdata.from_text(dns.rdataclass.IN, dns.rdatatype.DS, raw_key["ds"])
++        keys[zone] = Key(name(zone), private_key, dnskey, ds)
++
++    return keys
++
++
++def rrset(owner: str, rdtype: dns.rdatatype.RdataType, *rdatas: str) -> dns.rrset.RRset:
++    return dns.rrset.from_text(owner, TTL, dns.rdataclass.IN, rdtype, *rdatas)
++
++
++def rrset_from_rdata(owner: str, rdata: dns.rdata.Rdata) -> dns.rrset.RRset:
++    return dns.rrset.from_rdata(name(owner), TTL, rdata)
++
++
++def rrsig_rrset(covered: dns.rrset.RRset, signer: Key) -> dns.rrset.RRset:
++    rrsig = dns.dnssec.sign(
++        covered,
++        signer.private_key,
++        signer.zone,
++        signer.dnskey,
++        lifetime=86400,
++        verify=True,
++    )
++    return dns.rrset.from_rdata(covered.name, covered.ttl, rrsig)
++
++
++def add_signed(
++    section: list[dns.rrset.RRset], covered: dns.rrset.RRset, signer: Key
++) -> None:
++    section.append(covered)
++    section.append(rrsig_rrset(covered, signer))
++
++
++def dnskey_rrset(zone: str, zone_key: Key) -> dns.rrset.RRset:
++    return rrset_from_rdata(zone, zone_key.dnskey)
++
++
++def ds_rrset(zone: str, zone_key: Key) -> dns.rrset.RRset:
++    return rrset_from_rdata(zone, zone_key.ds)
++
++
++def soa_rrset(zone: str) -> dns.rrset.RRset:
++    return rrset(
++        zone,
++        dns.rdatatype.SOA,
++        f"ns.{zone} hostmaster.{zone} 1 3600 600 86400 300",
++    )
++
++
++def ns_rrset(zone: str, ns_target: str) -> dns.rrset.RRset:
++    return rrset(zone, dns.rdatatype.NS, ns_target)
++
++
++def glue_rrset(ns_target: str, address: str) -> dns.rrset.RRset:
++    return rrset(ns_target, dns.rdatatype.A, address)
++
++
++def answer_dnskey(response: dns.message.Message, zone: str, zone_key: Key) -> None:
++    add_signed(response.answer, dnskey_rrset(zone, zone_key), zone_key)
++
++
++def answer_soa(response: dns.message.Message, zone: str, zone_key: Key) -> None:
++    add_signed(response.answer, soa_rrset(zone), zone_key)
++
++
++def answer_ns(
++    response: dns.message.Message, zone: str, ns_target: str, zone_key: Key
++) -> None:
++    add_signed(response.answer, ns_rrset(zone, ns_target), zone_key)
++
++
++def answer_ds(
++    response: dns.message.Message, zone: str, child_key: Key, parent_key: Key
++) -> None:
++    add_signed(response.answer, ds_rrset(zone, child_key), parent_key)
++
++
++def child_nsec3_rrset() -> dns.rrset.RRset:
++    rdata = dns.rdata.from_text(
++        dns.rdataclass.IN,
++        dns.rdatatype.NSEC3,
++        f"1 0 0 - {APEX_HASH} NS SOA RRSIG DNSKEY NSEC3PARAM",
++    )
++    return dns.rrset.from_rdata(name(f"{APEX_HASH}.{TLD}"), TTL, rdata)
++
++
++def forged_nxdomain(response: dns.message.Message, keys: dict[str, Key]) -> None:
++    response.set_rcode(dns.rcode.NXDOMAIN)
++
++    add_signed(response.authority, soa_rrset(TLD), keys[TLD])
++
++    # The owner name derives zone "tld.test.", but the RRSIG signer is the
++    # secure child zone "1b40241kforiog780n4ikscrlvetpctq.tld.test.".
++    add_signed(response.authority, child_nsec3_rrset(), keys[ATTACKER])
++
++
++class SignedResponseHandler(ResponseHandler):
++    def __init__(self, keys: dict[str, Key]) -> None:
++        self.keys = keys
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[DnsResponseSend, None]:
++        qctx.prepare_new_response(with_zone_data=False)
++        qctx.response.flags |= dns.flags.AA
++        qctx.response.set_rcode(dns.rcode.NOERROR)
++        self.respond(qctx)
++        yield DnsResponseSend(qctx.response, authoritative=True)
++
++    def respond(self, qctx: QueryContext) -> None:
++        raise NotImplementedError
++
++
++class VictimForgedNxdomainHandler(SignedResponseHandler):
++    def match(self, qctx: QueryContext) -> bool:
++        return qctx.qname == name(VICTIM) and qctx.qtype == dns.rdatatype.A
++
++    def respond(self, qctx: QueryContext) -> None:
++        forged_nxdomain(qctx.response, self.keys)
++
++
++class ChildDsHandler(SignedResponseHandler):
++    def match(self, qctx: QueryContext) -> bool:
++        return qctx.qname == name(ATTACKER) and qctx.qtype == dns.rdatatype.DS
++
++    def respond(self, qctx: QueryContext) -> None:
++        answer_ds(qctx.response, ATTACKER, self.keys[ATTACKER], self.keys[TLD])
++
++
++class AttackerZoneHandler(SignedResponseHandler):
++    def match(self, qctx: QueryContext) -> bool:
++        return qctx.qname.is_subdomain(name(ATTACKER))
++
++    def respond(self, qctx: QueryContext) -> None:
++        if qctx.qname == name(ATTACKER):
++            if qctx.qtype == dns.rdatatype.DNSKEY:
++                answer_dnskey(qctx.response, ATTACKER, self.keys[ATTACKER])
++            elif qctx.qtype == dns.rdatatype.SOA:
++                answer_soa(qctx.response, ATTACKER, self.keys[ATTACKER])
++            else:
++                answer_ns(qctx.response, ATTACKER, f"ns.{ATTACKER}", self.keys[ATTACKER])
++                qctx.response.additional.append(glue_rrset(f"ns.{ATTACKER}", AUTH_IP))
++            return
++
++        qctx.response.set_rcode(dns.rcode.NXDOMAIN)
++        add_signed(qctx.response.authority, soa_rrset(ATTACKER), self.keys[ATTACKER])
++
++
++class TldZoneHandler(SignedResponseHandler):
++    def match(self, qctx: QueryContext) -> bool:
++        return qctx.qname.is_subdomain(name(TLD))
++
++    def respond(self, qctx: QueryContext) -> None:
++        if qctx.qname == name(TLD):
++            if qctx.qtype == dns.rdatatype.DNSKEY:
++                answer_dnskey(qctx.response, TLD, self.keys[TLD])
++            elif qctx.qtype == dns.rdatatype.SOA:
++                answer_soa(qctx.response, TLD, self.keys[TLD])
++            else:
++                answer_ns(qctx.response, TLD, "ns.tld.test.", self.keys[TLD])
++                qctx.response.additional.append(glue_rrset("ns.tld.test.", AUTH_IP))
++            return
++
++        qctx.response.set_rcode(dns.rcode.NXDOMAIN)
++        add_signed(qctx.response.authority, soa_rrset(TLD), self.keys[TLD])
++
++
++def main() -> None:
++    keys = load_keys()
++    server = AsyncDnsServer(default_aa=True)
++    server.install_response_handlers(
++        VictimForgedNxdomainHandler(keys),
++        ChildDsHandler(keys),
++        AttackerZoneHandler(keys),
++        TldZoneHandler(keys),
++    )
++    server.run()
+diff --git a/bin/tests/system/repro_5874_nsec3_parent/tests_repro_5874_nsec3_parent.py b/bin/tests/system/repro_5874_nsec3_parent/tests_repro_5874_nsec3_parent.py
+new file mode 100644
+index 0000000..5fbeff5
+--- /dev/null
++++ b/bin/tests/system/repro_5874_nsec3_parent/tests_repro_5874_nsec3_parent.py
+@@ -0,0 +1,144 @@
++#!/usr/bin/python3
++
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
++from pathlib import Path
++
++import json
++
++from cryptography.hazmat.primitives import serialization
++from cryptography.hazmat.primitives.asymmetric import ec
++
++import dns.dnssec
++import dns.flags
++import dns.name
++import dns.rdataclass
++import dns.rdatatype
++import pytest
++
++import isctest
++
++APEX_HASH = "1B40241KFORIOG780N4IKSCRLVETPCTQ"
++ATTACKER = f"{APEX_HASH.lower()}.tld.test."
++VICTIM = "victim.tld.test."
++AUTH = "10.53.0.1"
++RESOLVER = "10.53.0.2"
++
++pytestmark = pytest.mark.extra_artifacts(
++    [
++        "ans*/ans.run",
++        "keys.json",
++    ]
++)
++
++
++def _make_key(zone):
++    private_key = ec.generate_private_key(ec.SECP256R1())
++    dnskey = dns.dnssec.make_dnskey(
++        private_key.public_key(),
++        algorithm="ECDSAP256SHA256",
++        flags=257,
++    )
++    ds = dns.dnssec.make_ds(dns.name.from_text(zone), dnskey, "SHA256")
++    private_pem = private_key.private_bytes(
++        encoding=serialization.Encoding.PEM,
++        format=serialization.PrivateFormat.PKCS8,
++        encryption_algorithm=serialization.NoEncryption(),
++    ).decode("ascii")
++    return {
++        "private_pem": private_pem,
++        "dnskey": dnskey.to_text(),
++        "ds": ds.to_text(),
++    }
++
++
++def bootstrap():
++    zones = ["tld.test.", ATTACKER]
++    keys = {zone: _make_key(zone) for zone in zones}
++
++    Path("keys.json").write_text(json.dumps(keys, indent=2), encoding="ascii")
++
++    tld_dnskey = "".join(keys["tld.test."]["dnskey"].split()[3:])
++    return {"TLD_DNSKEY": tld_dnskey}
++
++
++def _check_direct_dnskey_response(zone):
++    query = isctest.query.create(zone, "DNSKEY")
++    response = isctest.query.tcp(query, AUTH)
++
++    isctest.check.noerror(response)
++    assert response.flags & dns.flags.AA
++    assert (
++        response.get_rrset(
++            response.answer,
++            dns.name.from_text(zone),
++            dns.rdataclass.IN,
++            dns.rdatatype.DNSKEY,
++        )
++        is not None
++    ), response
++
++
++def _check_direct_ds_response(zone):
++    query = isctest.query.create(zone, "DS")
++    response = isctest.query.tcp(query, AUTH)
++
++    isctest.check.noerror(response)
++    assert response.flags & dns.flags.AA
++    assert (
++        response.get_rrset(
++            response.answer,
++            dns.name.from_text(zone),
++            dns.rdataclass.IN,
++            dns.rdatatype.DS,
++        )
++        is not None
++    ), response
++
++
++def test_repro_5874_direct_forged_nsec3_response_has_child_signer():
++    _check_direct_dnskey_response("tld.test.")
++    _check_direct_dnskey_response(ATTACKER)
++    _check_direct_ds_response(ATTACKER)
++
++    query = isctest.query.create(VICTIM, "A")
++    response = isctest.query.tcp(query, AUTH)
++
++    isctest.check.nxdomain(response)
++    assert response.flags & dns.flags.AA
++
++    nsec3_owner = dns.name.from_text(f"{APEX_HASH}.tld.test.")
++    nsec3 = response.get_rrset(
++        response.authority,
++        nsec3_owner,
++        dns.rdataclass.IN,
++        dns.rdatatype.NSEC3,
++    )
++    rrsig = response.get_rrset(
++        response.authority,
++        nsec3_owner,
++        dns.rdataclass.IN,
++        dns.rdatatype.RRSIG,
++        covers=dns.rdatatype.NSEC3,
++    )
++
++    assert nsec3 is not None, response
++    assert rrsig is not None, response
++    assert rrsig[0].signer == dns.name.from_text(ATTACKER)
++
++
++def test_repro_5874_resolver_rejects_child_signed_nsec3_parent_proof():
++    query = isctest.query.create(VICTIM, "A")
++    response = isctest.query.tcp(query, RESOLVER)
++
++    isctest.check.servfail(response)
++    isctest.check.noadflag(response)
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10723-03.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-03.patch
new file mode 100644
index 0000000000..97d3bc81ea
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-03.patch
@@ -0,0 +1,310 @@
+From: Matthijs Mekking <matthijs@isc.org>
+Date: Thu, 4 Jun 2026 16:12:50 +0200
+Subject: Update reproducer #5874
+
+Update the llm generated reproducer:
+- Move server.py into ans1/ans.py
+- Remove unnecessary named.conf configuration options
+- Add comments describing the steps (copied from GL issue)
+- Rename system test
+
+(cherry picked from commit c1321fef165a2ef8c2bff971901c58941e8e694c)
+
+Origin: https://github.com/isc-projects/bind9/commit/833dd3b230b92596074e8da15b12298f46c939f2
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-10723
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-10723
+
+CVE: CVE-2026-10723
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/833dd3b230b92596074e8da15b12298f46c939f2]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .../server.py => nsec3_impersonation/ans1/ans.py}  | 81 +++++++++++++++-------
+ .../ns2/named.conf.j2                              |  2 -
+ .../tests_nsec3_impersonation.py}                  | 38 ++++++----
+ .../system/repro_5874_nsec3_parent/ans1/ans.py     | 18 -----
+ 4 files changed, 79 insertions(+), 60 deletions(-)
+ rename bin/tests/system/{repro_5874_nsec3_parent/server.py => nsec3_impersonation/ans1/ans.py} (83%)
+ rename bin/tests/system/{repro_5874_nsec3_parent => nsec3_impersonation}/ns2/named.conf.j2 (90%)
+ rename bin/tests/system/{repro_5874_nsec3_parent/tests_repro_5874_nsec3_parent.py => nsec3_impersonation/tests_nsec3_impersonation.py} (84%)
+ delete mode 100644 bin/tests/system/repro_5874_nsec3_parent/ans1/ans.py
+
+diff --git a/bin/tests/system/repro_5874_nsec3_parent/server.py b/bin/tests/system/nsec3_impersonation/ans1/ans.py
+similarity index 83%
+rename from bin/tests/system/repro_5874_nsec3_parent/server.py
+rename to bin/tests/system/nsec3_impersonation/ans1/ans.py
+index c6856bb..177e79c 100644
+--- a/bin/tests/system/repro_5874_nsec3_parent/server.py
++++ b/bin/tests/system/nsec3_impersonation/ans1/ans.py
+@@ -23,9 +23,9 @@ import dns.dnssec
+ import dns.flags
+ import dns.message
+ import dns.name
++import dns.rcode
+ import dns.rdata
+ import dns.rdataclass
+-import dns.rcode
+ import dns.rdatatype
+ import dns.rrset
+ 
+@@ -141,10 +141,21 @@ def answer_ns(
+     add_signed(response.answer, ns_rrset(zone, ns_target), zone_key)
+ 
+ 
+-def answer_ds(
+-    response: dns.message.Message, zone: str, child_key: Key, parent_key: Key
+-) -> None:
+-    add_signed(response.answer, ds_rrset(zone, child_key), parent_key)
++class SignedResponseHandler(ResponseHandler):
++    def __init__(self, keys: dict[str, Key]) -> None:
++        self.keys = keys
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[DnsResponseSend, None]:
++        qctx.prepare_new_response(with_zone_data=False)
++        qctx.response.flags |= dns.flags.AA
++        qctx.response.set_rcode(dns.rcode.NOERROR)
++        self.respond(qctx)
++        yield DnsResponseSend(qctx.response, authoritative=True)
++
++    def respond(self, qctx: QueryContext) -> None:
++        raise NotImplementedError
+ 
+ 
+ def child_nsec3_rrset() -> dns.rrset.RRset:
+@@ -162,28 +173,15 @@ def forged_nxdomain(response: dns.message.Message, keys: dict[str, Key]) -> None
+     add_signed(response.authority, soa_rrset(TLD), keys[TLD])
+ 
+     # The owner name derives zone "tld.test.", but the RRSIG signer is the
+-    # secure child zone "1b40241kforiog780n4ikscrlvetpctq.tld.test.".
++    # malicious child zone "1b40241kforiog780n4ikscrlvetpctq.tld.test.".
+     add_signed(response.authority, child_nsec3_rrset(), keys[ATTACKER])
+ 
+ 
+-class SignedResponseHandler(ResponseHandler):
+-    def __init__(self, keys: dict[str, Key]) -> None:
+-        self.keys = keys
+-
+-    async def get_responses(
+-        self, qctx: QueryContext
+-    ) -> AsyncGenerator[DnsResponseSend, None]:
+-        qctx.prepare_new_response(with_zone_data=False)
+-        qctx.response.flags |= dns.flags.AA
+-        qctx.response.set_rcode(dns.rcode.NOERROR)
+-        self.respond(qctx)
+-        yield DnsResponseSend(qctx.response, authoritative=True)
+-
+-    def respond(self, qctx: QueryContext) -> None:
+-        raise NotImplementedError
+-
+-
+ class VictimForgedNxdomainHandler(SignedResponseHandler):
++    """
++    This serves the forged response for the victim's domain.
++    """
++
+     def match(self, qctx: QueryContext) -> bool:
+         return qctx.qname == name(VICTIM) and qctx.qtype == dns.rdatatype.A
+ 
+@@ -192,14 +190,31 @@ class VictimForgedNxdomainHandler(SignedResponseHandler):
+ 
+ 
+ class ChildDsHandler(SignedResponseHandler):
++    """
++    This will spoof the response for the malicious zone when qtype is DS.
++    It is actually a validly signed DS response.
++    """
++
+     def match(self, qctx: QueryContext) -> bool:
+         return qctx.qname == name(ATTACKER) and qctx.qtype == dns.rdatatype.DS
+ 
+     def respond(self, qctx: QueryContext) -> None:
+-        answer_ds(qctx.response, ATTACKER, self.keys[ATTACKER], self.keys[TLD])
++        response = qctx.response
++        zone = ATTACKER
++        child_key = self.keys[ATTACKER]
++        parent_key = self.keys[TLD]
++
++        add_signed(response.answer, ds_rrset(zone, child_key), parent_key)
+ 
+ 
+ class AttackerZoneHandler(SignedResponseHandler):
++    """
++    Acts as the malicious authoritative name server. The zone being served
++    is the hashed label of the parent zone (tld.test). This will respond
++    for all queries qtype SOA, DNSKEY, NS at the apex. Any names below
++    the apex are answered with an NXDOMAIN with no NSEC or NSEC3 present.
++    """
++
+     def match(self, qctx: QueryContext) -> bool:
+         return qctx.qname.is_subdomain(name(ATTACKER))
+ 
+@@ -210,7 +225,9 @@ class AttackerZoneHandler(SignedResponseHandler):
+             elif qctx.qtype == dns.rdatatype.SOA:
+                 answer_soa(qctx.response, ATTACKER, self.keys[ATTACKER])
+             else:
+-                answer_ns(qctx.response, ATTACKER, f"ns.{ATTACKER}", self.keys[ATTACKER])
++                answer_ns(
++                    qctx.response, ATTACKER, f"ns.{ATTACKER}", self.keys[ATTACKER]
++                )
+                 qctx.response.additional.append(glue_rrset(f"ns.{ATTACKER}", AUTH_IP))
+             return
+ 
+@@ -219,6 +236,16 @@ class AttackerZoneHandler(SignedResponseHandler):
+ 
+ 
+ class TldZoneHandler(SignedResponseHandler):
++    """
++    Acts as the TLD who is being used in the attack, but is not a standard
++    name server. It only responds with validly signed records for DNSKEY, SOA
++    and NS on the apex. Any names below the apex are answered with an NXDOMAIN
++    with no NSEC or NSEC3 present.
++
++    If we turn this into a regular name server than the attack won't work.
++    The attack assumes that the adversary can inject these responses on-path.
++    """
++
+     def match(self, qctx: QueryContext) -> bool:
+         return qctx.qname.is_subdomain(name(TLD))
+ 
+@@ -247,3 +274,7 @@ def main() -> None:
+         TldZoneHandler(keys),
+     )
+     server.run()
++
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/repro_5874_nsec3_parent/ns2/named.conf.j2 b/bin/tests/system/nsec3_impersonation/ns2/named.conf.j2
+similarity index 90%
+rename from bin/tests/system/repro_5874_nsec3_parent/ns2/named.conf.j2
+rename to bin/tests/system/nsec3_impersonation/ns2/named.conf.j2
+index 9358866..2c9b0bb 100644
+--- a/bin/tests/system/repro_5874_nsec3_parent/ns2/named.conf.j2
++++ b/bin/tests/system/nsec3_impersonation/ns2/named.conf.j2
+@@ -10,8 +10,6 @@ options {
+ 	listen-on-v6 { none; };
+ 	recursion yes;
+ 	dnssec-validation yes;
+-	trust-anchor-telemetry no;
+-	resolver-query-timeout 5000;
+ };
+ 
+ controls {
+diff --git a/bin/tests/system/repro_5874_nsec3_parent/tests_repro_5874_nsec3_parent.py b/bin/tests/system/nsec3_impersonation/tests_nsec3_impersonation.py
+similarity index 84%
+rename from bin/tests/system/repro_5874_nsec3_parent/tests_repro_5874_nsec3_parent.py
+rename to bin/tests/system/nsec3_impersonation/tests_nsec3_impersonation.py
+index 5fbeff5..bd9bd27 100644
+--- a/bin/tests/system/repro_5874_nsec3_parent/tests_repro_5874_nsec3_parent.py
++++ b/bin/tests/system/nsec3_impersonation/tests_nsec3_impersonation.py
+@@ -26,6 +26,7 @@ import dns.rdatatype
+ import pytest
+ 
+ import isctest
++import isctest.mark
+ 
+ APEX_HASH = "1B40241KFORIOG780N4IKSCRLVETPCTQ"
+ ATTACKER = f"{APEX_HASH.lower()}.tld.test."
+@@ -33,12 +34,15 @@ VICTIM = "victim.tld.test."
+ AUTH = "10.53.0.1"
+ RESOLVER = "10.53.0.2"
+ 
+-pytestmark = pytest.mark.extra_artifacts(
+-    [
+-        "ans*/ans.run",
+-        "keys.json",
+-    ]
+-)
++pytestmark = [
++    isctest.mark.with_ecdsa_deterministic,
++    pytest.mark.extra_artifacts(
++        [
++            "ans*/ans.run",
++            "ans*/keys.json",
++        ]
++    ),
++]
+ 
+ 
+ def _make_key(zone):
+@@ -65,13 +69,13 @@ def bootstrap():
+     zones = ["tld.test.", ATTACKER]
+     keys = {zone: _make_key(zone) for zone in zones}
+ 
+-    Path("keys.json").write_text(json.dumps(keys, indent=2), encoding="ascii")
++    Path("ans1/keys.json").write_text(json.dumps(keys, indent=2), encoding="ascii")
+ 
+     tld_dnskey = "".join(keys["tld.test."]["dnskey"].split()[3:])
+     return {"TLD_DNSKEY": tld_dnskey}
+ 
+ 
+-def _check_direct_dnskey_response(zone):
++def check_dnskey_response(zone):
+     query = isctest.query.create(zone, "DNSKEY")
+     response = isctest.query.tcp(query, AUTH)
+ 
+@@ -88,7 +92,7 @@ def _check_direct_dnskey_response(zone):
+     ), response
+ 
+ 
+-def _check_direct_ds_response(zone):
++def check_ds_response(zone):
+     query = isctest.query.create(zone, "DS")
+     response = isctest.query.tcp(query, AUTH)
+ 
+@@ -105,10 +109,10 @@ def _check_direct_ds_response(zone):
+     ), response
+ 
+ 
+-def test_repro_5874_direct_forged_nsec3_response_has_child_signer():
+-    _check_direct_dnskey_response("tld.test.")
+-    _check_direct_dnskey_response(ATTACKER)
+-    _check_direct_ds_response(ATTACKER)
++def test_attack_responses():
++    check_dnskey_response("tld.test.")
++    check_dnskey_response(ATTACKER)
++    check_ds_response(ATTACKER)
+ 
+     query = isctest.query.create(VICTIM, "A")
+     response = isctest.query.tcp(query, AUTH)
+@@ -136,9 +140,13 @@ def test_repro_5874_direct_forged_nsec3_response_has_child_signer():
+     assert rrsig[0].signer == dns.name.from_text(ATTACKER)
+ 
+ 
+-def test_repro_5874_resolver_rejects_child_signed_nsec3_parent_proof():
++def test_nsec3_impersonation():
++    """
++    Reproducer for #5874:
++    F-006 DNSSEC Validation Bypass NSEC3 Apex Hash Label Parent Impersonation
++    """
+     query = isctest.query.create(VICTIM, "A")
+     response = isctest.query.tcp(query, RESOLVER)
+ 
+-    isctest.check.servfail(response)
+     isctest.check.noadflag(response)
++    isctest.check.servfail(response)
+diff --git a/bin/tests/system/repro_5874_nsec3_parent/ans1/ans.py b/bin/tests/system/repro_5874_nsec3_parent/ans1/ans.py
+deleted file mode 100644
+index 614f26a..0000000
+--- a/bin/tests/system/repro_5874_nsec3_parent/ans1/ans.py
++++ /dev/null
+@@ -1,18 +0,0 @@
+-#!/usr/bin/python3
+-
+-# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
+-#
+-# SPDX-License-Identifier: MPL-2.0
+-#
+-# This Source Code Form is subject to the terms of the Mozilla Public
+-# License, v. 2.0.  If a copy of the MPL was not distributed with this
+-# file, you can obtain one at https://mozilla.org/MPL/2.0/.
+-#
+-# See the COPYRIGHT file distributed with this work for additional
+-# information regarding copyright ownership.
+-
+-from server import main
+-
+-
+-if __name__ == "__main__":
+-    main()
diff --git a/meta/recipes-connectivity/bind/bind_9.18.49.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
index 723a09e739..161736f9b1 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.49.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -18,6 +18,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2026-10723-01.patch \
+           file://CVE-2026-10723-02.patch \
+           file://CVE-2026-10723-03.patch \
            "
 
 SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
-- 
2.50.1


