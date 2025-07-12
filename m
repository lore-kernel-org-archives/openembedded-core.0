Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D598C83F20
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 13:07:16 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.35880.1752325628103602042
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 06:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=IYW8kVS2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20250712130704940b3ee5dd01571c32-maojyk@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250712130704940b3ee5dd01571c32
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 15:07:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qgjJo3gIpWl5hdNq2c72I5pHKr1YpJS3dU99exy/C+Y=;
 b=IYW8kVS22wcXMrkusaeDF1atP9OGCtuc89B3NFA+UUPQsfUutzNRyX2YJtDsBo7/1SdXzC
 4IcZXbpeHMmyLbUcWypVy7JPlZhR1CTz8FDYdKoTYgTr1xN3PAKedk4iGfN9b687yfxMnDW6
 B4nsvyjBelicXiiKWtiEoSMryNSFNRh5Q7CC/U4u/gXtp0XXe9MQ0GpYT5/VKrhU7SAbRRii
 5vtdxB0X24clCQb0xAtI4Qd+2DQZmYGaWJePM3qW+6Qt7k8SMkr3wA/PkcxmED7mdAoNboS6
 Pd4MtBh+6kFsXI2ZBTJQdHpluOfQ6O0qwgMIzrbBaHUR0wfRwVx5iw6w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] oe-selftest: devtool: run without poky
Date: Sat, 12 Jul 2025 15:06:37 +0200
Message-ID: <20250712130650.3406826-3-adrian.freihofer@siemens.com>
In-Reply-To: <20250712130650.3406826-1-adrian.freihofer@siemens.com>
References: <20250712130650.3406826-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 13:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220187

From: Adrian Freihofer <adrian.freihofer@siemens.com>

If DISTRO is set to poky, the ptest DISTRO_FEATURE is enable. However,
without meta-poky layer, ptest packages are not compiled and the tests
fail with:
   ERROR: Nothing RPROVIDES 'cmake-example-ptest'...

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 32805da036e..d5715b328b6 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2520,7 +2520,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
             'IMAGE_CLASSES += "image-combined-dbg"',
             'IMAGE_GEN_DEBUGFS = "1"',
             'IMAGE_INSTALL:append = " gdbserver %s"' % ' '.join(
-                [r + '-ptest' for r in recipe_names])
+                [r + '-ptest' for r in recipe_names]),
+            'DISTRO_FEATURES:append = " ptest"'
         ]
         self.write_config("\n".join(conf_lines))
 
-- 
2.49.0


