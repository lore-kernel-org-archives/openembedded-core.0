Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.9023.1585955510286011396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 16:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.43, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: PGYCiayofkEd1VwZCyUq2pZDmpe3DMeeRgJ4iTFe/aTI3PIZeTdega3iYyx6IoW8lscPk0KjXs
 2El97ac+O4BA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2020 16:11:49 -0700
IronPort-SDR: +/WLDL6K6Spw1KrsdQuvHLQ4vLpFd6ZOTJBdUf8Eh62Lgokl4SIFScs2diXxRBxosU09wZhDJ/
 ud/MbIm0/HIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; 
   d="scan'208";a="241250382"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga007.fm.intel.com with ESMTP; 03 Apr 2020 16:11:49 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	randy.macleod@windriver.com,
	armccurdy@gmail.com,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH] scripts/install-buildtools: refactor for Python 3.4
Date: Fri,  3 Apr 2020 16:11:38 -0700
Message-Id: <20200403231138.9560-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Our least common denominator supported distro is debian-8
which has python 3.4. The whole point of the install-buildtools
script is to make it easier on the user to install buildtools
tarball. So it needs to run on Python 3.4.

The way we checked if the install was successful in the prior
version of the script was not workable in python 3.4. Since
the environment-setup-... script is currently just exporting
environment variables, use os.environ to do the equivalent from
values gleaned via regex from the environment-setup-... file.

Corrected a couple minor whitespace errors

NOTE: License changed to GPL-2.0-only due to inclusion of code
copied directly from bitbake/lib/bb/utils.py. This avoids the
need to depend on bitbake, which is now Python 3.5+ only.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 scripts/install-buildtools | 103 ++++++++++++++++++++++++++++---------
 1 file changed, 79 insertions(+), 24 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 92fb1eb7d25..9da364981e5 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -4,7 +4,7 @@
 #
 # Copyright (C) 2017-2020 Intel Corporation
 #
-# SPDX-License-Identifier: MIT
+# SPDX-License-Identifier: GPL-2.0-only
 #
 #  NOTE: --with-extended-buildtools is on by default
 #
@@ -37,6 +37,7 @@ import logging
 import os
 import re
 import shutil
+import shlex
 import stat
 import subprocess
 import sys
@@ -49,21 +50,56 @@ sys.path = sys.path + [lib_path]
 import scriptutils
 import scriptpath
 
-# Figure out where is the bitbake/lib/bb since we need bb.utils.md5_file
-bitbakepath = scriptpath.add_bitbake_lib_path()
-if not bitbakepath:
-    sys.stderr.write("Unable to find bitbake by searching parent directory "
-                     "of this script or PATH\n")
-    sys.exit(1)
 
 PROGNAME = 'install-buildtools'
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
-DEFAULT_INSTALL_DIR: str = os.path.join(os.path.split(scripts_path)[0],'buildtools')
-DEFAULT_BASE_URL: str = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE: str = 'yocto-3.1_M3'
-DEFAULT_INSTALLER_VERSION: str = '3.0+snapshot'
-DEFAULT_BUILDDATE: str = "20200315"
+DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
+DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
+DEFAULT_RELEASE = 'yocto-3.1_M3'
+DEFAULT_INSTALLER_VERSION = '3.0+snapshot'
+DEFAULT_BUILDDATE = "20200315"
+
+# Python version sanity check
+if not (sys.version_info.major == 3 and sys.version_info.minor >= 4):
+    logger.error("This script requires Python 3.4 or greater")
+    logger.error("You have Python %s.%s" %
+	  (sys.version_info.major, sys.version_info.minor))
+    sys.exit(1)
+
+# The following three functions are copied directly from
+# bitbake/lib/bb/utils.py, in order to allow this script
+# to run on versions of python earlier than what bitbake
+# supports (e.g. less than Python 3.5 for YP 3.1 release)
+
+def _hasher(method, filename):
+    import mmap
+
+    with open(filename, "rb") as f:
+        try:
+            with mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ) as mm:
+                for chunk in iter(lambda: mm.read(8192), b''):
+                    method.update(chunk)
+        except ValueError:
+            # You can't mmap() an empty file so silence this exception
+            pass
+    return method.hexdigest()
+
+
+def md5_file(filename):
+    """
+    Return the hex string representation of the MD5 checksum of filename.
+    """
+    import hashlib
+    return _hasher(hashlib.md5(), filename)
+
+def sha256_file(filename):
+    """
+    Return the hex string representation of the 256-bit SHA checksum of
+    filename.
+    """
+    import hashlib
+    return _hasher(hashlib.sha256(), filename)
 
 
 def main():
