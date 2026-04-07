Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F08EDB7CF
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75681.1775546030019934646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dj8/aE4z;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so6563105e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546028; x=1776150828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX520mzOuiO3Yx7LzznJ5dTFaH7s3NIr4oNCz19cNII=;
        b=dj8/aE4z72Kh91NHvgWrsxWD8Xz4HRMVLR2VSOKcZCdgmJznjbB9zD2UVB19svPm7+
         ClnelrXvi2X0Qmo8EcyQjY1TVgNmq5U73OHWdUxQqTsuxpQE07w2/9as2OzZfeqdSBGN
         LcQJs0/xrTync8gID8gXjdHhrtL5hV6PD4Gng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546028; x=1776150828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cX520mzOuiO3Yx7LzznJ5dTFaH7s3NIr4oNCz19cNII=;
        b=MnV4k7Lp/+u3G6/3aGqDGTvAEUdxAwPg++d367ceCL2DHgZ5NrRlmzuzPcPPcVYtjV
         S5mSBLyqYBWHu6PvP8KIT2iFNUDopCe64ut6daG5Y1Tw9bOQ1d33A/JO5hEBF/x+h5PD
         QQfu8Gag8RSNCKIe1Ydvxn+KMSNqYQAemweFm88BWGLCxTC6bJnNZUNGnuc5IhXSOR0r
         FHJgvLc/g4XIm0xE5w1CUygXj5FG2j1GQ9N7y9/j5go8T0Xntn8mnKQjK3uuH4NcmEpy
         7O0mAPAJ9cpMw2t+IVl5LSUb4cBEa8gFGNyLnGyiZ3Sw0ZjbgTrI3AY1k85bilkqXgq/
         CQSw==
X-Gm-Message-State: AOJu0Yw4VJmpLm8eBix/rCaV+2dCCHi2MAdrRezrk/DnWdViEp2gPrGf
	2Yz8O14XzhjRTkeKs34kcrS6AR8NPAyIE7dBDVhYoNH8ZtmplAW0lrwHjFAS8ioRSiWPaYhJ4U/
	C9DiSCqQ=
X-Gm-Gg: AeBDiesg3oVTagenuOp2TdNJq4PrCRgdL1bqFzytYBGEdFVzgWfUPzxbeSt3HZ8hKjw
	tdHyvLtEqhiUmKWYzuJOKaqyqv6d2v5BJy1an60swPhI0V1m8x9Gi+Wk9BvZJeoCGjvbKAGZIy5
	mIdK8NFA75yR/HoRqt9hQsrG5c9Z3+8jg56tEiIaLyk1bE/DJXWQwYOMeoi76VcDI8NrRtgwi0y
	NP3oxGXpFUcNY+oEpLBR84s75qeBChXOy2X9u3jmlAiE55AMiHQsq15x729lbz5gJPi/GOL0BOj
	P8zHNmIsiSkQzQMrkj0CH2xOfrYlcDhrnKkPL/7CDL86OBi3m/7tu2lqJrVoJOvj2whdCbYMzSL
	r//agFx+82Y2Wl/pXP/R0r49RBbpxtM4MJVWLxHpAnpyXU7BSiSAJzLdhBgUJS3lL5flzA13alm
	1L8a96L9yK+6hd4mlwcYf5hNI0S/ZMxVI0GhiaTDs9Pipenc/IADq7iKvo/w5ZL6TWqldc2NeQ+
	KhOYKYGZ5ohrD+rBF8o8FlPPYs=
X-Received: by 2002:a05:600c:1d1d:b0:488:7ebd:78 with SMTP id 5b1f17b1804b1-4889977cbb7mr212848445e9.14.1775546027412;
        Tue, 07 Apr 2026 00:13:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 08/18] python3: upgrade 3.10.19 -> 3.10.20
Date: Tue,  7 Apr 2026 09:13:16 +0200
Message-ID: <51e1581d337b674272c1a71dfc366387577bc5df.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234712

From: Vijay Anusuri <vanusuri@mvista.com>

Drop upstreamed patches.

Release information:
* https://www.python.org/downloads/release/python-31020/
* The release you're looking at is Python 3.10.20, a security bugfix release for the legacy 3.10 series.

