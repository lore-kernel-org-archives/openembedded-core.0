Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39210EE0218
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:35:13 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66385.1767108912085891944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BfYmZ7yN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20251230153510e9d6b75bd300020778-qnhetc@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251230153510e9d6b75bd300020778
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 16:35:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/JTgS90MtlvclkWBh7+aaHxlOmdcOvYBYtkXPIRh6CM=;
 b=BfYmZ7yN9aQY0bUO6vXoaoaAc3Nx6AZi3VzX4EwXUVmAxvI598Y3u3PQ7iwldWsSkAWXbe
 9p1SLZb2iCfa6xTTHernCKUUrH7ewMl95I4aQ8QJo00t8cDWwKVFMUwauEPS+c06rzMgjHyT
 a+Ki2sWCBw/Nlu76uxCURYYt9Llckp6h6KDsOiARQgS3V4/4UeNoNPUycptoW/K0iS2bk9e+
 jvoELUfmdeKTMkHiBLZe69zp9c+1blgkQ98NthIWcix4GYpj0MkVhtEiO7JZGRFlVk2RsgUC
 ea6iWuTFmnizBZASdYpFZaZZmnhMN8eHuN28tLkaiFg8NF9OsMuateEw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] python3: patch CVE-2025-12084
Date: Tue, 30 Dec 2025 16:35:08 +0100
Message-Id: <20251230153508.37929-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 15:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228685

From: Peter Marko <peter.marko@siemens.com>

Pick patch from 3.12 branch according to [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-12084

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/python3/CVE-2025-12084.patch       | 144 ++++++++++++++++++
 .../python/python3_3.12.12.bb                 |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch b/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
new file mode 100644
index 00000000000..b7c0650cdc5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
@@ -0,0 +1,144 @@
+From 9c9dda6625a2a90d2a06c657eee021d6be19842d Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 22 Dec 2025 14:48:49 +0100
+Subject: [PATCH] [3.12] gh-142145: Remove quadratic behavior in node ID cache
+ clearing (GH-142146) (#142211)
+
+* gh-142145: Remove quadratic behavior in node ID cache clearing (GH-142146)
+* gh-142754: Ensure that Element & Attr instances have the ownerDocument attribute (GH-142794)
+(cherry picked from commit 1cc7551b3f9f71efbc88d96dce90f82de98b2454)
+(cherry picked from commit 08d8e18ad81cd45bc4a27d6da478b51ea49486e4)
+(cherry picked from commit 8d2d7bb2e754f8649a68ce4116271a4932f76907)
+
+Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.github.com>
+Co-authored-by: Seth Michael Larson <seth@python.org>
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
+Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+
+CVE: CVE-2025-12084
+Upstream-Status: Backport [https://github.com/python/cpython/commit/9c9dda6625a2a90d2a06c657eee021d6be19842d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Lib/test/test_minidom.py                      | 33 ++++++++++++++++++-
+ Lib/xml/dom/minidom.py                        | 11 ++-----
+ ...-12-01-09-36-45.gh-issue-142145.tcAUhg.rst |  6 ++++
+ 3 files changed, 41 insertions(+), 9 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst
+
+diff --git a/Lib/test/test_minidom.py b/Lib/test/test_minidom.py
+index 699265ccadc..ab4823c8315 100644
+--- a/Lib/test/test_minidom.py
++++ b/Lib/test/test_minidom.py
+@@ -2,13 +2,14 @@
+ 
+ import copy
+ import pickle
++import time
+ import io
+ from test import support
+ import unittest
+ 
+ import xml.dom.minidom
+ 
+-from xml.dom.minidom import parse, Attr, Node, Document, parseString
++from xml.dom.minidom import parse, Attr, Node, Document, Element, parseString
+ from xml.dom.minidom import getDOMImplementation
+ from xml.parsers.expat import ExpatError
+ 
+@@ -176,6 +177,36 @@ class MinidomTest(unittest.TestCase):
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
+index ef8a159833b..cada981f39f 100644
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
+index 00000000000..05c7df35d14
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst
+@@ -0,0 +1,6 @@
++Remove quadratic behavior in ``xml.minidom`` node ID cache clearing.  In order
++to do this without breaking existing users, we also add the *ownerDocument*
++attribute to :mod:`xml.dom.minidom` elements and attributes created by directly
++instantiating the ``Element`` or ``Attr`` class. Note that this way of creating
++nodes is not supported; creator functions like
++:py:meth:`xml.dom.Document.documentElement` should be used instead.
diff --git a/meta/recipes-devtools/python/python3_3.12.12.bb b/meta/recipes-devtools/python/python3_3.12.12.bb
index b70f434ca95..786f52875a9 100644
--- a/meta/recipes-devtools/python/python3_3.12.12.bb
+++ b/meta/recipes-devtools/python/python3_3.12.12.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2025-6075.patch \
+           file://CVE-2025-12084.patch \
            "
 
 SRC_URI:append:class-native = " \