@@ -72,10 +108,10 @@ def main():
     global DEFAULT_RELEASE
     global DEFAULT_INSTALLER_VERSION
     global DEFAULT_BUILDDATE
-    filename: str = ""
-    release: str = ""
-    buildtools_url: str = ""
-    install_dir: str = ""
+    filename = ""
+    release = ""
+    buildtools_url = ""
+    install_dir = ""
 
     parser = argparse.ArgumentParser(
         description="Buildtools installation helper",
@@ -187,10 +223,9 @@ def main():
 
         # Verify checksum
         if args.check:
-            import bb
             logger.info("Fetching buildtools installer checksum")
             checksum_type = ""
-            for checksum_type in ["md5sum", "sha256"]: 
+            for checksum_type in ["md5sum", "sha256"]:
                 check_url = "{}.{}".format(buildtools_url, checksum_type)
                 checksum_filename = "{}.{}".format(filename, checksum_type)
                 tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
@@ -215,9 +250,9 @@ def main():
                     return 1
                 checksum = m.group('checksum')
             if checksum_type == "md5sum":
-                checksum_value = bb.utils.md5_file(tmpbuildtools)
+                checksum_value = md5_file(tmpbuildtools)
             else:
-                checksum_value = bb.utils.sha256_file(tmpbuildtools)
+                checksum_value = sha256_file(tmpbuildtools)
             if checksum == checksum_value:
                     logger.info("Checksum success")
             else:
@@ -239,6 +274,21 @@ def main():
         if ret != 0:
             logger.error("Could not run buildtools installer")
 
+        # Setup the environment
+        logger.info("Setting up the environment")
+        regex = re.compile(r'^(?P<export>export )?(?P<env_var>[A-Z_]+)=(?P<env_val>.+)$')
+        with open("%s/environment-setup-x86_64-pokysdk-linux" %
+                  install_dir, 'rb') as f:
+            for line in f:
+                match = regex.search(line.decode('utf-8'))
+                logger.debug("export regex: %s" % match)
+                if match:
+                    env_var = match.group('env_var')
+                    logger.debug("env_var: %s" % env_var)
+                    env_val = match.group('env_val')
+                    logger.debug("env_val: %s" % env_val)
+                    os.environ[env_var] = env_val
+
         # Test installation
         logger.info("Testing installation")
         tool = ""
@@ -252,10 +302,15 @@ def main():
         else:
             tool = 'tar'
         logger.debug("install_dir: %s" % install_dir)
-        proc = subprocess.run(". %s/environment-setup-x86_64-pokysdk-linux && which %s" %
-                              (install_dir, tool),
-                              shell=True, stdout=subprocess.PIPE)
-        which_tool = proc.stdout.decode("utf-8")
+        cmd = shlex.split("/usr/bin/which %s" % tool)
+        logger.debug("cmd: %s" % cmd)
+        logger.debug("tool: %s" % tool)
+        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE)
+        output, errors = proc.communicate()
+        logger.debug("proc.args: %s" % proc.args)
+        logger.debug("proc.communicate(): output %s" % output)
+        logger.debug("proc.communicate(): errors %s" % errors)
+        which_tool = output.decode('utf-8')
         logger.debug("which %s: %s" % (tool, which_tool))
         ret = proc.returncode
         if not which_tool.startswith(install_dir):
-- 
2.24.0

