Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054E0D4A61D
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:32:25 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2464.1768555940215647709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=ZTN5sP8b;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.45, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8719f5a2b5so33329766b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768555938; x=1769160738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=ZTN5sP8b0zpj/e5lgHnsPrHt1cGBVpKj52t8PI6EQeG3PY/1zbDwsqcBrqsr5irtYz
         Cs6syWaFAbo4rut2/fvFzH1Jweg6acpt9p9I8RBuTjZOtU7mbq2o9Tb81lUhwMvMirVM
         bosnla6fXXZbt7qf5KvWdCy5Of4EYu8H3Y5o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555938; x=1769160738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=b855WQnVLAIUW/brJnQxT01zDbZPd0xjVcWNoT3Wt4pUySLMulbNaT6US4GMrAx1nb
         1+pD1hpPxjzNBA8zV4B8r8RdNJvD1fQGQPcCGe/HbzH63v3UHjxz1HPaMnq521Xoh+Kg
         CyV4OqrB0WybO+SiEjj/oFt07hKzTrtSOMIf2kJhXPKLJwMzSE1kEO5rg8yjXJsF1VG5
         RU6Fd1OWRMSBWsypxYWfRocxBCVTJo6Yx2GX15ysTTczyifPFXCDN5R5Psx35/OU6I/S
         YUUA14FVbSlwnOuzcYw81jxpvaX5z5TQwSEGJNU9en8vZHHDHTOTKMbR9SKqLsoQfHeR
         14MA==
X-Gm-Message-State: AOJu0YwXS00gq+sBcLrSe1PNjtUHI8IGYL4xOvt+TyuybUB9zlnZMErP
	uKRrBiHuh/ks4QZklHKCc6Y/bRu1Ub8yCS7le81L5t9RYlqHtumX75aaRkaNMfxSS8X33QgSF6H
	J7RBb
X-Gm-Gg: AY/fxX7Jj5/Mw2YtlHsolAhuv4o+4ShB7B++02B4VkNGMhjFQUK4JopRIZwVbCDJgSX
	ZhlEytk7AZ/5EO/SV+5cSpN1zKfbtZk75VXFn/qCgMxrDitlZf1YU4EbHrVCzezexCZrbzFYCaR
	b+evexlTQbJgGkBreMa2w5irJGAu433w9no2A07hPc/FDd+lhcpWPKFXfCSmVqYBq6fIfBaY3Y3
	QFolzPuliO+3o6QSc9mPvhzQFYiO6BrBqOeq0PXxZ3JGXmi9TPp0t/o707G011WA5upl3yS5euT
	bab2s7qf6Wu9ZkSTo0wKvKVBZnAED/USSnE3pjObLYJNFgKKI2K3lkOd8F9tcsbGayoSUu63XBE
	ZA7DVURSi1kTBZsL27+cceojptCFjsyvEY7ER+y/PHnkAYbeas9qxFk6tTiUpojLPnH7QXwN00X
	mEY1YHrwFK0gyV3ZrejIFRq8TG2ZdjOD+k3H5qIE2TWBXtFTLrugsBUrpMoHaydWrDYJ15HJwZP
	/4tjJS0mPRIIMXjON9BHXBOp73XEZgKJK9Rnx8veJV40/VdIWfI
X-Received: by 2002:a17:907:96ac:b0:b86:feb2:543 with SMTP id a640c23a62f3a-b87932f09c8mr105264166b.8.1768555938297;
        Fri, 16 Jan 2026 01:32:18 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm187982366b.4.2026.01.16.01.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:32:17 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 1/6] wic: extra-partition: Small code cleanup
Date: Fri, 16 Jan 2026 10:32:10 +0100
Message-ID: <20260116093215.26108-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229531

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


