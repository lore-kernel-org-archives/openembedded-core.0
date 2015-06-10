Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3127E756A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 17:47:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2015 10:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,588,1427785200"; d="scan'208";a="724769152"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2015 10:47:57 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 09:44:03 +0000
Message-Id: <d2f0d2911c1db921dba223d55940fb2deec71cc9.1433928968.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1433928968.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1433928968.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH] mklibs-native: Remove the dpkg-native dependency
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
X-List-Received-Date: Wed, 10 Jun 2015 17:47:57 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The 'dpkg-native' dependency introduced on 0a08dc is not neccesary
needed if the mklibs-native code is secured with a try/catch statement
when calling the dpkg-native application.

[YOCTO #3782]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../mklibs/mklibs-native_0.1.40.bb                 |   3 +-
 .../mklibs/catch-exception-if-dpkg-architect.patch | 103 +++++++++++++++++++++
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mklibs/mklibs/catch-exception-if-dpkg-architect.patch

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
index b2fcae5..ff3fe08 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
@@ -4,12 +4,13 @@ HOMEPAGE = "https://launchpad.net/mklibs"
 SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
-DEPENDS = "python-native dpkg-native"
+DEPENDS = "python-native"
 
 SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.xz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 	file://sysrooted-ldso.patch \
+	file://catch-exception-if-dpkg-architect.patch \
 "
 
 SRC_URI[md5sum] = "e1dafe5f962caa9dc5f2651c0723812a"
diff --git a/meta/recipes-devtools/mklibs/mklibs/catch-exception-if-dpkg-architect.patch b/meta/recipes-devtools/mklibs/mklibs/catch-exception-if-dpkg-architect.patch
new file mode 100644
index 0000000..55ff0a7
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/mklibs/catch-exception-if-dpkg-architect.patch
@@ -0,0 +1,103 @@
+From 78a1245b5217ea42fc122b339684ff8d59059037 Mon Sep 17 00:00:00 2001
+From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+Date: Wed, 10 Jun 2015 07:24:23 +0000
+Subject: [PATCH] mklibs,mklibs-copy: Catch exception if dpkg-architecture not
+ found
+
+Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+---
+ src/mklibs      | 33 ++++++++++++++++++---------------
+ src/mklibs-copy | 33 ++++++++++++++++++---------------
+ 2 files changed, 36 insertions(+), 30 deletions(-)
+
+diff --git a/src/mklibs b/src/mklibs
+index a3533c0..75d2bb4 100755
+--- a/src/mklibs
++++ b/src/mklibs
+@@ -272,21 +272,24 @@ def extract_soname(so_file):
+     return ""
+ 
+ def multiarch(paths):
+-    devnull = open('/dev/null', 'w')
+-    dpkg_architecture = subprocess.Popen(
+-        ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
+-        stdout=subprocess.PIPE, stderr=devnull)
+-    devnull.close()
+-    deb_host_multiarch, _ = dpkg_architecture.communicate()
+-    if dpkg_architecture.returncode == 0:
+-        deb_host_multiarch = deb_host_multiarch.rstrip('\n')
+-        new_paths = []
+-        for path in paths:
+-            new_paths.append(
+-                path.replace('/lib', '/lib/%s' % deb_host_multiarch, 1))
+-            new_paths.append(path)
+-        return new_paths
+-    else:
++    try:
++        devnull = open('/dev/null', 'w')
++        dpkg_architecture = subprocess.Popen(
++            ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
++            stdout=subprocess.PIPE, stderr=devnull)
++        devnull.close()
++        deb_host_multiarch, _ = dpkg_architecture.communicate()
++        if dpkg_architecture.returncode == 0:
++            deb_host_multiarch = deb_host_multiarch.rstrip('\n')
++            new_paths = []
++            for path in paths:
++                new_paths.append(
++                    path.replace('/lib', '/lib/%s' % deb_host_multiarch, 1))
++                new_paths.append(path)
++                return new_paths
++            else:
++                return paths
++    except OSError:
+         return paths
+ 
+ def usage(was_err):
+diff --git a/src/mklibs-copy b/src/mklibs-copy
+index c33985d..fc93ea1 100755
+--- a/src/mklibs-copy
++++ b/src/mklibs-copy
+@@ -116,21 +116,24 @@ def extract_soname(so_file):
+     return ""
+ 
+ def multiarch(paths):
+-    devnull = open('/dev/null', 'w')
+-    dpkg_architecture = subprocess.Popen(
+-        ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
+-        stdout=subprocess.PIPE, stderr=devnull)
+-    devnull.close()
+-    deb_host_multiarch, _ = dpkg_architecture.communicate()
+-    if dpkg_architecture.returncode == 0:
+-        deb_host_multiarch = deb_host_multiarch.rstrip('\n')
+-        new_paths = []
+-        for path in paths:
+-            new_paths.append(
+-                path.replace('/lib', '/lib/%s' % deb_host_multiarch, 1))
+-            new_paths.append(path)
+-        return new_paths
+-    else:
++    try:
++        devnull = open('/dev/null', 'w')
++        dpkg_architecture = subprocess.Popen(
++            ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
++            stdout=subprocess.PIPE, stderr=devnull)
++        devnull.close()
++        deb_host_multiarch, _ = dpkg_architecture.communicate()
++        if dpkg_architecture.returncode == 0:
++            deb_host_multiarch = deb_host_multiarch.rstrip('\n')
++            new_paths = []
++            for path in paths:
++                new_paths.append(
++                    path.replace('/lib', '/lib/%s' % deb_host_multiarch, 1))
++                new_paths.append(path)
++                return new_paths
++            else:
++                return paths
++    except OSError:
+         return paths
+ 
+ def version(vers):
+-- 
+1.8.4.5
+
-- 
1.8.4.5


