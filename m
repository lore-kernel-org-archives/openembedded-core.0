Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3638CCCD195
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 21:45:11 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.27055.1760888863179143082
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 08:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sm8BV4WD;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: dani.barra25@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b50206773adso831294966b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760888861; x=1761493661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+HJmAHkTRrV2MAd7oBdNT6miftC7oPrNj1rfYd4ONE=;
        b=Sm8BV4WD0BUWzjDMB3F/cNWcFXZSSXT3Ad7/lcdW0sj7ShApuh63MEfI4kmxNtr7no
         I12cC8yuiHXvFs99KgMbmfhX7fUaIflPba8vBV3QzTA0n4Ucc2oGrw4fXCvhc7rlamRP
         YL+qziENSF7jGNRKZi3dztj7S/nzP+p7oZdE9UwErW0vWj4d4SVosGe0VYtArlRgBj6E
         j18P3DmMkFUmyd7BIYy9p+lkEOTwSPOpsJhKBVbCDXa5675HesVcagwoBjbIHicMv0AY
         PvLG2Q4mmhx2uu4O/r0uVoski16hfwA0CXAuW8DU+3+GR1oFJVG5PoVSXkY1WTIYatiZ
         7/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888861; x=1761493661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+HJmAHkTRrV2MAd7oBdNT6miftC7oPrNj1rfYd4ONE=;
        b=U/5FlahdSvdrn3OHjmDzFlDxRhAXXn6DFaMZfE7jMGlSuesY3O4xoDaDvGX38j6kde
         Zw7EgLie7VmzTUg5KKXjp0bIr1XuHg5Ulps3snrUkyyiBA/5xnKxlqAkhKwtlLOS9ZwX
         ZtwmHGaotjkQTswCM/AVkTEddymYX9+lIQT3FbcjIDmiZDkgl2XrAgR0SSPtLYDURbGM
         09uJ1jOHVnK4qC+yN7reAQSd8OGhm+a0NFyEBh6+ZJraQXiiQKgnCmNu3V4jPuiukn+Q
         Jg/yWgp/4nSMZojb1v2LystSAq/gcb7daIMLd/klo8L2LSefKOFDp4Hc4c+jpPk1Joju
         HXOQ==
X-Gm-Message-State: AOJu0YwXPDcRtAkEE+dAbTaGnhD4UC1UwtACct87iMeG/XpcVJQlIbv4
	nMfYUsltb8x6Rg9/FN2Q14Rty8fEupy1Xy8IBxuuy+7hElXdsVoDz8X1Cs6kVg==
X-Gm-Gg: ASbGncsd2+mgxAXQlolqmacLbGYl8XeSIXAozFyXMMgUHcQcwDscZxp2GQt1WTZybBa
	7K0Kv3ttrozkPqquWWsy7/0vCOsZjY4M6H7dpMl/UBmtiaxtUa8fUngP5OPAxZqNSN8ZwOyUrAc
	8PheBXHaOUwfEBl3cxHFUUsDWp4jrP9Bbco5vA4bFB0XRMm9cXsf7uR01RaaHW2BdxkXG2KCcwV
	chF3T9D10Rw99yhf7Q6GZ3Tryz78LcAtmsPAECgmngxR4YXPwCBlwgXFyE883jMa4xu66bP8Jyq
	a08Zb+l9tuaspHs7J6IqE2H+QXs+a5OKsuEgNhDqMuhKDoh2MO/UpFWdhGBQrm7mB04KIqnF3F2
	+Mg+Sph9bwyVBMxjFBXwzErw/drRIHNc+SGYrxZ9P6qPl9IQW2j6tyLvP6HSZ9xfXy1SSp8kdJq
	c/+jdrfwptHOI4Ei440VH5YKC3tXq7
