Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23078.1792675804884325437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 06:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=pYwVGdgJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A4002C34
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 06:30:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E38543F673
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792675804; bh=W5wnFOalw6u+nV++qC/zYlouLPMEBAFheatVoI2S+OU=;
	h=From:To:Subject:Date:From;
	b=pYwVGdgJFRIRcWH8OzO3RuiKVTHx3U3CdSTaX+AK5hwHyvtt9xgvclx2uqqa+KOcB
	 izOW/c13G+1zGFLKNRyTP0Z9tOtN7DNQtbjRFZ7A/Ad+hWV8nV3PsJpLmxaruiI/Pa
	 A0r+XGFsM+1XWgchD54nlV4b1vjVCJJglEoZX8MU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] piglit: fix build with Python 3.14.9
Date: Thu, 22 Oct 2026 14:30:00 +0100
Message-ID: <20261022133000.2070146-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 13:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248445
Content-Type: text/plain; charset="utf-8"

Python 3.14.9 added bounds checking to the mtime argument, so piglit
passing the mtime as a string causes runtime errors:

    File "/usr/lib/python3.14/gzip.py", line 303, in _write_gzip_header
        if not 0 <=3D mtime < 2**32:
    TypeError: '<=3D' not supported between instances of 'int' and 'str'

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-reproducible_mtime-should-be-an-int.patch | 33 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-serial=
izer-reproducible_mtime-should-be-an-int.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-serializer-re=
producible_mtime-should-be-an-int.patch b/meta/recipes-graphics/piglit/pi=
glit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
new file mode 100644
index 00000000000..4578c296b0d
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproduci=
ble_mtime-should-be-an-int.patch
@@ -0,0 +1,33 @@
+From 58a5bea55a5f7972462124e7a8f1b1971ad5483d Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 22 Oct 2026 14:09:08 +0100
+Subject: [PATCH] tests/serializer: reproducible_mtime should be an int
+X-ARM-No-Footer: NoDisclaimer
+
+The mtime argument is an integer not a string, so parse it with int().
+
+Passing a string breaks piglit with Python 3.14.9, which does integer
+bound checks on the specified mtime.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-=
/merge_requests/1269]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/serializer.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/serializer.py b/tests/serializer.py
+index 5ee9a1578..f7fdadf43 100644
+--- a/tests/serializer.py
++++ b/tests/serializer.py
+@@ -140,7 +140,7 @@ def serializer(name, profile, outfile):
+     tree =3D et.ElementTree(root)
+     reproducible_mtime =3D None
+     if 'SOURCE_DATE_EPOCH' in os.environ:
+-        reproducible_mtime=3Dos.environ['SOURCE_DATE_EPOCH']
++        reproducible_mtime=3Dint(os.environ['SOURCE_DATE_EPOCH'])
+     with gzip.GzipFile(outfile, 'wb', mtime=3Dreproducible_mtime) as f:
+         tree.write(f, encoding=3D'utf-8', xml_declaration=3DTrue)
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
index 8f02496b4fd..f25679b8290 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.g=
it;protocol=3Dhttps;branch=3Dma
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-=
pat.patch \
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path=
-fr.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command=
.patch \
+           file://0001-tests-serializer-reproducible_mtime-should-be-an-=
int.patch \
            "
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
--=20
2.43.0

