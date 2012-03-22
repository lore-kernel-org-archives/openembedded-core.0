Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SAetU-0006GQ-9o
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 11:05:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2M9uOVB008339
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 02:56:24 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 22 Mar 2012 02:56:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2012 17:55:34 +0800
Message-ID: <253fa78b8753e139210403c0a7e8d5361b004f15.1332409894.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1332409894.git.liezhi.yang@windriver.com>
References: <cover.1332409894.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass: maybe no log.do_compile or log.do_install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 10:05:20 -0000
Content-Type: text/plain

The insane.bbclass grep in log.do_compile and log.do_install
unconditionally, but there maybe no such logs when mirror the pkg from
sstate cache file. We should check whether the log file exists or not
before grep in it.

Additionally, break the one too long line into two (Add a "\n").

[YOCTO #2153]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 6298136..fbeb97a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -612,19 +612,20 @@ python do_package_qa () {
     # Check the compile log for host contamination
     compilelog = os.path.join(logdir,"log.do_compile")
 
-    statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % compilelog
-    if os.system(statement) == 0:
-        bb.warn("%s: The compile log indicates that host include and/or library paths were used.  Please check the log '%s' for more information." % \
-                (pkg, compilelog))
-
+    if os.path.exists(compilelog):
+        statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % compilelog
+        if os.system(statement) == 0:
+            bb.warn("%s: The compile log indicates that host include and/or library paths were used.\n \
+        Please check the log '%s' for more information." % (pkg, compilelog))
 
     # Check the install log for host contamination
     installlog = os.path.join(logdir,"log.do_install")
 
-    statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % installlog
-    if os.system(statement) == 0:
-        bb.warn("%s: The install log indicates that host include and/or library paths were used.  Please check the log '%s' for more information." % \
-                (pkg, installlog))
+    if os.path.exists(installlog):
+        statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % installlog
+        if os.system(statement) == 0:
+            bb.warn("%s: The install log indicates that host include and/or library paths were used.\n \
+        Please check the log '%s' for more information." % (pkg, installlog))
 
     # Scan the packages...
     pkgdest = d.getVar('PKGDEST', True)
-- 
1.7.1



