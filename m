Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C659C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 18:29:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1598.1717612178517960753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 11:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cnuasunB;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4214f52b810so2157985e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 11:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717612177; x=1718216977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5kHf6eiheT+iamvKCpdjwJgxExcdLyISQofwtQqKMc=;
        b=cnuasunBstCfAYUV7xFwZ7ZN3z/DaSA9E9/8VRlVcKcWcBxl2uhOkB6x5iNcWTOQqB
         cZ1rNKplfoP1a7zKVKGLAQOuMjp8NctMqkeixXWg/3MywDpueuF/WDmLMd9SGJa2tKeb
         UPM9evt8oQS3u5sdYaO50JYhZUBvEDEhLB6SA+RtRkNp/mbr/9OHnZ6c7ywdkf4xRbrv
         udQK3rVcH3+bjHOwjkjQ0SM7t3bwj8+2FGJzflRSTaaaOvHYhdCz46imyI3CnJzl+znB
         uLrRHqDcx4YLa5pZY4ViH6MCc82OaEooj+iBnkw+yLlhRiYdjWRG0jnj+UocHtzRq31N
         o0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717612177; x=1718216977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5kHf6eiheT+iamvKCpdjwJgxExcdLyISQofwtQqKMc=;
        b=aea4XIdXgYpNgE8SrFBkgsZ23TwzH4oLkVqIV2Yn7Cc133NrTBJv+GNSWMWaOxC7vV
         aOlBq11CuVUN5gboAI5uULeMWNy8AwrRIJFEi0+5u6YHyx6Y9uqohq1dv8g9/NdO1chS
         UX3ztXUrYzKPN8zTGJ87+r9qCTCpAcuQIbAJhb0WMdTUhZggUdK+R7EqGKeb+xN3cCts
         xb8359UBhH391a/XgXtssY5jiQ2Vv3OjJ+6b3XQieuFUALLL6R6Kd/2tz+KIJW3Bm1DR
         MjyUG2fzweGqiFInzcERXE+tSv2mBlNc3lCfb1hl/1Cg0dq5nJ2hXXffzZCWFNTMG8rx
         IokA==
X-Gm-Message-State: AOJu0YxsPN/Q04zpOCK/MacJSAnx7fRf5CGZDrmPK6sPZ11DwYog0oyO
	23ZoxZ/Df3RvFx4Y+tLST9AIq8i3C6QKBJGC9JpLUqqH8tQkawleyf+SYA==
X-Google-Smtp-Source: AGHT+IGXjMc4UH+6FSl83RrZHUNAYcIPCYzPS3yt1d4RsI3+9QMmBYJrXp8MJpVxS7h13Qt8qtJzMA==
X-Received: by 2002:a05:600c:4f49:b0:421:36da:9438 with SMTP id 5b1f17b1804b1-4215633a175mr35186915e9.28.1717612176673;
        Wed, 05 Jun 2024 11:29:36 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580fe343sm31915225e9.6.2024.06.05.11.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 11:29:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v4 2/2] insane: add patch-status to default ERROR_QA
Date: Wed,  5 Jun 2024 20:29:25 +0200
Message-ID: <20240605182925.3890273-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240605182925.3890273-1-martin.jansa@gmail.com>
References: <20240605182925.3890273-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 18:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200379

* it's enabled for patches in oe-core for very long time and I was using
  it for many other layers as well, so most layers should be in good
  shape

* it's also possible to disable it for individual layer as shown
  by oe-core in:
  https://git.openembedded.org/openembedded-core/commit/meta/classes-global/insane.bbclass?h=scarthgap&id=61a881fdbe8b5a21c6276b8a5d06cc30486b1eb3

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v4: no change

 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index bd05da0378e..06181d9059e 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -45,11 +45,10 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz \
+            patch-fuzz patch-status \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
-ERROR_QA:append:layer-core = " patch-status"
 WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
 
 FAKEROOT_QA = "host-user-contaminated"
-- 
2.45.2


