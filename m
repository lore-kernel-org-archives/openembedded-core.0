Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDFBC43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 12:48:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29785.1655470104491560848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 05:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5F37113E;
	Fri, 17 Jun 2022 05:48:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F27B73F7F5;
	Fri, 17 Jun 2022 05:48:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] python3: fix a race condition in the test_socket.testSockName
 test
Date: Fri, 17 Jun 2022 13:48:20 +0100
Message-Id: <20220617124820.3030925-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 12:48:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167023

This test uses find_unused_port() which is inherently racey, so retry
it a few times before failing.

[ YOCTO #14840 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...e-the-race-condition-in-testSockName.patch | 47 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.4.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Mitigate-th=
e-race-condition-in-testSockName.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-=
condition-in-testSockName.patch b/meta/recipes-devtools/python/python3/00=
01-Mitigate-the-race-condition-in-testSockName.patch
new file mode 100644
index 00000000000..e19df08f870
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-conditi=
on-in-testSockName.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 8103b90148e8768456c3ab707de105d63d9d5b20 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 17 Jun 2022 11:53:59 +0100
+Subject: [PATCH] Mitigate the race condition in testSockName
+
+find_unused_port() has an inherent race condition, but we can't use
+bind_port() as that uses .getsockname() which this test is exercising.
+
+Try binding to unused ports a few times before failing.
+---
+ Lib/test/test_socket.py | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/test/test_socket.py b/Lib/test/test_socket.py
+index c981903824..b1630d18b6 100644
+--- a/Lib/test/test_socket.py
++++ b/Lib/test/test_socket.py
+@@ -1390,10 +1390,21 @@ def testStringToIPv6(self):
+=20
+     def testSockName(self):
+         # Testing getsockname()
+-        port =3D socket_helper.find_unused_port()
+         sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+         self.addCleanup(sock.close)
+-        sock.bind(("0.0.0.0", port))
++
++        # Since find_unused_port() is inherently subject to race condit=
ions, we
++        # call it a couple times if necessary.
++        for i in itertools.count():
++            port =3D socket_helper.find_unused_port()
++            try:
++                sock.bind(("0.0.0.0", port))
++            except OSError as e:
++                if e.errno !=3D errno.EADDRINUSE or i =3D=3D 5:
++                    raise
++            else:
++                break
++
+         name =3D sock.getsockname()
+         # XXX(nnorwitz): http://tinyurl.com/os5jz seems to indicate
+         # it reasonable to get the host's addr in addition to 0.0.0.0.
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipe=
s-devtools/python/python3_3.10.4.bb
index 6bd3a6aba84..db0c2bf9ee8 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -34,6 +34,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-ma=
ste.patch \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross=
-co.patch \
            file://deterministic_imports.patch \
+           file://0001-Mitigate-the-race-condition-in-testSockName.patch=
 \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.25.1


