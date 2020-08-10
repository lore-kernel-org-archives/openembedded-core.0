Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.44101.1597063672826169268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 05:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=GFssgLLD;
 spf=pass (domain: nathanrossi.com, ip: 209.85.216.47, mailfrom: nathan@nathanrossi.com)
Received: by mail-pj1-f47.google.com with SMTP id f9so4978677pju.4
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2020 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:in-reply-to:references:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=QGM2jJpSQRAkpmPmRA2CnQ1fcA1h9BiadkCFStfePmM=;
        b=GFssgLLDdq8uDySL0ziPcuBsQcIWj3Pd6+dHl0v5K8rXQOmLLjR6/D3TQq33Vi0li1
         CQUUws5eZ0iB4bQisyzYoAsnpBQ0usjqOOml4qJWh+CZh0HgR42i6g3DSL6F7dD/YBZB
         LpPus97s4s7CnWfJ5AW3pMFYRsTp8dblTOnQSkDU1EuCoe9XdppQU91KhL6lll7BXXtU
         ELJy8ztmXL/7jRRScFFOP1r+EMEqWHomAmKdozN/xcDLJ2zXPZsiFWKUnsCaTyZE+AGh
         hF5GCI+m82jfM5nuYwms+5y/QUtNByS/CU+FsCDAQh4AQakuIaY8CsVCPIRWocN6tcTz
         lNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
         :cc:subject:content-transfer-encoding:mime-version;
        bh=QGM2jJpSQRAkpmPmRA2CnQ1fcA1h9BiadkCFStfePmM=;
        b=VYOJFtOLigMtEOBT4QWhpva1xSQQ3xboP3Dgl7BPkiceWcpAgGlDYQwqaIr6Uh46Os
         W2jQF64BYAZ0R0YTOJwQI61I9DGwxAHWjzMwk+G7yAW3bI0tPSybcSU+AV4Vzy6iYJ0j
         DtbyVjm1vbfICPnwES6uUof3MFbfrqPUdlu5Dw7bfNzMFDJd0fULnANMxxCHn7YWWPa8
         5SH57tjIPOPpOZVQcYMeb651/fYwgx1i7atT3+wood7iFJTkugbT8Kry+2p/CFqb4RhB
         9Dw8V+m/z/gh3/tRF9wp3OZQym/GxAqrwqJp+3ZzJ5etHomHb4t9fzDSbjBUj8xCOsiu
         ymfw==
X-Gm-Message-State: AOAM531YtDauFn7EtdqGuTTLELdRgXyBh9HWh+7cM2xYyWfSbPdtcHt4
	Cmrnc3FFOPapx2ZXtL66cUGZjQ==
X-Google-Smtp-Source: ABdhPJwZDJ1lA2ssjzoxx93xYjedHlfVssKX4zgPekDYhFKN4b/eGR8VntsdWBpXF2bpOMN7ZYc2hw==
X-Received: by 2002:a17:90a:22cd:: with SMTP id s71mr27319718pjc.217.1597063672257;
        Mon, 10 Aug 2020 05:47:52 -0700 (PDT)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-68-14.751444.bne.nbn.aussiebb.net. [117.20.68.14])
        by smtp.gmail.com with UTF8SMTPSA id g15sm22545197pfh.70.2020.08.10.05.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 05:47:51 -0700 (PDT)
Date: Mon, 10 Aug 2020 12:47:36 +0000
Message-Id: <20200810124736.84643-2-nathan@nathanrossi.com>
In-Reply-To: <20200810124736.84643-1-nathan@nathanrossi.com>
References: <20200810124736.84643-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH v2 2/2] python3-manifest.json: Updates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

- Regenerate using create_manifest
- Fix up some indentation compared to generated
- Add "secrets" module into netclient package (introduced in 3.6)
- Move "urllib" python package into core package, it is used more
  commonly than just netclient (e.g. email, xml, mimetypes, pydoc)
- Update compression package dependencies due to some modules moving
  into core package
