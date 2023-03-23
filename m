Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA60C77B60
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:22 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.85137.1679605515890162454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=evMf6QuA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so3387978pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QhFR4o5zYA2WdSgvYxndytMsXYtv68RzZWglNyRmag=;
        b=evMf6QuAzEVnOX4Uhwy07CdMEoILdFXDqmdRcMqlt0oNR6pYU/ISA2Nys3AEin1Tve
         K6tqKVqoWQGQexDuixnFuVpfoiwEdrUrRL2QHM72uC1cD9oAIQYWKUGwZDO6dvd2HL50
         VEF2zZUfCHrT2rcKWo7FMwK7k6SwzMI3kuQcMs+w4HA7LgZyBQ9LChlB7GqGJDLtmugf
         hsPk6ZrpNDPfeU1OrOpcO+NUF8qMHtkZVJ1/Rs3HEkR+sECpDJssOzZp+/qybupwLbrg
         /TYESSUf+/DG5wQSRussBiOsAyficS8RR428t39U9jJHhCk2jJF4XGC4ptxb92m59sof
         ReYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QhFR4o5zYA2WdSgvYxndytMsXYtv68RzZWglNyRmag=;
        b=YJOhbbBLFQjMBoyCmaOQDo9lu3WOxU+GpfxsRyn7Qr8rhg14zcTIdTaRq2ppB9DkmA
         tSciXp6PsBrgL+h9Y33q6tmuvER8eAPJbZtjZGxjiuB9bNBnsgii8s3dtFQX17hPdFzX
         Tnolo4L2L2Uhd014EtVGlYa2Lt1dvum+V3k/4V22OgAWWc7Ny1TelcRJFdWGLayJLp5E
         rJdf8RjvIkNml1/LgxHxSdT2iRfTlVR0dF7QSaNItVRbHj1FY+y4MHnow0QolR7sVBlP
         w1utmOqu7WhAQylinZtTkAYZGU4591CGvkxIYbgVrWax0fsVyhepBfa5fnMnJSdDeAAn
         mkgw==
X-Gm-Message-State: AAQBX9e6xdINdgXBWElSZUPWbcqtQW5A/AG4eXjWdkiHS91jlGIzkthF
	X/zkHTAEBaYHLxncNawPbUHWRJH3Z0jV3NmFO7U=
X-Google-Smtp-Source: AKy350ZI1uqsavo/0kyXungh3C+FZxJtgq+J+8uR8HiMXtQMPVUdtGmmoNhzZHfEctlMKnqnh5IBjQ==
X-Received: by 2002:a17:90b:38c2:b0:23b:38b2:f0bd with SMTP id nn2-20020a17090b38c200b0023b38b2f0bdmr373663pjb.15.1679605515042;
        Thu, 23 Mar 2023 14:05:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.05.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:05:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/14] pybootchartui: Fix python syntax issue
Date: Thu, 23 Mar 2023 11:04:40 -1000
Message-Id: <2429ae83400af67b1cff2adb406ec84b3147ed5e.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179006

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
index b42dac6b88..9d6787ec5a 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -128,7 +128,7 @@ class Trace:
     def compile(self, writer):
 
         def find_parent_id_for(pid):
-            if pid is 0:
+            if pid == 0:
                 return 0
             ppid = self.parent_map.get(pid)
             if ppid:
-- 
2.34.1


