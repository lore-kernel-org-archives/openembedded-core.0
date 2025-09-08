Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501BFCA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 21:07:09 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.6070.1757365621307148049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 14:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wdd5LyXO;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7728a8862ccso4223620b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 14:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757365620; x=1757970420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xckOJbFvSE2ki7Rge8e8Es1yX0IOnDyQhSkvTlTit0Y=;
        b=Wdd5LyXOFHQ/uuCrixiF/pRIZC1MHpGwTJPD5XBNv72PK9wnOMLS2+IEaOHuajTbA8
         Uu7xaCgCs1wFFQCk2ReXBluiZZbHLC8n4N4pbbvVCimkT4iRE/ZY/5kONKsFveDlztlz
         RCir99HFoS13Num+bOxxhGPwT6QWPGns9EIPy5N2SVM1cI6a4HKM0c2H7vJ3Uz5BcNoJ
         a0wMvwHgh9YlF0DxoThP5csgJ9UB6QeVe7R+8P1bFo69TKD1Oq6CE5R84d4QUIK2NQie
         SxahtUbV9Lj7bWACKUOTdOT0lO88qz1sGHFxHiV1+/CjdCDNtaKhucrr2hOFrk0mR2EA
         f89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757365620; x=1757970420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xckOJbFvSE2ki7Rge8e8Es1yX0IOnDyQhSkvTlTit0Y=;
        b=i7+UIwSdyE5AurhMlUMt+b9XdG25igCckwnHVdKLAWYuMVf+HFPcZOUlpdsA6LS5vW
         R7sbPANLQaFdqAMbjfqOqljg5HY81iKSLspA0yPBRqcpUO4LCsxlzYpEXoMX+cYALWja
         BPql3RDpChDl53QAQhpgKLIlgc5X4h99QmN3xgTWilC9D9tsYEURHwxxR555dOOtEZ8p
         cwplt7CGWdOsmNbwdmvDxDZ7lO2L3b7NRZGBKSlkJiP5vsI+WCtmvwA9meVC0x/B26MN
         zuAzgGskmqmL27pucDpp5gPg0Y6Glm1km+Tt3rx/Av185VvoUlmPh3VoZR0D/brMfxtY
         FI9Q==
X-Gm-Message-State: AOJu0YyTApkAYm/zNt36ks1XND+TcDBAdXBKjRo7DrnWZKEVeLzp/nfo
	81GbrA2p2U0du1BAFM4l2Es4xkxTOcyFVOIbbsM4L5eN8S15UFnQRSuncOxMhUCj
X-Gm-Gg: ASbGnctupbbvidqwnZONr/oZsCzRYyFOuyI8kwn2INrn5UZtKUfg1JnTVytV+XWkSVl
	kk3HMsI0C01CWhRJcWcwlY6rMgLSKJJjosXIe/Xf18wIB9Ni2Y1nAxlZ4+IEq8TDvhVKgIiQQ3g
	fw+H7LtZtKDeL2DubM0hL2CdQdoLD3O4Es1D7xKMF5gf89eeNGJ6rZOlvsfYPLM5Z5wIE70zGbz
	nlwWPpdUS2sra96JnS4Mk0kGJfuGixXZTrJe/Wj8Kxc9xLHjUDmursDTP+/qa6XK2/hmrowg1D7
	37ClJWjAGPf67ElrzXoO+TAiZoAGXIN++GZiBLyjrktTriUrGLLAIWivVnyT+3oHsuUNlCvsPN9
	LW/QmGSet4bdOq1UZ7zZ33x6zdOC/bapwqZLNfG8+T9B2r40fvy1bb/DxGeVX7t7HZjdbBvZdI5
	zqrn+XB6rr4fupmGEyhF2k4IJ3O3Ew6R+jkti06LSP
X-Google-Smtp-Source: AGHT+IFpXVhqCrbZFvCgUIQ7uXtXMNpy0oZDCw5zh2rIwAhTw+d26KPXt0Q1k3iW0+Hv04QVLgJweQ==
X-Received: by 2002:a05:6a20:7291:b0:243:78a:82d1 with SMTP id adf61e73a8af0-2537ef037afmr13117075637.30.1757365619972;
        Mon, 08 Sep 2025 14:06:59 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fe29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32bdbef7f2csm9982888a91.27.2025.09.08.14.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:06:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 1/3] kea: Fix build with clang/libc++ 21
Date: Mon,  8 Sep 2025 14:06:55 -0700
Message-ID: <20250908210657.2959408-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 21:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223080

Clang with libc++ hardening on, rejects Boost’s enum trait probe
which is ill-formed for scoped/limited
enums whose valid range does not include −1
(e.g. enums with values [0..3])

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: No change
v4: No change

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
 

