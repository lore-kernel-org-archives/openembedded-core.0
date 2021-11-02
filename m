Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A8EC43219
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.531.1635871631913336930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509662"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509662"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:22 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575073"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:21 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/24] python3-setuptools: _distutils/sysconfig fix
Date: Wed,  3 Nov 2021 00:43:49 +0800
Message-Id: 
 <2f9a362bfebc83ea6459b5294a6fab3c77ea6cb2.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157787

From: Tim Orling <ticotimo@gmail.com>

Add patch to append STAGING_LIBDIR python-sysconfigdata to sys.path so
that packages which set SETUPTOOLS_USE_DISUTILS='local' cross-compile
properly with python3-setuptools-native.

Fixes:
ModuleNotFoundError: No module named '_sysconfigdata'

References:
https://setuptools.pypa.io/en/latest/deprecated/distutils-legacy.html#porting-from-distutils

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6fb99c53f779966fc902a629d0a8bbd9f84c6be)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...nfig-append-STAGING_LIBDIR-python-sy.patch | 34 +++++++++++++++++++
 .../python/python3-setuptools_57.4.0.bb       |  5 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
new file mode 100644
index 0000000000..565cf8ae8d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
@@ -0,0 +1,34 @@
+From 44349672cbff8945693c8d2821c82e9f04bfc8b5 Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@intel.com>
+Date: Wed, 20 Oct 2021 17:38:10 +0000
+Subject: [PATCH] _distutils/sysconfig: append
+ STAGING_LIBDIR/python-sysconfigdata to sys.path
+
+When python modules set SETUPTOOLS_USE_DISTULS='local', this uses the
+vendored _distutils in setuptools rather than distutils in the Standard
+Library. This is needed so that target configuration can be used with
+python3-setuptools-native.
+
+Based on python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+from Alex Kanavin <alex.kanavin@gmail.com>
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
+---
+ setuptools/_distutils/sysconfig.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
+index 8832b3e..bbc7c08 100644
+--- a/setuptools/_distutils/sysconfig.py
++++ b/setuptools/_distutils/sysconfig.py
+@@ -461,6 +461,8 @@ def _init_posix():
+         platform=sys.platform,
+         multiarch=getattr(sys.implementation, '_multiarch', ''),
+     ))
++    if 'STAGING_LIBDIR' in os.environ:
++        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
+     try:
+         _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
+     except ImportError:
diff --git a/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb b/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
index ae45936c39..fcf20e9efd 100644
--- a/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
@@ -8,7 +8,10 @@ inherit pypi setuptools3
 
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
+SRC_URI += "\
+    file://0001-change-shebang-to-python3.patch \
+    file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
+"
 
 SRC_URI[sha256sum] = "6bac238ffdf24e8806c61440e755192470352850f3419a52f26ffe0a1a64f465"
 
-- 
2.31.1


