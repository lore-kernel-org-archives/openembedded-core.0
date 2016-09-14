Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6048D7706E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 23:08:03 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id k186so35633728wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 16:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Lv5gwZkJKI5inC+wK3J8z1A6Cz/j7u6HqCd7zn1SDO4=;
	b=i27ltPFf/KHR/aQYxSDt4TSiKtvfs/Y5/aF19+xUg0/erK9neQyvIqGAB9Vz66pReL
	wgb5PA0Q+DScgYci+aH8herSd+72pstyfUcLhgBFgNjTUn9LiJPsk8Au2XH+Iw+RW6sO
	epdcLIWVFpSMrhrAo9zQdSAFXr6ROfAQFbCelyjazX3GwUrv0HEZnqAzoWWHH5W0i5uo
	II+02Zw68BnhlST9utKbHnO3PYoNMU9FZMZWDajphhIqJRsij4FHdC7XLiXqif+e5VBx
	chYTyGOcgeZZ0LaqN81NXf44cVFlTsiAnzJPq7DdXVfAUFCHGUfZMdpHgDg303RyfJxK
	3tQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Lv5gwZkJKI5inC+wK3J8z1A6Cz/j7u6HqCd7zn1SDO4=;
	b=gCpbkvTUz4lsIkpIfzOnVyZt5Fbff3ji01IgB7Fo8dz3WE6r2yPMmx/qK8WjOkFDKz
	DpLgdsDVFDZ4ZpAX1il2exWRmree2Pg82t/znbh9WglcTTDj7RUL0gOUOBtKio6ck2lQ
	pNT4btj/cZXSayrc4Ox7YCCxjZJ64YcJHCcU093jkEsmrZbsbnsclkZklfZn1VtihrV+
	aFarce8CqUXDrBS99roNB+m5Cs/4ANUxhXGFN23FVIVFaHPqk5DvnMyOXXwInF7Z8X/X
	T//Xd3zcZj7+HF0S/x2Dygc8FVUauf1OeAUnBQW/H4kaeB0ubk2gEOwCroc1kIn03Hzy
	9EAA==
X-Gm-Message-State: AE9vXwNvWUMBW1Nl0BaHjr7v5+EZGRt2vlZIWaDd+cK02un23wI2IgXMzOJELucu42uDb0u/
X-Received: by 10.28.54.196 with SMTP id y65mr5140311wmh.73.1473894484027;
	Wed, 14 Sep 2016 16:08:04 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id ya1sm499120wjb.23.2016.09.14.16.08.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Sep 2016 16:08:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 00:08:01 +0100
Message-Id: <1473894481-24491-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] sanity: make license QA failures fatal again
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
X-List-Received-Date: Wed, 14 Sep 2016 23:08:04 -0000

Previous work to clean up the license QA code (oe-core fbdf977) had the side
effect that failing the license sanity check (bad or missing LIC_FILES_CHKSUM)
would emit an error message but wouldn't actually abort the build.

Solve this by changing populate_lic_qa_checksum() so that it tracks if the
message class was in ERROR_QA and if so, aborts the function.

[ YOCTO #10280 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 6772944..2f3f768 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -690,7 +690,7 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
 do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
 python populate_lic_qa_checksum() {
     """
-    Check for changes in the license files 
+    Check for changes in the license files.
     """
     import tempfile
     sane = True
@@ -703,8 +703,7 @@ python populate_lic_qa_checksum() {
         return
 
     if not lic_files and d.getVar('SRC_URI', True):
-        package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
-        return
+        sane = package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
 
     srcdir = d.getVar('S', True)
 
@@ -712,7 +711,7 @@ python populate_lic_qa_checksum() {
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         except bb.fetch.MalformedUrl:
-            package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
+            sane = package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
             continue
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
@@ -736,7 +735,7 @@ python populate_lic_qa_checksum() {
             linesout = 0
             for line in fi:
                 lineno += 1
-                if (lineno >= beginline): 
+                if (lineno >= beginline):
                     if ((lineno <= endline) or not endline):
                         fo.write(line)
                         linesout += 1
@@ -768,7 +767,10 @@ python populate_lic_qa_checksum() {
             else:
                 msg = pn + ": LIC_FILES_CHKSUM is not specified for " +  url
                 msg = msg + "\n" + pn + ": The md5 checksum is " + md5chksum
-            package_qa_handle_error("license-checksum", msg, d)
+            sane = package_qa_handle_error("license-checksum", msg, d)
+
+    if not sane:
+        bb.fatal("Fatal QA errors found, failing task.")
 }
 
 def package_qa_check_staged(path,d):
-- 
2.8.1


