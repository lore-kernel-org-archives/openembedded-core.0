Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C61DEF4EC9
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 06:54:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75353.1775544845546598000
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 23:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Kym3FTvn;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso38185585e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775544844; x=1776149644; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onlUPpG4OF6L9e0J+IrvvFPFlE7v+qIQsCFYurf5CC0=;
        b=Kym3FTvnBnwWaqZxqlD2xTZA2svgMvdYqw1vqwXufYS0TbeohXcGUUBOY7paUwl2P8
         3mJAIERGlxkyURk/xMcgctz8Xq8Wy1UAwOvpQZY5jQvBwQvWr42ivytzVrmhpCp+Exjt
         4c1wXQHKpNGMipPI/W6WWEEj9roVtvewNYALo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544844; x=1776149644;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=onlUPpG4OF6L9e0J+IrvvFPFlE7v+qIQsCFYurf5CC0=;
        b=I3V5keRPbcMqJbMG7YvYwIcJOcZqAK8BQdaTD3utS35LOP5q9k7VJCSz76EIh3Nj3j
         elayXTvpV2VjE98ZoT3/9pzj8UdAemLx/fndFgobzIaxfCNfm/Op2dXbeZp7CberhLlM
         Wb0WQ4PSNsJg60aZfOsEmYCFYdjBh6GKLJ02o+fog0jEwuB1RGsj8aegoiCKMqRVfp6B
         /AIRjahzHxEa0LNhxI2TO2Do/FYfhjc9zwPgW4tSac7RKmaZj8jNHcF7bmtSIkkD+//i
         /InZsF+R1R2b4XKJHQ+7UuNXBsOdAP7hVdI9+DxdujV1mBHdFoRHedDQ/Sfkfvcj+2jr
         D7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWSl9NQ0NBUFPD9cxQCKjbOviZNYwnecSDaQwYG2DzwY+WSr5WACGRXcv1Bu6Go8M4rzZDHmhMDy1giy6sWevNjWA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQRNVmvQgLG3zkK5pTYrx1+NKT9KVyMG29XJq0LO7vXjbTTwHd
	EzPbKodLdCT5N8gSXoKribR6dLmKC3LpviOntNh1KreQn1YN5chqjcs8lwefySAmjA+829Sa1Qs
	VS5q01jk=
X-Gm-Gg: AeBDieuip7M94toTGi+45j8L53Op8mcsrz6vgdfHC+8dYe99U/k2k8zYpid4Wj2TSvv
	ihWQXi4dIeIXp/khTXSkWrS59PTY8nPcPN/Mg+ofgpz93A4tx7vFqwWcaqWa2L2agxZpmvxsbM+
	eUsRjIot3lYHDSc+uDwSdax+B0BurOKtaZLMH2KOoghRYZYWrAV+HT3DWUkDiKrOa4UVVg3D93Z
	lxQuf6JwCMkJrIvwsQHgSE0NstOPqyaDgQCfKwG+29ozke7wh0Fh1/2ssPuJo2B1CoGzaG0+TpW
	QdqLH/7J9cOHU+anqVNGoK8i8swa6CHtBXvFlHrZsTqabzTunF2sEpLV0Nfa9GKklWJrnoZCTmc
	cXY1hg7pkgYSPC6nrIYVjIlTcB0Ggzyjnp0cQk3O/5kB8fiB/3wFZ+K4qveSgp7AJeikjxbryZ1
	gWUh/4tIgpZ1T3lfhykjgtEXyMr62vK4VXx0FcHeUypBr9zXWx70iJVhAC0vWdFq1aEbiBJiBMh
	iiHlEveQX7osag=
X-Received: by 2002:a05:600c:354d:b0:485:439b:683f with SMTP id 5b1f17b1804b1-4889979ff75mr203292795e9.20.1775544843362;
        Mon, 06 Apr 2026 23:54:03 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e8e897sm116255445e9.26.2026.04.06.23.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 23:54:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 08:54:02 +0200
Message-Id: <DHMQ4866I1F6.3ESGDXTBOPBT4@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][kirkstone][PATCH] python3: upgrade 3.10.19 -> 3.10.20
X-Mailer: aerc 0.20.0
References: <20260406134627.542578-1-vanusuri@mvista.com>
In-Reply-To: <20260406134627.542578-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234701

On Mon Apr 6, 2026 at 3:46 PM CEST, Vijay Anusuri via lists.openembedded.or=
g wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Drop upstreamed patches.
>
> Release information:
> * https://www.python.org/downloads/release/python-31020/
> * The release you're looking at is Python 3.10.20, a security bugfix rele=
ase for the legacy 3.10 series.
>
> Handles CVE-2024-6923 CVE-2025-6075 CVE-2025-12084 CVE-2025-13836 CVE-202=
5-13837
> CVE-2025-15282 CVE-2025-59375 CVE-2026-0865 CVE-2026-24515 CVE-2026-25210
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hello,

That succesfully passed testing:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3606
So, I'll include it in my branch.

Thanks!

