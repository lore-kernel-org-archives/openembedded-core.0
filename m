Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.145.1596658527725774443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 13:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mzeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 075KEobq018567
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Aug 2020 13:15:16 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 5 Aug 2020
 13:14:48 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21151)	id AD3FC20386;
 Wed,  5 Aug 2020 16:14:47 -0400 (EDT)
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv5] ltp: make copyFrom scp command non-fatal
Date: Wed, 5 Aug 2020 16:14:47 -0400
Message-ID: <20200805201447.8417-1-matthew.zeng@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

[YOCTO #13802]

Make the scp failure non-fatal so the ltp tests continue to run and
the rest of the logs will be available to see afterwards.

Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
---
 meta/lib/oeqa/core/target/ssh.py   | 7 +++++--
 meta/lib/oeqa/runtime/cases/ltp.py | 5 +++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 090b40a814..aefb576805 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -107,13 +107,16 @@ class OESSHTarget(OETarget):
             scpCmd = self.scp + [localSrc, remotePath]
             return self._run(scpCmd, ignore_status=False)

-    def copyFrom(self, remoteSrc, localDst):
+    def copyFrom(self, remoteSrc, localDst, warn_on_failure=False):
         """
             Copy file from target.
         """
         remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
         scpCmd = self.scp + [remotePath, localDst]
-        return self._run(scpCmd, ignore_status=False)
+        (status, output) = self._run(scpCmd, ignore_status=warn_on_failure)
+        if warn_on_failure and status:
+            self.logger.warning("Copy returned non-zero exit status %d:\n%s" % (status, output))
+        return (status, output)

     def copyDirTo(self, localSrc, remoteDst):
         """
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 6dc5ef22ad..a66d5d13d7 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -78,9 +78,10 @@ class LtpTest(LtpTestBase):
             # copy nice log from DUT
             dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group )
             remote_src = "/opt/ltp/results/%s" % ltp_group 
-            (status, output) = self.target.copyFrom(remote_src, dst)
+            (status, output) = self.target.copyFrom(remote_src, dst, True)
             msg = 'File could not be copied. Output: %s' % output
-            self.assertEqual(status, 0, msg=msg)
+            if status:
+                self.target.logger.warning(msg)

             parser = LtpParser()
             results, sections  = parser.parse(dst)
--
2.27.0
