Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4604FC44529
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2623.1784364801930030725
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=On/QAlb6;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954afac04bso12576685e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364800; x=1784969600; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxHJe+n9IpDsGC6gGHsDrnt+9AN5TJih0+Gv1wXNImo=;
        b=On/QAlb6nnIyH9R4NupUsxuJlshoBjVKEQjKjHJX2jz7rTjfRI9H63foa1ronDx9md
         yAOYsRv7EQEBlhlKZmo6f2w9WJFqi+JHfjui5kIq9nnxXVB3AioPbbczUOuy9YT5hazg
         VzwGkYLayuDOftNbfb+kvZ1lYqgRZ6QlWbLEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364800; x=1784969600;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxHJe+n9IpDsGC6gGHsDrnt+9AN5TJih0+Gv1wXNImo=;
        b=mLB+3WOLrOFTwnYKtqgYbXdjMHDmqzk7HvrnyEim7CSjnUL7utc9J4Q76I79bUdwNb
         DdJrXrZmsEgSHzai4yGU4fsqFCwwdsiHTQephFPB2VrhWarq3MGzlTMua+LPXVAb+zJ0
         18aoNvLQAnyS5UPlT9TGiJ+k/AzZyFfE7Ea4Sr/whl9sWTtL5E0wXju8AatAjv3Vku0Q
         cSHDEzcAxrvbfBrs5bdienri3DQu96jz/MS0E68WgdOrZeTcDqUuu/dcmjpYSkqbh+tc
         bbE2AwlIhLYqELg7lwbiKTExdmVB3oXJTV8fesKDqmF/B9N/Z/P90Rw+q86KzAR4XX/p
         v0Vg==
X-Gm-Message-State: AOJu0YxBPIG1ZCe3slOmrdpkq8GnFmLG36VjSRckJ2RoQm2lY3xZo7Ri
	ajFd+swqoUiOCDH2IsGP8BGlHlBxgb6ATN/NBPlqAFF+HCtHIweGAZwmrxUOq3b0eZyS8yJxvqL
	gTSojUYY=
X-Gm-Gg: AfdE7clw03o8JKgZjR2QhfEcnneSU6/gfZvLml6E4shyDGuKUMzjlolz5zPseSyIpub
	CTMmPLoy0ImHvol4UPHytmiN2Qp3L0mU1MFEmkimSKFd7l66Lc6tIr0BcncyQNczsRjYS0v4/YB
	Ii0HrMSnUMNZuXAb9z3xgApCQv4S1+XpN3QTPIqNXtMu1B2+Mok1F5NHUt1+qrlnaYmvEbtB0vN
	jIZyZFmCdDZ7knvQhCp+7FCZWuX4JmxwOfq3hDAK2W7qoMTN+NncrWkW9sJg1AegBIuUf/iyWq6
	pE8qcbYIG7BUtejckP0JZFvo9rxsW7nS0xnIesvvLTpt2AQsWSN9REdVQHBonU/ZNsuVpum5/zI
	uoWVqsHZrT9VIxGB6M+L8ZN5aZ5mMqyTNYwED1Xs0LdNsAxqLiTlqW7y53lQYhV1CfV37Jfej9Q
	8GnmVK2oIpx2wz9VIQSMzQs2CK/ZpjBaKD9s65ggobJSpESHLXQN4HmpiarZOPG6PJqW/0+Xe0n
	fm2N4k=
X-Received: by 2002:a05:600c:5657:b0:493:f442:3dd4 with SMTP id 5b1f17b1804b1-4954a516af8mr40124905e9.39.1784364799865;
        Sat, 18 Jul 2026 01:53:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/17] Patch review
Date: Sat, 18 Jul 2026 10:52:39 +0200
Message-ID: <cover.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241237

Please review this set of changes for wrynose and have comments back by
end of day Tuesday, July 21.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4229
* qemux86-world and qemux86-64-ptest got impacted by 16316 – AB-INT: tar failure: got *at() syscall for unknown directory, fd 4
  retried as 
    https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4062
    https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4182
