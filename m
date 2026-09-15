Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CE6C88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 09:40:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19379.1789465256539490252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 02:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Zm++cdtp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34C38169C
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:40:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C7763F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789465255; bh=neaBkDK1KtO+EhRXcaHShtLuXVEtpLp2jNDue0HZDlg=;
	h=From:To:Subject:Date:From;
	b=Zm++cdtpfLGVDgmvfJxT4Ye2FHYY7xW1lP7aZtU5Fz516JEv04G+ExpQXzSJHS3ZJ
	 JSKeAAK2b0s0Zq2jCPO3VPOBOEpmY+NKYBpN61M7oDy5P+uDZbUVGLoUCI5/H752Di
	 +B23uXqz/zhXD2n4s+HfE3dXq9sUbI0eg1IN1A70=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] python3-rfc3339-validator: remove usage of six
Date: Tue, 15 Sep 2026 10:40:49 +0100
Message-ID: <20260915094051.2553033-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245828

Six is only needed to support Python 2 and 3 in a single script, but
Py2 was EOL six years ago now.  Patch out the need for six, and drop it
as a dependency.

Also remove a redundant FILESEXTRAPATHS from when there were python- and
python3- versions of the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Remove-usage-of-six.patch            | 62 +++++++++++++++++++
 .../python/python3-rfc3339-validator_0.1.4.bb |  3 +-
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-rfc3339-validato=
r/0001-Remove-usage-of-six.patch

diff --git a/meta/recipes-devtools/python/python3-rfc3339-validator/0001-=
Remove-usage-of-six.patch b/meta/recipes-devtools/python/python3-rfc3339-=
validator/0001-Remove-usage-of-six.patch
new file mode 100644
index 00000000000..ad34b21edb1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-rfc3339-validator/0001-Remove-=
usage-of-six.patch
@@ -0,0 +1,62 @@
+From 9e74298b018d61f93768061800fa670de8e34dfe Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 14 Sep 2026 22:27:29 +0100
+Subject: [PATCH] Remove usage of six
+
+The last release of Python 2 was 2.7.18, released in April 2020. Python
+was officially end-of-life in 2020.  I think it's time to stop catering
+for people using Python 2, so drop the usage of six.
+
+Closes #11.
+
+Upstream-Status: Submitted [https://github.com/naimetti/rfc3339-validato=
r/pull/14]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ rfc3339_validator.py            | 7 +------
+ setup.py                        | 4 +---
+ tests/test_rfc3339_validator.py | 9 +--------
+ 3 files changed, 3 insertions(+), 17 deletions(-)
+
+diff --git a/rfc3339_validator.py b/rfc3339_validator.py
+index 4be5e87..efc9b7d 100644
+--- a/rfc3339_validator.py
++++ b/rfc3339_validator.py
+@@ -6,11 +6,6 @@ __version__ =3D '0.1.4'
+=20
+ import re
+ import calendar
+-import six
+-
+-RFC3339_REGEX_FLAGS =3D 0
+-if six.PY3:
+-    RFC3339_REGEX_FLAGS |=3D re.ASCII
+=20
+ RFC3339_REGEX =3D re.compile(r"""
+     ^
+@@ -30,7 +25,7 @@ RFC3339_REGEX =3D re.compile(r"""
+        | [+-](?:[01]\d|2[0123]):[0-5]\d # Offset
+     )
+     $
+-""", re.VERBOSE | RFC3339_REGEX_FLAGS)
++""", re.VERBOSE | re.ASCII)
+=20
+=20
+ def validate_rfc3339(date_string):
+diff --git a/setup.py b/setup.py
+index 73186bd..b9936b0 100644
+--- a/setup.py
++++ b/setup.py
+@@ -8,9 +8,7 @@ from setuptools import setup, find_packages
+ with open('README.md') as readme_file:
+     readme =3D readme_file.read()
+=20
+-requirements =3D [
+-    'six',
+-]
++requirements =3D []
+=20
+ setup_requirements =3D []
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4=
.bb b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
index 242176dd757..06eb833f7a9 100644
--- a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
+++ b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/naimetti/rfc3339-validat=
or"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da21b13b5a996f08f7e0b088aa38ce=
9c6"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/python-rfc3339-validator:"
+SRC_URI +=3D "file://0001-Remove-usage-of-six.patch"
=20
 SRC_URI[sha256sum] =3D "138a2abdf93304ad60530167e51d2dfb9549521a836871b8=
8d7f4695d0022f6b"
=20
@@ -14,7 +14,6 @@ inherit pypi setuptools3
 RDEPENDS:${PN} +=3D "\
     python3-core \
     python3-datetime \
-    python3-six \
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


