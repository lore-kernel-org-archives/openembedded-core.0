Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6337.1792608385693012143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 11:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pengutronix.de header.s=20260414 header.b=ZrdvGoTK;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: m.felsch@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de (dude06.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::5c])
	(Authenticated sender: relay-from-dude06.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2C6FC201E9D;
	Wed, 21 Oct 2026 20:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792608380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7MUgpj7V6409kCUtXO1U2EC6eKOjirgsXYphzWqOH9g=;
	b=ZrdvGoTKTZxvzrqFchyCVy9p6QKSoS9ICrtuMluX107EF+tJ0UCbYrnyXXmsD22DFwFBZq
	5zCmJxqWCzF2UKh2IV9ybmjw478QEA6K7FDq53OASRSkrM/NHWseeQRKne++w+HTdehCzs
	Olj63hxWUXARkmwabGhU/TXz0TJpGh998a8pD7DQ8ecuvg2zDdOXpINK+ma3mvZrCaelXA
	3RgxpITYPZ7g6t6JYk8mcv9LKVbTj4Wd1J8is+zC5+7taySSHd0FvNKjvcBuGGQQ2v+YZT
	HUv/3v2OGdhQZdVUvGIOV33zdooKEm5NS8xAYUNA6W1ZH2uFcjTGSjrVfdVJLw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792608380; a=rsa-sha256;
	cv=none;
	b=BBTsyFHj2q5VtOrzG5GufYCECzLFY0YHEtNygh0VKJtPp6CS2PSmuZd/2LrddNj/bSPsEF
	xMDYzy+R1My51kBJNGDOfZAKgF9DG0w9jvOdH5awkkbfwPiFqhdQrzI9d7Ek95GeE83Mog
	7dBCmvQp8O60iIn7ZZCv72AhA7x29Dp2IRLyh9fdhaeVMPuOvRTXcp9kLGeeIqkvS+/QPV
	KH5su06rOF7eGFsyRqaWMWNtY4tm+asj4qTX0lIQJop9cXOKCNNP6TXECHPeoj90uVE+E2
	fNbCSdC2d6GVO4JUtP4gMdk+PtfJrP1Ud5y/hPFYNyyIM2l/9lGbwX+RRH8cJQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude06.red.stw.pengutronix.de smtp.mailfrom=m.felsch@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792608380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7MUgpj7V6409kCUtXO1U2EC6eKOjirgsXYphzWqOH9g=;
	b=IZjX2ltDG9en2qJJzXg4UsntcZ1FEur2mITlVoIAdeGDwpCu9AMSS9rTcXMezOD8JRTJRf
	KgN+/dHarK4qawnckV8dmN8goX4BjfnwUoSn0hnJC4UGVINdo50zkOcnTs1h0shwk1ocrJ
	7RrKVB/uM8owAmTVvd1KL9xUVEg9Jc+dh8W7ykknlCKVpAW6lHLcCuI1JStWbFOSbmsM98
	n3vBJodsOUjgsmzcK1heRcaeyysBr+rXiCv4PyARy46UzH5npi05O+q1n1JATWZzi0YLV0
	QO96TqIFz58+ZJAmBEpPZxkl1HEJKzfmti22BEthCHdpC8yw+dYySsGiVapAIA==
Received: from dude06.red.stw.pengutronix.de (localhost [IPv6:::1])
	by dude06.red.stw.pengutronix.de (Postfix) with ESMTP id 0AD30640C35;
	Wed, 21 Oct 2026 20:46:20 +0200 (CEST)
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 21 Oct 2026 20:46:17 +0200
Subject: [PATCH 2/2] classes/cargo-update-recipe-crates: support multiple
 Cargo.lock search directories
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-mfe-multi-cargo-lock-files-v1-2-d3510d4ad963@pengutronix.de>
References: <20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de>
In-Reply-To: <20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 18:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248406

Recipes using cargo's -Z build-std must also vendor the standard
library's dependencies. The std sources staged by rust-native
(.../rustlib/src/rust/library) ship a Cargo.lock but no vendor
directory, so those crates need crate:// entries in SRC_URI as well.
Until now only a single directory could be scanned (CARGO_LOCK_SRC_DIR),
which forced the std crate list to be maintained by hand and go stale on
toolchain upgrades, breaking do_compile with:

  error: failed to select a version for the requirement
  `cfg-if = "^1.0"` (locked to 1.0.4)

Add CARGO_LOCK_SRC_DIRS, a comma-separated list of directories defaulting
to CARGO_LOCK_SRC_DIR, allowing e.g.:

  CARGO_LOCK_SRC_DIRS = "${S},${STAGING_LIBDIR_NATIVE}/rustlib/src/rust/library"

Crates found in multiple lockfiles are listed only once, in the section
of the first Cargo.lock containing them; conflicting checksums for the
same crate version now fail the task. The crates.io warning now names the
lockfile it came from. Output for recipes with a single lockfile is
unchanged.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../cargo-update-recipe-crates.bbclass             | 54 ++++++++++++++--------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 0767b566ee287d11dc2e1e6d0aeea0a0d3b225b8..859a3d087a90c669c0b640f0ec929ff44c7e5882 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -21,17 +21,19 @@ RECIPE_UPGRADE_EXTRA_TASKS += "do_update_crates"
 
 # The directory where to search for Cargo.lock files
 CARGO_LOCK_SRC_DIR ??= "${S}"
+# Comma-separated list of directories where to search for Cargo.lock files.
+# Crates found in multiple Cargo.lock files are listed only once, in the
+# section of the first Cargo.lock file that contains them.
+CARGO_LOCK_SRC_DIRS ??= "${CARGO_LOCK_SRC_DIR}"
 
 python do_update_crates() {
-    cargo_lock_src_dir = d.getVar("CARGO_LOCK_SRC_DIR")
-
-    def get_crates(filename):
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
@@ -40,17 +42,28 @@ python do_update_crates() {
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
+            if rename in seen:
+                if seen[rename] != c.get('checksum'):
+                    raise ValueError(f"Conflicting checksums for crate {rename}")
+                continue
+            seen[rename] = c.get('checksum')
             c_list += '\n    crate://crates.io/%s/%s \\' % (c['name'], c['version'])
             if 'checksum' in c:
                 cksum_list += '\nSRC_URI[%s.sha256sum] = "%s"' % (rename, c['checksum'])
+            ncrates += 1
+
+        if not ncrates:
+            return None
 
         c_list += '\n"\n'
         c_list += cksum_list
@@ -62,23 +75,26 @@ python do_update_crates() {
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
+    cargo_lock_src_dirs = [x.strip() for x in d.getVar("CARGO_LOCK_SRC_DIRS").split(',') if x.strip()]
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
+        raise ValueError(f"Unable to find any Cargo.lock in {d.getVar('CARGO_LOCK_SRC_DIRS')}")
 
     target_file = d.expand("${THISDIR}/${BPN}-crates.inc")
     with open(target_file, 'w') as f:

-- 
2.47.3

