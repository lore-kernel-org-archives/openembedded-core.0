Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A65C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3138.1675840933381944153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nuiv+ZzE;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id g6so7791528wrv.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUrXf+tMMv8LXXfRdxIchNbnlwPmrr7ioRygqutCrwg=;
        b=Nuiv+ZzEQtu4fLDiuAhA9cPaCivAQrAutUx21bH/h6z07/bTJKb0cB49U2FnjUCaWu
         dyJdQNw8+McX9kghvT1oAyZbHbq9fH/9f4UhWmbz8pPSGlIYE2n26vxnYYZirVTWEuSA
         YMYh/jpsHAfRT3dM/oY6jouUjztc6zhp6g19NJnlrycuYusFsJpfCeV2nt/NSIrj+mma
         AF7vd2MocMArlBiNg2iFAErJN1tDlod1gCKuPu/kiviBHsqXvKfGXtsOM01NewHoB/7v
         AgML4Q1BYbqPXdAqsnpKwES9mZVqOlY/qJlr4sW9grANLMobkjSSERLnx01LRQYAtOBd
         JpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUrXf+tMMv8LXXfRdxIchNbnlwPmrr7ioRygqutCrwg=;
        b=nEDrH8aXxS+UHinizT+BVlirhbo1gWPF9EYRjrpYmHL7/Rc7+cYjmt5qjwGMlgfbs6
         e+wzTady89jG6V+YreEia5biPRK26BQtWo7fYYqQbluGaFtDMglZEUwmzc41vZrMkMeQ
         K8Yp3HqBWXh4Lf3J4bcm4m3Rc76ROsqAD2REsdpCFiXvQPIr/68ATivEHah/ZECWjG+v
         2qVYZMj1BJEVXN6yoYboFI7KBJlvQyQguzIY0FLM2JIinRDo6P/TVqPOH49V1Fm2uwEU
         pcCZixcKisfvPb6VDU4zippyEiT7siVgsCv1BkY6dxxH7fDqthoX1MpbjGGEKOsTzQMo
         egxg==
X-Gm-Message-State: AO0yUKUYsMeIDIWJHntCgeCq0MlaXtAPy/Ya7gUR/SX4SrUpyThsDuVf
	Txv3/BeFEPlWBY9nqK8nCeQog8o8lYU=
X-Google-Smtp-Source: AK7set9pN+7+AQehP0oI2Rl/slAnZLtkX31G+w09cmoiicxmDgVHdsP6PUqW0hmi1xk/lpOEDIcKkw==
X-Received: by 2002:a05:6000:1367:b0:2c3:f909:99b8 with SMTP id q7-20020a056000136700b002c3f90999b8mr3268104wrz.58.1675840931903;
        Tue, 07 Feb 2023 23:22:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/52] sysstat: upgrade 12.6.1 -> 12.6.2
Date: Wed,  8 Feb 2023 08:21:33 +0100
Message-Id: <20230208072143.2930292-42-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176883

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sysstat/{sysstat_12.6.1.bb => sysstat_12.6.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.6.1.bb => sysstat_12.6.2.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.1.bb b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.6.1.bb
rename to meta/recipes-extended/sysstat/sysstat_12.6.2.bb
index 6df7bdbb83..f9e5778e76 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342"
+SRC_URI[sha256sum] = "3e77134aedaa6fc57d9745da67edfd8990e19adee71ac47196229261c563fb48"
-- 
2.30.2