Handles CVE-2024-6923 CVE-2025-6075 CVE-2025-12084 CVE-2025-13836 CVE-2025-13837
CVE-2025-15282 CVE-2025-59375 CVE-2026-0865 CVE-2026-24515 CVE-2026-25210

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
[YC: rebased on top of kirkstone]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2025-12084.patch       | 171 --------
 .../python/python3/CVE-2025-13836.patch       | 163 --------
 .../python/python3/CVE-2025-13837.patch       | 162 --------
 .../python/python3/CVE-2025-6075.patch        | 364 ------------------
 ...{python3_3.10.19.bb => python3_3.10.20.bb} |   6 +-
 5 files changed, 1 insertion(+), 865 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch
 rename meta/recipes-devtools/python/{python3_3.10.19.bb => python3_3.10.20.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch b/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
deleted file mode 100644
index 0c9bb435edf..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From c97e87593063d84a2bd9fe7068b30eb44de23dc0 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Sun, 25 Jan 2026 18:10:49 +0100
-Subject: [PATCH] [3.10] gh-142145: Remove quadratic behavior in node ID cache
- clearing (GH-142146) (#142213)
-
-* gh-142145: Remove quadratic behavior in node ID cache clearing (GH-142146)
-
-* Remove quadratic behavior in node ID cache clearing
-
-Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.github.com>
-
-* Add news fragment
-
-CVE: CVE-2025-12084
-Upstream-Status: Backport [https://github.com/python/cpython/commit/c97e87593063d84a2bd9fe7068b30eb44de23dc0]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----------
-(cherry picked from commit 08d8e18ad81cd45bc4a27d6da478b51ea49486e4)
-
-Co-authored-by: Seth Michael Larson <seth@python.org>
-Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.github.com>
-
-* [3.14] gh-142754: Ensure that Element & Attr instances have the ownerDocument attribute (GH-142794) (#142818)
-
-gh-142754: Ensure that Element & Attr instances have the ownerDocument attribute (GH-142794)
-(cherry picked from commit 1cc7551b3f9f71efbc88d96dce90f82de98b2454)
-
-Co-authored-by: Petr Viktorin <encukou@gmail.com>
-Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.com>
-
-* gh-142145: relax the no-longer-quadratic test timing (GH-143030)
-
-* gh-142145: relax the no-longer-quadratic test timing
-
-* require cpu resource
-(cherry picked from commit 8d2d7bb2e754f8649a68ce4116271a4932f76907)
-
-Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
-
-* merge NEWS entries into one
-
----------
-
-Co-authored-by: Seth Michael Larson <seth@python.org>
-Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.github.com>
-Co-authored-by: Petr Viktorin <encukou@gmail.com>
-Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
----
- Lib/test/test_minidom.py                      | 33 ++++++++++++++++++-
- Lib/xml/dom/minidom.py                        | 11 ++-----
- ...-12-01-09-36-45.gh-issue-142145.tcAUhg.rst |  6 ++++
- 3 files changed, 41 insertions(+), 9 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst
-
-diff --git a/Lib/test/test_minidom.py b/Lib/test/test_minidom.py
-index ef38c36210..c68bd990f7 100644
---- a/Lib/test/test_minidom.py
-+++ b/Lib/test/test_minidom.py
-@@ -2,6 +2,7 @@
- 
- import copy
- import pickle
-+import time
- import io
- from test import support
- import unittest
-@@ -9,7 +10,7 @@ import unittest
- import pyexpat
- import xml.dom.minidom
- 
--from xml.dom.minidom import parse, Attr, Node, Document, parseString
-+from xml.dom.minidom import parse, Attr, Node, Document, Element, parseString
- from xml.dom.minidom import getDOMImplementation
- from xml.parsers.expat import ExpatError
- 
-@@ -177,6 +178,36 @@ class MinidomTest(unittest.TestCase):
-         self.confirm(dom.documentElement.childNodes[-1].data == "Hello")
-         dom.unlink()
- 
-+    @support.requires_resource('cpu')
-+    def testAppendChildNoQuadraticComplexity(self):
-+        impl = getDOMImplementation()
-+
-+        newdoc = impl.createDocument(None, "some_tag", None)
-+        top_element = newdoc.documentElement
-+        children = [newdoc.createElement(f"child-{i}") for i in range(1, 2 ** 15 + 1)]
-+        element = top_element
-+
-+        start = time.monotonic()
-+        for child in children:
-+            element.appendChild(child)
-+            element = child
-+        end = time.monotonic()
-+
-+        # This example used to take at least 30 seconds.
-+        # Conservative assertion due to the wide variety of systems and
-+        # build configs timing based tests wind up run under.
-+        # A --with-address-sanitizer --with-pydebug build on a rpi5 still
-+        # completes this loop in <0.5 seconds.
-+        self.assertLess(end - start, 4)
-+
-+    def testSetAttributeNodeWithoutOwnerDocument(self):
-+        # regression test for gh-142754
-+        elem = Element("test")
-+        attr = Attr("id")
-+        attr.value = "test-id"
-+        elem.setAttributeNode(attr)
-+        self.assertEqual(elem.getAttribute("id"), "test-id")
-+
-     def testAppendChildFragment(self):
-         dom, orig, c1, c2, c3, frag = self._create_fragment_test_nodes()
-         dom.documentElement.appendChild(frag)
-diff --git a/Lib/xml/dom/minidom.py b/Lib/xml/dom/minidom.py
-index ef8a159833..cada981f39 100644
---- a/Lib/xml/dom/minidom.py
-+++ b/Lib/xml/dom/minidom.py
-@@ -292,13 +292,6 @@ def _append_child(self, node):
-     childNodes.append(node)
-     node.parentNode = self
- 
--def _in_document(node):
--    # return True iff node is part of a document tree
--    while node is not None:
--        if node.nodeType == Node.DOCUMENT_NODE:
--            return True
--        node = node.parentNode
--    return False
- 
- def _write_data(writer, data):
-     "Writes datachars to writer."
-@@ -355,6 +348,7 @@ class Attr(Node):
-     def __init__(self, qName, namespaceURI=EMPTY_NAMESPACE, localName=None,
-                  prefix=None):
-         self.ownerElement = None
-+        self.ownerDocument = None
-         self._name = qName
-         self.namespaceURI = namespaceURI
-         self._prefix = prefix
-@@ -680,6 +674,7 @@ class Element(Node):
- 
-     def __init__(self, tagName, namespaceURI=EMPTY_NAMESPACE, prefix=None,
-                  localName=None):
-+        self.ownerDocument = None
-         self.parentNode = None
-         self.tagName = self.nodeName = tagName
-         self.prefix = prefix
-@@ -1539,7 +1534,7 @@ def _clear_id_cache(node):
-     if node.nodeType == Node.DOCUMENT_NODE:
-         node._id_cache.clear()
-         node._id_search_stack = None
--    elif _in_document(node):
-+    elif node.ownerDocument:
-         node.ownerDocument._id_cache.clear()
-         node.ownerDocument._id_search_stack= None
- 
-diff --git a/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst b/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst
-new file mode 100644
-index 0000000000..05c7df35d1
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst
-@@ -0,0 +1,6 @@
-+Remove quadratic behavior in ``xml.minidom`` node ID cache clearing.  In order
-+to do this without breaking existing users, we also add the *ownerDocument*
-+attribute to :mod:`xml.dom.minidom` elements and attributes created by directly
-+instantiating the ``Element`` or ``Attr`` class. Note that this way of creating
-+nodes is not supported; creator functions like
-+:py:meth:`xml.dom.Document.documentElement` should be used instead.
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch b/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
deleted file mode 100644
index c4387b60194..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 289f29b0fe38baf2d7cb5854f4bb573cc34a6a15 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Fri, 5 Dec 2025 16:21:57 +0100
-Subject: [PATCH] [3.13] gh-119451: Fix a potential denial of service in
- http.client (GH-119454) (#142139)
-
-gh-119451: Fix a potential denial of service in http.client (GH-119454)
-
-Reading the whole body of the HTTP response could cause OOM if
-the Content-Length value is too large even if the server does not send
-a large amount of data. Now the HTTP client reads large data by chunks,
-therefore the amount of consumed memory is proportional to the amount
-of sent data.
-(cherry picked from commit 5a4c4a033a4a54481be6870aa1896fad732555b5)
-
-CVE: CVE-2025-13836
-Upstream-Status: Backport [https://github.com/python/cpython/commit/289f29b0fe38baf2d7cb5854f4bb573cc34a6a15]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- Lib/http/client.py                            | 28 ++++++--
- Lib/test/test_httplib.py                      | 66 +++++++++++++++++++
- ...-05-23-11-47-48.gh-issue-119451.qkJe9-.rst |  5 ++
- 3 files changed, 95 insertions(+), 4 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
-
-diff --git a/Lib/http/client.py b/Lib/http/client.py
-index d1b7b10..c8ab5b7 100644
---- a/Lib/http/client.py
-+++ b/Lib/http/client.py
-@@ -111,6 +111,11 @@ responses = {v: v.phrase for v in http.HTTPStatus.__members__.values()}
- _MAXLINE = 65536
- _MAXHEADERS = 100
- 
-+# Data larger than this will be read in chunks, to prevent extreme
-+# overallocation.
-+_MIN_READ_BUF_SIZE = 1 << 20
-+
-+
- # Header name/value ABNF (http://tools.ietf.org/html/rfc7230#section-3.2)
- #
- # VCHAR          = %x21-7E
-@@ -628,10 +633,25 @@ class HTTPResponse(io.BufferedIOBase):
-         reading. If the bytes are truly not available (due to EOF), then the
-         IncompleteRead exception can be used to detect the problem.
-         """
--        data = self.fp.read(amt)
--        if len(data) < amt:
--            raise IncompleteRead(data, amt-len(data))
--        return data
-+        cursize = min(amt, _MIN_READ_BUF_SIZE)
-+        data = self.fp.read(cursize)
-+        if len(data) >= amt:
-+            return data
-+        if len(data) < cursize:
-+            raise IncompleteRead(data, amt - len(data))
-+
-+        data = io.BytesIO(data)
-+        data.seek(0, 2)
-+        while True:
-+            # This is a geometric increase in read size (never more than
-+            # doubling out the current length of data per loop iteration).
-+            delta = min(cursize, amt - cursize)
-+            data.write(self.fp.read(delta))
-+            if data.tell() >= amt:
-+                return data.getvalue()
-+            cursize += delta
-+            if data.tell() < cursize:
-+                raise IncompleteRead(data.getvalue(), amt - data.tell())
- 
-     def _safe_readinto(self, b):
-         """Same as _safe_read, but for reading into a buffer."""
-diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
-index 77152cf..89ec5f6 100644
---- a/Lib/test/test_httplib.py
-+++ b/Lib/test/test_httplib.py
-@@ -1226,6 +1226,72 @@ class BasicTest(TestCase):
-         thread.join()
-         self.assertEqual(result, b"proxied data\n")
- 
-+    def test_large_content_length(self):
-+        serv = socket.create_server((HOST, 0))
-+        self.addCleanup(serv.close)
-+
-+        def run_server():
-+            [conn, address] = serv.accept()
-+            with conn:
-+                while conn.recv(1024):
-+                    conn.sendall(
-+                        b"HTTP/1.1 200 Ok\r\n"
-+                        b"Content-Length: %d\r\n"
-+                        b"\r\n" % size)
-+                    conn.sendall(b'A' * (size//3))
-+                    conn.sendall(b'B' * (size - size//3))
-+
-+        thread = threading.Thread(target=run_server)
-+        thread.start()
-+        self.addCleanup(thread.join, 1.0)
-+
-+        conn = client.HTTPConnection(*serv.getsockname())
-+        try:
-+            for w in range(15, 27):
-+                size = 1 << w
-+                conn.request("GET", "/")
-+                with conn.getresponse() as response:
-+                    self.assertEqual(len(response.read()), size)
-+        finally:
-+            conn.close()
-+            thread.join(1.0)
-+
-+    def test_large_content_length_truncated(self):
-+        serv = socket.create_server((HOST, 0))
-+        self.addCleanup(serv.close)
-+
-+        def run_server():
-+            while True:
-+                [conn, address] = serv.accept()
-+                with conn:
-+                    conn.recv(1024)
-+                    if not size:
-+                        break
-+                    conn.sendall(
-+                        b"HTTP/1.1 200 Ok\r\n"
-+                        b"Content-Length: %d\r\n"
-+                        b"\r\n"
-+                        b"Text" % size)
-+
-+        thread = threading.Thread(target=run_server)
-+        thread.start()
-+        self.addCleanup(thread.join, 1.0)
-+
-+        conn = client.HTTPConnection(*serv.getsockname())
-+        try:
-+            for w in range(18, 65):
-+                size = 1 << w
-+                conn.request("GET", "/")
-+                with conn.getresponse() as response:
-+                    self.assertRaises(client.IncompleteRead, response.read)
-+                conn.close()
-+        finally:
-+            conn.close()
-+            size = 0
-+            conn.request("GET", "/")
-+            conn.close()
-+            thread.join(1.0)
-+
-     def test_putrequest_override_domain_validation(self):
-         """
-         It should be possible to override the default validation
-diff --git a/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
-new file mode 100644
-index 0000000..6d6f25c
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
-@@ -0,0 +1,5 @@
-+Fix a potential memory denial of service in the :mod:`http.client` module.
-+When connecting to a malicious server, it could cause
-+an arbitrary amount of memory to be allocated.
-+This could have led to symptoms including a :exc:`MemoryError`, swapping, out
-+of memory (OOM) killed processes or containers, or even system crashes.
--- 
-2.50.1
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13837.patch b/meta/recipes-devtools/python/python3/CVE-2025-13837.patch
deleted file mode 100644
index 36bf75792bb..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-13837.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From 5a8b19677d818fb41ee55f310233772e15aa1a2b Mon Sep 17 00:00:00 2001
-From: Serhiy Storchaka <storchaka@gmail.com>
-Date: Mon, 22 Dec 2025 15:49:44 +0200
-Subject: [PATCH] [3.12] gh-119342: Fix a potential denial of service in
- plistlib (GH-119343) (#142149)
-
-Reading a specially prepared small Plist file could cause OOM because file's
-read(n) preallocates a bytes object for reading the specified amount of
-data. Now plistlib reads large data by chunks, therefore the upper limit of
-consumed memory is proportional to the size of the input file.
-(cherry picked from commit 694922cf40aa3a28f898b5f5ee08b71b4922df70)
-
-CVE: CVE-2025-13837
-Upstream-Status: Backport [https://github.com/python/cpython/commit/5a8b19677d818fb41ee55f310233772e15aa1a2b]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- Lib/plistlib.py                               | 31 ++++++++++------
- Lib/test/test_plistlib.py                     | 37 +++++++++++++++++--
- ...-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst |  5 +++
- 3 files changed, 59 insertions(+), 14 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst
-
-diff --git a/Lib/plistlib.py b/Lib/plistlib.py
-index 3292c30d5f..c5554ea1f7 100644
---- a/Lib/plistlib.py
-+++ b/Lib/plistlib.py
-@@ -73,6 +73,9 @@ from xml.parsers.expat import ParserCreate
- PlistFormat = enum.Enum('PlistFormat', 'FMT_XML FMT_BINARY', module=__name__)
- globals().update(PlistFormat.__members__)
- 
-+# Data larger than this will be read in chunks, to prevent extreme
-+# overallocation.
-+_MIN_READ_BUF_SIZE = 1 << 20
- 
- class UID:
-     def __init__(self, data):
-@@ -499,12 +502,24 @@ class _BinaryPlistParser:
- 
-         return tokenL
- 
-+    def _read(self, size):
-+        cursize = min(size, _MIN_READ_BUF_SIZE)
-+        data = self._fp.read(cursize)
-+        while True:
-+            if len(data) != cursize:
-+                raise InvalidFileException
-+            if cursize == size:
-+                return data
-+            delta = min(cursize, size - cursize)
-+            data += self._fp.read(delta)
-+            cursize += delta
-+
-     def _read_ints(self, n, size):
--        data = self._fp.read(size * n)
-+        data = self._read(size * n)
-         if size in _BINARY_FORMAT:
-             return struct.unpack(f'>{n}{_BINARY_FORMAT[size]}', data)
-         else:
--            if not size or len(data) != size * n:
-+            if not size:
-                 raise InvalidFileException()
-             return tuple(int.from_bytes(data[i: i + size], 'big')
-                          for i in range(0, size * n, size))
-@@ -561,22 +576,16 @@ class _BinaryPlistParser:
- 
-         elif tokenH == 0x40:  # data
-             s = self._get_size(tokenL)
--            result = self._fp.read(s)
--            if len(result) != s:
--                raise InvalidFileException()
-+            result = self._read(s)
- 
-         elif tokenH == 0x50:  # ascii string
-             s = self._get_size(tokenL)
--            data = self._fp.read(s)
--            if len(data) != s:
--                raise InvalidFileException()
-+            data = self._read(s)
-             result = data.decode('ascii')
- 
-         elif tokenH == 0x60:  # unicode string
-             s = self._get_size(tokenL) * 2
--            data = self._fp.read(s)
--            if len(data) != s:
--                raise InvalidFileException()
-+            data = self._read(s)
-             result = data.decode('utf-16be')
- 
-         elif tokenH == 0x80:  # UID
-diff --git a/Lib/test/test_plistlib.py b/Lib/test/test_plistlib.py
-index fa46050658..229a5a242e 100644
---- a/Lib/test/test_plistlib.py
-+++ b/Lib/test/test_plistlib.py
-@@ -838,8 +838,7 @@ class TestPlistlib(unittest.TestCase):
- 
- class TestBinaryPlistlib(unittest.TestCase):
- 
--    @staticmethod
--    def decode(*objects, offset_size=1, ref_size=1):
-+    def build(self, *objects, offset_size=1, ref_size=1):
-         data = [b'bplist00']
-         offset = 8
-         offsets = []
-@@ -851,7 +850,11 @@ class TestBinaryPlistlib(unittest.TestCase):
-                            len(objects), 0, offset)
-         data.extend(offsets)
-         data.append(tail)
--        return plistlib.loads(b''.join(data), fmt=plistlib.FMT_BINARY)
-+        return b''.join(data)
-+
-+    def decode(self, *objects, offset_size=1, ref_size=1):
-+        data = self.build(*objects, offset_size=offset_size, ref_size=ref_size)
-+        return plistlib.loads(data, fmt=plistlib.FMT_BINARY)
- 
-     def test_nonstandard_refs_size(self):
-         # Issue #21538: Refs and offsets are 24-bit integers
-@@ -959,6 +962,34 @@ class TestBinaryPlistlib(unittest.TestCase):
-                 with self.assertRaises(plistlib.InvalidFileException):
-                     plistlib.loads(b'bplist00' + data, fmt=plistlib.FMT_BINARY)
- 
-+    def test_truncated_large_data(self):
-+        self.addCleanup(os_helper.unlink, os_helper.TESTFN)
-+        def check(data):
-+            with open(os_helper.TESTFN, 'wb') as f:
-+                f.write(data)
-+            # buffered file
-+            with open(os_helper.TESTFN, 'rb') as f:
-+                with self.assertRaises(plistlib.InvalidFileException):
-+                    plistlib.load(f, fmt=plistlib.FMT_BINARY)
-+            # unbuffered file
-+            with open(os_helper.TESTFN, 'rb', buffering=0) as f:
-+                with self.assertRaises(plistlib.InvalidFileException):
-+                    plistlib.load(f, fmt=plistlib.FMT_BINARY)
-+        for w in range(20, 64):
-+            s = 1 << w
-+            # data
-+            check(self.build(b'\x4f\x13' + s.to_bytes(8, 'big')))
-+            # ascii string
-+            check(self.build(b'\x5f\x13' + s.to_bytes(8, 'big')))
-+            # unicode string
-+            check(self.build(b'\x6f\x13' + s.to_bytes(8, 'big')))
-+            # array
-+            check(self.build(b'\xaf\x13' + s.to_bytes(8, 'big')))
-+            # dict
-+            check(self.build(b'\xdf\x13' + s.to_bytes(8, 'big')))
-+            # number of objects
-+            check(b'bplist00' + struct.pack('>6xBBQQQ', 1, 1, s, 0, 8))
-+
- 
- class TestKeyedArchive(unittest.TestCase):
-     def test_keyed_archive_data(self):
-diff --git a/Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst b/Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst
-new file mode 100644
-index 0000000000..04fd8faca4
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst
-@@ -0,0 +1,5 @@
-+Fix a potential memory denial of service in the :mod:`plistlib` module.
-+When reading a Plist file received from untrusted source, it could cause
-+an arbitrary amount of memory to be allocated.
-+This could have led to symptoms including a :exc:`MemoryError`, swapping, out
-+of memory (OOM) killed processes or containers, or even system crashes.
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-6075.patch b/meta/recipes-devtools/python/python3/CVE-2025-6075.patch
deleted file mode 100644
index eab5a882a0d..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-6075.patch
+++ /dev/null
@@ -1,364 +0,0 @@
-From 892747b4cf0f95ba8beb51c0d0658bfaa381ebca Mon Sep 17 00:00:00 2001
-From: Łukasz Langa <lukasz@langa.pl>
-Date: Fri, 31 Oct 2025 17:51:32 +0100
-Subject: [PATCH] gh-136065: Fix quadratic complexity in os.path.expandvars()
- (GH-134952) (GH-140851)
-
-(cherry picked from commit f029e8db626ddc6e3a3beea4eff511a71aaceb5c)
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-
-CVE: CVE-2025-6075
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/892747b4cf0f95ba8beb51c0d0658bfaa381ebca]
-
-Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
----
- Lib/ntpath.py                                 | 126 ++++++------------
- Lib/posixpath.py                              |  43 +++---
- Lib/test/test_genericpath.py                  |  14 ++
- Lib/test/test_ntpath.py                       |  20 ++-
- ...-05-30-22-33-27.gh-issue-136065.bu337o.rst |   1 +
- 5 files changed, 93 insertions(+), 111 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
-
-diff --git a/Lib/ntpath.py b/Lib/ntpath.py
-index 9b0cca4..bd2b4e2 100644
---- a/Lib/ntpath.py
-+++ b/Lib/ntpath.py
-@@ -374,17 +374,23 @@ def expanduser(path):
- # XXX With COMMAND.COM you can use any characters in a variable name,
- # XXX except '^|<>='.
-
-+_varpattern = r"'[^']*'?|%(%|[^%]*%?)|\$(\$|[-\w]+|\{[^}]*\}?)"
-+_varsub = None
-+_varsubb = None
-+
- def expandvars(path):
-     """Expand shell variables of the forms $var, ${var} and %var%.
-
-     Unknown variables are left unchanged."""
-     path = os.fspath(path)
-+    global _varsub, _varsubb
-     if isinstance(path, bytes):
-         if b'$' not in path and b'%' not in path:
-             return path
--        import string
--        varchars = bytes(string.ascii_letters + string.digits + '_-', 'ascii')
--        quote = b'\''
-+        if not _varsubb:
-+            import re
-+            _varsubb = re.compile(_varpattern.encode(), re.ASCII).sub
-+        sub = _varsubb
-         percent = b'%'
-         brace = b'{'
-         rbrace = b'}'
-@@ -393,94 +399,44 @@ def expandvars(path):
-     else:
-         if '$' not in path and '%' not in path:
-             return path
--        import string
--        varchars = string.ascii_letters + string.digits + '_-'
--        quote = '\''
-+        if not _varsub:
-+            import re
-+            _varsub = re.compile(_varpattern, re.ASCII).sub
-+        sub = _varsub
-         percent = '%'
-         brace = '{'
-         rbrace = '}'
-         dollar = '$'
-         environ = os.environ
--    res = path[:0]
--    index = 0
--    pathlen = len(path)
--    while index < pathlen:
--        c = path[index:index+1]
--        if c == quote:   # no expansion within single quotes
--            path = path[index + 1:]
--            pathlen = len(path)
--            try:
--                index = path.index(c)
--                res += c + path[:index + 1]
--            except ValueError:
--                res += c + path
--                index = pathlen - 1
--        elif c == percent:  # variable or '%'
--            if path[index + 1:index + 2] == percent:
--                res += c
--                index += 1
--            else:
--                path = path[index+1:]
--                pathlen = len(path)
--                try:
--                    index = path.index(percent)
--                except ValueError:
--                    res += percent + path
--                    index = pathlen - 1
--                else:
--                    var = path[:index]
--                    try:
--                        if environ is None:
--                            value = os.fsencode(os.environ[os.fsdecode(var)])
--                        else:
--                            value = environ[var]
--                    except KeyError:
--                        value = percent + var + percent
--                    res += value
--        elif c == dollar:  # variable or '$$'
--            if path[index + 1:index + 2] == dollar:
--                res += c
--                index += 1
--            elif path[index + 1:index + 2] == brace:
--                path = path[index+2:]
--                pathlen = len(path)
--                try:
--                    index = path.index(rbrace)
--                except ValueError:
--                    res += dollar + brace + path
--                    index = pathlen - 1
--                else:
--                    var = path[:index]
--                    try:
--                        if environ is None:
--                            value = os.fsencode(os.environ[os.fsdecode(var)])
--                        else:
--                            value = environ[var]
--                    except KeyError:
--                        value = dollar + brace + var + rbrace
--                    res += value
--            else:
--                var = path[:0]
--                index += 1
--                c = path[index:index + 1]
--                while c and c in varchars:
--                    var += c
--                    index += 1
--                    c = path[index:index + 1]
--                try:
--                    if environ is None:
--                        value = os.fsencode(os.environ[os.fsdecode(var)])
--                    else:
--                        value = environ[var]
--                except KeyError:
--                    value = dollar + var
--                res += value
--                if c:
--                    index -= 1
-+
-+    def repl(m):
-+        lastindex = m.lastindex
-+        if lastindex is None:
-+            return m[0]
-+        name = m[lastindex]
-+        if lastindex == 1:
-+            if name == percent:
-+                return name
-+            if not name.endswith(percent):
-+                return m[0]
-+            name = name[:-1]
-         else:
--            res += c
--        index += 1
--    return res
-+            if name == dollar:
-+                return name
-+            if name.startswith(brace):
-+                if not name.endswith(rbrace):
-+                    return m[0]
-+                name = name[1:-1]
-+
-+        try:
-+            if environ is None:
-+                return os.fsencode(os.environ[os.fsdecode(name)])
-+            else:
-+                return environ[name]
-+        except KeyError:
-+            return m[0]
-+
-+    return sub(repl, path)
-
-
- # Normalize a path, e.g. A//B, A/./B and A/foo/../B all become A\B.
-diff --git a/Lib/posixpath.py b/Lib/posixpath.py
-index b8dd563..75020ee 100644
---- a/Lib/posixpath.py
-+++ b/Lib/posixpath.py
-@@ -279,42 +279,41 @@ def expanduser(path):
- # This expands the forms $variable and ${variable} only.
- # Non-existent variables are left unchanged.
-
--_varprog = None
--_varprogb = None
-+_varpattern = r'\$(\w+|\{[^}]*\}?)'
-+_varsub = None
-+_varsubb = None
-
- def expandvars(path):
-     """Expand shell variables of form $var and ${var}.  Unknown variables
-     are left unchanged."""
-     path = os.fspath(path)
--    global _varprog, _varprogb
-+    global _varsub, _varsubb
-     if isinstance(path, bytes):
-         if b'$' not in path:
-             return path
--        if not _varprogb:
-+        if not _varsubb:
-             import re
--            _varprogb = re.compile(br'\$(\w+|\{[^}]*\})', re.ASCII)
--        search = _varprogb.search
-+            _varsubb = re.compile(_varpattern.encode(), re.ASCII).sub
-+        sub = _varsubb
-         start = b'{'
-         end = b'}'
-         environ = getattr(os, 'environb', None)
-     else:
-         if '$' not in path:
-             return path
--        if not _varprog:
-+        if not _varsub:
-             import re
--            _varprog = re.compile(r'\$(\w+|\{[^}]*\})', re.ASCII)
--        search = _varprog.search
-+            _varsub = re.compile(_varpattern, re.ASCII).sub
-+        sub = _varsub
-         start = '{'
-         end = '}'
-         environ = os.environ
--    i = 0
--    while True:
--        m = search(path, i)
--        if not m:
--            break
--        i, j = m.span(0)
--        name = m.group(1)
--        if name.startswith(start) and name.endswith(end):
-+
-+    def repl(m):
-+        name = m[1]
-+        if name.startswith(start):
-+            if not name.endswith(end):
-+                return m[0]
-             name = name[1:-1]
-         try:
-             if environ is None:
-@@ -322,13 +321,11 @@ def expandvars(path):
-             else:
-                 value = environ[name]
-         except KeyError:
--            i = j
-+            return m[0]
-         else:
--            tail = path[j:]
--            path = path[:i] + value
--            i = len(path)
--            path += tail
--    return path
-+            return value
-+
-+    return sub(repl, path)
-
-
- # Normalize a path, e.g. A//B, A/./B and A/foo/../B all become A/B.
-diff --git a/Lib/test/test_genericpath.py b/Lib/test/test_genericpath.py
-index 1ff7f75..b0a1326 100644
---- a/Lib/test/test_genericpath.py
-+++ b/Lib/test/test_genericpath.py
-@@ -7,6 +7,7 @@ import os
- import sys
- import unittest
- import warnings
-+from test import support
- from test.support import os_helper
- from test.support import warnings_helper
- from test.support.script_helper import assert_python_ok
-@@ -430,6 +431,19 @@ class CommonTest(GenericTest):
-                   os.fsencode('$bar%s bar' % nonascii))
-             check(b'$spam}bar', os.fsencode('%s}bar' % nonascii))
-
-+    @support.requires_resource('cpu')
-+    def test_expandvars_large(self):
-+        expandvars = self.pathmodule.expandvars
-+        with os_helper.EnvironmentVarGuard() as env:
-+            env.clear()
-+            env["A"] = "B"
-+            n = 100_000
-+            self.assertEqual(expandvars('$A'*n), 'B'*n)
-+            self.assertEqual(expandvars('${A}'*n), 'B'*n)
-+            self.assertEqual(expandvars('$A!'*n), 'B!'*n)
-+            self.assertEqual(expandvars('${A}A'*n), 'BA'*n)
-+            self.assertEqual(expandvars('${'*10*n), '${'*10*n)
-+
-     def test_abspath(self):
-         self.assertIn("foo", self.pathmodule.abspath("foo"))
-         with warnings.catch_warnings():
-diff --git a/Lib/test/test_ntpath.py b/Lib/test/test_ntpath.py
-index f790f77..161e57d 100644
---- a/Lib/test/test_ntpath.py
-+++ b/Lib/test/test_ntpath.py
-@@ -5,8 +5,8 @@ import sys
- import unittest
- import warnings
- from ntpath import ALLOW_MISSING
-+from test import support
- from test.support import os_helper
--from test.support import TestFailed
- from test.support.os_helper import FakePath
- from test import test_genericpath
- from tempfile import TemporaryFile
-@@ -56,7 +56,7 @@ def tester(fn, wantResult):
-     fn = fn.replace("\\", "\\\\")
-     gotResult = eval(fn)
-     if wantResult != gotResult and _norm(wantResult) != _norm(gotResult):
--        raise TestFailed("%s should return: %s but returned: %s" \
-+        raise support.TestFailed("%s should return: %s but returned: %s" \
-               %(str(fn), str(wantResult), str(gotResult)))
-
-     # then with bytes
-@@ -72,7 +72,7 @@ def tester(fn, wantResult):
-         warnings.simplefilter("ignore", DeprecationWarning)
-         gotResult = eval(fn)
-     if _norm(wantResult) != _norm(gotResult):
--        raise TestFailed("%s should return: %s but returned: %s" \
-+        raise support.TestFailed("%s should return: %s but returned: %s" \
-               %(str(fn), str(wantResult), repr(gotResult)))
-
-
-@@ -689,6 +689,19 @@ class TestNtpath(NtpathTestCase):
-             check('%spam%bar', '%sbar' % nonascii)
-             check('%{}%bar'.format(nonascii), 'ham%sbar' % nonascii)
-
-+    @support.requires_resource('cpu')
-+    def test_expandvars_large(self):
-+        expandvars = ntpath.expandvars
-+        with os_helper.EnvironmentVarGuard() as env:
-+            env.clear()
-+            env["A"] = "B"
-+            n = 100_000
-+            self.assertEqual(expandvars('%A%'*n), 'B'*n)
-+            self.assertEqual(expandvars('%A%A'*n), 'BA'*n)
-+            self.assertEqual(expandvars("''"*n + '%%'), "''"*n + '%')
-+            self.assertEqual(expandvars("%%"*n), "%"*n)
-+            self.assertEqual(expandvars("$$"*n), "$"*n)
-+
-     def test_expanduser(self):
-         tester('ntpath.expanduser("test")', 'test')
-
-@@ -923,6 +936,7 @@ class TestNtpath(NtpathTestCase):
-             self.assertIsInstance(b_final_path, bytes)
-             self.assertGreater(len(b_final_path), 0)
-
-+
- class NtCommonTest(test_genericpath.CommonTest, unittest.TestCase):
-     pathmodule = ntpath
-     attributes = ['relpath']
-diff --git a/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
-new file mode 100644
-index 0000000..1d152bb
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
-@@ -0,0 +1 @@
-+Fix quadratic complexity in :func:`os.path.expandvars`.
---
-2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.10.19.bb b/meta/recipes-devtools/python/python3_3.10.20.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.10.19.bb
rename to meta/recipes-devtools/python/python3_3.10.20.bb
index fbb2f80886b..88a57971b95 100644
--- a/meta/recipes-devtools/python/python3_3.10.19.bb
+++ b/meta/recipes-devtools/python/python3_3.10.20.bb
@@ -37,10 +37,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
-           file://CVE-2025-6075.patch \
-           file://CVE-2025-13836.patch \
-           file://CVE-2025-13837.patch \
-           file://CVE-2025-12084.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -49,7 +45,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "c8f4a596572201d81dd7df91f70e177e19a70f1d489968b54b5fbbf29a97c076"
+SRC_URI[sha256sum] = "de6517421601e39a9a3bc3e1bc4c7b2f239297423ee05e282598c83ec0647505"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

