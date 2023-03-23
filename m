Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81338C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 10:08:59 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.68554.1679566132527564014
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 03:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=aqqdmXB2;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: tobias.hagelborn@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1679566133;
  x=1711102133;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AfWvPmguLqkCPJoge6PJGSWfO5SogUafPDnIQWnPtVA=;
  b=aqqdmXB2FgRuZR5bEb2quGBHZaEtyhcosCfO7jQaLWHdV13OITWUOxzy
   jIYII+qWMAJYzb2kS2eh8Y/Sq6iG85V+l6BP2MYXHaa+jd9CJnF1gpmhV
   70P+qZBKRkLj+JM5se3l+I5EHt0ORUoC8Qsme4T6B0Hb/6H+/eQmCKv+0
   8zk9WGOwk+ZPTbIu3BcED0HFW5thKQm1kFRh+0eqnx19+guOHPa0/RzD5
   mXsH+ixyMqcmSW108QOXejgpcYm/vasBCZ7vqU69tgpZFgZzc+zsgJdCE
   ry0lqYX7RgDxqQF/G6RU/9kmBVVBZ/9E/pxPdikayu6FxvJWv9gamQlpW
   Q==;
From: Tobias Hagelborn <tobiasha@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lib/oe/gpg_sign.py: Avoid race when creating .sig files in detach_sign
Date: Thu, 23 Mar 2023 11:08:47 +0100
Message-ID: <20230323100847.3740485-1-tobiasha@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 10:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178975

Move the signature file into place only after it is successfully signed.
This to avoid race and corrupted .sig files in cases multiple onging
builds write to a shared sstate-cache dir.

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 meta/lib/oe/gpg_sign.py | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 613dab8561..868846cdc5 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -5,11 +5,12 @@
 #
 
 """Helper module for GPG signing"""
-import os
 
 import bb
-import subprocess
+import os
 import shlex
+import subprocess
+import tempfile
 
 class LocalSigner(object):
     """Class for handling local (on the build host) signing"""
@@ -73,8 +74,6 @@ class LocalSigner(object):
             cmd += ['--homedir', self.gpg_path]
         if armor:
             cmd += ['--armor']
-        if output_suffix:
-            cmd += ['-o', input_file + "." + output_suffix]
         if use_sha256:
             cmd += ['--digest-algo', "SHA256"]
 
@@ -83,19 +82,25 @@ class LocalSigner(object):
         if self.gpg_version > (2,1,):
             cmd += ['--pinentry-mode', 'loopback']
 
-        cmd += [input_file]
-
         try:
             if passphrase_file:
                 with open(passphrase_file) as fobj:
                     passphrase = fobj.readline();
 
-            job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
-            (_, stderr) = job.communicate(passphrase.encode("utf-8"))
+            output_file = input_file + "." + (output_suffix or 'sig')
+            with tempfile.TemporaryDirectory(dir=os.path.dirname(output_file)) as tmp_dir:
+                tmp_file = os.path.join(tmp_dir, os.path.basename(output_file))
+                cmd += ['-o', tmp_file]
+
+                cmd += [input_file]
+
+                job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
+                (_, stderr) = job.communicate(passphrase.encode("utf-8"))
 
-            if job.returncode:
-                bb.fatal("GPG exited with code %d: %s" % (job.returncode, stderr.decode("utf-8")))
+                if job.returncode:
+                    bb.fatal("GPG exited with code %d: %s" % (job.returncode, stderr.decode("utf-8")))
 
+                os.rename(tmp_file, output_file)
         except IOError as e:
             bb.error("IO error (%s): %s" % (e.errno, e.strerror))
             raise Exception("Failed to sign '%s'" % input_file)
-- 
2.30.2


