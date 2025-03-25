Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24548C36005
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 21:14:52 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.7470.1742937285900800517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 14:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VEEUURxV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202503252114428e033088443a4064cc-qqcmhk@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202503252114428e033088443a4064cc
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Mar 2025 22:14:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FlR1DtvR9xhuFMR3uVvzGX1kjSs/MgC44G7sDSJarEU=;
 b=VEEUURxVuc2QzbSXnvZMTedU9nIZr3Ueg6BVGX4czu0o76YKI12qq8y8vQ1eYYOYJMKm5L
 tvmLoGbsPQZua4+uiK0NQMqB4FXrSpmbgRSwOZDhhuexkZ08aAbbD742DwXH5YQJl+LrykEk
 hrpK4IC1XLjuFDJ4SvrI3U9K2/9FAkYUecWBBEtEPt4yf1bTCtbRoUeuDAY4TToAOXXjfsm8
 g8U9fReFJ05m9HRScgJ5DcaVYrapcxGo1AVWW+YA7tRzpt2BYvyN0s7Nf1pLW1VWXU7ubg2S
 ZyrL/jH5JNkpnsRZebRLRpV5kWJzvnnSscWcP2o49ZP804yIpgmGv4XA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] python3: patch CVE-2025-0938
Date: Tue, 25 Mar 2025 22:13:56 +0100
Message-Id: <20250325211356.9735-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 21:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213618

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in NDV CVE report
https://github.com/python/cpython/commit/b8b4b713c5f8ec0958c7ef8d29d6711889bc94ab
which is on 3.10 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/python3/CVE-2025-0938.patch        | 131 ++++++++++++++++++
 .../python/python3_3.10.16.bb                 |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-0938.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-0938.patch b/meta/recipes-devtools/python/python3/CVE-2025-0938.patch
