Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB476CA1014
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 05:15:17 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.32223.1756962913190393219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 22:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jPr3GnGL;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b482fd89b0eso491789a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 22:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756962912; x=1757567712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LDXysSCEYLDJsxfOW/P1dwFM5FzOe56VbycGTKIFoHU=;
        b=jPr3GnGLm43w7zmtY/3wS6t3tuc/REPi3fesKZiPrNdkin+EOuZxW04nDY8vxYRQTe
         64sABeVIEpmlMGkf8fggLKrkmnthvFRvUmnAd4lA6CRr9EB/GHwbhvdYGR5Z4HX5hT7D
         Uup7I13xJoF7mr8N6wacTu9ZP52dl5O/kmiv0AUea058PwZU6KTLtIxGUIs51o0LcoI/
         iU/U3kqR4nGvdOn6pYJOZexuNTVieF2H0gvZl95oFu8ysg78TSRB6zgBo0zeLx6X1kCz
         kcO08mJZFRxPYppazt2H2anubYlkn4PA26r41xRa+VvQg8xwfX6KPDTbEkHsqzAyphNr
         4qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756962912; x=1757567712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDXysSCEYLDJsxfOW/P1dwFM5FzOe56VbycGTKIFoHU=;
        b=iJIqviGUcDA4J/rzDvXtc6o/QL9G821JXFln+4ptjyjS9ewqiL/MOBACk8hetveoqR
         KzLMSl2JuTDj8d+NjJJJIXfgksSU3eotUrd4Ma1eL9tOioDuVQBLQ3P3dYqERgHxBH2e
         Ekc9MrmCOJDu/j5NTB5nSIVwogGYI9z9tgh/mf5BnSfouDlzIGjkKVzgndOEex7L+pJC
         0DSq0r1Dk2IQ/MNiDj1twee5ZWmoSyKB2bDRyx7Gzi1p9OSkkf9Q50pX3xSRANhGt1Bz
         MupVS5sF66ke3UHw+x0ix1D2gr73nWcctdDwOS6w1PORkrBF3ZntlS7AgFETsw9QbkEB
         IVOA==
X-Gm-Message-State: AOJu0YwUAwYMAmGx9246xG9n/FV7C8Tedh8SZ07dbXRBDpYcbb5E+NMI
	gV1tsfDY/PQlFpNv5+8DLcHSJgoXd127ZO7dNFpBgUDDmcYBLAeFgjHIybT81pz5
X-Gm-Gg: ASbGnctYANEyyaZvfXCkktpQ0my7LmfXpXpbHH4z3DVA2jHtPlydMOW0m0Yf4X85wui
	YAtZcfTLM8BzurhDFFm+sTYtyUpXijv7rl7gZ0kaCQF/7xSgQHe+Gyl5NJfBsxiU7wnEFveIeQO
	0T2gjFPkSMTFGDvnNqwAvW/GFcQX0FMNqFOyO55A3cnAo7qTw4+zAekkRZYscsv0502hzKFiPtS
	Rc6x9vtbghSczvkGnfw1De+MQlkwDQqYS7VS3URV1CPBxHJj0t30PmriYWME7mKCbvLxwIQdkdE
	0Y20O1m9CcenOlYIFZBB/3Hidi3RkJXzcwecREXYjaGBm/95dje2alv+Yi6w/0p/Ii810xftt6i
	ntMBz+G45BsR6gi3LO2D7eFK+0GXRx/44MW/jUiCbKAifOVo7Y6tB7YVKkGjCR8nqnw3Z04cO4p
	/D2xJrWu4OIg+y/r4jzu4n1NKfGyurb+yF/t0knJWurbbFAVeThY7Z6IJ1mAWS7g==
X-Google-Smtp-Source: AGHT+IEhOdjfkn+cWTrUZQYmcoIpFPkBkx3TsuRlVNth+qQbLa9GH/BE1HH9p0ef8kCOWId9+R7JrA==
X-Received: by 2002:a17:902:e551:b0:246:d3a1:c6c4 with SMTP id d9443c01a7336-249448d8a65mr235199545ad.16.1756962911930;
        Wed, 03 Sep 2025 22:15:11 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ecee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d93317f0sm18756121a91.6.2025.09.03.22.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:15:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/3] kea: Fix build with clang/libc++ 21
Date: Wed,  3 Sep 2025 22:15:07 -0700
Message-ID: <20250904051509.798465-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 05:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222897

Clang with libc++ hardening on, rejects Boost’s enum trait probe
which is ill-formed for scoped/limited
enums whose valid range does not include −1
(e.g. enums with values [0..3])

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

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
 

