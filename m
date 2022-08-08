Return-Path: <lifeofthanks@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D86C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 04:57:25 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.21980.1659934637007765903
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 21:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yd8Gsxiz;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: lifeofthanks@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso13427604pjo.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 21:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=uauyQv9JA7fWs1vRjHyeslDGJkJzk6Egz1hUkaSJxd0=;
        b=Yd8Gsxizg/br3lzyyyEfCwAGQXEHH6TfwTat4t33KJn4cawH5DmHFpuhD6eCokP2aa
         pCWj0aeioJnOHl74f3KKPgwhVI+VS6tdtLqB2bZOBCqHtRQr3YxVF6shXAx/Qp2SyoQP
         iv6NUGhuJW2zfE2/8ZNPQc2TTjw7pGkgQtDdR2JYUcPEUisoprpOrbEwrfxyDenVBnMk
         ieUSRYvDv31/1ZRADfw1SP+zdhfAPO7bBLSw0TpI6cePGnqX1+L4eOd0pkFRUOQBHUAZ
         1TAi7+XhoKfc1gy9DLCSp9GLr2oludN/h/cqds3rDkKWbn+9jIJWz+5f1YzG1ZnTTMHb
         B0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=uauyQv9JA7fWs1vRjHyeslDGJkJzk6Egz1hUkaSJxd0=;
        b=dC+hOadD/kGjj6HxSUaQmynk8XVRh4IyphTMyocL+3RSqEQZFhXJmd+xKzGV1OPpAw
         tzv+1x3NjGopN7nFuN4MB5jFs7c4fnmxaJ+OQ5RiDsFsSxay0lZboMMVBcRQwHTGMi1V
         ffhHN+0kRiMOUvba5htPdVZuSwYCGIGamuE3rmyNp4XphwM7azndsrEwA/4XRkE+YLdn
         REEZQP75SZqWfeisKQf/F2vMSaAgvxGOgUqqF0mvflLedFVl+2k2WNfH5ZkUxGxPpzDn
         aoMc960jF/HVH+e8ceCYJl99l/M6EkuTeAJ0fMJ/zP6xtBRBFMe0wr01tIzGNDwbOytX
         a8yw==
X-Gm-Message-State: ACgBeo0HXhnVAphsmP88+MuNZ6yVqAyWfQznwdF4ir5eN42cBn4HcGvH
	yM1MVNJC8vV35NKGJuwB/Ntw3c/F17g8tg==
X-Google-Smtp-Source: 
 AA6agR7Stxd+tvyKAu5AyyZdfNva/E/RQpRBkyFdEvcCtAEysl6CM3bwQ0X0VdV356O9ie6R7QIxoQ==
X-Received: by 2002:a17:902:f54a:b0:16f:16bb:778e with SMTP id
 h10-20020a170902f54a00b0016f16bb778emr16596453plf.37.1659934636063;
        Sun, 07 Aug 2022 21:57:16 -0700 (PDT)
Received: from ip-172-31-56-46.ap-northeast-2.compute.internal
 (ec2-52-79-182-214.ap-northeast-2.compute.amazonaws.com. [52.79.182.214])
        by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016c1a1c1405sm7432998plb.222.2022.08.07.21.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 21:57:15 -0700 (PDT)
From: JeongBong Seo <lifeofthanks@gmail.com>
X-Google-Original-From: JeongBong Seo <jb.seo@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: JeongBong Seo <jb.seo@lge.com>
Subject: [PATCH] wic: add 'none' fstype for custom image
Date: Mon,  8 Aug 2022 04:57:10 +0000
Message-Id: <20220808045710.25038-1-jb.seo@lge.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 04:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169013

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


