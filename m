Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B66CC74A5B
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.44322.1679494933985755057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6oxsJoji;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id o11so19442321ple.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0GnPbiU4WDgqQbkx584UOzAbzxGmqynCkKHWZgUHFI=;
        b=6oxsJojiP9G5kXfIINCkoHuFrIfnhkTkcpCUnxx65uaV1fa62lgeoFdvpWb2+WbG6V
         TwyLN954vuMcr1SIpNKe2zzfZsYPAB6/zi5JOUIhLCHBp6hQ0Pg+5Qqzz+tsPwmwBwuJ
         kOq3PBYrtE6B02CD7ZP3zJa1Y9X87Kximw1HRAsI+02hbkBu6qL4sY6n5jLze84aWoxh
         2NmaZvvg4mnfzyiV6oxcgQzlsbShqH6bqkdvCy625bGqGRFp4MBMcpQD4DPgj/T4NpDf
         rKy+yHVCtt/Hv6P8Pwekw0/N5lNp6A5N1n/IroLo49ywx8gmcDdcmTp1yxQTNztKo5Hr
         3+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0GnPbiU4WDgqQbkx584UOzAbzxGmqynCkKHWZgUHFI=;
        b=4L7FQrEUd8x0b3JIOoxun/plQei5Lu7DUQDFamUBWTJULOejmNX2dkAr/XU1UaejyM
         gL93TnplU1IXiYCFlmLOIAdJ8PrghNl9+2nnJ3uJDpxykYz6ypbtdSVUqJjtMPCtjCS+
         JUYRQpKWNej+RKCLM1fyyoatNx0+l/FKIqa1OAit5yEx22x+MgIWxAgj85gTdfS1hGFw
         1gXWPVoj90+sbEC0xXuUAOnONhyPJp/ILk7aD01qT0iVetOQrdiQjrYDlIFtjcbwaS4E
         7083ilFdfdR0He2ZYBdqf1QqwCILnZWbUFiCPnc3NsP0WVx9nI53StzZ2v0qNMG0Hbu7
         x7qQ==
X-Gm-Message-State: AO0yUKUahlphj0Uv22EElYJQ0HeHnuHHnaDGcF9HdvSgVXsCjmpI1jMP
	3qf67nim4fMS1EJJTfFUAcIlE2uTxmsZy78fl9U=
X-Google-Smtp-Source: AK7set+pqCRy7GLwfW73FcGISPgAlezvMD4oJjvoRVIL2+K4ImyTvqUNiz3fXuf6RZLLIlBwI2vQoA==
X-Received: by 2002:a05:6a20:7a92:b0:d9:e45d:95da with SMTP id u18-20020a056a207a9200b000d9e45d95damr6274046pzh.20.1679494933119;
        Wed, 22 Mar 2023 07:22:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/21] pybootchartui: Fix python syntax issue
Date: Wed, 22 Mar 2023 04:21:33 -1000
Message-Id: <ea87507b74effff0521e72c6484e7d6107e5786e.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178939

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix:

scripts/pybootchartgui/pybootchartgui/parsing.py:134: SyntaxWarning: "is" with a literal. Did you mean "=="?
  if pid is 0:

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9a6511ae618035b8efad01646e37ba28ce1e3f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/pybootchartgui/pybootchartgui/parsing.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 362d5153e8..63a53b6b88 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -131,7 +131,7 @@ class Trace:
     def compile(self, writer):
 
         def find_parent_id_for(pid):
-            if pid is 0:
+            if pid == 0:
                 return 0
             ppid = self.parent_map.get(pid)
             if ppid:
-- 
2.34.1


