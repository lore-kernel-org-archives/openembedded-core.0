Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6Bbb-0000PH-PM
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 03:28:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8L1MnNd016802
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 18:22:49 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Sep 2011 18:22:48 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 20:24:52 -0500
Message-ID: <c86ac39fce3dd5321d12badc9e98cb5b1effe0a2.1316568118.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316568118.git.mark.hatle@windriver.com>
References: <cover.1316568118.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/7] rpm: add multilib prefix for archs under deploy/rpm [v2]
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
X-List-Received-Date: Wed, 21 Sep 2011 01:28:08 -0000
Content-Type: text/plain

From: Dongxiao Xu <dongxiao.xu@intel.com>

Currently MACHINE_ARCH deploy folder is unique in multilib system, thus
a lib32 version of rpm package will override a normal rpm package if
its PACKAGE_ARCH is ${MACHINE_ARCH}.

Define different deploy folder for multilib architectures to avoid the
confliction.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/multilib.bbclass   |    5 +++++
 meta/classes/rootfs_rpm.bbclass |    4 +++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 583d76b..138dd27 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -76,4 +76,9 @@ python __anonymous () {
     multilib_map_variable("PACKAGES_DYNAMIC", variant, d)
     multilib_map_variable("PACKAGE_INSTALL", variant, d)
     multilib_map_variable("INITSCRIPT_PACKAGES", variant, d)
+
+    package_arch = d.getVar("PACKAGE_ARCH", True)
+    machine_arch = d.getVar("MACHINE_ARCH", True)
+    if package_arch == machine_arch:
+        d.setVar("PACKAGE_ARCH", variant + "_" + package_arch)
 }
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 135ca75..7936d77 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -218,7 +218,9 @@ python () {
             default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
-            ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
+            localdata.setVar("MACHINE_ARCH", eext[1] + "_" + localdata.getVar("MACHINE_ARCH", False))
+            package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
+            ml_package_archs += " " + package_archs
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
 }
-- 
1.7.3.4



