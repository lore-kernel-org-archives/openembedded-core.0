Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6419E7DF0C
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 17:08:09 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57904.1770052085775571378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 09:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHOFing1;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c532d8be8cso473354385a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770052084; x=1770656884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIsWVeQONWZdTMJEc4Uc3H+3b+Y/FFs8otv3EtY6xYs=;
        b=FHOFing1BNBCoJckajat5W/PWCHxZCODBijRQGbGxY409e6EWTDmKnnxNxQSD07dqq
         6bcFy78OebJdjyeUtr0b71CjS4J42oA30wkurUhm7+HymX/HRn6DxIkX64OGLPsRcHLO
         ma/tSMnnXssY91Z05KMQ5Wl/SjVVTFI/PsQt/UFaAVvNQP3OjXmQ0bgWeMuf4NszwnUl
         UtU08ufkUACbpdfO5Z5hwECG3s1jxdpmCFPrw3B4Es3tqzfY+s6TEEUEw3zp8R7T36zW
         Y16poMoZWZ4Mb2X9LgmFOYKtGRWXCfnqNRFVgJq7oT9TEy1Qxn1DnOrXuGBXsLQKXBiY
         G5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052084; x=1770656884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIsWVeQONWZdTMJEc4Uc3H+3b+Y/FFs8otv3EtY6xYs=;
        b=BJ5UCRD+KD7Y+LVT9JAWKmcOYIof+9Cvc44iBVCau4j4velRhq1zy7MTO6KYfOpwCH
         5b/4WVqTs3vGEo38b9LYNe9Q6AChb26pWmf6qh0J2iGN12nrsy+5osjPeBeRc58+QTC2
         dQbOtY7/1XGfZbSeHOIP8dpv4g9ZT/CHONwXv+W5pLuOFjZLCLadEvxXoSrBwnvYoBBs
         Okcw/7jWwEy/DjMF5Lg7vAiUp4nPYmlOh8F1XZ7g96r0P+nzvw/C0NSWx4EzNOYowHjt
         0ybnompxHScG9h5Z1dZy9+c+BFBXI5f9LiTcs/56vUrWjoxnwLbJDd+eB9Zu0+ee+5q2
         OKZQ==
X-Gm-Message-State: AOJu0YxktvNIFoXayOXyXsPIZlgx6EWgw4hIgjfnwO/bWVAEmmckdX/8
	cx42N0olFyL2jztaI50DabAC80OUY82Let63MSkQ/WOFCGau8V/xNBYg09zv3g==
X-Gm-Gg: AZuq6aJSB4fdl6rDZHTUmQFTdOMMeel0obodIABFdeXUiZEOi+oV4WQLoNnJjBAs30n
	UwFffNgs91+R7ZntsupsfqDGGKOVVj2aYzWzE6+9F9jXpDyF85LR9FO3SkMEV1wPMNR61OmuK4I
	uAkwDkwEy+rBgQ4AmDOKfxPs2fyp0TmUDaCShT0WLPrXLjwNiPOSrXiqtQu9yQJ4+4/RXR57uM4
	ftDDpv5KajJ8KNLE112MDE8jvvy8FsDvGytSZmmaUYVxy03tB60zFzJ9jEyBc+lpa373+WD/g2H
	4caQ4G55Oq37YbVOjoisURYRJRFRfdBYEpHTRCNgkQ/MgKg9UUnTlMFFstgN/dfX+qtY/m1pisU
	4RvX7BplW6pmV6/xImeFE7/NLi+aU4XvhHmDYl/iGRfb4ZqnLStUZGcgvKbBoHcjiU/KQ1CxCzw
	xX9TH5TryFp6uBCYJE4mANM6vHpJuhmElNy26k9O+yMZdxU2CVekLkMPZIv0NGFErd
