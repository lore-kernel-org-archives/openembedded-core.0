Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45900.1795624773622671750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KlFD1kzq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 490B92F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D86163F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624773; bh=zV6WhjuZXO3m/ylNVxNle6MqSLDhTxn1qfFKedaqJkE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KlFD1kzqg6Kx98i9w9dD3SK31DM7GtJ3Oz1VRFsx2Mxuapifcl5xjdJgWQn3dC3Ix
	 aOFk5Cz714avB32mjx4u4KoLva+ZjQZ58u1DOJNd3ihk25ntn1HoQbeBp+qZwGuQrf
	 mAgbYmwnmT+umi4Y9q6u7obidMC2k1rmyyL9Djjk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/18] python3: hide stdout when importing modules during module dependency generation
Date: Wed, 25 Nov 2026 16:39:12 +0000
Message-ID: <20261125163927.1835785-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251214
Content-Type: text/plain; charset="utf-8"

gen_module_deps3.py imports modules and prints to stdout the list of
dependencies. Some modules, such as this.py, also print to stdout. This
results in garbage dependencies, so hide stdout when importing to avoid
this problem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/get_module_deps3.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/m=
eta/recipes-devtools/python/python3/get_module_deps3.py
index f26d9b20b4b..08c2d28feb7 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -50,11 +50,15 @@ def fix_path(dep_path):
=20
 # Module to import was passed as an argument
 current_module =3D  str(sys.argv[1]).rstrip()
+
 if debug =3D=3D True:
     log =3D open('temp/log_%s' % current_module.strip('.*'),'w')
     log.write('Module %s generated the following dependencies:\n' % curr=
ent_module)
 try:
+    real_stdout =3D sys.stdout
+    sys.stdout =3D None
     m =3D importlib.import_module(current_module)
+
     # handle python packages which may not include all modules in the __=
init__
     if hasattr(m, '__file__') and os.path.basename(m.__file__) =3D=3D "_=
_init__.py":
         modulepath =3D os.path.dirname(m.__file__)
@@ -70,6 +74,8 @@ except ImportError as e:
     if debug =3D=3D True:
         log.write('Module was not found\n')
     pass
+finally:
+    sys.stdout =3D real_stdout
=20
=20
 # Get current module dependencies, dif will contain a list of specific d=
eps for this module
--=20
2.43.0

