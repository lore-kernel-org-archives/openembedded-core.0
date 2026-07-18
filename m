Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB9AC4452C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2629.1784364809752407576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cvdIq5pi;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954afac04bso12577545e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364808; x=1784969608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=63R3gwHouPNP79qXM4WaEtQKWcPRxwa5uCT/T8FJ2Jc=;
        b=cvdIq5piYuWOnpHQ6EJOX1TheGhh9kovj/CsT0Mwnxt+X8yVjKVOVPokoyS3ag/LCw
         Ih4Jv2ZxcvjSp9oyDt3mR6Sul2GlqAGxkJD58DyIHSYxD3MmC+mYgI6jDRng+8MFzEkS
         q2ltADB9AJrYqF7rZ/FEA233V02XGcgLWarVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364808; x=1784969608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=63R3gwHouPNP79qXM4WaEtQKWcPRxwa5uCT/T8FJ2Jc=;
        b=Ps3QKqzAwcUk9p8OLOMoS/Jq77eHKw27ewyHqK8/tMe+SmyaK759aP3VCjeA8vFoHF
         lqVC8o4vIoVDJGOSs5RPEvpm1tFh1hsA1ec7zA3mzi3SRF33CIVYdxkZjeLZwPlEi4rz
         EKXiRxt2x5DZ9VXWIoamaKRiu21yO/AySrDGi8bivG/ifPzRtfpmhMAW15Bo4gZiFSJM
         CcOrS4aT/FnoSpPJA1/XszPoG/0M6/J86u9MXb+bnLQRpaAF/kV8PHzIVGEfnY6upmR3
         2YVYgjtcbjhDT5QvK4i0Keal3EUhSn/g5KJcnqFX0CvirYJS0XcOBtZKGG3CCo3uBicm
         c7ng==
X-Gm-Message-State: AOJu0YxzTq8RvMwvl5+datrmnb0MIoPhUd0JlWGhLh4dEkYrbSRYsRfh
	A+E9jdFw7bmV0R/6U3+JvUzF4p4L2ABzdyBej/JS17z5lnLyn9xLuvkqdGo6wO1V4tbBEYbIZsj
	aVkDngII=
X-Gm-Gg: AfdE7clY4ng1o4FotBM59/T2LOIZfxGdxsJMyB3Z0AgBRdeRHAf5aJjQjvXEEJoJDlV
	u+0x1RPWsYicdMefTbec8opdF3iD1VDg+zUYYOxNcr9iwYgX7Nh/V4yPCxP/JK/1H3/2uiyxsZQ
	NQ5Og2/qr0MjxwdD0lfKPTMtyUTBvuUMEZU9C9YMs6r90+aH5EPY3graUfmckoU/XZ5XxXqjo6S
	bQ0bFVdyN/zJBSbrjavZRRVwbcLGt/HjrNrHXiRl4irKZVrkChas+qYKQFYrShoy+nMVgAzOwNp
	V4RHa5LGZDSRyIOjYxVe4bwwnjbG9/RMH8z1Jvc4oouJJbji/uksjpq3Vfd8GQ4asTgJQjNhG9t
	YXqTBu7slgdKjKj5li5mixQMr5LiXAYaZsozJUA4+RMQKxFLBrJbuybM6882Zp6NmJnKh4wdUgY
	ldeBj2oH9ads2Fze008THLbQS/78Zfd5JVJ2YWE0nWvqUu6ni+NUxXB5HCYvmhWW9+zRJIMf8bQ
	m8BYgk=
X-Received: by 2002:a05:600c:1d15:b0:493:f6e6:ce2a with SMTP id 5b1f17b1804b1-4954a3e720cmr65898965e9.2.1784364808005;
        Sat, 18 Jul 2026 01:53:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/17] vex: remove obsolete semicolon
Date: Sat, 18 Jul 2026 10:52:51 +0200
Message-ID: <1425db301a14f49cad33257871d1193ab357e6f4.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241249

From: Peter Marko <peter.marko@siemens.com>

Usage of semicolon as separator in ROOTFS/IMAGE_*COMMAND was deprecated
long time ago.
Remove it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 311d418d22a609fb54b87bfc909bdd1861892228)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/vex.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index c57b8209c23..4c36cab5815 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -211,7 +211,7 @@ python vex_write_rootfs_manifest () {
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest; "
+ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest "
 do_rootfs[recrdeptask] += "do_generate_vex "
 do_populate_sdk[recrdeptask] += "do_generate_vex "
 

