Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7726CC433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 02:24:41 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.1468.1643423080199433833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=UMN20Jf+;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643423080;
  x=1674959080;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vvsOlvEdwsQI4rB4suh+Fq5RmqWTR3k2QiCJaC7d9cw=;
  b=UMN20Jf+BDck0LnBy4mUfTjYnSU/hG/sL5mEu8CI2mJ0ivuUxp51PqaA
   ZeaIggsS2JUHLvvS+UA44+w3wMaq7xQvzlstKnxqQTsNhu6crV6zXHrWc
   gO2mtIN+sGBf2y9oNZQ7MVgQJ8g8dR3+m04wAHja/BKjLOtiFoNVlgNC+
   zDjpeeHuJE6bcT+SS7k0qgWRhpOpyqvQtRKF9gZWmCLwhb6+8czMVKZCG
   7mtiIJUagga3KWAIYTArSGwnSPqaWPMz3Y8fG6VATnGI8hXNIcHcrdfE3
   jMuAiNGIJh2rtoUi6ioaKz2TGMBhqsLx8tJJh+/PrfWnSYiwMkhb7j9q/
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] devtool: sdk-update: Remove an unnecessary \n from
 SSTATE_MIRRORS
Date: Sat, 29 Jan 2022 03:24:25 +0100
Message-ID: <20220129022426.15872-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 02:24:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161092

Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
entries) there is no need to separate the entries in SSTATE_MIRRORS
with "\n".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index ae3fc4caf9..d717b6c2b8 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -207,7 +207,7 @@ def sdk_update(args, config, basepath, workspace):
         if not sstate_mirrors:
             with open(os.path.join(conf_dir, 'site.conf'), 'a') as f:
                 f.write('SCONF_VERSION = "%s"\n' % site_conf_version)
-                f.write('SSTATE_MIRRORS:append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
+                f.write('SSTATE_MIRRORS:append = " file://.* %s/sstate-cache/PATH"\n' % updateserver)
     finally:
         shutil.rmtree(tmpsdk_dir)
 

