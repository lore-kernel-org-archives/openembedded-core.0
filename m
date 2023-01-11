Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8ACC678D5
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:22:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.28415.1673454106119110395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uKobyjrC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d15so17294423pls.6
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 08:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqVqFc4+HdHvQhC4O2U24BtoIaGl68KXCOXDHgErZls=;
        b=uKobyjrCTixxVAkJx9zqPAQJ1AbLRFhubMqtBGdgiGo6UJ3+TrM1YhYmH2iRZdjbBU
         yWcW4nOHU7R0FJ4YHIelidJGVYLd6DxXehT/FLMpPJXTbwkAekzKAKhbZGMyCiLq2Xym
         HVeh1+0OfgQPzHAmzy95H8kZRhREXjYHDc1MxAQv1ok5S47Rk/gRHHpvoSQN7so18bCu
         cdJFqL3h8vVRQva/kPeqGsJyFm2eKEgeSL4bXSLkH1CHy2xGV0m8RoDCfztK8oIHwEBb
         YCY73EPKbBifHzfRqU01iRj79RW0QsYZwCKuEZFicH83Et7E8rz6YPYNktD/wq5clQyF
         Frgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqVqFc4+HdHvQhC4O2U24BtoIaGl68KXCOXDHgErZls=;
        b=1aXYqz/8sCeRsgn8F85ZosmdcBlug6a3pNxGLdIaE6gBSLH8AqFt6d4NcgEkTqWZg7
         Y2Zw2OHbpKvjiNV75iUakRQ+0/laTFPL6QCo9pybfKAH+Fj5TgaKGecwuyJMde1x8LCX
         6lbLT4+2KburQSJue/50GUCSLYai9QP+0y8/+0X/VlnEO7mw1ergMKC1Xaqy9HlWdHXv
         LDASDMCNIqDo+x9VYA/aUZhSS+ha0m6dyh8xXYmJ65+XvBEfkHO10Y7WFxisjAKc6aiO
         acCsIST/HgztBFTqt8WLJH19GsjShwHIC4cAVCUlbmHbhr1Yc8AEkecqjcjcbRZKhosN
         Gefg==
X-Gm-Message-State: AFqh2koSLnhqgD5oeAlHc1CFpe2XQxAS786443FbTJAHEmi2u6SM8HeQ
	3GfKjCe+4PgtFLiYruo2DAD9Ag/KLDsQw2eOtbM=
X-Google-Smtp-Source: AMrXdXu+JjNQwuZvaYPaxrmuJs46v+UGYpUfzKY9WLSKXlPe8bOrPueWHJmz/jrkiClv/U8M1mTCRA==
X-Received: by 2002:a05:6a20:4386:b0:b5:a4de:93bb with SMTP id i6-20020a056a20438600b000b5a4de93bbmr3901354pzl.53.1673454116167;
        Wed, 11 Jan 2023 08:21:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u14-20020a63ef0e000000b0046feca0883fsm8685384pgh.64.2023.01.11.08.21.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 08:21:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/11] base.bbclass: Fix way to check ccache path
Date: Wed, 11 Jan 2023 06:21:33 -1000
Message-Id: <539bc9d15e32c9574a0c038a6d1d666b5fb40d90.1673453368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673453368.git.steve@sakoman.com>
References: <cover.1673453368.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175763

From: Changqing Li <changqing.li@windriver.com>

The previous code had 2 issues:
1. make hosttools/ccache always link to host's ccache (/usr/bin/ccache)
even we have one buildtools
2. make hosttools/gcc etc, link to host's gcc event we have one
buildtools when keyword ccache in buildtools's path, eg:
/mnt/ccache/bin/buildtools

This patch is for fix above issues.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b7c81414cf252a7203d95703810a770184d7e4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 8203f54519..2d0e35517e 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -139,7 +139,7 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
             # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
             # would return /usr/local/bin/ccache/gcc, but what we need is
             # /usr/bin/gcc, this code can check and fix that.
-            if "ccache" in srctool:
+            if os.path.islink(srctool) and os.path.basename(os.readlink(srctool)) == 'ccache':
                 srctool = bb.utils.which(path, tool, executable=True, direction=1)
             if srctool:
                 os.symlink(srctool, desttool)
-- 
2.25.1


