Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9C0C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 22:45:47 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.3499.1647470745698707184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 15:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IZ86Fz5h;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 99BFF100004;
	Wed, 16 Mar 2022 22:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647470743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q3kXhOFVRtb1VsB74HEbpILUq5XJsTP+Clp1PH4R/qI=;
	b=IZ86Fz5hbh3XdS34KguOeRzTIolK/vZtufr2QLm9plW1fRbrVYR4ECrq9+GmGdTJC7NeYP
	KsMZaCUW8wbS88NHfZ2jJn8/daMgOfy+FdzAHfnfgVSEtUHxSFbub0TKiYC1vPF1sClx3t
	v0i62yDi/9+SupvLFIYKB58Ba3LBhPI/6aiHkqYAYIXG4GhOdLg/311cAur70AphR/z4LH
	Qs0ZGlnQ8c/yR36uLpLysTQEwzSYNxE/KRrkqAaVPh4x+rxmCaAgd8StimX7AB3OIN52Fv
	AM83HuA3PddtXUV3dj99FBavxdks1ITLLs1QY97341DC8Bt2bg4VVMD36PDB0g==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] scripts/patchreview: handle Inactive-Upstream status
Date: Wed, 16 Mar 2022 23:45:37 +0100
Message-Id: <20220316224537.37069-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 22:45:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163363

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 scripts/contrib/patchreview.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index 62c509f51c89..dc417b4c55b4 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -8,7 +8,7 @@
 # - test suite
 # - validate signed-off-by
 
-status_values = ("accepted", "pending", "inappropriate", "backport", "submitted", "denied")
+status_values = ("accepted", "pending", "inappropriate", "backport", "submitted", "denied", "inactive-upstream")
 
 class Result:
     # Whether the patch has an Upstream-Status or not
@@ -46,7 +46,7 @@ def patchreview(path, patches):
     # hyphen or spaces, maybe a colon, some whitespace, then the value, all case
     # insensitive.
     sob_re = re.compile(r"^[\t ]*(Signed[-_ ]off[-_ ]by:?)[\t ]*(.+)", re.IGNORECASE | re.MULTILINE)
-    status_re = re.compile(r"^[\t ]*(Upstream[-_ ]Status:?)[\t ]*(\w*)", re.IGNORECASE | re.MULTILINE)
+    status_re = re.compile(r"^[\t ]*(Upstream[-_ ]Status:?)[\t ]*([\w-]*)", re.IGNORECASE | re.MULTILINE)
     cve_tag_re = re.compile(r"^[\t ]*(CVE:)[\t ]*(.*)", re.IGNORECASE | re.MULTILINE)
     cve_re = re.compile(r"cve-[0-9]{4}-[0-9]{4,6}", re.IGNORECASE)
 
-- 
2.35.1


