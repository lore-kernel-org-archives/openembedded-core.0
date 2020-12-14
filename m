Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: B5ist78JcC6ieuZUa7QcxIF+iEmWjq8HssQwWypAIiEeJrL63oogvvH0dNTNfiY20mf9uQKxfh
 05ttXJl2dTyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752418"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752418"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:44 -0800
IronPort-SDR: aHIixhgOyeRCkmPWWyTpJ/HspiFol52fTsplbJqHtTIGvq3rJqnukDXf9FKc7RK4VyA6yzBffH
 5qQsezVi9ebg==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670824"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:43 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/19] uninative: Don't use single sstate for pseudo-native
Date: Mon, 14 Dec 2020 11:35:15 +0800
Message-Id: <d3ec2ecdf8915a9fb1c4ea36a29b05090abf089c.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

pseudo-native is a bit special. It conditionally compiles in support for
xattr, statx and statvfs amongst other options. If a pseudo-native binary is
used on a system where these functions are present but it wasn't compiled in
we see hard to debug permissions problems.

An example is the devtool.DevtoolExtractTests.test_devtool_deploy_target
oe-selftest which shows a cryptic error:

  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/devtool.py", line 1388, in test_devtool_deploy_target
    self.assertEqual(filelist1, filelist2)
  File "/usr/lib64/python3.9/unittest/case.py", line 831, in assertEqual
    assertion_func(first, second, msg=msg)
  File "/usr/lib64/python3.9/unittest/case.py", line 1037, in assertListEqual
    self.assertSequenceEqual(list1, list2, msg, seq_type=list)
  File "/usr/lib64/python3.9/unittest/case.py", line 1019, in assertSequenceEqual
    self.fail(msg)
  File "/usr/lib64/python3.9/unittest/case.py", line 670, in fail
    raise self.failureException(msg)

AssertionError: Lists differ: ['-rwxr-xr-x 6000 6000 /etc/init.d/mdmonitor', '-rw-r-[10124 chars]n.8'] != ['-rwxr-xr-x root root /etc/init.d/mdmonitor', '-rw-r-[10124 chars]n.8']

First differing element 0:
'-rwxr-xr-x 6000 6000 /etc/init.d/mdmonitor'
'-rwxr-xr-x root root /etc/init.d/mdmonitor'

This is due to a version of pseudo without statx being used on a system where
ls uses statx, hence the files are displayed as 6000.6000 instead of root.root.

Avoid this by always building pseudo-native for the specific distro in question rather
than using a universal sstate feed.

This hopefully fixes one of the mysterious AB-INT issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e3785a3f1f3cf68f5fe101cd6bebe91db165973)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/base.bbclass   | 1 +
 meta/classes/sstate.bbclass | 4 ++++
 meta/lib/oe/sstatesig.py    | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5a0b0c6b3e..78ae28bb0f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -231,6 +231,7 @@ python base_eventhandler() {
     if isinstance(e, bb.event.ConfigParsed):
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
+        d.setVar("ORIGNATIVELSBSTRING", d.getVar("NATIVELSBSTRING", False))
         d.setVar('BB_VERSION', bb.__version__)
 
     # There might be no bb.event.ConfigParsed event if bitbake server is
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a8ae75101d..d08d950e76 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -72,6 +72,7 @@ BB_HASHFILENAME = "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
 SSTATE_ARCHS = " \
     ${BUILD_ARCH} \
+    ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
     ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
     ${BUILD_ARCH}_${TARGET_ARCH} \
     ${SDK_ARCH}_${SDK_OS} \
@@ -80,6 +81,7 @@ SSTATE_ARCHS = " \
     ${PACKAGE_ARCH} \
     ${PACKAGE_EXTRA_ARCHS} \
     ${MACHINE_ARCH}"
+SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
@@ -121,6 +123,8 @@ SSTATE_HASHEQUIV_REPORT_TASKDATA[doc] = "Report additional useful data to the \
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
+        if d.getVar("PN") == "pseudo-native":
+            d.appendVar('SSTATE_PKGARCH', '_${ORIGNATIVELSBSTRING}')
     elif bb.data.inherits_class('crosssdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross', d):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 64fb84ec92..34558a6672 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -439,7 +439,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         d2 = multilibcache[variant]
 
     if taskdata.endswith("-native"):
-        pkgarchs = ["${BUILD_ARCH}"]
+        pkgarchs = ["${BUILD_ARCH}", "${BUILD_ARCH}_${ORIGNATIVELSBSTRING}"]
     elif taskdata.startswith("nativesdk-"):
         pkgarchs = ["${SDK_ARCH}_${SDK_OS}", "allarch"]
     elif "-cross-canadian" in taskdata:
-- 
2.29.2

