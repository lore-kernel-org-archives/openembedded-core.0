Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C15E784BE
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 18:09:56 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28962.1766945391866649926
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Dec 2025 10:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=lYv0VEYb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202512281809496d7b8367e50002072a-bkiuay@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202512281809496d7b8367e50002072a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 28 Dec 2025 19:09:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2KZLrrsQGplu6qPoEALlw8YZwstM76NRkJPC/SFMZFo=;
 b=lYv0VEYbJTXGgwNzbUHTAf6dYzeGOZOYYMTje/WfDbqQ6oqDFOxYctmKk0uJ0F2WYRoWyJ
 VOPAfWq9wJaxU8673enPi2FB67Jn9SqHGltSFA7PQigDM+wWsZ0T1ql8Hnv/ffFTuFmXa/pT
 tmTphsQkR2mhnlP3092XjWaKeMJumnUuqdZOouD2aQaryT1pvkiZhfYDp8S3g6k5BT5x2yL8
 Tti8AD6E+VfckucDQNDWe8pKBnAUb4XggarL8SuaOii66Uppl/rTA03kw/GvxbsEWSwpNuRh
 HhApeyw2H+5wOyT2pmZ8AD+Y0VyvIk7M/qMkdG7W90tbQt0MCwhC0mRQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/3] oe-selftest: ide_sdk: use the ide-sdk fragment
Date: Sun, 28 Dec 2025 19:08:33 +0100
Message-ID: <20251228180935.2077478-4-adrian.freihofer@siemens.com>
In-Reply-To: <20251228180935.2077478-1-adrian.freihofer@siemens.com>
References: <20251228180935.2077478-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 18:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228587

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Test also the new ide-sdk fragment when setting up the ide-sdk test
environment.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8d7e984753..2173590030 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2526,13 +2526,11 @@ class DevtoolIdeSdkTests(DevtoolBase):
     def _write_bb_config(self, recipe_names):
         """Helper to write the bitbake local.conf file"""
         conf_lines = [
-            'IMAGE_CLASSES += "image-combined-dbg"',
-            'IMAGE_GEN_DEBUGFS = "1"',
-            'IMAGE_INSTALL:append = " gdbserver %s"' % ' '.join(
-                [r + '-ptest' for r in recipe_names]),
+            'IMAGE_INSTALL:append = " %s"' % ' '.join([r + '-ptest' for r in recipe_names]),
             'DISTRO_FEATURES:append = " ptest"'
         ]
-        self.write_config("\n".join(conf_lines))
+        fragments = ['core/yocto/devtool-ide-sdk']
+        self.write_config("\n".join(conf_lines), fragments=fragments)
 
     def _check_workspace(self):
         """Check if a workspace directory is available and setup the cleanup"""
-- 
2.52.0


