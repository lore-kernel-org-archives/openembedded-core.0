Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCA3C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:08:58 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.6185.1636603737409573639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ocGk7VDZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id b13so4782628plg.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtaAVJ0/lv6dB458nVkTmAnppCU7dMNA3JOLArAKa8A=;
        b=ocGk7VDZaX8G1ULIrQ6iL0/vRkGlsCgAllXUHRSaRln8aGkfzd9aNyDgYsnsfnmuC3
         RGr9+9kQRb9CWRwjx0Bk7HbSea5fICp/79xIpj/shXkML+0KwmRIlJWPmMZg7p0fXb7m
         7XblG2MDzdBPee8VtmBSE6xmJobJ3tUkkE5tPS6rrQvKeeEKRtMnx2cztrrNLtJkAXru
         nnbi7JwJvDsRJal8OsKzXJhAPcCmYnMdZCYxVXWQI4jqotelQPEkAAmV1EZ9oiJ4lidq
         6hqR8BgDms8/s0peUAXFlfgKBbnnRdH4MJBzm7qbC0Htx1xcpG3VKjwjLYRNl00pEbYc
         xHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtaAVJ0/lv6dB458nVkTmAnppCU7dMNA3JOLArAKa8A=;
        b=jcUJoCVcnJ1DjGjzMiCYCyd7j+ax1mKmBNwJVIOxPGRXVN5ReqaTZEp2KaCrJzGvII
         EQViOYX54v6yKg1MZrIOT2gWiA/4gvvdB1KsHG/Ndold/f2MrkdWpYkM6t+sOqOulH3E
         iRJhb0a3rit9BMOF79Nvf/Goa6/i7RL+Q7lT8gHTi8vF4NnVO9vASJyvFoVIBNd/w5H3
         bgIFcXziKnwl7AVu2R2DY4jLtlw3eylNF4exCdpRpimoMYXHl5ljlwzvXCbUhSaoJAlo
         S2OxYia/MCxlDP5oDHXtTfeD3JQnaiLLHbw18jFTsjahvhQbubZwlzVwt/D8iijcX2A5
         fNwA==
X-Gm-Message-State: AOAM530/CGpkARTckXTyqg2WSoqNOz51It7UiS/agE0AE6Q9ABjj19Ng
	CHhSTcUOPB4l09XPmYoZK4scpPEhChdeVfdFHs8=
X-Google-Smtp-Source: 
 ABdhPJwoKRClMyjsGiPJ8c/KrJTW+8egWV87BB03t9GXhkNZohQUFqKuP5TlM6jABXktZhLCqZc1/w==
X-Received: by 2002:a17:902:b909:b0:13a:2d8e:12bc with SMTP id
 bf9-20020a170902b90900b0013a2d8e12bcmr4891104plb.6.1636603735722;
        Wed, 10 Nov 2021 20:08:55 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.08.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:08:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Wed, 10 Nov 2021 18:08:25 -1000
Message-Id: <cover.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158132

Please review this set of patches for dunfell and have comments back by end
of day Friday.

The following changes since commit 38fc0807eea14dc12610da4ba73c082d5a4b0744:

  meta/scripts: Manual git url branch additions (2021-11-03 08:43:53 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Jose Quaresma (1):
  sstate: another fix for touching files inside pseudo

Joshua Watt (1):
  oeqa: reproducible: Fix test not producing diffs

Khem Raj (1):
  webkitgtk: Fix reproducibility in minibrowser

Marek Vasut (1):
  piglit: upgrade to latest revision

Mark Hatle (1):
  reproducible_build: Remove BUILD_REPRODUCIBLE_BINARIES checking

Mingli Yu (1):
  python3-magic: add the missing rdepends

Richard Purdie (6):
  linunistring: Add missing gperf-native dependency
  pseudo: Add in ability to flush database with shutdown request
  pseudo: Add fcntl64 wrapper
  mirrors: Add uninative mirror on kernel.org
  sstate: Ensure SDE is accounted for in package task timestamps
  sstate: Avoid deploy_source_date_epoch sstate when unneeded

Steve Sakoman (2):
  python3-magic: add missing DEPENDS
  selftest/reproducible: add webkitgtk back to exclusion list for
    dunfell

 meta/classes/mirrors.bbclass                  |  1 +
 meta/classes/reproducible_build.bbclass       | 53 ++++++++++++-------
 meta/classes/sstate.bbclass                   | 34 +++++++++---
 .../oeqa/selftest/cases/diffoscope/A/file.txt |  1 +
 .../oeqa/selftest/cases/diffoscope/B/file.txt |  1 +
 meta/lib/oeqa/selftest/cases/reproducible.py  | 29 +++++++++-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 .../python/python3-magic_0.4.15.bb            |  7 ++-
 ...ssing-include-for-htobe32-definition.patch | 27 ++++++++++
 ...file.py-make-test-lists-reproducible.patch | 31 +++++++++++
 ...gen_tcs-tes_input_tests.py-do-not-ha.patch | 44 +++++++++++++++
 ...lizer.py-make-.gz-files-reproducible.patch | 30 +++++++++++
 ...sort-the-file-list-before-working-on.patch | 28 ++++++++++
 ...t-shader.c-do-not-hardcode-build-pat.patch | 30 +++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 12 ++++-
 .../0001-MiniBrowser-Fix-reproduciblity.patch | 31 +++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.28.4.bb  |  1 +
 .../libunistring/libunistring_0.9.10.bb       |  1 +
 18 files changed, 333 insertions(+), 30 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/diffoscope/A/file.txt
 create mode 100644 meta/lib/oeqa/selftest/cases/diffoscope/B/file.txt
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch

-- 
2.25.1


