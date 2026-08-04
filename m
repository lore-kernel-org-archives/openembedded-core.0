Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E936DC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 22:05:08 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27922.1785881104079077534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 15:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=NuNtX3xO;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alhe-dev-ub.waqitnwczulubdoacjva2kqlvd.phxx.internal.cloudapp.net (unknown [134.33.52.9])
	by linux.microsoft.com (Postfix) with ESMTPSA id CEA6E20B716B
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 15:04:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CEA6E20B716B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1785881082;
	bh=r6KKlHtyA/j2YKlYCUTpPC8HUdJ9Wie8QQxWeDWkr3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NuNtX3xOv2Teo6qP9te/1W0/JxjdJRbgW2SsTnwdPE7mk3jYEIBRAcXDmCC5QU2Vc
	 g7khft+e/cYNMNfK4smsR9NxThvP5Lz9nPaAP7YzF6uEN7lYzpERgOLzaLt2TUoxAn
	 FWv8gFdEnv2jmabQLGiZmWWIxjA+oOKlF3ZzrR6I=
From: Alejandro Hernandez <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python_pep517.bbclass: always export _PYTHON_HOST_PLATFORM for wheel tag
Date: Tue,  4 Aug 2026 22:04:55 +0000
Message-ID: <20260804220456.2342710-3-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804220456.2342710-1-alhe@linux.microsoft.com>
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 22:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242806

python distutils/sysconfig.get_platform() falls back to
distutils.util.get_platform() when the _PYTHON_HOST_PLATFORM
environment variable is unset, and returns the *build host* arch.
The result is baked into the produced wheel's filename
(pkg-<ver>-cp3XX-cp3XX-<PLAT>.whl) and its <pkg>.dist-info/WHEEL
metadata.

Without this export, extension-module wheels tag themselves with
whichever arch the autobuilder worker happens to have, which makes
the resulting rpm non-reproducible across mixed-arch autobuilder
pools.

Since python 3.14 + wheel >=3D0.44 also rejects wheels with an empty
platform tag ("Bad wheel filename"), the value has to be non-empty
in every class scope. HOST_ARCH is class-scoped by bitbake
(target/native/cross/nativesdk), so `linux-${HOST_ARCH}` covers
every case with a single unconditional assignment. Setting per-class
overrides to "" (as an earlier draft did) trips the wheel filename
check and must be avoided.

Pure-python wheels ignore _PYTHON_HOST_PLATFORM and remain tagged
"any", so this change only affects wheels that ship compiled
extensions (cffi, cryptography, numpy, bcrypt, markupsafe, psutil,
rpds-py, websockets, ...).

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
---
 meta/classes-recipe/python_pep517.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
index d6246af5c2..06b23d3cba 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -30,6 +30,22 @@ PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
 # pypa/installer option to control the bytecode compilation
 INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
=20
+# Force the wheel's platform tag to reflect the target machine rather th=
an the
+# build host. Without this, extension-module wheels bake the build host'=
s arch
+# (e.g. linux_x86_64) into <pkg>.dist-info/WHEEL via distutils/sysconfig=
's
+# get_platform(), which breaks reproducibility across autobuilder worker=
s of
+# different architectures. Pure-python wheels ignore this variable and r=
emain
+# tagged "any".
+#
+# HOST_ARCH is class-scoped by bitbake:
+#   - target:     HOST_ARCH =3D=3D TARGET_ARCH (reproducible across work=
ers)
+#   - native:     HOST_ARCH =3D=3D BUILD_ARCH  (matches worker arch, unp=
ackaged)
+#   - cross:      HOST_ARCH =3D=3D BUILD_ARCH
+#   - nativesdk:  HOST_ARCH =3D=3D SDK_ARCH
+# so a single expression covers every class without producing an empty t=
ag
+# (which python 3.14 + wheel >=3D0.44 rejects with "Bad wheel filename")=
.
+export _PYTHON_HOST_PLATFORM =3D "linux-${HOST_ARCH}"
+
 # PEP517 doesn't have a specific configure step, so set an empty do_conf=
igure to avoid
 # running base_do_configure.
 python_pep517_do_configure () {
--=20
2.43.0


