Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40596.1601309951035490531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E88B1500
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF1DF3F6CF
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:09 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] siggen: use correct umask when writing siginfo
Date: Mon, 28 Sep 2020 17:18:59 +0100
Message-Id: <20200928161900.452970-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161900.452970-1-ross.burton@arm.com>
References: <20200928161900.452970-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We try to write sstate with group-write permissions so that sstate-cache
can be shared between multiple users.  However the siginfo files are
created in various tasks which may set their own umask (such as
do_populate_sysroot, 0022).  This results in no group write permission
on the intermediate directories, which is fatal when sharing a cache.

Fix this by wrapping the siginfo mkdir in a umask change to 0002.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 bitbake/lib/bb/siggen.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 1456324a70..86e0e16f39 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -358,7 +358,8 @@ class SignatureGeneratorBasic(SignatureGenerator):
         else:
             sigfile =3D stampbase + "." + task + ".sigbasedata" + "." + =
self.basehash[tid]
=20
-        bb.utils.mkdirhier(os.path.dirname(sigfile))
+        with bb.utils.umask(0o002):
+            bb.utils.mkdirhier(os.path.dirname(sigfile))
=20
         data =3D {}
         data['task'] =3D task
--=20
2.25.1

