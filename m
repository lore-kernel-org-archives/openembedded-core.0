Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55D1C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 10:15:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.3710.1639995317013547028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TjoQseDJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i22so18910092wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5O2BzMPrIPMriXQZZplyRlWn2YWwaam6PvtC33VIWXE=;
        b=TjoQseDJNjU4DDabAL6MdQbmRhCzGBvWUJsYDguVxUEYyzhRWiSufO7klofhwkwoBV
         sxw6ptbLS/GS3YW5Qdwt6n1BdH9ZmCpwuwAemOWryi7YgkvfTldytDn4Iw/jUIIWm7vh
         Ejgmdf0Nzlhd90Qj8onGJnVpIp5m1T2PBHOPyJyREKHHYMj0TGEgWwIFWwMhq+2j8mLZ
         DDEn8oJUoN9864XMXjOQmWgoExFyVXDRkA0XgVaVbrYVX696pLjeymEdjXut/hbqmKWf
         7JjvoEPLJIz3EX37hSrqGUIc3ndfLAwcw7jJAfxrZIpb5VoKs5U2bsQsum3KKRn3SlgR
         AYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5O2BzMPrIPMriXQZZplyRlWn2YWwaam6PvtC33VIWXE=;
        b=3oVU6UKKBXE7oTYoqJ/fdqLcE4fkAkZt8VF1p0Jks9kW44UaC7AJzv9u62rYgZ7Pck
         4ghoOGHam5r1DGQQRGvFf6J9nHEiXCo2BNl4fT+M/2iT5nmr0NbmbXBntyeMweD+0Dyv
         viRqK82ozXi7qdtr10HqAhIPYfgeqVJ6tlz2AjojYLcAy3bDBBbhIz8K8D1Mspq756Co
         bM59Fsdzh8WYRk4wX3uJlXcXLYLg+42ozMyu9eTLjfBBbOO52xpFL/+qcuSam6Bn5BGQ
         e3QGH76bg1x7+iNFA2M+muPm5c7DrF5S8tfd0pouoDP3GB1pLvQLaARc9rE1Vmn5mI4g
         IQGQ==
X-Gm-Message-State: AOAM532+MaTDuHR4znZu6irkrepXnLmgDLQpSfYGrbpunLDrYxECYmZ0
	bV+UzYtd+WBWoJ3tOwNyosUuXEbJBak5CA==
X-Google-Smtp-Source: 
 ABdhPJxORQHtZAkZc6vKR1m3JrZ2oun2C2lilw+RlsmS1uHkc2FwpHirvSx2oQxuVkJZD9gF0eFgpg==
X-Received: by 2002:adf:c182:: with SMTP id x2mr12414579wre.646.1639995315346;
        Mon, 20 Dec 2021 02:15:15 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 m12sm2833563wrp.49.2021.12.20.02.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 02:15:15 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	kweihmann@outlook.com,
	bruce.ashfield@gmail.com,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	quentin.schulz@theobroma-systems.com
Subject: [oe][OE-core][Patch v2 2/2] oe-selftest: bbtests: add test_patching
 test
Date: Mon, 20 Dec 2021 11:14:05 +0100
Message-Id: <20211220101405.26735-3-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211220101405.26735-1-max.krummenacher@toradex.com>
References: <20211220101405.26735-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 10:15:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159861

This adds a test which tests the do_patch task.
Execute it with:

