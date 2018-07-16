Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 82A317550F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:33:33 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f21-v6so3627327wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QWpmDKg7+bBveWjVB2xemcb5zA0gP2Ky7Z+eA2prf6k=;
	b=bJN/XkCKc8+4kSocEEUV9ahBILgLm4WRIunnIUibzhLhSpSDu7IFzVyZQ5fxtOW2Q2
	7BdXKdkPRWIHxTkAmLDfBsGMnCQolwjHbEpQICcYWiBcVa2ixYseVuNggRr73taOvnjK
	7ZoA0CGf82K0VhfmFvIM1saWT3L+qrbWlK54A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QWpmDKg7+bBveWjVB2xemcb5zA0gP2Ky7Z+eA2prf6k=;
	b=g2DXbgATLWBfx/x5LJ4Yci05HumvCK6h7KnNqobeZ2ab+iwlvb4m8qjFXOo7wpLH7W
	QrzggwBxa2WT9IVc//Q+LkGYbknHg/XA14kwoLglC3XdzeSGaYzjF5F8xgUvnICwoqMT
	WMY3sgwaUZ6jWtR6IipGFx4RatIyTq7QLRiYzl44r43aeRCuyrwRKRLOhBRDiXxQWpg/
	bXcTU523hZHFifwYsANtUWP+6ZxqWRW9HonzJ5CitS1l7Gt+ADepFb8uj5XPdD35ZATJ
	WWdi+tDNrUa2QEwKUAbI0Ip+O/z+DwhGVkq5oyInMxXqfyW5/lBlFxFaOALLJQI2V5o7
	Prlg==
X-Gm-Message-State: AOUpUlEiL3wqEXJPQr/VX3bVzmhRG/Bi1YQnAMsuYpGR3ZuuC6tZR+f3
	qGeF7nsu4/pJGfdFbV8sH/aARwZE7Vs=
X-Google-Smtp-Source: AAOMgpcHynDu3wiz8BnW0r+oJkpsAJPbUS0jV0P7HsHzg9l3E2+kBnbol2LcpJNOCuRQYLqsMF03IQ==
X-Received: by 2002:a1c:3f08:: with SMTP id
	m8-v6mr11051460wma.88.1531758813982; 
	Mon, 16 Jul 2018 09:33:33 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j65-v6sm13571188wmd.39.2018.07.16.09.33.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 09:33:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:33:24 +0100
Message-Id: <20180716163325.13847-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
References: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/6] testsdk: Enable multiprocess execution
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 16:33:33 -0000

This uses the new concurrenttest code to enable parallel test execution
if specified.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testsdk.bbclass | 7 ++++++-
 meta/lib/oeqa/sdk/context.py | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 2b5d66b1931..5df17bfa9e3 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -42,6 +42,8 @@ def testsdk_main(d):
     host_pkg_manifest = OESDKTestContextExecutor._load_manifest(
         d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"))
 
+    processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or d.getVar("BB_NUMBER_THREADS")
+
     sdk_dir = d.expand("${WORKDIR}/testimage-sdk/")
     bb.utils.remove(sdk_dir, True)
     bb.utils.mkdirhier(sdk_dir)
@@ -65,7 +67,10 @@ def testsdk_main(d):
             import traceback
             bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
 
-        result = tc.runTests()
+        if processes:
+            result = tc.runTests(processes=int(processes))
+        else:
+            result = tc.runTests()
 
         component = "%s %s" % (pn, OESDKTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 82e4c19bfc1..7c091c0534c 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -65,6 +65,9 @@ class OESDKTestContextExecutor(OETestContextExecutor):
         sdk_rgroup.add_argument('--sdk-dir', required=False, action='store', 
             help='sdk installed directory')
 
+        self.parser.add_argument('-j', '--num-processes', dest='processes', action='store',
+                type=int, help="number of processes to execute in parallel with")
+
     @staticmethod
     def _load_manifest(manifest):
         pkg_manifest = {}
@@ -85,6 +88,7 @@ class OESDKTestContextExecutor(OETestContextExecutor):
                 OESDKTestContextExecutor._load_manifest(args.target_manifest)
         self.tc_kwargs['init']['host_pkg_manifest'] = \
                 OESDKTestContextExecutor._load_manifest(args.host_manifest)
+        self.tc_kwargs['run']['processes'] = args.processes
 
     @staticmethod
     def _get_sdk_environs(sdk_dir):
-- 
2.17.1


