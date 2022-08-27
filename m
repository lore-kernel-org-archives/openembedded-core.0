Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D032ECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.51635.1661624791911705995
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3qgG1L3l;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 n8-20020a17090a73c800b001fd832b54f6so2327037pjk.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=jdrB52LNMCK8ahRaUK2eKprv9MMr9mSJ8kGECS4KPU8=;
        b=3qgG1L3lXxxKcGZvFH6sh6T598W3jy1Yfo95FPJU23wtOR/NEYZg+MbQRAs0kLtbtE
         pjxvQn4WgXCZix9N2Ey2TMtxsddBAJIiSCv6Pi5l+qt8a031bVfzu6tZOdQLw0OOtGLB
         nkXzLS0ff1kj6lx+ZFzc3N94sYR5pCPWf1DRyooUto4KT83BCojxx7iTMdNX3QAM+8ub
         1qGgpWUqlm2/czBn7f70X5dGWRhylYAPmf/pEHYUhrM0K/k7Upbgf/9e1wJjkG6A1rWs
         E/LQCZuRY8iZIjs+MdKnXILyWjPNXA8EiJejBh8Sgu49j8LAySg0xVwwmstTSw0Ug3Qy
         NI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=jdrB52LNMCK8ahRaUK2eKprv9MMr9mSJ8kGECS4KPU8=;
        b=DlM3lnwBeM1wPKXVcB8OiYrI1MdMTkGJA+RB6xmehAo1Ju2JmDTLrGrrDcSBWWfOK9
         WBCm3CYbmtRBr8lJLVa29P8fDMbiYoDC6nW6ArXg/Ba9kvfRJZMgHoDQrfsaedCs6odw
         aLe+eQnec5JGWWwJsRleGCaoqFgeACMd1eHgHF80PHHjPELChsrTJuY6E9s2OBIWm6J4
         RJoyFvG2w3nr8kZrhRbjmiC38pS3UsvK/NjLgV+txEjMxJTA+NpIErfynnE7dUenz9Mz
         NKSor1Rv+Cj0CZdK0MgJ+1uqpi6CT7lB32OCImUS19y9Uzumds/Ar99snueMwdyhM/IO
         HnNQ==
X-Gm-Message-State: ACgBeo1SZ5SkD9hClaEPWMcLNIDzyNReR4pGePlvzN5RexykFniJc4Jy
	ZbewO+qopiwCJoLo8sS9npU+PyTP5v8Sy8TA
X-Google-Smtp-Source: 
 AA6agR71DLYAj/HA5tc47pQvV2cXGuQVxsd1NL4H+NZuVNA31SgJVIuw2a51M34XPES3XuODwbzu1w==
X-Received: by 2002:a17:902:eb8d:b0:172:c1ba:150b with SMTP id
 q13-20020a170902eb8d00b00172c1ba150bmr9358542plg.108.1661624790964;
        Sat, 27 Aug 2022 11:26:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/24] sysvinit-inittab/start_getty: Fix respawn
 too fast
Date: Sat, 27 Aug 2022 08:25:37 -1000
Message-Id: 
 <d9ebf258cbd3a5e2d51e7533ff3f005494064013.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169954

From: Bertrand Marquis <bertrand.marquis@arm.com>

When an entry in /dev does not exist, start_getty is returning directly.
As it is started from init in a respawn mode, it will loop infinitely.
In this case add a sleep inside start_getty to prevent the "Respawning
too fast" message popping up every 5 minutes.

This case is happening quite often when the system is started as an
hypervisor guest as the standard serial line is usually taken by it and
removed from the configuration.

This was triggered quite often running linux as dom0 on top of Xen on
arm as the serial line is taken by Xen and removed from the device tree.

Use the opportunity to replace one tab with spaces as the rest of the
file is using spaces.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a704d0ff4d95b6d3a67b80a0db2be66253e7d61)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index 699a1ead1a..3c31a95f7f 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -14,4 +14,7 @@ esac
 
 if [ -e /sys/class/tty/$2 -a -c /dev/$2 ]; then
 	${setsid:-} ${getty} -L $1 $2 $3
+else
+    # Prevent respawning to fast error if /dev entry does not exist
+    sleep 1000
 fi
-- 
2.25.1


