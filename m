Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CC7CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:12:32 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88529.1781345545004113823
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GHmpTdU8;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14894; q=dns/txt;
  s=iport01; t=1781345545; x=1782555145;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OWkLW1Sjq1LO4/ViICcIgeeSE+L2ZKglEMb02IllhGM=;
  b=GHmpTdU8WbCpnqsnOBPsikvVMu0dGI2wlsatvoFj6rfzcXUAA4TQoDkT
   213Xolb6gPbCQ2v/ynf4QeyxYf3OAmaYTfx538Zw+Yh1bBMA69+DPYmub
   SOiYHldw5eMKdElAbOH2gzUBl1BRpH7lDSfN++qDHAXjBE1SzgNC4vI2i
   0rcRRyQpFGYuERjLIrWckAY93Pe94NFcmKVEWNl+pxS2IOzmE8hZzHcbA
   se0j6X/hRthPIqX45N2VknQwoRonGhxWGe3xFS+60iIpcBer9niOh6iwV
   o1xlvoRrnv3J5RmPhczRPqLWi7OFzTXOsujkdoqBzK71c8q43EGhpGnww
   A==;
X-CSE-ConnectionGUID: ZlQ6uxMTRqyYB13/mQyGFg==
X-CSE-MsgGUID: 8ZKzBoVjTYS41iA2/frB7g==
X-IPAS-Result: =?us-ascii?q?A0BNAgBhLC1q/5T/Ja1aglmCV3RfQkkDhFSPU4IhA4tkk?=
 =?us-ascii?q?jeBfg8BAQEPRA0EAQGEQEYCjUMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMjDwEYAT0cAwECAwImAgIgCyMIEAkJEQSCZ?=
 =?us-ascii?q?AGCOgM2AgERs1h6gTKBAYMoATEFAwEFAkNQ2EgNglYBCxQBgQouhT+CfCABh?=
 =?us-ascii?q?QJbGAFEhDgnGxuBcoEVg2mBBYEaQgEBAoE1hASCagSCIoEMgV0ejx1IgQIcA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+FzRYGwcFgUqBK2qBBIUNIx8DOX+Bc?=
 =?us-ascii?q?4EoZ2cVMDWBAhEfChwDCxgNSBEsNxQbBD0BbgeMXRcPgUIKcgE8NwcTAQcjA?=
 =?us-ascii?q?QkOCQItMBIHCCMdTBENKwWjB4IhoB5xCiiDdYwhjz6FfBozhVulEZkIjgqEC?=
 =?us-ascii?q?ZJHhGiBaDyBRwsHcBWDIglKGQ+OOINrgX+CUUNRwSokNQIJAy8BAQcCBwIMA?=
 =?us-ascii?q?wuBaJAAAiYBgVQBAQ?=
IronPort-Data: A9a23:DZLZr6975Z64l/L0sPRADrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GAfCGmGOfvfYGPzfY9zboXl8UgC6sTWz9dmGQI+rXhEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4muyyHjEAX9gWAsbDtPs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kEObRG5/ZSPVtX5
 M0ycWtKaymSqMy5lefTpulE3qzPLeHxN48Z/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP00n1lQ/UPrSmM+zm3XidjdYoXqepLE85C7YywkZPL3FbIuOI4TbGpQP9qqej
 jL03HbTBS8YCO2klWOE2yjriPXlwiyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:Qn5PuaBjgaGnTDDlHemO55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:jo4BOm0hAczUHujQLh1nxLxfKMQcLGDN6UvqOl6JIz8yD7isWHC+9/Yx
X-Talos-MUID: 9a23:EnQm9gjYwoxm0x2M1/UfAcMpZPVL8Y6pNkIxoK5a4sitb2t+IR3Cg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,202,1774310400"; 
   d="scan'208";a="493109792"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jun 2026 10:12:22 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 26A501800027E
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:12:22 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id C8247CB6A93; Sat, 13 Jun 2026 03:12:21 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/4] python3: Fix CVE-2026-4519 and CVE-2026-4786
Date: Sat, 13 Jun 2026 03:11:37 -0700
Message-Id: <20260613101137.3690080-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260613101137.3690080-1-sudumbha@cisco.com>
References: <20260613101137.3690080-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238668

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
index 0000000000..6a4714f25a
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
index 0000000000..1514d2c541
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
index 0000000000..7ee145e5e8
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
index 41d2efbd28..6ef67e8117 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -35,6 +35,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2026-3644_CVE-2026-0672.patch \
+           file://CVE-2026-4519_p1.patch \
+           file://CVE-2026-4519_p2.patch \
+           file://CVE-2026-4519_CVE-2026-4786.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.35.6


