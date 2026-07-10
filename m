Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D795C44508
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1854.1783701427680979083
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iP+/Osnp;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so8415195e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701426; x=1784306226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mfXk0h1YU6lGn7Tt2W0spfD0cq5jmLIpZwDKkrzZa4M=;
        b=iP+/OsnpdH+KHCwVaQjqszaFszC779Mwo3jl8Pj0tLZTOSGC7rYO48CvdmRQxYS9BD
         fAeM0he1OBwf0fekStl2YF91YRXwT2/34KJ8whZsHvYOs3zcP0+gkq54Ft0QAlWTFvQ5
         BjbjnWBZvzvOMykIhbxMji6IDVPnXSyeY4ii4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701426; x=1784306226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mfXk0h1YU6lGn7Tt2W0spfD0cq5jmLIpZwDKkrzZa4M=;
        b=R7RggYaZ0Jq0s2lGlWP5+iaBHnYQKOKpjbsNmLnaKpYXM8UiNJsHYJUpG2KZi1Iibc
         UUbKg1a7yMTd4L9shCV92YwChSUSho0hiyYfd+W+o2VXTWGRwmT4WThXKuv0ma5xD5iP
         pGAqiI5hLac6BqwpensN4t3U/AGPl2XLFzyYEHUkP4BXIwD8qzqexmXOM/gqgoBhCLua
         c8ZU3URfcYu0bAKaj4RSm/VOe0K4YJASZpQmfsZWqDPvtpiR0gO7BgXLyrcwehKkQldV
         8G1VEUNeZsPstARr9Kes/AT5K8pXgVrg7bg8/wYadoY50pr09S082JyhgGKhnqAIwFtM
         Epsg==
X-Gm-Message-State: AOJu0YyKFDq7PI5p19ex5dIx4pyGJK+8oDt2Ys2KKvtk5DypG9vs5Qrt
	VbE+ShNX60wLfpYwBMrGlp2TJ4w9JqmsrhGD3yuIg1A8h8U/N8MqMI+dQYjm4AwVjUTCODGIXql
	cLLQaD7w=
X-Gm-Gg: AfdE7ckhwlZsx0ydp8R9wZIbABVgM06UCI2EqVXQNO1/zVDdF+vvfY8KjB/5zX3zCFx
	Z1rzq6se7TXuAds6O0lZljLlS+weadhQkET0YxItNsxBHl1XqMT9hw3jPvrGwnhtUu0xWKoZDPw
	4GJ5r/kngCj4sswPvTlHyUPlXaResArqMSzOeXuSeI+VN0ATrRC18yD6Qrl6oSplyWOXT4SHSLe
	kwC/KlOf31v0jSRgsk1Ms9k/80oV+hJgSDvSpQhHxz/bAeELULc/Ha0WSJU76XD4P2vK4EIVA9N
	e1FejdnT7PkZP7M4aL95kwTvSz7Jg9u2JK77P6azDB9zo+iMXIT5O/TSwehfcEUxT79fuU5sBMt
	iegL8o0TB9JrniyqOOUZJHbTqUL/VxRtN1tHSxpY0zZcDaMyydAPm5J8FIG3St/qpT59CU5UK2t
	/3ejexAg4T0Msf37ft+VS6CScyynf8X+p06z+UmVA7KoZLApN4Shv0BFuIvdMsy6l8VzvXN3cVj
	8jI+MHOAt5Ug0nHbmo=
X-Received: by 2002:a05:600c:34c9:b0:493:bc4a:fb50 with SMTP id 5b1f17b1804b1-493e68fd540mr122348175e9.38.1783701425892;
        Fri, 10 Jul 2026 09:37:05 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/18] python3: fix CVE-2026-11972
Date: Fri, 10 Jul 2026 18:36:22 +0200
Message-ID: <3f317501a830ef4f57ff494ca73b45fa662e72b6.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240668

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

When using the "tarfile" module with a file opened in "streaming mode"
(mode="r|") the tarfile module did not properly handle EOF, making archive
parsing take exponentially longer.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bbd9c82298880ab61b9befea97dfe8a0a4943836)
[YC: re-added removed Co-authored-by: trailer to the patch]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2026-11972.patch       | 61 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.6.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
new file mode 100644
index 00000000000..12a79754feb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
@@ -0,0 +1,61 @@
+From 2d256d4bfd654bdcaf2d96733799be73b8ff8f69 Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Tue, 23 Jun 2026 15:13:30 +0200
+Subject: [PATCH 2/2] gh-151981: Make tarfile._Stream.seek break at EOF
+ (GH-151982)
+
+Co-authored-by: Stan Ulbrych <stan@python.org>
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
index 80be938ed50..0a9e82d445f 100644
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

