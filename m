Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB17C55172
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 02:10:08 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16890.1785636607460204008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 19:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PeFExCgr;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52b4e988c77so8962551cf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 19:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785636606; x=1786241406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VF12yplHgY9c0vUNrv2wkDX7klPPkoHtC+tkQ2Y3ZPs=;
        b=PeFExCgr8TxmHNnD+qX5pIZqg1qYXORjwGwTfxSCfMdriPc9O8E8vg+/S2nv/6vppn
         BhChGXUHZz3cwTXS9HnCJ2nfW4uwGO7bTFwNTGDKXtAGIjFRZDcFtPiCYOVU95pIWBpU
         H61Kdiu9A1IrZ5wXyDWUkItn4jVkEQjpPzija+Ok3Mi0w0YgdkaaZCv9bFOw+icSb0fn
         QfDCHY12/zlV7egdLZYOQw3kcAKTO42c/xT8rLhDBOjrXlNDMUi6ZDimYkc0xTvxt6SW
         NxEyAThieYVNVYdIe8Tfc3+NMnRDH9r/mRX2TfCFBXa3fN7rPpgc6CqwUBweBagXTs+6
         L3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785636606; x=1786241406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VF12yplHgY9c0vUNrv2wkDX7klPPkoHtC+tkQ2Y3ZPs=;
        b=gniJCpUERGflPha5vu9d1S7opwpjKxbRj7msmhXrzdzg7KxiHvU+9FiDOFkI8fAwSv
         1e74i12lbTd6o3LpBcCIRox1ZxOKAJ1m4MatBMDl2tYncAzvdpeC0GxyDoSWp/3rm+jw
         8ph6R2vDDSGOMxg+NctbDxCpTKzudvnrasJFsE0q4kElfPl2pKnP/n00DYt0YRRq3by8
         /auuTN4QFxDW+dGlKfm9TNEtRdmTZGwnZWXkkf5XKj/+foxFP+QMALojBwtS51Ntz5GG
         JA9eTJjOpyOR/GfW4zB8HT2I6SYTOvhACY9RDx0JSwlg95xr04tII15Hv/RlE5IQQEX8
         ShJQ==
X-Gm-Message-State: AOJu0YwzJFk9KHZLjf2dUGBjLeQmpTyq0Gl5cOhGEuWvJr/HUBIW7iyc
	Zb4P5706sJf8WuIwdhpfanXMNapuTDO0wvQQhwgjwG+Injdigv0DV10/1vlytQ==
X-Gm-Gg: AR+sD11v4cJyZXIwHb60UKdY07pO3o/2D+NSsadOdMG+zcp0D4tH36q2R3C05UQftBJ
	cqx5UdIav2V3RSPMB8Q0wl7SUFbdJd3D30PMm0lw3RY3q1fT340Ow9JILPjVlFudlWraAUIP9PQ
	LthTSrpUzwhpbgjkeVxPXrYA6+U5s59WY9nNMVT8PCdXNb6qsbh1++iXtKG0CDA5VCR2h81bKys
	T6oPOAJOQgOo8WJzpRInIxWFIax442y5pUnRJeq4gqvN3g1DMfpnStdxem8tk770KTqy1CkeckM
	JCbhI50diubD2JiCoA2FXRuE0nrfCRuyy6zs40srKxrFufnmszYVX7+nGBlLvwa/ARuFvzOOYqc
	QDkQzQ/MKMCk9Of1FDQ4/Bpq3HYF6xanK6MKdqDU1uOUJUzjvF8tGCSEIAAi/7xER8IH5AXeWmS
	YP2XqF0W9XC3O/vHNgM0Ap3oaiYXQSK4KPpcsizo2n4lc3MhgVpDt6a/NzLw4rdBcocpJldLU9R
	3KTLR5CIb30lBxkqzR08V/VeYQyNLBj311JyRJoMQ==
X-Received: by 2002:ac8:574d:0:b0:519:89b6:78b4 with SMTP id d75a77b69052e-52b567dab59mr101944021cf.40.1785636606050;
        Sat, 01 Aug 2026 19:10:06 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a26basm44733566d6.12.2026.08.01.19.10.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:10:03 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 0/6] wic: ship the tools it invokes
