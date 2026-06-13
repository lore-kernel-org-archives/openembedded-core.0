Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27489CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:13:22 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88537.1781345595590297340
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y4Ph2jtG;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6629; q=dns/txt;
  s=iport01; t=1781345595; x=1782555195;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=W3qADNf/iZ8KkULOkkqNj4E6GWU/EFfnOuhSiCxU6e8=;
  b=Y4Ph2jtG+SnCBRJnYfkguxbH0rYBEd3Ng7yO5ZmjzzbiYks5oH1VBhPM
   PI+DXu7gNjPN1UojVv2RAvBKUv8pu55jvJnSaHD7+TS2DMYhvG3zNjE4s
   FOXnOOIdr0HfSIf5bBOlXgMqGfh33/sNBfNtbyEHyfHE+0meHMMRzYxNC
   3ae1SVmWIQj60LGFo5ftJGkUzowyCTAdEJti8aulkTuzgoQSJleCizleF
   AvSA3j9io/PkyL6bEmVwDCLKhV7No2GJQFluPpi/MWAg2UgyHgdWCzyuI
   ijdYI4Rw9UYmIcwTiLZNN8vpwndkwhAG92YIALmyQzpDSAaQCyN4B5Ucc
   g==;
X-CSE-ConnectionGUID: 9s2i/J2GSGObCTjcvKL5Bg==
X-CSE-MsgGUID: umcE4WtUSra94u1DJTPj3g==
X-IPAS-Result: =?us-ascii?q?A0AEAwBaKy1q/5T/Ja1aHgEBCxIMggULgld0X0JJA4RUj?=
 =?us-ascii?q?1OCIQOeG4F+DwEBAQ9EDQQBAYRARgKNQwImNgcOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMPARgBPRwDAQIDAiYCAisjCBkJE?=
 =?us-ascii?q?YJoAYJzAgERs156gTKBAYMoAT8CQ1DbLAELFAGBCi6FP4McAYUCWxgBRIQ4J?=
 =?us-ascii?q?xsbgXKBFYNpgQWBXAEBhTuCagSCIoEMgV0ejx1IgQIcA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+FzRYGwcFgUqBK2qBBIUNIx8DOX+Bc4EoZ2cVMDWBAhEfC?=
 =?us-ascii?q?hwDCxgNSBEsNxQbBD0BbgeMXRcPgUxyPTcaAQcjASBfEgc1XxENkxiQH4Iho?=
 =?us-ascii?q?Q8KKIN1jCGVOhozhASBV5JAklELmH2OCokPjFhphGiBbwYvgUcLB3AVgyIJS?=
 =?us-ascii?q?hkPjioOC4NggX+CUUNRwSokNQIJAy8BAQcCBwEMAQMLgWiRfQEB?=
IronPort-Data: A9a23:nuyYfa7oVaNUyRjLUMwl/gxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mJMXWiEafuNa2ryKNskYYS38xwF7cPXyoVkQVQ+/C8yZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNsPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ebJZC+6FVW0512
 tsSAwwPZQ6go7+cz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEfUrsUIMpWcOOAnWTzbjhSqFu9rqss6G+Vxwt0uFToGIaFJ4DRFZ0NxC50o
 Erb+m/UXi4GCeeFwGvZ7yuApNP3n3j0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:DfR5P6EECrj3+6XNpLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3ADeua3Wobz6oU2HuG6FWo6I3mUZE+KHya7i3/GGC?=
 =?us-ascii?q?fA01VSraLanvN0qwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A/oFzkg8LIQoQHhKzo7+MD7qQf9pt6InyN1wwqo8?=
 =?us-ascii?q?P6pWZbABSBw+f1zviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,202,1774310400"; 
   d="scan'208";a="485438002"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jun 2026 10:13:14 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 729A2180002CA
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:13:14 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 20A95CB6A93; Sat, 13 Jun 2026 03:13:14 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 4/4] python3: Fix CVE-2025-13462
Date: Sat, 13 Jun 2026 03:11:41 -0700
Message-Id: <20260613101137.3690080-4-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260613101137.3690080-1-sudumbha@cisco.com>
References: <20260613101137.3690080-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238670

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
---
 .../python/python3/CVE-2025-13462.patch       | 142 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13462.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13462.patch b/meta/recipes-devtools/python/python3/CVE-2025-13462.patch
new file mode 100644
index 0000000000..36d492338b
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
index da23093285..ed9c210bf6 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-4519_CVE-2026-4786.patch \
            file://CVE-2026-6019_p1.patch \
            file://CVE-2026-6019_p2.patch \
+           file://CVE-2025-13462.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.35.6


