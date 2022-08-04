Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F97C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:07:05 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.5147.1659622015931143206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KHuMor6P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso5389086pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A7Qnt4pSPjenGdKc6RahO1FieH9G8Dp6Z7ensa9mcZc=;
        b=KHuMor6PrjwyktIc0ccZDeYOirJKb7uAq/SYKeJ2ytGtbJIrloyKCkPn8uO157XDeV
         1sTqDSAxMndwMkfiAdeiV51Qb5MRO/E1g3NdSdNNefPwnu/iVxBJC2Z8t2qbAZjUhNVK
         kx9L+W80+CoY5KLh8/91iuEZiw0zJ5WI08SqLh+tdZQrXnVt/O/oILbmr85p3a3Bl9nJ
         EJqwr+w6/d07qZe5RIpMws+vtd95AXHb/xTVXJeqo64Gteh0KpJDFqKHhYJgDVzXclkU
         B6PRPSxMH3uX0/vPme/C0TmkmwbPt+0aidyRzsrm4wgJOp11etS06Yzy0naxQAoW+I/a
         Gr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A7Qnt4pSPjenGdKc6RahO1FieH9G8Dp6Z7ensa9mcZc=;
        b=HHZU/zJ96APpuitCAp49plsj1hT3zmfGOQDzf0Z3Ypn2p6yqHz0wOxkK47/2xaVPaw
         0PLNSDzM2INp1Pt2ES/tW5irHxhYJzK+zr172kOQN6b28pFgUxal/iUwI/zUfiTR/nJD
         UP4jmoFcnvZwXQCaPjuxqnsq2laNKuLAmgxQ4KI4SysceNmdLAxnaU7eOImwUpeq9XEU
         Odjzu7MEuAR7wn4s+XjrUr2Vc+7FT1elt7gS8XMD0uxt9yIvWHKFzPZPDuPp54vf7yv6
         FYXtl2cS4gta7OsH0BOXqXEcH3ekKVE6CQc28GIRBMqetk5BqMA5iUMk5OunT1kTFsMW
         a5oQ==
X-Gm-Message-State: ACgBeo1/v/hGW7/tfYyq4JdstODh1udrVwxs3+tdwUfFB/SnaytHzndL
	Ai9EqJLnXRKuC1kvu2Nmlc4YAEEzhB0k7Kpa
X-Google-Smtp-Source: 
 AA6agR78EtHf3VpGP0DPNm5e98D0WAPk/wXAgWgik5Pin+88VFXg3pOvet/qa2oqhx8s+vvqLO4RSQ==
X-Received: by 2002:a17:902:e849:b0:16e:81c6:2cb7 with SMTP id
 t9-20020a170902e84900b0016e81c62cb7mr2169157plg.110.1659622014814;
        Thu, 04 Aug 2022 07:06:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6215cd000000b0052d5e93fcb7sm970261pfv.191.2022.08.04.07.06.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:06:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Thu,  4 Aug 2022 04:06:03 -1000
Message-Id: <cover.1659621460.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:07:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168849

Please review this set of patches for kirkstone and have comments back
by end of day Sunday.

This should be the almost final set of patches for the 4.0.3 release -
there remains an intermittent linux-yocto reproducibility issue that
needs to get fixed.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4015

The following changes since commit 3564ce3d9b2030dd420362c66147bd327090915c:

  initscripts: run umountnfs as a KILL script (2022-07-28 05:32:25 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alex Kiernan (1):
  openssh: Add openssh-sftp-server to openssh RDEPENDS

Dmitry Baryshkov (1):
  linux-firwmare: restore WHENCE_CHKSUM variable

Khem Raj (1):
  libgcc: Fix standalone target builds with usrmerge distro feature

Martin Jansa (1):
  kernel.bbclass: pass LD also in savedefconfig

Mingli Yu (1):
  strace: set COMPATIBLE_HOST for riscv32

Shruthi Ravichandran (1):
  package_manager/ipk: do not pipe stderr to stdout

Sundeep KOKKONDA (1):
  binutils: stable 2.38 branch updates

 meta/classes/kernel.bbclass                   |  2 +-
 meta/lib/oe/package_manager/ipk/__init__.py   | 23 +++++++++++--------
 .../openssh/openssh_8.9p1.bb                  |  2 +-
 .../binutils/binutils-2.38.inc                |  2 +-
 meta/recipes-devtools/gcc/libgcc-common.inc   |  8 +++++--
 meta/recipes-devtools/strace/strace_5.16.bb   |  3 +++
 .../linux-firmware/linux-firmware_20220708.bb |  5 +++-
 7 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.25.1


