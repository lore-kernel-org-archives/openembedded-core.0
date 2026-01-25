Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85F7E63CB7
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 00:12:11 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8972.1769386324391257010
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 16:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ODdZtJy8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026012600120168215a2b36000207f9-c04_bi@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026012600120168215a2b36000207f9
        for <openembedded-core@lists.openembedded.org>;
        Mon, 26 Jan 2026 01:12:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7IDtG2F9lm7cAVj3v87KYE/zGpTWz9fYp6Qgs4DfJ+Q=;
 b=ODdZtJy8UkGwgjnA2jVBdD97d1XjEnbQXDcJDGm5MCsZbRrSSM4K38MWrcs33eN2/dkRe9
 0XmSQGUUk71r6Yqu1b05A/R0m4f6nhxeomxR6f6NZSgAAIZ4vdzRYxL69vs+7zSlHM7aE/vl
 JOewgwWD54uh5T80p7rLyP/lnNw+39MxUziBQNaVhB15HNB1iMeudiC57pCJIXBbTEZqV3uv
 r6oKbMLb5hCtTqNbjnij7q8gtZg7IdxUnx7zrYuG/44ahgPprs9mXQiY7q9AyLYwyxScUBed
 s6V0++dBJmCqaVJve5QwMGbKBRoGWNtzRN+5OZmbXHfCGY1QYkBf0C9A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] python3: patch CVE-2025-12084
Date: Mon, 26 Jan 2026 00:56:27 +0100
Message-Id: <20260125235627.2482350-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 00:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229953

From: Peter Marko <peter.marko@siemens.com>

Pick patch for this CVE merged into 3.10 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/python3/CVE-2025-12084.patch       | 171 ++++++++++++++++++
 .../python/python3_3.10.19.bb                 |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch b/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
