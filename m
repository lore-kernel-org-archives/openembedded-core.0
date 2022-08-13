Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EC6C3F6B0
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:28:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.1950.1660364896812685461
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=apoa+ELV;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id ha11so2634537pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=U8sovTCOlzDjGnBiDRTBBCk6bieoVbo5jHVTo67GztE=;
        b=apoa+ELVvPYE4vn7B+6NX25ZQctX3NxP4edW2mu1qiVbHpYFLiqfVJCXu8oy+V2tqg
         p5Een9VhI0XruCTFLI947eZ4cdVBeFaetpDEs3VKNucMkzKy5WGeOqKe23AnXlANJIJz
         IG5qS4Dyb3Ys2+awIvK9yxnJ0UCQFxKUrcYrxcpxLbfIhW07pWj813Ps2UxVOLoskSJo
         yiZ4sq5l1ItVJC2DF1vJWaWimipttEWkCDeIrJFtoWzLYIbsz0S6t3mkeefQJiyptVYr
         2ocGRgUHhNda9kUU6xrHAAnB+57cHCvuq62GS3jsCT2wXl0JtEPNzMMLYpo2GvhcSDtt
         ptlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=U8sovTCOlzDjGnBiDRTBBCk6bieoVbo5jHVTo67GztE=;
        b=O5/SgIuAuAaKfXUtIsoeT7wBcBe20edyLZfn1l0sCPB55q3IL6/rVx6wHY8XhM7Mm4
         d3jzgKuwO/YM4SVlsVkqgN0rS+0ttc7hkNf3WUZJDTDnagC/E/+M3XFPAM1v84+ZOx9n
         Fb29TWiXJi6vgcssnd/Ao+jV9ocR/fGBvjPqNkJMwO+OlrBdjicYpgtgSDKuFyi2f/j5
         AyIA1jxlpEh1zruQqippp69G8kKz2KMt5aXk2l8yzwrmsSYiEHdcAH0VqhzbMZ0v5oDl
         1KEATxmNLTsI+k5oyuPUbzdIdoa7Yadk5cZCgj5kQ4V233RnmxfaFmGlDc3fFRviujfV
         7qCA==
X-Gm-Message-State: ACgBeo2B71GoRDgCLIhfszCI1FzENAQDR8iMPkTMepXeVGA8idREbe13
	Oe8vE4wLE7o3tMK+PGXBFD3fzw+KXgc=
X-Google-Smtp-Source: 
 AA6agR6oOCSAeiOSP1BW2SCSR1q0byeKAbloh5g1SMqCCckz7VcpBhzmnQNm5i3u7Vr5sfKArwx4nw==
X-Received: by 2002:a17:902:7297:b0:16f:975e:7c72 with SMTP id
 d23-20020a170902729700b0016f975e7c72mr6833333pll.45.1660364895749;
        Fri, 12 Aug 2022 21:28:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 h18-20020aa796d2000000b0052d4afc4302sm2536105pfq.175.2022.08.12.21.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:28:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] default-distrovars: Remove largefile from defualt
 DISTRO_FEATURES
Date: Fri, 12 Aug 2022 21:28:07 -0700
Message-Id: <20220813042807.3533472-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813042807.3533472-1-raj.khem@gmail.com>
References: <20220813042807.3533472-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 04:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169300

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 230bab84dd4..abf48f79f08 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -19,7 +19,7 @@ DISTRO_FEATURES_DEFAULT:remove:arc = "seccomp"
 # seccomp is not yet ported to microblaze
 DISTRO_FEATURES_DEFAULT:remove:microblaze = "seccomp"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-- 
2.37.1


