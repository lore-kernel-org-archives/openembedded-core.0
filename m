Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A87D339AA
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 17:34:12 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.58264.1730136848703518181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 10:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id A37DF6F69
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 18:34:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.239]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t5Tcx-2DfS5J0; Mon, 28 Oct 2024 18:34:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] python3-dtc: fix language specific AppendOutput functions with swig 4.3.0
Date: Mon, 28 Oct 2024 18:36:02 +0100
Message-ID: <20241028173602.1652935-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1730136844-E9FF95D9-C260E5D4/0/0 CLEAN NORMAL
X-TOI-MSGID: 9f8e0dcd-5de0-45f5-a9b1-9d9d39c5c36a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 17:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206453

Swig has changed language specific AppendOutput functions. The helper
macro SWIG_AppendOutput remains unchanged. Use that instead
of SWIG_Python_AppendOutput, which would require an extra parameter
since swig 4.3.0.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-libfdt.i-Use-SWIG_AppendOutput.patch | 51 +++++++++++++++++++
 .../python/python3-dtc_1.7.0.bb               |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-dtc/0001-libfdt.=
i-Use-SWIG_AppendOutput.patch

diff --git a/meta/recipes-devtools/python/python3-dtc/0001-libfdt.i-Use-S=
WIG_AppendOutput.patch b/meta/recipes-devtools/python/python3-dtc/0001-li=
bfdt.i-Use-SWIG_AppendOutput.patch
new file mode 100644
index 0000000000..c9c3a886f1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-dtc/0001-libfdt.i-Use-SWIG_App=
endOutput.patch
@@ -0,0 +1,51 @@
+From 4eb1df0be56103b8058c126dd437bfb6dbaa5bb2 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 28 Oct 2024 18:05:53 +0100
+Subject: [PATCH] libfdt.i: Use SWIG_AppendOutput
+
+Swig has changed language specific AppendOutput functions. The helper
+macro SWIG_AppendOutput remains unchanged. Use that instead
+of SWIG_Python_AppendOutput, which would require an extra parameter
+since swig 4.3.0.
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Submitted [https://github.com/dgibson/dtc/pull/154]
+---
+ pylibfdt/libfdt.i | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
+index 2361e22..e04053e 100644
+--- a/pylibfdt/libfdt.i
++++ b/pylibfdt/libfdt.i
+@@ -1080,7 +1080,7 @@ typedef uint32_t fdt32_t;
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff =3D PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+-		resultobj =3D SWIG_Python_AppendOutput(resultobj, buff);
++		resultobj =3D SWIG_AppendOutput(resultobj, buff);
+ 	}
+ }
+=20
+@@ -1121,7 +1121,7 @@ typedef uint32_t fdt32_t;
+=20
+ %typemap(argout) int *depth {
+         PyObject *val =3D Py_BuildValue("i", *arg$argnum);
+-        resultobj =3D SWIG_Python_AppendOutput(resultobj, val);
++        resultobj =3D SWIG_AppendOutput(resultobj, val);
+ }
+=20
+ %apply int *depth { int *depth };
+@@ -1137,7 +1137,7 @@ typedef uint32_t fdt32_t;
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
diff --git a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb b/meta/rec=
ipes-devtools/python/python3-dtc_1.7.0.bb
index 85e48d4694..a32db56cac 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
@@ -8,6 +8,7 @@ DEPENDS =3D "flex-native bison-native swig-native python3=
-setuptools-scm-native li
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter \
            file://0001-Revert-libfdt-overlay-make-overlay_get_target-pub=
lic.patch \
+           file://0001-libfdt.i-Use-SWIG_AppendOutput.patch \
           "
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
--=20
2.47.0