new file mode 100644
index 0000000000..0c9bb435ed
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
@@ -0,0 +1,171 @@
+From c97e87593063d84a2bd9fe7068b30eb44de23dc0 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sun, 25 Jan 2026 18:10:49 +0100
+Subject: [PATCH] [3.10] gh-142145: Remove quadratic behavior in node ID cache
+ clearing (GH-142146) (#142213)
+
+* gh-142145: Remove quadratic behavior in node ID cache clearing (GH-142146)
+
+* Remove quadratic behavior in node ID cache clearing
+
+Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.github.com>
+
+* Add news fragment
+
+CVE: CVE-2025-12084
+Upstream-Status: Backport [https://github.com/python/cpython/commit/c97e87593063d84a2bd9fe7068b30eb44de23dc0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---------
+(cherry picked from commit 08d8e18ad81cd45bc4a27d6da478b51ea49486e4)
+
+Co-authored-by: Seth Michael Larson <seth@python.org>
+Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.github.com>
+
+* [3.14] gh-142754: Ensure that Element & Attr instances have the ownerDocument attribute (GH-142794) (#142818)
+
+gh-142754: Ensure that Element & Attr instances have the ownerDocument attribute (GH-142794)
+(cherry picked from commit 1cc7551b3f9f71efbc88d96dce90f82de98b2454)
+
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.com>
+
+* gh-142145: relax the no-longer-quadratic test timing (GH-143030)
+
+* gh-142145: relax the no-longer-quadratic test timing
+
+* require cpu resource
+(cherry picked from commit 8d2d7bb2e754f8649a68ce4116271a4932f76907)
+
+Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
+
+* merge NEWS entries into one
+
+---------
+
+Co-authored-by: Seth Michael Larson <seth@python.org>
+Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.github.com>
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+---
+ Lib/test/test_minidom.py                      | 33 ++++++++++++++++++-
+ Lib/xml/dom/minidom.py                        | 11 ++-----
+ ...-12-01-09-36-45.gh-issue-142145.tcAUhg.rst |  6 ++++
+ 3 files changed, 41 insertions(+), 9 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst
+
+diff --git a/Lib/test/test_minidom.py b/Lib/test/test_minidom.py
+index ef38c36210..c68bd990f7 100644
+--- a/Lib/test/test_minidom.py
++++ b/Lib/test/test_minidom.py
+@@ -2,6 +2,7 @@
+ 
+ import copy
+ import pickle
++import time
+ import io
+ from test import support
+ import unittest
+@@ -9,7 +10,7 @@ import unittest
+ import pyexpat
+ import xml.dom.minidom
+ 
+-from xml.dom.minidom import parse, Attr, Node, Document, parseString
++from xml.dom.minidom import parse, Attr, Node, Document, Element, parseString
+ from xml.dom.minidom import getDOMImplementation
+ from xml.parsers.expat import ExpatError
+ 
+@@ -177,6 +178,36 @@ class MinidomTest(unittest.TestCase):
+         self.confirm(dom.documentElement.childNodes[-1].data == "Hello")
+         dom.unlink()
+ 
++    @support.requires_resource('cpu')
++    def testAppendChildNoQuadraticComplexity(self):
++        impl = getDOMImplementation()
++
++        newdoc = impl.createDocument(None, "some_tag", None)
++        top_element = newdoc.documentElement
++        children = [newdoc.createElement(f"child-{i}") for i in range(1, 2 ** 15 + 1)]
++        element = top_element
++
++        start = time.monotonic()
++        for child in children:
++            element.appendChild(child)
++            element = child
++        end = time.monotonic()
++
++        # This example used to take at least 30 seconds.
++        # Conservative assertion due to the wide variety of systems and
++        # build configs timing based tests wind up run under.
++        # A --with-address-sanitizer --with-pydebug build on a rpi5 still
++        # completes this loop in <0.5 seconds.
++        self.assertLess(end - start, 4)
++
++    def testSetAttributeNodeWithoutOwnerDocument(self):
++        # regression test for gh-142754
++        elem = Element("test")
++        attr = Attr("id")
++        attr.value = "test-id"
++        elem.setAttributeNode(attr)
++        self.assertEqual(elem.getAttribute("id"), "test-id")
++
+     def testAppendChildFragment(self):
+         dom, orig, c1, c2, c3, frag = self._create_fragment_test_nodes()
+         dom.documentElement.appendChild(frag)
+diff --git a/Lib/xml/dom/minidom.py b/Lib/xml/dom/minidom.py
+index ef8a159833..cada981f39 100644
+--- a/Lib/xml/dom/minidom.py
++++ b/Lib/xml/dom/minidom.py
+@@ -292,13 +292,6 @@ def _append_child(self, node):
+     childNodes.append(node)
+     node.parentNode = self
+ 
+-def _in_document(node):
+-    # return True iff node is part of a document tree
+-    while node is not None:
+-        if node.nodeType == Node.DOCUMENT_NODE:
+-            return True
+-        node = node.parentNode
+-    return False
+ 
+ def _write_data(writer, data):
+     "Writes datachars to writer."
+@@ -355,6 +348,7 @@ class Attr(Node):
+     def __init__(self, qName, namespaceURI=EMPTY_NAMESPACE, localName=None,
+                  prefix=None):
+         self.ownerElement = None
++        self.ownerDocument = None
+         self._name = qName
+         self.namespaceURI = namespaceURI
+         self._prefix = prefix
+@@ -680,6 +674,7 @@ class Element(Node):
+ 
+     def __init__(self, tagName, namespaceURI=EMPTY_NAMESPACE, prefix=None,
+                  localName=None):
++        self.ownerDocument = None
+         self.parentNode = None
+         self.tagName = self.nodeName = tagName
+         self.prefix = prefix
+@@ -1539,7 +1534,7 @@ def _clear_id_cache(node):
+     if node.nodeType == Node.DOCUMENT_NODE:
+         node._id_cache.clear()
+         node._id_search_stack = None
+-    elif _in_document(node):
++    elif node.ownerDocument:
+         node.ownerDocument._id_cache.clear()
+         node.ownerDocument._id_search_stack= None
+ 
+diff --git a/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst b/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst
+new file mode 100644
+index 0000000000..05c7df35d1
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst
+@@ -0,0 +1,6 @@
++Remove quadratic behavior in ``xml.minidom`` node ID cache clearing.  In order
++to do this without breaking existing users, we also add the *ownerDocument*
++attribute to :mod:`xml.dom.minidom` elements and attributes created by directly
++instantiating the ``Element`` or ``Attr`` class. Note that this way of creating
++nodes is not supported; creator functions like
++:py:meth:`xml.dom.Document.documentElement` should be used instead.
diff --git a/meta/recipes-devtools/python/python3_3.10.19.bb b/meta/recipes-devtools/python/python3_3.10.19.bb
index b87fc8d9ef..fbb2f80886 100644
--- a/meta/recipes-devtools/python/python3_3.10.19.bb
+++ b/meta/recipes-devtools/python/python3_3.10.19.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2025-6075.patch \
            file://CVE-2025-13836.patch \
            file://CVE-2025-13837.patch \
+           file://CVE-2025-12084.patch \
            "
 
 SRC_URI:append:class-native = " \

