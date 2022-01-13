Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DCFC433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.9626.1642084678515125120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HhkzXosL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id u11so5077652plh.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1wg2ICW+vfHuk3dqQEu/WLCyGgpvemD4fX+/sXSR1IM=;
        b=HhkzXosLkeKxg6vntasiSgzj3AFd1XvKCAO4ca5roSwpYmUAYkpnf7dlDqWDCtVlid
         LUp68C7L0Bd9R2340hhhD0WQ6YmZNSYEFqR5/IAfxhqlLjM2I5k48dLGFjgGHZuOslvI
         oj69uAGQSn6AaJmr/lJbRSuUnDuOKXuQpBhKuQ+d4HvJI+NbivK+Wv+f00gwOjVlbQnq
         06k2JhCNdNeA6Wr7sSCOvq//YdcOdgm7B0j75hPArLppk421/fXTjGVSCdXYpWfTGO0m
         bEamCpTItFVxA/ThbClE+hSD5QxnkF2Q0xhvt6myCGlviz3XtrdnYQlTQpluVX7Uo38j
         JT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1wg2ICW+vfHuk3dqQEu/WLCyGgpvemD4fX+/sXSR1IM=;
        b=Ia7K/ny87y3fWgjy4osbJznjybx8To+EkEfQt3YxHKuwutLI/PBh9eLQ/7ZFYSR53/
         jfWHNQO4nQVvWaZIFDBzbp01wdRriN7pWSl+rbnH4a7e3MDvnqa9jqUeUGdxQxjyTZ7h
         pqCp9eaUwVT5r+MGpzkTYxodTpPxweeL0cvdslIyDHMZy4lM8ohLzM1NvObBM2uNMBIJ
         KtB5lTVFK3DfEWSTvsNwD/HINHYWOVMeuUGaUjATZYEdPlJwAtSgYaui6nInGabd/AGR
         YhsNNrusAEoqmy9Xa//AMaFrEFbxPL6JPoUQvlBjSm93iYCLZXIWlx9/l63GgbXKwrKV
         vf0Q==
X-Gm-Message-State: AOAM531otT92g+oC7JtV17thvwkBLU4wh1SoFGeI3Y3BOH4l1C3lws/W
	WpgPWXZ4dDWbW+O+4hjuHRi+IFhPFiW9RVEpt3k=
X-Google-Smtp-Source: 
 ABdhPJwS/4TZWoWOS1OL3BgPJa1P8ioX8NlRwqzqyOzZB3JMYdJshOjqcJu0tA8G50yhDN8r8E4QnQ==
X-Received: by 2002:a17:90b:224c:: with SMTP id
 hk12mr5421157pjb.62.1642084677615;
        Thu, 13 Jan 2022 06:37:57 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/11] parselogs: add a couple systemd false
 positives
Date: Thu, 13 Jan 2022 04:37:14 -1000
Message-Id: 
 <da0d96eefd5d7e784b24cad0e41b9df05443034d.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160521

From: Alexander Kanavin <alex.kanavin@gmail.com>

New systemd has changed the phrasing when skipping things,
with unfortunate use of 'failed':

[    1.623667] systemd[1]: Journal Audit Socket was skipped because of a failed condition check (ConditionSecurity=audit).
[    1.688258] systemd[1]: Load Kernel Modules was skipped because all trigger condition checks failed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 743d09665a4ef743b1fa9ac382a713556dfce1a1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index cc40ee1ac0..1cac59725d 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -61,6 +61,8 @@ common_errors = [
     "[rdrand]: Initialization Failed",
     "[pulseaudio] authkey.c: Failed to open cookie file",
     "[pulseaudio] authkey.c: Failed to load authentication key",
+    "was skipped because of a failed condition check",
+    "was skipped because all trigger condition checks failed",
     ]
 
 video_related = [
-- 
2.25.1


