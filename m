Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF5CCDE005
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33401.1782253623846894193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fyU1dxLW;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac357c55so3332675e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253622; x=1782858422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upfIrUGtLuI5jOcq96eXY/vjdYqspMcYk+QX5txZhKk=;
        b=fyU1dxLWaB7SIERA22pfVw37MzpK5EWcRtIoJWgrXwkS1b85ycWGNwakYss6yK02+I
         zWJrHOcut7A7fob5dRgGaOTLCU+l4MADLhoG8s99uGjLGxSUaW0rf+srGin/L9dWI4n5
         4MhBU13k5XocqEUa5V00nDlqt6vTENt7GiZBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253622; x=1782858422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=upfIrUGtLuI5jOcq96eXY/vjdYqspMcYk+QX5txZhKk=;
        b=q6Dag0B6OI1jq9djaJd6vrSzaTJ6lnPNyy90c7/y2aD7Zvtoji2oktWinjPX3JZ1gV
         RIM25yLnex9EDgWarodj1p92M9Y2XXXhWP6ybdP2S9zHx8xSQdaRXicswwQ6/MeZFJLl
         VGAi2mIyY4ytUkw59gU8qTGOtqp25wsKh3J8d/l7jGw9ms0zvCie9Hr/uIkpMx0X47K1
         uW129gTsnWfjjIvuKdbcBVw+frkjPAmd1JJIFG9f9fQ4rjEBwphIfeDc6w5riPVefNgP
         py1wffFbrHlQuoMd37sP9A6z03U00PTH4CqnQ0mx36BVHAwT9ttYPo3d0f1ueuIK2sEC
         r8LQ==
X-Gm-Message-State: AOJu0Yz4yt+NtkmZWqr8hbqWljCnIAze06NWrBc5xp02Mt6u0n9ltidh
	xa8qePmw6Mmd++QwZsULc69n0B4LysTyje6ick8XYAQmzE9O4Rx2YUwKgIEaMCfPdGdHVwsOctB
	Za2LZ
X-Gm-Gg: AfdE7ckTHzMQPynYb7j1OvvT14a8c6EYO3CAEY9jXKRYTs3qN2vlRw93WeK3Zn8WhjB
	9gyRWcg5f1D2aI6ezVN7l2i3bo6ulKp4OQOvT8wuSf6RBxWC9eCcR4/1kAuV75xp8UD3lW5oKc/
	kDWzYlTNKi+SCOBQwZCgRLtPjBA5K92ng/PUWOhJO1ROLPg4JOhc32paZvyy1D/djfU3ZpRcNxS
	C547+oLGkh2r5wZ6dE0wQTg3y89Qnfl7EuNM0Sy9mND+1pHhRe840pHmvkeI7kyNceQz8zJtfKP
	0e7XGgyYvhFtNJr3R1Ss7DJRfAjzQGYNDgqgWe+0N+S9kv64zEWLpfF8noF9VwinHqeHN8yX/c2
	/UMWOjoyiSPwRmJS4UYLksyXDK49ozLOGpmKjgrX7S8GY1njQwH2YC2MY/5cRwIbBcJ+2llX/tS
	v2HAqmu7P3Vsd+j9+u0/GKmWxVeVG09WR0kZxijGRXGr7CAo4HV2NEoV+hfz9ZV7NPoIQuDqcL6
	zTDYNFbLk1X/MWW
X-Received: by 2002:a05:600c:1f89:b0:490:9df1:f0cf with SMTP id 5b1f17b1804b1-492608400bdmr7545435e9.2.1782253621882;
        Tue, 23 Jun 2026 15:27:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 09/41] python3: Fix CVE-2026-4519 and CVE-2026-4786
Date: Wed, 24 Jun 2026 00:26:08 +0200
Message-ID: <e6d81b3be531e97058366c81056a38c0b6fa7380.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239431

From: Sudhir Dumbhare <sudumbha@cisco.com>

Apply the upstream v3.12 fix [1], aligned with the original v3.11 fix [2],
and follow-up fix [3] to address CVE-2026-4519 by disallowing URLs with
leading dashes when invoking browser commands, as referenced in [5].

