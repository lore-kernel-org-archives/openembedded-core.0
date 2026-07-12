Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925AFC44506
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:48 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9504.1783835499416155121
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Bb/Mi9Nk;
 spf=pass (domain: underview.tech, ip: 74.125.224.51, mailfrom: vince@underview.tech)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-667bae10ba3so1791202d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835498; x=1784440298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aij4URGMB/UyTElt/p02TPGcULtzqCdNoov+1e2UU0w=;
        b=Bb/Mi9NkeRaH5zWuBGpphIqzJMCf55ZFKAZafGIr4d8aoPZgSVMaytkVxDFyJQmn46
         1FsJCevyfNp7TzPUH5YB+I+y5d6Zeq4cDFj1NazWgqRMfrQydz8Z9BA3k8wSgoKvBgyF
         aelxLwgOMbaJnIQiSGnIXsVjtmgS7gcwfwhRfjoNtFUE+/fb4kLLgVEdfxKlPioBSVwW
         CtrvmxNyTvlCpAGEOiEUa9u5CFLDIoj2aPeQFJHq2zRmO4sdywYHnTYzUaeXKd9JSX86
         ggca+jMKFjcyDE7/NnNAD9Z0I0WEN6oynHx2CynN/Ea7ulq056UkGlISslohzWxxrIC9
         P98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835498; x=1784440298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aij4URGMB/UyTElt/p02TPGcULtzqCdNoov+1e2UU0w=;
        b=izOFuOVX5evMSPeBYO7yEb7oYL0r5YmwEBM1TBc2YuKsB9zRXOw4sAJ8NAEdZLms0k
         a6DgwIkSf7N+P7Ktb/MRXkSqsgNZOo2gKlF6IzFI/82EoZjKD/5hhvJ+c7PDd94+vhpR
         JuDMSwWRJM4H0Rw/ADl+LVWZD5Ci1GtlXwJpUFQpsGlAh/xVeFdtL4h7g0NiFuBzT1zh
         Ryi3kLK5Rj8YlYADUeWvS0rzXyQMRyNjMgQXckfIKQWgCmD5p/RSeL4kXKnW12K13zoh
         eS08OUnbIpTRKsh1X5PsupjFz8ec0RNJi6VvNaqnjB7F2/UQ5nQc8oS4CEV0FQpoLO7K
         TJeg==
X-Gm-Message-State: AOJu0YwOw5edflRu31q5RwqgYOdpsvkZi1muRD0whxxY/u7Hmj9PEPrp
	W/bCH0jUNr8VGFrtqA5497jAvnnC4INu87/YMa3UP+TCngRoukkhy1WHN3CQz84JxYwpEODtK2y
	2lXu2v2Y=
X-Gm-Gg: AfdE7ck84sgGz6Td3Z25X35zm/MbkCvnCCxcT3G2/Ct99w3XEiuxUbQ7aRDMdOER30+
	LiP7mdqMsh53O2Jv8Pkh9J1hTurMqt+xHUjD1wc75sEI5R/4H3WjJpwk1vS3lRA23Q8ca19yWkh
	nBQhC9uJ7m61pxV+ek2vIb2bIClKVbvZ+sjRb+44B8XBkAUXZxgQfy6vfRFYP8PSXGvQp2bwHXE
	ubAJE4gLD2GGdciM/JHLKsyCBYuHXC80IuhozGWNdYOJoOPFiSZEPHgh8dfM/utO4XhIlrXx78d
	S8+KLAMcTQy+4W+kWApdiS9/fbaG/v+ODMwZowHE4t0+hoijPdTxyJV67ZyKAj1Vw5ojByIi+rq
	RjGw2yRoZKQ5QRpBhL17RsviEJ8w+yj3N31KWM4YlOMzr58aNN4mXMUFJM8vnYR55VRijqXlrrG
	LQsRDbJAUdH/foqg==
X-Received: by 2002:a05:690e:d5b:b0:667:889d:7063 with SMTP id 956f58d0204a3-667d7c3e4b7mr3449900d50.85.1783835498507;
        Sat, 11 Jul 2026 22:51:38 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:37 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 11/26] watchdog: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:39 -0400
Message-ID: <20260712054954.4063745-11-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240736

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/watchdog/watchdog_5.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index c166ace665..8ce0c2fc5a 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -65,8 +65,8 @@ FILES:${PN}-keepalive = " \
 "
 
 RDEPENDS:${PN} += "${PN}-config"
-RRECOMMENDS:${PN} += "kernel-module-softdog"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-softdog"
 
 RDEPENDS:${PN}-keepalive += "${PN}-config"
 RCONFLICTS:${PN}-keepalive += "${PN}"
-RRECOMMENDS:${PN}-keepalive += "kernel-module-softdog"
+RRECOMMENDS:${PN}-keepalive += "${KERNEL_PACKAGE_NAME}-module-softdog"
-- 
2.43.0


