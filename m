Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E5BEA77196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:59:23 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id g62so5361600wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 15:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7kL1/1F5fP1OmnZw1Gw0t532OqOyelhVdg8ocAistZU=;
	b=UuOIeCWx0fd4MH7yo6hWZPl4EbetxkG0QzXfUZqfRw3xK85pojkLeN3MH251oo2GAA
	Kr+3JtD6ItH0KR9aHo0i9/a5O2YbJx57swJyazY91M3p5HRzBgfs/TsPIWPJXGE5YgYk
	WL3oOvok91/2nF01CP/UzrYGon+BbFTpAzgFusgWtaUvpiA1CrjySr6NlwEzYOnYbFTY
	kLdsYa92EiQ3FmQt5ZA5MRXdSR64oA6OQtLRYFmgkQH5C2J/RPT6Gza46sVCo8BRMb4A
	jFh4xUcPcBFuFSN76HrgcyHebnRF0RIK09m0FGYIlKZCvsQKyIuB+w3JI8RAKodt4NrM
	ZdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7kL1/1F5fP1OmnZw1Gw0t532OqOyelhVdg8ocAistZU=;
	b=e0iB23CPnzjcUNddN95okN7gEb0AT+9ulQEs/DDNUqTywcig3qi7i9t1MSJ77UUd5L
	Nv8gBVa425T6k2KzvxPT7dU6mxiOcVGHf2xQK1ezpAywtHKd9HJuX1gGnhDQlOwjJmOq
	++YVprlu0ro9GB6VMJR2UBF8knQ+CVn/YpKHjWFToOaqMfVVuBLcsRAW1q0dEC6UGkqk
	+Vnz2HZErmqdeQIdnoPKkUMrQ/ThxKn4QHAGVFFm7aH19hLMS80edk4ygLC2Vxx39V3k
	g4eu9mnumRzgOC9yB12LHghgHR2WYZfaAGALEH+umsPUDY7q0kK1sK5/m2QsenpvYCXU
	siqw==
X-Gm-Message-State: AG10YOTA7byNJYEh3N+7xWrNetKVORQAQoH88qgWYkyfX+i0ViFsMZqsqphxTle2AHHpkzxd
X-Received: by 10.194.120.229 with SMTP id lf5mr46812853wjb.151.1456358364160; 
	Wed, 24 Feb 2016 15:59:24 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l132sm495307wmf.7.2016.02.24.15.59.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 15:59:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 23:59:21 +0000
Message-Id: <1456358361-21167-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] uninative.bbclass: if the loader can't be found disable instead of failing
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
X-List-Received-Date: Wed, 24 Feb 2016 23:59:24 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uninative.bbclass | 64 +++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 270c1b0..0ca59d0 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -1,5 +1,3 @@
-NATIVELSBSTRING = "universal"
-
 UNINATIVE_LOADER ?= "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
 
 UNINATIVE_URL ?= "unset"
@@ -13,19 +11,16 @@ addhandler uninative_eventhandler
 uninative_eventhandler[eventmask] = "bb.event.BuildStarted"
 
 python uninative_eventhandler() {
-    loader = e.data.getVar("UNINATIVE_LOADER", True)
+    enabled = True
+
+    loader = d.getVar("UNINATIVE_LOADER", True)
     tarball = d.getVar("UNINATIVE_TARBALL", True)
     tarballdir = d.getVar("UNINATIVE_DLDIR", True)
     tarballpath = os.path.join(tarballdir, tarball)
 
     if not os.path.exists(loader):
-        import subprocess
-
-        olddir = os.getcwd()
+        # If the tarball doesn't exist, try to fetch it.
         if not os.path.exists(tarballpath):
-            # Copy the data object and override DL_DIR and SRC_URI
-            localdata = bb.data.createCopy(d)
-
             if d.getVar("UNINATIVE_URL", True) == "unset":
                 bb.fatal("Uninative selected but not configured, please set UNINATIVE_URL")
 
@@ -33,31 +28,48 @@ python uninative_eventhandler() {
             if not chksum:
                 bb.fatal("Uninative selected but not configured correctly, please set UNINATIVE_CHECKSUM[%s]" % d.getVar("BUILD_ARCH", True))
 
-            srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};md5sum=%s" % chksum)
-            localdata.setVar('FILESPATH', tarballdir)
-            localdata.setVar('DL_DIR', tarballdir)
-            bb.note("Fetching uninative binary shim from %s" % srcuri)
-            fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
             try:
+                # Save and restore cwd as Fetch.download() does a chdir()
+                olddir = os.getcwd()
+
+                localdata = bb.data.createCopy(d)
+                localdata.setVar('FILESPATH', "")
+                localdata.setVar('DL_DIR', tarballdir)
+
+                srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};md5sum=%s" % chksum)
+                bb.note("Fetching uninative binary shim from %s" % srcuri)
+
+                fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
                 fetcher.download()
                 localpath = fetcher.localpath(srcuri)
                 if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
                     os.symlink(localpath, tarballpath)
             except Exception as exc:
-                bb.fatal("Unable to download uninative tarball: %s" % str(exc))
-
-        cmd = e.data.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative")
-        try:
-            subprocess.check_call(cmd, shell=True)
-        except subprocess.CalledProcessError as exc:
-            bb.fatal("Unable to install uninative tarball: %s" % str(exc))
-        os.chdir(olddir)
+                bb.warn("Unable to download uninative tarball: %s" % str(exc))
+                enabled = False
+            finally:
+                os.chdir(olddir)
+
+        # If we're still enabled then the fetch didn't fail, so unpack the tarball
+        if enabled:
+            import subprocess
+            try:
+                cmd = d.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative")
+                subprocess.check_call(cmd, shell=True)
+            except subprocess.CalledProcessError as exc:
+                bb.warn("Unable to install uninative tarball: %s" % str(exc))
+                enabled = False
+
+    if enabled:
+        bb.note("Enabling uninative")
+        d.setVar("NATIVELSBSTRING", "universal")
+        d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
+        d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
+    else:
+        bb.warn("Uninative selected but the loader isn't present and can't be downloaded.  Disabling uninative.\n"
+                "To build your own uninative loader, please bitbake uninative-tarball and set UNINATIVE_TARBALL appropriately.")
 }
 
-SSTATEPOSTUNPACKFUNCS_append = " uninative_changeinterp"
-
-PATH_prepend = "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:"
-
 python uninative_changeinterp () {
     import subprocess
     import stat
-- 
2.7.0


