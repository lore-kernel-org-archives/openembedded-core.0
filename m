Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3083DC433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:25 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.32832.1635699504599170530
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NlLZTsPj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id gn3so10634845pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rLMDnQRJ/OVBJibpQ1fq+N8QxgCWN9yEWvRIcJ0tgHI=;
        b=NlLZTsPjLl5y65KXCPDQcLTwl1PiOnXSSAAhnck8c4EuOiZNML3Z0XEBoS/TmwP4Db
         qvsIJPLBYJAtjzOJW4+rEBEjSQA4PPsrfM532kYNefvf1ax4vmZHPnrB5/7AP1zxNCLR
         el8xtSV1YZdhInyMpjFDa13lSQL25cDn+2Z/jiqrHNviOVyoapso3IXLM/WNxig9I9/e
         37teY2tG5kYw0usODSVoS9ORBk3aMU1cR0dfmT7Ipzb0pJxALmsj+gmPyFqOh7JALy75
         2x3y12Cw14Ss9Sud9xKymGjMIZ0+EckyzY60VbHGLvcQFaYqgrPYn8ApX03LrctWH3+T
         8a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rLMDnQRJ/OVBJibpQ1fq+N8QxgCWN9yEWvRIcJ0tgHI=;
        b=hOw4qLqPzbQk+W14uI03PDsqYBjem5mpS8N4FwzbtzCy+/VyvCQ9W6c8NJzmGSWDYG
         fEYJhse+J0es/FUh7pNPjwHHRFc1WrO9toXPDQdVtn8FsoP71s56hKqNd4Qir1vFV+QE
         F7cJsa4zhRtLn/HN06iT9NLmOj9ve6GanUybqDpq6h7wL3sApuoVX55kEJUmO5iOKUCH
         aprZAF3eSUTfk1OB2RtVhn65neULkL51XTJvc18NLlqBpDhN3k696dijl43omTnJQs+h
         6Po1+cwOtlB8AFO73MDuuBCTgof5g6fwBXcHEXgia+nBCN3jNU9pbjbNQv8u5BD0devo
         NpVA==
X-Gm-Message-State: AOAM530ZA7lTp8ncPf1GUqSuqURPi30lfMAq3uq5DhZ5NRPA4l8GNZUS
	aSGN2pLZMXVjO5Ra15sZptQmYGzdDXbv34PfQoc=
X-Google-Smtp-Source: 
 ABdhPJyzFoiwe28RgILKxuoSVbCEXCozHEpRNemrHlfyyUcKZ2DXrv8xGTq9lhSZ5NPBgrNBjVp1Pw==
X-Received: by 2002:a17:902:d4d0:b0:141:c13d:6c20 with SMTP id
 o16-20020a170902d4d000b00141c13d6c20mr9670145plg.44.1635699503633;
        Sun, 31 Oct 2021 09:58:23 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/29] oe/utils: log exceptions in ThreadedWorker
 functions
Date: Sun, 31 Oct 2021 06:57:30 -1000
Message-Id: 
 <3bad17c8cf58b2bfc36a1de754fa47fb344bd5d8.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157669

From: Ross Burton <ross@burtonini.com>

If the function a ThreadedWorker is executing raises an exception, don't
use print() as that mostly disappears.  Instead, output it to the logger.

This is done using bb.mainlogger.debug directly instead of bb.debug() as
this allows us to pass the exception instance directly, which is then
incorporated into the log stream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f1ea25c222b344dd8b784b2bc73a6540ab30274)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/utils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 83d298906b..3e016244c5 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -481,7 +481,8 @@ class ThreadedWorker(Thread):
             try:
                 func(self, *args, **kargs)
             except Exception as e:
-                print(e)
+                # Eat all exceptions
+                bb.mainlogger.debug("Worker task raised %s" % e, exc_info=e)
             finally:
                 self.tasks.task_done()
 
-- 
2.25.1


