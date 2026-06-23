Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA938CDE008
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:15 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32859.1782253625621454116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W9sFoTaX;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4626fdc829aso301812f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253624; x=1782858424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3AV1TB8FYe9eINH+XA5/rWkSGE0mC2exO7JfYy/+n0=;
        b=W9sFoTaX4HHqJ++azp0qEIJsdjf3A0NZZvdIRYeFnuzgRGiou5k7fb4p5rMLaT8qtX
         95t/s1eXltLQPyUsACcTEOc4/z5NzXocBN45soUntZAtQJwGdrsysptnzfZcnyEb3ao+
         3zcJiew+Rb7zgkadmNQ3zyPWr4upjKg6hYGj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253624; x=1782858424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3AV1TB8FYe9eINH+XA5/rWkSGE0mC2exO7JfYy/+n0=;
        b=qVZFxwXHmvwWMqCZnudmDWl7p2xYHhy6teLEAD0LYfS9EN0jACmoniHfdY2LlIZWeI
         4TW4KgXkZPuWllRkYUmg1SZxqm5zFp+lNcpd5TzkRHFu2zcMMcFQfqJRPfmOq0NkrqOP
         9GPXJkS1rtPC7lLNNzSxfh6qOK3iHr9Uy1edmP0A81/3vnXAp7MclDO67x9wHq9gvAbl
         8oA6CJHiIJSX83ic5iiXAIgaue49xRgxBMWMBnagsnFJhMfQ66F3xXIH/x5g847hTzq7
         ehFslFKRiW6uWe3TR32hkRF8b2ck2VPCMOO13zLJfNSv7rIJ7m/2w+SaHy0mx+kRKZLJ
         GEEA==
X-Gm-Message-State: AOJu0YyjgqMvZoryULH8w4hvVDR9V+wkQKROMckSyXWQ8qXSVoMR8gx+
	EfvurVH0mZhSIbQBZrZdDtqSGct/i/ct1fjiLntCq+XaDHCgj7noJnM6H2zZZJ8dJDl3FRRQe9z
	+wVKj
X-Gm-Gg: AfdE7cmD1eVGZhzsPh8BmpC2FqeFs4d4lXP10hZaugC/4I4avKFUJG2YpYS1GSlGxT0
	wqVaJUx/rW9BSbGKXKHONqa7wc8qH9V50OlNx6YNYRUY/xUpegYpOdTDvSvMjpdypd7ALe3Ymhv
	tVgHJZf4Y3IaWuo4iwtb1KUOtFPogUwI7DQCQYqaOHqstEgv5GWJy1MEQnGD4AnJr6xNYVvwS7F
	igzQxjOc5bg1afCQp/Jt2CYyv0GwUyrujDbS8v4XVzd3HCehURkNwlyBBev75T06n/ylwxKtQoP
	mSMbrogHWgGozu92DcqkaGXRp/Jdca7dyfKONNLTkDsltcl5C2he7hbBuovyQT3IkYbygZO1owH
	mESTO/Q/7g00Z/J6qDPMPyPNBVdmwCG/9IMmNhK4X002gX6+9L1H6Om6FpknjUllmzuLEmPCZ/F
	YVJXzWNF4KSUykHpIr6L/GSVVI+1d5evLmcS1BkbCZgZ0bPYx+Nrvw1G9L4JA74So//qBUrMUbm
	pwOZLACwQaSWEI7
X-Received: by 2002:a05:600c:1c25:b0:492:488c:f627 with SMTP id 5b1f17b1804b1-4925b359bc7mr78530865e9.11.1782253623529;
        Tue, 23 Jun 2026 15:27:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 11/41] python3: Fix CVE-2025-13462
Date: Wed, 24 Jun 2026 00:26:10 +0200
Message-ID: <0b990a354ef858d903d4bed937b1233537c2c478.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239433

From: Sudhir Dumbhare <sudumbha@cisco.com>

Apply the upstream v3.12 fix [1], aligned with the original v3.13 fix [2],
to address incorrect tarfile handling where GNU long name follow-up headers
could be normalized as directories, as referenced in [3].

