Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9EBD4115E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:14:42 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32413.1768472076977659877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=lFTAQ2Ae;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.41, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64d00702990so128989a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768472075; x=1769076875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=lFTAQ2AeayihHhlGZ5zCl/oVExgye5S1uyfAS/F0ypYX62vC2oUCVfLtWoPsvdv1sU
         OjW9GdnYi+NHYwp1oQO1h06D9KSswjawHjS7wXgV7aS0pFGBr56gI9G9Oe0dt3gRuPxb
         oKHfuPd2KNS4U0BQVC3McHevM5jpYPRg9A+sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472075; x=1769076875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=alayJGHTwrH8Eg7mhDOLpD9AAPvsAK+g+Z1cbfFVz6WmvuNt/rlKhj20X34oya5WK7
         e1QO9m0qa5HbsDtf9JMrgPEniC2bfjhghbsZgtxjcOpA60JlP0AN8jY85RVMAknriVbv
         MDhOynKvGN+JjAZJu1No1EFd8lhOHnqt85ql7Ng901Uis8dPnl51P+la6BsxSZuSLSJ2
         kzEgWXFGWxIxYPGk90lTmvOidXWaawK7/gPENsg124W9axfIBjamJWeikLzs110h5TjR
         +xryhxcaltW/cPspF+ggBxlPDSrW35bz4NEVAMRyRHSYhyRyLXxYtMjuPA1dt4yinqNI
         NTrw==
X-Gm-Message-State: AOJu0YwOe/zYLX67uIiBekltiPf3FnppabAoGWthz8Ra235oQpeES9eZ
	pb42UoWucw0hq2sBhOc7a4bPO2u7dn6Ax9w9OZljZ3rpeI5t1Onkv53oCs9+TJRjBG1bagW3oO3
	3zD2s
X-Gm-Gg: AY/fxX4OpJHyjlVRLV9J1axDHrYlTs3Jy/BR6yGV/FpOWSX0FpUoK8E0HMLC+LdNqH/
	sqZWgiEhwa4qqLGCbypKBXjYpk4lozfdkdl7gdNw2XlFBeT3b3qighrqdFxzC+Ala/D890CpeL8
	q0fwC6p4wjLf5qXmsWcwpdHvLJqV0smd2OIpeG2MmJZEokAOy/n4WmJPjYKDnG+QDFcrd2qBUfr
	OFdMX0Su6h6TwbJQ2qZhve1X3X5j1zK1V7MRWhxGSl1vJsiNSWAlHuXE5CwzAAVC8Cp6+ojzhiP
	BFyerTeE+hAQPSUMm0MyoA7/DqsGgqyrSfdIRTE4JxNLSQkZuSlbvR3iRVitX4gni6gXTJzvhyf
	17/BiZQcQ4g5F4U13FzAQY6s0YYbve9lTdZ6xNCmkbWBHbstnicX5Dzs4FBPI3Sat0rF0MH68sa
	Jsi87+AJw2fFQVBGTw0sORdguqyukI3vVmjzQQBlIjOWvPNpDlm/ot60eHhaLeGp3RwZza5//9F
	fFiAN0AFuEJGJQ7dOY7o5IgBIvuNFqlYoOoPJIuLImkn6dfbC8q5Y73ag==
X-Received: by 2002:a05:6402:26c7:b0:64b:aac8:4b9b with SMTP id 4fb4d7f45d1cf-653ec4544fdmr2390334a12.4.1768472075194;
        Thu, 15 Jan 2026 02:14:35 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6541209cd87sm2038643a12.35.2026.01.15.02.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:14:34 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 1/6] wic: extra-partition: Small code cleanup
Date: Thu, 15 Jan 2026 11:14:27 +0100
Message-ID: <20260115101432.162696-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 10:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229399

- Remove redundant charachter escaped in the src_entry regex call.
- Remove an uneeded semicolon for cls.install_task.
- we copies -> we copy

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 scripts/lib/wic/plugins/source/extra_partition.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index d370b0107e..a1d9aa9a7b 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -69,7 +69,7 @@ class ExtraPartitionPlugin(SourcePlugin):
 
         # list of tuples (src_name, dst_name)
         deploy_files = []
-        for src_entry in re.findall(r'[\w;\-\./\*]+', extra_files):
+        for src_entry in re.findall(r'[\w;\-./*]+', extra_files):
             if ';' in src_entry:
                 dst_entry = tuple(src_entry.split(';'))
                 if not dst_entry[0] or not dst_entry[1]:
@@ -80,7 +80,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.install_task = [];
+        cls.install_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
@@ -111,7 +111,7 @@ class ExtraPartitionPlugin(SourcePlugin):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
-        In this case, we copies all files listed in IMAGE_EXTRA_PARTITION_FILES variable.
+        In this case, we copy all files listed in IMAGE_EXTRA_PARTITION_FILES variable.
         """
         extradir = "%s/extra.%d" % (cr_workdir, part.lineno)
 
-- 
2.52.0


