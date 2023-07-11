Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69682EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 03:53:52 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.127.1689047628273785687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 20:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=L4I2NYPJ;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-66c729f5618so4553788b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 20:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689047627; x=1691639627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAiFvn2QvVphxPteXUbJBn2dI1dO6vRzD3JK1uUnC3w=;
        b=L4I2NYPJriQC7Sm72p46aywlBA5kzQUOpZyginTaX9goXn2+q5+uUhBrA1WOA+sP8a
         toI4uDhTeA0t+iDAoqQ7uq9505bdFDPu5bvYsCBLpqdkIKUg0Sb61jrbq/qQS2jwI92R
         qiNVFS/8LcksdktM0cEK8RTmRQL4jUovpLb5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689047627; x=1691639627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAiFvn2QvVphxPteXUbJBn2dI1dO6vRzD3JK1uUnC3w=;
        b=ev6JUidjdf2Ulp8uOFTTdkLudD2PbVGbW2ZSWdLrsMlbebA1oW+arSAsyJ0oEI544K
         0MhNchY/t4Wse8LfA4xpxQWgbIaKW4vQN/mvagcdsSgAVEcf36V9f6WFiYf+THUbX5F6
         e81NJp2VfA6XuLyGS90ZaApkz+I+Jv2EWHBX+ANcHPJs+aIljC7ADnI/iiwuiRx4fmVu
         JAget2eMrCdp239MfXxuzLIV2rEQ1SAfaKuO1A8IDOHysyy8KmzsADYsVT1K+cBD8oVi
         m5w/qOSMcMFYG1zsOFuE/oUjp/Y5kak4gXfy0IzAD0WHMNnbG+c7CDtF0NOY28fdKeTP
         6hMA==
X-Gm-Message-State: ABy/qLZDBNU9N3lJB0/TBb8GpVRQD2PU0gbK6e53ttmrxoBUE0L/OWUP
	2gaLTpcmN5qN3M48UuqbmuwGx8xpvnwrISMqVxw=
X-Google-Smtp-Source: APBJJlFLV0CkBitw1ZcWPqbKuhwVk8sbkTu2l1mEc9lrWg756mKGfxvNqArJqx+z+vk6u7y2l2l1Vw==
X-Received: by 2002:a05:6a00:22c9:b0:66e:8635:a18e with SMTP id f9-20020a056a0022c900b0066e8635a18emr18674799pfj.22.1689047627180;
        Mon, 10 Jul 2023 20:53:47 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.152.149])
        by smtp.googlemail.com with ESMTPSA id j15-20020aa7800f000000b00666e883757fsm565548pfi.123.2023.07.10.20.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 20:53:46 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [PATCH] python3: fix CVE-2023-24329 urllib.parse url blocklisting bypass
Date: Tue, 11 Jul 2023 09:23:29 +0530
Message-Id: <20230711035329.8882-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 03:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184114

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../python/python3/CVE-2023-24329.patch       | 81 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.8.14.bb |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2023-24329.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2023-24329.patch b/meta/recipes-devtools/python/python3/CVE-2023-24329.patch
new file mode 100644
index 0000000000..a0902e7be2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2023-24329.patch
@@ -0,0 +1,81 @@
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
+index 0f99130..03b5da1 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -676,6 +676,24 @@ class UrlParseTestCase(unittest.TestCase):
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
+index f0d9d4d..0e388cb 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -440,7 +440,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
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
+
diff --git a/meta/recipes-devtools/python/python3_3.8.14.bb b/meta/recipes-devtools/python/python3_3.8.14.bb
index 960e41aced..88ed8f4077 100644
--- a/meta/recipes-devtools/python/python3_3.8.14.bb
+++ b/meta/recipes-devtools/python/python3_3.8.14.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://makerace.patch \
            file://CVE-2022-45061.patch \
            file://CVE-2022-37454.patch \
+           file://CVE-2023-24329.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.25.1


