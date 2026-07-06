Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2FAC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:00:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147666.1783335639611385526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yy51QNUH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EE832C8EC78;
	Mon,  6 Jul 2026 11:00:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0BBC601A2;
	Mon,  6 Jul 2026 11:00:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAEC811BBA04C;
	Mon,  6 Jul 2026 13:00:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783335637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nX03XSmc8NiOwLTC8fjOYwaSyrnMrKjqqiA8Mkkb+r4=;
	b=yy51QNUHSEQ6dq8Hbi71Zbi5CgF3cpdzzVjLaKwdmS4pEsWsEylGQxLHbBY5zYgMuodJxY
	DcuhEbHyA4NUr3J2ZA8SeUjBuLjeH3yrDgM06gDBOS7VYP56wYQU5R77tBng0EGu2O7IIP
	md3inE3x+t5VduWjGmammTZeavwg+pXGHzm2WUcOS4yRiPAGNmbsIrlYP5xhJsIgvBXXyM
	7QnE6nj+xPnNJkeuCi29V9LYtJqljG7KlQAZO1l6InHgoMloel0Ju18cNQAm8SaNjCPJlq
	pwknstEoOubbg3v7Mds85/o5WteWYKdD5Glj/EsiGpGP8w0MfzriXaj6Z7xYuw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 06 Jul 2026 13:00:26 +0200
Subject: [wrynose][PATCH 3/3] python3: fix CVE-2026-11972
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix-cves-python-wrynose-v1-3-b53e09c2b62a@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240251

When using the "tarfile" module with a file opened in "streaming mode"
(mode="r|") the tarfile module did not properly handle EOF, making archive
parsing take exponentially longer.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../python/python3/CVE-2026-11972.patch            | 59 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.14.6.bb     |  1 +
 2 files changed, 60 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
new file mode 100644
index 000000000000..7dc9c6697112
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
@@ -0,0 +1,59 @@
+From 2d256d4bfd654bdcaf2d96733799be73b8ff8f69 Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Tue, 23 Jun 2026 15:13:30 +0200
+Subject: [PATCH 2/2] gh-151981: Make tarfile._Stream.seek break at EOF
+ (GH-151982)
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
+index 63f23490e8a1..399f906efdff 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -524,7 +524,9 @@ def seek(self, pos=0):
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
+index 0fc7413be8db..045377d620cc 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4786,6 +4786,22 @@ def valueerror_filter(tarinfo, path):
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
diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-devtools/python/python3_3.14.6.bb
index ffb7fb6e207d..ec1fd7156bd9 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
            file://CVE-2026-11940.patch \
+           file://CVE-2026-11972.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

-- 
2.54.0


