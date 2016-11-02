Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E603C71A39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 15:07:16 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p190so274706168wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HlKn+T+ju7LKhV/OhPLLmGYnyTmidZATbuxzzoBt8Hg=;
	b=YHDDjFo0kE3h7x38ZwjMvAcK6hAtYeqbjL/xNNW1+bKRPpewaMIFVIY79WD3+zv/eR
	yzHj7q4nt56lYhpI0BIaaFL2CLhxNQENsW3nixo+65/ypwloZtbSQZ6p4N5U4MsOgbtI
	duV74j+ujLC1nyG1Nc3B3kGSI575VtNptaLd1v6C0zltumQMgskEkAEsgJu4IKLLKhxu
	yFGe25/h2yh5Bl9S3Ct3YaeNbrfgU1bk3zRdZ2zF7WxjguMpZXh4avvQzHSFiJ261k52
	W8iM43vVGvnecOx8mPFaxBoiJNUWCRTMEKpQMzjE0UeVw0BJDuMxTAXixX7j6wiN1nKN
	XI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HlKn+T+ju7LKhV/OhPLLmGYnyTmidZATbuxzzoBt8Hg=;
	b=ZX059hDgW1pJqK+9xsCrxs+y7Q94ya3/vmw8RFh9NNT4YKI2Y8GNvx8zXw5XX1AFke
	R3Po19ELN7IsDbqT4M+FSEbGLPKW5zJ0/e8EV4+H+u+LKLci+ndhpsjD5kA9QlM5M2hv
	v/p8q1UVl1YaBK8F2v/ZXPm+ziDVdQFfAmg7A4aa8SLXvmbtWXdtWO2PG85awEuKtXo0
	SLKskikr1Lb5C9C3IWuthU/kFD3taZdWSHtSoj+HklvT4FV0K7gBIg6uLsbs8d0vb5fM
	kh6gR/LHPzVkk9O/s460P5aVNFGn8JHtaixrKGYTpec5v3lCQ+dWW9cCucrqQfPHFWNl
	8rlg==
X-Gm-Message-State: ABUngvcCZnMB0iAG9Y47H36cQcN6tqvZIO43XcWRF9bCuMONrXhaJG/VzB76c60Bm6ofQ8DU
X-Received: by 10.28.71.140 with SMTP id m12mr3950439wmi.125.1478099237245;
	Wed, 02 Nov 2016 08:07:17 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	gk6sm3268372wjc.21.2016.11.02.08.07.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Nov 2016 08:07:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 15:07:12 +0000
Message-Id: <1478099232-23987-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 15:07:21 -0000

Previously do_populate_lic would bail writing the license files (such as the MIT
license text) to deploy/licenses/${PN}/ if there were no files listed in
LIC_FILES_CHKSUM.

However this means that recipes that generate their content (such as os-release)
or are otherwise "interesting" (such as perf) don't have their license files
copied over, resulting in warnings from do_rootfs.

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


