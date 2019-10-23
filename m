Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABA437F7A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 02:37:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9N2bUlJ016019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 19:37:30 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 22 Oct 2019 19:37:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Oct 2019 10:37:27 +0800
Message-ID: <20191023023728.37008-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [zeus][PATCH 1/2] python3: fix CVE-2019-16935
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
X-List-Received-Date: Wed, 23 Oct 2019 02:37:29 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ....server-Escape-the-server_title-GH-1.patch | 86 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.4.bb |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch b/meta/recipes-devtools/python/python3/0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch
new file mode 100644
index 0000000000..1a4c932070
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch
@@ -0,0 +1,86 @@
+From c25abd43e8877b4a7098f79eaacb248710731c2b Mon Sep 17 00:00:00 2001
+From: Dong-hee Na <donghee.na92@gmail.com>
+Date: Sat, 28 Sep 2019 04:59:37 +0900
+Subject: [PATCH] bpo-38243, xmlrpc.server: Escape the server_title (GH-16373)
+
+Escape the server title of xmlrpc.server.DocXMLRPCServer
+when rendering the document page as HTML.
+
+CVE: CVE-2019-16935
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/e8650a4f8c7fb76f570d4ca9c1fbe44e91c8dfaa]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Lib/test/test_docxmlrpc.py                       | 16 ++++++++++++++++
+ Lib/xmlrpc/server.py                             |  3 ++-
+ .../2019-09-25-13-21-09.bpo-38243.1pfz24.rst     |  3 +++
+ 3 files changed, 21 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
+
+diff --git a/Lib/test/test_docxmlrpc.py b/Lib/test/test_docxmlrpc.py
+index f077f05f5b..38215659b6 100644
+--- a/Lib/test/test_docxmlrpc.py
++++ b/Lib/test/test_docxmlrpc.py
+@@ -1,5 +1,6 @@
+ from xmlrpc.server import DocXMLRPCServer
+ import http.client
++import re
+ import sys
+ import threading
+ from test import support
+@@ -193,6 +194,21 @@ class DocXMLRPCHTTPGETServer(unittest.TestCase):
+              b'method_annotation</strong></a>(x: bytes)</dt></dl>'),
+             response.read())
+ 
++    def test_server_title_escape(self):
++        # bpo-38243: Ensure that the server title and documentation
++        # are escaped for HTML.
++        self.serv.set_server_title('test_title<script>')
++        self.serv.set_server_documentation('test_documentation<script>')
++        self.assertEqual('test_title<script>', self.serv.server_title)
++        self.assertEqual('test_documentation<script>',
++                self.serv.server_documentation)
++
++        generated = self.serv.generate_html_documentation()
++        title = re.search(r'<title>(.+?)</title>', generated).group()
++        documentation = re.search(r'<p><tt>(.+?)</tt></p>', generated).group()
++        self.assertEqual('<title>Python: test_title&lt;script&gt;</title>', title)
++        self.assertEqual('<p><tt>test_documentation&lt;script&gt;</tt></p>', documentation)
++
+ 
+ if __name__ == '__main__':
+     unittest.main()
+diff --git a/Lib/xmlrpc/server.py b/Lib/xmlrpc/server.py
+index f1c467eb1b..32aba4df4c 100644
+--- a/Lib/xmlrpc/server.py
++++ b/Lib/xmlrpc/server.py
+@@ -108,6 +108,7 @@ from xmlrpc.client import Fault, dumps, loads, gzip_encode, gzip_decode
+ from http.server import BaseHTTPRequestHandler
+ from functools import partial
+ from inspect import signature
++import html
+ import http.server
+ import socketserver
+ import sys
+@@ -894,7 +895,7 @@ class XMLRPCDocGenerator:
+                                 methods
+                             )
+ 
+-        return documenter.page(self.server_title, documentation)
++        return documenter.page(html.escape(self.server_title), documentation)
+ 
+ class DocXMLRPCRequestHandler(SimpleXMLRPCRequestHandler):
+     """XML-RPC and documentation request handler class.
+diff --git a/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
+new file mode 100644
+index 0000000000..98d7be1295
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
+@@ -0,0 +1,3 @@
++Escape the server title of :class:`xmlrpc.server.DocXMLRPCServer`
++when rendering the document page as HTML.
++(Contributed by Dong-hee Na in :issue:`38243`.)
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index 580f47f976..eb6e6d39c0 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
+           file://0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1


