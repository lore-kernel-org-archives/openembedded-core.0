Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECDDC44538
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2903.1784568227444462386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0GxERII2;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4955adb04e8so11203785e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568226; x=1785173026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6P4b2xFrZA5PW9Wjq5jccZUu0E1JnecgpqDMNsDubsE=;
        b=0GxERII28CCX9M/cLYqPwFNgz2dt15CDSwuYQw3dvv8qHo7l1LGibhi54ocGZvSb3U
         OsOphThp/sJzUO32b+qaiKFmcfx3BYz4dSrbI23II6wcl2GI+AorCCTMUeYt6vvKkMET
         la6e8ihYqZBsG20vtzV4a+JvGDL4S9apmleL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568226; x=1785173026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6P4b2xFrZA5PW9Wjq5jccZUu0E1JnecgpqDMNsDubsE=;
        b=OhpjC7tK9UuZAXu6G6QPPeS0UO7/IrdnhzNp01fvZzZMQfBwrZrIAlTmlAjjNqQQZq
         utu1Tq9q7pjkfx5tV7b8JQ6NZ9XMLonRqH4rmi81NYAQy9Ck5GrnzcKWiwqkHblzHZzr
         6lvhDmyzw/NNlv44jKbU7qByB6gEuyjq23zCRP+oVnhKyG7yMYh12tHCKQXl8K113dW3
         RzIUFnYNdREhs52prPd3KzsirNBPFRjks4FGZs9z6rBCWT2SxLgg4/etYsIKqSq9AoDi
         VLmGgVdCIStDTni1/PGzu8YwdJzb/Z2O1hDPdtSND+sVOWlapuPOPiAfKgvpBonJgtIW
         Wbqw==
X-Gm-Message-State: AOJu0Yw0jDerS9UlAjMWz/Y2h6j9jax7sLe72GoPwtcwvawwkTDRmSSq
	1I7EmClIgdar64PGwyWSSlkVz14DnakLaDVDcAr04LSwgjigzjDb7+s8ekxnZFwkj6Z77Xqn3OR
	YU0nqqWg=
X-Gm-Gg: AfdE7ckKNYf2aJge+31y5D1HCP2f+dyHS3OEtDm1TOjFkcXOvPWeTc1xJ6PXv7W7qBe
	WWE+1mOJw4QWDaYTQ1/mfFEdfRD4cY3bH5BK6gvGdPWYP5REEXaenyf707JswYxU54GiDJzqP84
	7pqTmnF25cLENIR8dLp7MWgmGTCc7PAPSCrX259ctW5m042ieGRlH92PaCRGo6obgE6jm7GwrI+
	gUahm4fRxtxo7dZ1u/daezhbWXsZ9jANRjsEhzaZKDIUEeDxV5zEm9Pn2az7IfEnYf4ivNcxQ1O
	sOvH+WHYUgWwNjTcXRg7LZH7611IfWcVZNMS4uSjpvzTtwSPF4YiBLQynP96JGBXScT97v6226i
	/jTzQQaEgd4vq04YS7rnq6grRUbqI8kOqSZyf02Ka+AIZ2MMy0RLlda8XzlNkSeoEKMTVO39J2Y
	osEqZznG3c/W/g/jSSHIPqUWMxBYBWAooDESw7RVEN9L/j78AW/yJVfleACx/9SBLomntoJHIoN
	0f4TWgv
X-Received: by 2002:a05:600c:3b8e:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4954bf3216amr183618195e9.8.1784568225653;
        Mon, 20 Jul 2026 10:23:45 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/33] wic: Fix updating fstab for nvme devices
Date: Mon, 20 Jul 2026 19:22:57 +0200
Message-ID: <09b3f0068398268f46670a685fc6df78adf757f7.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241458

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

In case wks file references nvme, update_fstab() function will not add
prefix 'p' before the partition number, as the if condition only takes
mmcblk into consideration.

In case of nvme0n1 this leads that following entries are added to fstab:

    /dev/nvme0n11
    /dev/nvme0n13

instead of:

    /dev/nvme0n1p1
    /dev/nvme0n1p3

The patch fixes this as it extends the if condition and adds prefix 'p' for
both mmcblk and nvme.

Upstream-Status: Backport [https://git.yoctoproject.org/wic/commit/?id=f20cda73b495b75ef399c331f59b0e2401a3e76a]
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/wic/plugins/imager/direct.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index a1d152659b6..b06e6a8f236 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):
             elif part.use_label:
                 device_name = "LABEL=%s" % part.label
             else:
-                # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-                prefix = 'p' if  part.disk.startswith('mmcblk') else ''
+                # mmc and nvme device partitions start with prefix 'p'
+                prefix = 'p' if part.disk.startswith(('mmcblk', 'nvme')) else ''
                 device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
 
             opts = part.fsopts if part.fsopts else "defaults"
@@ -266,7 +266,7 @@ class DirectPlugin(ImagerPlugin):
                 elif part.label and self.ptable_format != 'msdos':
                     return "PARTLABEL=%s" % part.label
                 else:
-                    suffix = 'p' if part.disk.startswith('mmcblk') else ''
+                    suffix = 'p' if part.disk.startswith(('mmcblk', 'nvme')) else ''
                     return "/dev/%s%s%-d" % (part.disk, suffix, part.realnum)
 
     def cleanup(self):

