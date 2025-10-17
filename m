Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E9DCCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 11:19:20 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.12823.1760699907974442897
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 04:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgJU5gwb;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: dani.barra25@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b4539dddd99so307039966b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760699906; x=1761304706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lW/Z9UXrHf1RnxTK40Lc9/EHLMKq3zTg6veCwMonHSM=;
        b=DgJU5gwbzok5v2/1RK8LNyABUAqzEmkihVRxYfA/dloXAS0t+YEHvdnxipX1lvTM6b
         S8VI4e7ck8UNs/Wz70cOJgbum4e8fZZotCqTESTnxFC24dGFO0wYWXemI0KzP4T9ziUh
         dC9X1SBZEJ5c3WlITjPi3OqYvqgjX3tSfNtYKVIJO/00CtLkmchx1aZBtKfcaiuaBxGx
         ahEC4xa8ArwCAeTSOX9bfg5wZpHYedA1Opav894Y1fHqbZh/ACwRCXr6oaeGYEQ9uaDK
         VFRt4ZsKv2XnUk+NE58E6H1j/GoanaDEuUyMM6Q95uI1E56Xhuty9FWTcyKKBeDB82Bu
         OH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760699906; x=1761304706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lW/Z9UXrHf1RnxTK40Lc9/EHLMKq3zTg6veCwMonHSM=;
        b=pL8W8swbRhVzRDM0yyVX/xm6xMt1OyvYTxskH/bUzGGXIw0GknsV0p4H3voATbG8l4
         gz0LRRlk4gcr3iESCKrZnvbOPAve6Uepp5Bh87cFcw25nWwLbtLs11bsvaspaEiG0xeB
         5XVFaFWE6f5NU/hpFRkRUHURnKn9cnKPspBE9P5e38VLTIdLZmeZJaY4UlvOi2y/hbme
         jRg76KfNekFvqEStDQFxb3tyZhYasm/KYO7RGWbv3UaDm2H/Or2EEep+zFrWRVNdKycn
         DMCaFKqj8XjagX2DZ4wZ08DhmuCL7GmRi9b7dFxDnAAREP/FAl4AUqT44JSqb8uPMW5z
         GvCg==
X-Gm-Message-State: AOJu0YywSectpki5eMijARCeE57ym757iFxFf9kl/HlceY84eyOPgUv3
	I0NqfStPtB2BCzSKvmF0TEH5LecD4eysaKBaIm0vmCQajshssLLjfRM0z+muOHjM
X-Gm-Gg: ASbGncuKAiJS9HwTWrhhjfYx+XpiACwsJAHVoetn9hxqOSuLoJI1Y1JUwM2HC/2jO+X
	LROVcu58+CzX5LsHLwuaLN5mEvN6KKwg4c099BYuFoWOmVjElMV2viYTclihkdvcv+2hq0RIYw5
	i1TJzepT7xrmyDGljRlML5zDIGA0Z3BAy2TmVLbXffI2flK4I3mvPKIBoh0pJjNOvbJdCN+s+um
	hQVVbU6ROt58FKAIYLLMxg6g4vK0pRukvaeORc5yS+ZKIC5OoehE+JjFV+QoiYmH1dxpdLjG/6u
	6i6isDrUnTpGeuzIyzD3hIoLFvBxfm/MlRVBTu62Hp3LHcbkyO1AOlvaO5VmnkkTfJOWL1B0go6
	S1MXMIig4eY1n8mXLe/gPk007pF8ZB1KPG+VGUhxovkAdhXLUMgfpaI1OgRLTu3f+4CIvyLc7Jo
	spcXHatE0omgdNMMNKxLTc3xhL/q1csz7Joo+Psa9+G3WiEKgFsQ==
X-Google-Smtp-Source: AGHT+IH2Lm2UWOmp4z8VB9tclE63fM1dGzWvSnlVSXm4qTmKPaX3LpMyLOWViCJ/mH6svIGeg8YxuQ==
X-Received: by 2002:a05:6000:2087:b0:427:921:8985 with SMTP id ffacd0b85a97d-42709218a51mr769437f8f.40.1760699574406;
        Fri, 17 Oct 2025 04:12:54 -0700 (PDT)
Received: from dani.lan (a81-84-220-145.cpe.netcabo.pt. [81.84.220.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426e50ef821sm25855028f8f.38.2025.10.17.04.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:12:54 -0700 (PDT)
From: dani.barra25@gmail.com
To: openembedded-core@lists.openembedded.org,
	mathieu.dubois-briand@bootlin.com
Cc: Daniel Andrade <dani.barra25@gmail.com>
Subject: [PATCH 1/1] Fstab: Fix xattrs not being maintained on fstab file when using wic fstab update funtionalities
Date: Fri, 17 Oct 2025 12:04:16 +0100
Message-ID: <20251017111210.501333-2-dani.barra25@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017111210.501333-1-dani.barra25@gmail.com>
References: <DDFITTM4J8SO.13FKL48ZAQCD0@bootlin.com>
 <20251017111210.501333-1-dani.barra25@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225006

From: Daniel Andrade <dani.barra25@gmail.com>

The wic fstab generation capability was removing the xattrs of the /etc/fstab, possibly rendering the produced image unusable in some case (e.g.: SELinux enforced on a read-only rootfs).
The file appears as unlabeled no matter the fstype chosen.
To bypass this, some late procedures done on ext* and msdos fstype have been removed and all the fstab logic was passed to rootfs.py.
On this one, the idea is to still use the install command, but in this case, executed outside the pseudo environment. After the file as sucessfully been place, the idea was to check again for inconsistencies
in the database (now the fstab inode is different) and force it to rebuild with the correct inode, ensure fstab inode is correctly set on all the tables, including the xattrs one.

Signed-off-by: Daniel Andrade <dani.barra25@gmail.com>
---
 scripts/lib/wic/partition.py             | 15 +--------------
 scripts/lib/wic/plugins/source/rootfs.py |  8 ++++----
 2 files changed, 5 insertions(+), 18 deletions(-)

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
index e29f3a4c2f..c0d9a28b91 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -225,11 +225,11 @@ class RootfsPlugin(SourcePlugin):
                 fstab_path = os.path.join(new_rootfs, "etc/fstab")
                 # Assume that fstab should always be owned by root with fixed permissions
                 install_cmd = "install -m 0644 -p %s %s" % (part.updated_fstab_path, fstab_path)
+                exec_native_cmd(install_cmd, native_sysroot)
                 if new_pseudo:
-                    pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
-                else:
-                    pseudo = None
-                exec_native_cmd(install_cmd, native_sysroot, pseudo)
+                    pseudo_cmd = "%s -B " % (cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo))
+                    exec_native_cmd(pseudo_cmd, native_sysroot)
+
 
         part.prepare_rootfs(cr_workdir, oe_builddir,
                             new_rootfs or part.rootfs_dir, native_sysroot,

