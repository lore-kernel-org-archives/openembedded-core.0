Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4175DC4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:23 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.92059.1669557382482283385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=v7J4TGpk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id t17so7225685pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqWRIsFBVun9EDbTAmYPv/bsD+oTts/wQn5/toTCfm4=;
        b=v7J4TGpk0rNfVrgIRdrxqgtseqkwfCKJGtpHJz6tth9AzxfSr2Kmyw5yP8MkxFih+t
         q2ArENRdZim/jrt0vQZCDI0RZh45rz/eeIREVIb3EEPC6xkEPH6nhXn4CJMfL7KmHupC
         OmOdjDSahLwv63k+jkVIiH0o0tWpAwzWigGV838CBEcKbDPhi8c+lItuoWeIXySDNXtq
         w9SqgvdOu7kxzZP4uzae8Uc5xRYhhSN5sF/uDwJHfnA1U8zJuMlK0fNe8Aby8cE/Yt67
         N7LPqJOk63CHN+KMf+CPlfJyoDJSowQyL/7Vt5mvzGOG4rYl/VJnu8GgEw7oOsY93M58
         fq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqWRIsFBVun9EDbTAmYPv/bsD+oTts/wQn5/toTCfm4=;
        b=G9T2ZAq38rtVgg0AR9Ngzq7Mf/glfCLEQnZYAf6mATXDxyQXsnOqM5ev3nCMUmPiTu
         75cirJi2gA02nZ62yD7/6j/yjVbtiDIv8kAnsnlteXssusEOxtCpr2L+Vglm22fp3mwO
         SbOP4AMycMQKZrtPfWDPXxZyRkSyDFFUubo142Ixpw7fu8KO5q4dKi6D5bekz/dtCj69
         g8D4mnJTohD/TQJl54MGWs/gJ0gulogbtWsVGGwfLoXlwXtmDG/ULgobK9gnQJPyHKn6
         PxMRhbPiKYtyV/M0hLxBjH//w5oD8Qnu/Xa5y3x7h/LaNl9JWEDvco+UBjSZW28wk/iZ
         hqDA==
X-Gm-Message-State: ANoB5plxRMZqOsk+2ccfl0UYmyMMzZ0KNGqRi6KT0ne+WZDRng4djn10
	ykOz0HwFbhb/Nj26Z4kR5R+gy5XyI5ZV/nvGPC0=
X-Google-Smtp-Source: AA0mqf4ifgX6FcSmlzbX9KJuqh+rou+0XnI/5QdNy/+OAteNxhjwC+QdX4iIaaTb1J4bkdF6N2ZoDw==
X-Received: by 2002:a17:90b:2502:b0:219:80b:6d9 with SMTP id ns2-20020a17090b250200b00219080b06d9mr13640197pjb.213.1669557381498;
        Sun, 27 Nov 2022 05:56:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/31] sstatesig: skip the rm_work task signature
Date: Sun, 27 Nov 2022 03:55:11 -1000
Message-Id: <ad52bb4643eb8063ff4db6bcb86b9a593ad6ce7d.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173870

From: Jose Quaresma <quaresma.jose@gmail.com>

We can skip the rm_work task signature to avoid running the task
when we remove some tasks from the dependencie chain.

The inject_rm_work handler on the rm_work bbclass triggers the
rm_work task running for any signature change in the dependencie
chain of the task do_build of each recipe.

i.e INHERIT:remove = "create-spdx" will trigger the do_rm_work
when we collect the sstate cache with INHERIT = "create-spdx"

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 292305700e39d0ebd64763f5032c39ace5005fad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index de65244932..f5a77bea27 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -30,6 +30,12 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
     depmc, _, deptaskname, depmcfn = bb.runqueue.split_tid_mcfn(dep)
     mc, _ = bb.runqueue.split_mc(fn)
 
+    # We can skip the rm_work task signature to avoid running the task
+    # when we remove some tasks from the dependencie chain
+    # i.e INHERIT:remove = "create-spdx" will trigger the do_rm_work
+    if task == "do_rm_work":
+        return False
+
     # Keep all dependencies between SPDX tasks in the signature. SPDX documents
     # are linked together by hashes, which means if a dependent document changes,
     # all downstream documents must be re-written (even if they are "safe"
-- 
2.25.1


