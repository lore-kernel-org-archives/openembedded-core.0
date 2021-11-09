Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB780C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 11:12:03 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.10526.1636456322722536083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 03:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gU/EmAm0;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id r8so32206206wra.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lymt84p9b9x2I0jub1/chrJ9vsLHP9Yah4QNdM/oMMM=;
        b=gU/EmAm0IbHO79uwmmzJ2h5Na4Sk+ExuLowgKSbtyTQwoIM35GVSoEjXX6EpUZvCo4
         v/m3dN1u6TeRrR73H9iAjT1C7/wozkE9rKyDy80ktI7xu0mwzwOsHE3a6hOmEAE1Ok3k
         ennJnqofE+ijgTgJ3hwVz043owAjhpIG3a+YeuzHVpQbtVDft+uDNnABTsHCZetgVQsb
         4AwIjj8NzxnYgkH2TPm4rrsQaeZv/7I0C72rBL0QGIyYtng9m5kKQ3lhz7nO0unER6Uy
         eJqCyFL8Cv/ivOcNdIvtaXq8CcF+Qw1UT7OfI7R2gfKHbNvF1KiJ9J3rHfv65kwGkuC/
         Tgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lymt84p9b9x2I0jub1/chrJ9vsLHP9Yah4QNdM/oMMM=;
        b=qTNaYvktlcmYVtKRI4fw1kX5eIoC2SBC1ZS5Xhnb9znfcdFtpbmRqoW1xh5YaBIrWU
         BdcN0X0gcxe3I3cxW2tLVyibp3AF6tifUw5AOrQAJ6xMdUUnQN5QqMSWLTexJZ1c1r0n
         UoToVd3NeQIeotlrDW00btTOmKnZxcjPXvHyPd7RYyzbrVOPPjOi7dS/uBaHsy9Wzsw3
         v1aWhMTvCUmE9Au1l72U3TbPIxdYI17SzfbmZofxydMHJ0i0RQchcSIKEZK4/geXPhzs
         m5abXj2nbPnLVgV0UzY/OSbzC/HhsQlX86j6b6MsCsCg3U0W61y7SNnGkw8vgK5E644G
         OzKQ==
X-Gm-Message-State: AOAM532UYsWOddwDwnCKcm7oMzCOQYhDvW9FPjVSRGY22ki2WOdbU1mC
	UpaBVSzNyxERDJuizkJ0omIwiYUOfbY=
X-Google-Smtp-Source: 
 ABdhPJxzLhIv3dMNXW8aHmFYDbw2WV+Qkqzp8BG8EusZRgmjQgQSLqeMyBDpa/aGLFMxG3crq770uQ==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr8189795wru.34.1636456320723;
        Tue, 09 Nov 2021 03:12:00 -0800 (PST)
Received: from CTW-01195.. ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id
 c16sm19043389wrx.96.2021.11.09.03.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:12:00 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/3] sstate: cleanup the sstate mirror progress check
Date: Tue,  9 Nov 2021 11:11:46 +0000
Message-Id: <20211109111148.136675-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 11:12:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158011

We only have the progress bar when there are more than 100 objects.
So we can check for this and store the result to show the progress bar.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 849723d4dc..3f6a1fe99f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -996,11 +996,11 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)" % (srcuri, e))
             except Exception as e:
                 bb.error("SState: cannot test %s: %s" % (srcuri, e))
-            if len(tasklist) >= min_tasks:
+
+            if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
         tasklist = []
-        min_tasks = 100
         for tid in sq_data['hash']:
             if tid in found:
                 continue
@@ -1011,7 +1011,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if tasklist:
             nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
 
-            if len(tasklist) >= min_tasks:
+            progress = len(tasklist) >= 100
+            if progress:
                 msg = "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
@@ -1024,7 +1025,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             pool.wait_completion()
             bb.event.disable_threadlock()
 
-            if len(tasklist) >= min_tasks:
+            if progress:
                 bb.event.fire(bb.event.ProcessFinished(msg), d)
 
     inheritlist = d.getVar("INHERIT")
-- 
2.33.1


