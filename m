Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECACC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 13:30:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.24566.1680096637152232313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 06:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BPtc6SDl;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id y4so63395969edo.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 06:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680096635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fo1W5IDO+1uVlxltEg0ZMKPf3FJFeZ0MNwa+HBon6x0=;
        b=BPtc6SDlvIktBEV+Mxg0c5NYTt9T51KKEGTLq3RbK0e7cjt2QJSWQMsyVbsWSU4Xck
         ceadTWORPvcJspOBKFF1X7rog2KidjWCKMCosoiKpBSo2+0BVT/GsjkurtvGZh9IS6c8
         HPdh6GEFGBplnd3Hpspp4BIER1vkGWBgGG5Y3/dl6UDckyvMsHDqYrX/Fl9oduZrjEhI
         hhy6LXKhHHIMjK9LWcGP/tT6EQTf24rV+C58C9lGKPPmk4ZN13PWdea1cS4I6u8F+dUh
         gXvSjSYFuHYzhV4qJpBO763Cw76ZuTebc+7DoLgStJ0VImRtYsJ/D33gItWhV0VybHuO
         bgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680096635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo1W5IDO+1uVlxltEg0ZMKPf3FJFeZ0MNwa+HBon6x0=;
        b=0LvI1kjy9OJXhpeTQJ/TIRRbRPT3tnJ50Q29QRY9YCFj14WbaGSNhQKS54jHTB6kSg
         MIjOkzLUuAPPsnvHQSPY/Rb7ztlBdYge27HyBFUA8eAGf2R0gHLGbqCITF4+4ccc+G/u
         PVWahSjS6Aj8gJcWk+UsCZd14dQtrU69BzqzzpelH1OdgycCKBhT6xjW0MqxKrVd16Et
         guoVPRsVXXs6qeY+kTIvLjMrNnFRefRPqoqyRw8cM1MfZDLwgLC2qK9s0ucaCTXPzbCV
         uZbb1Sfb+rK1yAI8QHSWe1RlqI1dLe+LHjuESlp1E3IjZLLGe37e8oUQfzQcKY6MnGoM
         EEew==
X-Gm-Message-State: AAQBX9dA9xUXXSklKs25sudlVDO4oGmIfekaKFDKExfvI9Mi6+1n2oac
	BcZ5/P2cUJEYUY0nxg8pLHt+z/HdtmQ=
X-Google-Smtp-Source: AKy350Yy+cC3YWGn68AFwtJ2WT3gTMnWsMTD42A+w/Siyp1urT57M0cHcX0EpzqEjKy1oqkArdKNVA==
X-Received: by 2002:a17:906:641:b0:8b1:77bf:3bdd with SMTP id t1-20020a170906064100b008b177bf3bddmr20475257ejb.36.1680096635345;
        Wed, 29 Mar 2023 06:30:35 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906300b00b0093137b1f23fsm16479651ejz.37.2023.03.29.06.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:30:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [kirkstone][PATCH] bmap-tools: switch to main branch
Date: Wed, 29 Mar 2023 15:30:29 +0200
Message-Id: <20230329133029.2426674-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 13:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179278

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


