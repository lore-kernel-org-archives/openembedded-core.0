Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971EEC001DF
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:30 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.11600.1689696085040052675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0Rzn0iUB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666e3b15370so4290640b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696084; x=1692288084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx6SOK3Q5YGR5Fk8ZSU3OF9Bh51P26R0JQ1fg2rEbZk=;
        b=0Rzn0iUBUbP9qpJi/kAcsDfKi2RbebqEmPwkhUpTZ8NusqUI3Wj5bXAU2lzN8j3nDQ
         xIsx3XvC85vib2Da5NlD2C/vW3ns/lbcrmkrERx10xGN3R/8No3ZYkMGqYzNCGRcj6kO
         nTl6F9xh3uVQIlWt4vw6X/2L/KsnMpVo7uPhQu36qJK4i+KPT4O6qb9jZpm+T8NbcPQX
         URDH/g+INy8L2gbBNqqZ0KFmjMv27hobF1m442xp1pnsjjOUAFs+VIp4AlJi4izFHGQp
         LdUWBU66pcQmcHapPh+4P/j5Qg60SiK/Xdn4BHHrq53PyY4MieOGwok1qsB0/NotUhkF
         zqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696084; x=1692288084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx6SOK3Q5YGR5Fk8ZSU3OF9Bh51P26R0JQ1fg2rEbZk=;
        b=Dr8aYghpZ3SvvhCrHn8lOML1magtaSBtK5BxiBqvJGn703fBH2lHf+Z37xCYnl6okN
         O6M60p4l16B1dYLKqR5/0LqghqpkwMqrvDMuzXUK6qPb43fml7iiO/4dvK7ZUfh49x66
         YOmNgYpVBD0ELYNQRQDyZKPbsSUAfEPEWwd3hvMfJPdbmHs6dhEpHYcGiTqArOGwlsq7
         l9SuLFEKLeyimmUVihncrdOfg5P55ot2Y4gzveK28h93SW9PQlIpAInlUQVGojl14DQe
         0UBVZTlk9lKRqxxLA3JBLw9+1ULjcJVGyLD97jTCPX8R1L7LigFEdfU2h8yYnsGPxmnc
         lmVQ==
X-Gm-Message-State: ABy/qLZ9rHGS/yu1pgi0+VK7g4W58bg9wHWXwV2q4l0wGLGe+pT1DseM
	2j7ilOhFQeQmRss5jUJ05+cDyRYOy5Aio0Sn1p0=
X-Google-Smtp-Source: APBJJlHwX8fE2zD1P5qOqHrHPvFu0s+8xhnpwJpv/5k4Nm938KYZXbtvpT5tQG94ODCu63AaugYMZg==
X-Received: by 2002:a05:6a00:1505:b0:67a:6af6:5171 with SMTP id q5-20020a056a00150500b0067a6af65171mr3457970pfu.13.1689696084132;
        Tue, 18 Jul 2023 09:01:24 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/13] python3: fix CVE-2023-24329 urllib.parse url blocklisting bypass
Date: Tue, 18 Jul 2023 06:00:55 -1000
Message-Id: <307f23e066e06793ec60f0cddf8ff1c64c02d834.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184541

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


