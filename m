Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF264D41163
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:14:42 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32415.1768472077571564264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Q2nbcKjA;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.46, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6505d1420daso93067a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768472076; x=1769076876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/+AV/zXln/QnECKSwHy4iuUjEmpKREEs/qjLDqP/T0=;
        b=Q2nbcKjA6h+Twx3aGqhu8B+vNAHSoWgUjr3XodMXd4CQ8UuDnPetzGfUFAOgzqFkIM
         ne1T/ZBXnTj1tYnje63LVD1Kfg+/5GKQr863ZA5LxyPoIEBO5ICFnyS8V55ltW7HPuA1
         4bK8N7GOCyK+O2mGH3tBzcP1wUA+A+T3Ed19k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472076; x=1769076876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/+AV/zXln/QnECKSwHy4iuUjEmpKREEs/qjLDqP/T0=;
        b=ZG7aq+5gn0I+HgdwedC+soW+jGpCH7oR3O69UMlE+zSvcyXiCqIcjT7/zSOt+Q7nj9
         L/+IgxZ6YRCUvqZMx3vkEEo60lW32a8fb2e4uYsTc6layk0knjuGwC/687M76aRG4b+6
         wVFi99v7fLX9Vx0JsnlZm1p3byxaMVW7ks5XhofOMcrf/u4P+E1qUd03c8Bqv8WSFkkJ
         arbc7YSfUmJs3yunT1ZfTSD4TMCAnCUPzAPTjSCsqsMRzYSVSDq6/9zxq7J+DD/2AcsF
         ALIcPmsBFdmnl/KPXvyODKhNBg9GxU7dPpPNyGF4Xa4Spe1kJNDp05H/c+HTBs/3eJvS
         K6lw==
X-Gm-Message-State: AOJu0Yz3cWsQfGNt4IJHuY97LDXzrtIqjrabSgf9MsSpKzsxK6a+TQth
	fP2DR6e+ECxYTAkWwDbkqfj8VLp+z8oriEIPqz/ulu0QxfGvUUSjZFx5yFSUpGSVJuKoSSugcYG
	UukXZ
X-Gm-Gg: AY/fxX5LUcdJKHJDmFZp6RQfsOV9R834QbNwt9e04DBPZVEWipdCjQfZzZuD70veslM
	C3x6xEkyd1C9EV4bNHfHgwQAmbgDanjqdg/7Ng36Z9G9aYNPfNyQ5d3/PDGzJ1u5u8xCau+bUKH
	JELqYTBpW83xItyMf8VjGWmHJZm3wmnDJ7ikENQY6PRw8zen8Vd+ZcjnUExUK2LJT4oUNgCDp+X
	XpDs80f7j4OFNUmPwKOcgCQsZB/SgluGo4JTTQzgWt9ogNkZH5inxDXJDbgakZAFveAgSUfW/6A
	U2Lw/1QHa51hdPrzDNI55zgBI+vlxnxXv+XPktW6cZb8zv8TQaeXdRz3vebkLP+tuvM6qL392wv
	Fm6elLcqMhc+KdooE2CNvUYLJTWYVQN6BwGrkDsBDI0i6rzvEttn+GbZCUeHXu4t3hvyOkAvD4y
	SG3AxvD2mPCyJMhkMsrBaTr1qVKPic9WVW7WLngtL7r/mdNy4sVOcKHtf7ZqAjvtqnX+WB02vs3
	Zm01FC1jnribhQhhDQPMa2ylfXR2miLGjPRaT24uEuEqazFZeIA+RFPIeiiSrsqvIva
X-Received: by 2002:a05:6402:1ed6:b0:64d:1bbf:9548 with SMTP id 4fb4d7f45d1cf-653ec46eccemr2637656a12.6.1768472075958;
        Thu, 15 Jan 2026 02:14:35 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6541209cd87sm2038643a12.35.2026.01.15.02.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:14:35 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 2/6] wic: extra-partition: Move extra file parsing to a dedicated method
Date: Thu, 15 Jan 2026 11:14:28 +0100
Message-ID: <20260115101432.162696-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
References: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 10:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229400

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


