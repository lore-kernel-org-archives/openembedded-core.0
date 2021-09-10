Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7167.1631269257161659831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 03:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CD0F1FB
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28A6E3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] oeqa/core/target: add target_ip to superclass
Date: Fri, 10 Sep 2021 11:20:49 +0100
Message-Id: <20210910102050.1266413-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910102050.1266413-1-ross.burton@arm.com>
References: <20210910102050.1266413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move towards a consistent interface across OETarget subclasses by
moving target_ip to the superclass.

QemuTarget automatically determines the target IP on startup, so default
that to None.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/target/__init__.py | 3 ++-
 meta/lib/oeqa/core/target/qemu.py     | 4 ++--
 meta/lib/oeqa/core/target/ssh.py      | 5 ++---
 meta/lib/oeqa/runtime/context.py      | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/t=
arget/__init__.py
index aff02ecc439..45ed3e54b40 100644
--- a/meta/lib/oeqa/core/target/__init__.py
+++ b/meta/lib/oeqa/core/target/__init__.py
@@ -7,8 +7,9 @@
=20
 class OETarget:
=20
-    def __init__(self, logger, server_ip):
+    def __init__(self, logger, server_ip, target_ip):
         self.server_ip =3D server_ip
+        self.ip =3D target_ip
         self.logger =3D logger
=20
     def start(self):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/targe=
t/qemu.py
index 66551607fb9..ef567939ad8 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -20,13 +20,13 @@ from oeqa.utils.dump import TargetDumper
 supported_fstypes =3D ['ext3', 'ext4', 'cpio.gz', 'wic']
=20
 class OEQemuTarget(OESSHTarget):
-    def __init__(self, logger, server_ip, timeout=3D300, user=3D'root',
+    def __init__(self, logger, server_ip, target_ip=3DNone, timeout=3D30=
0, user=3D'root',
             port=3DNone, machine=3D'', rootfs=3D'', kernel=3D'', kvm=3DF=
alse, slirp=3DFalse,
             dump_dir=3D'', dump_host_cmds=3D'', display=3D'', bootlog=3D=
'',
             tmpdir=3D'', dir_image=3D'', boottime=3D60, serial_ports=3D2=
,
             boot_patterns =3D defaultdict(str), ovmf=3DFalse, tmpfsdir=3D=
None, **kwargs):
=20
-        super().__init__(logger, None, server_ip, timeout, user, port)
+        super().__init__(logger, server_ip, target_ip, timeout, user, po=
rt)
=20
         self.machine =3D machine
         self.rootfs =3D rootfs
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target=
/ssh.py
index bbf621c8e38..b61c7d141d9 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -14,7 +14,7 @@ import codecs
 from . import OETarget
=20
 class OESSHTarget(OETarget):
-    def __init__(self, logger, ip, server_ip, timeout=3D300, user=3D'roo=
t',
+    def __init__(self, logger, server_ip, target_ip, timeout=3D300, user=
=3D'root',
                  port=3DNone, **kwargs):
         if not logger:
             logger =3D logging.getLogger('target')
@@ -27,8 +27,7 @@ class OESSHTarget(OETarget):
             fileHandler.setFormatter(formatter)
             logger.addHandler(fileHandler)
=20
-        super().__init__(logger, server_ip)
-        self.ip =3D ip
+        super().__init__(logger, server_ip, target_ip)
         self.timeout =3D timeout
         self.user =3D user
         ssh_options =3D [
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/con=
text.py
index 8552aa782bc..76cae4ee789 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -100,7 +100,7 @@ class OERuntimeTestContextExecutor(OETestContextExecu=
tor):
                 kwargs['port'] =3D target_ip_port[1]
=20
         if target_type =3D=3D 'simpleremote':
-            target =3D OESSHTarget(logger, target_ip, server_ip, **kwarg=
s)
+            target =3D OESSHTarget(logger, server_ip, target_ip, **kwarg=
s)
         elif target_type =3D=3D 'qemu':
             target =3D OEQemuTarget(logger, server_ip, **kwargs)
         else:
--=20
2.25.1

