Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF888C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:30:38 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.21863.1658104237516578842
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LUyyY3/0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id w185so9336214pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7XDa2yAOlw3ChzZN9n2/2yAC6pdKQU7b9Qk1+EjR1Y8=;
        b=LUyyY3/0y9V00lRV+8peew0WD9DUT5qHF60bXhtsUA5Zx2b9h7oHUYABCszzTAFoyr
         6hybtJ8uMLNrx/UnhtWUQlt6fkPe4H1J6Byl0wtpTM+fcATAquWgQBZ8ajlxmPVy6tp6
         DwP3E1rlSzg2iy3bcZUZBo2g7BNIw9AzvFOiM37ucoTq90YhNyIcLirpcVQE1rn2ZPvZ
         sUmY3efoQg6vhUVri9wvb3iLCP7t0AcDdlpit6ZQ3yVErzJfSPDAHiJzV40oIUmixDbG
         jmKeB9w6vKSjhEs+TIEmCngkznu8JMIZCQ/xrESnZ11ZDO3QAoBs+aZTZ338GrOAdE/w
         0oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7XDa2yAOlw3ChzZN9n2/2yAC6pdKQU7b9Qk1+EjR1Y8=;
        b=2atWRo2wjS1THEXiEdhOxSkL+WM6kRZTWb7rx2vbpR9dpbn4ViwSkj1D66pNyb8tdo
         7TwTERvS1kX1Sum/AYVjqT6ildV4fuyIskB6nflHrXZCz5t+AtsJruu77D3yEliQd7f2
         Cw+hwLcnpW4+ik82xbwORYVmr175yEslItIho5CsKNE9NSNRL8kg7x1XBbUL9NLcMN8h
         1Ju3N2S6g+9TDkfg0PAk/oA+Xrugz7AYOPHJRa5TZpCkgJ3ACvfw13cveMwwESZcfngN
         tQDNuTWIaiiJEyeA4LIM5Bg+BkQ3jSVRomnlTxHzoHWLNwmdwnDaYOBCksHR7DKkMRrT
         Sl/Q==
X-Gm-Message-State: AJIora/mzVhmNkX3zHt+Vah65ntPXOfnEaYIlmHzh94WkZEEYkWCtdlI
	5W0Klvq9Yclr/hoToGxmAxPaPa7+vdnLna72
X-Google-Smtp-Source: 
 AGRyM1vRMbYcY2MDqQIfthDOWxBWtQmaD56ZxJN3+jKu8FwyTjGRvcTqJfRckEnsqVhiOqyXK04uTQ==
X-Received: by 2002:aa7:909a:0:b0:52b:3afb:fc49 with SMTP id
 i26-20020aa7909a000000b0052b3afbfc49mr15023155pfa.39.1658104236245;
        Sun, 17 Jul 2022 17:30:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.30.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:30:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/23] Patch review
Date: Sun, 17 Jul 2022 14:30:01 -1000
Message-Id: <cover.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:30:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168165

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3924

The following changes since commit a4bfb5ceb5cf8c0c6d27225b27ef10c0b9dceccb:

  libsoup: upgrade 3.0.6 -> 3.0.7 (2022-07-13 11:54:16 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (19):
  linux-yocto/5.10: update to v5.10.121
  linux-yocto/5.10: update to v5.10.123
  linux-yocto/5.10: update to v5.10.128
  linux-yocto/5.10: fix build_OID_registry/conmakehash buildpaths
    warning
  linux-yocto/5.10: fix buildpaths issue with gen-mach-types
  linux-yocto/5.10: update to v5.10.130
  linux-yocto/5.10: fix buildpaths issue with pnmtologo
  linux-yocto/5.15: update to v5.15.46
  linux-yocto/5.15: update to v5.15.48
  linux-yocto/5.15: drop obselete GPIO sysfs ABI
  linux-yocto/5.15: update to v5.15.52
  linux-yocto/5.15: fix qemuppc buildpaths warning
  linux-yocto/5.15: fix build_OID_registry buildpaths warning
  linux-yocto/5.15: fix buildpaths issue with gen-mach-types
  linux-yocto/5.15: update to v5.15.54
  linux-yocto/5.15: fix buildpaths issue with pnmtologo
  kernel-devsrc: fix reproducibility and buildpaths QA warning
  kernel-devsrc: ppc32: fix reproducibility
  perf: fix reproducibility in 5.19+

Richard Purdie (4):
  qemu: Fix slirp determinism issue
  qemu: Add PACKAGECONFIG for brlapi
  gperf: Add a patch to work around reproducibility issues
  gperf: Switch to upstream patch

 .../qemu/qemu-system-native_6.2.0.bb          |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 meta/recipes-devtools/qemu/qemu_6.2.0.bb      |   4 +-
 ...c6e57a308a05889c80c048dbc58bdc378dcb.patch | 181 ++++++++++++++++++
 meta/recipes-extended/gperf/gperf_3.1.bb      |   2 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   8 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 meta/recipes-kernel/perf/perf.bb              |   6 +
 13 files changed, 238 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch

-- 
2.25.1


