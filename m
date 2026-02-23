Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1F3EEC291
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:50:35 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6456.1771883424947962635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gXtVVcMY;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8954c181830so57083056d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 13:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771883423; x=1772488223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0MQkDvpOUizilr2ofdLiUpGZ3kdmfLZPrU6HzcogBg=;
        b=gXtVVcMYA4dtYVSxoZZZnReQxystgOyIO52c2jRYl1zXI5eBt8MHaMTyWp2xK/l31J
         je5brMcHaN15S/ck7xFi/MqqIZLIirGEnDnlsT7/OCl3rUthxOv+iDeNrWJYtvtfDhzB
         1NybxpKEiUmruWeOrDv/dpaVt+jk1frA5aw0ZZh8jz2O13VIPc0R58K2EBwVXySAJ+Nq
         K6PeObwz6vs0187LoUVUbzAvYFMTPXoe52J6KdKpq4NTbwCDcbdliO1PCjRGOlUJoLES
         ADu1Que9CBP3bp6h1pCPBlr2kHSQ3eiF4UD4PZJbaCn1lqIYBGeVLaujn6GPfqlO/Yer
         vWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771883423; x=1772488223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0MQkDvpOUizilr2ofdLiUpGZ3kdmfLZPrU6HzcogBg=;
        b=tRpSVP5Ljgam8LlJiiTB2APyq2yKsbgqQwwZSKWYteGw7+33cAc2MERCclNXFEgv74
         KKw6UDHgOyxFCZ/uBf4NDCcB1fNE2sZ1bi2sQGx5OZ+WcJ+RK+wJXEdPgIwby2V6UPu3
         0r0ct17z1XIjfbFkU0BylFma1D8GXeK5waRrGE/AMs83Qx8PSt8pZQ2WjYTi4BW5owPf
         kSkazxByzVsnnkgFcu1PUPPKj1HZ8TGAF/JbFgFBC9o6ZajlAAzjg17fi4ft1AP3LuPe
         0Hf3Si/oUxTZfjvQngJA6ZfxKQyVZvLXzn0rkC8GQKUAToFIbE1sdhu83P3c81aOmCSV
         ws2w==
X-Gm-Message-State: AOJu0Yzobz30aVUzIcjBmWwqecyK79l4D4H14tN0x8xcQgO7UfSdGMaA
	Be0FVJVa3cRaei+6rwV2J850TmghyPb7NXzHE73v8qcRyIm8UtHo9o2i7kGi3M/v
X-Gm-Gg: ATEYQzwp1t2EOmiv0JZXNOWGdgAB3Ux5ypdbTIkEU+O1n/z7IM8Qp6LgskMUiSGkEB4
	zuEEM556+iG7sNVZWr9no/V3L2m7Tnj4maFI70j+R7X+9gv0dn6gnVWhZh5q0LUvfWuGB3m3F7v
	sSYbnYvX7gXAd5N0Dq7mBfyjC0uE2f85t1A9OqwKgBJy9wSRtnSrgfPHAV9a257yijaJuRWS6vG
	onUkfi7m/a93W738u1ErwrCVQVEVF6AfzOv45OG2WJ5daEzQfLlwHtBAW8UnRrzVmqlvLrWfZJ+
	GkF5lnpoWhuT1WvcIh4slB/QVFI8YMdRw+ywlTXfkazZEbrKOEouP3iyevdpsfurIeQPpeKzMla
	y22YEkDZfD9iHvrwnSJr9A/7JuloBOhc831Q64eDJHqR68DvNg8H21Ml2dcQGfDn0la+DLLAVM9
	Sb+7eSyY7bv/qfxS8P2q6RDqwlklJy+GRwC03TQU8yVtnNqWWgFkejDA/XB9nTJ79wmw==
