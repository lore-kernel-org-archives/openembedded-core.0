Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00296C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 15:33:21 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.13357.1681486393445075479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 08:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lMVS0Ymz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2023041415330865637a8928f87226dc-pe_epc@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2023041415330865637a8928f87226dc
        for <openembedded-core@lists.openembedded.org>;
        Fri, 14 Apr 2023 17:33:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OOg87Q30GH+ZHY2I2pe+RiOkZlQbbX/TwryvpPZprMc=;
 b=lMVS0YmzgpBOOucimkVRAeX41/Tbn7mbI5h8EAHCTw7I5z+fiOPlbsmvPNMCz6L7V9iZ9m
 9ks51o/ycozqwRovUjcVjOgkIxSX7+ijoekV6Gtec3cSlQUjnFTIg8r0G9mdSu6588mM/TqG
 MvEEBRbwHEV5tALhEJ1MX0BmjUD8o=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] package.bbclass: correct check for /build in copydebugsources()
Date: Fri, 14 Apr 2023 17:32:13 +0200
Message-Id: <20230414153213.32833-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 15:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180000

Newly introduced kirkstone-only commit
https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=80839835ec9fcb63069289225a3c1af257ffdef7
broke builds with externalsrc in Gitlab-CI.
This is yocto-4.0.9 regression.

It checks if directory starts with "build" instead of
if checking if it equals to "build".
Gitlab-CI uses directory "/builds" which matches the check
but directory /build does not exist, only /builds.
After successful check it tries to move this non-existent
directory which does not exists and thus do_package fails.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2950218145..67acc278d1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -638,7 +638,7 @@ def copydebugsources(debugsrcdir, sources, d):
             if os.path.exists(dvar + debugsrcdir + sdir):
                 # Special case for /build since we need to move into
                 # /usr/src/debug/build so rename sdir to build.build
-                if sdir.find("/build") == 0:
+                if sdir == "/build" or sdir.find("/build/") == 0:
                     cmd = "mv %s%s%s %s%s%s" % (dvar, debugsrcdir, "/build", dvar, debugsrcdir, "/build.build")
                     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
                     sdir = sdir.replace("/build", "/build.build", 1)
-- 
2.30.2


