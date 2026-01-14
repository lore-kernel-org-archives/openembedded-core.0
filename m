Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C95D31A19
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:10:46 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13885.1768407045784628327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 08:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=S44JVtjI;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.42, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b801ff00294so335566b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 08:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768407044; x=1769011844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=S44JVtjITMDzmXKtggqN59Y+IFDWWVCv/MSVR0kCoxT+9b2K14b3v72tZ4EbwoUtk4
         rn3MYbOe6t1XPWDOMNF1QznBgwq1Mh3hiOwIGl4xqrrygso8gx7O9Fh7pl/HvgDG3HLI
         OhRpZyGkXSv61gffTTIJPauiaIASjdIUXMPvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407044; x=1769011844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=b/trEBJiXaKKY2W6nac4zklgeU90wlABla2a3qkgmR6ECLnwoma2JsXl+wYIdQ57gp
         yEcJoBV3XUZi/eNAnRn1G0wael5y6U5jTM0+Ve4ntRWv9Gt39z0w1hT4jZx5wRs1gTFj
         jZdUvG2u7ahdSPyc1HZ7vOt1IEAWVIr27HSpxLoouAp7XLqt/L8C5pAI5tSyPM2+a37l
         BMPgmOvPsSqtKaNmZ/EhIf79+CJaIrlMpBYuycFqEVrRHsiVwEVltxnrhEfajY6vc2f9
         4utYSIMokMMZnN/axYgClNaUTCOA+nLxBbs2UQSgW+9Aa55l7N/2zdCFe/ktVQ5LzaOy
         9kbg==
X-Gm-Message-State: AOJu0YwqSuEmS2Dc0hmVXXIymAa8ON30bJLOc0RTTkhqAIEVZHw6Z4r0
	aP/ZC9Tqp8Ex/ahZMpYIdpFx7xaPyYDsHYiiwivhabqE+sSU9p7hPwjIU0AHj3Uh0fQqrnWusmP
	+J+7d
X-Gm-Gg: AY/fxX5a0I3XxUZeeMzwc4DF89Vk9BTTAfOgEe6h7dZUa+41IG59GLO7SYpX2fbZXBR
	cC/iaAfhUNvMv6jd3lVmQ43/gugPtHdbs3DqKfy/UY5hUVgBn7s0Jmh57TFWUWkbnry0EDe0PZM
	V0KjK5hF5EdND9HGzncznf34oK3I1ONsAAqtGWIQNk/3IdpqNtljYgZDHRYJet8Na+EPn+SRI2u
	hB3szqhC9eH0334ulKXQmaJwFLyjD72R6Lw6IJ4oua9UixGMKPDzlGA6ML2WsNDIdAkzCUoRAhR
	gHxTiafsb/BsNe/M1R6L63V1qF/h4EBBG/7LZ0f+qzF1aKHHdK2R1sf2ro9Pjb9wKg0hBDW/h35
	4oUBG5JDIqLxoLcYuAWBCBd2DqdBQAzOwPHqLW5F0ODm+HHV60i1Hdjh/A1rD6p2mpw8V39psNW
	KGXTx4q+ydmNP7QFpuyuZz4Hz28gZCIb0DPA1PSTthKrx4HJn0T+S5hStFA4KBMdcR/vIQcJza6
	QoE4G33ArdhGzk+VslcbSElFTzLQ8WoMs5W3+eCycdwkcK59ZNP
X-Received: by 2002:a17:907:724b:b0:b83:95ca:22e1 with SMTP id a640c23a62f3a-b876103459fmr147653166b.1.1768407044090;
        Wed, 14 Jan 2026 08:10:44 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1449566866b.2.2026.01.14.08.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:10:43 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 1/6] wic: extra-partition: Small code cleanup
Date: Wed, 14 Jan 2026 17:10:35 +0100
Message-ID: <20260114161040.941159-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 16:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229347

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