Date: Sat,  1 Aug 2026 22:09:54 -0400
Message-ID: <20260802021000.2886095-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 02:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242509

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

Patch 2 removes a dependency that outlived its reason. wic gained
virtual/cross-binutils in 2022 because its EFI boot image plugin
assembled unified kernel images and needed cross-objcopy. That plugin
stopped doing so in 2024 and now points at uki.bbclass, which declares
virtual/cross-binutils itself. Nothing wic runs invokes objcopy any
more.

Patch 3 gives the tool list a single home and uses it. wic declares the
host tools it runs as RDEPENDS, so they are installed alongside it in
every variant that packages it; and the two other copies of that list go
away in the same patch. wic-tools and image_types_wic.bbclass had
written it out separately and drifted apart; both now just depend on
wic-native, and native.bbclass's do_populate_sysroot[rdeptask] stages
everything wic runtime-depends on. Three things stay written out.
cdrtools has only a native recipe in oe-core, so there is no package a
target or nativesdk wic could name, even though wic does run mkisofs;
the build host gets it from wic-tools and from WKS_FILE_DEPENDS. grub is
bootloader territory, which belongs to whatever drives wic. pseudo is
wic-tools staging what the oe-selftest needs.

Patches 4 and 5 are follow-on cleanups of the wic oe-selftest: drop a
dead in-tree wic lookup, and drop the redundant per-test PATH overrides
that duplicated what the test setup already establishes.

Patch 6 fixes a dependency that has been on the wrong axis since 2019:
an image depends on syslinux-native when the build host is x86, but it
is the target that decides whether a .wks needs it, so an x86 image
built on a non-x86 host ends up with the bootloader but not the
installer. That is bug 16383, which carries the full history:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16383

changes in v6:
- new patch 2: drop the obsolete virtual/cross-binutils dependency from
  wic-tools and image_types_wic.bbclass. It comes before the tool-list
  patch so that patch does not have to describe wic-tools as needing
  binutils only for it to be removed shortly afterwards.
- drop the shared conf/wic-helper-tools.inc that v5 added. Review
  pointed out that once wic has the RDEPENDS, a consumer can just depend
  on wic-native and let do_populate_sysroot[rdeptask] do the rest, which
  is true and removes the need for a list to keep in sync. The tool list
  now lives only in the wic recipe.
- the tool list is now defined and used in one patch rather than two:
  wic gets the RDEPENDS, and image_types_wic.bbclass and wic-tools take
  the tools from wic-native, together. Images still gain tar-native and
  util-linux-native relative to master, which was the drift v5 was
  fixing.
- retitle the syslinux patch with an image_types_wic prefix, and gate
  WKS_FILE_DEPENDS_DEFAULT with target-arch appends now that the shared
  variable is gone. wic-tools keeps the arch-gated DEPENDS it already
  had on master.

changes in v5:
- the SDK_FEATURES half of the v4 series (patches 5 to 10) is not here.
  Reworking it to resolve features at the class level, as review asked,
  turned it into a larger piece of work than the wic changes it was
  travelling with, so it is being finished and sent as its own series.
- new patch: one shared list of the tools wic runs, replacing the three
  copies that had drifted apart. Images gain tar-native and
  util-linux-native, which only wic-tools staged before.
- new patch: gate syslinux-native on the target rather than the build
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
  image_types_wic, wic-tools: drop the obsolete cross-binutils
    dependency
  wic: add runtime dependencies on the tools it invokes
  oeqa/selftest/wic: drop dead COREBASE/scripts wic lookup
  oeqa/selftest/wic: drop redundant per-test PATH overrides
  image_types_wic: gate syslinux-native on the target, not the build
    host

 meta/classes-recipe/image_types_wic.bbclass |  10 +-
 meta/lib/oeqa/selftest/cases/wic.py         | 842 +++++++++-----------
 meta/recipes-core/meta/wic-tools.bb         |  13 +-
 meta/recipes-support/wic/wic_0.3.1.bb       |  12 +
 4 files changed, 414 insertions(+), 463 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