X-Google-Smtp-Source: AGHT+IFvVYOikpI3MYbtfDGKhjEKEcEGsFrdie65CSd4/QJEVojamkrr1UcGmhzQCpLiSZIhlNpcZA==
X-Received: by 2002:a05:600c:4e11:b0:46f:a8fd:c0dc with SMTP id 5b1f17b1804b1-4711721d566mr99875705e9.3.1760888375430;
        Sun, 19 Oct 2025 08:39:35 -0700 (PDT)
Received: from dani.lan (a109-51-235-13.cpe.netcabo.pt. [109.51.235.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed317c0sm94319345e9.3.2025.10.19.08.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:39:35 -0700 (PDT)
From: dani.barra25@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Daniel Andrade <dani.barra25@gmail.com>
Subject: [PATCH] Fstab xattrs: This update ensures that fstab xattrs are correctly updated without adding a lock to the database.
Date: Sun, 19 Oct 2025 16:39:18 +0100
Message-ID: <20251019153922.27208-2-dani.barra25@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251019153922.27208-1-dani.barra25@gmail.com>
References: <DDM7O4JOPS0Y.1YQP1AS47WNL7@bootlin.com>
 <20251019153922.27208-1-dani.barra25@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 21:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225089

From: Daniel Andrade <dani.barra25@gmail.com>

The process of repairing the database using -B flag of pseudo sometimes causes errors because the database lock file is present.
Therefore, to fix it, first we ensure that any connection to files.db is closed using pseudo flag -S followed by the actual command to
repair it after fstab was successfully updated.

Signed-off-by: Daniel Andrade <dani.barra25@gmail.com>
---
 scripts/lib/wic/partition.py             | 15 +--------------
 scripts/lib/wic/plugins/source/rootfs.py | 19 ++++++++++++++-----
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index bf2c34d594..82d754835c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -131,7 +131,7 @@ class Partition():
         partition command parameters.
         """
         self.updated_fstab_path = updated_fstab_path
-        if self.updated_fstab_path and not (self.fstype.startswith("ext") or self.fstype == "msdos"):
+        if self.updated_fstab_path:
             self.update_fstab_in_rootfs = True
 
         if not self.source:
@@ -295,15 +295,6 @@ class Partition():
             (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
-            debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
-            with open(debugfs_script_path, "w") as f:
-                f.write("cd etc\n")
-                f.write("rm fstab\n")
-                f.write("write %s fstab\n" % (self.updated_fstab_path))
-            debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
-            exec_native_cmd(debugfs_cmd, native_sysroot)
-
         mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
@@ -400,10 +391,6 @@ class Partition():
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
-        if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
-            mcopy_cmd = "mcopy -m -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
-            exec_native_cmd(mcopy_cmd, native_sysroot)
-
         chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
 
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index e29f3a4c2f..09446baef2 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -225,12 +225,21 @@ class RootfsPlugin(SourcePlugin):
                 fstab_path = os.path.join(new_rootfs, "etc/fstab")
                 # Assume that fstab should always be owned by root with fixed permissions
                 install_cmd = "install -m 0644 -p %s %s" % (part.updated_fstab_path, fstab_path)
+                exec_native_cmd(install_cmd, native_sysroot)
+ 
                 if new_pseudo:
-                    pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
-                else:
-                    pseudo = None
-                exec_native_cmd(install_cmd, native_sysroot, pseudo)
-
+                    pseudo_prefix = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
+                   
+                    # Shutdown any existing pseudo server
+                    # This ensures no other processes are using the database
+                    shutdown_cmd = "%s -S" % pseudo_prefix
+                    exec_native_cmd(shutdown_cmd, native_sysroot)
+                   
+                    # Database is not locked anymore
+                    # Repairs inodes related to fstab. This way xattrs and metadata is correctly applied to the new file
+                    repair_cmd = "%s -B" % pseudo_prefix
+                    exec_native_cmd(repair_cmd, native_sysroot)
+ 
         part.prepare_rootfs(cr_workdir, oe_builddir,
                             new_rootfs or part.rootfs_dir, native_sysroot,
                             pseudo_dir = new_pseudo or pseudo_dir)

