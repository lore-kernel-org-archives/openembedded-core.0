Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0755CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 05:12:47 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.32416.1756962763292692810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 22:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Alm6FP8L;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7728815e639so426894b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 22:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756962762; x=1757567562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVRKEnWzK5Kb5amdNTIcoKGPACofEL5omWUgyt9Xg+4=;
        b=Alm6FP8L5ZuMF48xYSErSp1LB29uyRZ2ubUmkPEvRXnX9F5jmH6BHW1Cqt/feNLeFW
         fCY9cdyVxdBSM3ihMkU8m8XpyXJCToFe9dkWOTqreRfEqwJ32tj/TGCNPXbB0U/D6Sqj
         ZXSzsme8LLARg0pBcthvCoeNUXGrD+i5qIOrJ9NkYCshSytlJVBVcf37mUXDKBPvl0a3
         Qzax7UtrGHSSW4zAh8LcGDeGXtgJQFpn7CgOwBE6ZIBXrtpbI3tDz/PVsbzjPmohBJKP
         Yp+500GhYQ646O3YXAyFWgIMGbmVy3RwFZHSr085nzbCPH9J7dhpaDLjYpsy4Rfpscv/
         NKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756962762; x=1757567562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVRKEnWzK5Kb5amdNTIcoKGPACofEL5omWUgyt9Xg+4=;
        b=Ydn/RQ2M/ygqN9Jjf9RFP7kvGm3BBAF3jVQM2DstEcbsWhufTWLKpOtorO6DLrEt7c
         Spjys2vTykHFHDqSJKdH/Pr4HR6Gbci+XpwPUzk+fcR5rT3HpRWG3KZzRBnq8i20cl6l
         6BXnp7XqVc3sXgxiyV47O3jplhWkbmKx9RGBSiGwsJ463F5P5z5MVQdsNPDGVOSfWIe9
         Cst7UfuvQZCW0LOjqddmlpCGxpHhbmHrHKJgC3d9AAxGFBuEx5DSPAo6NCULLVA3FFUW
         Z6jAN9tonQ89Yi3dJVZ27W0TDGcKuzdYrXSAe1Ab/wYXeb2LKaTxGKKHjy6+ae0CyoK8
         3YQA==
X-Gm-Message-State: AOJu0YzsDrXJjUFwk3UJKZ5icLWnSUnaido2bmEez0kAU0hllOL9a5NC
	ZUXdXDfpZeCbJMB128ltuf7SkiwchGfKsFUnG0wItaR/jvr9m/IeSwroMnjkkH5l
X-Gm-Gg: ASbGncsBwij2PrnoUTqVructbDwTw8faK+kZOp6MnOy4soOTuIjFJPKgXQlP5YqZnQn
	IPkh3sp+VpDvc2PfVxzcGbY8Fp+NLziwJ5HxEL38C9l4vv2gqpCWsUEtlOTuI+67ERYn/QB9PGv
	0lpNCyBCAr8LZlgb4w9N7t89PeTkaiM0i/7KjKydw3MtxYH3zK8n2Pf7opKlCtAs1mWK+rcV9Du
	ksIHxQCCAePB9sMNwVoPgkr2AdsPS1Z8TtFA+qGI+HD9Fehy5H96nTb79Q9oSHb2K7BKQd9TPwm
	mX8owwi4vkvGd2LtIvY1TTEbgNA4zygHOjVZIWtJ2cRTtgFdpuRJE/aresJg/eNI9n4JCcRbeeR
	MLaJocFP1ukPBk/4LWH7kqSSn+mLz4hHKLrHWe8bkmNTIB+NZoAr/bsPH3+mPFhiKecDEihR3sf
	smdX/yJ3goF0X5TskFSlMbUn5DIye9cYntc9igm0hu
