Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.4018.1596888241448470116
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2020 05:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=OwpvuKtT;
 spf=pass (domain: nathanrossi.com, ip: 209.85.215.193, mailfrom: nathan@nathanrossi.com)
Received: by mail-pg1-f193.google.com with SMTP id s15so2371645pgc.8
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2020 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=u/GmxZmlE04BbiRR08QvSoZ+wf9UO87s4526uXpYjjY=;
        b=OwpvuKtT4tM7a8OSxwMM3Y3/3XZdBCLHZltpIElrxxSHB5PWULMnEb+bXDfPH12ho8
         CVcBPgzUpWH2+lmvpSWhE4KY8bGlHh0TlyKFXIqLk7rnuDjQmxnG1SJP/jQTjpY3hxmB
         9bDNIGVeowwLk7/h1e//S6fwZ17pBmQyOYd0j69JYEA5FNdOfY1dbIuiYWGRkctbkWSO
         s6Amf0R1WEzqoEFu14ukbnWSSrFbpFQXc7XzSY47WZfbuTax5GzQS8P3COh0bmgSgoXw
         CEwqAs1ymYyM9XBEQmsihBkLe6gJg4z2Cu/H9kaVmOWro5VqVyZBIQP9igb+ig+Ru2O1
         /3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=u/GmxZmlE04BbiRR08QvSoZ+wf9UO87s4526uXpYjjY=;
        b=i3Imus6hMRjH4Z0TfohjwwUkVEFgm1ZqF8xmIp1ahc9jcESKzdy/xssPlr47nKHeuJ
         hY6ziRUQwFd6sN6sWgAWG5kD1pH3u7bLNZ+yO0DGi/JMew+9wW+dJE2zWoRWbpZiMUNz
         LanMF/7eLvIv4B9+zmyRKOTt01GAiXWhmx8ejuu9IK8a13ThZ+FX/1oGlCQ7D5DccbgI
         92Esm0vE/VPXWO78HdHG8Ng13h40pzxrgd8oUb27U54btznFdpS9DZVleHaTmdsx3N+l
         0tPLzS38MZ5+3P4lt45/XGp8waC+ec8UXVUASlDrlfjkWhb/rRl0xfCor8os8TVScugX
         BEJQ==
X-Gm-Message-State: AOAM532tjoGaDaLTxSrDWqgyfVh3hmD+RCrJmRgg3Pp79HPgk/UOb3W6
	bye7RXPIcai5aDptojhxfBzDTg==
X-Google-Smtp-Source: ABdhPJx0gembZ59shpxFhpYQhSPtyrGxnElkRgvfA8v9CY+L/fsBEP51denEPRasy5cZmDEuH+talg==
X-Received: by 2002:a62:1997:: with SMTP id 145mr6261665pfz.201.1596888240755;
        Sat, 08 Aug 2020 05:04:00 -0700 (PDT)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-68-14.751444.bne.nbn.aussiebb.net. [117.20.68.14])
        by smtp.gmail.com with UTF8SMTPSA id q73sm14808251pjc.11.2020.08.08.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 05:04:00 -0700 (PDT)
Date: Sat, 08 Aug 2020 12:03:51 +0000
Message-Id: <20200808120351.298876-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] python3: Improve handling of python3 manifest generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Specifically cover detection of modules within a python package that do
not import anything within their __init__.py. This is at least the case
with the xmlrpc package which is only used via its modules xmlrpc.server
and xmlrpc.client. Other important corner cases include ctypes.utils
which depends on some modules not used by ctypes.

This is implemented by generally assuming that importing all the modules
of a package (aka *.py within a package, excluding _*.py) will provide
enough information.

Also due to this change some modules import sysconfig, resulting in
sysconfigdata being imported. Handle the conversion of its path to a
wildcard based on the platform dependent name being replaced.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 .../python/python3/get_module_deps3.py                 | 18 ++++++++++++++++--
 .../python/python3/python3-manifest.json               |  2 +-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index fd12baad84..59767046f6 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -9,6 +9,7 @@
 debug=False
 
 import sys
+import os
 
 # We can get a list of the modules which are currently required to run python
 # so we run python-core and get its modules, we then import what we need
@@ -48,8 +49,17 @@ current_module =  str(sys.argv[1]).rstrip()
 if(debug==True):
     log = open('log_%s' % current_module,'w')
     log.write('Module %s generated the following dependencies:\n' % current_module)
-try: 
-    importlib.import_module('%s' % current_module)
+try:
+    importlib.import_module(current_module)
+    m = importlib.import_module(current_module)
+    modulepath = os.path.dirname(m.__file__)
+    for i in os.listdir(modulepath):
+        if not i.startswith("_") and i.endswith(".py") and i != os.path.basename(m.__file__):
+            submodule = "{}.{}".format(current_module, i[:-3])
+            try:
+                importlib.import_module(submodule)
+            except:
+                pass # ignore all import or other exceptions raised during import
 except ImportError as e:
     if (debug==True):
         log.write('Module was not found')
@@ -107,6 +117,8 @@ for item in dif:
         dep_path = dep_path.replace(soabi,'*')
         print (dep_path)
         continue
+    if "_sysconfigdata" in dep_path:
+        dep_path = dep_path.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
 
     if (debug==True):
         log.write(dep_path+'\n')
@@ -140,6 +152,8 @@ for item in dif:
             log.write(cached)
         cached = fix_path(cached)
         cached = cached.replace(cpython_tag,'*')
+        if "_sysconfigdata" in cached:
+            cached = cached.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
         print (cached)
 
 if debug==True:
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 3bcc9b8662..07b084d48c 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -324,7 +324,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
---
2.28.0