X-Received: by 2002:a05:6214:c6e:b0:894:81ba:50bc with SMTP id 6a1803df08f44-89979ce732emr155780496d6.30.1771883422929;
        Mon, 23 Feb 2026 13:50:22 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691113sm93811606d6.1.2026.02.23.13.50.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:50:22 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 00/10] standalone wic
Date: Mon, 23 Feb 2026 16:49:58 -0500
Message-ID: <20260223215008.2062721-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231701

This series of patches splits wic out from oe-core into its own
standalone utility. The wic utility will continue to be under The Yocto
Project umbrella, but will no longer be integrated into the project
as part of oe-core. The ultimate goal is to make wic a completely
independent tool, hosted on PyPI, with its own tests, development
roadmap, and releases.

Some benefits include:
- relieving the oe-core maintainers from having to review wic patches
- allow the tool to be used outside of The Yocto Project
- provide more flexibility to explore other features, libraries,
  mechanisms, etc 

These changes have been tested with oe-selftest as follows:
        $ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <my numeric group id> 4
        $ oe-selftest -v -r wic 

At this time, I have two separate patch sets for wic on oe-core: one
to create a standalone utility, and one to re-implement variable
sector-size handling. So far 3 versions have gone out for the standalone
set, and 4 have been posted for re-implementing variable sector-size
handling. With this patch set I have combined both efforts and marked
this as "v5". This is why some of the patches will point out there is
a missing version. It was decided that it would be better to
re-implement the variable sector-size handling before splitting wic out
since this has a big effect on the patches required to keep the
oe-selftests working.

For the standalone patch set:
v1: an RFC patchset was sent out, split up into small patches for easy
    review
v2: add wic utility to list of native dependencies of
    image_types_wic.bbclass
v3: squash all commits together to apply atomically
v4: (does not exist)
v5: rebase on latest master
    split commits back out acknowledging any bisection that lands
    between them will fail
    combine with sector-size patch

For the sector-size patch:
v1: initial patch set
v2: add Mark as co-author of ufs class
    try to fix a build warning when not using wic
v3: actually fix warning when not using wic
v4: deprecate, but allow, WIC_SECTOR_SIZE to continue to be used to set
    the sector-size both from config files and the environment
    warn when both are used, but prefer cmdline value
    change partition type of sample wks to gpt
v5: fix a bug where WIC_SECTOR_SIZE is not given anywhere
    combine with standalone patch set

