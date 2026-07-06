Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEC4C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:01:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148622.1783335707592969537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KpDcEV96;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E7EE04E40CAD;
	Mon,  6 Jul 2026 11:01:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCC95601A2;
	Mon,  6 Jul 2026 11:01:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33E5411BB9EEF;
	Mon,  6 Jul 2026 13:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783335704; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ToF9pYgzMoGdUJ3V+vJUsQB0N3t+hpcriy+4QTQxTeI=;
	b=KpDcEV96R91hrzNIg8Yb+oxIQhftQ3h1yizrKCppJ8Vtc0dyXDXBsMsbqC5EwWTr1pqBiQ
	u/BgE8GKiGHn/1qmbiNlZOZhVuuSTslnFyniYkNADE+rblpkbUATU3yOzhyBvQerOftuuu
	QvszjSH1w13F0EjKhMA4YSUbkFyaS5m8lubK1v572+dyUVsm5baLwY23IrPXZparv2oecX
	dcX2qxYwTcQ5vsae7QYRNDrXaAp/AVzQO5dNQujoOwXLFuQ68XEMtjejy9Oe6PEiCaQ8kO
	hwx9VBHnomRW6qezIsUX3QD5QZ8k6+0OtElyNFuF+Uj/FdXirk+pN/JHO8kSyg==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 06 Jul 2026 13:01:35 +0200
Subject: [scarthgap][PATCH 1/3] python3: fix CVE-2026-11940
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix-cves-python-scarthgap-v1-1-8d51db14f7ac@bootlin.com>
References: <20260706-fix-cves-python-scarthgap-v1-0-8d51db14f7ac@bootlin.com>
In-Reply-To: <20260706-fix-cves-python-scarthgap-v1-0-8d51db14f7ac@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240253

tarfile.extractall() with the 'data' or 'tar' filter could be bypassed
by a crafted archive where a hardlink references a symlink stored at a
deeper name than the hardlink itself.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../python/python3/CVE-2026-11940.patch            | 66 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.12.13.bb    |  1 +
 2 files changed, 67 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
new file mode 100644
index 000000000000..0851138ae892
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
@@ -0,0 +1,66 @@
+From 91a9bd79cdbab8f8518c4a5e669b3f19680a2f31 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Tue, 23 Jun 2026 14:31:38 +0100
+Subject: [PATCH] gh-151558: Fix symlink escape via `tarfile`
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
+index 59d3f6e5cce1..83226e907e4b 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2650,6 +2650,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
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
+index 759fa03ead70..29719d95b6c1 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4080,6 +4080,30 @@ def test_sneaky_hardlink_fallback(self):
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
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index 06dbc8e892d9..f41588055f32 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-6019_p2.patch \
            file://CVE-2025-13462.patch \
            file://CVE-2026-4224.patch \
+           file://CVE-2026-11940.patch \
            "
 
 SRC_URI:append:class-native = " \

-- 
2.54.0


