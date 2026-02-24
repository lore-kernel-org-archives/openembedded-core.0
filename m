Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A582EE9B274
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:00 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21455.1771943097616125471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E58lt8/9;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48069a48629so57322955e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943096; x=1772547896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aULEJNVx1UcLOv9QlsKVmE6bQ5h6cr0P69CH+0DQBbk=;
        b=E58lt8/9HRyyhXEURxt89ewUbyayKpMEdRy3lok22OWcsk/OkirchDJq2l27OvXemL
         Ms5kBFEr4bYBSNyYX/QUyfzsSqGpY8Vra/AGsZSep8sj+Mvm68oDti0RdEke74AJ/9Qe
         3ER2DIv29UacHLPfdIYaD0RQBgbwsXkBwWxfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943096; x=1772547896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aULEJNVx1UcLOv9QlsKVmE6bQ5h6cr0P69CH+0DQBbk=;
        b=na6mQZV4EdubNqpWbf0Yt1dnDart7YemDGgnQvIIihSHiHa5ujIP/8IhM9EpKOB8fk
         nXsmv4mnE0zjI6zZ3X2Ej+tpWp0ADY4yhaPMzliXfB870ntvE4CNq0OZGykHyqk/qoit
         2F0+e0nJF8yQoVjfsGAXYYAgONRgByhq5Vpq/mQMHIX4+MseZzqb6PFBNqoeyptWydGH
         ZHmWUuBGg5X+rU7LNkjpGjP1fTuan52SuH7g5F0iUDUNXqEqA3ii1wE5jNdrto5lLd9u
         CsfB1oYLn+wW0JzKICYrKrycIhISKQ3xouiBGd7VWeqccvzbpTavP+s0CX/eDp6cxAW+
         ZOKQ==
X-Gm-Message-State: AOJu0YzYSvFXkIM3UKk2yY46xM9Gcv0Iy1wZOmkCeW0rTxOyTxzZNst6
	bH0omrwDokxqZ6gkOwanQh8sLJp+NoZ+6vdQTWz7R/JhtwsTM6xlrMs75WxyYtQawsVe3m/gpej
	bOym0
X-Gm-Gg: AZuq6aJU+wxxS6GB6L4E98VDuUUxzuoEqxJ7gv7SPlZWOEv72ScQbFAKisrSpo9eeSj
	wQuoxvnStwoLZLSzz8uuXs2moeIhiTb2CoQFiOhFQ0upee5wh4t90DDV6ctdaRf5oXCq4WzMJT3
	u7VVPl+4wEMcaRe4yv9rxboEmOoTlg1e53+FeMZpdAyGTHPz9+zNQ1jTftl9gURe0pOp/F8hD2I
	laSUiyU6gKcgY586rOch3NVz+EOUdN816lPL6wn7SUBygkeP019pDMbBLLyx9NWLQ8/ARUtpOL8
	gQYWW4WCQEeuuN/DRfQZ3/7dfsaEd1RezETobtf47J3N4hDjbI95KpVxjEKvxddzglsTDFPuvts
	VIkWdvIRuA6Yzfc6Ivgu31d4OhJJZR9tyj+RZFANQW30PBO7QLetl6D+npjKbrbcJtPMPVMklBV
	pr7F8vbXLfkxcaiQq5rONRyJw+6WxA7aZPyCL2z23Qef+AbGfPDEvVQV/ZorbcKyiSNBeZ4fTDE
	D3NHAkCDG9zRG1AxjlhCytr0fHM0cQZ6Q==
X-Received: by 2002:a05:600c:6305:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-483a95e1eb4mr196054565e9.19.1771943095551;
        Tue, 24 Feb 2026 06:24:55 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.24.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:24:55 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/38] python3: patch CVE-2025-12084
Date: Tue, 24 Feb 2026 15:23:55 +0100
Message-ID: <350b16181eb82b2ad21569afbb2effc33f66ae06.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231769

From: Peter Marko <peter.marko@siemens.com>

Pick patch for this CVE merged into 3.10 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2025-12084.patch       | 171 ++++++++++++++++++
 .../python/python3_3.10.19.bb                 |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch b/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
new file mode 100644
index 00000000000..0c9bb435edf
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
index b87fc8d9ef2..fbb2f80886b 100644
--- a/meta/recipes-devtools/python/python3_3.10.19.bb
+++ b/meta/recipes-devtools/python/python3_3.10.19.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2025-6075.patch \
            file://CVE-2025-13836.patch \
            file://CVE-2025-13837.patch \
+           file://CVE-2025-12084.patch \
            "
 
 SRC_URI:append:class-native = " \

