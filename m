Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB72FF8840
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31969.1777064209903365135
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wOQpcZvU;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so77005855e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064208; x=1777669008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCFwxJihhmZNya3rrRVo5mrbGg3/IGHSY5XyxUM4ZIs=;
        b=wOQpcZvUUZNWQ3w724tcddWedPZK2Fe4cWGomy6epHbnPLODmVA/9ZJrklAzaqvuRL
         4pVT32XOCn6XlkzOFF9F/sULGUSBSODZgpC8xxMEaNcCOlwlTWNwxZSX3PQvTCURrJUr
         bFVPAL42y+wuE9Vg1Hi5E4GBW3gT1IQMeCSoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064208; x=1777669008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZCFwxJihhmZNya3rrRVo5mrbGg3/IGHSY5XyxUM4ZIs=;
        b=Jl4aDwcj+lfW/8FTf3W6LSQwelUWGdLS0vO9YZUBvyU2d+4YVtls0IYKi2Y7YQ7Ser
         y+Gh6ME30qYQZ2X/aG1zoT53kreynDVbdjAyf5LaQfp1OKzn3qPDAKoaPUZhQEhrpexJ
         IBgtuVi+gPWkQ9JYTDltLn87b5g0UPfDv3hTyBozEiAqFzoAk+Wyhwmk/vHp9HC+liex
         8pQscN4pHGOjo5q0Slo5FAEJtThS763fEfiPQPXs5lX6yDkuWFa9W/U/BHFzHIC6pR6Z
         KCxmN2CF3IQDX1BQS+DtUE//+3cn1DoDsEAScaJsKP3NUCDboYBtGpoUObE/4N8QdzWY
         W67g==
X-Gm-Message-State: AOJu0YztfMx3a/E1ZK/cjzRkhtJaXAR2Bvh3qPNeDtxl+KjUwHwobZx5
	eTfiZ+hxLkDAKD4tMggMzqPqY54zNnIKVoATQzDmWC8i5UMw/+y/1ZBPESyZLZ+XXFkuYaEKSwQ
	VhARtY6W3ezNB
X-Gm-Gg: AeBDies3DITwFMNnBSGbGa1z5cQZX6G9wsAZqtRADuZbIpys3Egpe6B5SxaMe76zyqN
	7iiDebKvFuEIq/9SEqQC2sUkUyLTjWtsfneClbznj85MTS15meMze1wBuQIlXNSZo/zBUG6JPva
	JjnL0Ab91PrSeDMtt1LvJk9fu2UC7RGxaWqV6oeTxy0QWPC6Q4rt6hS6GMnd9xABm3fb7qAmi4O
	+EqiRSrPPqTSVvC+Y4NQuaSzpFqmC04fc3KKA3U4O8ipqT6oGs39qcFVYGY3XTh6pLFUi6dONhN
	TGLqQLgs5E2iEYrdLJtQ2z8BuvAO0Cy03F9jfYp4EJloGJf3AjnOfhv38jgIxw5DumT8s00W0FQ
	BoCGoWMuQaOeHKmvdqKnwaQKUlU3nVZ87dxswI9dLBIn4CVAL2duu9guYdGntrKCsWWE7A/MU31
	Gm80u4VGK5ZjB7pc9ig3DR7GWk8XdtyuY/XgI0kSYpuQ9EZXh+NAXLpNHjL1wVtKTmI0zLDWP6l
	tHL9EIJLxlwqi4Mvvf9Iew9DmgdoanuNYwMOw==
X-Received: by 2002:a05:600c:890c:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488fb739cd9mr397660335e9.1.1777064207733;
        Fri, 24 Apr 2026 13:56:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/66] python3: upgrade 3.12.12 -> 3.12.13
Date: Fri, 24 Apr 2026 22:55:17 +0200
Message-ID: <8b0c626633a1e443cfb6e5f73c6120bff5f6a5ef.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235891

From: Vijay Anusuri <vanusuri@mvista.com>

Drop upstreamed patches.

Release information:
* https://www.python.org/downloads/release/python-31213/
* The release you're looking at is Python 3.12.13, a security bugfix
  release for the legacy 3.12 series.

