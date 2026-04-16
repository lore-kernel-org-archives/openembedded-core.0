Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F41F8A15B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 10:31:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10753.1776335471456881911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 03:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=q15Tkn4+;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1162425E2
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 03:31:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55B113F7D8
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 03:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776335471; bh=mvcXKFqIIpgGzu0pkh4XBBAmEmR+0K/EO2TvYRRSwFo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q15Tkn4+fDeF3r9ZLegFE7SpENbOlflP67OK3XjUxLlJDu5G8SZYZc5zzk7rd1B9U
	 7QtwKC3QoWMzLTsrWWuQfey6Yl3ir1nR2E9csrpYk0RljS9G/PX6DZHA3izxWMl2av
	 z3WhMrDhXE/I+vRN8ZvlHQyBD4UExHzqzlEFDUoU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/4] python3-requests: backport fix for CVE-2026-25645
Date: Thu, 16 Apr 2026 11:31:00 +0100
Message-ID: <20260416103100.3152304-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416103100.3152304-1-ross.burton@arm.com>
References: <20260416103100.3152304-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 10:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235396

When unpacking zip files requests uses predictable paths. Backport a fix
to use randomly generated pathnames to mitigate injection attacks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-requests/CVE-2026-25645.patch     | 46 +++++++++++++++++++
 .../python/python3-requests_2.32.5.bb         |  7 ++-
 2 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-202=
6-25645.patch

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2026-25645=
.patch b/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.pat=
ch
new file mode 100644
index 00000000000..3bebba65726
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
@@ -0,0 +1,46 @@
+From 66d21cb07bd6255b1280291c4fafb71803cdb3b7 Mon Sep 17 00:00:00 2001
+From: Nate Prewitt <nate.prewitt@gmail.com>
+Date: Wed, 25 Mar 2026 08:57:56 -0600
+Subject: [PATCH] Merge commit from fork
+
+Prior to version 2.33.0, the `requests.utils.extract_zipped_paths()` uti=
lity function
+uses a predictable filename when extracting files from zip archives into=
 the system
+temporary directory. If the target file already exists, it is reused wit=
hout validation.
+A local attacker with write access to the temp directory could pre-creat=
e a malicious
+file that would be loaded in place of the legitimate one. Standard usage=
 of the Requests
+library is not affected by this vulnerability. Only applications that ca=
ll
+`extract_zipped_paths()` directly are impacted. Starting in version 2.33=
.0, the library
+extracts files to a non-deterministic location. If developers are unable=
 to upgrade,
+they can set `TMPDIR` in their environment to a directory with restricte=
d write access.
+
+CVE: CVE-2026-25645
+Upstream-Status: Backport [https://github.com/psf/requests/commit/66d21c=
b07bd6255b1280291c4fafb71803cdb3b7]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/requests/utils.py | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/requests/utils.py b/src/requests/utils.py
+index d8803e6e91..54959bb8ab 100644
+--- a/src/requests/utils.py
++++ b/src/requests/utils.py
+@@ -282,12 +282,13 @@ def extract_zipped_paths(path):
+         return path
+=20
+     # we have a valid zip archive and a valid member of that archive
+-    tmp =3D tempfile.gettempdir()
+-    extracted_path =3D os.path.join(tmp, member.split("/")[-1])
+-    if not os.path.exists(extracted_path):
+-        # use read + write to avoid the creating nested folders, we onl=
y want the file, avoids mkdir racing condition
+-        with atomic_open(extracted_path) as file_handler:
+-            file_handler.write(zip_file.read(member))
++    suffix =3D os.path.splitext(member.split("/")[-1])[-1]
++    fd, extracted_path =3D tempfile.mkstemp(suffix=3Dsuffix)
++    try:
++        os.write(fd, zip_file.read(member))
++    finally:
++        os.close(fd)
++
+     return extracted_path
+=20
+=20
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/me=
ta/recipes-devtools/python/python3-requests_2.32.5.bb
index 43b63e32b1f..0eb9765b633 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -3,13 +3,12 @@ HOMEPAGE =3D "https://requests.readthedocs.io"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d1=
658"
=20
-SRC_URI:append:class-nativesdk =3D " \
-           file://environment.d-python3-requests.sh \
-"
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a889=
3c3af500cec7d7cf"
=20
-inherit pypi python_setuptools_build_meta
+SRC_URI +=3D "file://CVE-2026-25645.patch"
+SRC_URI:append:class-nativesdk =3D " file://environment.d-python3-reques=
ts.sh"
=20
 do_install:append:class-nativesdk() {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
--=20
2.43.0


