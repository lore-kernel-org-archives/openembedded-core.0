Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0437C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:13 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.531.1635871631913336930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509682"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509682"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:26 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575093"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/24] strace: show test suite log on failure
Date: Wed,  3 Nov 2021 00:43:51 +0800
Message-Id: 
 <b5e799b94d918ad908eab5a0daf6a0ee460d7581.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157789

From: Ross Burton <ross@burtonini.com>

If the tests fail, dump the log so we can see the failures.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3154a65039831b1e041217707fdd6ca042f588fb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 3a51fb0be9..02bb91e07f 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,6 +1,15 @@
 #!/bin/sh
+
+set -u
+
 export TIMEOUT_DURATION=240
 chown nobody tests
 chown nobody tests/*
 chown nobody ../ptest
+
 su nobody -c "make -B -C tests -k test-suite.log"
+res=$?
+if [ $res -ne 0 ]; then
+    cat tests/test-suite.log
+fi
+exit $res
-- 
2.31.1


