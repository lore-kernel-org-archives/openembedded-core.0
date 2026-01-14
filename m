Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459C0D38FE2
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:10:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13865.1768407048058236127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 08:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=QALHaEqN;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.44, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b872cfd35cfso137466b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 08:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768407046; x=1769011846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbqtCxy1aIUAoDNXAqbqLiAPApKlcNCX+JDNcW/83fM=;
        b=QALHaEqNvpD7yVeF2IXDaNxqgwoeGPZ97k4BIzIBaYqhALyYhq3Ks+bn7T0xMwU7ES
         etNz2PXqr+P5HBXHwx6xCQCnIZpjU/ZC0kvPFNwSD3xOYIB0/oyiwyJQlecnEl+59N89
         6R3nwiYSjPat9m3whgaWh2Oh7mjPoC1U5tBRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407046; x=1769011846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mbqtCxy1aIUAoDNXAqbqLiAPApKlcNCX+JDNcW/83fM=;
        b=ncQ/uMhLkG1x+M8fJCnmPsKA/vDKwm+XASuDVCRtVkJCj4f2I0RGsqAJrnlv4E8iwr
         tLgtN4IxsfUVCKY+52EuowBpLozEixyl98ZXeA3w8wEhQtgEvirj0usd2Eb9CWm4s1kF
         oiSUqb0qBSkWiVjCFs4zFE+kXBsRhEx/sywQ8cThPV2DwxoJlYu0FZHcRgIK9BEgD5JX
         8jIFfjCdem9E4xB4LHWfCzbZ4DtYLdNDZA1poAL6T2TypHS6m5KHqxvtLfUYwxjdcGet
         VsVbyO64PBgh/VDWIsbsT/VFJKPE6+Z/P7XHrEswBURSP8OT0+XeLV/53Qn51wUOlbOZ
         jqEg==
X-Gm-Message-State: AOJu0Yx0uBNKWmNbSWTu434hT937MQworXl1MR7wiFM2Yrf26sTkpo21
	819yiW+Ct+WHvs1ooXGXlXF+KP6RxrsGNUcwyKXzS/4eJW0aLK63kfsJN5yisINqLtkmYV4kaVi
	+n0BR
X-Gm-Gg: AY/fxX7UNiIWNDvYT32j2uu8LsidTlyiFOlbIVP8VrY4OFUE4wV9d7QvtYQyWCyxh98
	fBErtWqOWtK+dsFu8VOAxULlN+lcVYePPJzH13vTmoLRzj0RD0/3xfr8mdFBBqGP/ZB/GmAaYH/
	avqsoMNweOvp08oXmQZXGP76TA/IVATLBCrwS/AXS3JG/bughNPrGVHgsN97CRtj8ndOWAKHwFs
	DpqVWEpI0H5hdIossUgEvSEY8rDRzWhjuWyvRlSCXpA+lcYUK6ff99Nh5u2FoMqJRVQ7zQzcJts
	Rxj8q7uryTVeVitbrg5hDVrYulrDVvpKtqowu9Ff+XAbwB8uJ/t2ITY/GDXsQFRqOlLloNwEYvK
	WcXV2y8hZuPjCD+mm/gHrXtBIdLPs+N8aHOzC1qnrhnesQUUPJwp0Zo9rqUiZepmQk2r7lug/ul
	8FDRPGNPghwErdb4CX1/WQvETtmNhyLvyNCl4mAbZTBtloC52WMImlafFWWrl935lXuzT8p/l7H
	SlruC4YgV1RNiPNf9/S91vrcHYnRZDz76qbqTTBP9e9Wm3Hrgov06rsyxm85Ws=
X-Received: by 2002:a17:907:948a:b0:b87:2780:1b2b with SMTP id a640c23a62f3a-b87612682fcmr151015966b.4.1768407046499;
        Wed, 14 Jan 2026 08:10:46 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1449566866b.2.2026.01.14.08.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:10:46 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 4/6] wic: extra-partition: Rename install_task to extra_files_task
Date: Wed, 14 Jan 2026 17:10:38 +0100
Message-ID: <20260114161040.941159-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
References: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 16:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229350

Rename install_task to extra_files_task for clarity

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 scripts/lib/wic/plugins/source/extra_partition.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index 05b0ace361..25aab06c52 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -73,7 +73,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.install_task = []
+        cls.extra_files_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
@@ -92,9 +92,9 @@ class ExtraPartitionPlugin(SourcePlugin):
                 for entry in srcs:
                     src = os.path.relpath(entry, kernel_dir)
                     entry_dst_name = entry_name_fn(entry)
-                    cls.install_task.append((src, entry_dst_name))
+                    cls.extra_files_task.append((src, entry_dst_name))
             else:
-                cls.install_task.append((src, dst))
+                cls.extra_files_task.append((src, dst))
 
     @classmethod
     def do_configure_partition(cls, part, source_params, cr, cr_workdir,
@@ -130,7 +130,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-        for task in cls.install_task:
+        for task in cls.extra_files_task:
             src_path, dst_path = task
             logger.debug('Install %s as %s', src_path, dst_path)
             install_cmd = "install -m 0644 -D %s %s" \
-- 
2.52.0


