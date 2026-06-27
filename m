Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF554C43211
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 07:55:46 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51400.1782546943356160468
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 00:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NFfrXvIy;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47122683cf3so49733f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782546941; x=1783151741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WgGH/psEIuCbSWzKDZXxWa5FKetsVm6PIel5PZ4SKM=;
        b=NFfrXvIynOKfogXWVCBf5t+wL7CxsZWdDSUYDXspqE+0vMvo57P4AHN+JdYPNbMo8N
         7ZTeZed+BE/NVssyrycBGtFhE/nq26Hk4qd0isImRrIqCY82rLAnOHVYRe+mTp1mkRJ3
         ojsxjmer8L4MVmtfuAetXMM4n3qG193p1jgcHr1p7tylf7eKq58AUUa42qgmO1rHIeMG
         QfP6w+YJc7Wk0vBxtH1Mmwrh+aa0Pvve4spKoXogXzIh7WKbENF/3eTaREUV/GKV5FGq
         pywDW57Ck+b+wMeNC5/OoRT9qGSHmctAFsHciESMGRhTfaT2buIR9T1lz98xM5el4jMh
         IBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782546941; x=1783151741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3WgGH/psEIuCbSWzKDZXxWa5FKetsVm6PIel5PZ4SKM=;
        b=mE2AlgpULbA1njUfvlIQOyiFNoyGP6SYoCmGPudAgOR+YqMM0qPRPpRR7CCw+44aXS
         ZQo9tCQ5Hl7ete76beigD1VlqS/eEMtxPYKXxosX57i/7s4LTC6/Rdywh3hPC8eeSrgi
         B03ZjVjiTp/25JPKVRCalO2mEcu1MQY+PVeJHHvJl0Ogeu4gnecth0cp9+Va4jLB9cxg
         9OZhZO0zkpS8PcNBh6DOhpqxn4Qg7TlhnM4DEUpsguY/UncTdUyiis29ZsnNA2+hTKuE
         Fma0Fp9PjSW/8svXXGvSIqWJTc0xtkk9I8oIEqil/c//269yD57T8b2sDAO2TVJNlaJZ
         XXbA==
X-Gm-Message-State: AOJu0Yw0SLbXJCko4RULg20wg6v/d3PftjL/rffnau/igM9chbR7w8/m
	AA/j5xMlGrb0A/lnPbwf0IC+pWxOsB7Fv+S2Ws4Fo+/aE1LaybnI/NlLg2oXB7roFy0=
X-Gm-Gg: AfdE7cl3KMk9M/OZwJivaFWGn/VRmCRfZc2XfsGGSJjPNhTfBdLU9ZOmgHkdP7svyCz
	xdmUhc6uTNdQ9pTuXAupU43BeEbsXy8PYPC1bQCS5P8hxjRjbfsyMELHSHndtbd5p6UGsQlFc3D
	y+Ah8lHZJr3ytrRbn1TW38LpSOkL9IYnK09lboTb4YGsiYcuXp9nOwMcw5XGTInm1R8U3w8MvCb
	0BT/LgoCJlOxEvRtNH5zrMI8t1ybAeNh9kocLRLBh0Q/AYe80LevNO+5VyVw3CRBwyLgXVIMa9x
	Lg+28xHNblbfJZnPOxaBP+rhA0w7AXzZwfugthBABaUeP/IEHmZD0xv91UFOb2Sb7BhMasKK9DW
	MSQ4i4dPIjb5SCkIVboPr9JAZleRJvm9cXIUncnAucPHPHMAjQ/hoGifqSflo3PsmFYyIwrlntj
	mkPahKKy2PA3WTJjqTdkSloqI+dmU/PXNlpxKZ+LKx780ZjUDe
X-Received: by 2002:a05:6000:29ca:b0:462:fdf2:3a50 with SMTP id ffacd0b85a97d-46fb8d936aamr4537031f8f.32.1782546941136;
        Sat, 27 Jun 2026 00:55:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f4ffc11d9sm11421952f8f.37.2026.06.27.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 00:55:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/8] kea: upgrade 3.0.3 -> 3.2.0
