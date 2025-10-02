Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B76CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:45:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.10575.1759416338948488948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 07:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iGGgSded;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-414f48bd785so692477f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759416337; x=1760021137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NbHZYanMbSZ9B1uQRgIaQ8vh4eB15MR5K7NJaRUpxM=;
        b=iGGgSdedBkcgvVOEhsr5mn/1ytrjUtvBlYYFKL8ABnb+X/0sICzl1pI/4NSn1mcS9V
         1k2W0sQVdameNGPBCqzaYBGW9pumnG91go9VMNFd42uWC29lNEiR/o/ND/krMY51yyMp
         rae6TglOObc3q7oNnAhOWmYIGsPOBED/w4dZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416337; x=1760021137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NbHZYanMbSZ9B1uQRgIaQ8vh4eB15MR5K7NJaRUpxM=;
        b=wmaQB+r8oU2JovNHvQkcShA7XQsIx2rAjLBi/1AuKuIRW1Lyi5sTMQxZtcxVslRtsv
         VBsNFo1d9NdrRh1aYI2dsx6aT7ZqXBMUj0BEXcLmeexlVxN/WF5fEUELq+uD7HEDzAqv
         4bb1JJBNVzMkXwV1aAep6RX+Z92MWyxXEWh3N9LGFZEIQDtkU/LWwPa312Cnd6DQPrd5
         A9IRaDRkW/1mifsoiihsfNbxi3SKkwGuxinPWpiLtnXUj8UWnnf/gzHA4/BS+GhlRYm+
         OVBg+dM6PuIWWXdj5vL9XeLf3GfWvym/PMm+/6YhKkawUS1xnVgR/SB1DS3AD5kiTMTa
         S+5g==
X-Gm-Message-State: AOJu0YzJ0/BhHfIRugJrHQRV4LOedC5Y9Ouzv6D3A/0YUcMQ8tWyEHWt
	mzFAsM0dP6cCUhN2yRBw5Q7lXpGeSlvP6YXQJYn7T/4w8iNHCSrobykeBsM9iJoRfpipwVw6HPx
	uWh+u
X-Gm-Gg: ASbGnctKaVuk+G50xUq33yCG6qLc4wMWlcSrBbVNfhRAY5jZb3HRP1x62EHBmRbQ21d
	P2XiJnS1UCcyRjcZRpnGmk90Wa32lBcMqhVYgrGhR+wqtcWMwVtdkoYErykVLVr9CWEG4YbiPtC
	5KgXGGq1lUUZAuh043mzwkyY4T9x7eBSNg6yvtW/nTtB+iMODp6P8jCE3/uMb0lkteWfFlbQ6AT
	hOsVC/5SzTMjwkWko1HhuuV8biSHO3fmaLzwk5I9DLPCoWFm7z2+0iwgXiVphHmFsNpGVkPs1J2
	VSl7X37x349igcbLE+zr3XkJqv50ldEuj+WgrUdUZVYOVyoBl4BAqDtXCTA6LmKHLNZWfzhTVyk
	dcLIjCV48HCrrUnXpTDuBMSJYYmj6YQlyfTqRYhvI+C7FqjCqS34+c4w0ZTNiJEwxvxHlu8c=
X-Google-Smtp-Source: AGHT+IHEwBMqx43DktYwqP4y48mvzUVxHOQ1ADIYCAtIuphF638jLWYp6prpZxB5g6Wo93COSqVEsw==
X-Received: by 2002:a05:6000:1acd:b0:3ec:a019:3944 with SMTP id ffacd0b85a97d-4255781adabmr5271315f8f.43.1759416337236;
        Thu, 02 Oct 2025 07:45:37 -0700 (PDT)
Received: from FRSMI24-BLUE.example.com ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3938152f8f.13.2025.10.02.07.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:45:37 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH v4 1/1] wic: extra partition plugin
Date: Thu,  2 Oct 2025 16:45:34 +0200
Message-Id: <20251002144534.160791-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002144534.160791-1-pierre-loup.gosse@smile.fr>
References: <20251002144534.160791-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 14:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224362

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

