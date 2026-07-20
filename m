Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD87C4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2864.1784568214492846149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oeZrIS0P;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495437bb891so32970895e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568213; x=1785173013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JFcPRDtEdNR6eDOdkKmZReiJSlJjUT6YoqNWETaggb8=;
        b=oeZrIS0PtJ9RpfIUQ4VsE8b2GM/apwdxNwWd/7xb1XTEPPF8vCX6jTgx1VMvW4TLI+
         CzdHb1Oon+rmTkFHtgnfdvg/uDSXOG6a3NW37j7NySIzB1YZdfdQbZkBEvVOLSaU8X8/
         ftiiBlNDoGXpIYXX4cx5fxh2c8PCetYhqgBMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568213; x=1785173013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JFcPRDtEdNR6eDOdkKmZReiJSlJjUT6YoqNWETaggb8=;
        b=qLrwmg5UapO+aRtWloYH2696UnuQWq7YZWDF8w9hLyfiyioz/kgGbggN5K6xtLoxST
         mJf7L8vpGr31rTmH623LjY4yWaUZfrCAOm6LNOt3pTdW8pfzqKDKb5WOrtybuFWGjzpT
         5xrqCkDhB8grDswZHk1D8KHhzo3Tc+iWoUWk1CtcUilffPXRmRu645uZ6nDCpU0kQ+uC
         Js6PcWDNR1KR3waKHPfF7/iQIXLyJOUz2d62VGDF3roRtgjGfPSX0xl68Z4a3oUbi601
         PwkZnCNqEZ5vzZuQrP143UA/kKMpFy8jE9NbbsKgjNnoywMWVA5CVDbj24ZlThVdP1OO
         jw3A==
X-Gm-Message-State: AOJu0YxMnpyguSFadZGnFhtoxxZr3mmVWH1d5TtSqhDaEuVWL2UEpXC8
	YkdF9JrWxuWbcquzHur/1tiq4Zi1etDxvSVz+3f4uXbPaKexT+VZmcfaim8/savN8o1F8008fDu
	HpLooFos=
X-Gm-Gg: AfdE7cnbs87W/ECfuKjYvIhykUKKI1wHhavK9ENQdatmMKVJI+85Oz2+GsXqLIaPQj0
	QSjLkVZmYIyePpA+Pduqjs29t9bUT75nmn720HX6qPjesIjPi7+4bJGO4cnnzvjhoV1ea6f+nVm
	/Ptf4cYTkY33C1s88CPNUWi/OOlro7yZ8Vq3NxKo0dkxR+B6c2MzkROAxZxqAw8jsOg292gLZ/d
	km3QDm6cvegWt86sokSXfzl2+lLJGUz1pQm60DUrr0uPlNKsGBiZV01B2bf8RcLFxYw6XPuq11W
	MRrAoOAB9jvT9qt/0uBjLbpOjtl/nwWdW8DV2Pprxjjc0vJNksmKkD3BzSGTEf4liu4/S8tDx3A
	OG/qhd0mA/Ucx7ilXJwXp2v05YoH/kUGNGwCXa5/lAoXqYBGQNEhxpXgMKqBikTOGGECKhO8pa5
	WVS/M6K5GXPgMf1m/bcLkh7nhdHGnIGTsAZ2r/OP2BNL4L8YvlMPnHjrNw73+xTHz4GYFryhoRo
	UIohEZDT9RpBoyVL3I=
X-Received: by 2002:a05:600c:35d1:b0:495:3a52:71b1 with SMTP id 5b1f17b1804b1-4954aa1a34fmr143748485e9.5.1784568212758;
        Mon, 20 Jul 2026 10:23:32 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/33] python3: fix CVE-2026-11972
Date: Mon, 20 Jul 2026 19:22:42 +0200
Message-ID: <9c066bcd634e7b938a10c64ef1eaf322a99ec434.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241443

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

When using the "tarfile" module with a file opened in "streaming mode"
(mode="r|") the tarfile module did not properly handle EOF, making archive
parsing take exponentially longer.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bbd9c82298880ab61b9befea97dfe8a0a4943836)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2026-11972.patch       | 60 +++++++++++++++++++
 .../python/python3_3.12.13.bb                 |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
new file mode 100644
index 00000000000..36334f247e6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
@@ -0,0 +1,60 @@
+From a83ebdb495a9cbd28a03675acdeda235fade90b3 Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Tue, 23 Jun 2026 15:13:30 +0200
+Subject: [PATCH] gh-151981: Make tarfile._Stream.seek break at EOF (GH-151982)
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
index e4907154119..72daee1d0ea 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2025-13462.patch \
            file://CVE-2026-4224.patch \
            file://CVE-2026-11940.patch \
+           file://CVE-2026-11972.patch \
            "
 
 SRC_URI:append:class-native = " \

