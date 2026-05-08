Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F276CD37AA
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:26:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7590.1778221603925810166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oA5JudhM;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso13825445e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778221602; x=1778826402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6f99pNpljAuVeag5YgQ+IbkIo90+lOCJrZrFckcsT8=;
        b=oA5JudhMbm/x1vn5bWO/dgseUb7U/v76RT4pdU8TDuRDccxEpDapZA/9A6cOHQZvez
         AYpEVdYJLm7YTibGP5rcdcnHMEOgw7JayRgathkNOminNwHfcNDivq68jqU8ZhbDta9N
         D8U4CaimnGEsTQ1XUdnfAza8BCB7Td94Aph64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221602; x=1778826402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6f99pNpljAuVeag5YgQ+IbkIo90+lOCJrZrFckcsT8=;
        b=Zggt4hWVzevHXKDQajF44Z2iBkhO3bFQZI0RHx31+e4KK/aWNzUzS12x3d1fGr/i/X
         WYYjFNPeBy3E5tFMtTVM7BspSkGD7aXUYWDCUAQjl0MUZOYqoLRsVj9U9v34F2oTh23b
         DObyZHICiFo25FjGqL4aZU6oYOYvhYSqBuPYwgb2SoMxCbbj+n8R30J0HBsP4uFCLC74
         zIgWE8z88YHV6OWF9WeoIjW4khYFueOSphil9v3pv/M+eThxCjaR92vGICLW8hUpfbwa
         /kYR6nvk9Md7bmgnSDOvYjlwHfnGWVMY47n6ROmNYUqwMIx0gkt8bER9QDupsIvFWNdG
         oQ3g==
X-Gm-Message-State: AOJu0YwgOZjl+NUXnvPMbyNMFwyaajlMe5NpTx7WDVI6N9gKocchFUZ6
	3bzhImGH7adObaXvg6qqIHPV8jPXURK9h5YYui1dru3aGjeP55yvh11azOb98d6CNIXq0PboppZ
	gA4iTd2o=
X-Gm-Gg: AeBDies+LS50auJTCl+46O3hzorILPuxAgCyTlQhyIFGOaV5yWqtMDL1oM+1W1Wagnp
	eNhwMp5l6YTO5rFnSoODGdwZuC8iD39U06w/w2lGm0ZDraa9GVHR1tH1HPafcuR5+fofnp2vm1A
	xjRGnfvBDwiq1KLtRbRdHBy/LRFl4XXRI8SCDyAOqL97h+shKNILTH5soDhqd3lgDDxx3XEkvT3
	58Cz4Vt3bPjVfSPS1kgptIpovY/QUmE2BexV6NX1UYexH6XOArT5hzYpxc7WuAZ3e/K+UvUY+47
	sBU/Q/OSkEIqJ/NXRVmtTsX0zmcxk+YaEBTK/wNSBVgcMmaBLNznbqmdtGUJXOJP1ZU8LdhS4vl
	oavymKjFGj357kIxezkC94t00KcNoVP+sC5Yi1TaKxRHH/CWYPHnzCtgyyWv7R37IE/ry5JVNR0
	mvYa7gz/1wCkWyUwXmHIk2twJdnTHI/IHyqxY9hPdLzIj2saa+8ECYXLsMFrIots+0R3IrNeHqg
	ATQb9+eyBpGNB1qrJS6xITO7JQ=
X-Received: by 2002:a05:600c:a110:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48e51e17746mr136898865e9.10.1778221601806;
        Thu, 07 May 2026 23:26:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ec5c49sm15202695e9.11.2026.05.07.23.26.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:26:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Fri,  8 May 2026 08:25:52 +0200
Message-ID: <cover.1778198884.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236632

Please review this set of changes for scarthgap and have comments back by
end of day Monday, May 11.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3794

The following changes since commit 3c2f2b6f7af2bb743655859b64faae4786080cb9:

  libsoup: fix CVE-2025-32049 (2026-05-05 13:01:04 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 7952d214393b6c5230ba115f63b6f6d245a728bc:

  glibc: Fix recipe bug that disabled stack protector (2026-05-08 01:06:24 +0200)

----------------------------------------------------------------

Hitendra Prajapati (4):
  libarchive: fix for CVE-2026-4426
  vim: fix for CVE-2026-39881
  sudo: fix for CVE-2026-35535
  inetutils: fix for CVE-2026-32772

Ivan Nestlerode (1):
  glibc: Fix recipe bug that disabled stack protector

Moritz Haase (1):
  devtool: Disable gpg signing when setting up source tree repos

Peter Marko (1):
  coreutils: set CVE_PRODUCT

Xiangyu Chen (1):
  grub: update search parameter

 meta/recipes-bsp/grub/files/cfg               |   2 +-
 .../inetutils/inetutils/CVE-2026-32772.patch  | 172 ++++++++++++
 .../inetutils/inetutils_2.5.bb                |   1 +
 meta/recipes-core/coreutils/coreutils_9.4.bb  |   2 +
 meta/recipes-core/glibc/glibc.inc             |   3 -
 .../libarchive/libarchive/CVE-2026-4426.patch |  58 ++++
 .../libarchive/libarchive_3.7.9.bb            |   1 +
 .../sudo/files/CVE-2026-35535.patch           | 150 +++++++++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   1 +
 .../vim/files/CVE-2026-39881.patch            | 248 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 scripts/lib/devtool/__init__.py               |   2 +-
 12 files changed, 636 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4426.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-35535.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-39881.patch


