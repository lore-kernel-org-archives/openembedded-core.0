Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8399CC00528
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:37 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.31962.1688959232803134255
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZjgnmKRf;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-635ddf49421so21973766d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959232; x=1691551232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJ/47otiSmZFpgGyC984/55S3YjFd7JswWLg3P2fC18=;
        b=ZjgnmKRfHw4CzZhUWzowNqxQkVcYOAtsFjkX4/swtg0YvvKoH4hvK3w9PxhH88mUoH
         Y7uh3PRufskPs5IEckKcFmVZlAn5rsrJ8MxCxro0Yxkc6zzn5qBzJVCpRUz5yp43CGBg
         J104AJYsjx3prJt51QMDx7Fxc9GeQcVzQgJ5qWwenegfdLjO4/2pVXHIm8xqxgu9hR6p
         KBlWpppNmqP+DyIyI2zz2OSbDstQOh03iehAbiDISzCl+4eGFTxRjlm/nVWmgiDYiGr+
         8RIk+zQiC7Uh9appc1Zblur6+vNN0k+1za2mdFwzXPkoGfAE/a4Fh/crV9wDlGMUGV8l
         zWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959232; x=1691551232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ/47otiSmZFpgGyC984/55S3YjFd7JswWLg3P2fC18=;
        b=Kmm2OnfTwz2tvwNcCXymFiI+N87wPIReRYIwxDpESblFhTkCk7xv8Kpv8XwsxOrDhJ
         PkWdDH8iPPJdMp4qKXDZVpAMDkjtfOR2H4dKf/hd+UQYxpZNHt8U79BnXZylS++twES4
         St6p4UAZqpqyuPNw/mB/ZkZatPx1sOf5/o8dtCPNZIIMtPJGRL8I/M+PPNUHRTtfHtqZ
         5XtDt1fXyQNTzPld8KQQ/8s6ODtRisLYXOvKBLRQG2cpG4bFhl5PsA+5VG+9xMJRzX6G
         0HqXDIEiCdDRqUg2w20DHrkbKCB/hIOIHY/zO9jvKkC8W8Bj7+hV9i5nU0wXFAOQb6Vh
         8iXg==
X-Gm-Message-State: ABy/qLar/SVakHDpO8+uZx3DQVS6T9QXUXKY7aI/Sa2+s+tSJEM5pCMZ
	XCKxSyJ2XDMQ+e2aZzjLjnouGaVjdKU=
X-Google-Smtp-Source: APBJJlF80jLRIcs1HDLu/s6xOu3NHMldbvhMK75gdqZyCRWFXZUcR4sbDzlK1ySfAOasJaNzQX0vkQ==
X-Received: by 2002:a0c:dd8d:0:b0:624:3af6:21d2 with SMTP id v13-20020a0cdd8d000000b006243af621d2mr9556586qvk.13.1688959231779;
        Sun, 09 Jul 2023 20:20:31 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/15] perf: fix buildpaths QA warning in 6.4+
Date: Sun,  9 Jul 2023 23:20:15 -0400
Message-Id: <1c4a47b33bed622c5b7c137a830e359302293887.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184046

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel version 6.4 introduces a new file that need to have
absolute paths removed, so we can avoid the buildpaths QA
warning and have relocatable packages.

We add pmu-flex.h to the processing, and the issue is resolved.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2d803381bb..7d90ac3612 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -383,7 +383,7 @@ PACKAGESPLITFUNCS =+ "perf_fix_sources"
 
 perf_fix_sources () {
 	for f in util/parse-events-flex.h util/parse-events-flex.c util/pmu-flex.c \
-			util/expr-flex.h util/expr-flex.c; do
+			util/pmu-flex.h util/expr-flex.h util/expr-flex.c; do
 		f=${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/$f
 		if [ -e $f ]; then
 			sed -i -e 's#${S}/##g' $f
-- 
2.34.1


