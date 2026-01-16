Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B86D4A61E
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:32:25 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2430.1768555943344694611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=bc5ZC8bG;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.41, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b873a14bb99so31382266b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768555942; x=1769160742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S99T4vgAePKPALbCfmoILnJKJ1GE7hrHgy0gSJZsklg=;
        b=bc5ZC8bGIo9MsYE2A1CD734eRU8GKk/HQrGVmdsycNoyso3jjozD5AJI/m7rVAXCjn
         mmPOPyg8BsupbqhBnmhU4/VYSLVb9LUQENMtBr/Px5Rl7u5x1HTCTtyVaMF6uh7gaNbr
         JYg0jtm87bhzTIR0iwPf79zIhrKo6XA6rQIeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555942; x=1769160742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S99T4vgAePKPALbCfmoILnJKJ1GE7hrHgy0gSJZsklg=;
        b=tOr/1CzxJwER+2dLHmu1/WgbIUF6GCLMCrl2yC0RAs34DLusdrdCrx8IGGG4HUnAZA
         9qXEFn+e6VG+dtDvypMbUFBZ6YNJ/MWs+QYnWGrXEoBzjJZfnwEfpEGIEr6vaLioKXrT
         wY+fPMLiQDNsMFF7P+Z0zC5WNXU3W4pFRsR/VjxJ2UKU36NPK3jEhjEYyR7rgWRZA5y+
         Zv2OP0MeBuHiC9iPb1MYfDK14VMc7PbUIPV0ZSOsdmKxMBWcth9fAvz2S/trXW5Pp2wB
         k9F9uXa8ifn/135XmMwVOdp4T0MtUTnSQZ1mIjNWxKc4Ub4EvKPVBB9laybX65GSpql0
         5+uA==
X-Gm-Message-State: AOJu0YzvmxTZKGHp00cgRWwHlGpFVy3TuK5TT8hnZiPM6uuCKF6T6O+h
	hQtaf4ddP0abvb/hJ9dqUdXYiSXs7sXA00wiMJTNpj+LedjuLzbDBAc4ChKLUYrPcUh7R0aGh+e
	qz6Bh
X-Gm-Gg: AY/fxX5mvPxQ8ycSunQtsLe1gZmkE8aT3aRPp7GJXQlKrl8O9OeVmNUb8H70IE2dxCg
	OKxZvP/4A1NCiYTW3rO9OoSFa963b1OlTiSzamooEly/Olrm2Z5UNjaBH9BRbOIj2kYgOWgQPb0
	IBdyZuMYdLTYeKY8IzcRAswXJZq6XvuRejtMDovsWNK+3vkRKEHe4xS1/HVvEQE6k+tTHSCe9/k
	FMwVmlMc+ogPg6sud8m6tjOylDLvIonvWLW7fFm6puuVKJqmvN2j7kpWG5aqGuROOXnEsJzrH4X
	CjfWi6lsW1b3Gj30UAWHBZO/K9ngSWbBaap7obbCGdeV/hPGcFYIbYwuKdiXD3hOKkZE+KtPx+J
	+fVvlYkVjbkiMm988ISaw6D0qZCb1XMRYJ4JzWQFsCp7M0FsGYogDLfGrxpE6EUT2m52QjykvW3
	U2dZRnzyxMhWet9kDOC2T6tyefqqdCWGoG5632SWINUL+CR/jo51Ji1yoK9AA3+/VPau31Yow9a
	7m62AyVQNriszVLsj2brr87fEKWnVrJXK0QQVCwr0knSwXDE+3r
X-Received: by 2002:a17:906:ef03:b0:b87:6a6:5fc2 with SMTP id a640c23a62f3a-b879324832fmr118528266b.5.1768555941600;
        Fri, 16 Jan 2026 01:32:21 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm187982366b.4.2026.01.16.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:32:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 5/6] wic: extra-partitions: move extra-files WicError to do_prepare_partition
Date: Fri, 16 Jan 2026 10:32:14 +0100
Message-ID: <20260116093215.26108-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
References: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229535

For organizational purposes, move the raised WicError if extra files isn't
provided by a user to the do_prepare_partition method and rewrite the message
to be more clear if a user wishes to create an empty partition.

The original error is changed to a warning in the event a user has a typo
in the variable. For example:

IMAGE_EXTRA_PARTITION_FILES_label-fooo = "bar.conf"
part --source extra-partition --fstype=ext4 --label foo

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: If the list is blank, print a warning instead of an info.

v2 -> v4: Raise an error in do_prepare_partition instead of making
          extra files optional. Extend error message.

v4 -> v5: Chagne logger.warning to logger.info

 scripts/lib/wic/plugins/source/extra_partition.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index 25aab06c52..327bc2b8c3 100644
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
+            logger.info('No extra files defined, %s unset for entry #%d' % (cls.image_extra_partition_files_var_name, part.lineno))
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
@@ -125,6 +126,12 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
 
+        if not cls.extra_files_task:
+            raise WicError("Entry #%d does not have a corresponding %s variable set!"
+                           "If you wish to create an empty partition, remove "
+                           "--source extra-partition from the wks file"
+                           % (part.lineno, cls.image_extra_partition_files_var_name))
+
         if not kernel_dir:
             kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not kernel_dir:
-- 
2.52.0


