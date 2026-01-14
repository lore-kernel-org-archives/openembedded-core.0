Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D4ED31A38
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:10:56 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13886.1768407046646248476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 08:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=ogVqVC0t;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8773fcff60so5021766b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 08:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768407045; x=1769011845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/+AV/zXln/QnECKSwHy4iuUjEmpKREEs/qjLDqP/T0=;
        b=ogVqVC0txGF553xJtJq8Es5FI+EeWqrB4zoyFILUiYDsri5u9Xb1F6NFQfa6QbEf4B
         e8ZzxiAgXKx282vvHXfxMR7JgPGJB0FRTzALJ9qoQl9Eqj7dB4JhF0IFc3CjVYwXgcOc
         pAauuAKuBIMlKUXg0qCDyMGq/mE+id3LsXtrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407045; x=1769011845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/+AV/zXln/QnECKSwHy4iuUjEmpKREEs/qjLDqP/T0=;
        b=cIrSGTu6C57BMje9Q621DvOMioShyGsqwWP8CH9xO0PwcNg9vtVE7s8KpsYsHjo+Cl
         91t+oLHGi8/VdOH8BxntJzxQBlx2NanAM8gRBLeqSwGRLcV2I9hIW/NokihAJnZcfOwX
         rDo6sIXJ+gqVTdUS7+JQcwjcWSKS4qIxQjiAm/8UMtB6LpnMQCPJoLrJclh0zd1us65d
         tD8x+rbdRKmcNpylVj1NIsgLvMjVDN9SFHYvnGWgHh67qtIyO7PaITrOl/qqvU0K6W/1
         M/r9Wu/HNDi4XDqpdoANXNrdzBDcrWMVOv6iWUtXZFMkrbFoqoUdSrjXkjiYuyTFU7W3
         lorQ==
X-Gm-Message-State: AOJu0YxqnXJ8kW1PkR40r9HB1xkw1A323OjHy5ueTIalTt7Ao1Or/eOm
	t0Ha3rGWysDvnLBzZromUcBheddhHYZX4AenrzaGIR6vIzRVxt6wHGMdnnFDTQ85wcAr4+8MsGC
	NGCqX
X-Gm-Gg: AY/fxX7XVHL1DeXAbmMiAvrOUcVFhlwGES8grZVe1HLtonVy37suqR18XI4Xco20Ykd
	VUYbI9RRzzXQI/JWE1hxHAB3JfmIMd1psAikuIy7FU9UubBnKVCljXEylpWOsrVD5OAKI7adTPC
	HY80fE7T1wKk5Mis3MgsKsm6aAGn+YZU9dIOgmGxbLDpW2jjG66+FEQhZURU0n7Ow5g4/M7Ptak
	ZMRCAPckzu8yjuf/AhYrHyeIUvI9tRgMUeh3Fc/1JR8hyFV/9JwytQIcPWecCUXrn1PLheV6h0O
	/V7sFvHyBa5H0XKroccqxUXz8JHU45l/EXeAKtEMszwfg0JZyl3rY14u67L2sD/57uYFsc7GdVn
	QDi4oZEd1jDIls2QZqVykgb4mUcFr18DSYj9DryzyqEpbOPHCeZ59fyNs/VSZ7iB9k0fe/1KWFt
	cJrJxE1SA3nNmnmWo43qtoxtN3kEfjXmFh1VJ09rh42IfvDZkbOgAat0ICRU3tDnkX72XOfJEgF
	EvHWW0bMDXxMETnSMi0C6Sf3sGgj8Tf10oPjdefshN/3VemzIAcZH2Tk+kailw=
X-Received: by 2002:a17:907:e98a:b0:b87:6a6:5fc2 with SMTP id a640c23a62f3a-b87612c8dc2mr141284766b.5.1768407044851;
        Wed, 14 Jan 2026 08:10:44 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1449566866b.2.2026.01.14.08.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:10:44 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 2/6] wic: extra-partition: Move extra file parsing to a dedicated method
Date: Wed, 14 Jan 2026 17:10:36 +0100
Message-ID: <20260114161040.941159-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
References: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 16:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229348

For organizational purposes, and to make the following patches
easier to follow, move the extra file parsing to a dedicated
method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../lib/wic/plugins/source/extra_partition.py | 35 +++++++++++--------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index a1d9aa9a7b..aa4fb931c2 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -37,20 +37,11 @@ class ExtraPartitionPlugin(SourcePlugin):
     image_extra_partition_files_var_name = 'IMAGE_EXTRA_PARTITION_FILES'
 
     @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             native_sysroot):
+    def _parse_extra_files(cls, part, kernel_dir):
         """
-        Called before do_prepare_partition(), list the files to copy
+        Parse the files of which to copy.
         """
-        extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
-        install_cmd = "install -d %s" % extradir
-        exec_cmd(install_cmd)
-
-        if not kernel_dir:
-            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not kernel_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+        deploy_files = []
 
         extra_files = None
         for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), ("_part-name-%s", part.part_name), (None, None)):
@@ -66,9 +57,6 @@ class ExtraPartitionPlugin(SourcePlugin):
             raise WicError('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
 
         logger.info('Extra files: %s', extra_files)
-
-        # list of tuples (src_name, dst_name)
-        deploy_files = []
         for src_entry in re.findall(r'[\w;\-./*]+', extra_files):
             if ';' in src_entry:
                 dst_entry = tuple(src_entry.split(';'))
@@ -103,6 +91,23 @@ class ExtraPartitionPlugin(SourcePlugin):
             else:
                 cls.install_task.append((src, dst))
 
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
+        cls._parse_extra_files(part, kernel_dir)
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
-- 
2.52.0


