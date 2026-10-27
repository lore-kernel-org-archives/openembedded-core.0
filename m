Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26168.1793125687457077936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 11:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=T2ImRulB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202610271828058dafcaa8eb00020710-ukr89j@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202610271828058dafcaa8eb00020710
        for <openembedded-core@lists.openembedded.org>;
        Tue, 27 Oct 2026 19:28:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=O58dAMjz+LyMRtSODcP6WRZOXlxRxUU4fOU2dRudHS0=;
 b=T2ImRulBpI2XHmbEGMq8JvTuZR6Ep/ZyEtVzn+Hwumn0hvoM1+p8QhQQ3kLLpar2eY4vd3
 GyjgFHfhtK2Z3hPv6aiX0PflGRAwitboWAqkM2KvuhSaVdHzCQTtU/M78NCbCJk3qkZe2dp7
 yRk4p/vYO+C3GGAGf788sFS/cTAU3HCLEKN0ViVWPAg6HZn639BuHJFB0FKUUUJZIZtTsC1t
 WiBhwdbsq0csYkIbR2A66wL8HCai5r0VKTS7lcPcYodPZPGYh7qwyAPPFVDcjhIaSSPmsvp2
 egEsaqBDMVHBxDjkzdAAAqp8E9pkCMMfLBX68zcr/udo/JwwMkPxb7uQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] boost: patch CVE-2023-34399
Date: Tue, 27 Oct 2026 19:27:11 +0100
Message-ID: <20261027182711.3084201-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 18:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248756
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../boost/boost/CVE-2023-34399.patch          | 35 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.92.0.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/CVE-2023-34399.patch

diff --git a/meta/recipes-support/boost/boost/CVE-2023-34399.patch b/meta/recipes-support/boost/boost/CVE-2023-34399.patch
new file mode 100644
index 0000000000..f2dbccd67e
--- /dev/null
+++ b/meta/recipes-support/boost/boost/CVE-2023-34399.patch
@@ -0,0 +1,35 @@
+From d772add4873bb2501d67554190c4272294d659f9 Mon Sep 17 00:00:00 2001
+From: Johnathan <39648915+TrebledJ@users.noreply.github.com>
+Date: Wed, 19 Aug 2026 16:50:08 +0200
+Subject: [PATCH] Reject a negative class id when loading a pointer (#332)
+
+A pointer carries the class id of what it points at, and a null pointer
+carries -1.  On the way back in, only -1 was recognised as the null tag,
+and the id then indexed the class table with an upper bound check but no
+lower bound one, so an archive carrying any other negative id read that
+table at an offset of its own choosing.  This is CVE-2023-34399.
+
+Treat every negative id as the null tag.  No archive a released version
+ever wrote carries one other than -1, so nothing that used to load stops
+loading.
+
+CVE: CVE-2023-34399
+Upstream-Status: Backport [https://github.com/boostorg/serialization/commit/d772add4873bb2501d67554190c4272294d659f9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libs/serialization/src/basic_iarchive.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libs/serialization/src/basic_iarchive.cpp b/libs/serialization/src/basic_iarchive.cpp
+index 1c6eb2047..b5c63c9ad 100644
+--- a/libs/serialization/src/basic_iarchive.cpp
++++ b/libs/serialization/src/basic_iarchive.cpp
+@@ -427,7 +427,7 @@ basic_iarchive_impl::load_pointer(
+     class_id_type cid;
+     load(ar, cid);
+ 
+-    if(BOOST_SERIALIZATION_NULL_POINTER_TAG == cid){
++    if(/* BOOST_SERIALIZATION_NULL_POINTER_TAG */ cid < 0){
+         t = NULL;
+         return bpis_ptr;
+     }
diff --git a/meta/recipes-support/boost/boost_1.92.0.bb b/meta/recipes-support/boost/boost_1.92.0.bb
index 01fc6bea66..5fa67a9da7 100644
--- a/meta/recipes-support/boost/boost_1.92.0.bb
+++ b/meta/recipes-support/boost/boost_1.92.0.bb
@@ -5,4 +5,5 @@ SRC_URI += "file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-histogram-move-b2-project-requirements-out-of-build.patch \
+           file://CVE-2023-34399.patch \
            "
