Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7270.1631269257423545577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 03:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F148101E
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF193F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] oeqa/target/ssh: don't assume target_dumper is set
Date: Fri, 10 Sep 2021 11:20:50 +0100
Message-Id: <20210910102050.1266413-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910102050.1266413-1-ross.burton@arm.com>
References: <20210910102050.1266413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The target_dumper property is only set by the QemuTarget subclass, so
assign a default value and check it isn't None before calling it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/target/ssh.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target=
/ssh.py
index b61c7d141d9..8cd2966fa38 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -41,6 +41,7 @@ class OESSHTarget(OETarget):
             self.ssh =3D self.ssh + [ '-p', port ]
             self.scp =3D self.scp + [ '-P', port ]
         self._monitor_dumper =3D None
+        self.target_dumper =3D None
=20
     def start(self, **kwargs):
         pass
@@ -99,7 +100,8 @@ class OESSHTarget(OETarget):
             if self.monitor_dumper:
                 self.monitor_dumper.dump_monitor()
         if status =3D=3D 255:
-            self.target_dumper.dump_target()
+            if self.target_dumper:
+                self.target_dumper.dump_target()
             if self.monitor_dumper:
                 self.monitor_dumper.dump_monitor()
         return (status, output)
--=20
2.25.1

