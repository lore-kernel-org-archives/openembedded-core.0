Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D566C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:38:22 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.28927.1680190700395439436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 08:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=I9QYrpA6;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680190700;
  x=1711726700;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RxSxZjsLgbn2IR+6bu4A2x9WvehgyVfb9MTKgeNCotA=;
  b=I9QYrpA6ku0aPD6HAWwFnI3BxOnH4CNeAsfK0UcY467+hOH7RcplSWoJ
   D6uH6o8uu2OGutfSftG+TUC1xC0SORQWSCTYJmmm6g/sIpIs/OCedX1ej
   BN6d/i8TqkErPuthj9SPHsEURKx7y1Zgy/P4fGDiQe/SxTAm9AKmPqglb
   hJp/ft22S91pLWLTh7hZ1p1AT+QUX6MEH/5LMuqjN54vMWR/cCb2K4dng
   AxAqU1g0Nnap9+3zWyXqwQEk3KOMpU38/L8RkkW6xby9H110ESbG0XSbb
   A1Ky+7F9Fmtgv5yEhb/WezMM70fH3fqAfd/TAyJ3ADpl9Xi8PqVC8ThX1
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] lib/oe/gpg_sign.py: Avoid race when creating .sig files in detach_sign
Date: Thu, 30 Mar 2023 17:38:09 +0200
Message-ID: <20230330153809.1470647-1-pkj@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 15:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179336

From: Tobias Hagelborn <tobias.hagelborn@axis.com>

Move the signature file into place only after it is successfully signed.
This to avoid race and corrupted .sig files in cases multiple onging
builds write to a shared sstate-cache dir.

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Use '.asc' as default suffix for the output file if the
         --armor option is used.

 meta/lib/oe/gpg_sign.py | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 613dab8561..ede6186c84 100644
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
 
@@ -83,19 +82,27 @@ class LocalSigner(object):
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
+            if not output_suffix:
+                output_suffix = 'asc' if armor else 'sig'
+            output_file = input_file + "." + output_suffix
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

