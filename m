Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFD3C55171
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 15:28:19 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8.1785511695329332390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 08:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jttm3tik;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: twoerner@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-74dce749cc5so239465137.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511694; x=1786116494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z8Iq/icwIISY7B9WAg3vVphzubzBoo3fve53k4R8xho=;
        b=jttm3tiktql8jjQb5E3vMaEuD/e85wmL11S3Vpw5CyYdD0fUZpxQLhfeRtHVUuab7/
         +eWy4QT89OpKhIejN53AbA0jgNfMzWBERQySLTIiZ5a4I6Kt0asLIosuCbzAAtfUeitk
         yrodTlW5DfR8XJKqhUTbDnlnVMPa9FEqeN4GBbibT3RRRICEZOfkAEbE+RKJd9oiYt6Q
         FkJWaRzyfhhnQO67wroP4uf9zZxm48fJAP0WzpoPbOz9zkik00iG0ZEp1Ty8XNDgam6/
         Uqt1sCJY8oGkJGIIhWyqHBk0gzuGLoCLHud+KqhQt6rQ/deblau/kikOJ4ESXuVE69se
         0Nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511694; x=1786116494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z8Iq/icwIISY7B9WAg3vVphzubzBoo3fve53k4R8xho=;
        b=Xeld/aQFgANA1QpPvMtjXkzqIZlVumS4Ty0ha7vpGFIRBItbJaOjp9FD1HXKCZe8X4
         hWHLDOh6zsfosy551iRkYBqpc1Zcis5BaTTONw2saNnlyxB2KkFn76ZPibvCpCo6/8o+
         +Jr7NzQg7AKPxqy4aFloASV15n482gvmTIxx6B8yMMG0i1B3iEiTaZkh1Wv0UKprwHSA
         quch/shegdzp0W+ct82+sDtTwLxJBRYgSkaUwByFFrjQLEjjDGa3V1OLStVigmvs5xuv
         lUc0wBODKisUN4NvDyj81ToBkvkdjgrPiBlWWXFiWGH3h7gaK2GrfOE8ftd2fLFz4uhD
         /cDA==
X-Gm-Message-State: AOJu0Yz01o41MjloUFXeNW9c1JOPvxmu/fQou8LPX7Q0ZG86DeXlPWPE
	BPioR3aZeJ50EH//3WKVB3cnl7AHSUN17y9XBGxKY0zftUOKyVxtc4xwnJmlGQ==
X-Gm-Gg: AR+sD10fUSVqfvF49S+9F1IqC95IfzXmbncpLcjUL6m0qleQ69yq700qV8iljbDXvig
	IrmLfpSZRvYlWwvx69xQih2fXEQHPZuTSvnRyl6GRxtGUkenfLFGGffG3JSlnS4WlI/99rNqVqO
	wSFJfWdCxSth3hEl2FMkKRJZ5D158PlHF/RU/ZbTaEHrdfspndHzvWmFCn5GBqdxPmXCXXBrp2n
	qY85oYkdqW98s9SPn9rqwSqn2wogVEmBPzIwYAZfqJ7/sQRKzJBhnLzx15la5UMYn629CRAJzaQ
	vizO97LZZ+qffgs1j/EHxJH8JeKjcB1zayxwj22Qedn5828eQTaEPGDVneFHzoTQAvPys9ITTtZ
	wnl1h2gjRPgx8HcfUxeEQIJuyJkk2hS90KQNDn+/kXtPC6gotL9w5DJco4iw4wnmddUpRcO8pS7
	HXJcWMK0wOgVvtNryYYkcxkfqIhQN7zO6nqB4Bsh5V5mwUJtd8+qp3SNMPfVgOIcfKAbf/j0pwp
	C7ujzqHFGy+t9ZBmYGJiu3jDlxGY9oNuXZrssYb4A==
X-Received: by 2002:a05:6102:6892:b0:738:be7b:add3 with SMTP id ada2fe7eead31-75b21d5d57bmr268078137.6.1785511694142;
        Fri, 31 Jul 2026 08:28:14 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759c9559116sm837007137.11.2026.07.31.08.28.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:28:13 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 0/6] wic: ship the tools it invokes
Date: Fri, 31 Jul 2026 11:28:04 -0400
Message-ID: <20260731152810.2641327-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 15:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242446

