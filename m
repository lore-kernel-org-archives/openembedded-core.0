Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF4E7EF47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 13:13:59 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id s49so30226686edb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f6UJHqhVm0QJr9ONiD+zsr/HSnkWiGvU/i0cOgBfkBs=;
	b=Adb5CoHxgXs14mE1MccWUyzg5mHhEcSAXt3GfHr0GiDqnhtFHApT92F10/WYBWQUuC
	ocyvJaWkW6p8/A0qqS7QpNswGJreYNhh6qHzcOJg8i66K6WpdmZm99JUMfIZmG+HkN1B
	KNLLO6a1k5Re33CdhNpvhyb93Ne2nQ/KhQDqMiWVrI1lg5Z+jokndkJizVhmVsfHT+2+
	uES86uhGTnuXSRlv2I9RsUYZV/hFJrCO0dQK+0MqSPsLR2cx9ty5QaYp3Bue9YjKY99z
	f2q4zgfwDPa27dyJSoRUzc9pEwRgC69LlvlSfUvND3WyO5quuagyzUuQPWzQjJqn/1Gb
	iPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=f6UJHqhVm0QJr9ONiD+zsr/HSnkWiGvU/i0cOgBfkBs=;
	b=f9DKl/ri2GmcGDG7HksonsXinfdQ1ynrNMQ46y+WVe0ij6XS3t0CWolwtuOztPCROe
	+shIQPYTl5yMivI2rNT61cLX7M2x/UWSOOi/WeKQjajXax3ysK+vj2sC2U3USw9bRseK
	OkvsGJiWP7dnlUFmpHPnguqvQOZUoTCC4hI/7DLeG/vUzXhecTO5/L3qReLQfJasK5RB
	PF08oku8r1Lp26VDt2QuvAsKJoyhrBr91ObO2zNHvfY1CcecuHE3e3ihKNQJUC4T86cS
	1Ei9F4HzhJ/EXcDH6yucdHM4IJXMmCH2IUlT6o9X77ITt7Go9/c3eUOmESJfz6wJizSs
	/Z9w==
X-Gm-Message-State: APjAAAWxkl5VlN2A0o7MqXEvt2igEHIjX8MJSnS8xPR4dZceDhf+DqTs
	PPdCpd5bfaByRQLUwHT9KgvusLjNesM=
X-Google-Smtp-Source: APXvYqxddLLV2WSbygnT2KJdEpvN/4C7tfHvlMsfUSD6glhxO/tnGJIDkFDx7hHCfcq2yzRjN/eQew==
X-Received: by 2002:a17:906:2ecc:: with SMTP id
	s12mr35870949eji.110.1563455640301; 
	Thu, 18 Jul 2019 06:14:00 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id z9sm7998306edd.53.2019.07.18.06.13.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 06:13:58 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 15:13:56 +0200
Message-Id: <20190718131356.6937-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] wic: Fix (again) partition files UIDs on multi rootfs images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jul 2019 13:14:00 -0000
Content-Transfer-Encoding: 8bit

Commit 450335ba5e73a375eb9932b4c4cf37979640dbfc copies the pseudo
database to the working directory in order to have ownership information
when the filesystem is generated.

Unfortunately this does not work anymore. The filenames on the database
are absolute and there is no information about the new directory.

Instead of fixing the database, we could redo a bit the way we patch the
fstab file. Now I am saving the old contents of fstab, modifying the
file and then reverting the changes on exit.

This is faster than the previous approach, although it can cause
indeterminism if the application is killed before finishing.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 37 ++++++++----------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 67addeff3e..91fc5e70f6 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -49,7 +49,6 @@ class DirectPlugin(ImagerPlugin):
 
         # parse possible 'rootfs=name' items
         self.rootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
-        self.replaced_rootfs_paths = {}
         self.bootimg_dir = bootimg_dir
         self.kernel_dir = kernel_dir
         self.native_sysroot = native_sysroot
@@ -59,6 +58,7 @@ class DirectPlugin(ImagerPlugin):
         self.compressor = options.compressor
         self.bmap = options.bmap
         self.no_fstab_update = options.no_fstab_update
+        self.original_fstab = None
 
         self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
                                strftime("%Y%m%d%H%M"))
@@ -104,24 +104,13 @@ class DirectPlugin(ImagerPlugin):
 
         with open(fstab_path) as fstab:
             fstab_lines = fstab.readlines()
+            self.original_fstab = fstab_lines.copy()
 
         if self._update_fstab(fstab_lines, self.parts):
-            # copy rootfs dir to workdir to update fstab
-            # as rootfs can be used by other tasks and can't be modified
-            new_pseudo = os.path.realpath(os.path.join(self.workdir, "pseudo"))
-            from_dir = os.path.join(os.path.join(image_rootfs, ".."), "pseudo")
-            from_dir = os.path.realpath(from_dir)
-            copyhardlinktree(from_dir, new_pseudo)
-            new_rootfs = os.path.realpath(os.path.join(self.workdir, "rootfs_copy"))
-            copyhardlinktree(image_rootfs, new_rootfs)
-            fstab_path = os.path.join(new_rootfs, 'etc/fstab')
-
-            os.unlink(fstab_path)
-
             with open(fstab_path, "w") as fstab:
                 fstab.writelines(fstab_lines)
-
-            return new_rootfs
+        else:
+            self.original_fstab = None
 
     def _update_fstab(self, fstab_lines, parts):
         """Assume partition order same as in wks"""
@@ -170,14 +159,8 @@ class DirectPlugin(ImagerPlugin):
         filesystems from the artifacts directly and combine them into
         a partitioned image.
         """
-        if self.no_fstab_update:
-            new_rootfs = None
-        else:
-            new_rootfs = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
-        if new_rootfs:
-            # rootfs was copied to update fstab
-            self.replaced_rootfs_paths[new_rootfs] = self.rootfs_dir['ROOTFS_DIR']
-            self.rootfs_dir['ROOTFS_DIR'] = new_rootfs
+        if not self.no_fstab_update:
+            self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         for part in self.parts:
             # get rootfs size from bitbake variable if it's not set in .ks file
@@ -253,8 +236,6 @@ class DirectPlugin(ImagerPlugin):
             else:
                 suffix = '["%s"]:' % (part.mountpoint or part.label)
             rootdir = part.rootfs_dir
-            if rootdir in self.replaced_rootfs_paths:
-                rootdir = self.replaced_rootfs_paths[rootdir]
             msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), rootdir)
 
         msg += '  BOOTIMG_DIR:                  %s\n' % self.bootimg_dir
@@ -292,6 +273,12 @@ class DirectPlugin(ImagerPlugin):
             if os.path.isfile(path):
                 shutil.move(path, os.path.join(self.outdir, fname))
 
+        #Restore original fstab
+        if self.original_fstab:
+            fstab_path = self.rootfs_dir.get("ROOTFS_DIR") + "/etc/fstab"
+            with open(fstab_path, "w") as fstab:
+                fstab.writelines(self.original_fstab)
+
         # remove work directory
         shutil.rmtree(self.workdir, ignore_errors=True)
 
-- 
2.20.1


