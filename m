Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A0FC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 08:01:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4263.1784534466766976925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 01:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kbqC+YOX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22BD81A1104;
	Mon, 20 Jul 2026 08:01:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB13460360;
	Mon, 20 Jul 2026 08:01:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A191D11BD3D35;
	Mon, 20 Jul 2026 10:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784534464; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8nDfkSG964qGSr1QxfYMq+6xNngEGIfB6AaZVA7hasM=;
	b=kbqC+YOXDay6lys98b4/XIokKlt0RDS78NFL2lORd667fvPnOlHUaXctHc9dMcRby4jO85
	YRgpJBSnA5pT0gq9QOM7TckcXyc3/1cKoCe5gJuxTPsLvy/N8YzHhJhv5GHdfAG2TpSekR
	C/qNXmB7V4WHpFUaHMV1xMZvuieFFdim9ixQWBFvPCwKzO+K8dJVuJew2Rboznoj0lDZlS
	aRFONq8/uUVba1peMkvem36Uf0whZfuxgYQsRh/k+0UyCmzXBJSEdY57+Zh5JgphH7i3P7
	Cqpz4F2BslEKzHjnJHOeBG2rSD+XhpF54nMLqxBdRHWLyBIDCBba34lAr5+03w==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Jul 2026 10:01:01 +0200
Subject: [scarthgap][PATCH v2 1/3] python3: fix CVE-2026-11940
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-fix-cves-python-scarthgap-v2-1-fe434ff03f49@bootlin.com>
References: <20260720-fix-cves-python-scarthgap-v2-0-fe434ff03f49@bootlin.com>
In-Reply-To: <20260720-fix-cves-python-scarthgap-v2-0-fe434ff03f49@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241335

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
2.55.0


