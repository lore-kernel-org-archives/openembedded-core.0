Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCDDC35263
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.2584.1639608056831262393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aZ62OpX6;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 z4-20020a1c7e04000000b0032fb900951eso383468wmc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PC7NcPtA1GmZBoq5/06/FknxR7gEZ80fgr39YZnbAZQ=;
        b=aZ62OpX6KpVwg4a2OnKFiSByKC+Io6bg1V5Bx7R9v0kvYv+014IlHxGWfH0xCBPtii
         4FOt9jUjcrk/6WhKXbjGDDhMtcksVUIjvwiCMhe7f6MSls7PwHxUa8gkZkuzmgcErJTF
         7IiJfBnpNFuzRoITqFrVaFhk+A4MkXYnw+z69lHPpPMLOVO9xQbLTxrwsRbZwmo2WreV
         fc12YXn/sCMBt5foqKGGxnnYMb9oR8AkL8nc2IMbFqeijhBVOe13nDVJhpnlml49TdLc
         kiYkQHd7lNIwxWJlLHzLMfqCJ5rV9eBneLOYVBBC7SVv6U5stn5c/mKK0lMJQUVpPpNY
         Dmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PC7NcPtA1GmZBoq5/06/FknxR7gEZ80fgr39YZnbAZQ=;
        b=etXF4ojSzWifn4FIag1Sx1yGEzPaUuIOM2e/fzWZMUgtyqvpZID9zcFg+rnyU0InUw
         cnMcTygMgi2kMa9PjB/oK7rjwotfUyL7XZuG3+yaRFwL678hvQHNvuMcx0ngx9qQERJh
         Xv1gAM/5xF/i70n1qhI54ZglaOrGySbDYWPnXE4rJlg1UmFyENuA9l7ztK3lixt40yox
         yLFx0Hi+PuzcZOynx289JPwRJCxUvGETS60bE2a3oB9oOxIw4WQmjQKDpSh0MwmEE0Bu
         Sy1JINqHL/K8XhcUna8I6ob6ChktJglh34DjxocnMH4zikEUKDcBzJ8jqtCAeXdXZrcb
         JajQ==
X-Gm-Message-State: AOAM532JHCpPfZ4TtGXFUiWxV5RAOstb/LgAXZ3GIU2i5wrtmr8uFdz4
	o7dzfVXEVU1EUlrmnhMbfclKqvcYVyEbEQ==
X-Google-Smtp-Source: 
 ABdhPJwl9r+GYBE55sH4c2AUASBy5ybGvSIZnH9POYMTYac+Tn2klGVWvmsRa7v6+CwDXB06lJvLDQ==
X-Received: by 2002:a05:600c:4f03:: with SMTP id
 l3mr2226007wmq.47.1639608055506;
        Wed, 15 Dec 2021 14:40:55 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/26] runqemu: additional setting to force software rendering
 with sdl 2.0.18
Date: Wed, 15 Dec 2021 23:40:34 +0100
Message-Id: <20211215224034.1814148-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159768

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 410d2a9939..d49f128fe4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -474,6 +474,7 @@ class BaseConfig(object):
 
         if 'gl' not in sys.argv[1:] and 'gl-es' not in sys.argv[1:]:
             os.environ['SDL_RENDER_DRIVER'] = 'software'
+            os.environ['SDL_FRAMEBUFFER_ACCELERATION'] = 'false'
 
         unknown_arg = ""
         for arg in sys.argv[1:]:
-- 
2.20.1


