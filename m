Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FE1C79F9E
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 21:03:23 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21705.1788728596288320424
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 14:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=dMDwqqrf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2026090621031396245b512800020772-gbvfmb@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026090621031396245b512800020772
        for <openembedded-core@lists.openembedded.org>;
        Sun, 06 Sep 2026 23:03:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zE4ceVg4o08oskoLrbtOzvnclw8gdzi+brH/TCw08z4=;
 b=dMDwqqrfSkm1cfXolGAhb17fu/Ds5hYWQc1ihv1FhOmJNGwCOnnEKOXKh8HS3IzVoXEShv
 uWzKo7mOoEVbn4qfjZ/mtUEMSPh1uKpdq7qxg7EwejmjgQPYchbcf2OXvJ7jedhn47bNR++i
 8Rnxci9Krcz4CcX02drMVJosK5YuivpZ1xJmm6qlgQnuf/sQ0I/A+1WkmekS2GUfllI1mkDi
 hqxOLNK35tXjag5+N7TFSje/iOz49qHw6Qre7FAVFCmbLlQEVMkTwgpK1fyQ6+P0YhbLFtj1
 tUjVg2qs+zFWrXyllKlR5FG9H6pf6ifPRiPhqZsnFj++/PVxFw+86okg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/9] oe-selftest: devtool ide-sdk: do not guess the slirp SSH port
Date: Sun,  6 Sep 2026 23:02:00 +0200
Message-ID: <20260906210307.2793974-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260906210307.2793974-1-adrian.freihofer@siemens.com>
References: <20260906210307.2793974-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 21:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245217

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Falling back to a hardcoded 2222 hides the case where runqemu did not
report an ip:port pair: the test would then keep running against a port
that nothing listens on and fail somewhere further down. Assert the port
instead, so the failure points at its actual cause.
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index de59feadb8..3a407a5162 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3991,7 +3991,8 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
         with runqemu(testimage, runqemuparams="nographic slirp") as qemu:
             slirp_host = qemu.ip
-            slirp_port = qemu.port or '2222'
+            self.assertIsNotNone(qemu.port, 'No SSH port for the slirp target')
+            slirp_port = qemu.port
 
             # Re-run ide-sdk with the actual slirp address; image is already built.
             bitbake_sdk_cmd = (
-- 
2.55.0


