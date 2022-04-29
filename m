Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F0FC433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:29 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.11942.1651248147735595353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=x7o1UrFU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id p12so7327240pfn.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x3szWdipc1bStASWqURdhKMNuBWSMuYdUxIfQB1RhFM=;
        b=x7o1UrFUXdKLainuzncEY2wAFhIJSt6VuXvczfcLxxx5bRGjwefqjW4hXwUAALVuGF
         Ijd1lm/6R8PJ7id+rASe3TppoqyuwPeNrnUZ8VNFZ/lrXVQqqRjUU5pt5s+RTOJ3ufqk
         3pyAgma5eQk20PpOW5XtVT0LvFTjw7jpSDMTDhxnIPyuFcwqQeH2+JcDub+R8GGTXaa7
         oHJji6HSIzttayUIRPRfB5ex7F5+Ne23yqSgBu1uDYoCD+DfozPRVZ8htnmgLZpOwOLV
         W85oLG7aFo4Xzrlj3RKPZ1wjWevm/+0vdo5ZYSPaBsRA8Lrw0IArTs35SXQL237xengz
         QxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x3szWdipc1bStASWqURdhKMNuBWSMuYdUxIfQB1RhFM=;
        b=OiaL2B6gHjoyZpjLqqCvZlJ29mkaBeD+I0IYWsnYSrxRBkBWZZUcyoRbewRVZNk847
         sb9asTPFze6AEXxwnaesTnkl8yVTORKFi1cMCO261VFrBhCBkmC5jzEQlXAbryZlVGgT
         7ZJQ8YJIUIp3IALnuUx+0AtaLsu49+UJys3AX2ATJE7g2k1vZlqzlDOXK3RAwJi+11Jt
         563jUH2notjicb0a89sX/+BRA3CLz0uvmGSFmrpLb7RZ4IOwNNyZKDnyPTWYu1eN8dmt
         ixma8efeVWtbc+ZbNNCm9pSsEEnSDyeVUxbpxBDLl+Yef2E2Jcq5VKYFPDb1sobhZtkq
         Cnng==
X-Gm-Message-State: AOAM532+7Ug1MAw4+GxtJoF2HoKek0eA2+WtVVD4fWQibs6Yj6MkXs4j
	+LiQHEbXeIAAefypMTHbaiD3DnR0Za4F7CC/igQ=
X-Google-Smtp-Source: 
 ABdhPJwSnu7hJpGXNhYQZo25TCZhj0JXpjcue97SBo4Sj/tm9T+Zf34BJRHTUCvcY1SWVy72a/ZjUA==
X-Received: by 2002:a63:6e0b:0:b0:397:f965:64a7 with SMTP id
 j11-20020a636e0b000000b00397f96564a7mr41688pgc.581.1651248146517;
        Fri, 29 Apr 2022 09:02:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/34] go.bbclass: disable the use of the default
 configuration file
Date: Fri, 29 Apr 2022 06:00:45 -1000
Message-Id: 
 <00f794aeaaa660851f3a8464ee89c553195dd3dd.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165045

From: Chen Qi <Qi.Chen@windriver.com>

We need to disable the use the default configuration file. This is
to ensure that user settings do not mess things up when building go
recipes.

For example, if I set 'GOBIN=./relative/path' in $HOME/.config/go/env,
then go-runtime fails to build with error like below:

  cannot install, GOBIN must be an absolute path

According to `go help environment',
"""
Setting GOENV=off in the environment disables the use of the default
configuration file.
"""

We can explicitly disable the configuration file by setting GOENV to off.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 711b41744ab08ee62c71cdccca335a7828ec0ba1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 9c4c92bffd..f3d83febbf 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -67,6 +67,7 @@ GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
 B = "${WORKDIR}/build"
 export GOPATH = "${B}"
+export GOENV = "off"
 export GOTMPDIR ?= "${WORKDIR}/build-tmp"
 GOTMPDIR[vardepvalue] = ""
 
-- 
2.25.1


