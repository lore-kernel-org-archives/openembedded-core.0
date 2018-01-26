Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 06950786D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 12:25:07 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f3so20894873wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 04:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6F0iQAsl/SeXvCAeptva6Cv85Za5ygvv3UdAIojksps=;
	b=mZmMpz/mgI5RvY7tb8C63oseP3qsZccdClgueVrdotnW7C8UdVDzoVOUQh9YoLZYZa
	JhvekkqIMogFMzm9vKsIX8+2whV80nZPt7bDPP/Ny6xaWJjjGIz2d9wGrKBRSfS4Y8m0
	xu0cqJ2ogSHiaGM8JgHAQIYT/oU5+ksiT+YdO5DykLhQ4U1xBtNZrsHaU7vNTJeWDxrP
	CZFdtesvICYeVWZbtshb5PPv7Lf/3sjvy2xz5XZES6klgEZ7aluZGywYgNln4a73l8A+
	6NPe3MRHJYTW32M0OV2Y8TRH0/LRVSo6ihGhyz5lhulHG9Z7H0aoZJzzjZxrj47QZ8TN
	g/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6F0iQAsl/SeXvCAeptva6Cv85Za5ygvv3UdAIojksps=;
	b=WNxGE2fu+KeiIDuaEx/Ne79QpFrZuoZJJSK2WOpGL6kBhlaiwIOYv5Pyfx5x1qvB9u
	rWUoXadomfRvATioXSV1Vhe69Se1UGhlIcoPNBKlX0MjOzXtTl4XcaMm1ae9IYPFiLqz
	WGrGu0+iSfPpzDfRPjoUGX5UmU+NfEXLofs7MsuQEvwEjAbrzFn2iWzSM7rwLZXrddS/
	QqLMcZBDh9SwcjjFPCAAgYbxQSPwwb9DY5H1M8zA8cUgjCRcQ/yPlDlyjNWhi9A5pHSm
	Z41lp6jgVhKF1qx7AT8YwWfXZFC2VpCFFT2sz4cZzrfl8QrNSpVQlY4CJ+XHL/yhLJa4
	V7pw==
X-Gm-Message-State: AKwxytfSqdQ4nCFwmEJkj91cp0tbFTDDnbEAUd6PLEKlHGf+W83cDHNR
	WuUKjMTvUqY7Wurue+ssfwFkOQMQ
X-Google-Smtp-Source: AH8x224DySgWh6hqQP8PxqLPIN7UpriM6yAAEkaJByO0UPZDxszt3zRg9IczjCQRV6dPNtdaj4Y1CA==
X-Received: by 10.28.31.212 with SMTP id f203mr9606320wmf.122.1516969508018;
	Fri, 26 Jan 2018 04:25:08 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	u36sm1094608wrf.63.2018.01.26.04.25.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 04:25:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jan 2018 12:25:02 +0000
Message-Id: <20180126122502.15930-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python: fix parse dependencies
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
X-List-Received-Date: Fri, 26 Jan 2018 12:25:08 -0000

Adding a file-checksums flag for the manifest to do_split_packages doesn't
achieve anything as do_split_packages isn't a task.  Changing this to tha task
do_package shows that the path is wrong, but we also know that as the manifest
is in SRC_URI any changes to it would result in a rebuild anyway, so this line
can be deleted.

However there is a problem of the recipe not being reparsed when it needs to be,
if the JSON has changed.  The main bitbake process can hash the recipe and use
stale data from the cache as it hasn't considered the manifest file changing.  This
results in non-determinism warnings when the worker parses the recipe again and
comes to a different hash (as the manifest has changed, so the packaging
changed).

Solve this by calling bb.parse.mark_dependency() to declare the dependency on
the manifest.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.3.bb | 45 +++++++++++++--------------
 meta/recipes-devtools/python/python_2.7.13.bb | 38 +++++++++++-----------
 2 files changed, 39 insertions(+), 44 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 970ba634450..3ae0db2b8b2 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -228,21 +228,22 @@ FILES_${PN}-man = "${datadir}/man"
 BBCLASSEXTEND = "nativesdk"
 
 RPROVIDES_${PN} += "${PN}-modules"
-    
+
 # We want bytecode precompiled .py files (.pyc's) by default
 # but the user may set it on their own conf
