Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0CDEDE9BA
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 20:17:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6319.1725999445732136920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 13:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yRkYUqps;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48AKHPAi065674
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 15:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725999445;
	bh=3jctGCXalIna7z6qXWl7ocOZbDefBD9Ro2hX0ra8EGg=;
	h=From:To:Subject:Date;
	b=yRkYUqpsf/3FkquJpA3LyIE+NbZlsqY5V9Td1AMa4Gxy8uVxfNwtOQkNrc97pvAja
	 fhoTm9QfXjuqHHtu1qjR2QHySg+8BQDyJGrUsnVpAycCWMxKMfiJPHKQx5AmHuBhLv
	 HPy5DweaJzP10dxiJRbYxzUH2IMRLfJffgD0S7uE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48AKHPju021702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 15:17:25 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Sep 2024 15:17:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Sep 2024 15:17:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48AKHOZ7051839
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 15:17:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1so7Ii-0000xo-F9
	for openembedded-core@lists.openembedded.org; Tue, 10 Sep 2024 15:17:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] oe-setup-build: Change how we get the SHELL value
Date: Tue, 10 Sep 2024 15:17:24 -0500
Message-ID: <20240910201724.3652-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 20:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204369

There are times that a user might not have SHELL set for some reason.
We should default back to a known shell in the event that SHELL is not
set.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 scripts/oe-setup-build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index 1cb06b3b79..80d8c70bac 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -102,9 +102,9 @@ def setup_build_env(args):
 
     cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
     if not no_shell:
-        cmd = cmd + " && {}".format(os.environ['SHELL'])
+        cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-    subprocess.run(cmd, shell=True, executable=os.environ['SHELL'])
+    subprocess.run(cmd, shell=True, executable=os.environ.get('SHELL','bash'))
 
 parser = argparse.ArgumentParser(description="A script that discovers available build configurations and sets up a build environment based on one of them. Run without arguments to choose one interactively.")
 parser.add_argument("--layerlist", default=defaultlayers(), help='Where to look for available layers (as written out by setup-layers script) (default is {}).'.format(defaultlayers()))
-- 
2.17.1


