Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4237F7C1A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 02:26:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0H2QYgm014302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jan 2019 18:26:34 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 16 Jan 2019 18:26:33 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 16 Jan 2019 18:26:32 -0800
Message-ID: <20190117022632.64698-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117022632.64698-1-mingli.yu@windriver.com>
References: <20190117022632.64698-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3-manifest.json: add logging to rdepends
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
X-List-Received-Date: Thu, 17 Jan 2019 02:26:37 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add loggging to rdepends for python3-2to3
and python3-multiprocessing.

before patch:
 # python3
 Python 3.5.6 (default, Jan 15 2019, 03:09:16)
 [GCC 8.2.0] on linux
 Type "help", "copyright", "credits" or "license" for more information.
 >>> from multiprocessing import util
 >>> util.get_logger()
 Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python3.5/multiprocessing/util.py", line 65, in get_logger
     import logging
 ImportError: No module named 'logging'
 >>>

after patch:
 # python3
 Python 3.5.6 (default, Jan 15 2019, 09:26:38)
 [GCC 8.2.0] on linux
 Type "help", "copyright", "credits" or "license" for more information.
 >>> from multiprocessing import util
 >>> util.get_logger()
 <logging.Logger object at 0xb792d94c>
 >>>

 Steps to reproduce:
 1, add below line to local.conf
 IMAGE_INSTALL_append += " python3-multiprocessing"
 2, bitbake core-image-base
 3, runqemu qemux86 slirp nographic core-image-base

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 3641d5bd7b1..174eac63d0c 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -106,7 +106,8 @@
     "2to3": {
         "summary": "Python automated Python 2 to 3 code translator",
         "rdepends": [
-            "core"
+            "core",
+            "logging"
         ],
         "files": [
             "${bindir}/2to3-*",
@@ -820,7 +821,8 @@
     "multiprocessing": {
         "summary": "Python multiprocessing support",
         "rdepends": [
-            "core"
+            "core",
+            "logging"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
-- 
2.17.1


