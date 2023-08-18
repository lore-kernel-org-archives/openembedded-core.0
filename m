Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5FAC71150
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 13:47:42 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.11753.1692366461830384740
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 06:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=K9HylEIH;
 spf=pass (domain: snapchat.com, ip: 209.85.208.52, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5298e43bb67so742165a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 06:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1692366460; x=1692971260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gKc/LJaRCJRGZsu5chqtqpVa8ACQhKliXssJS4/ZoE=;
        b=K9HylEIHdHsQxvpvBv20AHwxFhle26irBSxAdsZA3+Rj4ZotE9MhJgDbtJFEuMAXos
         fiunck22XBqAbhKcldjwOMTM7Aew6WBxgkcXHaaxcWtnI6efLVolRh6oFLgg3Tudcyam
         ZHPOo4w0jjgt4vBKpex8JkJiPRdFiexbhdx/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692366460; x=1692971260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gKc/LJaRCJRGZsu5chqtqpVa8ACQhKliXssJS4/ZoE=;
        b=Xxy0Q3Ga8a7qanV2XeCVkWutlHzL8Zm1cvDgg4Unt3bc86jSzhgMaYzQJGRKwpxwSg
         fEF9BXKkMGSFYD0AtlT2q2VuH0LL+fsB7I7s428Hr+U9IWjJ8V0Jwfit6iSldaQDLqQI
         NXU1nUbzAziZb9H4qqtrSYZuB9bF4tPuurcNdy0+CSJcnKBgBO1t7dghNvT2QZtNpKpU
         eApx8fyrvoZzIWwDQETgJ1gTGR28WRG8FRtQozdIJZdudDRBG0R3my3Hn+euPh1S7c38
         BZPDNtGQ32BA2qR2J7NbDkTdpepf7Ks4ZjKGtC63uwwcS9N1D3vlGSe/J+sTOWASUxhz
         BD4g==
X-Gm-Message-State: AOJu0YzH3vkrMsZxCh4KRs9gqvF39d19vKdMz1YZwqAhYUcqtMVYtYF5
	qKp5BVEOUzVi9oszvpa1CRuz3SKWFVFRcX/JCPEwCw==
X-Google-Smtp-Source: AGHT+IFsSZKsH+Xsf+JJ6wymj30ryqFT/70+StkrpbO365tiFEU+ugWAVZ3Gx3ouSyORZ/zG4LtJnQ==
X-Received: by 2002:aa7:d5ce:0:b0:521:ad49:8493 with SMTP id d14-20020aa7d5ce000000b00521ad498493mr2992754eds.6.1692366459883;
        Fri, 18 Aug 2023 06:47:39 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id y3-20020a056402134300b005278c5106basm1088323edw.90.2023.08.18.06.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:47:39 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] Revert "vim: do not report upstream version check as broken"
Date: Fri, 18 Aug 2023 15:47:19 +0200
Message-Id: <20230818134719.3004991-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 13:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186368

From: Etienne Cordonnier <ecordonnier@snap.com>

vim 8.3 has been out for a long time, so this can be reverted.

Test results:
$ devtool latest-version vim
...
...
INFO: Current version: 9.0.1527
INFO: Latest version: 9.0

This reverts commit 11d8ee09b1bdec4824203dc0169093b2ae9d101a.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-support/vim/vim.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 33ae0d8079..e8c5074361 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,9 +22,6 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
 PV .= ".1592"
 SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
 
-# Remove when 8.3 is out
-UPSTREAM_VERSION_UNKNOWN = "1"
-
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 
-- 
2.36.1.vfs.0.0


