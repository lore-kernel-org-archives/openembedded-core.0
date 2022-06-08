Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEEEC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:59 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.7283.1654699222504648117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=grvjzL4L;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id g186so10194863pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sDVsDOdftDlZW0mZSKsKEnjbGGoGvPNHYJskTDZM3KY=;
        b=grvjzL4L4HV8LwDAsRUi6rIWDStybvLbzZt8b2reH6CLh8PvtKg4b772Wrr2gv8OO/
         wWsio6WMz4zPQqJIj9fweTvTVO+UGPR8WTEloMCIIjVHORS4NPK9lZvnRwgkG+Xpwfof
         eLwtRnMuva8tAPGY4IkTtLIAeJ0nJOKQ69fAf3+vYo2ZTOpewEyIiLXaz6XC5vkaXmw/
         ziKZ+ARag5Jhyd2tkzCvOviO4454IM1+aN92Jj3Cwb25/eAqHtgN/jtQloDShUxRbTx/
         0FL+8J9C/22vcnvf6IbAxS2mV2/rd35ApsPjzW1vUqyuOxWlMJ+NiE7g2VpfB5imgQCq
         Q8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDVsDOdftDlZW0mZSKsKEnjbGGoGvPNHYJskTDZM3KY=;
        b=qYN2BbCpnijIIm7roHbdZ6gqa4AyzKGiPiZoVaNigLAcfTqMVcnntG4wWsm9o88y9R
         2znw+W9VfV3bizs+aikEyn3n94DsJo4HaVOak5F0IEKDZFMnUnqylWEsP/9IT5z+QnDr
         EyY8y2k5oOEcuWr2h0XXrYlwbn54fQTLXez+TNCONa5PRvorN0tnm6inPm/I2lclPBeB
         TJWpPKWtNuMD8XaH5iJNTIM2Wc16xQbAc1LQMclyeoHMi5PvT5Fd6UKRsVplpVsZ6uGM
         w1G9MO1HDGAqqHGC4wWaXmz7kFbRp90YGpmrAMtNhS6FgqbCX0el+g342KScZ2oCRZMV
         oZSA==
X-Gm-Message-State: AOAM531CzcQt0/YL/RXyBnhscqpgMm2WlS6KKXZFi4Bx3gDjFMLFGcOo
	fwiZf8kQdiHmIm0kAhytF9k4Ul+Tj8pdnJyh
X-Google-Smtp-Source: 
 ABdhPJwgZLyfu2IQGUeXW460X+nWKwzeTBIKkRRziOs8LuDnbTGr3yD13fy0xQYFJ0N7/cGQUvN/uA==
X-Received: by 2002:a65:6e05:0:b0:3da:eb74:ef9c with SMTP id
 bd5-20020a656e05000000b003daeb74ef9cmr30852578pgb.563.1654699249482;
        Wed, 08 Jun 2022 07:40:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/22] rootfs.py: find .ko.zst kernel modules
Date: Wed,  8 Jun 2022 04:39:35 -1000
Message-Id: 
 <6ade2bfdd9297896b9f251dd62f55e461fef1a3e.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166733

From: Sean Anderson <sean.anderson@seco.com>

With CONFIG_MODULE_COMPRESS_ZSTD enabled, kernel modules will have a
.ko.zst extension. This fixes depmod not being run.

Fixes: 1b696a45ddb ("rootfs.py: Add check for kernel modules before running depmod")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 425efac7110f0f42d70643e0a448e834d0f01a7a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 98cf3f244d..61ccf369f1 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -311,7 +311,7 @@ class Rootfs(object, metaclass=ABCMeta):
     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=True):
             for name in files:
-                found_ko = name.endswith((".ko", ".ko.gz", ".ko.xz"))
+                found_ko = name.endswith((".ko", ".ko.gz", ".ko.xz", ".ko.zst"))
                 if found_ko:
                     return found_ko
         return False
-- 
2.25.1


