Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13368D37E58
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:48:36 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13359.1768405712866447163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=RDPPEpP+;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.44, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b876b5c69baso13340666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768405711; x=1769010511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=RDPPEpP+DBsZRtp1eI1gj9RBllqcg9KUJufloSkuRIrYnRH3f3MphK6Ig6bs/22TAW
         tANCg1QleLH6OdPKzEr93UQVIB9M9IWM2ZOpm2Fffj2e17e0/9uDIhm37ZHXRrVqmNS6
         s75yAb97bpo+7LeRpUVUubTtLUj99Qnc3kcKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405711; x=1769010511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzRIDMqUJl+hD74DDhM01pKGrpdlHt8Cj43+PhA6ebE=;
        b=BRjhNl6JbH5KeFU8w6EME9Vh1o2gSGDSxIHgwvqNmhOHz0ny25u0kj04PKRKHR5uyx
         OZxrZ0u1bX8iGoEpe4lhx0fXg9MaP5kot34y7FK8KG+Tdd3sPST17Mk12FdPqdBPrAV6
         /SHTFB/vBCaTNzNFKZlf/uQu4QKrl5DXUVilErUMxmGWsfVMf7Uos9CZbSOn9WSJEush
         dwyt2xutyiokIilVWtkaylAaapY6eh0mqmsdQVNtPL4Zhzb5ZSbENN1adxXkDY3IKQiO
         3tI+0dtI8UX1+HPcPcqROKaUdVCnnit44CG5CMcPBqVvUHW79GwqRToAElyek7pv9115
         RXuQ==
X-Gm-Message-State: AOJu0Yzt0stMQ8PYIH+76dWmS3n+YJ/HoOgd61kNUN2KK1RXaChsemrI
	kF6fv3Pj3XHnD7DfJDxIKJ+q/SuP3ZTO2P5A9HTW43xW23MZHlbasEp9gbrggrCIAxsrm2lAQl9
	Qqzq1
X-Gm-Gg: AY/fxX4PJzuQqUy5juYjgTFSACSgQjs9U3fM1b+s/So70F4oA8P26b0ChAxjpg8eqUI
	parCqIShKRis6Z8K5mFnyQmWMndAEpQKof+J5rcB+Rde+Rc5tuSB59NUoBkT+6JIn/67xxhjc6Y
	tAmfsWu+viHWArEXc+JlnivTmuJsKu6rollEf0R0tj7JVLVO/zg1ElPBUCFqYpaHDpIuMssqLxk
	JIbzVi0NKfUrd2JMprKIbcEM3sXxPSWCNMdsarktPB9+QosXOm9GWMw7jFrhKYm5wnyZN1OL0Fh
	su7zGhuM99fiuFSM2yWXn4groxl816bll3eR5xdeYVTGWsYXH18yz7UJkL4J4CGAObKakyfdR1p
	6D0F1FQBvO380kEE8ysEa6JuqzndRio2Pk3swYZza/xx2wj6QvL03POITAZjsVqcitfwOg8eHwE
	5t+20Wc2BeT3uj8NlkG4RCCXSd6DozuBMsWG85jKLdGKTken1xtSmypzdd2Noo+Jkc+1UwZbWe2
	umcCx39oowObc2X0KfuqxOavGqObTYIycqCR/Gsx42wmxrKJbnQ
X-Received: by 2002:a17:907:70b:b0:b7d:3c0d:96ef with SMTP id a640c23a62f3a-b87612ca8a2mr171094966b.7.1768405711141;
        Wed, 14 Jan 2026 07:48:31 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b876e9ac655sm135616466b.6.2026.01.14.07.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:48:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 1/6] wic: extra-partition: Small code cleanup
Date: Wed, 14 Jan 2026 16:48:20 +0100
Message-ID: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229338

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


