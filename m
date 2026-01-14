Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52223D38FE4
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:10:56 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13866.1768407048994858587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 08:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=d6lyKF1l;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.49, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b87174fbacdso67664566b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 08:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768407047; x=1769011847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g1I+HWZAJNoikmyeM5ze9veBb/o99obUBwPzr3ySdI=;
        b=d6lyKF1lFuXsBdFzDhwlknvsJgf4pbuZdQQl9np8pdeVWSkakLy+sCwSQ710qGKhz3
         LjSsN0tjwq58YvY/+FSaEzHa4O0ZZNEvuzebUEYWVzRQYIxCFVFvuBaRTWMAYMJ60Z8F
         xar0MAa1hcA3fRSmtYebr9YvPZ30MssqUWu7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407047; x=1769011847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2g1I+HWZAJNoikmyeM5ze9veBb/o99obUBwPzr3ySdI=;
        b=Sof+4VvBgOh04wIKXEag6G19pABCjuP9CZ1u9t1xMdMa3JZVz/F4oY70Fx5+tfdPF/
         KMNU7c3kLJsbetm2yQaZBD8wPR/V6wkxHNe7VqMibIuuvB/CoTJizYtrWu5pqcUtXNmf
         Cn32lHENvNFJA/GWfpxZWp0m58eS2gX5hfMZcpw2a0DeXQ8DEd3fJHA1FLcTyV7AKW6s
         izQSWyEC2gvReKAud3X8j2rBN+GkZC1zY+jwoTjUXaX3s0qpCh15qLh62J6BE86D9XTZ
         Gz8ZtpV0sqzziST6S6In475ZYdD5iqu5ceECeBDl+24i8u5kZ74TzaCtUlldujn2iANh
         pemA==
X-Gm-Message-State: AOJu0YxQPfccHDjwcLpF9wx8ThvN4QPgFWXpe+mODbN08dAHmU+KpdrY
	hW56lndKcn2WXY8Wvt4IrSh+Zz0TY+NeHWxF+AQDmhHcfLIP+OJvfbfl0BN7l5akNouvcqymKuA
	qaUeb
X-Gm-Gg: AY/fxX5I3HXdy11xoi+2ZnJ5JcQdKhruhO1o2ajvyk+h08mjro6G5kqaiP6zCloM/bm
	3cDIfdN9WuHONkQHcDRs0l57m4gZEzBkFaLFQoWrWa1puj+ZLyhXl/shO+Y152z1uLsgskDYixd
	QvwkTPvSOzhGtr4CBr380sl49Mn+IEWxjE4GPKQ6TkOULByG3F7r8vIEizN9FmrxtRNK+zZuvXl
	FAwhGArqAXE3s1SxERsAuqTP30SxllgFrTdt/n3BxNIu5lKPILbRMesXQFhRbIwCBkK0qB3en6h
	DcDAbEmiGePpzT8yKVk2n0oAnXYz/mpMPGB121iPQJ8irPCicjCA/Jy7l62hQqXpvREFlpY8mze
	4tGfkjhhrWzpGHE4JIJJXJ1Z3RKRD3ryzKNbkkcxcBHpyDXnOePioae1ZQkXqnvDz2bWCy+dz+W
	60P3Gs+PGQSVbd9SHE8cftq91TOh6dNnf+lRft9Y9jAAmXHRk3cK9J780mKIf2f9Eutixo8pGKJ
	41f1V8VVUVNTkt/U5BU5WKOoN4yaU7PYPMVVepiJx2VTGc4WFP8Lnl1vO9LGcc=
X-Received: by 2002:a17:906:fd81:b0:b87:1c20:7c5a with SMTP id a640c23a62f3a-b87612d8c3bmr195972866b.8.1768407047266;
        Wed, 14 Jan 2026 08:10:47 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1449566866b.2.2026.01.14.08.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:10:46 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 5/6] wic: extra-partitions: Make extra-files optional
Date: Wed, 14 Jan 2026 17:10:39 +0100
Message-ID: <20260114161040.941159-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
References: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 16:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229351

There are many use cases where a user may need a blank partition of a given
size and format with no extra files added. Such as an empty data partition.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: If the list is blank, print a warning instead of an info.

 meta/lib/oeqa/selftest/cases/wic.py           | 10 ++++++++++
 .../lib/wic/plugins/source/extra_partition.py | 20 ++++++++++---------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d7a9b14658..33a6460677 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1698,6 +1698,16 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
 
             self.remove_config(config)
 
+            # Test with a blank formatted partition of 5M with no extra files
+            with NamedTemporaryFile("w", suffix=".wks") as wks:
+                wks.writelines(['part / --source extra_partition --ondisk sda --fstype=ext4 --label foo --align 4 --size 5M\n'])
+                wks.flush()
+                _, wicimg = self._get_wic(wks.name)
+
+                cmd = "wic ls %s | wc -l" % wicimg
+                result = runCmd(cmd)
+                self.assertEqual('2', result.output, msg="Expect 1 partition, not %s" % result.output)
+
         finally:
             os.environ['PATH'] = oldpath
 
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index 25aab06c52..3fcf3971a8 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -55,11 +55,13 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         Parse the files of which to copy.
         """
+        cls.extra_files_task = []
         deploy_files = []
 
         extra_files = cls._get_extra_vars(part, cls.image_extra_partition_files_var_name)
         if extra_files is None:
-            raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
+            logger.warning('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
+            return
 
         logger.info('Extra files: %s', extra_files)
         for src_entry in re.findall(r'[\w;\-./*]+', extra_files):
@@ -73,7 +75,6 @@ class ExtraPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.extra_files_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
@@ -130,13 +131,14 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-        for task in cls.extra_files_task:
-            src_path, dst_path = task
-            logger.debug('Install %s as %s', src_path, dst_path)
-            install_cmd = "install -m 0644 -D %s %s" \
-                          % (os.path.join(kernel_dir, src_path),
-                             os.path.join(extradir, dst_path))
-            exec_cmd(install_cmd)
+        if cls.extra_files_task:
+            for task in cls.extra_files_task:
+                src_path, dst_path = task
+                logger.debug('Install %s as %s', src_path, dst_path)
+                install_cmd = "install -m 0644 -D %s %s" \
+                              % (os.path.join(kernel_dir, src_path),
+                                 os.path.join(extradir, dst_path))
+                exec_cmd(install_cmd)
 
         logger.debug('Prepare extra partition using rootfs in %s', extradir)
         part.prepare_rootfs(cr_workdir, oe_builddir, extradir,
-- 
2.52.0


