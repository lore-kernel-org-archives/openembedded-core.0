Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.4791.1585685005811098451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 13:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: r9ce/d/nyC2uVhlOKX2YXfgbHaHC5ywgl4gh58s1CO2Ct9dlOPoqSKR9NtSpOi/F30hsxYUCD3
 4UTxFbcuTTVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 13:03:29 -0700
IronPort-SDR: cYGb3C8R1wrrQ5NlMt3WoDHlhhqDLpYnz+fbhIHYjc735yVfQ5ALy8tfDuQWTIN5+cUu7OMBml
 QIcxqzhn7umA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="267398048"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2020 13:03:28 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	randy.macleod@windriver.com,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 5/6] sanity.bbclass: add test for gcc < 5.0
Date: Tue, 31 Mar 2020 13:03:05 -0700
Message-Id: <20200331200306.36942-5-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
References: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is known that the version of gcc in CentOS-7 (4.8.5) causes builds to fail.

Add a test for BUILD_CC == 'gcc' and gcc < 5.0 and recommend using
scripts/install-buildtools or user built buildtools-extended-tarball.

Use the new get_host_compiler_version function from lib/oe/utils.py

NOTE: another solution is to install devtoolset-6+ from scl [1], but
this is a rather large install (> 1 Gb) and fairly invasive.

[1] https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/classes/sanity.bbclass | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index fef05fb012..f0186a9475 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -521,6 +521,25 @@ def check_wsl(d):
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
+    
+    build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
+    if build_cc.strip() == "gcc":
+        if LooseVersion(version) < LooseVersion("5.0"):
+            return "Your version of gcc is older than 5.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
+    return None
+
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
 # Version 1.28 is needed so opkg-build works correctly when reproducibile builds are enabled
@@ -533,7 +552,7 @@ def check_tar_version(sanity_data):
         return "Unable to execute tar --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[3]
     if LooseVersion(version) < LooseVersion("1.28"):
-        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the projects buildtools-tarball from our last release or use scripts/install-buildtools).\n"
+        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the project's buildtools-tarball from our last release or use scripts/install-buildtools).\n"
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
@@ -632,6 +651,7 @@ def check_sanity_version_change(status, d):
     except ImportError as e:
         status.addresult('Your Python 3 is not a full install. Please install the module %s (see the Getting Started guide for further information).\n' % e.name)
 
+    status.addresult(check_gcc_version(d))
     status.addresult(check_make_version(d))
     status.addresult(check_patch_version(d))
     status.addresult(check_tar_version(d))
-- 
2.24.0

