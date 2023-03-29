Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5839C761AF
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:30:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.1099.1680103847889534012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 08:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a1z9dI1c;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so11386115wmq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680103846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSUTFTZv5uQ9rnrm/0vtkmDhT6ZGPOLhK9+qmNEb070=;
        b=a1z9dI1cNu6wGKKV5G3VL9mThSOL+D+lgOyFpApFjx4rkvzueNShWo9gRfuDmxG8BP
         ttvwRPR8n4qdDzOZRLemjXtAN4xmumDr420OKZRtGY2G0HygIqjBW97+LGG4FXd+kArH
         na0fGBgPpYrq/nDuDFwL4eLN90W4U64H1j0lc0ENuiM1pHgfpiC/StL4ukAvIvIfEOGf
         A1h/jfemP7zLGmqrb+Cje0OwzQw+HZg07Oc3e1uuQdBfqEljp6DFlsXU5MidjJO2UxOR
         7ICEBOlq1zUYRzQqdkzotv9mgoxOpqp1HdY+0CuZm0qk+bQtF9yx8hIdk60YPjr3SseT
         GNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680103846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSUTFTZv5uQ9rnrm/0vtkmDhT6ZGPOLhK9+qmNEb070=;
        b=qNIYtRKvngVtTS2m37044854QawVnMLNhDy5qGZL+0y/HZ9UZH3l4jWjK8nB09+i2r
         lAJ+j8tloN3oX420ad1wghRy2Jq5irm2LtynmJWnC9RgwliAgsDtrUt4ne0C162HR+t2
         5l/8QvT7YM9ro4Wd1JkVMCMHF72+DvGoXBAmrqjU7YBa/IVADpiEhTMuFPTVlD3h5qNm
         TmEPcEZFqaqXQO4XKVqDXWisP1suri6z17WJcpcTTaSybvXztuEsHO3KjGRuHOSoszBI
         ojao2ZIf/PRmnx0poI5zt/wBTsj5eMvysIF26TBezWwggEuLBYXCBkeimywxvVlY059U
         6Sqg==
X-Gm-Message-State: AO0yUKUIlFRlebSm6IhV5yjqx2oCMfuAa0rC9QJlKfjK8MiTvVqliiHN
	YksEgkYee3Fcgn054TuNealNkHmwxUk=
X-Google-Smtp-Source: AK7set/x3aRgfS6DSYEf5DQVhbKj1MxI6+zFS59gHoYenqha5SCZYIvZzwjzkIBodPLd2eTm78OSpg==
X-Received: by 2002:a7b:cd87:0:b0:3ed:de58:1559 with SMTP id y7-20020a7bcd87000000b003edde581559mr16018617wmj.2.1680103845740;
        Wed, 29 Mar 2023 08:30:45 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:f236:1d99:4c31:5762])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c224d00b003edef091b17sm2607378wmm.37.2023.03.29.08.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:30:45 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V4 0/5] Extend cargo based recipe support
Date: Wed, 29 Mar 2023 17:30:29 +0200
Message-Id: <cover.1680103647.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 15:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179285

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This series brings the support of local git repository inside
a cargo based recipe.

It also enables devtool capacity to such a recipe along with
an example of recipe and a new selftest case.

The following changes since commit fd70a564d6946fa460638dd04ce2daecf4566cf3:

  oeqa/selftest/reproducible: Split different packages from missing packages output (2023-03-28 22:28:42 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-extend-support-git-and-devtool

Alex Kiernan (1):
  cargo_common.bbclass: Support local github repos

Frederic Martinsons (4):
  cargo_common.bbclass: add support of user in url for patch
  devtool: add support for multiple git url inside a cargo based recipe
  patch: support of git patches when the source uri contained subpath
    parameter
  meta-selftest: provide a recipe for zvariant

 .../zvariant/zvariant-crates.inc              |  140 ++
 .../0001-Tweak-zvariant-crate-config.patch    | 1292 +++++++++++++++++
 .../zvariant/zvariant_3.12.0.bb               |   26 +
 meta/classes-recipe/cargo_common.bbclass      |   33 +
 meta/classes/externalsrc.bbclass              |    4 +-
 meta/lib/oe/patch.py                          |   57 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   93 ++
 7 files changed, 1629 insertions(+), 16 deletions(-)
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb

-- 
2.34.1


