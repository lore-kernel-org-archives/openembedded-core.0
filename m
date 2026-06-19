Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77B7CDB477
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:23 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38121.1781857992822483975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ov3oKUbU;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4602e2a0372so1473197f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857991; x=1782462791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xVY23Ehzc6zG/JYjo8GP7ySn/XADm3mzFV2jMNlTt8=;
        b=Ov3oKUbUOKdkyEsbiFS3/pTf2YQm7Z+1qNN1Hz0+PAPvauFD+M1hs6SOScwaCTGAaJ
         qDSPULIJwoeeh4dbHHdpjUN/0b0aUjZS6hH7h1WuN2vnrUKJyPdKxungZa4nuqXYTdZD
         1+XJcmlw+GRXmWimxNeCXe7YZVA/i/xNWCCVXUgCBGBiA829+A/LTsQ40OdbDTYvkXDa
         9me79fvVPUuBC29mO5pvKAz4TnXnxT7J8QqRSv++dO5oroqoy1XMOmYcP/OaNiq/2Fmk
         0ZmiBZ7jJFnHjQBUC4/VeFX5PCzY7gKQ9GNi4a4gLEXV66OnItKMl0ymEWUO/8mi9XTr
         0Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857991; x=1782462791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4xVY23Ehzc6zG/JYjo8GP7ySn/XADm3mzFV2jMNlTt8=;
        b=TRgFn8Jb6rtUXc1Kr/JNwlu078CduCpn6HcX6xuc8vtTu7lVj2QKoOQJB/N0y8+fym
         58m/Q1TrYs2oSP+BDt7H7AQXUCjQwNYqPfwy+HtNGWfu2+8uJZNxlST7N1K0UM2iT5Yf
         j/cEK6Tb6n5g8w19ZhteqlmsoZAneHUmTIoAKPFo26iYfcBQqsR97+4IJmTuoQWaVCO+
         eX80sUj9xMxKzR3O5hPkua2NiV8H4qmHvszBAojyEa4PXwe4BSd0w/0t3i8vN/hXgE/X
         1wN8+g8n+kiGFgkm8933gDCpWqI7if22lz4QcILKurAl59M6XNa779J0KU3mm0b1dQXU
         ZpAA==
X-Gm-Message-State: AOJu0Ywbfxp0rNO1dSeWaEdkbHkJ/7VsFqJBr1ge45aEBEHlmWEA3+Ra
	0+CIoZeTa4sUUXxACWt0ZpSY3tJMvXc2ihenh4++u8gEMQv01xxBUO9iNJi1Nd3F
X-Gm-Gg: AfdE7cmkcp5DEA4VcIE4wDUJEzwE9ypOATNUteeCnv+F8pUHHEFhHO/+rezyYiXgAfV
	2lf3sZmbCMYRpKE0HsTVL08ashhs00AWDeEQeBzJUaOM/7iKfhIbkGt5NYIjy2P8YcC1wIlrKjl
	AWhaATP5h9nBsvW5QSfxfqjYnZkaHPClq5TZQDfHZ0ley3KPpJhzwK/xZaD4Y57DK1rw3NJmlju
	OHh1bXY5nk2vVSQe1H/3a7YF4qPyRa5gscKDz7hFg8vDKimBBNCWh/ATnJPwYZG56sEIV7rqmaL
	rrMT/6GJTFca5mea+4GupG+HbpSnCUbWNPPY+mvoWUAPCAamoYXIno7X9kdYdneKWB2LeHE25IU
	oVWH6wNwifoF2LvPe/ys9DVh/Q3Ds73xI9NEIaXADDvdh6krFfKS53epN/lvEAwInRQLbhF8FIq
	SknABPxlkecxzlk2o5BG/AXn+t72gEck9YyifS85jpTstJzizhdW3ACJmKahk=
X-Received: by 2002:a05:6000:1ac8:b0:45e:dacb:8885 with SMTP id ffacd0b85a97d-4656eaa4fc7mr2130922f8f.35.1781857990664;
        Fri, 19 Jun 2026 01:33:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/15] lttng-tools: upgrade 2.14.1 -> 2.15.1
Date: Fri, 19 Jun 2026 10:32:45 +0200
Message-ID: <20260619083305.3505156-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239138

From: Alexander Kanavin <alex@linutronix.de>

Adjust ptest tweaks and packaging to account for test data and test cases changes/renames.