oe-selftest -r bbtests.BitbakeTests.test_patching

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../patchtest/patchtest/0001-10.patch         | 25 +++++++++++++
 .../patchtest/patchtest/0001-111.patch        | 25 +++++++++++++
 .../patchtest/patchtest/expected_source_file  | 11 ++++++
 .../patchtest/patchtest/expected_src_patches  |  5 +++
 .../patchtest/patchtest/expected_src_sources  |  7 ++++
 .../patchtest/patchset1/0001-11.patch         | 25 +++++++++++++
 .../patchtest/patchset2/0001-2.patch          | 25 +++++++++++++
 .../patchset2/0002_subset1/0001-4.patch       | 27 ++++++++++++++
 .../patchset2/0002_subset1/0002-6.patch       | 26 +++++++++++++
 .../patchtest/patchset2/0003-8.patch          | 25 +++++++++++++
 .../patchtest/patchset3/0001-111.patch        | 25 +++++++++++++
 .../patchtest/patchtest/src_patches           |  5 +++
 .../patchtest/patchtest/the_source_file       |  5 +++
 .../recipes-test/patchtest/patchtest_1.0.bb   | 37 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bbtests.py       | 18 +++++++++
 15 files changed, 291 insertions(+)
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/0001-10.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/0001-111.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/expected_source_file
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/expected_src_patches
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/expected_src_sources
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset1/0001-11.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset2/0001-2.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0001-4.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0002-6.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset2/0003-8.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset3/0001-111.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/src_patches
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/the_source_file
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest_1.0.bb

