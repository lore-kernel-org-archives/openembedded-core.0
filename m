Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.37584.1589787164123088862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 00:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04I7WCZw014805
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 00:32:33 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 18 May 2020 00:32:18 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3: add pydoc and urllib to core
Date: Mon, 18 May 2020 15:32:01 +0800
Message-ID: <20200518073201.23647-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add pydoc and urllib to core to fix below error:
 # python3
 >>> help()
 Traceback (most recent call last):
 File "<stdin>", line 1, in <module>
 File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __call_
 import pydoc
 ModuleNotFoundError: No module named 'pydoc'
 File "/usr/lib64/python3.8/pydoc.py", line 72, in <module>
 import urllib.parse
 ModuleNotFoundError: No module named 'urllib'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python3/python3-manifest.json      | 24 +++++--------------
 meta/recipes-devtools/python/python3_3.8.2.bb |  3 +--
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 3bcc9b8662..808eadb8f6 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -203,6 +203,7 @@
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
             "${bindir}/python3",
+            "${bindir}/pydoc*",
             "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
             "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
             "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
@@ -289,6 +290,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
             "${libdir}/python${PYTHON_MAJMIN}/re.py",
             "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
@@ -313,8 +315,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
             "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
             "${libdir}/python${PYTHON_MAJMIN}/types.py",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data",
             "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
         ],
         "cached": [
@@ -363,6 +368,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
@@ -798,7 +804,6 @@
             "plistlib",
             "pprint",
             "profile",
-            "pydoc",
             "resource",
             "shell",
             "smtpd",
@@ -857,8 +862,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
         "cached": [
@@ -989,21 +992,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
         ]
     },
-    "pydoc": {
-        "summary": "Python interactive help support",
-        "rdepends": [
-            "core",
-            "netclient"
-        ],
-        "files": [
-            "${bindir}/pydoc*",
-            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
-        ]
-    },
     "resource": {
         "summary": "Python resource control interface",
         "rdepends": [
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index a4a16fd495..36aa54ba6c 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -318,7 +318,6 @@ RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " openssl ca-certificates"
 FILES_${PN} = ""
 RPROVIDES_${PN}-modules = "${PN}"
 
-FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
 
 # provide python-pyvenv from python3-venv
@@ -332,7 +331,7 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
-RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
+RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pickle python3-audio"
 RDEPENDS_${PN}-modules_append_class-target = " python3-misc"
 RDEPENDS_${PN}-modules_append_class-nativesdk = " python3-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
-- 
2.24.1