CVE-2026-4786 [6] revealed the CVE-2026-4519 fix was incomplete, as %action
in URLs could bypass dash-prefix checks. Apply follow-up fix [4], noted in
[5], to revalidate the URL after %action expansion.

[1] https://github.com/python/cpython/commit/cbba6119391112aba9c5aebf7b94aea447922c48
[2] https://github.com/python/cpython/commit/ceac1efc66516ac387eef2c9a0ce671895b44f03
[3] https://github.com/python/cpython/commit/96fc5048605863c7b6fd6289643feb0e97edd96c
[4] https://github.com/python/cpython/commit/f4654824ae0850ac87227fb270f9057477946769
[5] https://security-tracker.debian.org/tracker/CVE-2026-4519
[6] https://security-tracker.debian.org/tracker/CVE-2026-4786

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-4519
https://nvd.nist.gov/vuln/detail/CVE-2026-4786

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3/CVE-2026-4519_CVE-2026-4786.patch |  66 ++++++++
 .../python/python3/CVE-2026-4519_p1.patch     | 107 ++++++++++++
 .../python/python3/CVE-2026-4519_p2.patch     | 159 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   3 +
 4 files changed, 335 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch b/meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch
new file mode 100644
index 00000000000..6a4714f25ae
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch
@@ -0,0 +1,66 @@
+From b9af29b9f2f880cdcdc49a1460743680f59dcb4e Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Mon, 13 Apr 2026 22:41:51 +0100
+Subject: [PATCH] [3.11] gh-148169: Fix webbrowser `%action` substitution
+ bypass of dash-prefix check (GH-148170) (#148520)
+
+CVE: CVE-2026-4519 CVE-2026-4786
+Upstream-Status: Backport [https://github.com/python/cpython/commit/f4654824ae0850ac87227fb270f9057477946769]
+
+Backport Changes:
+- This file is not present in the current version and is therefore omitted.
+  Misc/NEWS.d/next/Security/2026-03-31-09-15-51.gh-issue-148169.EZJzz2.rst
+
+(cherry picked from commit d22922c8a7958353689dc4763dd72da2dea03fff)
+(cherry picked from commit f4654824ae0850ac87227fb270f9057477946769)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ Lib/test/test_webbrowser.py | 8 ++++++++
+ Lib/webbrowser.py           | 5 +++--
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/test/test_webbrowser.py b/Lib/test/test_webbrowser.py
+index c9bf525360d..1d21f133725 100644
+--- a/Lib/test/test_webbrowser.py
++++ b/Lib/test/test_webbrowser.py
+@@ -103,6 +103,14 @@ class ChromeCommandTest(CommandTestMixin, unittest.TestCase):
+                    options=[],
+                    arguments=[URL])
+ 
++    def test_reject_action_dash_prefixes(self):
++        browser = self.browser_class(name=CMD_NAME)
++        with self.assertRaises(ValueError):
++            browser.open('%action--incognito')
++        # new=1: action is "--new-window", so "%action" itself expands to
++        # a dash-prefixed flag even with no dash in the original URL.
++        with self.assertRaises(ValueError):
++            browser.open('%action', new=1)
+ 
+ class EdgeCommandTest(CommandTestMixin, unittest.TestCase):
+ 
+diff --git a/Lib/webbrowser.py b/Lib/webbrowser.py
+index 000e89275b7..97c4eec9080 100755
+--- a/Lib/webbrowser.py
++++ b/Lib/webbrowser.py
+@@ -268,7 +268,6 @@ class UnixBrowser(BaseBrowser):
+ 
+     def open(self, url, new=0, autoraise=True):
+         sys.audit("webbrowser.open", url)
+-        self._check_url(url)
+         if new == 0:
+             action = self.remote_action
+         elif new == 1:
+@@ -282,7 +281,9 @@ class UnixBrowser(BaseBrowser):
+             raise Error("Bad 'new' parameter to open(); " +
+                         "expected 0, 1, or 2, got %s" % new)
+ 
+-        args = [arg.replace("%s", url).replace("%action", action)
++        self._check_url(url.replace("%action", action))
++
++        args = [arg.replace("%action", action).replace("%s", url)
+                 for arg in self.remote_args]
+         args = [arg for arg in args if arg]
+         success = self._invoke(args, True, autoraise, url)
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch b/meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch
new file mode 100644
index 00000000000..1514d2c5414
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch
@@ -0,0 +1,107 @@
+From 7df48dd3c6330611a04d85a5159c0ea424dc1e62 Mon Sep 17 00:00:00 2001
+From: Pinky <pinky00ch@gmail.com>
+Date: Wed, 25 Mar 2026 01:02:37 +0530
+Subject: [PATCH] [3.12] gh-143930: Reject leading dashes in webbrowser
+ URLs (GH-146360)
+
+CVE: CVE-2026-4519
+Upstream-Status: Backport [https://github.com/python/cpython/commit/cbba6119391112aba9c5aebf7b94aea447922c48]
+
+Backport Changes:
+- This file is not present in the current version and is therefore omitted
+  Misc/NEWS.d/next/Security/2026-01-16-12-04-49.gh-issue-143930.zYC5x3.rst
+
+(cherry picked from commit 82a24a4442312bdcfc4c799885e8b3e00990f02b)
+
+Co-authored-by: Seth Michael Larson <seth@python.org>
+(cherry picked from commit cbba6119391112aba9c5aebf7b94aea447922c48)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ Lib/test/test_webbrowser.py |  5 +++++
+ Lib/webbrowser.py           | 12 ++++++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/Lib/test/test_webbrowser.py b/Lib/test/test_webbrowser.py
+index 2d695bc8831..60f094fd6a1 100644
+--- a/Lib/test/test_webbrowser.py
++++ b/Lib/test/test_webbrowser.py
+@@ -59,6 +59,11 @@ class GenericBrowserCommandTest(CommandTestMixin, unittest.TestCase):
+                    options=[],
+                    arguments=[URL])
+ 
++    def test_reject_dash_prefixes(self):
++        browser = self.browser_class(name=CMD_NAME)
++        with self.assertRaises(ValueError):
++            browser.open(f"--key=val {URL}")
++
+ 
+ class BackgroundBrowserCommandTest(CommandTestMixin, unittest.TestCase):
+ 
+diff --git a/Lib/webbrowser.py b/Lib/webbrowser.py
+index 13b9e85f9e1..0bdb644d7db 100755
+--- a/Lib/webbrowser.py
++++ b/Lib/webbrowser.py
+@@ -158,6 +158,12 @@ class BaseBrowser(object):
+     def open_new_tab(self, url):
+         return self.open(url, 2)
+ 
++    @staticmethod
++    def _check_url(url):
++        """Ensures that the URL is safe to pass to subprocesses as a parameter"""
++        if url and url.lstrip().startswith("-"):
++            raise ValueError(f"Invalid URL: {url}")
++
+ 
+ class GenericBrowser(BaseBrowser):
+     """Class for all browsers started with a command
+@@ -175,6 +181,7 @@ class GenericBrowser(BaseBrowser):
+ 
+     def open(self, url, new=0, autoraise=True):
+         sys.audit("webbrowser.open", url)
++        self._check_url(url)
+         cmdline = [self.name] + [arg.replace("%s", url)
+                                  for arg in self.args]
+         try:
+@@ -195,6 +202,7 @@ class BackgroundBrowser(GenericBrowser):
+         cmdline = [self.name] + [arg.replace("%s", url)
+                                  for arg in self.args]
+         sys.audit("webbrowser.open", url)
++        self._check_url(url)
+         try:
+             if sys.platform[:3] == 'win':
+                 p = subprocess.Popen(cmdline)
+@@ -260,6 +268,7 @@ class UnixBrowser(BaseBrowser):
+ 
+     def open(self, url, new=0, autoraise=True):
+         sys.audit("webbrowser.open", url)
++        self._check_url(url)
+         if new == 0:
+             action = self.remote_action
+         elif new == 1:
+@@ -350,6 +359,7 @@ class Konqueror(BaseBrowser):
+ 
+     def open(self, url, new=0, autoraise=True):
+         sys.audit("webbrowser.open", url)
++        self._check_url(url)
+         # XXX Currently I know no way to prevent KFM from opening a new win.
+         if new == 2:
+             action = "newTab"
+@@ -554,6 +564,7 @@ if sys.platform[:3] == "win":
+     class WindowsDefault(BaseBrowser):
+         def open(self, url, new=0, autoraise=True):
+             sys.audit("webbrowser.open", url)
++            self._check_url(url)
+             try:
+                 os.startfile(url)
+             except OSError:
+@@ -638,6 +649,7 @@ if sys.platform == 'darwin':
+ 
+         def open(self, url, new=0, autoraise=True):
+             sys.audit("webbrowser.open", url)
++            self._check_url(url)
+             if self.name == 'default':
+                 script = 'open location "%s"' % url.replace('"', '%22') # opens in default browser
+             else:
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch b/meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch
new file mode 100644
index 00000000000..7ee145e5e80
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch
@@ -0,0 +1,159 @@
+From 3ca64ff1722d2410a4e50e760de70f6279fa99fa Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sat, 4 Apr 2026 00:53:49 +0200
+Subject: [PATCH] [3.11] gh-143930: Tweak the exception message and
+ increase test coverage (GH-146476) (GH-148045) (GH-148051) (GH-148052)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-4519
+Upstream-Status: Backport [https://github.com/python/cpython/commit/96fc5048605863c7b6fd6289643feb0e97edd96c]
+
+Backport Changes:
+- This file is not present in the current version and is therefore omitted.
+  Misc/NEWS.d/next/Security/2026-01-16-12-04-49.gh-issue-143930.zYC5x3.rst
+- The file introduced in v3.12 by this commit;
+  https://github.com/python/cpython/commit/cbba6119391112aba9c5aebf7b94aea447922c48
+
+(cherry picked from commit cc023511238ad93ecc8796157c6f9139a2bb2932)
+(cherry picked from commit 89bfb8e5ed3c7caa241028f1a4eac5f6275a46a4)
+(cherry picked from commit 3681d47a440865aead912a054d4599087b4270dd)
+
+Co-authored-by: Łukasz Langa <lukasz@langa.pl>
+(cherry picked from commit 96fc5048605863c7b6fd6289643feb0e97edd96c)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ Lib/test/test_webbrowser.py | 81 ++++++++++++++++++++++++++++++++++---
+ Lib/webbrowser.py           |  2 +-
+ 2 files changed, 76 insertions(+), 7 deletions(-)
+
+diff --git a/Lib/test/test_webbrowser.py b/Lib/test/test_webbrowser.py
+index 60f094fd6a1..c9bf525360d 100644
+--- a/Lib/test/test_webbrowser.py
++++ b/Lib/test/test_webbrowser.py
+@@ -1,6 +1,7 @@
++import io
++import os
+ import webbrowser
+ import unittest
+-import os
+ import sys
+ import subprocess
+ from unittest import mock
+@@ -49,6 +50,14 @@ class CommandTestMixin:
+             popen_args.pop(popen_args.index(option))
+         self.assertEqual(popen_args, arguments)
+ 
++    def test_reject_dash_prefixes(self):
++        browser = self.browser_class(name=CMD_NAME)
++        with self.assertRaisesRegex(
++            ValueError,
++            r"^Invalid URL \(leading dash disallowed\): '--key=val http.*'$"
++        ):
++            browser.open(f"--key=val {URL}")
++
+ 
+ class GenericBrowserCommandTest(CommandTestMixin, unittest.TestCase):
+ 
+@@ -59,11 +68,6 @@ class GenericBrowserCommandTest(CommandTestMixin, unittest.TestCase):
+                    options=[],
+                    arguments=[URL])
+ 
+-    def test_reject_dash_prefixes(self):
+-        browser = self.browser_class(name=CMD_NAME)
+-        with self.assertRaises(ValueError):
+-            browser.open(f"--key=val {URL}")
+-
+ 
+ class BackgroundBrowserCommandTest(CommandTestMixin, unittest.TestCase):
+ 
+@@ -224,6 +228,71 @@ class ELinksCommandTest(CommandTestMixin, unittest.TestCase):
+                    arguments=['openURL({},new-tab)'.format(URL)])
+ 
+ 
++class MockPopenPipe:
++    def __init__(self, cmd, mode):
++        self.cmd = cmd
++        self.mode = mode
++        self.pipe = io.StringIO()
++        self._closed = False
++
++    def write(self, buf):
++        self.pipe.write(buf)
++
++    def close(self):
++        self._closed = True
++        return None
++
++
++@unittest.skipUnless(sys.platform == "darwin", "macOS specific test")
++class MacOSXOSAScriptTest(unittest.TestCase):
++    def setUp(self):
++        # Ensure that 'BROWSER' is not set to 'open' or something else.
++        # See: https://github.com/python/cpython/issues/131254.
++        env = self.enterContext(os_helper.EnvironmentVarGuard())
++        env.unset("BROWSER")
++
++        support.patch(self, os, "popen", self.mock_popen)
++        self.browser = webbrowser.MacOSXOSAScript("default")
++
++    def mock_popen(self, cmd, mode):
++        self.popen_pipe = MockPopenPipe(cmd, mode)
++        return self.popen_pipe
++
++    def test_default(self):
++        browser = webbrowser.get()
++        assert isinstance(browser, webbrowser.MacOSXOSAScript)
++        self.assertEqual(browser.name, "default")
++
++    def test_default_open(self):
++        url = "https://python.org"
++        self.browser.open(url)
++        self.assertTrue(self.popen_pipe._closed)
++        self.assertEqual(self.popen_pipe.cmd, "osascript")
++        script = self.popen_pipe.pipe.getvalue()
++        self.assertEqual(script.strip(), f'open location "{url}"')
++
++    def test_url_quote(self):
++        self.browser.open('https://python.org/"quote"')
++        script = self.popen_pipe.pipe.getvalue()
++        self.assertEqual(
++            script.strip(), 'open location "https://python.org/%22quote%22"'
++        )
++
++    def test_explicit_browser(self):
++        browser = webbrowser.MacOSXOSAScript("safari")
++        browser.open("https://python.org")
++        script = self.popen_pipe.pipe.getvalue()
++        self.assertIn('tell application "safari"', script)
++        self.assertIn('open location "https://python.org"', script)
++
++    def test_reject_dash_prefixes(self):
++        with self.assertRaisesRegex(
++            ValueError,
++            r"^Invalid URL \(leading dash disallowed\): '--key=val http.*'$"
++        ):
++            self.browser.open(f"--key=val {URL}")
++
++
+ class BrowserRegistrationTest(unittest.TestCase):
+ 
+     def setUp(self):
+diff --git a/Lib/webbrowser.py b/Lib/webbrowser.py
+index 0bdb644d7db..000e89275b7 100755
+--- a/Lib/webbrowser.py
++++ b/Lib/webbrowser.py
+@@ -162,7 +162,7 @@ class BaseBrowser(object):
+     def _check_url(url):
+         """Ensures that the URL is safe to pass to subprocesses as a parameter"""
+         if url and url.lstrip().startswith("-"):
+-            raise ValueError(f"Invalid URL: {url}")
++            raise ValueError(f"Invalid URL (leading dash disallowed): {url!r}")
+ 
+ 
+ class GenericBrowser(BaseBrowser):
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index c59d9fba80d..ec9ea94824e 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -37,6 +37,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-1502.patch \
            file://CVE-2026-6100.patch \
            file://CVE-2026-3644_CVE-2026-0672.patch \
+           file://CVE-2026-4519_p1.patch \
+           file://CVE-2026-4519_p2.patch \
+           file://CVE-2026-4519_CVE-2026-4786.patch \
            "
 
 SRC_URI:append:class-native = " \