diff --git a/meta-selftest/recipes-test/patchtest/patchtest/0001-10.patch b/meta-selftest/recipes-test/patchtest/patchtest/0001-10.patch
new file mode 100644
index 0000000000..6756d90fa3
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/0001-10.patch
@@ -0,0 +1,25 @@
+From 285ae404b72b28f09ea4dadc3982f2b5209394e4 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Wed, 8 Dec 2021 15:46:20 +0100
+Subject: [PATCH] 10
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ the_source_file | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/the_source_file b/the_source_file
+index 0719398..0bdd73e 100644
+--- a/the_source_file
++++ b/the_source_file
+@@ -7,3 +7,5 @@
+ 7
+ 8
+ 9
++10
++
+-- 
+2.20.1
+
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/0001-111.patch b/meta-selftest/recipes-test/patchtest/patchtest/0001-111.patch
new file mode 100644
index 0000000000..2ffb92b541
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/0001-111.patch
@@ -0,0 +1,25 @@
+From 8401f132616a357f8d31f4f8a8671e3af2a951e9 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Wed, 8 Dec 2021 15:46:56 +0100
+Subject: [PATCH] 111
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ the_source_file | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/the_source_file b/the_source_file
+index 0bdd73e..3c6745a 100644
+--- a/the_source_file
++++ b/the_source_file
+@@ -8,4 +8,4 @@
+ 8
+ 9
+ 10
+-
++111
+-- 
+2.20.1
+
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/expected_source_file b/meta-selftest/recipes-test/patchtest/patchtest/expected_source_file
new file mode 100644
index 0000000000..0bdd73e9ea
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/expected_source_file
@@ -0,0 +1,11 @@
+1
+2
+3
+4
+5
+6
+7
+8
+9
+10
+
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/expected_src_patches b/meta-selftest/recipes-test/patchtest/patchtest/expected_src_patches
new file mode 100644
index 0000000000..3958fa6687
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/expected_src_patches
@@ -0,0 +1,5 @@
+file://.../patchtest/patchset2/0001-2.patch;patchname=0001-2.patch;striplevel=1
+file://.../patchtest/patchset2/0002_subset1/0001-4.patch;patchname=0001-4.patch;striplevel=1
+file://.../patchtest/patchset2/0002_subset1/0002-6.patch;patchname=0002-6.patch;striplevel=1
+file://.../patchtest/patchset2/0003-8.patch;patchname=0003-8.patch;striplevel=1
+file://.../patchtest/0001-10.patch;patchname=0001-10.patch;striplevel=1
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/expected_src_sources b/meta-selftest/recipes-test/patchtest/patchtest/expected_src_sources
new file mode 100644
index 0000000000..e537590e34
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/expected_src_sources
@@ -0,0 +1,7 @@
+.../patchtest/the_source_file
+.../patchtest/expected_source_file
+.../patchtest/expected_src_sources
+.../patchtest/expected_src_patches
+.../patchtest/patchset1/
+.../patchtest/patchset3/
+.../patchtest/0001-111.patch
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/patchset1/0001-11.patch b/meta-selftest/recipes-test/patchtest/patchtest/patchset1/0001-11.patch
new file mode 100644
index 0000000000..5f7d252acc
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/patchset1/0001-11.patch
@@ -0,0 +1,25 @@
+From c39f579aceff00e61103993e9232ce76e4da1bd8 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Wed, 8 Dec 2021 15:38:44 +0100
+Subject: [PATCH] 11
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ the_source_file | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/the_source_file b/the_source_file
+index 2738e8e..44caf78 100644
+--- a/the_source_file
++++ b/the_source_file
+@@ -1,4 +1,4 @@
+-1
++11
+ 3
+ 5
+ 7
+-- 
+2.20.1
+
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0001-2.patch b/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0001-2.patch
new file mode 100644
index 0000000000..ddb803f549
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0001-2.patch
@@ -0,0 +1,25 @@
+From 61300af3a14887d6f25d68481a0d328f4cce4864 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Wed, 8 Dec 2021 15:41:21 +0100
+Subject: [PATCH 1/4] 2
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ the_source_file | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/the_source_file b/the_source_file
+index 2738e8e..ecaefbd 100644
+--- a/the_source_file
++++ b/the_source_file
+@@ -1,4 +1,5 @@
+ 1
++2
+ 3
+ 5
+ 7
+-- 
+2.20.1
+
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0001-4.patch b/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0001-4.patch
new file mode 100644
index 0000000000..9dbb1ee052
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0001-4.patch
@@ -0,0 +1,27 @@
+From 71cc95135bd1a0864e8a35131d2982aeaad7bb88 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Wed, 8 Dec 2021 15:41:42 +0100
+Subject: [PATCH 2/4] 4
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ the_source_file | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/the_source_file b/the_source_file
+index ecaefbd..2c32db0 100644
+--- a/the_source_file
++++ b/the_source_file
+@@ -1,6 +1,7 @@
+ 1
+ 2
+ 3
++4
+ 5
+ 7
+ 9
+-- 
+2.20.1
+
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0002-6.patch b/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0002-6.patch
new file mode 100644
index 0000000000..bb31b2956a
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0002-6.patch
@@ -0,0 +1,26 @@
+From 3f182bc1b413911187264340f661c637b2afe766 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Wed, 8 Dec 2021 15:41:55 +0100
+Subject: [PATCH 3/4] 6
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ the_source_file | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/the_source_file b/the_source_file
+index 2c32db0..ef28dff 100644
+--- a/the_source_file
++++ b/the_source_file
+@@ -3,5 +3,6 @@
+ 3
+ 4
+ 5
++6
+ 7
+ 9
+-- 
+2.20.1
+
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0003-8.patch b/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0003-8.patch
new file mode 100644
index 0000000000..9cfdd45c6a
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/patchset2/0003-8.patch
@@ -0,0 +1,25 @@
+From 442a036ef3be12c68b4c8f4ae6a6b9954879c094 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Wed, 8 Dec 2021 15:42:12 +0100
+Subject: [PATCH 4/4] 8
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ the_source_file | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/the_source_file b/the_source_file
+index ef28dff..0719398 100644
+--- a/the_source_file
++++ b/the_source_file
+@@ -5,4 +5,5 @@
+ 5
+ 6
+ 7
++8
+ 9
+-- 
+2.20.1
+
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/patchset3/0001-111.patch b/meta-selftest/recipes-test/patchtest/patchtest/patchset3/0001-111.patch
new file mode 100644
index 0000000000..2ffb92b541
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/patchset3/0001-111.patch
@@ -0,0 +1,25 @@
+From 8401f132616a357f8d31f4f8a8671e3af2a951e9 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Wed, 8 Dec 2021 15:46:56 +0100
+Subject: [PATCH] 111
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ the_source_file | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/the_source_file b/the_source_file
+index 0bdd73e..3c6745a 100644
+--- a/the_source_file
++++ b/the_source_file
+@@ -8,4 +8,4 @@
+ 8
+ 9
+ 10
+-
++111
+-- 
+2.20.1
+
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/src_patches b/meta-selftest/recipes-test/patchtest/patchtest/src_patches
new file mode 100644
index 0000000000..c45568da42
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/src_patches
@@ -0,0 +1,5 @@
+file:///build/krm/poky_master/poky/meta/recipes-bsp/patchtest/patchtest/patchset2/0001-2.patch;patchname=0001-2.patch;striplevel=1
+file:///build/krm/poky_master/poky/meta/recipes-bsp/patchtest/patchtest/patchset2/0002_subset1/0001-4.patch;patchname=0001-4.patch;striplevel=1
+file:///build/krm/poky_master/poky/meta/recipes-bsp/patchtest/patchtest/patchset2/0002_subset1/0002-6.patch;patchname=0002-6.patch;striplevel=1
+file:///build/krm/poky_master/poky/meta/recipes-bsp/patchtest/patchtest/patchset2/0003-8.patch;patchname=0003-8.patch;striplevel=1
+file:///build/krm/poky_master/poky/meta/recipes-bsp/patchtest/patchtest/0001-10.patch;patchname=0001-10.patch;striplevel=1
diff --git a/meta-selftest/recipes-test/patchtest/patchtest/the_source_file b/meta-selftest/recipes-test/patchtest/patchtest/the_source_file
new file mode 100644
index 0000000000..2738e8e70a
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest/the_source_file
@@ -0,0 +1,5 @@
+1
+3
+5
+7
+9
diff --git a/meta-selftest/recipes-test/patchtest/patchtest_1.0.bb b/meta-selftest/recipes-test/patchtest/patchtest_1.0.bb
new file mode 100644
index 0000000000..6ecea61ecc
--- /dev/null
+++ b/meta-selftest/recipes-test/patchtest/patchtest_1.0.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Testrecipe to test do_patch"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = " \
+    file://the_source_file \
+    file://expected_source_file \
+    file://expected_src_sources \
+    file://expected_src_patches \
+    \
+    file://patchset1/ \
+    file://patchset2/;apply=yes \
+    file://patchset3/;apply=no \
+    file://0001-10.patch \
+    file://0001-111.patch;apply=no \
+"
+
+S = "${WORKDIR}"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+
+python patch_do_patch:append() {
+    import re
+    abs_paths = d.getVar('FILE_DIRNAME')
+    f = open('src_patches', 'w')
+    for uri in src_patches(d):
+        uri = re.sub(abs_paths, r'...', uri)
+        f.write(uri + '\n')
+
+    f = open('src_sources', 'w')
+    for uri in src_patches(d, all=True):
+        uri = re.sub(abs_paths, r'...', uri)
+        f.write(uri + '\n')
+}
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index a74576bc02..11fd7e10f3 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -81,6 +81,24 @@ class BitbakeTests(OESelftestTestCase):
                 found = l
         self.assertTrue(found and found.startswith("ERROR:"), msg = "Incorrectly formed patch application didn't fail. bitbake output: %s" % result.output)
 
