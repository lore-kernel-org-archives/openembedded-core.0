Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1518.1596647801391866995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mzeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 075HFmp5012820
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Aug 2020 10:16:08 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 5 Aug 2020
 10:15:48 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21151)	id 0C07C20386;
 Wed,  5 Aug 2020 13:15:48 -0400 (EDT)
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>
Subject: [PATCHv2] ltp: make copyFrom scp command non-fatal
Date: Wed, 5 Aug 2020 13:15:47 -0400
Message-ID: <20200805171547.2515-1-matthew.zeng@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

[YOCTO #13802]

Make the scp failure non-fatal so the ltp tests continue to run and
the rest of the logs will be available to see afterwards.

Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
---
 meta/lib/oeqa/core/target/ssh.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 090b40a814..e891a4bbfa 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -50,7 +50,7 @@ class OESSHTarget(OETarget):
     def stop(self, **kwargs):
         pass

-    def _run(self, command, timeout=None, ignore_status=True):
+    def _run(self, command, timeout=None, ignore_status=True, ignore_error=False):
         """
             Runs command in target using SSHProcess.
         """
@@ -62,8 +62,11 @@ class OESSHTarget(OETarget):
                  "" % (status, time.time() - starttime))

         if status and not ignore_status:
-            raise AssertionError("Command '%s' returned non-zero exit "
-                                 "status %d:\n%s" % (command, status, output))
+            if ignore_error:
+                self.logger.warning("Command '%s' returned non-zero exit status %d:\n%s" % (command, status, output))
+            else:
+                raise AssertionError("Command '%s' returned non-zero exit "
+                                     "status %d:\n%s" % (command, status, output))

         return (status, output)

@@ -113,7 +116,7 @@ class OESSHTarget(OETarget):
         """
         remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
         scpCmd = self.scp + [remotePath, localDst]
-        return self._run(scpCmd, ignore_status=False)
+        return self._run(scpCmd, ignore_error=True)

     def copyDirTo(self, localSrc, remoteDst):
         """
--
2.27.0
