Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8664F6080F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 22:58:19 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p190so298754343wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 15:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ulRIPhqxGzRqwl2OfsrTzVp/mll4AseXk/9XEJN3GAQ=;
	b=rMF+kQpFPyD1xEU3mGCXky0XJ03L2MwyyIRamTpi4FmCFipLf5E61ALcVNrPHXNGdZ
	V1ywoYSkIfBJFvDrh3IIzKJhCM6vBndqZ0xZrSML3PEBGOmxSsq8dRX+D6gMvRynRIXj
	ayFyo6McVzd2dsNvvyOxvQJovTCvs/v1WvK4g0J4yEFpCRKtQRD06kp29gxyUj4yHUsz
	sOtwFDF9nHfPbvB+TqZDMryFs+J2dE9mtTC2gvnoEwX8fiDexTBKlWzRH9LihmW5vbGX
	mYPwlf6bde29IxstGW4/CQtlEpQyhQ8Iw9J2jftlxvZn6prQqTgf2w/An9sLKTDSSF9Q
	6U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ulRIPhqxGzRqwl2OfsrTzVp/mll4AseXk/9XEJN3GAQ=;
	b=I5+T+WhbVD7LwPJYv9tmWHTdxXts0DWLz4chetcr2BwJ1TY403wrKI5rz7lGOvuX/j
	wO1a8WzxeE4PBMSQH1YZ+zZaIlgEAaNCcni4z6fU5WtStvEgpWbTpSbH4+G1nDftdB6Y
	rSVhWvtj/7mRhWJNY1pp3CDk6diQh2lRdR9L9baUfhH0qMGHUMgqm5eZhSkMP1bZXJFU
	zdV0syp39WBMwbYZR0SxPQEuU13meOOMxfpZ1jmC546NePQspn+92B6PR+cZ/mXKnb70
	dcgbx8UkgSIMYONb7/aYS9tc//fGRyHhHw4ULe+9MlpvV+0tArIx0oQLdgEZcNsV953F
	drig==
X-Gm-Message-State: ABUngvdvp9XkWtyWLqwKETGDfqGM+JShTduP6EfwusTAYv4nzr0vu78NBA8v8bnUuD9MErnz
X-Received: by 10.194.80.194 with SMTP id t2mr4629264wjx.75.1478127500862;
	Wed, 02 Nov 2016 15:58:20 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	198sm38830488wmn.14.2016.11.02.15.58.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Nov 2016 15:58:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 22:58:16 +0000
Message-Id: <1478127496-13033-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] classes/license: copy licenses even if there are no checksummed files
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
X-List-Received-Date: Wed, 02 Nov 2016 22:58:20 -0000

Previously do_populate_lic would bail writing the license files (such as the MIT
license text) to deploy/licenses/${PN}/ if there were no files listed in
LIC_FILES_CHKSUM.  In general this isn't a problem since LIC_FILES_CHKSUM was
effectively a required field, and for packages which don't have traditional
content was generally set to a separate license such as
${COREBASE}/meta/COPYING.MIT.

However LIC_FILES_CHKSUM is now only required if there are sources in SRC_URI,
so oe-core b18fa5f removed these now redundant values. The unexpected side
effect of this is that that recipes that generate their content (such as
os-release) or are otherwise "interesting" (such as perf) don't have their
license files copied over, resulting in warnings from do_rootfs.

Resolve this by not returning early if LIC_FILES_CHKSUM is empty, and always
copy the references license files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/license.bbclass | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 660b85f..afcfbfc 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -390,7 +390,7 @@ def find_license_files(d):
     from collections import defaultdict, OrderedDict
 
     # All the license files for the package
-    lic_files = d.getVar('LIC_FILES_CHKSUM', True)
+    lic_files = d.getVar('LIC_FILES_CHKSUM', True) or ""
     pn = d.getVar('PN', True)
     # The license files are located in S/LIC_FILE_CHECKSUM.
     srcdir = d.getVar('S', True)
@@ -469,12 +469,6 @@ def find_license_files(d):
     if not generic_directory:
         bb.fatal("COMMON_LICENSE_DIR is unset. Please set this in your distro config")
 
-    if not lic_files:
-        # No recipe should have an invalid license file. This is checked else
-        # where, but let's be pedantic
-        bb.note(pn + ": Recipe file does not have license file information.")
-        return lic_files_paths
-
     for url in lic_files.split():
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
-- 
2.8.1


