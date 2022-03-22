Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C088C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 21:20:07 +0000 (UTC)
Received: from mailfilter03-out31.webhostingserver.nl
 (mailfilter03-out31.webhostingserver.nl [141.138.168.202])
 by mx.groups.io with SMTP id smtpd.web09.1134.1647984006776245114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 14:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 141.138.168.202, mailfrom: fntoth@gmail.com)
X-Halon-ID: d68dfd25-aa25-11ec-80d2-001a4a4cb9a5
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl
 [141.138.168.154])
	by mailfilter03.webhostingserver.nl (Halon) with ESMTPSA
	id d68dfd25-aa25-11ec-80d2-001a4a4cb9a5;
	Tue, 22 Mar 2022 22:20:03 +0100 (CET)
Received: from [2a02:a466:68ed:1:8763:2e5f:5343:9ba]
 (helo=localhost.localdomain)
	by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
	(envelope-from <fntoth@gmail.com>)
	id 1nWlv8-00GRSO-RW; Tue, 22 Mar 2022 22:20:02 +0100
From: Ferry Toth <fntoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Xavier Berger <xavier.berger@bio-logic.net>,
	Ferry Toth <ftoth@exalondelft.nl>
Subject: [PATCH v1 1/2] gpg-sign: Add parameters to gpg signature function
Date: Tue, 22 Mar 2022 22:19:48 +0100
Message-Id: <20220322211949.7423-1-fntoth@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 21:20:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163577

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


