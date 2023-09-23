Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590A9CE7A8C
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 04:06:12 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.14870.1695441971262880221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 21:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=pDN5jjxF;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1695441972;
  x=1726977972;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cDEuPI3t97YOM29M0TSaHY69SLkRiM6w60lo4XVXoN4=;
  b=pDN5jjxFczvEkFYbBAbiSbf0t65Nqrhjdr+IS2u/QDbaNzaVqOySUrqr
   bSY2jOkn7rWKHkddx49FGWa88UffTt+ECSSMOHILF6Nl3FndcbGSNljQO
   06RX6Y7Phj39qYr1CiFsVEKtVd+S5m6QCJ9tX2SC/JdiLHphPFqeENSlk
   7sr6UyyEQMnSDIYpCAogtKBD0EGnQSaagPzEklFho+FHWl9P5uWzSxxyY
   kE2fN7xugc5QO6WJ81ErIGzebTxZvMqxEYskx3dZT+/2A1tzJRvf9KiWQ
   vA0qgQAYzWMPH38/9tnj5NXN3mXlTTBuZMqNvlnPfPk5vmd3ijgQnSvkD
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oeqa/selftest/context: Rely on bitbake-getvar --value to only return value
Date: Sat, 23 Sep 2023 06:06:02 +0200
Message-ID: <20230923040602.684469-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 04:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188140

Before, "bitbake-getvar --value <var>" would include log output together
with the value. This was handled by piping the output to "tail -1".
Now, "bitbake-getvar --value" will no longer output any logs so the
piping to "tail" is no longer needed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This of course relies on the corresponding patch for bitbake-getvar to
have been applied first.

 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 5a09aeedff..c148aa5aab 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -111,7 +111,7 @@ class OESelftestTestContext(OETestContext):
 
         # Relative paths in BBLAYERS only works when the new build dir share the same ascending node
         if self.newbuilddir:
-            bblayers = subprocess.check_output("bitbake-getvar --value BBLAYERS | tail -1", cwd=builddir, shell=True, text=True)
+            bblayers = subprocess.check_output("bitbake-getvar --value BBLAYERS", cwd=builddir, shell=True, text=True)
             if '..' in bblayers:
                 bblayers_abspath = [os.path.abspath(path) for path in bblayers.split()]
                 with open("%s/conf/bblayers.conf" % newbuilddir, "a") as f:

