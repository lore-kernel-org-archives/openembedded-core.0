Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10108.1596642655821113942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 08:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mzeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 075FoNMw009956
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Aug 2020 08:50:44 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 5 Aug 2020
 08:50:19 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21151)	id B42201FFED;
 Wed,  5 Aug 2020 11:50:18 -0400 (EDT)
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ltp: make copyFrom scp command non-fatal
Date: Wed, 5 Aug 2020 11:50:18 -0400
Message-ID: <20200805155018.8076-1-matthew.zeng@windriver.com>
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
index 090b40a814..1b78e830d4 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -61,9 +61,12 @@ class OESSHTarget(OETarget):
         self.logger.debug("[Command returned '%d' after %.2f seconds]"
                  "" % (status, time.time() - starttime))
 
-        if status and not ignore_status:
-            raise AssertionError("Command '%s' returned non-zero exit "
-                                 "status %d:\n%s" % (command, status, output))
+        if status:
+            if not ignore_status:
+                raise AssertionError("Command '%s' returned non-zero exit "
+                                     "status %d:\n%s" % (command, status, output))
+            else:
+                self.logger.warning("Command '%s' returned non-zero exit status %d:\n%s" % (command, status, output))
 
         return (status, output)
 
@@ -113,7 +116,7 @@ class OESSHTarget(OETarget):
         """
         remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
         scpCmd = self.scp + [remotePath, localDst]
-        return self._run(scpCmd, ignore_status=False)
+        return self._run(scpCmd, ignore_status=True)
 
     def copyDirTo(self, localSrc, remoteDst):
         """
-- 
2.27.0

