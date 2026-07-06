Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC0CC44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:01:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148626.1783335709092048015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=A041XaMd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4A91E1A0E8F;
	Mon,  6 Jul 2026 11:01:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2085A601A2;
	Mon,  6 Jul 2026 11:01:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8306311BBA104;
	Mon,  6 Jul 2026 13:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783335706; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EiZiirs6Y8nhL2+mHzTUKnIbMUcFSCJraBGqkvsGtHY=;
	b=A041XaMdzUkC4vLGMNv0pa4bTCmBQjgkU8odzYTXbUqPkqmIqmuYuwVDopBqoQc2lSrh/N
	PN/sBnURVGznIZlrGWmOg+znvE1iyNmEWamMXS7hbDKotvaWcynSt1g83K12i/GYIX46od
	yBRC8CtsKpRu9CPrGDnUygnZDOZgJlIrWb1hcFViVBWxGXPq+Ok50jl/SXunuvjSxm6HeB
	eDdfI+iL114UfPv22/1wPD4S+y2aI+turkLHNZjxRe6hKAaFxchf08sitgdnor2O50NQoa
	4vCjV3/M3rl2VxBH/L7AA/NTXxSx+QBCmWXUU+ST6BngDMNJAiQEM+zaGQ570w==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 06 Jul 2026 13:01:36 +0200
Subject: [scarthgap][PATCH 2/3] python3: fix CVE-2026-11972
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix-cves-python-scarthgap-v1-2-8d51db14f7ac@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240254

When using the "tarfile" module with a file opened in "streaming mode"
(mode="r|") the tarfile module did not properly handle EOF, making archive
parsing take exponentially longer.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../python/python3/CVE-2026-11972.patch            | 58 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.12.13.bb    |  1 +
 2 files changed, 59 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
new file mode 100644
index 000000000000..0752ba372dcc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
@@ -0,0 +1,58 @@
+From a83ebdb495a9cbd28a03675acdeda235fade90b3 Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Tue, 23 Jun 2026 15:13:30 +0200
+Subject: [PATCH] gh-151981: Make tarfile._Stream.seek break at EOF (GH-151982)
+
+CVE: CVE-2026-11972
+Upstream-Status: Backport [https://github.com/python/cpython/commit/f50bf13566189c8d0ce5a814f33eff3d89951896]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ Lib/tarfile.py           |  4 +++-
+ Lib/test/test_tarfile.py | 16 ++++++++++++++++
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 83226e907e4b..c0007a78f700 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -516,7 +516,9 @@ def seek(self, pos=0):
+         if pos - self.pos >= 0:
+             blocks, remainder = divmod(pos - self.pos, self.bufsize)
+             for i in range(blocks):
+-                self.read(self.bufsize)
++                data = self.read(self.bufsize)
++                if not data:
++                    break
+             self.read(remainder)
+         else:
+             raise StreamError("seeking backwards is not allowed")
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 29719d95b6c1..8aeb2e1b1b9a 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4480,6 +4480,22 @@ def valueerror_filter(tarinfo, path):
+         with self.check_context(arc.open(errorlevel='boo!'), filtererror_filter):
+             self.expect_exception(TypeError)  # errorlevel is not int
+
++    @support.subTests('format', [tarfile.GNU_FORMAT, tarfile.PAX_FORMAT])
++    def test_getmembers_big_size(self, format):
++        # gh-151981: A loop in seek() for streaming files tried to read the
++        # declared number of blocks even at EOF
++        tinfo = tarfile.TarInfo("huge-file")
++        tinfo.size = 1 << 64
++        bio = io.BytesIO()
++        # Write header without data
++        bio.write(tinfo.tobuf(format))
++
++        # Reset & try to get contents
++        bio.seek(0)
++        with tarfile.open(fileobj=bio, mode="r|") as tar:
++            with self.assertRaises(tarfile.ReadError):
++                tar.getmembers()
++
+
+ class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
+     testdir = os.path.join(TEMPDIR, "testoverwrite")
+--
+2.54.0
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index f41588055f32..24ceeb30a416 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2025-13462.patch \
            file://CVE-2026-4224.patch \
            file://CVE-2026-11940.patch \
+           file://CVE-2026-11972.patch \
            "
 
 SRC_URI:append:class-native = " \

-- 
2.54.0


