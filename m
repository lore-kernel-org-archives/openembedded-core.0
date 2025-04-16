Return-Path: <thune.a.tran@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F0CC369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 16:42:05 +0000 (UTC)
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net [130.76.144.162])
 by mx.groups.io with SMTP id smtpd.web11.24172.1744821717024699044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 09:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=jcKGhK1B;
 spf=pass (domain: boeing.com, ip: 130.76.144.162, mailfrom: thune.a.tran@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 53GGfr9S016638;
	Wed, 16 Apr 2025 12:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1744821716;
	bh=PEqRaO4Y31DN1l2rmX2dBpNVjYIUo6PLkyH3ekuayb0=;
	h=From:To:Cc:Subject:Date:From;
	b=jcKGhK1BTff+5zNqldAENEcxmeM7ktfEicMnbwSoc+syYLwZXtFpJxb5NcRUL+Ny3
	 d5/jhf5Jm9vdZdDxPj0TBWO3yl7IwjOdOMJDKj7JvW2qVARBHcZGvPZxQyWknTyL2v
	 2M6nKOleoWuEFzBSKxJC3ZFXqiXObFzhNiMHfUtJHZyR9KGA8zQpOmZ/jp9CWML5kR
	 vKVcQTOvkagURR9E55noFyUmCjmfHjywbN0fXPnT4aBGO8xr1CkZcQHBFpma5d93SR
	 yKVXiWGL7FMGUFGYL1Ks+PtNjSZOZBeJGhA0Mo5/X0JJG0WmZM9XSF/ol2cuF/NHq4
	 7fn+Q4MtXhNVQ==
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net [137.136.102.153])
	by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 53GGfgs8016503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 12:41:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id 53GGffea023010;
	Wed, 16 Apr 2025 09:41:41 -0700
Received: from A6360519.boeing.com (a6360519.nos.boeing.com [10.35.46.188])
	by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id 53GGfdsf022816;
	Wed, 16 Apr 2025 09:41:40 -0700
From: Thune Tran <thune.a.tran@boeing.com>
To: openembedded-core@lists.openembedded.org
Cc: Thune Tran <thune.a.tran@boeing.com>,
        Chuck Wolber <chuck.wolber@boeing.com>
Subject: [PATCH] oeqa/sdk/sdktest: Add test discovery across layers
Date: Wed, 16 Apr 2025 16:41:34 +0000
Message-Id: <20250416164134.399-1-thune.a.tran@boeing.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 16:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215001

The testsdk task only loads SDK tests from the openembedded-core
layer's meta/lib/oeqa/sdk/cases/.

This patch implements test discovery to include SDK tests from all
configured layers that mirror <LAYER_DIR>/lib/oeqa/sdk/cases/. The
implementation mirrors get_runtime_paths() in meta/classes-recipe/testimage.

Tested by:

1. Adding SDK test cases to <LAYER_DIR>/lib/oeqa/sdk/cases/ and
   verifying they are discovered and executed with no errors.
2. Verifying existing SDK test cases in openembedded-core layer
   are discovered and executed with no errors.

Signed-off-by: Thune Tran <thune.a.tran@boeing.com>
Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>
---
 meta/lib/oeqa/sdk/testsdk.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 518b09febb..505add8f8c 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -31,6 +31,20 @@ class TestSDK(TestSDKBase):
     context_class = OESDKTestContext
     test_type = 'sdk'
 
+    def get_sdk_paths(self, d):
+        """
+        Returns a list of paths where SDK test must reside.
+
+        SDK tests are expected in <LAYER_DIR>/lib/oeqa/sdk/cases/
+        """
+        paths = []
+
+        for layer in d.getVar('BBLAYERS').split():
+            path = os.path.join(layer, 'lib/oeqa/sdk/cases')
+            if os.path.isdir(path):
+                paths.append(path)
+        return paths
+
     def get_tcname(self, d):
         """
         Get the name of the SDK file
@@ -114,7 +128,7 @@ class TestSDK(TestSDKBase):
                 host_pkg_manifest=host_pkg_manifest, **context_args)
 
             try:
-                tc.loadTests(self.context_executor_class.default_cases)
+                tc.loadTests(self.get_sdk_paths(d))
             except Exception as e:
                 import traceback
                 bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
-- 
2.34.1


