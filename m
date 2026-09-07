Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A6AC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 06:37:38 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28902.1788763051702694510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 23:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=VaHBoIHR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202609070637280c45b4247300020788-zggiks@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202609070637280c45b4247300020788
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Sep 2026 08:37:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6AlUM29nFpKNoSOB76K+XEvJKIZL8ujuRTWdSXT4bjQ=;
 b=VaHBoIHRv3TLkh7g3lBj9RmM3eWbuxaPRZaf2g0IIadZM/np5nsUDejbV/OYQtcgexiX+9
 v/nWbIM8n010bjBMCIaUdcFhSwwSkDjywo+qr4nuS4bHiRvQmGLM+QGSGD+8NWEafrygGFxt
 vFaj/LSXTIptQ6fLVexEFJc5Mw+psQvIGayFn9v9lIoOIp4NGWQLtPgZTYeaWcHGxlpfcom5
 DIuKWUbRRCKQsHV/er1TPJ2j+cb9T569mLhwlQrpf57/AGR6gFPt95TSASNOwaucyro2/ke0
 Us+Plf4EoaZQ7yvN673rJ0xVIc4gEpC/fAhbXh1CKkDhSL6hxEWWc8Og==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/9] devtool: ide-sdk: pre-select attach process with processFilter
Date: Mon,  7 Sep 2026 08:36:09 +0200
Message-ID: <20260907063720.56742-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260907063720.56742-1-adrian.freihofer@siemens.com>
References: <20260907063720.56742-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245237

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The ATTACH launch config now uses the extended-remote protocol, which
makes cppdbg show a picker listing every process running on the
target. In modified-recipe mode the binary to attach to is already
known, so the picker is only extra clicking, and on a busy target it
can make finding the right process among unrelated ones tedious.

Set "processFilter" to a regex matching the deployed binary's path so
cppdbg pre-selects it instead of showing the full process list. This
is a recent cpptools feature; until it ships in a released cpptools,
cppdbg silently ignores it and falls back to showing the full
unfiltered process list.

Require cpptools version that supports processFilter
https://github.com/microsoft/vscode-cpptools/pull/14684

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 1 +
 scripts/lib/devtool/ide_plugins/ide_code.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3a407a5162..a4b7a83094 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3569,6 +3569,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
                 # from the process instead of killing it.
                 self.assertTrue(config.get("useExtendedRemote"), f"Configuration '{config['name']}' should use useExtendedRemote")
                 self.assertNotIn("cwd", config, f"Configuration '{config['name']}' should not set cwd in attach mode")
+                self.assertTrue(config.get("processFilter"), f"Configuration '{config['name']}' should use processFilter")
             else:
                 self.fail(f"Configuration '{config['name']}' has unexpected request type: {config['request']}")
 
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 937c63a4a5..6effbac654 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -387,6 +387,7 @@ class IdeVSCode(IdeBase):
             # this configuration is generated. Stopping the session detaches
             # from the process instead of killing it.
             launch_config["useExtendedRemote"] = True
+            launch_config["processFilter"] = "(^| )%s( |$)" % cross_debug_config.binary.binary_path
         else:
             # cwd, environment and externalConsole configure the process the
             # debugger starts, they are not part of the attach schema.
-- 
2.55.0


