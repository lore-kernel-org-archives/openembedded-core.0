Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B11CDD1BF
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:39:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.72024.1727451545792872521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 08:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C0514BF
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 08:39:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6CB83F587
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 08:39:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-libarchive-c: fix tests with libarchive 3.7.5 onwards
Date: Fri, 27 Sep 2024 16:39:01 +0100
Message-Id: <20240927153901.1120082-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 15:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205029

Backport a patch from an upstream PR to disable a test that correctly
causes errors in libarchive 3.7.5 onwards.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-libarchive-c/new-libarchive.patch | 41 +++++++++++++++++++
 .../python/python3-libarchive-c_5.1.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-libarchive-c/new=
-libarchive.patch

diff --git a/meta/recipes-devtools/python/python3-libarchive-c/new-libarc=
hive.patch b/meta/recipes-devtools/python/python3-libarchive-c/new-libarc=
hive.patch
new file mode 100644
index 00000000000..681e03a465b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-libarchive-c/new-libarchive.pa=
tch
@@ -0,0 +1,41 @@
+From adb206946721a4f5bd1190ab9c975bab4373e35c Mon Sep 17 00:00:00 2001
+From: Changaco <changaco@changaco.oy.lc>
+Date: Fri, 27 Sep 2024 11:51:22 +0200
+Subject: [PATCH] update a test failing with new libarchive versions
+
+fixes #130
+
+Upstream-Status: Submitted [https://github.com/Changaco/python-libarchiv=
e-c/pull/131]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/test_entry.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_entry.py b/tests/test_entry.py
+index 419cecb..34543a5 100644
+--- a/tests/test_entry.py
++++ b/tests/test_entry.py
+@@ -9,7 +9,7 @@
+=20
+ import pytest
+=20
+-from libarchive import memory_reader, memory_writer
++from libarchive import ArchiveError, memory_reader, memory_writer
+ from libarchive.entry import ArchiveEntry, ConsumedArchiveEntry, Passed=
ArchiveEntry
+=20
+ from . import data_dir, get_entries, get_tarinfos
+@@ -64,7 +64,13 @@ def test_check_ArchiveEntry_against_TarInfo():
+=20
+=20
+ def test_check_archiveentry_using_python_testtar():
+-    check_entries(join(data_dir, 'testtar.tar'))
++    # This test behaves differently depending on the libarchive version=
:
++    # 3.5, 3.6 and presumably all future versions reject the archive as=
 damaged,
++    # whereas older versions accepted it.
++    try:
++        check_entries(join(data_dir, 'testtar.tar'))
++    except ArchiveError as e:
++        assert e.msg =3D=3D "Damaged tar archive"
+=20
+=20
+ def test_check_archiveentry_with_unicode_and_binary_entries_tar():
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/m=
eta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index c8aff3defe6..3116c6b62ec 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -6,6 +6,7 @@ LICENSE =3D "CC0-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbcab380227a83bc147350b40a8=
1e6ffc"
=20
 SRC_URI +=3D " \
+        file://new-libarchive.patch \
         file://run-ptest \
 "
=20
--=20
2.34.1


