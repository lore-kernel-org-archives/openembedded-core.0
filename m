Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F56DCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 18:36:48 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65906.1790620605912467194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 11:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MPki7/Ln;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7470; q=dns/txt;
  s=iport01; t=1790620605; x=1791830205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J84x+oBICoecKFYTfQ+hPbKJVfNDCNterDkUpaOdxac=;
  b=MPki7/Ln6CuwlVLbveeUMwaNLPHsj7nmWPGSddnzXTNwR9nzjc9CTu9M
   lKZfjwllL1+kFW9s6ahkeacM5Nm8/XWL/CJ6ayaK2XwC15nAt5YkWyFj2
   Feo3D3QKVzWlsSwwz5raFFD4Qp3eOf3BojFzZEvjDA2h7d58hkuGWPF2c
   tuJqM/oYMIl4FWxIlrMhq5HhkHsEUoNgt0AS5IDOkNpvyXxHhVqiAi9b3
   CeTb6BvuQUf2BYYaQ3CHqDcv9UVyU/gkP0qnDP21GAFf2D1gi2AStabNr
   XqLP808T31CTwByOV4xxPv82bm7dK5/Jmm8NzujCeeySDNc9ty/vDWm76
   w==;
X-CSE-ConnectionGUID: 0a34D7u6QXChDTfFungFAA==
X-CSE-MsgGUID: J7u238G3S4GfMYqZybB4Lw==
X-IPAS-Result: =?us-ascii?q?A0BFAgCvsrpq/4v/Ja1aglmCV3VgQ0mWSp4dgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQWOCwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QEgECASoLARgBLSwDAQJaIyGDAgGCdAMRBsJtgXkzgQGDKQExAgHcU?=
 =?us-ascii?q?gELFAGBOIVAiCNdGAGEfCcbG4FygRWDaYJhAQMBgRQQhn4EgiKBDIFaHogci?=
 =?us-ascii?q?w9IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBHYEgghkjGTZ6g?=
 =?us-ascii?q?QlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVBChJHJiIIEgkBExowC4EhO?=
 =?us-ascii?q?EEJKBwYDUgRLDcVGQQ+bgeQMh6CZXQQCgEHIgKCPQsvkkYmQ5F8oQ8KKIN2j?=
 =?us-ascii?q?CKVOhozhASBV5JAklSZCI4KllCEaYFoPIFZcBWDIglKGQ+QFYRzgi/HJicyA?=
 =?us-ascii?q?jsBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:fThuM67ANiImEIwckxKhmgxRtC7GchMFZxGqfqrLsTDasY5as4F+v
 mRJDTiOOP2CNzH2LtxzPdixoUoCvMKGytM1G1Flq381Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqajNOu/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZYRDpsooHD93x
 dcYBAwDQA2FiMyf6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYeUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIePKozTH5gJwi50o
 ErkoHmjWUE1b+fD5jSgw2uel+XlwQfkDdd6+LqQs6QCbEeo7m4aCQUfSF/9qvm0h1S4Utd3J
 lcIvDYjpqha3FaqRdn0RRH+uGOesh8Rc95RFfAq5gaQzKbd/weeAC4DVDEpQNs+uck7QDYn2
 lOEk5biAiZimLmUUm6GsLCMoDW/PCIYIWMPaWkDVwRt3jX4iJs4ghSKSpNoF7S4y4WvXzrx2
 DuN6iM5gt3/kPI26klyxnif6xrEm3QDZlRdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:k58gf6kGk9HG6OHs4Kysj10/0+LpDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3AM1WSlGkU6Vkolot7m2uKKEXUox/XOSXUlyv8fFL?=
 =?us-ascii?q?mMFZCSJGpR3GN/qxKuuM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AD/Qv5Q+KaF8BgNbP5lUad3eQf+U3/v71WG9Wqsk?=
 =?us-ascii?q?ptey1LB5hMR3BqCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="528812544"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 18:36:44 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id BFB8A180000F5;
	Mon, 28 Sep 2026 18:36:44 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 6AE31CC1611; Mon, 28 Sep 2026 11:36:44 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/2] bind: upgrade 9.20.26 -> 9.20.27
Date: Mon, 28 Sep 2026 11:36:33 -0700
Message-Id: <20260928183634.1877978-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 18:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246784

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

ChangeLog: https://bind9.readthedocs.io/en/stable/changelog.html#bind-9-20-27

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6de1243270216428d7eefdbc0ea5657e0aeb3a48)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.26.bb => bind_9.20.27.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.26.bb => bind_9.20.27.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 7ed4c5fd2f9..30da1e9fd3e 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From a67ac281cd86d8d9ca27e64a5944deb5578e5087 Mon Sep 17 00:00:00 2001
+From 7682cbc2fa624fbeeb088736e154090d92c8b524 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index da4cdef696e..f1d8a8e5691 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 16608520c9d946223404165732eacd79b59de471 Mon Sep 17 00:00:00 2001
+From a633e336c248ceab41d3182848b65c95e90ef88c Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 07acce9cba0..da4057064e1 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From d925183807ae182cf332124ff5a617d257e184f9 Mon Sep 17 00:00:00 2001
+From 4b870f60338fe45e036b8a76d47f053338920048 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index af020f0..f461229 100644
+index 56bca5b..4fd62ed 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 4e90e972715..9adc101247e 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From af229781e60d6779c76d5a61d26a4597b2a42f6c Mon Sep 17 00:00:00 2001
+From f3736e5535236cf978fd368b6905098ff6e4fd84 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f47ce7b..af020f0 100644
+index c06a0d7..56bca5b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 3425742d1ba..803456c0b33 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From bde3a4cb010f459a9ef92817c7e6e6e2d871794a Mon Sep 17 00:00:00 2001
+From 450187e8feac041de02afd4c0c9039cc41e04cb9 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 9b55afb5d3b..a2c1fbb8f70 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 8876e722beda701a0de021360ff381347120c6ff Mon Sep 17 00:00:00 2001
+From 582334d31432969be7e10906de7540f1dc64b17e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 33d5d34f158..dc1f8f5a9a6 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 26c988eee9d2eae7c7dec8c529176352017b2ce1 Mon Sep 17 00:00:00 2001
+From 50601a7ee8fd19ddbe9a592c57ae6197782d4c2f Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.26.bb b/meta/recipes-connectivity/bind/bind_9.20.27.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.26.bb
rename to meta/recipes-connectivity/bind/bind_9.20.27.bb
index fe2ae3f002f..6d2b88e0123 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.27.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350"
+SRC_URI[sha256sum] = "145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.35.6


