Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA7EC47DA9
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:49 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.8353.1706323059631447846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iw8V86YT;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.179, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6002317a427so9111607b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323058; x=1706927858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=18q21WsDZOtL7veLjkY0y82LsPqMY1jzf0L3XC5MgZ8=;
        b=iw8V86YTn4iwbygUdUCfVh0Jioug/V0clVRj4k8HHuxO+wH+afvBhxDkC1gkWthwbn
         PAw23pwEBBe89judIpD/Shv3k3cNZNx7/P1uwO8NzfCxSLZiopqVsWbdoigytY54K9Aq
         ZYDmnOwUY+9MB8CDXPnK7WN31OcTvWLoJgY/NLp+J/+PQlwYLaX218dHisgaNLJvH2eW
         mIEaG7ZzNMkloXpMhWsbnj6s2b79cWQBp+92Lt24oN0Mo4nU2m6Ibz2gg2mz9hrx3lpj
         bGVHu6a8PMfzgOkx77fgLAgmPuXiRjQPFkqKSZNQjYYWwVila7sF9bq6E8iabaU9YIPC
         Bk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323058; x=1706927858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18q21WsDZOtL7veLjkY0y82LsPqMY1jzf0L3XC5MgZ8=;
        b=tpl7c+nfwE+cixU08kuaF6CChFLFWVfpBkM9yn213jq0RrZftcBeVR2yBFEflbFbk2
         xvw6gcdkBulUOTY2ebwdWiJTgd6NGQ+pbiSXN0k8aMUZHZaWkw1W5c9/d3ITSH+vtbz8
         bHH8xfOBn9VRp+IXWWdrs7vtVgGNwYLM3Y4JZwCwwRKMh9L8ujqmNhrSmZNlAYcWlUDI
         cCOaBnn+AWfdAY19oitgfg2yvI+9cXzjxqmefeV2gieJM/0xV8kCKScYr8qRA1PYx+Bv
         LjbA/js36zkCtWNlfsrLKQS39b7BdkWXLWuaeqzvBhbUbOdX86MMca8y91121LOtsFwQ
         RqwA==
X-Gm-Message-State: AOJu0YzEDyqMagBdV7uG4e374wdag2uWe93JhCgIp8EPYV6Zon2c+zQQ
	xx8mggquwkxRIYqfL0KBuwri2ouMd2/tP+60jL9qE5OUe7V4XHe48+H9xHzpmrxSSacRVK+l66g
	jf5VkEA==
X-Google-Smtp-Source: AGHT+IHOa4Mu2XTqL564Eyt9AXWFkPl2ySzp/TZysfAaDW9swIKGhMqv6ZDtOATLTt9dY3jbwJ07Ew==
X-Received: by 2002:a81:9254:0:b0:5ff:5c90:7d39 with SMTP id j81-20020a819254000000b005ff5c907d39mr865436ywg.98.1706323057901;
        Fri, 26 Jan 2024 18:37:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/23] Patch review
Date: Fri, 26 Jan 2024 16:37:08 -1000
Message-Id: <cover.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194409

Please review this set of changes for nanbield and have comments back by
end of day Tuesday, January 30

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6501

with the exception of a known autobuilder intermittent error on qemumips-tc:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15036

Passed subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/1231

The following changes since commit 3d5a85f173dffa14a6829edb9e6adbd5a3946d9c:

  rpcbind: Specify state directory under /run (2024-01-23 04:27:34 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Bruce Ashfield (8):
  linux-yocto/6.1: update to v6.1.69
  linux-yocto/6.1: update to v6.1.70
  linux-yocto/6.1: update CVE exclusions
  linux-yocto/6.1: update to v6.1.72
  linux-yocto/6.1: update CVE exclusions
  linux-yocto/6.1: security/cfg: add configs to harden protection
  linux-yocto/6.1: update to v6.1.73
  linux-yocto/6.1: update CVE exclusions

Clay Chang (1):
  devtool: deploy: provide max_process to strip_execs

Joshua Watt (1):
  classes-global/sstate: Fix variable typo

Markus Volk (1):
  libadwaita: update 1.4.0 -> 1.4.2

Mingli Yu (1):
  python3-license-expression: Fix the ptest failure

Peter Marko (1):
  dtc: preserve version also from shallow git clones

Richard Purdie (3):
  curl: Disable two intermittently failing tests
  lib/prservice: Improve lock handling robustness
  oeqa/selftest/prservice: Improve test robustness

Robert Berger (1):
  uninative-tarball.xz - reproducibility fix

Robert Yang (1):
  nfs-utils: Update Upstream-Status

Saul Wold (1):
  package.py: OEHasPackage: Add MLPREFIX to packagename

Soumya Sambu (1):
  ncurses: Fix - tty is hung after reset

Wang Mingyu (3):
  libatomic-ops: upgrade 7.8.0 -> 7.8.2
  libva-utils: upgrade 2.20.0 -> 2.20.1
  kea: upgrade 2.4.0 -> 2.4.1

 meta/classes-global/sstate.bbclass            |   2 +-
 meta/classes-recipe/populate_sdk_base.bbclass |   2 +-
 meta/lib/oe/prservice.py                      |   4 +-
 meta/lib/oeqa/runtime/decorator/package.py    |   5 +-
 meta/lib/oeqa/selftest/cases/prservice.py     |  31 +-
 .../kea/files/fix-multilib-conflict.patch     |   8 +-
 .../kea/files/fix_pid_keactrl.patch           |   6 +-
 .../kea/{kea_2.4.0.bb => kea_2.4.1.bb}        |   2 +-
 ...nclude-unistd.h-to-compile-with-musl.patch |   2 +-
 ...eset-code-ncurses-6.4-patch-20231104.patch | 499 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 .../python3-license-expression/run-ptest      |   2 +-
 .../python3-license-expression_30.1.1.bb      |   2 +
 ...ibadwaita_1.4.0.bb => libadwaita_1.4.2.bb} |   2 +-
 ...-utils_2.20.0.bb => libva-utils_2.20.1.bb} |   2 +-
 ...01-meson.build-bump-version-to-1.7.0.patch |  29 +
 ...n-allow-building-from-shallow-clones.patch |  38 ++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |   6 +-
 .../linux/cve-exclusion_6.1.inc               |  68 ++-
 .../linux/linux-yocto-rt_6.1.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +-
 meta/recipes-support/curl/curl/disable-tests  |   6 +
 ...ic-ops_7.8.0.bb => libatomic-ops_7.8.2.bb} |   2 +-
 scripts/lib/devtool/deploy.py                 |   3 +-
 25 files changed, 706 insertions(+), 56 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.0.bb => kea_2.4.1.bb} (97%)
 create mode 100644 meta/recipes-core/ncurses/files/0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.4.0.bb => libadwaita_1.4.2.bb} (88%)
 rename meta/recipes-graphics/libva/{libva-utils_2.20.0.bb => libva-utils_2.20.1.bb} (95%)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.0.bb => libatomic-ops_7.8.2.bb} (89%)

-- 
2.34.1


