Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id F2A116FF25
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 16:48:40 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so36157516wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 08:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9wHXlBeMQ3V9KYjJd6ZkGRyzbFj9X3BzudSp0AAuRxI=;
	b=MTTpBn9TF7MvouMJ3Z3l9tIMipqywSoJ4yBwIMQIl2ImKLKsBPIYWzMMvJOwAm7S/D
	s2o6KTYzyQIq1aZxPL8F21N/+yxqIbA7r3ShfB3HxKNC2UEdDgv79XFRYPT823SrC4Et
	n6qOyfbdN+ZONiieRqP41249dMkeZ9u9oEdbnp/0dbnLvBVLXDoIJQt4CSh2anCHewfy
	8QKLVWehw3CZ9DuyGjywlc4Sj0Voy2WZ4CJUbD2eUNy0QsE5riHF0PULitsUHA90D0WS
	cJi9Mapq5eM4/p6eMZmVfBbjQE4xytk4dZ/MwmVdDO03NLIH27bE4eWF2S6G9IBdKUNu
	BCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9wHXlBeMQ3V9KYjJd6ZkGRyzbFj9X3BzudSp0AAuRxI=;
	b=TsAiwjMwxc0cBN2rN0ibfJBnsf50zHccGhIYpTvOtfNSvZvkVurQ7ioPTdDT38HDZI
	zqRStch+3fifUWB5DvxWSbfPC5SwiRx0YZzVFuqC6pcdMLpG2zsfDpcTuv6KPfrvb4tt
	LMenQd/kfU5E9JTz3sp7jGpu2hqopnD+2joxwFEU46QAhwL0AH0OCPJh24y8MN5hy5EX
	13f4OsTGNlPsQr3nPmKIQQFuw+yqKGWzSF5hgC/jFfzGVhOvcMQwoeYccTgsPZ89lOny
	etnyOHtOLizinP8sCtsFnDljRzas/ZvbxKrOjW+v3TcxVnxHBV7N1SkTrUkqkaX9QRhJ
	98Qg==
X-Gm-Message-State: AD7BkJKAkloL8hcNFCFYIRRKocPlZ/Q94NO/CXNQk/nfmaIZrp7M+ZeK4IKkKylL8OpF8xRk
X-Received: by 10.28.213.142 with SMTP id m136mr6509767wmg.24.1457110120803;
	Fri, 04 Mar 2016 08:48:40 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p191sm4173334wmb.0.2016.03.04.08.48.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 08:48:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 16:48:37 +0000
Message-Id: <1457110117-11218-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] uninative: correctly enable uninative
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
X-List-Received-Date: Fri, 04 Mar 2016 16:48:42 -0000

The previous attempt at soft-failing when uninative was enabled didn't actually
work, because the workers didn't evaluate the function that actually enabled
uninative.

In a BuildStarted handler we can check if we need to download or extract the
uninative tarball.

In a ConfigParsed handler on the workers we can check if the uninative loader is
present, and if so enable it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uninative.bbclass | 91 +++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 40 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 471c9ae..369225f 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -7,19 +7,30 @@ UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
 #UNINATIVE_CHECKSUM[x86_64] = "dead"
 UNINATIVE_DLDIR ?= "${DL_DIR}"
 
-addhandler uninative_eventhandler
-uninative_eventhandler[eventmask] = "bb.event.BuildStarted"
+addhandler uninative_event_fetchloader
+uninative_event_fetchloader[eventmask] = "bb.event.BuildStarted"
 