[1] https://github.com/python/cpython/commit/d10950739a78f54d0718d88fb5a868374603c084
[2] https://github.com/python/cpython/commit/ae99fe3a33b43e303a05f012815cef60b611a9c7
[3] https://security-tracker.debian.org/tracker/CVE-2025-13462

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-13462

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2025-13462.patch       | 142 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13462.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13462.patch b/meta/recipes-devtools/python/python3/CVE-2025-13462.patch
new file mode 100644
index 00000000000..36d492338ba
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-13462.patch
@@ -0,0 +1,142 @@
+From 14d7d2e8f51a17c23c98f13f33743253a0b7a18a Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 18 May 2026 19:43:51 +0200
+Subject: [PATCH] [3.12] gh-141707: Skip TarInfo DIRTYPE normalization during
+ GNU long name handling (#145817)
+
+gh-141707: Skip TarInfo DIRTYPE normalization during GNU long name handling
+
+CVE: CVE-2025-13462
+Upstream-Status: Backport [https://github.com/python/cpython/commit/d10950739a78f54d0718d88fb5a868374603c084]
+
+Backport Changes:
+- This file is not present in the current version and is therefore omitted
+  Misc/NEWS.d/next/Library/2025-11-18-06-35-53.gh-issue-141707.DBmQIy.rst
+
+(cherry picked from commit 42d754e34c06e57ad6b8e7f92f32af679912d8ab)
+
+Co-authored-by: Seth Michael Larson <seth@python.org>
+Co-authored-by: Eashwar Ranganathan <eashwar@eashwar.com>
+(cherry picked from commit d10950739a78f54d0718d88fb5a868374603c084)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ Lib/tarfile.py           | 29 +++++++++++++++++++++++++----
+ Lib/test/test_tarfile.py | 19 +++++++++++++++++++
+ Misc/ACKS                |  1 +
+ 3 files changed, 45 insertions(+), 4 deletions(-)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 99451aa765..70fdbe85b0 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1246,6 +1246,20 @@ class TarInfo(object):
+     @classmethod
+     def frombuf(cls, buf, encoding, errors):
+         """Construct a TarInfo object from a 512 byte bytes object.
++
++        To support the old v7 tar format AREGTYPE headers are
++        transformed to DIRTYPE headers if their name ends in '/'.
++        """
++        return cls._frombuf(buf, encoding, errors)
++
++    @classmethod
++    def _frombuf(cls, buf, encoding, errors, *, dircheck=True):
++        """Construct a TarInfo object from a 512 byte bytes object.
++
++        If ``dircheck`` is set to ``True`` then ``AREGTYPE`` headers will
++        be normalized to ``DIRTYPE`` if the name ends in a trailing slash.
++        ``dircheck`` must be set to ``False`` if this function is called
++        on a follow-up header such as ``GNUTYPE_LONGNAME``.
+         """
+         if len(buf) == 0:
+             raise EmptyHeaderError("empty header")
+@@ -1276,7 +1290,7 @@ class TarInfo(object):
+ 
+         # Old V7 tar format represents a directory as a regular
+         # file with a trailing slash.
+-        if obj.type == AREGTYPE and obj.name.endswith("/"):
++        if dircheck and obj.type == AREGTYPE and obj.name.endswith("/"):
+             obj.type = DIRTYPE
+ 
+         # The old GNU sparse format occupies some of the unused
+@@ -1311,8 +1325,15 @@ class TarInfo(object):
+         """Return the next TarInfo object from TarFile object
+            tarfile.
+         """
++        return cls._fromtarfile(tarfile)
++
++    @classmethod
++    def _fromtarfile(cls, tarfile, *, dircheck=True):
++        """
++        See dircheck documentation in _frombuf().
++        """
+         buf = tarfile.fileobj.read(BLOCKSIZE)
+-        obj = cls.frombuf(buf, tarfile.encoding, tarfile.errors)
++        obj = cls._frombuf(buf, tarfile.encoding, tarfile.errors, dircheck=dircheck)
+         obj.offset = tarfile.fileobj.tell() - BLOCKSIZE
+         return obj._proc_member(tarfile)
+ 
+@@ -1370,7 +1391,7 @@ class TarInfo(object):
+ 
+         # Fetch the next header and process it.
+         try:
+-            next = self.fromtarfile(tarfile)
++            next = self._fromtarfile(tarfile, dircheck=False)
+         except HeaderError as e:
+             raise SubsequentHeaderError(str(e)) from None
+ 
+@@ -1505,7 +1526,7 @@ class TarInfo(object):
+ 
+         # Fetch the next header.
+         try:
+-            next = self.fromtarfile(tarfile)
++            next = self._fromtarfile(tarfile, dircheck=False)
+         except HeaderError as e:
+             raise SubsequentHeaderError(str(e)) from None
+ 
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 759fa03ead..82637841ed 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -1134,6 +1134,25 @@ class LongnameTest:
+                 self.assertIsNotNone(tar.getmember(longdir))
+                 self.assertIsNotNone(tar.getmember(longdir.removesuffix('/')))
+ 
++    def test_longname_file_not_directory(self):
++        # Test reading a longname file and ensure it is not handled as a directory
++        # Issue #141707
++        buf = io.BytesIO()
++        with tarfile.open(mode='w', fileobj=buf, format=self.format) as tar:
++            ti = tarfile.TarInfo()
++            ti.type = tarfile.AREGTYPE
++            ti.name = ('a' * 99) + '/' + ('b' * 3)
++            tar.addfile(ti)
++
++            expected = {t.name: t.type for t in tar.getmembers()}
++
++        buf.seek(0)
++        with tarfile.open(mode='r', fileobj=buf) as tar:
++            actual = {t.name: t.type for t in tar.getmembers()}
++
++        self.assertEqual(expected, actual)
++
++
+ class GNUReadTest(LongnameTest, ReadTest, unittest.TestCase):
+ 
+     subdir = "gnu"
+diff --git a/Misc/ACKS b/Misc/ACKS
+index a6e63a991f..30d5f99ebb 100644
+--- a/Misc/ACKS
++++ b/Misc/ACKS
+@@ -1492,6 +1492,7 @@ Dhushyanth Ramasamy
+ Ashwin Ramaswami
+ Jeff Ramnani
+ Bayard Randel
++Eashwar Ranganathan
+ Varpu Rantala
+ Brodie Rao
+ Rémi Rampin
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index be080c6a362..3e28a3942bd 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -42,6 +42,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-4519_CVE-2026-4786.patch \
            file://CVE-2026-6019_p1.patch \
            file://CVE-2026-6019_p2.patch \
+           file://CVE-2025-13462.patch \
            "
 
 SRC_URI:append:class-native = " \