The extra_partition plugin allows populating an extra partition with
files listed in the new IMAGE_EXTRA_PARTITION_FILES variable. The
implementation is similar to the bootimg_partition plugin.

This plugin provides an easy way to install files that are not part of
the rootfs, from the deploy directory.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
---
changes in v2:
- missing signed-off-by
- typo
- assertion message

changes in v3:
- fix WIC test_image_env

changes in v4:
- renaming IMAGE_EXTRA_FILES to IMAGE_EXTRA_PARTITION_FILES
---
 meta/classes-recipe/image_types_wic.bbclass   |   1 +
 meta/lib/oeqa/selftest/cases/wic.py           |  43 +++++-
 .../lib/wic/plugins/source/extra_partition.py | 134 ++++++++++++++++++
 3 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/wic/plugins/source/extra_partition.py

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 6180874a4c..675aa97513 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -17,6 +17,7 @@ WICVARS ?= "\
 	IMAGE_BOOT_FILES \
 	IMAGE_CLASSES \
 	IMAGE_EFI_BOOT_FILES \
+	IMAGE_EXTRA_PARTITION_FILES \
 	IMAGE_LINK_NAME \
 	IMAGE_ROOTFS \
 	IMGDEPLOYDIR \
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b1c318bd4e..e7e5dcb7e7 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -18,6 +18,7 @@ from glob import glob
 from shutil import rmtree, copy
 from tempfile import NamedTemporaryFile
 from tempfile import TemporaryDirectory
+from textwrap import dedent
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
@@ -1021,7 +1022,7 @@ class Wic2(WicTestCase):
         wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
                                       'INITRD', 'INITRD_LIVE', 'ISODIR','INITRAMFS_IMAGE',
                                       'INITRAMFS_IMAGE_BUNDLE', 'INITRAMFS_LINK_NAME',
-                                      'APPEND', 'IMAGE_EFI_BOOT_FILES'))
+                                      'APPEND', 'IMAGE_EFI_BOOT_FILES', 'IMAGE_EXTRA_PARTITION_FILES'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
             # test if variables used by wic present in the .env file
@@ -1647,6 +1648,46 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
 
