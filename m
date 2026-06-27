Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5EBC43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 07:55:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51401.1782546943675650106
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 00:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LNqVrh5S;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46def4bd5e8so1532650f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782546942; x=1783151742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4TzgBKQ+ksCb/7b/aJiJjKUKVMYOaLbKGkYLxfXu28=;
        b=LNqVrh5S0sbU+vC+acaZ5XbXwOjtTykYw7OQYVGf6uPVTKzVi+ndkh2VwuetBrpRAI
         7rGHIcEZvLcWfJCQM1hKsFlRykfxPg/2H1+0Jy6zaVy8qZ+G9I8CuxM7zhrnWiK97KUx
         +gluyd4Ei+dF8wwTNC14jsOhEfxX+re41ZcV1JqwCjM/UELRG1UpFr9OVIEv6vo0Jqnz
         d76x0e6IZPMgISjEqyO3Nx2CAT9Pqtj+hLfCshWBFLuESeGRxq9Oj/QGqJQRupUfOonK
         0y9vUbUmBF3x/1CfGeIo+pk4ggh2GK77gwkcFNWX7MUPf+EMmKhjBAsFmjhyRRUz+dAE
         8ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782546942; x=1783151742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4TzgBKQ+ksCb/7b/aJiJjKUKVMYOaLbKGkYLxfXu28=;
        b=BMEFP95HuPBpijn/QqcnIcJm17ly1tih9QExwukqSOrwn8mksLmF4SQYJ5YTpENpA1
         8uP425SZDDVAwXWj1TWY0JthgvGwaFVfCFarAOJC/BWeJJWMERR1r+/3Z5RtTQW4x239
         7JN31whL3h0OXl+GBBIzyos2207RFjVzbIfkl9kGn8AwG7rDPEOgO4GCLIZn92jrh2T+
         5T4WL+56XJ6bJ+nRDqQW9001qH06fKHZVcEgS/b21d1l+J10GD+LLYm3One3A/Krzft1
         G0lC7VdahxhTS/t80GmZ/OA1/8zv0E+Vz4X5kIlxjERuchGh4ZiWReUEJDGhppnCEaIO
         QwLQ==
X-Gm-Message-State: AOJu0YyHYpOXAE46H5+DXiN9eSlHLlBoL+F0Gb1wqdSvh+hZbLIiB3pq
	nYvRuxZn5t0VXk5RgBQ1jR5tgyYz9HQOLZMZy8QLMjqvDAbOJ3zoLGfwMGDQDWwHhW0=
X-Gm-Gg: AfdE7cnyzBflo3eWNdl+xhJQSF2ULybQJbUNzF/Lv6enutsmJJntPy9ojzZxpMdq78g
	OEhqVraOnmafGmWxdsmRHcgT025zI4gW9UxPjZuCHeF3Lo0KMBezVQs+sUlodY7Sa/czZ6cVMjF
	wZR/m7V5MvoaPGL9PbhhqUNKxbrOJpCyAb0PiCME29Q9r5gYfobW7OHysfCq7GbtmWC8Em6NSD1
	Os3MlwMlxVKG6UDO0kBDUE7qCsucwF0lN+yMAcHM+UxA8M+srkrgdmMebogosn9UXjKs2P4TwDb
	kzfMmTHkbNQupjpBdUJc3AuAyTO0IVBOmra3e8HpxijQ/0/P4/cyNCDUeo8D/Bom5mlPDhvdyBZ
	4Ql8xwhNGhB1fAz6DIwePfnZKOepmjFj60u8b1HPDmWY9hxw+GKKKKK6xjjpgjp+S8nvlSyPpKc
	ii6JMAq+LURDoOcVrlWm8KftPrqKupPSyAOae4KGsC2KeXVjBcPRyjeko4zAU=
X-Received: by 2002:a05:600c:a086:b0:492:6954:1036 with SMTP id 5b1f17b1804b1-49269541111mr102930245e9.14.1782546941848;
        Sat, 27 Jun 2026 00:55:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f4ffc11d9sm11421952f8f.37.2026.06.27.00.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 00:55:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/8] boost: upgrade 1.90.0 -> 1.91.0
Date: Sat, 27 Jun 2026 09:55:29 +0200
Message-ID: <20260627075532.3153679-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627075532.3153679-1-alex.kanavin@gmail.com>
References: <20260627075532.3153679-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 07:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239691

From: Alexander Kanavin <alex@linutronix.de>

