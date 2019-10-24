Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C30B47F8F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 04:19:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9O4JJBb016518
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 21:19:19 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 23 Oct 2019 21:19:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Oct 2019 12:19:15 +0800
Message-ID: <20191024041915.28993-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191024041915.28993-1-Qi.Chen@windriver.com>
References: <20191024041915.28993-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python: fix CVE-2019-16935
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
X-List-Received-Date: Thu, 24 Oct 2019 04:19:19 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...cape-the-server-title-of-DocXMLRPCSe.patch | 101 ++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch

diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
new file mode 100644
index 0000000000..3025cf7bc8
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
@@ -0,0 +1,101 @@
+From b161c89c8bd66fe928192e21364678c8e9b8fcc0 Mon Sep 17 00:00:00 2001
+From: Dong-hee Na <donghee.na92@gmail.com>
+Date: Tue, 1 Oct 2019 19:58:01 +0900
+Subject: [PATCH] [2.7] bpo-38243: Escape the server title of DocXMLRPCServer
+ (GH-16447)
+
+Escape the server title of DocXMLRPCServer.DocXMLRPCServer
+when rendering the document page as HTML.
+
+CVE: CVE-2019-16935
+
+Upstream-Status: Backport [https://github.com/python/cpython/pull/16447/commits/b41cde823d026f2adc21ef14b1c2e92b1006de06]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Lib/DocXMLRPCServer.py                        | 13 +++++++++++-
+ Lib/test/test_docxmlrpc.py                    | 20 +++++++++++++++++++
+ .../2019-09-25-13-21-09.bpo-38243.1pfz24.rst  |  3 +++
+ 3 files changed, 35 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
+
+diff --git a/Lib/DocXMLRPCServer.py b/Lib/DocXMLRPCServer.py
+index 4064ec2e48..90b037dd35 100644
+--- a/Lib/DocXMLRPCServer.py
++++ b/Lib/DocXMLRPCServer.py
+@@ -20,6 +20,16 @@ from SimpleXMLRPCServer import (SimpleXMLRPCServer,
+             CGIXMLRPCRequestHandler,
+             resolve_dotted_attribute)
+ 
++
++def _html_escape_quote(s):
++    s = s.replace("&", "&amp;") # Must be done first!
++    s = s.replace("<", "&lt;")
++    s = s.replace(">", "&gt;")
++    s = s.replace('"', "&quot;")
++    s = s.replace('\'', "&#x27;")
++    return s
++
++
+ class ServerHTMLDoc(pydoc.HTMLDoc):
+     """Class used to generate pydoc HTML document for a server"""
+ 
+@@ -210,7 +220,8 @@ class XMLRPCDocGenerator:
+                                 methods
+                             )
+ 
+-        return documenter.page(self.server_title, documentation)
++        title = _html_escape_quote(self.server_title)
++        return documenter.page(title, documentation)
+ 
+ class DocXMLRPCRequestHandler(SimpleXMLRPCRequestHandler):
+     """XML-RPC and documentation request handler class.
+diff --git a/Lib/test/test_docxmlrpc.py b/Lib/test/test_docxmlrpc.py
+index 4dff4159e2..c45b892b8b 100644
+--- a/Lib/test/test_docxmlrpc.py
++++ b/Lib/test/test_docxmlrpc.py
+@@ -1,5 +1,6 @@
+ from DocXMLRPCServer import DocXMLRPCServer
+ import httplib
++import re
+ import sys
+ from test import test_support
+ threading = test_support.import_module('threading')
+@@ -176,6 +177,25 @@ class DocXMLRPCHTTPGETServer(unittest.TestCase):
+         self.assertIn("""Try&nbsp;self.<strong>add</strong>,&nbsp;too.""",
+                       response.read())
+ 
++    def test_server_title_escape(self):
++        """Test that the server title and documentation
++        are escaped for HTML.
++        """
++        self.serv.set_server_title('test_title<script>')
++        self.serv.set_server_documentation('test_documentation<script>')
++        self.assertEqual('test_title<script>', self.serv.server_title)
++        self.assertEqual('test_documentation<script>',
++                self.serv.server_documentation)
++
++        generated = self.serv.generate_html_documentation()
++        title = re.search(r'<title>(.+?)</title>', generated).group()
++        documentation = re.search(r'<p><tt>(.+?)</tt></p>', generated).group()
++        self.assertEqual('<title>Python: test_title&lt;script&gt;</title>',
++                title)
++        self.assertEqual('<p><tt>test_documentation&lt;script&gt;</tt></p>',
++                documentation)
++
++
+ def test_main():
+     test_support.run_unittest(DocXMLRPCHTTPGETServer)
+ 
+diff --git a/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
+new file mode 100644
+index 0000000000..8f02baed9e
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
+@@ -0,0 +1,3 @@
++Escape the server title of :class:`DocXMLRPCServer.DocXMLRPCServer`
++when rendering the document page as HTML.
++(Contributed by Dong-hee Na in :issue:`38243`.)
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index ebb4824cc1..625c5312a6 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -32,6 +32,7 @@ SRC_URI += " \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
            file://bpo-36742-cve-2019-10160.patch \
+           file://0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.17.1


