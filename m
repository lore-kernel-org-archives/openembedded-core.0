Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EECE6AD01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 07:45:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9D7jNAN014630
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 00:45:23 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 13 Oct 2014 00:45:22 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Oct 2014 15:43:20 +0800
Message-ID: <de9a3649eed2e20b75c663155c0ef9902966ca3c.1413186161.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413186161.git.Chong.Lu@windriver.com>
References: <cover.1413186161.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python-smartpm: Add checking for "rpm-ignoresize" option
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
X-List-Received-Date: Mon, 13 Oct 2014 07:45:24 -0000
Content-Type: text/plain

The do_rootfs takes a very long time when build host has mounted many NFS
devices. syscall lstat() was being called on every filesystem mounted on the
build host during building.
The reason for the lstat() is that rpm is verifying that enough free disk space
is available to do the install. However, since the install is into the target
rootfs it should not matter how much free space there is in the host mounts.
Add checking for "rpm-ignoresize", by it, smart can make whether RPM skip
checking for diskspace when install a rpm package.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/lib/oe/package_manager.py                     |  1 +
 .../smart-add-for-rpm-ignoresize-check.patch       | 37 ++++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  1 +
 3 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 27fdf26..ffb83b2 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -838,6 +838,7 @@ class RpmPM(PackageManager):
                         % prefer_color)
 
         self._invoke_smart(cmd)
+        self._invoke_smart('config --set rpm-ignoresize=1')
 
         # Write common configuration for host and target usage
         self._invoke_smart('config --set rpm-nolinktos=1')
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch b/meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch
new file mode 100644
index 0000000..8a27f25
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch
@@ -0,0 +1,37 @@
+python-smartpm: Add checking for "rpm-ignoresize" option
+
+The do_rootfs takes a very long time when build host has mounted many NFS
+devices. syscall lstat() was being called on every filesystem mounted on the
+build host during building.
+The reason for the lstat() is that rpm is verifying that enough free disk space
+is available to do the install. However, since the install is into the target
+rootfs it should not matter how much free space there is in the host mounts.
+Add checking for "rpm-ignoresize", by it, smart can make whether RPM skip
+checking for diskspace when install a rpm package.
+
+Upstream-Status: Pending
+
+Signed-off-by: wenlin.kang <wenlin.kang@windriver.com>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ smart/backends/rpm/pm.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py
+index 5da9ee6..f0488ec 100644
+--- a/smart/backends/rpm/pm.py
++++ b/smart/backends/rpm/pm.py
+@@ -241,6 +241,10 @@ class RPMPackageManager(PackageManager):
+         except AttributeError:
+             probfilter |= rpm.RPMPROB_FILTER_IGNOREARCH
+ 
++        if sysconf.get("rpm-ignoresize", False):
++            probfilter |= rpm.RPMPROB_FILTER_DISKNODES
++            probfilter |= rpm.RPMPROB_FILTER_DISKSPACE
++
+         if force or reinstall:
+             probfilter |= rpm.RPMPROB_FILTER_REPLACEPKG
+             probfilter |= rpm.RPMPROB_FILTER_REPLACEOLDFILES
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index f2eb33d..c75f10f 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -33,6 +33,7 @@ SRC_URI = "\
           file://smart-attempt.patch \
           file://smart-filename-NAME_MAX.patch \
           file://smart-rpm4-fixes.patch \
+          file://smart-add-for-rpm-ignoresize-check.patch \
          "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.9.1


