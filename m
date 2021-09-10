Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7165.1631269255786552825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 03:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63549113E
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F1693F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] oeqa/core/target: move server_ip to superclass
Date: Fri, 10 Sep 2021 11:20:47 +0100
Message-Id: <20210910102050.1266413-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910102050.1266413-1-ross.burton@arm.com>
References: <20210910102050.1266413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move towards a consistent interface across OETarget subclasses by
moving server_ip to the superclass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/target/__init__.py | 3 ++-
 meta/lib/oeqa/core/target/qemu.py     | 4 +---
 meta/lib/oeqa/core/target/ssh.py      | 3 +--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/t=
arget/__init__.py
index 3da66038342..aff02ecc439 100644
--- a/meta/lib/oeqa/core/target/__init__.py
+++ b/meta/lib/oeqa/core/target/__init__.py
@@ -7,7 +7,8 @@
=20
 class OETarget:
=20
-    def __init__(self, logger, *args, **kwargs):
+    def __init__(self, logger, server_ip):
+        self.server_ip =3D server_ip
         self.logger =3D logger
=20
     def start(self):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/targe=
t/qemu.py
index 79fd724f7d4..7c6e353edf2 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -26,10 +26,8 @@ class OEQemuTarget(OESSHTarget):
             tmpdir=3D'', dir_image=3D'', boottime=3D60, serial_ports=3D2=
,
             boot_patterns =3D defaultdict(str), ovmf=3DFalse, tmpfsdir=3D=
None, **kwargs):
=20
-        super(OEQemuTarget, self).__init__(logger, None, server_ip, time=
out,
-                user, port)
+        super().__init__(logger, None, server_ip, timeout, user, port)
=20
-        self.server_ip =3D server_ip
         self.server_port =3D 0
         self.machine =3D machine
         self.rootfs =3D rootfs
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target=
/ssh.py
index 923a223b25b..4da1e4c2b2d 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -27,9 +27,8 @@ class OESSHTarget(OETarget):
             fileHandler.setFormatter(formatter)
             logger.addHandler(fileHandler)
=20
-        super(OESSHTarget, self).__init__(logger)
+        super().__init__(logger, server_ip)
         self.ip =3D ip
-        self.server_ip =3D server_ip
         self.server_port =3D server_port
         self.timeout =3D timeout
         self.user =3D user
--=20
2.25.1

