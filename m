Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529BEC44502
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:00:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148597.1783335638840533315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xWflCrFR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09D69C8EC77
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 11:00:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01498601A2;
	Mon,  6 Jul 2026 11:00:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA4BD11BBA097;
	Mon,  6 Jul 2026 13:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783335636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zOGusyK9bvf56LbB9AsxuyUm0S1sHgYfFua4g4uanyk=;
	b=xWflCrFRxudwlbXLz168JTnKA6oqtqaSI2Dl6UcPg3WcfZRp8DJkbTmoascGMSEEKnS8Kz
	H8svN6Ykf4wlxIKEy2PgigdLunq/jX8V4fwQ0VUgQ0r/O/rr4Lut5mlTGjigPeWN4vQpW7
	ycb03VjZ8h+jdA9vmZY3PJQ6W4SI35lBDsh717Q8i4WU1zjTainYz5QUlueoNs1GGHhpkm
	fHKMqViKzFV4AuLMry7pFEuidrE9ZL/6wA5fplGU8TieaH/PmXVNR8Y48ffnW2PfS91GW5
	FP4+IrAdS0AlfNwddcIhTNvaOvVVG8K/BZNHeJPTbdHAR4vj1cd9raC47Eabkw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 06 Jul 2026 13:00:25 +0200
Subject: [wrynose][PATCH 2/3] python3: fix CVE-2026-11940
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix-cves-python-wrynose-v1-2-b53e09c2b62a@bootlin.com>
References: <20260706-fix-cves-python-wrynose-v1-0-b53e09c2b62a@bootlin.com>
In-Reply-To: <20260706-fix-cves-python-wrynose-v1-0-b53e09c2b62a@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240250

tarfile.extractall() with the 'data' or 'tar' filter could be bypassed
by a crafted archive where a hardlink references a symlink stored at a
deeper name than the hardlink itself.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../python/python3/CVE-2026-11940.patch            | 67 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.14.6.bb     |  1 +
 2 files changed, 68 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
new file mode 100644
index 000000000000..05a5802c3965
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
@@ -0,0 +1,67 @@
+From e24b4e95524fbe8cd0f46aa3292e8040f0e07c83 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 15:58:47 +0200
+Subject: [PATCH 1/2] gh-151558: Fix symlink escape via `tarfile`
+ hardlink-extraction fallback (GH-151559)
+
+CVE: CVE-2026-11940
+Upstream-Status: Backport [https://github.com/python/cpython/commit/27dd970bf6b17ebca7c8ed486a40ab043ed7af8f]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ Lib/tarfile.py           |  3 +++
+ Lib/test/test_tarfile.py | 24 ++++++++++++++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index e6734db24f64..63f23490e8a1 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2782,6 +2782,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
+                     "makelink_with_filter: if filter_function is not None, "
+                     + "extraction_root must also not be None")
+             try:
++                filter_function(
++                    unfiltered.replace(name=tarinfo.name, deep=False),
++                    extraction_root)
+                 filtered = filter_function(unfiltered, extraction_root)
+             except _FILTER_ERRORS as cause:
+                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index d974c7d46ec1..0fc7413be8db 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
+                     self.expect_file("boom", symlink_to='../../link_here')
+                     self.expect_file("c", symlink_to='b')
+
++    @symlink_test
++    def test_sneaky_hardlink_fallback_deep(self):
++        # (CVE-2026-11940)
++        with ArchiveMaker() as arc:
++            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
++            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
++
++        with self.check_context(arc.open(), 'data'):
++            e = self.expect_exception(
++                tarfile.LinkFallbackError,
++                "link 's' would be extracted as a copy of "
++                + "'a/b/s', which was rejected")
++            self.assertIsInstance(e.__cause__,
++                                  tarfile.LinkOutsideDestinationError)
++
++        for filter in 'tar', 'fully_trusted':
++            with self.subTest(filter), self.check_context(arc.open(), filter):
++                if not os_helper.can_symlink():
++                    self.expect_file("a/")
++                    self.expect_file("a/b/")
++                else:
++                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
++                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
++
+     @symlink_test
+     def test_exfiltration_via_symlink(self):
+         # (CVE-2025-4138)
+--
+2.54.0
diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-devtools/python/python3_3.14.6.bb
index 239c966065ce..ffb7fb6e207d 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
+           file://CVE-2026-11940.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

-- 
2.54.0


