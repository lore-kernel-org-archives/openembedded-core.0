Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC402CCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:40:06 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15264.1792129204414289573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LycInuAB;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8027; q=dns/txt;
  s=iport01; t=1792129204; x=1793338804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AfI2hrQD6zDC8BtWmSeY3f3lnFYX4FLHAuyUB/TSPu8=;
  b=LycInuABarb3VZUF5Qk9Cy3MG/Egjg6CHBk86k06eHt16ZXsOxKc8xbe
   5pVR2FAGtXdxl872vItEI5xo37ghXXJIlcDFFWWYdHoBC5rIYZMsQ/pMO
   8ZSNY6pG9Quhty5KLliqWzZkUu1m15B9JBCt14xaBnQbf7iHGdYmJc9Ou
   WXeoIBIB652v5uxLNOx1nD5TnP+BWZWaDDjXditbmJL9gd7PpQGaqXa/q
   Wj7gBcMDGcouh9ZJUR2Ax4KE1NIU1D5601g8qNvIiWLkyzRTE3SfRTj5P
   PRSyzruqCAT8A+0FmLoUYhEs92DMqQaTBskPdPcCrDDd1PzeS36+V8ivy
   g==;
X-CSE-ConnectionGUID: 3+tUNNdGQb2IM18BKeLLlw==
X-CSE-MsgGUID: kZrqHaJwRraOsJ7KH2zngQ==
X-IPAS-Result: =?us-ascii?q?A0BeAgCRt9Fq/4r/Ja1aHgEBCxIMggULgld1YENJlkoDg?=
 =?us-ascii?q?ROKUpI3gX4PAQEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAzIBGAEtEBwDAQIvIAsdAQUIGQkRg?=
 =?us-ascii?q?mgBgjoDNwMRvHeCLIEBgykBPwJDUNhLDYJaAQsUAYE4hUCCf4UkXRgBhHwnG?=
 =?us-ascii?q?xuBcoEVgnN2gQWBGkIBAYglBIIigQyBWh6IG40OSIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUg?=
 =?us-ascii?q?gACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpG?=
 =?us-ascii?q?A1IESw3FRkEPm4HkhQeghhNMUoTASoBIDBBgRsiKZMlj2SCIYE1nmlxCiiDd?=
 =?us-ascii?q?owijz6FfBozhVulFAuYfY4KhAmRSX2EaYFoPIFHCwdwFYMiCUoZD445g2uBf?=
 =?us-ascii?q?4MUUch2JzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:k/i7zaOpw5HgUxPvrR30lsFynXyQoLVcMsEvi/4bfWQNrUoh1mYOx
 mseDD3UbqyKMDfyfN9xaIi2pxlX6JbVmoQ3S3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj664tEHwQG4E3w+wtIEQXp
 dY7JRQpag/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PHwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsi+a3aoWJIIziqcN9nXSCv
 0LP3XvDGBg9L/7A6hrf4HSjv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXJIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:XfPfwK4vKT7J53uEXwPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3A4V9hjGkiKEg1IRmLn++ZROMrQqfXOSae0Er2BUO?=
 =?us-ascii?q?XMGwzaZjMGXWz9YdAl9U7zg=3D=3D?=
X-Talos-MUID: 9a23:t1KVfAgiLxX3lA7JNfvzVcMpN/Vy+oSnKl83i5whoOvbFgwqKTGStWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536227428"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:40:03 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 9EE9C18000283;
	Fri, 16 Oct 2026 05:40:01 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 48053CBF203; Thu, 15 Oct 2026 22:40:01 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/3] python3: fix CVE-2026-87910
Date: Thu, 15 Oct 2026 22:39:44 -0700
Message-Id: <20261016053944.3835603-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016053944.3835603-1-dkelaiya@cisco.com>
References: <20261016053944.3835603-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247929

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1]. The Windows test
correction is applied from [2]. The advisory identifying the fix is
referenced in [3].

