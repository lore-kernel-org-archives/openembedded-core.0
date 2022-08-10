Return-Path: <lifeofthanks@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B13C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 08:56:44 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.3567.1660121794119906107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 01:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DlSCqE/e;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: lifeofthanks@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id f30so12749550pfq.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 01:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=v+H0ybmlbAXhDSgAmlLQCkFvY318YZa5Y4liDSBOUd4=;
        b=DlSCqE/eWVUZ2q7lyohuhaTx6V8936XYF+zBTS4nNhUWG+H40Svh7A+nyU6W4zLhgm
         iZzrfwfemMbZDN1iwiQ0t99GSqVUPUgpxk/utYHbFmhTc1j8/MW8yZFH+fflQVFVk9/R
         4fS5Fxto0YcuCp57JMcH3bl6IDz/QEHtgT2W8rJmOdxKALkKfngB7+y979nZW4qIBctg
         h5+3v/Xm6hVWPPU0Z+pqyKJfKelhuxQpQpAP8zfO4xXWsRkI2UaLHlSMVyOJWcMr6XMb
         tvfPQ0hv/wbaLEX8nZKJy5LiKSMpmhcJXPYHZUlxFxDMB7cLWQsdTLDHx3Tl/jJwbN+L
         /64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=v+H0ybmlbAXhDSgAmlLQCkFvY318YZa5Y4liDSBOUd4=;
        b=AJgED+1sqIUAuS4kRBpG+Deh9GZVcEW9KveFygiD8fM8iuFBN6hptTlqyW1tJTdxTi
         /jyptiy1ND3obNUfBVzQHBP6069Aao20nHbE/em2qXGTb/TWpKJYRUyeddoipvj0P5xF
         YwchMYyVerQpmM7tE90Lw8Lq0ESTABnvV9weZUOE+qhZNbvesH2hFk1PG4OlX4mM9jyQ
         IftCIQyttDuMlj3l2+xCn5e4salKegleUr5yfYNke94GqGdk2NEPCFgePTNacOmYn+SS
         JyOFxTfP/pL1FYNm5emIUzQwE/jxvyKW+FJZjMRUwkiN1zk+4jbgu9zXngnHN4gKJszO
         aUpQ==
X-Gm-Message-State: ACgBeo3E63u5RUO4VXQxJW+qJTZYmig3DIbql4QqmWxrIkvf1mcGX0Gt
	2ETruhII0GTB8MVIPTVX5Q1RcLnXMUI=
X-Google-Smtp-Source: 
 AA6agR7a+EvJBYoutrSUA4bDyfHRX4rkM6u2QXgvSHpaFRlidag05owVZtKLwQNu54v/F1m3k0GFPg==
X-Received: by 2002:a63:6ac3:0:b0:41d:17dc:eb66 with SMTP id
 f186-20020a636ac3000000b0041d17dceb66mr17307506pgc.384.1660121792722;
        Wed, 10 Aug 2022 01:56:32 -0700 (PDT)
Received: from ip-172-31-56-46.ap-northeast-2.compute.internal
 (ec2-52-79-182-214.ap-northeast-2.compute.amazonaws.com. [52.79.182.214])
        by smtp.gmail.com with ESMTPSA id
 g4-20020aa796a4000000b0052e67e9402dsm1364651pfk.106.2022.08.10.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 01:56:32 -0700 (PDT)
From: JeongBong Seo <lifeofthanks@gmail.com>
X-Google-Original-From: JeongBong Seo <jb.seo@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: JeongBong Seo <jb.seo@lge.com>
Subject: [PATCH] wic: add 'none' fstype for custom image
Date: Wed, 10 Aug 2022 08:56:15 +0000
Message-Id: <20220810085615.2588-1-jb.seo@lge.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 08:56:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169187

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
index a49b7b97c4..d1e546b12d 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -159,7 +159,7 @@ class KickStart():
         part.add_argument('--fstype', default='vfat',
                           choices=('ext2', 'ext3', 'ext4', 'btrfs',
                                    'squashfs', 'vfat', 'msdos', 'erofs',
-                                   'swap'))
+                                   'swap', 'none'))
         part.add_argument('--mkfs-extraopts', default='')
         part.add_argument('--label')
         part.add_argument('--use-label', action='store_true')
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 7c90cd3cf8..88614e9208 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -23,6 +23,10 @@ class RawCopyPlugin(SourcePlugin):
 
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


