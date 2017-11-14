Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EC1B9784C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:02 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402213"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:57:59 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:40 +0200
Message-Id: <20171114145754.9643-13-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/27] dnf: update to 2.7.5
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:03 -0000

Drop upstreamed patch.
Rebase the other patches.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...eck-conf.releasever-instead-of-releasever.patch | 31 ----------------------
 ...Corretly-install-tmpfiles.d-configuration.patch |  7 ++---
 ...hardcode-etc-and-systemd-unit-directories.patch |  9 ++++---
 ...005-Do-not-prepend-installroot-to-logdir.patch} | 14 +++++-----
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch |  9 ++++---
 .../dnf/0030-Run-python-scripts-using-env.patch    | 11 ++++----
 .../dnf/{dnf_2.6.3.bb => dnf_2.7.5.bb}             | 10 +++----
 7 files changed, 32 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
 rename meta/recipes-devtools/dnf/dnf/{0001-Do-not-prepend-installroot-to-logdir.patch => 0005-Do-not-prepend-installroot-to-logdir.patch} (67%)
 rename meta/recipes-devtools/dnf/{dnf_2.6.3.bb => dnf_2.7.5.bb} (92%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch b/meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
deleted file mode 100644
index 05f31415174..00000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 166833a88a928a574bf9143b9b65f544be482c77 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 18 Aug 2017 15:55:15 +0300
-Subject: [PATCH] Check conf.releasever instead of releasever
-
-The substitutions may actually set the conf.releasever correctly,
-and so the check should use that instead of the passed-in function
-parameter.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf/pull/901]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/cli/cli.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index 2d63420c..167943b8 100644
---- a/dnf/cli/cli.py
-+++ b/dnf/cli/cli.py
-@@ -914,7 +914,7 @@ class Cli(object):
-         conf.releasever = releasever
-         subst = conf.substitutions
-         subst.update_from_etc(conf.installroot)
--        if releasever is None:
-+        if conf.releasever is None:
-             logger.warning(_("Unable to detect release version (use '--releasever' to specify "
-                              "release version)"))
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index c9df4589746..6692b41a160 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,10 +1,11 @@
-From 8ce181714640315d2dd37ee794acbb22063cd669 Mon Sep 17 00:00:00 2001
+From 05e059cd4e9910c00b32d377f4f98e3c8dde6bc6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
-Subject: [PATCH] Corretly install tmpfiles.d configuration
+Subject: [PATCH 4/5] Corretly install tmpfiles.d configuration
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  etc/tmpfiles.d/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -17,5 +18,5 @@ index f69c773e..3eb6d0e8 100644
 -INSTALL (FILES dnf.conf DESTINATION /usr/lib/tmpfiles.d/)
 +INSTALL (FILES dnf.conf DESTINATION ${SYSCONFDIR}/tmpfiles.d/)
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 0f261e5c5d6..15a7bfc7329 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,16 +1,17 @@
-From 4313ced1320594013795f11f6db00381e3f4cc45 Mon Sep 17 00:00:00 2001
+From a8ef81c115a45f05dad145c98e10f3c4940e4e29 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
-Subject: [PATCH] Do not hardcode /etc and systemd unit directories
+Subject: [PATCH 3/5] Do not hardcode /etc and systemd unit directories
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6a319935..db20ccd4 100644
+index 650b624a..10199618 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -7,8 +7,8 @@ if (NOT PYTHON_DESIRED)
@@ -25,5 +26,5 @@ index 6a319935..db20ccd4 100644
  if (${PYTHON_DESIRED} STREQUAL "2")
  	FIND_PACKAGE (PythonInterp REQUIRED)
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
similarity index 67%
rename from meta/recipes-devtools/dnf/dnf/0001-Do-not-prepend-installroot-to-logdir.patch
rename to meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index a90e77cbf10..aa20009cef5 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,7 +1,7 @@
-From 31653d324cf8c7b1f2f9e49d22676bd2ac546331 Mon Sep 17 00:00:00 2001
+From 6365389074a1b86962f3d8b22a2ead2202026a98 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
-Subject: [PATCH] Do not prepend installroot to logdir.
+Subject: [PATCH 5/5] Do not prepend installroot to logdir.
 
 This would otherwise write the logs into rootfs/var/log
 (whereas we want them in $T),
