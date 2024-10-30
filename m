Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753CDD7496D
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 05:23:00 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.7929.1730265776422658787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 22:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id EF2C9E6A
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 06:22:34 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.244]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t61A8-4KSxPd0; Wed, 30 Oct 2024 06:22:33 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] u-boot: Add patch to use SWIG_AppendOutput
Date: Wed, 30 Oct 2024 06:24:38 +0100
Message-ID: <20241030052443.855752-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1730265753-2BFFD5C8-E676A419/0/0 CLEAN NORMAL
X-TOI-MSGID: f467a4ed-9b14-41d4-ae55-31c8fa521230
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 05:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206545

Swig has changed language specific AppendOutput functions. The helper
macro SWIG_AppendOutput remains unchanged. Use that instead
of SWIG_Python_AppendOutput, which would require an extra parameter
since swig 4.3.0.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...bfdt-libfdt.i_shipped-Use-SWIG_Appen.patch | 60 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibf=
dt-libfdt.i_shipped-Use-SWIG_Appen.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libf=
dt.i_shipped-Use-SWIG_Appen.patch b/meta/recipes-bsp/u-boot/files/0001-sc=
ripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch
new file mode 100644
index 0000000000..9cd2cee902
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libfdt.i_sh=
ipped-Use-SWIG_Appen.patch
@@ -0,0 +1,60 @@
+From e093607e9a08e9c29b7bbaa6aeb137036db798a6 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 30 Oct 2024 05:46:00 +0100
+Subject: [PATCH] scripts/dtc/pylibfdt/libfdt.i_shipped: Use SWIG_AppendO=
utput
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Swig has changed language specific AppendOutput functions. The helper
+macro SWIG_AppendOutput remains unchanged. Use that instead
+of SWIG_Python_AppendOutput, which would require an extra parameter
+since swig 4.3.0.
+
+/home/flk/poky/build-test/tmp/work/qemux86_64-poky-linux/u-boot/2024.10/=
git/arch/x86/cpu/u-boot-64.lds
+| scripts/dtc/pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_nex=
t_node=E2=80=99:
+| scripts/dtc/pylibfdt/libfdt_wrap.c:5581:17: error: too few arguments t=
o function =E2=80=98SWIG_Python_AppendOutput=E2=80=99
+|  5581 |     resultobj =3D SWIG_Python_AppendOutput(resultobj, val);
+|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfd=
t/libfdt.i_shipped
+index 56cc5d48f4..e4659489a9 100644
+--- a/scripts/dtc/pylibfdt/libfdt.i_shipped
++++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
+@@ -1037,7 +1037,7 @@ typedef uint32_t fdt32_t;
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff =3D PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+-		resultobj =3D SWIG_Python_AppendOutput(resultobj, buff);
++		resultobj =3D SWIG_AppendOutput(resultobj, buff);
+ 	}
+ }
+=20
+@@ -1076,7 +1076,7 @@ typedef uint32_t fdt32_t;
+=20
+ %typemap(argout) int *depth {
+         PyObject *val =3D Py_BuildValue("i", *arg$argnum);
+-        resultobj =3D SWIG_Python_AppendOutput(resultobj, val);
++        resultobj =3D SWIG_AppendOutput(resultobj, val);
+ }
+=20
+ %apply int *depth { int *depth };
+@@ -1092,7 +1092,7 @@ typedef uint32_t fdt32_t;
+            if (PyTuple_GET_SIZE(resultobj) =3D=3D 0)
+               resultobj =3D val;
+            else
+-              resultobj =3D SWIG_Python_AppendOutput(resultobj, val);
++              resultobj =3D SWIG_AppendOutput(resultobj, val);
+         }
+ }
+=20
+--=20
+2.47.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
index 113f215cf6..fe3afb33b5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -15,6 +15,7 @@ PE =3D "1"
 SRCREV =3D "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
=20
 SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster"
+SRC_URI +=3D "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG=
_Appen.patch"
=20
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
--=20
2.47.0


