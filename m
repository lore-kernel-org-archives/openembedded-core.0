Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871FDC19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:18 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.71.1659106095797108839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=m0ridly5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id r186so4202625pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IpaxORbs9S9iVedHOJWYwMBSiHRaH5DHhF8GoFgg/ac=;
        b=m0ridly5Jz6D/plQPjIufEIN3pP44kIpsjREjfkB0z8A180talCT/qa9LXR98kxjSu
         G5IJXEJPMbnMRtSOsblfy6qn+A4ICyQHGjKNnL0WG3F4v/fKI8eKMpSUDRn9Rjx3XuCI
         Otu+DkrcH1LCpujN0Vv4kMt7llMMTrYWGa36UsFchX2kqB3k5KlvrvKhFZQ05FJjcl07
         ZTNEj5f3qAgjYlG6x/FYCxhXUDMUvPC30Uf9ThGOGPF+r6QWT1SiRbRpPYJNsp6Q+w/u
         4I21SG7TPjOOqV0RUeg2rTr/F+Y0NTJqUtwKfOR778vXAMkmDRpoasl4PYWKfEfJn2m2
         a93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IpaxORbs9S9iVedHOJWYwMBSiHRaH5DHhF8GoFgg/ac=;
        b=0g9P1IvaJh2Kn2fXaQXnPL+7utELHbz4h/3tqHqYSe2qD8nVVLeQ1SM0L+dZxjyHFA
         T8VUxeghmFaiXNCecY1DY83N9mHvOJo6comFrayk/Ik2zJhQUoPSbt8YU9ZHjOm4jQUt
         xL2yPp1JQ11dzMKrSM52SbG6yDJTFGcfGjzVZ0WbINQpd09nf4+SinopSxPoSao59oWs
         4THphmpoK/GQMu6TAb2P6h8xAsQVou8n6GhCm160hkL74rDzqdohHweZGxnK8+o44xOB
         dUcsXvChStULUaWak1fjlkzGLgDWO7wDF+TP7kt81IJsa81HW6ow047T2ZpcwhBc5T9k
         lXCQ==
X-Gm-Message-State: AJIora9M1VQxZ9Kj0hOsaE22tmATW+BBfDIJR+bEXnjIl8Nc9hxz/EAH
	NRImYXqYqNB7bIXUuMUlY1edx8Qv+JClIlA+
X-Google-Smtp-Source: 
 AGRyM1shYdseD1jqIznJRLvyKYpNP6A/kN3Wkz4Z42xKWmIMGtqLDQOEm+I+N6jRnOVY0CxJQ60raQ==
X-Received: by 2002:a63:6e82:0:b0:41a:1817:15d9 with SMTP id
 j124-20020a636e82000000b0041a181715d9mr3285052pgc.577.1659106094759;
        Fri, 29 Jul 2022 07:48:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/29] wic/plugins/rootfs: Fix NameError for
 'orig_path'
Date: Fri, 29 Jul 2022 04:46:38 -1000
Message-Id: 
 <15015dda2cfccb9d2894f8d9d8f04043604b7a5e.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168657

From: Mihai Lindner <mihai.lindner@gmail.com>

Fix "NameError: name 'orig_path' is not defined".
It's a typo from when this error was handled outside this function.

Signed-off-by: Mihai Lindner <mihai.lindner@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2124ec0d9f9de2da476f0024a0ccf70da987420f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 25bb41dd70..fc06312ee4 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -35,7 +35,7 @@ class RootfsPlugin(SourcePlugin):
     @staticmethod
     def __validate_path(cmd, rootfs_dir, path):
         if os.path.isabs(path):
-            logger.error("%s: Must be relative: %s" % (cmd, orig_path))
+            logger.error("%s: Must be relative: %s" % (cmd, path))
             sys.exit(1)
 
         # Disallow climbing outside of parent directory using '..',
-- 
2.25.1


