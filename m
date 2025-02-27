Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B47C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 14:36:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.11796.1740666977362555058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 06:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hydeJRAs;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: fbberton@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f378498c9so1000033f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 06:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740666975; x=1741271775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gY0OQP6sSvM2QyldUH2ofTKp7Zk1N6WnVdbQEm8YEHk=;
        b=hydeJRAsqYBc47dXLyck/6e1+eJKDupAbZ/H1897UvvCubzxue5MUMQyjYTwnLa5w2
         GkUxpXb89QrNnS4+s01GSD+eOKTEFftvCyjKSzQKMcA6WPS2DRga8SjRcZOiTlHfWUav
         YT2nr5ReMq1GxiOLFQNy7+p5dstwTrsVHEETP48irIkQV1HKA1OQ0WDGJOvuXlC+XY1N
         dwRttuBMWt7wBXlYJ0fIL7LLba0YV3UT1R2gNxQX9HRHuWGJzzhisEWz7R20VneuSotQ
         XLg1ZFLj5kRdv1efBYOCeZH3gi/SYT4Oqfwmj63Qkp9f/2E2olbexI+7r73jY0R+hnYM
         uNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740666975; x=1741271775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY0OQP6sSvM2QyldUH2ofTKp7Zk1N6WnVdbQEm8YEHk=;
        b=Z47886jvxkxUBPH1IB+3i1sRSk+X+ToTO/5w5MLWSu7/An23uKYJ1E4SOuCYOza81y
         jq0V5N5X8sZPhm4Yv5Gb8K2wEzedo8BEzp7rM56VzKVMCyQrKlXPIWe/QPoWrATIEaaD
         lYLR98wJ10PAFC3z19F07ITjUbZPxQUZvu18rXUekhjQ0RajGXODhjcVhCBf1HxybMyT
         WCZS9uxLGhzk2IG0wxbod0zARLviLZRZeFLvQE9wajMPzKnbYh3y6QJsm1NGRzpDUtk/
         0d9F+/UIM3NNPi0HjZUw6kpBUSNKdjIr2VOSJywkArvhWRWkXabrKwlQgLSvaMNOb2pk
         uOng==
X-Gm-Message-State: AOJu0YzFLyvnxWU1zGugdnXr3jBSY7tgwJCWaHoBg0XF1s+ISXnHivBT
	r7swgXIaFMRrjU/u2iBYbTRkBLBfTbX0Y9wHvDnxl+AZJxtNRvURdtNc5w==
X-Gm-Gg: ASbGncsQr1dY21VznlVLXNRGuTbdSW+Lp71/gKB7OeJZBiN+nqWBVSf2tkS90UuyOkb
	WuJhwWqcceVv5jx+5/X3lXkbwCUghXJI62Dn1eSFISWRAjgcjjC3un8dqL2zBzEa/sHObLtmHHM
	LObLA1WQq2MnT/i9Bm/8bFKb5rtH9tDOvTAbKSThoC+PZmb96NkyqHMQQKxy2txnxmo4f1U99bN
	hq0jKADVbERKJljBtoijvknF3u2cWV6FvY6mgspGBLUr5O7PlHPObfpJuqMEh46u1GCoUjP+aFs
	Ak8vEBL63S2pQOMBAQ1jh/zV60PmCLBUEwjF0f/tbfO7RukDvQ==
X-Google-Smtp-Source: AGHT+IFSVfj6qPjvwUA1lbb7/tqlNUTSINxws8BEKhAgWbpZoRNNKTFKQdxS0Pum9ZTukw9vdCJjpg==
X-Received: by 2002:adf:f391:0:b0:38d:e3d4:4468 with SMTP id ffacd0b85a97d-390cc63c3d9mr11012013f8f.51.1740666975126;
        Thu, 27 Feb 2025 06:36:15 -0800 (PST)
Received: from CTW01359.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dbe7sm2250677f8f.93.2025.02.27.06.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 06:36:14 -0800 (PST)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap][PATCH] ccache.conf: Add include_file_ctime to sloppiness
Date: Thu, 27 Feb 2025 14:36:13 +0000
Message-ID: <20250227143613.1899280-1-fbberton@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 14:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212012

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4899698297c7783e02aba5388e0469cc83bd2f70)
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


