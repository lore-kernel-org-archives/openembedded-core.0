Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7179.1631269257162132674
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 03:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA6176D
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 967253F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] oeqa/core/target: remove server port parameter
Date: Fri, 10 Sep 2021 11:20:48 +0100
Message-Id: <20210910102050.1266413-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910102050.1266413-1-ross.burton@arm.com>
References: <20210910102050.1266413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Specifying a port that the test host can open sockets on isn't that
useful as the package management tests will open multiple ports, so the
specified port won't be used anyway.  The value was never set so used
the default of value, which meant the kernel picked the port.

Remove the server port parameter entirely, and let the kernel pick a
free port.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/target/qemu.py   | 1 -
 meta/lib/oeqa/core/target/ssh.py    | 3 +--
 meta/lib/oeqa/runtime/cases/apt.py  | 4 +---
 meta/lib/oeqa/runtime/cases/dnf.py  | 3 +--
 meta/lib/oeqa/runtime/cases/opkg.py | 4 +---
 meta/lib/oeqa/runtime/context.py    | 6 ------
 6 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/targe=
t/qemu.py
index 7c6e353edf2..66551607fb9 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -28,7 +28,6 @@ class OEQemuTarget(OESSHTarget):
=20
         super().__init__(logger, None, server_ip, timeout, user, port)
=20
-        self.server_port =3D 0
         self.machine =3D machine
         self.rootfs =3D rootfs
         self.kernel =3D kernel
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target=
/ssh.py
index 4da1e4c2b2d..bbf621c8e38 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -15,7 +15,7 @@ from . import OETarget
=20
 class OESSHTarget(OETarget):
     def __init__(self, logger, ip, server_ip, timeout=3D300, user=3D'roo=
t',
-                 port=3DNone, server_port=3D0, **kwargs):
+                 port=3DNone, **kwargs):
         if not logger:
             logger =3D logging.getLogger('target')
             logger.setLevel(logging.INFO)
@@ -29,7 +29,6 @@ class OESSHTarget(OETarget):
=20
         super().__init__(logger, server_ip)
         self.ip =3D ip
-        self.server_port =3D server_port
         self.timeout =3D timeout
         self.user =3D user
         ssh_options =3D [
diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/c=
ases/apt.py
index 53745df93f9..ed531a619aa 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -22,9 +22,7 @@ class AptRepoTest(AptTest):
     @classmethod
     def setUpClass(cls):
         service_repo =3D os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], 'all'=
)
-        cls.repo_server =3D HTTPService(service_repo,
-                                      '0.0.0.0', port=3Dcls.tc.target.se=
rver_port,
-                                      logger=3Dcls.tc.logger)
+        cls.repo_server =3D HTTPService(service_repo, '0.0.0.0', logger=3D=
cls.tc.logger)
         cls.repo_server.start()
=20
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/c=
ases/dnf.py
index f40c63026e5..937acaab597 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -53,8 +53,7 @@ class DnfRepoTest(DnfTest):
     @classmethod
     def setUpClass(cls):
         cls.repo_server =3D HTTPService(os.path.join(cls.tc.td['WORKDIR'=
], 'oe-testimage-repo'),
-                                      '0.0.0.0', port=3Dcls.tc.target.se=
rver_port,
-                                      logger=3Dcls.tc.logger)
+                                      '0.0.0.0', logger=3Dcls.tc.logger)
         cls.repo_server.start()
=20
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/=
cases/opkg.py
index 9cfee1cd886..581ddf58749 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -25,9 +25,7 @@ class OpkgRepoTest(OpkgTest):
         if cls.tc.td["MULTILIB_VARIANTS"]:
             allarchfeed =3D cls.tc.td["TUNE_PKGARCH"]
         service_repo =3D os.path.join(cls.tc.td['DEPLOY_DIR_IPK'], allar=
chfeed)
-        cls.repo_server =3D HTTPService(service_repo,
-                                      '0.0.0.0', port=3Dcls.tc.target.se=
rver_port,
-                                      logger=3Dcls.tc.logger)
+        cls.repo_server =3D HTTPService(service_repo, '0.0.0.0', logger=3D=
cls.tc.logger)
         cls.repo_server.start()
=20
     @classmethod
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/con=
text.py
index 3826f276421..8552aa782bc 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -99,12 +99,6 @@ class OERuntimeTestContextExecutor(OETestContextExecut=
or):
                 target_ip =3D target_ip_port[0]
                 kwargs['port'] =3D target_ip_port[1]
=20
-        if server_ip:
-            server_ip_port =3D server_ip.split(':')
-            if len(server_ip_port) =3D=3D 2:
-                server_ip =3D server_ip_port[0]
-                kwargs['server_port'] =3D int(server_ip_port[1])
-
         if target_type =3D=3D 'simpleremote':
             target =3D OESSHTarget(logger, target_ip, server_ip, **kwarg=
s)
         elif target_type =3D=3D 'qemu':
--=20
2.25.1