+    def test_patching(self):
+        # The patchtest recipe patches 'the_source_file' with patches which
+        # then must match the content of 'expected_source_file'.
+        # Additionally it creates the files 'src_patches' and 'src_sources',
+        # containing the returned lists from src_patches() with 'all' set to
+        # False (src_patches) and True (src_sources). They must match the
+        # content of 'expected_src_patches' and 'expected_src_sources'.
+        from filecmp import cmp
+        bb_vars = get_bb_vars(['S'], 'patchtest')
+        dir = bb_vars['S']
+
+        result = bitbake('patchtest -fc patch', ignore_status=True)
+
+        self.assertNotEqual(result.status, 1, msg="do_patch failed. bitbake output: %s" % result.output)
+        self.assertTrue(cmp(dir + '/the_source_file', dir + '/expected_source_file', False), msg = "patches were not applied correctly")
+        self.assertTrue(cmp(dir + '/src_patches', dir + '/expected_src_patches', False), msg = "patches consumed by do_patch were not identified correctly")
+        self.assertTrue(cmp(dir + '/src_sources', dir + '/expected_src_sources', False), msg = "src_uri entries which are not consumed by do_patch were not identified correctly")
+
     def test_force_task_1(self):
         # test 1 from bug 5875
         import uuid
-- 
2.20.1