* qemuarmv5 got impacted by 16217 – AB-INT: boot hang in qemu (amba chip errors?)
  retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/3992

The following changes since commit 6f5681afb324aed2cba4e5b819ffc878f74a2bac:

  gnutls: fix CVE-2026-33846 (2026-07-16 20:54:12 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 551eade6c83483616ea6172336a4cf6c994ce90d:

  openssh: set status for CVE-2026-3497 (2026-07-18 01:31:03 +0200)

----------------------------------------------------------------

Adrian Freihofer (1):
  oe-selftest: fitimage: Do not expect kernel property in DTBO config
    subnodes

Alexander Kanavin (1):
  wic: upgrade 0.3.0 -> 0.3.1

Deepak Rathore (1):
  util-linux: fix CVE-2026-13595

Gustavo Henrique Nihei (1):
  u-boot: re-enable RISC-V compressed (c) ISA extension

Jaipaul Cheernam (2):
  gzip: fix CVE-2026-41992
  bzip2: Fix CVE-2026-42250

Marek Vasut (2):
  kernel-fit-image.bbclass: Do not include kernel property in DTBO
    config subnodes
  kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"

Peter Marko (5):
  go: upgrade 1.26.4 -> 1.26.5
  vex: remove obsolete semicolon
  rootfs: move tasks using image_list_installed_packages to
    postuninstall
  flac: fix buildpaths with doxygen enabled
  flac: make documentation build deterministic

Ryan Eatmon (1):
  kernel-fit-image: Add KERNEL_DTBVENDORED support for
    FIT_CONF_DEFAULT_DTB

Sudhir Dumbhare (1):
  openssh: set status for CVE-2026-3497

Vijay Anusuri (1):
  tzdata/tzcode-native: upgrade 2026b -> 2026c

Yoann Congal (1):
  scripts/install-buildtools: Update to 6.0.2

 meta/classes-recipe/kernel-fit-image.bbclass  |  22 ++-
 meta/classes-recipe/license_image.bbclass     |   2 +-
 meta/classes/vex.bbclass                      |   2 +-
 meta/lib/oe/fitimage.py                       |   7 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |   4 +-
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |   1 +
 .../openssh/openssh_10.3p1.bb                 |   1 +
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-13595.patch           | 148 ++++++++++++++++++
 .../go/{go-1.26.4.inc => go-1.26.5.inc}       |   2 +-
 ...e_1.26.4.bb => go-binary-native_1.26.5.bb} |   6 +-
 ..._1.26.4.bb => go-cross-canadian_1.26.5.bb} |   0
 ...{go-cross_1.26.4.bb => go-cross_1.26.5.bb} |   0
 ...osssdk_1.26.4.bb => go-crosssdk_1.26.5.bb} |   0
 ...runtime_1.26.4.bb => go-runtime_1.26.5.bb} |   0
 .../go/{go_1.26.4.bb => go_1.26.5.bb}         |   0
 .../bzip2/bzip2/CVE-2026-42250.patch          |  35 +++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |   1 +
 .../gzip/gzip-1.14/CVE-2026-41992.patch       |  64 ++++++++
 meta/recipes-extended/gzip/gzip_1.14.bb       |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 meta/recipes-multimedia/flac/flac_1.5.0.bb    |   5 +-
 .../wic/{wic_0.3.0.bb => wic_0.3.1.bb}        |   2 +-
 scripts/install-buildtools                    |   4 +-
 24 files changed, 296 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
 rename meta/recipes-devtools/go/{go-1.26.4.inc => go-1.26.5.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.4.bb => go-binary-native_1.26.5.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.4.bb => go-cross-canadian_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.4.bb => go-cross_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.4.bb => go-crosssdk_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.4.bb => go-runtime_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.4.bb => go_1.26.5.bb} (100%)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
 rename meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} (90%)


