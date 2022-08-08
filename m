Return-Path: <lifeofthanks@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2801C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 04:55:25 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.21962.1659934514594365223
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 21:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FTUkL12B;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: lifeofthanks@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 202so825091pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 21:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=uauyQv9JA7fWs1vRjHyeslDGJkJzk6Egz1hUkaSJxd0=;
        b=FTUkL12BfWVvqQZ6eo49Wuyd81JpveMhZX2BMla2UmUh5vJQgutl5+uh+yoI2M59PX
         w4DSlFZynXLs3Zc3W4p96KkqchP47LTK4AMtr9sFozIgwz3ITPy4S6vOoa8PK2wJ8BZP
         49gS7hq77O/ePA/UT5aYZszZPdaqPTQoS+FI0BgU8NH7aeQT1r4f4/W+XXrR1wZ2mIYC
         Xb+9SBycl/wzfCXX272C95R2MYPIX964WKRGpa2EC4jmOSpLDNv2ukK+3LpltNlktMDt
         +k+q0mEnYUCvYwhWzhXvkh+3lkS/Mtu2hecFuIEoMVzFt3QU5x1dF5ATvi8/fhTKp196
         15dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=uauyQv9JA7fWs1vRjHyeslDGJkJzk6Egz1hUkaSJxd0=;
        b=0+r7UaFsm8vHqRwsdeMQKWDUYZv3Gap5YC4OS35QG+38UOGyiBYR9HHP0VK6svdt2G
         GQdULCZthu6KqNq/sbrYEXyCLKAjv5f5oEiqUOLCnGDF8qGHqAYtMkJ89rZF5dWPM1PR
         IXcqvseYtGH3GQwdT2buqlRZFFU0hum3PGOc+9jEnxeA8v7NHDFb4GGqvF8ALZlasRxA
         y9t8YQxXlf4v/PD1XsIMyh5aMuHAc+VxmtXLJEhrJGAT2a0eOndYWowxSzYoXoQ4dgiD
         ldmoyVQig6Ca5XPqCAEl2U5GiS68ZXSgXho+0bDXarDP0xwtL+pqwb85saTBGzeehEe3
         bdLQ==
X-Gm-Message-State: ACgBeo21OdAGOJ76X3s8VzpJwFoF20NIJeDPDJPDO0MnLA+0xyXfWHzW
	fwGBu9inCiStgH3XmgcR79Hy1BgJu6Y=
X-Google-Smtp-Source: 
 AA6agR5e9eozGvH3qMAt++RBEpVKuNYZ59IkBkLivda+G4OLb9BSbeSNiAWsolVXsreSQpT7wiaFLg==
X-Received: by 2002:aa7:9f02:0:b0:52d:6ae1:d631 with SMTP id
 g2-20020aa79f02000000b0052d6ae1d631mr17432483pfr.41.1659934513415;
        Sun, 07 Aug 2022 21:55:13 -0700 (PDT)
Received: from ip-172-31-56-46.ap-northeast-2.compute.internal
 (ec2-52-79-182-214.ap-northeast-2.compute.amazonaws.com. [52.79.182.214])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a170903110700b0016f1c1f50f4sm7527454plh.235.2022.08.07.21.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 21:55:12 -0700 (PDT)
From: JeongBong Seo <lifeofthanks@gmail.com>
X-Google-Original-From: JeongBong Seo <jb.seo@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: JeongBong Seo <jb.seo@lge.com>
Subject: [meta-oe][PATCH] wic: add 'none' fstype for custom image
Date: Mon,  8 Aug 2022 04:55:08 +0000
Message-Id: <20220808045508.24982-1-jb.seo@lge.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 04:55:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169012

It's not possible to set the label (of gpt entry) normally
when I want to use non-listed fstype as a rawcopy.

Example)
part ? --source rawcopy --ondisk mmcblk0 --label mypart --sourceparams file=mypart.raw

To resolve this problem, this patch addes a 'none' fstype
and ignore do_image_label on rawcopy (that actually set the partition label.)

Signed-off-by: JeongBong Seo <jb.seo@lge.com>
---
 scripts/lib/wic/ksparser.py               | 2 +-
 scripts/lib/wic/plugins/source/rawcopy.py | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 452a160232..298e593ad4 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -157,7 +157,7 @@ class KickStart():
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype', default='vfat',
                           choices=('ext2', 'ext3', 'ext4', 'btrfs',
-                                   'squashfs', 'vfat', 'msdos', 'swap'))
+                                   'squashfs', 'vfat', 'msdos', 'swap', 'none'))
         part.add_argument('--mkfs-extraopts', default='')
         part.add_argument('--label')
         part.add_argument('--use-label', action='store_true')
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 3c4997d8ba..a71629282d 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -21,6 +21,10 @@ class RawCopyPlugin(SourcePlugin):
 
     @staticmethod
     def do_image_label(fstype, dst, label):
+        # don't create label when fstype is none
+        if fstype == 'none':
+            return
+
         if fstype.startswith('ext'):
             cmd = 'tune2fs -L %s %s' % (label, dst)
         elif fstype in ('msdos', 'vfat'):
-- 
2.17.1


