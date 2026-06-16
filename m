Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB8DCD98EE
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5798.1781637421155858334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BELqc6lz;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso1750405e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637419; x=1782242219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1obVJ7Uhl7kuQbLbYUUpKrkAypDjTa/M5dlf+CwtBZY=;
        b=BELqc6lzgyXmd1uzFRaStYTN0N5jUT/cP7UREp5HS/NaSsh13TfjOTRNPiftLCpo7+
         80Q8mP4tf1wGc1aR+IGvGh4BjPGWBIGoOV4kVYwyRhITJc5EvmSZKpVEDzVZXRVPb0j9
         OkAREQUfYIuTre8MX9RmsMJTneYPitFXXsbnyqv0Aqb5Qp5plAo77Gh57kEyNgPhzFhT
         Ze7Hup6O76kAvCDOrfgB0Uve2peVxrWztnD7E2Lh9AKwUnJTrTabwk1OJtWR9IeSx+07
         8hk6UrPIZX3ywQGR0jU3LBqeb5DmBijL7TsUjJtJAtD3/YqcTuqJRIoVvQkIpz/86fTw
         x8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637419; x=1782242219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1obVJ7Uhl7kuQbLbYUUpKrkAypDjTa/M5dlf+CwtBZY=;
        b=jvVNggnv3qwgdR++jQHiGr68cahasWoq7rsEJeouPW8IFdyhZsrE3bLNSaoAt4+kcV
         W1itEHUIPsxQlb48RgglIdrSLVgiHTxSDWm/TPcLNBzXzGQuv+LSfujRC+w2mB1n6xwq
         UrYzSpre7u/kOxp0LaGSW6DcIYPKOYs1JAMIK4wCW6aRRMwgSaVrSgfYszFMMHih23fS
         iemmHsG38rj+F4AO4ASMrzZ16ObuHDjpOf6BvFU9MHJU/8QaGxJunINrUUaJAmuIj2cX
         +oEdNuwMFlArV/7o+eXJUJinYgF4O8U9MfxKRufy5FXn5wQl5l4E2mPzAYMen1AH+ua5
         gTTQ==
X-Gm-Message-State: AOJu0Yw4oLtp/XQDoEKU9IwgRhIx4TonKRUoHK61iR1T39JCMssSc7nb
	+J7CSZU3AEBs6y3IHJCcaQKBf+U9Tc88pg+mrBLlHa1uU0NdLeiwqjMJqzrBvnrI
X-Gm-Gg: Acq92OH8pBzKeebVCjWS14Vckc/ilfMTuGzzYQUp+qKq+DfeNzq8RrA6atDpFaYj96x
	3cA9x92zcBqwj9B25ifoa2L0e9nyOa12UWBgBA9pu2gm0G/32z+LYR8zsZbn+lsesaGnS5i6gcB
	wFEp2aUwtwiFEYfzXaL1U/E4fCcnUhOo/9dwtQvxY7m6LPvbhuEqZ2cd1S4JsBQVNhi/oJvpo5j
	9kls5eORRBuHVN01reu6nyz57OOSSDj0tzbWnB3gSh7TH6G1UeDoQWq6ns7lYPU8ubB6WbkrCJs
	9APMCaHNIYPhjkN1/Gf5GFnbd0XSCg/tfj9hiWhF2bHdMHmonkmgHe3EjSbH33JGDvWPQKG4umY
	fujCySiT/mghZo+Mu+W9n6sdMtv2uRCtPBXLDiEjfk5FJcE2FC+A3zW0EbaI8YfXvvd9SlMYHeY
	48oRN+VhOFcrKFvIHH6++Ch+Ery7dUapIfotXDG0qzVCbx1zZ/7IjSWiI5NcsRz1qT9nwOqg==
X-Received: by 2002:a05:600c:1382:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-492340eb75fmr190875e9.15.1781637419178;
        Tue, 16 Jun 2026 12:16:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/30] neard: upgrade 0.19 -> 0.20
Date: Tue, 16 Jun 2026 21:16:20 +0200
Message-ID: <20260616191628.2014553-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238949

From: Alexander Kanavin <alex@linutronix.de>

Drop the systemduserunitdir option as it's removed upstream:
https://github.com/linux-nfc/neard/commit/80e112f0f86b9a7296955e77822de4cc75808860

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...Add-header-dependency-to-nciattach.o.patch |  9 ++----
 .../Makefile.am-do-not-ship-version.h.patch   |  9 ++----
 .../Makefile.am-fix-parallel-issue.patch      | 30 -------------------
 .../neard/{neard_0.19.bb => neard_0.20.bb}    |  7 ++---
 4 files changed, 9 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
 rename meta/recipes-connectivity/neard/{neard_0.19.bb => neard_0.20.bb} (88%)

