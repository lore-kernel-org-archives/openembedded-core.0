Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0854DC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.7854.1646406321119058237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7u/MFIBU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id bd1so7936774plb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r4hN4GBzIIyUuusjGSnt32Fbvnk84gHPgl4x/zvUKzc=;
        b=7u/MFIBUXiNRJK3vpq00O9g4woHVic+XgqdCKc7w1kOp++WZEBUMJfwrHUgghNXLUU
         6bhcY1wIn1oCVmNxHfgfRuTM+M8+mQPiy1Pw7eT8q4EgAQD19HCcg61HQToqBQ170MJJ
         d/hP4yItz95yApehCrx856iNmYdhF6wfyQL4ftw5vCHWx8XLulTiwXbioFtmbnOp9GFQ
         FDdrEe7Bk1bTyC8n1m8VS1JIVUNZzwXsC7nrh8gUQr7Hmq0QHjB8zg11dZ7/0XjoGM2+
         vLNZc262LJxElARpdWrfO+vQvUftBeMeIY9OXuGrVRD7eH4s3sswesLVFUnJUQ50la0F
         MGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r4hN4GBzIIyUuusjGSnt32Fbvnk84gHPgl4x/zvUKzc=;
        b=b1/JLx8JAkvzVMyPNOCyj0Nv5pc4jzdp5PB0wcP+rBacw4jX1Z0yiqWNkwXV7NWHXa
         Bk4IYQbjthgZA8SzBr4QqNiUCA+Ru1vsFSC1tgIbdo4etjvu4cZNt4aTYBcs60HH6Rk4
         RFu/R02Fx7Shwz7DNPsRTU5sLJ3RmDy5y4fRDWrwXwDYVy8gLRkGEo4TuTmcOxpNAwaB
         WQHGDNCXjLmuXvmG4B4lPSlaXq0l7XVh1EewrwzAxXSbWNidmuiP8XKoH5BFFy8Ow9Ry
         IWNtPOWR+u49YQKviyYq8/WGSpj3FSum3OCFqKj+RtP/ZNHeRrEB+I8lzBe/363cCAhy
         Z+Lw==
X-Gm-Message-State: AOAM530TpfY6D1YGSAhVbmrAm+3KkTXo73ROC7Ii9oDqgpvoxQHOWcEb
	GQJxlxBB7J7GuRLIycCU9+n2QzaYIWh8Zby5ofE=
X-Google-Smtp-Source: 
 ABdhPJyXemkAVGG8gqNdBcOKbPXokAcjwCZfEOOZWqKlAoDO7Mh9USMRH1aqQUUnsp2cGRIjWODLMQ==
X-Received: by 2002:a17:90a:d3d1:b0:1bb:fdc5:182 with SMTP id
 d17-20020a17090ad3d100b001bbfdc50182mr11203920pjw.206.1646406320177;
        Fri, 04 Mar 2022 07:05:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/18] buildhistory.bbclass: create the
 buildhistory directory when needed
Date: Fri,  4 Mar 2022 05:04:24 -1000
Message-Id: 
 <de89dc125758f828a7886012bd9b1c8a1017ef48.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162735

From: Jose Quaresma <quaresma.jose@gmail.com>

When the BUILDHISTORY_RESET is enabled we need to move the
content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but
when we start a clean build in the first run we don't have the
BUILDHISTORY_DIR so the move of files will fail.

| ERROR: Command execution failed: Traceback (most recent call last):
|  File "/xxx/poky/bitbake/lib/bb/command.py", line 110, in runAsyncCommand
|    commandmethod(self.cmds_async, self, options)
|  File "/xxx/poky/bitbake/lib/bb/command.py", line 564, in buildTargets
|    command.cooker.buildTargets(pkgs_to_build, task)
|  File "/xxx/poky/bitbake/lib/bb/cooker.py", line 1481, in buildTargets
|    bb.event.fire(bb.event.BuildStarted(buildname, ntargets), self.databuilder.mcdata[mc])
|  File "/xxx/home/builder/src/base/poky/bitbake/lib/bb/event.py", line 214, in fire
|    fire_class_handlers(event, d)
|  File "/xxx/poky/bitbake/lib/bb/event.py", line 121, in fire_class_handlers
|    execute_handler(name, handler, event, d)
|  File "/xxx/poky/bitbake/lib/bb/event.py", line 93, in execute_handler
|    ret = handler(event)
|  File "/xxx/poky/meta/classes/buildhistory.bbclass", line 919, in buildhistory_eventhandler
|    entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
| FileNotFoundError: [Errno 2] No such file or directory: '/xxx/buildhistory'

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 97bc2168da7dbacdfbf79cd70db674363ab84f6b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/buildhistory.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 2746996cbb..6a1a20653a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -865,6 +865,7 @@ python buildhistory_eventhandler() {
                 if os.path.isdir(olddir):
                     shutil.rmtree(olddir)
                 rootdir = e.data.getVar("BUILDHISTORY_DIR")
+                bb.utils.mkdirhier(rootdir)
                 entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
                 bb.utils.mkdirhier(olddir)
                 for entry in entries:
-- 
2.25.1