X-Received: by 2002:a05:620a:3195:b0:8c5:1f9a:6b52 with SMTP id af79cd13be357-8c9eb27627bmr1448052585a.28.1770052083903;
        Mon, 02 Feb 2026 09:08:03 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca02f07efasm502815585a.51.2026.02.02.09.08.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:08:03 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH v2 0/9] standalone wic
Date: Mon,  2 Feb 2026 12:07:51 -0500
Message-ID: <20260202170800.4172778-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 17:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230379

This series of patches explores the possibility of splitting wic out
from oe-core into its own standalone utility. The wic utility will
continue to fall under The Yocto Project umbrella, but will no longer
be integrated into the project as part of oe-core. The ultimate goal is
to make wic a completely independent tool, hosted on PyPI, with its own
tests, development roadmap, and releases.

Some benefits include:
- relieving the oe-core maintainers from having to review, understand,
   merge, or reject wic patches
- allow the tool to be used outside of The Yocto Project for generating
  Linux images
- provide more flexibility to explore other features, libraries,
  mechanisms, etc

The initial task of splitting wic out into its own repository was
performed with the help of AI. It was checked, and subsequent work was
done without AI.

These changes have been tested with oe-selftest as follows:
	$ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <my numeric group id> 4
	$ oe-selftest -v -r wic

On my machine my oe-selftest results for an unmodified oe-core give:
	successes=93, skipped=1, failures=0, errors=1
with these patches I get:
	successes=91, skipped=1, failures=2, errors=0

There are 2 tests that need to be fixed, but it would be great to get
some feedback on this work, and to see what the AB thinks of it so far.
I have also done some adhoc testing with meta-rockchip and
meta-raspberrypi.

Should this work eventually make its way to oe-core, it would need to
be squashed into a single commit otherwise builds will break when only
partially applied. They have been submitted here in this RFC series
separately to make review easier.

Trevor Woerner (9):
  remove wic
  provide oe-core wks files
  add wic recipe
  oe-selftest/cases/wic.py: update WicTestCase
  oe-selftest -r wic.CLITests -> PASS
  oe-selftest -r wic.ModifyTests -> PASS (except 1)
  oe-selftest -r wic.Wic -> PASS
  oe-selftest -r wic.Wic2 (non-runqemu) -> PASS
  oe-selftest -r wic.Wic2 (runqemu) -> PASS (mostly)

 meta/classes-recipe/image_types_wic.bbclass   |    8 +-
 meta/conf/distro/include/maintainers.inc      |    3 +-
 meta/lib/oeqa/selftest/cases/wic.py           |  360 ++---
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
 .../wic/canned-wks => meta/wic}/mkefidisk.wks |    0
 .../canned-wks => meta/wic}/mkhybridiso.wks   |    0
 .../canned-wks => meta/wic}/qemuloongarch.wks |    0
 .../wic/canned-wks => meta/wic}/qemuriscv.wks |    0
 .../wic}/qemux86-directdisk.wks               |    0
 .../wic}/sdimage-bootpart.wks                 |    0
 .../wic}/systemd-bootdisk.wks                 |    0
 scripts/lib/wic/__init__.py                   |   10 -
 scripts/lib/wic/engine.py                     |  681 ----------
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
 .../lib/wic/plugins/source/extra_partition.py |  134 --
 .../wic/plugins/source/isoimage_isohybrid.py  |  463 -------
 scripts/lib/wic/plugins/source/rawcopy.py     |  115 --
 scripts/lib/wic/plugins/source/rootfs.py      |  236 ----
 scripts/wic                                   |  600 ---------
 39 files changed, 207 insertions(+), 7579 deletions(-)
 create mode 100644 meta/recipes-support/wic/wic_0.3.0.bb
 rename {scripts/lib/wic/canned-wks => meta/wic}/common.wks.inc (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-bootloader-config.cfg (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-bootloader-config.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-gpt.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-multi-rootfs.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/efi-bootdisk.wks.in (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/efi-uki-bootdisk.wks.in (100%)
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


