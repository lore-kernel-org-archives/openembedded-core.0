Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10176.1795682248526700945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 00:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pengutronix.de header.s=20260414 header.b=Z/JlLTjM;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: m.felsch@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de (dude06.red.stw.4.pengutronix.de [10.17.1.27])
	(Authenticated sender: relay-from-dude06.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E75FA201A64;
	Thu, 26 Nov 2026 09:37:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795682245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I3kop2VMn4KRb6VzxEopr5pPxyvAuOqAm+xw3+0DjNk=;
	b=Z/JlLTjMzlnOOnSQaIbgfrGC1Fg21WzrWkWFe5EGlND8Kf94/gdzlBiOsWcYygeByNl6iD
	0A5XnB1FTvoClTL5hqF1rcVOBGYAB5tFkjLfOeA6SchWuPEcxy7Od+7h1zPAlpbgdVWuIT
	88Ql/yc0wk2LeoUM2RjY96RgS02h1kqoLYVlSDnjTDX7B+zqZg+QaeB5CCvyuVCOvJMcOP
	t1U9Y6aimpW57ORoN7Bo6y77ebv4QtSkT1+C3kuv58LJohZXJHiOUwjq+3Xjipra59zFFh
	5AciO6X9NcoUAIH8MxtMAv8y7JIgBl2bOofSE5YDSI0lHwempZtkgVDlS2JNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795682245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I3kop2VMn4KRb6VzxEopr5pPxyvAuOqAm+xw3+0DjNk=;
	b=DWwr6EDQMHfIUMbWW7Zp1z64Oxo5Is6VaZ3zS0Y+okAgygfcDOlhCul+64nUUhRbMClpIN
	a0HpUFbPxdmgYFxPSafEmaWP0RSASG4k/+TcDlU3Q27oyditIxcvBKuwn/oYNlFBxYDt8s
	Dd3Q4Lp7k7ZkVZ3xMUL0x6kx3qPu2lw9ZY6Mnu2/hWMgY3trR0cFV05IO+ZZzPsl1M9lL6
	X2mQNFq+Qs1OIRVw22REVB7rRzVF6bnWrltrXM5cnuMDTgwcoR5sMNNJZYQGX9PXRTwQUO
	PFzyOKgLCP3WN0BjrLpGQqP50qok8BdAvD1WIv2vsoAt/JGB6Qumi7b7BpQYbw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude06.red.stw.pengutronix.de smtp.mailfrom=m.felsch@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795682245; a=rsa-sha256;
	cv=none;
	b=IGPV+c9C745OhwimWe0wIrKJECtq/28mWI9EPRKHI/Fx/emyvzmdsZUczVJCMZInx+Ddts
	gfZrbKntlnVIxKvjnDZodjM6IWxCyVdXx6+z7hxCRFJ2CM6FHPM7+PGIfgq+3Un3UAk6/C
	SrwrG3102zWfwHY2WtsX7zgsQ1fZFoEi6PMuQSa42r0H4XSlNCo4Q87TfUYKYSgtV1t5gU
	9Ltk4wMrLHvYpJRpmTfGO/F4rdc82JDTql8nF3AZLDHUYGzeMSdb0bshiqqAJSY/bxzJoR
	EzBUHSZhW8dAt/qdYSGxnLjO6V1Wu3dM/UGSW2VBsfH01fZDzrzNYrnys5Z1Ag==
Received: from dude06.red.stw.pengutronix.de (localhost [IPv6:::1])
	by dude06.red.stw.pengutronix.de (Postfix) with ESMTP id DBD23643817;
	Thu, 26 Nov 2026 09:37:25 +0100 (CET)
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 26 Nov 2026 09:37:20 +0100
Subject: [PATCH v3] classes/cargo-update-recipe-crates: support multiple
 Cargo.lock search directories
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-mfe-multi-cargo-lock-files-v3-1-7ee885214204@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAL/vB2sC/43Nyw6CMBCF4VchXTuGKZeIK9/DuKjtFEaRkhYIh
 vDuAi5cmBiXf3LynUkE8kxBHKNJeBo4sGuWSHaR0JVqSgI2SwsZyxxjifCwBI++7hi08qWD2uk
 7WK4pQIq2UKQkZkUmFqD1ZHnc8PPl3aG/3kh3q7guKg6d88/tfcB199fRgBCDSTKMTapMkSenl
 pqy77xreNwbEuvbID8eyvSnJwHhYA1m2iaYK/XlzfP8ApQ0aSwrAQAA
X-Change-ID: 20261021-mfe-multi-cargo-lock-files-41f9aea21595
To: openembedded-core@lists.openembedded.org
Cc: peter.kjellerstedt@axis.com, yocto@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251288

Recipes using cargo's -Z build-std must also vendor the standard
library's dependencies. The std sources staged by rust-native
(.../rustlib/src/rust/library) ship a Cargo.lock but no vendor
directory, so those crates need crate:// entries in SRC_URI as well.
Until now only a single directory could be scanned (CARGO_LOCK_SRC_DIR),
which forced the std crate list to be maintained by hand and go stale on
toolchain upgrades, breaking do_compile with:

  error: failed to select a version for the requirement
  `cfg-if = "^1.0"` (locked to 1.0.4)

Keep the existing CARGO_LOCK_SRC_DIR and extend it to support a
space-separated list of directories, to allow:

  CARGO_LOCK_SRC_DIR = "${S} ${STAGING_LIBDIR_NATIVE}/rustlib/src/rust/library"

This way the behavior can be backported.

Crates found in multiple lockfiles are listed only once, in the section
of the first Cargo.lock containing them; conflicting checksums for the
same crate version now fail the task. The crates.io warning now names the
lockfile it came from. Output for recipes with a single lockfile is
unchanged.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

this patch adds the support to reference multiple Cargo.lock files which
is handy once a recipe want to rebuild the std-crate for minimized
special purpose builds.
---
Changes in v3:
- Link to v2: https://lore.kernel.org/r/20261124-mfe-multi-cargo-lock-files-v2-1-8fd15cf316aa@pengutronix.de
- Convert to space-separated list to simplify :remove handling and align
  with standard bitbake behavior

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de
- Drop mainlined fixes patch
- Re-use CARGO_LOCK_SRC_DIR to make it backportable
- Add support for v1 Cargo.lock file format
---
 .../cargo-update-recipe-crates.bbclass             | 87 ++++++++++++++++------
 1 file changed, 65 insertions(+), 22 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 0767b566ee287d11dc2e1e6d0aeea0a0d3b225b8..092dce21fe27bd1c693e8e68c4d6405ad2f03c71 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -9,6 +9,10 @@
 ## This class is used to update the list of crates in SRC_URI
 ## by reading Cargo.lock in the source tree.
 ##
+## Both the current Cargo.lock format (checksum stored per [[package]])
+## and the old v1 format (checksums stored in the [metadata] table as
+## "checksum <name> <version> (<source>)" checksum-val) are supported.
+##
 ## See meta/recipes-devtools/python/python3-bcrypt_*.bb for an example
 ##
 ## To perform the update: bitbake -c update_crates recipe-name
@@ -19,38 +23,75 @@ do_update_crates[doc] = "Update the recipe by reading Cargo.lock and write in ${
 
 RECIPE_UPGRADE_EXTRA_TASKS += "do_update_crates"
 
-# The directory where to search for Cargo.lock files
+# Space-separated list of directories where to search for Cargo.lock files.
+# Crates found in multiple Cargo.lock files are listed only once, in the
+# section of the first Cargo.lock file that contains them.
 CARGO_LOCK_SRC_DIR ??= "${S}"
 
 python do_update_crates() {
-    cargo_lock_src_dir = d.getVar("CARGO_LOCK_SRC_DIR")
-
-    def get_crates(filename):
+    def get_legacy_checksums(crates, filename):
+        # Old (v1) Cargo.lock files do not carry a 'checksum' field per
+        # [[package]]; instead they are collected in the [metadata] table:
+        #   "checksum <name> <version> (<source>)" = "<sha256>"
+        # Packages without a checksum (e.g. git sources) use "<none>".
+        checksums = {}
+        for key, value in crates.get('metadata', {}).items():
+            if not key.startswith('checksum '):
+                continue
+            parts = key.split(' ', 3)
+            if len(parts) != 4 or not (parts[3].startswith('(') and parts[3].endswith(')')):
+                print("WARNING: Unable to parse metadata entry '%s' in %s" % (key, filename))
+                continue
+            name, version, source = parts[1], parts[2], parts[3][1:-1]
+            if value == '<none>':
+                continue
+            checksums[(name, version, source)] = value
+        return checksums
+
+    def get_crates(filename, src_dir, seen):
         try:
             import tomllib
         except ImportError:
             import bb._vendor.tomli as tomllib
 
-        c_list = '# from %s' % os.path.relpath(filename, cargo_lock_src_dir)
+        c_list = '# from %s' % os.path.relpath(filename, src_dir)
         c_list += '\nSRC_URI += " \\'
         with open(filename, 'rb') as fp:
             crates = tomllib.load(fp)
 
+        legacy_checksums = get_legacy_checksums(crates, filename)
+
         # Build a list with crates info that have crates.io in the source
         crates_candidates = list(filter(lambda c: 'crates.io' in c.get('source', ''), crates['package']))
 
         if not crates_candidates:
-            print("WARNING: Unable to find any candidate crates that use crates.io")
+            print("WARNING: Unable to find any candidate crates that use crates.io in %s" % filename)
             return None
 
         # Update crates uri and their checksum, to avoid name clashing on the checksum
         # we need to rename crates with name and version to have a unique key
+        # Crates already emitted for a previous Cargo.lock are skipped.
         cksum_list = ''
+        ncrates = 0
         for c in crates_candidates:
             rename = "%s-%s" % (c['name'], c['version'])
+            checksum = c.get('checksum')
+            if checksum is None:
+                checksum = legacy_checksums.get((c['name'], c['version'], c['source']))
+            if rename in seen:
+                if seen[rename] != checksum:
+                    raise ValueError(f"Conflicting checksums for crate {rename}")
+                continue
+            seen[rename] = checksum
             c_list += '\n    crate://crates.io/%s/%s \\' % (c['name'], c['version'])
-            if 'checksum' in c:
-                cksum_list += '\nSRC_URI[%s.sha256sum] = "%s"' % (rename, c['checksum'])
+            if checksum is not None:
+                cksum_list += '\nSRC_URI[%s.sha256sum] = "%s"' % (rename, checksum)
+            else:
+                print("WARNING: No checksum found for crate %s in %s" % (rename, filename))
+            ncrates += 1
+
+        if not ncrates:
+            return None
 
         c_list += '\n"\n'
         c_list += cksum_list
@@ -62,23 +103,25 @@ python do_update_crates() {
     pn = d.getVar("PN")
     crates = f"# Autogenerated with 'bitbake -c update_crates {pn}'\n\n"
 
+    seen = {}
     found = False
-    for root, dirs, files in os.walk(cargo_lock_src_dir):
-        # ignore git and patches directories
-        if root.startswith(os.path.join(cargo_lock_src_dir, '.pc')):
-            continue
-        if root.startswith(os.path.join(cargo_lock_src_dir, '.git')):
-            continue
-        for file in files:
-            if file == 'Cargo.lock':
-                cargo_lock_path = os.path.join(root, file)
-                c = get_crates(cargo_lock_path)
-                if c is not None:
-                    crates += c
-                    found = True
+    for cargo_lock_src_dir in d.getVar("CARGO_LOCK_SRC_DIR").split():
+        for root, dirs, files in os.walk(cargo_lock_src_dir):
+            # ignore git and patches directories
+            if root.startswith(os.path.join(cargo_lock_src_dir, '.pc')):
+                continue
+            if root.startswith(os.path.join(cargo_lock_src_dir, '.git')):
+                continue
+            for file in files:
+                if file == 'Cargo.lock':
+                    cargo_lock_path = os.path.join(root, file)
+                    c = get_crates(cargo_lock_path, cargo_lock_src_dir, seen)
+                    if c is not None:
+                        crates += c
+                        found = True
 
     if not found:
-        raise ValueError(f"Unable to find any Cargo.lock in {cargo_lock_src_dir}")
+        raise ValueError(f"Unable to find any Cargo.lock in '{d.getVar('CARGO_LOCK_SRC_DIR')}'")
 
     target_file = d.expand("${THISDIR}/${BPN}-crates.inc")
     with open(target_file, 'w') as f:

---
base-commit: 7412d08ab2ee94354a93f3765b94479d84c6b034
change-id: 20261021-mfe-multi-cargo-lock-files-41f9aea21595

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

