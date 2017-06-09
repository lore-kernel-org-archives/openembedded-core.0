Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEB5782DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 05F9E2E6E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id B0zr1F6lt8dS
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 3586A2E6C2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23A231E07A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18E431E07D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 0D5532C15
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v59JYgKk010955
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Jun 2017 21:34:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v59JYgW2010954
	for openembedded-core@lists.openembedded.org;
	Fri, 9 Jun 2017 21:34:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 21:34:23 +0200
Message-Id: <f0852ef44baa55da0980825ec546dd889c624579.1497036762.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497036762.git.pkj@axis.com>
References: <cover.1497036762.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 01/13] package_manager.py: Generate correct RPM package names again
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
X-List-Received-Date: Fri, 09 Jun 2017 19:34:44 -0000

During the transition to RPM4, the package names returned by
RpmPM.list_installed() changed from the expected names of the packages
that were installed into the image to some fictitious source RPM
names.

This restores the original functionality so that the
installed-packages.txt files produced by inheriting buildhistory yet
again contains a list of the names of the installed packages.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/package_manager.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f1b65bdbbc..caccd7baa9 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -647,7 +647,7 @@ class RpmPM(PackageManager):
                             symlinks=True)
 
     def list_installed(self):
-        output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{sourcerpm}\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
+        output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{name}-%{version}-%{release}.%{arch}.rpm\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
                                   print_output = False)
         packages = {}
         current_package = None
@@ -659,8 +659,8 @@ class RpmPM(PackageManager):
                 current_package = package_info[0]
                 package_arch = package_info[1]
                 package_version = package_info[2]
-                package_srpm = package_info[3]
-                packages[current_package] = {"arch":package_arch, "ver":package_version, "filename":package_srpm}
+                package_rpm = package_info[3]
+                packages[current_package] = {"arch":package_arch, "ver":package_version, "filename":package_rpm}
                 current_deps = []
             elif line.startswith("Dependencies:"):
                 current_state = "dependencies"
-- 
2.12.0


