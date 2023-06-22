Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A5AEB64D7
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:53 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.1229.1687401404736315958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=C328pm1X;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-543c6a2aa07so3703724a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401404; x=1689993404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GrxUCPUa72Wx56Opf5F7JVkN9VjtF2yLrhWo9QHWnQ=;
        b=C328pm1XDHdsAVUKVojMXAZz4I+jvCz3COiobmJn3LgsUsdkzOEoghmsThsPqN4/mj
         Iu01qYtOg/vjSSsqNIM2jt4u+NQ36HreeYgwPq3yzCS4agUQHwXB4P2RZh4xxolwROu5
         aApTUN7hoP/bFVMHs8RhSF9G/Wh4uW4ad22hQPmyvhybsToY1MDUjPpafpvHhpbi02Hm
         m/3ulgHynqP6BDqKvSJaQ6o1Tc1P6ZHFNuigPBqNGJgZz3KwDgON5rWYimR9t3oVuY3q
         fEVMMp0zF0kFDF9Yv2VrCchodcFOTvE87EWQRnTdi387yFRgtdFDKWu53POpgqrSwITN
         SBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401404; x=1689993404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GrxUCPUa72Wx56Opf5F7JVkN9VjtF2yLrhWo9QHWnQ=;
        b=Qd/7RXC6narxfD6Jb/D6D1uUpG7hBE2VL2wRVtaE/OlatQLwJ9orxoof3JJSXHn/ho
         UBXq4zkdPyf9dF56iW493PtwD7UtZ1lupWs25liWRAUIBZb1RA0jw/YK8IVQ9ccwGI+q
         7ry/gptCkjJ6EgXQM8gofuXE6XSVBqsVCawZcuxAnqoS68zC/PYctzV/Ohwe5ZEOTym3
         9mIKF/LPzKBsd6tI3/zuPSXmNXkjNubEfgfQnyeDyzxyNDzxa6g8SRxcx0rU1bfMMKZl
         n74lbA3HZms8KWO+qqbqhQM9GAgq7wf2E6DzHKYXPlcs+KJIQUV/5mxnoht4/eX0vGuk
         iRaA==
X-Gm-Message-State: AC+VfDzcGCEEjpYkkc4OpjEd+DS11vvdiCEfJvhwBtMXSqN05BP97MHS
	osv7iwQ40YvdZeVOR4RlCZHMpFoSU8KKxN5Mvrc=
X-Google-Smtp-Source: ACHHUZ4yhQumGvkISKnSfVZhSe3wEKPrFX0MGKmSfUEQeWrIYSmKhlvgYlESelGDgLtwhOIiJfUyng==
X-Received: by 2002:a05:6a20:42a2:b0:125:1596:d14a with SMTP id o34-20020a056a2042a200b001251596d14amr546889pzj.21.1687401403850;
        Wed, 21 Jun 2023 19:36:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/23] binutils: stable 2.40 branch updates
Date: Wed, 21 Jun 2023 16:35:53 -1000
Message-Id: <eeed062f7c9b3c615080678e7ad66d4906b01dc2.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183221

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on binutils-2.40 stable branch are updated.
0dc8f96598a Updated Swedish translation for the opcodes directory
85c5365527f New Georgian translation for the bfd sub-directory.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.40.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index dbb43044a4..006d60e784 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_40-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "4671be001eb5a899ecac3e2686a92934000f8262"
+SRCREV ?= "7343182dd163d14b7e17c255515940dff67f2bbd"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


