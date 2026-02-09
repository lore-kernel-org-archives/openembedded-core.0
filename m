Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31961EF070B
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 04:16:54 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40517.1770610605090488221
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 20:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GYGSZ0o7;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c6d8751c88so419322885a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 20:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770610603; x=1771215403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRGqz4ZXQbERxXg3DJfSOqffnsPWlb6E9r4U8sb7uAc=;
        b=GYGSZ0o7Nj30PrZ12gVJhD09QT2xZXV6hJHfzeSikEpX9XewmrPwnBUZ27QW33y37n
         k29kF9vFi92iXh/aHeOzFnWJPaGaXv0ogZwiZxb7YlicfZe1wpYwVaKQING32FrHdmJz
         sHFQprtce5DEU5i+vpHq+5VhqFQURRv3JSx7GhtWkiva56FjeuDDT98kItPOwiWz2pSs
         8k7udVGa2uKgBcB18ksnjLJUDDN3EWA93BO597+tSGRNCyM8CFubiPodEI8ugm2Q82H4
         PovNsd/8xyvjsfT0e0bLGtJaquSsuDsXSRjBdbLRjJE3+45f+ih/MOMet08PwhlNlf0I
         /bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770610603; x=1771215403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRGqz4ZXQbERxXg3DJfSOqffnsPWlb6E9r4U8sb7uAc=;
        b=K1Y1lnPpfB3mnaA6OVV0GLGpnUPtNRyCKpS5B4YEs8mlBdjmNkpCzo/SIVCuouvLu3
         CkC3MMGK0pONN84K/7vSJqOq8aslS1FbaR5Go9zgtK9i8O42+awndicXxobTatNY0ptj
         PNhgRET4GkIf41k40XI1rNe1T/xv3FSujZcqpThALNd9O25XMkaZv195a2q+Mx+ynuo2
         Ltxc3fn7JSAhR1DKYu7Uys6jDZumhQC1Zq01AjaHtTfsw+eJaaVJmp6H/Gea5e5gh6JV
         zSMzYFG+GtYNzSGlgt9az+8S7psXSDYDBfUpcCcLinhdXKxoZAUHLXChzamM2a42iF5+
         tvSQ==
X-Gm-Message-State: AOJu0YyVdKfpEwFMl6VmdlkK71c3PsESfbaPcHXsVQfCKxKZmaxQAHOh
	+BUPG2R0prbhx22sCpROMlArepfpSiMtwbRTnun7X3+dXhqFEtO9Ric4Cf3tBlmy
X-Gm-Gg: AZuq6aLYUhwb/w39OKkgPp0ey2boqMCTL46DNe1PgrMRe86OUgoomwRmqdmq4/OFqM7
	eGNp05sF7m6HXb3EgJQMkcuNKUAp2ZbRFKRVg7a+RAxPPvKTl9ExitkXgij5HspczOnPrxiNmLk
	0uOGN3chTA8ubwvGhFSrVuP0mXngm5NS+oZQIH6i6PQq44AwOeF6iJRE9JklGeS5NpCPxxGyRtp
	ClTLk487MqO4yaLwkQjVyeonWBjG3WdXL3U/VecO5TiF0y6/pb2nCZF//+nXJWTdhP4XqzZE0EK
	AMifgnTUsb5ify2gE/+h/9uPrDCQL7580fAeNa2cJeZwldoSjtksm2SOIivsaJbl6IEotw12QYP
	buxYMu9YR7wOFp1kOflp5h2gpZqLBA3kdu6aYM/3h3UGzK2LyAGQHvQuo44sIsTu0dKtX/FuTrk
	9yCNE2+h0eTvoD4YJrhcTCZXH+sF2zEcG1pbcMiBGxSp8EUkqqE2ygEQ==
X-Received: by 2002:a05:620a:4727:b0:8c6:edcc:3f80 with SMTP id af79cd13be357-8caeee34174mr1416622985a.13.1770610603238;
        Sun, 08 Feb 2026 20:16:43 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9efasm727686485a.43.2026.02.08.20.16.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 20:16:42 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] wic: remove
Date: Sun,  8 Feb 2026 23:16:36 -0500
Message-ID: <20260209041637.2690868-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 04:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230706

Previously (Feb 2, 2026) a v2 set of small RFC patches was sent to
the oe-core mailing list for review[1]. Those emails provided a set of
small, more easily reviewed, broken-out patches which have the same
effect as this patch... with one exception: the wic recipe in the RFC
set of patches pointed to a test wic repository on my personal github
account and retained none of the wic git history from oe-core. With this
patch the standalone wic tool has been pushed to git.yoctoproject.org
and includes the full git history (thanks to git-filter-repo[2]).

No comments or reviews were given on the RFC set, therefore no changes
have been made since the RFC set except for an update to the wic recipe
as noted above.

Unfortunately the broken-out RFC patches can not be merged to oe-core
since individually they will cause build failures. Only once the entire
set of patches have been applied will everything work again. Therefore
all of those patches had to be squashed into one larger patch to avoid
any build breakage.

This patch splits wic out from oe-core into its own standalone tool. The
wic utility will continue to fall under The Yocto Project umbrella, but
will no longer be integrated into the project as part of oe-core. The
ultimate goal is to make wic a completely independent tool, hosted on
PyPI, with its own tests, development roadmap, and releases.

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

The RFC set was run on The Yocto Project AutoBuilder and only one test
failed: a test from the meta-yocto/meta-yocto-bsp layer. A fix was
created and sent to the appropriate mailing list for consideration[3].


[1] https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_v2_0_9/117600021
[2] https://github.com/newren/git-filter-repo
[3] https://lists.yoctoproject.org/g/poky/topic/meta_yocto_bsp_patch/117634997

Trevor Woerner (1):
  wic: remove

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


