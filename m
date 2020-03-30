Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.408.1585597399149814363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 12:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: rYOZ61KIZ8dHWPnJdf1fmiQoAFTFF0jSH8PYCA2XwjA6gUHhCTgYSdZcEwR8BIFuXcZUtOIuy+
 REN8jQFW7R7A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 12:43:30 -0700
IronPort-SDR: kfzPiM8Auguo4cIkwvATNXbYD5INnJl9pBfgAKAFohQ7ytj7uGRwx0717pn4oKsm5IjPTSDkuk
 FF9kJ/hGJ7fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="359273502"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2020 12:43:30 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 4/4] sanity.bbclass: add test for gcc < 5.0
Date: Mon, 30 Mar 2020 12:43:02 -0700
Message-Id: <20200330194302.30032-4-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is known that the version of gcc in CentOS-7 (4.8.5) causes builds to fail.

Add a test for BUILD_CC == 'gcc' and gcc < 5.0 and recommend using
scripts/install-buildtools or user built buildtools-extended-tarball.

NOTE: another solution is to install devtoolset-6+ from scl [1], but
this is a rather large install (> 1 Gb) and fairly invasive.

[1] https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/classes/sanity.bbclass | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 0cf955a341..a1cb8c6b88 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -521,6 +521,29 @@ def check_wsl(d):
             return "OpenEmbedded doesn't work under WSL at this time, sorry"
     return None
 
+# The gcc version in CentOS-7 (4.8.5) is known to be a problem.
+# Require at least gcc version 5.0.
+#
+# This can be fixed on CentOS-7 with devtoolset-6+
+# https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
+#
+# A less invasive fix is with scripts/install-buildtools (or with user
+# built buildtools-extended-tarball)
+#
+def check_gcc_version(sanity_data):
+    from distutils.version import LooseVersion
+    import subprocess
+    build_cc = sanity_data.getVar('BUILD_CC').strip()
+    if build_cc == "gcc":
+        try:
+            result = subprocess.check_output(["gcc", "--version"], stderr=subprocess.DEVNULL).decode('utf-8')
+        except subprocess.CalledProcessError as e:
+            return "Unable to execute gcc --version, exit code %d\n%s\n" % (e.returncode, e.output)
+        version = result.split()[2]
+        if LooseVersion(version) < LooseVersion("5.0"):
+            return "Your version of gcc is older than 5.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
+    return None
+
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
 # Version 1.28 is needed so opkg-build works correctly when reproducibile builds are enabled
@@ -535,7 +558,7 @@ def check_tar_version(sanity_data):
     if LooseVersion(version) < LooseVersion("1.24"):
         return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar (1.28+). You could use the project's buildtools-tarball from our last release or use scripts/install-buildtools\n"
     if LooseVersion(version) < LooseVersion("1.28"):
-        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the projects buildtools-tarball from our last release or use scripts/install-buildtools).\n"
+        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the project's buildtools-tarball from our last release or use scripts/install-buildtools).\n"
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
@@ -634,6 +657,7 @@ def check_sanity_version_change(status, d):
     except ImportError as e:
         status.addresult('Your Python 3 is not a full install. Please install the module %s (see the Getting Started guide for further information).\n' % e.name)
 
+    status.addresult(check_gcc_version(d))
     status.addresult(check_make_version(d))
     status.addresult(check_patch_version(d))
     status.addresult(check_tar_version(d))
-- 
2.24.0