>  .../python/python3/CVE-2025-12084.patch       | 171 --------
>  .../python/python3/CVE-2025-13836.patch       | 163 --------
>  .../python/python3/CVE-2025-13837.patch       | 162 --------
>  .../python/python3/CVE-2025-15282.patch       |  68 ----
>  .../python/python3/CVE-2025-6075.patch        | 364 ------------------
>  ...{python3_3.10.19.bb =3D> python3_3.10.20.bb} |   7 +-
>  6 files changed, 1 insertion(+), 934 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.p=
atch
>  delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.p=
atch
>  delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.p=
atch
>  delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-15282.p=
atch
>  delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.pa=
tch
>  rename meta/recipes-devtools/python/{python3_3.10.19.bb =3D> python3_3.1=
0.20.bb} (98%)
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch b/=
meta/recipes-devtools/python/python3/CVE-2025-12084.patch
> deleted file mode 100644
> index 0c9bb435ed..0000000000
> --- a/meta/recipes-devtools/python/python3/CVE-2025-12084.patch
> +++ /dev/null
> @@ -1,171 +0,0 @@
> -From c97e87593063d84a2bd9fe7068b30eb44de23dc0 Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Sun, 25 Jan 2026 18:10:49 +0100
> -Subject: [PATCH] [3.10] gh-142145: Remove quadratic behavior in node ID =
cache
> - clearing (GH-142146) (#142213)
> -
> -* gh-142145: Remove quadratic behavior in node ID cache clearing (GH-142=
146)
> -
> -* Remove quadratic behavior in node ID cache clearing
> -
> -Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.gith=
ub.com>
> -
> -* Add news fragment
> -
> -CVE: CVE-2025-12084
> -Upstream-Status: Backport [https://github.com/python/cpython/commit/c97e=
87593063d84a2bd9fe7068b30eb44de23dc0]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----------
> -(cherry picked from commit 08d8e18ad81cd45bc4a27d6da478b51ea49486e4)
> -
> -Co-authored-by: Seth Michael Larson <seth@python.org>
> -Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.gith=
ub.com>
> -
> -* [3.14] gh-142754: Ensure that Element & Attr instances have the ownerD=
ocument attribute (GH-142794) (#142818)
> -
> -gh-142754: Ensure that Element & Attr instances have the ownerDocument a=
ttribute (GH-142794)
> -(cherry picked from commit 1cc7551b3f9f71efbc88d96dce90f82de98b2454)
> -
> -Co-authored-by: Petr Viktorin <encukou@gmail.com>
> -Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.c=
om>
> -
> -* gh-142145: relax the no-longer-quadratic test timing (GH-143030)
> -
> -* gh-142145: relax the no-longer-quadratic test timing
> -
> -* require cpu resource
> -(cherry picked from commit 8d2d7bb2e754f8649a68ce4116271a4932f76907)
> -
> -Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com=
>
> -
> -* merge NEWS entries into one
> -
> ----------
> -
> -Co-authored-by: Seth Michael Larson <seth@python.org>
> -Co-authored-by: Jacob Walls <38668450+jacobtylerwalls@users.noreply.gith=
ub.com>
> -Co-authored-by: Petr Viktorin <encukou@gmail.com>
> -Co-authored-by: Hugo van Kemenade <1324225+hugovk@users.noreply.github.c=
om>
> -Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com=
>
> -Co-authored-by: Gregory P. Smith <greg@krypto.org>
> ----
> - Lib/test/test_minidom.py                      | 33 ++++++++++++++++++-
> - Lib/xml/dom/minidom.py                        | 11 ++-----
> - ...-12-01-09-36-45.gh-issue-142145.tcAUhg.rst |  6 ++++
> - 3 files changed, 41 insertions(+), 9 deletions(-)
> - create mode 100644 Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-iss=
ue-142145.tcAUhg.rst
> -
> -diff --git a/Lib/test/test_minidom.py b/Lib/test/test_minidom.py
> -index ef38c36210..c68bd990f7 100644
> ---- a/Lib/test/test_minidom.py
> -+++ b/Lib/test/test_minidom.py
> -@@ -2,6 +2,7 @@
> -=20
> - import copy
> - import pickle
> -+import time
> - import io
> - from test import support
> - import unittest
> -@@ -9,7 +10,7 @@ import unittest
> - import pyexpat
> - import xml.dom.minidom
> -=20
> --from xml.dom.minidom import parse, Attr, Node, Document, parseString
> -+from xml.dom.minidom import parse, Attr, Node, Document, Element, parse=
String
> - from xml.dom.minidom import getDOMImplementation
> - from xml.parsers.expat import ExpatError
> -=20
> -@@ -177,6 +178,36 @@ class MinidomTest(unittest.TestCase):
> -         self.confirm(dom.documentElement.childNodes[-1].data =3D=3D "He=
llo")
> -         dom.unlink()
> -=20
> -+    @support.requires_resource('cpu')
> -+    def testAppendChildNoQuadraticComplexity(self):
> -+        impl =3D getDOMImplementation()
> -+
> -+        newdoc =3D impl.createDocument(None, "some_tag", None)
> -+        top_element =3D newdoc.documentElement
> -+        children =3D [newdoc.createElement(f"child-{i}") for i in range=
(1, 2 ** 15 + 1)]
> -+        element =3D top_element
> -+
> -+        start =3D time.monotonic()
> -+        for child in children:
> -+            element.appendChild(child)
> -+            element =3D child
> -+        end =3D time.monotonic()
> -+
> -+        # This example used to take at least 30 seconds.
> -+        # Conservative assertion due to the wide variety of systems and
> -+        # build configs timing based tests wind up run under.
> -+        # A --with-address-sanitizer --with-pydebug build on a rpi5 sti=
ll
> -+        # completes this loop in <0.5 seconds.
> -+        self.assertLess(end - start, 4)
> -+
> -+    def testSetAttributeNodeWithoutOwnerDocument(self):
> -+        # regression test for gh-142754
> -+        elem =3D Element("test")
> -+        attr =3D Attr("id")
> -+        attr.value =3D "test-id"
> -+        elem.setAttributeNode(attr)
> -+        self.assertEqual(elem.getAttribute("id"), "test-id")
> -+
> -     def testAppendChildFragment(self):
> -         dom, orig, c1, c2, c3, frag =3D self._create_fragment_test_node=
s()
> -         dom.documentElement.appendChild(frag)
> -diff --git a/Lib/xml/dom/minidom.py b/Lib/xml/dom/minidom.py
> -index ef8a159833..cada981f39 100644
> ---- a/Lib/xml/dom/minidom.py
> -+++ b/Lib/xml/dom/minidom.py
> -@@ -292,13 +292,6 @@ def _append_child(self, node):
> -     childNodes.append(node)
> -     node.parentNode =3D self
> -=20
> --def _in_document(node):
> --    # return True iff node is part of a document tree
> --    while node is not None:
> --        if node.nodeType =3D=3D Node.DOCUMENT_NODE:
> --            return True
> --        node =3D node.parentNode
> --    return False
> -=20
> - def _write_data(writer, data):
> -     "Writes datachars to writer."
> -@@ -355,6 +348,7 @@ class Attr(Node):
> -     def __init__(self, qName, namespaceURI=3DEMPTY_NAMESPACE, localName=
=3DNone,
> -                  prefix=3DNone):
> -         self.ownerElement =3D None
> -+        self.ownerDocument =3D None
> -         self._name =3D qName
> -         self.namespaceURI =3D namespaceURI
> -         self._prefix =3D prefix
> -@@ -680,6 +674,7 @@ class Element(Node):
> -=20
> -     def __init__(self, tagName, namespaceURI=3DEMPTY_NAMESPACE, prefix=
=3DNone,
> -                  localName=3DNone):
> -+        self.ownerDocument =3D None
> -         self.parentNode =3D None
> -         self.tagName =3D self.nodeName =3D tagName
> -         self.prefix =3D prefix
> -@@ -1539,7 +1534,7 @@ def _clear_id_cache(node):
> -     if node.nodeType =3D=3D Node.DOCUMENT_NODE:
> -         node._id_cache.clear()
> -         node._id_search_stack =3D None
> --    elif _in_document(node):
> -+    elif node.ownerDocument:
> -         node.ownerDocument._id_cache.clear()
> -         node.ownerDocument._id_search_stack=3D None
> -=20
> -diff --git a/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-1421=
45.tcAUhg.rst b/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-1421=
45.tcAUhg.rst
> -new file mode 100644
> -index 0000000000..05c7df35d1
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2025-12-01-09-36-45.gh-issue-142145.tcAU=
hg.rst
> -@@ -0,0 +1,6 @@
> -+Remove quadratic behavior in ``xml.minidom`` node ID cache clearing.  I=
n order
> -+to do this without breaking existing users, we also add the *ownerDocum=
ent*
> -+attribute to :mod:`xml.dom.minidom` elements and attributes created by =
directly
> -+instantiating the ``Element`` or ``Attr`` class. Note that this way of =
creating
> -+nodes is not supported; creator functions like
> -+:py:meth:`xml.dom.Document.documentElement` should be used instead.
> diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch b/=
meta/recipes-devtools/python/python3/CVE-2025-13836.patch
> deleted file mode 100644
> index c4387b6019..0000000000
> --- a/meta/recipes-devtools/python/python3/CVE-2025-13836.patch
> +++ /dev/null
> @@ -1,163 +0,0 @@
> -From 289f29b0fe38baf2d7cb5854f4bb573cc34a6a15 Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Fri, 5 Dec 2025 16:21:57 +0100
> -Subject: [PATCH] [3.13] gh-119451: Fix a potential denial of service in
> - http.client (GH-119454) (#142139)
> -
> -gh-119451: Fix a potential denial of service in http.client (GH-119454)
> -
> -Reading the whole body of the HTTP response could cause OOM if
> -the Content-Length value is too large even if the server does not send
> -a large amount of data. Now the HTTP client reads large data by chunks,
> -therefore the amount of consumed memory is proportional to the amount
> -of sent data.
> -(cherry picked from commit 5a4c4a033a4a54481be6870aa1896fad732555b5)
> -
> -CVE: CVE-2025-13836
> -Upstream-Status: Backport [https://github.com/python/cpython/commit/289f=
29b0fe38baf2d7cb5854f4bb573cc34a6a15]
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - Lib/http/client.py                            | 28 ++++++--
> - Lib/test/test_httplib.py                      | 66 +++++++++++++++++++
> - ...-05-23-11-47-48.gh-issue-119451.qkJe9-.rst |  5 ++
> - 3 files changed, 95 insertions(+), 4 deletions(-)
> - create mode 100644 Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-iss=
ue-119451.qkJe9-.rst
> -
> -diff --git a/Lib/http/client.py b/Lib/http/client.py
> -index d1b7b10..c8ab5b7 100644
> ---- a/Lib/http/client.py
> -+++ b/Lib/http/client.py
> -@@ -111,6 +111,11 @@ responses =3D {v: v.phrase for v in http.HTTPStatus=
.__members__.values()}
> - _MAXLINE =3D 65536
> - _MAXHEADERS =3D 100
> -=20
> -+# Data larger than this will be read in chunks, to prevent extreme
> -+# overallocation.
> -+_MIN_READ_BUF_SIZE =3D 1 << 20
> -+
> -+
> - # Header name/value ABNF (http://tools.ietf.org/html/rfc7230#section-3.=
2)
> - #
> - # VCHAR          =3D %x21-7E
> -@@ -628,10 +633,25 @@ class HTTPResponse(io.BufferedIOBase):
> -         reading. If the bytes are truly not available (due to EOF), the=
n the
> -         IncompleteRead exception can be used to detect the problem.
> -         """
> --        data =3D self.fp.read(amt)
> --        if len(data) < amt:
> --            raise IncompleteRead(data, amt-len(data))
> --        return data
> -+        cursize =3D min(amt, _MIN_READ_BUF_SIZE)
> -+        data =3D self.fp.read(cursize)
> -+        if len(data) >=3D amt:
> -+            return data
> -+        if len(data) < cursize:
> -+            raise IncompleteRead(data, amt - len(data))
> -+
> -+        data =3D io.BytesIO(data)
> -+        data.seek(0, 2)
> -+        while True:
> -+            # This is a geometric increase in read size (never more tha=
n
> -+            # doubling out the current length of data per loop iteratio=
n).
> -+            delta =3D min(cursize, amt - cursize)
> -+            data.write(self.fp.read(delta))
> -+            if data.tell() >=3D amt:
> -+                return data.getvalue()
> -+            cursize +=3D delta
> -+            if data.tell() < cursize:
> -+                raise IncompleteRead(data.getvalue(), amt - data.tell()=
)
> -=20
> -     def _safe_readinto(self, b):
> -         """Same as _safe_read, but for reading into a buffer."""
> -diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
> -index 77152cf..89ec5f6 100644
> ---- a/Lib/test/test_httplib.py
> -+++ b/Lib/test/test_httplib.py
> -@@ -1226,6 +1226,72 @@ class BasicTest(TestCase):
> -         thread.join()
> -         self.assertEqual(result, b"proxied data\n")
> -=20
> -+    def test_large_content_length(self):
> -+        serv =3D socket.create_server((HOST, 0))
> -+        self.addCleanup(serv.close)
> -+
> -+        def run_server():
> -+            [conn, address] =3D serv.accept()
> -+            with conn:
> -+                while conn.recv(1024):
> -+                    conn.sendall(
> -+                        b"HTTP/1.1 200 Ok\r\n"
> -+                        b"Content-Length: %d\r\n"
> -+                        b"\r\n" % size)
> -+                    conn.sendall(b'A' * (size//3))
> -+                    conn.sendall(b'B' * (size - size//3))
> -+
> -+        thread =3D threading.Thread(target=3Drun_server)
> -+        thread.start()
> -+        self.addCleanup(thread.join, 1.0)
> -+
> -+        conn =3D client.HTTPConnection(*serv.getsockname())
> -+        try:
> -+            for w in range(15, 27):
> -+                size =3D 1 << w
> -+                conn.request("GET", "/")
> -+                with conn.getresponse() as response:
> -+                    self.assertEqual(len(response.read()), size)
> -+        finally:
> -+            conn.close()
> -+            thread.join(1.0)
> -+
> -+    def test_large_content_length_truncated(self):
> -+        serv =3D socket.create_server((HOST, 0))
> -+        self.addCleanup(serv.close)
> -+
> -+        def run_server():
> -+            while True:
> -+                [conn, address] =3D serv.accept()
> -+                with conn:
> -+                    conn.recv(1024)
> -+                    if not size:
> -+                        break
> -+                    conn.sendall(
> -+                        b"HTTP/1.1 200 Ok\r\n"
> -+                        b"Content-Length: %d\r\n"
> -+                        b"\r\n"
> -+                        b"Text" % size)
> -+
> -+        thread =3D threading.Thread(target=3Drun_server)
> -+        thread.start()
> -+        self.addCleanup(thread.join, 1.0)
> -+
> -+        conn =3D client.HTTPConnection(*serv.getsockname())
> -+        try:
> -+            for w in range(18, 65):
> -+                size =3D 1 << w
> -+                conn.request("GET", "/")
> -+                with conn.getresponse() as response:
> -+                    self.assertRaises(client.IncompleteRead, response.r=
ead)
> -+                conn.close()
> -+        finally:
> -+            conn.close()
> -+            size =3D 0
> -+            conn.request("GET", "/")
> -+            conn.close()
> -+            thread.join(1.0)
> -+
> -     def test_putrequest_override_domain_validation(self):
> -         """
> -         It should be possible to override the default validation
> -diff --git a/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-1194=
51.qkJe9-.rst b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-1194=
51.qkJe9-.rst
> -new file mode 100644
> -index 0000000..6d6f25c
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2024-05-23-11-47-48.gh-issue-119451.qkJe=
9-.rst
> -@@ -0,0 +1,5 @@
> -+Fix a potential memory denial of service in the :mod:`http.client` modu=
le.
> -+When connecting to a malicious server, it could cause
> -+an arbitrary amount of memory to be allocated.
> -+This could have led to symptoms including a :exc:`MemoryError`, swappin=
g, out
> -+of memory (OOM) killed processes or containers, or even system crashes.
> ---=20
> -2.50.1
> -
> diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13837.patch b/=
meta/recipes-devtools/python/python3/CVE-2025-13837.patch
> deleted file mode 100644
> index 36bf75792b..0000000000
> --- a/meta/recipes-devtools/python/python3/CVE-2025-13837.patch
> +++ /dev/null
> @@ -1,162 +0,0 @@
> -From 5a8b19677d818fb41ee55f310233772e15aa1a2b Mon Sep 17 00:00:00 2001
> -From: Serhiy Storchaka <storchaka@gmail.com>
> -Date: Mon, 22 Dec 2025 15:49:44 +0200
> -Subject: [PATCH] [3.12] gh-119342: Fix a potential denial of service in
> - plistlib (GH-119343) (#142149)
> -
> -Reading a specially prepared small Plist file could cause OOM because fi=
le's
> -read(n) preallocates a bytes object for reading the specified amount of
> -data. Now plistlib reads large data by chunks, therefore the upper limit=
 of
> -consumed memory is proportional to the size of the input file.
> -(cherry picked from commit 694922cf40aa3a28f898b5f5ee08b71b4922df70)
> -
> -CVE: CVE-2025-13837
> -Upstream-Status: Backport [https://github.com/python/cpython/commit/5a8b=
19677d818fb41ee55f310233772e15aa1a2b]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - Lib/plistlib.py                               | 31 ++++++++++------
> - Lib/test/test_plistlib.py                     | 37 +++++++++++++++++--
> - ...-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst |  5 +++
> - 3 files changed, 59 insertions(+), 14 deletions(-)
> - create mode 100644 Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-iss=
ue-119342.BTFj4Z.rst
> -
> -diff --git a/Lib/plistlib.py b/Lib/plistlib.py
> -index 3292c30d5f..c5554ea1f7 100644
> ---- a/Lib/plistlib.py
> -+++ b/Lib/plistlib.py
> -@@ -73,6 +73,9 @@ from xml.parsers.expat import ParserCreate
> - PlistFormat =3D enum.Enum('PlistFormat', 'FMT_XML FMT_BINARY', module=
=3D__name__)
> - globals().update(PlistFormat.__members__)
> -=20
> -+# Data larger than this will be read in chunks, to prevent extreme
> -+# overallocation.
> -+_MIN_READ_BUF_SIZE =3D 1 << 20
> -=20
> - class UID:
> -     def __init__(self, data):
> -@@ -499,12 +502,24 @@ class _BinaryPlistParser:
> -=20
> -         return tokenL
> -=20
> -+    def _read(self, size):
> -+        cursize =3D min(size, _MIN_READ_BUF_SIZE)
> -+        data =3D self._fp.read(cursize)
> -+        while True:
> -+            if len(data) !=3D cursize:
> -+                raise InvalidFileException
> -+            if cursize =3D=3D size:
> -+                return data
> -+            delta =3D min(cursize, size - cursize)
> -+            data +=3D self._fp.read(delta)
> -+            cursize +=3D delta
> -+
> -     def _read_ints(self, n, size):
> --        data =3D self._fp.read(size * n)
> -+        data =3D self._read(size * n)
> -         if size in _BINARY_FORMAT:
> -             return struct.unpack(f'>{n}{_BINARY_FORMAT[size]}', data)
> -         else:
> --            if not size or len(data) !=3D size * n:
> -+            if not size:
> -                 raise InvalidFileException()
> -             return tuple(int.from_bytes(data[i: i + size], 'big')
> -                          for i in range(0, size * n, size))
> -@@ -561,22 +576,16 @@ class _BinaryPlistParser:
> -=20
> -         elif tokenH =3D=3D 0x40:  # data
> -             s =3D self._get_size(tokenL)
> --            result =3D self._fp.read(s)
> --            if len(result) !=3D s:
> --                raise InvalidFileException()
> -+            result =3D self._read(s)
> -=20
> -         elif tokenH =3D=3D 0x50:  # ascii string
> -             s =3D self._get_size(tokenL)
> --            data =3D self._fp.read(s)
> --            if len(data) !=3D s:
> --                raise InvalidFileException()
> -+            data =3D self._read(s)
> -             result =3D data.decode('ascii')
> -=20
> -         elif tokenH =3D=3D 0x60:  # unicode string
> -             s =3D self._get_size(tokenL) * 2
> --            data =3D self._fp.read(s)
> --            if len(data) !=3D s:
> --                raise InvalidFileException()
> -+            data =3D self._read(s)
> -             result =3D data.decode('utf-16be')
> -=20
> -         elif tokenH =3D=3D 0x80:  # UID
> -diff --git a/Lib/test/test_plistlib.py b/Lib/test/test_plistlib.py
> -index fa46050658..229a5a242e 100644
> ---- a/Lib/test/test_plistlib.py
> -+++ b/Lib/test/test_plistlib.py
> -@@ -838,8 +838,7 @@ class TestPlistlib(unittest.TestCase):
> -=20
> - class TestBinaryPlistlib(unittest.TestCase):
> -=20
> --    @staticmethod
> --    def decode(*objects, offset_size=3D1, ref_size=3D1):
> -+    def build(self, *objects, offset_size=3D1, ref_size=3D1):
> -         data =3D [b'bplist00']
> -         offset =3D 8
> -         offsets =3D []
> -@@ -851,7 +850,11 @@ class TestBinaryPlistlib(unittest.TestCase):
> -                            len(objects), 0, offset)
> -         data.extend(offsets)
> -         data.append(tail)
> --        return plistlib.loads(b''.join(data), fmt=3Dplistlib.FMT_BINARY=
)
> -+        return b''.join(data)
> -+
> -+    def decode(self, *objects, offset_size=3D1, ref_size=3D1):
> -+        data =3D self.build(*objects, offset_size=3Doffset_size, ref_si=
ze=3Dref_size)
> -+        return plistlib.loads(data, fmt=3Dplistlib.FMT_BINARY)
> -=20
> -     def test_nonstandard_refs_size(self):
> -         # Issue #21538: Refs and offsets are 24-bit integers
> -@@ -959,6 +962,34 @@ class TestBinaryPlistlib(unittest.TestCase):
> -                 with self.assertRaises(plistlib.InvalidFileException):
> -                     plistlib.loads(b'bplist00' + data, fmt=3Dplistlib.F=
MT_BINARY)
> -=20
> -+    def test_truncated_large_data(self):
> -+        self.addCleanup(os_helper.unlink, os_helper.TESTFN)
> -+        def check(data):
> -+            with open(os_helper.TESTFN, 'wb') as f:
> -+                f.write(data)
> -+            # buffered file
> -+            with open(os_helper.TESTFN, 'rb') as f:
> -+                with self.assertRaises(plistlib.InvalidFileException):
> -+                    plistlib.load(f, fmt=3Dplistlib.FMT_BINARY)
> -+            # unbuffered file
> -+            with open(os_helper.TESTFN, 'rb', buffering=3D0) as f:
> -+                with self.assertRaises(plistlib.InvalidFileException):
> -+                    plistlib.load(f, fmt=3Dplistlib.FMT_BINARY)
> -+        for w in range(20, 64):
> -+            s =3D 1 << w
> -+            # data
> -+            check(self.build(b'\x4f\x13' + s.to_bytes(8, 'big')))
> -+            # ascii string
> -+            check(self.build(b'\x5f\x13' + s.to_bytes(8, 'big')))
> -+            # unicode string
> -+            check(self.build(b'\x6f\x13' + s.to_bytes(8, 'big')))
> -+            # array
> -+            check(self.build(b'\xaf\x13' + s.to_bytes(8, 'big')))
> -+            # dict
> -+            check(self.build(b'\xdf\x13' + s.to_bytes(8, 'big')))
> -+            # number of objects
> -+            check(b'bplist00' + struct.pack('>6xBBQQQ', 1, 1, s, 0, 8))
> -+
> -=20
> - class TestKeyedArchive(unittest.TestCase):
> -     def test_keyed_archive_data(self):
> -diff --git a/Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-1193=
42.BTFj4Z.rst b/Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-1193=
42.BTFj4Z.rst
> -new file mode 100644
> -index 0000000000..04fd8faca4
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-119342.BTFj=
4Z.rst
> -@@ -0,0 +1,5 @@
> -+Fix a potential memory denial of service in the :mod:`plistlib` module.
> -+When reading a Plist file received from untrusted source, it could caus=
e
> -+an arbitrary amount of memory to be allocated.
> -+This could have led to symptoms including a :exc:`MemoryError`, swappin=
g, out
> -+of memory (OOM) killed processes or containers, or even system crashes.
> diff --git a/meta/recipes-devtools/python/python3/CVE-2025-15282.patch b/=
meta/recipes-devtools/python/python3/CVE-2025-15282.patch
> deleted file mode 100644
> index 80ef2fcde8..0000000000
> --- a/meta/recipes-devtools/python/python3/CVE-2025-15282.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From 34d76b00dabde81a793bd06dd8ecb057838c4b38 Mon Sep 17 00:00:00 2001
> -From: Seth Michael Larson <seth@python.org>
> -Date: Sun, 25 Jan 2026 11:05:15 -0600
> -Subject: [PATCH] [3.10] gh-143925: Reject control characters in data: UR=
L
> - mediatypes (#144115)
> -
> -(cherry picked from commit f25509e78e8be6ea73c811ac2b8c928c28841b9f)
> -(cherry picked from commit 2c9c746077d8119b5bcf5142316992e464594946)
> -
> -Upstream-Status: Backport [https://github.com/python/cpython/commit/34d7=
6b00dabde81a793bd06dd8ecb057838c4b38]
> -CVE: CVE-2025-15282
> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ----
> - Lib/test/test_urllib.py                                   | 8 ++++++++
> - Lib/urllib/request.py                                     | 5 +++++
> - .../2026-01-16-11-51-19.gh-issue-143925.mrtcHW.rst        | 1 +
> - 3 files changed, 14 insertions(+)
> - create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-iss=
ue-143925.mrtcHW.rst
> -
> -diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
> -index 82f1d9dc2e7bb3..b08fc8f2b19463 100644
> ---- a/Lib/test/test_urllib.py
> -+++ b/Lib/test/test_urllib.py
> -@@ -11,6 +11,7 @@
> - from test import support
> - from test.support import os_helper
> - from test.support import warnings_helper
> -+from test.support import control_characters_c0
> - import os
> - try:
> -     import ssl
> -@@ -683,6 +684,13 @@ def test_invalid_base64_data(self):
> -         # missing padding character
> -         self.assertRaises(ValueError,urllib.request.urlopen,'data:;base=
64,Cg=3D')
> -=20
> -+    def test_invalid_mediatype(self):
> -+        for c0 in control_characters_c0():
> -+            self.assertRaises(ValueError,urllib.request.urlopen,
> -+                              f'data:text/html;{c0},data')
> -+        for c0 in control_characters_c0():
> -+            self.assertRaises(ValueError,urllib.request.urlopen,
> -+                              f'data:text/html{c0};base64,ZGF0YQ=3D=3D'=
)
> -=20
> - class urlretrieve_FileTests(unittest.TestCase):
> -     """Test urllib.urlretrieve() on local files"""
> -diff --git a/Lib/urllib/request.py b/Lib/urllib/request.py
> -index 6edde1f73189b1..c378a86a70cbeb 100644
> ---- a/Lib/urllib/request.py
> -+++ b/Lib/urllib/request.py
> -@@ -1654,6 +1654,11 @@ def data_open(self, req):
> -         scheme, data =3D url.split(":",1)
> -         mediatype, data =3D data.split(",",1)
> -=20
> -+        # Disallow control characters within mediatype.
> -+        if re.search(r"[\x00-\x1F\x7F]", mediatype):
> -+            raise ValueError(
> -+                "Control characters not allowed in data: mediatype")
> -+
> -         # even base64 encoded data URLs might be quoted so unquote in a=
ny case:
> -         data =3D unquote_to_bytes(data)
> -         if mediatype.endswith(";base64"):
> -diff --git a/Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-1439=
25.mrtcHW.rst b/Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-1439=
25.mrtcHW.rst
> -new file mode 100644
> -index 00000000000000..46109dfbef3ee7
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-143925.mrtc=
HW.rst
> -@@ -0,0 +1 @@
> -+Reject control characters in ``data:`` URL media types.
> diff --git a/meta/recipes-devtools/python/python3/CVE-2025-6075.patch b/m=
eta/recipes-devtools/python/python3/CVE-2025-6075.patch
> deleted file mode 100644
> index eab5a882a0..0000000000
> --- a/meta/recipes-devtools/python/python3/CVE-2025-6075.patch
> +++ /dev/null
> @@ -1,364 +0,0 @@
> -From 892747b4cf0f95ba8beb51c0d0658bfaa381ebca Mon Sep 17 00:00:00 2001
> -From: =C5=81ukasz Langa <lukasz@langa.pl>
> -Date: Fri, 31 Oct 2025 17:51:32 +0100
> -Subject: [PATCH] gh-136065: Fix quadratic complexity in os.path.expandva=
rs()
> - (GH-134952) (GH-140851)
> -
> -(cherry picked from commit f029e8db626ddc6e3a3beea4eff511a71aaceb5c)
> -
> -Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
> -
> -CVE: CVE-2025-6075
> -
> -Upstream-Status: Backport [https://github.com/python/cpython/commit/8927=
47b4cf0f95ba8beb51c0d0658bfaa381ebca]
> -
> -Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ----
> - Lib/ntpath.py                                 | 126 ++++++------------
> - Lib/posixpath.py                              |  43 +++---
> - Lib/test/test_genericpath.py                  |  14 ++
> - Lib/test/test_ntpath.py                       |  20 ++-
> - ...-05-30-22-33-27.gh-issue-136065.bu337o.rst |   1 +
> - 5 files changed, 93 insertions(+), 111 deletions(-)
> - create mode 100644 Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-iss=
ue-136065.bu337o.rst
> -
> -diff --git a/Lib/ntpath.py b/Lib/ntpath.py
> -index 9b0cca4..bd2b4e2 100644
> ---- a/Lib/ntpath.py
> -+++ b/Lib/ntpath.py
> -@@ -374,17 +374,23 @@ def expanduser(path):
> - # XXX With COMMAND.COM you can use any characters in a variable name,
> - # XXX except '^|<>=3D'.
> -
> -+_varpattern =3D r"'[^']*'?|%(%|[^%]*%?)|\$(\$|[-\w]+|\{[^}]*\}?)"
> -+_varsub =3D None
> -+_varsubb =3D None
> -+
> - def expandvars(path):
> -     """Expand shell variables of the forms $var, ${var} and %var%.
> -
> -     Unknown variables are left unchanged."""
> -     path =3D os.fspath(path)
> -+    global _varsub, _varsubb
> -     if isinstance(path, bytes):
> -         if b'$' not in path and b'%' not in path:
> -             return path
> --        import string
> --        varchars =3D bytes(string.ascii_letters + string.digits + '_-',=
 'ascii')
> --        quote =3D b'\''
> -+        if not _varsubb:
> -+            import re
> -+            _varsubb =3D re.compile(_varpattern.encode(), re.ASCII).sub
> -+        sub =3D _varsubb
> -         percent =3D b'%'
> -         brace =3D b'{'
> -         rbrace =3D b'}'
> -@@ -393,94 +399,44 @@ def expandvars(path):
> -     else:
> -         if '$' not in path and '%' not in path:
> -             return path
> --        import string
> --        varchars =3D string.ascii_letters + string.digits + '_-'
> --        quote =3D '\''
> -+        if not _varsub:
> -+            import re
> -+            _varsub =3D re.compile(_varpattern, re.ASCII).sub
> -+        sub =3D _varsub
> -         percent =3D '%'
> -         brace =3D '{'
> -         rbrace =3D '}'
> -         dollar =3D '$'
> -         environ =3D os.environ
> --    res =3D path[:0]
> --    index =3D 0
> --    pathlen =3D len(path)
> --    while index < pathlen:
> --        c =3D path[index:index+1]
> --        if c =3D=3D quote:   # no expansion within single quotes
> --            path =3D path[index + 1:]
> --            pathlen =3D len(path)
> --            try:
> --                index =3D path.index(c)
> --                res +=3D c + path[:index + 1]
> --            except ValueError:
> --                res +=3D c + path
> --                index =3D pathlen - 1
> --        elif c =3D=3D percent:  # variable or '%'
> --            if path[index + 1:index + 2] =3D=3D percent:
> --                res +=3D c
> --                index +=3D 1
> --            else:
> --                path =3D path[index+1:]
> --                pathlen =3D len(path)
> --                try:
> --                    index =3D path.index(percent)
> --                except ValueError:
> --                    res +=3D percent + path
> --                    index =3D pathlen - 1
> --                else:
> --                    var =3D path[:index]
> --                    try:
> --                        if environ is None:
> --                            value =3D os.fsencode(os.environ[os.fsdecod=
e(var)])
> --                        else:
> --                            value =3D environ[var]
> --                    except KeyError:
> --                        value =3D percent + var + percent
> --                    res +=3D value
> --        elif c =3D=3D dollar:  # variable or '$$'
> --            if path[index + 1:index + 2] =3D=3D dollar:
> --                res +=3D c
> --                index +=3D 1
> --            elif path[index + 1:index + 2] =3D=3D brace:
> --                path =3D path[index+2:]
> --                pathlen =3D len(path)
> --                try:
> --                    index =3D path.index(rbrace)
> --                except ValueError:
> --                    res +=3D dollar + brace + path
> --                    index =3D pathlen - 1
> --                else:
> --                    var =3D path[:index]
> --                    try:
> --                        if environ is None:
> --                            value =3D os.fsencode(os.environ[os.fsdecod=
e(var)])
> --                        else:
> --                            value =3D environ[var]
> --                    except KeyError:
> --                        value =3D dollar + brace + var + rbrace
> --                    res +=3D value
> --            else:
> --                var =3D path[:0]
> --                index +=3D 1
> --                c =3D path[index:index + 1]
> --                while c and c in varchars:
> --                    var +=3D c
> --                    index +=3D 1
> --                    c =3D path[index:index + 1]
> --                try:
> --                    if environ is None:
> --                        value =3D os.fsencode(os.environ[os.fsdecode(va=
r)])
> --                    else:
> --                        value =3D environ[var]
> --                except KeyError:
> --                    value =3D dollar + var
> --                res +=3D value
> --                if c:
> --                    index -=3D 1
> -+
> -+    def repl(m):
> -+        lastindex =3D m.lastindex
> -+        if lastindex is None:
> -+            return m[0]
> -+        name =3D m[lastindex]
> -+        if lastindex =3D=3D 1:
> -+            if name =3D=3D percent:
> -+                return name
> -+            if not name.endswith(percent):
> -+                return m[0]
> -+            name =3D name[:-1]
> -         else:
> --            res +=3D c
> --        index +=3D 1
> --    return res
> -+            if name =3D=3D dollar:
> -+                return name
> -+            if name.startswith(brace):
> -+                if not name.endswith(rbrace):
> -+                    return m[0]
> -+                name =3D name[1:-1]
> -+
> -+        try:
> -+            if environ is None:
> -+                return os.fsencode(os.environ[os.fsdecode(name)])
> -+            else:
> -+                return environ[name]
> -+        except KeyError:
> -+            return m[0]
> -+
> -+    return sub(repl, path)
> -
> -
> - # Normalize a path, e.g. A//B, A/./B and A/foo/../B all become A\B.
> -diff --git a/Lib/posixpath.py b/Lib/posixpath.py
> -index b8dd563..75020ee 100644
> ---- a/Lib/posixpath.py
> -+++ b/Lib/posixpath.py
> -@@ -279,42 +279,41 @@ def expanduser(path):
> - # This expands the forms $variable and ${variable} only.
> - # Non-existent variables are left unchanged.
> -
> --_varprog =3D None
> --_varprogb =3D None
> -+_varpattern =3D r'\$(\w+|\{[^}]*\}?)'
> -+_varsub =3D None
> -+_varsubb =3D None
> -
> - def expandvars(path):
> -     """Expand shell variables of form $var and ${var}.  Unknown variabl=
es
> -     are left unchanged."""
> -     path =3D os.fspath(path)
> --    global _varprog, _varprogb
> -+    global _varsub, _varsubb
> -     if isinstance(path, bytes):
> -         if b'$' not in path:
> -             return path
> --        if not _varprogb:
> -+        if not _varsubb:
> -             import re
> --            _varprogb =3D re.compile(br'\$(\w+|\{[^}]*\})', re.ASCII)
> --        search =3D _varprogb.search
> -+            _varsubb =3D re.compile(_varpattern.encode(), re.ASCII).sub
> -+        sub =3D _varsubb
> -         start =3D b'{'
> -         end =3D b'}'
> -         environ =3D getattr(os, 'environb', None)
> -     else:
> -         if '$' not in path:
> -             return path
> --        if not _varprog:
> -+        if not _varsub:
> -             import re
> --            _varprog =3D re.compile(r'\$(\w+|\{[^}]*\})', re.ASCII)
> --        search =3D _varprog.search
> -+            _varsub =3D re.compile(_varpattern, re.ASCII).sub
> -+        sub =3D _varsub
> -         start =3D '{'
> -         end =3D '}'
> -         environ =3D os.environ
> --    i =3D 0
> --    while True:
> --        m =3D search(path, i)
> --        if not m:
> --            break
> --        i, j =3D m.span(0)
> --        name =3D m.group(1)
> --        if name.startswith(start) and name.endswith(end):
> -+
> -+    def repl(m):
> -+        name =3D m[1]
> -+        if name.startswith(start):
> -+            if not name.endswith(end):
> -+                return m[0]
> -             name =3D name[1:-1]
> -         try:
> -             if environ is None:
> -@@ -322,13 +321,11 @@ def expandvars(path):
> -             else:
> -                 value =3D environ[name]
> -         except KeyError:
> --            i =3D j
> -+            return m[0]
> -         else:
> --            tail =3D path[j:]
> --            path =3D path[:i] + value
> --            i =3D len(path)
> --            path +=3D tail
> --    return path
> -+            return value
> -+
> -+    return sub(repl, path)
> -
> -
> - # Normalize a path, e.g. A//B, A/./B and A/foo/../B all become A/B.
> -diff --git a/Lib/test/test_genericpath.py b/Lib/test/test_genericpath.py
> -index 1ff7f75..b0a1326 100644
> ---- a/Lib/test/test_genericpath.py
> -+++ b/Lib/test/test_genericpath.py
> -@@ -7,6 +7,7 @@ import os
> - import sys
> - import unittest
> - import warnings
> -+from test import support
> - from test.support import os_helper
> - from test.support import warnings_helper
> - from test.support.script_helper import assert_python_ok
> -@@ -430,6 +431,19 @@ class CommonTest(GenericTest):
> -                   os.fsencode('$bar%s bar' % nonascii))
> -             check(b'$spam}bar', os.fsencode('%s}bar' % nonascii))
> -
> -+    @support.requires_resource('cpu')
> -+    def test_expandvars_large(self):
> -+        expandvars =3D self.pathmodule.expandvars
> -+        with os_helper.EnvironmentVarGuard() as env:
> -+            env.clear()
> -+            env["A"] =3D "B"
> -+            n =3D 100_000
> -+            self.assertEqual(expandvars('$A'*n), 'B'*n)
> -+            self.assertEqual(expandvars('${A}'*n), 'B'*n)
> -+            self.assertEqual(expandvars('$A!'*n), 'B!'*n)
> -+            self.assertEqual(expandvars('${A}A'*n), 'BA'*n)
> -+            self.assertEqual(expandvars('${'*10*n), '${'*10*n)
> -+
> -     def test_abspath(self):
> -         self.assertIn("foo", self.pathmodule.abspath("foo"))
> -         with warnings.catch_warnings():
> -diff --git a/Lib/test/test_ntpath.py b/Lib/test/test_ntpath.py
> -index f790f77..161e57d 100644
> ---- a/Lib/test/test_ntpath.py
> -+++ b/Lib/test/test_ntpath.py
> -@@ -5,8 +5,8 @@ import sys
> - import unittest
> - import warnings
> - from ntpath import ALLOW_MISSING
> -+from test import support
> - from test.support import os_helper
> --from test.support import TestFailed
> - from test.support.os_helper import FakePath
> - from test import test_genericpath
> - from tempfile import TemporaryFile
> -@@ -56,7 +56,7 @@ def tester(fn, wantResult):
> -     fn =3D fn.replace("\\", "\\\\")
> -     gotResult =3D eval(fn)
> -     if wantResult !=3D gotResult and _norm(wantResult) !=3D _norm(gotRe=
sult):
> --        raise TestFailed("%s should return: %s but returned: %s" \
> -+        raise support.TestFailed("%s should return: %s but returned: %s=
" \
> -               %(str(fn), str(wantResult), str(gotResult)))
> -
> -     # then with bytes
> -@@ -72,7 +72,7 @@ def tester(fn, wantResult):
> -         warnings.simplefilter("ignore", DeprecationWarning)
> -         gotResult =3D eval(fn)
> -     if _norm(wantResult) !=3D _norm(gotResult):
> --        raise TestFailed("%s should return: %s but returned: %s" \
> -+        raise support.TestFailed("%s should return: %s but returned: %s=
" \
> -               %(str(fn), str(wantResult), repr(gotResult)))
> -
> -
> -@@ -689,6 +689,19 @@ class TestNtpath(NtpathTestCase):
> -             check('%spam%bar', '%sbar' % nonascii)
> -             check('%{}%bar'.format(nonascii), 'ham%sbar' % nonascii)
> -
> -+    @support.requires_resource('cpu')
> -+    def test_expandvars_large(self):
> -+        expandvars =3D ntpath.expandvars
> -+        with os_helper.EnvironmentVarGuard() as env:
> -+            env.clear()
> -+            env["A"] =3D "B"
> -+            n =3D 100_000
> -+            self.assertEqual(expandvars('%A%'*n), 'B'*n)
> -+            self.assertEqual(expandvars('%A%A'*n), 'BA'*n)
> -+            self.assertEqual(expandvars("''"*n + '%%'), "''"*n + '%')
> -+            self.assertEqual(expandvars("%%"*n), "%"*n)
> -+            self.assertEqual(expandvars("$$"*n), "$"*n)
> -+
> -     def test_expanduser(self):
> -         tester('ntpath.expanduser("test")', 'test')
> -
> -@@ -923,6 +936,7 @@ class TestNtpath(NtpathTestCase):
> -             self.assertIsInstance(b_final_path, bytes)
> -             self.assertGreater(len(b_final_path), 0)
> -
> -+
> - class NtCommonTest(test_genericpath.CommonTest, unittest.TestCase):
> -     pathmodule =3D ntpath
> -     attributes =3D ['relpath']
> -diff --git a/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-1360=
65.bu337o.rst b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-1360=
65.bu337o.rst
> -new file mode 100644
> -index 0000000..1d152bb
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2025-05-30-22-33-27.gh-issue-136065.bu33=
7o.rst
> -@@ -0,0 +1 @@
> -+Fix quadratic complexity in :func:`os.path.expandvars`.
> ---
> -2.40.0
> diff --git a/meta/recipes-devtools/python/python3_3.10.19.bb b/meta/recip=
es-devtools/python/python3_3.10.20.bb
> similarity index 98%
> rename from meta/recipes-devtools/python/python3_3.10.19.bb
> rename to meta/recipes-devtools/python/python3_3.10.20.bb
> index e2a0ae9fe7..88a57971b9 100644
> --- a/meta/recipes-devtools/python/python3_3.10.19.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.20.bb
> @@ -37,11 +37,6 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Py=
thon-${PV}.tar.xz \
>             file://0001-Avoid-shebang-overflow-on-python-config.py.patch =
\
>             file://0001-test_storlines-skip-due-to-load-variability.patch=
 \
>             file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-fa=
ilu.patch \
> -           file://CVE-2025-6075.patch \
> -           file://CVE-2025-13836.patch \
> -           file://CVE-2025-13837.patch \
> -           file://CVE-2025-12084.patch \
> -           file://CVE-2025-15282.patch \
>             "
> =20
>  SRC_URI:append:class-native =3D " \
> @@ -50,7 +45,7 @@ SRC_URI:append:class-native =3D " \
>             file://12-distutils-prefix-is-inside-staging-area.patch \
>             file://0001-Don-t-search-system-for-headers-libraries.patch \
>             "
> -SRC_URI[sha256sum] =3D "c8f4a596572201d81dd7df91f70e177e19a70f1d489968b5=
4b5fbbf29a97c076"
> +SRC_URI[sha256sum] =3D "de6517421601e39a9a3bc3e1bc4c7b2f239297423ee05e28=
2598c83ec0647505"
> =20
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"


--=20
Yoann Congal
Smile ECS


