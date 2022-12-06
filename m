Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDA4C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 05:46:00 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.40633.1670305554455985948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 21:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NazlPnd+;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so17038121pjp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 21:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Inh9Fwew31GCL4WprIaVtTiAZvqFgWSTx8eg7wj7ESg=;
        b=NazlPnd+VGZldFjWYnahDhnlvCqecuQXpU5rw3FY3iC72IdiL1NgNFnXz3SgQ18eS4
         s0McUejHEwVSKvvAZ89g6MEqGW2Bsp2zmWBV74nuBV+zw9O7mtXBgA9fqf7GbRn4/9TN
         93xyMQsPLNneC8pfp3YjvcTgj8QO/qCyFmnLVIowL8RrVsWkErM1ylaCGkSKltuD9eBH
         17hEJ35aIq6fGautcGtaPqaoQHCdP6yhAxwnto6dKg4vteDu5ofo6BcSJu0LNnKG0/QZ
         xnrkeNi/pfotO782yzfSO3NFXo7lR1oQ+vVIjFN0/tXFNfGuc4vvzgN9uVQMpWs605TQ
         axXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Inh9Fwew31GCL4WprIaVtTiAZvqFgWSTx8eg7wj7ESg=;
        b=4nPbI8qKIekoWArRdEUvq/RWz1ABjOnBmvUGDYrQ6/OIerSDleUB65aBz46AfGMVrh
         CoT+EpzWZuxmXSTX5EODhiQ4NflaTBWXCtDQiVHclKsOLOSv2/WG52rOa0qGJTx32ODw
         omMAb5XT5OfW/xIbzdZ4RAZcEvu+heSWUpZny7zMTUP2KBOn2fgMLNMEkJHHAuCjqHEd
         CUkhH33IyM+41BqxQf0ElyaGP3ruSycwjfUySia026AAgWI66l9Qpq7QQQxfFZ8NmZfY
         gT1dQjt/IOcAuD2BPnUjUwvxXvRa5imcmwjrrba/dav4g9IigmlE2kvlTt/BtB4dj434
         Kkyw==
X-Gm-Message-State: ANoB5pnC8xKm2wVpi/AV4zfyBXed61l06hFaGHAQXvlkXbvxnSjoG0k2
	crYuKs+E2IBA7Ij3irAXt4feQCXYA4Y=
X-Google-Smtp-Source: AA0mqf6krkta8BTX6KhRY9ntUGrQbB7pltJwT8XAEHYWXkwZGEEY0It6/t8KpyzBCWyBQqP4V8KS0w==
X-Received: by 2002:a17:90a:a616:b0:219:6afd:24be with SMTP id c22-20020a17090aa61600b002196afd24bemr29142216pjq.0.1670305553762;
        Mon, 05 Dec 2022 21:45:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id g81-20020a625254000000b00561d79f1064sm10804043pfb.57.2022.12.05.21.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 21:45:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] bluez5: enable position independent executables flag
Date: Mon,  5 Dec 2022 21:45:50 -0800
Message-Id: <20221206054550.3218012-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 05:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174314

texrels are generated while compiling on x86/clang because pic/pie flags
that are passed via bitbake do not make it everywhere evenly.
--enable-pie is default way of getting it enabled in bluez5
PIE is enabled by default which ensures that textrels are not generated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a8eaba1dd6..976297127d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -65,6 +65,7 @@ EXTRA_OECONF = "\
   --enable-test \
   --enable-datafiles \
   --enable-library \
+  --enable-pie  \
   --without-zsh-completion-dir \
 "
 
-- 
2.38.1


