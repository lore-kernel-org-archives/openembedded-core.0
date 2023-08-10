Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BE0C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:25:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21889.1691684697800957576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECC46D75;
	Thu, 10 Aug 2023 09:25:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00EFB3F6C4;
	Thu, 10 Aug 2023 09:24:56 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/9] meson: add back warning when default value for external properties are used
Date: Thu, 10 Aug 2023 17:24:47 +0100
Message-Id: <20230810162451.1766532-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810162451.1766532-1-ross.burton@arm.com>
References: <20230810162451.1766532-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185806

From: Ross Burton <ross.burton@arm.com>

This is adding back a warning that was removed in the upgrade to Meson
0.58 (cb2a7dcc) as source evolution meant the patch didn't apply.

Meson scripts which want to identify runtime behaviour often use
external properties (meson.get_external_property(), set via the cross
and native files) to define default behaviour if they can't run code at
configure time.

These defaults may or may not be correct, so emit a warning that this is
happening. The recipe should then provide a cross file fragment which
sets the value appropriately.

In the long term I hope to be able to remove this patch as Meson evolves
cc.run() to support fallback values directly, and Meson will log the use
of defaults itself.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../meson/meson/default.patch                 | 24 +++++++++++++++++++
 meta/recipes-devtools/meson/meson_1.1.1.bb    |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/default.patch

diff --git a/meta/recipes-devtools/meson/meson/default.patch b/meta/recip=
es-devtools/meson/meson/default.patch
new file mode 100644
index 00000000000..60adfc8cf4d
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/default.patch
@@ -0,0 +1,24 @@
+Emit a warning if a cross property is used (via meson.get_external_prope=
rty())
+without an explicit value being set.
+
+All default values should be validated to be sure that they're correct, =
so if we
+emit a warning in Meson then meson.bbclass can catch and expose it.
+
+This is inappropriate as upstream are thinking about improving how cc.ru=
n()
+handles the cross case.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/mesonbuild/interpreter/mesonmain.py b/mesonbuild/interprete=
r/mesonmain.py
+index 01d0029a7..936b03fbf 100644
+--- a/mesonbuild/interpreter/mesonmain.py
++++ b/mesonbuild/interpreter/mesonmain.py
+@@ -416,6 +416,7 @@ class MesonMain(MesonInterpreterObject):
+             return self.interpreter.environment.properties[machine][pro=
pname]
+         except KeyError:
+             if fallback is not None:
++                mlog.warning(f"Cross property {propname} is using defau=
lt value {fallback}")
+                 return fallback
+             raise InterpreterException(f'Unknown property for {machine.=
get_lower_case_name()} machine: {propname}')
+=20
diff --git a/meta/recipes-devtools/meson/meson_1.1.1.bb b/meta/recipes-de=
vtools/meson/meson_1.1.1.bb
index 500e13775f4..d017d2dccd9 100644
--- a/meta/recipes-devtools/meson/meson_1.1.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.1.1.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0001-python-module-do-not-manipulate-the-environment-w=
hen.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
+           file://default.patch \
            "
 SRC_URI[sha256sum] =3D "d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca=
35fadb5400727b1c"
=20
--=20
2.34.1


