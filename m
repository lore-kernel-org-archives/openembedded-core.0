Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46271C001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 09:44:16 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.3766.1690796655177267533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P+gxlVFC;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31765aee31bso3873119f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 02:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690796653; x=1691401453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YsPM5yegnOBo9NbcPjNw64oSU4MgHZqK9uPExRpqmsY=;
        b=P+gxlVFC6qXm9Wx0Q/Bhgafv5X/qB1FknKLQofVu4oxa2WNmcODjp8ReSnH3ta9F+7
         ULC6xFKImD0vzfz9/KHK2OyTfzcYGCbG5/aLCpE2ZZaPv2Qx0MApjZot73g0JdrfZmSp
         2S2pe/WXy4N82p6WtNAHE6DvIjbZdN/jYNv8FA7eA5DZLx5dc2IF0Q85Z1ohqibMHdZB
         09iWROkfa+akqu1e4kD+Q33fsN4RrNXps09L37E6uawKbYNZpoFicAXXT7u3oCNibnwT
         kYDmTa4IDI6bpk0GuDIRvrsrI+D1SmDxwtgJszDkAWb+z3d0zdx2jkFC8GvbvkeuBIKs
         piqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796653; x=1691401453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsPM5yegnOBo9NbcPjNw64oSU4MgHZqK9uPExRpqmsY=;
        b=WD3XdxoD5UrY/sM+NG2lvuR+I3cz7mT4v45Am5hchRkSuHQ9b8KZjOchwiw63C7XOG
         5qpA9jcydB/HKqOW5ZqVavHpT8257Ay4GuchfDQYtKcqMhWorRUmuwQhIextO2qdvD8j
         MPASyjkwCsczjd8uZ3wLbLSWuA+CEfo0V+Ed9n8MG4TWAhOFWi0yg3TovRzrX5quMuRy
         cEiqe6ToQJwV+sfJSfgbtox/l19KHMJpgOihgbeNjfxUS1FpL5Zjb6L3xG5NGKR384Wa
         VaRhbre58YU6v4A1tk16l6eKm6Z5NkdkaA994tKFi9J/Xqsuvz+ECxWrQgw/6eg9C0zz
         JxfA==
X-Gm-Message-State: ABy/qLZ0qFoDMca55WNLQfwRmObUTwGuej6dajG4Qoiu5aBz5e7Pbuek
	5pCltzGmlwbuFyoqgwEUe19ilKsJY4M=
X-Google-Smtp-Source: APBJJlHF/L5U6JdSf7GQe8GsFmuw7/VeLPnrQ2jz73vz6GkJ2PApCuOTno8I3FG5zn6RpKYB2r0O4w==
X-Received: by 2002:a5d:4d8a:0:b0:317:5d3d:d395 with SMTP id b10-20020a5d4d8a000000b003175d3dd395mr6855017wru.26.1690796652952;
        Mon, 31 Jul 2023 02:44:12 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:c4e8:ab56:aff:118a])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d55d1000000b003143be36d99sm12526610wrw.58.2023.07.31.02.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:44:12 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [PATCH 0/3] Use frozen flag for cargo build
Date: Mon, 31 Jul 2023 11:44:07 +0200
Message-Id: <cover.1690795930.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 09:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185128

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This patch series force the usage of --frozen instead of --offline during cargo build.
This has the advantage to be sure that Cargo.lock file will not be modified.
Moreover, raise a clear error when Cargo.lock is not present.
For this to work, we must modify ourself the Cargo.lock before building
in case there are git repo that have been patched.

The last commit is to handle the specific case of rust-hello-world recipe.
If this recipe is no more necessary, we can drop this last patch.

The following changes since commit 9b5b850d6a6982bb8ff14dcfbb6769b293638293:

  libarchive: ignore CVE-2023-30571 (2023-07-30 12:00:13 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core 15104-check-cargo-lock

Frederic Martinsons (3):
  cargo.bbclass: Use --frozen flag for cargo operations
  cargo_common.bbclass: Handle Cargo.lock modifications for git
    dependencies
  cargo.bbclass: Offer a way to use --offline instead of --frozen

 meta/classes-recipe/cargo.bbclass             |  9 +++-
 meta/classes-recipe/cargo_common.bbclass      | 43 +++++++++++++++++++
 .../rust-example/rust-hello-world_git.bb      |  2 +
 3 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.34.1


