Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.44100.1597063668667364115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 05:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=WGpD7DUk;
 spf=pass (domain: nathanrossi.com, ip: 209.85.210.180, mailfrom: nathan@nathanrossi.com)
Received: by mail-pf1-f180.google.com with SMTP id x25so1811263pff.4
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2020 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=n8npg9TPYhlbFK1Sem69jEoxA6OmifN7fGQZJ6nDANs=;
        b=WGpD7DUkEJjHC8mcoE+qQq8e6B0Sp3bZXmQe+KAeXhVEZhcnkMeYaBZbVi1XyBflZA
         cn8Q69+xK1ixfxLZQNNQO8NTGPXaGn6AATB/D31Z3uo4ekjY84IxX8bKMcHE7Vrf4Msb
         SZk4ug8MR+R8O4pNi+XVoy0TVLN71IDESxANuZGIxOFf69yiMyjC3FeoU8XkScLWLscA
         adj9JX5E43+GROPrJQmhPwgMfWBiLKyIiaZz/U1U3FJZlC0RipWEbS8mVBVGH6iF2Ep3
         nc+1VEezJwQOgVSVlajRJpNeLrJ/4SkTk9klNdb2Xvgz8Bkqi/LsIZeaByPiZZuIIoqn
         VB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=n8npg9TPYhlbFK1Sem69jEoxA6OmifN7fGQZJ6nDANs=;
        b=hVNg6yYzWOu/b2VKCS7K2NO5VEa9rmsEGYzM0VN4Gs8coEcIyPjrDNVe8ywfbYE6JY
         8NK0DtWZ2mbNGWaPFecqwQloVv0lrkV8+zVUqwhjQJ/VfgTR7AT/U+IU76E+aWg1t1ls
         gIQUinFq4Qoh9g7NHAcQvfi4oUnrMTd6oYkkUySWToDOc5ypv/V3zBW6FY+k2h2/vbqg
         qVkY9HBaeJOY10gQ2Ln7X9Ohc/LGIfKz2HdQ3uZVEARi2gWGXeez9ibHPpb5hVRB1QmO
         4turq568scOKS+yL0vbWFuofEtOsZ6VPfKR9cBoG2touV8U4hiLcGpCyE71LoPnKx4MB
         ELAw==
X-Gm-Message-State: AOAM530WR4rCZ3BZ4g7dIfnrQ5n914wcVK/zrRvZRBPP0tP5UdETi5uB
	RlbUVSNIdJN7JXyCDhNLu2u1qw==
X-Google-Smtp-Source: ABdhPJy/2OANv/QZHBUpw9unXmbBZ9H05qecTo6eRIe2LRZY1/ywYfT6D7SBhD7Nr5lb9vjvwqmP6A==
X-Received: by 2002:a63:3241:: with SMTP id y62mr4047108pgy.305.1597063667890;
        Mon, 10 Aug 2020 05:47:47 -0700 (PDT)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-68-14.751444.bne.nbn.aussiebb.net. [117.20.68.14])
        by smtp.gmail.com with UTF8SMTPSA id 13sm22977019pfp.3.2020.08.10.05.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 05:47:47 -0700 (PDT)
Date: Mon, 10 Aug 2020 12:47:36 +0000
Message-Id: <20200810124736.84643-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH v2 1/2] python3: Improve handling of python3 manifest generation
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
Changes in v2:
- Remove duplicate importlib.import_module()
- Only treat imports which are "__init__.py" files as python packages
  for which to import child modules for
- Add additional patch to this series for updating the manifest due to
  the updated dependency logic and other minor fixes
---
 .../python/python3/get_module_deps3.py               | 20 ++++++++++++++++++--
 .../python/python3/python3-manifest.json             |  2 +-
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index fd12baad84..6806f23172 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -9,6 +9,7 @@
 debug=False
 
 import sys
+import os
 
 # We can get a list of the modules which are currently required to run python
 # so we run python-core and get its modules, we then import what we need
@@ -48,8 +49,19 @@ current_module =  str(sys.argv[1]).rstrip()
 if(debug==True):
     log = open('log_%s' % current_module,'w')
     log.write('Module %s generated the following dependencies:\n' % current_module)
-try: 
-    importlib.import_module('%s' % current_module)
+try:
+    m = importlib.import_module(current_module)
+    # handle python packages which may not include all modules in the __init__
+    if os.path.basename(m.__file__) == "__init__.py":
+        modulepath = os.path.dirname(m.__file__)
+        for i in os.listdir(modulepath):
+            if i.startswith("_") or not(i.endswith(".py")):
+                continue
+            submodule = "{}.{}".format(current_module, i[:-3])
+            try:
+                importlib.import_module(submodule)
+            except:
+                pass # ignore all import or other exceptions raised during import
 except ImportError as e:
     if (debug==True):
         log.write('Module was not found')
@@ -107,6 +119,8 @@ for item in dif:
         dep_path = dep_path.replace(soabi,'*')
         print (dep_path)
         continue
+    if "_sysconfigdata" in dep_path:
+        dep_path = dep_path.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
 
     if (debug==True):
         log.write(dep_path+'\n')
@@ -140,6 +154,8 @@ for item in dif:
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
