Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.4791.1585685005811098451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 13:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: 0mxAal/xxj3XPXFQJcX2FRZRzeE/zKrXfTWOczfwj5BV10kTiD79uBHSzgKJ216ie0dbsGklKr
 +/X69W/aIjhQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 13:03:30 -0700
IronPort-SDR: KNr8NZFGzx49ccnxHdblr10eKYajDsXmVZggwILtQs3I2MS2y/rsEsziQ1sTldgS4P/1D1OC0H
 rDQiK+uHtj/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="267398051"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2020 13:03:30 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	randy.macleod@windriver.com,
	Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 6/6] install-buildtools: bump default to yocto-3.1_M3, fixes
Date: Tue, 31 Mar 2020 13:03:06 -0700
Message-Id: <20200331200306.36942-6-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
References: <20200331200306.36942-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ability to check md5sum (yocto-3.1_M2 and before) or sha256
(yocto-3.1_M3 and beyond).

Make regex for path in checksum file optional, since
for yocto-3.1_M3 the format is <checksum>  <filename>,
but prior releases was <checksum>  <path><filename>

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 scripts/install-buildtools | 51 ++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 49cab1345a..92fb1eb7d2 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -11,14 +11,14 @@
 #  Example usage (extended buildtools from milestone):
 #    (1) using --url and --filename
 #        $ install-buildtools \
-#          --url http://downloads.yoctoproject.org/releases/yocto/milestones/yocto-3.1_M2/buildtools \
-#          --filename x86_64-buildtools-extended-nativesdk-standalone-3.0+snapshot-20200122.sh
+#          --url http://downloads.yoctoproject.org/releases/yocto/milestones/yocto-3.1_M3/buildtools \
+#          --filename x86_64-buildtools-extended-nativesdk-standalone-3.0+snapshot-20200315.sh
 #    (2) using --base-url, --release, --installer-version and --build-date
 #        $ install-buildtools \
 #          --base-url http://downloads.yoctoproject.org/releases/yocto \
-#          --release yocto-3.1_M2 \
+#          --release yocto-3.1_M3 \
 #          --installer-version 3.0+snapshot
-#          --build-date 202000122
+#          --build-date 202000315
 #
 #  Example usage (standard buildtools from release):
 #    (3) using --url and --filename
@@ -61,9 +61,9 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR: str = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL: str = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE: str = 'yocto-3.1_M2'
+DEFAULT_RELEASE: str = 'yocto-3.1_M3'
 DEFAULT_INSTALLER_VERSION: str = '3.0+snapshot'
-DEFAULT_BUILDDATE: str = "20200122"
+DEFAULT_BUILDDATE: str = "20200315"
 
 
 def main():
@@ -189,31 +189,40 @@ def main():
         if args.check:
             import bb
             logger.info("Fetching buildtools installer checksum")
-            check_url = "{}.md5sum".format(buildtools_url)
-            checksum_filename = "%s.md5sum" % filename
-            tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
-            ret = subprocess.call("wget -q -O %s %s" %
-                                  (tmpbuildtools_checksum, check_url), shell=True)
-            if ret != 0:
-                logger.error("Could not download file from %s" % check_url)
-                return ret
-            regex = re.compile(r"^(?P<md5sum>[0-9a-f]+)\s\s(?P<path>.*/)(?P<filename>.*)$")
+            checksum_type = ""
+            for checksum_type in ["md5sum", "sha256"]: 
+                check_url = "{}.{}".format(buildtools_url, checksum_type)
+                checksum_filename = "{}.{}".format(filename, checksum_type)
+                tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
+                ret = subprocess.call("wget -q -O %s %s" %
+                                      (tmpbuildtools_checksum, check_url), shell=True)
+                if ret == 0:
+                    break
+            else:
+                if ret != 0:
+                    logger.error("Could not download file from %s" % check_url)
+                    return ret
+            regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s\s(?P<path>.*/)?(?P<filename>.*)$")
             with open(tmpbuildtools_checksum, 'rb') as f:
                 original = f.read()
                 m = re.search(regex, original.decode("utf-8"))
-                logger.debug("md5sum: %s" % m.group('md5sum'))
+                logger.debug("checksum regex match: %s" % m)
+                logger.debug("checksum: %s" % m.group('checksum'))
                 logger.debug("path: %s" % m.group('path'))
                 logger.debug("filename: %s" % m.group('filename'))
                 if filename != m.group('filename'):
                     logger.error("Filename does not match name in checksum")
                     return 1
-                md5sum = m.group('md5sum')
-            md5value = bb.utils.md5_file(tmpbuildtools)
-            if md5sum == md5value:
-                logger.info("Checksum success")
+                checksum = m.group('checksum')
+            if checksum_type == "md5sum":
+                checksum_value = bb.utils.md5_file(tmpbuildtools)
+            else:
+                checksum_value = bb.utils.sha256_file(tmpbuildtools)
+            if checksum == checksum_value:
+                    logger.info("Checksum success")
             else:
                 logger.error("Checksum %s expected. Actual checksum is %s." %
-                             (md5sum, md5value))
+                             (checksum, checksum_value))
 
         # Make installer executable
         logger.info("Making installer executable")
-- 
2.24.0