X-Google-Smtp-Source: AGHT+IEgAtO7Xb2lDSRZCxSl0NTNXk1kkAHrIcBwCoi4thAKvqKiZNynQlpEYoiqEdWB0rMid3/xuA==
X-Received: by 2002:a05:6a20:7fa8:b0:243:b3c7:bb0e with SMTP id adf61e73a8af0-243d6e56446mr27475463637.25.1756962762096;
        Wed, 03 Sep 2025 22:12:42 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ecee])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd0736ba7sm15731755a12.12.2025.09.03.22.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:12:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] kea: Fix build with clang/libc++ 21
Date: Wed,  3 Sep 2025 22:12:37 -0700
Message-ID: <20250904051239.796948-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 05:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222894

Clang with libc++ hardening on, rejects Boost’s enum trait probe
which is ill-formed for scoped/limited
enums whose valid range does not include −1
(e.g. enums with values [0..3])

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-dhcpsrv-Avoid-Boost-lexical_cast-o.patch | 348 ++++++++++++++++++
 meta/recipes-connectivity/kea/kea_3.0.1.bb    |   1 +
 2 files changed, 349 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
new file mode 100644
index 00000000000..6facc4d32d7
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
@@ -0,0 +1,348 @@
+From e3a0d181a279334c7d7a10c5b09fd1610384101c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Sep 2025 12:52:51 -0700
+Subject: [PATCH] d2/dhcp[46]/radius/dhcpsrv: Avoid Boost lexical_cast on enums
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Clang with libc++ hardening (-D_LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_FAST)
+rejects Boost's enum trait probe used by `boost::lexical_cast`:
+`boost::type_traits::is_signed/is_unsigned` defines
+`static const T minus_one = (T)-1;`, which is ill-formed for scoped/limited
+enums whose valid range does not include −1 (e.g. enums with values [0..3]).
+When an enum is passed to `lexical_cast<std::string>`, this triggers errors like:
+
+  error: in-class initializer for static data member is not a constant expression
+    ... minus_one = (static_cast<no_cv_t>(-1));
+
+In Kea this surfaced via logging `.arg(enum_value)` and when writing
+`Lease6::type_` to CSV.
+
+This change makes all such call sites avoid `lexical_cast` on enums:
+
+* d2 transactions (`check_exists_*`, `nc_*`, `simple_*`):
+  cast `getDnsUpdateStatus()` to `int` before passing to `.arg(...)`.
+
+* d2 queue manager (`d2_queue_mgr.cc`):
+  cast `mgr_state_` to `int` before logging.
+
+* DHCPv4/6 servers (`dhcp4_srv.cc`, `dhcp6_srv.cc`):
+  cast `dhcp_ddns::NameChangeSender::Result` to `int` before logging.
+
+* RADIUS hook (`radius_accounting.cc`):
+  cast `env.event_` to `int` for the numeric field; we still log the textual
+  form via `eventToText(event_)` in the next argument.
+
+* DHCPv6 CSV writer (`csv_lease_file6.cc`):
+  write `lease_type` using `isc::dhcp::Lease::typeToText(lease.type_)`
+  instead of passing the enum directly. This is human-readable and uses Kea’s
+  own canonical stringifier, while avoiding the Boost enum path entirely.
+
+why:
+
+- Prevents Boost from instantiating enum trait checks that cast −1 to an enum.
+- Unblocks builds with recent Clang/libc++ hardening.
+- Keeps log output stable (numeric codes retained) and improves CSV clarity
+  for lease type by using the provided textual converter.
+
+No functional/ABI changes; only formatting of certain log/CSV values.
+If a downstream consumer expects a numeric `lease_type`, it can be adjusted
+to parse the textual value or the change can be trivially flipped to
+`static_cast<unsigned>(lease.type_)`.
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/4100]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bin/d2/check_exists_add.cc             | 6 +++---
+ src/bin/d2/check_exists_remove.cc          | 6 +++---
+ src/bin/d2/d2_queue_mgr.cc                 | 2 +-
+ src/bin/d2/nc_add.cc                       | 6 +++---
+ src/bin/d2/nc_remove.cc                    | 6 +++---
+ src/bin/d2/simple_add.cc                   | 4 ++--
+ src/bin/d2/simple_add_without_dhcid.cc     | 4 ++--
+ src/bin/d2/simple_remove.cc                | 4 ++--
+ src/bin/d2/simple_remove_without_dhcid.cc  | 4 ++--
+ src/bin/dhcp4/dhcp4_srv.cc                 | 2 +-
+ src/bin/dhcp6/dhcp6_srv.cc                 | 2 +-
+ src/hooks/dhcp/radius/radius_accounting.cc | 2 +-
+ src/lib/dhcpsrv/csv_lease_file6.cc         | 2 +-
+ 13 files changed, 25 insertions(+), 25 deletions(-)
+
+diff --git a/src/bin/d2/check_exists_add.cc b/src/bin/d2/check_exists_add.cc
+index 11bb29f..edfef31 100644
+--- a/src/bin/d2/check_exists_add.cc
++++ b/src/bin/d2/check_exists_add.cc
+@@ -270,7 +270,7 @@ CheckExistsAddTransaction::addingFwdAddrsHandler() {
+             // bigger is wrong.
+             LOG_ERROR(d2_to_dns_logger, DHCP_DDNS_FORWARD_ADD_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -397,7 +397,7 @@ CheckExistsAddTransaction::replacingFwdAddrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_FORWARD_REPLACE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -541,7 +541,7 @@ CheckExistsAddTransaction::replacingRevPtrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_REVERSE_REPLACE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+diff --git a/src/bin/d2/check_exists_remove.cc b/src/bin/d2/check_exists_remove.cc
+index 8ae5296..8b6b221 100644
+--- a/src/bin/d2/check_exists_remove.cc
++++ b/src/bin/d2/check_exists_remove.cc
+@@ -268,7 +268,7 @@ CheckExistsRemoveTransaction::removingFwdAddrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_FORWARD_REMOVE_ADDRS_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -404,7 +404,7 @@ CheckExistsRemoveTransaction::removingFwdRRsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_FORWARD_REMOVE_RRS_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -556,7 +556,7 @@ CheckExistsRemoveTransaction::removingRevPtrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_REVERSE_REMOVE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+diff --git a/src/bin/d2/d2_queue_mgr.cc b/src/bin/d2/d2_queue_mgr.cc
+index f902b22..effa56b 100644
+--- a/src/bin/d2/d2_queue_mgr.cc
++++ b/src/bin/d2/d2_queue_mgr.cc
+@@ -78,7 +78,7 @@ D2QueueMgr::operator()(const dhcp_ddns::NameChangeListener::Result result,
+                 // this is unexpected so we will treat it as a receive error.
+                 // This is most likely an unforeseen programmatic issue.
+                 LOG_ERROR(dhcp_to_d2_logger, DHCP_DDNS_QUEUE_MGR_UNEXPECTED_STOP)
+-                          .arg(mgr_state_);
++                          .arg(static_cast<int>(mgr_state_));
+                 stopListening(STOPPED_RECV_ERROR);
+             }
+ 
+diff --git a/src/bin/d2/nc_add.cc b/src/bin/d2/nc_add.cc
+index 7bffc16..1d17bb2 100644
+--- a/src/bin/d2/nc_add.cc
++++ b/src/bin/d2/nc_add.cc
+@@ -272,7 +272,7 @@ NameAddTransaction::addingFwdAddrsHandler() {
+             // bigger is wrong.
+             LOG_ERROR(d2_to_dns_logger, DHCP_DDNS_FORWARD_ADD_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -399,7 +399,7 @@ NameAddTransaction::replacingFwdAddrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_FORWARD_REPLACE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -542,7 +542,7 @@ NameAddTransaction::replacingRevPtrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_REVERSE_REPLACE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+diff --git a/src/bin/d2/nc_remove.cc b/src/bin/d2/nc_remove.cc
+index 874e43b..182343c 100644
+--- a/src/bin/d2/nc_remove.cc
++++ b/src/bin/d2/nc_remove.cc
+@@ -268,7 +268,7 @@ NameRemoveTransaction::removingFwdAddrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_FORWARD_REMOVE_ADDRS_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -404,7 +404,7 @@ NameRemoveTransaction::removingFwdRRsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_FORWARD_REMOVE_RRS_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -555,7 +555,7 @@ NameRemoveTransaction::removingRevPtrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_REVERSE_REMOVE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+diff --git a/src/bin/d2/simple_add.cc b/src/bin/d2/simple_add.cc
+index 6113b4d..73aa5b4 100644
+--- a/src/bin/d2/simple_add.cc
++++ b/src/bin/d2/simple_add.cc
+@@ -259,7 +259,7 @@ SimpleAddTransaction::replacingFwdAddrsHandler() {
+             // bigger is wrong.
+             LOG_ERROR(d2_to_dns_logger, DHCP_DDNS_FORWARD_ADD_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -404,7 +404,7 @@ SimpleAddTransaction::replacingRevPtrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_REVERSE_REPLACE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+diff --git a/src/bin/d2/simple_add_without_dhcid.cc b/src/bin/d2/simple_add_without_dhcid.cc
+index ccea83a..97918ad 100644
+--- a/src/bin/d2/simple_add_without_dhcid.cc
++++ b/src/bin/d2/simple_add_without_dhcid.cc
+@@ -260,7 +260,7 @@ SimpleAddWithoutDHCIDTransaction::replacingFwdAddrsHandler() {
+             // bigger is wrong.
+             LOG_ERROR(d2_to_dns_logger, DHCP_DDNS_FORWARD_ADD_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -406,7 +406,7 @@ SimpleAddWithoutDHCIDTransaction::replacingRevPtrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_REVERSE_REPLACE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+diff --git a/src/bin/d2/simple_remove.cc b/src/bin/d2/simple_remove.cc
+index e1d9a78..14f416b 100644
+--- a/src/bin/d2/simple_remove.cc
++++ b/src/bin/d2/simple_remove.cc
+@@ -272,7 +272,7 @@ SimpleRemoveTransaction::removingFwdRRsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_FORWARD_REMOVE_RRS_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -423,7 +423,7 @@ SimpleRemoveTransaction::removingRevPtrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_REVERSE_REMOVE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+diff --git a/src/bin/d2/simple_remove_without_dhcid.cc b/src/bin/d2/simple_remove_without_dhcid.cc
+index 04fe4df..cefdda8 100644
+--- a/src/bin/d2/simple_remove_without_dhcid.cc
++++ b/src/bin/d2/simple_remove_without_dhcid.cc
+@@ -273,7 +273,7 @@ SimpleRemoveWithoutDHCIDTransaction::removingFwdRRsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_FORWARD_REMOVE_RRS_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+@@ -425,7 +425,7 @@ SimpleRemoveWithoutDHCIDTransaction::removingRevPtrsHandler() {
+             LOG_ERROR(d2_to_dns_logger,
+                       DHCP_DDNS_REVERSE_REMOVE_BAD_DNSCLIENT_STATUS)
+                       .arg(getRequestId())
+-                      .arg(getDnsUpdateStatus())
++                      .arg(static_cast<int>(getDnsUpdateStatus()))
+                       .arg(getNcr()->getFqdn())
+                       .arg(getCurrentServer()->toText());
+ 
+diff --git a/src/bin/dhcp4/dhcp4_srv.cc b/src/bin/dhcp4/dhcp4_srv.cc
+index 0701ed4..471e94c 100644
+--- a/src/bin/dhcp4/dhcp4_srv.cc
++++ b/src/bin/dhcp4/dhcp4_srv.cc
+@@ -5101,7 +5101,7 @@ Dhcpv4Srv::d2ClientErrorHandler(const
+                                 dhcp_ddns::NameChangeSender::Result result,
+                                 dhcp_ddns::NameChangeRequestPtr& ncr) {
+     LOG_ERROR(ddns4_logger, DHCP4_DDNS_REQUEST_SEND_FAILED).
+-              arg(result).arg((ncr ? ncr->toText() : " NULL "));
++              arg(static_cast<int>(result)).arg((ncr ? ncr->toText() : " NULL "));
+     // We cannot communicate with kea-dhcp-ddns, suspend further updates.
+     /// @todo We may wish to revisit this, but for now we will simply turn
+     /// them off.
+diff --git a/src/bin/dhcp6/dhcp6_srv.cc b/src/bin/dhcp6/dhcp6_srv.cc
+index 417960b..818046d 100644
+--- a/src/bin/dhcp6/dhcp6_srv.cc
++++ b/src/bin/dhcp6/dhcp6_srv.cc
+@@ -5054,7 +5054,7 @@ Dhcpv6Srv::d2ClientErrorHandler(const
+                                 dhcp_ddns::NameChangeSender::Result result,
+                                 dhcp_ddns::NameChangeRequestPtr& ncr) {
+     LOG_ERROR(ddns6_logger, DHCP6_DDNS_REQUEST_SEND_FAILED).
+-              arg(result).arg((ncr ? ncr->toText() : " NULL "));
++              arg(static_cast<int>(result)).arg((ncr ? ncr->toText() : " NULL "));
+     // We cannot communicate with kea-dhcp-ddns, suspend further updates.
+     /// @todo We may wish to revisit this, but for now we will simply turn
+     /// them off.
+diff --git a/src/hooks/dhcp/radius/radius_accounting.cc b/src/hooks/dhcp/radius/radius_accounting.cc
+index 30eb07e..31f6d5e 100644
+--- a/src/hooks/dhcp/radius/radius_accounting.cc
++++ b/src/hooks/dhcp/radius/radius_accounting.cc
+@@ -760,7 +760,7 @@ RadiusAccounting::terminate(RadiusAcctEnv env, int result) {
+     if (result != OK_RC) {
+         LOG_ERROR(radius_logger, RADIUS_ACCOUNTING_ERROR)
+             .arg(env.session_id_)
+-            .arg(env.event_)
++            .arg(static_cast<int>(env.event_))
+             .arg(eventToText(env.event_))
+             .arg(result)
+             .arg(exchangeRCtoText(result));
+diff --git a/src/lib/dhcpsrv/csv_lease_file6.cc b/src/lib/dhcpsrv/csv_lease_file6.cc
+index 830d2e5..a899aef 100644
+--- a/src/lib/dhcpsrv/csv_lease_file6.cc
++++ b/src/lib/dhcpsrv/csv_lease_file6.cc
+@@ -51,7 +51,7 @@ CSVLeaseFile6::append(const Lease6& lease) {
+     row.writeAt(getColumnIndex("expire"), static_cast<uint64_t>(lease.cltt_) + lease.valid_lft_);
+     row.writeAt(getColumnIndex("subnet_id"), lease.subnet_id_);
+     row.writeAt(getColumnIndex("pref_lifetime"), lease.preferred_lft_);
+-    row.writeAt(getColumnIndex("lease_type"), lease.type_);
++    row.writeAt(getColumnIndex("lease_type"), isc::dhcp::Lease::typeToText(lease.type_));
+     row.writeAt(getColumnIndex("iaid"), lease.iaid_);
+     row.writeAt(getColumnIndex("prefix_len"),
+                 static_cast<int>(lease.prefixlen_));
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index 8dc6bdfea80..cc34c05093a 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://0001-build-boost-1.89.0-fixes.patch \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
+           file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch \
            "
 SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a24c566"
 