-python uninative_eventhandler() {
-    enabled = True
+addhandler uninative_event_enable
+uninative_event_enable[eventmask] = "bb.event.ConfigParsed"
+
+python uninative_event_fetchloader() {
+    """
+    This event fires on the parent and will try to fetch the tarball if the
+    loader isn't already present.
+    """
 
     loader = d.getVar("UNINATIVE_LOADER", True)
-    tarball = d.getVar("UNINATIVE_TARBALL", True)
-    tarballdir = d.getVar("UNINATIVE_DLDIR", True)
-    tarballpath = os.path.join(tarballdir, tarball)
+    if os.path.exists(loader):
+        return
+
+    try:
+        # Save and restore cwd as Fetch.download() does a chdir()
+        olddir = os.getcwd()
+
+        tarball = d.getVar("UNINATIVE_TARBALL", True)
+        tarballdir = d.getVar("UNINATIVE_DLDIR", True)
+        tarballpath = os.path.join(tarballdir, tarball)
 
-    if not os.path.exists(loader):
-        # If the tarball doesn't exist, try to fetch it.
         if not os.path.exists(tarballpath):
             if d.getVar("UNINATIVE_URL", True) == "unset":
                 bb.fatal("Uninative selected but not configured, please set UNINATIVE_URL")
@@ -28,46 +39,46 @@ python uninative_eventhandler() {
             if not chksum:
                 bb.fatal("Uninative selected but not configured correctly, please set UNINATIVE_CHECKSUM[%s]" % d.getVar("BUILD_ARCH", True))
 
-            try:
-                # Save and restore cwd as Fetch.download() does a chdir()
-                olddir = os.getcwd()
 
-                localdata = bb.data.createCopy(d)
-                localdata.setVar('FILESPATH', "")
-                localdata.setVar('DL_DIR', tarballdir)
+            localdata = bb.data.createCopy(d)
+            localdata.setVar('FILESPATH', "")
+            localdata.setVar('DL_DIR', tarballdir)
 
-                srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};md5sum=%s" % chksum)
-                bb.note("Fetching uninative binary shim from %s" % srcuri)
+            srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};md5sum=%s" % chksum)
+            bb.note("Fetching uninative binary shim from %s" % srcuri)
 
-                fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
-                fetcher.download()
-                localpath = fetcher.localpath(srcuri)
-                if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
+            fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
+            fetcher.download()
+            localpath = fetcher.localpath(srcuri)
+            if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
                     os.symlink(localpath, tarballpath)
-            except Exception as exc:
-                bb.warn("Unable to download uninative tarball: %s" % str(exc))
-                enabled = False
-            finally:
-                os.chdir(olddir)
-
-        # If we're still enabled then the fetch didn't fail, so unpack the tarball
-        if enabled:
-            import subprocess
-            try:
-                cmd = d.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative")
-                subprocess.check_call(cmd, shell=True)
-            except subprocess.CalledProcessError as exc:
-                bb.warn("Unable to install uninative tarball: %s" % str(exc))
-                enabled = False
 
-    if enabled:
+        import subprocess
+        cmd = d.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative")
+        subprocess.check_call(cmd, shell=True)
+
+    except bb.fetch2.BBFetchException as exc:
+        bb.warn("Disabling uninative as unable to fetch uninative tarball: %s" % str(exc))
+        bb.warn("To build your own uninative loader, please bitbake uninative-tarball and set UNINATIVE_TARBALL appropriately.")
+    except subprocess.CalledProcessError as exc:
+        bb.warn("Disabling uninative as unable to install uninative tarball: %s" % str(exc))
+        bb.warn("To build your own uninative loader, please bitbake uninative-tarball and set UNINATIVE_TARBALL appropriately.")
+    finally:
+        os.chdir(olddir)
+}
+
+python uninative_event_enable() {
+    """
+    This event handler is called in the workers and is responsible for setting
+    up uninative if a loader is found.
+    """
+
+    loader = d.getVar("UNINATIVE_LOADER", True)
+    if os.path.exists(loader):
         bb.debug(2, "Enabling uninative")
         d.setVar("NATIVELSBSTRING", "universal")
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
         d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
-    else:
-        bb.warn("Uninative selected but the loader isn't present and can't be downloaded.  Disabling uninative.\n"
-                "To build your own uninative loader, please bitbake uninative-tarball and set UNINATIVE_TARBALL appropriately.")
 }
 
 python uninative_changeinterp () {
-- 
2.7.0


