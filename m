Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFA7C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 20:48:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4345.1787950121114196866
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 13:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W3szb1v+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so10480315e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787950119; x=1788554919; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goQhPqeQHtza9YFYjskbHkphWq5wEDmiCquWImuRCzY=;
        b=W3szb1v+9DHwVogMUUUmTI8EPZ2XM3jlgL5q0Mck2fedsVoj5rEczSGk+frnHnEGD3
         qbQiczifBM/fhgqPpQhL/n/gzVLMeEO+DpAQx+pA4K8m82eSo+h9bnW9MJmei8MfEVBV
         YAJO8mxVwdjlUWlbog26D700FTdM/TQyPogqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950119; x=1788554919;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goQhPqeQHtza9YFYjskbHkphWq5wEDmiCquWImuRCzY=;
        b=ebhQYdSO0UEI+kAgy5hrPAhg0X2eUKTCKxqCWnewZxBbfkFxsESvUqv6ZixCasvn0g
         eC3QJp9huMwcL9RvmS+4D6Rxe+joH0fZi5SPSeHoAndGqyoNZERn8ofmt9c3Aqt7ErFB
         LyVAYv++vM9wK8S962PP7l4NQeHt+LsEPBkeBTXrbjV8JsLn8SrvK4cUQ69dP1orxCSS
         SSKqm5dsbpWjqLG11zC1oVB6EbIZqOf3zJpWLJ+s/+0TmlhdaLqqSButcd4EFgSewDrq
         h4gDpq9ZyewfliLIDpX7/tmTcehq5787tRZGAJc1VPw7dm8HzZORR8culyG5UsBNH6ZZ
         rA1g==
X-Gm-Message-State: AFuF++mjGovX36fMGDkF7MHBi6cR+YGDlo2JyC8Xk7X+YTLmJtlJN/qW
	XBM7U8PNIY3YORpoWei5V4gSI5PYttcQhrSjvpE1vewjjDalwUYqa/YpFYV3kjzBiGeFyxcEtBZ
	QiwaOxoo=
X-Gm-Gg: AR+sD12jmitwP4hStZFYerggQb1m7fJrmC1ov8KijicM3fh6KrEIEjP1CAXGc10JibD
	58xl7EgrzTJwTN8O5sKBXEemx3f9e4Smz2UMejhfChyJsbywvSnJppvVzUsvDTTrWqluNdOLR60
	HWUJXm/5G+0N2+Ykxz4zm3tZla0JAKzjE0wg0Zy38ZruvCMhWPUMybvmLRR0Cgl98I+j/H9cWj/
	BiLDcoxQmgxK6+V4S81nCGk3IXiXuZj0fp0Qy87rz6W9J50UmxXc6vHDrSaWxjnISVTZGWDb+ni
	s7fT625zPqmczdAkOm5xawnBmg+8TUlaS/QGwYnpbZLPYeFV32VhGPsOq/KgkVeXwK2325ocobj
	8bfQpnRxRScqARWjdiIxc9AM1mUQTMpsZlVU+KlhOD7fJgRZVL2bKTJeyphPTR0RILYTlMFjPZL
	bHPYhSVrPCEDg2UakDYsXM6hCHnDA7oREzX5oTU9fJKhRGWaK2v9RK7TY42MvsVd5hpFxDiWA3h
	IqNPFC1LgRvoG92+c14IirGRYBmmQ==
X-Received: by 2002:a05:600c:1e0f:b0:49b:9113:e04a with SMTP id 5b1f17b1804b1-49b91c19c77mr181598315e9.1.1787950119143;
        Fri, 28 Aug 2026 13:48:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c44feb966sm54956615e9.6.2026.08.28.13.48.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 13:48:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] lttng-tools: 2.15.1 -> 2.16.0
Date: Fri, 28 Aug 2026 21:48:36 +0100
Message-ID: <20260828204837.1879291-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 20:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244618

Changes needed for the new release:
 * Drop the libc++ patch which was fixed upstream slightly differently.
 * Add a dependency for ptests on python3-sqlite3.
 * Update the tests patches and files needed to run the ptests to match the new
   release.

