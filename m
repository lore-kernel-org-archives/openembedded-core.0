Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA474CDE005
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20836.1782220475683681476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oV3Zus6v;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490a76757e5so35503615e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220474; x=1782825274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3AV1TB8FYe9eINH+XA5/rWkSGE0mC2exO7JfYy/+n0=;
        b=oV3Zus6vLd/uXl/gwNXY3HQlsMwEw/u1Do5qfPoIfa1cb5UGg+wjWPChStiAs8DvNt
         +5Pbd7STXmuSAH0L3vp2k2lFJiO5EJxe2ZNm72T7AYPQKfKJlOSkQj7I+7p7n+EmTLVw
         F/AZ2t1anEjJl5zfN7vbJF4xvWWw038nSUotI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220474; x=1782825274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3AV1TB8FYe9eINH+XA5/rWkSGE0mC2exO7JfYy/+n0=;
        b=CUMKjjXUKC4IVLd06/7C7KS0EtxzFxtlaThhAJM3v2LczZV7q4UrzPe3+0dq0NZ4qX
         L5j1w6+vtb0uVdkH7YrtmVyuX82IhuW41Tofi2UT6WTdCSB7ZDQApJZ5F3Py2kAuyNND
         /GEiStC26nZ4JHJmcqHg+9cDDjY8PRglxx/i4RJCz9Xc+kafE368LyBDp0YrygPjCdGh
         TK0mZKJX7KHEgEEfKk5xRi7eJSR3Flrn/nyraD5ihLZx9EcRNAK4SY8vShMT8YkSiraN
         L0xYZSyIbuYOB3FqIGzOHDZIYlg5G0HTN3YTu0ESByt74SxlvjhWBZUruyKzv5PIqd8t
         IAug==
X-Gm-Message-State: AOJu0YwNnpS6Mgq2RWSuBPsXrP6dWmPCQWun2xK5L4YjAW7W61VukRP6
	L4lm1J31dvRpqvJjrxpjv0XXl1FjIDiYIBxI7p/EuLjm8+zZe88L/z4lGfhdH5C2zdWayUKGoLL
	yeT4q
X-Gm-Gg: AfdE7cm9Sy0+ri+Rlk2T6tsVR/OJZbiSIzG/IPFW9DIhkpPTUrnBJQKlyaHgokN76pr
	wpXXGEqciPcYwdgbg9x1drxruuofksmKz4Jhlh/t1qdvX2HRDg3fHoV5mOjj+ickTvLye/mGHu2
	J1d5wGUGSCHV210OQsoXjs3XgiGx0kqBModLEPhs5/ieICOJyOvNEIqB5Xwq4h66mtCtVQgR7MD
	+5Eefr9/FVRrnXyWmHtSRFe9Z0CSr1wBFeu1YyY7cJCBdT7OEujcOXjqKBXR0QG1AgWLLYMkNrP
	QHe6c+e4I+uucaVjCluogjA9Y4r26HzsRJCzcebv0GltwNetvaifm+ttaJPgZR1fB96Bm8cf/OS
	OSVbSlzcipaRN8mpT0VlUIKvtDHrsfNbSumQHksKrXFDH3ksE3kiPHme4i1pU+gdX1re/0CPy+3
	PvzyoW+Xr9mw4GPaEDGAbAuz15Hp7r1jTKm+CDCgdOo+4LdzuCS8HZ+Z3ouKWjlunvzwYcf3c4a
	U+rj9wmXeiactOJeQ==
X-Received: by 2002:a05:600c:818e:b0:492:4d56:d5fe with SMTP id 5b1f17b1804b1-4925b39249dmr40881995e9.14.1782220473798;
        Tue, 23 Jun 2026 06:14:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/26] python3: Fix CVE-2025-13462
Date: Tue, 23 Jun 2026 15:13:52 +0200
Message-ID: <0b990a354ef858d903d4bed937b1233537c2c478.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239377

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

