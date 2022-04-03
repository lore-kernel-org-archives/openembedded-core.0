Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52F7C43219
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mailfilter05-out31.webhostingserver.nl
 (mailfilter05-out31.webhostingserver.nl [141.138.168.205])
 by mx.groups.io with SMTP id smtpd.web08.26720.1649015468667037948
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 12:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 141.138.168.205, mailfrom: fntoth@gmail.com)
X-Halon-ID: 663bdfbb-b387-11ec-a6ae-001a4a4cb933
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl
 [141.138.168.154])
	by mailfilter05.webhostingserver.nl (Halon) with ESMTPSA
	id 663bdfbb-b387-11ec-a6ae-001a4a4cb933;
	Sun, 03 Apr 2022 21:51:05 +0200 (CEST)
Received: from [2a02:a466:68ed:1:a97:eb0e:d916:69ac] (helo=delfion.fritz.box)
	by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
	(envelope-from <fntoth@gmail.com>)
	id 1nb6Fd-009Srb-Ia; Sun, 03 Apr 2022 21:51:05 +0200
From: Ferry Toth <fntoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Xavier Berger <xavier.berger@bio-logic.net>,
	Alexander Kanavin <alex@linutronix.de>,
	Ferry Toth <ftoth@exalondelft.nl>
Subject: [PATCH v2 1/3] gpg-sign: Add parameters to gpg signature function
Date: Sun,  3 Apr 2022 21:50:44 +0200
Message-Id: <20220403195046.7060-3-fntoth@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220403195046.7060-1-fntoth@gmail.com>
References: <20220403195046.7060-1-fntoth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163969

From: Xavier Berger <xavier.berger@bio-logic.net>

output_suffix: If defined, add output_suffix as file name extension.
use_sha256: If True, use sha256 for gpg as digest algorithm

Signed-off-by: Xavier Berger <xavier.berger@bio-logic.net>
Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
---
 meta/lib/oe/gpg_sign.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 1bce6cb792..aa9bb49f2c 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -58,7 +58,7 @@ class LocalSigner(object):
         for i in range(0, len(files), sign_chunk):
             subprocess.check_output(shlex.split(cmd + ' '.join(files[i:i+sign_chunk])), stderr=subprocess.STDOUT)
 
-    def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
+    def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True, output_suffix=None, use_sha256=False):
         """Create a detached signature of a file"""
 
         if passphrase_file and passphrase:
@@ -71,6 +71,10 @@ class LocalSigner(object):
             cmd += ['--homedir', self.gpg_path]
         if armor:
             cmd += ['--armor']
+        if output_suffix:
+            cmd += ['-o', input_file + "." + output_suffix]
+        if use_sha256:
+            cmd += ['--digest-algo', "SHA256"]
 
         #gpg > 2.1 supports password pipes only through the loopback interface
         #gpg < 2.1 errors out if given unknown parameters
-- 
2.32.0


