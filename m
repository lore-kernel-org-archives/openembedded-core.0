Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B432ECD13D3
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.936.1777481314185473635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XW9bPXs5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 378ED1BB0
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C7FC3FB90
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481313; bh=hVKtKduy9HrLaVc8vnLSxNRRuuvHvg4Sdg5xfzqO3yQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XW9bPXs57g0yWQKBgMIRZYWHbCv9NTNG/vNkNgNwIoQg1IH4dqHxPUiaqirR9RSYc
	 NJMwBDLpwzuAbZeFZrcRswcWaJ82h8SxYggE0xm9tDtzwca5jK/vJypYXF3ztsbDZU
	 cIFzQo1BshqkKmQrOiW42Z+pOWK5o0aWwcKdTTK4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] classes/kernel-module-split: return list of values in extract_modinfo
Date: Wed, 29 Apr 2026 17:48:21 +0100
Message-ID: <20260429164821.3425757-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
References: <20260429164821.3425757-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236122

extract_modinfo() currently returns a dictionary of key-value entries,
but many fields in modinfo can have more than one value:

  $ modinfo drivers/bluetooth/btmrvl_sdio.ko
  filename:       btmrvl_sdio.ko
  firmware:       mrvl/sdsd8997_combo_v4.bin
  firmware:       mrvl/sd8987_uapsta.bin
  [ ... ]
  firmware:       mrvl/sd8688_helper.bin
  license:        GPL v2
  version:        1.0
  description:    Marvell BT-over-SDIO driver ver 1.0
  author:         Marvell International Ltd.
  srcversion:     7C108FB5953EFD4D4DE0A4C
  alias:          sdio:c*v02DFd9142*
  [ ... ]
  alias:          sdio:c*v02DFd9105*
  depends:        btmrvl
  intree:         Y
  name:           btmrvl_sdio
  vermagic:       6.18.24-yocto-standard SMP preempt mod_unload aarch64

Instead of returning a dict of key:value pairs, return a dict of key to
list of values and update the callers to take the first element in the
list where a single value is expected (such as the description).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../classes-recipe/kernel-module-split.bbclass | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/class=
es-recipe/kernel-module-split.bbclass
index b30b3edd39d..ab2f0d1c37d 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -45,10 +45,14 @@ KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
 python split_kernel_module_packages () {
     import re
=20
-    modinfoexp =3D re.compile("([^=3D]+)=3D(.*)")
+    modinfoexp =3D re.compile(r"([^=3D]+)=3D\s*(.+)")
=20
     def extract_modinfo(file):
-        import tempfile, subprocess
+        """
+        Extract the module metadata from the specified file,
+        returning a dictionary of fields to list of string values.
+        """
+        import collections, tempfile, subprocess
         tempfile.tempdir =3D d.getVar("WORKDIR")
         compressed =3D re.match( r'.*\.(gz|xz|zst)$', file)
         tf =3D tempfile.mkstemp()
@@ -78,12 +82,12 @@ python split_kernel_module_packages () {
         os.unlink(tmpfile)
         if compressed:
             os.unlink(tmpkofile)
-        vals =3D {}
+        vals =3D collections.defaultdict(list)
         for i in l:
             m =3D modinfoexp.match(i)
             if not m:
                 continue
-            vals[m.group(1)] =3D m.group(2)
+            vals[m.group(1)].append(m.group(2))
         return vals
=20
     def handle_conf_files(d, basename, pkg):
@@ -195,12 +199,12 @@ python split_kernel_module_packages () {
=20
         if "description" in vals:
             old_desc =3D d.getVar('DESCRIPTION:' + pkg) or ""
-            d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["descr=
iption"])
+            d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["descr=
iption"][0])
=20
         rdepends =3D bb.utils.explode_dep_versions2(d.getVar('RDEPENDS:'=
 + pkg) or "")
         modinfo_deps =3D []
-        if "depends" in vals and vals["depends"] !=3D "":
-            for dep in vals["depends"].split(","):
+        for deps in vals.get("depends", []):
+            for dep in deps.split(","):
                 on =3D legitimize_package_name(dep)
                 dependency_pkg =3D format % on
                 modinfo_deps.append(dependency_pkg)
--=20
2.43.0


