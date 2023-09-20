Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D01CD4923
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:23 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.3135.1695249074105835488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YNUtGoRh;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-564b6276941so181891a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249073; x=1695853873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZkwmYj00hD7Eb2vUW29ZwqLosRtzNo1v7U4+cwIvZw=;
        b=YNUtGoRht9jamil5Vry0Plx0LySiQNqx4HtkvEbUo+qhYiRetxyNLH24kHEbUNbywT
         UwAjgux4vVpmYixhDl6b95C8Dsr4KcWLy4aPhjkGmLaUdU2hnZ8ME1lfz/Ft5oaGKVmn
         JmSYUZ/xnU2F0Q3UTmLoaGp0AWFDVI57PtM0kV9ZsZz8rOXf4lS7XDCkKOzclWIRz/Yd
         BRU8YCtKbT3TNRORlRQpX8Dn7ai46mXLbMCc93bXIBKboXwxaBnx1WYflGw+KiLPhExJ
         rpvQVtCtsjGv75i0NaA38Ib4IKttyYCmlsh7m75qrfXhQFxQAL/VxHl7oEQkJ3mTylel
         VH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249073; x=1695853873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZkwmYj00hD7Eb2vUW29ZwqLosRtzNo1v7U4+cwIvZw=;
        b=q1Ngy2CNB1VrJXDrPSmFLlo8Mac0ygdH/bPZd5m2XS9y07kS4LskAM1sR4c/JyU/bk
         kQbI/xy3gdRQclsqbyeMK4Y5H6gOoEzJp8KyIDzCVdkG8pecIQhUjz+I1Pi0FoaoVNxH
         LbvwokPOgeQoGceKsBnpxQXXfYwTjxTeVdPv4s3Ba7sh9mJh0tyRe5f93i42kV9OP2Ut
         B2sFEbaqgWRbcMuR3CgOmpz3KaZeceKjFRUW8wRW4BR+IVglbcfRkjuNu7skrFXuvdFO
         SQySeg+j0r4AmMPgvR0Jfm3YcgsOQBAlJTnvpjdNmfFIvRGMV89HvpwcMrhaRpzd5KJe
         hLoQ==
X-Gm-Message-State: AOJu0YzhfBXE99kQSgevenuvAsdfy7AV/CXL6TKgTbIJD0kCOCe5YCE3
	e+95TEBGvDCs3DmQgNgQezh33P0d+EYE6/PKG94=
X-Google-Smtp-Source: AGHT+IHUUbNRKK8tvU1b63cIi4XKDDIjKTU7EhdKbVdXoB99aExSbGuZNbM2sv+KYEoBGl9tSnErCg==
X-Received: by 2002:a05:6a20:9799:b0:14c:6438:eece with SMTP id hx25-20020a056a20979900b0014c6438eecemr3456536pzc.62.1695249073192;
        Wed, 20 Sep 2023 15:31:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/20] binutils: stable 2.38 branch updates
Date: Wed, 20 Sep 2023 12:30:43 -1000
Message-Id: <e8becc003d6926cc347ec42c0f13dcd5d9042b4d.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187954

From: Sanjana <sanjanasanju1608@gmail.com>

Below commits on binutils-2.38 stable branch are updated.

ea5fe5d01e5 PR30697, ppc32 mix of local-dynamic and global-dynamic TLS

Signed-off-by: Sanjana <sanjanasanju1608@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 3bcb0cabb8..638b1ba93d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "dc2474e7d204c124ab5a21b4490aa46eb7e1d4c3"
+SRCREV ?= "ea5fe5d01e5a182ee7a0eddb54a702109a9f5931"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


