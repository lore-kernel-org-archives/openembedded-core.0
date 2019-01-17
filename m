Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 217786BDC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 02:26:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0H2QX4L016890
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jan 2019 18:26:33 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 16 Jan 2019 18:26:32 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 16 Jan 2019 18:26:31 -0800
Message-ID: <20190117022632.64698-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/2] python2-manifest.json: add logging to rdepends
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
X-List-Received-Date: Thu, 17 Jan 2019 02:26:36 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add loggging to rdepends for python-2to3
and python-multiprocessing.

before patch:
 # python
 Python 2.7.15 (default, Jan 15 2019, 03:09:01)
 [GCC 8.2.0] on linux2
 Type "help", "copyright", "credits" or "license" for more information.
 >>> from multiprocessing import util
 >>> util.get_logger()
 Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python2.7/multiprocessing/util.py", line 89, in get_logger
     import logging, atexit
 ImportError: No module named logging
 >>>

After patch:
 # python
 Python 2.7.15 (default, Jan 15 2019, 09:05:49)
 [GCC 8.2.0] on linux2
 Type "help", "copyright", "credits" or "license" for more information.
 >>> from multiprocessing import util
 >>> util.get_logger()
 <logging.Logger object at 0xb78cf86c>
 >>>

 Steps to reproduce:
 1, add below line to local.conf
 IMAGE_INSTALL_append += " python-multiprocessing"
 2, bitbake core-image-base
 3, runqemu qemux86 slirp nographic core-image-base

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 4fff54a95bf..abaa10dbd2e 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -106,7 +106,8 @@
     "2to3": {
         "summary": "Python automated Python 2 to 3 code translator", 
         "rdepends": [
-            "core"
+            "core",
+            "logging"
         ], 
         "files": [
             "${bindir}/2to3", 
@@ -728,6 +729,7 @@
             "core", 
             "fcntl", 
             "io", 
+            "logging",
             "pickle", 
             "subprocess", 
             "threading"
-- 
2.17.1


