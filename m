Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02865C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 10:28:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.3979.1657189697893956832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UUX8B3ix;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A5840E0006;
	Thu,  7 Jul 2022 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657189695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6580SYnfbNBDtLhCYleNaFj7oF4qDb8aoB2mqiTvIHw=;
	b=UUX8B3ix7hxbsdGTqBkiH8emXiCHHPM5N1VQLZ0kv0/E9D7DrDPsXR25oAyItptdjtPiIT
	95J45NSS5BbgTYFnuu11+BEhGuI+KiZK+uHgEYKhIYKULbHe67qfouD+sJ43OkiSvwpgSz
	mEjcYzQbOmrwuE7wN+Xk7UZ2jf/PX79znYtgNMcqVjVtG4MvPa2Q/eCs028erKT4PhRTCD
	q+6vB1h1A2j0+LawaKNtOjhIARfKTf08/v7IEv1zJnkEIPisbNM0R5ltyOsF74h0OESsHR
	vDK8X++U8dMNx+dnQBbPP5YDYlkQhT3AplQDz7euqWkw7zwwmA4np55A9sNWiw==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] oeqa/selftest/bbtests: Update message lookup for
 test_git_unpack_nonetwork_fail
Date: Thu,  7 Jul 2022 12:28:08 +0200
Message-Id: <20220707102808.547926-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 10:28:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167767

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

bitbake's output changed, update the test

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index cfac7afcf49a..b42bbb651da2 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -350,4 +350,4 @@ INHERIT:remove = \"report-error\"
         self.write_config("DISTROOVERRIDES .= \":gitunpack-enable-recipe\"")
 
         result = bitbake('gitunpackoffline-fail -c fetch', ignore_status=True)
-        self.assertTrue("Recipe uses a floating tag/branch without a fixed SRCREV" in result.output, msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
+        self.assertTrue(re.search("Recipe uses a floating tag/branch .* for repo .* without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev()", result.output), msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
-- 
2.25.1