- Update dependencies due to improvements to get_module_deps handling
  modules of a python package (e.g. ctypes.utils)

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 .../python/python3/python3-manifest.json           | 66 ++++++++++++++++------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 07b084d48c..69aecb7004 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -285,7 +285,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/operator.py",
             "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/os.py",
-	    "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
@@ -313,6 +313,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
             "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
             "${libdir}/python${PYTHON_MAJMIN}/types.py",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
             "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
             "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
@@ -359,7 +361,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
-	    "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pathlib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pathlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
@@ -397,7 +399,9 @@
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc"
         ]
     },
     "crypt": {
@@ -427,7 +431,10 @@
     "ctypes": {
         "summary": "Python C types support",
         "rdepends": [
-            "core"
+            "core",
+            "crypt",
+            "io",
+            "math"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ctypes",
@@ -537,7 +544,10 @@
     "distutils": {
         "summary": "Python Distribution Utilities",
         "rdepends": [
-            "core"
+            "compression",
+            "core",
+            "email",
+            "stringold"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/distutils"
@@ -548,7 +558,6 @@
         "summary": "Python framework for running examples in docstrings",
         "rdepends": [
             "asyncio",
-            "compression",
             "core",
             "debugger",
             "difflib",
@@ -577,7 +586,9 @@
             "datetime",
             "io",
             "math",
-            "netclient"
+            "mime",
+            "netclient",
+            "stringold"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -648,7 +659,6 @@
     "io": {
         "summary": "Python low-level I/O",
         "rdepends": [
-            "compression",
             "core",
             "crypt",
             "math",
@@ -690,7 +700,11 @@
         "summary": "Python logging support",
         "rdepends": [
             "core",
-            "stringold"
+            "io",
+            "netserver",
+            "pickle",
+            "stringold",
+            "threading"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/logging"
@@ -824,11 +838,18 @@
         "summary": "Python multiprocessing support",
         "rdepends": [
             "core",
+            "crypt",
+            "ctypes",
             "io",
-            "pickle"
+            "math",
+            "mmap",
+            "netclient",
+            "pickle",
+            "threading"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixshmem.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/multiprocessing"
         ],
         "cached": []
@@ -855,10 +876,9 @@
             "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
             "${libdir}/python${PYTHON_MAJMIN}/nntplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/secrets.py",
             "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
         "cached": [
@@ -868,6 +888,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/nntplib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
@@ -876,7 +897,6 @@
     "netserver": {
         "summary": "Python Internet Protocol servers",
         "rdepends": [
-            "compression",
             "core",
             "crypt",
             "datetime",
@@ -992,8 +1012,7 @@
     "pydoc": {
         "summary": "Python interactive help support",
         "rdepends": [
-            "core",
-            "netclient"
+            "core"
         ],
         "files": [
             "${bindir}/pydoc*",
@@ -1017,7 +1036,6 @@
     "shell": {
         "summary": "Python shell-like functionality",
         "rdepends": [
-            "compression",
             "core",
             "stringold"
         ],
@@ -1150,7 +1168,6 @@
         "summary": "Python unit testing framework",
         "rdepends": [
             "asyncio",
-            "compression",
             "core",
             "difflib",
             "io",
@@ -1185,7 +1202,6 @@
     "venv": {
         "summary": "Provides support for creating lightweight virtual environments with their own site directories, optionally isolated from system site directories.",
         "rdepends": [
-            "compression",
             "core",
             "logging",
             "stringold"
@@ -1211,7 +1227,21 @@
     "xmlrpc": {
         "summary": "Python XML-RPC support",
         "rdepends": [
+            "compression",
             "core",
+            "crypt",
+            "datetime",
+            "email",
+            "fcntl",
+            "html",
+            "io",
+            "math",
+            "mime",
+            "netclient",
+            "netserver",
+            "numbers",
+            "pydoc",
+            "stringold",
             "xml"
         ],
         "files": [
---
2.28.0
