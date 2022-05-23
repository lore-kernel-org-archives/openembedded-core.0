Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0A8C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 02:20:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.23310.1653272438143063161
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 19:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=g6XgYgSf;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.20, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653272438; x=1684808438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Fr5b8/Suyn0/937eu2VY6LIojYFKkTWGjlzaJ2X25s=;
  b=g6XgYgSfbaI0ih2kvw9ZAFTVNkKiUw7nFWkA8PFtubGQ3dO19LF6WS4w
   9bpnPxwIVa20JaJNGdahtk9HJziVAGClGJ2BdSS1BDuS5GzlyYWq/edtZ
   oIv8ozB98Okn/zqDZcnnr181tk7DO0o3QqZ8LgIIrIkxfFKghUPXBOy2E
   6FeqeT6C9PoFaBLg7P+6yW8BEk1PnJQsAy5WmPXWzQZE6pwBrqbM+W4/+
   600zGeZ7Su7WxVB53oHAFkMQo3RvkWXlyVbgQA4ufgPhU7RT0TzufVDRv
   HxzX5os1KOZWAhfT7mXhHzwB6gTKNSe/4Vbs9GXWVJWDBwCgJ0/pVYDLT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="260680215"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="260680215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:20:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="600397357"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:20:33 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [oe-core] [PATCH v2 1/4] systemd: Drop
 0001-test-parse-argument-Include-signal.h.patch
Date: Mon, 23 May 2022 10:20:11 +0800
Message-Id: <20220523022014.1203675-2-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
References: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 02:20:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165989

This patch has already been upstreamed in commit systemd/850f0008bff7
("test-parse-argument: Include signal.h") since v249 stable release.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 ...test-parse-argument-Include-signal.h.patch | 27 -------------------
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch b/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
deleted file mode 100644
index 898e8af904..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 93c7e482d39cf7765974b3c729d29c1b120a60e3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 24 May 2021 18:26:27 -0700
-Subject: [PATCH] test-parse-argument: Include signal.h
-
-Fixes
-src/test/test-parse-argument.c:49:29: error: use of undeclared identifier 'SIGABRT'
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/19718]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/test/test-parse-argument.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/test/test-parse-argument.c b/src/test/test-parse-argument.c
-index cf3d54288a..15104e5282 100644
---- a/src/test/test-parse-argument.c
-+++ b/src/test/test-parse-argument.c
-@@ -5,6 +5,7 @@
- #include "parse-argument.h"
- #include "stdio-util.h"
- #include "tests.h"
-+#include <signal.h>
- 
- TEST(parse_json_argument) {
-         JsonFormatFlags flags = JSON_FORMAT_PRETTY;
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index c121fb763e..aca140d4d4 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -24,7 +24,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
-           file://0001-test-parse-argument-Include-signal.h.patch \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
            "
 
-- 
2.34.1


