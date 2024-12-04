Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7411E77176
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:15 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.21221.1733334911879829287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kAtPFsl7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fccc26ad01so54719a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334911; x=1733939711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0YW9nNwAJxA+JY6f2JW0z0/pArnkXFeXomGiSNZrmA=;
        b=kAtPFsl7CT7Iqp+Iqb91FcuB3yugcVoauWxT7ZO83oclJNPEkOzOyzqmB9ONd5GGw0
         +hdDsbRBs6Cw6/jbm0rCzj96YHNSslqnowdf7vSAevSGYOAV5NgzL0d3C11lYyke3CbB
         Swzv9PArrwIJvPP7wZT82WiN64BXXaqTPmn2PNkJa+XA10hFAli2uwLEQG4DqSbcRHxC
         yC5pAp8t9D92megjB3vwZFL23/W5lNMOmFhFoU3MkTgaWMDEf368X/hTDpSDDvlWGaGh
         FuP1fafw1pkLtpKsMvdm5us3UAiaqaNpXAg+DyQ1bwzHUeT6bn+Pi9mMBjdTzf7JmfI8
         xeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334911; x=1733939711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0YW9nNwAJxA+JY6f2JW0z0/pArnkXFeXomGiSNZrmA=;
        b=RAuSLY7qi58xksSCsLHEJpiWzRZzLNp2NiOomYpfUL7KGnGtC98/B+MtKD2FHii+JK
         ozoqSvgWq6mbJUtsS+0jDzthm1RJT5ORDS7DAeLZx92AiM0PUl0Lpk85K3R2uJPwZYdc
         LrlLEnhGnJ+mu2LI/MZ0UVEAXZ1MzU4h9KCFNT9Qkw9Vjyr9p6VOWCVskaYKZH87wnMd
         V2xcoguZ7RV5ZFVEpsgYAba0aqtmkD8hy7ZDff52pwy0CVNEVAGYkn/o5kwNwvSqfffJ
         KGQEPmX7VaxVihzisEzT2lKQ9FGEquCtyP/3YSxjGU/bpZ4L5RB40Y4XHJ5jTlgu7obq
         yW/A==
X-Gm-Message-State: AOJu0YwB9A0MMfYKn2Q+G5LucUcUvqqeaDLcWgTQ/OFX8haZ/QZq8OaO
	hV2bj18PrNy1ryPvZzviHWD4qlpEevq7vakU0DOOlDumaJnE1WcqjllCMUQbEr6mik8zqu5OjRH
	E
X-Gm-Gg: ASbGnctzStSCNvzOqBPlspKfKolvEyUSMn3WUc8CoiYRxN5rdasbC2x7rV+56DZxyGF
	W/SP4bNpZM6YE7Xi9P8YnsIsYFbM0U9TIg7ngQkJSDXoYWbaZSREqg3ZCvGnUI1wdAoc9Mvbhql
	zxOPYM/+Vahm8IrtNudPxz0Jp3Eg5PlJABUu/soNnCH3a2pJ/4rAj0+1knFNbVapdB+0S+IRTZF
	iqsgYIfIejhE074WVPZGWd/LQbPzCEmP4mVgzU=
X-Google-Smtp-Source: AGHT+IEOtYJ0sKbWPGoLTiqpwPXy0v/JMm9lHasdP7ez0mWG3nsro7ntBldX7bqKLL+Uo9b1/BCaMQ==
X-Received: by 2002:a05:6a20:43a7:b0:1e0:dcc5:164d with SMTP id adf61e73a8af0-1e16539f65amr10755080637.8.1733334911158;
        Wed, 04 Dec 2024 09:55:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 32/38] oeqa/utils/gitarchive: Return tag name and improve exclude handling
Date: Wed,  4 Dec 2024 09:53:59 -0800
Message-Id: <2df9c2248ac4996ad1fd1fe9f492eb2d71b758cb.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208315

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Tweak the gitarchive exclude handling not to error if excluded files
don't match.

Also return the tagname created so that other code can then use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1adba3430faffdf6217b6a00533a3b48a9388abc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/gitarchive.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 6e8040eb5c..6db8c99147 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -67,7 +67,7 @@ def git_commit_data(repo, data_dir, branch, message, exclude, notes, log):
 
         # Remove files that are excluded
         if exclude:
-            repo.run_cmd(['rm', '--cached'] + [f for f in exclude], env_update)
+            repo.run_cmd(['rm', '--cached', '--ignore-unmatch'] + [f for f in exclude], env_update)
 
         tree = repo.run_cmd('write-tree', env_update)
 
@@ -166,6 +166,8 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
         log.info("Pushing data to remote")
         data_repo.run_cmd(cmd)
 
+    return tag_name
+
 # Container class for tester revisions
 TestedRev = namedtuple('TestedRev', 'commit commit_number tags')
 
-- 
2.34.1