new file mode 100644
index 0000000000..5730008f4b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-0938.patch
@@ -0,0 +1,131 @@
+From b8b4b713c5f8ec0958c7ef8d29d6711889bc94ab Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 19 Feb 2025 14:36:23 +0100
+Subject: [PATCH] [3.10] gh-105704: Disallow square brackets (`[` and `]`) in
+ domain names for parsed URLs (GH-129418) (#129529)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit d89a5f6a6e65511a5f6e0618c4c30a7aa5aba56a)
+
+Co-authored-by: Seth Michael Larson <seth@python.org>
+Co-authored-by: Peter Bierma <zintensitydev@gmail.com>
+Co-authored-by: Łukasz Langa <lukasz@langa.pl>
+
+CVE: CVE-2025-0938
+Upstream-Status: Backport [https://github.com/python/cpython/commit/b8b4b713c5f8ec0958c7ef8d29d6711889bc94ab]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Lib/test/test_urlparse.py                     | 37 ++++++++++++++++++-
+ Lib/urllib/parse.py                           | 20 +++++++++-
+ ...-01-28-14-08-03.gh-issue-105704.EnhHxu.rst |  4 ++
+ 3 files changed, 58 insertions(+), 3 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index f2ffc452e5..280644ef0b 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -1149,16 +1149,51 @@ class UrlParseTestCase(unittest.TestCase):
+         self.assertRaises(ValueError, urllib.parse.urlsplit, 'Scheme://user@[0439:23af::2309::fae7:1234]/Path?Query')
+         self.assertRaises(ValueError, urllib.parse.urlsplit, 'Scheme://user@[0439:23af:2309::fae7:1234:2342:438e:192.0.2.146]/Path?Query')
+         self.assertRaises(ValueError, urllib.parse.urlsplit, 'Scheme://user@]v6a.ip[/Path')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip]')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip].suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip]/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip].suffix/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip]?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip].suffix?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:a')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:a')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:a1')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:a1')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:1a')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:1a')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:/')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:?')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://user@prefix.[v6a.ip]')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://user@[v6a.ip].suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip]')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://]v6a.ip[')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://]v6a.ip')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip[')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip].suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix]v6a.ip[suffix')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix]v6a.ip')
++        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip[suffix')
+ 
+     def test_splitting_bracketed_hosts(self):
+-        p1 = urllib.parse.urlsplit('scheme://user@[v6a.ip]/path?query')
++        p1 = urllib.parse.urlsplit('scheme://user@[v6a.ip]:1234/path?query')
+         self.assertEqual(p1.hostname, 'v6a.ip')
+         self.assertEqual(p1.username, 'user')
+         self.assertEqual(p1.path, '/path')
++        self.assertEqual(p1.port, 1234)
+         p2 = urllib.parse.urlsplit('scheme://user@[0439:23af:2309::fae7%test]/path?query')
+         self.assertEqual(p2.hostname, '0439:23af:2309::fae7%test')
+         self.assertEqual(p2.username, 'user')
+         self.assertEqual(p2.path, '/path')
++        self.assertIs(p2.port, None)
+         p3 = urllib.parse.urlsplit('scheme://user@[0439:23af:2309::fae7:1234:192.0.2.146%test]/path?query')
+         self.assertEqual(p3.hostname, '0439:23af:2309::fae7:1234:192.0.2.146%test')
+         self.assertEqual(p3.username, 'user')
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index 07e3248504..e1ee36d98e 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -442,6 +442,23 @@ def _checknetloc(netloc):
+             raise ValueError("netloc '" + netloc + "' contains invalid " +
+                              "characters under NFKC normalization")
+ 
++def _check_bracketed_netloc(netloc):
++    # Note that this function must mirror the splitting
++    # done in NetlocResultMixins._hostinfo().
++    hostname_and_port = netloc.rpartition('@')[2]
++    before_bracket, have_open_br, bracketed = hostname_and_port.partition('[')
++    if have_open_br:
++        # No data is allowed before a bracket.
++        if before_bracket:
++            raise ValueError("Invalid IPv6 URL")
++        hostname, _, port = bracketed.partition(']')
++        # No data is allowed after the bracket but before the port delimiter.
++        if port and not port.startswith(":"):
++            raise ValueError("Invalid IPv6 URL")
++    else:
++        hostname, _, port = hostname_and_port.partition(':')
++    _check_bracketed_host(hostname)
++
+ # Valid bracketed hosts are defined in
+ # https://www.rfc-editor.org/rfc/rfc3986#page-49 and https://url.spec.whatwg.org/
+ def _check_bracketed_host(hostname):
+@@ -505,8 +522,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+                 (']' in netloc and '[' not in netloc)):
+             raise ValueError("Invalid IPv6 URL")
+         if '[' in netloc and ']' in netloc:
+-            bracketed_host = netloc.partition('[')[2].partition(']')[0]
+-            _check_bracketed_host(bracketed_host)
++            _check_bracketed_netloc(netloc)
+     if allow_fragments and '#' in url:
+         url, fragment = url.split('#', 1)
+     if '?' in url:
+diff --git a/Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst b/Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst
+new file mode 100644
+index 0000000000..bff1bc6b0d
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst
+@@ -0,0 +1,4 @@
++When using :func:`urllib.parse.urlsplit` and :func:`urllib.parse.urlparse` host
++parsing would not reject domain names containing square brackets (``[`` and
++``]``). Square brackets are only valid for IPv6 and IPvFuture hosts according to
++`RFC 3986 Section 3.2.2 <https://www.rfc-editor.org/rfc/rfc3986#section-3.2.2>`__.
diff --git a/meta/recipes-devtools/python/python3_3.10.16.bb b/meta/recipes-devtools/python/python3_3.10.16.bb
index 48f845b089..932791f38d 100644
--- a/meta/recipes-devtools/python/python3_3.10.16.bb
+++ b/meta/recipes-devtools/python/python3_3.10.16.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
+           file://CVE-2025-0938.patch \
            "
 
 SRC_URI:append:class-native = " \

