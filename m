Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B87C021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 10:19:29 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.63979.1740305963347220523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 02:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OVn24+07;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: fbberton@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f3ee8a119so1661899f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 02:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740305961; x=1740910761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pt0PLPkt4ziBVRMdoyBZbqS+Y4EgJrytC1dm0U1mvhE=;
        b=OVn24+07klfR4Yc2xtYOg/VoNOB2AcHRw0mqlyszJQ5Hpe0JN7gvSqoX3Kn0g/epZh
         AZ25p8T5ayMIQ7wawFjogb84TCbGjUX/8cUZC50wTjMftUYRagxvnl3eIGGQATUNsyCf
         0DeAbXmUWFarvLvGMWzL8KOQZLl8cOeOZD2g/UqWdij6fKZqzWX4PzGytol1QzlxMqoy
         19f8f173pmM787G6045GhBPrzEkYTf6ROCjiuj0vdT2EGrxIwetC4WTdgZI2aOS23kya
         CNiMImVV4QhAgzLRmFgeTo5IUWi71QKk3q2FZgIsEqETOHrLZBndPaZAwTSxrAsAmhjH
         z0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740305961; x=1740910761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pt0PLPkt4ziBVRMdoyBZbqS+Y4EgJrytC1dm0U1mvhE=;
        b=uXbyJffw132awc4PTFvKi5sat63G7LcP7lZAeUp8Qa0+DN5LRsxtj9paFsxizuaJZ7
         YHIAWVuPYMEPuYgS3Hlfwbw+foQjwHXJUyGBFPrwiuS4q01yYqNewgVrbKIlHelMWbMY
         FDKJLgpRmhmb6X9SZLmlfyp8OfCoJ+SoFsRkzoZurHu8kwuCb8WiYbS3Yr4K6z3Qvw54
         3wWgrg3WjxKtfbYnrhhIzzdk/ckEwTtCEAkplgr83EgFxWw5i+pHbg3VzZAAc2Sm2LSX
         EVQjDJmeAu3j2yVcCoy1cHNxvZYyRyrlYmfVztDy66KmzDQLUnFX9Y1C8ROAi9UyYTa4
         8TbQ==
X-Gm-Message-State: AOJu0YwTpicimfzqNXnjZEhqdVUrrK5aUmK7e9qZ6dRQDC9M0HJ3cE1q
	P6XqHKWwSiAn29iOV+CaSweCdaEKfSDNZHZFYsrqd2s6DEUBVccedZIu2g==
X-Gm-Gg: ASbGncucweeaVaTN7BLFIo9/OAjyTGT7oyR9Re2O6YXJ9Ir2dwR9FMiNhDWyVTPpL9B
	UCKKHC3ztBQJiR8IdVoBPBvrHIiSYgOf3sxFW/XjnSXUW4Z7TRrRvt6CJpHLXzFp1KWnMOQZKQX
	wPUuGyaJS+uWQTqwp8AD+CbeDbIUvAKgZGEPXHpodKiJOw3JjgQsElAVlM9evXY2to8ltwZqwX2
	OmfUBHK/59xiwoNlZb7abOqX0u/V4htjiyzAldCN3BUDCjE9tkFyV3sz61AxowzNN2hVhXfjmzi
	woPkHRA5DBqtBkLD/Wkv8aA1ogk8aUfb/jZOTqY=
X-Google-Smtp-Source: AGHT+IEdgofyxJ+Pz27kQ7elGKy5giXoQyL6y4nYW9hOsKehCNqv5ySH/QCoGEwJRsHoRRJV4502Tg==
X-Received: by 2002:a5d:5f51:0:b0:38d:dffc:c133 with SMTP id ffacd0b85a97d-38f70827ad7mr8381391f8f.44.1740305961158;
        Sun, 23 Feb 2025 02:19:21 -0800 (PST)
Received: from localhost.localdomain ([2001:8a0:e94b:1c00:9443:acc7:f4e:dd70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm28548874f8f.77.2025.02.23.02.19.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 02:19:20 -0800 (PST)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ccache.conf: Add include_file_ctime to sloppiness
Date: Sun, 23 Feb 2025 10:19:14 +0000
Message-ID: <20250223101914.176500-1-fbberton@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 10:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211824

From: Fabio Berton <fabio.berton@criticaltechworks.com>

When multiple recipes are built in parallel, Ccache sometimes refuses to
lookup some objects in cache, leading to undesired cache misses. The
root cause of this is an interaction between the way how bitbake
constructs a recipe sysroot and Ccache's `include_file_ctime` check.

Whenever bitbake creates a recipe's sysroot it hardlinks the files
provided by a recipes dependencies. Adding a hardlink to a file changes
it's ctime which in turn leads Ccache to believe that the file was
modified thus aborting the cache lookup.

To avoid this situation, add `include_file_ctime` to the list of checks
that should be ignored using the Ccache sloppiness configuration option
[1].

Example of a log entry that Ccache ignores a file:
/
|recipe-sysroot/usr/include/bits/pthread_stack_min.h had status change
|near or after invocation (ctime 1739822508.107677255, invocation time
|1739822507.970071107)
\

1 - https://ccache.dev/manual/4.10.2.html#config_sloppiness

Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
---
 meta/conf/ccache.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/ccache.conf b/meta/conf/ccache.conf
index 4406ae561b..499e5327b8 100644
--- a/meta/conf/ccache.conf
+++ b/meta/conf/ccache.conf
@@ -1 +1,7 @@
 max_size = 0
+
+# Avoid spurious cache misses caused by recipe sysroot creation: Creating a
+# recipe sysroot hardlinks all dependent files into place. Hardlinking updates
+# the file's ctime which in turn interferes with ccache's include_file_ctime
+# check.
+sloppiness = include_file_ctime
-- 
2.48.1