License-Update: Upstream added SPDX identifiers and things are much more
comprehensively covered, LICENSE is updated to match with autoconf macros,
docs licenses and vendored libs included.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...static.m4-do-not-write-generation-da.patch |   2 +-
 ...-tests-do-not-strip-a-helper-library.patch |   5 +-
 .../lttng/lttng-tools/disable-tests.patch     |  22 ++-
 .../lttng/lttng-tools/disable-tests2.patch    |  26 ++--
 .../lttng/lttng-tools/libc++.patch            |  59 --------
 .../lttng/lttng-tools/muslfix.patch           | 130 ++++++++++++++++++
 ...-tools_2.15.1.bb => lttng-tools_2.16.0.bb} |  31 +++--
 7 files changed, 178 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/libc++.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/muslfix.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.15.1.bb => lttng-tools_2.16.0.bb} (82%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch
index 5df7636be55..8601fc43967 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch
@@ -1,4 +1,4 @@
-From c58eed85e47a605e2a9f2b2bc91917f68bec023f Mon Sep 17 00:00:00 2001
+From 2e7fab06b2ede001dead4129e19d0793b5c367a6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Jun 2026 16:48:40 +0200
 Subject: [PATCH] m4/ax_am_macros_static.m4: do not write generation date into
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
index 36ddf029f63..1186e116c4d 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
@@ -1,4 +1,4 @@
-From 8e56c9b414b60db1a14ea8ca664e2cff941ae14d Mon Sep 17 00:00:00 2001
+From 1f305930a0e0660bf489ff408d4dedbddc82be0f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 17 Jun 2026 10:04:13 +0200
 Subject: [PATCH] tests: do not strip a helper library
@@ -22,6 +22,3 @@ index 131a4af..38ce076 100644
  	@if [ x"$(srcdir)" != x"$(builddir)" ]; then \
  		for script in $(TEST_DEPS); do \
  			if [ x"$$(dirname $$script)" != x"." ]; then \
--- 
-2.47.3
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
index a8ee81ef0ed..e52d81e9541 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
@@ -1,4 +1,4 @@
-From 44c14ba25747ccee72667212003658447d8297ae Mon Sep 17 00:00:00 2001
+From e8d2d5778d3bfc697b7b0f5d9136f5be752f848b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 14 Dec 2021 12:34:04 +0000
 Subject: [PATCH] lttng-tools: Disable problem tests
@@ -17,27 +17,25 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  tests/regression/Makefile.am | 13 -------------
  1 file changed, 13 deletions(-)
 
-diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index 6730ff9..a7cd133 100644
---- a/tests/regression/Makefile.am
-+++ b/tests/regression/Makefile.am
-@@ -46,19 +46,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
+Index: lttng-tools-2.16.0/tests/regression/Makefile.am
+===================================================================
+--- lttng-tools-2.16.0.orig/tests/regression/Makefile.am
++++ lttng-tools-2.16.0/tests/regression/Makefile.am
+@@ -56,17 +56,6 @@ SERIAL_TESTS = tools/base-path/test_ust
  	tools/regen-metadata/test_ust \
  	tools/regen-statedump/test_kernel \
  	tools/regen-statedump/test_ust \
 -	tools/notification/test_notification_ust_error \
--	tools/notification/test_notification_ust_buffer_usage \
 -	tools/notification/test_notification_ust_capture \
 -	tools/notification/test_notification_ust_event_rule_condition_exclusion \
 -	tools/notification/test_notification_kernel_error \
--	tools/notification/test_notification_kernel_buffer_usage \
+-	tools/notification/test_notification_kernel_buffer_usage.py \
 -	tools/notification/test_notification_kernel_capture \
 -	tools/notification/test_notification_kernel_instrumentation \
+-	tools/notification/test_notification_kernel_multi_app.py \
+-	tools/notification/test_notification_kernel_notifier_discarded_count.py \
 -	tools/notification/test_notification_kernel_syscall \
--	tools/notification/test_notification_notifier_discarded_count \
 -	tools/notification/test_notification_kernel_userspace_probe \
--	tools/notification/test_notification_multi_app \
--	tools/notification/test_rotation \
+ 	tools/notification/test_rotation \
  	tools/rotation/test_ust \
  	tools/rotation/test_kernel \
- 	tools/rotation/test_ust_kernel \
diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
index a776638897d..58413492c62 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
@@ -1,4 +1,4 @@
-From 16890a3395d62e760ce11c3c5e1b7323e1b79b46 Mon Sep 17 00:00:00 2001
+From f4ee2586a314368b1789a9ccfd3beedfdc496078 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 19 Aug 2025 10:09:07 +0100
 Subject: [PATCH] lttng-tools: Disable slow tests to fix ptest runs
@@ -13,11 +13,11 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  tests/regression/Makefile.am | 3 ---
  1 file changed, 3 deletions(-)
 
-diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index a7cd133..b5a25eb 100644
---- a/tests/regression/Makefile.am
-+++ b/tests/regression/Makefile.am
-@@ -30,7 +30,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
+Index: lttng-tools-2.16.0/tests/regression/Makefile.am
+===================================================================
+--- lttng-tools-2.16.0.orig/tests/regression/Makefile.am
++++ lttng-tools-2.16.0/tests/regression/Makefile.am
+@@ -38,7 +38,6 @@ SERIAL_TESTS = tools/base-path/test_ust
  	tools/tracefile-limits/test_tracefile_count \
  	tools/tracefile-limits/test_tracefile_size \
  	tools/exclusion/test_exclusion \
@@ -25,18 +25,18 @@ index a7cd133..b5a25eb 100644
  	tools/snapshots/test_ust_fast \
  	tools/snapshots/test_ust_long \
  	tools/snapshots/test_ust_streaming \
-@@ -53,7 +52,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
+@@ -64,7 +63,6 @@ SERIAL_TESTS = tools/base-path/test_ust
  	tools/rotation/test_schedule_api \
  	tools/metadata/test_kernel \
  	tools/working-directory/test_relayd_working_directory \
 -	tools/clear/test_kernel \
- 	tools/clear/test_live_hang.py \
  	tools/tracker/test_event_tracker \
- 	tools/trigger/start-stop/test_start_stop \
-@@ -66,7 +64,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
- 	tools/trace-format/test_trace_format_kernel.py
- 
- TESTS = tools/clear/test_disallow.py \
+ 	tools/trigger/test_add_trigger_cli \
+ 	tools/trigger/test_list_triggers_cli \
+@@ -94,7 +92,6 @@ TESTS = tools/network/test_network.py \
+ 	tools/map/test_user_map_channel_integration.py \
+ 	tools/clear/test_disallow.py \
+ 	tools/clear/test_live_hang.py \
 -	tools/clear/test_ust.py \
  	tools/clear/test_ust_multi_user.py \
  	tools/live/test_early_inactive_app.py \
diff --git a/meta/recipes-kernel/lttng/lttng-tools/libc++.patch b/meta/recipes-kernel/lttng/lttng-tools/libc++.patch
deleted file mode 100644
index 938f0856e6d..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/libc++.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 348e1be1cdfb897bc8a907e1a806cc7591efae8a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Aug 2025 23:45:20 -0700
-Subject: [PATCH] sessiond: avoid std::vector range-ctor on non-standard
- iterators (libc++)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-libc++ SFINAE-gates std::vector(It, It) behind standard iterator requirements.
-The events_view/channels_ht_view iterators don’t model Input/Forward, so the
-range constructor is not viable and the build fails under clang+libc++.
-Populate the vectors via a simple loop instead, which only relies on !=, ++,
-and dereference. No functional change; fixes clang/libc++ builds while keeping
-libstdc++ behavior unchanged.
-
-Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/15163]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/bin/lttng-sessiond/ust-registry-channel.cpp | 7 +++++--
- src/bin/lttng-sessiond/ust-registry-session.cpp | 7 +++++--
- 2 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/src/bin/lttng-sessiond/ust-registry-channel.cpp b/src/bin/lttng-sessiond/ust-registry-channel.cpp
-index 45be2cc..01d5db3 100644
---- a/src/bin/lttng-sessiond/ust-registry-channel.cpp
-+++ b/src/bin/lttng-sessiond/ust-registry-channel.cpp
-@@ -529,8 +529,11 @@ void lsu::registry_channel::_accept_on_event_classes(
- 		events_view(*_events->ht);
- 
- 	/* Copy the event ptrs from the _events ht to this vector which we'll sort. */
--	std::vector<const lttng::sessiond::ust::registry_event *> sorted_event_classes(
--		events_view.begin(), events_view.end());
-+  std::vector<const lttng::sessiond::ust::registry_event *> sorted_event_classes;
-+  /* Avoid libc++’s range-ctor SFINAE on non-standard iterators. */
-+  for (auto it = events_view.begin(); it != events_view.end(); ++it) {
-+  	sorted_event_classes.push_back(*it);
-+  }
- 
- 	std::sort(sorted_event_classes.begin(),
- 		  sorted_event_classes.end(),
-diff --git a/src/bin/lttng-sessiond/ust-registry-session.cpp b/src/bin/lttng-sessiond/ust-registry-session.cpp
-index 693fc71..b355a14 100644
---- a/src/bin/lttng-sessiond/ust-registry-session.cpp
-+++ b/src/bin/lttng-sessiond/ust-registry-session.cpp
-@@ -587,8 +587,11 @@ void lsu::registry_session::_accept_on_stream_classes(lst::trace_class_visitor&
- 						  decltype(lsu::registry_channel::_node),
- 						  &lsu::registry_channel::_node>
- 		channels_ht_view(*_channels->ht);
--	std::vector<const lttng::sessiond::ust::registry_channel *> sorted_stream_classes(
--		channels_ht_view.begin(), channels_ht_view.end());
-+  std::vector<const lttng::sessiond::ust::registry_channel *> sorted_stream_classes;
-+  /* Avoid libc++’s range-ctor SFINAE on non-standard iterators. */
-+  for (auto it = channels_ht_view.begin(); it != channels_ht_view.end(); ++it) {
-+  	sorted_stream_classes.push_back(*it);
-+  }
- 
- 	std::sort(sorted_stream_classes.begin(),
- 		  sorted_stream_classes.end(),
diff --git a/meta/recipes-kernel/lttng/lttng-tools/muslfix.patch b/meta/recipes-kernel/lttng/lttng-tools/muslfix.patch
new file mode 100644
index 00000000000..dbf60fd71df
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/muslfix.patch
@@ -0,0 +1,130 @@
+Fix a couple of compile failures with musl:
+
+| In file included from ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/commands/get-channel-memory-usage.hpp:13,
+|                  from ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/commands/get-channel-memory-usage.cpp:8:
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:31:59: error: 'uid_t' has not been declared; did you mean 'pid_t'?
+|    31 |         stream_group_owner(ust::application_abi bitness_, uid_t uid_) noexcept :
+|       |                                                           ^~~~~
+|       |                                                           pid_t
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:31:9: error: 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, int)' cannot be overloaded with 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, pid_t)'
+|    31 |         stream_group_owner(ust::application_abi bitness_, uid_t uid_) noexcept :
+|       |         ^~~~~~~~~~~~~~~~~~
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:26:9: note: previous declaration 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, pid_t)'
+|    26 |         stream_group_owner(ust::application_abi bitness_, pid_t pid_) noexcept :
+|       |         ^~~~~~~~~~~~~~~~~~
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:50:17: error: 'uid_t' does not name a type; did you mean 'pid_t'?
+|    50 |                 uid_t uid;
+|       |                 ^~~~~
+|       |                 pid_t
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp: In constructor 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, int)':
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:32:60: error: 'const lttng::sessiond::commands::stream_group_owner::<unnamed union>' has no non-static data member named 'uid'
+|    32 |                 owner_type(type::USER), bitness(bitness_), id{ .uid = uid_ }
+|       |                                                            ^~~~~~~~~~~~~~~~~
+| In file included from ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/commands/reclaim-channel-memory.hpp:15,
+|                  from ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/commands/reclaim-channel-memory.cpp:8:
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:31:59: error: 'uid_t' has not been declared; did you mean 'pid_t'?
+|    31 |         stream_group_owner(ust::application_abi bitness_, uid_t uid_) noexcept :
+|       |                                                           ^~~~~
+|       |                                                           pid_t
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:31:9: error: 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, int)' cannot be overloaded with 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, pid_t)'
+|    31 |         stream_group_owner(ust::application_abi bitness_, uid_t uid_) noexcept :
+|       |         ^~~~~~~~~~~~~~~~~~
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:26:9: note: previous declaration 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, pid_t)'
+|    26 |         stream_group_owner(ust::application_abi bitness_, pid_t pid_) noexcept :
+|       |         ^~~~~~~~~~~~~~~~~~
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:50:17: error: 'uid_t' does not name a type; did you mean 'pid_t'?
+|    50 |                 uid_t uid;
+|       |                 ^~~~~
+|       |                 pid_t
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp: In constructor 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, int)':
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:32:60: error: 'const lttng::sessiond::commands::stream_group_owner::<unnamed union>' has no non-static data member named 'uid'
+|    32 |                 owner_type(type::USER), bitness(bitness_), id{ .uid = uid_ }
+|       |                                                            ^~~~~~~~~~~~~~~~~
+| In file included from ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/domain-orchestrator.hpp:16,
+|                  from ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/map-action-register.cpp:8:
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:31:59: error: 'uid_t' has not been declared; did you mean 'pid_t'?
+|    31 |         stream_group_owner(ust::application_abi bitness_, uid_t uid_) noexcept :
+|       |                                                           ^~~~~
+|       |                                                           pid_t
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:31:9: error: 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, int)' cannot be overloaded with 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, pid_t)'
+|    31 |         stream_group_owner(ust::application_abi bitness_, uid_t uid_) noexcept :
+|       |         ^~~~~~~~~~~~~~~~~~
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:26:9: note: previous declaration 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, pid_t)'
+|    26 |         stream_group_owner(ust::application_abi bitness_, pid_t pid_) noexcept :
+|       |         ^~~~~~~~~~~~~~~~~~
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:50:17: error: 'uid_t' does not name a type; did you mean 'pid_t'?
+|    50 |                 uid_t uid;
+|       |                 ^~~~~
+|       |                 pid_t
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp: In constructor 'lttng::sessiond::commands::stream_group_owner::stream_group_owner(lttng::sessiond::ust::application_abi, int)':
+| ../../../../sources/lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp:32:60: error: 'const lttng::sessiond::commands::stream_group_owner::<unnamed union>' has no non-static data member named 'uid'
+|    32 |                 owner_type(type::USER), bitness(bitness_), id{ .uid = uid_ }
+|       |                                                            ^~~~~~~~~~~~~~~~~
+| At global scope:
+| cc1plus: note: unrecognized command-line option '-Wno-gnu-folding-constant' may have been intended to silence earlier diagnostics
+| cc1plus: note: unrecognized command-line option '-Wno-incomplete-setjmp-declaration' may have been intended to silence earlier diagnostics
+| At global scope:
+| cc1plus: note: unrecognized command-line option '-Wno-gnu-folding-constant' may have been intended to silence earlier diagnostics
+| cc1plus: note: unrecognized command-line option '-Wno-incomplete-setjmp-declaration' may have been intended to silence earlier diagnostics
+| make[3]: *** [Makefile:1210: commands/get-channel-memory-usage.lo] Error 1
+| make[3]: *** Waiting for unfinished jobs....
+| make[3]: *** [Makefile:1210: map-action-register.lo] Error 1
+| At global scope:
+| cc1plus: note: unrecognized command-line option '-Wno-gnu-folding-constant' may have been intended to silence earlier diagnostics
+| cc1plus: note: unrecognized command-line option '-Wno-incomplete-setjmp-declaration' may have been intended to silence earlier diagnostics
+| make[3]: *** [Makefile:1210: commands/reclaim-channel-memory.lo] Error 1
+| make[3]: Leaving directory '/media/build/poky/build/tmp/work/x86-64-v3-poky-linux-musl/lttng-tools/2.16.0/build/src/bin/lttng-sessiond'
+| make[2]: *** [Makefile:633: all-recursive] Error 1
+| make[2]: Leaving directory '/media/build/poky/build/tmp/work/x86-64-v3-poky-linux-musl/lttng-tools/2.16.0/build/src/bin'
+| make[1]: *** [Makefile:626: all-recursive] Error 1
+| make[1]: Leaving directory '/media/build/poky/build/tmp/work/x86-64-v3-poky-linux-musl/lttng-tools/2.16.0/build/src'
+| make: *** [Makefile:781: all-recursive] Error 1
+
+and
+
+| ../../../../sources/lttng-tools-2.16.0/tests/utils/testapp/gen-ust-events-ns.cpp: In function 'int main(int, const char**)':
+| ../../../../sources/lttng-tools-2.16.0/tests/utils/testapp/gen-ust-events-ns.cpp:238:33: error: 'basename' was not declared in this scope; did you mean 'rename'?
+|   238 |         cmd_name = (argc > 0) ? basename(argv[0]) : "COMMAND";
+|       |                                 ^~~~~~~~
+|       |                                 rename
+
+which is because basename isn't available in C++ even with _GNU_SOURCE. There is a posix version but doesn't
+take a const char*. I hacked around it here to get things compiling.
+
+Upstream-Status: Submitted [https://bugs.lttng.org/issues/1445]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp
+===================================================================
+--- lttng-tools-2.16.0.orig/src/bin/lttng-sessiond/channel-memory-types.hpp
++++ lttng-tools-2.16.0/src/bin/lttng-sessiond/channel-memory-types.hpp
+@@ -8,6 +8,8 @@
+ #ifndef LTTNG_SESSIOND_CHANNEL_MEMORY_TYPES_HPP
+ #define LTTNG_SESSIOND_CHANNEL_MEMORY_TYPES_HPP
+ 
++#include <unistd.h>
++
+ #include <common/format.hpp>
+ 
+ #include <vendor/optional.hpp>
+Index: lttng-tools-2.16.0/tests/utils/testapp/gen-ust-events-ns.cpp
+===================================================================
+--- lttng-tools-2.16.0.orig/tests/utils/testapp/gen-ust-events-ns.cpp
++++ lttng-tools-2.16.0/tests/utils/testapp/gen-ust-events-ns.cpp
+@@ -16,6 +16,7 @@
+ #include <common/macros.hpp>
+ 
+ #include <inttypes.h>
++#include <libgen.h>
+ #include <popt.h>
+ #include <sched.h>
+ #include <stdarg.h>
+@@ -235,7 +236,7 @@ int main(int argc, const char **argv)
+ 	int ret = EXIT_SUCCESS;
+ 	poptContext pc;
+ 
+-	cmd_name = (argc > 0) ? basename(argv[0]) : "COMMAND";
++	cmd_name = (argc > 0) ? basename(strdup(argv[0])) : "COMMAND";
+ 
+ 	pc = poptGetContext(nullptr, argc, argv, opts, 0);
+ 	poptReadDefaultConfig(pc, 0);
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
similarity index 82%
rename from meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
index 040632d6719..8e2f890e55d 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
@@ -5,10 +5,22 @@ to extract program execution details from the Linux operating system \
 and interpret them."
 HOMEPAGE = "https://github.com/lttng/lttng-tools"
 
-LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
-                    file://LICENSES/GPL-2.0;md5=e68f69a54b44ba526ad7cb963e18fbce \
-                    file://LICENSES/LGPL-2.1;md5=9920968d0f2ff585ce61fae30344dd95"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND CC0-1.0 AND CC-BY-SA-4.0 AND FSFAP AND GPL-2.0-only AND GPL-2.0-or-later AND GPL-2.0-or-later WITH Autoconf-exception-2.0 AND GPL-2.0-or-later WITH Autoconf-exception-macro AND LGPL-2.1-only AND LGPL-2.1-or-later AND MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f7adf214dab700ec91b393898b515f13 \
+                    file://LICENSES/BSD-2-Clause.txt;md5=5d6306d1b08f8df623178dfd81880927 \
+                    file://LICENSES/BSD-3-Clause.txt;md5=4e91b9e6ef320f74590c8c7a64a9188a \
+                    file://LICENSES/BSL-1.0.txt;md5=4415c1f5128c6d51273f9c8362305778 \
+                    file://LICENSES/CC0-1.0.txt;md5=65d3616852dbf7b1a6d4b53b00626032 \
+                    file://LICENSES/CC-BY-SA-4.0.txt;md5=62ccd6e67b4925bbb3063925cd0e57e5 \
+                    file://LICENSES/FSFAP.txt;md5=232368338ef6dc99de71c2e05ff12176 \
+                    file://LICENSES/GPL-2.0-only.txt;md5=3d26203303a722dedc6bf909d95ba815 \
+                    file://LICENSES/GPL-2.0-or-later.txt;md5=3d26203303a722dedc6bf909d95ba815 \
+                    file://LICENSES/GPL-3.0-or-later.txt;md5=75d892af193fd5a298f724c4377d8f62 \
+                    file://LICENSES/LGPL-2.1-only.txt;md5=41890f71f740302b785c27661123bff5 \
+                    file://LICENSES/LGPL-2.1-or-later.txt;md5=41890f71f740302b785c27661123bff5 \
+                    file://LICENSES/MIT.txt;md5=e8f57dd048e186199433be2c41bd3d6d \
+                    file://LICENSES/Autoconf-exception-2.0.txt;md5=13a739a6793bb6742c30b1d3727df7e2 \
+                    file://LICENSES/Autoconf-exception-macro.txt;md5=887fe9d860687d5c7602a5d8ab978171"
 
 include lttng-platforms.inc
 
@@ -28,6 +40,7 @@ RDEPENDS:${PN}-ptest += "perl-module-getopt-long \
                          python3-json \
                          python3-io \
                          python3-shell \
+                         python3-sqlite3 \
                          python3-xml \
                          python3-resource \
 "
@@ -50,11 +63,11 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://disable-tests2.patch \
-           file://libc++.patch \
            file://0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch \
+           file://muslfix.patch \
            "
 
-SRC_URI[sha256sum] = "8b6d4ba7ae2c036f7dafbb4e29717677411078f9a9d961b2dc7c1ba16273e9e9"
+SRC_URI[sha256sum] = "b8b3244894e49e773d4942b8899f768057974edf75c18dbb48b65bb123c7b2c7"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd upstream-stable-release-point
 
@@ -69,7 +82,8 @@ USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "tracing"
 
 FILES:${PN} += "${libdir}/lttng/libexec/* ${datadir}/xml/lttng \
-                ${PYTHON_SITEPACKAGES_DIR}/*"
+                ${PYTHON_SITEPACKAGES_DIR}/* \
+                ${libdir}/lttng/libtpp*"
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES:${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 
@@ -89,6 +103,7 @@ do_install:append () {
 
 do_install_ptest () {
     for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng \
+            tests/utils/lttng-build-profile.json \
             tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh \
             tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh \
             tests/regression/tools/trace-format/ust-local-trace-pretty.expect* \
@@ -97,7 +112,7 @@ do_install_ptest () {
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-    for f in tests/utils/tap-driver.sh config/test-driver src/common/session.xsd src/common/mi-lttng-4.2.xsd \
+    for f in tests/utils/tap-driver.sh config/test-driver src/common/session.xsd src/common/mi-lttng-4.3.xsd \
              tests/regression/tests.serial; do
         install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
     done

