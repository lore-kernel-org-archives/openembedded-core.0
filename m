Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CCBE6ADFE
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 13:09:33 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.46650.1732367363484587402
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 05:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id BD344658
	for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 14:09:21 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.36.244]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tEpt3-2dHkZd0; Sat, 23 Nov 2024 14:09:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Kirkstone][PATCH] ninja: fix build with python 3.13
Date: Sat, 23 Nov 2024 14:09:15 +0100
Message-ID: <20241123130915.1169777-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732367361-F0FF7700-B30D13C9/0/0 CLEAN NORMAL
X-TOI-MSGID: 1c7068d7-efb9-4241-8e2c-24150245e712
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 13:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207684

python 3.13 removed the pipes module. Thus build fails for host machines =
that run python 3.13

This commit adds a backport patch to use subprocess module instead

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...4efb41c039789b81f0dc0d67c1ed0faea17c.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/ninja/ninja_1.10.2.bb   |  5 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ninja/ninja/885b4efb41c039789b8=
1f0dc0d67c1ed0faea17c.patch

diff --git a/meta/recipes-devtools/ninja/ninja/885b4efb41c039789b81f0dc0d=
67c1ed0faea17c.patch b/meta/recipes-devtools/ninja/ninja/885b4efb41c03978=
9b81f0dc0d67c1ed0faea17c.patch
new file mode 100644
index 0000000000..b23bedd04b
--- /dev/null
+++ b/meta/recipes-devtools/ninja/ninja/885b4efb41c039789b81f0dc0d67c1ed0=
faea17c.patch
@@ -0,0 +1,62 @@
+From 9cf13cd1ecb7ae649394f4133d121a01e191560b Mon Sep 17 00:00:00 2001
+From: Byoungchan Lee <byoungchan.lee@gmx.com>
+Date: Mon, 9 Oct 2023 20:13:20 +0900
+Subject: [PATCH 1/2] Replace pipes.quote with shlex.quote in configure.p=
y
+
+Python 3.12 deprecated the pipes module and it will be removed
+in Python 3.13. In configure.py, I have replaced the usage of pipes.quot=
e
+with shlex.quote, which is the exactly same function as pipes.quote.
+
+For more details, refer to PEP 0594: https://peps.python.org/pep-0594
+
+Upstream-Status: Backport [https://github.com/ninja-build/ninja/commit/8=
85b4efb41c039789b81f0dc0d67c1ed0faea17c]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ configure.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.py b/configure.py
+index 588250aa8a..c6973cd1a5 100755
+--- a/configure.py
++++ b/configure.py
+@@ -21,7 +21,7 @@
+=20
+ from optparse import OptionParser
+ import os
+-import pipes
++import shlex
+ import string
+ import subprocess
+ import sys
+@@ -262,7 +262,7 @@ def _run_command(self, cmdline):
+ env_keys =3D set(['CXX', 'AR', 'CFLAGS', 'CXXFLAGS', 'LDFLAGS'])
+ configure_env =3D dict((k, os.environ[k]) for k in os.environ if k in e=
nv_keys)
+ if configure_env:
+-    config_str =3D ' '.join([k + '=3D' + pipes.quote(configure_env[k])
++    config_str =3D ' '.join([k + '=3D' + shlex.quote(configure_env[k])
+                            for k in configure_env])
+     n.variable('configure_env', config_str + '$ ')
+ n.newline()
+
+From 0a9c9c5f50c60de4a7acfed8aaa048c74cd2f43b Mon Sep 17 00:00:00 2001
+From: Byoungchan Lee <byoungchan.lee@gmx.com>
+Date: Mon, 9 Oct 2023 20:13:50 +0900
+Subject: [PATCH 2/2] Remove unused module string in configure.py
+
+---
+ configure.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.py b/configure.py
+index c6973cd1a5..939153df60 100755
+--- a/configure.py
++++ b/configure.py
+@@ -22,7 +22,6 @@
+ from optparse import OptionParser
+ import os
+ import shlex
+-import string
+ import subprocess
+ import sys
+=20
diff --git a/meta/recipes-devtools/ninja/ninja_1.10.2.bb b/meta/recipes-d=
evtools/ninja/ninja_1.10.2.bb
index 1509a54c9e..e7b82ed9ec 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -8,7 +8,10 @@ DEPENDS =3D "re2c-native ninja-native"
=20
 SRCREV =3D "e72d1d581c945c158ed68d9bc48911063022a2c6"
=20
-SRC_URI =3D "git://github.com/ninja-build/ninja.git;branch=3Drelease;pro=
tocol=3Dhttps"
+SRC_URI =3D " \
+	git://github.com/ninja-build/ninja.git;branch=3Drelease;protocol=3Dhttp=
s \
+	file://885b4efb41c039789b81f0dc0d67c1ed0faea17c.patch \
+"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
=20
 S =3D "${WORKDIR}/git"
--=20
2.47.0


