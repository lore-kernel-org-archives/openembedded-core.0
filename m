Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549C4C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:57 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.15283.1634673297079475292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yihEYUAd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso767004pjw.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PjUq3iDHtiTwZexaqe4PdbZgSekHd5W2z7aBPqtt/qM=;
        b=yihEYUAdDNz9+Tsaz1RtWie1Gqkya5p6YngnTlhC9A/yXVzOtpTBfApuMLlVPr4hnB
         VWZJoOChAuyLFUs2zfhcBT6hSDdktDC27Wd4p2/B76sduh3e7btLIIEiKMsGuPaQc8o7
         YPycthkM74Ri1cbCIv/yQOrhL6Wib2ITBEiQKfRmRzs7zLdA6phs95/LozI67wjpR8FF
         h+VM7aLKbzVZnDAZLiKKzhjZO2mPSrRE24YmIZjer2yWV7v1+KArnl06meS9bdk/nz5v
         d0KyA9HwKgqw750pzTNFlVpoq+XLUiT2nX/b7NZ1dGI0Y3YnEhioWNfORxoEbO0+2Uqr
         HzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PjUq3iDHtiTwZexaqe4PdbZgSekHd5W2z7aBPqtt/qM=;
        b=75H2onwC7x1RpUXIqs6PTUP/O/9gPEPBBffwPedGEVyGo09Orccl4jdvooadF4uhFt
         51grKpyKEfp5aidYT0pDMQ5Wt1vyv+ZBm8SZrZRufsMnbAZ5rFF+KluRrej+/fOfGfRs
         ZYEzQqJVxXosuwqhOdbGWLh/8P282pOCuSqjtxqGuHJLLom90QFtuBaIMw2SYRMB8saz
         IAbdoCAqgm73orRzEU8YYQnWWfQyYcIGd9ef2shqUsnlcslb6OYkx6kFD+Vr0dqPkyfR
         KBVv9h6F7lLk9eTK5MOoY8YzAki+Rlm45Rm+g8rguflFCuhPfvSZfHg0hCgzLSO529fg
         pD6g==
X-Gm-Message-State: AOAM530AzcIwcmxx4Tq+hWQ1UrIEqSNYsLU67MzJZ8J7fkExyAoTjOOV
	Ai5eg46wQ7YzJYtCpBEgjyOL82o9V3vOrngRUiA=
X-Google-Smtp-Source: 
 ABdhPJys8FxdICP7a/QGz6yfrRyD+FBtlYA095LCOxhcz5kPfe9pbLB1dO2dK2EfreKi2dMxeTTZPQ==
X-Received: by 2002:a17:90b:180b:: with SMTP id
 lw11mr1949989pjb.45.1634673296186;
        Tue, 19 Oct 2021 12:54:56 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/38] util-linux: disable raw
Date: Tue, 19 Oct 2021 09:53:31 -1000
Message-Id: 
 <7c2de7211d8c8790851a87d949d29c6e0e140dc2.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157225

From: Markus Volk <f_l_k@t-online.de>

raw.h has been dropped in linux-libc-headers-5.14 leading to:

configure: error: raw selected, but required raw.h header file not available
WARNING: exit code 1 from a shell command.

Signed-off-by: MarkusVolk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f577c10913104860121f682b9b3754870c4db23)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0e85603d9a..af4c0b9974 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -94,7 +94,7 @@ EXTRA_OECONF = "\
     \
     --disable-bfs --disable-chfn-chsh --disable-login \
     --disable-makeinstall-chown --disable-minix --disable-newgrp \
-    --disable-use-tty-group --disable-vipw \
+    --disable-use-tty-group --disable-vipw --disable-raw \
     \
     --without-udev \
     \
-- 
2.25.1


