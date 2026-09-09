Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F347C79FBB
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:55:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.118.1788990942401512518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GCLWG9L0;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34EE71576
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 14:55:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69BC93F7B4
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 14:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788990941; bh=yjBGZBa7blXwNbve7MVLtRTUp1MLlWqVYVgehnNJc5k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GCLWG9L0PCOIB1HZ+kWrmhv+RbkOPeWLcyTxH30xB1ijkmszXddq7kcBmIfAKf/EZ
	 vy3LndKJsqGeEp/vWy473AAeukbLdsyjFh7thcxmMh0gaF5g1ma9EWEzN9F8u9Nxos
	 Rry9meulUQKN0g2IimK0m7K6kiefR8pNidqNK0jo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] classes/cargo-update-recipe-crates: use tomllib directly
Date: Wed,  9 Sep 2026 22:55:37 +0100
Message-ID: <20260909215537.51943-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909215537.51943-1-ross.burton@arm.com>
References: <20260909215537.51943-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245519

Now that BitBake vendors in a copy of tomli for when the host Python is
too old to support tomllib, we can do the crate update logic directly
in the task instead of passing an large inline script to python3-native.

The only changes are the removal of nativepython3 and not relying on
bitbake's shell expansion to expand variable names.

[1] bitbake 69810e0c0a ("lib/bb/_vendor: resync to add tomli")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../cargo-update-recipe-crates.bbclass        | 101 ++++++++++--------
 1 file changed, 54 insertions(+), 47 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/met=
a/classes-recipe/cargo-update-recipe-crates.bbclass
index 47e845c8221..e62039208c1 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -14,7 +14,6 @@
 ## To perform the update: bitbake -c update_crates recipe-name
=20
 addtask do_update_crates after do_patch
-do_update_crates[depends] =3D "python3-native:do_populate_sysroot"
 do_update_crates[nostamp] =3D "1"
 do_update_crates[doc] =3D "Update the recipe by reading Cargo.lock and w=
rite in ${THISDIR}/${BPN}-crates.inc"
=20
@@ -23,58 +22,66 @@ RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_update_crates"
 # The directory where to search for Cargo.lock files
 CARGO_LOCK_SRC_DIR ??=3D "${S}"
=20
-do_update_crates() {
-    TARGET_FILE=3D"${THISDIR}/${BPN}-crates.inc"
+python do_update_crates() {
+    cargo_lock_src_dir =3D d.getVar("CARGO_LOCK_SRC_DIR")
=20
-    nativepython3 - <<EOF
+    def get_crates(filename):
+        try:
+            import tomllib
+        except ImportError:
+            import bb._vendor.tomli as tomllib
=20
-def get_crates(f):
-    import tomllib
-    c_list =3D '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
-    c_list +=3D '\nSRC_URI +=3D " \\\'
-    crates =3D tomllib.load(open(f, 'rb'))
+        c_list =3D '# from %s' % os.path.relpath(filename, cargo_lock_sr=
c_dir)
+        c_list +=3D '\nSRC_URI +=3D " \\'
+        with open(filename, 'rb') as fp:
+            crates =3D tomllib.load(fp)
=20
-    # Build a list with crates info that have crates.io in the source
-    crates_candidates =3D list(filter(lambda c: 'crates.io' in c.get('so=
urce', ''), crates['package']))
+        # Build a list with crates info that have crates.io in the sourc=
e
+        crates_candidates =3D list(filter(lambda c: 'crates.io' in c.get=
('source', ''), crates['package']))
=20
-    if not crates_candidates:
-        print("WARNING: Unable to find any candidate crates that use cra=
tes.io")
-        return None
+        if not crates_candidates:
+            print("WARNING: Unable to find any candidate crates that use=
 crates.io")
+            return None
=20
-    # Update crates uri and their checksum, to avoid name clashing on th=
e checksum
-    # we need to rename crates with name and version to have a unique ke=
y
-    cksum_list =3D ''
-    for c in crates_candidates:
-        rename =3D "%s-%s" % (c['name'], c['version'])
-        c_list +=3D '\n    crate://crates.io/%s/%s \\\' % (c['name'], c[=
'version'])
-        if 'checksum' in c:
-            cksum_list +=3D '\nSRC_URI[%s.sha256sum] =3D "%s"' % (rename=
, c['checksum'])
+        # Update crates uri and their checksum, to avoid name clashing o=
n the checksum
+        # we need to rename crates with name and version to have a uniqu=
e key
+        cksum_list =3D ''
+        for c in crates_candidates:
+            rename =3D "%s-%s" % (c['name'], c['version'])
+            c_list +=3D '\n    crate://crates.io/%s/%s \\' % (c['name'],=
 c['version'])
+            if 'checksum' in c:
+                cksum_list +=3D '\nSRC_URI[%s.sha256sum] =3D "%s"' % (re=
name, c['checksum'])
=20
-    c_list +=3D '\n"\n'
-    c_list +=3D cksum_list
-    c_list +=3D '\n'
-    return c_list
+        c_list +=3D '\n"\n'
+        c_list +=3D cksum_list
+        c_list +=3D '\n'
+        return c_list
=20
-import os
-crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
-found =3D False
-for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
-    # ignore git and patches directories
-    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.pc')):
-        continue
-    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.git')):
-        continue
-    for file in files:
-        if file =3D=3D 'Cargo.lock':
-            cargo_lock_path =3D os.path.join(root, file)
-            c =3D get_crates(cargo_lock_path)
-            if c is not None:
-                crates +=3D c
-if crates is None:
-    raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_=
DIR}")
-with open("${TARGET_FILE}", 'w') as f:
-    f.write(crates)
-EOF
+    import os
=20
-    bbnote "Successfully update crates inside '${TARGET_FILE}'"
+    pn =3D d.getVar("PN")
+    crates =3D f"# Autogenerated with 'bitbake -c update_crates {pn}'\n\=
n"
+
+    found =3D False
+    for root, dirs, files in os.walk(cargo_lock_src_dir):
+        # ignore git and patches directories
+        if root.startswith(os.path.join(cargo_lock_src_dir, '.pc')):
+            continue
+        if root.startswith(os.path.join(cargo_lock_src_dir, '.git')):
+            continue
+        for file in files:
+            if file =3D=3D 'Cargo.lock':
+                cargo_lock_path =3D os.path.join(root, file)
+                c =3D get_crates(cargo_lock_path)
+                if c is not None:
+                    crates +=3D c
+
+    if crates is None:
+        raise ValueError(f"Unable to find any Cargo.lock in {cargo_lock_=
src_dir}")
+
+    target_file =3D d.expand("${THISDIR}/${BPN}-crates.inc")
+    with open(target_file, 'w') as f:
+        f.write(crates)
+
+    bb.note(f"Successfully updated crates inside {target_file}")
 }
--=20
2.43.0


