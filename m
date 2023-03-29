Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8303C761A6
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 13:30:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.24535.1680096602621422657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 06:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gPPEdDIH;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id t10so63159490edd.12
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680096601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fo1W5IDO+1uVlxltEg0ZMKPf3FJFeZ0MNwa+HBon6x0=;
        b=gPPEdDIHCe9nYFMn5m/rmmnp6pvlemMcOTfdN7xPMz0eQpPbrRuz0hDvQl+zmoAOEQ
         1rqNZzAEvQREY7Bi5cVeY+g9bBD75k8rBOHhETAFxi5ZTOLqoqJQl9IC/rtKseMkgsif
         VK888538+L8JsxhbJu7taoTw9bBRv+hdc70ccgLkLRmKqG5Lx0btubAq8NNiZGG6Krhq
         wAtYLIy8JObbEugYcIGie7+yVpvrRJwDoTdx8Q1ecOX0d6M+H1kQWErnUxEwwEf9pqXN
         RUT3911UUJabI0xLApty3hkL1BIvv6EyRci0l7+v67r+YAMwZxKDNM2uTHPM3YHYMuXW
         pVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680096601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo1W5IDO+1uVlxltEg0ZMKPf3FJFeZ0MNwa+HBon6x0=;
        b=ms4jCYjRQMT8aYBcIlWa26x8PTz2XJcp5Q3EYgpRK1VGZTZ8Kd9l0Dj4M6gyK+4bBk
         eoRREIO1IbvrwRQNQgd1TiqxfIAyTwj48b4HLTDvLZ9ddwuW3JotsODX1bTvFaE94AIq
         Z2ZyZTskLLLbhGbNB0la8fKZbBYDYQMnLQZt4ojY6t0xLSfEHsX7ZqT3/IZ6/EZ2M9Td
         TpjGs9AAqBcj4eIlWxj2wvNvcKD2BymzQyuBhkcoVkBgsvjGF+UztCW3vioLYGbvUneK
         h+GDLicWU3FvOohLaY8ZgTEj5+icUCgq3yn6N/v9MI1nZXdyhYS6wguCmvA6AUtmR7Lc
         JDwA==
X-Gm-Message-State: AAQBX9fStXb5nRZp7n0PP7JSHC8pOL2DZzvBBCwijfkKzCULCyg1oLuz
	PSK48g7f8cccVCSRqUCZTuLEKjXZXhc=
X-Google-Smtp-Source: AKy350ZGrtpTslJspkH3uG5kk7URJI/4uZyg7V6wUERbuLxBM142/nezOOD6+SwYFYZgYKBR6LIuLw==
X-Received: by 2002:a17:907:75ca:b0:93f:b391:9a07 with SMTP id jl10-20020a17090775ca00b0093fb3919a07mr2187706ejc.15.1680096600725;
        Wed, 29 Mar 2023 06:30:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gv52-20020a1709072bf400b0093a7952411asm11033574ejc.48.2023.03.29.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:30:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [langdale][PATCH] bmap-tools: switch to main branch
Date: Wed, 29 Mar 2023 15:29:52 +0200
Message-Id: <20230329132952.2415412-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 13:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179277

* master branch was removed upstream:
  downloads/git2/github.com.intel.bmap-tools $ git remote prune origin
  Pruning origin
  URL: https://github.com/intel/bmap-tools
   * [pruned] refs/heads/master
   * [pruned] refs/pull/73/merge

* downloads/git2/github.com.intel.bmap-tools $ git branch -a --contains c0673962a8ec1624b5189dc1d24f33fe4f06785a
  main
  release-3.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
index 78c51e7731..89b7bf2b93 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -9,7 +9,7 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN};branch=master;protocol=https"
+SRC_URI = "git://github.com/intel/${BPN};branch=main;protocol=https"
 
 SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
-- 
2.40.0