Trevor Woerner (10):
  wic: re-implement sector-size support
  ufs image class: add
  wic: remove
  wic: provide oe-core wks files
  wic: add recipe
  oe-selftest/cases/wic.py: update WicTestCase
  oe-selftest/cases/wic.py: oe-selftest -r wic.CLITests -> PASS
  oe-selftest/cases/wic.py: oe-selftest -r wic.ModifyTests -> PASS
  oe-selftest/cases/wic.py: oe-selftest -r wic.Wic -> PASS
  oe-selftest/cases/wic.py: oe-selftest -r wic.Wic2 -> PASS

 meta/classes-recipe/image.bbclass             |    2 +-
 meta/classes-recipe/image_types_ufs.bbclass   |  221 +++
 meta/classes-recipe/image_types_wic.bbclass   |    6 +-
 meta/conf/distro/include/maintainers.inc      |    3 +-
 meta/lib/oeqa/selftest/cases/wic.py           |  288 ++--
 meta/recipes-core/meta/wic-tools.bb           |    1 +
 meta/recipes-support/wic/wic_0.3.0.bb         |   18 +
 .../canned-wks => meta/wic}/common.wks.inc    |    0
 .../wic}/directdisk-bootloader-config.cfg     |    0
 .../wic}/directdisk-bootloader-config.wks     |    0
 .../wic}/directdisk-gpt.wks                   |    0
 .../wic}/directdisk-multi-rootfs.wks          |    0
 .../canned-wks => meta/wic}/directdisk.wks    |    0
 .../wic}/efi-bootdisk.wks.in                  |    0
 .../wic}/efi-uki-bootdisk.wks.in              |    0
 meta/wic/mkdisk-ufs.wks                       |    5 +
 .../wic/canned-wks => meta/wic}/mkefidisk.wks |    0
 .../canned-wks => meta/wic}/mkhybridiso.wks   |    0
 .../canned-wks => meta/wic}/qemuloongarch.wks |    0
 .../wic/canned-wks => meta/wic}/qemuriscv.wks |    0
 .../wic}/qemux86-directdisk.wks               |    0
 .../wic}/sdimage-bootpart.wks                 |    0
 .../wic}/systemd-bootdisk.wks                 |    0
 scripts/lib/wic/__init__.py                   |   10 -
 scripts/lib/wic/engine.py                     |  710 ----------
 scripts/lib/wic/filemap.py                    |  583 --------
 scripts/lib/wic/help.py                       | 1188 -----------------
 scripts/lib/wic/ksparser.py                   |  322 -----
 scripts/lib/wic/misc.py                       |  266 ----
 scripts/lib/wic/partition.py                  |  562 --------
 scripts/lib/wic/pluginbase.py                 |  144 --
 scripts/lib/wic/plugins/imager/direct.py      |  710 ----------
 .../wic/plugins/source/bootimg_biosplusefi.py |  213 ---
 scripts/lib/wic/plugins/source/bootimg_efi.py |  435 ------
 .../wic/plugins/source/bootimg_partition.py   |  162 ---
 .../lib/wic/plugins/source/bootimg_pcbios.py  |  483 -------
 scripts/lib/wic/plugins/source/empty.py       |   89 --
 .../lib/wic/plugins/source/extra_partition.py |  146 --
 .../wic/plugins/source/isoimage_isohybrid.py  |  463 -------
 scripts/lib/wic/plugins/source/rawcopy.py     |  115 --
 scripts/lib/wic/plugins/source/rootfs.py      |  236 ----
 scripts/wic                                   |  600 ---------
 42 files changed, 389 insertions(+), 7592 deletions(-)
 create mode 100644 meta/classes-recipe/image_types_ufs.bbclass
 create mode 100644 meta/recipes-support/wic/wic_0.3.0.bb
 rename {scripts/lib/wic/canned-wks => meta/wic}/common.wks.inc (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-bootloader-config.cfg (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-bootloader-config.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-gpt.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-multi-rootfs.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/efi-bootdisk.wks.in (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/efi-uki-bootdisk.wks.in (100%)
 create mode 100644 meta/wic/mkdisk-ufs.wks
 rename {scripts/lib/wic/canned-wks => meta/wic}/mkefidisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/mkhybridiso.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/qemuloongarch.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/qemuriscv.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/qemux86-directdisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/sdimage-bootpart.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/systemd-bootdisk.wks (100%)
 delete mode 100644 scripts/lib/wic/__init__.py
 delete mode 100644 scripts/lib/wic/engine.py
 delete mode 100644 scripts/lib/wic/filemap.py
 delete mode 100644 scripts/lib/wic/help.py
 delete mode 100644 scripts/lib/wic/ksparser.py
 delete mode 100644 scripts/lib/wic/misc.py
 delete mode 100644 scripts/lib/wic/partition.py
 delete mode 100644 scripts/lib/wic/pluginbase.py
 delete mode 100644 scripts/lib/wic/plugins/imager/direct.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg_efi.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg_partition.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg_pcbios.py
 delete mode 100644 scripts/lib/wic/plugins/source/empty.py
 delete mode 100644 scripts/lib/wic/plugins/source/extra_partition.py
 delete mode 100644 scripts/lib/wic/plugins/source/isoimage_isohybrid.py
 delete mode 100644 scripts/lib/wic/plugins/source/rawcopy.py
 delete mode 100644 scripts/lib/wic/plugins/source/rootfs.py
 delete mode 100755 scripts/wic

-- 
2.51.0


