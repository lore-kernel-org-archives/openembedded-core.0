Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.4893.1585684998138979939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 13:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.126, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: m8hZWKHWQRSFGHtRm1/xOOo1f3of/y43JRcqfjGnjn7BPX2BODFI5xXtj1PZoGFwfG53vn/FgP
 llur9Br5ry6w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 13:03:17 -0700
IronPort-SDR: YJZzv9+uVBMJxEBGIrU4/khn1h6u6pViw0qbbeoqHKyqwSjCBsg+Qx/RdaJNjnpffpxdeaFAuT
 9mshsZZnPCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="267397993"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2020 13:03:17 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	randy.macleod@windriver.com,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 1/6] scripts/install-buildtools: improvements
Date: Tue, 31 Mar 2020 13:03:01 -0700
Message-Id: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Install directory defaults to scripts/../buildtools
  e.g. --directory is set by default
  This avoids the user having to type in their sudo password
  to install in /opt/poky/<installer-version>

* Use "." rather than "source" for sourcing the environment script
  as not all distros (e.g. Debian) have "source" by default.

* Add buildtools/ to .gitignore

* Fix typos in example usage (--install-version -> --installer-version)

[YOCTO #13832]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .gitignore                 |  1 +
 scripts/install-buildtools | 13 +++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/.gitignore b/.gitignore
index d0e6b2fb89..b66d371aac 100644
--- a/.gitignore
+++ b/.gitignore
@@ -9,6 +9,7 @@ pstage/
 scripts/oe-git-proxy-socks
 sources/
 meta-*/
+buildtools/
 !meta-skeleton
 !meta-selftest
 hob-image-*.bb
diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 0947e9c4d6..49cab1345a 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -17,7 +17,7 @@
 #        $ install-buildtools \
 #          --base-url http://downloads.yoctoproject.org/releases/yocto \
 #          --release yocto-3.1_M2 \
-#          --install-version 3.0+snapshot
+#          --installer-version 3.0+snapshot
 #          --build-date 202000122
 #
 #  Example usage (standard buildtools from release):
@@ -29,7 +29,7 @@
 #        $ install-buildtools --without-extended-buildtools \
 #          --base-url http://downloads.yoctoproject.org/releases/yocto \
 #          --release yocto-3.0.2 \
-#          --install-version 3.0.2
+#          --installer-version 3.0.2
 #
 
 import argparse
@@ -59,6 +59,7 @@ if not bitbakepath:
 PROGNAME = 'install-buildtools'
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
+DEFAULT_INSTALL_DIR: str = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL: str = 'http://downloads.yoctoproject.org/releases/yocto'
 DEFAULT_RELEASE: str = 'yocto-3.1_M2'
 DEFAULT_INSTALLER_VERSION: str = '3.0+snapshot'
@@ -66,6 +67,7 @@ DEFAULT_BUILDDATE: str = "20200122"
 
 
 def main():
+    global DEFAULT_INSTALL_DIR
     global DEFAULT_BASE_URL
     global DEFAULT_RELEASE
     global DEFAULT_INSTALLER_VERSION
@@ -73,6 +75,7 @@ def main():
     filename: str = ""
     release: str = ""
     buildtools_url: str = ""
+    install_dir: str = ""
 
     parser = argparse.ArgumentParser(
         description="Buildtools installation helper",
@@ -87,6 +90,7 @@ def main():
                              '(optional)\nRequires --url',
                         action='store')
     parser.add_argument('-d', '--directory',
+                        default=DEFAULT_INSTALL_DIR,
                         help='directory where buildtools SDK will be installed (optional)',
                         action='store')
     parser.add_argument('-r', '--release',
@@ -216,12 +220,12 @@ def main():
         st = os.stat(tmpbuildtools)
         os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
         logger.debug(os.stat(tmpbuildtools))
-        install_dir = "/opt/poky/%s" % args.installer_version
         if args.directory:
             install_dir = args.directory
             ret = subprocess.call("%s -d %s -y" %
                                   (tmpbuildtools, install_dir), shell=True)
         else:
+            install_dir = "/opt/poky/%s" % args.installer_version
             ret = subprocess.call("%s -y" % tmpbuildtools, shell=True)
         if ret != 0:
             logger.error("Could not run buildtools installer")
@@ -238,7 +242,8 @@ def main():
             tool = 'gcc'
         else:
             tool = 'tar'
-        proc = subprocess.run("source %s/environment-setup-x86_64-pokysdk-linux && which %s" %
+        logger.debug("install_dir: %s" % install_dir)
+        proc = subprocess.run(". %s/environment-setup-x86_64-pokysdk-linux && which %s" %
                               (install_dir, tool),
                               shell=True, stdout=subprocess.PIPE)
         which_tool = proc.stdout.decode("utf-8")
-- 
2.24.0

