Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29159.1795555328804084069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 13:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pengutronix.de header.s=20260414 header.b=bSLi6CfW;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: m.felsch@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de (dude06.red.stw.4.pengutronix.de [10.17.1.27])
	(Authenticated sender: relay-from-dude06.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 55BF5201BD1;
	Tue, 24 Nov 2026 22:22:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795555321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hc+TzQu4W5uAIC58/bLfrQpm84oJzAgo2VfHDmkLgOg=;
	b=bSLi6CfWY1GuFHR86jR/bnm/A03/yGAfxFed/yeNLVsAxYR1/KELkIL2Ll4Ndj0XvqhTg1
	SjemupB3RmdpbH3kK891+PWrIxmyQ/gJ14I7nrdleCgNa/8UViMHdYYvF2X4RJqEO3SXNb
	u5M/6xMTcWW8c+Ab7H91pDc+uITZeVkhsC0s+yNYB2/oFPI4/pFKKy4rOPkODx9gu81XHm
	vK8FDAwS96TwCZlIZgXJIlNL6nrUi8jlA8BEfTe/kDJmgX25uoltqdGeaNH3COD43WfUUc
	YIyHyC0OqxjnUbgxNRDgQVBnp8tapEU0qVGiuRb6BUfDTdV7NNJONd5NdUUgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795555321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hc+TzQu4W5uAIC58/bLfrQpm84oJzAgo2VfHDmkLgOg=;
	b=Bpnhirjs0jhI+Q0kw0KrJUtugghmRbD8bP4JIo6AXu9ocrWDknO2gqMp+cbwd2RmDxJztD
	nPlo6zOvw7vRnEWK8IGTMCXdk6L+BHl+Zn5x9hYRQ+repfquOewi1dEyX7PpuvMzicBduO
	Qy6oUsz5fJRJY/3IyGHi5IjXSxhtWh4Xry6dkylcMDYOhEu37YeLyPEMh+ZUJzo7fIZrHu
	zUxyHl1vLuNf5bqm3j3+xHYuE1BBRGsdVW/WTUWx78/aVitK/wOTZi7CRL97EfvILbAOa3
	cUwDkRkGqnNYOnX2jkK4vryWxceDf/oJFzTmBIuSUF7haH6/PGfFPQKnnoaaVg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude06.red.stw.pengutronix.de smtp.mailfrom=m.felsch@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795555321; a=rsa-sha256;
	cv=none;
	b=G0IOk8YKJwMKK6xJqZ7Jc9pAJnsi3BauFGaMM+cv5ygMel7utvVXAWGzFgQ1XCZeEZZZOV
	rNEArNPM18L1Yn1n89TAveYyhIn6mb+SJqA+905ekkYHGA3x66UpzwhS6XJFwE4WfMf6kY
	/kSE61A1gBbN2KR4UYbGcZRvjZLkPDCgAz1YQ6a/C7f3tPn+wI4dUuPLQDU2Q+daIMU8zE
	B5ghpq9kREvMIdiG5D+5vdJLWGLOJVptYlWsXF3pDHD6g9vZi9V6AeJqSzNWVXrvEcCdIn
	OiXLRNAnkHs1KlcvqGpzkW0o5fZw+mEHgeGXBA2DEOkXOO826FgE3Z54zP9hTA==
Received: from dude06.red.stw.pengutronix.de (localhost [IPv6:::1])
	by dude06.red.stw.pengutronix.de (Postfix) with ESMTP id 430CB643E53;
	Tue, 24 Nov 2026 22:22:01 +0100 (CET)
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 24 Nov 2026 22:21:57 +0100
Subject: [PATCH v2] classes/cargo-update-recipe-crates: support multiple
 Cargo.lock search directories
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-mfe-multi-cargo-lock-files-v2-1-8fd15cf316aa@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAPT/BWsC/42NSw6DIBQAr2JY9zWAn8Sueo/GBYWHvlbBABob4
 92r9gJdTjKZWVnEQBjZLVtZwJkiebeDvGRMd8q1CGR2ZpLLSnApYLAIw9QnAq1C66H3+g2Weox
 QCFsrVFKUdcn2wBjQ0nLGH82P4/R8oU5H8TA6ismHz3mfxeH9NZoFcDB5KbgplKmr/D6ia6cUv
 KPlapA127Z9AUMc4UPbAAAA
X-Change-ID: 20261021-mfe-multi-cargo-lock-files-41f9aea21595
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 21:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251079

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
comma-separated list of directories, to allow:

  CARGO_LOCK_SRC_DIR = "${S},${STAGING_LIBDIR_NATIVE}/rustlib/src/rust/library"

This way the behavior can be backported.

Crates found in multiple lockfiles are listed only once, in the section
of the first Cargo.lock containing them; conflicting checksums for the
same crate version now fail the task. The crates.io warning now names the
lockfile it came from. Output for recipes with a single lockfile is
unchanged.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

this small series adds the support to reference multiple Cargo.lock
files which is handy once a recipe want to rebuild the std-crate for
minimized special purpose builds.
---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de
- Drop mainlined fixes patch
- Re-use CARGO_LOCK_SRC_DIR to make it backportable
- Add support for v1 Cargo.lock file format
---
 .../cargo-update-recipe-crates.bbclass             | 88 ++++++++++++++++------
 1 file changed, 66 insertions(+), 22 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 0767b566ee287d11dc2e1e6d0aeea0a0d3b225b8..ec571611220791b4136ca814d8483129f79772e0 100644
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
+# Comma-separated list of directories where to search for Cargo.lock files.
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
@@ -62,23 +103,26 @@ python do_update_crates() {
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
+    cargo_lock_src_dirs = [x.strip() for x in d.getVar("CARGO_LOCK_SRC_DIR").split(',') if x.strip()]
+    for cargo_lock_src_dir in cargo_lock_src_dirs:
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
+        raise ValueError(f"Unable to find any Cargo.lock in {d.getVar('CARGO_LOCK_SRC_DIR')}")
 
     target_file = d.expand("${THISDIR}/${BPN}-crates.inc")
     with open(target_file, 'w') as f:

---
base-commit: 7412d08ab2ee94354a93f3765b94479d84c6b034
change-id: 20261021-mfe-multi-cargo-lock-files-41f9aea21595

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