@@ -14,12 +14,12 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index b764801a..893f4bda 100644
+index d2d9c082..82270ecf 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -881,7 +881,7 @@ class Cli(object):
-         subst = conf.substitutions
-         subst.update_from_etc(conf.installroot)
+@@ -920,7 +920,7 @@ class Cli(object):
+             logger.warning(_("Unable to detect release version (use '--releasever' to specify "
+                              "release version)"))
  
 -        for opt in ('cachedir', 'logdir', 'persistdir'):
 +        for opt in ('cachedir', 'persistdir'):
@@ -27,5 +27,5 @@ index b764801a..893f4bda 100644
  
          self.base._logging._setup_from_dnf_conf(conf)
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 8c59f9f670e..6e011915df0 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,16 +1,17 @@
-From 3ddaa930cda57a62a2174faebcc87aebc59591d1 Mon Sep 17 00:00:00 2001
+From 7205033e44d8fba1d3b18b490e7eaab82da1ffa3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
-Subject: [PATCH 29/30] Do not set PYTHON_INSTALL_DIR by running python
+Subject: [PATCH 1/5] Do not set PYTHON_INSTALL_DIR by running python
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6a319935..466ca1e6 100644
+index 23e5f889..650b624a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -18,7 +18,7 @@ else()
@@ -23,5 +24,5 @@ index 6a319935..466ca1e6 100644
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
  
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index 1abd880da9b..eedbb5723fa 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,19 +1,20 @@
-From 9c8d545152b35d8943be72b9503414a53e1ebf7c Mon Sep 17 00:00:00 2001
+From 8d97b72a1d77149e2f9048d1ca6cef66da1a8aa5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:37 +0200
-Subject: [PATCH 30/30] Run python scripts using env
+Subject: [PATCH 2/5] Run python scripts using env
 
 Otherwise the build tools hardcode the python path into them.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  bin/dnf-automatic.in | 2 +-
  bin/dnf.in           | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
-index 5b06aa26..9f6f703e 100755
+index 5b06aa26..891b4c24 100755
 --- a/bin/dnf-automatic.in
 +++ b/bin/dnf-automatic.in
 @@ -1,4 +1,4 @@
@@ -23,7 +24,7 @@ index 5b06aa26..9f6f703e 100755
  #
  # Copyright (C) 2014-2016 Red Hat, Inc.
 diff --git a/bin/dnf.in b/bin/dnf.in
-index 645d0f06..ab141abd 100755
+index 645d0f06..bdf7b3c4 100755
 --- a/bin/dnf.in
 +++ b/bin/dnf.in
 @@ -1,4 +1,4 @@
@@ -33,5 +34,5 @@ index 645d0f06..ab141abd 100755
  #
  # Copyright (C) 2012-2016 Red Hat, Inc.
 -- 
-2.11.0
+2.14.2
 
diff --git a/meta/recipes-devtools/dnf/dnf_2.6.3.bb b/meta/recipes-devtools/dnf/dnf_2.7.5.bb
similarity index 92%
rename from meta/recipes-devtools/dnf/dnf_2.6.3.bb
rename to meta/recipes-devtools/dnf/dnf_2.7.5.bb
index 3ed6a74570f..fbd3bd45719 100644
--- a/meta/recipes-devtools/dnf/dnf_2.6.3.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.7.5.bb
@@ -5,15 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    "
 
 SRC_URI = "git://github.com/rpm-software-management/dnf.git \
+           file://0001-Corretly-install-tmpfiles.d-configuration.patch \
+           file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
+           file://0005-Do-not-prepend-installroot-to-logdir.patch \
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
-           file://0001-Do-not-prepend-installroot-to-logdir.patch \
-           file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
-           file://0001-Corretly-install-tmpfiles.d-configuration.patch \
-           file://0001-Check-conf.releasever-instead-of-releasever.patch \
            "
 
-SRCREV = "be2585183ec4485ee4d5e121f242d8669296f065"
+SRCREV = "564c44667c7014843fa6f1732621093114ec59b2"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
@@ -46,6 +45,7 @@ do_install_append_class-native() {
 }
 
 SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
+                         dnf-automatic.service dnf-automatic.timer \
                          dnf-automatic-download.service dnf-automatic-download.timer \
                          dnf-automatic-install.service dnf-automatic-install.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
-- 
2.15.0


