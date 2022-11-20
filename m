Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80630C4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:40 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.13302.1668953800222913081
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Bi61ivx7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id r18so8958032pgr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xkM+lzYlgi6quiuVRxeBs++ouehiqW/eTRoygC8a14=;
        b=Bi61ivx7rH+JtJcxJmbq2bEqOHymjHlS6kXtvYg+0DMeeyGcEixv6m/yfJnfbExuLG
         waH/rtWa/2beAUbzZINW0mqKy+gvrvJmf7Znwz4uh6q9L64vdwfx1FbUWBdznaLihPA+
         mQZxBgOTIWg6WVMFisbmYoZ5xvSqCGDQXz9eLvky+C5IDVwOomnt1El6vn2PPFmbI4TB
         /w1HK50cvo7NtJccmiX6JnyKya/zXhq3KosrlZunkG8cpX6ed2kbf2DG/YXhYHWLKoAp
         E8eCmC96HRE88YZkNwAizb/r35X0CHPsTwvdY7Msu4QQSzPOJRoMevJXwdoztlnRon7Q
         iIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xkM+lzYlgi6quiuVRxeBs++ouehiqW/eTRoygC8a14=;
        b=pKD8+BDJeLF+/McFIm89dSruecubb8jhdfwgUF5wFn6VQgpHes3YVmuZq48j4odLi4
         C8XrDo7XOm1INWifU840wguCieqdbkPH5OE/t0F+Fw35ZpKpNhj5KHljEzxodgzTO8Xq
         m6Sx4YHmp0tvGG3zNNl4IS+AUpwO9Z37O6FNnvPgSstOqEBmkPVLzPXLzibmxb3Ix13o
         L2Q8X1mog6oP3/ixXrFkRlmJ7bXFLtt4UBlDgWVhnMO82fNllBqPCCcv4TsincKMwuVm
         xwkNQlcudsdA9ITaIbMkm5qzVihLMb4gDbjmcSkuMUvx6vDgQD8xFJLc3x4TchAIh6fR
         l7FQ==
X-Gm-Message-State: ANoB5pnWL6SmxdtVMRoF7Oi9qomPjJevJEfLmcx0cTZ2sVUQG87DZEnK
	2pSYCOPREMaK51gkY9Nkbk3Whyc0yO+DcxgJ00I=
X-Google-Smtp-Source: AA0mqf69OJHx3aMCIc5XvbzjXNtzsl7cnkCKT5KgELzboSONIu9p/SMi8QCdKc4IxcJb+fV5RylfCA==
X-Received: by 2002:a63:1a55:0:b0:477:4ba4:c278 with SMTP id a21-20020a631a55000000b004774ba4c278mr2658978pgm.482.1668953799229;
        Sun, 20 Nov 2022 06:16:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 33/35] gcc-source: Drop gengtype manipulation
Date: Sun, 20 Nov 2022 04:15:22 -1000
Message-Id: <8a49626bb32b40a2cf97fd8b80564b494ae38698.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173633

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst we patch gengtype.cc, we don't patch gengtype-lex.cc which would
be the file which would trigger regeneration of files.

The real bug that was likely the cause for this fix is probably SDE issues
with gcc shared workdir so this code can now be dropped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7ab82b5db2a737c2a0266280b15d343a27c0e1d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 03837f4381..bf33a4b31f 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -25,8 +25,6 @@ python do_preconfigure () {
     import subprocess
     cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-    # See 0044-gengtypes.patch, we need to regenerate this file
-    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.cc"))
     cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 
-- 
2.25.1


