Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77761EB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 06:14:51 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.2535.1689228882918107043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 23:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=RAReGJwK;
 spf=pass (domain: mvista.com, ip: 209.85.167.178, mailfrom: vkumbhar@mvista.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-38e04d1b2b4so337021b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 23:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689228882; x=1691820882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJAhuESKw5ewQ/Ue4nlC/JpCthXwFgR0jCjZyurmILQ=;
        b=RAReGJwKB9319ILAEho8SQEEYmm9KrDnE1vcFWxfpCEqpYuRzqqbBI0P8/CS5lORqf
         4wNeoUau1vvIymAFdxOyGdDXBb+cWnfcqwlUnTqGL0q+6cq5f29AYoSL8xLuaGcYX/4n
         FTcUoCGVpo21lax29CuEkLyBqfVOy8IbpQjEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689228882; x=1691820882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJAhuESKw5ewQ/Ue4nlC/JpCthXwFgR0jCjZyurmILQ=;
        b=bsXF1l8Ffyu7wbbGDoo7FAyzfb5SidcqQbW7miFOM4lKitdTuVuWQMS2X7Unpme9Kp
         z9o9F5FCZEsh9GYqgZ5DTDKb87FgFDWz2SfHeTplk5HMF2mtzWWvCElwD/GIBNbQvCWp
         eU/baKyvh3E7pvUH2bUCzfpyvbbc80oL6CsqtFKYnmN0tJbUVOoY7YK7a0sRj+AStgAp
         qdkSB9/DQLJ3n0MjwIDhSzQjKpRs+WE7oTNgLYqSCiS79poM7BB21q/uD0zPmoIuh/fL
         ts2zk53LINtN6CQ7qFFhc4pLNhT2E1LRBesnMQToQFe8YTnWPvMjlKWrE+FnHq4OkCSv
         cT8Q==
X-Gm-Message-State: ABy/qLYwC3aLYox4aFCNjVNRdDBpff0FHu12tMZdKY4vFSDhX2GNXsOn
	LxgxxWz/Mu203s5kUB/PclU2TGsCTuhayhXLvk8=
X-Google-Smtp-Source: APBJJlF5vYlGi9eQmuM+NuFTsM3mHd9026JG7GXiepi2j7O9avTUJvQ415Nvp1Jf1iPZYx6WTS343g==
X-Received: by 2002:a05:6358:7189:b0:135:73b0:cc6c with SMTP id t9-20020a056358718900b0013573b0cc6cmr1158870rwt.28.1689228881633;
        Wed, 12 Jul 2023 23:14:41 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.188.14])
        by smtp.googlemail.com with ESMTPSA id t12-20020a63b24c000000b0055bf13811f5sm1141694pgo.15.2023.07.12.23.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 23:14:41 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] python3: fix CVE-2023-24329 urllib.parse url blocklisting bypass
Date: Thu, 13 Jul 2023 11:44:25 +0530
Message-Id: <20230713061425.122500-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 06:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184231

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../python/python3/CVE-2023-24329.patch       | 80 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.8.17.bb |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2023-24329.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2023-24329.patch b/meta/recipes-devtools/python/python3/CVE-2023-24329.patch
new file mode 100644
index 0000000000..23dec65602
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2023-24329.patch
@@ -0,0 +1,80 @@
+From 72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sun, 13 Nov 2022 11:00:25 -0800
+Subject: [PATCH] gh-99418: Make urllib.parse.urlparse enforce that a scheme
+ must begin with an alphabetical ASCII character. (GH-99421)
+
+Prevent urllib.parse.urlparse from accepting schemes that don't begin with an alphabetical ASCII character.
+
+RFC 3986 defines a scheme like this: `scheme = ALPHA *( ALPHA / DIGIT / "+" / "-" / "." )`
+RFC 2234 defines an ALPHA like this: `ALPHA = %x41-5A / %x61-7A`
+
+The WHATWG URL spec defines a scheme like this:
+`"A URL-scheme string must be one ASCII alpha, followed by zero or more of ASCII alphanumeric, U+002B (+), U+002D (-), and U+002E (.)."`
+(cherry picked from commit 439b9cfaf43080e91c4ad69f312f21fa098befc7)
+
+Co-authored-by: Ben Kallus <49924171+kenballus@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9]
+CVE: CVE-2023-24329
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ Lib/test/test_urlparse.py                      | 18 ++++++++++++++++++
+ Lib/urllib/parse.py                            |  2 +-
+ ...22-11-12-15-45-51.gh-issue-99418.FxfAXS.rst |  2 ++
+ 3 files changed, 21 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99418.FxfAXS.rst
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 0ad3bf1..e1aa913 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -735,6 +735,24 @@ class UrlParseTestCase(unittest.TestCase):
+                         with self.assertRaises(ValueError):
+                             p.port
+
++    def test_attributes_bad_scheme(self):
++        """Check handling of invalid schemes."""
++        for bytes in (False, True):
++            for parse in (urllib.parse.urlsplit, urllib.parse.urlparse):
++                for scheme in (".", "+", "-", "0", "http&", "६http"):
++                    with self.subTest(bytes=bytes, parse=parse, scheme=scheme):
++                        url = scheme + "://www.example.net"
++                        if bytes:
++                            if url.isascii():
++                                url = url.encode("ascii")
++                            else:
++                                continue
++                        p = parse(url)
++                        if bytes:
++                            self.assertEqual(p.scheme, b"")
++                        else:
++                            self.assertEqual(p.scheme, "")
++
+     def test_attributes_without_netloc(self):
+         # This example is straight from RFC 3261.  It looks like it
+         # should allow the username, hostname, and port to be filled
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index 979e6d2..2e7a3e2 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -452,7 +452,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+         clear_cache()
+     netloc = query = fragment = ''
+     i = url.find(':')
+-    if i > 0:
++    if i > 0 and url[0].isascii() and url[0].isalpha():
+         if url[:i] == 'http': # optimize the common case
+             url = url[i+1:]
+             if url[:2] == '//':
+diff --git a/Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99418.FxfAXS.rst b/Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99418.FxfAXS.rst
+new file mode 100644
+index 0000000..0a06e7c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99418.FxfAXS.rst
+@@ -0,0 +1,2 @@
++Fix bug in :func:`urllib.parse.urlparse` that causes URL schemes that begin
++with a digit, a plus sign, or a minus sign to be parsed incorrectly.
+--
+2.25.1
diff --git a/meta/recipes-devtools/python/python3_3.8.17.bb b/meta/recipes-devtools/python/python3_3.8.17.bb
index ba5f564d8e..8c00d65794 100644
--- a/meta/recipes-devtools/python/python3_3.8.17.bb
+++ b/meta/recipes-devtools/python/python3_3.8.17.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://makerace.patch \
+           file://CVE-2023-24329.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.25.1


