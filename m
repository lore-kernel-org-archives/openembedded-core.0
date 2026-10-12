Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB871CA9EDA
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 04:38:46 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6764.1791779924134479331
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 21:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LNlLJTP2;
 spf=pass (domain: mvista.com, ip: 74.125.82.171, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-359d729379fso763635eec.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 21:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791779923; x=1792384723; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z2iO1d3vYvHWL/bH1ywkborUF4EjTG92aVPEeneT9Y0=;
        b=LNlLJTP2Ur/0mH1x8HjmWSn5c2oRq0hAJTgC8FKjU9KQik6VWkDAfJYLfy3IbmFQlj
         Z7zPhWBjyBY4OirGLEjdOjzRWFcvbDJQEYYdgV8sfOUCUmBf88VQhcMjEe5Pe5Lqq5pN
         GipouihQ0lSaATjqtFhv93x8j86cZ6oC39qKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779923; x=1792384723;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2iO1d3vYvHWL/bH1ywkborUF4EjTG92aVPEeneT9Y0=;
        b=NcoVZX7GDaxdZazlCSIyjLThclNlXbfAH16YdJK3b9DmvKDvik3Dm8De/8VZ0GJARo
         C6HxUXg8aW8KhVmhALTSRy2unQRNxLLsd6q5GRMFqSxBatTxCW8t5tlznvyJ10zLQ+i/
         dolPq7KmJN7V80TJucNpVCHKM3fo1zA7vcojFMi+2QRj57P8BmeO3n+ZcTeCKCKgP0EL
         6UqED1BQIAJa6f7YcHmSo8K6lz/pELUzV8ATYvdg2Vis15l7ZsnCVu7UyR+cmIE3EuTE
         Cn92TUvPC29o1wVi/Snx+xhKHV/s2xq9cxq0BxBN/J8raQkeyUMxdTaQWji3/MclmS/O
         9Rzg==
X-Gm-Message-State: AFq9FYIDFdeE9dvQqMneZjabTSAED2XN77u1IdaolYBc2W5bbJ9OURoy
	/XLKx4kScHlDKytPvFVs6ujGnXPFRSBy0Qbeo6693hsy+N8kAURs6sSDbGeeiJpReot6NoIDAKy
	1WCpo
X-Gm-Gg: AYBFou0tonY3f8C1bfGKijoHJrS0KG25ZbUlMb1kEDBy3bJWDNF6h6WAH6gRCk8sdGm
	hVxD0q67ri5xKiDr6q6Xp0beZmDeYDaEJq4t5ecV2MeB5Rq8DKJcJKK/MIW8rX3Y+MXSbr1itDl
	c6HIKO/Djoz/afBUWNfqaDXjCIojRyozZdAE28jsbwYF7zBNX99MEBpEKLJgTyzqehnq/kOwTrv
	6NM+ED59HqDByISWNXyFZecrUYERsLIK+fzUcTQMG0GQDTaAiquZF0YDKER1lO0f1B2uYOMJRPE
	VCXrD74+U0TY8PLxnr59RLEMQbKY4pFkSqGr6Mw7TiP9JZ4L4S/Sq30CL1/uAcQYa19StS4lfog
	Z1zQ5C3mHEUcbwWke3fckJZqRWr9IIg1ECYeRq+s9Y2pQfsb5YDSZUvzscr/psIjrFR8SGQL0pG
	cRuYNIxPJrecDJ7D3Ofc8UThcSAg8Zy9AYLqBN1sTHqb1D+FFDIriA/8DTvRgjCvUSyGBBQw5sI
	RZbK/Fu3no=
X-Received: by 2002:a05:7300:de46:b0:353:5a1e:a7e0 with SMTP id 5a478bee46e88-3537e0aba8bmr11280094eec.32.1791779922665;
        Sun, 11 Oct 2026 21:38:42 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm32823983eec.17.2026.10.11.21.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:38:42 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2 6/6] bind: fix for CVE-2026-13204, CVE-2026-13321
Date: Mon, 12 Oct 2026 10:08:21 +0530
Message-ID: <20261012043822.12852-6-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261012043822.12852-1-hprajapati@mvista.com>
References: <20261012043822.12852-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 04:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247603

Pick patch from [1,2,3] & [4,5,6] also mentioned at Debian report in [7] & [8]

[1] https://github.com/isc-projects/bind9/commit/0cf010c153518f1f9831e201891ecba8d8ba65e1
[2] https://github.com/isc-projects/bind9/commit/6c0e599ea85c0c53a4af09742e64e193da089bb4
[3] https://github.com/isc-projects/bind9/commit/48f5aa5fb3746d6194edcc57e8792a8b3cc3b454
[4] https://github.com/isc-projects/bind9/commit/c969ad2c17b43dd999e358bfeb280d3df6fab822
[5] https://github.com/isc-projects/bind9/commit/058023c66f11d78590d4aa8c4f98946c4c965e21
[6] https://github.com/isc-projects/bind9/commit/f751e19a30d107f04c2f644aff9f8dab8fed03ab
[7] https://security-tracker.debian.org/tracker/CVE-2026-13204
[8] https://security-tracker.debian.org/tracker/CVE-2026-13321

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../bind/bind/CVE-2026-13204-01.patch         | 395 +++++++++++++++++
 .../bind/bind/CVE-2026-13204-02.patch         | 215 ++++++++++
 .../bind/bind/CVE-2026-13204-03.patch         | 161 +++++++
 .../bind/bind/CVE-2026-13321-01.patch         | 401 ++++++++++++++++++
 .../bind/bind/CVE-2026-13321-02.patch         |  88 ++++
 .../bind/bind/CVE-2026-13321-03.patch         | 203 +++++++++
 .../recipes-connectivity/bind/bind_9.18.49.bb |   6 +
 7 files changed, 1469 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-13204-01.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-13204-02.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-13204-03.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-13321-01.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-13321-02.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-13321-03.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-13204-01.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-13204-01.patch