+    def test_extra_partition_plugin(self):
+        """Test extra partition plugin"""
+        config = dedent("""\
+        IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
+        IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
+        IMAGE_EXTRA_PARTITION_FILES = "foo/*"
+        WICVARS:append = "\
+            IMAGE_EXTRA_PARTITION_FILES_label-foo \
+            IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
+        "
+        """)
+        self.append_config(config)
+
+        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
+
+        testfile = open(os.path.join(deploy_dir, "bar.conf"), "w")
+        testfile.write("test")
+        testfile.close()
+
+        os.mkdir(os.path.join(deploy_dir, "foo"))
+        testfile = open(os.path.join(deploy_dir, "foo", "bar.conf"), "w")
+        testfile.write("test")
+        testfile.close()
+
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(['part / --source extra_partition --ondisk sda --fstype=ext4 --label foo --align 4 --size 5M\n',
+                            'part / --source extra_partition --ondisk sda --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
+                            'part / --source extra_partition --ondisk sda --fstype=ext4 --label bar --align 4 --size 5M\n'])
+            wks.flush()
+            _, wicimg = self._get_wic(wks.name)
+
+            result = runCmd("wic ls %s | wc -l" % wicimg)
+            self.assertEqual('4', result.output, msg="Expect 3 partitions, not %s" % result.output)
+
+            for part, file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):
+                result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, file))
+                self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (file, part))
+
+        self.remove_config(config)
+
     def test_fs_types(self):
         """Test filesystem types for empty and not empty partitions"""
         img = 'core-image-minimal'
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
new file mode 100644
index 0000000000..d370b0107e
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -0,0 +1,134 @@
+import logging
+import os
+import re
+
+from glob import glob
+
+from wic import WicError
+from wic.pluginbase import SourcePlugin
+from wic.misc import exec_cmd, get_bitbake_var
+
+logger = logging.getLogger('wic')
+
+class ExtraPartitionPlugin(SourcePlugin):
+    """
+    Populates an extra partition with files listed in the IMAGE_EXTRA_PARTITION_FILES
+    BitBake variable. Files should be deployed to the DEPLOY_DIR_IMAGE directory.
+
+    The plugin supports:
+    - Glob pattern matching for file selection.
+    - File renaming.
+    - Suffixes to specify the target partition (by label, UUID, or partname),
+      enabling multiple extra partitions to coexist.
+
+    For example:
+
+        IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
+        IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
+        IMAGE_EXTRA_PARTITION_FILES = "foo/*"
+        WICVARS:append = "\
+            IMAGE_EXTRA_PARTITION_FILES_label-foo \
+            IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
+        "
+
+    """
+
+    name = 'extra_partition'
+    image_extra_partition_files_var_name = 'IMAGE_EXTRA_PARTITION_FILES'
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             native_sysroot):
+        """
+        Called before do_prepare_partition(), list the files to copy
+        """
+        extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
+        install_cmd = "install -d %s" % extradir
+        exec_cmd(install_cmd)
+
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+        extra_files = None
+        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
+            if fmt:
+                var = fmt % id
+            else:
+                var = ""
+            extra_files = get_bitbake_var(cls.image_extra_partition_files_var_name + var)
+            if extra_files is not None:
+                break
+
+        if extra_files is None:
+            raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
+
+        logger.info('Extra files: %s', extra_files)
+
+        # list of tuples (src_name, dst_name)
+        deploy_files = []
+        for src_entry in re.findall(r'[\w;\-\./\*]+', extra_files):
+            if ';' in src_entry:
+                dst_entry = tuple(src_entry.split(';'))
+                if not dst_entry[0] or not dst_entry[1]:
+                    raise WicError('Malformed extra file entry: %s' % src_entry)
+            else:
+                dst_entry = (src_entry, src_entry)
+
+            logger.debug('Destination entry: %r', dst_entry)
+            deploy_files.append(dst_entry)
+
+        cls.install_task = [];
+        for deploy_entry in deploy_files:
+            src, dst = deploy_entry
+            if '*' in src:
+                # by default install files under their basename
+                entry_name_fn = os.path.basename
+                if dst != src:
+                    # unless a target name was given, then treat name
+                    # as a directory and append a basename
+                    entry_name_fn = lambda name: \
+                                    os.path.join(dst,
+                                                 os.path.basename(name))
+
+                srcs = glob(os.path.join(kernel_dir, src))
+
+                logger.debug('Globbed sources: %s', ', '.join(srcs))
+                for entry in srcs:
+                    src = os.path.relpath(entry, kernel_dir)
+                    entry_dst_name = entry_name_fn(entry)
+                    cls.install_task.append((src, entry_dst_name))
+            else:
+                cls.install_task.append((src, dst))
+
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, we copies all files listed in IMAGE_EXTRA_PARTITION_FILES variable.
+        """
+        extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
+
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+        for task in cls.install_task:
+            src_path, dst_path = task
+            logger.debug('Install %s as %s', src_path, dst_path)
+            install_cmd = "install -m 0644 -D %s %s" \
+                          % (os.path.join(kernel_dir, src_path),
+                             os.path.join(extradir, dst_path))
+            exec_cmd(install_cmd)
+
+        logger.debug('Prepare extra partition using rootfs in %s', extradir)
+        part.prepare_rootfs(cr_workdir, oe_builddir, extradir,
+                            native_sysroot, False)
+
-- 
2.34.1


