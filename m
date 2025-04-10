Return-Path: <lw@hqv.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E67C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 06:23:48 +0000 (UTC)
Received: from amphora.sui-inter.net (amphora.sui-inter.net [80.74.147.33])
 by mx.groups.io with SMTP id smtpd.web10.27916.1744266225618696538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 23:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: hqv.ch, ip: 80.74.147.33, mailfrom: lw@hqv.ch)
Received: from [192.168.1.129] (localhost [127.0.0.1]) by amphora.sui-inter.net (Postfix) with ESMTPSA id 0F3CB9680FD7
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:23:43 +0200 (CEST)
Authentication-Results: amphora.sui-inter.net;
        spf=pass (sender IP is 185.132.16.78) smtp.mailfrom=lw@hqv.ch smtp.helo=[192.168.1.129]
Received-SPF: pass (amphora.sui-inter.net: connection is authenticated)
Message-ID: <14bccfd5-f8fb-4120-a779-7219fa18983e@hqv.ch>
Date: Thu, 10 Apr 2025 08:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Lukas Woodtli <lw@hqv.ch>
Subject: Option to change default optimization level of Python
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214619

 From 1614b1bb21b164d11aa88ff428c6bae9439b82d6 Mon Sep 17 00:00:00 2001
From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
Date: Mon, 7 Apr 2025 13:18:41 +0200
Subject: [PATCH] python3: Allow to set the default optimization level

It's possible to compile the Python interpreter for the target, that it
uses a given optimization level by default. This is as providing the
`-O` option to the interpreter (possibly one or two times) or setting
the environment variable `PYTHONOPTIMIZE`.

Signed-off-by: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
---
 =C2=A0...zation-level-1-as-default-for-Python.patch | 25 +++++++++++++++=
+++
 =C2=A0...zation-level-2-as-default-for-Python.patch | 26 +++++++++++++++=
++++
 =C2=A0.../recipes-devtools/python/python3_3.13.2.bb |=C2=A0 9 +++++++
 =C2=A03 files changed, 60 insertions(+)
 =C2=A0create mode 100644=20
meta/recipes-devtools/python/python3/0001-Use-optimization-level-1-as-def=
ault-for-Python.patch
 =C2=A0create mode 100644=20
meta/recipes-devtools/python/python3/0001-Use-optimization-level-2-as-def=
ault-for-Python.patch

diff --git=20
a/meta/recipes-devtools/python/python3/0001-Use-optimization-level-1-as-d=
efault-for-Python.patch=20
b/meta/recipes-devtools/python/python3/0001-Use-optimization-level-1-as-d=
efault-for-Python.patch
new file mode 100644
index 0000000000..98e4355b1d
--- /dev/null
+++=20
b/meta/recipes-devtools/python/python3/0001-Use-optimization-level-1-as-d=
efault-for-Python.patch
@@ -0,0 +1,25 @@
+From ef51db9528916493d23a7e7a63cfc3b12b4ce3d9 Mon Sep 17 00:00:00 2001
+From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
+Date: Tue, 8 Apr 2025 08:26:35 +0200
+Subject: [PATCH] Use optimization level 1 as default for Python
+
+This is as if the command line option `-O` is set implicitly.
+
+Upstream-Status: Inappropriate [this is an optional enhancement just=20
useful for a custom build for an embedded system]
+---
+ Python/initconfig.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Python/initconfig.c b/Python/initconfig.c
+index 192089b..c451b15 100644
+--- a/Python/initconfig.c
++++ b/Python/initconfig.c
+@@ -788,7 +788,7 @@ config_init_defaults(PyConfig *config)
+=C2=A0=C2=A0=C2=A0=C2=A0 config->bytes_warning =3D 0;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->inspect =3D 0;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->interactive =3D 0;
+-=C2=A0=C2=A0=C2=A0 config->optimization_level =3D 0;
++=C2=A0=C2=A0=C2=A0 config->optimization_level =3D 1;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->parser_debug=3D 0;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->write_bytecode =3D 1;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->verbose =3D 0;
diff --git=20
a/meta/recipes-devtools/python/python3/0001-Use-optimization-level-2-as-d=
efault-for-Python.patch=20
b/meta/recipes-devtools/python/python3/0001-Use-optimization-level-2-as-d=
efault-for-Python.patch
new file mode 100644
index 0000000000..ca196970a6
--- /dev/null
+++=20
b/meta/recipes-devtools/python/python3/0001-Use-optimization-level-2-as-d=
efault-for-Python.patch
@@ -0,0 +1,26 @@
+From 31d904e770437cf47b7b56161687a0d90b1bc982 Mon Sep 17 00:00:00 2001
+From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
+Date: Mon, 7 Apr 2025 13:11:02 +0200
+Subject: [PATCH] Use optimization level 2 as default for Python
+
+This is as if the command line option `-OO` is set implicitly.
+
+Upstream-Status: Inappropriate [this is an optional enhancement just=20
useful for a custom build for an embedded system]
+
+---
+ Python/initconfig.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Python/initconfig.c b/Python/initconfig.c
+index 192089b..3f91fac 100644
+--- a/Python/initconfig.c
++++ b/Python/initconfig.c
+@@ -788,7 +788,7 @@ config_init_defaults(PyConfig *config)
+=C2=A0=C2=A0=C2=A0=C2=A0 config->bytes_warning =3D 0;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->inspect =3D 0;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->interactive =3D 0;
+-=C2=A0=C2=A0=C2=A0 config->optimization_level =3D 0;
++=C2=A0=C2=A0=C2=A0 config->optimization_level =3D 2;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->parser_debug=3D 0;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->write_bytecode =3D 1;
+=C2=A0=C2=A0=C2=A0=C2=A0 config->verbose =3D 0;
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb=20
b/meta/recipes-devtools/python/python3_3.13.2.bb
index 7c36fd92ed..f86c150534 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -36,6 +36,15 @@ SRC_URI:append:class-native =3D " \
file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "

+
+# Default optimization level when running the Python interpreter (`-O`=20
flag)
+PYTHON_DEFAULT_OPT_LEVEL ?=3D "0"
+
+SRC_URI:append:class-target =3D " \
+ ${@'file://0001-Use-optimization-level-1-as-default-for-Python.patch'=20
if d.getVar('PYTHON_DEFAULT_OPT_LEVEL') =3D=3D '1' else ''} \
+ ${@'file://0001-Use-optimization-level-2-as-default-for-Python.patch'=20
if d.getVar('PYTHON_DEFAULT_OPT_LEVEL') =3D=3D '2' else ''} \
+"
+
 =C2=A0SRC_URI[sha256sum] =3D=20
"d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56"

 =C2=A0# exclude pre-releases for both python 2.x and 3.x
--=20
2.43.0



