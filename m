Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E148EC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:43:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.1988.1667356966975856675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3jGDjkUD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id k7so5580309pll.6
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jd+pjbbiwQKgwvAQ5ausJeMub/6SaieGgjJLpPomlsk=;
        b=3jGDjkUD566VHvsC8iur5Eyxy3s8x1X+Y0/cdYlJybbYsFShmFNAsMBNWyJeImxJGU
         kSggmZLzd6LywXFkTuSRxTx8EhpoMQxKPAyiFgu2hHICd1DM/a4R6zI/tMGSMMSGFC7m
         BSyw1dkQnNWUpWIV/bgGfzFp7c7hjz6RiM+2PXzBhejF4bFUvGwQKlvAF0B0uafMZ2h/
         u+f9OgUG5RiwqTRLtE+IWvEKj8TTbmRotsVq05ph5d7FtP9gHyAcMWvWG1nEmq4Kznl/
         z9Neb045684+2Iv5xypoTxyc26qDx5cDuIJkN72AX4mcrPYlYcaP5c8Eg02ciZUfU8wA
         er4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jd+pjbbiwQKgwvAQ5ausJeMub/6SaieGgjJLpPomlsk=;
        b=KcPd8BHbwNg7/YRW7b23ml7wmKlmGtGiPFyGExYE7QZd109F2PP0fHUFSfJIzhT+9x
         5WazT2ils0RRRLeq5pa9z1+MLdaZsiLodA9FVn9t9HAPPx62extccLJkXD75PD4lG21M
         KT6T4jwAWj5cZMzdRPh8lyKGrDp2V5+k/xUpXE4qHvSUmWoOE5aXFQa3rdd8TvvCyPtj
         hWlSpAr786MYY28RAKIoGx9DWQeNBhV5gCVoxbH2q8BAhFXWJ24JxUMq9/4nrSGugVVf
         Dg2W0dUWgoeYfOBehIZPlG9GYRm1eibNuQtDc6lpC95DsDCejeBvTtLADEldTqQpi2VO
         2Y8Q==
X-Gm-Message-State: ACrzQf2SDsqtwhrYU0A7KgvGWz90N2Q4hlM1h3hRXaOwW5WTBOyrZsc0
	XgWeUOLIjzVSvTnffsWw7vb61BKlTtbASNYc
X-Google-Smtp-Source: AMsMyM6vUJee/5Lfc77ueM1Zg18e5eXuPp7E2hLexnU8XFJnOLefMy3FPtECDXh5UaNPjXjK3Xu6ZQ==
X-Received: by 2002:a17:90b:3901:b0:213:dfd5:a75f with SMTP id ob1-20020a17090b390100b00213dfd5a75fmr14292598pjb.233.1667356979633;
        Tue, 01 Nov 2022 19:42:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/20] runqemu: Fix gl-es argument from causing other arguments to be ignored
Date: Tue,  1 Nov 2022 16:42:08 -1000
Message-Id: <dd1dcfada1fa46ecb8227c2852769b35026875d3.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172558

From: Joshua Watt <JPEWhacker@gmail.com>

The code to parse arguments was inadvertently skipping all arguments in
the elif block after gl-es if it was specified on the command line.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 718bb8d56f6a24c86e67830a7d13af54df2ebb4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5daf492bac..a6ea578564 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -499,7 +499,7 @@ class BaseConfig(object):
                 self.gtk = True
             elif arg == 'gl':
                 self.gl = True
-            elif 'gl-es' in sys.argv[1:]:
+            elif arg == 'gl-es':
                 self.gl_es = True
             elif arg == 'egl-headless':
                 self.egl_headless = True
-- 
2.25.1


