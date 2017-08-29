Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 434A47830A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 8140A2E36A;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id IA0QLkMHSFWt; Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 643A82E325;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51A061A0B4;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45AAD1A0B3;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 3A08E2144;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLf5a030173;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLf9L030172;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:20:58 +0200
Message-Id: <04cf735bab7b47835ca7fa6d641fdbc912a85f26.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 02/25] package_manager.py: Generate correct RPM package names again
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:43 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

During the transition to RPM4, the package names returned by
RpmPM.list_installed() changed from the expected names of the packages
that were installed into the image to some fictitious source RPM
names.

This restores the original functionality so that the
installed-packages.txt files produced by inheriting buildhistory yet
again contains a list of the names of the installed packages.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 28c6b2aec2..518cf8dbe3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -650,7 +650,7 @@ class RpmPM(PackageManager):
                             symlinks=True)
 
     def list_installed(self):
-        output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{sourcerpm}\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
+        output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{name}-%{version}-%{release}.%{arch}.rpm\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
                                   print_output = False)
         packages = {}
         current_package = None
@@ -662,8 +662,8 @@ class RpmPM(PackageManager):
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


