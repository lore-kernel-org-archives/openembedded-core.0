Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3D6C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 22:05:28 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3743.1638482726680316313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 14:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fkc/qW8i;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id s13so1682778wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 14:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6kX5Rf2p5YjlcOT19aACZM3d86ohHFfk0Fe89FTsn/g=;
        b=Fkc/qW8iN9/YflU/TZ/GFmkx3DBg1Z5z08brqJYipShkFGHN56HMMZDaauBkIz1nwF
         AWFtbx0wKWMoPVpeihIHUHpW5+bo/owzaLhknrx5xWanjrBnz2Sw1MpPjN17qYNgMTMu
         wbA3UoqGr6jLzz6dGKWbzQtBpfx3mHpxcIXk0LRxqWt4upDBEWv0KhdyjHRftuzIVySY
         QZ3c0cAvBzYOzCEPxOgtl81QDPygpOMKpgeUH5tcy8y61gpQIETvcBC1gW3UWVTpT17x
         NhnkHqfLR2F07OL+SsO+gFmj/tr9ccUThSiKPSdIb9PJ5QKo1tKPvJi+lPXF+A1qLg1Y
         +FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6kX5Rf2p5YjlcOT19aACZM3d86ohHFfk0Fe89FTsn/g=;
        b=4jok0WpLmcZ/QQmydT7nZtyT04e1zX9V4JCMWxmvMFer06wvM3hbNn1jHLwClBLrsK
         C/OTwGYeNZV6RhidTBzt97V0zJ/8ZW3GgqAwwV4TK3V7u2GjNTFG3CxrayFaGbrNXw6l
         FKqJKberwDOo5yVLW6EF59VbU3nNXNY4+ORa9sFEWFpDgqeEq366mTfbJIH9veEaOviX
         DUp7zBInuDcs9O863BMEh8rgo9lVlYYV/xeCEKn8yOlMv2rLxjXuxeuI54dNyWi8Xin+
         XWKZPFoBxglZ15H5LAkeX4KbNeHMosn6oPLW4FW2AzpvG+W9cAOy7lbeNHQ3SZ4VDRCM
         fy7Q==
X-Gm-Message-State: AOAM531uQZvv620K9NcYJxGxjcg4/U6tPttEAlOQHTgrMNuYx8QayfRJ
	N4JmFXS6DfcUuxNyDpwMTEUokxPlpzU=
X-Google-Smtp-Source: 
 ABdhPJx5fIuzJhpx4Z5JtEY2IwUrSslH07ZrP/+uE5bLTpUp9dgLm3ClyFDGJwHzt/kO0LDgngMoow==
X-Received: by 2002:a5d:6449:: with SMTP id d9mr17422442wrw.332.1638482724937;
        Thu, 02 Dec 2021 14:05:24 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 a10sm3389764wmq.27.2021.12.02.14.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:05:24 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] sstate: use nproc for tasklist size on mirrors
Date: Thu,  2 Dec 2021 22:05:17 +0000
Message-Id: <20211202220517.2106590-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202220517.2106590-1-quaresma.jose@gmail.com>
References: <20211202220517.2106590-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 22:05:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159107

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 5e404d7cd8..9efd334a59 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -997,7 +997,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 bb.error("SState: cannot test %s: %s" % (srcuri, e))
 
             if progress:
-                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
+                bb.event.fire(bb.event.ProcessProgress(msg, nproc - thread_worker.tasks.qsize()), d)
 
         tasklist = []
         for tid in missed:
@@ -1007,13 +1007,13 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if tasklist:
             nproc = len(tasklist)
 
-            progress = len(tasklist) >= 100
+            progress = nproc >= 100
             if progress:
                 msg = "Checking sstate mirror object availability"
-                bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
+                bb.event.fire(bb.event.ProcessStarted(msg, nproc), d)
 
             bb.event.enable_threadlock()
-            pool = oe.utils.ThreadedPool(nproc, len(tasklist),
+            pool = oe.utils.ThreadedPool(nproc, nproc,
                     worker_init=checkstatus_init, worker_end=checkstatus_end,
                     name="sstate_checkhashes-")
             for t in tasklist:
-- 
2.34.1


