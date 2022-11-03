Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3617BC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 12:28:22 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.18510.1667478486969671390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 05:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=cUC0T9Yo;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BVxId7hvS0a9z+IdnE7PQ7qn374My27aLCto+w3EmUI=; b=cUC0T9YoWujl2jgiP75p5Y5PHc
	PifMfU7Iafv5BNLe4Rw2eXCtZNEdVp/COUytzgD2WzYGxbdnFLtaMZxZjpjGb0k84yA9hWajqu7oE
	pN+V1k4o/8ZtoEXXUOBloFCOAGYmpmu0meLk1p22CJjfH2fbRH3AvsJumsguubl1JnEaC/Lzivijg
	VCdfQVFYq1aB6xXSy2PIsNbWGiDXaOEPCd1WBc+q9OxPbFbu+p26C17eLzrs/SLqPJSPHif0gWyDX
	lwrNWhmSB/top5z5nvSJFhgos2geU6m0OMOLstS++F5QqL7xcEsNjNuAz5VaQhpa2w/x/UGoh7Sa+
	ZbxCxPig==;
Received: from lan.nucleusys.com ([92.247.61.126]:34406 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oqZLp-0000fT-ME;
	Thu, 03 Nov 2022 14:28:05 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCHv3] python3-manifest.json: Fix re in core
Date: Thu,  3 Nov 2022 14:27:55 +0200
Message-Id: <20221103122755.3818894-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 12:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172624

Following the update from 3.10.6 to 3.11.0, the source code of
module re for regular expression operations has been moved to
Lib/re/. File python3-manifest.json has been modified according
to the new path.

According to the instructions the new python3-manifest.json
version was created by running bitbake python3 -c create_manifest.
Because of this it also updated other files and rdepends in it.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3/python3-manifest.json      | 74 +++++++++++--------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 02c918d6e5..64203cf0fc 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -246,6 +246,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/heapq.py",
             "${libdir}/python${PYTHON_MAJMIN}/imp.py",
             "${libdir}/python${PYTHON_MAJMIN}/importlib",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap.py",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap_external.py",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/abc.py",
@@ -266,6 +267,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
@@ -290,7 +292,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
-            "${libdir}/python${PYTHON_MAJMIN}/re.py",
+            "${libdir}/python${PYTHON_MAJMIN}/re",
+            "${libdir}/python${PYTHON_MAJMIN}/re/_casefix.py",
+            "${libdir}/python${PYTHON_MAJMIN}/re/_compiler.py",
+            "${libdir}/python${PYTHON_MAJMIN}/re/_constants.py",
+            "${libdir}/python${PYTHON_MAJMIN}/re/_parser.py",
             "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
             "${libdir}/python${PYTHON_MAJMIN}/runpy.py",
@@ -315,8 +321,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
             "${libdir}/python${PYTHON_MAJMIN}/types.py",
             "${libdir}/python${PYTHON_MAJMIN}/typing.py",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
             "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
+            "${libdir}/python${PYTHON_MAJMIN}/zipimport.py",
             "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
         ],
         "cached": [
@@ -398,9 +407,17 @@
             "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_8.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/_abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_casefix.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_compiler.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_constants.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_parser.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc"
         ]
     },
     "crypt": {
@@ -487,6 +504,7 @@
         "rdepends": [
             "core",
             "pprint",
+            "profile",
             "shell",
             "stringold"
         ],
@@ -560,6 +578,7 @@
             "debugger",
             "difflib",
             "pprint",
+            "profile",
             "shell",
             "stringold",
             "unittest"
@@ -617,12 +636,9 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/formatter.py",
             "${libdir}/python${PYTHON_MAJMIN}/html"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/formatter.*.pyc"
-        ]
+        "cached": []
     },
     "idle": {
         "summary": "Python Integrated Development Environment",
@@ -711,7 +727,6 @@
             "crypt",
             "datetime",
             "email",
-            "fcntl",
             "io",
             "math",
             "mime",
@@ -810,7 +825,7 @@
             "shell",
             "smtpd",
             "sqlite3",
-	    "statistics",
+            "statistics",
             "stringold",
             "syslog",
             "terminal",
@@ -873,7 +888,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/urllib",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
         "cached": [
@@ -886,8 +900,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
         ]
     },
@@ -981,7 +993,7 @@
         "summary": "Python pretty-print support",
         "rdepends": [
             "core",
-	    "profile"
+            "profile"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
@@ -1088,18 +1100,20 @@
         "cached": []
     },
     "statistics": {
-	"summary": "Basic statistics module",
-	"rdepends": [
-	    "core",
-	    "math",
-	    "numbers"
-	],
-	"files": [
-	    "${libdir}/python${PYTHON_MAJMIN}/statistics.py"
-	],
-	"cached": [
-	    "${libdir}/python${PYTHON_MAJMIN}/__pycache__/statistics.*.pyc"
-	]
+        "summary": "Basic statistics module",
+        "rdepends": [
+            "core",
+            "crypt",
+            "math",
+            "numbers"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_statistics.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/statistics.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/statistics.*.pyc"
+        ]
     },
     "stringold": {
         "summary": "Python string APIs [deprecated]",
@@ -1159,7 +1173,6 @@
             "core"
         ],
         "files": [
-	    "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
         ],
         "cached": []
@@ -1175,6 +1188,7 @@
             "netclient",
             "numbers",
             "pprint",
+            "profile",
             "stringold"
         ],
         "files": [
@@ -1231,7 +1245,6 @@
             "crypt",
             "datetime",
             "email",
-            "fcntl",
             "html",
             "io",
             "math",
@@ -1252,12 +1265,13 @@
     "zoneinfo": {
         "summary": "IANA time zone support",
         "rdepends": [
-            "core"
+            "core",
+            "datetime"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/zoneinfo",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zoneinfo.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zoneinfo.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/zoneinfo"
         ],
-       "cached": []
+        "cached": []
     }
 }
-- 
2.30.2