Handles CVE-2024-6923 CVE-2025-12084 CVE-2025-13836 CVE-2025-13837
CVE-2025-15282 CVE-2025-59375 CVE-2026-0865 CVE-2026-24515 CVE-2026-25210

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
[YC: Full changelog: https://docs.python.org/release/3.12.13/whatsnew/changelog.html#python-3-12-13]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2025-12084.patch       | 144 -------
 .../python/python3/CVE-2025-13836.patch       | 162 --------
 .../python/python3/CVE-2025-13837.patch       | 162 --------
 .../python/python3/CVE-2025-6075.patch        | 355 ------------------
 ...{python3_3.12.12.bb => python3_3.12.13.bb} |   6 +-
 5 files changed, 1 insertion(+), 828 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch
 rename meta/recipes-devtools/python/{python3_3.12.12.bb => python3_3.12.13.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch b/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
deleted file mode 100644
index b7c0650cdc5..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 9c9dda6625a2a90d2a06c657eee021d6be19842d Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 22 Dec 2025 14:48:49 +0100
-Subject: [PATCH] [3.12] gh-142145: Remove quadratic behavior in node ID cache
- clearing (GH-142146) (#142211)
-
-* gh-142145: Remove quadratic behavior in node ID cache clearing (GH-142146)
-* gh-142754: Ensure that Element & Attr instances have the ownerDocument attribute (GH-142794)
-(cherry picked from commit 1cc7551b3f9f71efbc88d96dce90f82de98b2454)
-(cherry picked from commit 08d8e18ad81cd45bc4a27d6da478b51ea49486e4)
-(cherry picked from commit 8d2d7bb2e754f8649a68ce4116271a4932f76907)
-
-Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.github.com>
-Co-authored-by: Seth Michael Larson <seth@python.org>
-Co-authored-by: Petr Viktorin <encukou@gmail.com>
-Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
-Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-
-CVE: CVE-2025-12084
-Upstream-Status: Backport [https://github.com/python/cpython/commit/9c9dda6625a2a90d2a06c657eee021d6be19842d]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- Lib/test/test_minidom.py                      | 33 ++++++++++++++++++-
- Lib/xml/dom/minidom.py                        | 11 ++-----
- ...-12-01-09-36-45.gh-issue-142145.tcAUhg.rst |  6 ++++
- 3 files changed, 41 insertions(+), 9 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAUhg.rst
-
-diff --git a/Lib/test/test_minidom.py b/Lib/test/test_minidom.py
-index 699265ccadc..ab4823c8315 100644
---- a/Lib/test/test_minidom.py
-+++ b/Lib/test/test_minidom.py
-@@ -2,13 +2,14 @@
- 
- import copy
- import pickle
-+import time
- import io
- from test import support
- import unittest
- 
- import xml.dom.minidom
- 
--from xml.dom.minidom import parse, Attr, Node, Document, parseString
-+from xml.dom.minidom import parse, Attr, Node, Document, Element, parseString
- from xml.dom.minidom import getDOMImplementation
- from xml.parsers.expat import ExpatError
- 
-@@ -176,6 +177,36 @@ class MinidomTest(unittest.TestCase):
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
-index ef8a159833b..cada981f39f 100644
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
-index 00000000000..05c7df35d14
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
index b90fc5f0ec3..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From 14b1fdb0a94b96f86fc7b86671ea9582b8676628 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 22 Dec 2025 14:50:18 +0100
-Subject: [PATCH] [3.12] gh-119451: Fix a potential denial of service in
- http.client (GH-119454) (#142140)
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
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-
-CVE: CVE-2025-13836
-Upstream-Status: Backport [https://github.com/python/cpython/commit/14b1fdb0a94b96f86fc7b86671ea9582b8676628]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- Lib/http/client.py                            | 28 ++++++--
- Lib/test/test_httplib.py                      | 66 +++++++++++++++++++
- ...-05-23-11-47-48.gh-issue-119451.qkJe9-.rst |  5 ++
- 3 files changed, 95 insertions(+), 4 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
-
-diff --git a/Lib/http/client.py b/Lib/http/client.py
-index fb29923d942..70451d67d4c 100644
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
-@@ -639,10 +644,25 @@ class HTTPResponse(io.BufferedIOBase):
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
-index 01f5a101901..e46dac00779 100644
---- a/Lib/test/test_httplib.py
-+++ b/Lib/test/test_httplib.py
-@@ -1452,6 +1452,72 @@ class BasicTest(TestCase):
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
-index 00000000000..6d6f25cd2f8
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe9-.rst
-@@ -0,0 +1,5 @@
-+Fix a potential memory denial of service in the :mod:`http.client` module.
-+When connecting to a malicious server, it could cause
-+an arbitrary amount of memory to be allocated.
-+This could have led to symptoms including a :exc:`MemoryError`, swapping, out
-+of memory (OOM) killed processes or containers, or even system crashes.
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13837.patch b/meta/recipes-devtools/python/python3/CVE-2025-13837.patch
deleted file mode 100644
index 0f2e06a4912..00000000000
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
-@@ -841,8 +841,7 @@ class TestPlistlib(unittest.TestCase):
- 
- class TestBinaryPlistlib(unittest.TestCase):
- 
--    @staticmethod
--    def decode(*objects, offset_size=1, ref_size=1):
-+    def build(self, *objects, offset_size=1, ref_size=1):
-         data = [b'bplist00']
-         offset = 8
-         offsets = []
-@@ -854,7 +853,11 @@ class TestBinaryPlistlib(unittest.TestCase):
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
-@@ -963,6 +966,34 @@ class TestBinaryPlistlib(unittest.TestCase):
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
index 346af4df948..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-6075.patch
+++ /dev/null
@@ -1,355 +0,0 @@
-From 9ab89c026aa9611c4b0b67c288b8303a480fe742 Mon Sep 17 00:00:00 2001
-From: Łukasz Langa <lukasz@langa.pl>
-Date: Fri, 31 Oct 2025 17:58:09 +0100
-Subject: [PATCH] gh-136065: Fix quadratic complexity in os.path.expandvars()
- (GH-134952) (GH-140845)
-
-(cherry picked from commit f029e8db626ddc6e3a3beea4eff511a71aaceb5c)
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-Co-authored-by: Łukasz Langa <lukasz@langa.pl>
-
-CVE: CVE-2025-6075
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/9ab89c026aa9611c4b0b67c288b8303a480fe742]
-
-Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
----
- Lib/ntpath.py                                 | 126 ++++++------------
- Lib/posixpath.py                              |  43 +++---
- Lib/test/test_genericpath.py                  |  14 ++
- Lib/test/test_ntpath.py                       |  18 ++-
- ...-05-30-22-33-27.gh-issue-136065.bu337o.rst |   1 +
- 5 files changed, 92 insertions(+), 110 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
-
-diff --git a/Lib/ntpath.py b/Lib/ntpath.py
-index 1bef630..393d358 100644
---- a/Lib/ntpath.py
-+++ b/Lib/ntpath.py
-@@ -409,17 +409,23 @@ def expanduser(path):
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
-@@ -428,94 +434,44 @@ def expandvars(path):
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
-index 90a6f54..6306f14 100644
---- a/Lib/posixpath.py
-+++ b/Lib/posixpath.py
-@@ -314,42 +314,41 @@ def expanduser(path):
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
-@@ -357,13 +356,11 @@ def expandvars(path):
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
-index 3eefb72..1cec587 100644
---- a/Lib/test/test_genericpath.py
-+++ b/Lib/test/test_genericpath.py
-@@ -7,6 +7,7 @@ import os
- import sys
- import unittest
- import warnings
-+from test import support
- from test.support import is_emscripten
- from test.support import os_helper
- from test.support import warnings_helper
-@@ -443,6 +444,19 @@ class CommonTest(GenericTest):
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
-index ced9dc4..f4d5063 100644
---- a/Lib/test/test_ntpath.py
-+++ b/Lib/test/test_ntpath.py
-@@ -7,6 +7,7 @@ import sys
- import unittest
- import warnings
- from ntpath import ALLOW_MISSING
-+from test import support
- from test.support import cpython_only, os_helper
- from test.support import TestFailed, is_emscripten
- from test.support.os_helper import FakePath
-@@ -58,7 +59,7 @@ def tester(fn, wantResult):
-     fn = fn.replace("\\", "\\\\")
-     gotResult = eval(fn)
-     if wantResult != gotResult and _norm(wantResult) != _norm(gotResult):
--        raise TestFailed("%s should return: %s but returned: %s" \
-+        raise support.TestFailed("%s should return: %s but returned: %s" \
-               %(str(fn), str(wantResult), str(gotResult)))
-
-     # then with bytes
-@@ -74,7 +75,7 @@ def tester(fn, wantResult):
-         warnings.simplefilter("ignore", DeprecationWarning)
-         gotResult = eval(fn)
-     if _norm(wantResult) != _norm(gotResult):
--        raise TestFailed("%s should return: %s but returned: %s" \
-+        raise support.TestFailed("%s should return: %s but returned: %s" \
-               %(str(fn), str(wantResult), repr(gotResult)))
-
-
-@@ -882,6 +883,19 @@ class TestNtpath(NtpathTestCase):
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
-diff --git a/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
-new file mode 100644
-index 0000000..1d152bb
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu337o.rst
-@@ -0,0 +1 @@
-+Fix quadratic complexity in :func:`os.path.expandvars`.
---
-2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.12.12.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.12.12.bb
rename to meta/recipes-devtools/python/python3_3.12.13.bb
index ce2c830655d..5fa25235fe8 100644
--- a/meta/recipes-devtools/python/python3_3.12.12.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -34,17 +34,13 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
-           file://CVE-2025-6075.patch \
-           file://CVE-2025-12084.patch \
-           file://CVE-2025-13836.patch \
-           file://CVE-2025-13837.patch \
            "
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "fb85a13414b028c49ba18bbd523c2d055a30b56b18b92ce454ea2c51edc656c4"
+SRC_URI[sha256sum] = "c08bc65a81971c1dd5783182826503369466c7e67374d1646519adf05207b684"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

