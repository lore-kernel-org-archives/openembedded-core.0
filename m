Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B7AC43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.26316.1668880099409590250
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MrXVET86;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso10955220pjg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q05cbEM3sVTlspnRwmmNYIUiOM+ukLZ/qck9O9Bh1k4=;
        b=MrXVET86lx4y0IbdWI+R7kJ9JSE/F7jQauIT79aO025JbmwavYVLJ3KC3YQAhnecP/
         a17vkS/V4mLwb9wmozMHbqaHzK9oHhFNVLXY+gaWMe92RZURFN2R8CGcjOJfhWrcR6qx
         BEDwy0u1Io+RXd625x1ck43om57UOuY2OZd+fCJ2N6CLpGKHX+UAmnHIAx+4U8FGLlAf
         ld+wrl9EG5xHK1dMS7b7mwgfL8hp3nYRZw50hwzYWqjI3ltcmoXgRYEW51mIASYqM5mf
         Cg0eXPCocw7j6wqvxL/ki6JA69ch9P/Yg30kLSOSwp+z6sUG5OdEsxtjBuqMj3Exmzb7
         DdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q05cbEM3sVTlspnRwmmNYIUiOM+ukLZ/qck9O9Bh1k4=;
        b=3Rd0uya6Dm3XpWsk+M3qthEG/PjdjnsIrzGNj0JYiQ/IX1BKqxTgmdDDdMpptifOvW
         aMaicxfWaf9uumFX5XLKuKWEGCFJ/4d507m7tnr1MHWs+NFi5kZhTM+NmeWPIbWURNHz
         70fAFdKin1MbRZyae83I7XPCIhjEietLeCmX9F2yohNBBkPUXUWGxoGKp7MaqchZJN3C
         wgnDTK56iNaIorJjnWkKjrIJoUnJz9cDz2AYyM5S/ufsPynq/SoF6m2gJ1j8XU76iw9p
         GGXfQgZdqNORcX2K5NZIMkSy1jUnsdi0L1wAUDEF3Q49Tj3K4Atob+oXuXZbpgQluK2p
         LUBQ==
X-Gm-Message-State: ANoB5pkjFe40HkPaH9iwkX8rrkRr26tLQuS403BSJFhegkxT/p+1x8hi
	rflF3kNYJ3NF9YJJZE4I3pvYGL3MbHN2FfEXYjQ=
X-Google-Smtp-Source: AA0mqf5NA5d7GtM9ixGzOS9SqDsTfNV25MK6VMZdWmWZ6LaMWZ5ZAyfsIBtcXWDQY7m8k2g1xLYxBQ==
X-Received: by 2002:a17:902:d711:b0:188:c7b2:2dd with SMTP id w17-20020a170902d71100b00188c7b202ddmr4658041ply.88.1668880106054;
        Sat, 19 Nov 2022 09:48:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/21] golang: ignore CVE-2022-30580
Date: Sat, 19 Nov 2022 07:47:44 -1000
Message-Id: <fda0d9bc52451a79e93bf506feed7e9948afb3f7.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173534

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Only affects Windows platform, as per the release announcement [1]:

"If, on Windows, Cmd.Run, cmd.Start, cmd.Output, or cmd.CombinedOutput
are executed when Cmd.Path is unset and, in the working directory, there
are binaries named either "..com" or "..exe", they will be executed."

[1] https://groups.google.com/g/golang-announce/c/TzIC9-t8Ytg/m/IWz5T6x7AAAJ

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 8c7df2dede..a0eaa80ed4 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -65,6 +65,7 @@ CVE_CHECK_WHITELIST += "CVE-2022-29526"
 
 # Issue only on windows
 CVE_CHECK_WHITELIST += "CVE-2022-29804"
+CVE_CHECK_WHITELIST += "CVE-2022-30580"
 CVE_CHECK_WHITELIST += "CVE-2022-30634"
 
 # Issue is in golang.org/x/net/html/parse.go, not used in go compiler
-- 
2.25.1


