Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EF8CCA479
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 02:25:57 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.23995.1657506347708064610
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 19:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nQxUihv1;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id cf13so4016782qtb.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 19:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U1kmt25dWby28Lm6YlVOvxXPZsT5ZOruagaBdezL4z0=;
        b=nQxUihv1BpGYuEQ8QU3D5aBGPJ91w34hUrKnMhcL9MJ58ych6tSBtOvqe0vddPWJrl
         JLNZoVI99O5JcXpqbeupVZxZ2z2aM24hk5CK8if1a626QbTqTjaj9xetNfbLN1Aah9PL
         u+phsF7Z16Hl3Ev1KFrCP9Ah8EyTXZlVOgAOsdY/s5Uemmvi0o2/tfHHhe/NpRrnDWfr
         r5xz3wk7dFJ7TAWEYFqVw0pmMxETeClMlaz3uLs+FhIsf2VBUgWqFx6/Q5fLjyxyTl9P
         s9ZHgNfC0XjJVm1PaQ4vOsyBtgiUHLL9scxilg6AIgsy0UQxuw38HaIlRUtG9PEYYCwq
         gYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U1kmt25dWby28Lm6YlVOvxXPZsT5ZOruagaBdezL4z0=;
        b=U2jMFQWcMyPKzm3dtANmKRPzMl9esO3WANgkqEJoATYJggs/7e1YjofmFTPVK9pbbB
         UvYMiK4wp2K86heIfUA+Ua2hlIb8eLA9+UvBeu04EVjS1iGtV3gXY0XKBSeBG3tgpYu+
         dYrXBvgAEeMpKsC2xO50MOfswj3zimLmGetdLwvZrE/0qCD9VngSSReG3C8fug1GM59m
         0KV6n/rZCBScYt1S52W0inYLEIQwRODf230HX5/fsK0y/wVA/xnoVHIOMdDW4tvZbbpW
         L0J2BhXh+CF4GSuePSlJ+YlWHb02pZuTUHhHmxXtK/MNZUOzuj0fAntvnnCKsuufFCZf
         NVBQ==
X-Gm-Message-State: AJIora/Co1nhc5F3+Gh2FhAPuqASwW84qxp4dxQ4lyWK7O/m3zx3lspf
	LNAwMkpuVlZ8KUHKzgkScFM=
X-Google-Smtp-Source: 
 AGRyM1u1YUS54Zz7d6Qv50BXp5lkwjhtHaCSDR7W4m0VsexdlC3lJLoTg89MM/uutU2mXTi6AmQRng==
X-Received: by 2002:a05:622a:2c7:b0:31d:3cc2:3439 with SMTP id
 a7-20020a05622a02c700b0031d3cc23439mr12280466qtx.185.1657506346611;
        Sun, 10 Jul 2022 19:25:46 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 s185-20020a372cc2000000b006a6ab259261sm5258890qkh.29.2022.07.10.19.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 19:25:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: -stable and reproduciblity fixes
Date: Sun, 10 Jul 2022 22:25:40 -0400
Message-Id: <cover.1657506122.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 02:25:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167853

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of updates to -stable (I had already staged
them before we ran into the buildpaths QA issues), and on top of
them is a RFC fix that I did for the buildpaths issue you found
in the linux-src package with the conmakehash.

That fix is still preliminary, as i haven't triggered the error
here, but I did inspect the output of my build and can confirm the
full path is gone. It isn't appropriate for upstream yet, and only
fixes the issues for 5.15 linux-yocto, but we can expand it to
other linux-yocto versions later.

Also, ther's another fix to devsrc for ppc32 to remove the vdso
file causing the build paths warning.

Bruce

The following changes since commit dc184d6aaf282f28fe96cce2f01bf20f09821645:

  gperf: Switch to upstream patch (2022-07-09 20:58:35 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.15: update to v5.15.52
  linux-yocto/5.10: update to v5.10.128
  kernel-devsrc: ppc32: fix reproducibility
  linux-yocto/5.15: fix qemuppc buildpaths warning

 meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 ++-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++und---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 7 files changed, 41 insertions(+), 39 deletions(-)

-- 
2.19.1


