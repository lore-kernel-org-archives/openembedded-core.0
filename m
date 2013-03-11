Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UEthr-0005dO-7T
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 04:47:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2B3UhtN028769
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Mar 2013 20:30:44 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sun, 10 Mar 2013 20:30:43 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Mar 2013 11:31:17 +0800
Message-ID: <1eab6578b55eee05f36c14d1e536c793c5d80659.1362966448.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1362966448.git.kai.kang@windriver.com>
References: <cover.1362966448.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] insane.bbclass: make do_package_qa be a task
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 03:47:31 -0000
Content-Type: text/plain

do_package_qa is added to variable PACKAGEFUNCS and run after
do_package. packaging tests should not ending up in package.bbclass.
Split do_package_qa as a new task after do_package.

[YOCTO #3190]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/classes/insane.bbclass |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index bd6f120..d7787ac 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -17,9 +17,9 @@
 #   files under exec_prefix
 
 
-inherit package
+#inherit package
 PACKAGE_DEPENDS += "${QADEPENDS}"
-PACKAGEFUNCS += " do_package_qa "
+#PACKAGEFUNCS += " do_package_qa "
 
 # unsafe-references-in-binaries requires prelink-rtld from
 # prelink-native, but we don't want this DEPENDS for -native builds
@@ -654,6 +654,15 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
     target_os   = d.getVar('TARGET_OS', True)
     target_arch = d.getVar('TARGET_ARCH', True)
 
+    pkgfiles = {}
+    packages = d.getVar('PACKAGES', True).split()
+    pkgdest = d.getVar('PKGDEST', True)
+    for pkg in packages:
+        pkgfiles[pkg] = []
+        for walkroot, dirs, files in os.walk(pkgdest + "/" + pkg):
+            for file in files:
+                pkgfiles[pkg].append(walkroot + os.sep + file)
+
     warnings = []
     errors = []
     for path in pkgfiles[package]:
@@ -823,6 +832,8 @@ python do_package_qa () {
     bb.note("DONE with PACKAGE QA")
 }
 
+addtask package_qa after do_package before do_build
+EXPORT_FUNCTIONS do_package_qa
 
 python do_qa_staging() {
     bb.note("QA checking staging")
-- 
1.7.5.4



