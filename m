Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7332C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 20:46:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.55759.1679517988634495993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 13:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=noiLYUWJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id i9so18404968wrp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 13:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679517987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TLNJLOb1cH+mHlL3P7w96nlPspG1UzMsCHvTFRLu+Qg=;
        b=noiLYUWJYCnWnbZWI0x1a4G+e6GT1epNYZrnF3DRW8PyYXTM420J/mfZk1ZoysJpYG
         0Ra0zlbHnVnMh+fc3Er/KhQ3vUs8jJWhaJ8lDl4MbSahjsf7BjKDR4+PMk3w/w5T4zfI
         Gxak6j4uThR0I3B4cnXf1RhXgvKm2o/SIv/yXVUXrifVkvPdASlxH5tAVBCsX9aGeubc
         8WZKp5hHhqw6WE/P4VNSIkKMGx8/iZOTVZ72yzFHwAx6yLIWF73VHd06Q3TnJeIzOdGt
         U57WROGpmsPS+MDi+mEZJtsaWFdlYgSxk1YCQHfuzvH+EPoipvaKNfGQPHCEsrgtEUvb
         vQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679517987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLNJLOb1cH+mHlL3P7w96nlPspG1UzMsCHvTFRLu+Qg=;
        b=sMz0QI4o1vXXzmRLpkhtnEbP0QpRD8snvOt1zOol9zd3yydhbm6Q2Vwc1/cHUN10YV
         lswJMSbhtxrbbBHF6BDU0jrEbQHBSNLtuWZX3KM0G+SzKye3Ie5+HtSlXg1G9MdQhSs1
         uBLtwDvSHXznv4VqnxGna9FiXO792EYRdisyfqQhU4OqEQ6sHTgGfQd/tNCWyU/DIw1v
         NFM4Vimwd02MmwAivHjPoAPPdLSlJkZdhX3OOdQ7lknNikxhYYd5wZOCYZyt93d1KSxu
         7s5VWeuctrMLbCBKdsesI2wDVKFr6tgBK5gys8LuRXVwt88Ca5NaR4otUIOhg953FobN
         d8nQ==
X-Gm-Message-State: AAQBX9cFlb0lU4TLmfODof9Kz7j1+QjYaS40mHK9v0kAQNysfTOml8kd
	1QSfHg5nQJ6tWv6Ac6l4VZ+hkJ15Nyg=
X-Google-Smtp-Source: AKy350Zw/hCrmnL7r1Zb6bWg+GVe/eoz3w3HDesKK71qxbb/uPgVKYrq6qiFY7piAnhN9Vjt1QcPew==
X-Received: by 2002:a5d:4687:0:b0:2ce:a9e9:5da2 with SMTP id u7-20020a5d4687000000b002cea9e95da2mr933869wrq.6.1679517986891;
        Wed, 22 Mar 2023 13:46:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c469400b003ee2a0d49dbsm6973919wmo.25.2023.03.22.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 13:46:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] bmap-tools: switch to main branch
Date: Wed, 22 Mar 2023 21:46:21 +0100
Message-Id: <20230322204621.3635369-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 20:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178962

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