diff --git a/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
index d8e8a5e5da..e9dae82820 100644
--- a/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
+++ b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
@@ -1,4 +1,4 @@
-From affaa2021a54c30353e4e1fee09c13a4de2196be Mon Sep 17 00:00:00 2001
+From 204b0eb85c7e98a0fc7cf54d8e2bc2c41b542dcf Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 17 Mar 2017 14:24:29 +0200
 Subject: [PATCH] Add header dependency to nciattach.o
@@ -19,10 +19,10 @@ Upstream-Status: Submitted [mailinglist]
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index fa552ee..acef6ba 100644
+index d865e84..1c81d58 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -253,6 +253,7 @@ se/builtin.h: src/genbuiltin $(builtin_se_sources)
+@@ -258,6 +258,7 @@ se/builtin.h: src/genbuiltin $(builtin_se_sources)
  
  $(src_neard_OBJECTS) \
  $(tools_nfctool_nfctool_OBJECTS) \
@@ -30,6 +30,3 @@ index fa552ee..acef6ba 100644
  $(plugin_objects) \
  $(se_seeld_OBJECTS) \
  $(unit_test_ndef_parse_OBJECTS) \
--- 
-2.11.0
-
diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
index 16875e0543..05a26fa740 100644
--- a/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
@@ -1,4 +1,4 @@
-From bfd32d68cfc9f1e31dab88e07446d1c02bc80b5e Mon Sep 17 00:00:00 2001
+From 1ce6ddfbf32e42c1318bc8b652b5afd635677c7d Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 12 Feb 2015 00:39:29 -0800
 Subject: [PATCH] Makefile.am: do not ship version.h
@@ -10,11 +10,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- Makefile.am |    4 ++--
+ Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 3334790..69cd58f 100644
+index 592fb7c..d865e84 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -10,11 +10,11 @@ pkginclude_HEADERS = include/types.h include/log.h include/plugin.h \
@@ -31,6 +31,3 @@ index 3334790..69cd58f 100644
  			$(noinst_HEADERS), include/near/$(notdir $(file)))
  
  gdbus_sources = gdbus/gdbus.h gdbus/mainloop.c gdbus/watch.c \
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
deleted file mode 100644
index aeb33a5bdc..0000000000
--- a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 43acc56d5506c7e318f717fb3634bc16e3438913 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 15 Jan 2015 18:12:07 -0800
-Subject: [PATCH] Makefile.am: fix parallel issue
-
-There might be no src dir if src/builtin.h runs earlier, create it to
-fix the race issue:
-
-src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
-/bin/sh: src/builtin.h: No such file or directory
-
-Upstream-Status: Backport [d39f8c0eee659743b4425d395c2f7ab1949e9c71]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.am |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: neard-0.16/Makefile.am
-===================================================================
---- neard-0.16.orig/Makefile.am
-+++ neard-0.16/Makefile.am
-@@ -244,6 +244,7 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(di
- src/plugin.$(OBJEXT): src/builtin.h
- 
- src/builtin.h: src/genbuiltin $(builtin_sources)
-+	$(AM_V_at)$(MKDIR_P) src
- 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
- 
- se/plugin.$(OBJEXT): se/builtin.h
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-connectivity/neard/neard_0.20.bb
similarity index 88%
rename from meta/recipes-connectivity/neard/neard_0.19.bb
rename to meta/recipes-connectivity/neard/neard_0.20.bb
index c1149e7631..7825b9a4bb 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.20.bb
@@ -10,18 +10,17 @@ DEPENDS = "dbus glib-2.0 libnl autoconf-archive-native"
 
 SRC_URI = "git://github.com/linux-nfc/neard;protocol=https;branch=master \
            file://neard.in \
-           file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
            file://0001-Add-header-dependency-to-nciattach.o.patch \
-          "
+           "
 
-SRCREV = "a1dc8a75cba999728e154a0f811ab9dd50c809f7"
+SRCREV = "7118668bc92fe15a8ff5e4067abd5e1622524f03"
 
 inherit autotools pkgconfig systemd update-rc.d
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}/ --with-systemduserunitdir=${systemd_unitdir}/user/,--disable-systemd"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}/,--disable-systemd"
 
 EXTRA_OECONF += "--enable-tools"
 
-- 
2.47.3