Add a patch to address reproducibility issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...static.m4-do-not-write-generation-da.patch | 27 +++++++++++++++
 ...-tests-do-not-strip-a-helper-library.patch | 31 +++++++++--------
 .../lttng/lttng-tools/disable-tests.patch     | 11 ++++---
 .../lttng/lttng-tools/disable-tests2.patch    | 31 ++++++++++++-----
 .../lttng/lttng-tools/libc++.patch            | 33 ++++++++++++-------
 .../lttng/lttng-tools/run-ptest               |  2 +-
 ...-tools_2.14.1.bb => lttng-tools_2.15.1.bb} | 26 ++++++++-------
 7 files changed, 110 insertions(+), 51 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.14.1.bb => lttng-tools_2.15.1.bb} (91%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch
new file mode 100644
index 0000000000..5df7636be5
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch
@@ -0,0 +1,27 @@
+From c58eed85e47a605e2a9f2b2bc91917f68bec023f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 18 Jun 2026 16:48:40 +0200
+Subject: [PATCH] m4/ax_am_macros_static.m4: do not write generation date into
+ Makefiles
+
+This breaks reproducibility of ptests (which install the Makefiles),
+but the fix isn't appropriate for upstream submission.
+
+Upstream-Status: Inappropriate [oe-core specific, really!]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ m4/ax_am_macros_static.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/ax_am_macros_static.m4 b/m4/ax_am_macros_static.m4
+index f4cee8c..7fba5b2 100644
+--- a/m4/ax_am_macros_static.m4
++++ b/m4/ax_am_macros_static.m4
+@@ -33,6 +33,6 @@ AC_DEFUN([AX_AM_MACROS_STATIC],
+ [
+ AX_AC_PRINT_TO_FILE(AMINCLUDE_STATIC,[
+ # ]AMINCLUDE_STATIC[ generated automatically by Autoconf
+-# from AX_AM_MACROS_STATIC on ]m4_esyscmd([LC_ALL=C date])[
++# from AX_AM_MACROS_STATIC
+ ])
+ ])
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
index 0547f30c02..36ddf029f6 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
@@ -1,24 +1,27 @@
-From a45157a50e14d4bd244a3dd05d79c5703c819550 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 12 Dec 2019 16:52:07 +0100
+From 8e56c9b414b60db1a14ea8ca664e2cff941ae14d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 17 Jun 2026 10:04:13 +0200
 Subject: [PATCH] tests: do not strip a helper library
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- tests/utils/testapp/userspace-probe-elf-binary/Makefile.am | 2 +-
+ tests/utils/testapp/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-index 836f13e..e19a554 100644
---- a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-+++ b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-@@ -14,7 +14,7 @@ userspace_probe_elf_binary_LDADD = libfoo.la
- libfoo.strip: libfoo.la
- 	$(OBJCOPY) --strip-all .libs/libfoo.so
+diff --git a/tests/utils/testapp/Makefile.am b/tests/utils/testapp/Makefile.am
+index 131a4af..38ce076 100644
+--- a/tests/utils/testapp/Makefile.am
++++ b/tests/utils/testapp/Makefile.am
+@@ -363,7 +363,7 @@ endif # TEST_SDT_UPROBE
+ TEST_DEPS = gen-py-events.py
+ EXTRA_DIST += gen-py-events.py
  
--all-local: libfoo.strip
+-all-local: libdynsym.strip-stamp
 +all-local:
  	@if [ x"$(srcdir)" != x"$(builddir)" ]; then \
- 		for script in $(EXTRA_DIST); do \
- 			cp -f $(srcdir)/$$script $(builddir); \
+ 		for script in $(TEST_DEPS); do \
+ 			if [ x"$$(dirname $$script)" != x"." ]; then \
+-- 
+2.47.3
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
index d32cf87535..a8ee81ef0e 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
@@ -1,4 +1,4 @@
-From 05cf8ed6cc42a2f6ff53009d0ae2713fe63f1245 Mon Sep 17 00:00:00 2001
+From 44c14ba25747ccee72667212003658447d8297ae Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 14 Dec 2021 12:34:04 +0000
 Subject: [PATCH] lttng-tools: Disable problem tests
@@ -14,14 +14,14 @@ https://bugzilla.yoctoproject.org/show_bug.cgi?id=14263
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
- tests/regression/Makefile.am | 12 ------------
- 1 file changed, 12 deletions(-)
+ tests/regression/Makefile.am | 13 -------------
+ 1 file changed, 13 deletions(-)
 
 diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index 7076488..e5be904 100644
+index 6730ff9..a7cd133 100644
 --- a/tests/regression/Makefile.am
 +++ b/tests/regression/Makefile.am
-@@ -40,18 +40,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
+@@ -46,19 +46,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
  	tools/regen-metadata/test_ust \
  	tools/regen-statedump/test_kernel \
  	tools/regen-statedump/test_ust \
@@ -37,6 +37,7 @@ index 7076488..e5be904 100644
 -	tools/notification/test_notification_notifier_discarded_count \
 -	tools/notification/test_notification_kernel_userspace_probe \
 -	tools/notification/test_notification_multi_app \
+-	tools/notification/test_rotation \
  	tools/rotation/test_ust \
  	tools/rotation/test_kernel \
  	tools/rotation/test_ust_kernel \
diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
index 5b9a07fcb8..a776638897 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
@@ -1,28 +1,43 @@
+From 16890a3395d62e760ce11c3c5e1b7323e1b79b46 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 19 Aug 2025 10:09:07 +0100
+Subject: [PATCH] lttng-tools: Disable slow tests to fix ptest runs
+
 These tests take too long to run for our default output timeout in ptest-runner (450s).
 We could change that to 900s but it is a global setting so skip these tests for
 now. Ideally tests.serial would have occasional output when running to show activity.
 
 Upstream-Status: Inappropriate [workaround for slow tests]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ tests/regression/Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
 
-Index: lttng-tools-2.14.0/tests/regression/Makefile.am
-===================================================================
---- lttng-tools-2.14.0.orig/tests/regression/Makefile.am
-+++ lttng-tools-2.14.0/tests/regression/Makefile.am
-@@ -26,7 +26,6 @@ SERIAL_TESTS = tools/base-path/test_ust
+diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
+index a7cd133..b5a25eb 100644
+--- a/tests/regression/Makefile.am
++++ b/tests/regression/Makefile.am
+@@ -30,7 +30,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
  	tools/tracefile-limits/test_tracefile_count \
  	tools/tracefile-limits/test_tracefile_size \
  	tools/exclusion/test_exclusion \
 -	tools/snapshots/test_kernel \
  	tools/snapshots/test_ust_fast \
+ 	tools/snapshots/test_ust_long \
  	tools/snapshots/test_ust_streaming \
- 	tools/snapshots/test_kernel_streaming \
-@@ -47,8 +46,6 @@ SERIAL_TESTS = tools/base-path/test_ust
+@@ -53,7 +52,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
  	tools/rotation/test_schedule_api \
  	tools/metadata/test_kernel \
  	tools/working-directory/test_relayd_working_directory \
--	tools/clear/test_ust \
 -	tools/clear/test_kernel \
  	tools/clear/test_live_hang.py \
  	tools/tracker/test_event_tracker \
  	tools/trigger/start-stop/test_start_stop \
+@@ -66,7 +64,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
+ 	tools/trace-format/test_trace_format_kernel.py
+ 
+ TESTS = tools/clear/test_disallow.py \
+-	tools/clear/test_ust.py \
+ 	tools/clear/test_ust_multi_user.py \
+ 	tools/live/test_early_inactive_app.py \
+ 	tools/live/test_high_latency.py \
diff --git a/meta/recipes-kernel/lttng/lttng-tools/libc++.patch b/meta/recipes-kernel/lttng/lttng-tools/libc++.patch
index be793c7699..938f0856e6 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/libc++.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/libc++.patch
@@ -1,4 +1,11 @@
-sessiond: avoid std::vector range-ctor on non-standard iterators (libc++)
+From 348e1be1cdfb897bc8a907e1a806cc7591efae8a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Aug 2025 23:45:20 -0700
+Subject: [PATCH] sessiond: avoid std::vector range-ctor on non-standard
+ iterators (libc++)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 libc++ SFINAE-gates std::vector(It, It) behind standard iterator requirements.
 The events_view/channels_ht_view iterators don’t model Input/Forward, so the
@@ -9,12 +16,16 @@ libstdc++ behavior unchanged.
 
 Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/15163]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bin/lttng-sessiond/ust-registry-channel.cpp | 7 +++++--
