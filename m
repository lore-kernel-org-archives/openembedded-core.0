Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10229.1794406654168906466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=PUQ8uJqP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9EF41576
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64A0D3F632
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794406653; bh=s4FoHWEX8ouZVdI6DKRyWagc5LLZenXYWQhtzw0zYtY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PUQ8uJqPIcDJYQKHGXXMXHnG8p9ski/DB8iuMVi2u5S/rm0up42GaNwL+srqYE5rl
	 BoOU9WLPBpD4HR4X9w3Mx9NOccG3411AQkM8GRYurxyMlKCNgJw1MUieCnd4w18LmT
	 IOeO6bebMFl0xzoJwTEATyHjIeotGoeEiZJCxtzc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/6] python3: add support for skipping dependencies when building the manifest
Date: Wed, 11 Nov 2026 14:17:25 +0000
Message-ID: <20261111141726.1496785-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111141726.1496785-1-ross.burton@arm.com>
References: <20261111141726.1496785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250034
Content-Type: text/plain; charset="utf-8"

The manifest generation works by importing modules and seeing what other
modules also get included.  This means the manifest is maximal, for examp=
le
shutil tries to import all of the compression modules to determine what
compression types are available.

Add a "skip_depends" element to the manifest so we can mark up specific
dependencies that should be ignored when generating the manifest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/create_manifest3.py           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/m=
eta/recipes-devtools/python/python3/create_manifest3.py
index 029d9235c1a..b713dba5ee9 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -81,6 +81,14 @@ def print_indent(msg, offset):
         msg =3D ' ' * offset + l
         print(msg)
=20
+def is_dependency_skipped(manifest, package, dependency):
+    """
+    Check to see if this dependency should be ignored by matching substr=
ings
+    from the optional skip_depends element in the manifest.
+    """
+    skiplist =3D manifest.get('skip_depends', {}).get(package, [])
+    return any((skip in dependency for skip in skiplist))
+
=20
 # Read existing JSON manifest
 with open('python3-manifest.json') as manifest:
@@ -109,6 +117,8 @@ print_indent('Getting dependencies for package: core'=
, 0)
=20
 output =3D subprocess.check_output([sys.executable, 'get_module_deps3.py=
', 'python-core-package', '%s' % debugFlag]).decode('utf8')
 for coredep in output.split():
+    if is_dependency_skipped(old_manifest['core'], "core", coredep):
+        continue
     coredep =3D coredep.replace(pyversion,'${PYTHON_MAJMIN}')
     if coredep not in old_manifest['core']['files']:
         old_manifest['core']['files'].append(coredep)
@@ -152,6 +162,8 @@ for filedep in old_manifest['core']['files']:
=20
=20
     for pymodule_dep in output.split():
+        if is_dependency_skipped(old_manifest['core'], pymodule, pymodul=
e_dep):
+            continue
         pymodule_dep =3D pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN=
}')
=20
         if pymodule_dep not in old_manifest['core']['files']:
@@ -197,6 +209,8 @@ for pypkg in old_manifest:
     new_manifest[pypkg] =3D {}
     new_manifest[pypkg]['summary'] =3D old_manifest[pypkg]['summary']
     new_manifest[pypkg]['rdepends'] =3D []
+    if "skip_depends" in old_manifest[pypkg]:
+        new_manifest[pypkg]['skip_depends'] =3D old_manifest[pypkg]['ski=
p_depends']
     new_manifest[pypkg]['files'] =3D []
=20
     # All packages should depend on core
@@ -272,6 +286,8 @@ for pypkg in old_manifest:
         reportRDEPS =3D []
=20
         for pymodule_dep in output.split():
+            if is_dependency_skipped(new_manifest[pypkg], pymodule, pymo=
dule_dep):
+                continue
=20
             # Warning: This first part is ugly
             # One of the dependencies that was found, could be inside of=
 one of the folders included by another package
--=20
2.43.0