Date: Sat, 27 Jun 2026 09:55:28 +0200
Message-ID: <20260627075532.3153679-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627075532.3153679-1-alex.kanavin@gmail.com>
References: <20260627075532.3153679-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 07:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239690

From: Alexander Kanavin <alex@linutronix.de>

Drop patches, as they're either backports
or not necessary anymore (issue solved upstream
differently).

Drop a chunk from fix-multilib-conflict.patch
as the file has been removed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-build-boost-1.89.0-fixes.patch |  59 ---
 ...s-dhcpsrv-Avoid-Boost-lexical_cast-o.patch | 348 ------------------
 ...se-a-runtime-safe-interpreter-string.patch |  20 +-
 .../0001-mk_cfgrpt.sh-strip-prefixes.patch    |   2 +-
 ...er_level_impl.cc-add-a-missing-inclu.patch |  24 --
 ...er_unittest_support.cc-do-not-write-.patch |   6 +-
 .../kea/files/fix-multilib-conflict.patch     |  27 +-
 .../kea/{kea_3.0.3.bb => kea_3.2.0.bb}        |   5 +-
 8 files changed, 21 insertions(+), 470 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
 rename meta/recipes-connectivity/kea/{kea_3.0.3.bb => kea_3.2.0.bb} (93%)

diff --git a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
deleted file mode 100644
index 46a1e38eae..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From c7d1036c6476ddca79a6beb03604a2364d7c469e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 27 Aug 2025 22:20:09 -0700
-Subject: [PATCH] build: boost 1.89.0 fixes
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2771/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build                        | 4 ++--
- src/lib/asiodns/io_fetch.cc        | 1 +
- src/lib/asiolink/interval_timer.cc | 1 +
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 8ed5b2d..d5723ba 100644
---- a/meson.build
-+++ b/meson.build
-@@ -189,7 +189,7 @@ message(f'Detected system "@SYSTEM@".')
- 
- #### Dependencies
- 
--boost_dep = dependency('boost', version: '>=1.66', modules: ['system'])
-+boost_dep = dependency('boost', version: '>=1.66')
- dl_dep = dependency('dl')
- threads_dep = dependency('threads')
- add_project_dependencies(boost_dep, dl_dep, threads_dep, language: ['cpp'])
-@@ -1094,7 +1094,7 @@ pkg.generate(
- if TARGETS_GEN_MESSAGES.length() > 0
-     alias_target('messages', TARGETS_GEN_MESSAGES)
- else
--    error(
-+    warning(
-         'No messages to generate. This is probably an error in the meson.build files.',
-     )
- endif
-diff --git a/src/lib/asiodns/io_fetch.cc b/src/lib/asiodns/io_fetch.cc
-index c140676..94f46fa 100644
---- a/src/lib/asiodns/io_fetch.cc
-+++ b/src/lib/asiodns/io_fetch.cc
-@@ -22,6 +22,7 @@
- #include <dns/rcode.h>
- #include <util/io.h>
- 
-+#include <boost/asio/deadline_timer.hpp>
- #include <boost/scoped_ptr.hpp>
- #include <boost/date_time/posix_time/posix_time_types.hpp>
- 
-diff --git a/src/lib/asiolink/interval_timer.cc b/src/lib/asiolink/interval_timer.cc
-index fa0d9e1..1410a85 100644
---- a/src/lib/asiolink/interval_timer.cc
-+++ b/src/lib/asiolink/interval_timer.cc
-@@ -9,6 +9,7 @@
- #include <asiolink/interval_timer.h>
- #include <asiolink/io_service.h>
- 
-+#include <boost/asio/deadline_timer.hpp>
- #include <boost/enable_shared_from_this.hpp>
- #include <boost/noncopyable.hpp>
- #include <boost/shared_ptr.hpp>
diff --git a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
deleted file mode 100644
index 7c24a3a27c..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
+++ /dev/null
@@ -1,348 +0,0 @@
-From 4a507d1822cbfb561657ed9a8ccb0dfeced30cac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 3 Sep 2025 12:52:51 -0700
-Subject: [PATCH] d2/dhcp[46]/radius/dhcpsrv: Avoid Boost lexical_cast on enums
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Clang with libc++ hardening (-D_LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_FAST)
-rejects Boost's enum trait probe used by `boost::lexical_cast`:
-`boost::type_traits::is_signed/is_unsigned` defines
-`static const T minus_one = (T)-1;`, which is ill-formed for scoped/limited
-enums whose valid range does not include −1 (e.g. enums with values [0..3]).
-When an enum is passed to `lexical_cast<std::string>`, this triggers errors like:
-
-  error: in-class initializer for static data member is not a constant expression
-    ... minus_one = (static_cast<no_cv_t>(-1));
-
-In Kea this surfaced via logging `.arg(enum_value)` and when writing
-`Lease6::type_` to CSV.
-
-This change makes all such call sites avoid `lexical_cast` on enums:
-
-* d2 transactions (`check_exists_*`, `nc_*`, `simple_*`):
-  cast `getDnsUpdateStatus()` to `int` before passing to `.arg(...)`.
-
-* d2 queue manager (`d2_queue_mgr.cc`):
-  cast `mgr_state_` to `int` before logging.
-
-* DHCPv4/6 servers (`dhcp4_srv.cc`, `dhcp6_srv.cc`):
-  cast `dhcp_ddns::NameChangeSender::Result` to `int` before logging.
-
-* RADIUS hook (`radius_accounting.cc`):
-  cast `env.event_` to `int` for the numeric field; we still log the textual
-  form via `eventToText(event_)` in the next argument.
-
-* DHCPv6 CSV writer (`csv_lease_file6.cc`):
-  write `lease_type` using `isc::dhcp::Lease::typeToText(lease.type_)`
-  instead of passing the enum directly. This is human-readable and uses Kea’s
-  own canonical stringifier, while avoiding the Boost enum path entirely.
-
-why:
-
-- Prevents Boost from instantiating enum trait checks that cast −1 to an enum.
-- Unblocks builds with recent Clang/libc++ hardening.
-- Keeps log output stable (numeric codes retained) and improves CSV clarity
-  for lease type by using the provided textual converter.
-
-No functional/ABI changes; only formatting of certain log/CSV values.
-If a downstream consumer expects a numeric `lease_type`, it can be adjusted
-to parse the textual value or the change can be trivially flipped to
-`static_cast<unsigned>(lease.type_)`.
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/4100]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/bin/d2/check_exists_add.cc             | 6 +++---
- src/bin/d2/check_exists_remove.cc          | 6 +++---
- src/bin/d2/d2_queue_mgr.cc                 | 2 +-
- src/bin/d2/nc_add.cc                       | 6 +++---
- src/bin/d2/nc_remove.cc                    | 6 +++---
- src/bin/d2/simple_add.cc                   | 4 ++--
- src/bin/d2/simple_add_without_dhcid.cc     | 4 ++--
- src/bin/d2/simple_remove.cc                | 4 ++--
- src/bin/d2/simple_remove_without_dhcid.cc  | 4 ++--
- src/bin/dhcp4/dhcp4_srv.cc                 | 2 +-
- src/bin/dhcp6/dhcp6_srv.cc                 | 2 +-
- src/hooks/dhcp/radius/radius_accounting.cc | 2 +-
- src/lib/dhcpsrv/csv_lease_file6.cc         | 2 +-
- 13 files changed, 25 insertions(+), 25 deletions(-)
-
-diff --git a/src/bin/d2/check_exists_add.cc b/src/bin/d2/check_exists_add.cc
-index 11bb29f..edfef31 100644
---- a/src/bin/d2/check_exists_add.cc
-+++ b/src/bin/d2/check_exists_add.cc
-@@ -270,7 +270,7 @@ CheckExistsAddTransaction::addingFwdAddrsHandler() {
-             // bigger is wrong.
-             LOG_ERROR(d2_to_dns_logger, DHCP_DDNS_FORWARD_ADD_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -397,7 +397,7 @@ CheckExistsAddTransaction::replacingFwdAddrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_FORWARD_REPLACE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -541,7 +541,7 @@ CheckExistsAddTransaction::replacingRevPtrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_REVERSE_REPLACE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-diff --git a/src/bin/d2/check_exists_remove.cc b/src/bin/d2/check_exists_remove.cc
-index 8ae5296..8b6b221 100644
---- a/src/bin/d2/check_exists_remove.cc
-+++ b/src/bin/d2/check_exists_remove.cc
-@@ -268,7 +268,7 @@ CheckExistsRemoveTransaction::removingFwdAddrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_FORWARD_REMOVE_ADDRS_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -404,7 +404,7 @@ CheckExistsRemoveTransaction::removingFwdRRsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_FORWARD_REMOVE_RRS_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -556,7 +556,7 @@ CheckExistsRemoveTransaction::removingRevPtrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_REVERSE_REMOVE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-diff --git a/src/bin/d2/d2_queue_mgr.cc b/src/bin/d2/d2_queue_mgr.cc
-index f902b22..effa56b 100644
---- a/src/bin/d2/d2_queue_mgr.cc
-+++ b/src/bin/d2/d2_queue_mgr.cc
-@@ -78,7 +78,7 @@ D2QueueMgr::operator()(const dhcp_ddns::NameChangeListener::Result result,
-                 // this is unexpected so we will treat it as a receive error.
-                 // This is most likely an unforeseen programmatic issue.
-                 LOG_ERROR(dhcp_to_d2_logger, DHCP_DDNS_QUEUE_MGR_UNEXPECTED_STOP)
--                          .arg(mgr_state_);
-+                          .arg(static_cast<int>(mgr_state_));
-                 stopListening(STOPPED_RECV_ERROR);
-             }
- 
-diff --git a/src/bin/d2/nc_add.cc b/src/bin/d2/nc_add.cc
-index 7bffc16..1d17bb2 100644
---- a/src/bin/d2/nc_add.cc
-+++ b/src/bin/d2/nc_add.cc
-@@ -272,7 +272,7 @@ NameAddTransaction::addingFwdAddrsHandler() {
-             // bigger is wrong.
-             LOG_ERROR(d2_to_dns_logger, DHCP_DDNS_FORWARD_ADD_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -399,7 +399,7 @@ NameAddTransaction::replacingFwdAddrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_FORWARD_REPLACE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -542,7 +542,7 @@ NameAddTransaction::replacingRevPtrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_REVERSE_REPLACE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-diff --git a/src/bin/d2/nc_remove.cc b/src/bin/d2/nc_remove.cc
-index 874e43b..182343c 100644
---- a/src/bin/d2/nc_remove.cc
-+++ b/src/bin/d2/nc_remove.cc
-@@ -268,7 +268,7 @@ NameRemoveTransaction::removingFwdAddrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_FORWARD_REMOVE_ADDRS_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -404,7 +404,7 @@ NameRemoveTransaction::removingFwdRRsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_FORWARD_REMOVE_RRS_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -555,7 +555,7 @@ NameRemoveTransaction::removingRevPtrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_REVERSE_REMOVE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-diff --git a/src/bin/d2/simple_add.cc b/src/bin/d2/simple_add.cc
-index 6113b4d..73aa5b4 100644
---- a/src/bin/d2/simple_add.cc
-+++ b/src/bin/d2/simple_add.cc
-@@ -259,7 +259,7 @@ SimpleAddTransaction::replacingFwdAddrsHandler() {
-             // bigger is wrong.
-             LOG_ERROR(d2_to_dns_logger, DHCP_DDNS_FORWARD_ADD_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -404,7 +404,7 @@ SimpleAddTransaction::replacingRevPtrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_REVERSE_REPLACE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-diff --git a/src/bin/d2/simple_add_without_dhcid.cc b/src/bin/d2/simple_add_without_dhcid.cc
-index ccea83a..97918ad 100644
---- a/src/bin/d2/simple_add_without_dhcid.cc
-+++ b/src/bin/d2/simple_add_without_dhcid.cc
-@@ -260,7 +260,7 @@ SimpleAddWithoutDHCIDTransaction::replacingFwdAddrsHandler() {
-             // bigger is wrong.
-             LOG_ERROR(d2_to_dns_logger, DHCP_DDNS_FORWARD_ADD_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -406,7 +406,7 @@ SimpleAddWithoutDHCIDTransaction::replacingRevPtrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_REVERSE_REPLACE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-diff --git a/src/bin/d2/simple_remove.cc b/src/bin/d2/simple_remove.cc
-index e1d9a78..14f416b 100644
---- a/src/bin/d2/simple_remove.cc
-+++ b/src/bin/d2/simple_remove.cc
-@@ -272,7 +272,7 @@ SimpleRemoveTransaction::removingFwdRRsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_FORWARD_REMOVE_RRS_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -423,7 +423,7 @@ SimpleRemoveTransaction::removingRevPtrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_REVERSE_REMOVE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-diff --git a/src/bin/d2/simple_remove_without_dhcid.cc b/src/bin/d2/simple_remove_without_dhcid.cc
-index 04fe4df..cefdda8 100644
---- a/src/bin/d2/simple_remove_without_dhcid.cc
-+++ b/src/bin/d2/simple_remove_without_dhcid.cc
-@@ -273,7 +273,7 @@ SimpleRemoveWithoutDHCIDTransaction::removingFwdRRsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_FORWARD_REMOVE_RRS_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-@@ -425,7 +425,7 @@ SimpleRemoveWithoutDHCIDTransaction::removingRevPtrsHandler() {
-             LOG_ERROR(d2_to_dns_logger,
-                       DHCP_DDNS_REVERSE_REMOVE_BAD_DNSCLIENT_STATUS)
-                       .arg(getRequestId())
--                      .arg(getDnsUpdateStatus())
-+                      .arg(static_cast<int>(getDnsUpdateStatus()))
-                       .arg(getNcr()->getFqdn())
-                       .arg(getCurrentServer()->toText());
- 
-diff --git a/src/bin/dhcp4/dhcp4_srv.cc b/src/bin/dhcp4/dhcp4_srv.cc
-index a6be662..1de57cd 100644
---- a/src/bin/dhcp4/dhcp4_srv.cc
-+++ b/src/bin/dhcp4/dhcp4_srv.cc
-@@ -5116,7 +5116,7 @@ Dhcpv4Srv::d2ClientErrorHandler(const
-                                 dhcp_ddns::NameChangeSender::Result result,
-                                 dhcp_ddns::NameChangeRequestPtr& ncr) {
-     LOG_ERROR(ddns4_logger, DHCP4_DDNS_REQUEST_SEND_FAILED).
--              arg(result).arg((ncr ? ncr->toText() : " NULL "));
-+              arg(static_cast<int>(result)).arg((ncr ? ncr->toText() : " NULL "));
-     // We cannot communicate with kea-dhcp-ddns, suspend further updates.
-     /// @todo We may wish to revisit this, but for now we will simply turn
-     /// them off.
-diff --git a/src/bin/dhcp6/dhcp6_srv.cc b/src/bin/dhcp6/dhcp6_srv.cc
-index f999c31..acf19d0 100644
---- a/src/bin/dhcp6/dhcp6_srv.cc
-+++ b/src/bin/dhcp6/dhcp6_srv.cc
-@@ -5061,7 +5061,7 @@ Dhcpv6Srv::d2ClientErrorHandler(const
-                                 dhcp_ddns::NameChangeSender::Result result,
-                                 dhcp_ddns::NameChangeRequestPtr& ncr) {
-     LOG_ERROR(ddns6_logger, DHCP6_DDNS_REQUEST_SEND_FAILED).
--              arg(result).arg((ncr ? ncr->toText() : " NULL "));
-+              arg(static_cast<int>(result)).arg((ncr ? ncr->toText() : " NULL "));
-     // We cannot communicate with kea-dhcp-ddns, suspend further updates.
-     /// @todo We may wish to revisit this, but for now we will simply turn
-     /// them off.
-diff --git a/src/hooks/dhcp/radius/radius_accounting.cc b/src/hooks/dhcp/radius/radius_accounting.cc
-index 30eb07e..31f6d5e 100644
---- a/src/hooks/dhcp/radius/radius_accounting.cc
-+++ b/src/hooks/dhcp/radius/radius_accounting.cc
-@@ -760,7 +760,7 @@ RadiusAccounting::terminate(RadiusAcctEnv env, int result) {
-     if (result != OK_RC) {
-         LOG_ERROR(radius_logger, RADIUS_ACCOUNTING_ERROR)
-             .arg(env.session_id_)
--            .arg(env.event_)
-+            .arg(static_cast<int>(env.event_))
-             .arg(eventToText(env.event_))
-             .arg(result)
-             .arg(exchangeRCtoText(result));
-diff --git a/src/lib/dhcpsrv/csv_lease_file6.cc b/src/lib/dhcpsrv/csv_lease_file6.cc
-index 830d2e5..a899aef 100644
---- a/src/lib/dhcpsrv/csv_lease_file6.cc
-+++ b/src/lib/dhcpsrv/csv_lease_file6.cc
-@@ -51,7 +51,7 @@ CSVLeaseFile6::append(const Lease6& lease) {
-     row.writeAt(getColumnIndex("expire"), static_cast<uint64_t>(lease.cltt_) + lease.valid_lft_);
-     row.writeAt(getColumnIndex("subnet_id"), lease.subnet_id_);
-     row.writeAt(getColumnIndex("pref_lifetime"), lease.preferred_lft_);
--    row.writeAt(getColumnIndex("lease_type"), lease.type_);
-+    row.writeAt(getColumnIndex("lease_type"), isc::dhcp::Lease::typeToText(lease.type_));
-     row.writeAt(getColumnIndex("iaid"), lease.iaid_);
-     row.writeAt(getColumnIndex("prefix_len"),
-                 static_cast<int>(lease.prefixlen_));
diff --git a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
index 3740c4abc7..20a68e5e56 100644
--- a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
+++ b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
@@ -1,4 +1,4 @@
-From f7024a5e7153538072a57858e1b48bbb806167e7 Mon Sep 17 00:00:00 2001
+From 312f5b7e8286c306502bed348fe5da765c20f98d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:02:49 -0700
 Subject: [PATCH] meson: use a runtime-safe interpreter string
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 40 insertions(+), 6 deletions(-)
 
 diff --git a/doc/sphinx/meson.build b/doc/sphinx/meson.build
-index 74ba705..71f1c7b 100644
+index 5fc5ee9..6485ce2 100644
 --- a/doc/sphinx/meson.build
 +++ b/doc/sphinx/meson.build
 @@ -70,7 +70,13 @@ doc_conf.set('builddir', meson.current_build_dir())
@@ -44,10 +44,10 @@ index 74ba705..71f1c7b 100644
  if PDFLATEX.found()
      doc_conf.set('HAVE_PDFLATEX', 'yes')
 diff --git a/meson.build b/meson.build
-index d5723ba..3bb5185 100644
+index f3ef0ea..11a41cf 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -638,9 +638,13 @@ link_args = []
+@@ -648,9 +648,13 @@ link_args = []
  # Also, Meson might use it by default, but might not use it on all systems, so lots of variables...
  # EXECUTABLE_RPATH = f'$ORIGIN/../@LIBDIR@'
  # HOOK_RPATH = '$ORIGIN/../..'
@@ -62,7 +62,7 @@ index d5723ba..3bb5185 100644
  
  # Add rpaths for NETCONF dependencies.
  if NETCONF_DEP.found()
-@@ -759,7 +763,13 @@ report_conf_data.set('CXX_ARGS', ' '.join(compile_args))
+@@ -769,7 +773,13 @@ report_conf_data.set('CXX_ARGS', ' '.join(compile_args))
  report_conf_data.set('LD_ID', cpp.get_linker_id())
  link_args += get_option('cpp_link_args')
  report_conf_data.set('LD_ARGS', ' '.join(link_args))
@@ -76,9 +76,9 @@ index d5723ba..3bb5185 100644
 +report_conf_data.set('PYTHON_PATH', py_for_runtime)
  report_conf_data.set('PYTHON_VERSION', PYTHON.version())
  report_conf_data.set('PKGPYTHONDIR', PKGPYTHONDIR)
- result = cpp.run(
+ result = cpp.get_define(
 diff --git a/src/bin/shell/meson.build b/src/bin/shell/meson.build
-index 273293d..846a280 100644
+index d9d0863..75231ff 100644
 --- a/src/bin/shell/meson.build
 +++ b/src/bin/shell/meson.build
 @@ -1,5 +1,11 @@
@@ -92,10 +92,10 @@ index 273293d..846a280 100644
 +endif
 +kea_shell_conf_data.set('PYTHON', py_for_runtime)
  kea_shell_conf_data.set('PACKAGE_VERSION', PROJECT_VERSION)
- kea_shell_conf_data.set(
-     'EXTENDED_VERSION',
+ kea_shell_conf_data.set('EXTENDED_VERSION', EXTENDED_VERSION)
+ kea_shell_conf_data.set('PKGPYTHONDIR', PKGPYTHONDIR)
 diff --git a/src/bin/shell/tests/meson.build b/src/bin/shell/tests/meson.build
-index 18a7bc3..c5c07ad 100644
+index 077187a..32ae19a 100644
 --- a/src/bin/shell/tests/meson.build
 +++ b/src/bin/shell/tests/meson.build
 @@ -3,7 +3,13 @@ if not TESTS_OPT.enabled()
diff --git a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
index 076de53c0a..beee04e159 100644
--- a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
@@ -1,4 +1,4 @@
-From 920e4895c679a5bfda29e66fa199ad8e889659d0 Mon Sep 17 00:00:00 2001
+From 97599e59234b8d79748eb7b1cdd451c91e94152f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:31:39 -0700
 Subject: [PATCH] mk_cfgrpt.sh: strip prefixes
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
deleted file mode 100644
index 269615dbef..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 1ad52a9bbec644e653cc67a596b811b70787c2dd Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 17 Dec 2025 12:36:24 +0100
-Subject: [PATCH] src/lib/log/logger_level_impl.cc: add a missing include to
- address failures with boost 1.90.0
-
-Upstream-Status: Inappropriate [a different, more invasive fix is being developed upstream https://gitlab.isc.org/isc-projects/kea/-/issues/4266]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/lib/log/logger_level_impl.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/lib/log/logger_level_impl.cc b/src/lib/log/logger_level_impl.cc
-index a4aba73..c2e4ee5 100644
---- a/src/lib/log/logger_level_impl.cc
-+++ b/src/lib/log/logger_level_impl.cc
-@@ -10,6 +10,7 @@
- #include <string.h>
- #include <iostream>
- #include <boost/lexical_cast.hpp>
-+#include <boost/static_assert.hpp>
- 
- #include <log4cplus/logger.h>
- 
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 7d051705e8..22a26f345d 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 1a0a7b9633ebc4c171b8ee6db6fcf48e8e27a4b8 Mon Sep 17 00:00:00 2001
+From 39281b6199b1307b6b70f3163a70ab9ce4f445d0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/lib/log/logger_unittest_support.cc b/src/lib/log/logger_unittest_support.cc
-index fc01c6e..f46d17e 100644
+index c90109c..a2729f8 100644
 --- a/src/lib/log/logger_unittest_support.cc
 +++ b/src/lib/log/logger_unittest_support.cc
-@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity severity, int dbglevel) {
+@@ -85,7 +85,7 @@ void initLogger(isc::log::Severity severity, int dbglevel) {
      const char* localfile = getenv("KEA_LOGGER_LOCALMSG");
  
      // Set a directory for creating lockfiles when running tests
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 34ae256823..c1ac485425 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From 00e2905dc622f98f608d253b1148a3d778131cad Mon Sep 17 00:00:00 2001
+From 5180d1866b99125d3353f76151e84644a5791e3d Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 14 Oct 2025 01:37:35 +0000
 Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
@@ -19,27 +19,12 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
- src/bin/keactrl/kea-ctrl-agent.conf.pre | 3 ++-
- src/bin/keactrl/kea-dhcp4.conf.pre      | 6 +++---
- src/bin/keactrl/kea-dhcp6.conf.pre      | 6 +++---
- 3 files changed, 8 insertions(+), 7 deletions(-)
+ src/bin/keactrl/kea-dhcp4.conf.pre | 6 +++---
+ src/bin/keactrl/kea-dhcp6.conf.pre | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
-index 29d8111..de71f41 100644
---- a/src/bin/keactrl/kea-ctrl-agent.conf.pre
-+++ b/src/bin/keactrl/kea-ctrl-agent.conf.pre
-@@ -85,7 +85,8 @@
-     // Agent will fail to start.
-     "hooks-libraries": [
- //  {
--//      "library": "@libdir@/kea/hooks/control-agent-commands.so",
-+//      // Replace $libdir with real library path /usr/lib or /usr/lib64
-+//      "library": "$libdir/kea/hooks/control-agent-commands.so",
- //      "parameters": {
- //          "param1": "foo"
- //      }
 diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
-index 2a58507..86b5abf 100644
+index a6030eb..a1eedcd 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
 @@ -255,7 +255,7 @@
@@ -69,7 +54,7 @@ index 2a58507..86b5abf 100644
      // ],
  
 diff --git a/src/bin/keactrl/kea-dhcp6.conf.pre b/src/bin/keactrl/kea-dhcp6.conf.pre
-index c69a508..2bb488f 100644
+index a16171f..14fe3f4 100644
 --- a/src/bin/keactrl/kea-dhcp6.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp6.conf.pre
 @@ -201,7 +201,7 @@
diff --git a/meta/recipes-connectivity/kea/kea_3.0.3.bb b/meta/recipes-connectivity/kea/kea_3.2.0.bb
similarity index 93%
rename from meta/recipes-connectivity/kea/kea_3.0.3.bb
rename to meta/recipes-connectivity/kea/kea_3.2.0.bb
index f5ca2b16ee..3967f539b7 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.3.bb
+++ b/meta/recipes-connectivity/kea/kea_3.2.0.bb
@@ -17,13 +17,10 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea.volatiles \
            file://fix-multilib-conflict.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
-           file://0001-build-boost-1.89.0-fixes.patch \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
-           file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch \
-           file://0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch \
            "
-SRC_URI[sha256sum] = "09702ddb078b637e85de9236cbedd3fb9d7af7c6e797026c538b45748ad4d631"
+SRC_URI[sha256sum] = "14bf695d37b65b9b1bf550fea5d0adaf9806c50e5419ef2a176a4b8e9aade3df"
 
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
 
-- 
2.47.3