[1] https://github.com/python/cpython/commit/fb2f0bbc3b35264f09cc2cb2934b7987527a6bc2
[2] https://github.com/python/cpython/commit/d9565e54b1fc6d63c5be9afd58114499128fa57b
[3] https://nvd.nist.gov/vuln/detail/cve-2026-87910

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3/CVE-2026-87910_p1.patch    | 98 +++++++++++++++++++
 .../python/python3/CVE-2026-87910_p2.patch    | 55 +++++++++++
 .../recipes-devtools/python/python3_3.14.8.bb |  2 +
 3 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-87910_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-87910_p2.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-87910_p1.patch b/meta/recipes-devtools/python/python3/CVE-2026-87910_p1.patch
new file mode 100644
index 0000000000..9786e82619
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-87910_p1.patch
@@ -0,0 +1,98 @@
+From 19b8b2011fd1743841510e44b8e9e87f3a3f4ba0 Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Fri, 11 Sep 2026 14:19:35 +0200
+Subject: [PATCH] gh-157265: tarfile: Honor None result of filter for link
+ fallbacks (GH-157266)
+
+Co-authored-by: Stan Ulbrych <stan@python.org>
+
+CVE: CVE-2026-87910
+Upstream-Status: Backport [https://github.com/python/cpython/commit/fb2f0bbc3b35264f09cc2cb2934b7987527a6bc2]
+
+(cherry picked from commit fb2f0bbc3b35264f09cc2cb2934b7987527a6bc2)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ Lib/tarfile.py                                |  4 ++-
+ Lib/test/test_tarfile.py                      | 31 +++++++++++++++++--
+ ...-09-10-13-38-11.gh-issue-157265.-vYuMp.rst |  3 ++
+ 3 files changed, 34 insertions(+), 4 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-09-10-13-38-11.gh-issue-157265.-vYuMp.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index b7b4af15b1..89e1e9b218 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2818,9 +2818,11 @@ class TarFile(object):
+                     "makelink_with_filter: if filter_function is not None, "
+                     + "extraction_root must also not be None")
+             try:
+-                filter_function(
++                filtered = filter_function(
+                     unfiltered.replace(name=tarinfo.name, deep=False),
+                     extraction_root)
++                if filtered is None:
++                    return
+                 filtered = filter_function(unfiltered, extraction_root)
+             except _FILTER_ERRORS as cause:
+                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index ab13ab34fc..c09592075b 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4395,9 +4395,15 @@ class TestExtractionFilters(unittest.TestCase):
+         for filter in 'tar', 'fully_trusted':
+             with self.subTest(filter), self.check_context(arc.open(), filter):
+                 if not os_helper.can_symlink():
+-                    self.expect_file("a/t/dummy")
+-                    self.expect_file("b/")
+-                    self.expect_file("c/")
++                    if filter == 'tar':
++                        self.expect_exception(
++                            tarfile.LinkFallbackError,
++                            "link 'boom' would be extracted as a copy of "
++                            + "'c/escape', which was rejected")
++                    else:
++                        self.expect_file("a/t/dummy")
++                        self.expect_file("b/")
++                        self.expect_file("c/")
+                 else:
+                     self.expect_file("a/t/dummy")
+                     self.expect_file("b/")
+@@ -4576,6 +4582,25 @@ class TestExtractionFilters(unittest.TestCase):
+             if os_helper.can_chmod():
+                 self.assertFalse(path.stat().st_mode & stat.S_IWUSR)
+ 
++    @symlink_test
++    def test_extract_filters_target_none(self):
++        # Test that when extract() falls back to extracting (rather than
++        # linking) a hardlink target, the member is skipped if the filter
++        # returns None.
++        with ArchiveMaker() as arc:
++            arc.add('a/b/s', symlink_to='../escape')
++            arc.add('q', hardlink_to='a/b/s')
++        def filter_unsafe_members(member, path):
++            try:
++                return tarfile.data_filter(member, path)
++            except tarfile.FilterError as error:
++                return None
++        with self.check_context(arc.open(), filter_unsafe_members):
++            if os_helper.can_symlink():
++                self.expect_file('a/b/s', symlink_to='../escape')
++            else:
++                self.expect_file('a/b/')  # symlink is not extracted
++
+     def test_link_fallback_normalizes(self):
+         # Make sure hardlink fallbacks work for non-normalized paths for all
+         # filters
+diff --git a/Misc/NEWS.d/next/Security/2026-09-10-13-38-11.gh-issue-157265.-vYuMp.rst b/Misc/NEWS.d/next/Security/2026-09-10-13-38-11.gh-issue-157265.-vYuMp.rst
+new file mode 100644
+index 0000000000..ba27e47f73
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-09-10-13-38-11.gh-issue-157265.-vYuMp.rst
+@@ -0,0 +1,3 @@
++In :mod:`tarfile`, when extracting a link falls back to extracting a member
++of the archive, skip the member when the filter function returns None when
++called with the extracted member's name replaced with the link's.
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-87910_p2.patch b/meta/recipes-devtools/python/python3/CVE-2026-87910_p2.patch
new file mode 100644
index 0000000000..fc97378719
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-87910_p2.patch
@@ -0,0 +1,55 @@
+From 8dd3fcd26e7effd2de3b3ec7709d80632b6acfc7 Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Fri, 11 Sep 2026 19:54:41 +0200
+Subject: [PATCH] gh-157265: Adjust test for Windows (GH-157334)
+
+gh-157266: Adjust test for Windows
+
+On Windows (no symlinks, no hardlinks), the behaviour is
+the same as without the fix in GH-157266:
+- a/t/dummy is extracted
+- b/ is extracted
+- c/ is *not* created (the target, a/t, is not in the archive)
+- c/escape: c/ is created; escape is skipped (target,
+   c/../../link_here, is not in archive)
+- c is not recreated as a directory
+- boom is not created (target is c/escape, which falls back to
+  ..\..\link_here, which does not exist in archive)
+
+CVE: CVE-2026-87910
+Upstream-Status: Backport [https://github.com/python/cpython/commit/d9565e54b1fc6d63c5be9afd58114499128fa57b]
+
+(cherry picked from commit d9565e54b1fc6d63c5be9afd58114499128fa57b)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ Lib/test/test_tarfile.py | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index c09592075b..7e072d9090 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4395,15 +4395,15 @@ class TestExtractionFilters(unittest.TestCase):
+         for filter in 'tar', 'fully_trusted':
+             with self.subTest(filter), self.check_context(arc.open(), filter):
+                 if not os_helper.can_symlink():
+-                    if filter == 'tar':
++                    if filter == 'fully_trusted' or sys.platform == "win32":
++                        self.expect_file("a/t/dummy")
++                        self.expect_file("b/")
++                        self.expect_file("c/")
++                    else:
+                         self.expect_exception(
+                             tarfile.LinkFallbackError,
+                             "link 'boom' would be extracted as a copy of "
+                             + "'c/escape', which was rejected")
+-                    else:
+-                        self.expect_file("a/t/dummy")
+-                        self.expect_file("b/")
+-                        self.expect_file("c/")
+                 else:
+                     self.expect_file("a/t/dummy")
+                     self.expect_file("b/")
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3_3.14.8.bb b/meta/recipes-devtools/python/python3_3.14.8.bb
index 6aa5514246..2bf2806ee8 100644
--- a/meta/recipes-devtools/python/python3_3.14.8.bb
+++ b/meta/recipes-devtools/python/python3_3.14.8.bb
@@ -36,6 +36,8 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
            file://CVE-2025-15367.patch \
+           file://CVE-2026-87910_p1.patch \
+           file://CVE-2026-87910_p2.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-- 
2.35.6


