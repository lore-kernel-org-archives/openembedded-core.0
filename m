Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B887C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:29 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.6224.1636603767819011618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mhu8lV88;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so3180634pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XyBGH/EPkj2BvweKeZ+plfEMDqxxCO/BS/OBbEwn3u0=;
        b=mhu8lV88g6+V8TWWPbdI7au7b85cDYAPFtQBfOjXpGGOp3E4B5xU2hiaAgHJCDccwY
         jFDXotnvfordqa5JIeGn7iV1IlteY0AQR4rUigL2S8Es0v+WQA+/L5TGDGaK347KvEBE
         XMFGYAtQhNGBKLJa7k2pdcUu6m07iodLDABs/GuN2IMHtW9jPMhFqUsad1SouTS/YXe7
         GilT1tLvjjbgEFPn3DN0KhavaA+LyzySIHQVWkLOSytLBKduzLhsPcepNagmDaPlDIYU
         LrmY3XmJS7/0a2RQJh9FF60TPdReC+m+Qks0TScKcmSX6o86roJH5sHXo2ygbGH6sAZ8
         BJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XyBGH/EPkj2BvweKeZ+plfEMDqxxCO/BS/OBbEwn3u0=;
        b=D1ghjFtGywpS0C91d6lKfHtqH5XsRW7+MYgWQEHQygRucGJ2YuuTXA4p/oKvyPNoKI
         QsgMVL78H/gRRcbLQpEUOn7oUg6hcpyaH3SlSUJ8GMiaYVYf67ZaLWvisDVp6rUyvOS2
         j6zSV4utlKhH9rA1J+J+M17KeuL1LLaGloyKScREITAfpE65pv+OFgby1dhFQ+q5j2nU
         bZ0tGLn4G79ky/ljVJtWOUCAo9pb6mA3l64D9GVoTAPHPF4qM+Pc7UcGgS6fUwa8huOW
         RzwHXP1ZbnSoOKw2IEVuwzMEF/hhkgbTWhVsOZJcpcw5ncsFACYRHStcXFAWbaxtRA3n
         rCdw==
X-Gm-Message-State: AOAM532dzCFpuP2WEcFblBKrIs3g3w5SpUCk3nLJGNOQvPNZknVqkFDa
	3+4FDVKkNqF46vqoGZdYqTK3jIkEH910GSlYT90=
X-Google-Smtp-Source: 
 ABdhPJz5832j12mJt318S8QaMzKd5psOlYshHt9rSaX6ZZ1UAeF4IWRn8MgaiVCnWcarhpFUbe1dMA==
X-Received: by 2002:a17:90b:4ace:: with SMTP id
 mh14mr22913941pjb.164.1636603766966;
        Wed, 10 Nov 2021 20:09:26 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] sstate: Avoid deploy_source_date_epoch
 sstate when unneeded
Date: Wed, 10 Nov 2021 18:08:37 -1000
Message-Id: 
 <884e44701ada57abe4d8ad9ece424435be25c6a5.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158144

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This sstate task is only needed when depended upon, it can be skipped
if there are no tasks running that directly depend upon it.

This reduced the number of sstate tasks in something like an image
build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 601cee016da5c7505915e26641a085714de175ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 50d44398f9..c2720cde92 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1060,6 +1060,10 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
     if taskdependees[task][1] == "do_populate_lic":
         return True
 
+    # We only need to trigger deploy_source_date_epoch through direct dependencies
+    if taskdependees[task][1] == "do_deploy_source_date_epoch":
+        return True
+
     # stash_locale and gcc_stash_builddir are never needed as a dependency for built objects
     if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
         return True
-- 
2.25.1


