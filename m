Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE3EEA4FD8
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:08:14 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5321.1771880890339920881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=PSSfkDe7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260223210807cd09546a45000207c8-e4podj@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260223210807cd09546a45000207c8
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Feb 2026 22:08:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Is2DPq64dpIsCbjgXl9MpW3MmlY5c/dMSHDSz8lKoMQ=;
 b=PSSfkDe7aEXT7ndZLE2YfnIKsBlbkCPynSHK48sc3VsyOUb1fWvvFHXBNAVxt/zWc1FeUQ
 55ksmGwUE10Ac/WhoC1Mh40JWDeYyuwSnAQjWi4wpXPu2bmlEPpw50L632O0tTbdOSGSeasH
 pRxNH6DEkfumEQTpkSGI/Ai/GCeaQmlSQ+lYxVquOT77BfU5ITf0jFXl0sIEdJtWFSLwrmuK
 hZTnSk3lGri0jDTIO9WycnPAWvmtVvs/dlPotJjA21WVtWrm0K7Oju4ms8GB1CLwc7CfXmPo
 22u61WfZtzSO1Ag0FupeZskUer3gBM35OMVfoi4vOwZOLZ4ilKf5Oiug==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/7] oe-selftest: devtool: improve test_devtool_ide_sdk_shared_sysroots
Date: Mon, 23 Feb 2026 22:06:35 +0100
Message-ID: <20260223210748.1905502-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
References: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231694

From: Adrian Freihofer <adrian.freihofer@siemens.com>

In shared-sysroot IDE SDK mode, the C++ CMake example test ran CMake
commands but did not assert that configure/build completed successfully.
This could hide failures and produce false positives.

Capture command output from both steps and assert expected messages:
- configure: "Build files have been written to: <builddir>"
- build: "Built target"

This makes the test explicitly fail when CMake configure or build does not
complete as expected.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index f7f9deb6c7..6e6bada147 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3338,8 +3338,12 @@ class DevtoolIdeSdkTests(DevtoolBase):
         cmake_native = os.path.normpath(result_cmake.output.strip())
         self.assertExists(cmake_native)
 
-        runCmdEnv('cmake %s' % cpp_example_src, cwd=tempdir_cmake, output_log=self._cmd_logger)
-        runCmdEnv('cmake --build %s' % tempdir_cmake, cwd=tempdir_cmake, output_log=self._cmd_logger)
+        result_cmake = runCmdEnv('cmake -S %s -B %s' % (cpp_example_src, tempdir_cmake),
+                                 cwd=tempdir_cmake, output_log=self._cmd_logger)
+        self.assertIn("Build files have been written to: %s" % tempdir_cmake, result_cmake.output)
+        result_cmake = runCmdEnv('cmake --build %s' % tempdir_cmake,
+                                 cwd=tempdir_cmake, output_log=self._cmd_logger)
+        self.assertIn("Built target", result_cmake.output)
 
         # Verify the printed note really referres to a cmake executable
         cmake_native_code = ""
-- 
2.53.0


