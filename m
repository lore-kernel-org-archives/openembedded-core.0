Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SnDzw-0004YI-Gc
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 21:15:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q66J3t1U021575
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 12:03:55 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 6 Jul 2012 12:03:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2012 14:13:59 -0500
Message-ID: <d70f909606fc9cd58783bdb46fcb02616cc316e2.1341601764.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341601764.git.mark.hatle@windriver.com>
References: <cover.1341601764.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/3] populate_sdk_rpm: Sync multilib configuration with rootfs_rpm
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
X-List-Received-Date: Fri, 06 Jul 2012 19:16:53 -0000
Content-Type: text/plain

An anonymous python chunk configures some multilib settings for both
populate_sdk_rpm and rootfs_rpm.  The two classes should contain identical
versions to ensure that the generated multilib configuration is the same
for the SDK and the rootfs.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_rpm.bbclass |   15 ++++++++++-----
 meta/classes/rootfs_rpm.bbclass       |    1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index b115c27..365a337 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -115,18 +115,23 @@ EOF
 }
 
 python () {
+    # The following code should be kept in sync w/ the rootfs_rpm version.
     ml_package_archs = ""
+    ml_prefix_list = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
         if len(eext) > 1 and eext[0] == 'multilib':
             localdata = bb.data.createCopy(d)
-            overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + eext[1]
-            localdata.setVar("OVERRIDES", overrides)
-            # TEMP: OVERRIDES isn't working right
-            localdata.setVar("DEFAULTTUNE", localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False) or "")
-            ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
+            default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
+            if default_tune:
+                localdata.setVar("DEFAULTTUNE", default_tune)
+            package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
+            package_archs = " ".join([i in "all noarch any".split() and i or eext[1]+"_"+i for i in package_archs.split()])
+            ml_package_archs += " " + package_archs
+            ml_prefix_list += " " + eext[1]
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     d.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs)
+    d.setVar('MULTILIB_PREFIX_LIST', ml_prefix_list)
 }
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 202f9ce..4551f7a 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -198,6 +198,7 @@ python () {
         d.setVar('RPM_PREPROCESS_COMMANDS', '')
         d.setVar('RPM_POSTPROCESS_COMMANDS', '')
 
+    # The following code should be kept in sync w/ the populate_sdk_rpm version.
     ml_package_archs = ""
     ml_prefix_list = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
-- 
1.7.3.4