-            
 INCLUDE_PYCS ?= "1"
 
 python(){
+    import json
 
-    pythondir = d.getVar('THISDIR',True)
+    filename = os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')
+    # This python changes the datastore based on the contents of a file, so mark
+    # that dependency.
+    bb.parse.mark_dependency(d, filename)
 
-    # Read JSON manifest
-    import json
-    with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
+    with open(filename) as manifest_file:
         python_manifest=json.load(manifest_file)
-        
+
     include_pycs = d.getVar('INCLUDE_PYCS')
 
     packages = d.getVar('PACKAGES').split()
@@ -282,28 +283,24 @@ python(){
     d.setVar('PACKAGES', ' '.join(packages))
     d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
 }
-do_split_packages[file-checksums] += "${THISDIR}/python/python3-manifest.json:True"
-
-
 
 # Files needed to create a new manifest
 SRC_URI += "file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json"
 
 do_create_manifest() {
-
-# This task should be run with every new release of Python.
-# We must ensure that PACKAGECONFIG enables everything when creating
-# a new manifest, this is to base our new manifest on a complete
-# native python build, containing all dependencies, otherwise the task
-# wont be able to find the required files.
-# e.g. BerkeleyDB is an optional build dependency so it may or may not
-# be present, we must ensure it is.
-
-cd ${WORKDIR}
-# This needs to be executed by python-native and NOT by HOST's python
-nativepython3 create_manifest3.py
-cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
-}                   
+    # This task should be run with every new release of Python.
+    # We must ensure that PACKAGECONFIG enables everything when creating
+    # a new manifest, this is to base our new manifest on a complete
+    # native python build, containing all dependencies, otherwise the task
+    # wont be able to find the required files.
+    # e.g. BerkeleyDB is an optional build dependency so it may or may not
+    # be present, we must ensure it is.
+
+    cd ${WORKDIR}
+    # This needs to be executed by python-native and NOT by HOST's python
+    nativepython3 create_manifest3.py
+    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
+}
 
 # bitbake python -c create_manifest
 addtask do_create_manifest
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index dbafb955f90..337c7447bb6 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -202,12 +202,14 @@ RPROVIDES_${PN} += "${PN}-modules"
 INCLUDE_PYCS ?= "1"
 
 python(){
+    import json
 
-    pythondir = d.getVar('THISDIR',True)
+    filename = os.path.join(d.getVar('THISDIR'), 'python', 'python2-manifest.json')
+    # This python changes the datastore based on the contents of a file, so mark
+    # that dependency.
+    bb.parse.mark_dependency(d, filename)
 
-    # Read JSON manifest
-    import json
-    with open(pythondir+'/python/python2-manifest.json') as manifest_file:
+    with open(filename) as manifest_file:
         python_manifest=json.load(manifest_file)
 
     include_pycs = d.getVar('INCLUDE_PYCS')
@@ -215,7 +217,6 @@ python(){
     packages = d.getVar('PACKAGES').split()
     pn = d.getVar('PN')
 
-
     newpackages=[]
 
     for key in python_manifest:
@@ -250,25 +251,22 @@ python(){
     d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
 }
 
-do_split_packages[file-checksums] += "${THISDIR}/python/python2-manifest.json:True"
-
 # Files needed to create a new manifest
 SRC_URI += "file://create_manifest2.py file://get_module_deps2.py file://python2-manifest.json"
 
 do_create_manifest() {
-
-# This task should be run with every new release of Python.
-# We must ensure that PACKAGECONFIG enables everything when creating 
-# a new manifest, this is to base our new manifest on a complete
-# native python build, containing all dependencies, otherwise the task
-# wont be able to find the required files.
-# e.g. BerkeleyDB is an optional build dependency so it may or may not
-# be present, we must ensure it is. 
-
-cd ${WORKDIR}
-# This needs to be executed by python-native and NOT by HOST's python
-nativepython create_manifest2.py
-cp python2-manifest.json.new ${THISDIR}/python/python2-manifest.json
+    # This task should be run with every new release of Python.
+    # We must ensure that PACKAGECONFIG enables everything when creating
+    # a new manifest, this is to base our new manifest on a complete
+    # native python build, containing all dependencies, otherwise the task
+    # wont be able to find the required files.
+    # e.g. BerkeleyDB is an optional build dependency so it may or may not
+    # be present, we must ensure it is.
+
+    cd ${WORKDIR}
+    # This needs to be executed by python-native and NOT by HOST's python
+    nativepython create_manifest2.py
+    cp python2-manifest.json.new ${THISDIR}/python/python2-manifest.json
 }
 
 # bitbake python -c create_manifest
-- 
2.11.0


