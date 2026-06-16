Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77373CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:47:16 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2281.1781628428240587963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 09:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=cZZpcYXn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202606161647044b086036bb00020735-_2ywox@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202606161647044b086036bb00020735
        for <openembedded-core@lists.openembedded.org>;
        Tue, 16 Jun 2026 18:47:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MYDlqqbex1zRmqgD6C3Ms1QcFYs/C+OwxLX0N60QTSE=;
 b=cZZpcYXnMSkJR+CfI8jz/GQIts2X1du1dw816xqAUZ3U7qI+9hxdEIW8M9/xf4LMxYUkgv
 NtrkGgLeNufrqPSHwhtocRnTMo1Hg27+lA8VZcmc/UxNKDuBkpv6k6ShVhklQisRuCf4WyoV
 z6yN4cQCnP6q7teCnACMHIH03fRLpHrKyCG+BF//xxGDCXf9kv97k3L8r5L4E6V8hVKy9+ZY
 wd33GAYOm62wIZIhjIueHjUiR1Mi7UNuhomUFQfT9YWxk5vm1gOFm3g66psTefRJRJXoHSu1
 5NKg5YeOGx+jN0D6vvCayy8vbU/ygpDNcYP78ppib0RHB4YikNuYtIFQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] python3: upgrade 3.14.5 -> 3.14.6
Date: Tue, 16 Jun 2026 18:46:57 +0200
Message-ID: <20260616164657.3046807-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238918

From: Peter Marko <peter.marko@siemens.com>

Release notes: [1]

Resolves following CVEs from reports:
* CVE-2026-3276
* CVE-2026-7210
* CVE-2026-7774
* CVE-2026-8328
* CVE-2026-9669

Resolves also:
* shutil.move symlink-based bypass (CVE assignment unknown)

Removed obsolete CVE_STATUS entries.
Removed patch included in this release.

[1] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-6-final
[2] https://security-tracker.debian.org/tracker/CVE-2026-7210

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...eadingMock-call-count-race-condition.patch | 37 -------------------
 .../{python3_3.14.5.bb => python3_3.14.6.bb}  |  7 +---
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
 rename meta/recipes-devtools/python/{python3_3.14.5.bb => python3_3.14.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch b/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
deleted file mode 100644
index aba3188a59..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 388e023fe1197c1ffed374520ed45df4ac72b8f5 Mon Sep 17 00:00:00 2001
-From: Sai Sneha <saisneha196@gmail.com>
-Date: Thu, 21 May 2026 13:08:07 +0530
-Subject: [PATCH] Fix ThreadingMock call_count race condition
-
-ThreadingMock._increment_mock_call() was not thread-safe.
-Multiple threads calling the mock simultaneously could lose
-increments due to race conditions on call_count and other
-attributes.
-
-Fix by overriding _increment_mock_call in ThreadingMixin
-and wrapping it with the existing _mock_calls_events_lock.
-
-Upstream-Status: Backport [https://github.com/python/cpython/pull/150176]
-
-Signed-off-by: Sai Sneha <saisneha196@gmail.com>
----
- Lib/unittest/mock.py | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Lib/unittest/mock.py b/Lib/unittest/mock.py
-index 16f3699e89..56cdc37942 100644
---- a/Lib/unittest/mock.py
-+++ b/Lib/unittest/mock.py
-@@ -3113,6 +3113,10 @@ def _mock_call(self, *args, **kwargs):
- 
-         return ret_value
- 
-+    def _increment_mock_call(self, /, *args, **kwargs):
-+        with self._mock_calls_events_lock:
-+            super()._increment_mock_call(*args, **kwargs)
-+
-     def wait_until_called(self, *, timeout=_timeout_unset):
-         """Wait until the mock object is called.
- 
--- 
-2.34.1
diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.5.bb
rename to meta/recipes-devtools/python/python3_3.14.6.bb
index 02bda8ddcf..291bde70f6 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -22,13 +22,12 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-prefer-valid-entrypoints.patch \
-           file://0001-Fix-ThreadingMock-call-count-race-condition.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "7e32597b99e5d9a39abed35de4693fa169df3e5850d4c334337ffd6a19a36db6"
+SRC_URI[sha256sum] = "143b1dddefaec3bd2e21e3b839b34a2b7fb9842272883c576420d605e9f30c63"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -581,7 +580,5 @@ py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
 
-CVE_STATUS[CVE-2026-4786] = "cpe-stable-backport: backported to v3.14.5"
-CVE_STATUS[CVE-2026-5713] = "cpe-stable-backport: backported to v3.14.5"
 CVE_STATUS[CVE-2026-6019] = "cpe-stable-backport: backported to v3.14.5"
-CVE_STATUS[CVE-2026-6100] = "cpe-stable-backport: backported to v3.14.5"
+CVE_STATUS[CVE-2026-7210] = "cpe-stable-backport: backported to v3.14.6"

