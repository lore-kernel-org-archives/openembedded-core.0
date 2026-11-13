Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12537.1794580245594436809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 06:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=K0NPzaXX;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24CA3152B
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:30:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA8D33F673
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794580245; bh=y3rA00Ps1b8ctsrHwkvM2F+mPfeE91ifVgLMWULPcbY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K0NPzaXXnLucQ8s9DrYStPP/aJPXVDcgEZCqgSPR08cS0b/620VVwV9ezZV1uFd6D
	 VF8lFJT000BLJHzShAzTrcqbT4mQ+3zmepwOtShgFkB7iaxcEiP4aOUIrziptdg5B+
	 reQeEbrgzyTMqlbTiFrLUbdsZn6zVQV4vztRuadU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/5] python3: add support for skipping dependencies when building the manifest
Date: Fri, 13 Nov 2026 14:30:37 +0000
Message-ID: <20261113143038.1651404-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113143038.1651404-1-ross.burton@arm.com>
References: <20261113143038.1651404-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 14:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250179
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
index 6d3108e46f7..9ce04fdd2aa 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -93,6 +93,14 @@ def print_indent(msg, offset):
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
@@ -121,6 +129,8 @@ print_indent('Getting dependencies for package: core'=
, 0)
=20
 output =3D subprocess.check_output([sys.executable, 'get_module_deps3.py=
', 'python-core-package', '%s' % debugFlag]).decode('utf8')
 for coredep in output.split():
+    if is_dependency_skipped(old_manifest['core'], "core", coredep):
+        continue
     coredep =3D coredep.replace(pyversion,'${PYTHON_MAJMIN}')
     if isCached(coredep):
         if coredep not in old_manifest['core']['cached']:
@@ -172,6 +182,8 @@ for filedep in old_manifest['core']['files']:
=20
=20
     for pymodule_dep in output.split():
+        if is_dependency_skipped(old_manifest['core'], pymodule, pymodul=
e_dep):
+            continue
         pymodule_dep =3D pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN=
}')
=20
         if isCached(pymodule_dep):
@@ -221,6 +233,8 @@ for pypkg in old_manifest:
     new_manifest[pypkg] =3D {}
     new_manifest[pypkg]['summary'] =3D old_manifest[pypkg]['summary']
     new_manifest[pypkg]['rdepends'] =3D []
+    if "skip_depends" in old_manifest[pypkg]:
+        new_manifest[pypkg]['skip_depends'] =3D old_manifest[pypkg]['ski=
p_depends']
     new_manifest[pypkg]['files'] =3D []
     new_manifest[pypkg]['cached'] =3D old_manifest[pypkg]['cached']
=20
@@ -298,6 +312,8 @@ for pypkg in old_manifest:
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

