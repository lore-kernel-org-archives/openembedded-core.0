Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E8AD678474
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 13:06:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Aug 2017 06:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,392,1498546800"; d="scan'208";a="1005194092"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 18 Aug 2017 06:05:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 16:02:46 +0300
Message-Id: <20170818130246.4525-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] dnf: fix "Unable to detect release version" warning
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
X-List-Received-Date: Fri, 18 Aug 2017 13:06:21 -0000

The release version was actually working correctly; it only makes
the warning work properly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...eck-conf.releasever-instead-of-releasever.patch | 31 ++++++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_2.6.3.bb             |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch b/meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
new file mode 100644
index 00000000000..05f31415174
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
@@ -0,0 +1,31 @@
+From 166833a88a928a574bf9143b9b65f544be482c77 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 18 Aug 2017 15:55:15 +0300
+Subject: [PATCH] Check conf.releasever instead of releasever
+
+The substitutions may actually set the conf.releasever correctly,
+and so the check should use that instead of the passed-in function
+parameter.
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf/pull/901]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ dnf/cli/cli.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
+index 2d63420c..167943b8 100644
+--- a/dnf/cli/cli.py
++++ b/dnf/cli/cli.py
+@@ -914,7 +914,7 @@ class Cli(object):
+         conf.releasever = releasever
+         subst = conf.substitutions
+         subst.update_from_etc(conf.installroot)
+-        if releasever is None:
++        if conf.releasever is None:
+             logger.warning(_("Unable to detect release version (use '--releasever' to specify "
+                              "release version)"))
+ 
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/dnf/dnf_2.6.3.bb b/meta/recipes-devtools/dnf/dnf_2.6.3.bb
index 51072901e4d..3ed6a74570f 100644
--- a/meta/recipes-devtools/dnf/dnf_2.6.3.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.6.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-Do-not-prepend-installroot-to-logdir.patch \
            file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
+           file://0001-Check-conf.releasever-instead-of-releasever.patch \
            "
 
 SRCREV = "be2585183ec4485ee4d5e121f242d8669296f065"
-- 
2.14.1