new file mode 100644
index 0000000000..2c80be8315
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-13204-01.patch
@@ -0,0 +1,395 @@
+From: Alessio Podda <alessio@isc.org>
+Date: Fri, 12 Jun 2026 11:16:01 +0200
+Subject: Reproducer for #5985 addnoqname mismatch
+
+LLM generated.
+
+(cherry picked from commit 5f4de929b3e4749b6e32c51660be11c47c2514e6)
+
+Origin: https://github.com/isc-projects/bind9/commit/0cf010c153518f1f9831e201891ecba8d8ba65e1
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-13204
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-13204
+
+CVE: CVE-2026-13204
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/0cf010c153518f1f9831e201891ecba8d8ba65e1]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .../ans1/ans.py                                    |  11 ++
+ .../ns2/named.conf.j2                              |   7 +-
+ .../repro_5985_findnoqname_runtime_check/server.py | 189 +++++++++++++++++++++
+ .../tests_repro_5985_findnoqname_runtime_check.py  | 120 +++++++++++++
+ 4 files changed, 325 insertions(+), 2 deletions(-)
+ create mode 100644 bin/tests/system/repro_5985_findnoqname_runtime_check/ans1/ans.py
+ copy bin/tests/system/{nsec3_impersonation => repro_5985_findnoqname_runtime_check}/ns2/named.conf.j2 (77%)
+ create mode 100644 bin/tests/system/repro_5985_findnoqname_runtime_check/server.py
+ create mode 100644 bin/tests/system/repro_5985_findnoqname_runtime_check/tests_repro_5985_findnoqname_runtime_check.py
+
+diff --git a/bin/tests/system/repro_5985_findnoqname_runtime_check/ans1/ans.py b/bin/tests/system/repro_5985_findnoqname_runtime_check/ans1/ans.py
+new file mode 100644
+index 0000000..cb01c8a
+--- /dev/null
++++ b/bin/tests/system/repro_5985_findnoqname_runtime_check/ans1/ans.py
+@@ -0,0 +1,11 @@
++#!/usr/bin/python3
++
++# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++#
++# SPDX-License-Identifier: MPL-2.0
++
++from server import main
++
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/nsec3_impersonation/ns2/named.conf.j2 b/bin/tests/system/repro_5985_findnoqname_runtime_check/ns2/named.conf.j2
+similarity index 77%
+copy from bin/tests/system/nsec3_impersonation/ns2/named.conf.j2
+copy to bin/tests/system/repro_5985_findnoqname_runtime_check/ns2/named.conf.j2
+index 2c9b0bb..7d6fc84 100644
+--- a/bin/tests/system/nsec3_impersonation/ns2/named.conf.j2
++++ b/bin/tests/system/repro_5985_findnoqname_runtime_check/ns2/named.conf.j2
+@@ -10,6 +10,9 @@ options {
+ 	listen-on-v6 { none; };
+ 	recursion yes;
+ 	dnssec-validation yes;
++	trust-anchor-telemetry no;
++	resolver-query-timeout 5000;
++	qname-minimization off;
+ };
+ 
+ controls {
+@@ -23,11 +26,11 @@ zone "." {
+ 	file "../../_common/root.hint";
+ };
+ 
+-zone "tld.test" {
++zone "f217.test" {
+ 	type static-stub;
+ 	server-addresses { 10.53.0.1; };
+ };
+ 
+ trust-anchors {
+-	tld.test. static-key 257 3 13 "@TLD_DNSKEY@";
++	f217.test. static-key 257 3 13 "@ZONE_DNSKEY@";
+ };
+diff --git a/bin/tests/system/repro_5985_findnoqname_runtime_check/server.py b/bin/tests/system/repro_5985_findnoqname_runtime_check/server.py
+new file mode 100644
+index 0000000..18d0ac1
+--- /dev/null
++++ b/bin/tests/system/repro_5985_findnoqname_runtime_check/server.py
+@@ -0,0 +1,189 @@
++#!/usr/bin/python3
++
++# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++#
++# SPDX-License-Identifier: MPL-2.0
++
++from collections.abc import AsyncGenerator
++from dataclasses import dataclass
++from datetime import datetime, timedelta, timezone
++from pathlib import Path
++
++import base64
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
++ZONE = "f217.test."
++CHILD = f"evil.{ZONE}"
++ATTACK = f"www.{CHILD}"
++NSEC_OWNER = f"00000000.{CHILD}"
++NSEC_NEXT = f"zzz.{CHILD}"
++FORGED_A = "192.0.2.217"
++
++
++@dataclass(frozen=True)
++class Key:
++    zone: dns.name.Name
++    private_key: object
++    dnskey: dns.rdata.Rdata
++
++
++def name(text: str) -> dns.name.Name:
++    return dns.name.from_text(text)
++
++
++def load_key() -> Key:
++    path = Path(__file__).resolve().parent / "keys.json"
++    with path.open(encoding="utf-8") as keys_file:
++        raw_key = json.load(keys_file)[ZONE]
++
++    private_key = serialization.load_pem_private_key(
++        raw_key["private_pem"].encode("ascii"),
++        password=None,
++    )
++    dnskey = dns.rdata.from_text(
++        dns.rdataclass.IN, dns.rdatatype.DNSKEY, raw_key["dnskey"]
++    )
++    return Key(name(ZONE), private_key, dnskey)
++
++
++def rrset(
++    owner: str, rdtype: dns.rdatatype.RdataType, *rdatas: str
++) -> dns.rrset.RRset:
++    return dns.rrset.from_text(owner, TTL, dns.rdataclass.IN, rdtype, *rdatas)
++
++
++def rrset_from_rdata(owner: str, rdata: dns.rdata.Rdata) -> dns.rrset.RRset:
++    return dns.rrset.from_rdata(name(owner), TTL, rdata)
++
++
++def add_signed(
++    section: list[dns.rrset.RRset], covered: dns.rrset.RRset, signer: Key
++) -> None:
++    rrsig = dns.dnssec.sign(
++        covered,
++        signer.private_key,
++        signer.zone,
++        signer.dnskey,
++        lifetime=86400,
++        verify=True,
++    )
++    section.append(covered)
++    section.append(dns.rrset.from_rdata(covered.name, covered.ttl, rrsig))
++
++
++def soa_rrset(zone: str) -> dns.rrset.RRset:
++    return rrset(
++        zone,
++        dns.rdatatype.SOA,
++        f"ns.{ZONE} hostmaster.{ZONE} 1 7200 3600 1209600 300",
++    )
++
++
++def garbage_rrsig(
++    owner: str, covered: dns.rdatatype.RdataType, labels: int, signer: str
++) -> dns.rrset.RRset:
++    now = datetime.now(timezone.utc)
++    inception = (now - timedelta(hours=1)).strftime("%Y%m%d%H%M%S")
++    expiration = (now + timedelta(days=1)).strftime("%Y%m%d%H%M%S")
++    signature = base64.b64encode(bytes(64)).decode("ascii")
++    text = (
++        f"{dns.rdatatype.to_text(covered)} 13 {labels} {TTL} "
++        f"{expiration} {inception} 12345 {signer} {signature}"
++    )
++    rdata = dns.rdata.from_text(dns.rdataclass.IN, dns.rdatatype.RRSIG, text)
++    return dns.rrset.from_rdata(name(owner), TTL, rdata)
++
++
++def add_ds_denial(response: dns.message.Message, key: Key) -> None:
++    add_signed(response.authority, soa_rrset(ZONE), key)
++    nsec = rrset(CHILD, dns.rdatatype.NSEC, f"ns.{ZONE} NS RRSIG NSEC")
++    add_signed(response.authority, nsec, key)
++
++
++def add_attack_answer(response: dns.message.Message) -> None:
++    response.answer.append(rrset(ATTACK, dns.rdatatype.A, FORGED_A))
++    response.answer.append(garbage_rrsig(ATTACK, dns.rdatatype.A, 1, CHILD))
++
++    nsec = rrset(
++        NSEC_OWNER,
++        dns.rdatatype.NSEC,
++        f"{NSEC_NEXT} A RRSIG NSEC",
++    )
++    nsec3 = rrset(
++        NSEC_OWNER,
++        dns.rdatatype.NSEC3,
++        "1 0 0 - VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV A RRSIG",
++    )
++    response.authority.append(nsec)
++    response.authority.append(
++        garbage_rrsig(
++            NSEC_OWNER,
++            dns.rdatatype.NSEC,
++            len(name(NSEC_OWNER).labels) - 1,
++            CHILD,
++        )
++    )
++    response.authority.append(nsec3)
++
++
++class RuntimeCheckHandler(ResponseHandler):
++    def __init__(self, key: Key) -> None:
++        self.key = key
++        self.zone = name(ZONE)
++        self.child = name(CHILD)
++        self.attack = name(ATTACK)
++
++    def match(self, qctx: QueryContext) -> bool:
++        return qctx.qname.is_subdomain(self.zone)
++
++    async def get_responses(
++        self, qctx: QueryContext
++    ) -> AsyncGenerator[DnsResponseSend, None]:
++        qctx.prepare_new_response(with_zone_data=False)
++        qctx.response.flags |= dns.flags.AA
++        qctx.response.set_rcode(dns.rcode.NOERROR)
++
++        if qctx.qname == self.zone and qctx.qtype == dns.rdatatype.DNSKEY:
++            add_signed(
++                qctx.response.answer,
++                rrset_from_rdata(ZONE, self.key.dnskey),
++                self.key,
++            )
++        elif qctx.qname == self.zone and qctx.qtype == dns.rdatatype.SOA:
++            add_signed(qctx.response.answer, soa_rrset(ZONE), self.key)
++        elif qctx.qname == self.child and qctx.qtype == dns.rdatatype.DS:
++            add_ds_denial(qctx.response, self.key)
++        elif qctx.qname == self.child and qctx.qtype == dns.rdatatype.DNSKEY:
++            qctx.response.authority.append(soa_rrset(CHILD))
++        elif qctx.qname == self.attack and qctx.qtype == dns.rdatatype.A:
++            add_attack_answer(qctx.response)
++        else:
++            add_signed(qctx.response.authority, soa_rrset(ZONE), self.key)
++
++        yield DnsResponseSend(qctx.response, authoritative=True)
++
++
++def main() -> None:
++    server = AsyncDnsServer(default_aa=True)
++    server.install_response_handlers(RuntimeCheckHandler(load_key()))
++    server.run()
+diff --git a/bin/tests/system/repro_5985_findnoqname_runtime_check/tests_repro_5985_findnoqname_runtime_check.py b/bin/tests/system/repro_5985_findnoqname_runtime_check/tests_repro_5985_findnoqname_runtime_check.py
+new file mode 100644
+index 0000000..0e7d71c
+--- /dev/null
++++ b/bin/tests/system/repro_5985_findnoqname_runtime_check/tests_repro_5985_findnoqname_runtime_check.py
+@@ -0,0 +1,120 @@
++#!/usr/bin/python3
++
++# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++#
++# SPDX-License-Identifier: MPL-2.0
++
++from pathlib import Path
++
++import json
++
++from cryptography.hazmat.primitives import serialization
++from cryptography.hazmat.primitives.asymmetric import ec
++
++import dns.dnssec
++import dns.name
++import dns.rdataclass
++import dns.rdatatype
++import pytest
++
++import isctest
++
++ZONE = "f217.test."
++CHILD = f"evil.{ZONE}"
++ATTACK = f"www.{CHILD}"
++NSEC_OWNER = f"00000000.{CHILD}"
++FORGED_A = "192.0.2.217"
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
++def _make_key():
++    private_key = ec.generate_private_key(ec.SECP256R1())
++    dnskey = dns.dnssec.make_dnskey(
++        private_key.public_key(),
++        algorithm="ECDSAP256SHA256",
++        flags=257,
++    )
++    private_pem = private_key.private_bytes(
++        encoding=serialization.Encoding.PEM,
++        format=serialization.PrivateFormat.PKCS8,
++        encryption_algorithm=serialization.NoEncryption(),
++    ).decode("ascii")
++    return {
++        "private_pem": private_pem,
++        "dnskey": dnskey.to_text(),
++    }
++
++
++def bootstrap():
++    keys = {ZONE: _make_key()}
++    Path("keys.json").write_text(json.dumps(keys, indent=2), encoding="ascii")
++    zone_dnskey = "".join(keys[ZONE]["dnskey"].split()[3:])
++    return {"ZONE_DNSKEY": zone_dnskey}
++
++
++def _query(server, qname, qtype):
++    query = isctest.query.create(qname, qtype)
++    return isctest.query.tcp(query, server, attempts=1, timeout=5)
++
++
++def _rrset(response, section, owner, rdtype, covers=None):
++    if covers is None:
++        return response.get_rrset(
++            section, dns.name.from_text(owner), dns.rdataclass.IN, rdtype
++        )
++    return response.get_rrset(
++        section,
++        dns.name.from_text(owner),
++        dns.rdataclass.IN,
++        rdtype,
++        covers=covers,
++    )
++
++
++def _has_a(response, section, owner, address):
++    rrset = _rrset(response, section, owner, dns.rdatatype.A)
++    return rrset is not None and any(rdata.address == address for rdata in rrset)
++
++
++def _check_rrsig(response, section, owner, rdtype, signer, labels=None):
++    rrsig = _rrset(response, section, owner, dns.rdatatype.RRSIG, covers=rdtype)
++    assert rrsig is not None, response.to_text()
++    assert rrsig[0].signer == dns.name.from_text(signer), response.to_text()
++    if labels is not None:
++        assert rrsig[0].labels == labels, response.to_text()
++
++
++def test_repro_5985_direct_findnoqname_addnoqname_mismatch_fixture():
++    response = _query(AUTH, ATTACK, "A")
++    isctest.check.noerror(response)
++    assert _has_a(response, response.answer, ATTACK, FORGED_A), response.to_text()
++    _check_rrsig(response, response.answer, ATTACK, dns.rdatatype.A, CHILD, labels=1)
++
++    assert _rrset(response, response.authority, NSEC_OWNER, dns.rdatatype.NSEC)
++    _check_rrsig(response, response.authority, NSEC_OWNER, dns.rdatatype.NSEC, CHILD)
++    assert _rrset(response, response.authority, NSEC_OWNER, dns.rdatatype.NSEC3)
++    assert (
++        _rrset(
++            response,
++            response.authority,
++            NSEC_OWNER,
++            dns.rdatatype.RRSIG,
++            covers=dns.rdatatype.NSEC3,
++        )
++        is None
++    )
++
++
++def test_repro_5985_resolver_does_not_abort_on_noqname_type_mismatch():
++    _query(RESOLVER, ATTACK, "A")
++
++    response = _query(RESOLVER, ZONE, "SOA")
++    isctest.check.noerror(response)
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-13204-02.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-13204-02.patch
new file mode 100644
index 0000000000..a7ae3d1ee7
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-13204-02.patch
@@ -0,0 +1,215 @@
+From: Matthijs Mekking <matthijs@isc.org>
+Date: Mon, 15 Jun 2026 14:55:29 +0200
+Subject: Update reproducer #5985
+
+Update the llm generated reproducer:
+- Move server.py into ans/ans1.py
+- Remove unncessary named.conf configuration options
+- Add comments describing the steps
+- Rename system test
+
+(cherry picked from commit fd539807829dd7d2eb76c8b503083f5d84fec6f0)
+
+Origin: https://github.com/isc-projects/bind9/commit/6c0e599ea85c0c53a4af09742e64e193da089bb4
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-13204
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-13204
+
+CVE: CVE-2026-13204
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/6c0e599ea85c0c53a4af09742e64e193da089bb4]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .../ans1/ans.py}                                   | 36 ++++++++++++++++------
+ .../ns2/named.conf.j2                              |  3 --
+ .../tests_findnoqname_mismatch.py}                 | 26 ++++++++++------
+ .../ans1/ans.py                                    | 11 -------
+ 4 files changed, 43 insertions(+), 33 deletions(-)
+ rename bin/tests/system/{repro_5985_findnoqname_runtime_check/server.py => dnssec_findnoqname_mismatch/ans1/ans.py} (85%)
+ rename bin/tests/system/{repro_5985_findnoqname_runtime_check => dnssec_findnoqname_mismatch}/ns2/named.conf.j2 (87%)
+ rename bin/tests/system/{repro_5985_findnoqname_runtime_check/tests_repro_5985_findnoqname_runtime_check.py => dnssec_findnoqname_mismatch/tests_findnoqname_mismatch.py} (87%)
+ delete mode 100644 bin/tests/system/repro_5985_findnoqname_runtime_check/ans1/ans.py
+
+diff --git a/bin/tests/system/repro_5985_findnoqname_runtime_check/server.py b/bin/tests/system/dnssec_findnoqname_mismatch/ans1/ans.py
+similarity index 85%
+rename from bin/tests/system/repro_5985_findnoqname_runtime_check/server.py
+rename to bin/tests/system/dnssec_findnoqname_mismatch/ans1/ans.py
+index 18d0ac1..b36fc83 100644
+--- a/bin/tests/system/repro_5985_findnoqname_runtime_check/server.py
++++ b/bin/tests/system/dnssec_findnoqname_mismatch/ans1/ans.py
+@@ -66,9 +66,7 @@ def load_key() -> Key:
+     return Key(name(ZONE), private_key, dnskey)
+ 
+ 
+-def rrset(
+-    owner: str, rdtype: dns.rdatatype.RdataType, *rdatas: str
+-) -> dns.rrset.RRset:
++def rrset(owner: str, rdtype: dns.rdatatype.RdataType, *rdatas: str) -> dns.rrset.RRset:
+     return dns.rrset.from_text(owner, TTL, dns.rdataclass.IN, rdtype, *rdatas)
+ 
+ 
+@@ -121,20 +119,30 @@ def add_ds_denial(response: dns.message.Message, key: Key) -> None:
+ 
+ 
+ def add_attack_answer(response: dns.message.Message) -> None:
++    """
++    Crafted authoritative response to <q>.evil.f217.hack./A
++
++        ;; ANSWER
++        <q>.evil.f217.hack.        300 IN A     192.0.2.217
++        <q>.evil.f217.hack.        300 IN RRSIG A 13 1 300 <exp> <inc> 12345 evil.f217.hack. <base64 of 64×0x00>
++                                                    ^^^ Labels = 1, qname has 4 labels, wildcard heuristic fires
++
++        ;; AUTHORITY (single owner, three rdatasets in this wire order)
++        00000000.evil.f217.hack.   300 IN NSEC  zzz.evil.f217.hack. A RRSIG NSEC
++        00000000.evil.f217.hack.   300 IN RRSIG NSEC 13 4 300 <exp> <inc> 12345 evil.f217.hack. <base64 of 64×0x00>
++        00000000.evil.f217.hack.   300 IN NSEC3 1 0 0 - VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV A RRSIG
++    """
++    # A + RRSIG
+     response.answer.append(rrset(ATTACK, dns.rdatatype.A, FORGED_A))
+     response.answer.append(garbage_rrsig(ATTACK, dns.rdatatype.A, 1, CHILD))
+-
++    # NSEC
+     nsec = rrset(
+         NSEC_OWNER,
+         dns.rdatatype.NSEC,
+         f"{NSEC_NEXT} A RRSIG NSEC",
+     )
+-    nsec3 = rrset(
+-        NSEC_OWNER,
+-        dns.rdatatype.NSEC3,
+-        "1 0 0 - VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV A RRSIG",
+-    )
+     response.authority.append(nsec)
++    # RRSIG(NSEC)
+     response.authority.append(
+         garbage_rrsig(
+             NSEC_OWNER,
+@@ -143,6 +151,12 @@ def add_attack_answer(response: dns.message.Message) -> None:
+             CHILD,
+         )
+     )
++    # NSEC3
++    nsec3 = rrset(
++        NSEC_OWNER,
++        dns.rdatatype.NSEC3,
++        "1 0 0 - VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV A RRSIG",
++    )
+     response.authority.append(nsec3)
+ 
+ 
+@@ -187,3 +201,7 @@ def main() -> None:
+     server = AsyncDnsServer(default_aa=True)
+     server.install_response_handlers(RuntimeCheckHandler(load_key()))
+     server.run()
++
++
++if __name__ == "__main__":
++    main()
+diff --git a/bin/tests/system/repro_5985_findnoqname_runtime_check/ns2/named.conf.j2 b/bin/tests/system/dnssec_findnoqname_mismatch/ns2/named.conf.j2
+similarity index 87%
+rename from bin/tests/system/repro_5985_findnoqname_runtime_check/ns2/named.conf.j2
+rename to bin/tests/system/dnssec_findnoqname_mismatch/ns2/named.conf.j2
+index 7d6fc84..f4fbd8a 100644
+--- a/bin/tests/system/repro_5985_findnoqname_runtime_check/ns2/named.conf.j2
++++ b/bin/tests/system/dnssec_findnoqname_mismatch/ns2/named.conf.j2
+@@ -10,9 +10,6 @@ options {
+ 	listen-on-v6 { none; };
+ 	recursion yes;
+ 	dnssec-validation yes;
+-	trust-anchor-telemetry no;
+-	resolver-query-timeout 5000;
+-	qname-minimization off;
+ };
+ 
+ controls {
+diff --git a/bin/tests/system/repro_5985_findnoqname_runtime_check/tests_repro_5985_findnoqname_runtime_check.py b/bin/tests/system/dnssec_findnoqname_mismatch/tests_findnoqname_mismatch.py
+similarity index 87%
+rename from bin/tests/system/repro_5985_findnoqname_runtime_check/tests_repro_5985_findnoqname_runtime_check.py
+rename to bin/tests/system/dnssec_findnoqname_mismatch/tests_findnoqname_mismatch.py
+index 0e7d71c..f3e332a 100644
+--- a/bin/tests/system/repro_5985_findnoqname_runtime_check/tests_repro_5985_findnoqname_runtime_check.py
++++ b/bin/tests/system/dnssec_findnoqname_mismatch/tests_findnoqname_mismatch.py
+@@ -18,6 +18,7 @@ import dns.rdatatype
+ import pytest
+ 
+ import isctest
++import isctest.mark
+ 
+ ZONE = "f217.test."
+ CHILD = f"evil.{ZONE}"
+@@ -27,12 +28,15 @@ FORGED_A = "192.0.2.217"
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
++            "ans1/ans.run",
++            "ans1/keys.json",
++        ]
++    ),
++]
+ 
+ 
+ def _make_key():
+@@ -55,7 +59,7 @@ def _make_key():
+ 
+ def bootstrap():
+     keys = {ZONE: _make_key()}
+-    Path("keys.json").write_text(json.dumps(keys, indent=2), encoding="ascii")
++    Path("ans1/keys.json").write_text(json.dumps(keys, indent=2), encoding="ascii")
+     zone_dnskey = "".join(keys[ZONE]["dnskey"].split()[3:])
+     return {"ZONE_DNSKEY": zone_dnskey}
+ 
+@@ -92,14 +96,16 @@ def _check_rrsig(response, section, owner, rdtype, signer, labels=None):
+         assert rrsig[0].labels == labels, response.to_text()
+ 
+ 
+-def test_repro_5985_direct_findnoqname_addnoqname_mismatch_fixture():
++def test_malicious_findnoqname_addnoqname_mismatch():
+     response = _query(AUTH, ATTACK, "A")
+     isctest.check.noerror(response)
+     assert _has_a(response, response.answer, ATTACK, FORGED_A), response.to_text()
+     _check_rrsig(response, response.answer, ATTACK, dns.rdatatype.A, CHILD, labels=1)
+ 
++    # Has NSEC
+     assert _rrset(response, response.authority, NSEC_OWNER, dns.rdatatype.NSEC)
+     _check_rrsig(response, response.authority, NSEC_OWNER, dns.rdatatype.NSEC, CHILD)
++    # Has NSEC3
+     assert _rrset(response, response.authority, NSEC_OWNER, dns.rdatatype.NSEC3)
+     assert (
+         _rrset(
+@@ -113,8 +119,8 @@ def test_repro_5985_direct_findnoqname_addnoqname_mismatch_fixture():
+     )
+ 
+ 
+-def test_repro_5985_resolver_does_not_abort_on_noqname_type_mismatch():
++def test_resolver_findnoqname_addnoqname_mismatch():
++    # Send one trigger query
+     _query(RESOLVER, ATTACK, "A")
+-
+     response = _query(RESOLVER, ZONE, "SOA")
+     isctest.check.noerror(response)
+diff --git a/bin/tests/system/repro_5985_findnoqname_runtime_check/ans1/ans.py b/bin/tests/system/repro_5985_findnoqname_runtime_check/ans1/ans.py
+deleted file mode 100644
+index cb01c8a..0000000
+--- a/bin/tests/system/repro_5985_findnoqname_runtime_check/ans1/ans.py
++++ /dev/null
+@@ -1,11 +0,0 @@
+-#!/usr/bin/python3
+-
+-# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
+-#
+-# SPDX-License-Identifier: MPL-2.0
+-
+-from server import main
+-
+-
+-if __name__ == "__main__":
+-    main()
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-13204-03.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-13204-03.patch
new file mode 100644
index 0000000000..f3447e3457
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-13204-03.patch
@@ -0,0 +1,161 @@
+From: Evan Hunt <each@isc.org>
+Date: Wed, 13 May 2026 20:45:57 -0700
+Subject: dns_rdataset_addnoqname() could find unsigned NSEC/NSEC3
+
+The dns_rdatalist addnoqname() implementation searches for the first
+NSEC or NSEC3 record in a message, then for the first RRSIG covering
+that type in the same message.  Previously, if no RRSIG for the type was
+found, the function accepted the unsigned record. Now, it will instead
+continue searching until an NSEC or NSEC3 that does have a matching
+signature is found.
+
+When this function is called from validated() in resolver.c, a
+non-success return code is now treated as an error instead of triggering
+an assertion failure.
+
+Fixes: isc-projects/bind9#5985
+(cherry picked from commit 57cba571ee31311e54d8a11cb38094d439f04e09)
+
+Origin: https://github.com/isc-projects/bind9/commit/48f5aa5fb3746d6194edcc57e8792a8b3cc3b454
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-13204
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-13204
+
+CVE: CVE-2026-13204
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/48f5aa5fb3746d6194edcc57e8792a8b3cc3b454]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/dns/rbtdb.c     | 10 +++++++---
+ lib/dns/rdatalist.c | 33 ++++++++++++++++-----------------
+ lib/dns/resolver.c  |  4 +++-
+ lib/ns/query.c      |  3 +--
+ 4 files changed, 27 insertions(+), 23 deletions(-)
+
+diff --git a/lib/dns/rbtdb.c b/lib/dns/rbtdb.c
+index 0b85479..c922df5 100644
+--- a/lib/dns/rbtdb.c
++++ b/lib/dns/rbtdb.c
+@@ -6946,7 +6946,7 @@ delegating_type(dns_rbtdb_t *rbtdb, dns_rbtnode_t *node,
+ static isc_result_t
+ addnoqname(dns_rbtdb_t *rbtdb, rdatasetheader_t *newheader,
+ 	   uint32_t maxrrperset, dns_rdataset_t *rdataset) {
+-	struct noqname *noqname;
++	struct noqname *noqname = NULL;
+ 	isc_mem_t *mctx = rbtdb->common.mctx;
+ 	dns_name_t name;
+ 	dns_rdataset_t neg, negsig;
+@@ -6958,7 +6958,9 @@ addnoqname(dns_rbtdb_t *rbtdb, rdatasetheader_t *newheader,
+ 	dns_rdataset_init(&negsig);
+ 
+ 	result = dns_rdataset_getnoqname(rdataset, &name, &neg, &negsig);
+-	RUNTIME_CHECK(result == ISC_R_SUCCESS);
++	if (result != ISC_R_SUCCESS) {
++		goto cleanup;
++	}
+ 
+ 	noqname = isc_mem_get(mctx, sizeof(*noqname));
+ 	dns_name_init(&noqname->name, NULL);
+@@ -6984,7 +6986,9 @@ addnoqname(dns_rbtdb_t *rbtdb, rdatasetheader_t *newheader,
+ cleanup:
+ 	dns_rdataset_disassociate(&neg);
+ 	dns_rdataset_disassociate(&negsig);
+-	free_noqname(mctx, &noqname);
++	if (noqname != NULL) {
++		free_noqname(mctx, &noqname);
++	}
+ 	return result;
+ }
+ 
+diff --git a/lib/dns/rdatalist.c b/lib/dns/rdatalist.c
+index 98036f9..2cca8d6 100644
+--- a/lib/dns/rdatalist.c
++++ b/lib/dns/rdatalist.c
+@@ -192,6 +192,7 @@ isc__rdatalist_addnoqname(dns_rdataset_t *rdataset, const dns_name_t *name) {
+ 	dns_rdataset_t *neg = NULL;
+ 	dns_rdataset_t *negsig = NULL;
+ 	dns_rdataset_t *rdset;
++	dns_rdataset_t *sigset;
+ 	dns_ttl_t ttl;
+ 
+ 	REQUIRE(rdataset != NULL);
+@@ -199,30 +200,27 @@ isc__rdatalist_addnoqname(dns_rdataset_t *rdataset, const dns_name_t *name) {
+ 	for (rdset = ISC_LIST_HEAD(name->list); rdset != NULL;
+ 	     rdset = ISC_LIST_NEXT(rdset, link))
+ 	{
+-		if (rdset->rdclass != rdataset->rdclass) {
+-			continue;
+-		}
+-		if (rdset->type == dns_rdatatype_nsec ||
+-		    rdset->type == dns_rdatatype_nsec3)
++		if (rdset->rdclass != rdataset->rdclass ||
++		    (rdset->type != dns_rdatatype_nsec &&
++		     rdset->type != dns_rdatatype_nsec3))
+ 		{
+-			neg = rdset;
++			continue;
+ 		}
+-	}
+-	if (neg == NULL) {
+-		return ISC_R_NOTFOUND;
+-	}
+ 
+-	for (rdset = ISC_LIST_HEAD(name->list); rdset != NULL;
+-	     rdset = ISC_LIST_NEXT(rdset, link))
+-	{
+-		if (rdset->type == dns_rdatatype_rrsig &&
+-		    rdset->covers == neg->type)
++		for (sigset = ISC_LIST_HEAD(name->list); sigset != NULL;
++		     sigset = ISC_LIST_NEXT(sigset, link))
+ 		{
+-			negsig = rdset;
++			if (sigset->type == dns_rdatatype_rrsig &&
++			    sigset->covers == rdset->type)
++			{
++				neg = rdset;
++				negsig = sigset;
++				break;
++			}
+ 		}
+ 	}
+ 
+-	if (negsig == NULL) {
++	if (neg == NULL || negsig == NULL) {
+ 		return ISC_R_NOTFOUND;
+ 	}
+ 	/*
+@@ -238,6 +236,7 @@ isc__rdatalist_addnoqname(dns_rdataset_t *rdataset, const dns_name_t *name) {
+ 	rdataset->ttl = neg->ttl = negsig->ttl = ttl;
+ 	rdataset->attributes |= DNS_RDATASETATTR_NOQNAME;
+ 	rdataset->private6 = name;
++
+ 	return ISC_R_SUCCESS;
+ }
+ 
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 06c779e..01c4a00 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -5910,7 +5910,9 @@ validated(isc_task_t *task, isc_event_t *event) {
+ 		result = dns_rdataset_addnoqname(
+ 			vevent->rdataset,
+ 			vevent->proofs[DNS_VALIDATOR_NOQNAMEPROOF]);
+-		RUNTIME_CHECK(result == ISC_R_SUCCESS);
++		if (result != ISC_R_SUCCESS) {
++			goto noanswer_response;
++		}
+ 		INSIST(vevent->sigrdataset != NULL);
+ 		vevent->sigrdataset->ttl = vevent->rdataset->ttl;
+ 		if (vevent->proofs[DNS_VALIDATOR_CLOSESTENCLOSER] != NULL) {
+diff --git a/lib/ns/query.c b/lib/ns/query.c
+index f0e5244..c4fe7c8 100644
+--- a/lib/ns/query.c
++++ b/lib/ns/query.c
+@@ -7941,8 +7941,7 @@ query_addnoqnameproof(query_ctx_t *qctx) {
+ 		goto cleanup;
+ 	}
+ 
+-	result = dns_rdataset_getnoqname(qctx->noqname, fname, neg, negsig);
+-	RUNTIME_CHECK(result == ISC_R_SUCCESS);
++	CHECK(dns_rdataset_getnoqname(qctx->noqname, fname, neg, negsig));
+ 
+ 	query_addrrset(qctx, &fname, &neg, &negsig, dbuf,
+ 		       DNS_SECTION_AUTHORITY);
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-13321-01.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-13321-01.patch
new file mode 100644
index 0000000000..ea8e03b808
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-13321-01.patch
@@ -0,0 +1,401 @@
+From: =?utf-8?q?Ayd=C4=B1n_Mercan?= <aydin@isc.org>
+Date: Wed, 6 May 2026 16:54:57 +0300
+Subject: Add system test for out-of-zone nsec dnssec bypass
+
+A malicious zone with out-of-zone NSEC entries can get a DNSSEC
+validating resolver's cache to cover the victim zone for non-existence
+and prevent nameserver queries without DNSSEC failure.
+
+Test for this case with an `evil.test` zone that tries to cover the
+`victim.test` zone.
+
+(cherry picked from commit 654f9773c0af59965c343bdfeb096b3dffe9dd53)
+
+Origin: https://github.com/isc-projects/bind9/commit/c969ad2c17b43dd999e358bfeb280d3df6fab822
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-13321
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-13321
+
+CVE: CVE-2026-13321
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/c969ad2c17b43dd999e358bfeb280d3df6fab822]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .../ns1/named.conf.j2}                             |   7 +-
+ .../ns1/root.db}                                   |  11 +-
+ .../ns1/test.db}                                   |  15 +-
+ .../ns2/named.conf.j2}                             |   6 +-
+ .../ns2/victim.db}                                 |   8 +-
+ .../template.db.in => dnssec_bypass/ns3/evil.db}   |  22 ++-
+ .../ns3/named.conf.j2}                             |   6 +-
+ .../ns4/named.conf.j2}                             |   9 +-
+ bin/tests/system/dnssec_bypass/tests_bypass.py     | 152 +++++++++++++++++++++
+ 9 files changed, 202 insertions(+), 34 deletions(-)
+ copy bin/tests/system/{allow_query/ns1/named.conf.in => dnssec_bypass/ns1/named.conf.j2} (87%)
+ copy bin/tests/system/{dupsigs/ns1/signing.test.db.in => dnssec_bypass/ns1/root.db} (72%)
+ copy bin/tests/system/{dupsigs/ns1/signing.test.db.in => dnssec_bypass/ns1/test.db} (69%)
+ copy bin/tests/system/{runtime/ns2/named-alt4.conf.in => dnssec_bypass/ns2/named.conf.j2} (89%)
+ copy bin/tests/system/{dnssec/ns2/cdnskey.secure.db.in => dnssec_bypass/ns2/victim.db} (79%)
+ copy bin/tests/system/{checkds/ns9/template.db.in => dnssec_bypass/ns3/evil.db} (54%)
+ copy bin/tests/system/{allow_query/ns1/named.conf.in => dnssec_bypass/ns3/named.conf.j2} (88%)
+ copy bin/tests/system/{rrsetorder/ns4/named.conf.in => dnssec_bypass/ns4/named.conf.j2} (86%)
+ create mode 100644 bin/tests/system/dnssec_bypass/tests_bypass.py
+
+diff --git a/bin/tests/system/allow_query/ns1/named.conf.in b/bin/tests/system/dnssec_bypass/ns1/named.conf.j2
+similarity index 87%
+copy from bin/tests/system/allow_query/ns1/named.conf.in
+copy to bin/tests/system/dnssec_bypass/ns1/named.conf.j2
+index dd786e2..59ced18 100644
+--- a/bin/tests/system/allow_query/ns1/named.conf.in
++++ b/bin/tests/system/dnssec_bypass/ns1/named.conf.j2
+@@ -20,7 +20,12 @@ options {
+ 	dnssec-validation no;
+ };
+ 
++zone "test." {
++	type primary;
++	file "test.db.signed";
++};
++
+ zone "." {
+ 	type primary;
+-	file "root.db";
++	file "root.db.signed";
+ };
+diff --git a/bin/tests/system/dupsigs/ns1/signing.test.db.in b/bin/tests/system/dnssec_bypass/ns1/root.db
+similarity index 72%
+copy from bin/tests/system/dupsigs/ns1/signing.test.db.in
+copy to bin/tests/system/dnssec_bypass/ns1/root.db
+index b522b6f..8d98a04 100644
+--- a/bin/tests/system/dupsigs/ns1/signing.test.db.in
++++ b/bin/tests/system/dnssec_bypass/ns1/root.db
+@@ -10,9 +10,10 @@
+ ; information regarding copyright ownership.
+ 
+ $TTL 3600
+-@ IN SOA  ns root.ns 1996072700 3600 1800 86400 60
+-@    NS   ns
+-ns   A    127.0.0.1
+-ns   AAAA ::1
++.			IN SOA	a.nil. a.nil. 1 3600 600 86400 300
++.			IN NS	a.root-servers.nil.
+ 
+-$GENERATE 0-499 a${0,4,d} AAAA ::$
++a.root-servers.nil.	IN A	10.53.0.1
++
++test.			IN NS	ns1.test.
++ns1.test.		IN A	10.53.0.1
+diff --git a/bin/tests/system/dupsigs/ns1/signing.test.db.in b/bin/tests/system/dnssec_bypass/ns1/test.db
+similarity index 69%
+copy from bin/tests/system/dupsigs/ns1/signing.test.db.in
+copy to bin/tests/system/dnssec_bypass/ns1/test.db
+index b522b6f..6efcd95 100644
+--- a/bin/tests/system/dupsigs/ns1/signing.test.db.in
++++ b/bin/tests/system/dnssec_bypass/ns1/test.db
+@@ -9,10 +9,15 @@
+ ; See the COPYRIGHT file distributed with this work for additional
+ ; information regarding copyright ownership.
+ 
++$ORIGIN test.
+ $TTL 3600
+-@ IN SOA  ns root.ns 1996072700 3600 1800 86400 60
+-@    NS   ns
+-ns   A    127.0.0.1
+-ns   AAAA ::1
+ 
+-$GENERATE 0-499 a${0,4,d} AAAA ::$
++@		IN SOA a a 1 3600 600 86400 300
++		IN NS	ns1.test.
++ns1		IN A	10.53.0.1
++
++evil		IN NS	ns1.evil
++ns1.evil	IN A	10.53.0.3
++
++victim		IN NS	ns1.victim
++ns1.victim	IN A	10.53.0.2
+diff --git a/bin/tests/system/runtime/ns2/named-alt4.conf.in b/bin/tests/system/dnssec_bypass/ns2/named.conf.j2
+similarity index 89%
+copy from bin/tests/system/runtime/ns2/named-alt4.conf.in
+copy to bin/tests/system/dnssec_bypass/ns2/named.conf.j2
+index 4c0312a..e81cee7 100644
+--- a/bin/tests/system/runtime/ns2/named-alt4.conf.in
++++ b/bin/tests/system/dnssec_bypass/ns2/named.conf.j2
+@@ -12,7 +12,6 @@
+  */
+ 
+ options {
+-	directory "./nope";
+ 	port @PORT@;
+ 	pid-file "named.pid";
+ 	listen-on { 10.53.0.2; };
+@@ -20,3 +19,8 @@ options {
+ 	recursion no;
+ 	dnssec-validation no;
+ };
++
++zone "victim.test." {
++	type primary;
++	file "victim.db.signed";
++};
+diff --git a/bin/tests/system/dnssec/ns2/cdnskey.secure.db.in b/bin/tests/system/dnssec_bypass/ns2/victim.db
+similarity index 79%
+copy from bin/tests/system/dnssec/ns2/cdnskey.secure.db.in
+copy to bin/tests/system/dnssec_bypass/ns2/victim.db
+index aa3aaab..edcc234 100644
+--- a/bin/tests/system/dnssec/ns2/cdnskey.secure.db.in
++++ b/bin/tests/system/dnssec_bypass/ns2/victim.db
+@@ -9,6 +9,10 @@
+ ; See the COPYRIGHT file distributed with this work for additional
+ ; information regarding copyright ownership.
+ 
++$ORIGIN victim.test.
+ $TTL 3600
+-@	SOA	ns2.example. . 1 3600 1200 86400 1200
+-@	NS	ns2.example.
++
++@		IN SOA	ns1 hostmaster 1 3600 600 86400 2147483647
++		IN NS	ns1
++
++ns1		IN A	10.53.0.2
+diff --git a/bin/tests/system/checkds/ns9/template.db.in b/bin/tests/system/dnssec_bypass/ns3/evil.db
+similarity index 54%
+copy from bin/tests/system/checkds/ns9/template.db.in
+copy to bin/tests/system/dnssec_bypass/ns3/evil.db
+index cf06015..618f9d3 100644
+--- a/bin/tests/system/checkds/ns9/template.db.in
++++ b/bin/tests/system/dnssec_bypass/ns3/evil.db
+@@ -9,19 +9,15 @@
+ ; See the COPYRIGHT file distributed with this work for additional
+ ; information regarding copyright ownership.
+ 
++$ORIGIN evil.test.
+ $TTL 300
+-@		IN	SOA  mname1. . (
+-			1       ; serial
+-			20      ; refresh (20 seconds)
+-			20      ; retry (20 seconds)
+-			1814400 ; expire (3 weeks)
+-			3600    ; minimum (1 hour)
+-			)
+ 
+-			NS	ns9
+-ns9			A	10.53.0.9
+-
+-a			A	10.0.0.1
+-b			A	10.0.0.2
+-c			A	10.0.0.3
++@		IN SOA	ns1 hostmaster 1 3600 600 86400 300
++		IN NS	ns1
++; Try to poison the victim zone in a resolver cache.
++; If admitted, the aggressive NSEC cache will accept a range such as
++; [evil.test, b.victim.test) and will cause the victim nameserver to
++; be never queried.
++		IN NSEC	b.victim.test. NS SOA RRSIG NSEC DNSKEY
+ 
++ns1		IN A	10.53.0.3
+diff --git a/bin/tests/system/allow_query/ns1/named.conf.in b/bin/tests/system/dnssec_bypass/ns3/named.conf.j2
+similarity index 88%
+copy from bin/tests/system/allow_query/ns1/named.conf.in
+copy to bin/tests/system/dnssec_bypass/ns3/named.conf.j2
+index dd786e2..17d3e18 100644
+--- a/bin/tests/system/allow_query/ns1/named.conf.in
++++ b/bin/tests/system/dnssec_bypass/ns3/named.conf.j2
+@@ -14,13 +14,13 @@
+ options {
+ 	port @PORT@;
+ 	pid-file "named.pid";
+-	listen-on { 10.53.0.1; };
++	listen-on { 10.53.0.3; };
+ 	listen-on-v6 { none; };
+ 	recursion no;
+ 	dnssec-validation no;
+ };
+ 
+-zone "." {
++zone "evil.test." {
+ 	type primary;
+-	file "root.db";
++	file "evil.db.signed";
+ };
+diff --git a/bin/tests/system/rrsetorder/ns4/named.conf.in b/bin/tests/system/dnssec_bypass/ns4/named.conf.j2
+similarity index 86%
+copy from bin/tests/system/rrsetorder/ns4/named.conf.in
+copy to bin/tests/system/dnssec_bypass/ns4/named.conf.j2
+index d5fc527..039695d 100644
+--- a/bin/tests/system/rrsetorder/ns4/named.conf.in
++++ b/bin/tests/system/dnssec_bypass/ns4/named.conf.j2
+@@ -19,13 +19,14 @@ options {
+ 	pid-file "named.pid";
+ 	listen-on { 10.53.0.4; };
+ 	listen-on-v6 { none; };
++	allow-transfer { any; };
+ 	recursion yes;
+ 	dnssec-validation yes;
+-	notify yes;
+-	rrset-order {
+-		class IN type A name "host.example.com" order random;
+-	};
++	synth-from-dnssec yes;
++};
+ 
++trust-anchors {
++	@root.domain@ @root.type@ @root.contents@;
+ };
+ 
+ zone "." {
+diff --git a/bin/tests/system/dnssec_bypass/tests_bypass.py b/bin/tests/system/dnssec_bypass/tests_bypass.py
+new file mode 100644
+index 0000000..c41bb7e
+--- /dev/null
++++ b/bin/tests/system/dnssec_bypass/tests_bypass.py
+@@ -0,0 +1,152 @@
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
++from datetime import datetime, timedelta, timezone
++
++import shutil
++
++from cryptography.hazmat.primitives.asymmetric import ec
++
++import dns.dnssec
++import dns.name
++import dns.rdataclass
++import dns.rdataset
++import dns.rdatatype
++import dns.rrset
++import dns.zone
++
++from isctest.run import EnvCmd
++
++import isctest
++
++TTL = 3600
++
++
++def bootstrap():
++    keygen = EnvCmd("KEYGEN", "-q -a ECDSA256")
++    signer = EnvCmd("SIGNER", "-S -g -O full")
++
++    def sign_regular_zone(ns: str, zone: str, database: str) -> isctest.kasp.Key:
++        isctest.log.info(f"{zone}: generate keys")
++        keygen(zone, cwd=ns).out.strip()
++        ksk = keygen(f"-f KSK {zone}", cwd=ns).out.strip()
++
++        isctest.log.info(f"{zone}: sign zone")
++        signer(f"-o {zone} {database}", cwd=ns)
++
++        if ns != "ns1":
++            shutil.copy(f"{ns}/dsset-{zone}", f"ns1/dsset-{zone}")
++            shutil.copy(f"{ns}/{ksk}.key", f"ns1/{ksk}.key")
++
++        return isctest.kasp.Key(ksk, keydir=ns)
++
++    # dnssec-signzone and `dns.dnssec.sign_zone` correctly disregard the invalid
++    # NSEC entries when signing the zone. However, for this test we actualy *want*
++    # to serve invalid yet signed zones. To accomplish this we sign the zone and then
++    # replace the correct entries with the faulty ones accompanied by its RRSIG.
++    #
++    # TODO(aydin): move this to `isctest` to sign broken zones
++    def sign_rogue_zone(ns: str, zone: str, database: str) -> None:
++        # Read zone.
++        origin = dns.name.from_text(zone)
++        data = dns.zone.from_file(f"{ns}/{database}", origin=origin, relativize=False)
++
++        # Get key for signing.
++        isctest.log.info(f"{zone}: generate keys")
++        private_key = ec.generate_private_key(ec.SECP256R1())
++        dnskey = dns.dnssec.make_dnskey(
++            public_key=private_key.public_key(),
++            algorithm=dns.dnssec.Algorithm.ECDSAP256SHA256,
++            flags=257,
++        )
++
++        # Sign zone.
++        isctest.log.info(f"{zone}: sign zone")
++        now = datetime.now(timezone.utc)
++        inception = now - timedelta(hours=1)
++        expiration = now + timedelta(days=30)
++
++        for name, node in data.nodes.items():
++            owner = name.derelativize(origin)
++            rdatasets = list(node.rdatasets)
++
++            for rdataset in rdatasets:
++                rrset = dns.rrset.RRset(owner, rdataset.rdclass, rdataset.rdtype)
++                rrset.update(rdataset)
++
++                rrsig = dns.dnssec.sign(
++                    rrset=rrset,
++                    private_key=private_key,
++                    signer=origin,
++                    dnskey=dnskey,
++                    inception=inception,
++                    expiration=expiration,
++                    deterministic=False,
++                )
++
++                rdataset = dns.rdataset.Rdataset(rrset.rdclass, dns.rdatatype.RRSIG)
++                rdataset.add(rrsig, rrset.ttl)
++                node.replace_rdataset(rdataset)
++
++        # Sign DNSKEY RRset.
++        dnskey_rrset = dns.rrset.RRset(origin, dns.rdataclass.IN, dns.rdatatype.DNSKEY)
++        dnskey_rrset.add(dnskey, ttl=TTL)
++
++        apex_node = data.nodes[origin]
++        apex_node.replace_rdataset(dnskey_rrset)
++
++        rrsig = dns.dnssec.sign(
++            rrset=dnskey_rrset,
++            private_key=private_key,
++            signer=origin,
++            dnskey=dnskey,
++            inception=inception,
++            expiration=expiration,
++            deterministic=False,
++        )
++        rdataset = dns.rdataset.Rdataset(rrset.rdclass, dns.rdatatype.RRSIG)
++        rdataset.add(rrsig, dnskey_rrset.ttl)
++        apex_node.replace_rdataset(rdataset)
++
++        # Output zone.
++        data.to_file(f"{ns}/{database}.signed", relativize=False)
++
++        # Output DS.
++        ds = dns.dnssec.make_ds(name=origin, key=dnskey, algorithm="SHA256")
++        with open(f"ns1/dsset-{zone}", "w", encoding="utf-8") as f:
++            f.write(f"{zone} {TTL} IN DS {ds.to_text()}\n")
++
++    sign_rogue_zone("ns3", "evil.test.", "evil.db")
++    sign_regular_zone("ns2", "victim.test.", "victim.db")
++    sign_regular_zone("ns1", "test.", "test.db")
++    root_ksk = sign_regular_zone("ns1", ".", "root.db")
++
++    return {
++        "root": root_ksk.into_ta("static-key"),
++    }
++
++
++def test_out_of_zone_nsec(ns4):
++    isctest.log.info("trying to poison aggressive nsec cache")
++    msg = isctest.query.create("nx.evil.test", "A")
++    res = isctest.query.tcp(msg, ns4.ip)
++    isctest.check.noadflag(res)
++
++    isctest.log.info("query victim from recursive")
++    msg = isctest.query.create("victim.test", "SOA")
++    res = isctest.query.tcp(msg, ns4.ip, attempts=1)
++    isctest.check.noerror(res)
++    isctest.check.adflag(res)
++    isctest.check.rr_count_eq(res.answer, 2)
++
++    isctest.log.info("checking for query history on victim nameserver")
++    with open("ns2/named.run", "r", encoding="utf-8") as f:
++        assert "(victim.test): query 'victim.test/SOA/IN' approved" in f.read()
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-13321-02.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-13321-02.patch
new file mode 100644
index 0000000000..a4e8ed2dc8
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-13321-02.patch
@@ -0,0 +1,88 @@
+From: =?utf-8?q?Ayd=C4=B1n_Mercan?= <aydin@isc.org>
+Date: Thu, 7 May 2026 18:59:20 +0300
+Subject: Reject out-of-zone NSEC next owner names
+
+When verifying DNSSEC records, make sure that a next owner name of
+an NSEC record is a subdomain of the signer field.
+
+This follows the specification RFC 4034, section 4.1.1:
+
+ Owner names of RRsets for which the given zone is not authoritative
+ (such as glue records) MUST NOT be listed in the Next Domain Name
+ unless at least one authoritative RRset exists at the same owner
+ name.
+
+While the above paragraph is intended for glue records, it also
+applies to out-of-zone data.
+
+(cherry picked from commit 4065512d25b71605b9502bb69dfb903776d35aa9)
+
+Origin: https://github.com/isc-projects/bind9/commit/058023c66f11d78590d4aa8c4f98946c4c965e21
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-13321
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-13321
+
+CVE: CVE-2026-13321
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/058023c66f11d78590d4aa8c4f98946c4c965e21]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/dns/dnssec.c             | 13 +++++++++++++
+ lib/dns/include/dns/dnssec.h |  6 ++++++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/lib/dns/dnssec.c b/lib/dns/dnssec.c
+index 9b9b1f2..5acaea9 100644
+--- a/lib/dns/dnssec.c
++++ b/lib/dns/dnssec.c
+@@ -357,8 +357,10 @@ isc_result_t
+ dns_dnssec_verify(const dns_name_t *name, dns_rdataset_t *set, dst_key_t *key,
+ 		  bool ignoretime, unsigned int maxbits, isc_mem_t *mctx,
+ 		  dns_rdata_t *sigrdata, dns_name_t *wild) {
++	dns_rdata_nsec_t nsec;
+ 	dns_rdata_rrsig_t sig;
+ 	dns_fixedname_t fnewname;
++	dns_rdata_t rdata = DNS_RDATA_INIT;
+ 	isc_region_t r;
+ 	isc_buffer_t envbuf;
+ 	dns_rdata_t *rdatas;
+@@ -464,6 +466,17 @@ dns_dnssec_verify(const dns_name_t *name, dns_rdataset_t *set, dst_key_t *key,
+ 		}
+ 		break;
+ 	}
++	/*
++	 * Check for out of zone NSEC entries.
++	 */
++	if (set->type == dns_rdatatype_nsec) {
++		RETERR(dns_rdataset_first(set));
++		dns_rdataset_current(set, &rdata);
++		RETERR(dns_rdata_tostruct(&rdata, &nsec, NULL));
++		if (!dns_name_issubdomain(&nsec.next, &sig.signer)) {
++			return DNS_R_NOVALIDNSEC;
++		}
++	}
+ 
+ again:
+ 	ret = dst_context_create(key, mctx, DNS_LOGCATEGORY_DNSSEC, false,
+diff --git a/lib/dns/include/dns/dnssec.h b/lib/dns/include/dns/dnssec.h
+index cb8fd9d..2be11b9 100644
+--- a/lib/dns/include/dns/dnssec.h
++++ b/lib/dns/include/dns/dnssec.h
+@@ -151,6 +151,9 @@ dns_dnssec_verify(const dns_name_t *name, dns_rdataset_t *set, dst_key_t *key,
+  *	this record, as this requires a resolver or database.
+  *	If 'ignoretime' is true, temporal validity will not be checked.
+  *
++ *	If 'set' is of type NSEC, this function also verifies that the
++ *	Next Name is a subdomain of the Signer's Name from 'sigrdata'.
++ *
+  *	'maxbits' specifies the maximum number of rsa exponent bits accepted.
+  *
+  *	Requires:
+@@ -173,6 +176,9 @@ dns_dnssec_verify(const dns_name_t *name, dns_rdataset_t *set, dst_key_t *key,
+  *\li		#DNS_R_KEYUNAUTHORIZED - the key cannot sign this data (either
+  *			it is not a zone key or its flags prevent
+  *			authentication)
++ *
++ *\li		#DNS_R_NOVALIDNSEC - the NSEC rdata is not valid
++ *\li		#DNS_R_KEYUNAUTHORIZED - the key cannot sign this data
+  *\li		DST_R_*
+  */
+ 
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-13321-03.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-13321-03.patch
new file mode 100644
index 0000000000..a2ec87efe1
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-13321-03.patch
@@ -0,0 +1,203 @@
+From: =?utf-8?q?Ayd=C4=B1n_Mercan?= <aydin@isc.org>
+Date: Tue, 12 May 2026 14:54:09 +0300
+Subject: change dns_nsec_requiredtypespresent to dns_nsec_is_legal
+
+Change `dns_nsec_requiredtypespresent` to `dns_nsec_is_legal` as a
+function for checking multiple NSEC validity rules.
+
+Currently we now additionally check for out-of-zone NSEC entries.
+
+(cherry picked from commit be2a6a497312469890b552907d039d2de0b44ccc)
+
+Origin: https://github.com/isc-projects/bind9/commit/f751e19a30d107f04c2f644aff9f8dab8fed03ab
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-13321
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-13321
+
+CVE: CVE-2026-13321
+Upstream-Status: Backport [https://github.com/isc-projects/bind9/commit/f751e19a30d107f04c2f644aff9f8dab8fed03ab]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/dns/include/dns/nsec.h | 18 ++++++++++++-----
+ lib/dns/nsec.c             | 17 ++++++++++++----
+ lib/dns/resolver.c         | 48 ++++++++++++++++++++++++++++++++++++++++++++--
+ lib/ns/query.c             |  6 +++---
+ 4 files changed, 75 insertions(+), 14 deletions(-)
+
+diff --git a/lib/dns/include/dns/nsec.h b/lib/dns/include/dns/nsec.h
+index 50df8e4..1e71bf1 100644
+--- a/lib/dns/include/dns/nsec.h
++++ b/lib/dns/include/dns/nsec.h
+@@ -119,13 +119,21 @@ dns_nsec_noexistnodata(dns_rdatatype_t type, const dns_name_t *name,
+  */
+ 
+ bool
+-dns_nsec_requiredtypespresent(dns_rdataset_t *rdataset);
+-/*
+- * Return true if all the NSEC records in rdataset have both
+- * NSEC and RRSIG present.
++dns_nsec_is_legal(dns_rdataset_t *rdataset, const dns_name_t *name);
++/**<
++ * \brief
++ * Validates a rdataset of type NSEC.
+  *
+- * Requires:
++ * This functions checks for the following in the given rdataset:
++ * \li All NSEC records have both NSEC and RRSIG present
++ * \li All NSEC entries are under the `name`
++ *
++ * \par Requires:
+  * \li	rdataset to be a NSEC rdataset.
++ * \li  `name` is a valid dns_name_t
++ *
++ * \retval true if all the checks pass
++ * \retval false otherwise
+  */
+ 
+ ISC_LANG_ENDDECLS
+diff --git a/lib/dns/nsec.c b/lib/dns/nsec.c
+index 80ee8d7..5abcce5 100644
+--- a/lib/dns/nsec.c
++++ b/lib/dns/nsec.c
+@@ -21,6 +21,7 @@
+ #include <isc/util.h>
+ 
+ #include <dns/db.h>
++#include <dns/name.h>
+ #include <dns/nsec.h>
+ #include <dns/rdata.h>
+ #include <dns/rdatalist.h>
+@@ -497,8 +498,9 @@ dns_nsec_noexistnodata(dns_rdatatype_t type, const dns_name_t *name,
+ }
+ 
+ bool
+-dns_nsec_requiredtypespresent(dns_rdataset_t *nsecset) {
+-	dns_rdataset_t rdataset;
++dns_nsec_is_legal(dns_rdataset_t *nsecset, const dns_name_t *name) {
++	dns_rdataset_t rdataset = DNS_RDATASET_INIT;
++	dns_rdata_nsec_t nsec;
+ 	isc_result_t result;
+ 	bool found = false;
+ 
+@@ -513,12 +515,19 @@ dns_nsec_requiredtypespresent(dns_rdataset_t *nsecset) {
+ 	{
+ 		dns_rdata_t rdata = DNS_RDATA_INIT;
+ 		dns_rdataset_current(&rdataset, &rdata);
+-		if (!dns_nsec_typepresent(&rdata, dns_rdatatype_nsec) ||
+-		    !dns_nsec_typepresent(&rdata, dns_rdatatype_rrsig))
++
++		/* must never fail */
++		result = dns_rdata_tostruct(&rdata, &nsec, NULL);
++		INSIST(result == ISC_R_SUCCESS);
++
++		if (!dns_name_issubdomain(&nsec.next, name) ||
++		    !dns_nsec_typepresent(&rdata, dns_rdatatype_rrsig) ||
++		    !dns_nsec_typepresent(&rdata, dns_rdatatype_nsec))
+ 		{
+ 			dns_rdataset_disassociate(&rdataset);
+ 			return false;
+ 		}
++
+ 		found = true;
+ 	}
+ 	dns_rdataset_disassociate(&rdataset);
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index 01c4a00..1bfd8bb 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -65,7 +65,9 @@
+ #include <dns/rootns.h>
+ #include <dns/stats.h>
+ #include <dns/tsig.h>
++#include <dns/types.h>
+ #include <dns/validator.h>
++#include <dns/view.h>
+ #include <dns/zone.h>
+ 
+ /* Detailed logging of fctx attach/detach */
+@@ -5620,6 +5622,36 @@ fctx_setresult(fetchctx_t *fctx, dns_rdataset_t *rdataset) {
+ 	return result;
+ }
+ 
++static bool
++get_and_check_signer_name(dns_name_t *signer, dns_rdataset_t *sigrdataset) {
++	dns_rdata_rrsig_t rrsig;
++	isc_result_t result;
++	dns_rdata_t rdata;
++
++	if (dns_rdataset_first(sigrdataset) != ISC_R_SUCCESS) {
++		return false;
++	}
++
++	rdata = (dns_rdata_t)DNS_RDATA_INIT;
++	dns_rdataset_current(sigrdataset, &rdata);
++	result = dns_rdata_tostruct(&rdata, &rrsig, NULL);
++	INSIST(result == ISC_R_SUCCESS);
++	dns_name_copy(&rrsig.signer, signer);
++
++	while (dns_rdataset_next(sigrdataset) == ISC_R_SUCCESS) {
++		rdata = (dns_rdata_t)DNS_RDATA_INIT;
++		dns_rdataset_current(sigrdataset, &rdata);
++		result = dns_rdata_tostruct(&rdata, &rrsig, NULL);
++		INSIST(result == ISC_R_SUCCESS);
++
++		if (!dns_name_equal(signer, &rrsig.signer)) {
++			return false;
++		}
++	}
++
++	return true;
++}
++
+ /*
+  * The validator has finished.
+  */
+@@ -5650,6 +5682,8 @@ validated(isc_task_t *task, isc_event_t *event) {
+ 	dns_fixedname_t fwild;
+ 	dns_name_t *wild = NULL;
+ 	dns_message_t *message = NULL;
++	dns_fixedname_t fsigner;
++	dns_name_t *signer = NULL;
+ 
+ 	UNUSED(task); /* for now */
+ 
+@@ -6038,10 +6072,20 @@ answer_response:
+ 			}
+ 
+ 			/*
+-			 * Don't cache NSEC if missing NSEC or RRSIG types.
++			 * Don't cache if all the RRSIGs don't have the same
++			 * signer.
++			 */
++			signer = dns_fixedname_initname(&fsigner);
++			if (!get_and_check_signer_name(signer, sigrdataset)) {
++				continue;
++			}
++
++			/*
++			 * Don't cache NSEC if missing NSEC or RRSIG
++			 * types.
+ 			 */
+ 			if (rdataset->type == dns_rdatatype_nsec &&
+-			    !dns_nsec_requiredtypespresent(rdataset))
++			    !dns_nsec_is_legal(rdataset, signer))
+ 			{
+ 				continue;
+ 			}
+diff --git a/lib/ns/query.c b/lib/ns/query.c
+index c4fe7c8..1985f4e 100644
+--- a/lib/ns/query.c
++++ b/lib/ns/query.c
+@@ -10356,10 +10356,10 @@ query_coveringnsec(query_ctx_t *qctx) {
+ 	}
+ 
+ 	/*
+-	 * If NSEC or RRSIG are missing from the type map
+-	 * reject the NSEC RRset.
++	 * Check that the NSEC entry is legal.
++	 * (NSEC + RRSIG present and the entry isn't out-of-zone)
+ 	 */
+-	if (!dns_nsec_requiredtypespresent(qctx->rdataset)) {
++	if (!dns_nsec_is_legal(qctx->rdataset, signer)) {
+ 		goto cleanup;
+ 	}
+ 
diff --git a/meta/recipes-connectivity/bind/bind_9.18.49.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
index b048ba6559..32205e4104 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.49.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -35,6 +35,12 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2026-11721-03.patch \
            file://CVE-2026-12617-01.patch \
            file://CVE-2026-12617-02.patch \
+           file://CVE-2026-13204-01.patch \
+           file://CVE-2026-13204-02.patch \
+           file://CVE-2026-13204-03.patch \
+           file://CVE-2026-13321-01.patch \
+           file://CVE-2026-13321-02.patch \
+           file://CVE-2026-13321-03.patch \
            "
 
 SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
-- 
2.50.1


