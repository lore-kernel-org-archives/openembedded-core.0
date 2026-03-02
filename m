Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F5EC624C9
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 00:38:40 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150258.1772411913623759767
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 16:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L1wbp+xV;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-899a917a4feso71222406d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 16:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772411912; x=1773016712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QG8pdrAqHBiYpHbCWSNzc2hb2o2uEHZOcjdhBdSRg4Y=;
        b=L1wbp+xVIsAkB3IN+X+g9I/c7BRk521m4m4My8BFeFcwB7y0bYvXtmbs2u2Vg86YCN
         jAy0raCRcMhQPvTt6ywdZj8Vhf04KAyjO8aSq+TZhOUbSa//RWjTW0yTTSWa0uo1dbWq
         kiZiHVR2DOVozLOM32icj4H8L1l0hZueWbkpjUKn8J9RDfzOZuJ28D796vGVzeQs4Xyt
         587ab3G+gmd6Llw7eb3dhHuFFgtKvCQ53jvPuacNIsiGaLwJPRPOeA+PW5x9mHXXileH
         OYU9AuEYbvJrCv+Dwnvc4+YMMNdhsxS/+iHgNi9NIkNFptlE0gh5fB5fuIoD8PgaloA5
         rdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772411912; x=1773016712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QG8pdrAqHBiYpHbCWSNzc2hb2o2uEHZOcjdhBdSRg4Y=;
        b=vK15+AQdyB3WZ4S22cdK1kCHXy+hcVWqMCFbq2CpqlISuKEXSdkLWQt9IPCMZExzQr
         k97kcnztX1G22go97NM69rMQYa3NyjOr+sweBKUgC2pk8aqCk8JaIaMzy8q5lfeWfT0/
         WY9zxIzevVVSgScModjR93XecHtP3Tss0ILGwffoDIyEFoRrChosEQv2tFP9r1WHcKo2
         8gn3V3B0U3rIJER0gllCfUFdvVW96rRBQ/yeQszM1k1HlI4Lm6WiwOba/XEqlem8oLkQ
         W9gTMsWAlzkIPKYSCjlcv4U1cK4eZsj217EA92QXlvqnrabXui377xcy5iRQC3QRhk0M
         If7Q==
X-Gm-Message-State: AOJu0YzMeROW9akyg3y9ILdvzdVwoYAbc8iSn8IYjmCIt1VS2kJ6P1By
	5ZPP3ljdk9vmJ+Ye3wZF+Lm5Zef2Db6Lukq0es6upyhMoodQeCbr2YV0Skfs9Uj+
X-Gm-Gg: ATEYQzwMWKh/FiXJ2XCCLM+41XhdReVnNWMtJY+nBrmBpmJKtxNZ3jh/UoQFM6pmUXW
	D6onNccgXHLn5KatelqU9kPJtEn7xOottLbIt9s+GEZtHDTCMdeDrKhW2fvNl3Ai/GVZ5a25cfg
	hq1yEbxmW15cm7tgAt8PlYns8kMqBJ1P1tN0X9rNLWHQaIYyn0OVlx9RBv2gGKKzQF+T3/I5KvT
	imJxg9qJA+8SsIFmR6Nr65xx3Cyvv/BvZqxuSUWFWgs2bO9ryX1BlbD1W2udtQ6NWwoy57D+vD5
	9p239RrpC2TC5/vd1zpzqVrVjTT9SyudZsk9StLK8FQbh8UhMkdXNiRnZ2KtrwBOpHkv67kX27u
	FgSDZRQ9v2Tvr23WQfDI9R79OU42mG9VLQmImjXITu07bbxm9uH/a5jFDz7vcEqwk7OD6gOLepU
	aF85wK0WBYMotCLR5PxV/8iFzhPpiaPAozBHHjrR8NwEw2+893+xQG6eBvSH65SZ3r2RUsFQ5XR
	lHx
X-Received: by 2002:a05:6214:21c6:b0:895:1cbb:5d5b with SMTP id 6a1803df08f44-899d1e2b9a7mr168275186d6.32.1772411911515;
        Sun, 01 Mar 2026 16:38:31 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ebb09772sm33710356d6.12.2026.03.01.16.38.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:38:30 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 0/9] standalone wic
Date: Sun,  1 Mar 2026 19:38:17 -0500
Message-ID: <20260302003826.3995222-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232146

This series of patches splits wic out from oe-core into its own 
standalone utility. The wic utility will continue to be under The Yocto
Project umbrella, but will no longer be integrated into the project
as part of oe-core. The ultimate goal is to make wic a completely
independent tool, hosted on PyPI, with its own tests, development
roadmap, and releases.

Some benefits include:
- relieving the oe-core maintainers from having to review wic patches,
  allowing them to focus on core functionality
- allow the tool to be used outside of The Yocto Project
- provide more flexibility to explore other features, libraries,
  mechanisms, etc 

These changes have been tested with oe-selftest as follows:
        $ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <my numeric group id> 4
        $ oe-selftest -v -r wic 

There were 2 tests that would not pass on my home machine, but when I
sent my original RFC patchset, it looked like all tests passed on the
AB. However with subsequent testing we saw the exact same 2 tests fail
on the Fedora worker in the AB. This v7 patchset includes changes to
address these tests.

In v6 the major changes are:
- code cleanups to remove cases of "if sector_size and sector_size =
  512" in places where we can guarantee sector_size will exist
- cleanups to replace "getattr(var, 'sector_size', 512) or 512" since
  the 3rd arg to getattr() is already setting a default if the variable
  name is not found
- many comment and commit comment improvements
- error out if extraopts includes options to set the sector-size in wks 
  files
- patch 2 (add ufs class) was dropped
- patches 3 and 4 were reversed (move/save wks files before removing the 
  rest of wic from oe-core)

Previously, I had two separate patch sets for wic on oe-core: one
to create a standalone utility, and one to re-implement variable
sector-size handling. Both these were combined to create a combined "v5"
patch set. For the patch sets up to and including v5:

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

Trevor Woerner (9):
  wic: re-implement sector-size support
  wic: move sample *wks files
  wic: move to standalone repository
  wic: add recipe
  oe-selftest/cases/wic.py: update WicTestCase
  oe-selftest/cases/wic.py: oe-selftest -r wic.CLITests -> PASS
  oe-selftest/cases/wic.py: oe-selftest -r wic.ModifyTests -> PASS
  oe-selftest/cases/wic.py: oe-selftest -r wic.Wic -> PASS
  oe-selftest/cases/wic.py: oe-selftest -r wic.Wic2 -> PASS

 meta-selftest/wic/wictestdisk.wks             |    4 +-
 meta/classes-recipe/image_types_wic.bbclass   |    6 +-
 meta/conf/distro/include/maintainers.inc      |    3 +-
 meta/lib/oeqa/selftest/cases/wic.py           |  292 ++--
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
 40 files changed, 166 insertions(+), 7595 deletions(-)
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


