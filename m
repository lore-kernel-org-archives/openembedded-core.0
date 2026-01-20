Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E33D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5038.1768910954403234021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K6GvjUTI;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso35834835e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910952; x=1769515752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzdEgoHjhdbJL7J6G+vAEQQiAVfwWKwhKQ77d/i78EI=;
        b=K6GvjUTIHQ/OgvCCpWnXiueTZviFjOS2rLMNxVuQJdk95+Gs6UI7lAeUS/cbJj47+e
         Rh1sMrVR5ehV5iLPjehAhgRd5i7rCIAEkn1etEvbqFImtbO4Ef0OUnled0J8TWEbHLZb
         zDtyYspmXPUrS3aPHQGnSTohuuAILnX/rS03s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910952; x=1769515752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lzdEgoHjhdbJL7J6G+vAEQQiAVfwWKwhKQ77d/i78EI=;
        b=b0ugFRGV8t2V5ARyTU78Udw4j1XNK4oPWbIyyYGoiVuwqKK3fmzKGgZv7C7gwIrhII
         U19FhvjVwX3qIzsZ1rFJHfUvjt9J3OGXSJx8O8FsO5O5mkL53jpa+fmVEMJeUkqNRs6f
         /rKe+UIJwOhoR06xA0Rc3C+/uE8zT9/xFw/5lw/nhK3Ou9W2ybNF/DvW6K6gxOm7VS1+
         s41JmP8NAyo6Wk5N0g5tXwDx5TdllhKlXMX0I2lzdY/01NiSXsaBGwLzU4r7ICMyLRt/
         D5f/+WbwoHPJFY2v3imgZwFqXgXFOBDAjZWHRb/9SNeneSegHYjgyc1yRFve1Sb9jVQO
         vHxQ==
X-Gm-Message-State: AOJu0YwS+S+sW4TyQRllYq7aCEEkFCryvl4WElaHkkdjpAk2K+XdXg0z
	XPYvsGI+GZCUeC6934EGdRm1YCVVFwmKLSSYUH12455g6fQ+EbdQfwvHfosI3nnzVF2K8MOWKdP
	Ginpv
X-Gm-Gg: AY/fxX5IlD9CbU2E3rf50WjiArbtBISciCcFTysHBjr0M2zJ/ca9dMAlgaz12kQ207Y
	z1IZAArtrYXq29oS4VRgqqNzc7EYrvSszYyrsPnIEh9uCaMzln8iLEmBtVb+Sv9WC4vixwc4FyR
	9O0+w04NisWsWLdrrlNOtgSydDNIePIg/1Yhx5q6bCWiek6lrjFUyNKNXUWnR8tCv4UkmqmmLdF
	SNm8cVrtmHSlOpbfdMBtA0EH+CBhE4MssXI/qQqxqM0dsplslbVxmP9dvs+MY4a1Jts/BbwIiOC
	rBKPAC0pwE24Ku75B2mAmjq4jei33eqhTerVw5EnU+MgGrLl9uNwqO79NWgGCAYUI8Es/94eodT
	rBEzNPv+1qOVc3Y2EpG3wOf7n+Gl6eQ8BGAy4cLIlc5Ph4ZJnHdpMU23nbJkaPQQ6YQDq4LShdS
	p3la3PF163+4xUhLPl3v8t+qFIGrQzFITgY5lhhN/RpFU5xKl90HTXjkpinh6A8hsIsAL+JaK3e
	2xK89VDUofx+rbVIl8nYw==
X-Received: by 2002:a05:600c:3593:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4801e547d1bmr202814355e9.8.1768910952428;
        Tue, 20 Jan 2026 04:09:12 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:11 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/22] python3: patch CVE-2025-12084
Date: Tue, 20 Jan 2026 13:08:15 +0100
Message-ID: <91eb6b2eb54e50a6a0db92f55b6abe9729c97c34.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229679

From: Peter Marko <peter.marko@siemens.com>

Pick patch from 3.12 branch according to [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-12084

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2025-12084.patch       | 144 ++++++++++++++++++
 .../python/python3_3.12.12.bb                 |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch b/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
new file mode 100644
index 0000000000..b7c0650cdc
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
index b70f434ca9..786f52875a 100644
--- a/meta/recipes-devtools/python/python3_3.12.12.bb
+++ b/meta/recipes-devtools/python/python3_3.12.12.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2025-6075.patch \
+           file://CVE-2025-12084.patch \
            "
 
 SRC_URI:append:class-native = " \

