Return-Path: <xavier.berger@bio-logic.net>
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
	[80.12.242.127])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9CB7D0F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 13:57:51 +0000 (UTC)
Received: from srvmail.bio-logic.net ([176.149.180.241]) by mwinf5d40 with ME
	id v1qM1z0055Ctoqw031qMJr; Mon, 01 Apr 2019 15:50:21 +0200
X-ME-Helo: srvmail.bio-logic.net
X-ME-Auth: YmlvLWxvZ2ljQHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Apr 2019 15:50:21 +0200
X-ME-IP: 176.149.180.241
Received: from ubuntu.bio-logic.loc (unknown [10.100.11.254])
	by srvmail.bio-logic.net (Postfix) with ESMTP id 52D1F80477;
	Mon,  1 Apr 2019 15:50:21 +0200 (CEST)
From: Xavier Berger <xavier.berger@bio-logic.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 15:50:18 +0200
Message-Id: <73e2d3ce0431a0a9be0c0abbaad3fe5fab985001.1554106752.git.xavier.berger@bio-logic.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554106752.git.xavier.berger@bio-logic.net>
References: <cover.1554106752.git.xavier.berger@bio-logic.net>
Subject: [PATCH 1/2] gpg-sign: Add parameters to gpg signature function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2019 13:57:51 -0000

output_suffix: If defined, add output_suffix as file name extension.
use_sha256: If True, use sha256 for gpg as digest algorithm

Signed-off-by: Xavier Berger <xavier.berger@bio-logic.net>
---
 meta/lib/oe/gpg_sign.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index ccd5aee..212ac3a 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -49,7 +49,7 @@ class LocalSigner(object):
         for i in range(0, len(files), sign_chunk):
             subprocess.check_output(shlex.split(cmd + ' '.join(files[i:i+sign_chunk])), stderr=subprocess.STDOUT)
 
-    def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
+    def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True, output_suffix=None, use_sha256=False):
         """Create a detached signature of a file"""
 
         if passphrase_file and passphrase:
@@ -62,6 +62,10 @@ class LocalSigner(object):
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
2.7.4