wic shells out to a range of host tools but does not declare them, so
wherever it is installed as a package it works only by chance depending
on what the host has installed. The do_image_wic task does not have that
problem: image_types_wic.bbclass makes the image recipe depend on the
-native recipe of each tool, so they are all in the image's own native
sysroot by the time wic runs. Nothing outside that task gets the same
treatment.

Patch 1 narrows wic-tools to staging wic's host tools: the target
bootloader firmware (syslinux, grub-efi, systemd-boot) it depended on
for the wic oe-selftest is now built by that oe-selftest instead. Which
firmware is needed depends on the plugins a .wks uses, so it belongs to
whoever supplies the .wks, not to wic-tools. Images already work that
way through WKS_FILE_DEPENDS in image_types_wic.bbclass, and now the
oe-selftest does too.

Patch 2 gives that tool list a single home. It was written out three
times -- in wic-tools, in image_types_wic.bbclass and (as of patch 3)
in the wic recipe -- and the copies had already drifted.

Patch 3 makes wic declare the host tools it runs as RDEPENDS, so they
are installed alongside it in every variant that packages it.

Patches 4 and 5 are follow-on cleanups of the wic oe-selftest: drop a
dead in-tree wic lookup, and drop the redundant per-test PATH overrides
that duplicated what the test setup already establishes.

Patch 6 fixes a dependency that has been on the wrong axis since 2019:
an image depends on syslinux-native when the build host is x86, but it
is the target that decides whether a .wks needs it, so an x86 image
built on a non-x86 host ends up with the bootloader but not the
installer. That is bug 16383, which carries the full history:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16383

Should wic-tools be renamed? Nothing but the wic oe-selftest has used it
since 2017, when do_image_wic stopped depending on it, and it already
sits in meta/recipes-core/meta/ alongside meta-environment,
meta-ide-support and meta-toolchain without following their naming.
meta-wic-support would fit better, but it is a user-visible rename, so I
would rather hear objections before doing it.

changes in v5:
- the SDK_FEATURES half of the v4 series (patches 5 to 10) is not here.
  Reworking it to resolve features at the class level, as review asked,
  turned it into a larger piece of work than the wic changes it was
  travelling with, so it is being finished and sent as its own series.
- new patch 2: one shared list of the tools wic runs, replacing the
  three copies that had drifted apart. Images gain tar-native and
  util-linux-native, which only wic-tools staged before.
- new patch 6: gate syslinux-native on the target rather than the build
  host [YOCTO #13276]
- wic RDEPENDS patch: drop the bootloader (grub, syslinux) RDEPENDS
  entirely; wic declares only the host tools it runs. The bootloader
  firmware wic copies into an image is the responsibility of whatever
  drives wic (the oe-selftest, and image_types_wic.bbclass via
  WKS_FILE_DEPENDS), not of the wic package. This also removes the
  arch-gating that the v4 grub/syslinux RDEPENDS required.
- drastically trimmed the commit messages and in-tree comments
  throughout the series

changes in v4:
- new patch 1: move the target bootloader firmware out of wic-tools and
  stage it from the wic oe-selftest instead, so wic-tools carries only
  the host tools wic runs
- new selftest cleanups (drop the dead COREBASE/scripts wic lookup and
  the redundant per-test PATH overrides)

changes in v3:
- list the tools on all variants rather than only the nativesdk variant

changes in v2:
- dropped the wic-tools.inc refactor; folded the tool list into the wic
  recipe
- reworked the buildtools-extended-tarball change into a plain removal

Trevor Woerner (6):
  wic-tools: drop the target bootloader firmware
  wic: add a shared helper tool list
  wic: add runtime dependencies on the tools it invokes
  oeqa/selftest/wic: drop dead COREBASE/scripts wic lookup
  oeqa/selftest/wic: drop redundant per-test PATH overrides
  wic: gate syslinux-native on the target, not the build host

 meta/classes-recipe/image_types_wic.bbclass |   8 +-
 meta/conf/wic-helper-tools.inc              |  22 +
 meta/lib/oeqa/selftest/cases/wic.py         | 842 +++++++++-----------
 meta/recipes-core/meta/wic-tools.bb         |  12 +-
 meta/recipes-support/wic/wic_0.3.1.bb       |   3 +
 5 files changed, 425 insertions(+), 462 deletions(-)
 create mode 100644 meta/conf/wic-helper-tools.inc

-- 
2.50.0.173.g8b6f19ccfc3a