+ src/bin/lttng-sessiond/ust-registry-session.cpp | 7 +++++--
+ 2 files changed, 10 insertions(+), 4 deletions(-)
 
-Index: lttng-tools-2.14.0/src/bin/lttng-sessiond/ust-registry-channel.cpp
-===================================================================
---- lttng-tools-2.14.0.orig/src/bin/lttng-sessiond/ust-registry-channel.cpp
-+++ lttng-tools-2.14.0/src/bin/lttng-sessiond/ust-registry-channel.cpp
-@@ -529,8 +529,11 @@ void lsu::registry_channel::_accept_on_e
+diff --git a/src/bin/lttng-sessiond/ust-registry-channel.cpp b/src/bin/lttng-sessiond/ust-registry-channel.cpp
+index 45be2cc..01d5db3 100644
+--- a/src/bin/lttng-sessiond/ust-registry-channel.cpp
++++ b/src/bin/lttng-sessiond/ust-registry-channel.cpp
+@@ -529,8 +529,11 @@ void lsu::registry_channel::_accept_on_event_classes(
  		events_view(*_events->ht);
  
  	/* Copy the event ptrs from the _events ht to this vector which we'll sort. */
@@ -28,11 +39,11 @@ Index: lttng-tools-2.14.0/src/bin/lttng-sessiond/ust-registry-channel.cpp
  
  	std::sort(sorted_event_classes.begin(),
  		  sorted_event_classes.end(),
-Index: lttng-tools-2.14.0/src/bin/lttng-sessiond/ust-registry-session.cpp
-===================================================================
---- lttng-tools-2.14.0.orig/src/bin/lttng-sessiond/ust-registry-session.cpp
-+++ lttng-tools-2.14.0/src/bin/lttng-sessiond/ust-registry-session.cpp
-@@ -586,8 +586,11 @@ void lsu::registry_session::_accept_on_s
+diff --git a/src/bin/lttng-sessiond/ust-registry-session.cpp b/src/bin/lttng-sessiond/ust-registry-session.cpp
+index 693fc71..b355a14 100644
+--- a/src/bin/lttng-sessiond/ust-registry-session.cpp
++++ b/src/bin/lttng-sessiond/ust-registry-session.cpp
+@@ -587,8 +587,11 @@ void lsu::registry_session::_accept_on_stream_classes(lst::trace_class_visitor&
  						  decltype(lsu::registry_channel::_node),
  						  &lsu::registry_channel::_node>
  		channels_ht_view(*_channels->ht);
diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
index e7edc03e96..a6764f8744 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -20,7 +20,7 @@ function validate_lttng_modules_present()
 	return 1
 }
 
-export LD_LIBRARY_PATH=FIXMEPTESTPATH/tests/utils/testapp/userspace-probe-elf-binary/.libs:FIXMEPTESTPATH/tests/utils/testapp/gen-ust-events-constructor/.libs
+export LD_LIBRARY_PATH=FIXMEPTESTPATH/tests/utils/testapp/.libs:FIXMEPTESTPATH/tests/utils/testapp/gen-ust-events-constructor/.libs
 makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=FIXMEPTESTPATH top_builddir=FIXMEPTESTPATH"
 
 #If current system doesn't have lttng kernel modules, disable lttng kernel related tests.
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
similarity index 91%
rename from meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
index 3a3f2cff2c..9fdb0ede72 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
@@ -29,6 +29,7 @@ RDEPENDS:${PN}-ptest += "perl-module-getopt-long \
                          python3-io \
                          python3-shell \
                          python3-xml \
+                         python3-resource \
 "
 
 INSANE_SKIP:${PN}-ptest += "dev-deps"
@@ -50,9 +51,10 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            file://disable-tests2.patch \
            file://libc++.patch \
+           file://0001-m4-ax_am_macros_static.m4-do-not-write-generation-da.patch \
            "
 
-SRC_URI[sha256sum] = "0e68eb27923621c4bc127cfce40422d28cf7e473fedf6229ae6c32ba5c5b7c6d"
+SRC_URI[sha256sum] = "8b6d4ba7ae2c036f7dafbb4e29717677411078f9a9d961b2dc7c1ba16273e9e9"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -95,7 +97,7 @@ do_install_ptest () {
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-    for f in tests/utils/tap-driver.sh config/test-driver src/common/session.xsd src/common/mi-lttng-4.1.xsd \
+    for f in tests/utils/tap-driver.sh config/test-driver src/common/session.xsd src/common/mi-lttng-4.2.xsd \
              tests/regression/tests.serial; do
         install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
     done
@@ -140,8 +142,8 @@ do_install_ptest () {
         done
     done
 
-    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
-    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
 
@@ -207,12 +209,12 @@ do_install_ptest:append:libc-musl () {
 }
 
 INHIBIT_PACKAGE_STRIP_FILES = "\
-    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
-    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \
-    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary \
-    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/.libs/userspace-probe-elf-cxx-binary \
-    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/gen-syscall-events \
-    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/.libs/gen-syscall-events \
-    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack \
-    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/.libs/gen-syscall-events-callstack \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/.libs/userspace-probe-elf-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/.libs/userspace-probe-elf-cxx-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/.libs/gen-syscall-events \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/.libs/gen-syscall-events-callstack \
     "
-- 
2.47.3