Drop 'system' from BOOST_LIBS, as it seems
to be header-only (no separate shared library)
in the new version.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../boost/{boost-1.90.0.inc => boost-1.91.0.inc}       |  2 +-
 meta/recipes-support/boost/boost.inc                   |  1 -
 ...et-up-arch-instruction-set-flags-we-do-that-o.patch | 10 +++++-----
 .../boost/0001-dont-setup-compiler-flags-m32-m64.patch |  4 ++--
 .../boost/boost/boost-math-disable-pch-for-gcc.patch   |  2 +-
 .../boost/{boost_1.90.0.bb => boost_1.91.0.bb}         |  0
 6 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-support/boost/{boost-1.90.0.inc => boost-1.91.0.inc} (90%)
 rename meta/recipes-support/boost/{boost_1.90.0.bb => boost_1.91.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.90.0.inc b/meta/recipes-support/boost/boost-1.91.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.90.0.inc
rename to meta/recipes-support/boost/boost-1.91.0.inc
index 9b0ce592d9..ba3f6062f3 100644
--- a/meta/recipes-support/boost/boost-1.90.0.inc
+++ b/meta/recipes-support/boost/boost-1.91.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "49551aff3b22cbc5c5a9ed3dbc92f0e23ea50a0f7325b0d198b705e8ee3fc305"
+SRC_URI[sha256sum] = "de5e6b0e4913395c6bdfa90537febd9028ea4c0735d2cdb0cd9b45d5f51264f5"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 64a57ddfb2..7a343e54f6 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -37,7 +37,6 @@ BOOST_LIBS = "\
 	random \
 	regex \
 	serialization \
-	system \
 	test \
 	thread \
 	timer \
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 4314f9e532..92bb6e55b3 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From c2c2a53afc46775146c0960fc6c5f714530afa21 Mon Sep 17 00:00:00 2001
+From 98fff479c074472833dcacb815115f247e9023c7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 153 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 2b6caed41..8325a3f65 100644
+index acf02ce26..becd0ad05 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1143,156 +1143,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1150,156 +1150,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
@@ -162,10 +162,10 @@ index 2b6caed41..8325a3f65 100644
 -cpu-flags gcc OPTIONS : s390x : z14 : -march=z14 ;
 -cpu-flags gcc OPTIONS : s390x : z15 : -march=z15 ;
 -# ARM
--cpu-flags gcc OPTIONS : arm : cortex-a9+vfpv3 : -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard ;
+-cpu-flags gcc OPTIONS : arm : cortex-a9+vfpv3 : -mcpu=cortex-a9 -mfpu=vfpv3 ;
 -cpu-flags gcc OPTIONS : arm : cortex-a53 : -mcpu=cortex-a53 ;
 -cpu-flags gcc OPTIONS : arm : cortex-r5 : -mcpu=cortex-r5 ;
--cpu-flags gcc OPTIONS : arm : cortex-r5+vfpv3-d16 : -mcpu=cortex-r5 -mfpu=vfpv3-d16 -mfloat-abi=hard ;
+-cpu-flags gcc OPTIONS : arm : cortex-r5+vfpv3-d16 : -mcpu=cortex-r5 -mfpu=vfpv3-d16 ;
 -# AIX variant of RS/6000 & PowerPC
 -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
 -
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
index 9a9e8cde62..229e5ab8ea 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -1,4 +1,4 @@
-From bb73dd0d99a13e9c5aecbed34b166ff810a00dae Mon Sep 17 00:00:00 2001
+From 03ec6a66ad60d224d56c0b85eae843b469b572e0 Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 14 Nov 2019 10:13:53 +0800
 Subject: [PATCH] dont setup compiler flags -m32/-m64
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 16 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 8325a3f65..5a95046e7 100644
+index becd0ad05..e39bf8454 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
 @@ -375,22 +375,6 @@ local rule compile-link-flags ( * )
diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
index 9dd5f63218..178c1dd416 100644
--- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -1,4 +1,4 @@
-From 52f928686da5ef699dec7f7a296c5226d82180c1 Mon Sep 17 00:00:00 2001
+From 2dd80802e0b9747ed32f45a886c7ad21b7fa61be Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Fri, 23 Sep 2016 01:04:50 -0700
 Subject: [PATCH] boost-math: disable pch for gcc
diff --git a/meta/recipes-support/boost/boost_1.90.0.bb b/meta/recipes-support/boost/boost_1.91.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.90.0.bb
rename to meta/recipes-support/boost/boost_1.91.0.bb
-- 
2.47.3


